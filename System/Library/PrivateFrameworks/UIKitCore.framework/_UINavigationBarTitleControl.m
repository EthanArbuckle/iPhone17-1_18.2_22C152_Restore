@interface _UINavigationBarTitleControl
+ (id)titleMenuSuggestedActionsWithDocumentFileURL:(id)a3;
- (BOOL)_inactiveForPointer;
- (BOOL)hasBaseline;
- (BOOL)isInteractive;
- (CGPoint)menuAttachmentPointForConfiguration:(id)a3;
- (CGSize)availableSizeForAdaptor:(id)a3 proposedSize:(CGSize)result;
- (NSDictionary)titleAttributes;
- (NSString)title;
- (UIDocumentProperties)documentProperties;
- (UIEdgeInsets)menuAlignmentInsets;
- (UILabel)titleLabel;
- (UILayoutGuide)titleLayoutGuide;
- (UIView)effectiveTitleView;
- (UIView)titleView;
- (_UINavigationBarTitleControl)initWithFrame:(CGRect)a3;
- (_UINavigationBarTitleControlVisualProvider)visualProvider;
- (double)contentAlpha;
- (double)controlAlpha;
- (double)trailingPadding;
- (float)titleViewCompressionResistancePriority;
- (id)_backgroundViewConstraintsForIdiom:(int64_t)a3;
- (id)_baselineView;
- (id)_contextMenuInteraction:(id)a3 overrideSuggestedActionsForConfiguration:(id)a4;
- (id)_contextMenuInteraction:(id)a3 styleForMenuWithConfiguration:(id)a4;
- (id)_debugInfo;
- (id)_preferredPresentationSourceItem;
- (id)_preferredSender;
- (id)_preview;
- (id)contextMenuInteraction:(id)a3 configurationForMenuAtLocation:(CGPoint)a4;
- (id)pointerInteraction:(id)a3 regionForRequest:(id)a4 defaultRegion:(id)a5;
- (id)pointerInteraction:(id)a3 styleForRegion:(id)a4;
- (id)pointerShapeInContainer:(id)a3;
- (id)titleMenuProvider;
- (unint64_t)_controlEventsForActionTriggered;
- (void)_cleanupWrapperView;
- (void)_ensureNecessaryViews;
- (void)_resetTitleViewConstraints;
- (void)_updateContentAlpha;
- (void)_updateControlAlpha;
- (void)_updateInlineTitleView;
- (void)_updateInteractions;
- (void)didMoveToWindow;
- (void)setContentAlpha:(double)a3;
- (void)setControlAlpha:(double)a3;
- (void)setDocumentProperties:(id)a3;
- (void)setHighlighted:(BOOL)a3;
- (void)setMenuAlignmentInsets:(UIEdgeInsets)a3;
- (void)setTitle:(id)a3;
- (void)setTitleAttributes:(id)a3;
- (void)setTitleLayoutGuide:(id)a3;
- (void)setTitleMenuProvider:(id)a3;
- (void)setTitleView:(id)a3;
- (void)setTitleViewCompressionResistancePriority:(float)a3;
- (void)setVisualProvider:(id)a3;
- (void)updateConstraints;
@end

@implementation _UINavigationBarTitleControl

- (void)didMoveToWindow
{
  v3 = [(UIView *)self window];

  if (v3)
  {
    [(UIView *)self setNeedsUpdateConstraints];
  }
}

