@interface TRIDownloadOptions
+ (BOOL)supportsSecureCoding;
+ (id)inexpensiveOptions;
- (BOOL)allowsBatteryUsage;
- (BOOL)allowsCellularAccess;
- (BOOL)allowsExpensiveNetworkAccess;
- (BOOL)isEqual:(id)a3;
- (OS_xpc_object)activity;
- (TRIDownloadOptions)init;
- (TRIDownloadOptions)initWithAllowsCellular:(BOOL)a3 discretionaryBehavior:(unint64_t)a4;
- (TRIDownloadOptions)initWithAllowsCellular:(BOOL)a3 discretionaryBehavior:(unint64_t)a4 activity:(id)a5;
- (TRIDownloadOptions)initWithCoder:(id)a3;
- (id)description;
- (id)initFromPersistedBehavior:(id)a3;
- (id)serializeToPersistedBehavior;
- (unint64_t)discretionaryBehavior;
- (unint64_t)hash;
- (unint64_t)requiredCapability;
- (void)encodeWithCoder:(id)a3;
- (void)setActivity:(id)a3;
- (void)setAllowsBatteryUsage:(BOOL)a3;
- (void)setAllowsCellularAccess:(BOOL)a3;
- (void)setDiscretionaryBehavior:(unint64_t)a3;
@end

@implementation TRIDownloadOptions

- (TRIDownloadOptions)init
{
  return [(TRIDownloadOptions *)self initWithAllowsCellular:0 discretionaryBehavior:0];
}

- (TRIDownloadOptions)initWithAllowsCellular:(BOOL)a3 discretionaryBehavior:(unint64_t)a4
{
  v7.receiver = self;
  v7.super_class = (Class)TRIDownloadOptions;
  result = [(TRIDownloadOptions *)&v7 init];
  if (result)
  {
    result->_allowsCellularAccess = a3;
    result->_allowsBatteryUsage = 0;
    result->_discretionaryBehavior = a4;
  }
  return result;
}

- (TRIDownloadOptions)initWithAllowsCellular:(BOOL)a3 discretionaryBehavior:(unint64_t)a4 activity:(id)a5
{
  id v9 = a5;
  v13.receiver = self;
  v13.super_class = (Class)TRIDownloadOptions;
  v10 = [(TRIDownloadOptions *)&v13 init];
  v11 = v10;
  if (v10)
  {
    v10->_allowsCellularAccess = a3;
    v10->_allowsBatteryUsage = 0;
    v10->_discretionaryBehavior = a4;
    objc_storeStrong((id *)&v10->_activity, a5);
  }

  return v11;
}

- (unint64_t)requiredCapability
{
  unint64_t v2 = 1;
  if (self->_allowsCellularAccess) {
    unint64_t v2 = 2;
  }
  if (self->_discretionaryBehavior - 1 >= 2) {
    return v2;
  }
  else {
    return v2 | 0x10;
  }
}

- (BOOL)allowsExpensiveNetworkAccess
{
  v3 = [(TRIDownloadOptions *)self activity];

  if (v3)
  {
    v4 = [(TRIDownloadOptions *)self activity];
    xpc_object_t v5 = xpc_activity_copy_criteria(v4);

    LOBYTE(v4) = !xpc_dictionary_get_BOOL(v5, (const char *)*MEMORY[0x1E4F14330]);
    return (char)v4;
  }
  else
  {
    return [(TRIDownloadOptions *)self allowsCellularAccess];
  }
}

+ (id)inexpensiveOptions
{
  if (qword_1EB3B77D0 != -1) {
    dispatch_once(&qword_1EB3B77D0, &__block_literal_global_7);
  }
  unint64_t v2 = (void *)_MergedGlobals_7;
  return v2;
}

