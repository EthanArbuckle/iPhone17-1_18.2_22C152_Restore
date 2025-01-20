@interface PKSecureElementConsistencyCheckResult
- (NSArray)registerRegions;
- (NSArray)requestedActions;
- (NSDictionary)summary;
- (PKSecureElementConsistencyCheckResult)initWithCleanupActions:(int64_t)a3 resultsSummary:(id)a4 requestedActions:(id)a5 registeredRegions:(id)a6;
- (id)description;
- (int64_t)cleanupActions;
@end

@implementation PKSecureElementConsistencyCheckResult

- (PKSecureElementConsistencyCheckResult)initWithCleanupActions:(int64_t)a3 resultsSummary:(id)a4 requestedActions:(id)a5 registeredRegions:(id)a6
{
  id v10 = a4;
  id v11 = a5;
  id v12 = a6;
  v13 = [(PKSecureElementConsistencyCheckResult *)self init];
  if (v13)
  {
    id v14 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
    v15 = v14;
    if (v10) {
      [v14 setObject:v10 forKeyedSubscript:@"state"];
    }
    if (v12) {
      [v15 setObject:v12 forKeyedSubscript:@"registeredRegions"];
    }
    v13->_cleanupActions = a3;
    uint64_t v16 = [v15 copy];
    summary = v13->_summary;
    v13->_summary = (NSDictionary *)v16;

    objc_storeStrong((id *)&v13->_requestedActions, a5);
  }

  return v13;
}

- (id)description
{
  v3 = [MEMORY[0x1E4F28E78] stringWithFormat:@"<%@: %p; ", objc_opt_class(), self];
  v4 = PKConsistencyCheckCleanupActionsToString(self->_cleanupActions);
  [v3 appendFormat:@"cleanupActions: '%@'; ", v4];

  [v3 appendFormat:@"registerRegions: '%@'; ", self->_registerRegions];
  [v3 appendFormat:@"requestedActions: '%@'; ", self->_requestedActions];
  [v3 appendFormat:@"summary: '%@'; ", self->_summary];
  [v3 appendFormat:@">"];
  v5 = (void *)[v3 copy];

  return v5;
}

- (NSArray)requestedActions
{
  return self->_requestedActions;
}

- (int64_t)cleanupActions
{
  return self->_cleanupActions;
}

- (NSDictionary)summary
{
  return self->_summary;
}

- (NSArray)registerRegions
{
  return self->_registerRegions;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_registerRegions, 0);
  objc_storeStrong((id *)&self->_summary, 0);
  objc_storeStrong((id *)&self->_requestedActions, 0);
}

@end