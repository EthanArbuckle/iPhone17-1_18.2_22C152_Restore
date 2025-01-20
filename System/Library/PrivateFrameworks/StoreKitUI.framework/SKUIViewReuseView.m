@interface SKUIViewReuseView
- (NSArray)allExistingViews;
- (SKUIViewReuseView)initWithFrame:(CGRect)a3;
- (void)dealloc;
- (void)enumerateExistingViewsForReuseIdentifier:(id)a3 usingBlock:(id)a4;
- (void)modifyUsingBlock:(id)a3;
- (void)registerClass:(Class)a3 forViewWithReuseIdentifier:(id)a4;
- (void)setBackgroundColor:(id)a3;
@end

@implementation SKUIViewReuseView

- (SKUIViewReuseView)initWithFrame:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  if (os_variant_has_internal_content()
    && _os_feature_enabled_impl()
    && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEBUG))
  {
    -[SKUIViewReuseView initWithFrame:]();
  }
  v12.receiver = self;
  v12.super_class = (Class)SKUIViewReuseView;
  v8 = -[SKUIViewReuseView initWithFrame:](&v12, sel_initWithFrame_, x, y, width, height);
  if (v8)
  {
    v9 = [[SKUIViewReusePool alloc] initWithParentView:v8];
    viewReusePool = v8->_viewReusePool;
    v8->_viewReusePool = v9;
  }
  return v8;
}

- (void)dealloc
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  objc_opt_class();
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  v3 = self->_allExistingViews;
  uint64_t v4 = [(NSArray *)v3 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v11;
    do
    {
      uint64_t v7 = 0;
      do
      {
        if (*(void *)v11 != v6) {
          objc_enumerationMutation(v3);
        }
        v8 = *(void **)(*((void *)&v10 + 1) + 8 * v7);
        if (objc_opt_isKindOfClass()) {
          [v8 removeTarget:self action:0 forControlEvents:0xFFFFFFFFLL];
        }
        ++v7;
      }
      while (v5 != v7);
      uint64_t v5 = [(NSArray *)v3 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v5);
  }

  v9.receiver = self;
  v9.super_class = (Class)SKUIViewReuseView;
  [(SKUIViewReuseView *)&v9 dealloc];
}

- (void)enumerateExistingViewsForReuseIdentifier:(id)a3 usingBlock:(id)a4
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  uint64_t v7 = (void (**)(id, void *, uint64_t, char *))a4;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  v8 = self->_allExistingViews;
  uint64_t v9 = [(NSArray *)v8 countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = 0;
    uint64_t v12 = *(void *)v18;
    while (2)
    {
      for (uint64_t i = 0; i != v10; ++i)
      {
        if (*(void *)v18 != v12) {
          objc_enumerationMutation(v8);
        }
        v14 = *(void **)(*((void *)&v17 + 1) + 8 * i);
        uint64_t v15 = SKUIReuseIdentifierForView(v14);
        if (v15 && [v6 isEqualToString:v15])
        {
          char v16 = 0;
          v7[2](v7, v14, v11, &v16);
          if (v16)
          {

            goto LABEL_14;
          }
          ++v11;
        }
      }
      uint64_t v10 = [(NSArray *)v8 countByEnumeratingWithState:&v17 objects:v21 count:16];
      if (v10) {
        continue;
      }
      break;
    }
  }
LABEL_14:
}

- (void)modifyUsingBlock:(id)a3
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  uint64_t v4 = (void (**)(id, SKUIViewModification *))a3;
  if (self->_allExistingViews)
  {
    -[SKUIViewReusePool recycleReusableViews:](self->_viewReusePool, "recycleReusableViews:");
    allExistingViews = self->_allExistingViews;
    self->_allExistingViews = 0;
  }
  id v6 = [[SKUIViewModification alloc] initWithViewReusePool:self->_viewReusePool];
  v4[2](v4, v6);
  uint64_t v7 = [(SKUIViewReuseView *)self backgroundColor];
  v8 = [(SKUIViewModification *)v6 views];
  uint64_t v9 = self->_allExistingViews;
  self->_allExistingViews = v8;

  long long v18 = 0u;
  long long v19 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  uint64_t v10 = self->_allExistingViews;
  uint64_t v11 = [(NSArray *)v10 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v11)
  {
    uint64_t v12 = v11;
    uint64_t v13 = *(void *)v17;
    do
    {
      for (uint64_t i = 0; i != v12; ++i)
      {
        if (*(void *)v17 != v13) {
          objc_enumerationMutation(v10);
        }
        uint64_t v15 = *(void **)(*((void *)&v16 + 1) + 8 * i);
        objc_msgSend(v15, "setBackgroundColor:", v7, (void)v16);
        [(SKUIViewReuseView *)self addSubview:v15];
      }
      uint64_t v12 = [(NSArray *)v10 countByEnumeratingWithState:&v16 objects:v20 count:16];
    }
    while (v12);
  }

  [(SKUIViewReusePool *)self->_viewReusePool hideUnusedViews];
  [(SKUIViewReuseView *)self setNeedsLayout];
}

- (void)registerClass:(Class)a3 forViewWithReuseIdentifier:(id)a4
{
}

- (void)setBackgroundColor:(id)a3
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  double v18 = 0.0;
  double v19 = 0.0;
  double v16 = 0.0;
  double v17 = 0.0;
  uint64_t v5 = v4;
  if ([v4 getHue:&v19 saturation:&v18 brightness:&v17 alpha:&v16])
  {
    uint64_t v5 = v4;
    if (v16 < 1.0)
    {
      uint64_t v5 = v4;
      if (v19 != 0.0)
      {
        uint64_t v5 = v4;
        if (v18 != 0.0)
        {
          uint64_t v5 = v4;
          if (v17 != 0.0)
          {
            uint64_t v5 = objc_msgSend(MEMORY[0x1E4FB1618], "clearColor", v17);
          }
        }
      }
    }
  }
  long long v14 = 0u;
  long long v15 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  id v6 = self->_allExistingViews;
  uint64_t v7 = [(NSArray *)v6 countByEnumeratingWithState:&v12 objects:v20 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v13;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v13 != v9) {
          objc_enumerationMutation(v6);
        }
        [*(id *)(*((void *)&v12 + 1) + 8 * i) setBackgroundColor:v5];
      }
      uint64_t v8 = [(NSArray *)v6 countByEnumeratingWithState:&v12 objects:v20 count:16];
    }
    while (v8);
  }

  v11.receiver = self;
  v11.super_class = (Class)SKUIViewReuseView;
  [(SKUIViewReuseView *)&v11 setBackgroundColor:v4];
}

- (NSArray)allExistingViews
{
  return self->_allExistingViews;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_allExistingViews, 0);

  objc_storeStrong((id *)&self->_viewReusePool, 0);
}

- (void)initWithFrame:.cold.1()
{
  uint64_t v2 = *MEMORY[0x1E4F143B8];
  int v0 = 136446210;
  v1 = "-[SKUIViewReuseView initWithFrame:]";
}

@end