@interface SXComponentBookmark
- (NSString)componentIdentifier;
- (SXComponentBookmark)initWithComponentIdentifier:(id)a3;
@end

@implementation SXComponentBookmark

- (SXComponentBookmark)initWithComponentIdentifier:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)SXComponentBookmark;
  v5 = [(SXComponentBookmark *)&v9 init];
  if (v5)
  {
    uint64_t v6 = [v4 copy];
    componentIdentifier = v5->_componentIdentifier;
    v5->_componentIdentifier = (NSString *)v6;
  }
  return v5;
}

- (NSString)componentIdentifier
{
  return self->_componentIdentifier;
}

- (void).cxx_destruct
{
}

@end