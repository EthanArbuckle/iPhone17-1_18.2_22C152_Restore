@interface WFChooseFromListDialogCell
- (BOOL)isChecked;
- (BOOL)prefersSeparatorInsetForImage;
- (CGSize)sizeThatFits:(CGSize)a3;
- (MTVisualStylingProvider)fillVisualStylingProvider;
- (NSCache)imageCache;
- (TLKSimpleRowView)rowView;
- (UIView)previewView;
- (WFChooseFromListDialogCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4;
- (WFChooseFromListDialogViewController)viewController;
- (WFDialogListItem)listItem;
- (WFListDisplayConfiguration)displayConfiguration;
- (id)pointerInteraction:(id)a3 styleForRegion:(id)a4;
- (unint64_t)tlkCornerRoundingStyleForWFRoundingStyle:(unint64_t)a3;
- (void)layoutSubviews;
- (void)setChecked:(BOOL)a3;
- (void)setDisplayConfiguration:(id)a3;
- (void)setFillVisualStylingProvider:(id)a3;
- (void)setImageCache:(id)a3;
- (void)setListItem:(id)a3;
- (void)setPrefersSeparatorInsetForImage:(BOOL)a3;
- (void)setPreviewView:(id)a3;
- (void)setRowView:(id)a3;
- (void)setViewController:(id)a3;
@end

@implementation WFChooseFromListDialogCell

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_rowView);
  objc_destroyWeak((id *)&self->_previewView);
  objc_storeStrong((id *)&self->_displayConfiguration, 0);
  objc_storeStrong((id *)&self->_imageCache, 0);
  objc_storeStrong((id *)&self->_fillVisualStylingProvider, 0);
  objc_storeStrong((id *)&self->_listItem, 0);
  objc_destroyWeak((id *)&self->_viewController);
}

- (void)setRowView:(id)a3
{
}

- (TLKSimpleRowView)rowView
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_rowView);
  return (TLKSimpleRowView *)WeakRetained;
}

- (void)setPreviewView:(id)a3
{
}

- (UIView)previewView
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_previewView);
  return (UIView *)WeakRetained;
}

- (void)setPrefersSeparatorInsetForImage:(BOOL)a3
{
  self->_prefersSeparatorInsetForImage = a3;
}

- (BOOL)prefersSeparatorInsetForImage
{
  return self->_prefersSeparatorInsetForImage;
}

- (void)setDisplayConfiguration:(id)a3
{
}

- (WFListDisplayConfiguration)displayConfiguration
{
  return self->_displayConfiguration;
}

- (void)setImageCache:(id)a3
{
}

- (NSCache)imageCache
{
  return self->_imageCache;
}

- (MTVisualStylingProvider)fillVisualStylingProvider
{
  return self->_fillVisualStylingProvider;
}

- (BOOL)isChecked
{
  return self->_checked;
}

- (WFDialogListItem)listItem
{
  return self->_listItem;
}

- (void)setViewController:(id)a3
{
}

- (WFChooseFromListDialogViewController)viewController
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_viewController);
  return (WFChooseFromListDialogViewController *)WeakRetained;
}

- (id)pointerInteraction:(id)a3 styleForRegion:(id)a4
{
  v4 = (void *)[objc_alloc(MEMORY[0x263F82CC8]) initWithView:self];
  v5 = [MEMORY[0x263F82A68] effectWithPreview:v4];
  v6 = [MEMORY[0x263F82A90] styleWithEffect:v5 shape:0];

  return v6;
}

- (void)setFillVisualStylingProvider:(id)a3
{
  objc_storeStrong((id *)&self->_fillVisualStylingProvider, a3);
  id v5 = a3;
  id v11 = [MEMORY[0x263F824D8] effectWithStyle:1200];
  v6 = [MEMORY[0x263F82DF0] effectForBlurEffect:v11 style:4];
  v7 = (void *)[objc_alloc(MEMORY[0x263F82E50]) initWithEffect:v6];
  v8 = [MEMORY[0x263F825C8] blackColor];

  v9 = [v8 colorWithAlphaComponent:0.4];
  v10 = [v7 contentView];
  [v10 setBackgroundColor:v9];

  [(WFChooseFromListDialogCell *)self setSelectedBackgroundView:v7];
}

- (void)setChecked:(BOOL)a3
{
  self->_checked = a3;
  if (a3) {
    uint64_t v3 = 3;
  }
  else {
    uint64_t v3 = 0;
  }
  [(WFChooseFromListDialogCell *)self setAccessoryType:v3];
}

