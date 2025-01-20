@interface SKUIDefaultSettingDescriptionView
+ (BOOL)prefetchResourcesForSettingDescription:(id)a3 reason:(int64_t)a4 context:(id)a5;
+ (CGSize)preferredSizeForSettingDescription:(id)a3 context:(id)a4;
+ (CGSize)sizeThatFitsWidth:(double)a3 settingDescription:(id)a4 context:(id)a5;
+ (UIEdgeInsets)_paddingForStyle:(id)a3;
+ (void)requestLayoutForSettingDescription:(id)a3 width:(double)a4 context:(id)a5;
- (BOOL)hasDisclosureChevron;
- (BOOL)setImage:(id)a3 forArtworkRequest:(id)a4 context:(id)a5;
- (void)hasDisclosureChevron;
- (void)layoutSubviews;
- (void)reloadWithSettingDescription:(id)a3 width:(double)a4 context:(id)a5;
- (void)setBackgroundColor:(id)a3;
@end

@implementation SKUIDefaultSettingDescriptionView

+ (BOOL)prefetchResourcesForSettingDescription:(id)a3 reason:(int64_t)a4 context:(id)a5
{
  id v7 = a3;
  id v8 = a5;
  if (os_variant_has_internal_content())
  {
    if (_os_feature_enabled_impl())
    {
      BOOL v9 = os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT);
      if (v9) {
        +[SKUIDefaultSettingDescriptionView prefetchResourcesForSettingDescription:reason:context:](v9, v10, v11, v12, v13, v14, v15, v16);
      }
    }
  }
  v17 = [v7 viewElement];
  uint64_t v18 = [v17 lockupViewType];
  v19 = off_1E6421050;
  if (v18 != 8) {
    v19 = off_1E6420BE8;
  }
  char v20 = [(__objc2_class *)*v19 prefetchResourcesForViewElement:v17 reason:a4 context:v8];

  return v20;
}

+ (CGSize)preferredSizeForSettingDescription:(id)a3 context:(id)a4
{
  if (os_variant_has_internal_content())
  {
    if (_os_feature_enabled_impl())
    {
      BOOL v4 = os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT);
      if (v4) {
        +[SKUIDefaultSettingDescriptionView preferredSizeForSettingDescription:context:](v4, v5, v6, v7, v8, v9, v10, v11);
      }
    }
  }
  double v12 = *MEMORY[0x1E4F1DB30];
  double v13 = *(double *)(MEMORY[0x1E4F1DB30] + 8);
  result.height = v13;
  result.width = v12;
  return result;
}

+ (void)requestLayoutForSettingDescription:(id)a3 width:(double)a4 context:(id)a5
{
  id v7 = a3;
  id v8 = a5;
  if (os_variant_has_internal_content())
  {
    if (_os_feature_enabled_impl())
    {
      BOOL v9 = os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT);
      if (v9) {
        +[SKUIDefaultSettingDescriptionView requestLayoutForSettingDescription:width:context:](v9, v10, v11, v12, v13, v14, v15, v16);
      }
    }
  }
  v17 = [v7 viewElement];
  uint64_t v18 = [v17 lockupViewType];
  v19 = off_1E6421050;
  if (v18 != 8) {
    v19 = off_1E6420BE8;
  }
  [(__objc2_class *)*v19 requestLayoutForViewElement:v17 width:v8 context:a4];
}

+ (CGSize)sizeThatFitsWidth:(double)a3 settingDescription:(id)a4 context:(id)a5
{
  id v8 = a4;
  id v9 = a5;
  if (os_variant_has_internal_content())
  {
    if (_os_feature_enabled_impl())
    {
      BOOL v10 = os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT);
      if (v10) {
        +[SKUIDefaultSettingDescriptionView sizeThatFitsWidth:settingDescription:context:](v10, v11, v12, v13, v14, v15, v16, v17);
      }
    }
  }
  uint64_t v18 = [v8 viewElement];
  uint64_t v19 = [v18 lockupViewType];
  char v20 = off_1E6421050;
  if (v19 != 8) {
    char v20 = off_1E6420BE8;
  }
  [(__objc2_class *)*v20 sizeThatFitsWidth:v18 viewElement:v9 context:a3];
  double v22 = v21;
  double v24 = v23;
  v25 = [v18 style];
  [a1 _paddingForStyle:v25];
  double v28 = v24 + v26 + v27;

  double v29 = v22;
  double v30 = v28;
  result.height = v30;
  result.width = v29;
  return result;
}

- (BOOL)hasDisclosureChevron
{
  if (os_variant_has_internal_content())
  {
    if (_os_feature_enabled_impl())
    {
      BOOL v3 = os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT);
      if (v3) {
        [(SKUIDefaultSettingDescriptionView *)v3 hasDisclosureChevron];
      }
    }
  }
  return self->_hasDisclosureChevron;
}

