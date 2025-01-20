@interface REElementUserActivityShortcutAction
- (BOOL)isEqual:(id)a3;
- (BOOL)isLocalDonation;
- (REElementUserActivityShortcutAction)initWithUserActivity:(id)a3 applicationID:(id)a4 isLocalDonation:(BOOL)a5;
- (id)copyWithZone:(_NSZone *)a3;
- (unint64_t)hash;
- (void)_submitMetricsWithSuccess:(BOOL)a3;
@end

@implementation REElementUserActivityShortcutAction

- (REElementUserActivityShortcutAction)initWithUserActivity:(id)a3 applicationID:(id)a4 isLocalDonation:(BOOL)a5
{
  v7.receiver = self;
  v7.super_class = (Class)REElementUserActivityShortcutAction;
  result = [(REElementUserActivityAction *)&v7 initWithUserActivity:a3 applicationID:a4];
  if (result) {
    result->_isLocalDonation = a5;
  }
  return result;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v5.receiver = self;
  v5.super_class = (Class)REElementUserActivityShortcutAction;
  id result = [(REElementUserActivityShortcutAction *)&v5 copy];
  *((unsigned char *)result + 40) = self->_isLocalDonation;
  return result;
}

- (void)_submitMetricsWithSuccess:(BOOL)a3
{
  BOOL v3 = a3;
  id v12 = [MEMORY[0x263EFF9A0] dictionaryWithCapacity:6];
  [v12 setObject:@"activityAppLaunch" forKey:@"actionType"];
  BOOL v5 = [(REElementUserActivityShortcutAction *)self isLocalDonation];
  v6 = RELocal;
  if (!v5) {
    v6 = RERemote;
  }
  [v12 setObject:*v6 forKey:@"deviceSource"];
  objc_super v7 = RETrue;
  if (!v3) {
    objc_super v7 = REFalse;
  }
  [v12 setObject:*v7 forKey:@"success"];
  uint64_t v8 = [(REElementUserActivityAction *)self applicationID];
  v9 = (void *)v8;
  v10 = @"unknown";
  if (v8) {
    v10 = (__CFString *)v8;
  }
  v11 = v10;

  [v12 setObject:v11 forKey:@"bundleID"];
  RESubmitShortcutExecution(v12);
}

- (unint64_t)hash
{
  v3.receiver = self;
  v3.super_class = (Class)REElementUserActivityShortcutAction;
  return [(REElementUserActivityAction *)&v3 hash] ^ self->_isLocalDonation;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    BOOL v5 = (unsigned __int8 *)v4;
    v8.receiver = self;
    v8.super_class = (Class)REElementUserActivityShortcutAction;
    if ([(REElementUserActivityAction *)&v8 isEqual:v5]) {
      BOOL v6 = self->_isLocalDonation == v5[40];
    }
    else {
      BOOL v6 = 0;
    }
  }
  else
  {
    BOOL v6 = 0;
  }

  return v6;
}

- (BOOL)isLocalDonation
{
  return self->_isLocalDonation;
}

@end