@interface SBHRootFolderSettings
+ (id)settingsControllerModule;
- (BOOL)isAdjustableLayoutEnabled;
- (BOOL)shouldRebuildLayoutOnChangesToValueForKey:(id)a3;
- (CGSize)editModeButtonSize;
- (CGSize)iconImageSizeForGridSizeClass:(id)a3;
- (NSString)description;
- (UIEdgeInsets)dockAdditionalIconInsets;
- (UIEdgeInsets)dockPlatterInsets;
- (UIEdgeInsets)landscapeAdditionalWidgetLayoutInsets;
- (UIEdgeInsets)landscapeLayoutInsets;
- (UIEdgeInsets)portraitAdditionalWidgetLayoutInsets;
- (UIEdgeInsets)portraitLayoutInsets;
- (UIOffset)editModeButtonLayoutOffset;
- (double)defaultIconSize;
- (double)dockAdditionalIconInset;
- (double)dockCornerRadius;
- (double)dockMargin;
- (double)dockVerticalPadding;
- (double)dockViewHeight;
- (double)editModeButtonLayoutOffsetHorizontal;
- (double)editModeButtonLayoutOffsetVertical;
- (double)editModeButtonSizeHeight;
- (double)editModeButtonSizeWidth;
- (double)idleTextVerticalOffset;
- (double)landscapeBottomLayoutInset;
- (double)landscapeSideLayoutInset;
- (double)landscapeTopLayoutInset;
- (double)landscapeWidgetOvershoot;
- (double)largeIconHeight;
- (double)mediumWidgetWidth;
- (double)pageControlVerticalOffset;
- (double)portraitBottomLayoutInset;
- (double)portraitSideLayoutInset;
- (double)portraitTopLayoutInset;
- (double)portraitWidgetOvershoot;
- (double)smallWidgetHeight;
- (id)descriptionBuilderWithMultilinePrefix:(id)a3;
- (id)descriptionWithMultilinePrefix:(id)a3;
- (id)succinctDescription;
- (id)succinctDescriptionBuilder;
- (unint64_t)layoutInsetsEnforcementAxis;
- (void)setAdjustableLayoutEnabled:(BOOL)a3;
- (void)setDefaultIconSize:(double)a3;
- (void)setDefaultValues;
- (void)setDockAdditionalIconInset:(double)a3;
- (void)setDockCornerRadius:(double)a3;
- (void)setDockMargin:(double)a3;
- (void)setDockVerticalPadding:(double)a3;
- (void)setEditModeButtonLayoutOffsetHorizontal:(double)a3;
- (void)setEditModeButtonLayoutOffsetVertical:(double)a3;
- (void)setEditModeButtonSizeHeight:(double)a3;
- (void)setEditModeButtonSizeWidth:(double)a3;
- (void)setIdleTextVerticalOffset:(double)a3;
- (void)setLandscapeBottomLayoutInset:(double)a3;
- (void)setLandscapeSideLayoutInset:(double)a3;
- (void)setLandscapeTopLayoutInset:(double)a3;
- (void)setLandscapeWidgetOvershoot:(double)a3;
- (void)setLargeIconHeight:(double)a3;
- (void)setMediumWidgetWidth:(double)a3;
- (void)setPageControlVerticalOffset:(double)a3;
- (void)setPortraitBottomLayoutInset:(double)a3;
- (void)setPortraitSideLayoutInset:(double)a3;
- (void)setPortraitTopLayoutInset:(double)a3;
- (void)setPortraitWidgetOvershoot:(double)a3;
- (void)setSmallWidgetHeight:(double)a3;
@end

@implementation SBHRootFolderSettings

- (NSString)description
{
  return (NSString *)[(SBHRootFolderSettings *)self descriptionWithMultilinePrefix:0];
}

