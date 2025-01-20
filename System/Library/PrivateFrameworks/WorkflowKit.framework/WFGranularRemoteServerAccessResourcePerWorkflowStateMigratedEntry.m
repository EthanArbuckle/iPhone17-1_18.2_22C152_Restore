@interface WFGranularRemoteServerAccessResourcePerWorkflowStateMigratedEntry
+ (BOOL)supportsSecureCoding;
- (WFGranularRemoteServerAccessResourcePerWorkflowStateMigratedEntry)initWithCoder:(id)a3;
@end

@implementation WFGranularRemoteServerAccessResourcePerWorkflowStateMigratedEntry

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->host, 0);
  objc_storeStrong((id *)&self->authorized, 0);
}

- (WFGranularRemoteServerAccessResourcePerWorkflowStateMigratedEntry)initWithCoder:(id)a3
{
  id v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)WFGranularRemoteServerAccessResourcePerWorkflowStateMigratedEntry;
  v5 = [(WFGranularRemoteServerAccessResourcePerWorkflowStateMigratedEntry *)&v12 init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"isAuthorized"];
    authorized = v5->authorized;
    v5->authorized = (NSNumber *)v6;

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"host"];
    host = v5->host;
    v5->host = (NSString *)v8;

    v10 = v5;
  }

  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end