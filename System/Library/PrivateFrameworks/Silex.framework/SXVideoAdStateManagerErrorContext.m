@interface SXVideoAdStateManagerErrorContext
- (NSError)error;
- (SXVideoAdStateManagerErrorContext)initWithError:(id)a3;
@end

@implementation SXVideoAdStateManagerErrorContext

- (SXVideoAdStateManagerErrorContext)initWithError:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)SXVideoAdStateManagerErrorContext;
  v6 = [(SXVideoAdStateManagerErrorContext *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_error, a3);
  }

  return v7;
}

- (NSError)error
{
  return self->_error;
}

- (void).cxx_destruct
{
}

@end