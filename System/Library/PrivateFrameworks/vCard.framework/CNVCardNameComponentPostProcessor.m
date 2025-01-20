@interface CNVCardNameComponentPostProcessor
+ (void)postProcessNameComponents:(id)a3;
- (_TtC5vCard33CNVCardNameComponentPostProcessor)init;
@end

@implementation CNVCardNameComponentPostProcessor

+ (void)postProcessNameComponents:(id)a3
{
  id v3 = a3;
  sub_1DC1B2774(v3);
  sub_1DC1B2BF0(v3);
}

- (_TtC5vCard33CNVCardNameComponentPostProcessor)init
{
  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for CNVCardNameComponentPostProcessor();
  return [(CNVCardNameComponentPostProcessor *)&v3 init];
}

@end