@interface OADConnection
- (id)description;
- (int)locationIndex;
- (unsigned)drawableId;
- (void)setDrawableId:(unsigned int)a3;
- (void)setLocationIndex:(int)a3;
@end

@implementation OADConnection

- (void)setDrawableId:(unsigned int)a3
{
  self->mDrawableId = a3;
}

- (void)setLocationIndex:(int)a3
{
  self->mLocationIndex = a3;
}

- (unsigned)drawableId
{
  return self->mDrawableId;
}

- (int)locationIndex
{
  return self->mLocationIndex;
}

- (id)description
{
  v4.receiver = self;
  v4.super_class = (Class)OADConnection;
  v2 = [(OADConnection *)&v4 description];
  return v2;
}

@end