- (void)setDefaultValues
{
  v3.receiver = self;
  v3.super_class = (Class)SBHRootFolderSettings;
  [(PTSettings *)&v3 setDefaultValues];
  [(SBHRootFolderSettings *)self setAdjustableLayoutEnabled:0];
  [(SBHRootFolderSettings *)self setPortraitTopLayoutInset:0.0];
  [(SBHRootFolderSettings *)self setPortraitBottomLayoutInset:0.0];
  [(SBHRootFolderSettings *)self setPortraitSideLayoutInset:0.0];
  [(SBHRootFolderSettings *)self setPortraitWidgetOvershoot:0.0];
  [(SBHRootFolderSettings *)self setLandscapeTopLayoutInset:0.0];
  [(SBHRootFolderSettings *)self setLandscapeBottomLayoutInset:0.0];
  [(SBHRootFolderSettings *)self setLandscapeSideLayoutInset:0.0];
  [(SBHRootFolderSettings *)self setLandscapeWidgetOvershoot:0.0];
  [(SBHRootFolderSettings *)self setDockAdditionalIconInset:0.0];
  [(SBHRootFolderSettings *)self setDockCornerRadius:0.0];
  [(SBHRootFolderSettings *)self setDockMargin:0.0];
  [(SBHRootFolderSettings *)self setDockVerticalPadding:0.0];
  [(SBHRootFolderSettings *)self setDefaultIconSize:0.0];
  [(SBHRootFolderSettings *)self setSmallWidgetHeight:0.0];
  [(SBHRootFolderSettings *)self setMediumWidgetWidth:0.0];
  [(SBHRootFolderSettings *)self setLargeIconHeight:0.0];
  [(SBHRootFolderSettings *)self setPageControlVerticalOffset:0.0];
  [(SBHRootFolderSettings *)self setIdleTextVerticalOffset:0.0];
  [(SBHRootFolderSettings *)self setEditModeButtonSizeWidth:0.0];
  [(SBHRootFolderSettings *)self setEditModeButtonSizeHeight:0.0];
  [(SBHRootFolderSettings *)self setEditModeButtonLayoutOffsetHorizontal:0.0];
  [(SBHRootFolderSettings *)self setEditModeButtonLayoutOffsetVertical:0.0];
}

