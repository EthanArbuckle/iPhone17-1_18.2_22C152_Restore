@interface SBHAddWidgetSheetViewControllerBase
- (BOOL)allowsFakeWidgets;
- (BOOL)wantsBottomAttachedPresentation;
- (MTMaterialView)externalBackgroundView;
- (SBHAddWidgetSheetAppCollectionViewCellConfigurator)appCellConfigurator;
- (SBHAddWidgetSheetViewControllerBase)initWithListLayoutProvider:(id)a3 iconViewProvider:(id)a4 allowedWidgets:(SBHWidgetFilteringParameters)a5 appCellConfigurator:(id)a6 addWidgetSheetStyle:(unint64_t)a7;
- (SBHAddWidgetSheetViewControllerBase)initWithListLayoutProvider:(id)a3 iconViewProvider:(id)a4 allowedWidgets:(SBHWidgetFilteringParameters)a5 appCellIconImageCache:(id)a6 addWidgetSheetStyle:(unint64_t)a7;
- (SBHAddWidgetSheetViewControllerDelegate)delegate;
- (SBHPadAddWidgetSheetMetrics)addWidgetSheetMetrics;
- (SBHWidgetFilteringParameters)allowedWidgets;
- (SBIconListLayoutProvider)listLayoutProvider;
- (SBIconViewProviding)iconViewProvider;
- (UIEdgeInsets)preferredInsetsForSheetPresentationInInterfaceOrientation:(int64_t)a3;
- (int64_t)widgetWrapperViewControllerBackgroundType;
- (unint64_t)addWidgetSheetLocation;
- (unint64_t)addWidgetSheetStyle;
- (unint64_t)addWidgetSheetWidgetBackgroundType;
- (void)setAddWidgetSheetLocation:(unint64_t)a3;
- (void)setAddWidgetSheetMetrics:(SBHPadAddWidgetSheetMetrics *)a3;
- (void)setAddWidgetSheetStyle:(unint64_t)a3;
- (void)setAddWidgetSheetWidgetBackgroundType:(unint64_t)a3;
- (void)setAllowsFakeWidgets:(BOOL)a3;
- (void)setAppCellConfigurator:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setExternalBackgroundView:(id)a3;
- (void)setIconViewProvider:(id)a3;
- (void)setListLayoutProvider:(id)a3;
- (void)setWantsBottomAttachedPresentation:(BOOL)a3;
@end

@implementation SBHAddWidgetSheetViewControllerBase

- (SBHAddWidgetSheetViewControllerBase)initWithListLayoutProvider:(id)a3 iconViewProvider:(id)a4 allowedWidgets:(SBHWidgetFilteringParameters)a5 appCellIconImageCache:(id)a6 addWidgetSheetStyle:(unint64_t)a7
{
  uint64_t v8 = *(void *)&a5.includesNonStackable;
  unint64_t families = a5.families;
  id v13 = a6;
  id v14 = a4;
  id v15 = a3;
  v16 = [[SBHAddWidgetSheetAppCollectionViewCellConfigurator alloc] initWithIconCache:v13];

  v17 = -[SBHAddWidgetSheetViewControllerBase initWithListLayoutProvider:iconViewProvider:allowedWidgets:appCellConfigurator:addWidgetSheetStyle:](self, "initWithListLayoutProvider:iconViewProvider:allowedWidgets:appCellConfigurator:addWidgetSheetStyle:", v15, v14, families, v8, v16, a7);
  return v17;
}

