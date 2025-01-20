@interface JSAProcessEnvironment
+ (JSAProcessEnvironment)currentEnvironment;
- (JSAProcessEnvironment)init;
- (int64_t)variant;
- (void)setup;
@end

@implementation JSAProcessEnvironment

+ (JSAProcessEnvironment)currentEnvironment
{
  if (qword_CC4B8 != -1) {
    swift_once();
  }
  v2 = (void *)qword_CD290;

  return (JSAProcessEnvironment *)v2;
}

- (int64_t)variant
{
  return *(int64_t *)((char *)&self->super.isa + OBJC_IVAR___JSAProcessEnvironment__variant);
}

- (JSAProcessEnvironment)init
{
  *(Class *)((char *)&self->super.isa + OBJC_IVAR___JSAProcessEnvironment__variant) = 0;
  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for ProcessEnvironment();
  return [(JSAProcessEnvironment *)&v3 init];
}

- (void)setup
{
  v2 = self;
  sub_5EDE0();
}

@end