+ (id)settingsControllerModule
{
  v59[1] = *MEMORY[0x1E4F143B8];
  v2 = (void *)MEMORY[0x1E4F94160];
  objc_super v3 = [MEMORY[0x1E4F941F0] rowWithTitle:@"Enable Adjustable Layout" valueKeyPath:@"adjustableLayoutEnabled"];
  v59[0] = v3;
  v4 = [MEMORY[0x1E4F1C978] arrayWithObjects:v59 count:1];
  v51 = [v2 sectionWithRows:v4];

  v5 = [MEMORY[0x1E4F94148] rowWithTitle:@"Portrait Top Inset" valueKeyPath:@"portraitTopLayoutInset"];
  v58[0] = v5;
  v6 = [MEMORY[0x1E4F94148] rowWithTitle:@"Portrait Bottom Inset" valueKeyPath:@"portraitBottomLayoutInset"];
  v58[1] = v6;
  v7 = [MEMORY[0x1E4F94148] rowWithTitle:@"Portrait Side Insets" valueKeyPath:@"portraitSideLayoutInset"];
  v58[2] = v7;
  v8 = [MEMORY[0x1E4F94148] rowWithTitle:@"Portrait Widget Overshoot" valueKeyPath:@"portraitWidgetOvershoot"];
  v58[3] = v8;
  v9 = [MEMORY[0x1E4F1C978] arrayWithObjects:v58 count:4];

  __49__SBHRootFolderSettings_settingsControllerModule__block_invoke(v10, v9);
  v50 = [MEMORY[0x1E4F94160] sectionWithRows:v9 title:@"Portrait Insets Adjustments"];
  v11 = [MEMORY[0x1E4F94148] rowWithTitle:@"Landscape Top Inset" valueKeyPath:@"landscapeTopLayoutInset"];
  v57[0] = v11;
  v12 = [MEMORY[0x1E4F94148] rowWithTitle:@"Landscape Bottom Inset" valueKeyPath:@"landscapeBottomLayoutInset"];
  v57[1] = v12;
  v13 = [MEMORY[0x1E4F94148] rowWithTitle:@"Landscape Side Insets" valueKeyPath:@"landscapeSideLayoutInset"];
  v57[2] = v13;
  v14 = [MEMORY[0x1E4F94148] rowWithTitle:@"Landscape Widget Overshoot" valueKeyPath:@"landscapeWidgetOvershoot"];
  v57[3] = v14;
  v15 = [MEMORY[0x1E4F1C978] arrayWithObjects:v57 count:4];

  __49__SBHRootFolderSettings_settingsControllerModule__block_invoke(v16, v15);
  v49 = [MEMORY[0x1E4F94160] sectionWithRows:v15 title:@"Landscape Insets Adjustments"];
  v17 = [MEMORY[0x1E4F94148] rowWithTitle:@"Dock Additional Icon Inset" valueKeyPath:@"dockAdditionalIconInset"];
  v56[0] = v17;
  v18 = [MEMORY[0x1E4F94148] rowWithTitle:@"Dock Corner Radius" valueKeyPath:@"dockCornerRadius"];
  v56[1] = v18;
  v19 = [MEMORY[0x1E4F94148] rowWithTitle:@"Dock External Margin" valueKeyPath:@"dockMargin"];
  v56[2] = v19;
  v20 = [MEMORY[0x1E4F94148] rowWithTitle:@"Dock Vertical Padding" valueKeyPath:@"dockVerticalPadding"];
  v56[3] = v20;
  v21 = [MEMORY[0x1E4F1C978] arrayWithObjects:v56 count:4];

  __49__SBHRootFolderSettings_settingsControllerModule__block_invoke(v22, v21);
  v48 = [MEMORY[0x1E4F94160] sectionWithRows:v21 title:@"Dock Adjustments"];
  v23 = [MEMORY[0x1E4F94148] rowWithTitle:@"Page Control Vertical Offset" valueKeyPath:@"pageControlVerticalOffset"];
  v55[0] = v23;
  v24 = [MEMORY[0x1E4F94148] rowWithTitle:@"Carrier Text Vertical Offset" valueKeyPath:@"idleTextVerticalOffset"];
  v55[1] = v24;
  v25 = [MEMORY[0x1E4F94148] rowWithTitle:@"Edit Button Width" valueKeyPath:@"editModeButtonSizeWidth"];
  v55[2] = v25;
  v26 = [MEMORY[0x1E4F94148] rowWithTitle:@"Edit Button Height" valueKeyPath:@"editModeButtonSizeHeight"];
  v55[3] = v26;
  v27 = [MEMORY[0x1E4F94148] rowWithTitle:@"Edit Button Horizontal Offset" valueKeyPath:@"editModeButtonLayoutOffsetHorizontal"];
  v55[4] = v27;
  v28 = [MEMORY[0x1E4F94148] rowWithTitle:@"Edit Button Vertical Offset" valueKeyPath:@"editModeButtonLayoutOffsetVertical"];
  v55[5] = v28;
  v29 = [MEMORY[0x1E4F1C978] arrayWithObjects:v55 count:6];

  __49__SBHRootFolderSettings_settingsControllerModule__block_invoke(v30, v29);
  v31 = [MEMORY[0x1E4F94160] sectionWithRows:v29 title:@"Other UI Adjustments"];
  v32 = [MEMORY[0x1E4F94148] rowWithTitle:@"Icon Size" valueKeyPath:@"defaultIconSize"];
  v54[0] = v32;
  v33 = [MEMORY[0x1E4F94148] rowWithTitle:@"Small Widget Height" valueKeyPath:@"smallWidgetHeight"];
  v54[1] = v33;
  v34 = [MEMORY[0x1E4F94148] rowWithTitle:@"Medium Widget Width" valueKeyPath:@"mediumWidgetWidth"];
  v54[2] = v34;
  v35 = [MEMORY[0x1E4F94148] rowWithTitle:@"Large Widget Height" valueKeyPath:@"largeIconHeight"];
  v54[3] = v35;
  v36 = [MEMORY[0x1E4F1C978] arrayWithObjects:v54 count:4];

  __49__SBHRootFolderSettings_settingsControllerModule__block_invoke(v37, v36);
  v38 = [MEMORY[0x1E4F94160] sectionWithRows:v36 title:@"Icon Size Adjustments"];
  v39 = (void *)MEMORY[0x1E4F940F8];
  v40 = [MEMORY[0x1E4F94170] action];
  v41 = [v39 rowWithTitle:@"Restore Defaults" action:v40];
  v53 = v41;
  v42 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v53 count:1];

  v43 = [MEMORY[0x1E4F94160] sectionWithRows:v42];
  v44 = (void *)MEMORY[0x1E4F94160];
  v52[0] = v51;
  v52[1] = v50;
  v52[2] = v48;
  v52[3] = v38;
  v52[4] = v31;
  v52[5] = v49;
  v52[6] = v43;
  v45 = [MEMORY[0x1E4F1C978] arrayWithObjects:v52 count:7];
  v46 = [v44 moduleWithTitle:@"Root Folder" contents:v45];

  return v46;
}

