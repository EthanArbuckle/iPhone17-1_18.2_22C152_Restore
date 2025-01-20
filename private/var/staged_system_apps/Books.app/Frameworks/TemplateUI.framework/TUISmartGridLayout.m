@interface TUISmartGridLayout
- (BOOL)shouldUpdateContainingMetricsForScrollableContent;
- (TUISmartGridLayoutManager)layoutManager;
- (double)columnLayoutProviderWidthForColumnSpan:(unint64_t)a3;
- (unint64_t)columnLayoutProviderColumnSpanForColumnSpan:(id)a3;
- (unint64_t)columnLayoutProviderColumnsForContainerFraction:(double)a3;
- (unint64_t)ruleLayoutAxis;
- (void)appendChildRenderModelCompatibleWithKind:(unint64_t)a3 context:(id)a4 transform:(CGAffineTransform *)a5 toModels:(id)a6;
- (void)computeLayout;
- (void)setLayoutManager:(id)a3;
@end

@implementation TUISmartGridLayout

- (void)computeLayout
{
  if (!self->_layoutManager)
  {
    v3 = [(TUILayout *)self box];
    id v4 = [v3 layoutMode];

    switch((unint64_t)v4)
    {
      case 0uLL:
        v5 = TUISmartGridSwooshLayoutManager;
        goto LABEL_8;
      case 1uLL:
        v5 = TUISmartGridGridLayoutManager;
        goto LABEL_8;
      case 2uLL:
        v6 = [TUISmartGridGridLayoutManager alloc];
        v7 = [(TUILayout *)self box];
        v8 = [v7 content];
        v9 = [(TUISmartGridGridLayoutManager *)v6 initWithContent:v8];

        [(TUISmartGridGridLayoutManager *)v9 setList:1];
        layoutManager = self->_layoutManager;
        self->_layoutManager = (TUISmartGridLayoutManager *)v9;
        goto LABEL_9;
      case 3uLL:
        v5 = TUISmartGridOverlapWithOffsetsLayoutManager;
        goto LABEL_8;
      case 4uLL:
        v5 = TUISmartGridFlexRowLayoutManager;
LABEL_8:
        id v11 = [v5 alloc];
        layoutManager = [(TUILayout *)self box];
        v12 = [layoutManager content];
        v13 = (TUISmartGridLayoutManager *)[v11 initWithContent:v12];
        v14 = self->_layoutManager;
        self->_layoutManager = v13;

LABEL_9:
        break;
      default:
        break;
    }
  }
  [(TUILayout *)self computeWidth];
  double v16 = v15;
  id v28 = [(TUILayout *)self box];
  v17 = [(TUILayout *)self controller];
  v18 = [(TUILayout *)self box];
  v19 = [v18 scrollBox];
  v20 = [v17 layoutForModel:v19];

  v21 = [(TUILayout *)self controller];
  v22 = [(TUILayout *)self box];
  v23 = [v22 content];
  v24 = [v21 layoutForModel:v23];

  v25 = [_TUISmartGridLayoutConfiguration alloc];
  [(TUILayout *)self computeHeight];
  v27 = [(_TUISmartGridLayoutConfiguration *)v25 initWithWidth:v28 height:v16 box:v26];
  [(TUISmartGridLayoutManager *)self->_layoutManager setConfiguration:v27];
  [(id)objc_opt_class() configureScrollLayout:v20 configuration:v27];
  [(id)objc_opt_class() configureContentLayout:v24 configuration:v27];
  [v20 validateLayout];
  if (objc_opt_respondsToSelector()) {
    [v20 invalidateRenderModel];
  }
  [(TUISmartGridLayoutManager *)self->_layoutManager layoutSize];
  -[TUILayout setComputedNaturalSize:](self, "setComputedNaturalSize:");
}

- (BOOL)shouldUpdateContainingMetricsForScrollableContent
{
  return 0;
}

- (void)appendChildRenderModelCompatibleWithKind:(unint64_t)a3 context:(id)a4 transform:(CGAffineTransform *)a5 toModels:(id)a6
{
  v19.receiver = self;
  v19.super_class = (Class)TUISmartGridLayout;
  long long v10 = *(_OWORD *)&a5->c;
  long long v16 = *(_OWORD *)&a5->a;
  long long v17 = v10;
  long long v18 = *(_OWORD *)&a5->tx;
  id v11 = a6;
  id v12 = a4;
  [(TUILayout *)&v19 appendChildRenderModelCompatibleWithKind:a3 context:v12 transform:&v16 toModels:v11];
  layoutManager = self->_layoutManager;
  v14 = [(TUILayout *)self box];
  long long v15 = *(_OWORD *)&a5->c;
  long long v16 = *(_OWORD *)&a5->a;
  long long v17 = v15;
  long long v18 = *(_OWORD *)&a5->tx;
  [(TUISmartGridLayoutManager *)layoutManager appendNonScrollableAdornmentRenderModelsCompatibleWithKind:a3 transform:&v16 context:v12 box:v14 toModels:v11];
}

- (double)columnLayoutProviderWidthForColumnSpan:(unint64_t)a3
{
  if ((objc_opt_respondsToSelector() & 1) == 0) {
    return NAN;
  }
  layoutManager = self->_layoutManager;

  [(TUISmartGridLayoutManager *)layoutManager widthForColumnSpan:a3];
  return result;
}

- (unint64_t)columnLayoutProviderColumnSpanForColumnSpan:(id)a3
{
  layoutManager = self->_layoutManager;
  id v4 = a3;
  v5 = [(TUISmartGridLayoutManager *)layoutManager configuration];
  id v6 = [v5 unsignedIntegerWithSpec:v4];

  return (unint64_t)v6;
}

- (unint64_t)columnLayoutProviderColumnsForContainerFraction:(double)a3
{
  v5 = [(TUISmartGridLayoutManager *)self->_layoutManager configuration];
  [v5 width];
  double v7 = v6;
  [(TUISmartGridLayoutManager *)self->_layoutManager computedColumnSpacing];
  double v9 = v8 + v7 * a3;
  [(TUISmartGridLayoutManager *)self->_layoutManager computedColumnWidth];
  double v11 = v10;
  [(TUISmartGridLayoutManager *)self->_layoutManager computedColumnSpacing];
  unint64_t v13 = vcvtpd_u64_f64(v9 / (v11 + v12));

  if (v13 <= 1) {
    unint64_t v14 = 1;
  }
  else {
    unint64_t v14 = v13;
  }
  if (v14 <= (unint64_t)[(TUISmartGridLayoutManager *)self->_layoutManager computedColumns]) {
    return v14;
  }
  layoutManager = self->_layoutManager;

  return (unint64_t)[(TUISmartGridLayoutManager *)layoutManager computedColumns];
}

- (unint64_t)ruleLayoutAxis
{
  return (unint64_t)[(TUISmartGridLayoutManager *)self->_layoutManager ruleLayoutAxis];
}

- (TUISmartGridLayoutManager)layoutManager
{
  return self->_layoutManager;
}

- (void)setLayoutManager:(id)a3
{
}

- (void).cxx_destruct
{
}

@end