@interface SBHLibraryCategoryMapProviderRefreshRequest
- (BOOL)hasFailedSeveralTimes;
- (NSString)requestReason;
- (NSString)senderDescription;
- (SBHLibraryCategoryMapProviderRefreshRequest)initWithOptions:(unint64_t)a3 reason:(id)a4;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)failureForSessionIdentifier:(int64_t)a3;
- (unint64_t)failureCount;
- (unint64_t)options;
- (void)accumulateFailure:(id)a3 forSession:(unint64_t)a4;
- (void)setRequestReason:(id)a3;
- (void)setSenderDescription:(id)a3;
@end

@implementation SBHLibraryCategoryMapProviderRefreshRequest

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_senderDescription, 0);
  objc_storeStrong((id *)&self->_requestReason, 0);
  objc_storeStrong((id *)&self->_failures, 0);
}

- (SBHLibraryCategoryMapProviderRefreshRequest)initWithOptions:(unint64_t)a3 reason:(id)a4
{
  id v6 = a4;
  v12.receiver = self;
  v12.super_class = (Class)SBHLibraryCategoryMapProviderRefreshRequest;
  v7 = [(SBHLibraryCategoryMapProviderRefreshRequest *)&v12 init];
  v8 = v7;
  if (v7)
  {
    v7->_options = a3;
    uint64_t v9 = [v6 copy];
    requestReason = v8->_requestReason;
    v8->_requestReason = (NSString *)v9;
  }
  return v8;
}

- (unint64_t)options
{
  return self->_options;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v4 = [+[SBHLibraryCategoryMapProviderRefreshRequest allocWithZone:a3] initWithOptions:self->_options reason:self->_requestReason];
  uint64_t v5 = [(NSMutableDictionary *)self->_failures mutableCopy];
  failures = v4->_failures;
  v4->_failures = (NSMutableDictionary *)v5;

  return v4;
}

- (id)description
{
  v3 = [MEMORY[0x1E4F4F718] builderWithObject:self];
  id v4 = (id)[v3 appendObject:self->_requestReason withName:@"requestReason"];
  uint64_t v5 = NSDictionaryFromSBHLibraryCategoryMapRefreshOptions(self->_options);
  [v3 appendDictionarySection:v5 withName:@"options" skipIfEmpty:0];

  [v3 appendDictionarySection:self->_failures withName:@"failures" skipIfEmpty:1];
  id v6 = [v3 build];

  return v6;
}

- (void)accumulateFailure:(id)a3 forSession:(unint64_t)a4
{
  id v10 = a3;
  failures = self->_failures;
  if (!failures)
  {
    v7 = (NSMutableDictionary *)objc_opt_new();
    v8 = self->_failures;
    self->_failures = v7;

    failures = self->_failures;
  }
  uint64_t v9 = [NSNumber numberWithUnsignedInteger:a4];
  [(NSMutableDictionary *)failures setObject:v10 forKeyedSubscript:v9];
}

- (unint64_t)failureCount
{
  return [(NSMutableDictionary *)self->_failures count];
}

- (id)failureForSessionIdentifier:(int64_t)a3
{
  failures = self->_failures;
  id v4 = [NSNumber numberWithInteger:a3];
  uint64_t v5 = [(NSMutableDictionary *)failures objectForKeyedSubscript:v4];

  return v5;
}

- (BOOL)hasFailedSeveralTimes
{
  return (unint64_t)[(NSMutableDictionary *)self->_failures count] > 2;
}

- (NSString)requestReason
{
  return self->_requestReason;
}

- (void)setRequestReason:(id)a3
{
}

- (NSString)senderDescription
{
  return self->_senderDescription;
}

- (void)setSenderDescription:(id)a3
{
}

@end