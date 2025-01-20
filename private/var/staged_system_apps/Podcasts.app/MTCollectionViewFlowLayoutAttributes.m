@interface MTCollectionViewFlowLayoutAttributes
- (BOOL)isEqual:(id)a3;
- (BOOL)isFloating;
- (BOOL)isOpen;
- (BOOL)isPartiallyOffTheTop;
- (BOOL)showsSeperator;
- (CGRect)naturalRect;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (unint64_t)hash;
- (void)setFloating:(BOOL)a3;
- (void)setNaturalRect:(CGRect)a3;
- (void)setOpen:(BOOL)a3;
- (void)setPartiallyOffTheTop:(BOOL)a3;
- (void)setShowsSeperator:(BOOL)a3;
@end

@implementation MTCollectionViewFlowLayoutAttributes

- (unint64_t)hash
{
  v7.receiver = self;
  v7.super_class = (Class)MTCollectionViewFlowLayoutAttributes;
  unint64_t v3 = [(MTCollectionViewFlowLayoutAttributes *)&v7 hash];
  uint64_t v4 = self->_floating - v3 + 32 * v3;
  uint64_t v5 = self->_open - v4 + 32 * v4;
  return self->_showsSeperator - v5 + 32 * v5 + 923521;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0
    && (v23.receiver = self,
        v23.super_class = (Class)MTCollectionViewFlowLayoutAttributes,
        [(MTCollectionViewFlowLayoutAttributes *)&v23 isEqual:v4])
    && (unsigned int v5 = [v4 isFloating],
        v5 == [(MTCollectionViewFlowLayoutAttributes *)self isFloating])
    && (unsigned int v6 = [v4 isPartiallyOffTheTop],
        v6 == [(MTCollectionViewFlowLayoutAttributes *)self isPartiallyOffTheTop])
    && (unsigned int v7 = [v4 isOpen],
        v7 == [(MTCollectionViewFlowLayoutAttributes *)self isOpen])
    && (unsigned int v8 = [v4 showsSeperator],
        v8 == [(MTCollectionViewFlowLayoutAttributes *)self showsSeperator]))
  {
    [v4 naturalRect];
    CGFloat v12 = v11;
    CGFloat v14 = v13;
    CGFloat v16 = v15;
    CGFloat v18 = v17;
    [(MTCollectionViewFlowLayoutAttributes *)self naturalRect];
    v25.origin.x = v19;
    v25.origin.y = v20;
    v25.size.width = v21;
    v25.size.height = v22;
    v24.origin.x = v12;
    v24.origin.y = v14;
    v24.size.width = v16;
    v24.size.height = v18;
    BOOL v9 = CGRectEqualToRect(v24, v25);
  }
  else
  {
    BOOL v9 = 0;
  }

  return v9;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v6.receiver = self;
  v6.super_class = (Class)MTCollectionViewFlowLayoutAttributes;
  id v4 = [(MTCollectionViewFlowLayoutAttributes *)&v6 copyWithZone:a3];
  [v4 setFloating:[self isFloating]];
  [v4 setOpen:[self isOpen]];
  [v4 setShowsSeperator:[self showsSeperator]];
  return v4;
}

- (id)description
{
  v6.receiver = self;
  v6.super_class = (Class)MTCollectionViewFlowLayoutAttributes;
  unint64_t v3 = [(MTCollectionViewFlowLayoutAttributes *)&v6 description];
  id v4 = [v3 stringByAppendingFormat:@" Floating %i, Open %i, Shows Seperator %i", -[MTCollectionViewFlowLayoutAttributes isFloating](self, "isFloating"), -[MTCollectionViewFlowLayoutAttributes isOpen](self, "isOpen"), -[MTCollectionViewFlowLayoutAttributes showsSeperator](self, "showsSeperator")];

  return v4;
}

- (BOOL)isFloating
{
  return self->_floating;
}

- (void)setFloating:(BOOL)a3
{
  self->_floating = a3;
}

- (BOOL)isPartiallyOffTheTop
{
  return self->_partiallyOffTheTop;
}

- (void)setPartiallyOffTheTop:(BOOL)a3
{
  self->_partiallyOffTheTop = a3;
}

- (BOOL)isOpen
{
  return self->_open;
}

- (void)setOpen:(BOOL)a3
{
  self->_open = a3;
}

- (BOOL)showsSeperator
{
  return self->_showsSeperator;
}

- (void)setShowsSeperator:(BOOL)a3
{
  self->_showsSeperator = a3;
}

- (CGRect)naturalRect
{
  double x = self->_naturalRect.origin.x;
  double y = self->_naturalRect.origin.y;
  double width = self->_naturalRect.size.width;
  double height = self->_naturalRect.size.height;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- (void)setNaturalRect:(CGRect)a3
{
  self->_naturalRect = a3;
}

@end