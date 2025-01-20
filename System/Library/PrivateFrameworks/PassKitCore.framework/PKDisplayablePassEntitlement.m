@interface PKDisplayablePassEntitlement
+ (BOOL)supportsSecureCoding;
+ (id)_displayableEntitlementFromEntitlementTemplateType:(void *)a3 carKeyEntitlementValue:(void *)a4 templateFields:(void *)a5 entitlementTemplates:(void *)a6 sharedEntitlement:(void *)a7 entitlement:(void *)a8 pass:;
+ (id)localizedEntitlementFromCarKeyEntitlement:(id)a3 pass:(id)a4;
+ (id)localizedEntitlementsFromDisplayableEntitlements:(id)a3 pass:(id)a4;
+ (void)_entitlementTemplatesUsingCachedTemplates:(void *)a3 completion:;
+ (void)localizedEntitlementsFromDisplayableEntitlements:(id)a3 pass:(id)a4 useCachedTemplates:(BOOL)a5 completion:(id)a6;
+ (void)localizedEntitlementsFromEntitlements:(id)a3 pass:(id)a4 useCachedTemplates:(BOOL)a5 completion:(id)a6;
- (BOOL)clearGroupWhenSelected;
- (BOOL)isEqual:(id)a3;
- (NSNumber)value;
- (NSString)entitlementIdentifier;
- (NSString)iconName;
- (NSString)localizedGroup;
- (NSString)localizedSubtitle;
- (NSString)localizedTitle;
- (PKDisplayablePassEntitlement)init;
- (PKDisplayablePassEntitlement)initWithCoder:(id)a3;
- (PKDisplayablePassEntitlement)initWithDictionary:(id)a3;
- (PKPassEntitlement)entitlement;
- (PKPassSharedEntitlement)sharedEntitlement;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (int64_t)compare:(id)a3;
- (int64_t)groupPriority;
- (unint64_t)displayStyle;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
- (void)replaceEntitlementWithSharedEntitlement:(id)a3;
- (void)replaceSharedEntitlementWithEntitlement:(id)a3;
- (void)setClearGroupWhenSelected:(BOOL)a3;
- (void)setDisplayStyle:(unint64_t)a3;
- (void)setGroupPriority:(int64_t)a3;
- (void)setIconName:(id)a3;
- (void)setLocalizedGroup:(id)a3;
- (void)setLocalizedSubtitle:(id)a3;
- (void)setLocalizedTitle:(id)a3;
- (void)setValue:(id)a3;
@end

@implementation PKDisplayablePassEntitlement

- (PKDisplayablePassEntitlement)init
{
  return 0;
}

+ (id)localizedEntitlementFromCarKeyEntitlement:(id)a3 pass:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  v8 = [v7 entitlementTemplate];
  v9 = [v7 value];
  v10 = [v7 templateFields];
  v11 = +[PKDisplayablePassEntitlement _displayableEntitlementFromEntitlementTemplateType:carKeyEntitlementValue:templateFields:entitlementTemplates:sharedEntitlement:entitlement:pass:]((uint64_t)a1, v8, v9, v10, 0, 0, v7, v6);

  return v11;
}

