@interface SUUIImageGridViewReuseView
+ (BOOL)prefetchResourcesForViewElement:(id)a3 reason:(int64_t)a4 context:(id)a5;
+ (CGSize)preferredSizeForViewElement:(id)a3 context:(id)a4;
+ (CGSize)sizeThatFitsWidth:(double)a3 viewElement:(id)a4 context:(id)a5;
+ (void)requestLayoutForViewElement:(id)a3 width:(double)a4 context:(id)a5;
- (BOOL)setImage:(id)a3 forArtworkRequest:(id)a4 context:(id)a5;
- (BOOL)updateWithItemState:(id)a3 context:(id)a4 animated:(BOOL)a5;
- (NSArray)imageViews;
- (SUUIImageGridViewReuseView)init;
- (id)viewForElementIdentifier:(id)a3;
- (void)reloadWithViewElement:(id)a3 width:(double)a4 context:(id)a5;
- (void)setImageViews:(id)a3;
@end

@implementation SUUIImageGridViewReuseView

- (SUUIImageGridViewReuseView)init
{
  v6.receiver = self;
  v6.super_class = (Class)SUUIImageGridViewReuseView;
  v2 = [(SUUIImageGridViewReuseView *)&v6 init];
  if (v2)
  {
    uint64_t v3 = [objc_alloc(MEMORY[0x263F08968]) initWithKeyOptions:0 valueOptions:0 capacity:0];
    viewElementViews = v2->_viewElementViews;
    v2->_viewElementViews = (NSMapTable *)v3;
  }
  return v2;
}

+ (BOOL)prefetchResourcesForViewElement:(id)a3 reason:(int64_t)a4 context:(id)a5
{
  id v7 = a3;
  id v8 = a5;
  uint64_t v15 = 0;
  v16 = &v15;
  uint64_t v17 = 0x2020000000;
  char v18 = 0;
  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 3221225472;
  v11[2] = __77__SUUIImageGridViewReuseView_prefetchResourcesForViewElement_reason_context___block_invoke;
  v11[3] = &unk_265400BE8;
  id v9 = v8;
  v13 = &v15;
  int64_t v14 = a4;
  id v12 = v9;
  [v7 enumerateChildrenUsingBlock:v11];
  LOBYTE(a4) = *((unsigned char *)v16 + 24);

  _Block_object_dispose(&v15, 8);
  return a4;
}

uint64_t __77__SUUIImageGridViewReuseView_prefetchResourcesForViewElement_reason_context___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t result = [*(id *)(a1 + 32) prefetchResourcesForViewElement:a2 reason:*(void *)(a1 + 48)];
  uint64_t v4 = *(void *)(*(void *)(a1 + 40) + 8);
  if (*(unsigned char *)(v4 + 24)) {
    char v5 = 1;
  }
  else {
    char v5 = result;
  }
  *(unsigned char *)(v4 + 24) = v5;
  return result;
}

