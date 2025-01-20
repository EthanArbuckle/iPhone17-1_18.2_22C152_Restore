@interface UITableViewHeaderFooterView
+ (double)defaultFooterHeightForStyle:(int64_t)a3;
+ (double)defaultHeaderHeightForStyle:(int64_t)a3;
+ (id)_defaultFontForHeaderFooterView:(id)a3;
+ (id)_defaultFontForTableViewStyle:(int64_t)a3 isSectionHeader:(BOOL)a4;
+ (id)_defaultPlainHeaderFooterFont;
+ (id)_defaultTextColorForTableViewStyle:(int64_t)a3 isSectionHeader:(BOOL)a4;
- (BOOL)_automaticIntrinsicContentSizeInvalidationEnabled;
- (BOOL)_forwardsSystemLayoutFittingSizeToContentView:(id)a3;
- (BOOL)_hostsLayoutEngineAllowsTAMIC_NO;
- (BOOL)_insetsContentViewsToSafeArea;
- (BOOL)_isFloating;
- (BOOL)_isSourceListOrMacIdiom;
- (BOOL)_isTopHeader;
- (BOOL)_isTransparentFocusRegion;
- (BOOL)_stripPadding;
- (BOOL)_tintColorAffectsBackgroundColor;
- (BOOL)_useDetailText;
- (BOOL)_usingBackgroundConfigurationOrDefaultBackgroundConfiguration;
- (BOOL)_usingBackgroundViewConfiguration;
- (BOOL)automaticallyUpdatesBackgroundConfiguration;
- (BOOL)automaticallyUpdatesContentConfiguration;
- (BOOL)floating;
- (BOOL)sectionHeader;
- (CGRect)_backgroundRect;
- (CGRect)_backgroundRectForWidth:(double)a3;
- (CGRect)_contentRect;
- (CGRect)_contentRectForWidth:(double)a3;
- (CGRect)_detailLabelFrame;
- (CGRect)_labelFrame;
- (CGSize)_detailTextSizeForWidth:(double)a3;
- (CGSize)_sizeThatFits:(CGSize)a3 stripPaddingForAbuttingView:(BOOL)a4 isTopHeader:(BOOL)a5;
- (CGSize)_textSizeForWidth:(double)a3;
- (CGSize)sizeThatFits:(CGSize)a3;
- (CGSize)systemLayoutSizeFittingSize:(CGSize)a3 withHorizontalFittingPriority:(float)a4 verticalFittingPriority:(float)a5;
- (NSString)reuseIdentifier;
- (NSString)text;
- (UIBackgroundConfiguration)backgroundConfiguration;
- (UICellConfigurationState)_configurationState;
- (UIEdgeInsets)_concreteDefaultLayoutMargins;
- (UIEdgeInsets)_effectiveSafeAreaInsets;
- (UIEdgeInsets)_insetsToBounds;
- (UIEdgeInsets)_insetsToContentRect;
- (UIImage)backgroundImage;
- (UILabel)detailTextLabel;
- (UILabel)textLabel;
- (UIListContentConfiguration)defaultContentConfiguration;
- (UITable)table;
- (UITableConstants)_constants;
- (UITableView)tableView;
- (UITableViewHeaderFooterView)initWithCoder:(NSCoder *)coder;
- (UITableViewHeaderFooterView)initWithFrame:(CGRect)a3;
- (UITableViewHeaderFooterView)initWithReuseIdentifier:(NSString *)reuseIdentifier;
- (UITableViewHeaderFooterViewConfigurationUpdateHandler)configurationUpdateHandler;
- (UIView)backgroundView;
- (UIView)contentView;
- (UIViewConfigurationState)_bridgedConfigurationState;
- (_UIBackgroundViewConfiguration)_backgroundViewConfiguration;
- (_UIContentViewConfiguration)_contentViewConfiguration;
- (double)_marginWidth;
- (double)_rightMarginWidth;
- (double)maxTitleWidth;
- (id)_backgroundViewConfigurationProvider;
- (id)_contentViewConfigurationProvider;
- (id)_customViewForDefaultBackgroundAppearance;
- (id)_defaultBackgroundConfiguration;
- (id)_defaultTextColor;
- (id)_label:(BOOL)a3;
- (id)_table;
- (id)contentConfiguration;
- (int64_t)_contentViewListStyleFromTableViewStyle:(int64_t)a3;
- (int64_t)tableViewStyle;
- (int64_t)textAlignment;
- (unint64_t)_viewConfigurationState;
- (void)_applyBackgroundViewConfiguration:(id)a3 withState:(id)a4;
- (void)_applyContentViewConfiguration:(id)a3 withState:(id)a4 usingSPI:(BOOL)a5;
- (void)_bridgedUpdateConfigurationUsingState:(id)a3;
- (void)_clearChangeHandlersForOldContentView:(id)a3;
- (void)_configureDefaultContentViewLayoutMargins;
- (void)_didUpdateFocusInContext:(id)a3;
- (void)_executeConfigurationUpdate;
- (void)_intrinsicContentSizeInvalidatedForChildView:(id)a3;
- (void)_invalidateConfiguration;
- (void)_invalidateDetailLabelBackgroundColor;
- (void)_invalidateLabelBackgroundColor;
- (void)_layoutSystemBackgroundView;
- (void)_notifyIsDisplaying:(BOOL)a3;
- (void)_performConfigurationStateUpdate;
- (void)_populateArchivedSubviews:(id)a3;
- (void)_prepareForConfigurationStateUpdate;
- (void)_resetBackgroundViewConfiguration;
- (void)_resetBackgroundViewsAndColor;
- (void)_resetContentViews;
- (void)_safeAreaInsetsDidChangeFromOldInsets:(UIEdgeInsets)a3;
- (void)_setAutomaticIntrinsicContentSizeInvalidationEnabled:(BOOL)a3;
- (void)_setBackgroundViewConfiguration:(id)a3;
- (void)_setBackgroundViewConfigurationProvider:(id)a3;
- (void)_setConstants:(id)a3;
- (void)_setContentView:(id)a3 insertAtBack:(BOOL)a4;
- (void)_setContentViewConfiguration:(id)a3;
- (void)_setContentViewConfigurationProvider:(id)a3;
- (void)_setInsetsContentViewsToSafeArea:(BOOL)a3;
- (void)_setMarginWidth:(double)a3;
- (void)_setRightMarginWidth:(double)a3;
- (void)_setStripPadding:(BOOL)a3;
- (void)_setTableViewStyle:(int64_t)a3 updateFrame:(BOOL)a4;
- (void)_setTopHeader:(BOOL)a3;
- (void)_setupBackgroundView;
- (void)_setupChangeHandlersForNewContentView:(id)a3;
- (void)_setupDefaultsIfNecessary;
- (void)_setupLabelAppearance;
- (void)_setupLabelForSourceList:(id)a3;
- (void)_tableViewDidUpdateMarginWidth;
- (void)_updateBackgroundView;
- (void)_updateBackgroundViewConfigurationForState:(id)a3;
- (void)_updateConfigurationUsingState:(id)a3;
- (void)_updateConfigurationWithObservationTracking;
- (void)_updateContentAndBackgroundView;
- (void)_updateContentViewConfigurationForState:(id)a3;
- (void)_updateDefaultBackgroundAppearance;
- (void)_updateDetailLabelBackgroundColor;
- (void)_updateDetailLabelBackgroundColorIfNeeded;
- (void)_willUpdateFocusInContext:(id)a3;
- (void)didMoveToSuperview;
- (void)encodeWithCoder:(id)a3;
- (void)invalidateIntrinsicContentSize;
- (void)layoutMarginsDidChange;
- (void)layoutSubviews;
- (void)prepareForReuse;
- (void)setAutomaticallyUpdatesBackgroundConfiguration:(BOOL)automaticallyUpdatesBackgroundConfiguration;
- (void)setAutomaticallyUpdatesContentConfiguration:(BOOL)automaticallyUpdatesContentConfiguration;
- (void)setBackgroundColor:(id)a3;
- (void)setBackgroundConfiguration:(UIBackgroundConfiguration *)backgroundConfiguration;
- (void)setBackgroundImage:(id)a3;
- (void)setBackgroundView:(UIView *)backgroundView;
- (void)setConfigurationUpdateHandler:(UITableViewHeaderFooterViewConfigurationUpdateHandler)configurationUpdateHandler;
- (void)setContentConfiguration:(id)contentConfiguration;
- (void)setFloating:(BOOL)a3;
- (void)setFrame:(CGRect)a3;
- (void)setMaxTitleWidth:(double)a3;
- (void)setNeedsUpdateConfiguration;
- (void)setNeedsUpdateConstraints;
- (void)setReuseIdentifier:(id)a3;
- (void)setSectionHeader:(BOOL)a3;
- (void)setTable:(id)a3;
- (void)setTableView:(id)a3;
- (void)setTableViewStyle:(int64_t)a3;
- (void)setText:(id)a3;
- (void)setTextAlignment:(int64_t)a3;
- (void)setTintColor:(id)a3;
- (void)setTranslatesAutoresizingMaskIntoConstraints:(BOOL)a3;
- (void)setUserInteractionEnabled:(BOOL)a3;
- (void)traitCollectionDidChange:(id)a3;
@end

@implementation UITableViewHeaderFooterView

- (UICellConfigurationState)_configurationState
{
  v3 = [UIViewConfigurationState alloc];
  v4 = [(UIView *)self traitCollection];
  v5 = [(UIViewConfigurationState *)v3 initWithTraitCollection:v4];

  [(UIViewConfigurationState *)v5 setDisabled:[(UIView *)self isUserInteractionEnabled] ^ 1];
  [(UIViewConfigurationState *)v5 setFocused:[(UIView *)self isFocused]];
  [(UIViewConfigurationState *)v5 setPinned:(*(_DWORD *)&self->_headerFooterFlags >> 3) & 1];
  return (UICellConfigurationState *)v5;
}

- (void)didMoveToSuperview
{
  if ((*((unsigned char *)&self->_headerFooterFlags + 1) & 4) == 0) {
    objc_storeWeak((id *)&self->_table, 0);
  }
  v3.receiver = self;
  v3.super_class = (Class)UITableViewHeaderFooterView;
  [(UIView *)&v3 didMoveToSuperview];
}

- (void)traitCollectionDidChange:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)UITableViewHeaderFooterView;
  [(UIView *)&v4 traitCollectionDidChange:a3];
  if (!_UITraitUsageTrackingEnabled() || (dyld_program_sdk_at_least() & 1) == 0) {
    [(UITableViewHeaderFooterView *)self setNeedsUpdateConfiguration];
  }
}

- (void)layoutMarginsDidChange
{
  [(UIView *)self setNeedsLayout];
  if (+[UIView _isInAnimationBlockWithAnimationsEnabled])
  {
    int v3 = *((_DWORD *)&self->super._viewFlags + 4);
    *((_DWORD *)&self->super._viewFlags + 4) = v3 | 0x200;
    [(UIView *)self layoutBelowIfNeeded];
    if ((v3 & 0x200) == 0) {
      *((_DWORD *)&self->super._viewFlags + 4) &= ~0x200u;
    }
  }
}

void __52__UITableViewHeaderFooterView__setupLabelAppearance__block_invoke(uint64_t a1)
{
  v2 = *(void **)(a1 + 32);
  int v3 = (void *)v2[70];
  if (v3)
  {
    id v4 = v3;
  }
  else
  {
    v5 = [v2 traitCollection];
    _UITableConstantsForTraitCollection(v5);
    id v43 = (id)objc_claimAutoreleasedReturnValue();

    id v4 = v43;
  }
  id v44 = v4;
  uint64_t v6 = *(void *)(a1 + 32);
  if (*(void *)(v6 + 488))
  {
    v7 = [*(id *)(v6 + 488) font];
    [v7 pointSize];
    double v9 = v8;

    uint64_t v6 = *(void *)(a1 + 32);
    if (v9 == 0.0)
    {
      v10 = [(id)objc_opt_class() _defaultFontForHeaderFooterView:*(void *)(a1 + 32)];
      [*(id *)(*(void *)(a1 + 32) + 488) setFont:v10];

      [*(id *)(*(void *)(a1 + 32) + 488) setTextAlignment:*(void *)(*(void *)(a1 + 32) + 456)];
      int v11 = [v44 supportsUserInterfaceStyles];
      v12 = *(void **)(a1 + 32);
      if (v11)
      {
        v13 = (void *)v12[61];
        v14 = [v44 fallbackHeaderTextColorForTableViewStyle:v12[51] userInterfaceStyle:1];
        [v13 _setFallbackTextColor:v14 forUserInterfaceStyle:1];

        uint64_t v15 = *(void *)(a1 + 32);
        v16 = *(void **)(v15 + 488);
        v17 = [v44 fallbackHeaderTextColorForTableViewStyle:*(void *)(v15 + 408) userInterfaceStyle:2];
        [v16 _setFallbackTextColor:v17 forUserInterfaceStyle:2];

        uint64_t v18 = *(void *)(a1 + 32);
        v19 = *(void **)(v18 + 488);
        v20 = [v44 fallbackHeaderTextColorForTableViewStyle:*(void *)(v18 + 408) userInterfaceStyle:1000];
        [v19 _setFallbackTextColor:v20 forUserInterfaceStyle:1000];
      }
      else
      {
        v20 = [*(id *)(a1 + 32) _defaultTextColor];
        v21 = [v12 _accessibilityHigherContrastTintColorForColor:v20];
        [*(id *)(*(void *)(a1 + 32) + 488) setTextColor:v21];
      }
      [*(id *)(*(void *)(a1 + 32) + 488) setLineBreakMode:4];
      uint64_t v6 = *(void *)(a1 + 32);
      if (*(void *)(v6 + 408))
      {
        v22 = [(id)UIApp preferredContentSizeCategory];
        BOOL IsAccessibilityCategory = UIContentSizeCategoryIsAccessibilityCategory(v22);

        if (IsAccessibilityCategory)
        {
          LODWORD(v24) = 1055286886;
          [*(id *)(*(void *)(a1 + 32) + 488) _setHyphenationFactor:v24];
        }
        [*(id *)(*(void *)(a1 + 32) + 488) setNumberOfLines:0];
        uint64_t v6 = *(void *)(a1 + 32);
      }
    }
  }
  v25 = *(void **)(v6 + 496);
  if (v25)
  {
    v26 = [v25 font];
    [v26 pointSize];
    double v28 = v27;

    if (v28 == 0.0)
    {
      v29 = [(id)objc_opt_class() _defaultFontForHeaderFooterView:*(void *)(a1 + 32)];
      [*(id *)(*(void *)(a1 + 32) + 496) setFont:v29];

      int v30 = [v44 supportsUserInterfaceStyles];
      v31 = *(void **)(a1 + 32);
      if (v30)
      {
        v32 = (void *)v31[62];
        v33 = [v44 fallbackHeaderTextColorForTableViewStyle:v31[51] userInterfaceStyle:1];
        [v32 _setFallbackTextColor:v33 forUserInterfaceStyle:1];

        uint64_t v34 = *(void *)(a1 + 32);
        v35 = *(void **)(v34 + 496);
        v36 = [v44 fallbackHeaderTextColorForTableViewStyle:*(void *)(v34 + 408) userInterfaceStyle:2];
        [v35 _setFallbackTextColor:v36 forUserInterfaceStyle:2];

        uint64_t v37 = *(void *)(a1 + 32);
        v38 = *(void **)(v37 + 496);
        v39 = [v44 fallbackHeaderTextColorForTableViewStyle:*(void *)(v37 + 408) userInterfaceStyle:1000];
        [v38 _setFallbackTextColor:v39 forUserInterfaceStyle:1000];
      }
      else
      {
        v39 = [(id)objc_opt_class() _defaultTextColorForTableViewStyle:*(void *)(*(void *)(a1 + 32) + 408) isSectionHeader:*(_DWORD *)(*(void *)(a1 + 32) + 568) & 1];
        v40 = [v31 _accessibilityHigherContrastTintColorForColor:v39];
        [*(id *)(*(void *)(a1 + 32) + 496) setTextColor:v40];
      }
      uint64_t v41 = *(void *)(a1 + 32);
      uint64_t v42 = *(void *)(v41 + 408);
      [*(id *)(v41 + 496) setLineBreakMode:4];
      if (v42) {
        [*(id *)(*(void *)(a1 + 32) + 496) setNumberOfLines:0];
      }
    }
  }
}

uint64_t __65__UITableViewHeaderFooterView__updateDefaultBackgroundAppearance__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) setBackgroundConfiguration:*(void *)(a1 + 40)];
}

- (void)setBackgroundConfiguration:(UIBackgroundConfiguration *)backgroundConfiguration
{
  $459C830AD401FFB60020A0C1FEE757B7 headerFooterFlags = self->_headerFooterFlags;
  int v4 = (*(unsigned int *)&headerFooterFlags >> 13) & 1;
  if (backgroundConfiguration) {
    int v4 = 1;
  }
  if (v4) {
    int v5 = 0x2000;
  }
  else {
    int v5 = 0;
  }
  self->_$459C830AD401FFB60020A0C1FEE757B7 headerFooterFlags = ($459C830AD401FFB60020A0C1FEE757B7)(v5 | *(_DWORD *)&headerFooterFlags & 0xFFFFDFFF);
  -[UITableViewHeaderFooterView _applyBackgroundViewConfiguration:withState:](self, "_applyBackgroundViewConfiguration:withState:");
}

- (BOOL)_hostsLayoutEngineAllowsTAMIC_NO
{
  return 0;
}

- (UIEdgeInsets)_concreteDefaultLayoutMargins
{
  v8.receiver = self;
  v8.super_class = (Class)UITableViewHeaderFooterView;
  [(UIView *)&v8 _concreteDefaultLayoutMargins];
  double v4 = _UITableViewHeaderFooterViewConcreteDefaultLayoutMargins(self, 0, v3);
  result.right = v7;
  result.bottom = v6;
  result.left = v5;
  result.top = v4;
  return result;
}

- (int64_t)tableViewStyle
{
  return self->_tableViewStyle;
}

