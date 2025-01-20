@interface PKPassUpgradePrecursorPassRequest
+ (BOOL)supportsSecureCoding;
- (NSArray)actions;
- (PKPassUpgradePrecursorPassRequest)initWithCoder:(id)a3;
- (PKPassUpgradePrecursorPassRequest)initWithDictionary:(id)a3;
- (id)asDictionary;
- (void)encodeWithCoder:(id)a3;
@end

@implementation PKPassUpgradePrecursorPassRequest

- (PKPassUpgradePrecursorPassRequest)initWithDictionary:(id)a3
{
  uint64_t v36 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v34.receiver = self;
  v34.super_class = (Class)PKPassUpgradePrecursorPassRequest;
  v5 = [(PKPassUpgradeRequest *)&v34 initWithDictionary:v4];
  if (v5)
  {
    v6 = v5;
    v7 = [(PKPassUpgradeRequest *)v5 secureElementIdentifier];

    if (v7)
    {
      v8 = [v4 PKArrayContaining:objc_opt_class() forKey:@"actions"];
      if ([v8 count])
      {
        p_isa = (id *)&v6->super.super.isa;
        v9 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
        long long v29 = 0u;
        long long v30 = 0u;
        long long v31 = 0u;
        long long v32 = 0u;
        p_super = v8;
        uint64_t v11 = [p_super countByEnumeratingWithState:&v29 objects:v35 count:16];
        if (v11)
        {
          uint64_t v12 = v11;
          uint64_t v13 = *(void *)v30;
          do
          {
            for (uint64_t i = 0; i != v12; ++i)
            {
              if (*(void *)v30 != v13) {
                objc_enumerationMutation(p_super);
              }
              v15 = *(void **)(*((void *)&v29 + 1) + 8 * i);
              v16 = [v15 PKStringForKey:@"type"];
              switch(PKPassUpgradePrecursorPassActionTypeFromString(v16))
              {
                case 0:
                  v17 = PKLogFacilityTypeGetObject(0x26uLL);
                  if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
                  {
                    *(_WORD *)buf = 0;
                    _os_log_impl(&dword_190E10000, v17, OS_LOG_TYPE_DEFAULT, "Unknown Precursor pass action type request", buf, 2u);
                  }
                  goto LABEL_19;
                case 1:
                  v18 = PKPassUpgradePrecursorPassProofingAction;
                  goto LABEL_14;
                case 2:
                  v18 = PKPassUpgradePrecursorPassAction;
LABEL_14:
                  id v19 = [v18 alloc];
                  id v20 = v15;
                  goto LABEL_18;
                case 3:
                  v21 = PKPassUpgradePrecursorPassGenericReprovisionAction;
                  goto LABEL_17;
                case 4:
                  v21 = PKPassUpgradePrecursorPassIssuerAppAction;
LABEL_17:
                  id v19 = [v21 alloc];
                  id v20 = v4;
LABEL_18:
                  v17 = [v19 initWithDictionary:v20];
                  [v9 safelyAddObject:v17];
LABEL_19:

                  break;
                default:
                  break;
              }
            }
            uint64_t v12 = [p_super countByEnumeratingWithState:&v29 objects:v35 count:16];
          }
          while (v12);
        }

        uint64_t v22 = [v9 copy];
        v23 = (PKPassUpgradePrecursorPassRequest *)p_isa;
        id v24 = p_isa[6];
        p_isa[6] = (id)v22;

        if (![p_isa[6] count])
        {
          v25 = PKLogFacilityTypeGetObject(0x26uLL);
          if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)buf = 0;
            _os_log_impl(&dword_190E10000, v25, OS_LOG_TYPE_DEFAULT, "WARNING: Precursor pass request has no actions", buf, 2u);
          }

          v23 = 0;
        }
        v8 = v9;
        goto LABEL_34;
      }
      v26 = PKLogFacilityTypeGetObject(0x26uLL);
      if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_190E10000, v26, OS_LOG_TYPE_DEFAULT, "Missing actions for precursor pass upgrade request", buf, 2u);
      }
    }
    else
    {
      v8 = PKLogFacilityTypeGetObject(0x26uLL);
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_190E10000, v8, OS_LOG_TYPE_DEFAULT, "Missing seid key for precursor pass upgrade request", buf, 2u);
      }
    }
    p_super = &v6->super.super;
    v23 = 0;
LABEL_34:

    goto LABEL_35;
  }
  v23 = 0;
LABEL_35:

  return v23;
}

- (id)asDictionary
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  v19.receiver = self;
  v19.super_class = (Class)PKPassUpgradePrecursorPassRequest;
  v3 = [(PKPassUpgradeRequest *)&v19 asDictionary];
  id v4 = (void *)[v3 mutableCopy];

  if ([(NSArray *)self->_actions count])
  {
    id v5 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    long long v15 = 0u;
    long long v16 = 0u;
    long long v17 = 0u;
    long long v18 = 0u;
    v6 = self->_actions;
    uint64_t v7 = [(NSArray *)v6 countByEnumeratingWithState:&v15 objects:v20 count:16];
    if (v7)
    {
      uint64_t v8 = v7;
      uint64_t v9 = *(void *)v16;
      do
      {
        for (uint64_t i = 0; i != v8; ++i)
        {
          if (*(void *)v16 != v9) {
            objc_enumerationMutation(v6);
          }
          uint64_t v11 = objc_msgSend(*(id *)(*((void *)&v15 + 1) + 8 * i), "asDictionary", (void)v15);
          [v5 addObject:v11];
        }
        uint64_t v8 = [(NSArray *)v6 countByEnumeratingWithState:&v15 objects:v20 count:16];
      }
      while (v8);
    }

    uint64_t v12 = (void *)[v5 copy];
    [v4 setObject:v12 forKeyedSubscript:@"actions"];
  }
  uint64_t v13 = objc_msgSend(v4, "copy", (void)v15);

  return v13;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (PKPassUpgradePrecursorPassRequest)initWithCoder:(id)a3
{
  id v4 = a3;
  v15.receiver = self;
  v15.super_class = (Class)PKPassUpgradePrecursorPassRequest;
  id v5 = [(PKPassUpgradeRequest *)&v15 initWithCoder:v4];
  if (v5)
  {
    v6 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v7 = objc_opt_class();
    uint64_t v8 = objc_opt_class();
    uint64_t v9 = objc_opt_class();
    uint64_t v10 = objc_opt_class();
    uint64_t v11 = objc_msgSend(v6, "setWithObjects:", v7, v8, v9, v10, objc_opt_class(), 0);
    uint64_t v12 = [v4 decodeObjectOfClasses:v11 forKey:@"actions"];
    actions = v5->_actions;
    v5->_actions = (NSArray *)v12;
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)PKPassUpgradePrecursorPassRequest;
  id v4 = a3;
  [(PKPassUpgradeRequest *)&v5 encodeWithCoder:v4];
  objc_msgSend(v4, "encodeObject:forKey:", self->_actions, @"actions", v5.receiver, v5.super_class);
}

- (NSArray)actions
{
  return self->_actions;
}

- (void).cxx_destruct
{
}

@end