+ (CGSize)preferredSizeForViewElement:(id)a3 context:(id)a4
{
  uint64_t v56 = *MEMORY[0x263EF8340];
  id v5 = a3;
  id v6 = a4;
  uint64_t v49 = 0;
  v50 = &v49;
  uint64_t v51 = 0x3032000000;
  v52 = __Block_byref_object_copy__51;
  v53 = __Block_byref_object_dispose__51;
  id v54 = objc_alloc_init(MEMORY[0x263EFF980]);
  v48[0] = MEMORY[0x263EF8330];
  v48[1] = 3221225472;
  v48[2] = __66__SUUIImageGridViewReuseView_preferredSizeForViewElement_context___block_invoke;
  v48[3] = &unk_265400D50;
  v48[4] = &v49;
  [v5 enumerateChildrenUsingBlock:v48];
  uint64_t v7 = [v5 columnCount];
  if (v7 <= 1) {
    size_t v8 = 1;
  }
  else {
    size_t v8 = v7;
  }
  unint64_t v9 = [(id)v50[5] count];
  if ([(id)v50[5] count] % v8) {
    int64_t v10 = v9 / v8 + 1;
  }
  else {
    int64_t v10 = v9 / v8;
  }
  v11 = malloc_type_calloc(v8, 8uLL, 0x100004000313F17uLL);
  id v12 = malloc_type_calloc(v10, 8uLL, 0x100004000313F17uLL);
  v43 = v5;
  bzero(v11, 8 * v8);
  if (v10 >= 1) {
    bzero(v12, 8 * v10);
  }
  uint64_t v42 = v10;
  long long v46 = 0u;
  long long v47 = 0u;
  long long v44 = 0u;
  long long v45 = 0u;
  id v13 = (id)v50[5];
  uint64_t v14 = [v13 countByEnumeratingWithState:&v44 objects:v55 count:16];
  if (v14)
  {
    uint64_t v15 = 0;
    uint64_t v16 = 0;
    uint64_t v17 = *(void *)v45;
    do
    {
      for (uint64_t i = 0; i != v14; ++i)
      {
        if (*(void *)v45 != v17) {
          objc_enumerationMutation(v13);
        }
        objc_msgSend(v6, "sizeForImageElement:", *(void *)(*((void *)&v44 + 1) + 8 * i), v42);
        if (*((double *)v11 + v15) < v19) {
          *((double *)v11 + v15) = v19;
        }
        if (*((double *)v12 + v16) < v20) {
          *((double *)v12 + v16) = v20;
        }
        BOOL v21 = v15 + 1 < (uint64_t)v8;
        if (v15 + 1 < (uint64_t)v8) {
          ++v15;
        }
        else {
          uint64_t v15 = 0;
        }
        if (!v21) {
          ++v16;
        }
      }
      uint64_t v14 = [v13 countByEnumeratingWithState:&v44 objects:v55 count:16];
    }
    while (v14);
  }

  uint64_t v22 = 0;
  double v23 = *MEMORY[0x263F001B0];
  double v24 = *(double *)(MEMORY[0x263F001B0] + 8);
  uint64_t v25 = v42;
  do
    double v23 = v23 + *((double *)v11 + v22++);
  while (v8 != v22);
  if (v42 >= 1)
  {
    v26 = (double *)v12;
    do
    {
      double v27 = *v26++;
      double v24 = v24 + v27;
      --v25;
    }
    while (v25);
  }
  free(v11);
  free(v12);
  [v43 contentInset];
  double v29 = v28;
  double v31 = v30;
  double v33 = v32;
  double v35 = v34;
  [v43 size];
  if (v35 + v23 + v31 >= v36) {
    double v38 = v35 + v23 + v31;
  }
  else {
    double v38 = v36;
  }
  if (v33 + v24 + v29 >= v37) {
    double v39 = v33 + v24 + v29;
  }
  else {
    double v39 = v37;
  }
  _Block_object_dispose(&v49, 8);

  double v40 = v38;
  double v41 = v39;
  result.height = v41;
  result.width = v40;
  return result;
}

void __66__SUUIImageGridViewReuseView_preferredSizeForViewElement_context___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if ([v3 elementType] == 49) {
    [*(id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40) addObject:v3];
  }
}

+ (void)requestLayoutForViewElement:(id)a3 width:(double)a4 context:(id)a5
{
  id v7 = a5;
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __72__SUUIImageGridViewReuseView_requestLayoutForViewElement_width_context___block_invoke;
  v9[3] = &unk_265405690;
  double v11 = a4;
  id v10 = v7;
  id v8 = v7;
  [a3 enumerateChildrenUsingBlock:v9];
}

void __72__SUUIImageGridViewReuseView_requestLayoutForViewElement_width_context___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if ([v3 elementType] == 49) {
    +[SUUIAdornedImageView requestLayoutForViewElement:v3 width:*(void *)(a1 + 32) context:*(double *)(a1 + 40)];
  }
}