+ (id)_displayableEntitlementFromEntitlementTemplateType:(void *)a3 carKeyEntitlementValue:(void *)a4 templateFields:(void *)a5 entitlementTemplates:(void *)a6 sharedEntitlement:(void *)a7 entitlement:(void *)a8 pass:
{
  id v14 = a2;
  id v15 = a3;
  id v16 = a4;
  id v17 = a5;
  id v55 = a6;
  id v18 = a7;
  id v19 = a8;
  self;
  v20 = [PKDisplayablePassEntitlement alloc];
  if (v20)
  {
    v59.receiver = v20;
    v59.super_class = (Class)PKDisplayablePassEntitlement;
    v21 = (id *)objc_msgSendSuper2(&v59, sel_init, v55);
  }
  else
  {
    v21 = 0;
  }
  objc_storeStrong(v21 + 11, a6);
  objc_storeStrong(v21 + 12, a7);
  v21[10] = 0;
  v22 = (__CFString *)v14;
  v23 = @"legacyCarKeyEntitlementTemplate";
  if (v23 == v22)
  {

    goto LABEL_9;
  }
  v24 = v23;
  if (v22 && v23)
  {
    int v25 = [(__CFString *)v22 isEqualToString:v23];

    if (!v25) {
      goto LABEL_14;
    }
LABEL_9:
    unint64_t v26 = objc_msgSend(v15, "unsignedIntegerValue", v55);
    if (v26 >= 6) {
      uint64_t v27 = 6;
    }
    else {
      uint64_t v27 = v26;
    }
    v28 = CarKeyLocalizedTitle(v16, v27, v19);
    [v21 setLocalizedTitle:v28];

    v29 = CarKeyLocalizedDescriptionTitle(v16, v27, v19);
    [v21 setLocalizedSubtitle:v29];

    v30 = PKLocalizedCredentialString(&cfstr_CarKeyEntitlem.isa, 0);
    [v21 setLocalizedGroup:v30];

    goto LABEL_24;
  }

LABEL_14:
  v31 = v22;
  v32 = @"carKeyEntitlementTemplateV2";
  if (v32 == v31)
  {
  }
  else
  {
    v33 = v32;
    if (!v22 || !v32)
    {

LABEL_26:
      v40 = objc_msgSend(v17, "objectForKeyedSubscript:", v31, v55);
      v41 = v40;
      if (v40)
      {
        [v40 setFieldInserts:v16];
        v42 = [v41 localizedTitle];
        [v21 setLocalizedTitle:v42];

        v43 = [v41 localizedDescription];
        [v21 setLocalizedSubtitle:v43];

        v44 = [v41 localizedGroup];
        [v21 setLocalizedGroup:v44];

        v45 = [v41 icon];
        [v21 setIconName:v45];

        objc_msgSend(v21, "setDisplayStyle:", objc_msgSend(v41, "displayStyle"));
        objc_msgSend(v21, "setClearGroupWhenSelected:", objc_msgSend(v41, "clearGroupWhenSelected"));
        objc_msgSend(v21, "setGroupPriority:", objc_msgSend(v41, "groupRenderingPriority"));
      }
      else
      {
        id v46 = objc_alloc_init(MEMORY[0x1E4F28E78]);
        v57[0] = MEMORY[0x1E4F143A8];
        v57[1] = 3221225472;
        v57[2] = __177__PKDisplayablePassEntitlement__displayableEntitlementFromEntitlementTemplateType_carKeyEntitlementValue_templateFields_entitlementTemplates_sharedEntitlement_entitlement_pass___block_invoke;
        v57[3] = &unk_1E56DCAC8;
        id v58 = v46;
        id v47 = v46;
        [v16 enumerateKeysAndObjectsUsingBlock:v57];
        [v21 setLocalizedTitle:v31];
        v48 = (void *)[v47 copy];
        [v21 setLocalizedSubtitle:v48];

        [v21 setLocalizedGroup:&stru_1EE0F5368];
        [v21 setDisplayStyle:1];
      }
      goto LABEL_30;
    }
    int v34 = [(__CFString *)v31 isEqualToString:v32];

    if (!v34) {
      goto LABEL_26;
    }
  }
  unint64_t v35 = objc_msgSend(v15, "unsignedIntegerValue", v55);
  if (v35 >= 6) {
    uint64_t v36 = 6;
  }
  else {
    uint64_t v36 = v35;
  }
  v37 = CarKeyLocalizedTitle(v16, v36, v19);
  [v21 setLocalizedTitle:v37];

  v38 = CarKeyLocalizedDescriptionTitle(v16, v36, v19);
  [v21 setLocalizedSubtitle:v38];

  v39 = PKLocalizedCredentialString(&cfstr_CarKeyEntitlem_0.isa, 0);
  [v21 setLocalizedGroup:v39];

LABEL_24:
  [v21 setDisplayStyle:2];
LABEL_30:
  id v49 = v21[7];
  v21[7] = v15;
  id v50 = v15;

  id v51 = v21[1];
  v21[1] = v22;
  v52 = v22;

  id v53 = v21[2];
  v21[2] = v16;

  return v21;
}

+ (void)localizedEntitlementsFromEntitlements:(id)a3 pass:(id)a4 useCachedTemplates:(BOOL)a5 completion:(id)a6
{
  BOOL v7 = a5;
  id v10 = a3;
  id v11 = a4;
  id v12 = a6;
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __105__PKDisplayablePassEntitlement_localizedEntitlementsFromEntitlements_pass_useCachedTemplates_completion___block_invoke;
  v16[3] = &unk_1E56DCA50;
  id v17 = v10;
  id v18 = v11;
  id v19 = v12;
  id v20 = a1;
  id v13 = v12;
  id v14 = v11;
  id v15 = v10;
  +[PKDisplayablePassEntitlement _entitlementTemplatesUsingCachedTemplates:completion:]((uint64_t)a1, v7, v16);
}

