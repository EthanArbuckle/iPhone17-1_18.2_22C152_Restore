@interface _SBDisplayPredicate
+ (id)fromDefaultsKey:(id)a3;
- (BOOL)isEqual:(id)a3;
- (BOOL)matchesDisplay:(id)a3;
- (_SBDisplayPredicate)initWithDisplay:(id)a3;
- (_SBDisplayPredicate)initWithDisplayHardwareIdentifier:(id)a3 productName:(id)a4;
- (id)defaultsKeyRepresentation;
- (id)description;
- (unint64_t)hash;
@end

@implementation _SBDisplayPredicate

- (_SBDisplayPredicate)initWithDisplayHardwareIdentifier:(id)a3 productName:(id)a4
{
  id v8 = a3;
  id v9 = a4;
  if (!v8)
  {
    v13 = [MEMORY[0x1E4F28B00] currentHandler];
    [v13 handleFailureInMethod:a2, self, @"SBDisplayModePredicate.m", 258, @"Invalid parameter not satisfying: %@", @"displayHardwareIdentifier" object file lineNumber description];
  }
  v14.receiver = self;
  v14.super_class = (Class)_SBDisplayPredicate;
  v10 = [(SBDisplayModePredicate *)&v14 _init];
  v11 = (_SBDisplayPredicate *)v10;
  if (v10)
  {
    objc_storeStrong(v10 + 1, a3);
    objc_storeStrong((id *)&v11->_displayProductName, a4);
  }

  return v11;
}

- (_SBDisplayPredicate)initWithDisplay:(id)a3
{
  id v4 = a3;
  v5 = [v4 hardwareIdentifier];
  v6 = [v4 CADisplay];

  v7 = [v6 productName];
  id v8 = [(_SBDisplayPredicate *)self initWithDisplayHardwareIdentifier:v5 productName:v7];

  return v8;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  uint64_t v5 = objc_opt_class();
  id v6 = v4;
  if (v5)
  {
    if (objc_opt_isKindOfClass()) {
      v7 = v6;
    }
    else {
      v7 = 0;
    }
  }
  else
  {
    v7 = 0;
  }
  id v8 = v7;

  if (v8) {
    BOOL v9 = [(NSString *)self->_displayHardwareIdentifier isEqualToString:v8[1]];
  }
  else {
    BOOL v9 = 0;
  }

  return v9;
}

- (unint64_t)hash
{
  return [(NSString *)self->_displayHardwareIdentifier hash];
}

- (BOOL)matchesDisplay:(id)a3
{
  id v5 = a3;
  if (!v5)
  {
    BOOL v9 = [MEMORY[0x1E4F28B00] currentHandler];
    [v9 handleFailureInMethod:a2, self, @"SBDisplayModePredicate.m", 283, @"Invalid parameter not satisfying: %@", @"displayConfiguration != nil" object file lineNumber description];
  }
  displayHardwareIdentifier = self->_displayHardwareIdentifier;
  v7 = [v5 hardwareIdentifier];
  LOBYTE(displayHardwareIdentifier) = [(NSString *)displayHardwareIdentifier isEqualToString:v7];

  return (char)displayHardwareIdentifier;
}

+ (id)fromDefaultsKey:(id)a3
{
  id v4 = a3;
  id v5 = [NSString stringWithFormat:@"^\\(\\.%@ \\[(%@)\\] \\[(.*)\\]\\)$", @"display", @"[0-9a-fA-F]{8}\\b-[0-9a-fA-F]{4}\\b-[0-9a-fA-F]{4}\\b-[0-9a-fA-F]{4}\\b-[0-9a-fA-F]{12}"];
  id v6 = [MEMORY[0x1E4F28FD8] regularExpressionWithPattern:v5 options:0 error:0];
  v7 = objc_msgSend(v6, "firstMatchInString:options:range:", v4, 0, 0, objc_msgSend(v4, "length"));
  id v8 = v7;
  if (v7)
  {
    uint64_t v9 = [v7 rangeAtIndex:1];
    v11 = objc_msgSend(v4, "substringWithRange:", v9, v10);
    uint64_t v12 = [v8 rangeAtIndex:2];
    uint64_t v14 = objc_msgSend(v4, "substringWithRange:", v12, v13);
    v15 = (void *)v14;
    if (v11) {
      BOOL v16 = v14 == 0;
    }
    else {
      BOOL v16 = 1;
    }
    if (v16) {
      v17 = 0;
    }
    else {
      v17 = (void *)[objc_alloc((Class)a1) initWithDisplayHardwareIdentifier:v11 productName:v14];
    }
  }
  else
  {
    v17 = 0;
  }

  return v17;
}

- (id)defaultsKeyRepresentation
{
  return (id)[NSString stringWithFormat:@"(.%@ [%@] [%@])", @"display", self->_displayHardwareIdentifier, self->_displayProductName];
}

- (id)description
{
  return (id)[NSString stringWithFormat:@"<%@:%p> [display: %@] [productName: %@]", objc_opt_class(), self, self->_displayHardwareIdentifier, self->_displayProductName];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_displayProductName, 0);
  objc_storeStrong((id *)&self->_displayHardwareIdentifier, 0);
}

@end