- (void)updateConstraints
{
  v58[4] = *MEMORY[0x1E4F143B8];
  v55.receiver = self;
  v55.super_class = (Class)_UINavigationBarTitleControl;
  [(UIView *)&v55 updateConstraints];
  v54[0] = MEMORY[0x1E4F143A8];
  v54[1] = 3221225472;
  v54[2] = __49___UINavigationBarTitleControl_updateConstraints__block_invoke;
  v54[3] = &unk_1E52D9F70;
  v54[4] = self;
  +[UIView performWithoutAnimation:v54];
  if (self->_inlineTitleView)
  {
    [(_UINavigationBarTitleControl *)self _updateInlineTitleView];
    *(float *)&double v4 = self->_titleViewCompressionResistancePriority;
    [(UIView *)self->_inlineTitleView setContentCompressionResistancePriority:0 forAxis:v4];
  }
  else
  {
    *(float *)&double v3 = self->_titleViewCompressionResistancePriority;
    [(UIView *)self->_titleView setContentCompressionResistancePriority:0 forAxis:v3];
    [(UIView *)self->_titleView updateConstraintsIfNeeded];
  }
  [(_UINavigationBarTitleControl *)self _updateContentAlpha];
  backgroundView = self->_backgroundView;
  if (backgroundView)
  {
    *(float *)&double v5 = self->_titleViewCompressionResistancePriority;
    [(UIView *)backgroundView setContentCompressionResistancePriority:0 forAxis:v5];
    backgroundViewConstraints = self->_backgroundViewConstraints;
    if (!backgroundViewConstraints)
    {
      v8 = [(UIView *)self traitCollection];
      -[_UINavigationBarTitleControl _backgroundViewConstraintsForIdiom:](self, "_backgroundViewConstraintsForIdiom:", [v8 userInterfaceIdiom]);
      v9 = (NSArray *)objc_claimAutoreleasedReturnValue();
      v10 = self->_backgroundViewConstraints;
      self->_backgroundViewConstraints = v9;

      backgroundViewConstraints = self->_backgroundViewConstraints;
    }
    [MEMORY[0x1E4F5B268] activateConstraints:backgroundViewConstraints];
  }
  else if (self->_backgroundViewConstraints)
  {
    objc_msgSend(MEMORY[0x1E4F5B268], "deactivateConstraints:");
    v11 = self->_backgroundViewConstraints;
    self->_backgroundViewConstraints = 0;
  }
  titleView = (_UITAMICAdaptorView *)self->_titleView;
  if (titleView)
  {
    p_titleConstraints = &self->_titleConstraints;
    titleConstraints = self->_titleConstraints;
    if (!titleConstraints)
    {
      if (self->_wrapperView) {
        titleView = self->_wrapperView;
      }
      v15 = titleView;
      v16 = [(UIView *)v15 leadingAnchor];
      v51 = [(UIView *)self leadingAnchor];
      v52 = v16;
      v50 = [v16 constraintEqualToAnchor:v51];
      v58[0] = v50;
      v17 = [(UIView *)v15 trailingAnchor];
      v48 = [(UILayoutGuide *)self->_chevronGuide leadingAnchor];
      v49 = v17;
      v18 = [v17 constraintEqualToAnchor:v48];
      v58[1] = v18;
      v19 = [(UIView *)v15 topAnchor];
      v20 = [(UIView *)self topAnchor];
      v21 = [v19 constraintEqualToAnchor:v20];
      v58[2] = v21;
      v22 = [(UIView *)v15 bottomAnchor];
      v23 = [(UIView *)self bottomAnchor];
      v24 = [v22 constraintEqualToAnchor:v23];
      v58[3] = v24;
      uint64_t v25 = [MEMORY[0x1E4F1C978] arrayWithObjects:v58 count:4];
      v26 = *p_titleConstraints;
      *p_titleConstraints = (NSArray *)v25;

      goto LABEL_18;
    }
  }
  else
  {
    inlineTitleView = self->_inlineTitleView;
    if (!inlineTitleView) {
      goto LABEL_20;
    }
    p_titleConstraints = &self->_inlineTitleConstraints;
    titleConstraints = self->_inlineTitleConstraints;
    if (!titleConstraints)
    {
      v28 = [(UIView *)inlineTitleView leadingAnchor];
      v51 = [(UIView *)self leadingAnchor];
      v52 = v28;
      v15 = [v28 constraintEqualToAnchor:v51];
      v57[0] = v15;
      v29 = [(UIView *)self->_inlineTitleView trailingAnchor];
      v49 = [(UILayoutGuide *)self->_chevronGuide leadingAnchor];
      v50 = v29;
      v48 = [v29 constraintEqualToAnchor:v49];
      v57[1] = v48;
      v18 = [(UIView *)self->_inlineTitleView topAnchor];
      v19 = [(UIView *)self topAnchor];
      v20 = [v18 constraintEqualToAnchor:v19];
      v57[2] = v20;
      v21 = [(UIView *)self->_inlineTitleView bottomAnchor];
      v22 = [(UIView *)self bottomAnchor];
      v23 = [v21 constraintEqualToAnchor:v22];
      v57[3] = v23;
      uint64_t v30 = [MEMORY[0x1E4F1C978] arrayWithObjects:v57 count:4];
      v24 = *p_titleConstraints;
      *p_titleConstraints = (NSArray *)v30;
LABEL_18:

      titleConstraints = *p_titleConstraints;
    }
  }
  [MEMORY[0x1E4F5B268] activateConstraints:titleConstraints];
LABEL_20:
  chevron = self->_chevron;
  chevronConstraints = self->_chevronConstraints;
  if (chevron)
  {
    if (!chevronConstraints)
    {
      v33 = [(UIView *)chevron leadingAnchor];
      v34 = [(UILayoutGuide *)self->_chevronGuide leadingAnchor];
      visualProvider = self->_visualProvider;
      if (visualProvider) {
        [(_UINavigationBarTitleControlVisualProvider *)visualProvider chevronToTitlePadding];
      }
      else {
        double v36 = 6.0;
      }
      v38 = [v33 constraintEqualToAnchor:v34 constant:v36];
      v56[0] = v38;
      [(UILayoutGuide *)self->_chevronGuide trailingAnchor];
      v39 = v53 = v33;
      v40 = [(UIView *)self->_chevron trailingAnchor];
      v41 = [v39 constraintEqualToAnchor:v40];
      v56[1] = v41;
      v42 = [(UILayoutGuide *)self->_chevronGuide centerYAnchor];
      v43 = [(UIView *)self->_chevron centerYAnchor];
      v44 = [v42 constraintEqualToAnchor:v43];
      v56[2] = v44;
      v45 = [MEMORY[0x1E4F1C978] arrayWithObjects:v56 count:3];
      v46 = self->_chevronConstraints;
      self->_chevronConstraints = v45;

      chevronConstraints = self->_chevronConstraints;
    }
    [MEMORY[0x1E4F5B268] activateConstraints:chevronConstraints];
  }
  else if (chevronConstraints)
  {
    objc_msgSend(MEMORY[0x1E4F5B268], "deactivateConstraints:");
    v37 = self->_chevronConstraints;
    self->_chevronConstraints = 0;
  }
  v47 = [(UIView *)self superview];
  [(NSLayoutConstraint *)self->_sosConstraint setActive:v47 != 0];
}

- (void)_updateInlineTitleView
{
  uint64_t v3 = [(UIView *)self window];
  if (v3 && (double v4 = (void *)v3, v5 = _UIBarsUseDynamicType(), v4, (v5 & 1) != 0))
  {
    uint64_t v6 = [(UIView *)self traitCollection];
  }
  else
  {
    uint64_t v6 = +[UITraitCollection traitCollectionWithPreferredContentSizeCategory:@"UICTContentSizeCategoryL"];
  }
  id v16 = (id)v6;
  uint64_t v7 = *(void *)off_1E52D2040;
  v8 = [(NSDictionary *)self->_titleAttributes objectForKeyedSubscript:*(void *)off_1E52D2040];
  v9 = [v8 _fontAdjustedForContentSizeCategoryCompatibleWithTraitCollection:v16];
  titleAttributes = self->_titleAttributes;
  if (v8 == v9)
  {
    v14 = (NSDictionary *)[(NSDictionary *)titleAttributes copy];
    resolvedAttributes = self->_resolvedAttributes;
    self->_resolvedAttributes = v14;
  }
  else
  {
    resolvedAttributes = (NSDictionary *)[(NSDictionary *)titleAttributes mutableCopy];
    [(NSDictionary *)resolvedAttributes setObject:v9 forKeyedSubscript:v7];
    v12 = (NSDictionary *)[(NSDictionary *)resolvedAttributes copy];
    v13 = self->_resolvedAttributes;
    self->_resolvedAttributes = v12;
  }
  v15 = (void *)[objc_alloc(MEMORY[0x1E4F28B18]) initWithString:self->_title attributes:self->_resolvedAttributes];
  [(UILabel *)self->_inlineTitleView setAttributedText:v15];
}

