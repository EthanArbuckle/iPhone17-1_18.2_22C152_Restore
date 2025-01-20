@interface REUpNextCollectionViewFlowLayoutAttributes
- (BOOL)isEqual:(id)a3;
- (CGRect)unitFrameOnScreen;
- (id)copyWithZone:(_NSZone *)a3;
- (unint64_t)hash;
- (void)setUnitFrameOnScreen:(CGRect)a3;
@end

@implementation REUpNextCollectionViewFlowLayoutAttributes

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0
    && (v11.receiver = self,
        v11.super_class = (Class)REUpNextCollectionViewFlowLayoutAttributes,
        [(UICollectionViewLayoutAttributes *)&v11 isEqual:v4]))
  {
    [v4 unitFrameOnScreen];
    v12.origin.x = v5;
    v12.origin.y = v6;
    v12.size.width = v7;
    v12.size.height = v8;
    BOOL v9 = CGRectEqualToRect(self->_unitFrameOnScreen, v12);
  }
  else
  {
    BOOL v9 = 0;
  }

  return v9;
}

- (unint64_t)hash
{
  v7.receiver = self;
  v7.super_class = (Class)REUpNextCollectionViewFlowLayoutAttributes;
  unint64_t v3 = [(UICollectionViewLayoutAttributes *)&v7 hash];
  id v4 = objc_msgSend(MEMORY[0x263F08D40], "valueWithCGRect:", self->_unitFrameOnScreen.origin.x, self->_unitFrameOnScreen.origin.y, self->_unitFrameOnScreen.size.width, self->_unitFrameOnScreen.size.height);
  unint64_t v5 = [v4 hash] ^ v3;

  return v5;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v6.receiver = self;
  v6.super_class = (Class)REUpNextCollectionViewFlowLayoutAttributes;
  id v4 = [(UICollectionViewLayoutAttributes *)&v6 copyWithZone:a3];
  [(REUpNextCollectionViewFlowLayoutAttributes *)self unitFrameOnScreen];
  objc_msgSend(v4, "setUnitFrameOnScreen:");
  return v4;
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

@end