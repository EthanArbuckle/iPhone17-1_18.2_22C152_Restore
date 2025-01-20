@interface FeedUpdaterObjcError
+ (NSError)feedURLIsEmpty;
+ (NSError)feedUpdatesDisabled;
+ (NSError)internetNotReachable;
+ (NSError)localShowMissing;
+ (NSError)nonSubscribableShow;
+ (NSError)notYetUpdatable;
+ (NSError)preProcessHookDeniedUpdate;
+ (NSString)domainName;
- (_TtC18PodcastsFoundation20FeedUpdaterObjcError)init;
@end

@implementation FeedUpdaterObjcError

- (_TtC18PodcastsFoundation20FeedUpdaterObjcError)init
{
  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for FeedUpdaterObjcError();
  return [(FeedUpdaterObjcError *)&v3 init];
}

+ (NSString)domainName
{
  __swift_instantiateConcreteTypeFromMangledName(&qword_1E99F22A0);
  __swift_instantiateConcreteTypeFromMangledName(&qword_1E99F22A8);
  sub_1ACE76228();
  v2 = (void *)sub_1ACE76178();
  swift_bridgeObjectRelease();
  return (NSString *)v2;
}

+ (NSError)feedURLIsEmpty
{
  return (NSError *)sub_1ACB3B890((uint64_t)a1, (uint64_t)a2, 7);
}

+ (NSError)localShowMissing
{
  return (NSError *)sub_1ACB3B890((uint64_t)a1, (uint64_t)a2, 10);
}

+ (NSError)preProcessHookDeniedUpdate
{
  return (NSError *)sub_1ACB3B890((uint64_t)a1, (uint64_t)a2, 11);
}

+ (NSError)internetNotReachable
{
  return (NSError *)sub_1ACB3B890((uint64_t)a1, (uint64_t)a2, 13);
}

+ (NSError)feedUpdatesDisabled
{
  return (NSError *)sub_1ACB3B890((uint64_t)a1, (uint64_t)a2, 14);
}

+ (NSError)notYetUpdatable
{
  return (NSError *)sub_1ACB3B890((uint64_t)a1, (uint64_t)a2, 15);
}

+ (NSError)nonSubscribableShow
{
  return (NSError *)sub_1ACB3B890((uint64_t)a1, (uint64_t)a2, 16);
}

@end