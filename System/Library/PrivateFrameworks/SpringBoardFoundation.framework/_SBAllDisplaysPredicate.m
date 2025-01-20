@interface _SBAllDisplaysPredicate
+ (id)fromDefaultsKey:(id)a3;
+ (id)sharedInstance;
- (BOOL)isEqual:(id)a3;
- (BOOL)matchesDisplay:(id)a3;
- (_SBAllDisplaysPredicate)init;
- (id)defaultsKeyRepresentation;
- (id)description;
- (unint64_t)hash;
@end

@implementation _SBAllDisplaysPredicate

- (_SBAllDisplaysPredicate)init
{
  v3.receiver = self;
  v3.super_class = (Class)_SBAllDisplaysPredicate;
  return (_SBAllDisplaysPredicate *)[(SBDisplayModePredicate *)&v3 _init];
}

+ (id)sharedInstance
{
  if (sharedInstance_onceToken_0 != -1) {
    dispatch_once(&sharedInstance_onceToken_0, &__block_literal_global_5);
  }
  v2 = (void *)sharedInstance___singleton;
  return v2;
}

- (BOOL)isEqual:(id)a3
{
  id v3 = a3;
  uint64_t v4 = objc_opt_class();
  id v5 = v3;
  if (v4)
  {
    if (objc_opt_isKindOfClass()) {
      uint64_t v4 = (uint64_t)v5;
    }
    else {
      uint64_t v4 = 0;
    }
  }

  return v4 != 0;
}

- (unint64_t)hash
{
  return [@"(.allDisplays)" hash];
}

- (BOOL)matchesDisplay:(id)a3
{
  id v5 = a3;
  if (!v5)
  {
    v9 = [MEMORY[0x1E4F28B00] currentHandler];
    [v9 handleFailureInMethod:a2, self, @"SBDisplayModePredicate.m", 125, @"Invalid parameter not satisfying: %@", @"displayConfiguration != nil" object file lineNumber description];
  }
  v6 = [v5 hardwareIdentifier];
  BOOL v7 = v6 != 0;

  return v7;
}

+ (id)fromDefaultsKey:(id)a3
{
  if ([a3 isEqualToString:@"(.allDisplays)"])
  {
    uint64_t v4 = [a1 sharedInstance];
  }
  else
  {
    uint64_t v4 = 0;
  }
  return v4;
}

- (id)defaultsKeyRepresentation
{
  return @"(.allDisplays)";
}

- (id)description
{
  return (id)[NSString stringWithFormat:@"<%@:%p> [all displays]", objc_opt_class(), self];
}

@end