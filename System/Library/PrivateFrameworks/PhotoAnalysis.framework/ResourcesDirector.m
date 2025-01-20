@interface ResourcesDirector
- (NSString)description;
- (_TtC13PhotoAnalysis17ResourcesDirector)init;
- (void)photoLibraryDidBecomeUnavailable:(id)a3;
@end

@implementation ResourcesDirector

- (NSString)description
{
  swift_getObjectType();
  sub_1D24260D0();
  v2 = (void *)sub_1D24253B0();
  swift_bridgeObjectRelease();

  return (NSString *)v2;
}

- (_TtC13PhotoAnalysis17ResourcesDirector)init
{
  return (_TtC13PhotoAnalysis17ResourcesDirector *)sub_1D236C588();
}

- (void)photoLibraryDidBecomeUnavailable:(id)a3
{
  id v3 = a3;
  swift_retain();
  sub_1D2373860(v3);

  swift_release();
}

@end