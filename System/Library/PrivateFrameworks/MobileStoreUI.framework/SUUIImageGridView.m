@interface SUUIImageGridView
+ (BOOL)prefetchResourcesForViewElement:(id)a3 reason:(int64_t)a4 context:(id)a5;
+ (CGSize)preferredSizeForViewElement:(id)a3 context:(id)a4;
+ (CGSize)sizeThatFitsWidth:(double)a3 viewElement:(id)a4 context:(id)a5;
+ (void)requestLayoutForViewElement:(id)a3 width:(double)a4 context:(id)a5;
- (BOOL)setImage:(id)a3 forArtworkRequest:(id)a4 context:(id)a5;
- (BOOL)updateWithItemState:(id)a3 context:(id)a4 animated:(BOOL)a5;
- (CGSize)size;
- (CGSize)sizeThatFits:(CGSize)a3;
- (NSArray)imageViews;
- (UIEdgeInsets)contentInset;
- (id)viewForElementIdentifier:(id)a3;
- (int64_t)columnCount;
- (void)layoutSubviews;
- (void)reloadWithViewElement:(id)a3 width:(double)a4 context:(id)a5;
- (void)setColumnCount:(int64_t)a3;
- (void)setContentInset:(UIEdgeInsets)a3;
- (void)setImageViews:(id)a3;
- (void)setSize:(CGSize)a3;
@end

@implementation SUUIImageGridView

- (void)setColumnCount:(int64_t)a3
{
  if (self->_columnCount != a3)
  {
    self->_columnCount = a3;
    [(SUUIImageGridView *)self setNeedsLayout];
  }
}

- (void)setContentInset:(UIEdgeInsets)a3
{
  if (self->_contentInset.left != a3.left
    || self->_contentInset.top != a3.top
    || self->_contentInset.right != a3.right
    || self->_contentInset.bottom != a3.bottom)
  {
    self->_contentInset = a3;
    [(SUUIImageGridView *)self setNeedsLayout];
  }
}

- (void)setImageViews:(id)a3
{
  uint64_t v26 = *MEMORY[0x263EF8340];
  id v5 = a3;
  if (![(NSArray *)self->_imageViews isEqualToArray:v5])
  {
    long long v22 = 0u;
    long long v23 = 0u;
    long long v20 = 0u;
    long long v21 = 0u;
    v6 = self->_imageViews;
    uint64_t v7 = [(NSArray *)v6 countByEnumeratingWithState:&v20 objects:v25 count:16];
    if (v7)
    {
      uint64_t v8 = v7;
      uint64_t v9 = *(void *)v21;
      do
      {
        for (uint64_t i = 0; i != v8; ++i)
        {
          if (*(void *)v21 != v9) {
            objc_enumerationMutation(v6);
          }
          [*(id *)(*((void *)&v20 + 1) + 8 * i) removeFromSuperview];
        }
        uint64_t v8 = [(NSArray *)v6 countByEnumeratingWithState:&v20 objects:v25 count:16];
      }
      while (v8);
    }

    long long v18 = 0u;
    long long v19 = 0u;
    long long v16 = 0u;
    long long v17 = 0u;
    id v11 = v5;
    uint64_t v12 = [v11 countByEnumeratingWithState:&v16 objects:v24 count:16];
    if (v12)
    {
      uint64_t v13 = v12;
      uint64_t v14 = *(void *)v17;
      do
      {
        for (uint64_t j = 0; j != v13; ++j)
        {
          if (*(void *)v17 != v14) {
            objc_enumerationMutation(v11);
          }
          -[SUUIImageGridView addSubview:](self, "addSubview:", *(void *)(*((void *)&v16 + 1) + 8 * j), (void)v16);
        }
        uint64_t v13 = [v11 countByEnumeratingWithState:&v16 objects:v24 count:16];
      }
      while (v13);
    }

    objc_storeStrong((id *)&self->_imageViews, a3);
    [(SUUIImageGridView *)self setNeedsLayout];
  }
}

