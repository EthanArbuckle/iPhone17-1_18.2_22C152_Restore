@interface STRestrictionItem
- (BOOL)isEqual:(id)a3;
- (NSString)payloadKey;
- (NSString)rmConfiguration;
- (NSString)uiLabel;
- (STRestrictionItem)initWithConfiguration:(id)a3 restrictionKey:(id)a4 labelName:(id)a5 type:(unint64_t)a6 restrictionValue:(id)a7;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)otherInfo;
- (unint64_t)hash;
- (unint64_t)restrictionType;
@end

@implementation STRestrictionItem

- (STRestrictionItem)initWithConfiguration:(id)a3 restrictionKey:(id)a4 labelName:(id)a5 type:(unint64_t)a6 restrictionValue:(id)a7
{
  id v13 = a3;
  id v14 = a4;
  id v15 = a5;
  id v16 = a7;
  if (v13)
  {
    if (v14) {
      goto LABEL_3;
    }
LABEL_8:
    v28 = [MEMORY[0x263F08690] currentHandler];
    [v28 handleFailureInMethod:a2, self, @"STContentPrivacyViewModel.m", 109, @"Invalid parameter not satisfying: %@", @"key" object file lineNumber description];

    if (v15) {
      goto LABEL_4;
    }
    goto LABEL_9;
  }
  v27 = [MEMORY[0x263F08690] currentHandler];
  [v27 handleFailureInMethod:a2, self, @"STContentPrivacyViewModel.m", 108, @"Invalid parameter not satisfying: %@", @"configuration" object file lineNumber description];

  if (!v14) {
    goto LABEL_8;
  }
LABEL_3:
  if (v15) {
    goto LABEL_4;
  }
LABEL_9:
  v29 = [MEMORY[0x263F08690] currentHandler];
  [v29 handleFailureInMethod:a2, self, @"STContentPrivacyViewModel.m", 110, @"Invalid parameter not satisfying: %@", @"labelName" object file lineNumber description];

LABEL_4:
  v30.receiver = self;
  v30.super_class = (Class)STRestrictionItem;
  v17 = [(STRestrictionItem *)&v30 init];
  if (v17)
  {
    uint64_t v18 = [v13 copy];
    rmConfiguration = v17->_rmConfiguration;
    v17->_rmConfiguration = (NSString *)v18;

    uint64_t v20 = [v14 copy];
    payloadKey = v17->_payloadKey;
    v17->_payloadKey = (NSString *)v20;

    uint64_t v22 = [v15 copy];
    uiLabel = v17->_uiLabel;
    v17->_uiLabel = (NSString *)v22;

    v17->_restrictionType = a6;
    uint64_t v24 = [v16 copy];
    id otherInfo = v17->_otherInfo;
    v17->_id otherInfo = (id)v24;
  }
  return v17;
}

- (unint64_t)hash
{
  v3 = [(STRestrictionItem *)self rmConfiguration];
  uint64_t v4 = [v3 hash];
  v5 = [(STRestrictionItem *)self payloadKey];
  unint64_t v6 = [v5 hash] + v4;

  return v6;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v5 = v4;
    unint64_t v6 = [v5 rmConfiguration];
    v7 = [(STRestrictionItem *)self rmConfiguration];
    if ([v6 isEqualToString:v7])
    {
      v8 = [v5 payloadKey];
      v9 = [(STRestrictionItem *)self payloadKey];
      char v10 = [v8 isEqualToString:v9];
    }
    else
    {
      char v10 = 0;
    }
  }
  else
  {
    char v10 = 0;
  }

  return v10;
}

- (id)description
{
  v3 = NSString;
  uint64_t v4 = objc_opt_class();
  id v5 = [(STRestrictionItem *)self rmConfiguration];
  unint64_t v6 = [(STRestrictionItem *)self payloadKey];
  v7 = [v3 stringWithFormat:@"<%@:%p Conf:%@ Key:%@>", v4, self, v5, v6];

  return v7;
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v4 = (void *)[(id)objc_opt_class() allocWithZone:a3];
  rmConfiguration = self->_rmConfiguration;
  payloadKey = self->_payloadKey;
  uiLabel = self->_uiLabel;
  unint64_t restrictionType = self->_restrictionType;
  id otherInfo = self->_otherInfo;

  return (id)[v4 initWithConfiguration:rmConfiguration restrictionKey:payloadKey labelName:uiLabel type:restrictionType restrictionValue:otherInfo];
}

- (NSString)rmConfiguration
{
  return self->_rmConfiguration;
}

- (NSString)payloadKey
{
  return self->_payloadKey;
}

- (NSString)uiLabel
{
  return self->_uiLabel;
}

- (unint64_t)restrictionType
{
  return self->_restrictionType;
}

- (id)otherInfo
{
  return self->_otherInfo;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_otherInfo, 0);
  objc_storeStrong((id *)&self->_uiLabel, 0);
  objc_storeStrong((id *)&self->_payloadKey, 0);

  objc_storeStrong((id *)&self->_rmConfiguration, 0);
}

@end