- (unint64_t)tlkCornerRoundingStyleForWFRoundingStyle:(unint64_t)a3
{
  if (a3 - 1 >= 3) {
    return 0;
  }
  else {
    return a3;
  }
}

- (void)setListItem:(id)a3
{
  v28[1] = *MEMORY[0x263EF8340];
  id v5 = a3;
  objc_storeStrong((id *)&self->_listItem, a3);
  id v6 = v5;
  if (!v6) {
    goto LABEL_13;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0) {
    goto LABEL_13;
  }
  if (![MEMORY[0x263EFFA40] universalPreviewsEnabled])
  {
    v10 = [(WFChooseFromListDialogCell *)self rowView];
    id v11 = [v6 title];
    uint64_t v12 = [v11 length];

    if (v12)
    {
      Class TLKFormattedTextClass = getTLKFormattedTextClass();
      v14 = [v6 title];
      v15 = [(objc_class *)TLKFormattedTextClass formattedTextWithString:v14];

      [v15 setIsBold:1];
      v16 = [(WFChooseFromListDialogCell *)self displayConfiguration];
      v17 = [v16 titleLineLimit];

      if (v17) {
        objc_msgSend(v15, "setMaxLines:", objc_msgSend(v17, "unsignedIntegerValue"));
      }
      getTLKRichTextClass();
      v18 = objc_opt_new();
      v28[0] = v15;
      v19 = [MEMORY[0x263EFF8C0] arrayWithObjects:v28 count:1];
      [v18 setFormattedTextItems:v19];

      [v10 setLeadingTitle:v18];
      [(WFChooseFromListDialogCell *)self setPrefersSeparatorInsetForImage:0];
      v21[0] = MEMORY[0x263EF8330];
      v21[1] = 3221225472;
      v21[2] = __42__WFChooseFromListDialogCell_setListItem___block_invoke_2;
      v21[3] = &unk_2649CACF8;
      id v22 = v6;
      id v23 = v10;
      v24 = self;
      id v9 = v6;
      id v20 = v10;
      [v9 prepareForDisplayWithCompletionHandler:v21];

      goto LABEL_11;
    }

LABEL_13:
    goto LABEL_14;
  }
  v7 = [(WFChooseFromListDialogCell *)self previewView];

  if (v7)
  {
    v8 = [(WFChooseFromListDialogCell *)self previewView];
    [v8 removeFromSuperview];
  }
  v25[0] = MEMORY[0x263EF8330];
  v25[1] = 3221225472;
  v25[2] = __42__WFChooseFromListDialogCell_setListItem___block_invoke;
  v25[3] = &unk_2649CAC58;
  id v26 = v6;
  v27 = self;
  id v9 = v6;
  [v9 prepareForDisplayWithCompletionHandler:v25];

LABEL_11:
LABEL_14:
}

void __42__WFChooseFromListDialogCell_setListItem___block_invoke(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) contentItem];
  id v10 = [v2 generateListPreviewUIView];

  [v10 setUserInteractionEnabled:0];
  uint64_t v3 = [*(id *)(a1 + 40) contentView];
  [v3 bounds];
  double v5 = v4;
  id v6 = [*(id *)(a1 + 40) contentView];
  [v6 bounds];
  objc_msgSend(v10, "setFrame:", 0.0, 0.0, v5);

  [v10 setAutoresizingMask:18];
  v7 = [MEMORY[0x263F825C8] clearColor];
  [v10 setBackgroundColor:v7];

  v8 = [*(id *)(a1 + 40) contentView];
  [v8 addSubview:v10];

  [*(id *)(a1 + 40) setPreviewView:v10];
  id v9 = [*(id *)(a1 + 40) viewController];
  [v9 updateCellSeparatorInsets];
}

