#!/bin/bash

echo "Enter the file name:"
read fileName

echo "Creating ${fileName}.hpp..."

echo "Is the name of your file the same as your class? y/n"
read yes

if [ "$yes" = "y" ]; then
	className=$fileName;
else
	echo "Enter the class name:"
	read className
fi
filemaj=$(echo "$fileName" | tr '[:lower:]' '[:upper:]')
cat >> ${fileName}.hpp << EOF
#ifndef ${filemaj}_HPP
# define ${filemaj}_HPP
# include <iostream>
# include <string>
EOF
cat >> ${fileName}.hpp << EOF

class $className
{
	private:
		
	public:
		$className();
		$className(const $className &obj);
		$className &operator=(const $className &obj);
		~$className();
};
EOF
cat >> ${fileName}.hpp << EOF
#endif
EOF
echo "Creating ${fileName}.cpp..."

cat > ${fileName}.cpp << EOF
#include "${fileName}.hpp"

$className::$className()
{
	std::cout << "$className default constructor called\n";
}

$className::$className(const $className &obj)
{
	std::cout << "Copy constructor called\n";
	*this = obj;
	return ;
}

$className &$className::operator=(const $className &obj)
{
	std::cout << "Copy assignment operator called\n";
	if (this != &obj)
	{
		
	}
	return *this;
}

$className::~$className()
{
	std::cout << "Destructor of $className called\n";
}
EOF

echo "File ${className}.cpp has been created."