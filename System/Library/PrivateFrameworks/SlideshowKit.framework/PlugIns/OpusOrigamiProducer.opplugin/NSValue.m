@interface NSValue
+ (NSValue)valueWithMCVector:(id *)a3;
- ($421962E1114BB55FD51FACB03C2AC210)MCVectorValue;
@end

@implementation NSValue

+ (NSValue)valueWithMCVector:(id *)a3
{
  id v3 = [objc_alloc((Class)NSValue) initWithBytes:a3 objCType:"{?=C[4f]}"];
  return (NSValue *)v3;
}

- ($421962E1114BB55FD51FACB03C2AC210)MCVectorValue
{
  *(void *)&retstr->var0 = 0;
  *(void *)&retstr->var1[1] = 0;
  retstr->var1[3] = 0.0;
  return ($421962E1114BB55FD51FACB03C2AC210 *)[(NSValue *)self getValue:retstr size:20];
}

@end