void __42__WFChooseFromListDialogCell_setListItem___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  v32[0] = MEMORY[0x263EF8330];
  v32[1] = 3221225472;
  v32[2] = __42__WFChooseFromListDialogCell_setListItem___block_invoke_3;
  v32[3] = &unk_2649CAC80;
  double v4 = *(void **)(a1 + 32);
  id v33 = *(id *)(a1 + 40);
  if (([v4 loadSubtitleWithCompletion:v32] & 1) == 0) {
    [*(id *)(a1 + 40) setLeadingSubtitle:0];
  }
  v30[0] = MEMORY[0x263EF8330];
  v30[1] = 3221225472;
  v30[2] = __42__WFChooseFromListDialogCell_setListItem___block_invoke_4;
  v30[3] = &unk_2649CAC80;
  double v5 = *(void **)(a1 + 32);
  id v31 = *(id *)(a1 + 40);
  if (([v5 loadAltTextWithCompletion:v30] & 1) == 0) {
    [*(id *)(a1 + 40) setTrailingTitle:0];
  }
  id v6 = [*(id *)(a1 + 48) imageCache];
  v7 = [v6 objectForKey:v3];
  [*(id *)(a1 + 40) setLeadingImage:v7];

  v8 = [*(id *)(a1 + 40) leadingImage];

  if (v8)
  {
    uint64_t v9 = 1;
  }
  else
  {
    objc_initWeak(&location, *(id *)(a1 + 48));
    id v10 = *(void **)(a1 + 32);
    uint64_t v21 = MEMORY[0x263EF8330];
    uint64_t v22 = 3221225472;
    id v23 = __42__WFChooseFromListDialogCell_setListItem___block_invoke_5;
    v24 = &unk_2649CACD0;
    objc_copyWeak(&v27, &location);
    __asm { FMOV            V0.2D, #31.0 }
    long long v28 = _Q0;
    id v25 = v3;
    id v26 = *(id *)(a1 + 40);
    uint64_t v9 = objc_msgSend(v10, "loadImageWithSize:completion:", &v21, 31.0, 31.0);
    if (v9)
    {
      v16 = objc_msgSend(*(id *)(a1 + 40), "leadingImage", v21, v22, v23, v24, v25);

      if (!v16)
      {
        id v17 = objc_alloc(getTLKImageClass());
        v18 = objc_opt_new();
        v19 = (void *)[v17 initWithImage:v18];

        objc_msgSend(v19, "setSize:", 31.0, 31.0);
        [*(id *)(a1 + 40) setLeadingImage:v19];
      }
    }

    objc_destroyWeak(&v27);
    objc_destroyWeak(&location);
  }
  id v20 = objc_msgSend(*(id *)(a1 + 48), "viewController", v21, v22, v23, v24);
  [v20 updateCellSeparatorInsets];

  [*(id *)(a1 + 48) setPrefersSeparatorInsetForImage:v9];
}

void __42__WFChooseFromListDialogCell_setListItem___block_invoke_3(uint64_t a1, void *a2)
{
  v7[1] = *MEMORY[0x263EF8340];
  id v3 = a2;
  if ([v3 length])
  {
    double v4 = [(objc_class *)getTLKFormattedTextClass() formattedTextWithString:v3];
    [v4 setMaxLines:2];
    getTLKRichTextClass();
    double v5 = objc_opt_new();
    v7[0] = v4;
    id v6 = [MEMORY[0x263EFF8C0] arrayWithObjects:v7 count:1];
    [v5 setFormattedTextItems:v6];

    [*(id *)(a1 + 32) setLeadingSubtitle:v5];
  }
}

void __42__WFChooseFromListDialogCell_setListItem___block_invoke_4(uint64_t a1, void *a2)
{
  v7[1] = *MEMORY[0x263EF8340];
  id v3 = a2;
  if ([v3 length])
  {
    double v4 = [(objc_class *)getTLKFormattedTextClass() formattedTextWithString:v3];
    [v4 setMaxLines:1];
    getTLKRichTextClass();
    double v5 = objc_opt_new();
    v7[0] = v4;
    id v6 = [MEMORY[0x263EFF8C0] arrayWithObjects:v7 count:1];
    [v5 setFormattedTextItems:v6];

    [*(id *)(a1 + 32) setTrailingTitle:v5];
  }
}

void __42__WFChooseFromListDialogCell_setListItem___block_invoke_5(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  if (v5)
  {
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __42__WFChooseFromListDialogCell_setListItem___block_invoke_6;
    block[3] = &unk_2649CACA8;
    id v10 = v6;
    id v8 = v5;
    long long v15 = *(_OWORD *)(a1 + 56);
    id v11 = v8;
    id v12 = WeakRetained;
    id v13 = *(id *)(a1 + 32);
    id v14 = *(id *)(a1 + 40);
    dispatch_async(MEMORY[0x263EF83A0], block);
  }
}

