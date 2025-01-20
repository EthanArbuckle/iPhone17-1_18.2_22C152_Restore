@interface CRLFeatureFlagGroup
+ (BOOL)isAaBrandingEnabled;
+ (BOOL)isAdoptTipsNextEnabled;
+ (BOOL)isAllowMinRequiredVersionForGoodEnoughFidelityToSaveToCloudKitEnabled;
+ (BOOL)isAppAnalyticsEnabled;
+ (BOOL)isChangeShapeEnabled;
+ (BOOL)isDrawingDataDetectorsEnabled;
+ (BOOL)isEasierConnectionLinesEnabled;
+ (BOOL)isFileImportExportEnabled;
+ (BOOL)isFollowEnabled;
+ (BOOL)isGenerativePlaygroundEnabled;
+ (BOOL)isHandwritingIntelligenceEnabled;
+ (BOOL)isMagicListsEnabled;
+ (BOOL)isMathPaperEnabled;
+ (BOOL)isMathPaperFeatureEnabled;
+ (BOOL)isPKDrawingExportEnabled;
+ (BOOL)isRedesignedTextCursorEnabled;
+ (BOOL)isScenesEnabled;
+ (BOOL)isSendACopyEnabled;
+ (BOOL)isSnapToGridEnabled;
+ (BOOL)isStencilsEnabled;
+ (BOOL)isThreeDimensionalObjectsEnabled;
+ (BOOL)isToolPickerItemAPIEnabled;
+ (BOOL)isUseSandboxEnvironmentEnabled;
+ (BOOL)isVerticalTextBoxAlignmentEnabled;
- (_TtC8Freeform19CRLFeatureFlagGroup)init;
@end

@implementation CRLFeatureFlagGroup

+ (BOOL)isAaBrandingEnabled
{
  return sub_100B8F4A8((uint64_t)a1, (uint64_t)a2, (uint64_t)&type metadata for CRLAppleAccountFeatureFlags, (uint64_t (*)(void))sub_1007B9E4C);
}

+ (BOOL)isAdoptTipsNextEnabled
{
  return sub_100B8F534((uint64_t)a1, (uint64_t)a2, 0);
}

+ (BOOL)isAllowMinRequiredVersionForGoodEnoughFidelityToSaveToCloudKitEnabled
{
  return sub_100B8F534((uint64_t)a1, (uint64_t)a2, 24);
}

+ (BOOL)isAppAnalyticsEnabled
{
  return sub_100B8F534((uint64_t)a1, (uint64_t)a2, 1);
}

+ (BOOL)isChangeShapeEnabled
{
  return sub_100B8F534((uint64_t)a1, (uint64_t)a2, 5);
}

+ (BOOL)isDrawingDataDetectorsEnabled
{
  return sub_100B8F3EC((uint64_t)a1, (uint64_t)a2, 1, 7);
}

+ (BOOL)isEasierConnectionLinesEnabled
{
  return sub_100B8F534((uint64_t)a1, (uint64_t)a2, 8);
}

+ (BOOL)isFileImportExportEnabled
{
  return sub_100B8F534((uint64_t)a1, (uint64_t)a2, 9);
}

+ (BOOL)isFollowEnabled
{
  return sub_100B8F534((uint64_t)a1, (uint64_t)a2, 12);
}

+ (BOOL)isGenerativePlaygroundEnabled
{
  return sub_100B8F624() & 1;
}

+ (BOOL)isHandwritingIntelligenceEnabled
{
  return sub_100B8F534((uint64_t)a1, (uint64_t)a2, 14);
}

+ (BOOL)isMagicListsEnabled
{
  return sub_100B8F534((uint64_t)a1, (uint64_t)a2, 16);
}

+ (BOOL)isMathPaperEnabled
{
  return sub_100B8F6C4() & 1;
}

+ (BOOL)isMathPaperFeatureEnabled
{
  return sub_100B8F3EC((uint64_t)a1, (uint64_t)a2, 0, 15);
}

+ (BOOL)isPKDrawingExportEnabled
{
  return sub_100B8F534((uint64_t)a1, (uint64_t)a2, 10);
}

+ (BOOL)isRedesignedTextCursorEnabled
{
  return sub_100B8F4A8((uint64_t)a1, (uint64_t)a2, (uint64_t)&type metadata for CRLUIKitFeatureFlags, (uint64_t (*)(void))sub_10069FE88);
}

+ (BOOL)isScenesEnabled
{
  return sub_100B8F534((uint64_t)a1, (uint64_t)a2, 17);
}

+ (BOOL)isSendACopyEnabled
{
  return sub_100B8F534((uint64_t)a1, (uint64_t)a2, 18);
}

+ (BOOL)isSnapToGridEnabled
{
  return sub_100B8F534((uint64_t)a1, (uint64_t)a2, 19);
}

+ (BOOL)isStencilsEnabled
{
  return sub_100B8F534((uint64_t)a1, (uint64_t)a2, 20);
}

+ (BOOL)isThreeDimensionalObjectsEnabled
{
  return sub_100B8F534((uint64_t)a1, (uint64_t)a2, 21);
}

+ (BOOL)isToolPickerItemAPIEnabled
{
  return sub_100B8F534((uint64_t)a1, (uint64_t)a2, 22);
}

+ (BOOL)isUseSandboxEnvironmentEnabled
{
  return sub_100B8F534((uint64_t)a1, (uint64_t)a2, 25);
}

+ (BOOL)isVerticalTextBoxAlignmentEnabled
{
  return sub_100B8F534((uint64_t)a1, (uint64_t)a2, 23);
}

- (_TtC8Freeform19CRLFeatureFlagGroup)init
{
  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for CRLFeatureFlagGroup();
  return [(CRLFeatureFlagGroup *)&v3 init];
}

@end