@interface MTMusicSubscriptionInfoLoader
+ (id)loadIfNeededAndReturnError:(id *)a3;
- (MTMusicSubscriptionInfoLoader)init;
@end

@implementation MTMusicSubscriptionInfoLoader

+ (id)loadIfNeededAndReturnError:(id *)a3
{
  swift_getObjCClassMetadata();
  static MusicSubscriptionInfoLoader.loadIfNeeded()();
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EB770968);
  v3 = (void *)sub_1ACE76558();
  swift_bridgeObjectRelease();
  return v3;
}

- (MTMusicSubscriptionInfoLoader)init
{
  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for MusicSubscriptionInfoLoader();
  return [(MTMusicSubscriptionInfoLoader *)&v3 init];
}

@end