@interface _SBFluidSwitcherSheetMetricsCacheKey
- (BOOL)isEqual:(id)a3;
- (_SBFluidSwitcherSheetMetricsCacheKey)initWithBoundsSize:(CGSize)a3 interfaceOrientation:(int64_t)a4 configuration:(int64_t)a5 userInterfaceIdiom:(int64_t)a6 displayScale:(double)a7 displayEdgeInfo:(id)a8;
- (unint64_t)hash;
@end

@implementation _SBFluidSwitcherSheetMetricsCacheKey

- (_SBFluidSwitcherSheetMetricsCacheKey)initWithBoundsSize:(CGSize)a3 interfaceOrientation:(int64_t)a4 configuration:(int64_t)a5 userInterfaceIdiom:(int64_t)a6 displayScale:(double)a7 displayEdgeInfo:(id)a8
{
  CGFloat height = a3.height;
  CGFloat width = a3.width;
  id v16 = a8;
  v27.receiver = self;
  v27.super_class = (Class)_SBFluidSwitcherSheetMetricsCacheKey;
  v17 = [(_SBFluidSwitcherSheetMetricsCacheKey *)&v27 init];
  v18 = v17;
  if (v17)
  {
    v17->_boundsSize.CGFloat width = width;
    v17->_boundsSize.CGFloat height = height;
    v17->_interfaceOrientation = a4;
    v17->_displayScale = a7;
    objc_storeStrong((id *)&v17->_displayEdgeInfo, a8);
    v18->_userInterfaceIdiom = a6;
    v18->_configuration = a5;
    v19 = [MEMORY[0x1E4F4F758] builder];
    id v20 = (id)objc_msgSend(v19, "appendCGSize:", v18->_boundsSize.width, v18->_boundsSize.height);
    id v21 = (id)[v19 appendInteger:v18->_interfaceOrientation];
    id v22 = (id)[v19 appendCGFloat:v18->_displayScale];
    id v23 = (id)[v19 appendObject:v18->_displayEdgeInfo];
    id v24 = (id)[v19 appendInteger:v18->_userInterfaceIdiom];
    id v25 = (id)[v19 appendInteger:v18->_configuration];
    v18->_cachedHash = [v19 hash];
  }
  return v18;
}

- (unint64_t)hash
{
  return self->_cachedHash;
}

- (BOOL)isEqual:(id)a3
{
  v4 = (_SBFluidSwitcherSheetMetricsCacheKey *)a3;
  if (v4 == self)
  {
    BOOL v5 = 1;
  }
  else
  {
    objc_opt_class();
    BOOL v5 = (objc_opt_isKindOfClass() & 1) != 0
      && SBSizeEqualsSize()
      && SBFloatEqualsFloat()
      && self->_interfaceOrientation == v4->_interfaceOrientation
      && BSEqualObjects()
      && self->_userInterfaceIdiom == v4->_userInterfaceIdiom
      && self->_configuration == v4->_configuration;
  }

  return v5;
}

- (void).cxx_destruct
{
}

@end