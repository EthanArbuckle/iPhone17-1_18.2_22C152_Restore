@interface SFAttributedRichLinkCell
+ (NSString)reuseIdentifier;
- (BOOL)shouldShowContextMenuFromPoint:(CGPoint)a3;
- (LPLinkMetadata)metadata;
- (NSString)relativeDateString;
- (SFAttributedRichLinkCell)initWithCoder:(id)a3;
- (SFAttributedRichLinkCell)initWithFrame:(CGRect)a3;
- (SLAttributionView)attributionView;
- (SLHighlight)highlight;
- (UIView)contextMenuPreviewView;
- (id)preferredLayoutAttributesFittingAttributes:(id)a3;
- (void)_updateAttributionViewBackground;
- (void)_updateUserInterfaceStyle;
- (void)dealloc;
- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6;
- (void)setAttributionView:(id)a3;
- (void)setHighlight:(id)a3;
- (void)setMetadata:(id)a3;
- (void)setRelativeDateString:(id)a3;
- (void)touchesBegan:(id)a3 withEvent:(id)a4;
@end

@implementation SFAttributedRichLinkCell

+ (NSString)reuseIdentifier
{
  return (NSString *)@"AttributedRichLinkCell";
}

- (SFAttributedRichLinkCell)initWithFrame:(CGRect)a3
{
  v77[3] = *MEMORY[0x1E4F143B8];
  v73.receiver = self;
  v73.super_class = (Class)SFAttributedRichLinkCell;
  v3 = -[SFStartPageFilledBackgroundCell initWithFrame:](&v73, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
  {
    v5 = [(SFAttributedRichLinkCell *)v3 contentView];
    v6 = (UIView *)objc_alloc_init(MEMORY[0x1E4FB1EB0]);
    linkViewContainer = v4->_linkViewContainer;
    v4->_linkViewContainer = v6;

    [(UIView *)v4->_linkViewContainer setTranslatesAutoresizingMaskIntoConstraints:0];
    [(UIView *)v4->_linkViewContainer _setContinuousCornerRadius:10.0];
    [v5 addSubview:v4->_linkViewContainer];
    v63 = (void *)MEMORY[0x1E4F28DC8];
    v71 = [(UIView *)v4->_linkViewContainer topAnchor];
    v69 = [v5 topAnchor];
    v66 = [v71 constraintEqualToAnchor:v69];
    v77[0] = v66;
    v8 = [(UIView *)v4->_linkViewContainer leadingAnchor];
    v9 = [v5 leadingAnchor];
    v10 = [v8 constraintEqualToAnchor:v9];
    v77[1] = v10;
    v11 = [(UIView *)v4->_linkViewContainer trailingAnchor];
    v12 = [v5 trailingAnchor];
    v13 = [v11 constraintEqualToAnchor:v12];
    v77[2] = v13;
    v14 = [MEMORY[0x1E4F1C978] arrayWithObjects:v77 count:3];
    [v63 activateConstraints:v14];

    unint64_t v15 = 0x1E4F97000uLL;
    LODWORD(v11) = [MEMORY[0x1E4F97EA0] is2024SuggestionsEnabled];
    v16 = [(UIView *)v4->_linkViewContainer bottomAnchor];
    v72 = v5;
    v17 = [v5 bottomAnchor];
    v18 = [v16 constraintEqualToAnchor:v17];
    v20 = v18;
    if (v11)
    {
      [v18 setActive:1];
    }
    else
    {
      LODWORD(v19) = 1132068864;
      v21 = objc_msgSend(v18, "sf_withPriority:", v19);
      [v21 setActive:1];
    }
    v22 = (LPLinkView *)objc_alloc_init(MEMORY[0x1E4F30A98]);
    linkView = v4->_linkView;
    v4->_linkView = v22;

    id v24 = objc_alloc_init(MEMORY[0x1E4F30A78]);
    [(LPLinkView *)v4->_linkView setMetadata:v24];

    if ([MEMORY[0x1E4F97EA0] is2024SuggestionsEnabled])
    {
      -[LPLinkView setContentInset:](v4->_linkView, "setContentInset:", 0.0, 0.0, 30.0, 0.0);
      [(LPLinkView *)v4->_linkView _setEffectiveCornerRadius:10.0];
    }
    [(LPLinkView *)v4->_linkView _setPreferredSizeClass:5];
    [(LPLinkView *)v4->_linkView _setDisableTapGesture:1];
    [(LPLinkView *)v4->_linkView _setDisableAutoPlay:1];
    [(LPLinkView *)v4->_linkView _setDisableAnimations:1];
    [(SFAttributedRichLinkCell *)v4 _updateBackgroundColor];
    [(LPLinkView *)v4->_linkView setTranslatesAutoresizingMaskIntoConstraints:0];
    id v25 = objc_alloc_init(MEMORY[0x1E4F30A80]);
    [v25 setAlignTextAndMediaHorizontalEdges:1];
    if ([MEMORY[0x1E4F97EA0] is2024SuggestionsEnabled]) {
      -[LPLinkView _setTextSafeAreaInset:](v4->_linkView, "_setTextSafeAreaInset:", 0.0, 7.0, 0.0, 7.0);
    }
    [(LPLinkView *)v4->_linkView _setSizeClassParameters:v25];
    int v26 = [MEMORY[0x1E4F97EA0] is2024SuggestionsEnabled];
    v27 = v4->_linkViewContainer;
    v28 = v4->_linkView;
    v70 = v25;
    if (v26)
    {
      [(UIView *)v27 addSubview:v28];
      v58 = (void *)MEMORY[0x1E4F28DC8];
      v67 = [(LPLinkView *)v4->_linkView topAnchor];
      v64 = [(UIView *)v4->_linkViewContainer topAnchor];
      v62 = [v67 constraintEqualToAnchor:v64];
      v76[0] = v62;
      v61 = [(LPLinkView *)v4->_linkView leadingAnchor];
      v60 = [(UIView *)v4->_linkViewContainer leadingAnchor];
      v59 = [v61 constraintEqualToAnchor:v60];
      v76[1] = v59;
      v57 = [(LPLinkView *)v4->_linkView trailingAnchor];
      v56 = [(UIView *)v4->_linkViewContainer trailingAnchor];
      v29 = [v57 constraintEqualToAnchor:v56];
      v76[2] = v29;
      v30 = [(UIView *)v4->_linkViewContainer heightAnchor];
      v31 = [(LPLinkView *)v4->_linkView widthAnchor];
      v32 = [v30 constraintEqualToAnchor:v31 multiplier:1.0];
      v76[3] = v32;
      v33 = [(LPLinkView *)v4->_linkView heightAnchor];
      v34 = [(UIView *)v4->_linkViewContainer heightAnchor];
      v35 = [v33 constraintEqualToAnchor:v34];
      v76[4] = v35;
      v36 = [MEMORY[0x1E4F1C978] arrayWithObjects:v76 count:5];
      [v58 activateConstraints:v36];

      unint64_t v15 = 0x1E4F97000;
    }
    else
    {
      [(UIView *)v27 _sf_addEdgeMatchedSubview:v28];
    }
    [(LPLinkView *)v4->_linkView addObserver:v4 forKeyPath:@"_effectiveTraitCollection" options:0 context:&startPageAttributedRichLinkCellKvoEffectiveTraitCollectionKey];
    if ([*(id *)(v15 + 3744) is2024SuggestionsEnabled])
    {
      v37 = (UILabel *)objc_alloc_init(MEMORY[0x1E4FB1930]);
      relativeDateLabel = v4->_relativeDateLabel;
      v4->_relativeDateLabel = v37;

      [(UILabel *)v4->_relativeDateLabel setTranslatesAutoresizingMaskIntoConstraints:0];
      v39 = [(UILabel *)v4->_relativeDateLabel layer];
      [v39 setZPosition:1000.0];

      v40 = [MEMORY[0x1E4FB1618] secondaryLabelColor];
      [(UILabel *)v4->_relativeDateLabel setTextColor:v40];

      v41 = [MEMORY[0x1E4FB08E0] preferredFontForTextStyle:*MEMORY[0x1E4FB28E0]];
      [(UILabel *)v4->_relativeDateLabel setFont:v41];

      [(SFAttributedRichLinkCell *)v4 _updateUserInterfaceStyle];
      [(UIView *)v4->_linkViewContainer addSubview:v4->_relativeDateLabel];
      v65 = (void *)MEMORY[0x1E4F28DC8];
      v68 = [(UIView *)v4->_linkViewContainer bottomAnchor];
      v42 = [(UILabel *)v4->_relativeDateLabel bottomAnchor];
      v43 = [v68 constraintEqualToAnchor:v42 constant:12.0];
      v75[0] = v43;
      v44 = [(UILabel *)v4->_relativeDateLabel leadingAnchor];
      v45 = [(UIView *)v4->_linkViewContainer leadingAnchor];
      v46 = [v44 constraintEqualToAnchor:v45 constant:7.0];
      v75[1] = v46;
      v47 = [(UIView *)v4->_linkViewContainer trailingAnchor];
      v48 = [(UILabel *)v4->_relativeDateLabel trailingAnchor];
      v49 = [v47 constraintEqualToAnchor:v48 constant:7.0];
      v75[2] = v49;
      v50 = [MEMORY[0x1E4F1C978] arrayWithObjects:v75 count:3];
      [v65 activateConstraints:v50];
    }
    [(SFAttributedRichLinkCell *)v4 _updateAttributionViewBackground];
    v74[0] = objc_opt_class();
    v74[1] = objc_opt_class();
    v51 = [MEMORY[0x1E4F1C978] arrayWithObjects:v74 count:2];
    id v52 = (id)[(SFAttributedRichLinkCell *)v4 registerForTraitChanges:v51 withAction:sel__updateAttributionViewBackground];

    v53 = [(SFStartPageFilledBackgroundCell *)v4 defaultBackgroundConfiguration];
    [v53 setCornerRadius:10.0];
    [(SFAttributedRichLinkCell *)v4 setBackgroundConfiguration:v53];
    v54 = v4;
  }
  return v4;
}

- (SFAttributedRichLinkCell)initWithCoder:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)SFAttributedRichLinkCell;
  return [(SFAttributedRichLinkCell *)&v4 initWithCoder:a3];
}

