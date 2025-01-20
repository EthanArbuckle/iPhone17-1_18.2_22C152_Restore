@interface PBUIExternalDisplayConfiguration
+ (id)defaultConfiguration;
- (BOOL)isEqual:(id)a3;
- (BOOL)mirrorsEmbeddedDisplay;
- (NSUUID)identifier;
- (PBUIExternalDisplayConfiguration)initWithIdentifier:(id)a3 mirrorsEmbeddedDisplay:(BOOL)a4;
- (unint64_t)hash;
@end

@implementation PBUIExternalDisplayConfiguration

+ (id)defaultConfiguration
{
  v3 = [MEMORY[0x1E4F39B60] mainDisplay];
  uint64_t v4 = [v3 uniqueId];
  v5 = (void *)v4;
  v6 = @"default";
  if (v4) {
    v6 = (__CFString *)v4;
  }
  v7 = v6;

  id v8 = objc_alloc((Class)a1);
  v9 = objc_msgSend(MEMORY[0x1E4F29128], "pf_UUIDFromArbitraryString:", v7);

  v10 = (void *)[v8 initWithIdentifier:v9 mirrorsEmbeddedDisplay:0];
  return v10;
}

- (PBUIExternalDisplayConfiguration)initWithIdentifier:(id)a3 mirrorsEmbeddedDisplay:(BOOL)a4
{
  id v7 = a3;
  v11.receiver = self;
  v11.super_class = (Class)PBUIExternalDisplayConfiguration;
  id v8 = [(PBUIExternalDisplayConfiguration *)&v11 init];
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_identifier, a3);
    v9->_mirrorsEmbeddedDisplay = a4;
  }

  return v9;
}

- (unint64_t)hash
{
  v3 = [MEMORY[0x1E4F4F758] builder];
  id v4 = (id)[v3 appendObject:self->_identifier];
  unint64_t v5 = [v3 hash];

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  uint64_t v5 = objc_opt_class();
  id v6 = v4;
  if (v5)
  {
    if (objc_opt_isKindOfClass()) {
      id v7 = v6;
    }
    else {
      id v7 = 0;
    }
  }
  else
  {
    id v7 = 0;
  }
  id v8 = v7;

  v9 = [(PBUIExternalDisplayConfiguration *)self identifier];
  v10 = [v9 UUIDString];
  objc_super v11 = [v8 identifier];

  v12 = [v11 UUIDString];
  char v13 = [v10 isEqualToString:v12];

  return v13;
}

- (NSUUID)identifier
{
  return self->_identifier;
}

- (BOOL)mirrorsEmbeddedDisplay
{
  return self->_mirrorsEmbeddedDisplay;
}

- (void).cxx_destruct
{
}

@end