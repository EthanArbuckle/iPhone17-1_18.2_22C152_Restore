@interface PKTransitCommutePlanPackage
+ (BOOL)supportsSecureCoding;
- (NSArray)transitCommutePlans;
- (NSMutableDictionary)commutePlanLookupDictionary;
- (PKTransitCommutePlanPackage)initWithCoder:(id)a3;
- (PKTransitCommutePlanPackage)initWithDictionary:(id)a3 backFieldBuckets:(id)a4 bundle:(id)a5 privateBundle:(id)a6 passType:(unint64_t)a7;
- (id)copyWithZone:(_NSZone *)a3;
- (id)planForIdentifier:(id)a3;
- (unint64_t)transitCommutePlanType;
- (void)encodeWithCoder:(id)a3;
- (void)setCommutePlanLookupDictionary:(id)a3;
- (void)setTransitCommutePlanType:(unint64_t)a3;
- (void)setTransitCommutePlans:(id)a3;
@end

@implementation PKTransitCommutePlanPackage

- (NSArray)transitCommutePlans
{
  return self->_transitCommutePlans;
}

- (unint64_t)transitCommutePlanType
{
  return self->_transitCommutePlanType;
}

- (PKTransitCommutePlanPackage)initWithDictionary:(id)a3 backFieldBuckets:(id)a4 bundle:(id)a5 privateBundle:(id)a6 passType:(unint64_t)a7
{
  uint64_t v64 = *MEMORY[0x1E4F143B8];
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  v61.receiver = self;
  v61.super_class = (Class)PKTransitCommutePlanPackage;
  v16 = [(PKTransitCommutePlanPackage *)&v61 init];
  if (!v16) {
    goto LABEL_31;
  }
  id v17 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  v40 = [v12 objectForKey:@"paymentCard"];
  v18 = [v40 objectForKey:@"commutePlans"];
  v19 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
  commutePlanLookupDictionary = v16->_commutePlanLookupDictionary;
  v16->_commutePlanLookupDictionary = v19;

  [(PKTransitCommutePlanPackage *)v16 setTransitCommutePlanType:0];
  if (v18)
  {
    v55[0] = MEMORY[0x1E4F143A8];
    v55[1] = 3221225472;
    v55[2] = __97__PKTransitCommutePlanPackage_initWithDictionary_backFieldBuckets_bundle_privateBundle_passType___block_invoke;
    v55[3] = &unk_1E56F3810;
    v56 = (PKTransitCommutePlan *)v14;
    id v57 = v15;
    unint64_t v60 = a7;
    v21 = v16;
    v58 = v21;
    id v59 = v17;
    [v18 enumerateObjectsUsingBlock:v55];
    [(PKTransitCommutePlanPackage *)v21 setTransitCommutePlanType:2];

    v22 = v56;
    goto LABEL_30;
  }
  id v37 = v15;
  v42 = v17;
  p_isa = (id *)&v16->super.isa;
  id v39 = v12;
  id v23 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  long long v51 = 0u;
  long long v52 = 0u;
  long long v53 = 0u;
  long long v54 = 0u;
  id v38 = v13;
  id obj = v13;
  uint64_t v45 = [obj countByEnumeratingWithState:&v51 objects:v63 count:16];
  v22 = 0;
  if (!v45) {
    goto LABEL_29;
  }
  uint64_t v44 = *(void *)v52;
  do
  {
    uint64_t v24 = 0;
    do
    {
      if (*(void *)v52 != v44) {
        objc_enumerationMutation(obj);
      }
      uint64_t v46 = v24;
      v25 = *(void **)(*((void *)&v51 + 1) + 8 * v24);
      long long v47 = 0u;
      long long v48 = 0u;
      long long v49 = 0u;
      long long v50 = 0u;
      id v26 = v25;
      uint64_t v27 = [v26 countByEnumeratingWithState:&v47 objects:v62 count:16];
      if (v27)
      {
        uint64_t v28 = v27;
        uint64_t v29 = *(void *)v48;
        do
        {
          for (uint64_t i = 0; i != v28; ++i)
          {
            if (*(void *)v48 != v29) {
              objc_enumerationMutation(v26);
            }
            v31 = *(void **)(*((void *)&v47 + 1) + 8 * i);
            v32 = [v31 key];
            if ([v32 hasPrefix:@"commuter"])
            {
              if (!v22)
              {
                v22 = objc_alloc_init(PKTransitCommutePlan);
                [(PKTransitCommutePlan *)v22 setIdentifier:@"commute_plan"];
              }
              if ([v32 isEqual:@"commuter_route"])
              {
                v33 = (void *)[v31 copy];
                [v33 setKey:@"genericTimedPlan"];
                [(PKTransitCommutePlan *)v22 setTitle:v33];
LABEL_21:

                goto LABEL_23;
              }
              if ([v32 isEqual:@"commuter_route_expiration"])
              {
                v33 = (void *)[v31 copy];
                [v33 setKey:@"expiryDate"];
                [v23 addObject:v33];
                goto LABEL_21;
              }
              [v23 addObject:v31];
            }
LABEL_23:
          }
          uint64_t v28 = [v26 countByEnumeratingWithState:&v47 objects:v62 count:16];
        }
        while (v28);
      }

      if (v22)
      {
        v34 = (void *)[v23 copy];
        [(PKTransitCommutePlan *)v22 setDetails:v34];

        [p_isa[3] setObject:v22 forKey:@"commute_plan"];
        [v42 addObject:v22];
        [p_isa setTransitCommutePlanType:1];
      }
      uint64_t v24 = v46 + 1;
    }
    while (v46 + 1 != v45);
    uint64_t v45 = [obj countByEnumeratingWithState:&v51 objects:v63 count:16];
  }
  while (v45);
LABEL_29:

  id v13 = v38;
  id v12 = v39;
  id v15 = v37;
  id v17 = v42;
  v16 = (PKTransitCommutePlanPackage *)p_isa;
  v18 = 0;
LABEL_30:

  v35 = (void *)[v17 copy];
  [(PKTransitCommutePlanPackage *)v16 setTransitCommutePlans:v35];

LABEL_31:
  return v16;
}

