@interface STSGridTile
- (NSArray)smallIndexes;
- (NSNumber)largeIndex;
- (id)description;
- (int64_t)layoutStyle;
- (void)setLargeIndex:(id)a3;
- (void)setLayoutStyle:(int64_t)a3;
- (void)setSmallIndexes:(id)a3;
@end

@implementation STSGridTile

- (id)description
{
  v3 = NSString;
  v9.receiver = self;
  v9.super_class = (Class)STSGridTile;
  v4 = [(STSGridTile *)&v9 description];
  v5 = [(STSGridTile *)self smallIndexes];
  v6 = [(STSGridTile *)self largeIndex];
  v7 = [v3 stringWithFormat:@"%@, smallIndexes: %@, largeIndex: %@", v4, v5, v6];

  return v7;
}

- (NSArray)smallIndexes
{
  return self->_smallIndexes;
}

- (void)setSmallIndexes:(id)a3
{
}

- (NSNumber)largeIndex
{
  return self->_largeIndex;
}

- (void)setLargeIndex:(id)a3
{
}

- (int64_t)layoutStyle
{
  return self->_layoutStyle;
}

- (void)setLayoutStyle:(int64_t)a3
{
  self->_layoutStyle = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_largeIndex, 0);

  objc_storeStrong((id *)&self->_smallIndexes, 0);
}

@end