@interface TodayBannerValidator
- (BOOL)validateWith:(id)a3 bannerConfig:(id)a4;
@end

@implementation TodayBannerValidator

- (BOOL)validateWith:(id)a3 bannerConfig:(id)a4
{
  swift_unknownObjectRetain();
  id v6 = a4;
  swift_retain();
  char v7 = sub_10003AAA0(a3, v6);
  swift_unknownObjectRelease();

  swift_release();
  return v7 & 1;
}

@end