- (SBHAddWidgetSheetViewControllerBase)initWithListLayoutProvider:(id)a3 iconViewProvider:(id)a4 allowedWidgets:(SBHWidgetFilteringParameters)a5 appCellConfigurator:(id)a6 addWidgetSheetStyle:(unint64_t)a7
{
  uint64_t v9 = *(void *)&a5.includesNonStackable;
  unint64_t families = a5.families;
  v29[1] = *MEMORY[0x1E4F143B8];
  id v14 = a3;
  id v15 = a4;
  id v16 = a6;
  v28.receiver = self;
  v28.super_class = (Class)SBHAddWidgetSheetViewControllerBase;
  v17 = [(SBHAddWidgetSheetViewControllerBase *)&v28 initWithNibName:0 bundle:0];
  v18 = v17;
  if (v17)
  {
    objc_storeStrong((id *)&v17->_listLayoutProvider, a3);
    objc_storeWeak((id *)&v18->_iconViewProvider, v15);
    v18->_allowedWidgets.unint64_t families = families;
    *(void *)&v18->_allowedWidgets.includesNonStackable = v9;
    objc_storeStrong((id *)&v18->_appCellConfigurator, a6);
    v18->_addWidgetSheetStyle = a7;
    v19 = (void *)MEMORY[0x1E4FB1E20];
    v20 = [(SBHAddWidgetSheetViewControllerBase *)v18 traitCollection];
    v21 = objc_msgSend(v19, "sbh_iconImageAppearanceFromTraitCollection:", v20);

    [v16 setIconImageAppearance:v21];
    v22 = self;
    v29[0] = v22;
    v23 = [MEMORY[0x1E4F1C978] arrayWithObjects:v29 count:1];
    v26[0] = MEMORY[0x1E4F143A8];
    v26[1] = 3221225472;
    v26[2] = __138__SBHAddWidgetSheetViewControllerBase_initWithListLayoutProvider_iconViewProvider_allowedWidgets_appCellConfigurator_addWidgetSheetStyle___block_invoke;
    v26[3] = &unk_1E6AB4E80;
    id v27 = v16;
    id v24 = (id)[(SBHAddWidgetSheetViewControllerBase *)v18 registerForTraitChanges:v23 withHandler:v26];
  }
  return v18;
}

void __138__SBHAddWidgetSheetViewControllerBase_initWithListLayoutProvider_iconViewProvider_allowedWidgets_appCellConfigurator_addWidgetSheetStyle___block_invoke(uint64_t a1, void *a2)
{
  v3 = (void *)MEMORY[0x1E4FB1E20];
  v4 = [a2 traitCollection];
  objc_msgSend(v3, "sbh_iconImageAppearanceFromTraitCollection:", v4);
  id v5 = (id)objc_claimAutoreleasedReturnValue();

  [*(id *)(a1 + 32) setIconImageAppearance:v5];
}

- (UIEdgeInsets)preferredInsetsForSheetPresentationInInterfaceOrientation:(int64_t)a3
{
  double v3 = *MEMORY[0x1E4FB2848];
  double v4 = *(double *)(MEMORY[0x1E4FB2848] + 8);
  double v5 = *(double *)(MEMORY[0x1E4FB2848] + 16);
  double v6 = *(double *)(MEMORY[0x1E4FB2848] + 24);
  result.right = v6;
  result.bottom = v5;
  result.left = v4;
  result.top = v3;
  return result;
}

- (int64_t)widgetWrapperViewControllerBackgroundType
{
  int64_t result = [(SBHAddWidgetSheetViewControllerBase *)self addWidgetSheetWidgetBackgroundType];
  if (result != 2) {
    return result == 1;
  }
  return result;
}

- (SBHAddWidgetSheetViewControllerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (SBHAddWidgetSheetViewControllerDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (SBHWidgetFilteringParameters)allowedWidgets
{
  p_allowedWidgets = &self->_allowedWidgets;
  unint64_t families = self->_allowedWidgets.families;
  uint64_t v4 = *(void *)&p_allowedWidgets->includesNonStackable;
  result.includesNonStackable = v4;
  result.requiresRemovableBackground = BYTE1(v4);
  result.unint64_t families = families;
  return result;
}

- (BOOL)allowsFakeWidgets
{
  return self->_allowsFakeWidgets;
}

- (void)setAllowsFakeWidgets:(BOOL)a3
{
  self->_allowsFakeWidgets = a3;
}

- (SBIconListLayoutProvider)listLayoutProvider
{
  return self->_listLayoutProvider;
}

- (void)setListLayoutProvider:(id)a3
{
}

- (SBIconViewProviding)iconViewProvider
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_iconViewProvider);
  return (SBIconViewProviding *)WeakRetained;
}

- (void)setIconViewProvider:(id)a3
{
}