- (CGRect)_contentRectForWidth:(double)a3
{
  -[UITableViewHeaderFooterView _backgroundRectForWidth:](self, "_backgroundRectForWidth:");
  double v62 = v5;
  double v63 = v4;
  double v64 = v6;
  CGFloat v50 = v7;
  [(UITableViewHeaderFooterView *)self _effectiveSafeAreaInsets];
  double v55 = v9;
  double v58 = v8;
  [(UIView *)self bounds];
  CGFloat v60 = v10;
  CGFloat v61 = v11;
  CGFloat v66 = v12;
  v13 = [(UITableViewHeaderFooterView *)self _table];
  [v13 _sectionContentInset];
  double v15 = v14;
  double v17 = v16;
  BOOL v18 = [(UIView *)self _shouldReverseLayoutDirection];
  [v13 _indexBarExtentFromEdge];
  double v20 = fmax(v15, v19);
  double v21 = fmax(v17, v19);
  if (v18) {
    double v21 = v17;
  }
  else {
    double v20 = v15;
  }
  double v51 = v20;
  double v53 = v21;
  v22 = [v13 _scrollView];
  [v22 bounds];
  CGFloat v24 = v23;
  CGFloat v26 = v25;
  CGFloat v28 = v27;
  CGFloat v30 = v29;
  [(UIView *)self frame];
  CGFloat y = v67.origin.y;
  CGFloat width = v67.size.width;
  CGFloat rect = v67.size.height;
  CGFloat x = v67.origin.x;
  double MinX = CGRectGetMinX(v67);
  v68.origin.CGFloat x = v24;
  v68.origin.CGFloat y = v26;
  v68.size.CGFloat width = v28;
  v68.size.CGFloat height = v30;
  double v52 = fmax(v51 - fmax(MinX - CGRectGetMinX(v68), 0.0), 0.0);
  v69.origin.CGFloat x = v24;
  v69.origin.CGFloat y = v26;
  v69.size.CGFloat width = v28;
  v69.size.CGFloat height = v30;
  double MaxX = CGRectGetMaxX(v69);
  v70.origin.CGFloat x = x;
  v70.origin.CGFloat y = y;
  v70.size.CGFloat width = width;
  v70.size.CGFloat height = rect;
  double v36 = fmax(v53 - fmax(MaxX - CGRectGetMaxX(v70), 0.0), 0.0);

  double v54 = fmax(v58, v52);
  double v59 = fmax(v55, v36);
  v71.origin.CGFloat x = v63;
  v71.origin.CGFloat y = v62;
  v71.size.CGFloat width = v64;
  v71.size.CGFloat height = v50;
  double v56 = CGRectGetMinX(v71);
  v72.origin.CGFloat x = v60;
  v72.origin.CGFloat y = v66;
  v72.size.CGFloat width = a3;
  v72.size.CGFloat height = v61;
  double v57 = fmax(v54 - fmax(v56 - CGRectGetMinX(v72), 0.0), 0.0);
  v73.origin.CGFloat x = v60;
  v73.origin.CGFloat y = v66;
  v73.size.CGFloat width = a3;
  v73.size.CGFloat height = v61;
  double v37 = CGRectGetMaxX(v73);
  v74.origin.CGFloat x = v63;
  v74.origin.CGFloat y = v62;
  v74.size.CGFloat width = v64;
  v74.size.CGFloat height = v50;
  double v38 = v37 - CGRectGetMaxX(v74);
  double v39 = a3;
  v78.size.CGFloat height = v61;
  double v40 = fmax(v59 - fmax(v38, 0.0), 0.0);
  v75.origin.CGFloat x = v63 + v57;
  v75.origin.CGFloat y = v62 + 0.0;
  v75.size.CGFloat width = v64 - (v57 + v40);
  v75.size.CGFloat height = v50;
  v78.origin.CGFloat x = v60;
  v78.origin.CGFloat y = v66;
  v78.size.CGFloat width = a3;
  CGRect v76 = CGRectIntersection(v75, v78);
  CGFloat v41 = v76.origin.x;
  CGFloat v42 = v76.origin.y;
  CGFloat v43 = v76.size.width;
  CGFloat height = v76.size.height;
  if (CGRectIsNull(v76))
  {
    CGFloat height = v61;
    CGFloat v42 = v66;
    CGFloat v41 = v60;
  }
  else
  {
    double v39 = v43;
  }

  double v45 = v41;
  double v46 = v42;
  double v47 = v39;
  double v48 = height;
  result.size.CGFloat height = v48;
  result.size.CGFloat width = v47;
  result.origin.CGFloat y = v46;
  result.origin.CGFloat x = v45;
  return result;
}

- (id)_table
{
  p_table = &self->_table;
  WeakRetained = objc_loadWeakRetained((id *)&self->_table);
  if (!WeakRetained)
  {
    uint64_t v5 = objc_opt_class();
    WeakRetained = _UIFallbackViewOfClassForReusableView(v5, self);
    if (WeakRetained) {
      objc_storeWeak((id *)p_table, WeakRetained);
    }
  }
  id v6 = WeakRetained;

  return v6;
}

- (CGRect)_backgroundRectForWidth:(double)a3
{
  [(UIView *)self bounds];
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;
  if ((dyld_program_sdk_at_least() & 1) == 0)
  {
    [(UITableViewHeaderFooterView *)self _rightMarginWidth];
    a3 = a3 - v11;
  }
  double v12 = v6;
  double v13 = v8;
  double v14 = a3;
  double v15 = v10;
  result.size.CGFloat height = v15;
  result.size.CGFloat width = v14;
  result.origin.CGFloat y = v13;
  result.origin.CGFloat x = v12;
  return result;
}

- (UIEdgeInsets)_effectiveSafeAreaInsets
{
  BOOL v3 = [(UITableViewHeaderFooterView *)self _insetsContentViewsToSafeArea];
  double v4 = 0.0;
  double v5 = 0.0;
  double v6 = 0.0;
  double v7 = 0.0;
  if (v3)
  {
    double v8 = [(UIView *)self superview];

    if (v8)
    {
      [(UIView *)self safeAreaInsets];
      double v6 = v9;
      double v5 = v10;
      double v4 = v11;
    }
    else
    {
      double v12 = [(UITableViewHeaderFooterView *)self _table];
      double v13 = [v12 _scrollView];
      [v13 safeAreaInsets];
      double v6 = v14 + 0.0;
      double v4 = v15 + 0.0;

      double v7 = 0.0;
    }
  }
  double v16 = v6;
  double v17 = v5;
  double v18 = v4;
  result.right = v18;
  result.bottom = v17;
  result.left = v16;
  result.top = v7;
  return result;
}

- (BOOL)_insetsContentViewsToSafeArea
{
  return *((unsigned char *)&self->_headerFooterFlags + 1) & 1;
}

- (CGRect)_contentRect
{
  [(UIView *)self bounds];
  double Width = CGRectGetWidth(v9);
  [(UITableViewHeaderFooterView *)self _contentRectForWidth:Width];
  result.size.CGFloat height = v7;
  result.size.CGFloat width = v6;
  result.origin.CGFloat y = v5;
  result.origin.CGFloat x = v4;
  return result;
}

- (UITableConstants)_constants
{
  return self->_constants;
}

+ (double)defaultFooterHeightForStyle:(int64_t)a3
{
  if (a3) {
    return 17.5;
  }
  int v4 = dyld_program_sdk_at_least();
  double result = 23.0;
  if (v4)
  {
    double v5 = [(id)objc_opt_class() _defaultPlainHeaderFooterFont];
    [v5 _scaledValueForValue:28.0];
    double v7 = v6;

    return v7;
  }
  return result;
}

- (void)setFrame:(CGRect)a3
{
  self->_frame = a3;
  v4.receiver = self;
  v4.super_class = (Class)UITableViewHeaderFooterView;
  -[UIView setFrame:](&v4, sel_setFrame_);
  if (qword_1EB25B210 != -1) {
    dispatch_once(&qword_1EB25B210, &__block_literal_global_538);
  }
  if (_MergedGlobals_35_0 == 1) {
    [(UIView *)self layoutBelowIfNeeded];
  }
}

- (void)_intrinsicContentSizeInvalidatedForChildView:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)UITableViewHeaderFooterView;
  objc_super v4 = (UIView *)a3;
  [(UIView *)&v6 _intrinsicContentSizeInvalidatedForChildView:v4];
  contentView = self->_contentView;

  if (contentView == v4) {
    [(UITableViewHeaderFooterView *)self invalidateIntrinsicContentSize];
  }
}

- (void)invalidateIntrinsicContentSize
{
  BOOL v3 = [(UITableViewHeaderFooterView *)self _table];
  objc_super v4 = v3;
  if (v3)
  {
    [v3 _headerFooterDidInvalidateIntrinsicContentSize:self];
  }
  else
  {
    v5.receiver = self;
    v5.super_class = (Class)UITableViewHeaderFooterView;
    [(UIView *)&v5 invalidateIntrinsicContentSize];
  }
}

void __56__UITableViewHeaderFooterView__setupDefaultsIfNecessary__block_invoke(uint64_t a1)
{
  id v9 = [(id)objc_opt_class() _defaultFontForHeaderFooterView:*(void *)(a1 + 32)];
  [*(id *)(*(void *)(a1 + 32) + 488) setFont:v9];
  [*(id *)(*(void *)(a1 + 32) + 496) setFont:v9];
  v2 = *(void **)(a1 + 32);
  unint64_t v3 = v2[51];
  BOOL v4 = v3 > 0x10;
  uint64_t v5 = (1 << v3) & 0x10006;
  if (!v4 && v5 != 0) {
    goto LABEL_5;
  }
  if ([*(id *)(a1 + 32) _isSourceListOrMacIdiom])
  {
    v2 = *(void **)(a1 + 32);
LABEL_5:
    double v7 = [v2 _defaultTextColor];
    double v8 = [v2 _accessibilityHigherContrastTintColorForColor:v7];

    [*(id *)(*(void *)(a1 + 32) + 488) setTextColor:v8];
    [*(id *)(*(void *)(a1 + 32) + 496) setTextColor:v8];
  }
}

- (id)_defaultTextColor
{
  if ([(UITableViewHeaderFooterView *)self _isSourceListOrMacIdiom])
  {
    $459C830AD401FFB60020A0C1FEE757B7 headerFooterFlags = self->_headerFooterFlags;
    constants = self->_constants;
    int64_t tableViewStyle = self->_tableViewStyle;
    BOOL v6 = [(UIView *)self isFocused];
    if (*(unsigned char *)&headerFooterFlags) {
      [(UITableConstants *)constants defaultHeaderTextColorForTableViewStyle:tableViewStyle focused:v6];
    }
    else {
    double v7 = [(UITableConstants *)constants defaultFooterTextColorForTableViewStyle:tableViewStyle focused:v6];
    }
  }
  else
  {
    double v7 = [(id)objc_opt_class() _defaultTextColorForTableViewStyle:self->_tableViewStyle isSectionHeader:*(_DWORD *)&self->_headerFooterFlags & 1];
  }
  return v7;
}

- (void)setFloating:(BOOL)a3
{
  if (((((*(unsigned char *)&self->_headerFooterFlags & 8) == 0) ^ a3) & 1) == 0)
  {
    BOOL v3 = a3;
    [(UITableViewHeaderFooterView *)self _prepareForConfigurationStateUpdate];
    if (v3) {
      int v5 = 8;
    }
    else {
      int v5 = 0;
    }
    self->_$459C830AD401FFB60020A0C1FEE757B7 headerFooterFlags = ($459C830AD401FFB60020A0C1FEE757B7)(*(_DWORD *)&self->_headerFooterFlags & 0xFFFFFFF7 | v5);
    if ((dyld_program_sdk_at_least() & 1) == 0) {
      [(UIView *)self setOpaque:(*(_DWORD *)&self->_headerFooterFlags & 8) == 0];
    }
    [(UITableViewHeaderFooterView *)self setNeedsUpdateConfiguration];
  }
}

- (void)setTextAlignment:(int64_t)a3
{
  if (self->_textAlignment != a3)
  {
    self->_textAlignment = a3;
    -[UILabel setTextAlignment:](self->_label, "setTextAlignment:");
  }
}

- (void)setMaxTitleWidth:(double)a3
{
  self->_maxTitledouble Width = a3;
}

- (void)_setupLabelAppearance
{
  v2[0] = MEMORY[0x1E4F143A8];
  v2[1] = 3221225472;
  v2[2] = __52__UITableViewHeaderFooterView__setupLabelAppearance__block_invoke;
  v2[3] = &unk_1E52D9F70;
  v2[4] = self;
  +[UIView _performSystemAppearanceModifications:v2];
}

- (void)setSectionHeader:(BOOL)a3
{
  BOOL v3 = a3;
  $459C830AD401FFB60020A0C1FEE757B7 headerFooterFlags = self->_headerFooterFlags;
  self->_$459C830AD401FFB60020A0C1FEE757B7 headerFooterFlags = ($459C830AD401FFB60020A0C1FEE757B7)(*(_DWORD *)&headerFooterFlags & 0xFFFFFFFE | a3);
  if ((dyld_program_sdk_at_least() & 1) != 0 || ((((*(unsigned char *)&headerFooterFlags & 1) == 0) ^ v3) & 1) == 0)
  {
    *(_DWORD *)&self->_headerFooterFlags |= 0x40u;
    [(UITableViewHeaderFooterView *)self _setupDefaultsIfNecessary];
  }
}

- (void)_setRightMarginWidth:(double)a3
{
  if (self->_trailingMarginWidth != a3)
  {
    self->_trailingMargindouble Width = a3;
    [(UIView *)self setNeedsLayout];
  }
}

- (void)_setMarginWidth:(double)a3
{
  if (self->_leadingMarginWidth != a3)
  {
    self->_leadingMargindouble Width = a3;
    [(UIView *)self setNeedsLayout];
  }
}

- (void)_setInsetsContentViewsToSafeArea:(BOOL)a3
{
  if (((((*(_DWORD *)&self->_headerFooterFlags & 0x100) == 0) ^ a3) & 1) == 0)
  {
    if (a3) {
      int v3 = 256;
    }
    else {
      int v3 = 0;
    }
    self->_$459C830AD401FFB60020A0C1FEE757B7 headerFooterFlags = ($459C830AD401FFB60020A0C1FEE757B7)(*(_DWORD *)&self->_headerFooterFlags & 0xFFFFFEFF | v3);
    [(UIView *)self setNeedsLayout];
  }
}

- (void)setTableViewStyle:(int64_t)a3
{
}

- (void)setTableView:(id)a3
{
  self->_$459C830AD401FFB60020A0C1FEE757B7 headerFooterFlags = ($459C830AD401FFB60020A0C1FEE757B7)(*(_DWORD *)&self->_headerFooterFlags & 0xFFFFFBFF | ((a3 != 0) << 10));
  objc_storeWeak((id *)&self->_table, a3);
}

- (void)_setTableViewStyle:(int64_t)a3 updateFrame:(BOOL)a4
{
  if (self->_tableViewStyle == a3)
  {
    if (self->_systemBackgroundView) {
      return;
    }
  }
  else
  {
    BOOL v6 = a4;
    int64_t v7 = -[UITableViewHeaderFooterView _contentViewListStyleFromTableViewStyle:](self, "_contentViewListStyleFromTableViewStyle:");
    self->_int64_t tableViewStyle = a3;
    if (![(UITableViewHeaderFooterView *)self _usingBackgroundConfigurationOrDefaultBackgroundConfiguration])[(UITableViewHeaderFooterView *)self _setupBackgroundView]; {
    [(UITableViewHeaderFooterView *)self _updateBackgroundView];
    }
    [(UITableViewHeaderFooterView *)self _invalidateDetailLabelBackgroundColor];
    int64_t v8 = [(UITableViewHeaderFooterView *)self _contentViewListStyleFromTableViewStyle:a3];
    if (v7 != v8)
    {
      int64_t v9 = v8;
      if (objc_opt_respondsToSelector()) {
        [(UIView *)self->_contentView _containingListStyleUpdated:v9];
      }
    }
    if (v6) {
      -[UITableViewHeaderFooterView setFrame:](self, "setFrame:", self->_frame.origin.x, self->_frame.origin.y, self->_frame.size.width, self->_frame.size.height);
    }
  }
  [(UITableViewHeaderFooterView *)self _updateDefaultBackgroundAppearance];
}

- (void)_setConstants:(id)a3
{
  p_constants = (id *)&self->_constants;
  id v6 = *p_constants;
  objc_storeStrong(p_constants, a3);
  if ([(UITableViewHeaderFooterView *)self _isSourceListOrMacIdiom]) {
    *(_DWORD *)&self->_headerFooterFlags &= ~0x80u;
  }
  if (dyld_program_sdk_at_least()
    && ![(UITableViewHeaderFooterView *)self _usingBackgroundConfigurationOrDefaultBackgroundConfiguration])
  {
    [(UITableViewHeaderFooterView *)self _setupBackgroundView];
  }
  [(UITableViewHeaderFooterView *)self _setupDefaultsIfNecessary];
  if (v6 != a3) {
    [(UITableViewHeaderFooterView *)self _updateDefaultBackgroundAppearance];
  }
  [(UIView *)self setNeedsLayout];
}

- (void)_setupDefaultsIfNecessary
{
  if ((*(unsigned char *)&self->_headerFooterFlags & 0x80) == 0)
  {
    if (self->_constants)
    {
      int v3 = [(UITableViewHeaderFooterView *)self _table];
      if (v3)
      {
        $459C830AD401FFB60020A0C1FEE757B7 headerFooterFlags = self->_headerFooterFlags;

        if ((*(unsigned char *)&headerFooterFlags & 0x40) != 0)
        {
          *(_DWORD *)&self->_headerFooterFlags |= 0x80u;
          v5[0] = MEMORY[0x1E4F143A8];
          v5[1] = 3221225472;
          v5[2] = __56__UITableViewHeaderFooterView__setupDefaultsIfNecessary__block_invoke;
          v5[3] = &unk_1E52D9F70;
          v5[4] = self;
          +[UIView _performSystemAppearanceModifications:v5];
        }
      }
    }
  }
}

- (BOOL)_isSourceListOrMacIdiom
{
  v2 = [(UIView *)self traitCollection];
  uint64_t v3 = [v2 userInterfaceIdiom];

  return v3 == 5;
}

- (BOOL)_usingBackgroundConfigurationOrDefaultBackgroundConfiguration
{
  int v3 = dyld_program_sdk_at_least();
  if (v3) {
    LOBYTE(v3) = [(UITableViewHeaderFooterView *)self _usingBackgroundViewConfiguration]|| (*(_DWORD *)&self->_headerFooterFlags & 0x3000) == 0&& (*(_DWORD *)&self->_headerFooterFlags & 0x800) == 0;
  }
  return v3;
}

- (BOOL)_usingBackgroundViewConfiguration
{
  return self->_systemBackgroundView || self->_backgroundViewConfigurationProvider != 0;
}