+ (CGSize)sizeThatFitsWidth:(double)a3 viewElement:(id)a4 context:(id)a5
{
  +[SUUIImageGridViewReuseView preferredSizeForViewElement:context:](SUUIImageGridViewReuseView, "preferredSizeForViewElement:context:", a4, a5, a3);
  result.height = v6;
  result.width = v5;
  return result;
}

- (void)reloadWithViewElement:(id)a3 width:(double)a4 context:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  objc_storeStrong((id *)&self->_imageGridViewElement, a3);
  [(NSMapTable *)self->_viewElementViews removeAllObjects];
  [(NSMapTable *)self->_imageViewToImageResourceCacheKey removeAllObjects];
  id v10 = objc_alloc_init(MEMORY[0x263EFF980]);
  uint64_t v14 = MEMORY[0x263EF8330];
  uint64_t v15 = 3221225472;
  uint64_t v16 = __66__SUUIImageGridViewReuseView_reloadWithViewElement_width_context___block_invoke;
  uint64_t v17 = &unk_265405FA8;
  id v18 = v8;
  id v19 = v9;
  double v20 = self;
  id v21 = v10;
  id v11 = v10;
  id v12 = v9;
  id v13 = v8;
  [(SUUIViewReuseView *)self modifyUsingBlock:&v14];
  -[SUUIImageGridViewReuseView setImageViews:](self, "setImageViews:", v11, v14, v15, v16, v17);
}

void __66__SUUIImageGridViewReuseView_reloadWithViewElement_width_context___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __66__SUUIImageGridViewReuseView_reloadWithViewElement_width_context___block_invoke_2;
  v9[3] = &unk_2654058F8;
  id v10 = v3;
  uint64_t v4 = *(void **)(a1 + 32);
  id v5 = *(id *)(a1 + 40);
  uint64_t v6 = *(void *)(a1 + 48);
  id v7 = *(void **)(a1 + 56);
  id v11 = v5;
  uint64_t v12 = v6;
  id v13 = v7;
  id v8 = v3;
  [v4 enumerateChildrenUsingBlock:v9];
}

uint64_t __66__SUUIImageGridViewReuseView_reloadWithViewElement_width_context___block_invoke_2(uint64_t a1, void *a2)
{
  id v11 = a2;
  uint64_t isKindOfClass = [v11 elementType];
  if (isKindOfClass == 49)
  {
    id v4 = [*(id *)(a1 + 32) addImageViewWithElement:v11 context:*(void *)(a1 + 40)];
    objc_opt_class();
    uint64_t isKindOfClass = objc_opt_isKindOfClass();
    if ((isKindOfClass & 1) == 0) {
      uint64_t isKindOfClass = [v4 setUserInteractionEnabled:0];
    }
    if (v4)
    {
      [*(id *)(*(void *)(a1 + 48) + 432) setObject:v11 forKey:v4];
      [*(id *)(*(void *)(a1 + 48) + 432) setObject:v4 forKey:v11];
      [*(id *)(a1 + 56) addObject:v4];
      id v5 = [*(id *)(a1 + 40) imageResourceCacheKeyForViewElement:v11];
      if (v5)
      {
        uint64_t v6 = *(void **)(*(void *)(a1 + 48) + 424);
        if (!v6)
        {
          uint64_t v7 = [objc_alloc(MEMORY[0x263F08968]) initWithKeyOptions:517 valueOptions:0 capacity:1];
          uint64_t v8 = *(void *)(a1 + 48);
          id v9 = *(void **)(v8 + 424);
          *(void *)(v8 + 424) = v7;

          uint64_t v6 = *(void **)(*(void *)(a1 + 48) + 424);
        }
        [v6 setObject:v5 forKey:v4];
      }
    }
  }
  return MEMORY[0x270F9A790](isKindOfClass);
}