- (void)dealloc
{
  [(LPLinkView *)self->_linkView removeObserver:self forKeyPath:@"_effectiveTraitCollection" context:&startPageAttributedRichLinkCellKvoEffectiveTraitCollectionKey];
  v3.receiver = self;
  v3.super_class = (Class)SFAttributedRichLinkCell;
  [(SFAttributedRichLinkCell *)&v3 dealloc];
}

- (void)touchesBegan:(id)a3 withEvent:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  attributionView = self->_attributionView;
  if (!attributionView) {
    goto LABEL_3;
  }
  [(SLAttributionView *)attributionView bounds];
  CGFloat v10 = v9;
  CGFloat v12 = v11;
  CGFloat v14 = v13;
  CGFloat v16 = v15;
  v17 = [v6 anyObject];
  [v17 locationInView:self->_attributionView];
  v22.x = v18;
  v22.y = v19;
  v23.origin.x = v10;
  v23.origin.y = v12;
  v23.size.width = v14;
  v23.size.height = v16;
  BOOL v20 = CGRectContainsPoint(v23, v22);

  if (!v20)
  {
LABEL_3:
    v21.receiver = self;
    v21.super_class = (Class)SFAttributedRichLinkCell;
    [(SFAttributedRichLinkCell *)&v21 touchesBegan:v6 withEvent:v7];
  }
}

