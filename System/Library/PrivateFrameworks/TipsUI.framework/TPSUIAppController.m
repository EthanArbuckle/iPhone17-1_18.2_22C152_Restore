@interface TPSUIAppController
+ (TPSUIAppController)shared;
+ (TPSUIAppController)sharedInstance;
- (BOOL)viewNavigationCollapsed;
- (TPSUIAppController)init;
- (id)assetConfigurationForAssets:(id)a3 language:(id)a4 sizeClass:(int64_t)a5 style:(int64_t)a6 assetFileInfoManager:(id)a7;
- (id)attributedStringForIdentifier:(id)a3;
- (id)footNoteAttributedStringForIdentifier:(id)a3;
- (void)contentWillUpdate;
- (void)overrideWidgetWithTip:(id)a3;
- (void)resetAttributedStringCache;
- (void)setViewNavigationCollapsed:(BOOL)a3;
- (void)updateAttributedString:(id)a3 forIdentifier:(id)a4;
- (void)updateFootnoteAttributedString:(id)a3 forIdentifier:(id)a4;
@end

@implementation TPSUIAppController

+ (TPSUIAppController)sharedInstance
{
  swift_getObjCClassMetadata();
  id v2 = static TPSUIAppController.sharedInstance()();

  return (TPSUIAppController *)v2;
}

- (void)setViewNavigationCollapsed:(BOOL)a3
{
  v4 = (BOOL *)self + OBJC_IVAR___TPSUIAppController_viewNavigationCollapsed;
  swift_beginAccess();
  BOOL *v4 = a3;
}

- (BOOL)viewNavigationCollapsed
{
  id v2 = (BOOL *)self + OBJC_IVAR___TPSUIAppController_viewNavigationCollapsed;
  swift_beginAccess();
  return *v2;
}

- (TPSUIAppController)init
{
  return (TPSUIAppController *)TPSUIAppController.init()();
}

- (void)contentWillUpdate
{
  id v2 = self;
  sub_2179890F8();
}

- (id)assetConfigurationForAssets:(id)a3 language:(id)a4 sizeClass:(int64_t)a5 style:(int64_t)a6 assetFileInfoManager:(id)a7
{
  if (a4)
  {
    uint64_t v11 = sub_2179E2930();
    uint64_t v13 = v12;
  }
  else
  {
    uint64_t v11 = 0;
    uint64_t v13 = 0;
  }
  id v14 = a3;
  id v15 = a7;
  v16 = self;
  id v17 = sub_2179AA550(a3, v11, v13, a6, (uint64_t)v15);

  swift_bridgeObjectRelease();

  return v17;
}

- (id)attributedStringForIdentifier:(id)a3
{
  return sub_2179A9A68(self, (uint64_t)a2, (uint64_t)a3, sub_2179A95C4);
}

- (id)footNoteAttributedStringForIdentifier:(id)a3
{
  return sub_2179A9A68(self, (uint64_t)a2, (uint64_t)a3, sub_2179A97E0);
}

- (void)updateAttributedString:(id)a3 forIdentifier:(id)a4
{
}

- (void)updateFootnoteAttributedString:(id)a3 forIdentifier:(id)a4
{
}

- (void)resetAttributedStringCache
{
  id v2 = self;
  sub_2179A9FDC();
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();

  swift_bridgeObjectRelease();
}

+ (TPSUIAppController)shared
{
  if (qword_26ACF7068 != -1) {
    swift_once();
  }
  id v2 = (void *)qword_26ACF7060;

  return (TPSUIAppController *)v2;
}

- (void)overrideWidgetWithTip:(id)a3
{
  type metadata accessor for TipsContentModel();
  id v8 = a3;
  v5 = self;
  v6 = (TPSUIAppController *)static TipsContentModel.shared()();
  if (objc_msgSend(self, sel_isInternalBuild))
  {
    v7 = (TPSUIAppController *)sub_2179D17A4();
    [(TPSUIAppController *)v7 attemptWidgetUpdateWith:v8];

    v5 = v6;
    v6 = v7;
  }
}

@end