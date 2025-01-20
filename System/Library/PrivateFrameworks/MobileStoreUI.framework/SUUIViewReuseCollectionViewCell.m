@interface SUUIViewReuseCollectionViewCell
- (NSArray)allExistingViews;
- (SUUIViewReuseCollectionViewCell)initWithFrame:(CGRect)a3;
- (UIEdgeInsets)contentInset;
- (id)existingViewForIndex:(int64_t)a3;
- (id)existingViewsForReuseIdentifier:(id)a3;
- (id)textPropertiesForView:(id)a3;
- (void)applyLayoutAttributes:(id)a3;
- (void)dealloc;
- (void)enumerateExistingViewsForReuseIdentifier:(id)a3 usingBlock:(id)a4;
- (void)modifyUsingBlock:(id)a3;
- (void)registerClass:(Class)a3 forViewWithReuseIdentifier:(id)a4;
- (void)setBackgroundColor:(id)a3;
- (void)setContentInset:(UIEdgeInsets)a3;
@end

@implementation SUUIViewReuseCollectionViewCell

- (SUUIViewReuseCollectionViewCell)initWithFrame:(CGRect)a3
{
  v7.receiver = self;
  v7.super_class = (Class)SUUIViewReuseCollectionViewCell;
  v3 = -[SUUICollectionViewCell initWithFrame:](&v7, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    v4 = [[SUUIViewReusePool alloc] initWithParentView:v3];
    viewPool = v3->_viewPool;
    v3->_viewPool = v4;
  }
  return v3;
}

- (void)dealloc
{
  uint64_t v15 = *MEMORY[0x263EF8340];
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
  v9.super_class = (Class)SUUIViewReuseCollectionViewCell;
  [(SUUIViewReuseCollectionViewCell *)&v9 dealloc];
}

- (void)enumerateExistingViewsForReuseIdentifier:(id)a3 usingBlock:(id)a4
{
  uint64_t v22 = *MEMORY[0x263EF8340];
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
        uint64_t v15 = SUUIReuseIdentifierForView(v14);
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

- (id)existingViewForIndex:(int64_t)a3
{
  if ([(NSArray *)self->_allExistingViews count] <= a3)
  {
    uint64_t v5 = 0;
  }
  else
  {
    uint64_t v5 = [(NSArray *)self->_allExistingViews objectAtIndex:a3];
  }
  return v5;
}

- (id)existingViewsForReuseIdentifier:(id)a3
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  id v4 = a3;
  uint64_t v5 = [MEMORY[0x263EFF980] array];
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  id v6 = self->_allExistingViews;
  uint64_t v7 = [(NSArray *)v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v15;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v15 != v9) {
          objc_enumerationMutation(v6);
        }
        uint64_t v11 = *(void **)(*((void *)&v14 + 1) + 8 * i);
        uint64_t v12 = SUUIReuseIdentifierForView(v11);
        if (v12 && objc_msgSend(v4, "isEqualToString:", v12, (void)v14)) {
          [v5 addObject:v11];
        }
      }
      uint64_t v8 = [(NSArray *)v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v8);
  }

  return v5;
}

