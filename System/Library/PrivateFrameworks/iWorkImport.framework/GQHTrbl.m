@interface GQHTrbl
- (GQHTrbl)init;
- (__CFString)createStringRef;
- (int)bottom;
- (int)left;
- (int)right;
- (int)top;
- (void)setBottom:(int)a3;
- (void)setLeft:(int)a3;
- (void)setRight:(int)a3;
- (void)setTop:(int)a3;
- (void)setTop:(int)a3 right:(int)a4 bottom:(int)a5 left:(int)a6;
@end

@implementation GQHTrbl

- (GQHTrbl)init
{
  v3.receiver = self;
  v3.super_class = (Class)GQHTrbl;
  result = [(GQHTrbl *)&v3 init];
  if (result)
  {
    *(void *)&result->mTop = 0;
    *(void *)&result->mBottom = 0;
  }
  return result;
}

- (void)setTop:(int)a3 right:(int)a4 bottom:(int)a5 left:(int)a6
{
  self->mTop = a3;
  self->mRight = a4;
  self->mBottom = a5;
  self->mLeft = a6;
}

- (void)setTop:(int)a3
{
  self->mTop = a3;
}

- (int)top
{
  return self->mTop;
}

- (void)setRight:(int)a3
{
  self->mRight = a3;
}

- (int)right
{
  return self->mRight;
}

- (void)setBottom:(int)a3
{
  self->mBottom = a3;
}

- (int)bottom
{
  return self->mBottom;
}

- (void)setLeft:(int)a3
{
  self->mLeft = a3;
}

- (int)left
{
  return self->mLeft;
}

- (__CFString)createStringRef
{
  return (__CFString *)CFStringCreateWithFormat(0, 0, @"%dpx %dpx %dpx %dpx", self->mTop, self->mRight, self->mBottom, self->mLeft);
}

@end