- (void)reloadWithSettingDescription:(id)a3 width:(double)a4 context:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  if (os_variant_has_internal_content())
  {
    if (_os_feature_enabled_impl())
    {
      BOOL v10 = os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT);
      if (v10) {
        -[SKUIDefaultSettingDescriptionView reloadWithSettingDescription:width:context:](v10, v11, v12, v13, v14, v15, v16, v17);
      }
    }
  }
  uint64_t v18 = [v8 viewElement];
  viewReuseView = self->_viewReuseView;
  if (!viewReuseView)
  {
    char v20 = objc_alloc_init(SKUIViewReuseView);
    double v21 = self->_viewReuseView;
    self->_viewReuseView = v20;

    [(SKUIDefaultSettingDescriptionView *)self addSubview:self->_viewReuseView];
    viewReuseView = self->_viewReuseView;
  }
  uint64_t v31 = MEMORY[0x1E4F143A8];
  uint64_t v32 = 3221225472;
  v33 = __80__SKUIDefaultSettingDescriptionView_reloadWithSettingDescription_width_context___block_invoke;
  v34 = &unk_1E64234F8;
  id v35 = v18;
  v36 = self;
  double v38 = a4;
  id v37 = v9;
  id v22 = v9;
  id v23 = v18;
  [(SKUIViewReuseView *)viewReuseView modifyUsingBlock:&v31];
  double v24 = objc_msgSend(v23, "style", v31, v32, v33, v34);
  [(id)objc_opt_class() _paddingForStyle:v24];
  self->_padding.top = v25;
  self->_padding.left = v26;
  self->_padding.bottom = v27;
  self->_padding.right = v28;
  double v29 = [MEMORY[0x1E4FB1618] clearColor];
  [(SKUIDefaultSettingDescriptionView *)self setBackgroundColor:v29];

  double v30 = [v23 firstChildForElementType:29];
  self->_hasDisclosureChevron = v30 != 0;
}

void __80__SKUIDefaultSettingDescriptionView_reloadWithSettingDescription_width_context___block_invoke(double *a1, void *a2)
{
  BOOL v3 = (void *)*((void *)a1 + 4);
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
  uint64_t v11 = *(void **)(v10 + 480);
  *(void *)(v10 + 480) = v9;
}

- (BOOL)setImage:(id)a3 forArtworkRequest:(id)a4 context:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if (os_variant_has_internal_content())
  {
    if (_os_feature_enabled_impl())
    {
      BOOL v11 = os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT);
      if (v11) {
        -[SKUIDefaultSettingDescriptionView setImage:forArtworkRequest:context:](v11, v12, v13, v14, v15, v16, v17, v18);
      }
    }
  }
  if ([(UIView *)self->_viewElementView conformsToProtocol:&unk_1F1D751F8]) {
    char v19 = [(UIView *)self->_viewElementView setImage:v8 forArtworkRequest:v9 context:v10];
  }
  else {
    char v19 = 0;
  }

  return v19;
}

- (void)layoutSubviews
{
}

- (void)setBackgroundColor:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)SKUIDefaultSettingDescriptionView;
  id v4 = a3;
  [(SKUIDefaultSettingDescriptionView *)&v5 setBackgroundColor:v4];
  -[UIView setBackgroundColor:](self->_viewElementView, "setBackgroundColor:", v4, v5.receiver, v5.super_class);
}

+ (UIEdgeInsets)_paddingForStyle:(id)a3
{
  char v7 = 0;
  double v3 = SKUIViewElementPaddingForStyle(a3, &v7);
  if (!v7)
  {
    double v3 = *MEMORY[0x1E4FB2848];
    double v4 = *(double *)(MEMORY[0x1E4FB2848] + 8);
    double v5 = *(double *)(MEMORY[0x1E4FB2848] + 16);
    double v6 = *(double *)(MEMORY[0x1E4FB2848] + 24);
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

+ (void)prefetchResourcesForSettingDescription:(uint64_t)a3 reason:(uint64_t)a4 context:(uint64_t)a5 .cold.1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

+ (void)preferredSizeForSettingDescription:(uint64_t)a3 context:(uint64_t)a4 .cold.1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

+ (void)requestLayoutForSettingDescription:(uint64_t)a3 width:(uint64_t)a4 context:(uint64_t)a5 .cold.1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

+ (void)sizeThatFitsWidth:(uint64_t)a3 settingDescription:(uint64_t)a4 context:(uint64_t)a5 .cold.1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)hasDisclosureChevron
{
}

- (void)reloadWithSettingDescription:(uint64_t)a3 width:(uint64_t)a4 context:(uint64_t)a5 .cold.1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)setImage:(uint64_t)a3 forArtworkRequest:(uint64_t)a4 context:(uint64_t)a5 .cold.1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

@end