- (void)modifyUsingBlock:(id)a3
{
  uint64_t v24 = *MEMORY[0x263EF8340];
  id v4 = (void (**)(id, SUUIViewModification *))a3;
  if (self->_allExistingViews)
  {
    -[SUUIViewReusePool recycleReusableViews:](self->_viewPool, "recycleReusableViews:");
    allExistingViews = self->_allExistingViews;
    self->_allExistingViews = 0;
  }
  id v6 = [[SUUIViewModification alloc] initWithViewReusePool:self->_viewPool];
  v4[2](v4, v6);
  uint64_t v7 = [(SUUIViewReuseCollectionViewCell *)self backgroundColor];
  uint64_t v8 = [(SUUIViewReuseCollectionViewCell *)self contentView];
  uint64_t v9 = [(SUUIViewModification *)v6 allViewTextProperties];
  allViewTextProperties = self->_allViewTextProperties;
  self->_allViewTextProperties = v9;

  uint64_t v11 = [(SUUIViewModification *)v6 views];
  uint64_t v12 = self->_allExistingViews;
  self->_allExistingViews = v11;

  long long v21 = 0u;
  long long v22 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  long long v13 = self->_allExistingViews;
  uint64_t v14 = [(NSArray *)v13 countByEnumeratingWithState:&v19 objects:v23 count:16];
  if (v14)
  {
    uint64_t v15 = v14;
    uint64_t v16 = *(void *)v20;
    do
    {
      for (uint64_t i = 0; i != v15; ++i)
      {
        if (*(void *)v20 != v16) {
          objc_enumerationMutation(v13);
        }
        long long v18 = *(void **)(*((void *)&v19 + 1) + 8 * i);
        [v18 setBackgroundColor:v7];
        [v8 addSubview:v18];
      }
      uint64_t v15 = [(NSArray *)v13 countByEnumeratingWithState:&v19 objects:v23 count:16];
    }
    while (v15);
  }

  [(SUUIViewReusePool *)self->_viewPool hideUnusedViews];
  [(SUUIViewReuseCollectionViewCell *)self setNeedsLayout];
}

- (void)registerClass:(Class)a3 forViewWithReuseIdentifier:(id)a4
{
}

- (void)setContentInset:(UIEdgeInsets)a3
{
  if (self->_contentInset.left != a3.left
    || self->_contentInset.top != a3.top
    || self->_contentInset.right != a3.right
    || self->_contentInset.bottom != a3.bottom)
  {
    self->_contentInset = a3;
    [(SUUIViewReuseCollectionViewCell *)self setNeedsLayout];
  }
}

- (id)textPropertiesForView:(id)a3
{
  return [(NSMapTable *)self->_allViewTextProperties objectForKey:a3];
}

- (void)applyLayoutAttributes:(id)a3
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  id v4 = a3;
  uint64_t v5 = [v4 backgroundColor];
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  id v6 = self->_allExistingViews;
  uint64_t v7 = [(NSArray *)v6 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v13;
    do
    {
      uint64_t v10 = 0;
      do
      {
        if (*(void *)v13 != v9) {
          objc_enumerationMutation(v6);
        }
        [*(id *)(*((void *)&v12 + 1) + 8 * v10++) setBackgroundColor:v5];
      }
      while (v8 != v10);
      uint64_t v8 = [(NSArray *)v6 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v8);
  }

  v11.receiver = self;
  v11.super_class = (Class)SUUIViewReuseCollectionViewCell;
  [(SUUICollectionViewCell *)&v11 applyLayoutAttributes:v4];
}

- (void)setBackgroundColor:(id)a3
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  id v4 = a3;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  uint64_t v5 = self->_allExistingViews;
  uint64_t v6 = [(NSArray *)v5 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v12;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v12 != v8) {
          objc_enumerationMutation(v5);
        }
        [*(id *)(*((void *)&v11 + 1) + 8 * v9++) setBackgroundColor:v4];
      }
      while (v7 != v9);
      uint64_t v7 = [(NSArray *)v5 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v7);
  }

  v10.receiver = self;
  v10.super_class = (Class)SUUIViewReuseCollectionViewCell;
  [(SUUICollectionViewCell *)&v10 setBackgroundColor:v4];
}

- (UIEdgeInsets)contentInset
{
  double top = self->_contentInset.top;
  double left = self->_contentInset.left;
  double bottom = self->_contentInset.bottom;
  double right = self->_contentInset.right;
  result.double right = right;
  result.double bottom = bottom;
  result.double left = left;
  result.double top = top;
  return result;
}

- (NSArray)allExistingViews
{
  return self->_allExistingViews;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_allExistingViews, 0);
  objc_storeStrong((id *)&self->_viewPool, 0);
  objc_storeStrong((id *)&self->_allViewTextProperties, 0);
}

@end