void __49__SBHRootFolderSettings_settingsControllerModule__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v2 = a2;
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  uint64_t v3 = [v2 countByEnumeratingWithState:&v8 objects:v12 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v9;
    do
    {
      for (uint64_t i = 0; i != v4; ++i)
      {
        if (*(void *)v9 != v5) {
          objc_enumerationMutation(v2);
        }
        v7 = *(void **)(*((void *)&v8 + 1) + 8 * i);
        [v7 setMaxValue:1000.0];
        [v7 setMinValue:-1000.0];
      }
      uint64_t v4 = [v2 countByEnumeratingWithState:&v8 objects:v12 count:16];
    }
    while (v4);
  }
}

- (UIEdgeInsets)portraitLayoutInsets
{
  [(SBHRootFolderSettings *)self portraitTopLayoutInset];
  double v4 = v3;
  [(SBHRootFolderSettings *)self portraitBottomLayoutInset];
  double v6 = v5;
  [(SBHRootFolderSettings *)self portraitSideLayoutInset];
  double v8 = v7;
  double v9 = v4;
  double v10 = v6;
  double v11 = v8;
  result.right = v11;
  result.bottom = v10;
  result.left = v8;
  result.top = v9;
  return result;
}

- (UIEdgeInsets)portraitAdditionalWidgetLayoutInsets
{
  [(SBHRootFolderSettings *)self portraitWidgetOvershoot];
  double v3 = -v2;
  double v4 = 0.0;
  double v5 = 0.0;
  double v6 = v3;
  result.right = v6;
  result.bottom = v5;
  result.left = v3;
  result.top = v4;
  return result;
}

- (UIEdgeInsets)landscapeLayoutInsets
{
  [(SBHRootFolderSettings *)self landscapeTopLayoutInset];
  double v4 = v3;
  [(SBHRootFolderSettings *)self landscapeBottomLayoutInset];
  double v6 = v5;
  [(SBHRootFolderSettings *)self landscapeSideLayoutInset];
  double v8 = v7;
  double v9 = v4;
  double v10 = v6;
  double v11 = v8;
  result.right = v11;
  result.bottom = v10;
  result.left = v8;
  result.top = v9;
  return result;
}

- (UIEdgeInsets)landscapeAdditionalWidgetLayoutInsets
{
  [(SBHRootFolderSettings *)self landscapeWidgetOvershoot];
  double v3 = -v2;
  double v4 = 0.0;
  double v5 = 0.0;
  double v6 = v3;
  result.right = v6;
  result.bottom = v5;
  result.left = v3;
  result.top = v4;
  return result;
}

