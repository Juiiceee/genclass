#!/bin/bash

echo "Enter the file name:"
read fileName

echo "Creating ${fileName}.hpp..."

echo "Enter the class name:"
read className

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

}

$className::$className(const $className &obj)
{
	
}

$className &$className::operator=(const $className &obj)
{
	if (this != &obj)
	{
		
	}
	return *this;
}

$className::~$className()
{
	
}
EOF

echo "File ${className}.cpp has been created."