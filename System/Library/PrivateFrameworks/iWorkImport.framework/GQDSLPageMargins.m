@interface GQDSLPageMargins
- (float)footer;
- (float)header;
- (void)setBottom:(float)a3;
- (void)setFooter:(float)a3;
- (void)setHeader:(float)a3;
- (void)setLeft:(float)a3;
- (void)setRight:(float)a3;
- (void)setTop:(float)a3;
@end

@implementation GQDSLPageMargins

- (float)header
{
  return self->mHeader;
}

- (void)setHeader:(float)a3
{
  self->mHeader = a3;
}

- (float)footer
{
  return self->mFooter;
}

- (void)setFooter:(float)a3
{
  self->mFooter = a3;
}

- (void)setTop:(float)a3
{
  self->super.mTop = a3;
}

- (void)setBottom:(float)a3
{
  self->super.mBottom = a3;
}

- (void)setLeft:(float)a3
{
  self->super.mLeft = a3;
}

- (void)setRight:(float)a3
{
  self->super.mRight = a3;
}

@end