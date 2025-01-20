@interface MonthViewLandscapeScrollTest
- (id)checkTestPreconditions;
- (void)runTest;
@end

@implementation MonthViewLandscapeScrollTest

- (id)checkTestPreconditions
{
  uint64_t v2 = EKUICurrentWindowInterfaceParadigm();
  id result = 0;
  if (v2 != 16)
  {
    if (EKUIUseLargeFormatPhoneUI()) {
      return 0;
    }
    else {
      return @"Test cannot be run on devices with compact width in landscape";
    }
  }
  return result;
}

- (void)runTest
{
  v2[0] = _NSConcreteStackBlock;
  v2[1] = 3221225472;
  v2[2] = sub_1000D1780;
  v2[3] = &unk_1001D27D8;
  v2[4] = self;
  [UIApp rotateIfNeeded:3 completion:v2];
}

@end