- (unint64_t)layoutInsetsEnforcementAxis
{
  [(SBHRootFolderSettings *)self portraitAdditionalWidgetLayoutInsets];
  BOOL v5 = *(double *)(MEMORY[0x1E4FB2848] + 8) != v4;
  if (*MEMORY[0x1E4FB2848] != v6) {
    BOOL v5 = 1;
  }
  if (*(double *)(MEMORY[0x1E4FB2848] + 24) != v3) {
    BOOL v5 = 1;
  }
  return (v5 | ~(*(double *)(MEMORY[0x1E4FB2848] + 16) == v2)) & 1;
}

- (UIEdgeInsets)dockAdditionalIconInsets
{
  [(SBHRootFolderSettings *)self dockAdditionalIconInset];
  double v3 = v2;
  double v4 = 0.0;
  double v5 = 0.0;
  double v6 = v3;
  result.right = v6;
  result.bottom = v5;
  result.left = v3;
  result.top = v4;
  return result;
}

- (UIEdgeInsets)dockPlatterInsets
{
  [(SBHRootFolderSettings *)self dockMargin];
  double v3 = v2;
  double v4 = 0.0;
  double v5 = v3;
  double v6 = v3;
  result.right = v6;
  result.bottom = v5;
  result.left = v3;
  result.top = v4;
  return result;
}

- (double)dockViewHeight
{
  [(SBHRootFolderSettings *)self dockVerticalPadding];
  double v4 = v3;
  [(SBHRootFolderSettings *)self dockMargin];
  return v5 + v4 * 2.0;
}

- (CGSize)iconImageSizeForGridSizeClass:(id)a3
{
  double v4 = (__CFString *)a3;
  [(SBHRootFolderSettings *)self defaultIconSize];
  double v6 = v5;
  [(SBHRootFolderSettings *)self smallWidgetHeight];
  double v8 = v7;
  [(SBHRootFolderSettings *)self mediumWidgetWidth];
  double v10 = v9;
  [(SBHRootFolderSettings *)self largeIconHeight];
  if (@"SBHIconGridSizeClassDefault" == v4)
  {
    double v13 = v6;
  }
  else
  {
    double v12 = v11;
    double v13 = v6;
    if ((-[__CFString isEqualToString:](v4, "isEqualToString:") & 1) == 0)
    {
      if (@"SBHIconGridSizeClassSmall" == v4 || (-[__CFString isEqualToString:](v4, "isEqualToString:") & 1) != 0)
      {
        double v6 = v8;
        double v13 = v8;
      }
      else
      {
        if (@"SBHIconGridSizeClassMedium" == v4
          || (-[__CFString isEqualToString:](v4, "isEqualToString:") & 1) != 0)
        {
          double v6 = v8;
        }
        else
        {
          if (@"SBHIconGridSizeClassLarge" != v4
            && !-[__CFString isEqualToString:](v4, "isEqualToString:"))
          {
            double v13 = *MEMORY[0x1E4F1DB30];
            double v6 = *(double *)(MEMORY[0x1E4F1DB30] + 8);
            goto LABEL_7;
          }
          double v6 = v12;
        }
        double v13 = v10;
      }
    }
  }
LABEL_7:

  double v14 = v13;
  double v15 = v6;
  result.height = v15;
  result.width = v14;
  return result;
}

- (CGSize)editModeButtonSize
{
  [(SBHRootFolderSettings *)self editModeButtonSizeWidth];
  double v4 = v3;
  [(SBHRootFolderSettings *)self editModeButtonSizeHeight];
  double v6 = v5;
  double v7 = v4;
  result.height = v6;
  result.width = v7;
  return result;
}

- (UIOffset)editModeButtonLayoutOffset
{
  [(SBHRootFolderSettings *)self editModeButtonLayoutOffsetHorizontal];
  double v4 = v3;
  [(SBHRootFolderSettings *)self editModeButtonLayoutOffsetVertical];
  double v6 = v5;
  double v7 = v4;
  result.vertical = v6;
  result.horizontal = v7;
  return result;
}

- (BOOL)shouldRebuildLayoutOnChangesToValueForKey:(id)a3
{
  return [&unk_1F300F1C8 containsObject:a3];
}

