@interface SFStartPageSectionHeaderTitleView
- (NSString)title;
- (SFStartPageSectionHeaderTitleView)initWithCoder:(id)a3;
- (SFStartPageSectionHeaderTitleView)initWithFrame:(CGRect)a3;
- (UIImage)image;
- (UIMenu)menu;
- (void)configureUsingSection:(id)a3 visualStyleProvider:(id)a4;
- (void)createButtonIfNeeded;
- (void)dealloc;
- (void)setImage:(id)a3;
- (void)setMenu:(id)a3;
- (void)setTitle:(id)a3;
- (void)update;
@end

@implementation SFStartPageSectionHeaderTitleView

- (void)configureUsingSection:(id)a3 visualStyleProvider:(id)a4
{
  id v19 = a3;
  id v6 = a4;
  v7 = [v19 title];
  title = self->_title;
  self->_title = v7;

  v9 = [v19 icon];
  image = self->_image;
  self->_image = v9;

  if ([v19 usesLargeTitle])
  {
    v11 = [v6 sectionHeaderLargeTitleFont];
    font = self->_font;
    self->_font = v11;
  }
  else
  {
    font = [MEMORY[0x1E4FB1948] extraProminentInsetGroupedHeaderConfiguration];
    v13 = [font textProperties];
    v14 = [v13 font];
    v15 = self->_font;
    self->_font = v14;
  }
  v16 = [v19 titleMenu];
  if (v16)
  {
    -[SFStartPageSectionHeaderTitleView createButtonIfNeeded]((id *)&self->super.super.super.isa);
    button = self->_button;
    v18 = v16;
  }
  else
  {
    button = self->_button;
    v18 = 0;
  }
  [(UIButton *)button setMenu:v18];
  -[SFStartPageSectionHeaderTitleView update]((uint64_t)self);
}

- (void)update
{
  v41[2] = *MEMORY[0x1E4F143B8];
  if (a1)
  {
    v2 = [*(id *)(a1 + 408) menu];
    if (v2) {
      v3 = &OBJC_IVAR___SFStartPageSectionHeaderTitleView__button;
    }
    else {
      v3 = &OBJC_IVAR___SFStartPageSectionHeaderTitleView__label;
    }
    v4 = *(void **)(a1 + *v3);
    id v5 = v4;

    [v5 setHidden:0];
    id v6 = [*(id *)(a1 + 408) menu];
    if (v6) {
      v7 = &OBJC_IVAR___SFStartPageSectionHeaderTitleView__label;
    }
    else {
      v7 = &OBJC_IVAR___SFStartPageSectionHeaderTitleView__button;
    }
    id v8 = *(id *)(a1 + *v7);

    [v8 setHidden:1];
    if (*(id *)(a1 + 424) != v5)
    {
      if (*(void *)(a1 + 416)) {
        uint64_t v9 = *(void *)(a1 + 416);
      }
      else {
        uint64_t v9 = MEMORY[0x1E4F1CBF0];
      }
      [MEMORY[0x1E4F28DC8] deactivateConstraints:v9];
      uint64_t v10 = objc_msgSend(MEMORY[0x1E4F28DC8], "safari_constraintsMatchingFrameOfView:withFrameOfView:", v5, a1);
      v11 = *(void **)(a1 + 416);
      *(void *)(a1 + 416) = v10;

      [MEMORY[0x1E4F28DC8] activateConstraints:*(void *)(a1 + 416)];
      objc_storeStrong((id *)(a1 + 424), v4);
    }
    id v12 = *(id *)(a1 + 432);
    if (*(void *)(a1 + 448))
    {
      if (v5 == v12)
      {
        if (*(void *)(a1 + 456))
        {
          id v13 = objc_alloc_init(MEMORY[0x1E4F28E48]);
          v14 = [MEMORY[0x1E4FB0870] textAttachmentWithImage:*(void *)(a1 + 456)];
          v15 = [MEMORY[0x1E4F28B18] attributedStringWithAttachment:v14];
          [v13 appendAttributedString:v15];

          v16 = (void *)[objc_alloc(MEMORY[0x1E4F28B18]) initWithString:@" "];
          [v13 appendAttributedString:v16];

          v17 = (void *)[objc_alloc(MEMORY[0x1E4F28B18]) initWithString:*(void *)(a1 + 448)];
          [v13 appendAttributedString:v17];

          uint64_t v18 = *(void *)(a1 + 440);
          uint64_t v19 = *MEMORY[0x1E4FB0700];
          v40[0] = *MEMORY[0x1E4FB06F8];
          v40[1] = v19;
          v41[0] = v18;
          v20 = objc_msgSend(MEMORY[0x1E4FB1618], "sf_alternateLabelColor");
          v41[1] = v20;
          v21 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v41 forKeys:v40 count:2];
          objc_msgSend(v13, "addAttributes:range:", v21, 0, objc_msgSend(v13, "length"));

          uint64_t v22 = [v13 copy];
        }
        else
        {
          id v23 = objc_alloc(MEMORY[0x1E4F28B18]);
          uint64_t v24 = *(void *)(a1 + 448);
          v39[0] = *(void *)(a1 + 440);
          uint64_t v25 = *MEMORY[0x1E4FB0700];
          v38[0] = *MEMORY[0x1E4FB06F8];
          v38[1] = v25;
          objc_msgSend(MEMORY[0x1E4FB1618], "sf_alternateLabelColor");
          id v13 = (id)objc_claimAutoreleasedReturnValue();
          v39[1] = v13;
          v14 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v39 forKeys:v38 count:2];
          uint64_t v22 = [v23 initWithString:v24 attributes:v14];
        }
        v26 = (void *)v22;
        [*(id *)(a1 + 432) setAttributedText:v22];
      }
      if (v5 == *(id *)(a1 + 408))
      {
        v27 = [v5 configuration];
        if (v27)
        {
          uint64_t v28 = *(void *)(a1 + 440);
          uint64_t v36 = *MEMORY[0x1E4FB06F8];
          uint64_t v37 = v28;
          v29 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v37 forKeys:&v36 count:1];
          if (UIAccessibilityButtonShapesEnabled())
          {
            uint64_t v34 = *MEMORY[0x1E4FB0808];
            v35 = &unk_1EDA425B8;
            v30 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v35 forKeys:&v34 count:1];
            uint64_t v31 = objc_msgSend(v29, "safari_dictionaryByMergingWithDictionary:", v30);

            v29 = (void *)v31;
          }
          v32 = [MEMORY[0x1E4FB1830] configurationWithFont:*(void *)(a1 + 440) scale:1];
          [v27 setPreferredSymbolConfigurationForImage:v32];

          v33 = (void *)[objc_alloc(MEMORY[0x1E4F28B18]) initWithString:*(void *)(a1 + 448) attributes:v29];
          [v27 setAttributedTitle:v33];

          [*(id *)(a1 + 408) setConfiguration:v27];
        }
      }
    }
    else
    {
      [v12 setText:0];
      [*(id *)(a1 + 408) setConfiguration:0];
    }
  }
}