- (void)_setAutomaticIntrinsicContentSizeInvalidationEnabled:(BOOL)a3
{
  if (a3) {
    int v3 = 0x40000;
  }
  else {
    int v3 = 0;
  }
  self->_$459C830AD401FFB60020A0C1FEE757B7 headerFooterFlags = ($459C830AD401FFB60020A0C1FEE757B7)(*(_DWORD *)&self->_headerFooterFlags & 0xFFFBFFFF | v3);
  contentView = self->_contentView;
  if (contentView)
  {
    p_viewFlags = &contentView->_viewFlags;
    uint64_t v6 = 512;
    if (!a3 || (*(void *)p_viewFlags & 0x20000000000000) != 0) {
      uint64_t v6 = 0;
    }
    *((void *)p_viewFlags + 1) = v6 | *((void *)p_viewFlags + 1) & 0xFFFFFFFFFFFFFDFFLL;
  }
}

- (int64_t)_contentViewListStyleFromTableViewStyle:(int64_t)a3
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  unint64_t v3 = a3 & ~(a3 >> 63);
  if (v3 >= 3)
  {
    if (os_variant_has_internal_diagnostics())
    {
      uint64_t v6 = __UIFaultDebugAssertLog();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_FAULT))
      {
        int v7 = 134217984;
        unint64_t v8 = v3;
        _os_log_fault_impl(&dword_1853B0000, v6, OS_LOG_TYPE_FAULT, "Unhandled UITableViewStyle (%ld)", (uint8_t *)&v7, 0xCu);
      }
    }
    else
    {
      BOOL v4 = *(NSObject **)(__UILogGetCategoryCachedImpl("Assert", &_contentViewListStyleFromTableViewStyle____s_category_0)+ 8);
      if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
      {
        int v7 = 134217984;
        unint64_t v8 = v3;
        _os_log_impl(&dword_1853B0000, v4, OS_LOG_TYPE_ERROR, "Unhandled UITableViewStyle (%ld)", (uint8_t *)&v7, 0xCu);
      }
    }
    return -1;
  }
  return v3;
}

- (void)_updateDefaultBackgroundAppearance
{
  if (dyld_program_sdk_at_least())
  {
    if ((*((unsigned char *)&self->_headerFooterFlags + 1) & 0x38) == 0)
    {
      unint64_t v3 = [(UITableViewHeaderFooterView *)self _defaultBackgroundConfiguration];
      v5[0] = MEMORY[0x1E4F143A8];
      v5[1] = 3221225472;
      v5[2] = __65__UITableViewHeaderFooterView__updateDefaultBackgroundAppearance__block_invoke;
      v5[3] = &unk_1E52D9F98;
      v5[4] = self;
      id v6 = v3;
      id v4 = v3;
      +[UIView _performSystemAppearanceModifications:v5];
      *(_DWORD *)&self->_headerFooterFlags &= ~0x2000u;
    }
  }
}

- (id)_defaultBackgroundConfiguration
{
  unint64_t v3 = [(UITableViewHeaderFooterView *)self _customViewForDefaultBackgroundAppearance];
  if (v3)
  {
    id v4 = +[UIBackgroundConfiguration clearConfiguration];
    [v4 setCustomView:v3];
  }
  else
  {
    int64_t tableViewStyle = self->_tableViewStyle;
    if (tableViewStyle == 2)
    {
      uint64_t v6 = +[UIBackgroundConfiguration _listInsetGroupedHeaderFooterConfiguration];
    }
    else
    {
      if (tableViewStyle) {
        +[UIBackgroundConfiguration listGroupedHeaderFooterConfiguration];
      }
      else {
      uint64_t v6 = +[UIBackgroundConfiguration listPlainHeaderFooterConfiguration];
      }
    }
    id v4 = (void *)v6;
    if ([(UITableViewHeaderFooterView *)self _tintColorAffectsBackgroundColor])
    {
      uint64_t v7 = [(UIView *)self _interactionTintColor];
      if (v7)
      {
        unint64_t v8 = (void *)v7;
        [v4 setBackgroundColor:v7];
      }
    }
  }

  return v4;
}

- (BOOL)_tintColorAffectsBackgroundColor
{
  return self->_tableViewStyle == 0;
}

- (id)_customViewForDefaultBackgroundAppearance
{
  if (!self->_contentView
    || (objc_opt_respondsToSelector() & 1) == 0
    || ([(UIView *)self->_contentView _containerBackgroundView],
        (unint64_t v3 = (objc_class *)objc_claimAutoreleasedReturnValue()) == 0))
  {
    if (!self->_constants
      || ![(UITableViewHeaderFooterView *)self _isSourceListOrMacIdiom]
      || (objc_opt_respondsToSelector() & 1) == 0)
    {
      goto LABEL_10;
    }
    unint64_t v3 = (objc_class *)[(UITableConstants *)self->_constants defaultHeaderFooterBackgroundViewClassForTableViewStyle:self->_tableViewStyle];
    if (!v3) {
      goto LABEL_11;
    }
    id v4 = v3;
    if ([(objc_class *)v3 isSubclassOfClass:objc_opt_class()])
    {
      id v5 = [v4 alloc];
      unint64_t v3 = (objc_class *)objc_msgSend(v5, "initWithFrame:", *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
    }
    else
    {
LABEL_10:
      unint64_t v3 = 0;
    }
  }
LABEL_11:
  return v3;
}

- (void)layoutSubviews
{
  v21.receiver = self;
  v21.super_class = (Class)UITableViewHeaderFooterView;
  [(UIView *)&v21 layoutSubviews];
  [(UITableViewHeaderFooterView *)self _performConfigurationStateUpdate];
  [(UITableViewHeaderFooterView *)self _layoutSystemBackgroundView];
  [(UITableViewHeaderFooterView *)self _updateContentAndBackgroundView];
  [(UITableViewHeaderFooterView *)self _updateBackgroundView];
  [(UITableViewHeaderFooterView *)self _setupLabelAppearance];
  BOOL v3 = +[UIView areAnimationsEnabled];
  label = self->_label;
  if (label)
  {
    id v5 = [(UIView *)label superview];
    contentView = self->_contentView;

    if (v5 != contentView)
    {
      +[UIView setAnimationsEnabled:0];
      [(UIView *)self->_contentView addSubview:self->_label];
    }
    [(UITableViewHeaderFooterView *)self _labelFrame];
    -[UILabel setFrame:](self->_label, "setFrame:");
    +[UIView setAnimationsEnabled:v3];
  }
  detailLabel = self->_detailLabel;
  if (detailLabel)
  {
    unint64_t v8 = [(UIView *)detailLabel superview];
    uint64_t v9 = self->_contentView;

    if (v8 != v9)
    {
      +[UIView setAnimationsEnabled:0];
      [(UIView *)self->_contentView addSubview:self->_detailLabel];
    }
    [(UITableViewHeaderFooterView *)self _detailLabelFrame];
    double v11 = v10;
    double v13 = v12;
    double v15 = v14;
    double v17 = v16;
    [(UIView *)self->_detailLabel frame];
    if (v15 != v19 || v17 != v18) {
      [(UITableViewHeaderFooterView *)self _invalidateDetailLabelBackgroundColor];
    }
    -[UILabel setFrame:](self->_detailLabel, "setFrame:", v11, v13, v15, v17);
    [(UITableViewHeaderFooterView *)self _updateDetailLabelBackgroundColorIfNeeded];
    +[UIView setAnimationsEnabled:v3];
  }
}

- (CGSize)systemLayoutSizeFittingSize:(CGSize)a3 withHorizontalFittingPriority:(float)a4 verticalFittingPriority:(float)a5
{
  double height = a3.height;
  double width = a3.width;
  [(UITableViewHeaderFooterView *)self _performConfigurationStateUpdate];
  [(UITableViewHeaderFooterView *)self _contentRectForWidth:width];
  CGFloat v11 = v10;
  CGFloat v13 = v12;
  double v15 = v14;
  CGFloat v17 = v16;
  -[UIView setFrame:](self->_contentView, "setFrame:");
  if ((*((unsigned char *)&self->_headerFooterFlags + 1) & 0x80) != 0
    && [(UIView *)self->_contentView translatesAutoresizingMaskIntoConstraints])
  {
    if (a5 >= 1000.0) {
      double v20 = height;
    }
    else {
      double v20 = 1.79769313e308;
    }
    *(float *)&double v18 = a4;
    *(float *)&double v19 = a5;
    -[UIView systemLayoutSizeFittingSize:withHorizontalFittingPriority:verticalFittingPriority:](self->_contentView, "systemLayoutSizeFittingSize:withHorizontalFittingPriority:verticalFittingPriority:", v15, v20, v18, v19);
    double v22 = v21;
    double v24 = v23;
    double v25 = self->_contentView;
    if (a4 != 1000.0 && v22 > 2777777.0 || a5 != 1000.0 && v24 > 2777777.0)
    {
      double v37 = [MEMORY[0x1E4F28B00] currentHandler];
      double v38 = objc_msgSend(NSString, "stringWithUTF8String:", "void _UIContentViewAssertValidFittingSize(UIView * _Nonnull __strong, CGSize, UILayoutPriority, UILayoutPriority)");
      v44.double width = v22;
      v44.double height = v24;
      double v39 = NSStringFromCGSize(v44);
      [v37 handleFailureInFunction:v38, @"_UIContentViewShared.h", 66, @"Content view returned an invalid size %@ from -systemLayoutSizeFittingSize:withHorizontalFittingPriority:verticalFittingPriority: which is not allowed. If you have implemented a custom content view, you need to add constraints inside it so that its size is not ambiguous, or you need to manually compute and return a valid size. Content view: %@", v39, v25 file lineNumber description];
    }
    if (a4 >= 1000.0) {
      double v26 = width;
    }
    else {
      double v26 = v22;
    }
    if (a5 >= 1000.0) {
      double v27 = height;
    }
    else {
      double v27 = v24;
    }
    goto LABEL_27;
  }
  if (!-[UIView _wantsAutolayoutOrIsGuardingForEngineHosting]((uint64_t)self->_contentView))
  {
    v40[0] = self;
    v40[1] = UITableViewHeaderFooterView;
    double v36 = (objc_super *)v40;
LABEL_25:
    *(float *)&double v28 = a4;
    *(float *)&double v29 = a5;
    -[objc_super systemLayoutSizeFittingSize:withHorizontalFittingPriority:verticalFittingPriority:](v36, sel_systemLayoutSizeFittingSize_withHorizontalFittingPriority_verticalFittingPriority_, width, height, v28, v29);
    goto LABEL_27;
  }
  CGFloat v30 = [(UIView *)self->_contentView subviews];
  uint64_t v31 = [v30 count];

  if (!v31)
  {
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __113__UITableViewHeaderFooterView_systemLayoutSizeFittingSize_withHorizontalFittingPriority_verticalFittingPriority___block_invoke;
    block[3] = &unk_1E52D9F70;
    block[4] = self;
    if (systemLayoutSizeFittingSize_withHorizontalFittingPriority_verticalFittingPriority__once_0 != -1) {
      dispatch_once(&systemLayoutSizeFittingSize_withHorizontalFittingPriority_verticalFittingPriority__once_0, block);
    }
    v41.receiver = self;
    v41.super_class = (Class)UITableViewHeaderFooterView;
    double v36 = &v41;
    goto LABEL_25;
  }
  contentView = self->_contentView;
  v46.origin.CGFloat x = v11;
  v46.origin.CGFloat y = v13;
  v46.size.double width = v15;
  v46.size.double height = v17;
  double v33 = CGRectGetWidth(v46);
  *(float *)&double v34 = a4;
  *(float *)&double v35 = a5;
  -[UIView systemLayoutSizeFittingSize:withHorizontalFittingPriority:verticalFittingPriority:](contentView, "systemLayoutSizeFittingSize:withHorizontalFittingPriority:verticalFittingPriority:", v33, height, v34, v35);
LABEL_27:
  result.double height = v27;
  result.double width = v26;
  return result;
}

- (void)_performConfigurationStateUpdate
{
  $459C830AD401FFB60020A0C1FEE757B7 headerFooterFlags = self->_headerFooterFlags;
  if ((*(_WORD *)&headerFooterFlags & 0x4000) != 0)
  {
    self->_$459C830AD401FFB60020A0C1FEE757B7 headerFooterFlags = ($459C830AD401FFB60020A0C1FEE757B7)(*(_DWORD *)&headerFooterFlags & 0xFFFFBFFF);
    if (_UIObservationTrackingEnabled())
    {
      [(UITableViewHeaderFooterView *)self _updateConfigurationWithObservationTracking];
    }
    else
    {
      -[UITableViewHeaderFooterView _executeConfigurationUpdate](self);
    }
  }
}

- (void)_updateBackgroundView
{
  if (self->_backgroundView)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      if ([(UITableViewHeaderFooterView *)self _tintColorAffectsBackgroundColor])
      {
        id v8 = [(UIView *)self _interactionTintColor];
        BOOL v3 = self->_backgroundView;
        id v4 = v3;
        if (v8)
        {
          [(UIView *)v3 setBackgroundColor:v8];
          [v4 applyBackgroundConfiguration:0];
        }
        else
        {
          [(UIView *)v3 setBackgroundColor:0];
          id v5 = [(UITableViewHeaderFooterView *)self _defaultBackgroundConfiguration];
          uint64_t v6 = [(UITableViewHeaderFooterView *)self configurationState];
          uint64_t v7 = [v5 updatedConfigurationForState:v6];

          [v4 applyBackgroundConfiguration:v7];
          id v4 = (void *)v7;
        }
      }
    }
  }
}

- (void)_updateContentAndBackgroundView
{
  [(UITableViewHeaderFooterView *)self _backgroundRect];
  -[UIView setFrame:](self->_backgroundView, "setFrame:");
  [(UITableViewHeaderFooterView *)self _contentRect];
  contentView = self->_contentView;
  -[UIView setFrame:](contentView, "setFrame:");
}

- (void)_layoutSystemBackgroundView
{
  systemBackgroundView = self->_systemBackgroundView;
  if (systemBackgroundView)
  {
    [(_UISystemBackgroundView *)systemBackgroundView frameInContainerView:self];
    -[_UISystemBackgroundView setFrame:](self->_systemBackgroundView, "setFrame:");
    if (+[UIView _isInAnimationBlockWithAnimationsEnabled])
    {
      id v4 = self->_systemBackgroundView;
      [(UIView *)v4 layoutIfNeeded];
    }
  }
}

- (CGRect)_backgroundRect
{
  [(UIView *)self bounds];
  double Width = CGRectGetWidth(v9);
  [(UITableViewHeaderFooterView *)self _backgroundRectForWidth:Width];
  result.size.double height = v7;
  result.size.double width = v6;
  result.origin.CGFloat y = v5;
  result.origin.CGFloat x = v4;
  return result;
}

- (void)_setTopHeader:(BOOL)a3
{
  if (a3) {
    int v3 = 32;
  }
  else {
    int v3 = 0;
  }
  self->_$459C830AD401FFB60020A0C1FEE757B7 headerFooterFlags = ($459C830AD401FFB60020A0C1FEE757B7)(*(_DWORD *)&self->_headerFooterFlags & 0xFFFFFFDF | v3);
}

- (void)_setStripPadding:(BOOL)a3
{
  if (a3) {
    int v3 = 16;
  }
  else {
    int v3 = 0;
  }
  self->_$459C830AD401FFB60020A0C1FEE757B7 headerFooterFlags = ($459C830AD401FFB60020A0C1FEE757B7)(*(_DWORD *)&self->_headerFooterFlags & 0xFFFFFFEF | v3);
}

- (BOOL)_isTopHeader
{
  return (*(unsigned char *)&self->_headerFooterFlags >> 5) & 1;
}

- (void)_invalidateDetailLabelBackgroundColor
{
  *(_DWORD *)&self->_headerFooterFlags |= 4u;
  if (self->_detailLabel) {
    [(UIView *)self setNeedsLayout];
  }
}

+ (id)_defaultTextColorForTableViewStyle:(int64_t)a3 isSectionHeader:(BOOL)a4
{
  double v6 = +[UITraitCollection _fallbackTraitCollection]();
  double v7 = _UITableConstantsForTraitCollection(v6);

  if (a4) {
    [v7 defaultHeaderTextColorForTableViewStyle:a3 focused:0];
  }
  else {
  id v8 = [v7 defaultFooterTextColorForTableViewStyle:a3 focused:0];
  }

  return v8;
}

+ (id)_defaultFontForHeaderFooterView:(id)a3
{
  id v3 = a3;
  char v4 = [v3 sectionHeader];
  double v5 = [v3 _constants];
  double v6 = [v3 tableView];

  uint64_t v7 = [v6 _tableStyle];
  if (v4) {
    [v5 defaultHeaderFontForTableViewStyle:v7];
  }
  else {
  id v8 = [v5 defaultFooterFontForTableViewStyle:v7];
  }

  return v8;
}

- (UITableView)tableView
{
  v2 = [(UITableViewHeaderFooterView *)self _table];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    id v3 = v2;
  }
  else {
    id v3 = 0;
  }

  return (UITableView *)v3;
}

- (BOOL)sectionHeader
{
  return *(_DWORD *)&self->_headerFooterFlags & 1;
}

- (NSString)reuseIdentifier
{
  return self->_reuseIdentifier;
}