- (UIView)contextMenuPreviewView
{
  return self->_linkViewContainer;
}

- (id)preferredLayoutAttributesFittingAttributes:(id)a3
{
  v11.receiver = self;
  v11.super_class = (Class)SFAttributedRichLinkCell;
  objc_super v4 = [(SFAttributedRichLinkCell *)&v11 preferredLayoutAttributesFittingAttributes:a3];
  [v4 size];
  double v6 = v5;
  if (([MEMORY[0x1E4F97EA0] is2024SuggestionsEnabled] & 1) == 0) {
    _SFClamp(v6 * -0.002 + 1.15, 0.7, 0.85);
  }
  int v7 = [MEMORY[0x1E4F97EA0] is2024SuggestionsEnabled];
  if (([MEMORY[0x1E4F97EA0] is2024SuggestionsEnabled] & 1) == 0)
  {
    attributionView = self->_attributionView;
    if (attributionView)
    {
      [(SLAttributionView *)attributionView layoutIfNeeded];
      [(SLAttributionView *)self->_attributionView intrinsicContentSize];
      [MEMORY[0x1E4F97EA0] is2024SuggestionsEnabled];
    }
  }
  double v9 = 176.0;
  if (!v7) {
    double v9 = v6;
  }
  [v4 setSize:_SFRoundSizeToPixels(v9)];

  return v4;
}