- (void)setTransitCommutePlans:(id)a3
{
}

- (void)setTransitCommutePlanType:(unint64_t)a3
{
  self->_transitCommutePlanType = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_commutePlanLookupDictionary, 0);
  objc_storeStrong((id *)&self->_transitCommutePlans, 0);
}

void __97__PKTransitCommutePlanPackage_initWithDictionary_backFieldBuckets_bundle_privateBundle_passType___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v41 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  v4 = [v3 PKStringForKey:@"identifier"];
  if (v4)
  {
    v5 = objc_alloc_init(PKTransitCommutePlan);
    v6 = (void *)[v4 copy];
    [(PKTransitCommutePlan *)v5 setIdentifier:v6];

    v7 = [v3 PKArrayForKey:@"deviceAccountIdentifiers"];
    v8 = v7;
    if (v7)
    {
      v9 = (void *)[v7 copy];
      [(PKTransitCommutePlan *)v5 setDeviceAccountIdentifiers:v9];
    }
    -[PKTransitCommutePlan setRequiresAppletSourceOfTruth:](v5, "setRequiresAppletSourceOfTruth:", [v3 PKBoolForKey:@"requiresAppletSourceOfTruth"]);
    -[PKTransitCommutePlan setIsDeviceBound:](v5, "setIsDeviceBound:", [v3 PKBoolForKey:@"isDeviceBound"]);
    uint64_t v10 = [(PKTransitCommutePlan *)v5 properties];
    int v11 = [v3 PKBoolForKey:@"autoloaded"];
    uint64_t v12 = 2;
    if (!v11) {
      uint64_t v12 = 0;
    }
    [(PKTransitCommutePlan *)v5 setProperties:v12 | v10 & 0xFFFFFFFFFFFFFFFDLL];
    id v13 = [v3 PKDictionaryForKey:@"title"];
    id v14 = v13;
    if (v13)
    {
      uint64_t v28 = v13;
      uint64_t v29 = v8;
      id v15 = v4;
      v16 = _FieldForTypeWithDictionaryAndBundle(1, v13, *(void **)(a1 + 32), *(void **)(a1 + 40), 0, 1, *(void *)(a1 + 64));
      v30 = v5;
      [(PKTransitCommutePlan *)v5 setTitle:v16];

      id v31 = v3;
      id v17 = [v3 PKArrayForKey:@"details"];
      v18 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(v17, "count"));
      long long v32 = 0u;
      long long v33 = 0u;
      long long v34 = 0u;
      long long v35 = 0u;
      v19 = v17;
      uint64_t v20 = [v19 countByEnumeratingWithState:&v32 objects:v40 count:16];
      if (v20)
      {
        uint64_t v21 = v20;
        uint64_t v22 = *(void *)v33;
        do
        {
          for (uint64_t i = 0; i != v21; ++i)
          {
            if (*(void *)v33 != v22) {
              objc_enumerationMutation(v19);
            }
            uint64_t v24 = *(void **)(*((void *)&v32 + 1) + 8 * i);
            v25 = _FieldForTypeWithDictionaryAndBundle(4, v24, *(void **)(a1 + 32), *(void **)(a1 + 40), 0, 1, *(void *)(a1 + 64));
            if (v25)
            {
              [v18 addObject:v25];
            }
            else
            {
              id v26 = PKLogFacilityTypeGetObject(0xCuLL);
              if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
              {
                *(_DWORD *)buf = 138412546;
                id v37 = v15;
                __int16 v38 = 2112;
                id v39 = v24;
                _os_log_impl(&dword_190E10000, v26, OS_LOG_TYPE_DEFAULT, "Can't parse a details field on commutePlan %@ %@", buf, 0x16u);
              }
            }
          }
          uint64_t v21 = [v19 countByEnumeratingWithState:&v32 objects:v40 count:16];
        }
        while (v21);
      }

      uint64_t v27 = (void *)[v18 copy];
      v5 = v30;
      [(PKTransitCommutePlan *)v30 setDetails:v27];

      v4 = v15;
      [*(id *)(*(void *)(a1 + 48) + 24) setObject:v30 forKey:v15];
      [*(id *)(a1 + 56) addObject:v30];

      id v3 = v31;
      id v14 = v28;
      v8 = v29;
    }
    else
    {
      v19 = PKLogFacilityTypeGetObject(0xCuLL);
      if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        id v37 = v4;
        _os_log_impl(&dword_190E10000, v19, OS_LOG_TYPE_DEFAULT, "No title field for commutePlan with identifier %@", buf, 0xCu);
      }
    }
  }
  else
  {
    PKLogFacilityTypeGetObject(0xCuLL);
    v5 = (PKTransitCommutePlan *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(&v5->super, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_190E10000, &v5->super, OS_LOG_TYPE_DEFAULT, "No identifier for a commutePlan in pass, skipping", buf, 2u);
    }
  }
}

