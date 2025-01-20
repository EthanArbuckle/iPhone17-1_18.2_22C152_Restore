@interface _TUISmartGridDebugLayerConfiguration
- (BOOL)isEqualToConfig:(id)a3;
- (BOOL)reuseLayerForBoundsChange;
- (CGSize)size;
- (Class)layerClass;
- (Class)layerClassForSize:(CGSize)a3;
- (_TUISmartGridDebugLayerConfiguration)initWithSize:(CGSize)a3 columnSystem:(const ColumnSystem *)a4;
- (id).cxx_construct;
- (void)configureBounds:(id)a3;
- (void)configureLayer:(id)a3;
@end

@implementation _TUISmartGridDebugLayerConfiguration

- (_TUISmartGridDebugLayerConfiguration)initWithSize:(CGSize)a3 columnSystem:(const ColumnSystem *)a4
{
  CGFloat height = a3.height;
  CGFloat width = a3.width;
  v14.receiver = self;
  v14.super_class = (Class)_TUISmartGridDebugLayerConfiguration;
  result = [(_TUISmartGridDebugLayerConfiguration *)&v14 init];
  if (result)
  {
    result->_size.CGFloat width = width;
    result->_size.CGFloat height = height;
    long long v8 = *(_OWORD *)&a4->_containerWidth;
    long long v9 = *(_OWORD *)&a4->_rows;
    long long v10 = *(_OWORD *)&a4->_insets.left;
    *(_OWORD *)&result->_columnSystem._insets.right = *(_OWORD *)&a4->_insets.right;
    *(_OWORD *)&result->_columnSystem._insets.left = v10;
    *(_OWORD *)&result->_columnSystem._rows = v9;
    *(_OWORD *)&result->_columnSystem._containerWidth = v8;
    long long v11 = *(_OWORD *)&a4->_specifiedColumnSpacing;
    long long v12 = *(_OWORD *)&a4->_computedColumnSpacing;
    long long v13 = *(_OWORD *)&a4->_layoutDirection;
    result->_columnSystem._columnsPerPage = a4->_columnsPerPage;
    *(_OWORD *)&result->_columnSystem._layoutDirection = v13;
    *(_OWORD *)&result->_columnSystem._computedColumnSpacing = v12;
    *(_OWORD *)&result->_columnSystem._specifiedColumnSpacing = v11;
  }
  return result;
}

- (Class)layerClass
{
  return (Class)objc_opt_class();
}

- (Class)layerClassForSize:(CGSize)a3
{
  return (Class)objc_opt_class();
}

- (void)configureLayer:(id)a3
{
  id v15 = a3;
  v4 = +[UIColor redColor];
  v5 = [v4 colorWithAlphaComponent:0.1];

  v6 = +[UIColor redColor];
  v7 = [v6 colorWithAlphaComponent:0.2];

  id v8 = v5;
  [v15 setBackgroundColor:[v8 CGColor]];
  long long v9 = objc_opt_new();
  if (self->_columnSystem._columns)
  {
    unint64_t v10 = 0;
    do
    {
      sub_68CD0((uint64_t)&self->_columnSystem, v10, 1uLL, 1);
      double v12 = v11;
      double v13 = sub_62124((uint64_t)&self->_columnSystem, v10, 1uLL);
      objc_super v14 = +[CALayer layer];
      [v14 setBackgroundColor:[v7 CGColor]];
      [v14 setFrame:v12, 0.0, v12 + v13 - v12, self->_size.height];
      [v9 addObject:v14];

      ++v10;
    }
    while (v10 < self->_columnSystem._columns);
  }
  [v15 setSublayers:v9];
}

- (void)configureBounds:(id)a3
{
}

- (BOOL)isEqualToConfig:(id)a3
{
  return 0;
}

- (BOOL)reuseLayerForBoundsChange
{
  return 1;
}

- (CGSize)size
{
  double width = self->_size.width;
  double height = self->_size.height;
  result.double height = height;
  result.double width = width;
  return result;
}

- (id).cxx_construct
{
  *((void *)self + 2) = 0;
  *((void *)self + 3) = 0;
  *((void *)self + 1) = 0;
  long long v2 = *(_OWORD *)&UIEdgeInsetsZero.bottom;
  *((_OWORD *)self + 2) = *(_OWORD *)&UIEdgeInsetsZero.top;
  *((_OWORD *)self + 3) = v2;
  *((void *)self + 15) = 0;
  *((void *)self + 8) = 0;
  *((void *)self + 9) = 0;
  *((void *)self + 12) = 0;
  *((void *)self + 13) = 0;
  return self;
}

@end