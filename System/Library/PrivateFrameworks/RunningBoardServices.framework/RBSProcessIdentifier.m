@interface RBSProcessIdentifier
+ (BOOL)supportsRBSXPCSecureCoding;
+ (BOOL)supportsSecureCoding;
+ (RBSProcessIdentifier)identifierWithPid:(int)a3;
+ (id)identifierForCurrentProcess;
+ (id)identifierForIdentifier:(id)a3;
- (BOOL)isEqual:(id)a3;
- (BOOL)matchesProcess:(id)a3;
- (NSString)description;
- (RBSProcessIdentifier)init;
- (RBSProcessIdentifier)initWithPid:(int)a3;
- (RBSProcessIdentifier)initWithRBSXPCCoder:(id)a3;
- (id)processPredicate;
- (int)pid;
- (int)rbs_pid;
- (unint64_t)hash;
- (void)encodeWithRBSXPCCoder:(id)a3;
@end

@implementation RBSProcessIdentifier

- (void).cxx_destruct
{
}

- (BOOL)matchesProcess:(id)a3
{
  int pid = self->_pid;
  return pid == objc_msgSend(a3, "rbs_pid");
}

- (RBSProcessIdentifier)initWithPid:(int)a3
{
  uint64_t v3 = *(void *)&a3;
  if (initWithPid__onceToken != -1) {
    dispatch_once(&initWithPid__onceToken, &__block_literal_global_5);
  }
  if ((int)v3 < 1)
  {
    v7 = 0;
  }
  else
  {
    os_unfair_lock_lock((os_unfair_lock_t)&__Lock);
    v5 = (void *)__ProcessIdentifiers;
    v6 = [NSNumber numberWithInt:v3];
    v7 = [v5 objectForKey:v6];

    if (!v7)
    {
      v7 = self;
      v7->_int pid = v3;
      v8 = (void *)__ProcessIdentifiers;
      v9 = [NSNumber numberWithInt:v3];
      [v8 setObject:v7 forKey:v9];
    }
    os_unfair_lock_unlock((os_unfair_lock_t)&__Lock);
  }

  return v7;
}

+ (BOOL)supportsRBSXPCSecureCoding
{
  return 1;
}

- (RBSProcessIdentifier)initWithRBSXPCCoder:(id)a3
{
  uint64_t v4 = [a3 decodeInt64ForKey:@"_pid"];
  return [(RBSProcessIdentifier *)self initWithPid:v4];
}

- (void)encodeWithRBSXPCCoder:(id)a3
{
}

- (int)pid
{
  return self->_pid;
}

- (unint64_t)hash
{
  return self->_pid;
}

+ (id)identifierForIdentifier:(id)a3
{
  id v4 = a3;
  uint64_t v5 = objc_opt_class();
  if (v5 == objc_opt_class())
  {
    id v6 = v4;
  }
  else
  {
    objc_msgSend(a1, "identifierWithPid:", objc_msgSend(v4, "rbs_pid"));
    id v6 = (id)objc_claimAutoreleasedReturnValue();
  }
  v7 = v6;

  return v7;
}

+ (RBSProcessIdentifier)identifierWithPid:(int)a3
{
  uint64_t v3 = [[RBSProcessIdentifier alloc] initWithPid:*(void *)&a3];
  return v3;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (RBSProcessIdentifier *)a3;
  if (self == v4)
  {
    BOOL v7 = 1;
  }
  else
  {
    uint64_t v5 = objc_opt_class();
    if (v5 == objc_opt_class() || (objc_opt_respondsToSelector() & 1) != 0)
    {
      int pid = self->_pid;
      BOOL v7 = pid == [(RBSProcessIdentifier *)v4 rbs_pid];
    }
    else
    {
      BOOL v7 = 0;
    }
  }

  return v7;
}

- (int)rbs_pid
{
  return self->_pid;
}

- (NSString)description
{
  v2 = self;
  objc_sync_enter(v2);
  description = v2->_description;
  if (!description)
  {
    uint64_t v4 = objc_msgSend([NSString alloc], "initWithFormat:", @"%d", v2->_pid);
    uint64_t v5 = v2->_description;
    v2->_description = (NSString *)v4;

    description = v2->_description;
  }
  id v6 = description;
  objc_sync_exit(v2);

  return v6;
}

uint64_t __36__RBSProcessIdentifier_initWithPid___block_invoke()
{
  __ProcessIdentifiers = [MEMORY[0x1E4F28E10] strongToWeakObjectsMapTable];
  return MEMORY[0x1F41817F8]();
}

+ (id)identifierForCurrentProcess
{
  uint64_t v3 = getpid();
  return (id)[a1 identifierWithPid:v3];
}

- (RBSProcessIdentifier)init
{
  uint64_t v3 = getpid();
  return [(RBSProcessIdentifier *)self initWithPid:v3];
}

- (id)processPredicate
{
  return +[RBSProcessPredicate predicateMatchingIdentifier:self];
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end