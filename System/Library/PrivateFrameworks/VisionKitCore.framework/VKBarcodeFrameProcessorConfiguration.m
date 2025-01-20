@interface VKBarcodeFrameProcessorConfiguration
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqualToBarcodeFrameProcessorConfiguration:(id)a3;
- (BOOL)isForSingleItem;
- (CGPoint)comparisonPoint;
- (NSArray)symbologies;
- (VKBarcodeFrameProcessorConfiguration)init;
- (id)copyWithZone:(_NSZone *)a3;
- (void)setComparisonPoint:(CGPoint)a3;
- (void)setIsForSingleItem:(BOOL)a3;
- (void)setSymbologies:(id)a3;
@end

@implementation VKBarcodeFrameProcessorConfiguration

- (VKBarcodeFrameProcessorConfiguration)init
{
  v11.receiver = self;
  v11.super_class = (Class)VKBarcodeFrameProcessorConfiguration;
  v2 = [(VKBarcodeFrameProcessorConfiguration *)&v11 init];
  v3 = (VKBarcodeFrameProcessorConfiguration *)v2;
  if (v2)
  {
    v2[8] = 1;
    __asm { FMOV            V0.2D, #0.5 }
    *(_OWORD *)(v2 + 24) = _Q0;
    v9 = (void *)*((void *)v2 + 2);
    *((void *)v2 + 2) = MEMORY[0x1E4F1CBF0];
  }
  return v3;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v4 = objc_alloc_init(VKBarcodeFrameProcessorConfiguration);
  [(VKBarcodeFrameProcessorConfiguration *)v4 setIsForSingleItem:[(VKBarcodeFrameProcessorConfiguration *)self isForSingleItem]];
  [(VKBarcodeFrameProcessorConfiguration *)self comparisonPoint];
  -[VKBarcodeFrameProcessorConfiguration setComparisonPoint:](v4, "setComparisonPoint:");
  v5 = [(VKBarcodeFrameProcessorConfiguration *)self symbologies];
  [(VKBarcodeFrameProcessorConfiguration *)v4 setSymbologies:v5];

  return v4;
}

- (BOOL)isEqual:(id)a3
{
  v4 = (VKBarcodeFrameProcessorConfiguration *)a3;
  if (self == v4)
  {
    BOOL v7 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      uint64_t v5 = objc_opt_class();
      v6 = VKDynamicCast(v5, (uint64_t)v4);
      BOOL v7 = [(VKBarcodeFrameProcessorConfiguration *)self isEqualToBarcodeFrameProcessorConfiguration:v6];
    }
    else
    {
      BOOL v7 = 0;
    }
  }

  return v7;
}

- (BOOL)isEqualToBarcodeFrameProcessorConfiguration:(id)a3
{
  id v4 = a3;
  int v5 = [v4 isForSingleItem];
  int v6 = [(VKBarcodeFrameProcessorConfiguration *)self isForSingleItem];
  [v4 comparisonPoint];
  double v8 = v7;
  double v10 = v9;
  [(VKBarcodeFrameProcessorConfiguration *)self comparisonPoint];
  double v12 = v11;
  double v14 = v13;
  v15 = [v4 symbologies];

  v16 = [(VKBarcodeFrameProcessorConfiguration *)self symbologies];
  char v17 = [v15 isEqualToArray:v16];

  if (v5 == v6) {
    return VKMNearlyEqualPointsWithThreshold(v8, v10, v12, v14, 0.00001) & v17;
  }
  else {
    return 0;
  }
}

- (BOOL)isForSingleItem
{
  return self->_isForSingleItem;
}

- (void)setIsForSingleItem:(BOOL)a3
{
  self->_isForSingleItem = a3;
}

- (CGPoint)comparisonPoint
{
  double x = self->_comparisonPoint.x;
  double y = self->_comparisonPoint.y;
  result.double y = y;
  result.double x = x;
  return result;
}

- (void)setComparisonPoint:(CGPoint)a3
{
  self->_comparisonPoint = a3;
}

- (NSArray)symbologies
{
  return self->_symbologies;
}

- (void)setSymbologies:(id)a3
{
}

- (void).cxx_destruct
{
}

@end