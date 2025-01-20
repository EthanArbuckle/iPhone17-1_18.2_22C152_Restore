@interface OrderedWBTabWrapper
- (BOOL)isEqual:(id)a3;
- (BOOL)isPinnedTab;
- (BOOL)shouldSelectOriginatingTabWhenClosed;
- (NSArray)ancestorTabIdentifiers;
- (NSString)identifier;
- (NSString)windowIdentifier;
- (OrderedWBTabWrapper)initWithWBTab:(id)a3;
- (WBTab)tab;
- (double)lastActivationTime;
- (unint64_t)hash;
@end

@implementation OrderedWBTabWrapper

- (OrderedWBTabWrapper)initWithWBTab:(id)a3
{
  id v5 = a3;
  if (v5
    && (v9.receiver = self,
        v9.super_class = (Class)OrderedWBTabWrapper,
        v6 = [(OrderedWBTabWrapper *)&v9 init],
        (self = v6) != 0))
  {
    objc_storeStrong((id *)&v6->_tab, a3);
    self = self;
    v7 = self;
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (NSArray)ancestorTabIdentifiers
{
  v2 = [(WBTab *)self->_tab localAttributes];
  v3 = [v2 ancestorTabUUIDs];

  return (NSArray *)v3;
}

- (NSString)identifier
{
  return (NSString *)[(WBTab *)self->_tab uuid];
}

- (BOOL)isPinnedTab
{
  return [(WBTab *)self->_tab isPinned];
}

- (double)lastActivationTime
{
  [(WBTab *)self->_tab lastViewedTime];
  return result;
}

- (BOOL)shouldSelectOriginatingTabWhenClosed
{
  return 0;
}

- (NSString)windowIdentifier
{
  v2 = [(WBTab *)self->_tab localAttributes];
  v3 = [v2 windowUUID];

  return (NSString *)v3;
}

- (BOOL)isEqual:(id)a3
{
  v4 = (OrderedWBTabWrapper *)a3;
  if (self == v4)
  {
    char v6 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v5 = [(OrderedWBTabWrapper *)v4 tab];
      char v6 = WBSIsEqual();
    }
    else
    {
      char v6 = 0;
    }
  }

  return v6;
}

- (unint64_t)hash
{
  return [(WBTab *)self->_tab hash];
}

- (WBTab)tab
{
  return self->_tab;
}

- (void).cxx_destruct
{
}

@end