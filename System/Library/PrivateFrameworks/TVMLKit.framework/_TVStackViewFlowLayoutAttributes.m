@interface _TVStackViewFlowLayoutAttributes
- (BOOL)isEqual:(id)a3;
- (double)showcaseFactor;
- (id)copyWithZone:(_NSZone *)a3;
- (void)setShowcaseFactor:(double)a3;
@end

@implementation _TVStackViewFlowLayoutAttributes

- (id)copyWithZone:(_NSZone *)a3
{
  v6.receiver = self;
  v6.super_class = (Class)_TVStackViewFlowLayoutAttributes;
  id v4 = [(UICollectionViewLayoutAttributes *)&v6 copyWithZone:a3];
  [(_TVStackViewFlowLayoutAttributes *)self showcaseFactor];
  objc_msgSend(v4, "setShowcaseFactor:");
  return v4;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)_TVStackViewFlowLayoutAttributes;
  if ([(UICollectionViewLayoutAttributes *)&v10 isEqual:v4])
  {
    [(_TVStackViewFlowLayoutAttributes *)self showcaseFactor];
    double v6 = v5;
    [v4 showcaseFactor];
    BOOL v8 = v6 == v7;
  }
  else
  {
    BOOL v8 = 0;
  }

  return v8;
}

- (double)showcaseFactor
{
  return self->_showcaseFactor;
}

- (void)setShowcaseFactor:(double)a3
{
  self->_showcaseFactor = a3;
}

@end