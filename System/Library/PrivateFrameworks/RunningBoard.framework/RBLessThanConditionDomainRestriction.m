@interface RBLessThanConditionDomainRestriction
+ (id)domainRestrictionForDictionary:(id)a3 withError:(id *)a4;
- (BOOL)allowsContext:(id)a3 withError:(id *)a4;
- (BOOL)isEqual:(id)a3;
- (id)_initWithCondition:(id)a3 value:(int64_t)a4;
- (id)allEntitlements;
- (id)description;
- (unint64_t)hash;
@end

@implementation RBLessThanConditionDomainRestriction

- (BOOL)allowsContext:(id)a3 withError:(id *)a4
{
  v16[1] = *MEMORY[0x263EF8340];
  id v6 = a3;
  if (_os_feature_enabled_impl())
  {
    v7 = [v6 systemState];
    v8 = [v7 conditions];
    v9 = [v8 objectForKey:self->_condition];

    if (v9 && [v9 integerValue] >= self->_value)
    {
      if (a4)
      {
        v10 = (void *)MEMORY[0x263F087E8];
        uint64_t v11 = *MEMORY[0x263F646B8];
        uint64_t v15 = *MEMORY[0x263F08338];
        v12 = [NSString stringWithFormat:@"System condition %@ has value %lld, which is not less than %lld", self->_condition, objc_msgSend(v9, "integerValue"), self->_value];
        v16[0] = v12;
        v13 = [NSDictionary dictionaryWithObjects:v16 forKeys:&v15 count:1];
        *a4 = [v10 errorWithDomain:v11 code:1 userInfo:v13];

        LOBYTE(a4) = 0;
      }
    }
    else
    {
      LOBYTE(a4) = 1;
    }
  }
  else
  {
    LOBYTE(a4) = 1;
  }

  return (char)a4;
}

- (id)_initWithCondition:(id)a3 value:(int64_t)a4
{
  id v6 = a3;
  v12.receiver = self;
  v12.super_class = (Class)RBLessThanConditionDomainRestriction;
  v7 = [(RBDomainRestriction *)&v12 _init];
  if (v7)
  {
    uint64_t v8 = [v6 copy];
    v9 = (void *)v7[1];
    v7[1] = v8;

    v7[2] = a4;
    v10 = v7;
  }

  return v7;
}

+ (id)domainRestrictionForDictionary:(id)a3 withError:(id *)a4
{
  v20[1] = *MEMORY[0x263EF8340];
  id v5 = a3;
  if (_os_feature_enabled_impl())
  {
    id v6 = [v5 objectForKey:@"Condition"];
    v7 = [v5 objectForKey:@"Value"];
    if (v6 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
    {
      if (v7)
      {
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          a4 = -[RBLessThanConditionDomainRestriction _initWithCondition:value:]([RBLessThanConditionDomainRestriction alloc], "_initWithCondition:value:", v6, [v7 integerValue]);
LABEL_15:

          goto LABEL_16;
        }
      }
      if (!a4) {
        goto LABEL_15;
      }
      uint64_t v8 = (void *)MEMORY[0x263F087E8];
      v9 = [NSString stringWithFormat:@"RBLessThanConditionDomainRestriction doesn't specify value: %@", v5, *MEMORY[0x263F08338]];
      v18 = v9;
      v10 = NSDictionary;
      uint64_t v11 = &v18;
      objc_super v12 = &v17;
    }
    else
    {
      if (!a4) {
        goto LABEL_15;
      }
      uint64_t v8 = (void *)MEMORY[0x263F087E8];
      uint64_t v19 = *MEMORY[0x263F08338];
      v9 = [NSString stringWithFormat:@"RBLessThanConditionDomainRestriction doesn't specify condition: %@", v5];
      v20[0] = v9;
      v10 = NSDictionary;
      uint64_t v11 = (void **)v20;
      objc_super v12 = &v19;
    }
    v13 = [v10 dictionaryWithObjects:v11 forKeys:v12 count:1];
    v14 = [v8 errorWithDomain:@"RBDomainAttributeManagerDataProviderErrorDomain" code:1 userInfo:v13];

    id v15 = v14;
    *a4 = v15;

    a4 = 0;
    goto LABEL_15;
  }
  if (domainRestrictionForDictionary_withError__onceToken_259 != -1) {
    dispatch_once(&domainRestrictionForDictionary_withError__onceToken_259, &__block_literal_global_262);
  }
  a4 = (id *)(id)domainRestrictionForDictionary_withError__singleton_260;
LABEL_16:

  return a4;
}

uint64_t __81__RBLessThanConditionDomainRestriction_domainRestrictionForDictionary_withError___block_invoke()
{
  domainRestrictionForDictionary_withError__singleton_260 = [[RBLessThanConditionDomainRestriction alloc] _initWithCondition:@"FFDisabled" value:0];
  return MEMORY[0x270F9A758]();
}

- (id)allEntitlements
{
  return (id)[MEMORY[0x263EFFA08] set];
}

- (BOOL)isEqual:(id)a3
{
  v4 = (RBLessThanConditionDomainRestriction *)a3;
  if (self == v4)
  {
    BOOL v6 = 1;
  }
  else
  {
    uint64_t v5 = objc_opt_class();
    BOOL v6 = v5 == objc_opt_class()
      && ((condition = self->_condition, uint64_t v8 = v4->_condition, condition == v8)
       || (condition ? (BOOL v9 = v8 == 0) : (BOOL v9 = 1), !v9 && -[NSString isEqual:](condition, "isEqual:")))
      && self->_value == v4->_value;
  }

  return v6;
}

- (unint64_t)hash
{
  return self->_value ^ [(NSString *)self->_condition hash];
}

- (id)description
{
  id v3 = [NSString alloc];
  v4 = [(id)objc_opt_class() description];
  uint64_t v5 = (void *)[v3 initWithFormat:@"<%@| %@:%lld>", v4, self->_condition, self->_value];

  return v5;
}

- (void).cxx_destruct
{
}

@end