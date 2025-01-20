@interface _UISecureControlSizeTool
- (_UISecureControlSizeTool)init;
- (id)_drawingPlanForSizeSpec:(id)a3;
- (id)drawingWithStyle:(id)a3 tag:(id)a4 forRemote:(BOOL)a5;
- (void)getIntrinsicContentSizeForSpec:(id)a3 reply:(id)a4;
@end

@implementation _UISecureControlSizeTool

- (_UISecureControlSizeTool)init
{
  v9.receiver = self;
  v9.super_class = (Class)_UISecureControlSizeTool;
  v2 = [(_UISecureControlSizeTool *)&v9 init];
  v3 = v2;
  if (v2)
  {
    v2->_sizeSpecDrawingPlansLock._os_unfair_lock_opaque = 0;
    v4 = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
    sizeSpecDrawingPlans = v3->_sizeSpecDrawingPlans;
    v3->_sizeSpecDrawingPlans = v4;

    v6 = (UISLRUCache *)[objc_alloc((Class)UISLRUCache) initWithLimit:10];
    sizeSpecLRUCache = v3->_sizeSpecLRUCache;
    v3->_sizeSpecLRUCache = v6;
  }
  return v3;
}

- (id)_drawingPlanForSizeSpec:(id)a3
{
  id v4 = a3;
  os_unfair_lock_lock(&self->_sizeSpecDrawingPlansLock);
  v5 = [(NSMutableDictionary *)self->_sizeSpecDrawingPlans objectForKeyedSubscript:v4];
  os_unfair_lock_unlock(&self->_sizeSpecDrawingPlansLock);
  if (!v5)
  {
    v6 = [v4 category];
    v7 = [_UISecureControlDrawingPlan alloc];
    v8 = [v4 style];
    id v9 = [v4 arrangeVertically];
    id v10 = [v6 secureNameForDrawing];
    v11 = [v6 iconGlyph];
    v5 = [(_UISecureControlDrawingPlan *)v7 initWithSlotStyle:v8 arrangeVertically:v9 secureName:v10 iconGlyph:v11];

    os_unfair_lock_lock(&self->_sizeSpecDrawingPlansLock);
    [(NSMutableDictionary *)self->_sizeSpecDrawingPlans setObject:v5 forKeyedSubscript:v4];
    v12 = [(UISLRUCache *)self->_sizeSpecLRUCache evictedObjectForUsedObject:v4];
    if (v12) {
      [(NSMutableDictionary *)self->_sizeSpecDrawingPlans removeObjectForKey:v12];
    }
    os_unfair_lock_unlock(&self->_sizeSpecDrawingPlansLock);
  }
  return v5;
}

- (id)drawingWithStyle:(id)a3 tag:(id)a4 forRemote:(BOOL)a5
{
  id v7 = a3;
  id v8 = a4;
  id v9 = +[_UISSecureControlSizeSpec specWithStyle:v7 tag:v8];
  id v10 = [(_UISecureControlSizeTool *)self _drawingPlanForSizeSpec:v9];

  [v8 size];
  double v12 = v11;
  double v14 = v13;
  [v10 minimumContentSize];
  if (v12 < v16 || v14 < v15)
  {
    v18 = 0;
  }
  else
  {
    v19 = (CGColor *)[v8 baseForegroundColor];
    ConstantColor = v19;
    if (!v19) {
      ConstantColor = CGColorGetConstantColor(kCGColorWhite);
    }
    v21 = (CGColor *)[v8 baseBackgroundColor];
    if (!v21) {
      v21 = (CGColor *)[v7 tintColor];
    }
    UISColorLuminance();
    double v23 = v22;
    UISColorLuminance();
    double v25 = v24;
    if (v23 < v24)
    {
      double v26 = v23;
    }
    else
    {
      double v24 = v23;
      double v26 = v25;
    }
    if ((v24 + 0.05) / (v26 + 0.05) >= 3.0)
    {
      CopyWithAlpha = CGColorCreateCopyWithAlpha(ConstantColor, 1.0);
      v27 = CGColorCreateCopyWithAlpha(v21, 1.0);
    }
    else
    {
      v27 = (CGColor *)UISCreateColorWithLuminance();
      uint64_t v28 = UISCreateColorWithLuminance();
      if (v23 < v25) {
        CopyWithAlpha = (CGColor *)v28;
      }
      else {
        CopyWithAlpha = v27;
      }
      if (v23 >= v25) {
        v27 = (CGColor *)v28;
      }
    }
    v30 = [_UISecureControlDrawing alloc];
    id v31 = [v8 cornerStyle];
    [v8 cornerRadius];
    v18 = -[_UISecureControlDrawing initWithDrawingPlan:cornerStyle:cornerRadius:foregroundColor:backgroundColor:imagePlacement:leftToRight:size:](v30, "initWithDrawingPlan:cornerStyle:cornerRadius:foregroundColor:backgroundColor:imagePlacement:leftToRight:size:", v10, v31, CopyWithAlpha, v27, [v8 imagePlacement], objc_msgSend(v7, "layoutDirection") == 0, v32, v12, v14);
    CGColorRelease(CopyWithAlpha);
    CGColorRelease(v27);
  }

  return v18;
}

- (void)getIntrinsicContentSizeForSpec:(id)a3 reply:(id)a4
{
  id v10 = a3;
  v6 = (void (**)(void))a4;
  id v7 = [v10 category];
  unsigned __int8 v8 = [v7 isValid];

  if (v8)
  {
    id v9 = [(_UISecureControlSizeTool *)self _drawingPlanForSizeSpec:v10];
    [v9 intrinsicContentSize];
    v6[2](v6);
  }
  else
  {
    ((void (*)(void (**)(void), CGFloat, CGFloat))v6[2])(v6, CGSizeZero.width, CGSizeZero.height);
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sizeSpecLRUCache, 0);
  objc_storeStrong((id *)&self->_sizeSpecDrawingPlans, 0);
}

@end