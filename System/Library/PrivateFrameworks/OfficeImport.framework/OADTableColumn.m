@interface OADTableColumn
- (float)width;
- (id)description;
- (void)setWidth:(float)a3;
@end

@implementation OADTableColumn

- (void)setWidth:(float)a3
{
  self->mWidth = a3;
}

- (float)width
{
  return self->mWidth;
}

- (id)description
{
  v4.receiver = self;
  v4.super_class = (Class)OADTableColumn;
  v2 = [(OADTableColumn *)&v4 description];
  return v2;
}

@end