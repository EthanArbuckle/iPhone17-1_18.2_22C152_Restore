@interface AppStoreReviewEligibilityUserDefaultsTracker
- (_TtC10MobileMail44AppStoreReviewEligibilityUserDefaultsTracker)init;
- (_TtC10MobileMail44AppStoreReviewEligibilityUserDefaultsTracker)initWithUserDefaults:(id)a3;
- (int64_t)countOf:(int64_t)a3;
- (void)incrementCountOf:(int64_t)a3;
- (void)resetCounts;
@end

@implementation AppStoreReviewEligibilityUserDefaultsTracker

- (_TtC10MobileMail44AppStoreReviewEligibilityUserDefaultsTracker)initWithUserDefaults:(id)a3
{
  id v3 = a3;
  return (_TtC10MobileMail44AppStoreReviewEligibilityUserDefaultsTracker *)sub_100253FF0(a3);
}

- (int64_t)countOf:(int64_t)a3
{
  id v3 = self;
  int64_t v7 = sub_100254DD8(a3);

  return v7;
}

- (void)incrementCountOf:(int64_t)a3
{
  id v3 = self;
  sub_1002559B8(a3);
}

- (void)resetCounts
{
  v2 = self;
  sub_100255B58();
}

- (_TtC10MobileMail44AppStoreReviewEligibilityUserDefaultsTracker)init
{
  return (_TtC10MobileMail44AppStoreReviewEligibilityUserDefaultsTracker *)sub_1002567A8();
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC10MobileMail44AppStoreReviewEligibilityUserDefaultsTracker_userDefaults));
  sub_10001B0B0();
}

@end