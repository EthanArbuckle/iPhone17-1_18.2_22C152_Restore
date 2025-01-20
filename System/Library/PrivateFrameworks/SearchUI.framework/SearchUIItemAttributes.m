@interface SearchUIItemAttributes
- (BOOL)isEqual:(id)a3;
- (BOOL)isForcingHeight;
- (id)copyWithZone:(_NSZone *)a3;
- (void)setIsForcingHeight:(BOOL)a3;
@end

@implementation SearchUIItemAttributes

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)SearchUIItemAttributes;
  if ([(UICollectionViewLayoutAttributes *)&v8 isEqual:v4])
  {
    BOOL v5 = [(SearchUIItemAttributes *)self isForcingHeight];
    int v6 = v5 ^ [v4 isForcingHeight] ^ 1;
  }
  else
  {
    LOBYTE(v6) = 0;
  }

  return v6;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v6.receiver = self;
  v6.super_class = (Class)SearchUIItemAttributes;
  id v4 = [(UICollectionViewLayoutAttributes *)&v6 copyWithZone:a3];
  objc_msgSend(v4, "setIsForcingHeight:", -[SearchUIItemAttributes isForcingHeight](self, "isForcingHeight"));
  return v4;
}

- (BOOL)isForcingHeight
{
  return self->_isForcingHeight;
}

- (void)setIsForcingHeight:(BOOL)a3
{
  self->_isForcingHeight = a3;
}

@end