- (id)_backgroundViewConstraintsForIdiom:(int64_t)a3
{
  v18[4] = *MEMORY[0x1E4F143B8];
  v17 = [(UIView *)self->_backgroundView leadingAnchor];
  id v16 = [(UIView *)self leadingAnchor];
  v15 = [v17 constraintEqualToAnchor:v16];
  v18[0] = v15;
  double v4 = [(UIView *)self->_backgroundView trailingAnchor];
  char v5 = [(UIView *)self trailingAnchor];
  uint64_t v6 = [v4 constraintEqualToAnchor:v5];
  v18[1] = v6;
  uint64_t v7 = [(UIView *)self->_backgroundView topAnchor];
  v8 = [(UIView *)self topAnchor];
  v9 = [v7 constraintEqualToAnchor:v8];
  v18[2] = v9;
  v10 = [(UIView *)self->_backgroundView bottomAnchor];
  v11 = [(UIView *)self bottomAnchor];
  v12 = [v10 constraintEqualToAnchor:v11];
  v18[3] = v12;
  v13 = [MEMORY[0x1E4F1C978] arrayWithObjects:v18 count:4];

  return v13;
}

- (void)setContentAlpha:(double)a3
{
  self->_contentAlpha = a3;
  [(_UINavigationBarTitleControl *)self _updateContentAlpha];
}

- (double)trailingPadding
{
  BOOL v2 = [(_UINavigationBarTitleControl *)self isInteractive];
  double result = 0.0;
  if (v2) {
    return 16.0;
  }
  return result;
}

- (void)_updateContentAlpha
{
  BOOL v3 = [(_UINavigationBarTitleControl *)self isInteractive];
  double contentAlpha = 1.0;
  if (v3) {
    double contentAlpha = self->_contentAlpha;
  }
  [(UIView *)self->_titleView setAlpha:contentAlpha];
  double v5 = self->_contentAlpha;
  backgroundView = self->_backgroundView;
  [(UIView *)backgroundView setAlpha:v5];
}

- (BOOL)isInteractive
{
  return self->_titleMenuProvider || self->_documentProperties != 0;
}

- (_UINavigationBarTitleControlVisualProvider)visualProvider
{
  return self->_visualProvider;
}

- (void)setMenuAlignmentInsets:(UIEdgeInsets)a3
{
  self->_menuAlignmentInsets = a3;
}

- (void)setControlAlpha:(double)a3
{
  self->_controlAlpha = a3;
  [(_UINavigationBarTitleControl *)self _updateControlAlpha];
}

- (void)_updateControlAlpha
{
}

- (BOOL)hasBaseline
{
  BOOL v2 = self;
  BOOL v3 = [(_UINavigationBarTitleControl *)self _baselineView];
  LOBYTE(v2) = v3 != v2;

  return (char)v2;
}

- (id)_baselineView
{
  BOOL v2 = self;
  if (!self->_titleView)
  {
    inlineTitleView = self->_inlineTitleView;
    if (!inlineTitleView)
    {
      [(_UINavigationBarTitleControl *)self _ensureNecessaryViews];
      inlineTitleView = v2->_inlineTitleView;
    }
    if (inlineTitleView) {
      BOOL v2 = (_UINavigationBarTitleControl *)inlineTitleView;
    }
  }
  double v4 = v2;
  return v4;
}

- (void)setVisualProvider:(id)a3
{
}

- (_UINavigationBarTitleControl)initWithFrame:(CGRect)a3
{
  v8[2] = *MEMORY[0x1E4F143B8];
  v7.receiver = self;
  v7.super_class = (Class)_UINavigationBarTitleControl;
  BOOL v3 = -[UIControl initWithFrame:](&v7, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    v8[0] = objc_opt_class();
    v8[1] = objc_opt_class();
    double v4 = [MEMORY[0x1E4F1C978] arrayWithObjects:v8 count:2];
    id v5 = [(UIView *)v3 registerForTraitChanges:v4 withAction:sel_setNeedsUpdateConstraints];
  }
  return v3;
}

