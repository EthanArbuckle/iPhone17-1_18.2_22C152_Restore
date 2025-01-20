@interface SXDebugAdLayout
- (SXDebugAdLayout)initWithMargin:(_SXConvertibleValue)a3;
- (SXEdgeSpacing)margin;
@end

@implementation SXDebugAdLayout

- (SXDebugAdLayout)initWithMargin:(_SXConvertibleValue)a3
{
  unint64_t unit = a3.unit;
  double value = a3.value;
  v9.receiver = self;
  v9.super_class = (Class)SXDebugAdLayout;
  v5 = [(SXDebugAdLayout *)&v9 init];
  if (v5)
  {
    v6 = -[SXAutoPlacementMargin initWithTop:bottom:]([SXAutoPlacementMargin alloc], "initWithTop:bottom:", *(void *)&value, unit, *(void *)&value, unit);
    margin = v5->_margin;
    v5->_margin = (SXEdgeSpacing *)v6;
  }
  return v5;
}

- (SXEdgeSpacing)margin
{
  return self->_margin;
}

- (void).cxx_destruct
{
}

@end