- (void)_updateAttributionViewBackground
{
  if ([MEMORY[0x1E4F97EA0] is2024SuggestionsEnabled])
  {
    BOOL v3 = 0;
  }
  else
  {
    objc_super v4 = [(SFAttributedRichLinkCell *)self traitCollection];
    if (objc_msgSend(v4, "sf_usesVibrantAppearance"))
    {
      double v5 = objc_msgSend(v4, "sf_backgroundBlurEffect");
      BOOL v3 = v5 == 0;
    }
    else
    {
      BOOL v3 = 0;
    }
  }
  attributionView = self->_attributionView;

  [(SLAttributionView *)attributionView updateBackgroundStyle:v3];
}

- (LPLinkMetadata)metadata
{
  return [(LPLinkView *)self->_linkView metadata];
}

- (void)setMetadata:(id)a3
{
  v63[1] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  double v5 = [(LPLinkView *)self->_linkView metadata];
  char v6 = WBSIsEqual();

  if ((v6 & 1) == 0)
  {
    objc_initWeak(&location, self);
    if ([MEMORY[0x1E4F97EA0] is2024SuggestionsEnabled])
    {
      int v7 = (void *)[v4 copy];

      v8 = [v7 image];
      double v9 = v8;
      if (v8)
      {
        id v49 = v8;
      }
      else
      {
        id v49 = [v7 icon];
      }

      CGFloat v10 = [v7 image];
      v50 = [v10 platformImage];

      objc_super v11 = [v7 icon];
      CGFloat v12 = [v11 platformImage];

      double v13 = [MEMORY[0x1E4F98EA0] sharedManager];
      uint64_t v51 = objc_msgSend(v13, "displayableImageForImage:withRequiredImageSize:", v50, 40.0, 40.0);

      if ((void *)v51 != v50)
      {
        CGFloat v14 = (void *)[objc_alloc(MEMORY[0x1E4F30A38]) initWithPlatformImage:v51];
        [v7 setImage:v14];
      }
      double v15 = +[_SFTouchIconCache _monogramConfiguration];
      CGFloat v16 = [v15 backgroundColor];
      v17 = [MEMORY[0x1E4FB1E20] traitCollectionWithUserInterfaceStyle:1];
      CGFloat v18 = [v16 resolvedColorWithTraitCollection:v17];

      CGFloat v19 = [v15 backgroundColor];
      BOOL v20 = [MEMORY[0x1E4FB1E20] currentTraitCollection];
      objc_super v21 = [v20 traitCollectionByModifyingTraits:&__block_literal_global_64];
      CGPoint v22 = [v19 resolvedColorWithTraitCollection:v21];

      aBlock[0] = MEMORY[0x1E4F143A8];
      aBlock[1] = 3221225472;
      aBlock[2] = __40__SFAttributedRichLinkCell_setMetadata___block_invoke_2;
      aBlock[3] = &unk_1E54EDB18;
      id v47 = v18;
      id v57 = v47;
      id v48 = v22;
      id v58 = v48;
      id v23 = v12;
      id v59 = v23;
      id v45 = v15;
      id v60 = v45;
      id v4 = v7;
      id v61 = v4;
      id v24 = (void (**)(void))_Block_copy(aBlock);
      if (self->_userInterfaceStyleChangeRegistrationForMetadata) {
        -[SFAttributedRichLinkCell unregisterForTraitChanges:](self, "unregisterForTraitChanges:", v45, v47, v48);
      }
      uint64_t v25 = v24[2](v24);
      if ((id)v25 != v23)
      {
        int v26 = (void *)[objc_alloc(MEMORY[0x1E4F30A38]) initWithPlatformImage:v25];
        [v4 setIcon:v26];

        if (v25)
        {
          v63[0] = objc_opt_class();
          v27 = [MEMORY[0x1E4F1C978] arrayWithObjects:v63 count:1];
          v52[0] = MEMORY[0x1E4F143A8];
          v52[1] = 3221225472;
          v52[2] = __40__SFAttributedRichLinkCell_setMetadata___block_invoke_3;
          v52[3] = &unk_1E54EDB40;
          objc_copyWeak(&v55, &location);
          id v53 = v4;
          v54 = v24;
          v28 = [(SFAttributedRichLinkCell *)self registerForTraitChanges:v27 withHandler:v52];
          userInterfaceStyleChangeRegistrationForMetadata = self->_userInterfaceStyleChangeRegistrationForMetadata;
          self->_userInterfaceStyleChangeRegistrationForMetadata = v28;

          objc_destroyWeak(&v55);
        }
      }
      -[LPLinkView _setOverrideBackgroundColor:](self->_linkView, "_setOverrideBackgroundColor:", 0, v45);
      v30 = [(LPLinkView *)self->_linkView traitOverrides];
      v31 = self;
      int v32 = [v30 containsTrait:v31];

      if (v32)
      {
        v33 = [(LPLinkView *)self->_linkView traitOverrides];
        v34 = self;
        [v33 removeTrait:v34];
      }
      if (!(v51 | v25))
      {
        v35 = [v49 properties];
        v36 = [v35 dominantColor];
        BOOL v37 = v36 == 0;

        if (!v37)
        {
          v38 = [v49 properties];
          v39 = [v38 dominantColor];
          v40 = [v39 colorWithAlphaComponent:1.0];
          [(LPLinkView *)self->_linkView _setOverrideBackgroundColor:v40];

          v41 = [(LPLinkView *)self->_linkView _overrideBackgroundColor];
          LODWORD(v38) = objc_msgSend(v41, "safari_meetsThresholdForDarkAppearance");

          v42 = [(LPLinkView *)self->_linkView traitOverrides];
          v43 = v42;
          if (v38) {
            uint64_t v44 = 2;
          }
          else {
            uint64_t v44 = 1;
          }
          [v42 setUserInterfaceStyle:v44];
        }
      }
    }
    [(LPLinkView *)self->_linkView setMetadata:v4];
    [(SFAttributedRichLinkCell *)self setNeedsLayout];
    objc_destroyWeak(&location);
  }
}