- (void)_ensureNecessaryViews
{
  v63[2] = *MEMORY[0x1E4F143B8];
  if (!self->_backgroundView)
  {
    visualProvider = self->_visualProvider;
    if (!visualProvider) {
      goto LABEL_4;
    }
    double v4 = [(UIControl *)self contextMenuInteraction];
    id v5 = [(_UINavigationBarTitleControlVisualProvider *)visualProvider backgroundWithInteraction:v4];
    backgroundView = self->_backgroundView;
    self->_backgroundView = v5;

    objc_super v7 = self->_backgroundView;
    if (!v7)
    {
LABEL_4:
      v8 = [UIView alloc];
      v9 = -[UIView initWithFrame:](v8, "initWithFrame:", *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
      [(UIView *)v9 setTranslatesAutoresizingMaskIntoConstraints:0];
      v10 = self->_backgroundView;
      self->_backgroundView = v9;

      objc_super v7 = self->_backgroundView;
    }
    [(UIView *)self addSubview:v7];
  }
  if ([(_UINavigationBarTitleControl *)self isInteractive])
  {
    chevron = self->_chevron;
    if (!chevron)
    {
      v12 = [UIImageView alloc];
      v13 = -[UIImageView initWithFrame:](v12, "initWithFrame:", *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
      v14 = self->_chevron;
      self->_chevron = v13;

      v15 = +[UIImage systemImageNamed:@"chevron.down.circle.fill"];
      id v16 = self->_visualProvider;
      if (v16)
      {
        uint64_t v17 = [(_UINavigationBarTitleControlVisualProvider *)v16 chevronImage];
        v18 = (void *)v17;
        if (v17) {
          v19 = (void *)v17;
        }
        else {
          v19 = v15;
        }
        [(UIImageView *)self->_chevron setImage:v19];

        v20 = [(_UINavigationBarTitleControlVisualProvider *)self->_visualProvider chevronSymbolConfiguration];
        [(UIImageView *)self->_chevron setPreferredSymbolConfiguration:v20];
      }
      else
      {
        [(UIImageView *)self->_chevron setImage:v15];
        v61 = +[UIImageSymbolConfiguration configurationWithTextStyle:@"UICTFontTextStyleHeadline" scale:-1];
        v23 = +[UIColor secondaryLabelColor];
        v63[0] = v23;
        v24 = +[UIColor secondarySystemFillColor];
        v63[1] = v24;
        uint64_t v25 = [MEMORY[0x1E4F1C978] arrayWithObjects:v63 count:2];
        v26 = +[UIImageSymbolConfiguration configurationWithPaletteColors:v25];
        v27 = [v61 configurationByApplyingConfiguration:v26];
        [(UIImageView *)self->_chevron setPreferredSymbolConfiguration:v27];
      }
      [(UIImageView *)self->_chevron setTranslatesAutoresizingMaskIntoConstraints:0];
      LODWORD(v28) = 1148829696;
      [(UIView *)self->_chevron setContentCompressionResistancePriority:0 forAxis:v28];

      chevron = self->_chevron;
    }
    [(UIView *)self->_backgroundView addSubview:chevron];
  }
  else
  {
    if (self->_chevronConstraints)
    {
      objc_msgSend(MEMORY[0x1E4F5B268], "deactivateConstraints:");
      chevronConstraints = self->_chevronConstraints;
      self->_chevronConstraints = 0;
    }
    [(UIView *)self->_chevron removeFromSuperview];
    v22 = self->_chevron;
    self->_chevron = 0;
  }
  if (!self->_chevronGuide)
  {
    v29 = objc_alloc_init(UILayoutGuide);
    chevronGuide = self->_chevronGuide;
    self->_chevronGuide = v29;

    [(UILayoutGuide *)self->_chevronGuide setIdentifier:@"TitleChevronGuide"];
    [(UIView *)self addLayoutGuide:self->_chevronGuide];
    v31 = [(UILayoutGuide *)self->_chevronGuide widthAnchor];
    v32 = [v31 constraintEqualToConstant:0.0];

    LODWORD(v33) = 1130430464;
    [v32 setPriority:v33];
    v57 = (void *)MEMORY[0x1E4F5B268];
    v60 = [(UILayoutGuide *)self->_chevronGuide trailingAnchor];
    v59 = [(UIView *)self trailingAnchor];
    v58 = [v60 constraintEqualToAnchor:v59];
    v62[0] = v58;
    v34 = [(UILayoutGuide *)self->_chevronGuide topAnchor];
    v35 = [(UIView *)self topAnchor];
    double v36 = [v34 constraintEqualToAnchor:v35];
    v62[1] = v36;
    v37 = [(UILayoutGuide *)self->_chevronGuide bottomAnchor];
    v38 = [(UIView *)self bottomAnchor];
    v39 = [v37 constraintEqualToAnchor:v38];
    v62[2] = v39;
    v62[3] = v32;
    v40 = [MEMORY[0x1E4F1C978] arrayWithObjects:v62 count:4];
    [v57 activateConstraints:v40];
  }
  if (self->_titleView)
  {
    BOOL v41 = +[_UITAMICAdaptorView shouldWrapView:](_UITAMICAdaptorView, "shouldWrapView:");
    wrapperView = self->_wrapperView;
    if (v41)
    {
      if (wrapperView)
      {
        v43 = [(_UITAMICAdaptorView *)wrapperView view];
        titleView = self->_titleView;

        if (v43 == titleView) {
          goto LABEL_37;
        }
      }
      [(_UINavigationBarTitleControl *)self _resetTitleViewConstraints];
      [(_UINavigationBarTitleControl *)self _cleanupWrapperView];
      v45 = [[_UITAMICAdaptorView alloc] initWithView:self->_titleView];
      v46 = self->_wrapperView;
      self->_wrapperView = v45;

      LODWORD(v47) = 1134723072;
      [(_UITAMICAdaptorView *)self->_wrapperView setSizingPriority:v47];
      [(_UITAMICAdaptorView *)self->_wrapperView setDelegate:self];
      v48 = self->_wrapperView;
    }
    else
    {
      if (wrapperView)
      {
        [(_UINavigationBarTitleControl *)self _resetTitleViewConstraints];
        [(_UINavigationBarTitleControl *)self _cleanupWrapperView];
      }
      [(UIView *)self->_titleView setTranslatesAutoresizingMaskIntoConstraints:0];
      v48 = (_UITAMICAdaptorView *)self->_titleView;
    }
    [(UIView *)self addSubview:v48];
LABEL_37:
    if (self->_inlineTitleConstraints)
    {
      objc_msgSend(MEMORY[0x1E4F5B268], "deactivateConstraints:");
      inlineTitleConstraints = self->_inlineTitleConstraints;
      self->_inlineTitleConstraints = 0;
    }
    [(UIView *)self->_inlineTitleView removeFromSuperview];
    inlineTitleView = self->_inlineTitleView;
    self->_inlineTitleView = 0;

    goto LABEL_40;
  }
  if (!self->_title)
  {
    if (self->_titleConstraints)
    {
      objc_msgSend(MEMORY[0x1E4F5B268], "deactivateConstraints:");
      titleConstraints = self->_titleConstraints;
      self->_titleConstraints = 0;
    }
    [(_UINavigationBarTitleControl *)self _cleanupWrapperView];
    [(UIView *)self->_titleView removeFromSuperview];
    v53 = self->_titleView;
    self->_titleView = 0;

    goto LABEL_37;
  }
  v49 = self->_inlineTitleView;
  if (!v49)
  {
    v50 = objc_alloc_init(UILabel);
    v51 = self->_inlineTitleView;
    self->_inlineTitleView = v50;

    [(UIView *)self->_inlineTitleView setTranslatesAutoresizingMaskIntoConstraints:0];
    [(UILabel *)self->_inlineTitleView setAdjustsFontForContentSizeCategory:_UIBarsUseDynamicType()];
    v49 = self->_inlineTitleView;
  }
  [(UIView *)self->_backgroundView addSubview:v49];
LABEL_40:
  v56 = self->_visualProvider;
  if (v56) {
    [(_UINavigationBarTitleControlVisualProvider *)v56 titleControlDidUpdateBackground:self->_backgroundView inlineTitle:self->_inlineTitleView chevron:self->_chevron interactive:[(_UINavigationBarTitleControl *)self isInteractive] highlighted:[(UIControl *)self isHighlighted]];
  }
}

- (void)_cleanupWrapperView
{
  [(_UITAMICAdaptorView *)self->_wrapperView setDelegate:0];
  [(UIView *)self->_wrapperView removeFromSuperview];
  wrapperView = self->_wrapperView;
  self->_wrapperView = 0;
}

- (void)_resetTitleViewConstraints
{
  if (self->_titleConstraints)
  {
    objc_msgSend(MEMORY[0x1E4F5B268], "deactivateConstraints:");
    titleConstraints = self->_titleConstraints;
    self->_titleConstraints = 0;
  }
}

- (void)setTitleMenuProvider:(id)a3
{
  if (self->_titleMenuProvider != a3)
  {
    double v4 = (void *)[a3 copy];
    id titleMenuProvider = self->_titleMenuProvider;
    self->_id titleMenuProvider = v4;

    [(_UINavigationBarTitleControl *)self _updateInteractions];
    [(UIView *)self setNeedsUpdateConstraints];
  }
}

- (void)setDocumentProperties:(id)a3
{
  id v5 = (UIDocumentProperties *)a3;
  if (self->_documentProperties != v5)
  {
    uint64_t v6 = v5;
    objc_storeStrong((id *)&self->_documentProperties, a3);
    [(_UINavigationBarTitleControl *)self _updateInteractions];
    [(UIView *)self setNeedsUpdateConstraints];
    id v5 = v6;
  }
}

- (void)setTitleView:(id)a3
{
  id v5 = (UIView *)a3;
  if (self->_titleView != v5)
  {
    objc_super v7 = v5;
    [(_UINavigationBarTitleControl *)self _resetTitleViewConstraints];
    [(_UINavigationBarTitleControl *)self _cleanupWrapperView];
    [(UIView *)self->_titleView removeFromSuperview];
    objc_storeStrong((id *)&self->_titleView, a3);
    [(UIView *)self setNeedsUpdateConstraints];
    char v6 = dyld_program_sdk_at_least();
    id v5 = v7;
    if ((v6 & 1) == 0)
    {
      [(_UINavigationBarTitleControl *)self _ensureNecessaryViews];
      id v5 = v7;
    }
  }
}

- (void)setTitleAttributes:(id)a3
{
  id v4 = a3;
  id v5 = self->_titleAttributes;
  char v6 = (NSDictionary *)v4;
  v10 = v6;
  if (v5 == v6)
  {

    goto LABEL_9;
  }
  if (!v6 || !v5)
  {

    goto LABEL_8;
  }
  char v7 = [(NSDictionary *)v5 isEqual:v6];

  if ((v7 & 1) == 0)
  {
LABEL_8:
    v8 = (NSDictionary *)[(NSDictionary *)v10 copy];
    titleAttributes = self->_titleAttributes;
    self->_titleAttributes = v8;

    [(UIView *)self setNeedsUpdateConstraints];
  }
LABEL_9:
}

- (void)setTitle:(id)a3
{
  id v4 = a3;
  id v5 = self->_title;
  char v6 = (NSString *)v4;
  v10 = v6;
  if (v5 == v6)
  {

    goto LABEL_9;
  }
  if (!v6 || !v5)
  {

    goto LABEL_8;
  }
  char v7 = [(NSString *)v5 isEqual:v6];

  if ((v7 & 1) == 0)
  {
LABEL_8:
    v8 = (NSString *)[(NSString *)v10 copy];
    title = self->_title;
    self->_title = v8;

    [(UIView *)self setNeedsUpdateConstraints];
  }
LABEL_9:
}

- (void)setTitleViewCompressionResistancePriority:(float)a3
{
  if (self->_titleViewCompressionResistancePriority != a3)
  {
    self->_titleViewCompressionResistancePriority = a3;
    [(UIView *)self setNeedsUpdateConstraints];
  }
}

- (UIView)titleView
{
  return self->_titleView;
}

- (void)setTitleLayoutGuide:(id)a3
{
  p_titleLayoutGuide = &self->_titleLayoutGuide;
  v12 = (UILayoutGuide *)a3;
  if (*p_titleLayoutGuide != v12)
  {
    [(NSLayoutConstraint *)self->_sosConstraint setActive:0];
    sosConstraint = self->_sosConstraint;
    self->_sosConstraint = 0;

    objc_storeStrong((id *)&self->_titleLayoutGuide, a3);
    if (*p_titleLayoutGuide)
    {
      if ((dyld_program_sdk_at_least() & 1) == 0)
      {
        char v7 = [(UIView *)self heightAnchor];
        v8 = [(UILayoutGuide *)*p_titleLayoutGuide heightAnchor];
        v9 = [v7 constraintEqualToAnchor:v8];
        v10 = self->_sosConstraint;
        self->_sosConstraint = v9;

        LODWORD(v11) = 25.0;
        [(NSLayoutConstraint *)self->_sosConstraint setPriority:v11];
        [(NSLayoutConstraint *)self->_sosConstraint setIdentifier:@"_UINavigationBarTitleControl-compatibility-height-ambiguity-suppression"];
        [(UIView *)self setNeedsUpdateConstraints];
      }
    }
  }
}

- (NSString)title
{
  return self->_title;
}

- (CGSize)availableSizeForAdaptor:(id)a3 proposedSize:(CGSize)result
{
  titleLayoutGuide = self->_titleLayoutGuide;
  if (titleLayoutGuide)
  {
    [(UILayoutGuide *)titleLayoutGuide layoutFrame];
    double v7 = v6;
    CGFloat height = v8;
    [(UILayoutGuide *)self->_chevronGuide layoutFrame];
    result.width = v7 - CGRectGetWidth(v11);
  }
  else
  {
    CGFloat height = result.height;
  }
  double v10 = height;
  result.CGFloat height = v10;
  return result;
}

- (UILabel)titleLabel
{
  p_titleView = (void **)&self->_titleView;
  if (self->_titleView)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      BOOL v3 = 0;
      goto LABEL_6;
    }
  }
  else
  {
    p_titleView = (void **)&self->_inlineTitleView;
  }
  BOOL v3 = *p_titleView;
LABEL_6:
  return (UILabel *)v3;
}

