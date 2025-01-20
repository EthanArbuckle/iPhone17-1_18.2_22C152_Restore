@interface NWKUIAQISegmentedView
- (CGSize)intrinsicContentSize;
- (NWKUIAQISegmentedModel)model;
- (NWKUIAQISegmentedView)initWithModel:(id)a3 constraints:(id)a4;
- (void)_addSubviewsFromModel:(id)a3;
- (void)layoutSubviews;
- (void)updateModel:(id)a3;
@end

@implementation NWKUIAQISegmentedView

- (NWKUIAQISegmentedView)initWithModel:(id)a3 constraints:(id)a4
{
  id v7 = a3;
  v11.receiver = self;
  v11.super_class = (Class)NWKUIAQISegmentedView;
  v8 = -[NWKUIAQISegmentedView initWithFrame:](&v11, sel_initWithFrame_, *MEMORY[0x263F001A8], *(double *)(MEMORY[0x263F001A8] + 8), *(double *)(MEMORY[0x263F001A8] + 16), *(double *)(MEMORY[0x263F001A8] + 24));
  v9 = v8;
  if (v8)
  {
    v8->_constraints.width = a4.var0;
    objc_storeStrong((id *)&v8->_model, a3);
    [(NWKUIAQISegmentedView *)v9 _addSubviewsFromModel:v7];
  }

  return v9;
}

- (CGSize)intrinsicContentSize
{
  double width = self->_constraints.width;
  double v3 = *MEMORY[0x263F83C20];
  result.height = v3;
  result.double width = width;
  return result;
}

- (void)layoutSubviews
{
  double width = self->_constraints.width;
  [(NWKUIAQISegmentedView *)self bounds];
  CGFloat Height = CGRectGetHeight(v8);
  if (Height != self->_lastLayoutHeight)
  {
    self->_lastLayoutCGFloat Height = Height;
    unint64_t v5 = [(NSArray *)self->_segmentViews count];
    v7[1] = 3221225472;
    v7[0] = MEMORY[0x263EF8330];
    v7[2] = __39__NWKUIAQISegmentedView_layoutSubviews__block_invoke;
    v7[3] = &__block_descriptor_56_e36_v32__0__NWKUIAQISegmentView_8Q16_B24l;
    *(CGFloat *)&v7[4] = Height;
    *(double *)&v7[5] = (Height + (double)(v5 - 1) * -1.5) / (double)v5;
    *(double *)&v7[6] = width;
    v6 = (void *)MEMORY[0x230FA6310](v7);
    [(NSArray *)self->_segmentViews enumerateObjectsUsingBlock:v6];
  }
}

uint64_t __39__NWKUIAQISegmentedView_layoutSubviews__block_invoke(double *a1, void *a2, unint64_t a3)
{
  return objc_msgSend(a2, "setFrame:", 0.0, a1[4] - (a1[5] + 1.5) * (double)a3 - a1[5], a1[6]);
}

- (void)updateModel:(id)a3
{
  unint64_t v5 = (NWKUIAQISegmentedModel *)a3;
  if (self->_model != v5)
  {
    objc_storeStrong((id *)&self->_model, a3);
    [(NWKUIAQISegmentedView *)self _addSubviewsFromModel:v5];
    self->_lastLayoutCGFloat Height = 0.0;
    [(NWKUIAQISegmentedView *)self setNeedsLayout];
  }
}

- (void)_addSubviewsFromModel:(id)a3
{
  id v4 = a3;
  unint64_t v5 = [(NWKUIAQISegmentedView *)self subviews];
  [v5 makeObjectsPerformSelector:sel_removeFromSuperview];

  v6 = [v4 segments];

  uint64_t v7 = [v6 count];
  uint64_t v8 = v7 - 1;
  v9 = [MEMORY[0x263EFF980] arrayWithCapacity:v7];
  v14[0] = MEMORY[0x263EF8330];
  v14[1] = 3221225472;
  v14[2] = __47__NWKUIAQISegmentedView__addSubviewsFromModel___block_invoke;
  v14[3] = &unk_2649DE0B8;
  id v15 = v9;
  uint64_t v16 = v8;
  v14[4] = self;
  id v10 = v9;
  objc_super v11 = (void *)MEMORY[0x230FA6310](v14);
  [v6 enumerateObjectsUsingBlock:v11];
  v12 = (NSArray *)[v10 copy];
  segmentViews = self->_segmentViews;
  self->_segmentViews = v12;
}

void __47__NWKUIAQISegmentedView__addSubviewsFromModel___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  if (a3) {
    uint64_t v4 = *(void *)(a1 + 48) != a3;
  }
  else {
    uint64_t v4 = 2;
  }
  id v5 = a2;
  v6 = [NWKUIAQISegmentView alloc];
  uint64_t v7 = [v5 color];
  uint64_t v8 = [v5 isActive];

  v9 = [(NWKUIAQISegmentView *)v6 initWithColor:v7 active:v8 mode:v4];
  [*(id *)(a1 + 32) addSubview:v9];
  [*(id *)(a1 + 40) addObject:v9];
}

- (NWKUIAQISegmentedModel)model
{
  return (NWKUIAQISegmentedModel *)objc_getProperty(self, a2, 432, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_model, 0);
  objc_storeStrong((id *)&self->_segmentViews, 0);
}

@end