- (id)succinctDescription
{
  double v2 = [(SBHRootFolderSettings *)self succinctDescriptionBuilder];
  double v3 = [v2 build];

  return v3;
}

- (id)succinctDescriptionBuilder
{
  return (id)[MEMORY[0x1E4F4F718] builderWithObject:self];
}

- (id)descriptionWithMultilinePrefix:(id)a3
{
  double v3 = [(SBHRootFolderSettings *)self descriptionBuilderWithMultilinePrefix:a3];
  double v4 = [v3 build];

  return v4;
}

- (id)descriptionBuilderWithMultilinePrefix:(id)a3
{
  id v4 = a3;
  double v5 = [(SBHRootFolderSettings *)self succinctDescriptionBuilder];
  unint64_t v6 = SBHScreenTypeForCurrentDevice();
  double v7 = SBHStringForScreenType(v6);
  [v5 appendString:v7 withName:@"layout"];

  id v8 = (id)objc_msgSend(v5, "appendBool:withName:", -[SBHRootFolderSettings isAdjustableLayoutEnabled](self, "isAdjustableLayoutEnabled"), @"adjustableLayoutEnabled");
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __63__SBHRootFolderSettings_descriptionBuilderWithMultilinePrefix___block_invoke;
  v12[3] = &unk_1E6AACA90;
  id v9 = v5;
  id v13 = v9;
  double v14 = self;
  [v9 appendBodySectionWithName:0 multilinePrefix:v4 block:v12];

  id v10 = v9;
  return v10;
}

