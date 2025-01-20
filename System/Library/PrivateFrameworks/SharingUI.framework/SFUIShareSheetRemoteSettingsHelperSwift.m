@interface SFUIShareSheetRemoteSettingsHelperSwift
+ (void)updateHostingControllerWithHostingController:(id)a3 context:(id)a4 hostProcessType:(int64_t)a5 hostPresentationStyle:(int64_t)a6 optionGroups:(id)a7 collaborationOptionsData:(id)a8 cloudShareRequest:(id)a9;
- (SFUIShareSheetRemoteSettingsHelperSwift)init;
@end

@implementation SFUIShareSheetRemoteSettingsHelperSwift

- (SFUIShareSheetRemoteSettingsHelperSwift)init
{
  return (SFUIShareSheetRemoteSettingsHelperSwift *)sub_21DBA3D40();
}

+ (void)updateHostingControllerWithHostingController:(id)a3 context:(id)a4 hostProcessType:(int64_t)a5 hostPresentationStyle:(int64_t)a6 optionGroups:(id)a7 collaborationOptionsData:(id)a8 cloudShareRequest:(id)a9
{
  swift_getObjCClassMetadata();
  id v9 = a3;
  id v10 = a4;
  id v11 = a7;
  id v12 = a8;
  id v13 = a9;
  if (a7)
  {
    sub_21DBA5A54();
    uint64_t v14 = sub_21DBACDF8();

    uint64_t v15 = v14;
  }
  else
  {
    uint64_t v15 = 0;
  }
  swift_getObjCClassMetadata();
  static SFUIShareSheetRemoteSettingsHelperSwift.updateHostingController(hostingController:context:hostProcessType:hostPresentationStyle:optionGroups:collaborationOptionsData:cloudShareRequest:)((uint64_t)a3, a4, a5, a6, v15, a8, a9);
  swift_bridgeObjectRelease();
}

@end