void __40__TRIDownloadOptions_inexpensiveOptions__block_invoke()
{
  v0 = (void *)MEMORY[0x19F3AD060]();
  v1 = [[TRIDownloadOptions alloc] initWithAllowsCellular:0 discretionaryBehavior:2];
  unint64_t v2 = (void *)_MergedGlobals_7;
  _MergedGlobals_7 = (uint64_t)v1;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (id)initFromPersistedBehavior:(id)a3
{
  id v4 = a3;
  if ([v4 hasAllowsCellular] && objc_msgSend(v4, "hasNetworkBehavior"))
  {
    uint64_t v5 = [v4 allowsCellular];
    int v6 = [v4 networkBehavior];
    uint64_t v7 = 1;
    if (v6 != 2) {
      uint64_t v7 = 2;
    }
    if (v6 == 3) {
      uint64_t v8 = 0;
    }
    else {
      uint64_t v8 = v7;
    }
    self = [(TRIDownloadOptions *)self initWithAllowsCellular:v5 discretionaryBehavior:v8];
    id v9 = self;
  }
  else
  {
    id v9 = 0;
  }

  return v9;
}

- (TRIDownloadOptions)initWithCoder:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [v4 decodeBoolForKey:@"cellular"];
  uint64_t v6 = [v4 decodeIntegerForKey:@"networkBehavior"];

  return [(TRIDownloadOptions *)self initWithAllowsCellular:v5 discretionaryBehavior:v6];
}

- (id)serializeToPersistedBehavior
{
  v3 = objc_opt_new();
  objc_msgSend(v3, "setAllowsCellular:", -[TRIDownloadOptions allowsCellularAccess](self, "allowsCellularAccess"));
  unint64_t v4 = [(TRIDownloadOptions *)self discretionaryBehavior];
  if (v4 == 1) {
    unsigned int v5 = 2;
  }
  else {
    unsigned int v5 = 3;
  }
  if (v4 == 2) {
    uint64_t v6 = 1;
  }
  else {
    uint64_t v6 = v5;
  }
  [v3 setNetworkBehavior:v6];
  return v3;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  objc_msgSend(v4, "encodeBool:forKey:", -[TRIDownloadOptions allowsCellularAccess](self, "allowsCellularAccess"), @"cellular");
  objc_msgSend(v4, "encodeInteger:forKey:", -[TRIDownloadOptions discretionaryBehavior](self, "discretionaryBehavior"), @"networkBehavior");
}

- (id)description
{
  v3 = NSString;
  v10.receiver = self;
  v10.super_class = (Class)TRIDownloadOptions;
  id v4 = [(TRIDownloadOptions *)&v10 description];
  if ([(TRIDownloadOptions *)self allowsCellularAccess]) {
    unsigned int v5 = @"YES";
  }
  else {
    unsigned int v5 = @"NO";
  }
  unint64_t v6 = [(TRIDownloadOptions *)self discretionaryBehavior];
  uint64_t v7 = @"non-discretionary";
  if (v6 == 1) {
    uint64_t v7 = @"discretionary when backgrounded";
  }
  if (v6 == 2) {
    uint64_t v7 = @"discretionary";
  }
  uint64_t v8 = [v3 stringWithFormat:@"%@ cellular:%@ network:%@", v4, v5, v7];

  return v8;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (TRIDownloadOptions *)a3;
  if (v4 == self)
  {
    BOOL v7 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      unsigned int v5 = v4;
      BOOL v6 = [(TRIDownloadOptions *)self allowsCellularAccess];
      if (v6 == [(TRIDownloadOptions *)v5 allowsCellularAccess])
      {
        unint64_t v8 = [(TRIDownloadOptions *)self discretionaryBehavior];
        BOOL v7 = v8 == [(TRIDownloadOptions *)v5 discretionaryBehavior];
      }
      else
      {
        BOOL v7 = 0;
      }
    }
    else
    {
      BOOL v7 = 0;
    }
  }

  return v7;
}

- (unint64_t)hash
{
  if ([(TRIDownloadOptions *)self allowsCellularAccess]) {
    uint64_t v3 = 31;
  }
  else {
    uint64_t v3 = 0;
  }
  return v3 + [(TRIDownloadOptions *)self discretionaryBehavior];
}

- (BOOL)allowsCellularAccess
{
  return self->_allowsCellularAccess;
}

- (void)setAllowsCellularAccess:(BOOL)a3
{
  self->_allowsCellularAccess = a3;
}

- (BOOL)allowsBatteryUsage
{
  return self->_allowsBatteryUsage;
}

- (void)setAllowsBatteryUsage:(BOOL)a3
{
  self->_allowsBatteryUsage = a3;
}

- (unint64_t)discretionaryBehavior
{
  return self->_discretionaryBehavior;
}

- (void)setDiscretionaryBehavior:(unint64_t)a3
{
  self->_discretionaryBehavior = a3;
}

- (OS_xpc_object)activity
{
  return self->_activity;
}

- (void)setActivity:(id)a3
{
}

- (void).cxx_destruct
{
}

@end