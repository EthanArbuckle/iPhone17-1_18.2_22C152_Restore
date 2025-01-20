@interface SUUIEditorialLinkLayout
- (CGSize)sizeForLinkAtIndex:(int64_t)a3;
- (CGSize)totalSize;
- (NSArray)links;
- (SUUIEditorialLinkLayout)initWithLayoutRequest:(id)a3;
- (void)dealloc;
- (void)enumerateLinesUsingBlock:(id)a3;
@end

@implementation SUUIEditorialLinkLayout

- (SUUIEditorialLinkLayout)initWithLayoutRequest:(id)a3
{
  id v4 = a3;
  v43.receiver = self;
  v43.super_class = (Class)SUUIEditorialLinkLayout;
  v5 = [(SUUIEditorialLinkLayout *)&v43 init];
  if (v5)
  {
    [v4 width];
    v5->_totalSize.width = v6;
    v7 = [v4 links];
    uint64_t v8 = [v7 copy];
    links = v5->_links;
    v5->_links = (NSArray *)v8;

    uint64_t v10 = [(NSArray *)v5->_links count];
    if (v10 >= 1)
    {
      uint64_t v11 = v10;
      v12 = (CGSize *)malloc_type_malloc(16 * v10, 0x1000040451B5BE8uLL);
      v5->_sizes = v12;
      if (v12)
      {
        id v13 = objc_alloc_init(MEMORY[0x263EFF9A0]);
        v14 = [MEMORY[0x263F81708] systemFontOfSize:12.0];
        [v13 setObject:v14 forKey:*MEMORY[0x263F814F0]];

        v15 = SUUIBundle();
        v16 = [MEMORY[0x263F825C8] blackColor];
        v17 = SUUILinkArrowImage((uint64_t)v15, v16);

        [v17 size];
        double v19 = v18;
        double v21 = v20;
        uint64_t v22 = 0;
        uint64_t v23 = 0;
        double v24 = 0.0;
        do
        {
          v25 = [(NSArray *)v5->_links objectAtIndex:v23];
          v26 = [v25 title];
          [v26 sizeWithAttributes:v13];
          double v28 = v27;
          double v30 = v29;

          float v31 = v30;
          double v32 = ceilf(v31);
          if (v21 >= v32) {
            double v32 = v21;
          }
          p_width = &v5->_sizes[v22].width;
          float v34 = v19 + v28 + 3.0;
          double *p_width = ceilf(v34);
          p_width[1] = v32;
          if (v24 < v32) {
            double v24 = v32;
          }

          ++v23;
          ++v22;
        }
        while (v11 != v23);
        uint64_t v39 = 0;
        v40 = &v39;
        uint64_t v41 = 0x2020000000;
        uint64_t v42 = 0;
        v38[0] = MEMORY[0x263EF8330];
        v38[1] = 3221225472;
        v38[2] = __49__SUUIEditorialLinkLayout_initWithLayoutRequest___block_invoke;
        v38[3] = &unk_265408100;
        v38[4] = &v39;
        [(SUUIEditorialLinkLayout *)v5 enumerateLinesUsingBlock:v38];
        uint64_t v35 = v40[3];
        double v36 = v24 * (double)v35;
        if (v35 >= 2) {
          double v36 = v36 + (float)((float)(v35 - 1) * 8.0);
        }
        v5->_totalSize.height = v36;
        _Block_object_dispose(&v39, 8);
      }
    }
  }

  return v5;
}

uint64_t __49__SUUIEditorialLinkLayout_initWithLayoutRequest___block_invoke(uint64_t result)
{
  return result;
}

- (void)dealloc
{
  sizes = self->_sizes;
  if (sizes) {
    free(sizes);
  }
  v4.receiver = self;
  v4.super_class = (Class)SUUIEditorialLinkLayout;
  [(SUUIEditorialLinkLayout *)&v4 dealloc];
}

- (void)enumerateLinesUsingBlock:(id)a3
{
  id v14 = a3;
  uint64_t v4 = [(NSArray *)self->_links count];
  CGFloat v6 = (void (**)(void, void, void, void, __n128))v14;
  if (v4 >= 1)
  {
    uint64_t v7 = 0;
    uint64_t v8 = 0;
    uint64_t v9 = 0;
    uint64_t v10 = 0;
    v5.n128_u64[0] = 0;
    do
    {
      double width = self->_sizes[v10].width;
      double v12 = self->_totalSize.width;
      if (width >= v12)
      {
        if (v9)
        {
          ((void (**)(id, uint64_t, uint64_t, uint64_t, __n128))v6)[2](v14, v8, v9, v7, v5);
          CGFloat v6 = (void (**)(void, void, void, void, __n128))v14;
          ++v7;
          uint64_t v8 = v10;
        }
        ((void (**)(id, uint64_t, uint64_t, uint64_t, __n128))v6)[2](v14, v8, 1, v7, v5);
        CGFloat v6 = (void (**)(void, void, void, void, __n128))v14;
        uint64_t v9 = 0;
        ++v10;
        ++v7;
        v5.n128_u64[0] = 0;
        uint64_t v8 = v10;
      }
      else
      {
        double v13 = v5.n128_f64[0] + width;
        if (v5.n128_f64[0] + width >= v12)
        {
          ((void (*)(id, uint64_t, uint64_t, uint64_t))v6[2])(v14, v8, v10 - v8, v7);
          CGFloat v6 = (void (**)(void, void, void, void, __n128))v14;
          uint64_t v9 = 0;
          double v13 = self->_sizes[v10].width;
          ++v7;
          uint64_t v8 = v10;
        }
        else
        {
          ++v9;
        }
        if (v10 == v4 - 1)
        {
          uint64_t v9 = v4 - v8;
          ((void (*)(id, uint64_t, uint64_t, uint64_t))v6[2])(v14, v8, v4 - v8, v7);
          CGFloat v6 = (void (**)(void, void, void, void, __n128))v14;
        }
        v5.n128_f64[0] = v13 + 15.0;
        ++v10;
      }
    }
    while (v10 != v4);
  }
}

- (CGSize)sizeForLinkAtIndex:(int64_t)a3
{
  if (!self->_sizes || [(NSArray *)self->_links count] <= a3) {
    objc_msgSend(MEMORY[0x263EFF940], "raise:format:", *MEMORY[0x263EFF4A0], @"Invalid index: %ld", a3);
  }
  __n128 v5 = &self->_sizes[a3];
  double width = v5->width;
  double height = v5->height;
  result.double height = height;
  result.double width = width;
  return result;
}

- (CGSize)totalSize
{
  double width = self->_totalSize.width;
  double height = self->_totalSize.height;
  result.double height = height;
  result.double width = width;
  return result;
}

- (NSArray)links
{
  return self->_links;
}

- (void).cxx_destruct
{
}

@end