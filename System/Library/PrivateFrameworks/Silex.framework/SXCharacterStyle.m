@interface SXCharacterStyle
+ (id)stringFromProperty:(int)a3;
+ (int)propertyFromString:(id)a3;
+ (unsigned)typeOfProperty:(int)a3;
@end

@implementation SXCharacterStyle

+ (int)propertyFromString:(id)a3
{
  return String();
}

+ (id)stringFromProperty:(int)a3
{
  return (id)MEMORY[0x270F79798](*(void *)&a3, a2);
}

+ (unsigned)typeOfProperty:(int)a3
{
  return MEMORY[0x270F79790](*(void *)&a3, a2);
}

@end