- (void)_updateInteractions
{
  [(UIControl *)self setContextMenuInteractionEnabled:[(_UINavigationBarTitleControl *)self isInteractive]];
  [(UIControl *)self setShowsMenuAsPrimaryAction:1];
  [(_UINavigationBarTitleControl *)self _invalidateSceneDraggingBehavior];
}

- (void)setHighlighted:(BOOL)a3
{
  v19.receiver = self;
  v19.super_class = (Class)_UINavigationBarTitleControl;
  [(UIControl *)&v19 setHighlighted:a3];
  BOOL v4 = [(UIControl *)self _hasActiveMenuPresentation];
  visualProvider = self->_visualProvider;
  if (v4)
  {
    if (visualProvider)
    {
      backgroundView = self->_backgroundView;
      inlineTitleView = self->_inlineTitleView;
      chevron = self->_chevron;
      BOOL v9 = [(_UINavigationBarTitleControl *)self isInteractive];
      double v10 = visualProvider;
      CGRect v11 = backgroundView;
      v12 = inlineTitleView;
      v13 = chevron;
      uint64_t v14 = 1;
LABEL_6:
      [(_UINavigationBarTitleControlVisualProvider *)v10 titleControlDidUpdateBackground:v11 inlineTitle:v12 chevron:v13 interactive:v9 highlighted:v14];
      return;
    }
    double controlAlpha = 0.5;
  }
  else
  {
    if (visualProvider)
    {
      v15 = self->_backgroundView;
      id v16 = self->_inlineTitleView;
      uint64_t v17 = self->_chevron;
      BOOL v9 = [(_UINavigationBarTitleControl *)self isInteractive];
      double v10 = visualProvider;
      CGRect v11 = v15;
      v12 = v16;
      v13 = v17;
      uint64_t v14 = 0;
      goto LABEL_6;
    }
    double controlAlpha = self->_controlAlpha;
  }
  [(UIView *)self setAlpha:controlAlpha];
}