- (SBHAddWidgetSheetAppCollectionViewCellConfigurator)appCellConfigurator
{
  return self->_appCellConfigurator;
}

- (void)setAppCellConfigurator:(id)a3
{
}

- (MTMaterialView)externalBackgroundView
{
  return self->_externalBackgroundView;
}

- (void)setExternalBackgroundView:(id)a3
{
}

- (unint64_t)addWidgetSheetStyle
{
  return self->_addWidgetSheetStyle;
}

- (void)setAddWidgetSheetStyle:(unint64_t)a3
{
  self->_addWidgetSheetStyle = a3;
}

- (unint64_t)addWidgetSheetLocation
{
  return self->_addWidgetSheetLocation;
}

- (void)setAddWidgetSheetLocation:(unint64_t)a3
{
  self->_addWidgetSheetLocation = a3;
}

- (unint64_t)addWidgetSheetWidgetBackgroundType
{
  return self->_addWidgetSheetWidgetBackgroundType;
}

- (void)setAddWidgetSheetWidgetBackgroundType:(unint64_t)a3
{
  self->_addWidgetSheetWidgetBackgroundType = a3;
}

- (BOOL)wantsBottomAttachedPresentation
{
  return self->_wantsBottomAttachedPresentation;
}

- (void)setWantsBottomAttachedPresentation:(BOOL)a3
{
  self->_wantsBottomAttachedPresentation = a3;
}

- (SBHPadAddWidgetSheetMetrics)addWidgetSheetMetrics
{
  CGSize v3 = *(CGSize *)&self[9].scaledWidgetSize.height;
  *(_OWORD *)&retstr->scaledWidgetSize.height = *(_OWORD *)&self[9].widgetScaleFactor;
  retstr->detailWidgetPadding = v3;
  *(CGSize *)&retstr->detailAddButtonTopSpacing = self[9].detailWidgetPadding;
  retstr->detailPageControlTopSpacing = self[9].detailAddButtonTopSpacing;
  long long v4 = *(_OWORD *)&self[9].sheetMargin;
  *(_OWORD *)&retstr->sheetMargin = *(_OWORD *)&self[8].detailAddButtonBottomSpacing;
  *(_OWORD *)&retstr->sidebarWidth = v4;
  long long v5 = *(_OWORD *)&self[9].trailingPadding;
  *(_OWORD *)&retstr->trailingPadding = *(_OWORD *)&self[9].sidebarWidth;
  *(_OWORD *)&retstr->widgetScaleFactor = v5;
  return self;
}

- (void)setAddWidgetSheetMetrics:(SBHPadAddWidgetSheetMetrics *)a3
{
  long long v3 = *(_OWORD *)&a3->widgetScaleFactor;
  long long v5 = *(_OWORD *)&a3->sheetMargin;
  long long v4 = *(_OWORD *)&a3->sidebarWidth;
  *(_OWORD *)&self->_addWidgetSheetMetrics.trailingPadding = *(_OWORD *)&a3->trailingPadding;
  *(_OWORD *)&self->_addWidgetSheetMetrics.widgetScaleFactor = v3;
  *(_OWORD *)&self->_addWidgetSheetMetrics.sheetMargin = v5;
  *(_OWORD *)&self->_addWidgetSheetMetrics.sidebarWidth = v4;
  CGSize detailWidgetPadding = a3->detailWidgetPadding;
  long long v6 = *(_OWORD *)&a3->detailAddButtonTopSpacing;
  long long v8 = *(_OWORD *)&a3->scaledWidgetSize.height;
  self->_addWidgetSheetMetrics.detailPageControlTopSpacing = a3->detailPageControlTopSpacing;
  self->_addWidgetSheetMetrics.CGSize detailWidgetPadding = detailWidgetPadding;
  *(_OWORD *)&self->_addWidgetSheetMetrics.detailAddButtonTopSpacing = v6;
  *(_OWORD *)&self->_addWidgetSheetMetrics.scaledWidgetSize.height = v8;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_externalBackgroundView, 0);
  objc_storeStrong((id *)&self->_appCellConfigurator, 0);
  objc_destroyWeak((id *)&self->_iconViewProvider);
  objc_storeStrong((id *)&self->_listLayoutProvider, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

@end