- (void)setSize:(CGSize)a3
{
  if (self->_size.width != a3.width || self->_size.height != a3.height)
  {
    self->_size = a3;
    [(SUUIImageGridView *)self setNeedsLayout];
  }
}

+ (BOOL)prefetchResourcesForViewElement:(id)a3 reason:(int64_t)a4 context:(id)a5
{
  return +[SUUIImageGridViewReuseView prefetchResourcesForViewElement:a3 reason:a4 context:a5];
}

+ (CGSize)preferredSizeForViewElement:(id)a3 context:(id)a4
{
  +[SUUIImageGridViewReuseView preferredSizeForViewElement:a3 context:a4];
  result.height = v5;
  result.width = v4;
  return result;
}

+ (void)requestLayoutForViewElement:(id)a3 width:(double)a4 context:(id)a5
{
}

+ (CGSize)sizeThatFitsWidth:(double)a3 viewElement:(id)a4 context:(id)a5
{
  +[SUUIImageGridViewReuseView sizeThatFitsWidth:a4 viewElement:a5 context:a3];
  result.height = v6;
  result.width = v5;
  return result;
}

- (void)reloadWithViewElement:(id)a3 width:(double)a4 context:(id)a5
{
  id v13 = a3;
  id v8 = a5;
  reuseView = self->_reuseView;
  if (!reuseView)
  {
    v10 = objc_alloc_init(SUUIImageGridViewReuseView);
    id v11 = self->_reuseView;
    self->_reuseView = v10;

    reuseView = self->_reuseView;
  }
  [(SUUIImageGridViewReuseView *)reuseView reloadWithViewElement:v13 width:v8 context:a4];
  -[SUUIImageGridView setColumnCount:](self, "setColumnCount:", [v13 columnCount]);
  [v13 contentInset];
  -[SUUIImageGridView setContentInset:](self, "setContentInset:");
  uint64_t v12 = [(SUUIImageGridViewReuseView *)self->_reuseView imageViews];
  [(SUUIImageGridView *)self setImageViews:v12];

  [v13 size];
  -[SUUIImageGridView setSize:](self, "setSize:");
}

- (BOOL)setImage:(id)a3 forArtworkRequest:(id)a4 context:(id)a5
{
  return [(SUUIImageGridViewReuseView *)self->_reuseView setImage:a3 forArtworkRequest:a4 context:a5];
}

- (BOOL)updateWithItemState:(id)a3 context:(id)a4 animated:(BOOL)a5
{
  return [(SUUIImageGridViewReuseView *)self->_reuseView updateWithItemState:a3 context:a4 animated:a5];
}

