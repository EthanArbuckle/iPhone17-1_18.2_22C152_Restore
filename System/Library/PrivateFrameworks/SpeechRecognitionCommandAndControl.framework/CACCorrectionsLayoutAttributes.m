@interface CACCorrectionsLayoutAttributes
- (double)availableWidth;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (void)setAvailableWidth:(double)a3;
@end

@implementation CACCorrectionsLayoutAttributes

- (id)copyWithZone:(_NSZone *)a3
{
  v6.receiver = self;
  v6.super_class = (Class)CACCorrectionsLayoutAttributes;
  id v4 = [(UICollectionViewLayoutAttributes *)&v6 copyWithZone:a3];
  [(CACCorrectionsLayoutAttributes *)self availableWidth];
  objc_msgSend(v4, "setAvailableWidth:");
  return v4;
}

- (id)description
{
  v7.receiver = self;
  v7.super_class = (Class)CACCorrectionsLayoutAttributes;
  v3 = [(UICollectionViewLayoutAttributes *)&v7 description];
  [(CACCorrectionsLayoutAttributes *)self availableWidth];
  v5 = objc_msgSend(v3, "stringByAppendingFormat:", @"available width: %f", v4);;

  return v5;
}

- (double)availableWidth
{
  return self->_availableWidth;
}

- (void)setAvailableWidth:(double)a3
{
  self->_availableWidth = a3;
}

@end