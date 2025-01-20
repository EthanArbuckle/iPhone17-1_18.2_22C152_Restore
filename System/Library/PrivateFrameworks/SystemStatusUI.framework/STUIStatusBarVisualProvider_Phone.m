@interface STUIStatusBarVisualProvider_Phone
+ (Class)visualProviderSubclassForScreen:(id)a3 visualProviderInfo:(id)a4;
- (STUIStatusBarVisualProvider_Phone)init;
- (STUIStatusBarVisualProvider_PillRegionCoordinator)pillRegionCoordinator;
- (id)additionAnimationForDisplayItemWithIdentifier:(id)a3 itemAnimation:(id)a4;
- (id)removalAnimationForDisplayItemWithIdentifier:(id)a3 itemAnimation:(id)a4;
- (id)willUpdateWithData:(id)a3;
- (void)actionable:(id)a3 highlighted:(BOOL)a4 initialPress:(BOOL)a5;
- (void)setPillRegionCoordinator:(id)a3;
@end

@implementation STUIStatusBarVisualProvider_Phone

- (STUIStatusBarVisualProvider_Phone)init
{
  v6.receiver = self;
  v6.super_class = (Class)STUIStatusBarVisualProvider_Phone;
  v2 = [(STUIStatusBarVisualProvider_iOS *)&v6 init];
  if (v2)
  {
    v3 = objc_opt_new();
    [(STUIStatusBarVisualProvider_Phone *)v2 setPillRegionCoordinator:v3];

    v4 = [(STUIStatusBarVisualProvider_Phone *)v2 pillRegionCoordinator];
    [v4 setVisualProvider:v2];
  }
  return v2;
}

- (void)setPillRegionCoordinator:(id)a3
{
}

- (id)willUpdateWithData:(id)a3
{
  v8.receiver = self;
  v8.super_class = (Class)STUIStatusBarVisualProvider_Phone;
  id v4 = a3;
  v5 = [(STUIStatusBarVisualProvider_iOS *)&v8 willUpdateWithData:v4];
  objc_super v6 = [(STUIStatusBarVisualProvider_Phone *)self pillRegionCoordinator];
  [v6 updateDataForBackgroundActivity:v4];

  return v5;
}

- (STUIStatusBarVisualProvider_PillRegionCoordinator)pillRegionCoordinator
{
  return self->_pillRegionCoordinator;
}

- (void).cxx_destruct
{
}

+ (Class)visualProviderSubclassForScreen:(id)a3 visualProviderInfo:(id)a4
{
  id v4 = a3;
  v5 = [v4 _exclusionArea];
  if (objc_opt_respondsToSelector())
  {
    [v5 rect];
  }
  else
  {
    objc_super v6 = +[STUIStatusBarSettingsDomain rootSettings];
    v7 = [v6 visualProviderSettings];
    int v8 = [v7 legacyPhoneUsesiPadLayout];

    if (v8)
    {
      uint64_t v9 = objc_opt_class();
      goto LABEL_6;
    }
  }
  v10 = objc_opt_class();
  uint64_t v9 = STUIStatusBarGetVisualProviderSubclassForScreenWithVisualProviderInfo(v10, v4, 0);
LABEL_6:
  v11 = (void *)v9;

  return (Class)v11;
}

- (id)additionAnimationForDisplayItemWithIdentifier:(id)a3 itemAnimation:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = +[STUIStatusBarItem defaultDisplayIdentifier];

  if (v8 == v6)
  {
    v11 = [(STUIStatusBarVisualProvider_Phone *)self pillRegionCoordinator];
    uint64_t v12 = [v11 animationForBackgroundActivityIcon];
  }
  else
  {
    id v9 = +[STUIStatusBarBackgroundActivityItem backgroundDisplayIdentifier];

    if (v9 != v6)
    {
      v14.receiver = self;
      v14.super_class = (Class)STUIStatusBarVisualProvider_Phone;
      v10 = [(STUIStatusBarVisualProvider_iOS *)&v14 additionAnimationForDisplayItemWithIdentifier:v6 itemAnimation:v7];
      goto LABEL_7;
    }
    v11 = [(STUIStatusBarVisualProvider_Phone *)self pillRegionCoordinator];
    uint64_t v12 = [v11 animationForBackgroundActivityPill];
  }
  v10 = (void *)v12;

LABEL_7:
  return v10;
}

- (id)removalAnimationForDisplayItemWithIdentifier:(id)a3 itemAnimation:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = +[STUIStatusBarItem defaultDisplayIdentifier];

  if (v8 == v6)
  {
    v11 = [(STUIStatusBarVisualProvider_Phone *)self pillRegionCoordinator];
    uint64_t v12 = [v11 animationForBackgroundActivityIcon];
  }
  else
  {
    id v9 = +[STUIStatusBarBackgroundActivityItem backgroundDisplayIdentifier];

    if (v9 != v6)
    {
      v14.receiver = self;
      v14.super_class = (Class)STUIStatusBarVisualProvider_Phone;
      v10 = [(STUIStatusBarVisualProvider_iOS *)&v14 removalAnimationForDisplayItemWithIdentifier:v6 itemAnimation:v7];
      goto LABEL_7;
    }
    v11 = [(STUIStatusBarVisualProvider_Phone *)self pillRegionCoordinator];
    uint64_t v12 = [v11 animationForBackgroundActivityPill];
  }
  v10 = (void *)v12;

LABEL_7:
  return v10;
}

- (void)actionable:(id)a3 highlighted:(BOOL)a4 initialPress:(BOOL)a5
{
  BOOL v5 = a5;
  BOOL v6 = a4;
  id v8 = a3;
  id v9 = [(STUIStatusBarVisualProvider_Phone *)self pillRegionCoordinator];
  char v10 = [v9 handledUpdateOfActionable:v8 highlighted:v6 initialPress:v5];

  if ((v10 & 1) == 0)
  {
    v11.receiver = self;
    v11.super_class = (Class)STUIStatusBarVisualProvider_Phone;
    [(STUIStatusBarVisualProvider_iOS *)&v11 actionable:v8 highlighted:v6 initialPress:v5];
  }
}

@end