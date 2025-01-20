@interface _UIPhysicalButtonConfigurationResolutionContext
- (BOOL)isEqual:(id)a3;
- (NSDictionary)configurationToInteractionMap;
- (_UIPhysicalButtonConfigurationSet)configurations;
- (id)copyWithZone:(_NSZone *)a3;
- (id)debugDescription;
- (id)description;
- (unint64_t)hash;
- (void)setConfigurationToInteractionMap:(id)a3;
- (void)setConfigurations:(id)a3;
@end

@implementation _UIPhysicalButtonConfigurationResolutionContext

- (_UIPhysicalButtonConfigurationSet)configurations
{
  return self->_configurations;
}

- (NSDictionary)configurationToInteractionMap
{
  return self->_configurationToInteractionMap;
}

- (void)setConfigurations:(id)a3
{
}

- (void)setConfigurationToInteractionMap:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_configurationToInteractionMap, 0);
  objc_storeStrong((id *)&self->_configurations, 0);
}

- (BOOL)isEqual:(id)a3
{
  if (a3 == self)
  {
    LOBYTE(v12) = 1;
  }
  else
  {
    if (a3 && _NSIsNSObject())
    {
      v5 = a3;
      uint64_t v6 = objc_opt_class();
      if (v6 == objc_opt_class()
        && (unint64_t v7 = -[_UIPhysicalButtonConfigurationResolutionContext hash](self, "hash"), v7 == [v5 hash]))
      {
        v8 = (void *)v5[1];
        v9 = self->_configurations;
        v10 = v8;
        if (v9 == v10)
        {

          goto LABEL_17;
        }
        v11 = v10;
        LOBYTE(v12) = 0;
        if (!v9 || !v10)
        {
LABEL_22:

          goto LABEL_14;
        }
        BOOL v12 = [(_UIPhysicalButtonConfigurationSet *)v9 isEqual:v10];

        if (v12)
        {
LABEL_17:
          configurationToInteractionMap = self->_configurationToInteractionMap;
          v15 = (void *)v5[2];
          v9 = configurationToInteractionMap;
          v16 = v15;
          if (v9 == v16)
          {
            LOBYTE(v12) = 1;
            v11 = v9;
          }
          else
          {
            v11 = v16;
            LOBYTE(v12) = 0;
            if (v9 && v16) {
              LOBYTE(v12) = [(_UIPhysicalButtonConfigurationSet *)v9 isEqual:v16];
            }
          }
          goto LABEL_22;
        }
      }
      else
      {
        LOBYTE(v12) = 0;
      }
LABEL_14:

      return v12;
    }
    LOBYTE(v12) = 0;
  }
  return v12;
}

- (unint64_t)hash
{
  v3 = [MEMORY[0x1E4F4F758] builder];
  id v4 = (id)[v3 appendObject:self->_configurations];
  id v5 = (id)[v3 appendObject:self->_configurationToInteractionMap];
  unint64_t v6 = [v3 hash];

  return v6;
}

- (id)description
{
  uint64_t v2 = (uint64_t)self;
  if (self)
  {
    v3 = [MEMORY[0x1E4F4F718] builderWithObject:self];
    id v4 = _UIPhysicalButtonSuccinctConfigurationsDescriptionForSet(*(void **)(v2 + 8));
    id v5 = (id)[v3 appendObject:v4 withName:@"configurations"];

    unint64_t v6 = *(void **)(v2 + 16);
    if (v6)
    {
      unint64_t v7 = NSString;
      id v8 = v6;
      v9 = (objc_class *)objc_opt_class();
      v10 = NSStringFromClass(v9);
      v11 = [v7 stringWithFormat:@"<%@: %p>", v10, v8];
    }
    else
    {
      v11 = @"(nil)";
    }
    id v12 = (id)[v3 appendObject:v11 withName:@"configurationToInteractionMap"];

    uint64_t v2 = [v3 build];
  }
  return (id)v2;
}

- (id)debugDescription
{
  uint64_t v2 = self;
  if (self)
  {
    v3 = [MEMORY[0x1E4F4F718] builderWithObject:self];
    [v3 setActiveMultilinePrefix:&stru_1ED0E84C0];
    uint64_t v8 = MEMORY[0x1E4F143A8];
    uint64_t v9 = 3221225472;
    v10 = __89___UIPhysicalButtonConfigurationResolutionContext_descriptionBuilderWithMultilinePrefix___block_invoke;
    v11 = &unk_1E52D9F98;
    id v4 = v3;
    id v12 = v4;
    v13 = v2;
    id v5 = (id)[v4 modifyBody:&v8];
    id v6 = v4;

    uint64_t v2 = objc_msgSend(v6, "build", v8, v9, v10, v11);
  }
  return v2;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = objc_opt_new();
  [v4 setConfigurations:self->_configurations];
  [v4 setConfigurationToInteractionMap:self->_configurationToInteractionMap];
  return v4;
}

@end