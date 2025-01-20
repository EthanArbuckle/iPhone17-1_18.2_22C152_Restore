@interface NTKUpNextCollectionViewFlowLayoutAttributes
- (BOOL)fullyVisibleToUser;
- (BOOL)isEqual:(id)a3;
- (BOOL)notVisibleToUser;
- (CGRect)computedFrame;
- (CGRect)unitFrameOnScreen;
- (NTKUpNextCollectionViewFlowLayoutAttributes)init;
- (double)darkeningAlphaUniform;
- (double)scale;
- (double)shadowAlpha;
- (id)copyWithZone:(_NSZone *)a3;
- (int64_t)layoutMode;
- (unint64_t)hash;
- (void)setComputedFrame:(CGRect)a3;
- (void)setDarkeningAlphaUniform:(double)a3;
- (void)setFullyVisibleToUser:(BOOL)a3;
- (void)setLayoutMode:(int64_t)a3;
- (void)setNotVisibleToUser:(BOOL)a3;
- (void)setScale:(double)a3;
- (void)setShadowAlpha:(double)a3;
- (void)setUnitFrameOnScreen:(CGRect)a3;
@end

@implementation NTKUpNextCollectionViewFlowLayoutAttributes

- (NTKUpNextCollectionViewFlowLayoutAttributes)init
{
  v3.receiver = self;
  v3.super_class = (Class)NTKUpNextCollectionViewFlowLayoutAttributes;
  result = [(UICollectionViewLayoutAttributes *)&v3 init];
  if (result) {
    result->_scale = 1.0;
  }
  return result;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0) {
    goto LABEL_7;
  }
  v16.receiver = self;
  v16.super_class = (Class)NTKUpNextCollectionViewFlowLayoutAttributes;
  if (![(UICollectionViewLayoutAttributes *)&v16 isEqual:v4]) {
    goto LABEL_7;
  }
  [v4 darkeningAlphaUniform];
  if (!CLKFloatEqualsFloat()) {
    goto LABEL_7;
  }
  [v4 unitFrameOnScreen];
  v17.origin.x = v5;
  v17.origin.y = v6;
  v17.size.width = v7;
  v17.size.height = v8;
  if (!CGRectEqualToRect(self->_unitFrameOnScreen, v17)) {
    goto LABEL_7;
  }
  [v4 computedFrame];
  v18.origin.x = v9;
  v18.origin.y = v10;
  v18.size.width = v11;
  v18.size.height = v12;
  if (CGRectEqualToRect(self->_computedFrame, v18))
  {
    BOOL v13 = [(NTKUpNextCollectionViewFlowLayoutAttributes *)self notVisibleToUser];
    int v14 = v13 ^ [v4 notVisibleToUser] ^ 1;
  }
  else
  {
LABEL_7:
    LOBYTE(v14) = 0;
  }

  return v14;
}

- (unint64_t)hash
{
  v13.receiver = self;
  v13.super_class = (Class)NTKUpNextCollectionViewFlowLayoutAttributes;
  unint64_t v3 = [(UICollectionViewLayoutAttributes *)&v13 hash];
  id v4 = [NSNumber numberWithDouble:self->_darkeningAlphaUniform];
  uint64_t v5 = [v4 hash] ^ v3;
  CGFloat v6 = objc_msgSend(MEMORY[0x1E4F29238], "valueWithCGRect:", self->_unitFrameOnScreen.origin.x, self->_unitFrameOnScreen.origin.y, self->_unitFrameOnScreen.size.width, self->_unitFrameOnScreen.size.height);
  uint64_t v7 = [v6 hash];
  CGFloat v8 = objc_msgSend(MEMORY[0x1E4F29238], "valueWithCGRect:", self->_computedFrame.origin.x, self->_computedFrame.origin.y, self->_computedFrame.size.width, self->_computedFrame.size.height);
  uint64_t v9 = v5 ^ v7 ^ [v8 hash];
  CGFloat v10 = objc_msgSend(NSNumber, "numberWithBool:", -[NTKUpNextCollectionViewFlowLayoutAttributes notVisibleToUser](self, "notVisibleToUser"));
  unint64_t v11 = v9 ^ [v10 hash];

  return v11;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v6.receiver = self;
  v6.super_class = (Class)NTKUpNextCollectionViewFlowLayoutAttributes;
  id v4 = [(UICollectionViewLayoutAttributes *)&v6 copyWithZone:a3];
  [(NTKUpNextCollectionViewFlowLayoutAttributes *)self darkeningAlphaUniform];
  objc_msgSend(v4, "setDarkeningAlphaUniform:");
  [(NTKUpNextCollectionViewFlowLayoutAttributes *)self unitFrameOnScreen];
  objc_msgSend(v4, "setUnitFrameOnScreen:");
  [(NTKUpNextCollectionViewFlowLayoutAttributes *)self computedFrame];
  objc_msgSend(v4, "setComputedFrame:");
  [(NTKUpNextCollectionViewFlowLayoutAttributes *)self scale];
  objc_msgSend(v4, "setScale:");
  [(NTKUpNextCollectionViewFlowLayoutAttributes *)self shadowAlpha];
  objc_msgSend(v4, "setShadowAlpha:");
  objc_msgSend(v4, "setLayoutMode:", -[NTKUpNextCollectionViewFlowLayoutAttributes layoutMode](self, "layoutMode"));
  objc_msgSend(v4, "setNotVisibleToUser:", -[NTKUpNextCollectionViewFlowLayoutAttributes notVisibleToUser](self, "notVisibleToUser"));
  objc_msgSend(v4, "setFullyVisibleToUser:", -[NTKUpNextCollectionViewFlowLayoutAttributes fullyVisibleToUser](self, "fullyVisibleToUser"));
  return v4;
}

- (double)darkeningAlphaUniform
{
  return self->_darkeningAlphaUniform;
}

- (void)setDarkeningAlphaUniform:(double)a3
{
  self->_darkeningAlphaUniform = a3;
}

- (CGRect)unitFrameOnScreen
{
  double x = self->_unitFrameOnScreen.origin.x;
  double y = self->_unitFrameOnScreen.origin.y;
  double width = self->_unitFrameOnScreen.size.width;
  double height = self->_unitFrameOnScreen.size.height;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- (void)setUnitFrameOnScreen:(CGRect)a3
{
  self->_unitFrameOnScreen = a3;
}

- (double)shadowAlpha
{
  return self->_shadowAlpha;
}

- (void)setShadowAlpha:(double)a3
{
  self->_shadowAlpha = a3;
}

- (CGRect)computedFrame
{
  double x = self->_computedFrame.origin.x;
  double y = self->_computedFrame.origin.y;
  double width = self->_computedFrame.size.width;
  double height = self->_computedFrame.size.height;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- (void)setComputedFrame:(CGRect)a3
{
  self->_computedFrame = a3;
}

- (double)scale
{
  return self->_scale;
}

- (void)setScale:(double)a3
{
  self->_scale = a3;
}

- (int64_t)layoutMode
{
  return self->_layoutMode;
}

- (void)setLayoutMode:(int64_t)a3
{
  self->_layoutMode = a3;
}

- (BOOL)notVisibleToUser
{
  return self->_notVisibleToUser;
}

- (void)setNotVisibleToUser:(BOOL)a3
{
  self->_notVisibleToUser = a3;
}

- (BOOL)fullyVisibleToUser
{
  return self->_fullyVisibleToUser;
}

- (void)setFullyVisibleToUser:(BOOL)a3
{
  self->_fullyVisibleToUser = a3;
}

@end