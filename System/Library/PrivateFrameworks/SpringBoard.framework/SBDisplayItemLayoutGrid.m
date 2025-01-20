@interface SBDisplayItemLayoutGrid
- (CGSize)maxGridSizeForBounds:(CGRect)a3 contentOrientation:(int64_t)a4 layoutRestrictionInfo:(id)a5 screenScale:(double)a6 chamoisLayoutAttributes:(id)a7;
- (CGSize)minGridSizeForBounds:(CGRect)a3 contentOrientation:(int64_t)a4 layoutRestrictionInfo:(id)a5 screenScale:(double)a6 chamoisLayoutAttributes:(id)a7;
- (CGSize)nearestGridSizeForProposedSize:(CGSize)a3 countOnStage:(unint64_t)a4 inBounds:(CGRect)a5 contentOrientation:(int64_t)a6 layoutRestrictionInfo:(id)a7 screenScale:(double)a8 chamoisLayoutAttributes:(id)a9;
- (NSString)description;
- (SBDisplayItemLayoutGrid)init;
- (id)_gridForBounds:(CGRect)a3 contentOrientation:(int64_t)a4 layoutRestrictionInfo:(id)a5 screenScale:(double)a6 chamoisLayoutAttributes:(id)a7;
- (id)allGridHeightsForBounds:(CGRect)a3 contentOrientation:(int64_t)a4 layoutRestrictionInfo:(id)a5 screenScale:(double)a6 chamoisLayoutAttributes:(id)a7;
- (id)allGridWidthsForBounds:(CGRect)a3 contentOrientation:(int64_t)a4 layoutRestrictionInfo:(id)a5 screenScale:(double)a6 chamoisLayoutAttributes:(id)a7;
- (id)descriptionBuilderWithMultilinePrefix:(id)a3;
- (id)descriptionWithMultilinePrefix:(id)a3;
- (id)succinctDescription;
- (id)succinctDescriptionBuilder;
@end

@implementation SBDisplayItemLayoutGrid

- (SBDisplayItemLayoutGrid)init
{
  v6.receiver = self;
  v6.super_class = (Class)SBDisplayItemLayoutGrid;
  v2 = [(SBDisplayItemLayoutGrid *)&v6 init];
  if (v2)
  {
    uint64_t v3 = objc_opt_new();
    gridCache = v2->_gridCache;
    v2->_gridCache = (NSMutableDictionary *)v3;
  }
  return v2;
}

- (CGSize)nearestGridSizeForProposedSize:(CGSize)a3 countOnStage:(unint64_t)a4 inBounds:(CGRect)a5 contentOrientation:(int64_t)a6 layoutRestrictionInfo:(id)a7 screenScale:(double)a8 chamoisLayoutAttributes:(id)a9
{
  double height = a3.height;
  double width = a3.width;
  v12 = -[SBDisplayItemLayoutGrid _gridForBounds:contentOrientation:layoutRestrictionInfo:screenScale:chamoisLayoutAttributes:](self, "_gridForBounds:contentOrientation:layoutRestrictionInfo:screenScale:chamoisLayoutAttributes:", a6, a7, a9, a5.origin.x, a5.origin.y, a5.size.width, a5.size.height, a8);
  objc_msgSend(v12, "nearestGridSizeForSize:countOnStage:", a4, width, height);
  double v14 = v13;
  double v16 = v15;

  double v17 = v14;
  double v18 = v16;
  result.double height = v18;
  result.double width = v17;
  return result;
}

- (CGSize)minGridSizeForBounds:(CGRect)a3 contentOrientation:(int64_t)a4 layoutRestrictionInfo:(id)a5 screenScale:(double)a6 chamoisLayoutAttributes:(id)a7
{
  v7 = -[SBDisplayItemLayoutGrid _gridForBounds:contentOrientation:layoutRestrictionInfo:screenScale:chamoisLayoutAttributes:](self, "_gridForBounds:contentOrientation:layoutRestrictionInfo:screenScale:chamoisLayoutAttributes:", a4, a5, a7, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height, a6);
  [v7 minSize];
  double v9 = v8;
  double v11 = v10;

  double v12 = v9;
  double v13 = v11;
  result.double height = v13;
  result.double width = v12;
  return result;
}

- (CGSize)maxGridSizeForBounds:(CGRect)a3 contentOrientation:(int64_t)a4 layoutRestrictionInfo:(id)a5 screenScale:(double)a6 chamoisLayoutAttributes:(id)a7
{
  v7 = -[SBDisplayItemLayoutGrid _gridForBounds:contentOrientation:layoutRestrictionInfo:screenScale:chamoisLayoutAttributes:](self, "_gridForBounds:contentOrientation:layoutRestrictionInfo:screenScale:chamoisLayoutAttributes:", a4, a5, a7, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height, a6);
  [v7 maxSize];
  double v9 = v8;
  double v11 = v10;

  double v12 = v9;
  double v13 = v11;
  result.double height = v13;
  result.double width = v12;
  return result;
}