- (UITableViewHeaderFooterView)initWithReuseIdentifier:(NSString *)reuseIdentifier
{
  char v4 = reuseIdentifier;
  if (dyld_program_sdk_at_least())
  {
    v8.receiver = self;
    v8.super_class = (Class)UITableViewHeaderFooterView;
    double v5 = -[UIView initWithFrame:](&v8, sel_initWithFrame_, *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
    double v6 = v5;
    if (v5) {
      UITableViewHeaderFooterViewCommonInit(v5, v4);
    }
  }
  else
  {
    double v6 = -[UITableViewHeaderFooterView initWithFrame:](self, "initWithFrame:", *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
  }

  return v6;
}

- (void)_executeConfigurationUpdate
{
  if (a1)
  {
    v2 = (void *)_UISetCurrentFallbackEnvironment(a1);
    id v3 = [a1 configurationState];
    memset(__src, 0, sizeof(__src));
    _UIBeginTrackingTraitUsage(a1, 0, __src);
    [a1 _updateBackgroundViewConfigurationForState:v3];
    [a1 _updateContentViewConfigurationForState:v3];
    [a1 _updateConfigurationUsingState:v3];
    objc_msgSend(a1, "_updateViewConfigurationsWithState:", objc_msgSend(a1, "_viewConfigurationState"));
    [a1 updateConfigurationUsingState:v3];
    [a1 _bridgedUpdateConfigurationUsingState:v3];
    uint64_t v4 = [a1 configurationUpdateHandler];
    double v5 = (void *)v4;
    if (v4) {
      (*(void (**)(uint64_t, void *, void *))(v4 + 16))(v4, a1, v3);
    }
    memcpy(v7, __src, sizeof(v7));
    double v6 = (char *)GetTraitCollectionTSD() + 16;
    memcpy(__dst, v6, sizeof(__dst));
    memcpy(v6, v7, 0x160uLL);
    -[UIView _recordTraitUsage:insideMethod:withInvalidationAction:](a1, (uint64_t)&__dst[136], [a1 methodForSelector:sel_updateConfigurationUsingState_], sel_setNeedsUpdateConfiguration);
    if (+[UIView _isInAnimationBlockWithAnimationsEnabled])
    {
      [a1 _layoutSystemBackgroundView];
    }
    _UIRestorePreviousFallbackEnvironment(v2);
  }
}

- (UITableViewHeaderFooterViewConfigurationUpdateHandler)configurationUpdateHandler
{
  return self->_configurationUpdateHandler;
}

- (unint64_t)_viewConfigurationState
{
  v2 = [(UITableViewHeaderFooterView *)self configurationState];
  unint64_t v3 = [v2 _viewConfigurationState];

  return v3;
}

- (void)_updateContentViewConfigurationForState:(id)a3
{
  id v4 = a3;
  contentViewConfigurationProvider = (void (**)(id, unint64_t))self->_contentViewConfigurationProvider;
  if (contentViewConfigurationProvider)
  {
    id v11 = v4;
    double v6 = contentViewConfigurationProvider[2](contentViewConfigurationProvider, [(UITableViewHeaderFooterView *)self _viewConfigurationState]);
    [(UITableViewHeaderFooterView *)self _setContentViewConfiguration:v6];
LABEL_3:

    id v4 = v11;
    goto LABEL_4;
  }
  if (*((unsigned char *)&self->_headerFooterFlags + 2))
  {
    id v11 = v4;
    if (self->_viewForContentConfiguration)
    {
      double v6 = [(UITableViewHeaderFooterView *)self contentConfiguration];
      if (!v6) {
        goto LABEL_3;
      }
      uint64_t v7 = self;
      objc_super v8 = v6;
      id v9 = v11;
      uint64_t v10 = 0;
    }
    else
    {
      double v6 = [(UITableViewHeaderFooterView *)self _contentViewConfiguration];
      if (!v6) {
        goto LABEL_3;
      }
      uint64_t v7 = self;
      objc_super v8 = v6;
      id v9 = v11;
      uint64_t v10 = 1;
    }
    [(UITableViewHeaderFooterView *)v7 _applyContentViewConfiguration:v8 withState:v9 usingSPI:v10];
    goto LABEL_3;
  }
LABEL_4:
}

- (void)_applyContentViewConfiguration:(id)a3 withState:(id)a4 usingSPI:(BOOL)a5
{
  BOOL v5 = a5;
  id v9 = a3;
  id v10 = a4;
  id v11 = v10;
  $459C830AD401FFB60020A0C1FEE757B7 headerFooterFlags = self->_headerFooterFlags;
  if (v9)
  {
    if ((*(_DWORD *)&headerFooterFlags & 0x10000) != 0 && !self->_contentViewConfigurationProvider)
    {
      if (!v10)
      {
        id v11 = [(UITableViewHeaderFooterView *)self configurationState];
      }
      double v37 = v11;
      if (v5)
      {
        unint64_t v21 = [(UITableViewHeaderFooterView *)self _viewConfigurationState];
        double v22 = [(UIView *)self traitCollection];
        CGFloat v13 = [v9 updatedConfigurationForState:v21 traitCollection:v22];
      }
      else
      {
        CGFloat v13 = [v9 updatedConfigurationForState:v11];
      }
      if (!v13)
      {
        double v34 = [MEMORY[0x1E4F28B00] currentHandler];
        [v34 handleFailureInMethod:a2, self, @"UITableViewHeaderFooterView.m", 653, @"Updated configuration was nil for configuration: %@", v9 object file lineNumber description];
      }
      id v11 = v37;
    }
    else
    {
      CGFloat v13 = v9;
    }
    id v36 = v11;
    if ((*(_WORD *)&headerFooterFlags & 0x8000) == 0)
    {
      *(_DWORD *)&self->_headerFooterFlags |= 0x8000u;
      [(UITableViewHeaderFooterView *)self _resetContentViews];
      if (!v5)
      {
LABEL_44:
        double v29 = [v13 makeContentView];
        objc_storeStrong((id *)&self->_viewForContentConfiguration, v29);
        if (objc_opt_respondsToSelector())
        {
          uint64_t v31 = [(_UIContentViewInternal *)self->_viewForContentConfiguration _wrappedContentView];

          double v29 = (void *)v31;
        }
        goto LABEL_46;
      }
      goto LABEL_40;
    }
    viewForContentConfiguration = self->_viewForContentConfiguration;
    if (!viewForContentConfiguration) {
      viewForContentConfiguration = self->_contentView;
    }
    id v17 = v13;
    id v18 = viewForContentConfiguration;
    if (objc_opt_respondsToSelector())
    {
      int v19 = [v18 supportsConfiguration:v17];
    }
    else
    {
      double v35 = a2;
      double v20 = [v18 configuration];

      id v18 = v20;
      if (v18)
      {
        if (objc_opt_respondsToSelector())
        {
          [v18 _wrappedConfigurationIdentifier];
        }
        else
        {
          double v24 = (objc_class *)objc_opt_class();
          NSStringFromClass(v24);
        double v23 = };
      }
      else
      {
        double v23 = 0;
      }

      id v25 = v17;
      if (v25)
      {
        if (objc_opt_respondsToSelector())
        {
          [v25 _wrappedConfigurationIdentifier];
        }
        else
        {
          double v27 = (objc_class *)objc_opt_class();
          NSStringFromClass(v27);
        double v26 = };
      }
      else
      {
        double v26 = 0;
      }

      int v19 = [v23 isEqualToString:v26];
      a2 = v35;
    }

    *(_DWORD *)&self->_headerFooterFlags |= 0x8000u;
    if (!v19)
    {
      if (!v5)
      {
        CGFloat v30 = [(_UIContentViewInternal *)self->_viewForContentConfiguration configuration];
        UIContentConfigurationAlertForReplacedContentView(@"header/footer view", self, v30, v17, @"Use separate reuse identifiers for different types of header/footer views to avoid this.");

        [(UITableViewHeaderFooterView *)self _resetContentViews];
        goto LABEL_44;
      }
      [(UITableViewHeaderFooterView *)self _resetContentViews];
LABEL_40:
      double v29 = [v13 createContentView];
LABEL_46:
      if (!v29)
      {
        v32 = [MEMORY[0x1E4F28B00] currentHandler];
        [v32 handleFailureInMethod:a2, self, @"UITableViewHeaderFooterView.m", 684, @"Content configuration returned a nil content view: %@", v13 object file lineNumber description];
      }
      if (([v29 translatesAutoresizingMaskIntoConstraints] & 1) == 0)
      {
        double v33 = [MEMORY[0x1E4F28B00] currentHandler];
        [v33 handleFailureInMethod:a2, self, @"UITableViewHeaderFooterView.m", 685, @"The content view returned from the content configuration must have translatesAutoresizingMaskIntoConstraints enabled: %@", v29 object file lineNumber description];
      }
      [(UITableViewHeaderFooterView *)self _setContentView:v29 insertAtBack:0];

      goto LABEL_51;
    }
    if (v5) {
      contentView = self->_contentView;
    }
    else {
      contentView = self->_viewForContentConfiguration;
    }
    [contentView setConfiguration:v17];
    CGFloat v13 = v17;
  }
  else
  {
    self->_$459C830AD401FFB60020A0C1FEE757B7 headerFooterFlags = ($459C830AD401FFB60020A0C1FEE757B7)(*(_DWORD *)&headerFooterFlags & 0xFFFF7FFF);
    if ((*(_WORD *)&headerFooterFlags & 0x8000) == 0) {
      goto LABEL_52;
    }
    id v36 = v10;
    double v14 = [_UITableViewHeaderFooterContentView alloc];
    [(UITableViewHeaderFooterView *)self _contentRect];
    double v15 = -[_UITableViewHeaderFooterContentView initWithFrame:](v14, "initWithFrame:");
    [(UITableViewHeaderFooterView *)self _setContentView:v15 insertAtBack:0];

    [(UITableViewHeaderFooterView *)self _configureDefaultContentViewLayoutMargins];
    CGFloat v13 = self->_viewForContentConfiguration;
    self->_viewForContentConfiguration = 0;
  }
LABEL_51:

  id v11 = v36;
LABEL_52:
}

- (void)_setContentView:(id)a3 insertAtBack:(BOOL)a4
{
  BOOL v4 = a4;
  uint64_t v7 = (UIView *)a3;
  objc_super v8 = v7;
  p_contentView = &self->_contentView;
  contentView = self->_contentView;
  if (contentView != v7)
  {
    CGFloat v13 = v7;
    if (contentView)
    {
      -[UITableViewHeaderFooterView _clearChangeHandlersForOldContentView:](self, "_clearChangeHandlersForOldContentView:");
      if (*p_contentView)
      {
        *((void *)&(*p_contentView)->_viewFlags + 1) &= ~0x200uLL;
        id v11 = *p_contentView;
      }
      else
      {
        id v11 = 0;
      }
      [(UIView *)v11 removeFromSuperview];
    }
    objc_storeStrong((id *)&self->_contentView, a3);
    [(UIView *)v13 setSemanticContentAttribute:[(UIView *)self semanticContentAttribute]];
    objc_super v8 = v13;
    if (v13)
    {
      if (v4) {
        [(UIView *)self insertSubview:v13 atIndex:0];
      }
      else {
        [(UIView *)self addSubview:v13];
      }
      uint64_t v12 = 512;
      if ((((*(void *)&v13->_viewFlags & 0x20000000000000) == 0) & (*(_DWORD *)&self->_headerFooterFlags >> 18)) == 0) {
        uint64_t v12 = 0;
      }
      *((void *)&v13->_viewFlags + 1) = v12 | *((void *)&v13->_viewFlags + 1) & 0xFFFFFFFFFFFFFDFFLL;
      [(UITableViewHeaderFooterView *)self _setupChangeHandlersForNewContentView:v13];
      objc_super v8 = v13;
    }
  }
}

- (void)_setupChangeHandlersForNewContentView:(id)a3
{
  id v4 = a3;
  if (objc_opt_respondsToSelector())
  {
    objc_initWeak(&location, self);
    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    v7[2] = __69__UITableViewHeaderFooterView__setupChangeHandlersForNewContentView___block_invoke;
    v7[3] = &unk_1E52DC308;
    objc_copyWeak(&v8, &location);
    [v4 _setContainerBackgroundViewDidChangeHandler:v7];
    if ([(UITableViewHeaderFooterView *)self _usingBackgroundConfigurationOrDefaultBackgroundConfiguration])
    {
      [(UITableViewHeaderFooterView *)self _updateDefaultBackgroundAppearance];
    }
    objc_destroyWeak(&v8);
    objc_destroyWeak(&location);
  }
  if (objc_opt_respondsToSelector())
  {
    objc_initWeak(&location, self);
    v5[0] = MEMORY[0x1E4F143A8];
    v5[1] = 3221225472;
    v5[2] = __69__UITableViewHeaderFooterView__setupChangeHandlersForNewContentView___block_invoke_2;
    v5[3] = &unk_1E52E46B0;
    objc_copyWeak(&v6, &location);
    [v4 _setDefaultListContentConfigurationProvider:v5];
    objc_destroyWeak(&v6);
    objc_destroyWeak(&location);
  }
  if (objc_opt_respondsToSelector()) {
    objc_msgSend(v4, "_containingListStyleUpdated:", -[UITableViewHeaderFooterView _contentViewListStyleFromTableViewStyle:](self, "_contentViewListStyleFromTableViewStyle:", self->_tableViewStyle));
  }
  if (objc_opt_respondsToSelector()) {
    [v4 _containerViewIsHiddenForReuse:(*(_DWORD *)&self->_headerFooterFlags & 0x200) == 0];
  }
}

- (void)_updateConfigurationUsingState:(id)a3
{
  if (objc_opt_respondsToSelector())
  {
    contentView = self->_contentView;
    [(UIView *)contentView _defaultListContentConfigurationMayHaveChanged];
  }
}

- (void)_updateBackgroundViewConfigurationForState:(id)a3
{
  id v4 = a3;
  backgroundViewConfigurationProvider = (void (**)(id, unint64_t))self->_backgroundViewConfigurationProvider;
  if (backgroundViewConfigurationProvider)
  {
    id v7 = v4;
    id v6 = backgroundViewConfigurationProvider[2](backgroundViewConfigurationProvider, [(UITableViewHeaderFooterView *)self _viewConfigurationState]);
LABEL_3:
    [(UITableViewHeaderFooterView *)self _applyBackgroundViewConfiguration:v6 withState:v7];
LABEL_4:

    id v4 = v7;
    goto LABEL_5;
  }
  if ((*((unsigned char *)&self->_headerFooterFlags + 2) & 2) != 0)
  {
    id v7 = v4;
    id v6 = [(_UISystemBackgroundView *)self->_systemBackgroundView configuration];
    if (!v6) {
      goto LABEL_4;
    }
    goto LABEL_3;
  }
LABEL_5:
}

- (void)_applyBackgroundViewConfiguration:(id)a3 withState:(id)a4
{
  id v7 = (_UISystemBackgroundView *)a3;
  id v8 = a4;
  uint64_t v9 = (uint64_t)v8;
  systemBackgroundView = self->_systemBackgroundView;
  if (v7)
  {
    if ((*((unsigned char *)&self->_headerFooterFlags + 2) & 2) != 0 && !self->_backgroundViewConfigurationProvider)
    {
      if (!v8)
      {
        uint64_t v9 = [(UITableViewHeaderFooterView *)self configurationState];
      }
      id v15 = (id)v9;
      uint64_t v13 = [(_UISystemBackgroundView *)v7 _updatedConfigurationForState:v9];
      if (!v13)
      {
        double v14 = [MEMORY[0x1E4F28B00] currentHandler];
        [v14 handleFailureInMethod:a2, self, @"UITableViewHeaderFooterView.m", 1530, @"Updated configuration was nil for configuration: %@", v7 object file lineNumber description];
      }
      id v7 = (_UISystemBackgroundView *)v13;
    }
    else
    {
      id v15 = v8;
    }
    [(_UISystemBackgroundView *)v7 __setMaskedCorners:15];
    if (systemBackgroundView)
    {
      [(_UISystemBackgroundView *)self->_systemBackgroundView setConfiguration:v7];
    }
    else
    {
      [(UITableViewHeaderFooterView *)self _resetBackgroundViewsAndColor];
      id v11 = [[_UISystemBackgroundView alloc] initWithConfiguration:v7];
      uint64_t v12 = self->_systemBackgroundView;
      self->_systemBackgroundView = v11;

      [(UIView *)self insertSubview:self->_systemBackgroundView atIndex:0];
    }
    [(UIView *)self setNeedsLayout];
  }
  else
  {
    id v15 = v8;
    objc_msgSend(0, "__setMaskedCorners:", 15);
    if (!systemBackgroundView) {
      goto LABEL_12;
    }
    [(UIView *)self->_systemBackgroundView removeFromSuperview];
    id v7 = self->_systemBackgroundView;
    self->_systemBackgroundView = 0;
  }

LABEL_12:
}

- (void)setBackgroundView:(UIView *)backgroundView
{
  BOOL v5 = backgroundView;
  p_backgroundView = &self->_backgroundView;
  if (self->_backgroundView != v5)
  {
    id v11 = v5;
    if (v5)
    {
      [(UITableViewHeaderFooterView *)self _resetBackgroundViewConfiguration];
      BOOL v5 = v11;
    }
    $459C830AD401FFB60020A0C1FEE757B7 headerFooterFlags = self->_headerFooterFlags;
    int v8 = (*(unsigned int *)&headerFooterFlags >> 11) & 1;
    if (v5) {
      int v8 = 1;
    }
    if (v8) {
      int v9 = 2048;
    }
    else {
      int v9 = 0;
    }
    self->_$459C830AD401FFB60020A0C1FEE757B7 headerFooterFlags = ($459C830AD401FFB60020A0C1FEE757B7)(v9 | *(_DWORD *)&headerFooterFlags & 0xFFFFF7FF);
    [(UIView *)*p_backgroundView removeFromSuperview];
    objc_storeStrong((id *)&self->_backgroundView, backgroundView);
    id v10 = *p_backgroundView;
    [(UITableViewHeaderFooterView *)self _backgroundRect];
    -[UIView setFrame:](v10, "setFrame:");
    [(UIView *)self insertSubview:*p_backgroundView atIndex:0];
    BOOL v5 = v11;
  }
}

- (void)_resetBackgroundViewsAndColor
{
}

- (void)_configureDefaultContentViewLayoutMargins
{
  if (dyld_program_sdk_at_least())
  {
    contentView = self->_contentView;
    [(UIView *)contentView setEdgesPreservingSuperviewLayoutMargins:15];
  }
  else if (dyld_program_sdk_at_least())
  {
    [(UIView *)self->_contentView setEdgesPreservingSuperviewLayoutMargins:10];
    id v4 = self->_contentView;
    uint64_t v5 = [(UIView *)v4 edgesInsettingLayoutMarginsFromSafeArea] & 0xA;
    [(UIView *)v4 setEdgesInsettingLayoutMarginsFromSafeArea:v5];
  }
}

- (id)contentConfiguration
{
  if ((*((unsigned char *)&self->_headerFooterFlags + 1) & 0x80) != 0)
  {
    viewForContentConfiguration = self->_viewForContentConfiguration;
    if (viewForContentConfiguration)
    {
      viewForContentConfiguration = [viewForContentConfiguration configuration];
    }
  }
  else
  {
    viewForContentConfiguration = 0;
  }
  return viewForContentConfiguration;
}

- (void)_resetContentViews
{
  [(UIView *)self->_label removeFromSuperview];
  label = self->_label;
  self->_label = 0;

  [(UIView *)self->_detailLabel removeFromSuperview];
  detailLabel = self->_detailLabel;
  self->_detailLabel = 0;
}

- (void)_clearChangeHandlersForOldContentView:(id)a3
{
  id v3 = a3;
  if (objc_opt_respondsToSelector()) {
    [v3 _setContainerBackgroundViewDidChangeHandler:0];
  }
  if (objc_opt_respondsToSelector()) {
    [v3 _setDefaultListContentConfigurationProvider:0];
  }
  if (objc_opt_respondsToSelector()) {
    [v3 _containingListStyleUpdated:-1];
  }
  if (objc_opt_respondsToSelector()) {
    [v3 _containerViewIsHiddenForReuse:0];
  }
}

- (_UIContentViewConfiguration)_contentViewConfiguration
{
  if ((*((unsigned char *)&self->_headerFooterFlags + 1) & 0x80) != 0 && !self->_viewForContentConfiguration)
  {
    v2 = [(UIView *)self->_contentView configuration];
  }
  else
  {
    v2 = 0;
  }
  return (_UIContentViewConfiguration *)v2;
}

- (UIView)contentView
{
  return self->_contentView;
}

- (void)_notifyIsDisplaying:(BOOL)a3
{
  if (((((*(_DWORD *)&self->_headerFooterFlags & 0x200) == 0) ^ a3) & 1) == 0)
  {
    BOOL v3 = a3;
    int v5 = a3 ? 512 : 0;
    self->_$459C830AD401FFB60020A0C1FEE757B7 headerFooterFlags = ($459C830AD401FFB60020A0C1FEE757B7)(*(_DWORD *)&self->_headerFooterFlags & 0xFFFFFDFF | v5);
    if (objc_opt_respondsToSelector())
    {
      contentView = self->_contentView;
      [(UIView *)contentView _containerViewIsHiddenForReuse:!v3];
    }
  }
}

void __40__UITableViewHeaderFooterView_setFrame___block_invoke()
{
  if ((dyld_program_sdk_at_least() & 1) == 0)
  {
    _UIMainBundleIdentifier();
    id v0 = (id)objc_claimAutoreleasedReturnValue();
    if (![v0 rangeOfString:@"com.inditex.zara"]) {
      _MergedGlobals_35_0 = 1;
    }
  }
}

- (void)setUserInteractionEnabled:(BOOL)a3
{
  BOOL v3 = a3;
  BOOL v5 = [(UIView *)self isUserInteractionEnabled];
  if (v5 != v3) {
    [(UITableViewHeaderFooterView *)self _prepareForConfigurationStateUpdate];
  }
  v6.receiver = self;
  v6.super_class = (Class)UITableViewHeaderFooterView;
  [(UIView *)&v6 setUserInteractionEnabled:v3];
  if (v5 != [(UIView *)self isUserInteractionEnabled]) {
    [(UITableViewHeaderFooterView *)self setNeedsUpdateConfiguration];
  }
}

- (void)setContentConfiguration:(id)contentConfiguration
{
}

- (void)_invalidateConfiguration
{
}

- (void)_updateConfigurationWithObservationTracking
{
  v2 = self;
  sub_185A8D30C();
}

- (UIViewConfigurationState)_bridgedConfigurationState
{
  v2 = self;
  CGRect result = [(UITableViewHeaderFooterView *)v2 _configurationState];
  if (result)
  {
    sub_185B0D548(result, (uint64_t)v8);

    id v4 = (void *)v8[0];
    id v7 = (void *)v8[3];
    sub_185B0DAF8();
    objc_super v6 = v5;
    swift_bridgeObjectRelease();

    return (UIViewConfigurationState *)v6;
  }
  else
  {
    __break(1u);
  }
  return result;
}

- (void)_bridgedUpdateConfigurationUsingState:(id)a3
{
  sub_185B0D548(a3, (uint64_t)v5);
  BOOL v3 = (void *)v5[0];
  id v4 = (id)v5[3];
  swift_bridgeObjectRelease();
}

- (UITableViewHeaderFooterView)initWithFrame:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  if (dyld_program_sdk_at_least())
  {
    int v8 = [(UITableViewHeaderFooterView *)self initWithReuseIdentifier:0];
    int v9 = v8;
    if (v8)
    {
      -[UITableViewHeaderFooterView setFrame:](v8, "setFrame:", x, y, width, height);
      [(UITableViewHeaderFooterView *)v9 _updateContentAndBackgroundView];
    }
  }
  else
  {
    v12.receiver = self;
    v12.super_class = (Class)UITableViewHeaderFooterView;
    id v10 = -[UIView initWithFrame:](&v12, sel_initWithFrame_, x, y, width, height);
    int v9 = v10;
    if (v10) {
      UITableViewHeaderFooterViewCommonInit(v10, 0);
    }
  }
  return v9;
}

- (UITableViewHeaderFooterView)initWithCoder:(NSCoder *)coder
{
  id v4 = coder;
  v22.receiver = self;
  v22.super_class = (Class)UITableViewHeaderFooterView;
  BOOL v5 = [(UIView *)&v22 initWithCoder:v4];
  if (dyld_program_sdk_at_least() && v5)
  {
    objc_super v6 = [(NSCoder *)v4 decodeObjectForKey:@"UIReuseIdentifier"];
    UITableViewHeaderFooterViewCommonInit(v5, v6);

    uint64_t v7 = [(NSCoder *)v4 decodeObjectForKey:@"UISystemBackgroundView"];
    systemBackgroundView = v5->_systemBackgroundView;
    v5->_systemBackgroundView = (_UISystemBackgroundView *)v7;

    int v9 = v5->_systemBackgroundView;
    if (v9)
    {
      [(UIView *)v5 insertSubview:v9 atIndex:0];
    }
    else
    {
      id v10 = [(NSCoder *)v4 decodeObjectForKey:@"UIBackgroundView"];
      [(UITableViewHeaderFooterView *)v5 setBackgroundView:v10];
    }
    id v11 = [(NSCoder *)v4 decodeObjectForKey:@"UIContentConfigurationIdentifier"];
    v5->_$459C830AD401FFB60020A0C1FEE757B7 headerFooterFlags = ($459C830AD401FFB60020A0C1FEE757B7)(*(_DWORD *)&v5->_headerFooterFlags & 0xFFFF7FFF | ((v11 != 0) << 15));

    uint64_t v12 = [(NSCoder *)v4 decodeObjectForKey:@"UIContentConfigurationView"];
    viewForContentConfiguration = v5->_viewForContentConfiguration;
    v5->_viewForContentConfiguration = (_UIContentViewInternal *)v12;

    double v14 = [(NSCoder *)v4 decodeObjectForKey:@"UIContentView"];
    if (v14) {
      [(UITableViewHeaderFooterView *)v5 _setContentView:v14 insertAtBack:0];
    }
    if ((*((unsigned char *)&v5->_headerFooterFlags + 1) & 0x80) == 0)
    {
      uint64_t v15 = [(NSCoder *)v4 decodeObjectForKey:@"UILabel"];
      label = v5->_label;
      v5->_label = (_UITableViewHeaderFooterViewLabel *)v15;

      uint64_t v17 = [(NSCoder *)v4 decodeObjectForKey:@"UIDetailLabel"];
      detailLabel = v5->_detailLabel;
      v5->_detailLabel = (_UITableViewHeaderFooterViewLabel *)v17;
    }
    if (!dyld_program_sdk_at_least()
      || [(NSCoder *)v4 containsValueForKey:@"UITableViewStyle"])
    {
      v5->_int64_t tableViewStyle = [(NSCoder *)v4 decodeIntegerForKey:@"UITableViewStyle"];
    }
    if ([(NSCoder *)v4 decodeBoolForKey:@"UIFloating"]) {
      int v19 = 8;
    }
    else {
      int v19 = 0;
    }
    v5->_$459C830AD401FFB60020A0C1FEE757B7 headerFooterFlags = ($459C830AD401FFB60020A0C1FEE757B7)(*(_DWORD *)&v5->_headerFooterFlags & 0xFFFFFFF7 | v19);
    v5->_$459C830AD401FFB60020A0C1FEE757B7 headerFooterFlags = ($459C830AD401FFB60020A0C1FEE757B7)(*(_DWORD *)&v5->_headerFooterFlags & 0xFFFFFFFE | [(NSCoder *)v4 decodeBoolForKey:@"UIIsHeader"]);
    v5->_textAlignment = [(NSCoder *)v4 decodeIntegerForKey:@"UITextAlignment"];
    [(NSCoder *)v4 decodeDoubleForKey:@"UIMaxTitleWidth"];
    v5->_maxTitledouble Width = v20;
    [(UIView *)v5 setNeedsLayout];
  }
  return v5;
}

- (void)_populateArchivedSubviews:(id)a3
{
  id v4 = a3;
  v5.receiver = self;
  v5.super_class = (Class)UITableViewHeaderFooterView;
  [(UIView *)&v5 _populateArchivedSubviews:v4];
  if (self->_systemBackgroundView) {
    objc_msgSend(v4, "removeObject:");
  }
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  v14.receiver = self;
  v14.super_class = (Class)UITableViewHeaderFooterView;
  [(UIView *)&v14 encodeWithCoder:v4];
  reuseIdentifier = self->_reuseIdentifier;
  if (reuseIdentifier) {
    [v4 encodeObject:reuseIdentifier forKey:@"UIReuseIdentifier"];
  }
  [v4 encodeObject:self->_systemBackgroundView forKey:@"UISystemBackgroundView"];
  if ((*((unsigned char *)&self->_headerFooterFlags + 1) & 0x80) != 0)
  {
    objc_super v6 = [(UITableViewHeaderFooterView *)self contentConfiguration];
    if (v6)
    {
      id v7 = v6;
    }
    else
    {
      id v7 = [(UITableViewHeaderFooterView *)self _contentViewConfiguration];
      if (!v7)
      {
        int v9 = 0;
LABEL_11:
        [v4 encodeObject:v9 forKey:@"UIContentConfigurationIdentifier"];

        goto LABEL_12;
      }
    }
    if (objc_opt_respondsToSelector())
    {
      [v7 _wrappedConfigurationIdentifier];
    }
    else
    {
      int v8 = (objc_class *)objc_opt_class();
      NSStringFromClass(v8);
    int v9 = };

    goto LABEL_11;
  }
LABEL_12:
  [v4 encodeObject:self->_viewForContentConfiguration forKey:@"UIContentConfigurationView"];
  backgroundView = self->_backgroundView;
  if (backgroundView) {
    [v4 encodeObject:backgroundView forKey:@"UIBackgroundView"];
  }
  contentView = self->_contentView;
  if (contentView) {
    [v4 encodeObject:contentView forKey:@"UIContentView"];
  }
  label = self->_label;
  if (label) {
    [v4 encodeObject:label forKey:@"UILabel"];
  }
  detailLabel = self->_detailLabel;
  if (detailLabel) {
    [v4 encodeObject:detailLabel forKey:@"UIDetailLabel"];
  }
  [v4 encodeBool:(*(_DWORD *)&self->_headerFooterFlags >> 3) & 1 forKey:@"UIFloating"];
  [v4 encodeInteger:self->_tableViewStyle forKey:@"UITableViewStyle"];
  [v4 encodeBool:*(_DWORD *)&self->_headerFooterFlags & 1 forKey:@"UIIsHeader"];
  [v4 encodeInteger:self->_textAlignment forKey:@"UITextAlignment"];
  [v4 encodeDouble:@"UIMaxTitleWidth" forKey:self->_maxTitleWidth];
}

- (void)prepareForReuse
{
  [(UILabel *)self->_detailLabel setText:0];
  [(UILabel *)self->_label setText:0];
  if (dyld_program_sdk_at_least())
  {
    *(_DWORD *)&self->_headerFooterFlags &= 0xFFFFFF3E;
    [(UIView *)self _removeAllAnimations:1];
  }
  [(UITableViewHeaderFooterView *)self _notifyIsDisplaying:0];
  [(UITableViewHeaderFooterView *)self setNeedsUpdateConfiguration];
}

void __69__UITableViewHeaderFooterView__setupChangeHandlersForNewContentView___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _updateDefaultBackgroundAppearance];
}

