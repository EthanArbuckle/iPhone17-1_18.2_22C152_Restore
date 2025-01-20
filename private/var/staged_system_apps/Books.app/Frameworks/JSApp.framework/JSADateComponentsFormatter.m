@interface JSADateComponentsFormatter
+ (id)localizedHrMinDuration:(double)a3 :(id)a4 :(id)a5;
+ (id)localizedHrMinSecDuration:(double)a3 :(id)a4 :(id)a5;
+ (id)localizedMinSecDuration:(double)a3 :(id)a4 :(id)a5;
- (_TtC5JSApp26JSADateComponentsFormatter)init;
@end

@implementation JSADateComponentsFormatter

+ (id)localizedHrMinDuration:(double)a3 :(id)a4 :(id)a5
{
  return sub_5E668(a3, (uint64_t)a1, (uint64_t)a2, (uint64_t)a4, (uint64_t)a5, 96);
}

+ (id)localizedHrMinSecDuration:(double)a3 :(id)a4 :(id)a5
{
  return sub_5E668(a3, (uint64_t)a1, (uint64_t)a2, (uint64_t)a4, (uint64_t)a5, 224);
}

+ (id)localizedMinSecDuration:(double)a3 :(id)a4 :(id)a5
{
  return sub_5E668(a3, (uint64_t)a1, (uint64_t)a2, (uint64_t)a4, (uint64_t)a5, 192);
}

- (_TtC5JSApp26JSADateComponentsFormatter)init
{
  v3.receiver = self;
  v3.super_class = (Class)swift_getObjectType();
  return [(JSADateComponentsFormatter *)&v3 init];
}

@end