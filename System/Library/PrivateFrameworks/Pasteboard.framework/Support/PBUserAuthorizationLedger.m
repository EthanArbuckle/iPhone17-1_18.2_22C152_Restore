@interface PBUserAuthorizationLedger
- (NSMutableDictionary)authorizationRecords;
- (PBUserAuthorizationLedger)init;
- (unint64_t)authorizationDecisionForAuditTokenInfo:(id)a3 timestamp:(unint64_t)a4;
- (void)recordUserAuthorizationDecision:(BOOL)a3 auditTokenInfo:(id)a4;
@end

@implementation PBUserAuthorizationLedger

- (PBUserAuthorizationLedger)init
{
  v6.receiver = self;
  v6.super_class = (Class)PBUserAuthorizationLedger;
  v2 = [(PBUserAuthorizationLedger *)&v6 init];
  if (v2)
  {
    uint64_t v3 = objc_opt_new();
    authorizationRecords = v2->_authorizationRecords;
    v2->_authorizationRecords = (NSMutableDictionary *)v3;
  }
  return v2;
}

- (void)recordUserAuthorizationDecision:(BOOL)a3 auditTokenInfo:(id)a4
{
  BOOL v4 = a3;
  id v9 = a4;
  PBAssertIsOnCallbackQueue();
  objc_super v6 = [v9 persistentIdentifier];
  if (v6 || ([v9 bundleID], (objc_super v6 = objc_claimAutoreleasedReturnValue()) != 0))
  {
    v7 = [[PBUserAuthorizationRecord alloc] initWithPasteAllowed:v4];
    v8 = [(PBUserAuthorizationLedger *)self authorizationRecords];
    [v8 setObject:v7 forKeyedSubscript:v6];
  }
}

- (unint64_t)authorizationDecisionForAuditTokenInfo:(id)a3 timestamp:(unint64_t)a4
{
  id v6 = a3;
  PBAssertIsOnCallbackQueue();
  v7 = [v6 persistentIdentifier];
  if (!v7)
  {
    v7 = [v6 bundleID];
    if (!v7)
    {
      id v9 = 0;
      goto LABEL_11;
    }
  }
  v8 = [(PBUserAuthorizationLedger *)self authorizationRecords];
  id v9 = [v8 objectForKeyedSubscript:v7];

  if (!v9) {
    goto LABEL_11;
  }
  if ([v9 pasteWasAllowed])
  {
    unint64_t v10 = 37;
    goto LABEL_12;
  }
  if ((unint64_t)[v9 timestamp] >= a4)
  {
LABEL_11:
    unint64_t v10 = 41;
    goto LABEL_12;
  }
  mach_timebase_info info = 0;
  mach_timebase_info(&info);
  LODWORD(v11) = info.denom;
  LODWORD(v12) = info.numer;
  if (a4 - (unint64_t)((double)v11 * 1000000000.0 / (double)v12) <= (unint64_t)[v9 timestamp])unint64_t v10 = 38; {
  else
  }
    unint64_t v10 = 41;
LABEL_12:

  return v10;
}

- (NSMutableDictionary)authorizationRecords
{
  return (NSMutableDictionary *)objc_getProperty(self, a2, 8, 1);
}

- (void).cxx_destruct
{
}

@end