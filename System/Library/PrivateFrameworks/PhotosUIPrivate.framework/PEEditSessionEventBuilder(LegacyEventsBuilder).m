@interface PEEditSessionEventBuilder(LegacyEventsBuilder)
- (id)initWithLegacyEnterEditEvent:()LegacyEventsBuilder andExitEvent:;
@end

@implementation PEEditSessionEventBuilder(LegacyEventsBuilder)

- (id)initWithLegacyEnterEditEvent:()LegacyEventsBuilder andExitEvent:
{
  id v6 = a3;
  id v7 = a4;
  v12.receiver = a1;
  v12.super_class = (Class)&off_1F08C7F58;
  id v8 = objc_msgSendSuper2(&v12, sel_init);
  if (v8)
  {
    v9 = [v6 asset];
    [v8 setAsset:v9];

    [v6 enterEditDuration];
    objc_msgSend(v8, "setEnterEditDuration:");
    [v6 resourceCheckingDuration];
    objc_msgSend(v8, "setResourceCheckingDuration:");
    [v6 resourceDownloadDuration];
    objc_msgSend(v8, "setResourceDownloadDuration:");
    [v6 resourceLoadingDuration];
    objc_msgSend(v8, "setResourceLoadingDuration:");
    [v6 autoCalcDuration];
    objc_msgSend(v8, "setAutoCalcDuration:");
    objc_msgSend(v8, "setSessionEndReason:", objc_msgSend(v7, "sessionEndReason"));
    [v7 exitEditDuration];
    objc_msgSend(v8, "setExitEditDuration:");
    objc_msgSend(v8, "setFirstSinceLaunch:", objc_msgSend(v7, "isFirstSinceLaunch"));
    v10 = [v7 compositionController];
    [v8 setCompositionController:v10];

    objc_msgSend(v8, "setSaveActionType:", objc_msgSend(v7, "saveActionType"));
  }

  return v8;
}

@end