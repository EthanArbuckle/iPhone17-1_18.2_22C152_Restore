@interface SXComponentTraitsProvider
- (SXComponentTraitsProvider)initWithDOMObjectProvider:(id)a3;
- (SXDOMObjectProviding)DOMObjectProvider;
- (unint64_t)traitsForComponent:(id)a3;
@end

@implementation SXComponentTraitsProvider

- (SXComponentTraitsProvider)initWithDOMObjectProvider:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)SXComponentTraitsProvider;
  v6 = [(SXComponentTraitsProvider *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_DOMObjectProvider, a3);
  }

  return v7;
}

- (unint64_t)traitsForComponent:(id)a3
{
  id v4 = a3;
  unint64_t v5 = [v4 traits];
  v6 = [v4 style];

  if (v6)
  {
    v7 = [(SXComponentTraitsProvider *)self DOMObjectProvider];
    v8 = [v7 componentStyleForComponent:v4];

    if (([v8 traits] & 6) != 0) {
      v5 |= 0x2AuLL;
    }
  }
  return v5;
}

- (SXDOMObjectProviding)DOMObjectProvider
{
  return self->_DOMObjectProvider;
}

- (void).cxx_destruct
{
}

@end