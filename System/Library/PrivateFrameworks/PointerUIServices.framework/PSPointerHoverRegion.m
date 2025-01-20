@interface PSPointerHoverRegion
+ (BOOL)supportsSecureCoding;
- (BOOL)isLatching;
- (BOOL)isNumericDataValid;
- (BOOL)isOverlayEffectVisible;
- (BOOL)shouldPointerSuppressMirroring;
- (BOOL)shouldPointerUnderlayContent;
- (CGRect)contentBounds;
- (CGRect)hitTestBounds;
- (NSArray)accessories;
- (NSValue)contentSlipValue;
- (NSValue)pointerSlipValue;
- (PSMatchMoveSource)contentMatchMoveSource;
- (PSPointerHoverRegion)init;
- (PSPointerHoverRegion)initWithCoder:(id)a3;
- (PSPointerPortalSourceCollection)pointerPortalSourceCollection;
- (PSPointerShape)pointerShape;
- (double)contentHoverInverseScale;
- (double)pointerVisualIntensity;
- (id)_copyWithClass:(Class)a3;
- (id)mutableCopyWithZone:(_NSZone *)a3;
- (int64_t)overlayEffectStyle;
- (unint64_t)coordinateSpaceSourceLayerRenderID;
- (unint64_t)pointerLatchingAxes;
- (unint64_t)pointerRecenteringAxes;
- (unint64_t)preferredPointerMaterialLuminance;
- (unsigned)coordinateSpaceSourceContextID;
- (void)encodeWithCoder:(id)a3;
@end

@implementation PSPointerHoverRegion

- (PSPointerHoverRegion)init
{
  v7.receiver = self;
  v7.super_class = (Class)PSPointerHoverRegion;
  v2 = [(PSPointerHoverRegion *)&v7 init];
  v3 = v2;
  if (v2)
  {
    v2->_contentHoverInverseScale = 1.0;
    uint64_t v4 = +[PSPointerShape systemShape];
    pointerShape = v3->_pointerShape;
    v3->_pointerShape = (PSPointerShape *)v4;

    v3->_pointerVisualIntensity = 1.0;
  }
  return v3;
}

- (id)mutableCopyWithZone:(_NSZone *)a3
{
  uint64_t v4 = objc_opt_class();
  return [(PSPointerHoverRegion *)self _copyWithClass:v4];
}

