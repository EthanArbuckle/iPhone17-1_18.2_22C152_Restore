@interface PSListControllerDefaultAppearanceProvider
- (double)estimatedHeightOfRowForCellWithIndexPath:(id)a3 inController:(id)a4;
- (id)cellForSpecifier:(id)a3 inController:(id)a4;
- (int64_t)tableViewStyleForListController:(id)a3;
- (void)customizeTableView:(id)a3 inContainerView:(id)a4 hostedInSetupController:(BOOL)a5 forListController:(id)a6;
- (void)listController:(id)a3 updateSectionContentInsetAnimated:(BOOL)a4 isRegularWidth:(BOOL)a5 contentInsetInitialized:(BOOL)a6 contentInsetInitializedApplicator:(id)a7;
@end

@implementation PSListControllerDefaultAppearanceProvider

- (double)estimatedHeightOfRowForCellWithIndexPath:(id)a3 inController:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  uint64_t v7 = [v6 indexForIndexPath:v5];
  v8 = [v6 unprotectedSpecifiers];
  v9 = [v8 objectAtIndex:v7];

  if ((v9[7] & 0xFFFFFFFFFFFFFFFELL) == 0xA)
  {
    double v10 = 66.0;
  }
  else
  {
    v11 = [v6 table];
    uint64_t v12 = [v9 propertyForKey:@"height"];
    v13 = (void *)v12;
    if (v9[7] == 14 && v12 == 0)
    {
      id v15 = (id)[v6 tableView:v11 cellForRowAtIndexPath:v5];
      v13 = [v9 propertyForKey:@"height"];
    }
    if (v13)
    {
      double v10 = (double)[v13 integerValue];
    }
    else
    {
      [v11 estimatedRowHeight];
      if (v16 <= 0.0)
      {
        double v10 = *MEMORY[0x1E4F43D18];
      }
      else
      {
        [v11 estimatedRowHeight];
        double v10 = v17;
      }
    }
  }
  return v10;
}

- (id)cellForSpecifier:(id)a3 inController:(id)a4
{
  id v4 = a3;
  id v5 = +[PSTableCell cellClassForSpecifier:v4];
  int v6 = [(objc_class *)v5 isSubclassOfClass:objc_opt_class()];
  id v7 = [v5 alloc];
  uint64_t v8 = [(objc_class *)v5 cellStyle];
  if (v6)
  {
    v9 = +[PSTableCell reuseIdentifierForSpecifier:v4];
    double v10 = (void *)[v7 initWithStyle:v8 reuseIdentifier:v9 specifier:v4];
  }
  else
  {
    double v10 = (void *)[v7 initWithStyle:v8 reuseIdentifier:0];
  }

  return v10;
}

- (void)listController:(id)a3 updateSectionContentInsetAnimated:(BOOL)a4 isRegularWidth:(BOOL)a5 contentInsetInitialized:(BOOL)a6 contentInsetInitializedApplicator:(id)a7
{
  BOOL v8 = a6;
  BOOL v9 = a4;
  id v10 = a3;
  v11 = (void (**)(void))a7;
  uint64_t v12 = [v10 view];
  int v13 = PSShouldInsetListView(v12);
  v14 = (double *)MEMORY[0x1E4F43D18];
  if (!v13 || ([v10 edgeToEdgeCells] & 1) != 0)
  {

LABEL_4:
    double v15 = *v14;
    double v16 = *v14;
    goto LABEL_5;
  }
  char v22 = PSIsRunningInAssistant();

  if (v22) {
    goto LABEL_4;
  }
  v23 = [v10 view];
  [v23 safeAreaInsets];
  double v25 = v24;

  double v15 = 0.0;
  BOOL v26 = v25 <= 0.0;
  double v16 = 0.0;
  if (v26)
  {
    v27 = [v10 view];
    [v27 layoutMargins];
    double v16 = v28;
  }
  v29 = [v10 view];
  [v29 safeAreaInsets];
  double v31 = v30;

  if (v31 <= 0.0)
  {
    v32 = [v10 view];
    [v32 layoutMargins];
    double v15 = v33;
  }
LABEL_5:
  double v17 = [v10 table];
  [v17 _sectionContentInset];
  if (v16 != v19 || v15 != v18)
  {
    double v21 = *v14;
    if (v9 && v8)
    {
      objc_msgSend(v17, "_setSectionContentInset:", *v14, v16, *v14, v15);
    }
    else
    {
      v34 = (void *)MEMORY[0x1E4F42FF0];
      v35[0] = MEMORY[0x1E4F143A8];
      v35[1] = 3221225472;
      v35[2] = __167__PSListControllerDefaultAppearanceProvider_listController_updateSectionContentInsetAnimated_isRegularWidth_contentInsetInitialized_contentInsetInitializedApplicator___block_invoke;
      v35[3] = &unk_1E5C5DFE8;
      id v36 = v17;
      double v37 = v21;
      double v38 = v16;
      double v39 = v21;
      double v40 = v15;
      [v34 performWithoutAnimation:v35];
      v11[2](v11);
    }
  }
}

