@interface AnalyticsIdentifierManager
+ (NSString)kMTResetIdentifierKey;
+ (_TtC18PodcastsFoundation26AnalyticsIdentifierManager)sharedInstance;
- (_TtC18PodcastsFoundation26AnalyticsIdentifierManager)init;
- (id)identifierPromise;
- (void)resetIdentifiers;
- (void)resetIfNeeded;
- (void)setIdentifierPromise:(id)a3;
- (void)updateIdentifiers;
@end

@implementation AnalyticsIdentifierManager

+ (NSString)kMTResetIdentifierKey
{
  v2 = (void *)sub_1ACE76178();
  return (NSString *)v2;
}

+ (_TtC18PodcastsFoundation26AnalyticsIdentifierManager)sharedInstance
{
  if (qword_1EB76C5D0 != -1) {
    swift_once();
  }
  v2 = (void *)qword_1EB76C5C8;
  return (_TtC18PodcastsFoundation26AnalyticsIdentifierManager *)v2;
}

- (id)identifierPromise
{
  v2 = (id *)((char *)&self->super.isa
            + OBJC_IVAR____TtC18PodcastsFoundation26AnalyticsIdentifierManager_identifierPromise);
  swift_beginAccess();
  return *v2;
}

- (void)setIdentifierPromise:(id)a3
{
  v4 = (void **)((char *)&self->super.isa
               + OBJC_IVAR____TtC18PodcastsFoundation26AnalyticsIdentifierManager_identifierPromise);
  swift_beginAccess();
  v5 = *v4;
  *v4 = a3;
  id v6 = a3;
}

- (_TtC18PodcastsFoundation26AnalyticsIdentifierManager)init
{
  return (_TtC18PodcastsFoundation26AnalyticsIdentifierManager *)sub_1ACBFED60();
}

- (void)updateIdentifiers
{
  v2 = self;
  sub_1ACBFEF3C();
}

- (void)resetIdentifiers
{
  v2 = self;
  sub_1ACBFF6E8();
}

- (void)resetIfNeeded
{
  v2 = self;
  sub_1ACBFFCD8();
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC18PodcastsFoundation26AnalyticsIdentifierManager_accountStore));
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC18PodcastsFoundation26AnalyticsIdentifierManager_identifierPromise));
  swift_release();
}

@end