- (PSPointerHoverRegion)initWithCoder:(id)a3
{
  id v4 = a3;
  v34.receiver = self;
  v34.super_class = (Class)PSPointerHoverRegion;
  v5 = [(PSPointerHoverRegion *)&v34 init];
  if (v5)
  {
    v5->_coordinateSpaceSourceContextID = [v4 decodeInt32ForKey:@"coordinateSpaceSourceContextID"];
    v5->_coordinateSpaceSourceLayerRenderID = [v4 decodeInt64ForKey:@"coordinateSpaceSourceLayerRenderID"];
    v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"contentBounds"];
    objc_msgSend(v6, "bs_CGRectValue");
    v5->_contentBounds.origin.x = v7;
    v5->_contentBounds.origin.y = v8;
    v5->_contentBounds.size.width = v9;
    v5->_contentBounds.size.height = v10;

    [v4 decodeDoubleForKey:@"contentHoverInverseScale"];
    v5->_contentHoverInverseScale = v11;
    uint64_t v12 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"contentMatchMoveSource"];
    contentMatchMoveSource = v5->_contentMatchMoveSource;
    v5->_contentMatchMoveSource = (PSMatchMoveSource *)v12;

    uint64_t v14 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"contentSlipValue"];
    contentSlipValue = v5->_contentSlipValue;
    v5->_contentSlipValue = (NSValue *)v14;

    v16 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"hitTestBounds"];
    objc_msgSend(v16, "bs_CGRectValue");
    v5->_hitTestBounds.origin.x = v17;
    v5->_hitTestBounds.origin.y = v18;
    v5->_hitTestBounds.size.width = v19;
    v5->_hitTestBounds.size.height = v20;

    v5->_overlayEffectStyle = [v4 decodeIntegerForKey:@"overlayEffectStyle"];
    uint64_t v21 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"pointerPortalSourceCollection"];
    pointerPortalSourceCollection = v5->_pointerPortalSourceCollection;
    v5->_pointerPortalSourceCollection = (PSPointerPortalSourceCollection *)v21;

    v5->_pointerRecenteringAxes = [v4 decodeIntegerForKey:@"pointerRecenteringAxes"];
    v5->_pointerLatchingAxes = [v4 decodeIntegerForKey:@"pointerLatchingAxes"];
    uint64_t v23 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"pointerShape"];
    pointerShape = v5->_pointerShape;
    v5->_pointerShape = (PSPointerShape *)v23;

    uint64_t v25 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"pointerSlipValue"];
    pointerSlipValue = v5->_pointerSlipValue;
    v5->_pointerSlipValue = (NSValue *)v25;

    [v4 decodeDoubleForKey:@"pointerVisualIntensity"];
    v5->_pointerVisualIntensity = v27;
    v5->_preferredPointerMaterialLuminance = [v4 decodeIntegerForKey:@"preferredPointerMaterialLuminance"];
    v5->_shouldPointerUnderlayContent = [v4 decodeBoolForKey:@"shouldPointerUnderlayContent"];
    v5->_shouldPointerSuppressMirroring = [v4 decodeBoolForKey:@"shouldPointerSuppressMirroring"];
    v28 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v29 = objc_opt_class();
    v30 = objc_msgSend(v28, "setWithObjects:", v29, objc_opt_class(), 0);
    uint64_t v31 = [v4 decodeObjectOfClasses:v30 forKey:@"accessories"];
    accessories = v5->_accessories;
    v5->_accessories = (NSArray *)v31;
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  uint64_t coordinateSpaceSourceContextID = self->_coordinateSpaceSourceContextID;
  id v7 = a3;
  [v7 encodeInt32:coordinateSpaceSourceContextID forKey:@"coordinateSpaceSourceContextID"];
  [v7 encodeInt64:self->_coordinateSpaceSourceLayerRenderID forKey:@"coordinateSpaceSourceLayerRenderID"];
  v5 = objc_msgSend(MEMORY[0x1E4F29238], "bs_valueWithCGRect:", self->_contentBounds.origin.x, self->_contentBounds.origin.y, self->_contentBounds.size.width, self->_contentBounds.size.height);
  [v7 encodeObject:v5 forKey:@"contentBounds"];

  [v7 encodeDouble:@"contentHoverInverseScale" forKey:self->_contentHoverInverseScale];
  [v7 encodeObject:self->_contentMatchMoveSource forKey:@"contentMatchMoveSource"];
  [v7 encodeObject:self->_contentSlipValue forKey:@"contentSlipValue"];
  v6 = objc_msgSend(MEMORY[0x1E4F29238], "bs_valueWithCGRect:", self->_hitTestBounds.origin.x, self->_hitTestBounds.origin.y, self->_hitTestBounds.size.width, self->_hitTestBounds.size.height);
  [v7 encodeObject:v6 forKey:@"hitTestBounds"];

  [v7 encodeInteger:self->_overlayEffectStyle forKey:@"overlayEffectStyle"];
  [v7 encodeObject:self->_pointerPortalSourceCollection forKey:@"pointerPortalSourceCollection"];
  [v7 encodeInteger:self->_pointerRecenteringAxes forKey:@"pointerRecenteringAxes"];
  [v7 encodeInteger:self->_pointerLatchingAxes forKey:@"pointerLatchingAxes"];
  [v7 encodeObject:self->_pointerShape forKey:@"pointerShape"];
  [v7 encodeObject:self->_pointerSlipValue forKey:@"pointerSlipValue"];
  [v7 encodeDouble:@"pointerVisualIntensity" forKey:self->_pointerVisualIntensity];
  [v7 encodeInteger:self->_preferredPointerMaterialLuminance forKey:@"preferredPointerMaterialLuminance"];
  [v7 encodeBool:self->_shouldPointerUnderlayContent forKey:@"shouldPointerUnderlayContent"];
  [v7 encodeBool:self->_shouldPointerSuppressMirroring forKey:@"shouldPointerSuppressMirroring"];
  [v7 encodeObject:self->_accessories forKey:@"accessories"];
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (id)_copyWithClass:(Class)a3
{
  id v4 = (CGSize *)objc_alloc_init(a3);
  v5 = v4;
  if (v4)
  {
    *(void *)&v4->CGFloat height = self->_coordinateSpaceSourceLayerRenderID;
    LODWORD(v4[9].height) = self->_coordinateSpaceSourceContextID;
    CGSize size = self->_contentBounds.size;
    v4[1] = (CGSize)self->_contentBounds.origin;
    v4[2] = size;
    v4[3].CGFloat width = self->_contentHoverInverseScale;
    uint64_t v7 = [(PSMatchMoveSource *)self->_contentMatchMoveSource copy];
    CGFloat width = v5[4].width;
    *(void *)&v5[4].CGFloat width = v7;

    uint64_t v9 = [(NSValue *)self->_contentSlipValue copy];
    CGFloat height = v5[3].height;
    *(void *)&v5[3].CGFloat height = v9;

    CGPoint origin = self->_hitTestBounds.origin;
    *(CGSize *)((char *)v5 + 88) = self->_hitTestBounds.size;
    *(CGPoint *)&v5[4].CGFloat height = origin;
    *(void *)&v5[10].CGFloat width = self->_overlayEffectStyle;
    uint64_t v12 = [(PSPointerPortalSourceCollection *)self->_pointerPortalSourceCollection copy];
    CGFloat v13 = v5[6].height;
    *(void *)&v5[6].CGFloat height = v12;

    *(void *)&v5[7].CGFloat width = self->_pointerRecenteringAxes;
    *(void *)&v5[11].CGFloat width = self->_pointerLatchingAxes;
    uint64_t v14 = [(PSPointerShape *)self->_pointerShape copy];
    CGFloat v15 = v5[7].height;
    *(void *)&v5[7].CGFloat height = v14;

    uint64_t v16 = [(NSValue *)self->_pointerSlipValue copy];
    CGFloat v17 = v5[8].width;
    *(void *)&v5[8].CGFloat width = v16;

    v5[8].CGFloat height = self->_pointerVisualIntensity;
    *(void *)&v5[9].CGFloat width = self->_preferredPointerMaterialLuminance;
    LOBYTE(v5[10].height) = self->_shouldPointerUnderlayContent;
    BYTE1(v5[10].height) = self->_shouldPointerSuppressMirroring;
    uint64_t v18 = [(NSArray *)self->_accessories copy];
    CGFloat v19 = v5[11].height;
    *(void *)&v5[11].CGFloat height = v18;
  }
  return v5;
}