- (BOOL)setImage:(id)a3 forArtworkRequest:(id)a4 context:(id)a5
{
  uint64_t v29 = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = a5;
  uint64_t v10 = [a4 requestIdentifier];
  long long v24 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  obj = self->_imageViewToImageResourceCacheKey;
  uint64_t v11 = [(NSMapTable *)obj countByEnumeratingWithState:&v24 objects:v28 count:16];
  if (v11)
  {
    uint64_t v12 = v11;
    id v22 = v8;
    uint64_t v13 = *(void *)v25;
    while (2)
    {
      for (uint64_t i = 0; i != v12; ++i)
      {
        if (*(void *)v25 != v13) {
          objc_enumerationMutation(obj);
        }
        uint64_t v15 = *(void **)(*((void *)&v24 + 1) + 8 * i);
        uint64_t v16 = -[NSMapTable objectForKey:](self->_imageViewToImageResourceCacheKey, "objectForKey:", v15, v22);
        uint64_t v17 = [v9 requestIdentifierForResourceCacheKey:v16];
        id v18 = v17;
        if (v17 && [v17 unsignedIntegerValue] == v10)
        {
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            double v20 = [v15 imageView];
            id v8 = v22;
            [v20 setImage:v22];
          }
          else
          {
            objc_opt_class();
            id v8 = v22;
            if (objc_opt_isKindOfClass()) {
              [v15 setImage:v22 cacheKey:v16 context:v9];
            }
            else {
              [v15 setImage:v22];
            }
          }

          BOOL v19 = 1;
          goto LABEL_18;
        }
      }
      uint64_t v12 = [(NSMapTable *)obj countByEnumeratingWithState:&v24 objects:v28 count:16];
      if (v12) {
        continue;
      }
      break;
    }
    BOOL v19 = 0;
    id v8 = v22;
  }
  else
  {
    BOOL v19 = 0;
  }
LABEL_18:

  return v19;
}

- (BOOL)updateWithItemState:(id)a3 context:(id)a4 animated:(BOOL)a5
{
  return 0;
}

- (id)viewForElementIdentifier:(id)a3
{
  id v4 = a3;
  uint64_t v15 = 0;
  uint64_t v16 = &v15;
  uint64_t v17 = 0x3032000000;
  id v18 = __Block_byref_object_copy__51;
  BOOL v19 = __Block_byref_object_dispose__51;
  id v20 = 0;
  id v5 = [(SUUIViewReuseView *)self allExistingViews];
  uint64_t v6 = [(SUUIViewElement *)self->_imageGridViewElement flattenedChildren];
  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 3221225472;
  v11[2] = __55__SUUIImageGridViewReuseView_viewForElementIdentifier___block_invoke;
  v11[3] = &unk_265401BB8;
  id v7 = v4;
  id v12 = v7;
  id v8 = v5;
  id v13 = v8;
  uint64_t v14 = &v15;
  [v6 enumerateObjectsUsingBlock:v11];

  id v9 = (id)v16[5];
  _Block_object_dispose(&v15, 8);

  return v9;
}

void __55__SUUIImageGridViewReuseView_viewForElementIdentifier___block_invoke(uint64_t a1, void *a2, unint64_t a3, unsigned char *a4)
{
  id v7 = [a2 itmlID];
  int v8 = [v7 isEqualToString:*(void *)(a1 + 32)];

  if (v8)
  {
    if ([*(id *)(a1 + 40) count] > a3)
    {
      uint64_t v9 = [*(id *)(a1 + 40) objectAtIndex:a3];
      uint64_t v10 = *(void *)(*(void *)(a1 + 48) + 8);
      uint64_t v11 = *(void **)(v10 + 40);
      *(void *)(v10 + 40) = v9;
    }
    *a4 = 1;
  }
}

- (NSArray)imageViews
{
  return self->_imageViews;
}

- (void)setImageViews:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_imageViews, 0);
  objc_storeStrong((id *)&self->_imageGridViewElement, 0);
  objc_storeStrong((id *)&self->_viewElementViews, 0);
  objc_storeStrong((id *)&self->_imageViewToImageResourceCacheKey, 0);
}

@end