void __105__PKDisplayablePassEntitlement_localizedEntitlementsFromEntitlements_pass_useCachedTemplates_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __105__PKDisplayablePassEntitlement_localizedEntitlementsFromEntitlements_pass_useCachedTemplates_completion___block_invoke_2;
  v7[3] = &unk_1E56DCA28;
  uint64_t v10 = *(void *)(a1 + 56);
  id v8 = v3;
  v4 = *(void **)(a1 + 32);
  id v9 = *(id *)(a1 + 40);
  id v5 = v3;
  id v6 = objc_msgSend(v4, "pk_createArrayBySafelyApplyingBlock:", v7);
  (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
}

id __105__PKDisplayablePassEntitlement_localizedEntitlementsFromEntitlements_pass_useCachedTemplates_completion___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v3 = *(void *)(a1 + 48);
  id v4 = a2;
  id v5 = [v4 entitlementTemplate];
  id v6 = [v4 value];
  BOOL v7 = [v4 templateFields];
  id v8 = +[PKDisplayablePassEntitlement _displayableEntitlementFromEntitlementTemplateType:carKeyEntitlementValue:templateFields:entitlementTemplates:sharedEntitlement:entitlement:pass:](v3, v5, v6, v7, *(void **)(a1 + 32), 0, v4, *(void **)(a1 + 40));

  return v8;
}

+ (void)_entitlementTemplatesUsingCachedTemplates:(void *)a3 completion:
{
  id v4 = a3;
  self;
  id v5 = objc_alloc_init(PKMAEntitlementTemplateManager);
  id v6 = v5;
  if (a2)
  {
    BOOL v7 = [(PKMAEntitlementTemplateManager *)v5 cachedEntitlementTemplates];
    v4[2](v4, v7);
  }
  else
  {
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = __85__PKDisplayablePassEntitlement__entitlementTemplatesUsingCachedTemplates_completion___block_invoke;
    v8[3] = &unk_1E56D9348;
    id v9 = v4;
    [(PKMAEntitlementTemplateManager *)v6 entitlementTemplates:v8];
  }
}

+ (id)localizedEntitlementsFromDisplayableEntitlements:(id)a3 pass:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v11 = 0;
  id v12 = &v11;
  uint64_t v13 = 0x3032000000;
  id v14 = __Block_byref_object_copy__4;
  id v15 = __Block_byref_object_dispose__4;
  id v16 = 0;
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __86__PKDisplayablePassEntitlement_localizedEntitlementsFromDisplayableEntitlements_pass___block_invoke;
  v10[3] = &unk_1E56D86F8;
  v10[4] = &v11;
  [a1 localizedEntitlementsFromDisplayableEntitlements:v6 pass:v7 useCachedTemplates:1 completion:v10];
  id v8 = (id)v12[5];
  _Block_object_dispose(&v11, 8);

  return v8;
}

void __86__PKDisplayablePassEntitlement_localizedEntitlementsFromDisplayableEntitlements_pass___block_invoke(uint64_t a1, void *a2)
{
}

+ (void)localizedEntitlementsFromDisplayableEntitlements:(id)a3 pass:(id)a4 useCachedTemplates:(BOOL)a5 completion:(id)a6
{
  BOOL v7 = a5;
  id v10 = a3;
  id v11 = a4;
  id v12 = a6;
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __116__PKDisplayablePassEntitlement_localizedEntitlementsFromDisplayableEntitlements_pass_useCachedTemplates_completion___block_invoke;
  v16[3] = &unk_1E56DCA50;
  id v17 = v10;
  id v18 = v11;
  id v19 = v12;
  id v20 = a1;
  id v13 = v12;
  id v14 = v11;
  id v15 = v10;
  +[PKDisplayablePassEntitlement _entitlementTemplatesUsingCachedTemplates:completion:]((uint64_t)a1, v7, v16);
}

void __116__PKDisplayablePassEntitlement_localizedEntitlementsFromDisplayableEntitlements_pass_useCachedTemplates_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __116__PKDisplayablePassEntitlement_localizedEntitlementsFromDisplayableEntitlements_pass_useCachedTemplates_completion___block_invoke_2;
  v7[3] = &unk_1E56DCA78;
  uint64_t v10 = *(void *)(a1 + 56);
  id v8 = v3;
  id v4 = *(void **)(a1 + 32);
  id v9 = *(id *)(a1 + 40);
  id v5 = v3;
  id v6 = objc_msgSend(v4, "pk_createArrayBySafelyApplyingBlock:", v7);
  (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
}