void __40__SFAttributedRichLinkCell_setMetadata___block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  [v2 setUserInterfaceStyle:2];
  [v2 setUserInterfaceLevel:1];
}

id __40__SFAttributedRichLinkCell_setMetadata___block_invoke_2(uint64_t a1)
{
  id v2 = [MEMORY[0x1E4FB1E20] currentTraitCollection];
  uint64_t v3 = [v2 userInterfaceStyle];
  uint64_t v4 = 40;
  if (v3 == 1) {
    uint64_t v4 = 32;
  }
  id v5 = *(id *)(a1 + v4);

  char v6 = [MEMORY[0x1E4F98EA0] sharedManager];
  uint64_t v7 = *(void *)(a1 + 48);
  [*(id *)(a1 + 56) fontSize];
  double v9 = v8;
  uint64_t v10 = [*(id *)(a1 + 56) fontWeight];
  uint64_t v11 = [*(id *)(a1 + 56) fontDesign];
  [*(id *)(a1 + 56) baselineOffset];
  double v13 = v12;
  +[_SFSiteIcon cornerRadius];
  double v15 = v14;
  CGFloat v16 = [*(id *)(a1 + 64) title];
  v17 = [*(id *)(a1 + 64) URL];
  LOBYTE(v20) = 0;
  CGFloat v18 = objc_msgSend(v6, "displayableImageForImage:withRequiredImageSize:fallbackImageSize:fontSize:fontWeight:fontDesign:baselineOffset:backgroundColor:cornerRadius:title:url:shouldGenerateGlyph:", v7, v10, v11, v5, v16, v17, 40.0, 40.0, 80.0, 80.0, v9, v13, v15, v20);

  return v18;
}