id __69__UITableViewHeaderFooterView__setupChangeHandlersForNewContentView___block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v2 = [WeakRetained defaultContentConfiguration];
  BOOL v3 = [WeakRetained configurationState];
  id v4 = [v2 updatedConfigurationForState:v3];

  return v4;
}

- (UIListContentConfiguration)defaultContentConfiguration
{
  int64_t tableViewStyle = self->_tableViewStyle;
  if (tableViewStyle < 0)
  {
    id v4 = [(UITableViewHeaderFooterView *)self _table];
    int64_t tableViewStyle = [v4 _tableStyle];
  }
  int v5 = *(_DWORD *)&self->_headerFooterFlags & 0x41;
  if ((unint64_t)(tableViewStyle - 1) >= 2)
  {
    if (v5 == 64) {
      +[UIListContentConfiguration plainFooterConfiguration];
    }
    else {
      +[UIListContentConfiguration plainHeaderConfiguration];
    }
  }
  else if (v5 == 64)
  {
    +[UIListContentConfiguration groupedFooterConfiguration];
  }
  else
  {
    +[UIListContentConfiguration groupedHeaderConfiguration];
  objc_super v6 = };
  return (UIListContentConfiguration *)v6;
}

- (void)_setContentViewConfiguration:(id)a3
{
}

- (void)setAutomaticallyUpdatesContentConfiguration:(BOOL)automaticallyUpdatesContentConfiguration
{
  if (automaticallyUpdatesContentConfiguration)
  {
    id contentViewConfigurationProvider = self->_contentViewConfigurationProvider;
    p_$459C830AD401FFB60020A0C1FEE757B7 headerFooterFlags = &self->_headerFooterFlags;
    $459C830AD401FFB60020A0C1FEE757B7 headerFooterFlags = self->_headerFooterFlags;
    if ((contentViewConfigurationProvider == 0) != ((*(_DWORD *)&headerFooterFlags & 0x10000) == 0)) {
      return;
    }
    if (!contentViewConfigurationProvider)
    {
      *p_$459C830AD401FFB60020A0C1FEE757B7 headerFooterFlags = ($459C830AD401FFB60020A0C1FEE757B7)(*(_DWORD *)&headerFooterFlags | 0x10000);
      [(UITableViewHeaderFooterView *)self setNeedsUpdateConfiguration];
      return;
    }
  }
  else
  {
    p_$459C830AD401FFB60020A0C1FEE757B7 headerFooterFlags = &self->_headerFooterFlags;
    $459C830AD401FFB60020A0C1FEE757B7 headerFooterFlags = self->_headerFooterFlags;
    if ((*(_DWORD *)&headerFooterFlags & 0x10000) == 0) {
      return;
    }
  }
  *p_$459C830AD401FFB60020A0C1FEE757B7 headerFooterFlags = ($459C830AD401FFB60020A0C1FEE757B7)(*(_DWORD *)&headerFooterFlags & 0xFFFEFFFF);
}

- (BOOL)automaticallyUpdatesContentConfiguration
{
  return *((unsigned char *)&self->_headerFooterFlags + 2) & 1;
}

- (void)_setContentViewConfigurationProvider:(id)a3
{
  if (self->_contentViewConfigurationProvider != a3)
  {
    if (a3) {
      *(_DWORD *)&self->_headerFooterFlags &= ~0x10000u;
    }
    id v4 = (void *)[a3 copy];
    id contentViewConfigurationProvider = self->_contentViewConfigurationProvider;
    self->_id contentViewConfigurationProvider = v4;

    [(UITableViewHeaderFooterView *)self setNeedsUpdateConfiguration];
  }
}

- (id)_contentViewConfigurationProvider
{
  v2 = _Block_copy(self->_contentViewConfigurationProvider);
  return v2;
}

+ (id)_defaultFontForTableViewStyle:(int64_t)a3 isSectionHeader:(BOOL)a4
{
  objc_super v6 = +[UITraitCollection _fallbackTraitCollection]();
  id v7 = _UITableConstantsForTraitCollection(v6);

  if (a4) {
    [v7 defaultHeaderFontForTableViewStyle:a3];
  }
  else {
  int v8 = [v7 defaultFooterFontForTableViewStyle:a3];
  }

  return v8;
}

+ (id)_defaultPlainHeaderFooterFont
{
  if (dyld_program_sdk_at_least()) {
    [off_1E52D39B8 preferredFontForTextStyle:@"UICTFontTextStyleHeadline"];
  }
  else {
  v2 = [off_1E52D39B8 boldSystemFontOfSize:14.0];
  }
  return v2;
}

+ (double)defaultHeaderHeightForStyle:(int64_t)a3
{
  if (a3) {
    return 17.5;
  }
  int v4 = dyld_program_sdk_at_least();
  double result = 23.0;
  if (v4)
  {
    int v5 = [(id)objc_opt_class() _defaultPlainHeaderFooterFont];
    [v5 _scaledValueForValue:28.0];
    double v7 = v6;

    return v7;
  }
  return result;
}

- (BOOL)_automaticIntrinsicContentSizeInvalidationEnabled
{
  return (*((unsigned __int8 *)&self->_headerFooterFlags + 2) >> 2) & 1;
}

- (void)_setupLabelForSourceList:(id)a3
{
  id v3 = a3;
  [v3 setNumberOfLines:1];
  [v3 setLineBreakMode:4];
  [v3 setAllowsDefaultTighteningForTruncation:0];
  [v3 setAdjustsFontSizeToFitWidth:0];
}

- (int64_t)textAlignment
{
  return self->_textAlignment;
}

- (CGSize)_textSizeForWidth:(double)a3
{
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  int v5 = [(UILabel *)self->_label text];
  if ([v5 length])
  {
    int has_internal_diagnostics = os_variant_has_internal_diagnostics();
    double v7 = [(UILabel *)self->_label font];
    [v7 pointSize];
    double v9 = v8;

    if (has_internal_diagnostics)
    {
      if (v9 != 0.0) {
        goto LABEL_4;
      }
      double v26 = __UIFaultDebugAssertLog();
      if (!os_log_type_enabled(v26, OS_LOG_TYPE_FAULT))
      {
LABEL_18:

LABEL_4:
        label = self->_label;
        if (self->_tableViewStyle)
        {
          -[UILabel sizeThatFits:](label, "sizeThatFits:", a3, 1.79769313e308);
          double v12 = v11;
          double v14 = v13;
        }
        else
        {
          uint64_t v15 = [(UILabel *)label font];
          objc_msgSend(v5, "_legacy_sizeWithFont:forWidth:lineBreakMode:", v15, -[UILabel lineBreakMode](self->_label, "lineBreakMode"), a3);
          double v12 = v16;
          double v14 = v17;
        }
        goto LABEL_8;
      }
      double v27 = (objc_class *)objc_opt_class();
      double v28 = NSStringFromClass(v27);
      int v31 = 138412290;
      v32 = v28;
      _os_log_fault_impl(&dword_1853B0000, v26, OS_LOG_TYPE_FAULT, "Attempting to compute the size of a %@ text label with an undefined (0 pt) font! This will yield invalid results.", (uint8_t *)&v31, 0xCu);
    }
    else
    {
      if (v9 != 0.0) {
        goto LABEL_4;
      }
      double v29 = *(NSObject **)(__UILogGetCategoryCachedImpl("Assert", &_textSizeForWidth____s_category) + 8);
      if (!os_log_type_enabled(v29, OS_LOG_TYPE_ERROR)) {
        goto LABEL_4;
      }
      double v26 = v29;
      CGFloat v30 = (objc_class *)objc_opt_class();
      double v28 = NSStringFromClass(v30);
      int v31 = 138412290;
      v32 = v28;
      _os_log_impl(&dword_1853B0000, v26, OS_LOG_TYPE_ERROR, "Attempting to compute the size of a %@ text label with an undefined (0 pt) font! This will yield invalid results.", (uint8_t *)&v31, 0xCu);
    }

    goto LABEL_18;
  }
  double v12 = *MEMORY[0x1E4F1DB30];
  double v14 = *(double *)(MEMORY[0x1E4F1DB30] + 8);
LABEL_8:
  id v18 = [(UITableViewHeaderFooterView *)self _table];
  int v19 = v18;
  if (v18)
  {
    double v20 = [v18 _scrollView];
    [v20 _currentScreenScale];
    double v22 = v21;
  }
  else
  {
    [(UIView *)self _currentScreenScale];
    double v22 = v23;
  }

  double v24 = ceil(v12 * v22) / v22;
  double v25 = ceil(v14 * v22) / v22;
  result.double height = v25;
  result.double width = v24;
  return result;
}