id __116__PKDisplayablePassEntitlement_localizedEntitlementsFromDisplayableEntitlements_pass_useCachedTemplates_completion___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v3 = *(void *)(a1 + 48);
  id v4 = (void *)a2[1];
  id v5 = a2;
  id v6 = [v5 value];
  BOOL v7 = (void *)v5[2];
  id v8 = *(void **)(a1 + 32);
  id v9 = [v5 sharedEntitlement];
  uint64_t v10 = [v5 entitlement];

  id v11 = +[PKDisplayablePassEntitlement _displayableEntitlementFromEntitlementTemplateType:carKeyEntitlementValue:templateFields:entitlementTemplates:sharedEntitlement:entitlement:pass:](v3, v4, v6, v7, v8, v9, v10, *(void **)(a1 + 40));

  return v11;
}

void __177__PKDisplayablePassEntitlement__displayableEntitlementFromEntitlementTemplateType_carKeyEntitlementValue_templateFields_entitlementTemplates_sharedEntitlement_entitlement_pass___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __177__PKDisplayablePassEntitlement__displayableEntitlementFromEntitlementTemplateType_carKeyEntitlementValue_templateFields_entitlementTemplates_sharedEntitlement_entitlement_pass___block_invoke_2;
  v4[3] = &unk_1E56DCAA0;
  id v5 = *(id *)(a1 + 32);
  [a3 enumerateKeysAndObjectsUsingBlock:v4];
}

void __177__PKDisplayablePassEntitlement__displayableEntitlementFromEntitlementTemplateType_carKeyEntitlementValue_templateFields_entitlementTemplates_sharedEntitlement_entitlement_pass___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v6 = a2;
  id v5 = a3;
  if ([*(id *)(a1 + 32) length]) {
    [*(id *)(a1 + 32) appendString:@", "];
  }
  [*(id *)(a1 + 32) appendFormat:@"%@: %@", v6, v5];
}

void __85__PKDisplayablePassEntitlement__entitlementTemplatesUsingCachedTemplates_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  BOOL v7 = v6;
  if (!v5 || v6)
  {
    id v9 = PKLogFacilityTypeGetObject(0x21uLL);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      int v10 = 138412290;
      id v11 = v7;
      _os_log_impl(&dword_190E10000, v9, OS_LOG_TYPE_DEFAULT, "Failed to fetch entitlement templates: %@", (uint8_t *)&v10, 0xCu);
    }

    id v8 = *(void (**)(void))(*(void *)(a1 + 32) + 16);
  }
  else
  {
    id v8 = *(void (**)(void))(*(void *)(a1 + 32) + 16);
  }
  v8();
}

- (PKDisplayablePassEntitlement)initWithDictionary:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    if (self)
    {
      v31.receiver = self;
      v31.super_class = (Class)PKDisplayablePassEntitlement;
      self = [(PKDisplayablePassEntitlement *)&v31 init];
      if (self)
      {
        id v5 = [v4 PKStringForKey:@"localizedTitle"];
        localizedTitle = self->_localizedTitle;
        self->_localizedTitle = v5;

        BOOL v7 = [v4 PKStringForKey:@"localizedSubtitle"];
        localizedSubtitle = self->_localizedSubtitle;
        self->_localizedSubtitle = v7;

        id v9 = [v4 PKStringForKey:@"localizedGroup"];
        localizedGroup = self->_localizedGroup;
        self->_localizedGroup = v9;

        id v11 = [v4 PKNumberForKey:@"value"];
        value = self->_value;
        self->_value = v11;

        id v13 = [PKPassEntitlement alloc];
        id v14 = [v4 PKDictionaryForKey:@"entitlement"];
        id v15 = [(PKPassEntitlement *)v13 initWithDictionary:v14];
        entitlement = self->_entitlement;
        self->_entitlement = v15;

        id v17 = [PKPassSharedEntitlement alloc];
        id v18 = [v4 PKDictionaryForKey:@"sharedEntitlement"];
        id v19 = [(PKPassSharedEntitlement *)v17 initWithDictionary:v18];
        sharedEntitlement = self->_sharedEntitlement;
        self->_sharedEntitlement = v19;

        v21 = [v4 PKStringForKey:@"entitlementTemplate"];
        entitlementTemplate = self->_entitlementTemplate;
        self->_entitlementTemplate = v21;

        v23 = [v4 PKDictionaryForKey:@"templateFields"];
        templateFields = self->_templateFields;
        self->_templateFields = v23;

        int v25 = [v4 PKStringForKey:@"iconName"];
        iconName = self->_iconName;
        self->_iconName = v25;

        uint64_t v27 = [v4 PKStringForKey:@"displayStyle"];
        self->_displayStyle = PKPassEntitlementDisplayStyleFromString(v27);

        self->_clearGroupWhenSelected = [v4 PKBoolForKey:@"clearGroupWhenSelected"];
        v28 = [v4 PKNumberForKey:@"groupPriority"];
        self->_groupPriority = [v28 integerValue];
      }
    }
    self = self;
    v29 = self;
  }
  else
  {
    v29 = 0;
  }

  return v29;
}

