@interface SBInCallTransientOverlayPresentationContext
- (SBInCallTransientOverlayPresentationContext)initWithRequestBuilder:(id)a3;
- (id)requestBuilder;
@end

@implementation SBInCallTransientOverlayPresentationContext

- (SBInCallTransientOverlayPresentationContext)initWithRequestBuilder:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)SBInCallTransientOverlayPresentationContext;
  v5 = [(SBInCallTransientOverlayPresentationContext *)&v9 init];
  if (v5)
  {
    uint64_t v6 = [v4 copy];
    id requestBuilder = v5->_requestBuilder;
    v5->_id requestBuilder = (id)v6;
  }
  return v5;
}

- (id)requestBuilder
{
  return self->_requestBuilder;
}

- (void).cxx_destruct
{
}

@end