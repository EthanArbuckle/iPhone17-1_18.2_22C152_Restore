@interface MSDGreyMatter
+ (void)checkAvailabilityWithCompletion:(id)a3;
- (_TtC5demod13MSDGreyMatter)init;
@end

@implementation MSDGreyMatter

+ (void)checkAvailabilityWithCompletion:(id)a3
{
  v3 = _Block_copy(a3);
  uint64_t v4 = swift_allocObject();
  *(void *)(v4 + 16) = v3;
  swift_getObjCClassMetadata();
  static MSDGreyMatter.checkAvailabilityWithCompletion(_:)((uint64_t)sub_1000C581C, v4);

  swift_release();
}

- (_TtC5demod13MSDGreyMatter)init
{
  v3.receiver = self;
  v3.super_class = (Class)swift_getObjectType();
  return [(MSDGreyMatter *)&v3 init];
}

@end