- (unint64_t)_controlEventsForActionTriggered
{
  return 64;
}

- (id)_debugInfo
{
  BOOL v3 = [MEMORY[0x1E4F28E78] string];
  BOOL v4 = v3;
  titleView = self->_titleView;
  if (titleView)
  {
    wrapperView = self->_wrapperView;
    if (wrapperView)
    {
      objc_msgSend(NSString, "stringWithFormat:", @"w=%p c=", self->_wrapperView);
      double v7 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      double v7 = &stru_1ED0E84C0;
    }
    [v4 appendFormat:@"titleView=%p (%@%p) compressionResistance=%f", titleView, v7, self->_titleConstraints, self->_titleViewCompressionResistancePriority];
    if (wrapperView) {
  }
    }
  else
  {
    inlineTitleView = self->_inlineTitleView;
    if (inlineTitleView) {
      [v3 appendFormat:@"title='%@' (v=%p, c=%p) attributes=%p compressionResistance=%f", self->_title, inlineTitleView, self->_inlineTitleConstraints, self->_titleAttributes, self->_titleViewCompressionResistancePriority];
    }
  }
  if (self->_chevron) {
    objc_msgSend(v4, "appendFormat:", @" chevron=%p (%p)", self->_chevron, self->_chevronConstraints);
  }
  id titleMenuProvider = self->_titleMenuProvider;
  if (titleMenuProvider)
  {
    double v10 = _Block_copy(titleMenuProvider);
    objc_msgSend(v4, "appendFormat:", @" titleMenuProvider=%p", v10);
  }
  if (self->_documentProperties) {
    objc_msgSend(v4, "appendFormat:", @" documentProperties=%p", self->_documentProperties);
  }
  return v4;
}

+ (id)titleMenuSuggestedActionsWithDocumentFileURL:(id)a3
{
  v18[3] = *MEMORY[0x1E4F143B8];
  v15 = +[_UIReturnToDocumentAction actionWithFileURL:a3];
  v18[0] = v15;
  BOOL v3 = &off_1E52D3000;
  uint64_t v14 = +[UICommand _defaultCommandForAction:sel_duplicate_];
  v17[0] = v14;
  BOOL v4 = +[UICommand _defaultCommandForAction:sel_move_];
  v17[1] = v4;
  id v5 = +[UICommand _defaultCommandForAction:sel_rename_];
  v17[2] = v5;
  double v6 = +[UICommand _defaultCommandForAction:sel_export_];
  v17[3] = v6;
  double v7 = [MEMORY[0x1E4F1C978] arrayWithObjects:v17 count:4];
  double v8 = +[UIMenu _defaultInlineMenuWithIdentifier:@"com.apple.menu.document" children:v7];
  v18[1] = v8;
  int v9 = [(id)UIApp _supportsPrintCommand];
  if (v9)
  {
    BOOL v3 = +[UICommand _defaultCommandForAction:sel_print_];
    id v16 = v3;
    double v10 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v16 count:1];
  }
  else
  {
    double v10 = (void *)MEMORY[0x1E4F1CBF0];
  }
  CGRect v11 = +[UIMenu _defaultInlineMenuWithIdentifier:@"com.apple.menu.print" children:v10];
  v18[2] = v11;
  v12 = [MEMORY[0x1E4F1C978] arrayWithObjects:v18 count:3];

  if (v9)
  {
  }
  return v12;
}

- (id)_contextMenuInteraction:(id)a3 overrideSuggestedActionsForConfiguration:(id)a4
{
  BOOL v4 = [(UIDocumentProperties *)self->_documentProperties _representedURL];
  id v5 = +[_UINavigationBarTitleControl titleMenuSuggestedActionsWithDocumentFileURL:v4];

  return v5;
}

- (id)contextMenuInteraction:(id)a3 configurationForMenuAtLocation:(CGPoint)a4
{
  id v5 = a3;
  unint64_t v6 = (unint64_t)_Block_copy(self->_titleMenuProvider);
  unint64_t v7 = self->_documentProperties;
  if (v6 | v7)
  {
    uint64_t v13 = MEMORY[0x1E4F143A8];
    uint64_t v14 = 3221225472;
    v15 = __86___UINavigationBarTitleControl_contextMenuInteraction_configurationForMenuAtLocation___block_invoke;
    id v16 = &unk_1E52EC040;
    id v20 = (id)v6;
    uint64_t v17 = (UIDocumentProperties *)(id)v7;
    v18 = self;
    id v19 = v5;
    double v8 = +[UIContextMenuConfiguration configurationWithIdentifier:0 previewProvider:0 actionProvider:&v13];
    objc_msgSend(v8, "setPreferredMenuElementOrder:", 2, v13, v14, v15, v16);
    int v9 = [(UIView *)self nextResponder];
    double v10 = _UITreeFindFirstAncestorMatchingCondition(v9, sel_nextResponder, &__block_literal_global_168);

    CGRect v11 = [v10 topViewController];
    [v8 setFirstResponderTarget:v11];
  }
  else
  {
    double v8 = 0;
  }

  return v8;
}