- (CGSize)_detailTextSizeForWidth:(double)a3
{
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  BOOL v5 = [(UITableViewHeaderFooterView *)self _useDetailText];
  double v6 = *MEMORY[0x1E4F1DB30];
  double v7 = *(double *)(MEMORY[0x1E4F1DB30] + 8);
  if (!v5) {
    goto LABEL_12;
  }
  double v8 = [(UILabel *)self->_detailLabel text];
  if ([v8 length])
  {
    int has_internal_diagnostics = os_variant_has_internal_diagnostics();
    id v10 = [(UILabel *)self->_detailLabel font];
    [v10 pointSize];
    double v12 = v11;

    if (has_internal_diagnostics)
    {
      if (v12 != 0.0) {
        goto LABEL_5;
      }
      double v28 = __UIFaultDebugAssertLog();
      if (!os_log_type_enabled(v28, OS_LOG_TYPE_FAULT))
      {
LABEL_19:

LABEL_5:
        int v13 = dyld_program_sdk_at_least();
        detailLabel = self->_detailLabel;
        if (v13)
        {
          -[UILabel sizeThatFits:](detailLabel, "sizeThatFits:", a3, 1.79769313e308);
          double v6 = v15;
          double v7 = v16;
        }
        else
        {
          double v17 = [(UILabel *)detailLabel font];
          objc_msgSend(v8, "_legacy_sizeWithFont:constrainedToSize:lineBreakMode:", v17, -[UILabel lineBreakMode](self->_detailLabel, "lineBreakMode"), a3, 3.40282347e38);
          double v6 = v18;
          double v7 = v19;
        }
        goto LABEL_8;
      }
      double v29 = (objc_class *)objc_opt_class();
      CGFloat v30 = NSStringFromClass(v29);
      int v33 = 138412290;
      double v34 = v30;
      _os_log_fault_impl(&dword_1853B0000, v28, OS_LOG_TYPE_FAULT, "Attempting to compute the size of a %@ detail text label with an undefined (0 pt) font! This will yield invalid results.", (uint8_t *)&v33, 0xCu);
    }
    else
    {
      if (v12 != 0.0) {
        goto LABEL_5;
      }
      int v31 = *(NSObject **)(__UILogGetCategoryCachedImpl("Assert", &_detailTextSizeForWidth____s_category) + 8);
      if (!os_log_type_enabled(v31, OS_LOG_TYPE_ERROR)) {
        goto LABEL_5;
      }
      double v28 = v31;
      v32 = (objc_class *)objc_opt_class();
      CGFloat v30 = NSStringFromClass(v32);
      int v33 = 138412290;
      double v34 = v30;
      _os_log_impl(&dword_1853B0000, v28, OS_LOG_TYPE_ERROR, "Attempting to compute the size of a %@ detail text label with an undefined (0 pt) font! This will yield invalid results.", (uint8_t *)&v33, 0xCu);
    }

    goto LABEL_19;
  }
LABEL_8:
  double v20 = [(UITableViewHeaderFooterView *)self _table];
  double v21 = v20;
  if (v20)
  {
    double v22 = [v20 _scrollView];
    [v22 _currentScreenScale];
    double v24 = v23;
  }
  else
  {
    [(UIView *)self _currentScreenScale];
    double v24 = v25;
  }
  double v6 = ceil(v6 * v24) / v24;
  double v7 = ceil(v7 * v24) / v24;

LABEL_12:
  double v26 = v6;
  double v27 = v7;
  result.double height = v27;
  result.double width = v26;
  return result;
}

- (void)_invalidateLabelBackgroundColor
{
  *(_DWORD *)&self->_headerFooterFlags |= 2u;
  if (self->_label) {
    [(UIView *)self setNeedsLayout];
  }
}

- (void)_updateDetailLabelBackgroundColor
{
  if (self->_detailLabel)
  {
    v2[0] = MEMORY[0x1E4F143A8];
    v2[1] = 3221225472;
    v2[2] = __64__UITableViewHeaderFooterView__updateDetailLabelBackgroundColor__block_invoke;
    v2[3] = &unk_1E52D9F70;
    v2[4] = self;
    +[UIView _performSystemAppearanceModifications:v2];
  }
}

void __64__UITableViewHeaderFooterView__updateDetailLabelBackgroundColor__block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  unint64_t v3 = *(void *)(v2 + 408);
  BOOL v4 = v3 > 0x10;
  uint64_t v5 = (1 << v3) & 0x10006;
  if (v4 || v5 == 0) {
    goto LABEL_7;
  }
  double v7 = +[UIDevice currentDevice];
  if ([v7 userInterfaceIdiom])
  {

    uint64_t v2 = *(void *)(a1 + 32);
LABEL_7:
    double v8 = *(void **)(v2 + 496);
LABEL_8:
    double v9 = +[UIColor clearColor];
    [v8 setBackgroundColor:v9];

    goto LABEL_9;
  }
  double v15 = [*(id *)(*(void *)(a1 + 32) + 504) backgroundColor];
  [v15 alphaComponent];
  double v17 = v16;

  uint64_t v18 = *(void *)(a1 + 32);
  double v8 = *(void **)(v18 + 496);
  if (v17 != 1.0) {
    goto LABEL_8;
  }
  double v19 = [*(id *)(v18 + 504) backgroundColor];
  [v8 setBackgroundColor:v19];

LABEL_9:
  uint64_t v10 = *(void *)(a1 + 32);
  double v11 = *(void **)(v10 + 496);
  double v12 = [*(id *)(v10 + 504) backgroundColor];
  if ([v12 isPatternColor])
  {
    [*(id *)(*(void *)(a1 + 32) + 496) frame];
    double v13 = -CGRectGetMinX(v20);
    [*(id *)(*(void *)(a1 + 32) + 496) frame];
    double v14 = -CGRectGetMinY(v21);
  }
  else
  {
    double v13 = *MEMORY[0x1E4F1DB30];
    double v14 = *(double *)(MEMORY[0x1E4F1DB30] + 8);
  }
  objc_msgSend(v11, "setPatternPhase:", v13, v14);

  *(_DWORD *)(*(void *)(a1 + 32) + 568) &= ~4u;
}

- (void)_updateDetailLabelBackgroundColorIfNeeded
{
  if ((*(unsigned char *)&self->_headerFooterFlags & 4) != 0)
  {
    if (self->_detailLabel) {
      [(UITableViewHeaderFooterView *)self _updateDetailLabelBackgroundColor];
    }
  }
}

- (id)_label:(BOOL)a3
{
  label = self->_label;
  if (label) {
    BOOL v5 = 1;
  }
  else {
    BOOL v5 = !a3;
  }
  if (!v5)
  {
    if ((*((unsigned char *)&self->_headerFooterFlags + 1) & 0x80) != 0)
    {
      label = 0;
    }
    else
    {
      v7[0] = MEMORY[0x1E4F143A8];
      v7[1] = 3221225472;
      v7[2] = __38__UITableViewHeaderFooterView__label___block_invoke;
      v7[3] = &unk_1E52D9F70;
      void v7[4] = self;
      +[UIView _performSystemAppearanceModifications:v7];
      label = self->_label;
    }
  }
  return label;
}

uint64_t __38__UITableViewHeaderFooterView__label___block_invoke(uint64_t a1)
{
  uint64_t v2 = objc_alloc_init(_UITableViewHeaderFooterViewLabel);
  uint64_t v3 = *(void *)(a1 + 32);
  BOOL v4 = *(void **)(v3 + 488);
  *(void *)(v3 + 488) = v2;

  [*(id *)(*(void *)(a1 + 32) + 488) setOpaque:0];
  BOOL v5 = +[UIColor clearColor];
  [*(id *)(*(void *)(a1 + 32) + 488) setBackgroundColor:v5];

  double v6 = [off_1E52D39B8 systemFontOfSize:0.0];
  [*(id *)(*(void *)(a1 + 32) + 488) setFont:v6];

  uint64_t v7 = *(void *)(a1 + 32);
  if ((*(void *)(v7 + 408) & 0x8000000000000000) == 0)
  {
    [(id)v7 _setupLabelAppearance];
    uint64_t v7 = *(void *)(a1 + 32);
  }
  [*(id *)(v7 + 488) setUserInteractionEnabled:0];
  double v8 = *(void **)(*(void *)(a1 + 32) + 488);
  return [v8 setEnabled:1];
}

- (UILabel)textLabel
{
  return (UILabel *)[(UITableViewHeaderFooterView *)self _label:1];
}

- (UILabel)detailTextLabel
{
  detailLabel = self->_detailLabel;
  if (!detailLabel)
  {
    if ((*((unsigned char *)&self->_headerFooterFlags + 1) & 0x80) != 0)
    {
      detailLabel = 0;
    }
    else
    {
      v5[0] = MEMORY[0x1E4F143A8];
      v5[1] = 3221225472;
      v5[2] = __46__UITableViewHeaderFooterView_detailTextLabel__block_invoke;
      v5[3] = &unk_1E52D9F70;
      void v5[4] = self;
      +[UIView _performSystemAppearanceModifications:v5];
      [(UITableViewHeaderFooterView *)self _invalidateDetailLabelBackgroundColor];
      detailLabel = self->_detailLabel;
    }
  }
  return (UILabel *)detailLabel;
}

uint64_t __46__UITableViewHeaderFooterView_detailTextLabel__block_invoke(uint64_t a1)
{
  uint64_t v2 = objc_alloc_init(_UITableViewHeaderFooterViewLabel);
  uint64_t v3 = *(void *)(a1 + 32);
  BOOL v4 = *(void **)(v3 + 496);
  *(void *)(v3 + 496) = v2;

  [*(id *)(*(void *)(a1 + 32) + 496) setOpaque:0];
  BOOL v5 = +[UIColor clearColor];
  [*(id *)(*(void *)(a1 + 32) + 496) setBackgroundColor:v5];

  double v6 = [off_1E52D39B8 systemFontOfSize:0.0];
  [*(id *)(*(void *)(a1 + 32) + 496) setFont:v6];

  uint64_t v7 = *(void *)(a1 + 32);
  if ((*(void *)(v7 + 408) & 0x8000000000000000) == 0)
  {
    [(id)v7 _setupLabelAppearance];
    uint64_t v7 = *(void *)(a1 + 32);
  }
  [*(id *)(v7 + 496) setUserInteractionEnabled:0];
  double v8 = *(void **)(*(void *)(a1 + 32) + 496);
  return [v8 setEnabled:1];
}

- (NSString)text
{
  label = self->_label;
  if (label)
  {
    uint64_t v3 = [(UILabel *)label text];
  }
  else
  {
    uint64_t v3 = &stru_1ED0E84C0;
  }
  return (NSString *)v3;
}

- (void)setText:(id)a3
{
  id v5 = a3;
  if (self->_label || [v5 length])
  {
    id v4 = [(UITableViewHeaderFooterView *)self _label:1];
    [(UILabel *)self->_label setText:v5];
    [(UIView *)self setNeedsLayout];
    [(UIView *)self setNeedsDisplay];
  }
}

- (CGRect)_labelFrame
{
  uint64_t v3 = [(UILabel *)self->_label text];
  id v4 = [(UITableViewHeaderFooterView *)self _table];
  uint64_t v5 = MEMORY[0x1E4F1DB28];
  double v6 = *MEMORY[0x1E4F1DB28];
  double rect_24 = *(double *)(MEMORY[0x1E4F1DB28] + 8);
  if (![v3 length])
  {
    double v19 = *(double *)(v5 + 16);
    double v20 = *(double *)(v5 + 24);
    goto LABEL_50;
  }
  [(UITableViewHeaderFooterView *)self _contentRect];
  double v8 = v7;
  double rect_8 = v10;
  double rect_16 = v9;
  double v12 = v11;
  [(UITableViewHeaderFooterView *)self _insetsToContentRect];
  double v82 = v13;
  double v83 = v14;
  double v15 = v12;
  if (v12 - v13 - v14 <= self->_maxTitleWidth) {
    maxTitledouble Width = v12 - v13 - v14;
  }
  else {
    maxTitledouble Width = self->_maxTitleWidth;
  }
  [(UITableViewHeaderFooterView *)self _textSizeForWidth:maxTitleWidth];
  double v19 = v17;
  double v20 = v18;
  double rect = v8;
  if (!self->_tableViewStyle)
  {
    -[UITableConstants defaultPlainHeaderLabelYPositionForTableView:headerBounds:textRect:isHeader:](self->_constants, "defaultPlainHeaderLabelYPositionForTableView:headerBounds:textRect:isHeader:", v4, *(_DWORD *)&self->_headerFooterFlags & 1, v8, rect_16, v15, rect_8, v6, rect_24, v17, v18);
    double rect_24 = v28;
    goto LABEL_18;
  }
  CGRect v21 = [(UILabel *)self->_label font];
  if (*(unsigned char *)&self->_headerFooterFlags)
  {
    if (v20 > 1.79769313e308)
    {
      int v29 = dyld_program_sdk_at_least();
      double v30 = 35.0;
      if (v29) {
        [v21 _scaledValueForValue:35.0];
      }
      double rect_24 = rect_16 + v30;
      double v20 = 1.79769313e308;
      goto LABEL_17;
    }
    BOOL v50 = [(UITableViewHeaderFooterView *)self _useDetailText];
    int v51 = dyld_program_sdk_at_least();
    if (v50)
    {
      if (v51)
      {
        [v21 _scaledValueForValue:45.0];
        double v53 = v52;
        [(UILabel *)self->_label _firstLineBaselineOffsetFromBoundsTop];
        double rect_24 = v53 - v54;
        $459C830AD401FFB60020A0C1FEE757B7 headerFooterFlags = self->_headerFooterFlags;
        if ((*(unsigned char *)&headerFooterFlags & 0x10) != 0)
        {
          [v21 _scaledValueForValue:10.0];
        }
        else
        {
          if ((*(unsigned char *)&headerFooterFlags & 0x20) != 0) {
            goto LABEL_17;
          }
          if (v4)
          {
            double v56 = [v4 _scrollView];
            [v56 _currentScreenScale];
            double rect_24 = rect_24 - UIPixelBoundaryOffset(0, 17.5, v57);

            goto LABEL_17;
          }
          [(UIView *)self _currentScreenScale];
          double v80 = UIPixelBoundaryOffset(0, 17.5, v81);
        }
        double rect_24 = rect_24 - v80;
        goto LABEL_17;
      }
      v108.origin.double x = v8;
      v108.size.double height = rect_8;
      v108.origin.double y = rect_16;
      v108.size.double width = v15;
      double MaxY = CGRectGetMaxY(v108);
      int v76 = dyld_program_sdk_at_least();
      double v77 = 10.0;
      if (v76) {
        double v77 = 8.0;
      }
      double v78 = MaxY - v77;
      [(UITableViewHeaderFooterView *)self _detailTextSizeForWidth:maxTitleWidth];
      double v27 = v78 - v79 + -10.0 - v20;
    }
    else
    {
      double v70 = 10.0;
      if (v51)
      {
        [v21 _scaledValueForValue:10.0];
        double v70 = v71;
      }
      v106.origin.double x = v8;
      v106.size.double height = rect_8;
      v106.origin.double y = rect_16;
      v106.size.double width = v15;
      double v72 = CGRectGetMaxY(v106);
      v107.origin.double x = v6;
      v107.origin.double y = rect_24;
      v107.size.double width = v19;
      v107.size.double height = v20;
      double v73 = v72 - (v70 + CGRectGetHeight(v107));
      [(UILabel *)self->_label _baselineOffsetFromBottom];
      double v27 = v73 + v74;
    }
  }
  else
  {
    double v22 = 10.0;
    if (dyld_program_sdk_at_least())
    {
      [v21 _scaledValueForValue:10.0];
      double v22 = v23;
    }
    v88.origin.double x = rect;
    v88.size.double height = rect_8;
    v88.origin.double y = rect_16;
    v88.size.double width = v15;
    double v24 = CGRectGetMaxY(v88);
    v89.origin.double x = v6;
    v89.origin.double y = rect_24;
    v89.size.double width = v19;
    v89.size.double height = v20;
    double Height = CGRectGetHeight(v89);
    [(UILabel *)self->_label _baselineOffsetFromBottom];
    double v27 = v24 - (v22 + Height) + v26;
  }
  double rect_24 = v27;
LABEL_17:

LABEL_18:
  int v31 = [(UILabel *)self->_label font];
  [v31 lineHeight];
  double v33 = v32;

  v90.origin.double x = v6;
  v90.origin.double y = rect_24;
  v90.size.double width = v19;
  v90.size.double height = v20;
  if (CGRectGetHeight(v90) < v33)
  {
    CGFloat v34 = v20;
    if (v33 >= rect_8) {
      double v20 = rect_8;
    }
    else {
      double v20 = v33;
    }
    v91.origin.double x = v6;
    v91.origin.double y = rect_24;
    v91.size.double width = v19;
    v91.size.double height = v34;
    double MinY = CGRectGetMinY(v91);
    v92.origin.double x = v6;
    v92.origin.double y = rect_24;
    v92.size.double width = v19;
    v92.size.double height = v34;
    v93.origin.double y = round(MinY + CGRectGetHeight(v92) * 0.5 - v20 * 0.5);
    v93.origin.double x = v6;
    double rect_24 = v93.origin.y;
    v93.size.double width = v19;
    v93.size.double height = v20;
    double v36 = CGRectGetMinY(v93);
    v94.origin.double x = rect;
    v94.origin.double y = rect_16;
    v94.size.double width = v15;
    v94.size.double height = rect_8;
    if (v36 < CGRectGetMinY(v94))
    {
      v95.origin.double x = rect;
      v95.size.double height = rect_8;
      v95.origin.double y = rect_16;
      v95.size.double width = v15;
      double rect_24 = CGRectGetMinY(v95);
    }
    v96.origin.double x = v6;
    v96.origin.double y = rect_24;
    v96.size.double width = v19;
    v96.size.double height = v20;
    double v37 = CGRectGetMaxY(v96);
    v97.origin.double x = rect;
    v97.size.double height = rect_8;
    v97.origin.double y = rect_16;
    v97.size.double width = v15;
    if (v37 > CGRectGetMaxY(v97))
    {
      v98.origin.double x = rect;
      v98.size.double height = rect_8;
      v98.origin.double y = rect_16;
      v98.size.double width = v15;
      double v38 = CGRectGetMaxY(v98);
      v99.origin.double x = v6;
      v99.origin.double y = rect_24;
      v99.size.double width = v19;
      v99.size.double height = v20;
      double rect_24 = rect_24 - (v38 - CGRectGetMaxY(v99));
    }
  }
  double v39 = [(UILabel *)self->_label attributedText];
  uint64_t v40 = objc_msgSend(v39, "_ui_resolvedTextAlignmentForUserInterfaceLayoutDirection:", +[UIView userInterfaceLayoutDirectionForSemanticContentAttribute:](UIView, "userInterfaceLayoutDirectionForSemanticContentAttribute:", -[UIView semanticContentAttribute](self, "semanticContentAttribute")));

  if (v40 == 2)
  {
    v101.origin.double x = rect;
    v101.size.double height = rect_8;
    v101.origin.double y = rect_16;
    v101.size.double width = v15;
    double v44 = ceil(CGRectGetWidth(v101) - v19 - v83);
    if (v44 >= 0.0) {
      double v6 = v44;
    }
    else {
      double v6 = 0.0;
    }
    double v45 = [v4 _scrollView];
    if ([v45 _shouldReverseLayoutDirection])
    {
    }
    else
    {
      int v58 = [v4 _isShowingIndex];

      if (v58)
      {
        [v4 _indexFrame];
        double v6 = v6 - CGRectGetWidth(v102);
      }
    }
  }
  else
  {
    double v41 = rect;
    if (v40 == 1)
    {
      double v47 = rect_8;
      double v46 = rect_16;
      double v48 = v15;
      double v49 = ceil((CGRectGetWidth(*(CGRect *)&v41) - v19) * 0.5);
      if (v49 >= 0.0) {
        double v6 = v49;
      }
      else {
        double v6 = 0.0;
      }
      goto LABEL_50;
    }
    if (!v40)
    {
      CGFloat v42 = objc_msgSend(v4, "_scrollView", rect);
      if ([v42 _shouldReverseLayoutDirection])
      {
        int v43 = [v4 _isShowingIndex];

        if (v43)
        {
          [v4 _indexFrame];
          double v6 = v82 + CGRectGetWidth(v100);
          goto LABEL_50;
        }
      }
      else
      {
      }
      double v6 = v82;
    }
  }
LABEL_50:
  v103.origin.double x = v6;
  v103.origin.double y = rect_24;
  v103.size.double width = v19;
  v103.size.double height = v20;
  double v59 = fmax(CGRectGetWidth(v103), 0.0);
  v104.origin.double x = v6;
  v104.origin.double y = rect_24;
  v104.size.double width = v59;
  v104.size.double height = v20;
  double v60 = fmax(CGRectGetHeight(v104), 0.0);
  v105.origin.double x = v6;
  v105.origin.double y = rect_24;
  v105.size.double width = v59;
  v105.size.double height = v60;
  double v61 = CGRectGetMinY(v105);
  if (v4)
  {
    double v62 = [v4 _scrollView];
    [v62 _currentScreenScale];
    double v64 = UIPixelBoundaryOffset(0, v61, v63);
  }
  else
  {
    [(UIView *)self _currentScreenScale];
    double v64 = UIPixelBoundaryOffset(0, v61, v65);
  }

  double v66 = v6;
  double v67 = v64;
  double v68 = v59;
  double v69 = v60;
  result.size.double height = v69;
  result.size.double width = v68;
  result.origin.double y = v67;
  result.origin.double x = v66;
  return result;
}

