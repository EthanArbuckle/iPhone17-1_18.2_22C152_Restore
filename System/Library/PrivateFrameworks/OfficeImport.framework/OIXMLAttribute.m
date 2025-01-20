@interface OIXMLAttribute
+ (id)attributeWithName:(id)a3 stringValue:(id)a4;
- (OIXMLAttribute)initWithName:(id)a3 stringValue:(id)a4;
- (id)copyWithZone:(_NSZone *)a3;
- (id)name;
- (id)stringValue;
- (void)_appendXMLStringToString:(__CFString *)a3 level:(int)a4;
- (void)setStringValue:(id)a3;
@end

@implementation OIXMLAttribute

+ (id)attributeWithName:(id)a3 stringValue:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  v8 = (void *)[objc_alloc((Class)a1) initWithName:v7 stringValue:v6];

  return v8;
}

- (OIXMLAttribute)initWithName:(id)a3 stringValue:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)OIXMLAttribute;
  v9 = [(OIXMLAttribute *)&v12 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_name, a3);
    objc_storeStrong((id *)&v10->_value, a4);
  }

  return v10;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = objc_alloc((Class)objc_opt_class());
  name = self->_name;
  value = self->_value;
  return (id)[v4 initWithName:name stringValue:value];
}

- (void)_appendXMLStringToString:(__CFString *)a3 level:(int)a4
{
  UniChar v11 = 34;
  *(_DWORD *)chars = 2228285;
  id v6 = [(OIXMLAttribute *)self name];
  CFStringAppend(a3, v6);
  CFStringAppendCharacters(a3, chars, 2);
  int v8 = 2490428;
  __int16 v9 = 34;
  id v7 = [(OIXMLAttribute *)self stringValue];
  +[OIXMLNode _escapeCharacters:&v8 amount:3 escapeWhiteSpaces:0 inString:v7 appendingToString:a3];

  CFStringAppendCharacters(a3, &v11, 1);
}

- (id)name
{
  return objc_getProperty(self, a2, 8, 1);
}

- (id)stringValue
{
  return objc_getProperty(self, a2, 16, 1);
}

- (void)setStringValue:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_value, 0);
  objc_storeStrong((id *)&self->_name, 0);
}

@end