void __42__WFChooseFromListDialogCell_setListItem___block_invoke_6(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) objectForKey:*MEMORY[0x263F85630]];
  id v13 = v2;
  if (v2) {
    uint64_t v3 = [v2 unsignedIntegerValue];
  }
  else {
    uint64_t v3 = 0;
  }
  double v4 = [*(id *)(a1 + 40) UIImage];
  id v5 = [v4 imageWithRenderingMode:1];

  TLKImageClass = (void *)getTLKImageClass();
  v7 = [*(id *)(a1 + 40) tintColor];
  id v8 = [v7 UIColor];
  uint64_t v9 = [TLKImageClass applyTintColor:v8 toImage:v5];

  id v10 = (void *)[objc_alloc((Class)getTLKImageClass()) initWithImage:v9];
  objc_msgSend(v10, "setSize:", *(double *)(a1 + 72), *(double *)(a1 + 80));
  objc_msgSend(v10, "setCornerRoundingStyle:", objc_msgSend(*(id *)(a1 + 48), "tlkCornerRoundingStyleForWFRoundingStyle:", v3));
  id v11 = [*(id *)(a1 + 48) imageCache];
  [v11 setObject:v10 forKey:*(void *)(a1 + 56)];

  id v12 = [*(id *)(a1 + 48) listItem];
  LODWORD(v8) = [v12 isEqual:*(void *)(a1 + 56)];

  if (v8) {
    [*(id *)(a1 + 64) setLeadingImage:v10];
  }
}

- (void)layoutSubviews
{
  v16.receiver = self;
  v16.super_class = (Class)WFChooseFromListDialogCell;
  [(WFChooseFromListDialogCell *)&v16 layoutSubviews];
  uint64_t v3 = [(WFChooseFromListDialogCell *)self contentView];
  [v3 bounds];
  CGRect v18 = CGRectInset(v17, 8.0, 0.0);
  double x = v18.origin.x;
  double y = v18.origin.y;
  double width = v18.size.width;
  double height = v18.size.height;
  id v8 = [(WFChooseFromListDialogCell *)self rowView];
  objc_msgSend(v8, "setFrame:", x, y, width, height);

  uint64_t v9 = [(WFChooseFromListDialogCell *)self previewView];

  if (v9)
  {
    id v10 = [(WFChooseFromListDialogCell *)self contentView];
    [v10 bounds];
    CGRect v20 = CGRectInset(v19, 0.0, 0.0);
    double v11 = v20.origin.x;
    double v12 = v20.origin.y;
    double v13 = v20.size.width;
    double v14 = v20.size.height;
    long long v15 = [(WFChooseFromListDialogCell *)self previewView];
    objc_msgSend(v15, "setFrame:", v11, v12, v13, v14);
  }
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double height = a3.height;
  id v5 = [(WFChooseFromListDialogCell *)self contentView];
  [v5 bounds];
  double v7 = v6;

  id v8 = [(WFChooseFromListDialogCell *)self previewView];

  if (v8) {
    [(WFChooseFromListDialogCell *)self previewView];
  }
  else {
  uint64_t v9 = [(WFChooseFromListDialogCell *)self rowView];
  }
  objc_msgSend(v9, "sizeThatFits:", v7, height);
  double v11 = v10;
  double v13 = v12;

  if (v13 >= 54.0) {
    double v14 = v13;
  }
  else {
    double v14 = 54.0;
  }
  double v15 = v11;
  result.double height = v14;
  result.double width = v15;
  return result;
}

- (WFChooseFromListDialogCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
{
  v11.receiver = self;
  v11.super_class = (Class)WFChooseFromListDialogCell;
  double v4 = [(WFChooseFromListDialogCell *)&v11 initWithStyle:0 reuseIdentifier:a4];
  if (v4)
  {
    id v5 = [MEMORY[0x263F825C8] clearColor];
    [(WFChooseFromListDialogCell *)v4 setBackgroundColor:v5];

    if (([MEMORY[0x263EFFA40] universalPreviewsEnabled] & 1) == 0)
    {
      double v6 = objc_alloc_init(WFTLKSimpleRowView);
      double v7 = [(WFChooseFromListDialogCell *)v4 contentView];
      [v7 addSubview:v6];

      objc_storeWeak((id *)&v4->_rowView, v6);
    }
    id v8 = (void *)[objc_alloc(MEMORY[0x263F82A70]) initWithDelegate:v4];
    [(WFChooseFromListDialogCell *)v4 addInteraction:v8];
    uint64_t v9 = v4;
  }
  return v4;
}

@end