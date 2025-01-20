@interface OCDDelayedNode
- (BOOL)isLoaded;
- (BOOL)load;
- (id)delayedContext;
- (void)setDelayedContext:(id)a3;
- (void)setLoaded:(BOOL)a3;
@end

@implementation OCDDelayedNode

- (void)setDelayedContext:(id)a3
{
  v5 = (OCDDelayedNodeContext *)a3;
  mDelayedContext = self->mDelayedContext;
  p_mDelayedContext = &self->mDelayedContext;
  if (mDelayedContext != v5)
  {
    v8 = v5;
    objc_storeStrong((id *)p_mDelayedContext, a3);
    v5 = v8;
  }
}

- (BOOL)load
{
  if ([(OCDDelayedNode *)self isLoaded])
  {
    LOBYTE(v3) = 1;
  }
  else
  {
    int v3 = [(OCDDelayedNodeContext *)self->mDelayedContext loadDelayedNode:self];
    if (v3)
    {
      mDelayedContext = self->mDelayedContext;
      self->mDelayedContext = 0;

      LOBYTE(v3) = 1;
      self->mLoaded = 1;
    }
  }
  return v3;
}

- (BOOL)isLoaded
{
  return self->mLoaded || self->mDelayedContext == 0;
}

- (void)setLoaded:(BOOL)a3
{
  self->mLoaded = a3;
}

- (id)delayedContext
{
  return self->mDelayedContext;
}

- (void).cxx_destruct
{
}

@end