- (BOOL)isOverlayEffectVisible
{
  return [(PSPointerHoverRegion *)self overlayEffectStyle] != 0;
}

- (BOOL)isNumericDataValid
{
  BOOL v3 = 0;
  if (fabs(self->_contentBounds.origin.x) != INFINITY)
  {
    double v4 = fabs(self->_contentBounds.size.width);
    double v5 = fabs(self->_contentBounds.size.height);
    BOOL v6 = fabs(self->_contentBounds.origin.y) == INFINITY || v4 == INFINITY;
    BOOL v7 = v6;
    if (!v7 && v5 != INFINITY) {
      BOOL v3 = fabs(self->_contentHoverInverseScale) != INFINITY;
    }
  }
  contentSlipValue = self->_contentSlipValue;
  if (contentSlipValue)
  {
    if (!v3) {
      goto LABEL_28;
    }
    [(NSValue *)contentSlipValue bs_CGPointValue];
    BOOL v3 = 0;
    if (fabs(v11) == INFINITY || fabs(v10) == INFINITY) {
      goto LABEL_28;
    }
  }
  else if (!v3)
  {
    goto LABEL_28;
  }
  BOOL v3 = 0;
  if (fabs(self->_hitTestBounds.origin.x) != INFINITY)
  {
    double v12 = fabs(self->_hitTestBounds.size.width);
    if (fabs(self->_hitTestBounds.origin.y) != INFINITY && v12 != INFINITY) {
      BOOL v3 = fabs(self->_hitTestBounds.size.height) != INFINITY;
    }
  }
LABEL_28:
  pointerSlipValue = self->_pointerSlipValue;
  if (!pointerSlipValue)
  {
    if (v3) {
      goto LABEL_34;
    }
    return 0;
  }
  if (!v3) {
    return 0;
  }
  [(NSValue *)pointerSlipValue bs_CGPointValue];
  BOOL result = 0;
  if (fabs(v18) != INFINITY && fabs(v16) != INFINITY)
  {
LABEL_34:
    BOOL result = 0;
    if (fabs(self->_pointerVisualIntensity) == INFINITY) {
      return result;
    }
    if (self->_preferredPointerMaterialLuminance <= 2) {
      return self->_overlayEffectStyle < 3uLL;
    }
    return 0;
  }
  return result;
}