void __40__SFAttributedRichLinkCell_setMetadata___block_invoke_3(uint64_t a1)
{
  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 48));
  if (WeakRetained)
  {
    id v2 = objc_alloc(MEMORY[0x1E4F30A38]);
    uint64_t v3 = (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
    uint64_t v4 = (void *)[v2 initWithPlatformImage:v3];
    [*(id *)(a1 + 32) setIcon:v4];

    [WeakRetained[82] setMetadata:*(void *)(a1 + 32)];
  }
}

- (void)setRelativeDateString:(id)a3
{
  objc_storeStrong((id *)&self->_relativeDateString, a3);
  id v5 = a3;
  [(UILabel *)self->_relativeDateLabel setText:v5];
}

- (void)setAttributionView:(id)a3
{
  v37[3] = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  int v6 = [MEMORY[0x1E4F97EA0] is2024SuggestionsEnabled];
  p_attributionView = &self->_attributionView;
  if (v5 || !v6)
  {
    if (!WBSIsEqual() || ([v5 isDescendantOfView:self] & 1) == 0)
    {
      [v5 removeFromSuperview];
      if ([(SLAttributionView *)*p_attributionView isDescendantOfView:self]) {
        [(SLAttributionView *)*p_attributionView removeFromSuperview];
      }
      objc_storeStrong((id *)&self->_attributionView, a3);
      [(SLAttributionView *)*p_attributionView setBlurEffectGroupName:@"start-page-attribution-view"];
      [(SFAttributedRichLinkCell *)self _updateAttributionViewBackground];
      [(SLAttributionView *)*p_attributionView setTranslatesAutoresizingMaskIntoConstraints:0];
      LODWORD(v9) = 1148846080;
      [(SLAttributionView *)*p_attributionView setContentHuggingPriority:1 forAxis:v9];
      if ([MEMORY[0x1E4F97EA0] is2024SuggestionsEnabled])
      {
        [(UIView *)self->_linkViewContainer addSubview:*p_attributionView];
        v30 = (void *)MEMORY[0x1E4F28DC8];
        v34 = [(UIView *)self->_linkViewContainer bottomAnchor];
        int v32 = [(SLAttributionView *)*p_attributionView bottomAnchor];
        uint64_t v10 = [v34 constraintEqualToAnchor:v32 constant:7.0];
        v37[0] = v10;
        uint64_t v11 = [(SLAttributionView *)*p_attributionView leadingAnchor];
        double v12 = [(UIView *)self->_linkViewContainer leadingAnchor];
        double v13 = [v11 constraintEqualToAnchor:v12 constant:7.0];
        v37[1] = v13;
        double v14 = [(UIView *)self->_linkViewContainer trailingAnchor];
        double v15 = [(SLAttributionView *)*p_attributionView trailingAnchor];
        CGFloat v16 = [v14 constraintEqualToAnchor:v15 constant:7.0];
        v37[2] = v16;
        v17 = [MEMORY[0x1E4F1C978] arrayWithObjects:v37 count:3];
        [v30 activateConstraints:v17];

        [(SFAttributedRichLinkCell *)self _updateUserInterfaceStyle];
      }
      else
      {
        CGFloat v18 = [(SFAttributedRichLinkCell *)self contentView];
        [v18 addSubview:*p_attributionView];
        v27 = (void *)MEMORY[0x1E4F28DC8];
        v35 = [(SLAttributionView *)*p_attributionView topAnchor];
        v33 = [(UIView *)self->_linkViewContainer bottomAnchor];
        v31 = [v35 constraintEqualToAnchor:v33 constant:6.0];
        v36[0] = v31;
        v29 = [(SLAttributionView *)*p_attributionView bottomAnchor];
        v28 = [v18 bottomAnchor];
        int v26 = [v29 constraintEqualToAnchor:v28];
        v36[1] = v26;
        CGFloat v19 = [(SLAttributionView *)*p_attributionView leadingAnchor];
        uint64_t v20 = [v18 leadingAnchor];
        objc_super v21 = [v19 constraintEqualToAnchor:v20];
        v36[2] = v21;
        CGPoint v22 = [(SLAttributionView *)*p_attributionView trailingAnchor];
        id v23 = [v18 trailingAnchor];
        id v24 = [v22 constraintEqualToAnchor:v23];
        v36[3] = v24;
        uint64_t v25 = [MEMORY[0x1E4F1C978] arrayWithObjects:v36 count:4];
        [v27 activateConstraints:v25];
      }
      [(SFAttributedRichLinkCell *)self setNeedsLayout];
    }
  }
  else
  {
    [(SLAttributionView *)self->_attributionView removeFromSuperview];
    double v8 = *p_attributionView;
    *p_attributionView = 0;
  }
}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  if (a6 == &startPageAttributedRichLinkCellKvoEffectiveTraitCollectionKey
    && [v10 isEqualToString:@"_effectiveTraitCollection"])
  {
    if ([MEMORY[0x1E4F97EA0] is2024SuggestionsEnabled]) {
      [(SFAttributedRichLinkCell *)self _updateUserInterfaceStyle];
    }
  }
  else
  {
    v13.receiver = self;
    v13.super_class = (Class)SFAttributedRichLinkCell;
    [(SFAttributedRichLinkCell *)&v13 observeValueForKeyPath:v10 ofObject:v11 change:v12 context:a6];
  }
}