- (id)dictionaryRepresentation
{
  id v3 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  [v3 setObject:self->_localizedTitle forKeyedSubscript:@"localizedTitle"];
  [v3 setObject:self->_localizedSubtitle forKeyedSubscript:@"localizedSubtitle"];
  [v3 setObject:self->_localizedGroup forKeyedSubscript:@"localizedGroup"];
  [v3 setObject:self->_value forKeyedSubscript:@"value"];
  id v4 = [(PKPassEntitlement *)self->_entitlement dictionaryRepresentation];
  [v3 setObject:v4 forKeyedSubscript:@"entitlement"];

  id v5 = [(PKPassSharedEntitlement *)self->_sharedEntitlement dictionaryRepresentation];
  [v3 setObject:v5 forKeyedSubscript:@"sharedEntitlement"];

  [v3 setObject:self->_entitlementTemplate forKeyedSubscript:@"entitlementTemplate"];
  [v3 setObject:self->_templateFields forKeyedSubscript:@"templateFields"];
  [v3 setObject:self->_iconName forKeyedSubscript:@"iconName"];
  id v6 = PKPassEntitlementDisplayStyleToString(self->_displayStyle);
  [v3 setObject:v6 forKeyedSubscript:@"displayStyle"];

  BOOL v7 = [NSNumber numberWithBool:self->_clearGroupWhenSelected];
  [v3 setObject:v7 forKeyedSubscript:@"clearGroupWhenSelected"];

  id v8 = [NSNumber numberWithInteger:self->_groupPriority];
  [v3 setObject:v8 forKeyedSubscript:@"groupPriority"];

  id v9 = (void *)[v3 copy];
  return v9;
}

- (void)replaceEntitlementWithSharedEntitlement:(id)a3
{
  id v4 = (PKPassSharedEntitlement *)a3;
  entitlement = self->_entitlement;
  self->_entitlement = 0;

  sharedEntitlement = self->_sharedEntitlement;
  self->_sharedEntitlement = v4;
}

- (void)replaceSharedEntitlementWithEntitlement:(id)a3
{
  id v4 = (PKPassEntitlement *)a3;
  sharedEntitlement = self->_sharedEntitlement;
  self->_sharedEntitlement = 0;

  entitlement = self->_entitlement;
  self->_entitlement = v4;
}