- (void)customizeTableView:(id)a3 inContainerView:(id)a4 hostedInSetupController:(BOOL)a5 forListController:(id)a6
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a6;
  [v9 setCellLayoutMarginsFollowReadableWidth:1];
  [v9 setAutoresizingMask:18];
  [v9 setLayoutMarginsFollowReadableWidth:0];
  [v9 setEstimatedSectionHeaderHeight:0.0];
  [v9 setEstimatedSectionFooterHeight:0.0];
  if (PSIsRunningInAssistant())
  {
    [v9 setBackgroundView:0];
    uint64_t v12 = [MEMORY[0x1E4F428B8] clearColor];
    [v9 setBackgroundColor:v12];
  }
  else
  {
    int v13 = +[PSListController appearance];
    v14 = [v13 backgroundColor];

    if (!v14) {
      goto LABEL_6;
    }
    uint64_t v12 = +[PSListController appearance];
    double v15 = [v12 backgroundColor];
    [v9 setBackgroundColor:v15];
  }
LABEL_6:
  double v16 = +[PSListController appearance];
  double v17 = [v16 separatorColor];

  if (v17)
  {
    double v18 = +[PSListController appearance];
    double v19 = [v18 separatorColor];
    [v9 setSeparatorColor:v19];
  }
  v20 = [MEMORY[0x1E4F42948] currentDevice];
  if (!objc_msgSend(v20, "sf_isiPad"))
  {

    goto LABEL_15;
  }
  int v21 = PSIsRunningInAssistant();

  if (!v21)
  {
LABEL_15:
    objc_msgSend(v10, "setAutoresizingMask:", objc_msgSend(v9, "autoresizingMask"));
    v29 = [MEMORY[0x1E4F428B8] groupTableViewBackgroundColor];
    [v10 setBackgroundColor:v29];

    double v30 = +[PSListController appearance];
    char v31 = [v30 usesDarkTheme];

    if (v31)
    {
      v32 = +[PSListController appearance];
      double v33 = [v32 backgroundColor];
      [v9 setBackgroundColor:v33];
    }
    else
    {
      v32 = [v10 backgroundColor];
      [v9 setBackgroundColor:v32];
    }

    goto LABEL_19;
  }
  char v22 = [MEMORY[0x1E4F428B8] whiteColor];
  [v10 setBackgroundColor:v22];

  v23 = [v9 panGestureRecognizer];
  [v10 addGestureRecognizer:v23];

  if (!a5)
  {
    uint64_t v35 = 0;
    id v36 = &v35;
    uint64_t v37 = 0x2050000000;
    double v24 = (void *)getBFFStyleClass_softClass_0;
    uint64_t v38 = getBFFStyleClass_softClass_0;
    if (!getBFFStyleClass_softClass_0)
    {
      v34[0] = MEMORY[0x1E4F143A8];
      v34[1] = 3221225472;
      v34[2] = __getBFFStyleClass_block_invoke_0;
      v34[3] = &unk_1E5C5D4D8;
      v34[4] = &v35;
      __getBFFStyleClass_block_invoke_0((uint64_t)v34);
      double v24 = (void *)v36[3];
    }
    id v25 = v24;
    _Block_object_dispose(&v35, 8);
    BOOL v26 = [v25 sharedStyle];
    [v26 edgeInsetsForTable:v9];
    double v28 = v27;

    objc_msgSend(v9, "setScrollIndicatorInsets:", 0.0, 0.0, 0.0, -v28);
  }
LABEL_19:
  [v10 setLayoutMarginsFollowReadableWidth:1];
  [v9 setClipsToBounds:0];
}

uint64_t __167__PSListControllerDefaultAppearanceProvider_listController_updateSectionContentInsetAnimated_isRegularWidth_contentInsetInitialized_contentInsetInitializedApplicator___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_setSectionContentInset:", *(double *)(a1 + 40), *(double *)(a1 + 48), *(double *)(a1 + 56), *(double *)(a1 + 64));
}

- (int64_t)tableViewStyleForListController:(id)a3
{
  return 1;
}

@end