- (SFStartPageSectionHeaderTitleView)initWithFrame:(CGRect)a3
{
  v22[2] = *MEMORY[0x1E4F143B8];
  v21.receiver = self;
  v21.super_class = (Class)SFStartPageSectionHeaderTitleView;
  v3 = -[SFStartPageSectionHeaderTitleView initWithFrame:](&v21, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
  {
    id v5 = (void *)MEMORY[0x1E4F28DC8];
    id v6 = [(SFStartPageSectionHeaderTitleView *)v3 widthAnchor];
    v7 = [v6 constraintEqualToConstant:0.0];
    LODWORD(v8) = 1131413504;
    uint64_t v9 = objc_msgSend(v7, "sf_withPriority:", v8);
    v22[0] = v9;
    uint64_t v10 = [(SFStartPageSectionHeaderTitleView *)v4 heightAnchor];
    v11 = [v10 constraintEqualToConstant:0.0];
    LODWORD(v12) = 1131413504;
    id v13 = objc_msgSend(v11, "sf_withPriority:", v12);
    v22[1] = v13;
    v14 = [MEMORY[0x1E4F1C978] arrayWithObjects:v22 count:2];
    [v5 activateConstraints:v14];

    v15 = (UILabel *)objc_alloc_init(MEMORY[0x1E4FB1930]);
    label = v4->_label;
    v4->_label = v15;

    [(UILabel *)v4->_label setNumberOfLines:0];
    [(UILabel *)v4->_label setTranslatesAutoresizingMaskIntoConstraints:0];
    [(UILabel *)v4->_label setAdjustsFontForContentSizeCategory:1];
    LODWORD(v17) = 1144586240;
    [(UILabel *)v4->_label setContentCompressionResistancePriority:0 forAxis:v17];
    [(SFStartPageSectionHeaderTitleView *)v4 addSubview:v4->_label];
    uint64_t v18 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v18 addObserver:v4 selector:sel_buttonShapesEnabledStatusDidChange_ name:*MEMORY[0x1E4FB2428] object:0];

    uint64_t v19 = v4;
  }

  return v4;
}