- (NSString)entitlementIdentifier
{
  id v3 = [(PKPassEntitlement *)self->_entitlement identifier];
  id v4 = v3;
  if (v3)
  {
    id v5 = v3;
  }
  else
  {
    id v5 = [(PKPassSharedEntitlement *)self->_sharedEntitlement entitlementIdentifier];
  }
  id v6 = v5;

  return (NSString *)v6;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (PKDisplayablePassEntitlement)initWithCoder:(id)a3
{
  id v4 = a3;
  v30.receiver = self;
  v30.super_class = (Class)PKDisplayablePassEntitlement;
  id v5 = [(PKDisplayablePassEntitlement *)&v30 init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"localizedTitle"];
    localizedTitle = v5->_localizedTitle;
    v5->_localizedTitle = (NSString *)v6;

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"localizedSubtitle"];
    localizedSubtitle = v5->_localizedSubtitle;
    v5->_localizedSubtitle = (NSString *)v8;

    uint64_t v10 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"localizedGroup"];
    localizedGroup = v5->_localizedGroup;
    v5->_localizedGroup = (NSString *)v10;

    uint64_t v12 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"sharedEntitlement"];
    sharedEntitlement = v5->_sharedEntitlement;
    v5->_sharedEntitlement = (PKPassSharedEntitlement *)v12;

    uint64_t v14 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"entitlement"];
    entitlement = v5->_entitlement;
    v5->_entitlement = (PKPassEntitlement *)v14;

    uint64_t v16 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"value"];
    value = v5->_value;
    v5->_value = (NSNumber *)v16;

    uint64_t v18 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"entitlementTemplate"];
    entitlementTemplate = v5->_entitlementTemplate;
    v5->_entitlementTemplate = (NSString *)v18;

    id v20 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v21 = objc_opt_class();
    uint64_t v22 = objc_opt_class();
    uint64_t v23 = objc_opt_class();
    v24 = objc_msgSend(v20, "setWithObjects:", v21, v22, v23, objc_opt_class(), 0);
    uint64_t v25 = [v4 decodeObjectOfClasses:v24 forKey:@"templateFields"];
    templateFields = v5->_templateFields;
    v5->_templateFields = (NSDictionary *)v25;

    uint64_t v27 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"iconName"];
    iconName = v5->_iconName;
    v5->_iconName = (NSString *)v27;

    v5->_displayStyle = [v4 decodeIntegerForKey:@"displayStyle"];
    v5->_clearGroupWhenSelected = [v4 decodeBoolForKey:@"clearGroupWhenSelected"];
    v5->_groupPriority = [v4 decodeIntegerForKey:@"groupPriority"];
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  localizedTitle = self->_localizedTitle;
  id v5 = a3;
  [v5 encodeObject:localizedTitle forKey:@"localizedTitle"];
  [v5 encodeObject:self->_localizedSubtitle forKey:@"localizedSubtitle"];
  [v5 encodeObject:self->_localizedGroup forKey:@"localizedGroup"];
  [v5 encodeObject:self->_sharedEntitlement forKey:@"sharedEntitlement"];
  [v5 encodeObject:self->_entitlement forKey:@"entitlement"];
  [v5 encodeObject:self->_value forKey:@"value"];
  [v5 encodeObject:self->_entitlementTemplate forKey:@"entitlementTemplate"];
  [v5 encodeObject:self->_templateFields forKey:@"templateFields"];
  [v5 encodeObject:self->_iconName forKey:@"iconName"];
  [v5 encodeInteger:self->_displayStyle forKey:@"displayStyle"];
  [v5 encodeBool:self->_clearGroupWhenSelected forKey:@"clearGroupWhenSelected"];
  [v5 encodeInteger:self->_groupPriority forKey:@"groupPriority"];
}

- (id)description
{
  id v3 = (void *)MEMORY[0x1E4F28E78];
  id v4 = (objc_class *)objc_opt_class();
  id v5 = NSStringFromClass(v4);
  uint64_t v6 = [v3 stringWithFormat:@"<%@: %p; ", v5, self];

  [v6 appendFormat:@"localizedTitle: '%@'; ", self->_localizedTitle];
  [v6 appendFormat:@"localizedSubtitle: '%@'; ", self->_localizedSubtitle];
  [v6 appendFormat:@"localizedGroup: '%@'; ", self->_localizedGroup];
  [v6 appendFormat:@"value: '%@'; ", self->_value];
  [v6 appendFormat:@"entitlementTemplate: '%@'; ", self->_entitlementTemplate];
  [v6 appendFormat:@"templateFields: '%@'; ", self->_templateFields];
  objc_msgSend(v6, "appendFormat:", @"clearGroupWhenSelected: '%i'; ", self->_clearGroupWhenSelected);
  [v6 appendFormat:@"iconName: '%@'; ", self->_iconName];
  objc_msgSend(v6, "appendFormat:", @"style: %lu; ", self->_displayStyle);
  if (self->_sharedEntitlement) {
    [v6 appendFormat:@"sharedEntitlement: '%@'; ", self->_sharedEntitlement];
  }
  else {
    [v6 appendFormat:@"entitlement: '%@'; ", self->_entitlement];
  }
  objc_msgSend(v6, "appendFormat:", @"groupPriority: %lu; ", self->_groupPriority);
  [v6 appendFormat:@">"];
  BOOL v7 = [NSString stringWithString:v6];

  return v7;
}