- (CGPoint)menuAttachmentPointForConfiguration:(id)a3
{
  id v4 = a3;
  visualProvider = self->_visualProvider;
  if (visualProvider)
  {
    [(_UINavigationBarTitleControlVisualProvider *)visualProvider menuAttachmentPointForConfiguration:v4];
    double v7 = v6;
    double v9 = v8;
  }
  else
  {
    titleView = self->_titleView;
    if (titleView)
    {
      [(UIView *)self->_titleView bounds];
      -[UIView convertRect:toView:](titleView, "convertRect:toView:", self);
    }
    else
    {
      [(UIView *)self->_backgroundView bounds];
    }
    double v15 = v11;
    double v16 = v12;
    double v17 = v13;
    double v18 = v14;
    [(_UINavigationBarTitleControl *)self menuAlignmentInsets];
    double v20 = v19;
    double v22 = v21;
    double v23 = v15 + v21;
    double v24 = v16 + v19;
    double v26 = v17 - (v21 + v25);
    double v28 = v18 - (v19 + v27);
    v29 = [(UIView *)self _window];
    -[UIView convertRect:toView:](self, "convertRect:toView:", v29, v23, v24, v26, v28);
    double v7 = v22 + _UIControlMenuAttachmentPointForRectInContainer(v29, v30, v31, v32, v33);
    double v9 = v20 + v34;
  }
  double v35 = v7;
  double v36 = v9;
  result.y = v36;
  result.x = v35;
  return result;
}

- (id)_contextMenuInteraction:(id)a3 styleForMenuWithConfiguration:(id)a4
{
  v8.receiver = self;
  v8.super_class = (Class)_UINavigationBarTitleControl;
  id v5 = [(UIControl *)&v8 _contextMenuInteraction:a3 styleForMenuWithConfiguration:a4];
  [v5 setKeepsInputViewsVisible:1];
  visualProvider = self->_visualProvider;
  if (visualProvider) {
    [(_UINavigationBarTitleControlVisualProvider *)visualProvider updateContextMenuStyle:v5];
  }
  return v5;
}

- (id)_preview
{
  BOOL v3 = [(UIView *)self window];
  if (v3 && (titleView = self->_titleView, v3, titleView))
  {
    [(UIView *)self->_titleView frame];
    double v6 = v5;
    double v8 = v7;
    double v10 = v9;
    double v12 = v11;
    double v13 = [UIPreviewTarget alloc];
    double v14 = [(UIView *)self->_titleView superview];
    double v15 = -[UIPreviewTarget initWithContainer:center:](v13, "initWithContainer:center:", v14, v6 + v10 * 0.5, v8 + v12 * 0.5);

    double v16 = objc_opt_new();
    double v17 = +[UIColor clearColor];
    [v16 setBackgroundColor:v17];

    double v18 = [UITargetedPreview alloc];
    double v19 = -[UIView initWithFrame:]([UIView alloc], "initWithFrame:", v6, v8, v10, v12);
    double v20 = [(UITargetedPreview *)v18 initWithView:v19 parameters:v16 target:v15];
  }
  else
  {
    double v20 = 0;
  }
  return v20;
}

- (BOOL)_inactiveForPointer
{
  return self->_visualProvider
      && (objc_opt_respondsToSelector() & 1) != 0
      && ![(_UINavigationBarTitleControlVisualProvider *)self->_visualProvider supportsPointerInteractions]|| ![(_UINavigationBarTitleControl *)self isInteractive]|| self->_contentAlpha < 0.01;
}

- (id)pointerInteraction:(id)a3 regionForRequest:(id)a4 defaultRegion:(id)a5
{
  id v6 = a3;
  if ([(_UINavigationBarTitleControl *)self _inactiveForPointer])
  {
    double v7 = 0;
  }
  else
  {
    objc_opt_class();
    char isKindOfClass = objc_opt_isKindOfClass();
    [(UIView *)self bounds];
    double v13 = v9;
    double v14 = v10;
    double v15 = v11;
    double v16 = v12;
    if (isKindOfClass)
    {
      objc_msgSend(v6, "createRegionFromRect:targetView:identifier:selected:", self, @"com.apple.UIKit._UINavigationBarTitleControl", 0, v9, v10, v11, v12);
    }
    else
    {
      double v17 = [v6 view];
      -[UIView convertRect:toView:](self, "convertRect:toView:", v17, v13, v14, v15, v16);
      double v19 = v18;
      double v21 = v20;
      double v23 = v22;
      double v25 = v24;

      +[UIPointerRegion regionWithRect:identifier:](UIPointerRegion, "regionWithRect:identifier:", 0, v19, v21, v23, v25);
    double v7 = };
  }

  return v7;
}