id __63__SBHRootFolderSettings_descriptionBuilderWithMultilinePrefix___block_invoke(uint64_t a1)
{
  double v2 = *(void **)(a1 + 32);
  [*(id *)(a1 + 40) portraitTopLayoutInset];
  id v3 = (id)objc_msgSend(v2, "appendFloat:withName:", @"portraitTopLayoutInset");
  id v4 = *(void **)(a1 + 32);
  [*(id *)(a1 + 40) portraitBottomLayoutInset];
  id v5 = (id)objc_msgSend(v4, "appendFloat:withName:", @"portraitBottomLayoutInset");
  unint64_t v6 = *(void **)(a1 + 32);
  [*(id *)(a1 + 40) portraitSideLayoutInset];
  id v7 = (id)objc_msgSend(v6, "appendFloat:withName:", @"portraitSideLayoutInset");
  id v8 = *(void **)(a1 + 32);
  [*(id *)(a1 + 40) portraitWidgetOvershoot];
  id v9 = (id)objc_msgSend(v8, "appendFloat:withName:", @"portraitWidgetOvershoot");
  id v10 = *(void **)(a1 + 32);
  [*(id *)(a1 + 40) landscapeTopLayoutInset];
  id v11 = (id)objc_msgSend(v10, "appendFloat:withName:", @"landscapeTopLayoutInset");
  double v12 = *(void **)(a1 + 32);
  [*(id *)(a1 + 40) landscapeBottomLayoutInset];
  id v13 = (id)objc_msgSend(v12, "appendFloat:withName:", @"landscapeBottomLayoutInset");
  double v14 = *(void **)(a1 + 32);
  [*(id *)(a1 + 40) landscapeSideLayoutInset];
  id v15 = (id)objc_msgSend(v14, "appendFloat:withName:", @"landscapeSideLayoutInset");
  uint64_t v16 = *(void **)(a1 + 32);
  [*(id *)(a1 + 40) landscapeWidgetOvershoot];
  id v17 = (id)objc_msgSend(v16, "appendFloat:withName:", @"landscapeWidgetOvershoot");
  v18 = *(void **)(a1 + 32);
  [*(id *)(a1 + 40) dockAdditionalIconInset];
  id v19 = (id)objc_msgSend(v18, "appendFloat:withName:", @"dockAdditionalIconInset");
  v20 = *(void **)(a1 + 32);
  [*(id *)(a1 + 40) dockCornerRadius];
  id v21 = (id)objc_msgSend(v20, "appendFloat:withName:", @"dockCornerRadius");
  uint64_t v22 = *(void **)(a1 + 32);
  [*(id *)(a1 + 40) dockMargin];
  id v23 = (id)objc_msgSend(v22, "appendFloat:withName:", @"dockMargin");
  v24 = *(void **)(a1 + 32);
  [*(id *)(a1 + 40) dockVerticalPadding];
  id v25 = (id)objc_msgSend(v24, "appendFloat:withName:", @"dockVerticalPadding");
  v26 = *(void **)(a1 + 32);
  [*(id *)(a1 + 40) defaultIconSize];
  id v27 = (id)objc_msgSend(v26, "appendFloat:withName:", @"defaultIconSize");
  v28 = *(void **)(a1 + 32);
  [*(id *)(a1 + 40) smallWidgetHeight];
  id v29 = (id)objc_msgSend(v28, "appendFloat:withName:", @"smallWidgetHeight");
  uint64_t v30 = *(void **)(a1 + 32);
  [*(id *)(a1 + 40) mediumWidgetWidth];
  id v31 = (id)objc_msgSend(v30, "appendFloat:withName:", @"mediumWidgetWidth");
  v32 = *(void **)(a1 + 32);
  [*(id *)(a1 + 40) largeIconHeight];
  id v33 = (id)objc_msgSend(v32, "appendFloat:withName:", @"largeIconHeight");
  v34 = *(void **)(a1 + 32);
  [*(id *)(a1 + 40) pageControlVerticalOffset];
  id v35 = (id)objc_msgSend(v34, "appendFloat:withName:", @"pageControlVerticalOffset");
  v36 = *(void **)(a1 + 32);
  [*(id *)(a1 + 40) idleTextVerticalOffset];
  id v37 = (id)objc_msgSend(v36, "appendFloat:withName:", @"idleTextVerticalOffset");
  v38 = *(void **)(a1 + 32);
  [*(id *)(a1 + 40) editModeButtonSizeWidth];
  id v39 = (id)objc_msgSend(v38, "appendFloat:withName:", @"editModeButtonSizeWidth");
  v40 = *(void **)(a1 + 32);
  [*(id *)(a1 + 40) editModeButtonSizeHeight];
  id v41 = (id)objc_msgSend(v40, "appendFloat:withName:", @"editModeButtonSizeHeight");
  v42 = *(void **)(a1 + 32);
  [*(id *)(a1 + 40) editModeButtonLayoutOffsetHorizontal];
  id v43 = (id)objc_msgSend(v42, "appendFloat:withName:", @"editModeButtonLayoutOffsetHorizontal");
  v44 = *(void **)(a1 + 32);
  [*(id *)(a1 + 40) editModeButtonLayoutOffsetVertical];
  return (id)objc_msgSend(v44, "appendFloat:withName:", @"editModeButtonLayoutOffsetVertical");
}

- (BOOL)isAdjustableLayoutEnabled
{
  return self->_adjustableLayoutEnabled;
}

- (void)setAdjustableLayoutEnabled:(BOOL)a3
{
  self->_adjustableLayoutEnabled = a3;
}

- (double)portraitTopLayoutInset
{
  return self->_portraitTopLayoutInset;
}

- (void)setPortraitTopLayoutInset:(double)a3
{
  self->_portraitTopLayoutInset = a3;
}

- (double)portraitBottomLayoutInset
{
  return self->_portraitBottomLayoutInset;
}

- (void)setPortraitBottomLayoutInset:(double)a3
{
  self->_portraitBottomLayoutInset = a3;
}

- (double)portraitSideLayoutInset
{
  return self->_portraitSideLayoutInset;
}

- (void)setPortraitSideLayoutInset:(double)a3
{
  self->_portraitSideLayoutInset = a3;
}

- (double)portraitWidgetOvershoot
{
  return self->_portraitWidgetOvershoot;
}

