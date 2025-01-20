@interface PhotosUIOneUpChromeEnvironment.SettingsObservation
- (_TtCC15PhotosUIPrivate30PhotosUIOneUpChromeEnvironmentP33_AC95AE35C81CD1A240000623A044C1EE19SettingsObservation)init;
- (void)settings:(id)a3 changedValueForKey:(id)a4;
@end

@implementation PhotosUIOneUpChromeEnvironment.SettingsObservation

- (void)settings:(id)a3 changedValueForKey:(id)a4
{
  uint64_t v6 = sub_1AEF96DE0();
  uint64_t v8 = v7;
  id v9 = a3;
  v10 = self;
  sub_1AEABF0F8((uint64_t)v9, v6, v8);

  swift_bridgeObjectRelease();
}

- (_TtCC15PhotosUIPrivate30PhotosUIOneUpChromeEnvironmentP33_AC95AE35C81CD1A240000623A044C1EE19SettingsObservation)init
{
}

- (void).cxx_destruct
{
}

@end