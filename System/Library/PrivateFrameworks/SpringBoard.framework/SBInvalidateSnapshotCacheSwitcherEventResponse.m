@interface SBInvalidateSnapshotCacheSwitcherEventResponse
- (NSArray)displayItems;
- (SBInvalidateSnapshotCacheSwitcherEventResponse)initWithDisplayItems:(id)a3;
- (id)descriptionBuilderWithMultilinePrefix:(id)a3;
- (int64_t)type;
@end

@implementation SBInvalidateSnapshotCacheSwitcherEventResponse

- (int64_t)type
{
  return 29;
}

- (SBInvalidateSnapshotCacheSwitcherEventResponse)initWithDisplayItems:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)SBInvalidateSnapshotCacheSwitcherEventResponse;
  v5 = [(SBChainableModifierEventResponse *)&v9 init];
  if (v5)
  {
    uint64_t v6 = [v4 copy];
    displayItems = v5->_displayItems;
    v5->_displayItems = (NSArray *)v6;
  }
  return v5;
}

- (id)descriptionBuilderWithMultilinePrefix:(id)a3
{
  v8.receiver = self;
  v8.super_class = (Class)SBInvalidateSnapshotCacheSwitcherEventResponse;
  id v4 = [(SBChainableModifierEventResponse *)&v8 descriptionBuilderWithMultilinePrefix:a3];
  v5 = v4;
  displayItems = self->_displayItems;
  if (displayItems) {
    [v4 appendArraySection:displayItems withName:@"displayItems" skipIfEmpty:0];
  }
  else {
    [v4 appendString:@"(all)" withName:@"displayItems"];
  }
  return v5;
}

- (NSArray)displayItems
{
  return self->_displayItems;
}

- (void).cxx_destruct
{
}

@end