- (id)pointerShapeInContainer:(id)a3
{
  id v4 = a3;
  if (self->_visualProvider && (objc_opt_respondsToSelector() & 1) != 0)
  {
    double v5 = [(_UINavigationBarTitleControlVisualProvider *)self->_visualProvider pointerShapeInContainer:v4];
    goto LABEL_22;
  }
  [(UIView *)self bounds];
  double v7 = v6;
  double v9 = v8;
  if (self->_titleView)
  {
    if (self->_wrapperView) {
      wrapperView = self->_wrapperView;
    }
    else {
      wrapperView = self->_titleView;
    }
  }
  else
  {
    wrapperView = self->_inlineTitleView;
    if (!wrapperView)
    {
      CGFloat width = *(double *)(MEMORY[0x1E4F1DB20] + 16);
      CGFloat height = *(double *)(MEMORY[0x1E4F1DB20] + 24);
      CGFloat x = *MEMORY[0x1E4F1DB20];
      CGFloat y = *(double *)(MEMORY[0x1E4F1DB20] + 8);
      goto LABEL_10;
    }
  }
  [wrapperView frame];
  CGFloat x = v11;
  CGFloat y = v13;
  CGFloat width = v15;
  CGFloat height = v17;
LABEL_10:
  chevron = self->_chevron;
  if (chevron)
  {
    [(UIView *)chevron frame];
    v53.origin.CGFloat x = v20;
    v53.origin.CGFloat y = v21;
    v53.size.CGFloat width = v22;
    v53.size.CGFloat height = v23;
    v49.origin.CGFloat x = x;
    v49.origin.CGFloat y = y;
    v49.size.CGFloat width = width;
    v49.size.CGFloat height = height;
    CGRect v50 = CGRectUnion(v49, v53);
    CGFloat x = v50.origin.x;
    CGFloat y = v50.origin.y;
    CGFloat width = v50.size.width;
    CGFloat height = v50.size.height;
  }
  v51.origin.CGFloat x = x;
  v51.origin.CGFloat y = y;
  v51.size.CGFloat width = width;
  v51.size.CGFloat height = height;
  double MinX = CGRectGetMinX(v51);
  v52.origin.CGFloat x = x;
  v52.origin.CGFloat y = y;
  v52.size.CGFloat width = width;
  v52.size.CGFloat height = height;
  double v25 = CGRectGetWidth(v52);
  double v26 = +[_UIPointerSettingsDomain rootSettings];
  double v27 = [v26 navigationAndToolbarSettings];

  [v27 buttonPadding];
  double v29 = MinX - v28;
  double v30 = v25 + v28 + v28;
  [v27 buttonMinimumHeight];
  double v32 = (v31 - v9) * 0.5;
  if (v9 >= v31)
  {
    double v33 = 0.0;
  }
  else
  {
    double v9 = v31;
    double v33 = v32;
  }
  double v34 = v7 - v33;
  [v27 buttonMinimumWidth];
  if (v30 >= v35) {
    double v36 = v30;
  }
  else {
    double v36 = v35;
  }
  if (v30 >= v35) {
    double v37 = 0.0;
  }
  else {
    double v37 = (v35 - v30) * 0.5;
  }
  -[UIView convertRect:toView:](self, "convertRect:toView:", v4, v29 - v37, v34, v36, v9);
  double v39 = v38;
  double v41 = v40;
  double v43 = v42;
  double v45 = v44;
  [v27 buttonCornerRadius];
  double v5 = +[UIPointerShape shapeWithRoundedRect:cornerRadius:](UIPointerShape, "shapeWithRoundedRect:cornerRadius:", v39, v41, v43, v45, v46);

LABEL_22:
  return v5;
}

- (id)pointerInteraction:(id)a3 styleForRegion:(id)a4
{
  id v5 = a3;
  double v6 = objc_opt_new();
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    [(UIView *)self center];
    double v7 = objc_msgSend(v5, "createPreviewTargetForView:center:", self);
    double v8 = [[UITargetedPreview alloc] initWithView:self parameters:v6 target:v7];
  }
  else
  {
    double v8 = [[UITargetedPreview alloc] initWithView:self parameters:v6];
  }
  double v9 = [(UITargetedPreview *)v8 target];
  double v10 = [v9 container];
  double v11 = [(_UINavigationBarTitleControl *)self pointerShapeInContainer:v10];

  double v12 = +[UIPointerEffect effectWithPreview:v8];
  double v13 = +[UIPointerStyle styleWithEffect:v12 shape:v11];

  return v13;
}

- (id)_preferredPresentationSourceItem
{
  return _UIPopoverPresentationControllerSourceItemObscuredSource(self->_chevron);
}

- (id)_preferredSender
{
  BOOL v2 = [(UIView *)self superview];
  if (v2)
  {
    do
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        break;
      }
      uint64_t v3 = [v2 superview];

      BOOL v2 = (void *)v3;
    }
    while (v3);
  }
  return v2;
}

- (NSDictionary)titleAttributes
{
  return self->_titleAttributes;
}

- (float)titleViewCompressionResistancePriority
{
  return self->_titleViewCompressionResistancePriority;
}

- (double)contentAlpha
{
  return self->_contentAlpha;
}

- (double)controlAlpha
{
  return self->_controlAlpha;
}

- (UIView)effectiveTitleView
{
  return self->_effectiveTitleView;
}

- (id)titleMenuProvider
{
  return self->_titleMenuProvider;
}

- (UIDocumentProperties)documentProperties
{
  return self->_documentProperties;
}

- (UIEdgeInsets)menuAlignmentInsets
{
  double top = self->_menuAlignmentInsets.top;
  double left = self->_menuAlignmentInsets.left;
  double bottom = self->_menuAlignmentInsets.bottom;
  double right = self->_menuAlignmentInsets.right;
  result.double right = right;
  result.double bottom = bottom;
  result.double left = left;
  result.double top = top;
  return result;
}

- (UILayoutGuide)titleLayoutGuide
{
  return self->_titleLayoutGuide;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_visualProvider, 0);
  objc_storeStrong((id *)&self->_titleLayoutGuide, 0);
  objc_storeStrong((id *)&self->_documentProperties, 0);
  objc_storeStrong(&self->_titleMenuProvider, 0);
  objc_storeStrong((id *)&self->_effectiveTitleView, 0);
  objc_storeStrong((id *)&self->_titleView, 0);
  objc_storeStrong((id *)&self->_titleAttributes, 0);
  objc_storeStrong((id *)&self->_title, 0);
  objc_storeStrong((id *)&self->_chevronConstraints, 0);
  objc_storeStrong((id *)&self->_inlineTitleConstraints, 0);
  objc_storeStrong((id *)&self->_titleConstraints, 0);
  objc_storeStrong((id *)&self->_backgroundViewConstraints, 0);
  objc_storeStrong((id *)&self->_sosConstraint, 0);
  objc_storeStrong((id *)&self->_chevronGuide, 0);
  objc_storeStrong((id *)&self->_chevron, 0);
  objc_storeStrong((id *)&self->_resolvedAttributes, 0);
  objc_storeStrong((id *)&self->_wrapperView, 0);
  objc_storeStrong((id *)&self->_inlineTitleView, 0);
  objc_storeStrong((id *)&self->_backgroundView, 0);
}

@end