- (void)setPortraitWidgetOvershoot:(double)a3
{
  self->_portraitWidgetOvershoot = a3;
}

- (double)landscapeTopLayoutInset
{
  return self->_landscapeTopLayoutInset;
}

- (void)setLandscapeTopLayoutInset:(double)a3
{
  self->_landscapeTopLayoutInset = a3;
}

- (double)landscapeBottomLayoutInset
{
  return self->_landscapeBottomLayoutInset;
}

- (void)setLandscapeBottomLayoutInset:(double)a3
{
  self->_landscapeBottomLayoutInset = a3;
}

- (double)landscapeSideLayoutInset
{
  return self->_landscapeSideLayoutInset;
}

- (void)setLandscapeSideLayoutInset:(double)a3
{
  self->_landscapeSideLayoutInset = a3;
}

- (double)landscapeWidgetOvershoot
{
  return self->_landscapeWidgetOvershoot;
}

- (void)setLandscapeWidgetOvershoot:(double)a3
{
  self->_landscapeWidgetOvershoot = a3;
}

- (double)dockAdditionalIconInset
{
  return self->_dockAdditionalIconInset;
}

- (void)setDockAdditionalIconInset:(double)a3
{
  self->_dockAdditionalIconInset = a3;
}

- (double)dockCornerRadius
{
  return self->_dockCornerRadius;
}

- (void)setDockCornerRadius:(double)a3
{
  self->_dockCornerRadius = a3;
}

- (double)dockMargin
{
  return self->_dockMargin;
}

- (void)setDockMargin:(double)a3
{
  self->_dockMargin = a3;
}

- (double)dockVerticalPadding
{
  return self->_dockVerticalPadding;
}

- (void)setDockVerticalPadding:(double)a3
{
  self->_dockVerticalPadding = a3;
}

- (double)defaultIconSize
{
  return self->_defaultIconSize;
}

- (void)setDefaultIconSize:(double)a3
{
  self->_defaultIconSize = a3;
}

- (double)smallWidgetHeight
{
  return self->_smallWidgetHeight;
}

- (void)setSmallWidgetHeight:(double)a3
{
  self->_smallWidgetHeight = a3;
}

- (double)mediumWidgetWidth
{
  return self->_mediumWidgetWidth;
}

- (void)setMediumWidgetWidth:(double)a3
{
  self->_mediumWidgetWidth = a3;
}

- (double)largeIconHeight
{
  return self->_largeIconHeight;
}

- (void)setLargeIconHeight:(double)a3
{
  self->_largeIconHeight = a3;
}

- (double)pageControlVerticalOffset
{
  return self->_pageControlVerticalOffset;
}

- (void)setPageControlVerticalOffset:(double)a3
{
  self->_pageControlVerticalOffset = a3;
}

- (double)idleTextVerticalOffset
{
  return self->_idleTextVerticalOffset;
}

- (void)setIdleTextVerticalOffset:(double)a3
{
  self->_idleTextVerticalOffset = a3;
}

- (double)editModeButtonSizeWidth
{
  return self->_editModeButtonSizeWidth;
}

- (void)setEditModeButtonSizeWidth:(double)a3
{
  self->_editModeButtonSizeWidth = a3;
}

- (double)editModeButtonSizeHeight
{
  return self->_editModeButtonSizeHeight;
}

- (void)setEditModeButtonSizeHeight:(double)a3
{
  self->_editModeButtonSizeHeight = a3;
}

- (double)editModeButtonLayoutOffsetHorizontal
{
  return self->_editModeButtonLayoutOffsetHorizontal;
}

- (void)setEditModeButtonLayoutOffsetHorizontal:(double)a3
{
  self->_editModeButtonLayoutOffsetHorizontal = a3;
}

- (double)editModeButtonLayoutOffsetVertical
{
  return self->_editModeButtonLayoutOffsetVertical;
}

- (void)setEditModeButtonLayoutOffsetVertical:(double)a3
{
  self->_editModeButtonLayoutOffsetVertical = a3;
}

@end