- (CGRect)_detailLabelFrame
{
  uint64_t v3 = [(UITableViewHeaderFooterView *)self _table];
  [(UITableViewHeaderFooterView *)self _labelFrame];
  double v5 = v4;
  CGFloat v7 = v6;
  double rect_8 = v8;
  [(UITableViewHeaderFooterView *)self _contentRect];
  CGFloat v10 = v9;
  CGFloat v12 = v11;
  double v14 = v13;
  CGFloat v16 = v15;
  if ([v3 _isShowingIndex])
  {
    [v3 _indexFrame];
    double v14 = v14 - CGRectGetWidth(v52);
  }
  [(UITableViewHeaderFooterView *)self _insetsToContentRect];
  maxTitledouble Width = v14 - v17 - v18;
  if (maxTitleWidth > self->_maxTitleWidth) {
    maxTitledouble Width = self->_maxTitleWidth;
  }
  [(UITableViewHeaderFooterView *)self _detailTextSizeForWidth:maxTitleWidth];
  double v21 = v20;
  double v23 = v22;
  v53.origin.double x = v5;
  CGFloat rect_16 = v7;
  v53.origin.double y = v7;
  v53.size.double width = v21;
  v53.size.double height = v23;
  double MaxY = CGRectGetMaxY(v53);
  CGFloat rect = v10;
  v54.origin.double x = v10;
  CGFloat v25 = v12;
  v54.origin.double y = v12;
  v54.size.double width = v14;
  v54.size.double height = v16;
  CGFloat v26 = v16;
  if (MaxY > CGRectGetMaxY(v54))
  {
    v55.origin.double x = rect;
    v55.origin.double y = v25;
    v55.size.double width = v14;
    v55.size.double height = v16;
    double v27 = CGRectGetMaxY(v55);
    v56.origin.double x = v5;
    v56.origin.double y = rect_16;
    v56.size.double width = v21;
    v56.size.double height = v23;
    double v23 = fmax(v27 - CGRectGetMinY(v56), 0.0);
  }
  BOOL v28 = [(UIView *)self _shouldReverseLayoutDirection];
  double v29 = rect_8 - v21;
  if (!v28) {
    double v29 = -0.0;
  }
  double v30 = v5 + v29;
  if (dyld_program_sdk_at_least())
  {
    v57.origin.double x = rect;
    v57.origin.double y = v25;
    v57.size.double width = v14;
    v57.size.double height = v26;
    double v31 = CGRectGetMaxY(v57);
    double v32 = [(UILabel *)self->_label font];
    int v33 = dyld_program_sdk_at_least();
    double v34 = 10.0;
    if (v33) {
      double v34 = 8.0;
    }
    [v32 _scaledValueForValue:v34];
    double v36 = v35;
    v58.origin.double x = v30;
    v58.origin.double y = rect_16;
    v58.size.double width = v21;
    v58.size.double height = v23;
    double Height = CGRectGetHeight(v58);
    [(UILabel *)self->_detailLabel _baselineOffsetFromBottom];
    double v39 = v31 - (v36 + Height - v38);
  }
  else
  {
    v59.origin.double x = v30;
    v59.origin.double y = rect_16;
    v59.size.double width = v21;
    v59.size.double height = v23;
    double v39 = CGRectGetMaxY(v59) + 10.0;
  }
  v60.origin.double x = v30;
  v60.origin.double y = v39;
  v60.size.double width = v21;
  v60.size.double height = v23;
  double MinY = CGRectGetMinY(v60);
  if (v3)
  {
    double v41 = [v3 _scrollView];
    [v41 _currentScreenScale];
    double v43 = UIPixelBoundaryOffset(0, MinY, v42);
  }
  else
  {
    [(UIView *)self _currentScreenScale];
    double v43 = UIPixelBoundaryOffset(0, MinY, v44);
  }

  double v45 = v30;
  double v46 = v43;
  double v47 = v21;
  double v48 = v23;
  result.size.double height = v48;
  result.size.double width = v47;
  result.origin.double y = v46;
  result.origin.double x = v45;
  return result;
}

- (BOOL)_useDetailText
{
  unint64_t tableViewStyle = self->_tableViewStyle;
  BOOL v3 = tableViewStyle > 0x10;
  uint64_t v4 = (1 << tableViewStyle) & 0x10006;
  BOOL v5 = v3 || v4 == 0;
  if (v5 || (*(unsigned char *)&self->_headerFooterFlags & 1) == 0) {
    return 0;
  }
  CGFloat v7 = [(UILabel *)self->_detailLabel text];
  BOOL v6 = [v7 length] != 0;

  return v6;
}

- (CGSize)_sizeThatFits:(CGSize)a3 stripPaddingForAbuttingView:(BOOL)a4 isTopHeader:(BOOL)a5
{
  BOOL v6 = a4;
  double width = a3.width;
  p_label = &self->_label;
  label = self->_label;
  if (label)
  {
    [(UIView *)label frame];
    if (CGRectGetWidth(v96) <= 0.0
      || ([(UIView *)*p_label frame], a3.double width = CGRectGetHeight(v97), a3.width <= 0.0))
    {
      [(UIView *)self setNeedsLayout];
    }
  }
  p_detailLabel = &self->_detailLabel;
  detailLabel = self->_detailLabel;
  if (detailLabel)
  {
    [(UIView *)detailLabel frame];
    if (CGRectGetWidth(v98) <= 0.0
      || ([(UIView *)*p_detailLabel frame], a3.double width = CGRectGetHeight(v99), a3.width <= 0.0))
    {
      [(UIView *)self setNeedsLayout];
    }
  }
  [(UIView *)self layoutIfNeeded];
  double v13 = [(UITableViewHeaderFooterView *)self _table];
  [(UITableViewHeaderFooterView *)self _insetsToBounds];
  double v16 = v14 + v15;
  if (width - (v14 + v15) <= self->_maxTitleWidth) {
    maxTitledouble Width = width - (v14 + v15);
  }
  else {
    maxTitledouble Width = self->_maxTitleWidth;
  }
  [(UITableViewHeaderFooterView *)self _textSizeForWidth:maxTitleWidth];
  double v19 = v18;
  double v21 = v20;
  double v22 = [(UIView *)self traitCollection];
  uint64_t v23 = [v22 userInterfaceIdiom];

  if (v23 == 6)
  {
    [(UITableConstants *)self->_constants defaultHeaderFooterLayoutMarginsForTableViewStyle:self->_tableViewStyle isHeader:*(_DWORD *)&self->_headerFooterFlags & 1 isFirstSection:(*(_DWORD *)&self->_headerFooterFlags >> 5) & 1];
    double v26 = v25 + v21 + v24;
  }
  else
  {
    unint64_t tableViewStyle = self->_tableViewStyle;
    BOOL v28 = tableViewStyle > 0x10;
    uint64_t v29 = (1 << tableViewStyle) & 0x10006;
    BOOL v30 = v28 || v29 == 0;
    if (v30 || [(UITableViewHeaderFooterView *)self _isSourceListOrMacIdiom])
    {
      constants = self->_constants;
      double v32 = [(UITableViewHeaderFooterView *)self table];
      [(UITableConstants *)constants defaultSectionHeaderHeightForTableView:v32];
      double v26 = v33;
    }
    else
    {
      int v34 = dyld_program_sdk_at_least();
      $459C830AD401FFB60020A0C1FEE757B7 headerFooterFlags = self->_headerFooterFlags;
      if (v34 && (*(unsigned char *)&headerFooterFlags & 1) != 0)
      {
        double v36 = [(UILabel *)*p_label font];
        [v36 _scaledValueForValue:45.0];
        double v38 = v37;
        double v39 = [(UILabel *)*p_label font];
        [v39 lineHeight];
        double v41 = v21 + v38 - v40;

        BOOL v42 = [(UITableViewHeaderFooterView *)self _useDetailText];
        double v43 = 10.0;
        if (v42)
        {
          [(UITableViewHeaderFooterView *)self _detailTextSizeForWidth:maxTitleWidth];
          double v45 = v41 + v44;
          int v46 = dyld_program_sdk_at_least();
          double v47 = 20.0;
          if (v46) {
            double v47 = 16.0;
          }
          [v36 _scaledValueForValue:v47];
          double v49 = v48;
          BOOL v50 = [(UILabel *)*p_detailLabel font];
          [v50 lineHeight];
          double v41 = v45 + v49 - v51;

          int v52 = dyld_program_sdk_at_least();
          double v43 = 10.0;
          if (v52) {
            double v43 = 8.0;
          }
        }
        [v36 _scaledValueForValue:v43];
        double v26 = v41 + v53;
        if (v6)
        {
          double v26 = v26 + -10.0;
        }
        else if (!a5)
        {
          if (v13)
          {
            double v63 = [v13 _scrollView];
            [v63 _currentScreenScale];
            double v26 = v26 - UIPixelBoundaryOffset(0, 17.5, v64);
          }
          else
          {
            [(UIView *)self _currentScreenScale];
            double v26 = v26 - UIPixelBoundaryOffset(0, 17.5, v83);
          }
        }
        [(UIView *)self _currentScreenScale];
        if (v26 < UIPixelBoundaryOffset(0, 17.5, v84))
        {
          [(UIView *)self _currentScreenScale];
          double v26 = UIPixelBoundaryOffset(0, 17.5, v85);
        }
      }
      else if (*(unsigned char *)&headerFooterFlags)
      {
        if ([(UITableViewHeaderFooterView *)self _useDetailText])
        {
          if (dyld_program_sdk_at_least()) {
            double v65 = 61.0;
          }
          else {
            double v65 = 65.0;
          }
          int v66 = dyld_program_sdk_at_least();
          double v67 = 10.0;
          if (v66) {
            double v67 = 8.0;
          }
          double v68 = v65 + v67;
          double v69 = [(UILabel *)*p_label font];
          [v69 lineHeight];
          double v71 = v70;
          double v72 = [(UILabel *)*p_detailLabel font];
          [v72 lineHeight];
          double v74 = v68 - (v71 + v73);
        }
        else
        {
          [(UILabel *)*p_label _firstLineBaselineOffsetFromBoundsTop];
          double v79 = v78;
          [(UILabel *)*p_label _baselineOffsetFromBottom];
          double v74 = 55.0 - (v79 + v80);
        }
        double v26 = v21 + v74;
        if (v6)
        {
          double v26 = v26 + -10.0;
        }
        else if (!a5)
        {
          if (v13)
          {
            double v81 = [v13 _scrollView];
            [v81 _currentScreenScale];
            double v26 = v26 - UIPixelBoundaryOffset(0, 17.5, v82);
          }
          else
          {
            [(UIView *)self _currentScreenScale];
            double v26 = v26 - UIPixelBoundaryOffset(0, 17.5, v92);
          }
        }
        [(UIView *)self _currentScreenScale];
        if (v26 < UIPixelBoundaryOffset(0, 17.5, v93))
        {
          [(UIView *)self _currentScreenScale];
          double v26 = UIPixelBoundaryOffset(0, 17.5, v94);
        }
      }
      else if (dyld_program_sdk_at_least())
      {
        if (dyld_program_sdk_at_least()) {
          CGRect v54 = p_label;
        }
        else {
          CGRect v54 = &self->_detailLabel;
        }
        CGRect v55 = [(UILabel *)*v54 font];
        [v55 _scaledValueForValue:20.0];
        double v57 = v56;
        [v55 _scaledValueForValue:10.0];
        double v59 = v58;
        [(UILabel *)*p_label _firstLineBaselineOffsetFromBoundsTop];
        double v61 = v60;
        [(UILabel *)*p_label _baselineOffsetFromBottom];
        double v26 = v59 + v21 + v57 - (v61 + v62);
      }
      else
      {
        [(UILabel *)*p_label _firstLineBaselineOffsetFromBoundsTop];
        double v76 = v75;
        [(UILabel *)*p_label _baselineOffsetFromBottom];
        double v26 = v21 + 20.0 - (v76 + v77) + 10.0;
      }
    }
  }
  if (v13)
  {
    v86 = [v13 _scrollView];
    [v86 _currentScreenScale];
    double v88 = UIPixelBoundaryOffset(1, v26, v87);
  }
  else
  {
    [(UIView *)self _currentScreenScale];
    double v88 = UIPixelBoundaryOffset(1, v26, v89);
  }

  double v90 = v16 + v19;
  double v91 = v88;
  result.double height = v91;
  result.double width = v90;
  return result;
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double height = a3.height;
  double width = a3.width;
  [(UITableViewHeaderFooterView *)self _performConfigurationStateUpdate];
  $459C830AD401FFB60020A0C1FEE757B7 headerFooterFlags = self->_headerFooterFlags;
  if ((*(_WORD *)&headerFooterFlags & 0x8000) != 0)
  {
    [(UITableViewHeaderFooterView *)self _contentRectForWidth:width];
    double v10 = v9;
    -[UIView setFrame:](self->_contentView, "setFrame:");
    double v13 = 1.79769313e308;
    if (width == 0.0) {
      double v14 = 1.79769313e308;
    }
    else {
      double v14 = v10;
    }
    if (height != 0.0) {
      double v13 = height;
    }
    contentView = self->_contentView;
    LODWORD(v11) = 1112014848;
    LODWORD(v12) = 1112014848;
    -[UIView systemLayoutSizeFittingSize:withHorizontalFittingPriority:verticalFittingPriority:](contentView, "systemLayoutSizeFittingSize:withHorizontalFittingPriority:verticalFittingPriority:", v14, v13, v11, v12);
  }
  else
  {
    -[UITableViewHeaderFooterView _sizeThatFits:stripPaddingForAbuttingView:isTopHeader:](self, "_sizeThatFits:stripPaddingForAbuttingView:isTopHeader:", (*(unsigned int *)&headerFooterFlags >> 4) & 1, (*(unsigned int *)&headerFooterFlags >> 5) & 1, width, height);
  }
  result.double height = v8;
  result.double width = v7;
  return result;
}