- (id)viewForElementIdentifier:(id)a3
{
  return [(SUUIImageGridViewReuseView *)self->_reuseView viewForElementIdentifier:a3];
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  uint64_t v36 = *MEMORY[0x263EF8340];
  uint64_t v4 = [(SUUIImageGridView *)self columnCount];
  if (v4 <= 1) {
    size_t v5 = 1;
  }
  else {
    size_t v5 = v4;
  }
  double v6 = [(SUUIImageGridView *)self imageViews];
  unint64_t v7 = [v6 count] / v5;

  id v8 = [(SUUIImageGridView *)self imageViews];
  unint64_t v9 = [v8 count] % v5;

  if (v9) {
    int64_t v10 = v7 + 1;
  }
  else {
    int64_t v10 = v7;
  }
  id v11 = malloc_type_calloc(v5, 8uLL, 0x100004000313F17uLL);
  uint64_t v12 = malloc_type_calloc(v10, 8uLL, 0x100004000313F17uLL);
  bzero(v11, 8 * v5);
  if (v10 >= 1) {
    bzero(v12, 8 * v10);
  }
  long long v33 = 0u;
  long long v34 = 0u;
  long long v31 = 0u;
  long long v32 = 0u;
  v30 = self;
  id v13 = [(SUUIImageGridView *)self imageViews];
  uint64_t v14 = [v13 countByEnumeratingWithState:&v31 objects:v35 count:16];
  double width = *MEMORY[0x263F001B0];
  double height = *(double *)(MEMORY[0x263F001B0] + 8);
  if (v14)
  {
    uint64_t v17 = v14;
    uint64_t v18 = 0;
    uint64_t v19 = 0;
    uint64_t v20 = *(void *)v32;
    do
    {
      for (uint64_t i = 0; i != v17; ++i)
      {
        if (*(void *)v32 != v20) {
          objc_enumerationMutation(v13);
        }
        objc_msgSend(*(id *)(*((void *)&v31 + 1) + 8 * i), "sizeThatFits:", width, height);
        if (*((double *)v11 + v18) < v22) {
          *((double *)v11 + v18) = v22;
        }
        if (*((double *)v12 + v19) < v23) {
          *((double *)v12 + v19) = v23;
        }
        BOOL v24 = v18 + 1 < (uint64_t)v5;
        if (v18 + 1 < (uint64_t)v5) {
          ++v18;
        }
        else {
          uint64_t v18 = 0;
        }
        if (!v24) {
          ++v19;
        }
      }
      uint64_t v17 = [v13 countByEnumeratingWithState:&v31 objects:v35 count:16];
    }
    while (v17);
  }

  for (uint64_t j = 0; j != v5; ++j)
    double width = width + *((double *)v11 + j);
  if (v10 >= 1)
  {
    uint64_t v26 = (double *)v12;
    do
    {
      double v27 = *v26++;
      double height = height + v27;
      --v10;
    }
    while (v10);
  }
  if (width < v30->_size.width) {
    double width = v30->_size.width;
  }
  if (height < v30->_size.height) {
    double height = v30->_size.height;
  }
  free(v11);
  free(v12);
  double v28 = width;
  double v29 = height;
  result.double height = v29;
  result.double width = v28;
  return result;
}

