@interface MKTableColumn
- (int)width;
- (void)adjustWidthToFit:(int)a3;
- (void)setWidth:(int)a3;
@end

@implementation MKTableColumn

- (void)adjustWidthToFit:(int)a3
{
  uint64_t v3 = *(void *)&a3;
  if ([(MKTableColumn *)self width] < a3)
  {
    [(MKTableColumn *)self setWidth:v3];
  }
}

- (int)width
{
  return self->_width;
}

- (void)setWidth:(int)a3
{
  self->_width = a3;
}

@end