- (unint64_t)hash
{
  id v3 = [MEMORY[0x1E4F1CA48] array];
  id v4 = v3;
  if (self->_localizedTitle) {
    objc_msgSend(v3, "addObject:");
  }
  if (self->_localizedSubtitle) {
    objc_msgSend(v4, "addObject:");
  }
  if (self->_localizedGroup) {
    objc_msgSend(v4, "addObject:");
  }
  if (self->_sharedEntitlement) {
    objc_msgSend(v4, "addObject:");
  }
  if (self->_entitlement) {
    objc_msgSend(v4, "addObject:");
  }
  if (self->_value) {
    objc_msgSend(v4, "addObject:");
  }
  if (self->_entitlementTemplate) {
    objc_msgSend(v4, "addObject:");
  }
  if (self->_templateFields) {
    objc_msgSend(v4, "addObject:");
  }
  if (self->_iconName) {
    objc_msgSend(v4, "addObject:");
  }
  if (self->_displayStyle)
  {
    id v5 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:");
    [v4 addObject:v5];
  }
  uint64_t v6 = [NSNumber numberWithBool:self->_clearGroupWhenSelected];
  [v4 addObject:v6];

  uint64_t v7 = PKCombinedHash(17, v4);
  unint64_t v8 = self->_groupPriority - v7 + 32 * v7;

  return v8;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (PKDisplayablePassEntitlement *)a3;
  id v5 = v4;
  if (v4 == self)
  {
    LOBYTE(self) = 1;
  }
  else
  {
    if (v4)
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        uint64_t v6 = v5;
        if (!self)
        {
LABEL_56:

          goto LABEL_57;
        }
        localizedTitle = self->_localizedTitle;
        unint64_t v8 = v6->_localizedTitle;
        if (localizedTitle && v8)
        {
          if ((-[NSString isEqual:](localizedTitle, "isEqual:") & 1) == 0) {
            goto LABEL_55;
          }
        }
        else if (localizedTitle != v8)
        {
          goto LABEL_55;
        }
        localizedSubtitle = self->_localizedSubtitle;
        uint64_t v10 = v6->_localizedSubtitle;
        if (localizedSubtitle && v10)
        {
          if ((-[NSString isEqual:](localizedSubtitle, "isEqual:") & 1) == 0) {
            goto LABEL_55;
          }
        }
        else if (localizedSubtitle != v10)
        {
          goto LABEL_55;
        }
        localizedGroup = self->_localizedGroup;
        uint64_t v12 = v6->_localizedGroup;
        if (localizedGroup && v12)
        {
          if ((-[NSString isEqual:](localizedGroup, "isEqual:") & 1) == 0) {
            goto LABEL_55;
          }
        }
        else if (localizedGroup != v12)
        {
          goto LABEL_55;
        }
        sharedEntitlement = self->_sharedEntitlement;
        uint64_t v14 = v6->_sharedEntitlement;
        if (sharedEntitlement && v14)
        {
          if (!-[PKPassSharedEntitlement isEqual:](sharedEntitlement, "isEqual:")) {
            goto LABEL_55;
          }
        }
        else if (sharedEntitlement != v14)
        {
          goto LABEL_55;
        }
        entitlement = self->_entitlement;
        uint64_t v16 = v6->_entitlement;
        if (entitlement && v16)
        {
          if (!-[PKPassEntitlement isEqual:](entitlement, "isEqual:")) {
            goto LABEL_55;
          }
        }
        else if (entitlement != v16)
        {
          goto LABEL_55;
        }
        value = self->_value;
        uint64_t v18 = v6->_value;
        if (value && v18)
        {
          if ((-[NSNumber isEqual:](value, "isEqual:") & 1) == 0) {
            goto LABEL_55;
          }
        }
        else if (value != v18)
        {
          goto LABEL_55;
        }
        entitlementTemplate = self->_entitlementTemplate;
        id v20 = v6->_entitlementTemplate;
        if (entitlementTemplate && v20)
        {
          if ((-[NSString isEqual:](entitlementTemplate, "isEqual:") & 1) == 0) {
            goto LABEL_55;
          }
        }
        else if (entitlementTemplate != v20)
        {
          goto LABEL_55;
        }
        templateFields = self->_templateFields;
        uint64_t v22 = v6->_templateFields;
        if (templateFields && v22)
        {
          if ((-[NSDictionary isEqual:](templateFields, "isEqual:") & 1) == 0) {
            goto LABEL_55;
          }
        }
        else if (templateFields != v22)
        {
          goto LABEL_55;
        }
        if (self->_clearGroupWhenSelected == v6->_clearGroupWhenSelected)
        {
          iconName = self->_iconName;
          v24 = v6->_iconName;
          if (iconName && v24)
          {
            if ((-[NSString isEqual:](iconName, "isEqual:") & 1) == 0) {
              goto LABEL_55;
            }
          }
          else if (iconName != v24)
          {
            goto LABEL_55;
          }
          if (self->_displayStyle == v6->_displayStyle)
          {
            LOBYTE(self) = self->_groupPriority == v6->_groupPriority;
            goto LABEL_56;
          }
        }
LABEL_55:
        LOBYTE(self) = 0;
        goto LABEL_56;
      }
    }
    LOBYTE(self) = 0;
  }
