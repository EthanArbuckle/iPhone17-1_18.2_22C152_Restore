@interface FMDCommandContext
+ (id)intentContextKeyForAccessory:(id)a3;
+ (id)pendingActionKeyForAccessory:(id)a3;
- (BOOL)pendingAction;
- (FMDCommandContext)initWithAccessory:(id)a3;
- (FMDInternalAccessory)accessory;
- (NSDictionary)lastCompletedIntentDictionary;
- (NSUUID)pendingActionUUID;
- (id)description;
- (void)cleanupContexts;
- (void)setAccessory:(id)a3;
- (void)setActionCompleted:(id)a3;
- (void)setObject:(id)a3 forKey:(id)a4;
- (void)setPendingActionIntent:(id)a3;
@end

@implementation FMDCommandContext

- (FMDCommandContext)initWithAccessory:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)FMDCommandContext;
  v5 = [(FMDCommandContext *)&v8 init];
  v6 = v5;
  if (v5) {
    [(FMDCommandContext *)v5 setAccessory:v4];
  }

  return v6;
}

- (id)description
{
  uint64_t v3 = objc_opt_class();
  id v4 = [(FMDCommandContext *)self accessory];
  v5 = +[NSString stringWithFormat:@"%@(0x%p) with accessory(0x%p) ", v3, self, v4];

  return v5;
}

- (void)cleanupContexts
{
  id v6 = [(FMDCommandContext *)self accessory];
  if (v6)
  {
    v2 = +[FMDProtectedContextManager sharedManager];
    uint64_t v3 = [(id)objc_opt_class() intentContextKeyForAccessory:v6];
    [v2 cleanupAllContextsForKey:v3];

    id v4 = +[FMDProtectedContextManager sharedManager];
    v5 = [(id)objc_opt_class() pendingActionKeyForAccessory:v6];
    [v4 cleanupAllContextsForKey:v5];
  }
}

- (void)setObject:(id)a3 forKey:(id)a4
{
  id v9 = a3;
  id v5 = a4;
  id v6 = +[FMDProtectedContextManager sharedManager];
  [v6 cleanupAllContextsForKey:v5];

  v7 = +[FMDProtectedContextManager sharedManager];
  id v8 = [v7 saveContext:v9 forContextKey:v5 dataProtectionClass:4];
}

+ (id)intentContextKeyForAccessory:(id)a3
{
  uint64_t v3 = [a3 accessoryIdentifier];
  id v4 = +[NSString stringWithFormat:@"AccessoryIntent:%@", v3];

  return v4;
}

+ (id)pendingActionKeyForAccessory:(id)a3
{
  uint64_t v3 = [a3 accessoryIdentifier];
  id v4 = +[NSString stringWithFormat:@"AccessoryActionPending:%@", v3];

  return v4;
}

- (NSDictionary)lastCompletedIntentDictionary
{
  v2 = [(FMDCommandContext *)self accessory];
  if (v2)
  {
    uint64_t v3 = +[FMDProtectedContextManager sharedManager];
    id v4 = [(id)objc_opt_class() intentContextKeyForAccessory:v2];
    id v5 = [v3 contextForKey:v4 contextUUID:0 error:0];

    objc_opt_class();
    id v6 = 0;
    if (objc_opt_isKindOfClass()) {
      id v6 = v5;
    }
  }
  else
  {
    id v6 = 0;
  }

  return (NSDictionary *)v6;
}

- (NSUUID)pendingActionUUID
{
  v2 = [(FMDCommandContext *)self accessory];
  if (v2)
  {
    uint64_t v3 = +[FMDProtectedContextManager sharedManager];
    id v4 = [(id)objc_opt_class() pendingActionKeyForAccessory:v2];
    id v8 = 0;
    id v5 = [v3 contextForKey:v4 contextUUID:&v8 error:0];
    id v6 = v8;
  }
  else
  {
    id v6 = 0;
  }

  return (NSUUID *)v6;
}

- (void)setPendingActionIntent:(id)a3
{
  id v6 = a3;
  id v4 = [(FMDCommandContext *)self accessory];
  if (v4)
  {
    id v5 = [(id)objc_opt_class() pendingActionKeyForAccessory:v4];
    [(FMDCommandContext *)self setObject:v6 forKey:v5];
  }
}

- (void)setActionCompleted:(id)a3
{
  id v4 = a3;
  id v5 = [(FMDCommandContext *)self accessory];
  if (v5)
  {
    id v6 = [(id)objc_opt_class() pendingActionKeyForAccessory:v5];
    v7 = +[FMDProtectedContextManager sharedManager];
    id v13 = 0;
    id v8 = [v7 contextForKey:v6 contextUUID:&v13 error:0];
    id v9 = v13;

    id v10 = [v5 connectionState];
    if (v4 && v10 == (id)1 && [v9 isEqual:v4])
    {
      v11 = [(id)objc_opt_class() intentContextKeyForAccessory:v5];
      [(FMDCommandContext *)self setObject:v8 forKey:v11];

      v12 = +[FMDProtectedContextManager sharedManager];
      [v12 cleanupContextsForKey:v6 contextUUID:v4];
    }
  }
}

- (BOOL)pendingAction
{
  v2 = [(FMDCommandContext *)self pendingActionUUID];
  BOOL v3 = v2 != 0;

  return v3;
}

- (FMDInternalAccessory)accessory
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_accessory);

  return (FMDInternalAccessory *)WeakRetained;
}

- (void)setAccessory:(id)a3
{
}

- (void).cxx_destruct
{
}

@end