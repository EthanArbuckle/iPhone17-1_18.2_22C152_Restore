@interface JSACopyLinkActivity
+ (int64_t)activityCategory;
- (BOOL)canPerformWithActivityItems:(id)a3;
- (JSACopyLinkActivity)init;
- (NSString)activityTitle;
- (NSString)activityType;
- (UIImage)activityImage;
- (void)performActivity;
- (void)prepareWithActivityItems:(id)a3;
@end

@implementation JSACopyLinkActivity

+ (int64_t)activityCategory
{
  return 0;
}

- (NSString)activityType
{
  v2 = self;
  NSString v3 = sub_86830();

  return (NSString *)v3;
}

- (NSString)activityTitle
{
  sub_67674();
  if (v2)
  {
    NSString v3 = sub_86830();
    swift_bridgeObjectRelease();
  }
  else
  {
    NSString v3 = 0;
  }

  return (NSString *)v3;
}

- (UIImage)activityImage
{
  uint64_t v2 = self;
  NSString v3 = sub_86830();
  id v4 = [self systemImageNamed:v3];

  return (UIImage *)v4;
}

- (BOOL)canPerformWithActivityItems:(id)a3
{
  uint64_t v4 = sub_86A30();
  v5 = self;
  char v6 = sub_67750(v4);

  swift_bridgeObjectRelease();
  return v6 & 1;
}

- (void)prepareWithActivityItems:(id)a3
{
  uint64_t v4 = sub_86A30();
  v5 = self;
  sub_66630(v4);

  swift_bridgeObjectRelease();
}

- (void)performActivity
{
  uint64_t v2 = self;
  sub_66A10();
}

- (JSACopyLinkActivity)init
{
  *(Class *)((char *)&self->super.super.isa + OBJC_IVAR___JSACopyLinkActivity_items) = 0;
  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for CopyLinkActivity();
  return [(JSACopyLinkActivity *)&v3 init];
}

- (void).cxx_destruct
{
}

@end