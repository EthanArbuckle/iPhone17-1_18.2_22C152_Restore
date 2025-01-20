@interface SUUIDefaultSettingDescriptionView
+ (BOOL)prefetchResourcesForSettingDescription:(id)a3 reason:(int64_t)a4 context:(id)a5;
+ (CGSize)preferredSizeForSettingDescription:(id)a3 context:(id)a4;
+ (CGSize)sizeThatFitsWidth:(double)a3 settingDescription:(id)a4 context:(id)a5;
+ (UIEdgeInsets)_paddingForStyle:(id)a3;
+ (void)requestLayoutForSettingDescription:(id)a3 width:(double)a4 context:(id)a5;
- (BOOL)hasDisclosureChevron;
- (BOOL)setImage:(id)a3 forArtworkRequest:(id)a4 context:(id)a5;
- (void)layoutSubviews;
- (void)reloadWithSettingDescription:(id)a3 width:(double)a4 context:(id)a5;
- (void)setBackgroundColor:(id)a3;
@end

@implementation SUUIDefaultSettingDescriptionView

+ (BOOL)prefetchResourcesForSettingDescription:(id)a3 reason:(int64_t)a4 context:(id)a5
{
  id v7 = a5;
  v8 = [a3 viewElement];
  uint64_t v9 = [v8 lockupViewType];
  v10 = off_2653FFA10;
  if (v9 != 8) {
    v10 = off_2653FF5B8;
  }
  char v11 = [(__objc2_class *)*v10 prefetchResourcesForViewElement:v8 reason:a4 context:v7];

  return v11;
}

+ (CGSize)preferredSizeForSettingDescription:(id)a3 context:(id)a4
{
  double v4 = *MEMORY[0x263F001B0];
  double v5 = *(double *)(MEMORY[0x263F001B0] + 8);
  result.height = v5;
  result.width = v4;
  return result;
}

+ (void)requestLayoutForSettingDescription:(id)a3 width:(double)a4 context:(id)a5
{
  id v7 = a5;
  id v10 = [a3 viewElement];
  uint64_t v8 = [v10 lockupViewType];
  uint64_t v9 = off_2653FFA10;
  if (v8 != 8) {
    uint64_t v9 = off_2653FF5B8;
  }
  [(__objc2_class *)*v9 requestLayoutForViewElement:v10 width:v7 context:a4];
}

+ (CGSize)sizeThatFitsWidth:(double)a3 settingDescription:(id)a4 context:(id)a5
{
  id v8 = a5;
  uint64_t v9 = [a4 viewElement];
  uint64_t v10 = [v9 lockupViewType];
  char v11 = off_2653FFA10;
  if (v10 != 8) {
    char v11 = off_2653FF5B8;
  }
  [(__objc2_class *)*v11 sizeThatFitsWidth:v9 viewElement:v8 context:a3];
  double v13 = v12;
  double v15 = v14;

  v16 = [v9 style];
  [a1 _paddingForStyle:v16];
  double v19 = v15 + v17 + v18;

  double v20 = v13;
  double v21 = v19;
  result.height = v21;
  result.width = v20;
  return result;
}

- (BOOL)hasDisclosureChevron
{
  return self->_hasDisclosureChevron;
}

- (void)reloadWithSettingDescription:(id)a3 width:(double)a4 context:(id)a5
{
  id v8 = a5;
  uint64_t v9 = [a3 viewElement];
  viewReuseView = self->_viewReuseView;
  if (!viewReuseView)
  {
    char v11 = objc_alloc_init(SUUIViewReuseView);
    double v12 = self->_viewReuseView;
    self->_viewReuseView = v11;

    [(SUUIDefaultSettingDescriptionView *)self addSubview:self->_viewReuseView];
    viewReuseView = self->_viewReuseView;
  }
  uint64_t v22 = MEMORY[0x263EF8330];
  uint64_t v23 = 3221225472;
  v24 = __80__SUUIDefaultSettingDescriptionView_reloadWithSettingDescription_width_context___block_invoke;
  v25 = &unk_265400C88;
  id v26 = v9;
  v27 = self;
  double v29 = a4;
  id v28 = v8;
  id v13 = v8;
  id v14 = v9;
  [(SUUIViewReuseView *)viewReuseView modifyUsingBlock:&v22];
  double v15 = objc_msgSend(v14, "style", v22, v23, v24, v25);
  [(id)objc_opt_class() _paddingForStyle:v15];
  self->_padding.top = v16;
  self->_padding.left = v17;
  self->_padding.bottom = v18;
  self->_padding.right = v19;
  double v20 = [MEMORY[0x263F825C8] clearColor];
  [(SUUIDefaultSettingDescriptionView *)self setBackgroundColor:v20];

  double v21 = [v14 firstChildForElementType:29];
  self->_hasDisclosureChevron = v21 != 0;
}