- (void)_setBackgroundViewConfiguration:(id)a3
{
  $459C830AD401FFB60020A0C1FEE757B7 headerFooterFlags = self->_headerFooterFlags;
  int v4 = (*(unsigned int *)&headerFooterFlags >> 13) & 1;
  if (a3) {
    int v4 = 1;
  }
  if (v4) {
    int v5 = 0x2000;
  }
  else {
    int v5 = 0;
  }
  self->_$459C830AD401FFB60020A0C1FEE757B7 headerFooterFlags = ($459C830AD401FFB60020A0C1FEE757B7)(v5 | *(_DWORD *)&headerFooterFlags & 0xFFFFDFFF);
  -[UITableViewHeaderFooterView _applyBackgroundViewConfiguration:withState:](self, "_applyBackgroundViewConfiguration:withState:");
}

- (UIBackgroundConfiguration)backgroundConfiguration
{
  uint64_t v2 = [(_UISystemBackgroundView *)self->_systemBackgroundView configuration];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    BOOL v3 = v2;
  }
  else {
    BOOL v3 = 0;
  }
  int v4 = v3;

  return v4;
}

- (_UIBackgroundViewConfiguration)_backgroundViewConfiguration
{
  uint64_t v2 = [(_UISystemBackgroundView *)self->_systemBackgroundView configuration];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    BOOL v3 = v2;
  }
  else {
    BOOL v3 = 0;
  }
  int v4 = v3;

  return v4;
}

- (void)setAutomaticallyUpdatesBackgroundConfiguration:(BOOL)automaticallyUpdatesBackgroundConfiguration
{
  if (automaticallyUpdatesBackgroundConfiguration)
  {
    id backgroundViewConfigurationProvider = self->_backgroundViewConfigurationProvider;
    p_$459C830AD401FFB60020A0C1FEE757B7 headerFooterFlags = &self->_headerFooterFlags;
    $459C830AD401FFB60020A0C1FEE757B7 headerFooterFlags = self->_headerFooterFlags;
    if ((backgroundViewConfigurationProvider == 0) != ((*(_DWORD *)&headerFooterFlags & 0x20000) == 0)) {
      return;
    }
    if (!backgroundViewConfigurationProvider)
    {
      *p_$459C830AD401FFB60020A0C1FEE757B7 headerFooterFlags = ($459C830AD401FFB60020A0C1FEE757B7)(*(_DWORD *)&headerFooterFlags | 0x20000);
      [(UITableViewHeaderFooterView *)self setNeedsUpdateConfiguration];
      return;
    }
  }
  else
  {
    p_$459C830AD401FFB60020A0C1FEE757B7 headerFooterFlags = &self->_headerFooterFlags;
    $459C830AD401FFB60020A0C1FEE757B7 headerFooterFlags = self->_headerFooterFlags;
    if ((*(_DWORD *)&headerFooterFlags & 0x20000) == 0) {
      return;
    }
  }
  *p_$459C830AD401FFB60020A0C1FEE757B7 headerFooterFlags = ($459C830AD401FFB60020A0C1FEE757B7)(*(_DWORD *)&headerFooterFlags & 0xFFFDFFFF);
}

- (BOOL)automaticallyUpdatesBackgroundConfiguration
{
  return (*((unsigned __int8 *)&self->_headerFooterFlags + 2) >> 1) & 1;
}

- (void)_setBackgroundViewConfigurationProvider:(id)a3
{
  $459C830AD401FFB60020A0C1FEE757B7 headerFooterFlags = self->_headerFooterFlags;
  int v4 = (*(unsigned int *)&headerFooterFlags >> 12) & 1;
  if (a3) {
    int v4 = 1;
  }
  if (v4) {
    int v5 = 4096;
  }
  else {
    int v5 = 0;
  }
  unsigned int v6 = v5 | *(_DWORD *)&headerFooterFlags & 0xFFFFEFFF;
  self->_$459C830AD401FFB60020A0C1FEE757B7 headerFooterFlags = ($459C830AD401FFB60020A0C1FEE757B7)v6;
  if (self->_backgroundViewConfigurationProvider != a3)
  {
    if (a3) {
      self->_$459C830AD401FFB60020A0C1FEE757B7 headerFooterFlags = ($459C830AD401FFB60020A0C1FEE757B7)(v6 & 0xFFFDFFFF);
    }
    id v8 = a3;
    double v9 = (void *)[v8 copy];
    id backgroundViewConfigurationProvider = self->_backgroundViewConfigurationProvider;
    self->_id backgroundViewConfigurationProvider = v9;

    [(UITableViewHeaderFooterView *)self setNeedsUpdateConfiguration];
  }
}

- (id)_backgroundViewConfigurationProvider
{
  uint64_t v2 = _Block_copy(self->_backgroundViewConfigurationProvider);
  return v2;
}

- (void)_resetBackgroundViewConfiguration
{
  v2[0] = MEMORY[0x1E4F143A8];
  v2[1] = 3221225472;
  v2[2] = __64__UITableViewHeaderFooterView__resetBackgroundViewConfiguration__block_invoke;
  v2[3] = &unk_1E52D9F70;
  v2[4] = self;
  +[UIView _performSystemAppearanceModifications:v2];
}

uint64_t __64__UITableViewHeaderFooterView__resetBackgroundViewConfiguration__block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) setBackgroundConfiguration:0];
  [*(id *)(a1 + 32) _setBackgroundViewConfigurationProvider:0];
  uint64_t v2 = *(void **)(a1 + 32);
  return [v2 _setBackgroundViewConfiguration:0];
}

- (void)setConfigurationUpdateHandler:(UITableViewHeaderFooterViewConfigurationUpdateHandler)configurationUpdateHandler
{
  if (self->_configurationUpdateHandler != configurationUpdateHandler)
  {
    int v4 = (void *)[configurationUpdateHandler copy];
    id v5 = self->_configurationUpdateHandler;
    self->_configurationUpdateHandler = v4;

    [(UITableViewHeaderFooterView *)self setNeedsUpdateConfiguration];
  }
}

- (void)_prepareForConfigurationStateUpdate
{
  if ((*((unsigned char *)&self->_headerFooterFlags + 1) & 0x40) != 0)
  {
    if (+[UIView _isInAnimationBlockWithAnimationsEnabled])
    {
      v3[0] = MEMORY[0x1E4F143A8];
      v3[1] = 3221225472;
      v3[2] = __66__UITableViewHeaderFooterView__prepareForConfigurationStateUpdate__block_invoke;
      v3[3] = &unk_1E52D9F70;
      v3[4] = self;
      +[UIView performWithoutAnimation:v3];
    }
  }
}

uint64_t __66__UITableViewHeaderFooterView__prepareForConfigurationStateUpdate__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _performConfigurationStateUpdate];
}

- (void)setNeedsUpdateConfiguration
{
  if (dyld_program_sdk_at_least())
  {
    *(_DWORD *)&self->_headerFooterFlags |= 0x4000u;
    if (+[UIView _isInAnimationBlockWithAnimationsEnabled])
    {
      [(UITableViewHeaderFooterView *)self _performConfigurationStateUpdate];
    }
    else
    {
      [(UIView *)self setNeedsLayout];
    }
  }
}

- (UIView)backgroundView
{
  return self->_backgroundView;
}

- (void)_setupBackgroundView
{
  if (!self->_backgroundView && !self->_systemBackgroundView && !self->_backgroundViewConfigurationProvider)
  {
    BOOL v3 = [_UITableViewHeaderFooterViewBackground alloc];
    [(UITableViewHeaderFooterView *)self _backgroundRect];
    int v4 = -[_UITableViewHeaderFooterViewBackground initWithFrame:](v3, "initWithFrame:");
    [(UITableViewHeaderFooterView *)self setBackgroundView:v4];
  }
}

- (void)_safeAreaInsetsDidChangeFromOldInsets:(UIEdgeInsets)a3
{
  double right = a3.right;
  double bottom = a3.bottom;
  double left = a3.left;
  double top = a3.top;
  [(UIView *)self safeAreaInsets];
  if (left != v9 || right != v8) {
    [(UIView *)self setNeedsLayout];
  }
  v11.receiver = self;
  v11.super_class = (Class)UITableViewHeaderFooterView;
  -[UIView _safeAreaInsetsDidChangeFromOldInsets:](&v11, sel__safeAreaInsetsDidChangeFromOldInsets_, top, left, bottom, right);
}

- (double)_marginWidth
{
  double result = self->_leadingMarginWidth;
  if (result == -1.0) {
    return 15.0;
  }
  return result;
}

- (double)_rightMarginWidth
{
  double result = self->_trailingMarginWidth;
  if (result == -1.0) {
    return 0.0;
  }
  return result;
}

- (UIEdgeInsets)_insetsToBounds
{
  BOOL v3 = [(UITableViewHeaderFooterView *)self _table];
  if ([v3 _supplementarySectionHeadersHugContent]
    && (*(unsigned char *)&self->_headerFooterFlags & 1) != 0
    || [v3 _supplementariesFollowSectionContentInsets])
  {
    [(UITableConstants *)self->_constants defaultHeaderFooterLayoutMarginsForTableViewStyle:[(UITableViewHeaderFooterView *)self tableViewStyle] isHeader:*(_DWORD *)&self->_headerFooterFlags & 1 isFirstSection:[(UITableViewHeaderFooterView *)self _isTopHeader]];
    double v5 = v4;
    double v7 = v6;
  }
  else
  {
    double v8 = [v3 _scrollView];
    if (v8)
    {
      double v9 = [v3 _scrollView];
      int v10 = [v9 _shouldReverseLayoutDirection];
    }
    else
    {
      int v10 = 0;
    }

    [(UITableViewHeaderFooterView *)self _marginWidth];
    double v7 = v11;
    int v12 = dyld_program_sdk_at_least();
    [(UITableViewHeaderFooterView *)self _rightMarginWidth];
    double v14 = v13;
    if (v12)
    {
      [(UITableViewHeaderFooterView *)self _contentRect];
      CGFloat v19 = v15;
      CGFloat v20 = v16;
      CGFloat v21 = v17;
      CGFloat v22 = v18;
      if (v10)
      {
        double MinX = CGRectGetMinX(*(CGRect *)&v15);
        [(UIView *)self bounds];
        double v24 = MinX - CGRectGetMinX(v31);
      }
      else
      {
        [(UIView *)self bounds];
        double MaxX = CGRectGetMaxX(v32);
        v33.origin.double x = v19;
        v33.origin.double y = v20;
        v33.size.double width = v21;
        v33.size.double height = v22;
        double v24 = MaxX - CGRectGetMaxX(v33);
      }
      double v25 = v14 + v24;
    }
    else
    {
      double v25 = fmax(v7, v13);
    }
    if (v10) {
      double v5 = v25;
    }
    else {
      double v5 = v7;
    }
    if (!v10) {
      double v7 = v25;
    }
  }

  double v27 = 0.0;
  double v28 = 0.0;
  double v29 = v5;
  double v30 = v7;
  result.double right = v30;
  result.double bottom = v28;
  result.double left = v29;
  result.double top = v27;
  return result;
}

- (UIEdgeInsets)_insetsToContentRect
{
  [(UITableViewHeaderFooterView *)self _insetsToBounds];
  double v4 = v3;
  double v6 = v5;
  [(UITableViewHeaderFooterView *)self _contentRect];
  CGFloat x = v17.origin.x;
  CGFloat y = v17.origin.y;
  CGFloat width = v17.size.width;
  CGFloat height = v17.size.height;
  double v11 = fmax(v4 - CGRectGetMinX(v17), 0.0);
  [(UIView *)self bounds];
  double v12 = CGRectGetWidth(v18);
  v19.origin.CGFloat x = x;
  v19.origin.CGFloat y = y;
  v19.size.CGFloat width = width;
  v19.size.CGFloat height = height;
  double v13 = fmax(v6 - (v12 - CGRectGetMaxX(v19)), 0.0);
  double v14 = 0.0;
  double v15 = 0.0;
  double v16 = v11;
  result.double right = v13;
  result.double bottom = v15;
  result.double left = v16;
  result.double top = v14;
  return result;
}

- (BOOL)_isFloating
{
  return (*(unsigned char *)&self->_headerFooterFlags >> 3) & 1;
}

- (BOOL)floating
{
  return (*(unsigned char *)&self->_headerFooterFlags >> 3) & 1;
}

- (void)setBackgroundColor:(id)a3
{
  double v3 = *(NSObject **)(__UILogGetCategoryCachedImpl("TableView", setBackgroundColor____s_category) + 8);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)double v4 = 0;
    _os_log_impl(&dword_1853B0000, v3, OS_LOG_TYPE_ERROR, "Changing the background color of UITableViewHeaderFooterView is not supported. Use the background view configuration instead.", v4, 2u);
  }
}

- (BOOL)_forwardsSystemLayoutFittingSizeToContentView:(id)a3
{
  if (self->_contentView != a3 || ![a3 _wantsAutolayout]) {
    return 0;
  }
  double v4 = [(UIView *)self->_contentView subviews];
  BOOL v5 = [v4 count] != 0;

  return v5;
}

void __113__UITableViewHeaderFooterView_systemLayoutSizeFittingSize_withHorizontalFittingPriority_verticalFittingPriority___block_invoke(uint64_t a1)
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = *(NSObject **)(__UILogGetCategoryCachedImpl("Warning", &_UIInternalPreference_LabelDisableDefaultClipping_block_invoke___s_category_1)+ 8);
  if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
  {
    uint64_t v3 = *(void *)(a1 + 32);
    int v4 = 138412290;
    uint64_t v5 = v3;
    _os_log_impl(&dword_1853B0000, v2, OS_LOG_TYPE_ERROR, "Custom views and layout for UITableViewHeaderFooterView should be contained within the content view. Offending view: %@", (uint8_t *)&v4, 0xCu);
  }
}

- (void)setNeedsUpdateConstraints
{
  [(UIView *)self->_contentView setNeedsUpdateConstraints];
  [(UIView *)self _setNeedsUpdateConstraints];
  uint64_t v3 = [(UIView *)self _layoutEngine];
  if (v3)
  {
  }
  else if ((*(void *)&self->super._viewFlags & 0x8000000000000000) == 0)
  {
    [(UIView *)self setNeedsLayout];
  }
}

- (void)setTranslatesAutoresizingMaskIntoConstraints:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  if (!a3)
  {
    if ([(UIView *)self translatesAutoresizingMaskIntoConstraints])
    {
      if (dyld_program_sdk_at_least())
      {
        uint64_t v5 = *(NSObject **)(__UILogGetCategoryCachedImpl("LayoutConstraints", &setTranslatesAutoresizingMaskIntoConstraints____s_category_166)+ 8);
        if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138412290;
          double v8 = self;
          _os_log_impl(&dword_1853B0000, v5, OS_LOG_TYPE_ERROR, "Changing the translatesAutoresizingMaskIntoConstraints property of a UITableViewHeaderFooterView that is managed by a UITableView is not supported, and will result in incorrect self-sizing. View: %@", buf, 0xCu);
        }
      }
    }
  }
  v6.receiver = self;
  v6.super_class = (Class)UITableViewHeaderFooterView;
  [(UIView *)&v6 setTranslatesAutoresizingMaskIntoConstraints:v3];
}

- (void)setTintColor:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(UIView *)self _interactionTintColor];
  v7.receiver = self;
  v7.super_class = (Class)UITableViewHeaderFooterView;
  [(UIView *)&v7 setTintColor:v4];

  objc_super v6 = [(UIView *)self _interactionTintColor];
  if (v5 != v6)
  {
    [(UITableViewHeaderFooterView *)self _updateBackgroundView];
    [(UITableViewHeaderFooterView *)self _updateDefaultBackgroundAppearance];
  }
}

- (void)_tableViewDidUpdateMarginWidth
{
  if (self->_leadingMarginWidth == -1.0)
  {
    [(UIView *)self setNeedsLayout];
    [(UIView *)self layoutBelowIfNeeded];
  }
}

- (BOOL)_stripPadding
{
  return (*(unsigned char *)&self->_headerFooterFlags >> 4) & 1;
}

- (BOOL)_isTransparentFocusRegion
{
  BOOL v3 = [(UIView *)self traitCollection];
  if ([v3 userInterfaceIdiom] == 3)
  {
    BOOL v4 = 1;
  }
  else
  {
    v6.receiver = self;
    v6.super_class = (Class)UITableViewHeaderFooterView;
    BOOL v4 = [(UIView *)&v6 _isTransparentFocusRegion];
  }

  return v4;
}

- (void)_willUpdateFocusInContext:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)UITableViewHeaderFooterView;
  [(UIView *)&v8 _willUpdateFocusInContext:v4];
  uint64_t v5 = [v4 previouslyFocusedView];
  if (v5 == self)
  {

LABEL_5:
    [(UITableViewHeaderFooterView *)self _prepareForConfigurationStateUpdate];
    goto LABEL_6;
  }
  objc_super v6 = v5;
  objc_super v7 = [v4 nextFocusedView];

  if (v7 == self) {
    goto LABEL_5;
  }
LABEL_6:
}

- (void)_didUpdateFocusInContext:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)UITableViewHeaderFooterView;
  [(UIView *)&v8 _didUpdateFocusInContext:v4];
  uint64_t v5 = [v4 previouslyFocusedView];
  if (v5 == self)
  {

LABEL_5:
    [(UITableViewHeaderFooterView *)self setNeedsUpdateConfiguration];
    goto LABEL_6;
  }
  objc_super v6 = v5;
  objc_super v7 = [v4 nextFocusedView];

  if (v7 == self) {
    goto LABEL_5;
  }
LABEL_6:
}

- (void)setReuseIdentifier:(id)a3
{
}

- (UITable)table
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_table);
  return (UITable *)WeakRetained;
}

- (void)setTable:(id)a3
{
}

- (double)maxTitleWidth
{
  return self->_maxTitleWidth;
}

- (UIImage)backgroundImage
{
  return self->_backgroundImage;
}

- (void)setBackgroundImage:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_configurationUpdateHandler, 0);
  objc_destroyWeak((id *)&self->_table);
  objc_storeStrong((id *)&self->_constants, 0);
  objc_storeStrong(&self->_backgroundViewConfigurationProvider, 0);
  objc_storeStrong((id *)&self->_systemBackgroundView, 0);
  objc_storeStrong(&self->_contentViewConfigurationProvider, 0);
  objc_storeStrong((id *)&self->_viewForContentConfiguration, 0);
  objc_storeStrong((id *)&self->_contentView, 0);
  objc_storeStrong((id *)&self->_detailLabel, 0);
  objc_storeStrong((id *)&self->_label, 0);
  objc_storeStrong((id *)&self->_backgroundView, 0);
  objc_storeStrong((id *)&self->_reuseIdentifier, 0);
  objc_storeStrong((id *)&self->_backgroundImage, 0);
}

@end