- (void)layoutSubviews
{
  uint64_t v72 = *MEMORY[0x263EF8340];
  v69.receiver = self;
  v69.super_class = (Class)SUUIImageGridView;
  [(SUUIImageGridView *)&v69 layoutSubviews];
  uint64_t v3 = [(SUUIImageGridView *)self columnCount];
  if (v3 <= 1) {
    size_t v4 = 1;
  }
  else {
    size_t v4 = v3;
  }
  size_t v5 = [(SUUIImageGridView *)self imageViews];
  unint64_t v6 = [v5 count] / v4;

  v60 = self;
  unint64_t v7 = [(SUUIImageGridView *)self imageViews];
  unint64_t v8 = [v7 count] % v4;

  if (v8) {
    int64_t v9 = v6 + 1;
  }
  else {
    int64_t v9 = v6;
  }
  int64_t v10 = malloc_type_calloc(v4, 8uLL, 0x100004000313F17uLL);
  id v11 = malloc_type_calloc(v9, 8uLL, 0x100004000313F17uLL);
  bzero(v10, 8 * v4);
  if (v9 >= 1) {
    bzero(v11, 8 * v9);
  }
  long long v67 = 0u;
  long long v68 = 0u;
  long long v65 = 0u;
  long long v66 = 0u;
  uint64_t v12 = [(SUUIImageGridView *)v60 imageViews];
  uint64_t v13 = [v12 countByEnumeratingWithState:&v65 objects:v71 count:16];
  if (v13)
  {
    uint64_t v14 = v13;
    uint64_t v15 = 0;
    uint64_t v16 = 0;
    uint64_t v17 = *(void *)v66;
    double v18 = *MEMORY[0x263F001B0];
    double v19 = *(double *)(MEMORY[0x263F001B0] + 8);
    do
    {
      for (uint64_t i = 0; i != v14; ++i)
      {
        if (*(void *)v66 != v17) {
          objc_enumerationMutation(v12);
        }
        objc_msgSend(*(id *)(*((void *)&v65 + 1) + 8 * i), "sizeThatFits:", v18, v19);
        if (*((double *)v10 + v16) < v21) {
          *((double *)v10 + v16) = v21;
        }
        if (*((double *)v11 + v15) < v22) {
          *((double *)v11 + v15) = v22;
        }
        if (v16 + 1 < (uint64_t)v4)
        {
          ++v16;
        }
        else
        {
          ++v15;
          uint64_t v16 = 0;
        }
      }
      uint64_t v14 = [v12 countByEnumeratingWithState:&v65 objects:v71 count:16];
    }
    while (v14);
  }

  [(SUUIImageGridView *)v60 bounds];
  double v24 = v23;
  [(SUUIImageGridView *)v60 bounds];
  double v26 = v25;
  for (uint64_t j = 0; j != v4; ++j)
    double v24 = v24 - *((double *)v10 + j);
  uint64_t v28 = v9 - 1;
  if (v9 >= 1)
  {
    double v29 = (double *)v11;
    do
    {
      double v30 = *v29++;
      double v26 = v26 - v30;
      --v9;
    }
    while (v9);
  }
  [(SUUIImageGridView *)v60 contentInset];
  double v32 = v26 - v31;
  [(SUUIImageGridView *)v60 contentInset];
  double v34 = v32 - v33;
  [(SUUIImageGridView *)v60 contentInset];
  double v36 = v24 - v35;
  [(SUUIImageGridView *)v60 contentInset];
  double v38 = v36 - v37;
  float v39 = v34 / (double)v28;
  double v40 = floorf(v39);
  float v41 = v38 / (double)(uint64_t)(v4 - 1);
  double v42 = floorf(v41);
  if (v40 >= 0.0) {
    double v43 = v40;
  }
  else {
    double v43 = 0.0;
  }
  if (v42 >= 0.0) {
    double v44 = v42;
  }
  else {
    double v44 = 0.0;
  }
  [(SUUIImageGridView *)v60 contentInset];
  double v46 = v45;
  [(SUUIImageGridView *)v60 contentInset];
  double v48 = v47;
  long long v61 = 0u;
  long long v62 = 0u;
  long long v63 = 0u;
  long long v64 = 0u;
  v49 = [(SUUIImageGridView *)v60 imageViews];
  uint64_t v50 = [v49 countByEnumeratingWithState:&v61 objects:v70 count:16];
  if (v50)
  {
    uint64_t v51 = v50;
    uint64_t v52 = 0;
    uint64_t v53 = 0;
    uint64_t v54 = *(void *)v62;
    do
    {
      for (uint64_t k = 0; k != v51; ++k)
      {
        if (*(void *)v62 != v54) {
          objc_enumerationMutation(v49);
        }
        v56 = *(void **)(*((void *)&v61 + 1) + 8 * k);
        [v56 frame];
        objc_msgSend(v56, "sizeThatFits:", v38, 1.79769313e308);
        objc_msgSend(v56, "setFrame:", v46, v48, v57, v58);
        if (v53 + 1 >= (uint64_t)v4)
        {
          [(SUUIImageGridView *)v60 contentInset];
          double v46 = v59;
          uint64_t v53 = 0;
          double v48 = v43 + v48 + *((double *)v11 + v52++);
        }
        else
        {
          double v46 = v44 + v46 + *((double *)v10 + v53++);
        }
      }
      uint64_t v51 = [v49 countByEnumeratingWithState:&v61 objects:v70 count:16];
    }
    while (v51);
  }

  free(v10);
  free(v11);
}

- (int64_t)columnCount
{
  return self->_columnCount;
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

- (NSArray)imageViews
{
  return self->_imageViews;
}

- (CGSize)size
{
  double width = self->_size.width;
  double height = self->_size.height;
  result.double height = height;
  result.double width = width;
  return result;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_reuseView, 0);
  objc_storeStrong((id *)&self->_imageViews, 0);
}

@end