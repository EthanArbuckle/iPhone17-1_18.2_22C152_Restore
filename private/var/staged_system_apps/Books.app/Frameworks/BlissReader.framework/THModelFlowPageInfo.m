@interface THModelFlowPageInfo
- (BOOL)hasBodyFlow;
- (Class)layoutClass;
- (Class)repClass;
- (void)setHasBodyFlow:(BOOL)a3;
@end

@implementation THModelFlowPageInfo

- (Class)layoutClass
{
  return (Class)objc_opt_class();
}

- (Class)repClass
{
  return (Class)objc_opt_class();
}

- (BOOL)hasBodyFlow
{
  return self->mHasBodyFlow;
}

- (void)setHasBodyFlow:(BOOL)a3
{
  self->mHasBodyFlow = a3;
}

@end