@interface PBFDataRefreshState
- (BOOL)needsRefresh;
- (NSString)refreshReason;
- (PBFDataRefreshState)initWithNeedsRefresh:(BOOL)a3 reason:(id)a4;
- (id)description;
@end

@implementation PBFDataRefreshState

- (PBFDataRefreshState)initWithNeedsRefresh:(BOOL)a3 reason:(id)a4
{
  v14 = &v15;
  v6 = (objc_class *)NSString;
  id v7 = a4;
  v8 = (void *)[[v6 alloc] initWithFormat:v7 arguments:&v15];

  v13.receiver = self;
  v13.super_class = (Class)PBFDataRefreshState;
  v9 = [(PBFDataRefreshState *)&v13 init];
  if (v9)
  {
    uint64_t v10 = [v8 copy];
    refreshReason = v9->_refreshReason;
    v9->_refreshReason = (NSString *)v10;

    v9->_needsRefresh = a3;
  }

  return v9;
}

- (id)description
{
  v3 = [MEMORY[0x1E4F4F718] builderWithObject:self];
  id v4 = (id)[v3 appendBool:self->_needsRefresh withName:@"needsRefresh"];
  [v3 appendString:self->_refreshReason withName:@"refreshReason"];
  v5 = [v3 build];

  return v5;
}

- (BOOL)needsRefresh
{
  return self->_needsRefresh;
}

- (NSString)refreshReason
{
  return self->_refreshReason;
}

- (void).cxx_destruct
{
}

@end