- (SFStartPageSectionHeaderTitleView)initWithCoder:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)SFStartPageSectionHeaderTitleView;
  return [(SFStartPageSectionHeaderTitleView *)&v4 initWithCoder:a3];
}

- (void)dealloc
{
  v3 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v3 removeObserver:self name:*MEMORY[0x1E4FB2428] object:0];

  v4.receiver = self;
  v4.super_class = (Class)SFStartPageSectionHeaderTitleView;
  [(SFStartPageSectionHeaderTitleView *)&v4 dealloc];
}

- (void)setTitle:(id)a3
{
  id v6 = a3;
  if ((WBSIsEqual() & 1) == 0)
  {
    objc_super v4 = (NSString *)[v6 copy];
    title = self->_title;
    self->_title = v4;

    -[SFStartPageSectionHeaderTitleView update]((uint64_t)self);
  }
}

- (void)setImage:(id)a3
{
  id v5 = (UIImage *)a3;
  if (self->_image != v5)
  {
    id v6 = v5;
    objc_storeStrong((id *)&self->_image, a3);
    -[SFStartPageSectionHeaderTitleView update]((uint64_t)self);
    id v5 = v6;
  }
}

- (void)setMenu:(id)a3
{
  id v6 = a3;
  if ((WBSIsEqual() & 1) == 0)
  {
    if (v6)
    {
      -[SFStartPageSectionHeaderTitleView createButtonIfNeeded]((id *)&self->super.super.super.isa);
      button = self->_button;
      id v5 = v6;
    }
    else
    {
      button = self->_button;
      id v5 = 0;
    }
    [(UIButton *)button setMenu:v5];
    -[SFStartPageSectionHeaderTitleView update]((uint64_t)self);
  }
}

- (void)createButtonIfNeeded
{
  if (a1 && !a1[51])
  {
    id v9 = [MEMORY[0x1E4FB14D8] plainButtonConfiguration];
    v2 = objc_msgSend(MEMORY[0x1E4FB1618], "sf_alternateLabelColor");
    [v9 setBaseForegroundColor:v2];

    objc_msgSend(v9, "setContentInsets:", *MEMORY[0x1E4FB12A8], *(double *)(MEMORY[0x1E4FB12A8] + 8), *(double *)(MEMORY[0x1E4FB12A8] + 16), *(double *)(MEMORY[0x1E4FB12A8] + 24));
    v3 = [MEMORY[0x1E4FB1818] systemImageNamed:@"chevron.up.chevron.down"];
    [v9 setImage:v3];

    [v9 setImageColorTransformer:&__block_literal_global_62];
    objc_super v4 = [MEMORY[0x1E4FB1618] clearColor];
    id v5 = [v9 background];
    [v5 setBackgroundColor:v4];

    [v9 setImagePadding:5.0];
    [v9 setImagePlacement:8];
    uint64_t v6 = [MEMORY[0x1E4FB14D0] buttonWithConfiguration:v9 primaryAction:0];
    id v7 = a1[51];
    a1[51] = (id)v6;

    [a1[51] setAdjustsImageSizeForAccessibilityContentSizeCategory:1];
    [a1[51] setShowsMenuAsPrimaryAction:1];
    [a1[51] setTranslatesAutoresizingMaskIntoConstraints:0];
    LODWORD(v8) = 1144586240;
    [a1[51] setContentCompressionResistancePriority:0 forAxis:v8];
    [a1 addSubview:a1[51]];
  }
}

uint64_t __57__SFStartPageSectionHeaderTitleView_createButtonIfNeeded__block_invoke()
{
  return objc_msgSend(MEMORY[0x1E4FB1618], "sf_alternateSecondaryLabelColor");
}

- (NSString)title
{
  return self->_title;
}

- (UIImage)image
{
  return self->_image;
}

- (UIMenu)menu
{
  return self->_menu;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_menu, 0);
  objc_storeStrong((id *)&self->_image, 0);
  objc_storeStrong((id *)&self->_title, 0);
  objc_storeStrong((id *)&self->_font, 0);
  objc_storeStrong((id *)&self->_label, 0);
  objc_storeStrong((id *)&self->_currentConstraintsSubview, 0);
  objc_storeStrong((id *)&self->_currentConstraints, 0);

  objc_storeStrong((id *)&self->_button, 0);
}

@end