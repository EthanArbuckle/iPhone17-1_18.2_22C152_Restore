@interface SBCustomPlaceholderIcon
- (NSString)reason;
- (SBCustomPlaceholderIcon)initWithReason:(id)a3;
@end

@implementation SBCustomPlaceholderIcon

- (SBCustomPlaceholderIcon)initWithReason:(id)a3
{
  id v4 = a3;
  v5 = (void *)[[NSString alloc] initWithFormat:@"Placeholder: %@", v4];
  v10.receiver = self;
  v10.super_class = (Class)SBCustomPlaceholderIcon;
  v6 = [(SBPlaceholderIcon *)&v10 _initWithNodeIdentifier:v5 icon:0];
  if (v6)
  {
    uint64_t v7 = [v4 copy];
    reason = v6->_reason;
    v6->_reason = (NSString *)v7;
  }
  return v6;
}

- (NSString)reason
{
  return self->_reason;
}

- (void).cxx_destruct
{
}

@end