void __80__SUUIDefaultSettingDescriptionView_reloadWithSettingDescription_width_context___block_invoke(double *a1, void *a2)
{
  v3 = (void *)*((void *)a1 + 4);
  id v4 = a2;
  uint64_t v5 = [v3 lockupViewType];
  uint64_t v6 = *((void *)a1 + 4);
  double v7 = a1[7];
  uint64_t v8 = *((void *)a1 + 6);
  if (v5 == 8) {
    [v4 addTabularLockupWithElement:v6 width:v8 context:v7];
  }
  else {
  uint64_t v9 = [v4 addHorizontalLockupWithElement:v6 width:v8 context:v7];
  }

  uint64_t v10 = *((void *)a1 + 5);
  char v11 = *(void **)(v10 + 480);
  *(void *)(v10 + 480) = v9;
}

- (BOOL)setImage:(id)a3 forArtworkRequest:(id)a4 context:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if ([(UIView *)self->_viewElementView conformsToProtocol:&unk_2705ED578]) {
    char v11 = [(UIView *)self->_viewElementView setImage:v8 forArtworkRequest:v9 context:v10];
  }
  else {
    char v11 = 0;
  }

  return v11;
}

- (void)layoutSubviews
{
  v19.receiver = self;
  v19.super_class = (Class)SUUIDefaultSettingDescriptionView;
  [(SUUIDefaultSettingDescriptionView *)&v19 layoutSubviews];
  v3 = [MEMORY[0x263F82438] sharedApplication];
  uint64_t v4 = [v3 userInterfaceLayoutDirection];

  [(SUUIDefaultSettingDescriptionView *)self bounds];
  CGFloat v6 = v5;
  CGFloat v8 = v7;
  CGFloat v10 = v9;
  CGFloat v12 = v11;
  [(SUUISettingDescriptionView *)self layoutMargins];
  if (v4) {
    double v15 = v14;
  }
  else {
    double v15 = v13;
  }
  if (v4) {
    double v16 = v13;
  }
  else {
    double v16 = v14;
  }
  v20.origin.x = v6;
  v20.origin.y = v8;
  v20.size.width = v10;
  v20.size.height = v12;
  CGFloat v17 = CGRectGetWidth(v20) - v15 - v16;
  v21.origin.x = v6;
  v21.origin.y = v8;
  v21.size.width = v10;
  v21.size.height = v12;
  -[SUUIViewReuseView setFrame:](self->_viewReuseView, "setFrame:", v15, 0.0, v17, CGRectGetHeight(v21));
  viewElementView = self->_viewElementView;
  [(SUUIViewReuseView *)self->_viewReuseView bounds];
  -[UIView setFrame:](viewElementView, "setFrame:");
}

- (void)setBackgroundColor:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)SUUIDefaultSettingDescriptionView;
  id v4 = a3;
  [(SUUIDefaultSettingDescriptionView *)&v5 setBackgroundColor:v4];
  -[UIView setBackgroundColor:](self->_viewElementView, "setBackgroundColor:", v4, v5.receiver, v5.super_class);
}

+ (UIEdgeInsets)_paddingForStyle:(id)a3
{
  char v7 = 0;
  double v3 = SUUIViewElementPaddingForStyle(a3, &v7);
  if (!v7)
  {
    double v3 = *MEMORY[0x263F834E8];
    double v4 = *(double *)(MEMORY[0x263F834E8] + 8);
    double v5 = *(double *)(MEMORY[0x263F834E8] + 16);
    double v6 = *(double *)(MEMORY[0x263F834E8] + 24);
  }
  result.right = v6;
  result.bottom = v5;
  result.left = v4;
  result.top = v3;
  return result;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_viewReuseView, 0);
  objc_storeStrong((id *)&self->_viewElementView, 0);
}

@end