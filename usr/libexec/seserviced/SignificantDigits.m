@interface SignificantDigits
+ (unsigned)getValueWithSignificantDigits:(unsigned int)a3 value:(unsigned int)a4;
- (_TtC10seserviced17SignificantDigits)init;
@end

@implementation SignificantDigits

+ (unsigned)getValueWithSignificantDigits:(unsigned int)a3 value:(unsigned int)a4
{
  sub_1000B3890(a3, a4);
  return result;
}

- (_TtC10seserviced17SignificantDigits)init
{
  v3.receiver = self;
  v3.super_class = (Class)swift_getObjectType();
  return [(SignificantDigits *)&v3 init];
}

@end