- (id)planForIdentifier:(id)a3
{
  return (id)[(NSMutableDictionary *)self->_commutePlanLookupDictionary objectForKeyedSubscript:a3];
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  transitCommutePlans = self->_transitCommutePlans;
  id v5 = a3;
  [v5 encodeObject:transitCommutePlans forKey:@"PKTransitCommutePlanPackagePlansKey"];
  [v5 encodeObject:self->_commutePlanLookupDictionary forKey:@"PKTransitCommutePlanPackageLookupKey"];
  [v5 encodeInteger:self->_transitCommutePlanType forKey:@"PKTransitCommutePlanPackageTypeKey"];
}

- (PKTransitCommutePlanPackage)initWithCoder:(id)a3
{
  v4 = (void *)MEMORY[0x1E4F1CAD0];
  id v5 = a3;
  uint64_t v6 = objc_opt_class();
  v7 = objc_msgSend(v4, "setWithObjects:", v6, objc_opt_class(), 0);
  v8 = [v5 decodeObjectOfClasses:v7 forKey:@"PKTransitCommutePlanPackagePlansKey"];
  [(PKTransitCommutePlanPackage *)self setTransitCommutePlans:v8];

  v9 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v10 = objc_opt_class();
  uint64_t v11 = objc_opt_class();
  uint64_t v12 = objc_msgSend(v9, "setWithObjects:", v10, v11, objc_opt_class(), 0);
  id v13 = [v5 decodeObjectOfClasses:v12 forKey:@"PKTransitCommutePlanPackageLookupKey"];
  [(PKTransitCommutePlanPackage *)self setCommutePlanLookupDictionary:v13];

  uint64_t v14 = [v5 decodeIntegerForKey:@"PKTransitCommutePlanPackageTypeKey"];
  [(PKTransitCommutePlanPackage *)self setTransitCommutePlanType:v14];

  return self;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v4 = (void *)[(id)objc_opt_class() allocWithZone:a3];
  [v4 setTransitCommutePlans:self->_transitCommutePlans];
  [v4 setCommutePlanLookupDictionary:self->_commutePlanLookupDictionary];
  [v4 setTransitCommutePlanType:self->_transitCommutePlanType];
  return v4;
}

- (NSMutableDictionary)commutePlanLookupDictionary
{
  return self->_commutePlanLookupDictionary;
}

- (void)setCommutePlanLookupDictionary:(id)a3
{
}

@end