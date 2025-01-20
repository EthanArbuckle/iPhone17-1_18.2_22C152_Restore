@interface SBWidgetExtensionDebugSearchResult
- (NSString)kind;
- (SBWidgetExtensionDebugSearchResult)initWithKind:(id)a3;
- (SBWidgetExtensionDebugSearchResult)initWithKind:(id)a3 family:(int64_t)a4;
- (int64_t)family;
@end

@implementation SBWidgetExtensionDebugSearchResult

- (SBWidgetExtensionDebugSearchResult)initWithKind:(id)a3
{
  return [(SBWidgetExtensionDebugSearchResult *)self initWithKind:a3 family:0];
}

- (SBWidgetExtensionDebugSearchResult)initWithKind:(id)a3 family:(int64_t)a4
{
  id v6 = a3;
  v11.receiver = self;
  v11.super_class = (Class)SBWidgetExtensionDebugSearchResult;
  v7 = [(SBWidgetExtensionDebugSearchResult *)&v11 init];
  if (v7)
  {
    uint64_t v8 = [v6 copy];
    kind = v7->_kind;
    v7->_kind = (NSString *)v8;

    v7->_family = a4;
  }

  return v7;
}

- (NSString)kind
{
  return self->_kind;
}

- (int64_t)family
{
  return self->_family;
}

- (void).cxx_destruct
{
}

@end