- (BOOL)isLatching
{
  return self->_pointerLatchingAxes != 0;
}

- (unint64_t)coordinateSpaceSourceLayerRenderID
{
  return self->_coordinateSpaceSourceLayerRenderID;
}

- (unsigned)coordinateSpaceSourceContextID
{
  return self->_coordinateSpaceSourceContextID;
}

- (PSPointerPortalSourceCollection)pointerPortalSourceCollection
{
  return self->_pointerPortalSourceCollection;
}

- (PSMatchMoveSource)contentMatchMoveSource
{
  return self->_contentMatchMoveSource;
}

- (CGRect)contentBounds
{
  double x = self->_contentBounds.origin.x;
  double y = self->_contentBounds.origin.y;
  double width = self->_contentBounds.size.width;
  double height = self->_contentBounds.size.height;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- (double)contentHoverInverseScale
{
  return self->_contentHoverInverseScale;
}

- (NSValue)contentSlipValue
{
  return self->_contentSlipValue;
}

- (CGRect)hitTestBounds
{
  double x = self->_hitTestBounds.origin.x;
  double y = self->_hitTestBounds.origin.y;
  double width = self->_hitTestBounds.size.width;
  double height = self->_hitTestBounds.size.height;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- (int64_t)overlayEffectStyle
{
  return self->_overlayEffectStyle;
}

- (unint64_t)preferredPointerMaterialLuminance
{
  return self->_preferredPointerMaterialLuminance;
}

- (PSPointerShape)pointerShape
{
  return self->_pointerShape;
}

- (NSValue)pointerSlipValue
{
  return self->_pointerSlipValue;
}

- (unint64_t)pointerRecenteringAxes
{
  return self->_pointerRecenteringAxes;
}

- (unint64_t)pointerLatchingAxes
{
  return self->_pointerLatchingAxes;
}

- (double)pointerVisualIntensity
{
  return self->_pointerVisualIntensity;
}

- (BOOL)shouldPointerUnderlayContent
{
  return self->_shouldPointerUnderlayContent;
}

- (BOOL)shouldPointerSuppressMirroring
{
  return self->_shouldPointerSuppressMirroring;
}

- (NSArray)accessories
{
  return self->_accessories;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_accessories, 0);
  objc_storeStrong((id *)&self->_pointerSlipValue, 0);
  objc_storeStrong((id *)&self->_pointerShape, 0);
  objc_storeStrong((id *)&self->_pointerPortalSourceCollection, 0);
  objc_storeStrong((id *)&self->_contentMatchMoveSource, 0);
  objc_storeStrong((id *)&self->_contentSlipValue, 0);
}

@end