LABEL_57:

  return (char)self;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = +[PKDisplayablePassEntitlement allocWithZone:a3];
  if (v4)
  {
    v25.receiver = v4;
    v25.super_class = (Class)PKDisplayablePassEntitlement;
    id v5 = [(PKDisplayablePassEntitlement *)&v25 init];
  }
  else
  {
    id v5 = 0;
  }
  uint64_t v6 = [(NSString *)self->_localizedTitle copy];
  localizedTitle = v5->_localizedTitle;
  v5->_localizedTitle = (NSString *)v6;

  uint64_t v8 = [(NSString *)self->_localizedSubtitle copy];
  localizedSubtitle = v5->_localizedSubtitle;
  v5->_localizedSubtitle = (NSString *)v8;

  uint64_t v10 = [(NSString *)self->_localizedGroup copy];
  localizedGroup = v5->_localizedGroup;
  v5->_localizedGroup = (NSString *)v10;

  uint64_t v12 = [(PKPassSharedEntitlement *)self->_sharedEntitlement copy];
  sharedEntitlement = v5->_sharedEntitlement;
  v5->_sharedEntitlement = (PKPassSharedEntitlement *)v12;

  uint64_t v14 = [(PKPassEntitlement *)self->_entitlement copy];
  entitlement = v5->_entitlement;
  v5->_entitlement = (PKPassEntitlement *)v14;

  uint64_t v16 = [(NSNumber *)self->_value copy];
  value = v5->_value;
  v5->_value = (NSNumber *)v16;

  uint64_t v18 = [(NSString *)self->_entitlementTemplate copy];
  entitlementTemplate = v5->_entitlementTemplate;
  v5->_entitlementTemplate = (NSString *)v18;

  uint64_t v20 = [(NSDictionary *)self->_templateFields copy];
  templateFields = v5->_templateFields;
  v5->_templateFields = (NSDictionary *)v20;

  v5->_clearGroupWhenSelected = self->_clearGroupWhenSelected;
  uint64_t v22 = [(NSString *)self->_iconName copy];
  iconName = v5->_iconName;
  v5->_iconName = (NSString *)v22;

  v5->_displayStyle = self->_displayStyle;
  v5->_groupPriority = self->_groupPriority;
  return v5;
}

- (int64_t)compare:(id)a3
{
  id v4 = a3;
  id v5 = [(PKPassEntitlement *)self->_entitlement value];
  uint64_t v6 = [v4 entitlement];
  uint64_t v7 = [v6 value];

  if (v5) {
    BOOL v8 = v7 == 0;
  }
  else {
    BOOL v8 = 1;
  }
  if (v8)
  {
    localizedTitle = self->_localizedTitle;
    uint64_t v10 = [v4 localizedTitle];
    int64_t v11 = [(NSString *)localizedTitle compare:v10];
  }
  else
  {
    int64_t v11 = [v5 compare:v7];
  }

  return v11;
}

- (NSString)localizedTitle
{
  return self->_localizedTitle;
}

- (void)setLocalizedTitle:(id)a3
{
}

- (NSString)localizedSubtitle
{
  return self->_localizedSubtitle;
}

- (void)setLocalizedSubtitle:(id)a3
{
}

- (NSString)localizedGroup
{
  return self->_localizedGroup;
}

- (void)setLocalizedGroup:(id)a3
{
}

- (NSNumber)value
{
  return self->_value;
}

- (void)setValue:(id)a3
{
}

- (NSString)iconName
{
  return self->_iconName;
}

- (void)setIconName:(id)a3
{
}

- (unint64_t)displayStyle
{
  return self->_displayStyle;
}

- (void)setDisplayStyle:(unint64_t)a3
{
  self->_displayStyle = a3;
}

- (int64_t)groupPriority
{
  return self->_groupPriority;
}

- (void)setGroupPriority:(int64_t)a3
{
  self->_groupPriority = a3;
}

- (BOOL)clearGroupWhenSelected
{
  return self->_clearGroupWhenSelected;
}

- (void)setClearGroupWhenSelected:(BOOL)a3
{
  self->_clearGroupWhenSelected = a3;
}

- (PKPassSharedEntitlement)sharedEntitlement
{
  return self->_sharedEntitlement;
}

- (PKPassEntitlement)entitlement
{
  return self->_entitlement;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_entitlement, 0);
  objc_storeStrong((id *)&self->_sharedEntitlement, 0);
  objc_storeStrong((id *)&self->_iconName, 0);
  objc_storeStrong((id *)&self->_value, 0);
  objc_storeStrong((id *)&self->_localizedGroup, 0);
  objc_storeStrong((id *)&self->_localizedSubtitle, 0);
  objc_storeStrong((id *)&self->_localizedTitle, 0);
  objc_storeStrong((id *)&self->_templateFields, 0);
  objc_storeStrong((id *)&self->_entitlementTemplate, 0);
}

@end