- (void)_updateUserInterfaceStyle
{
  uint64_t v3 = [(LPLinkView *)self->_linkView _effectiveTraitCollection];
  uint64_t v4 = [v3 userInterfaceStyle];

  id v5 = [(SLAttributionView *)self->_attributionView traitOverrides];
  [v5 setUserInterfaceStyle:v4];

  id v6 = [(UILabel *)self->_relativeDateLabel traitOverrides];
  [v6 setUserInterfaceStyle:v4];
}

- (BOOL)shouldShowContextMenuFromPoint:(CGPoint)a3
{
  CGFloat y = a3.y;
  CGFloat x = a3.x;
  [(UIView *)self->_linkViewContainer frame];
  CGFloat v9 = x;
  CGFloat v10 = y;

  return CGRectContainsPoint(*(CGRect *)&v5, *(CGPoint *)&v9);
}

- (SLAttributionView)attributionView
{
  return self->_attributionView;
}

- (SLHighlight)highlight
{
  return self->_highlight;
}

- (void)setHighlight:(id)a3
{
}

- (NSString)relativeDateString
{
  return self->_relativeDateString;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_relativeDateString, 0);
  objc_storeStrong((id *)&self->_highlight, 0);
  objc_storeStrong((id *)&self->_attributionView, 0);
  objc_storeStrong((id *)&self->_userInterfaceStyleChangeRegistrationForMetadata, 0);
  objc_storeStrong((id *)&self->_relativeDateLabel, 0);
  objc_storeStrong((id *)&self->_linkView, 0);

  objc_storeStrong((id *)&self->_linkViewContainer, 0);
}

@end