- (id)allGridWidthsForBounds:(CGRect)a3 contentOrientation:(int64_t)a4 layoutRestrictionInfo:(id)a5 screenScale:(double)a6 chamoisLayoutAttributes:(id)a7
{
  v7 = -[SBDisplayItemLayoutGrid _gridForBounds:contentOrientation:layoutRestrictionInfo:screenScale:chamoisLayoutAttributes:](self, "_gridForBounds:contentOrientation:layoutRestrictionInfo:screenScale:chamoisLayoutAttributes:", a4, a5, a7, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height, a6);
  double v8 = [v7 allWidths];

  return v8;
}

- (id)allGridHeightsForBounds:(CGRect)a3 contentOrientation:(int64_t)a4 layoutRestrictionInfo:(id)a5 screenScale:(double)a6 chamoisLayoutAttributes:(id)a7
{
  v7 = -[SBDisplayItemLayoutGrid _gridForBounds:contentOrientation:layoutRestrictionInfo:screenScale:chamoisLayoutAttributes:](self, "_gridForBounds:contentOrientation:layoutRestrictionInfo:screenScale:chamoisLayoutAttributes:", a4, a5, a7, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height, a6);
  double v8 = [v7 allHeights];

  return v8;
}

- (id)_gridForBounds:(CGRect)a3 contentOrientation:(int64_t)a4 layoutRestrictionInfo:(id)a5 screenScale:(double)a6 chamoisLayoutAttributes:(id)a7
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  id v15 = a5;
  id v16 = a7;
  double v17 = -[_SBDisplayItemGridCacheKey initWithBounds:orientation:layoutRestrictionInfo:screenScale:chamoisLayoutAttributes:]([_SBDisplayItemGridCacheKey alloc], "initWithBounds:orientation:layoutRestrictionInfo:screenScale:chamoisLayoutAttributes:", a4, v15, v16, x, y, width, height, a6);
  double v18 = [(NSMutableDictionary *)self->_gridCache objectForKey:v17];
  if (!v18)
  {
    uint64_t v19 = [v15 layoutRestrictions];
    if (v19)
    {
      uint64_t v20 = v19;
      if ((v19 & 4) != 0)
      {
        v25 = [_SBDisplayItemSingleSizeGrid alloc];
        double v26 = width;
        double v27 = height;
      }
      else
      {
        if ((v19 & 2) != 0)
        {
          [v15 restrictedSize];
          BOOL v31 = (v20 & 8) == 0;
          if ((unint64_t)(a4 - 3) >= 2) {
            double v32 = v30;
          }
          else {
            double v32 = v29;
          }
          if ((unint64_t)(a4 - 3) >= 2) {
            double v33 = v29;
          }
          else {
            double v33 = v30;
          }
          v28 = -[_SBDisplayItemFixedAspectGrid initWithBounds:fixedSize:screenScale:supportsOrthogonalSizes:chamoisLayoutAttributes:]([_SBDisplayItemFixedAspectGrid alloc], "initWithBounds:fixedSize:screenScale:supportsOrthogonalSizes:chamoisLayoutAttributes:", v31, v16, x, y, width, height, v33, v32, a6);
          goto LABEL_18;
        }
        v21 = SBLogCommon();
        BOOL v22 = os_log_type_enabled(v21, OS_LOG_TYPE_DEBUG);

        if (v22)
        {
          v36.origin.double x = x;
          v36.origin.double y = y;
          v36.size.double width = width;
          v36.size.double height = height;
          v23 = NSStringFromCGRect(v36);
          v24 = BSInterfaceOrientationDescription();
          NSLog(&cfstr_UnsupportedLay_0.isa, v20, v23, v24);
        }
        v25 = [_SBDisplayItemSingleSizeGrid alloc];
        double v26 = 276.0;
        double v27 = 314.0;
      }
      v28 = -[_SBDisplayItemSingleSizeGrid initWithSize:](v25, "initWithSize:", v26, v27);
    }
    else
    {
      v28 = -[_SBDisplayItemFlexibleGrid initWithBounds:screenScale:chamoisLayoutAttributes:]([_SBDisplayItemFlexibleGrid alloc], "initWithBounds:screenScale:chamoisLayoutAttributes:", v16, x, y, width, height, a6);
    }
LABEL_18:
    double v18 = v28;
    [(NSMutableDictionary *)self->_gridCache setObject:v28 forKey:v17];
  }

  return v18;
}

- (NSString)description
{
  return (NSString *)[(SBDisplayItemLayoutGrid *)self descriptionWithMultilinePrefix:&stru_1F3084718];
}

- (id)descriptionWithMultilinePrefix:(id)a3
{
  uint64_t v3 = [(SBDisplayItemLayoutGrid *)self descriptionBuilderWithMultilinePrefix:a3];
  v4 = [v3 build];

  return v4;
}

- (id)descriptionBuilderWithMultilinePrefix:(id)a3
{
  v4 = [MEMORY[0x1E4F4F718] builderWithObject:self];
  id v5 = (id)[v4 appendObject:self->_gridCache withName:@"gridCache"];
  return v4;
}

- (id)succinctDescription
{
  v2 = [(SBDisplayItemLayoutGrid *)self succinctDescriptionBuilder];
  uint64_t v3 = [v2 build];

  return v3;
}

- (id)succinctDescriptionBuilder
{
  return (id)[MEMORY[0x1E4F4F718] builderWithObject:self];
}

- (void).cxx_destruct
{
}

@end