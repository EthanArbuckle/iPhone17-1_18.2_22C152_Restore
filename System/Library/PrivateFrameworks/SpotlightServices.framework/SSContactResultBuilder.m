@interface SSContactResultBuilder
+ (BOOL)doesNotContainObject:(id)a3 inArray:(id)a4;
+ (BOOL)isCoreSpotlightResult;
+ (BOOL)supportsResult:(id)a3;
+ (id)bundleId;
+ (id)labeledValuesFromStrings:(id)a3 labeledValues:(id)a4 withStringForLabeledValueBlock:(id)a5 labeledValueForStringBlock:(id)a6;
- (CNMutableContact)contact;
- (NSString)displayName;
- (NSString)fullName;
- (NSString)personIdentifier;
- (NSString)personQueryIdentifier;
- (NSString)realContactIdentifier;
- (SSContactResultBuilder)initWithResult:(id)a3;
- (SSContactResultBuilder)initWithResult:(id)a3 contactEntity:(id)a4 contact:(id)a5;
- (id)buildAction;
- (id)buildBackgroundColor;
- (id)buildBadgingImageWithThumbnail:(id)a3;
- (id)buildCommand;
- (id)buildDescriptions;
- (id)buildFooterResultForEntity;
- (id)buildFootnote;
- (id)buildHeaderResultForEntity;
- (id)buildPreviewButtonItems;
- (id)buildPreviewCommand;
- (id)buildResult;
- (id)buildSocialMediaResultForEntity;
- (id)buildThumbnail;
- (id)buildTitle;
- (int)resultType;
- (void)setContact:(id)a3;
- (void)setDisplayName:(id)a3;
- (void)setPersonIdentifier:(id)a3;
- (void)setPersonQueryIdentifier:(id)a3;
- (void)setRealContactIdentifier:(id)a3;
- (void)setResultType:(int)a3;
@end

@implementation SSContactResultBuilder

+ (id)bundleId
{
  return @"com.apple.MobileAddressBook";
}

+ (BOOL)isCoreSpotlightResult
{
  return 1;
}

+ (BOOL)supportsResult:(id)a3
{
  id v4 = a3;
  if (supportsResult__onceToken != -1) {
    dispatch_once(&supportsResult__onceToken, &__block_literal_global_33);
  }
  v11.receiver = a1;
  v11.super_class = (Class)&OBJC_METACLASS___SSContactResultBuilder;
  if (objc_msgSendSuper2(&v11, sel_supportsResult_, v4))
  {
    char v5 = 1;
  }
  else
  {
    v6 = (void *)supportsResult__contactResultBundleIds;
    v7 = [v4 resultBundleId];
    char v5 = [v6 containsObject:v7];
  }
  v8 = [v4 valueForAttribute:*MEMORY[0x1E4F230D0] withType:objc_opt_class()];
  char v9 = [v8 isEqual:@"vCard"];

  return v5 & (v9 ^ 1);
}

void __41__SSContactResultBuilder_supportsResult___block_invoke()
{
  v4[2] = *MEMORY[0x1E4F143B8];
  v0 = (void *)MEMORY[0x1E4F1CAD0];
  v4[0] = @"com.apple.spotlight.contacts";
  v4[1] = @"com.apple.MobileAddressBook";
  v1 = [MEMORY[0x1E4F1C978] arrayWithObjects:v4 count:2];
  uint64_t v2 = [v0 setWithArray:v1];
  v3 = (void *)supportsResult__contactResultBundleIds;
  supportsResult__contactResultBundleIds = v2;
}

+ (BOOL)doesNotContainObject:(id)a3 inArray:(id)a4
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  id v6 = a4;
  uint64_t v7 = [v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v15;
    while (2)
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v15 != v9) {
          objc_enumerationMutation(v6);
        }
        uint64_t v11 = *(void *)(*((void *)&v14 + 1) + 8 * i);
        if ((objc_msgSend(v5, "isEqual:", v11, (void)v14) & 1) == 0)
        {
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) == 0) {
            continue;
          }
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) == 0 || ([v5 isLikePhoneNumber:v11] & 1) == 0) {
            continue;
          }
        }
        BOOL v12 = 0;
        goto LABEL_14;
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
      if (v8) {
        continue;
      }
      break;
    }
  }
  BOOL v12 = 1;
LABEL_14:

  return v12;
}

+ (id)labeledValuesFromStrings:(id)a3 labeledValues:(id)a4 withStringForLabeledValueBlock:(id)a5 labeledValueForStringBlock:(id)a6
{
  uint64_t v42 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  v10 = (void (**)(id, void))a6;
  id v31 = (id)objc_opt_new();
  uint64_t v11 = objc_opt_new();
  long long v36 = 0u;
  long long v37 = 0u;
  long long v38 = 0u;
  long long v39 = 0u;
  obuint64_t j = v9;
  uint64_t v12 = [obj countByEnumeratingWithState:&v36 objects:v41 count:16];
  if (v12)
  {
    uint64_t v13 = v12;
    uint64_t v14 = *(void *)v37;
    do
    {
      for (uint64_t i = 0; i != v13; ++i)
      {
        if (*(void *)v37 != v14) {
          objc_enumerationMutation(obj);
        }
        long long v16 = *(void **)(*((void *)&v36 + 1) + 8 * i);
        long long v17 = objc_opt_class();
        v18 = [v16 value];
        LODWORD(v17) = [v17 doesNotContainObject:v18 inArray:v11];

        if (v17)
        {
          [v31 addObject:v16];
          uint64_t v19 = [v16 value];
          [v11 addObject:v19];
        }
      }
      uint64_t v13 = [obj countByEnumeratingWithState:&v36 objects:v41 count:16];
    }
    while (v13);
  }

  long long v34 = 0u;
  long long v35 = 0u;
  long long v32 = 0u;
  long long v33 = 0u;
  id v29 = v8;
  uint64_t v20 = [v29 countByEnumeratingWithState:&v32 objects:v40 count:16];
  if (v20)
  {
    uint64_t v21 = v20;
    uint64_t v22 = *(void *)v33;
    do
    {
      for (uint64_t j = 0; j != v21; ++j)
      {
        if (*(void *)v33 != v22) {
          objc_enumerationMutation(v29);
        }
        v24 = v10[2](v10, *(void *)(*((void *)&v32 + 1) + 8 * j));
        v25 = objc_opt_class();
        v26 = [v24 value];
        LODWORD(v25) = [v25 doesNotContainObject:v26 inArray:v11];

        if (v25)
        {
          [v31 addObject:v24];
          v27 = [v24 value];
          [v11 addObject:v27];
        }
      }
      uint64_t v21 = [v29 countByEnumeratingWithState:&v32 objects:v40 count:16];
    }
    while (v21);
  }

  return v31;
}

- (SSContactResultBuilder)initWithResult:(id)a3
{
  return [(SSContactResultBuilder *)self initWithResult:a3 contactEntity:0 contact:0];
}

- (SSContactResultBuilder)initWithResult:(id)a3 contactEntity:(id)a4 contact:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v66.receiver = self;
  v66.super_class = (Class)SSContactResultBuilder;
  uint64_t v11 = [(SSResultBuilder *)&v66 initWithResult:v8];
  if (!v11) {
    goto LABEL_61;
  }
  uint64_t v12 = [v8 personIdentifier];
  if (v12)
  {
    [(SSContactResultBuilder *)v11 setPersonIdentifier:v12];
  }
  else
  {
    uint64_t v13 = [v9 personIdentifier];
    [(SSContactResultBuilder *)v11 setPersonIdentifier:v13];
  }
  uint64_t v14 = [v8 personQueryIdentifier];
  if (v14)
  {
    [(SSContactResultBuilder *)v11 setPersonQueryIdentifier:v14];
  }
  else
  {
    long long v15 = [v9 personQueryIdentifier];
    [(SSContactResultBuilder *)v11 setPersonQueryIdentifier:v15];
  }
  long long v16 = [v8 valueForAttribute:*MEMORY[0x1E4F22CE8] withType:objc_opt_class()];
  if (v16)
  {
    [(SSContactResultBuilder *)v11 setDisplayName:v16];
  }
  else
  {
    long long v17 = [v9 name];
    [(SSContactResultBuilder *)v11 setDisplayName:v17];
  }
  if (v8)
  {
    -[SSContactResultBuilder setResultType:](v11, "setResultType:", [v8 type]);
  }
  else
  {
    v18 = [(SSContactResultBuilder *)v11 personIdentifier];
    if (v18) {
      uint64_t v19 = 37;
    }
    else {
      uint64_t v19 = 36;
    }
    [(SSContactResultBuilder *)v11 setResultType:v19];
  }
  uint64_t v20 = [v8 contactIdentifier];
  uint64_t v21 = v20;
  if (v20)
  {
    id v22 = v20;
  }
  else
  {
    v23 = [v8 valueForAttribute:*MEMORY[0x1E4F22C10] withType:objc_opt_class()];
    v24 = v23;
    if (v23)
    {
      id v25 = v23;
    }
    else
    {
      id v25 = [v9 contactIdentifier];
    }
    id v22 = v25;
  }
  [(SSContactResultBuilder *)v11 setRealContactIdentifier:v22];
  id v65 = v10;
  if (v9)
  {
    id v26 = v9;
    goto LABEL_32;
  }
  id v26 = (id)objc_opt_new();
  if (v26)
  {
LABEL_32:
    long long v35 = (void *)[v10 mutableCopy];
    if (v22) {
      goto LABEL_33;
    }
LABEL_41:
    int v38 = 1;
    if (!v35) {
      goto LABEL_42;
    }
    goto LABEL_44;
  }
  v27 = [(SSContactResultBuilder *)v11 personQueryIdentifier];

  if (v27)
  {
    v28 = [(SSContactResultBuilder *)v11 personQueryIdentifier];
    if (v22)
    {
      uint64_t v29 = +[SPSearchContactEntity updatePersonQueryIdentifier:v28 withContactIdentifier:v22];

      v28 = (void *)v29;
    }
    v30 = [(SSContactResultBuilder *)v11 personIdentifier];

    if (v30)
    {
      id v31 = [(SSContactResultBuilder *)v11 personIdentifier];
      uint64_t v32 = +[SPSearchContactEntity updatePersonQueryIdentifier:v28 withContactIdentifier:v31];

      v28 = (void *)v32;
    }
    long long v33 = [(SSResultBuilder *)v11 result];
    long long v34 = [v33 completion];
    id v26 = +[SPSearchEntity searchEntityWithPersonQueryIdentifier:v28 personName:v34 fromSuggestion:1];

    id v10 = v65;
    goto LABEL_32;
  }
  if (!v22)
  {
    long long v35 = (void *)[v10 mutableCopy];
    id v26 = 0;
    goto LABEL_41;
  }
  id v26 = +[SPSearchEntity searchEntityWithContactIdentifier:v22 fromSuggestion:0];
  long long v35 = (void *)[v10 mutableCopy];
LABEL_33:
  long long v36 = [v10 identifier];
  char v37 = [v22 isEqual:v36];

  if (v37)
  {
    int v38 = 0;
    if (!v35) {
      goto LABEL_42;
    }
  }
  else
  {
    long long v39 = +[SSContactStore contactForContactIdentifier:v22];
    uint64_t v40 = [v39 mutableCopy];

    int v38 = 0;
    long long v35 = (void *)v40;
    if (!v40)
    {
LABEL_42:
      v41 = [v26 contact];
      long long v35 = (void *)[v41 mutableCopy];

      if (!v35) {
        long long v35 = objc_opt_new();
      }
    }
  }
LABEL_44:
  if (v38)
  {
    uint64_t v42 = [(SSContactResultBuilder *)v11 displayName];
    v43 = +[SSNameFormatManager contactFromName:v42];
    uint64_t v44 = [v43 mutableCopy];

    long long v35 = (void *)v44;
  }
  v45 = [v26 emailAddresses];
  id v63 = v9;
  if ([v45 count]) {
    [v26 emailAddresses];
  }
  else {
  v46 = [v8 valueForAttribute:*MEMORY[0x1E4F22D48] withType:objc_opt_class()];
  }

  v47 = objc_opt_class();
  v48 = [v35 emailAddresses];
  v49 = [v47 labeledValuesFromStrings:v46 labeledValues:v48 withStringForLabeledValueBlock:&__block_literal_global_28 labeledValueForStringBlock:&__block_literal_global_31_0];
  [v35 setEmailAddresses:v49];

  v50 = [v26 rawPhoneNumbers];
  if ([v50 count]) {
    [v26 rawPhoneNumbers];
  }
  else {
  v51 = [v8 valueForAttribute:*MEMORY[0x1E4F23230] withType:objc_opt_class()];
  }

  v52 = objc_opt_class();
  v53 = [v35 phoneNumbers];
  v54 = [v52 labeledValuesFromStrings:v51 labeledValues:v53 withStringForLabeledValueBlock:&__block_literal_global_34 labeledValueForStringBlock:&__block_literal_global_36];
  [v35 setPhoneNumbers:v54];

  v55 = [v26 addresses];
  if ([v55 count]) {
    [v26 addresses];
  }
  else {
  v56 = [v8 valueForAttribute:*MEMORY[0x1E4F22B00] withType:objc_opt_class()];
  }

  v57 = [v35 postalAddresses];
  uint64_t v58 = [v57 count];

  if (!v58)
  {
    v59 = [(id)objc_opt_class() labeledValuesFromStrings:v56 labeledValues:0 withStringForLabeledValueBlock:&__block_literal_global_38 labeledValueForStringBlock:&__block_literal_global_41];
    [v35 setPostalAddresses:v59];
  }
  v60 = objc_msgSend(v35, "birthday", v63);
  if (v60)
  {
    [v35 setBirthday:v60];
  }
  else
  {
    v61 = [v26 birthdayComponents];
    [v35 setBirthday:v61];
  }
  [(SSContactResultBuilder *)v11 setContact:v35];

  id v9 = v64;
  id v10 = v65;
LABEL_61:

  return v11;
}

uint64_t __63__SSContactResultBuilder_initWithResult_contactEntity_contact___block_invoke(uint64_t a1, void *a2)
{
  return [a2 value];
}

id __63__SSContactResultBuilder_initWithResult_contactEntity_contact___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v2 = (objc_class *)MEMORY[0x1E4F1BA20];
  id v3 = a2;
  id v4 = (void *)[[v2 alloc] initWithLabel:0 value:v3];

  return v4;
}

id __63__SSContactResultBuilder_initWithResult_contactEntity_contact___block_invoke_3(uint64_t a1, void *a2)
{
  uint64_t v2 = [a2 value];
  id v3 = [v2 formattedStringValue];

  return v3;
}

id __63__SSContactResultBuilder_initWithResult_contactEntity_contact___block_invoke_4(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = [MEMORY[0x1E4F1BA70] phoneNumberWithStringValue:a2];
  id v3 = (void *)[objc_alloc(MEMORY[0x1E4F1BA20]) initWithLabel:0 value:v2];

  return v3;
}

id __63__SSContactResultBuilder_initWithResult_contactEntity_contact___block_invoke_5(uint64_t a1, void *a2)
{
  uint64_t v2 = (void *)MEMORY[0x1E4F1BA88];
  id v3 = [a2 value];
  id v4 = [v2 stringFromPostalAddress:v3 style:0];

  return v4;
}

id __63__SSContactResultBuilder_initWithResult_contactEntity_contact___block_invoke_6(uint64_t a1, void *a2)
{
  id v2 = a2;
  id v3 = objc_opt_new();
  id v4 = [v3 postalAddressFromString:v2];

  if (!v4)
  {
    id v4 = objc_opt_new();
    [v4 setStreet:v2];
  }
  id v5 = (void *)[objc_alloc(MEMORY[0x1E4F1BA20]) initWithLabel:0 value:v4];

  return v5;
}

- (NSString)fullName
{
  id v2 = (void *)MEMORY[0x1E4F1B910];
  id v3 = [(SSContactResultBuilder *)self contact];
  id v4 = [v2 stringFromContact:v3 style:0];

  return (NSString *)v4;
}

- (id)buildResult
{
  v8.receiver = self;
  v8.super_class = (Class)SSContactResultBuilder;
  id v3 = [(SSResultBuilder *)&v8 buildResult];
  id v4 = [(SSContactResultBuilder *)self realContactIdentifier];
  [v3 setContactIdentifier:v4];

  id v5 = [(SSContactResultBuilder *)self personIdentifier];
  [v3 setPersonIdentifier:v5];

  id v6 = [(SSContactResultBuilder *)self personQueryIdentifier];
  [v3 setPersonQueryIdentifier:v6];

  [v3 setResultBundleId:@"com.apple.MobileAddressBook"];
  [v3 setApplicationBundleIdentifier:@"com.apple.MobileAddressBook"];
  objc_msgSend(v3, "setType:", -[SSContactResultBuilder resultType](self, "resultType"));
  return v3;
}

- (id)buildHeaderResultForEntity
{
  v22[1] = *MEMORY[0x1E4F143B8];
  id v3 = [(SSContactResultBuilder *)self realContactIdentifier];
  id v4 = objc_opt_new();
  [v4 setContactIdentifier:v3];
  id v5 = [(SSContactResultBuilder *)self personIdentifier];
  [v4 setPersonIdentifier:v5];

  id v6 = [(SSContactResultBuilder *)self fullName];
  [v4 setDisplayName:v6];

  uint64_t v7 = objc_opt_new();
  [v7 setPerson:v4];
  [v7 setCardSectionId:@"com.apple.spotlight.contactHeader"];
  objc_super v8 = objc_opt_new();
  id v9 = objc_opt_new();
  [v8 setCollectionStyle:v9];

  v22[0] = v7;
  id v10 = [MEMORY[0x1E4F1C978] arrayWithObjects:v22 count:1];
  [v8 setCardSections:v10];

  uint64_t v11 = objc_opt_new();
  uint64_t v21 = v8;
  uint64_t v12 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v21 count:1];
  [v11 setCardSections:v12];

  uint64_t v13 = [(SSContactResultBuilder *)self buildResult];
  [v13 setResultBundleId:@"com.apple.MobileAddressBook"];
  [v13 setApplicationBundleIdentifier:0];
  [v13 setContactIdentifier:v3];
  uint64_t v14 = [(SSContactResultBuilder *)self personIdentifier];
  [v13 setPersonIdentifier:v14];

  [v13 setInlineCard:v11];
  [v13 setCompactCard:0];
  if (v3)
  {
    long long v15 = v3;
  }
  else
  {
    long long v15 = [(SSContactResultBuilder *)self personIdentifier];
  }
  long long v16 = v15;
  if (v15) {
    long long v17 = v15;
  }
  else {
    long long v17 = @"unknown";
  }
  v18 = [@"com.apple.spotlight.contactHeader" stringByAppendingString:v17];
  [v13 setIdentifier:v18];

  [v13 setNoGoTakeover:1];
  uint64_t v19 = [v13 identifier];
  [v7 setResultIdentifier:v19];

  return v13;
}

- (id)buildFooterResultForEntity
{
  uint64_t v137 = *MEMORY[0x1E4F143B8];
  if (buildFooterResultForEntity_onceToken != -1) {
    dispatch_once(&buildFooterResultForEntity_onceToken, &__block_literal_global_55_0);
  }
  id v3 = objc_opt_new();
  v109 = self;
  id v4 = [(SSContactResultBuilder *)self contact];
  id v5 = [v4 phoneNumbers];
  uint64_t v6 = [v5 count];

  v104 = v4;
  v105 = v3;
  if (v6)
  {
    uint64_t v7 = objc_opt_new();
    long long v123 = 0u;
    long long v124 = 0u;
    long long v125 = 0u;
    long long v126 = 0u;
    obuint64_t j = [v4 phoneNumbers];
    uint64_t v8 = [obj countByEnumeratingWithState:&v123 objects:v136 count:16];
    if (v8)
    {
      uint64_t v9 = v8;
      uint64_t v10 = *(void *)v124;
      do
      {
        for (uint64_t i = 0; i != v9; ++i)
        {
          if (*(void *)v124 != v10) {
            objc_enumerationMutation(obj);
          }
          uint64_t v12 = *(void **)(*((void *)&v123 + 1) + 8 * i);
          uint64_t v13 = objc_opt_new();
          uint64_t v14 = (void *)MEMORY[0x1E4F1BA20];
          long long v15 = [v12 label];
          long long v16 = [v14 localizedStringForLabel:v15];

          if ([v16 length])
          {
            [v13 setKey:v16];
          }
          else
          {
            long long v17 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
            v18 = [v17 localizedStringForKey:@"PHONE_LABEL" value:&stru_1F1824018 table:@"SpotlightServices"];
            [v13 setKey:v18];
          }
          uint64_t v19 = [v12 value];
          uint64_t v20 = [v19 formattedStringValue];

          uint64_t v21 = [(SSContactResultBuilder *)v109 contact];
          id v22 = +[SSCommandConfiguration commandButtonItemForPhoneNumber:v20 contact:v21];
          v135 = v22;
          v23 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v135 count:1];
          [v13 setValues:v23];

          [v7 addObject:v13];
        }
        uint64_t v9 = [obj countByEnumeratingWithState:&v123 objects:v136 count:16];
      }
      while (v9);
    }

    v24 = objc_opt_new();
    [v24 setInfoTuples:v7];
    id v3 = v105;
    [v105 addObject:v24];

    id v4 = v104;
  }
  id v25 = [v4 emailAddresses];
  uint64_t v26 = [v25 count];

  if (v26)
  {
    v27 = objc_opt_new();
    long long v119 = 0u;
    long long v120 = 0u;
    long long v121 = 0u;
    long long v122 = 0u;
    v28 = [v4 emailAddresses];
    uint64_t v29 = [v28 countByEnumeratingWithState:&v119 objects:v134 count:16];
    if (v29)
    {
      uint64_t v30 = v29;
      uint64_t v31 = *(void *)v120;
      do
      {
        for (uint64_t j = 0; j != v30; ++j)
        {
          if (*(void *)v120 != v31) {
            objc_enumerationMutation(v28);
          }
          long long v33 = *(void **)(*((void *)&v119 + 1) + 8 * j);
          long long v34 = objc_opt_new();
          long long v35 = (void *)MEMORY[0x1E4F1BA20];
          long long v36 = [v33 label];
          char v37 = [v35 localizedStringForLabel:v36];

          if ([v37 length])
          {
            [v34 setKey:v37];
          }
          else
          {
            int v38 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
            long long v39 = [v38 localizedStringForKey:@"EMAIL_LABEL" value:&stru_1F1824018 table:@"SpotlightServices"];
            [v34 setKey:v39];
          }
          uint64_t v40 = [v33 value];
          v41 = +[SSCommandConfiguration commandButtonItemForEmail:v40];
          v133 = v41;
          uint64_t v42 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v133 count:1];
          [v34 setValues:v42];

          [v27 addObject:v34];
        }
        uint64_t v30 = [v28 countByEnumeratingWithState:&v119 objects:v134 count:16];
      }
      while (v30);
    }

    v43 = objc_opt_new();
    [v43 setInfoTuples:v27];
    id v3 = v105;
    [v105 addObject:v43];

    id v4 = v104;
  }
  uint64_t v44 = [v4 postalAddresses];
  uint64_t v45 = [v44 count];

  if (v45)
  {
    v46 = objc_opt_new();
    long long v115 = 0u;
    long long v116 = 0u;
    long long v117 = 0u;
    long long v118 = 0u;
    id obja = [v4 postalAddresses];
    uint64_t v47 = [obja countByEnumeratingWithState:&v115 objects:v132 count:16];
    if (v47)
    {
      uint64_t v48 = v47;
      uint64_t v49 = *(void *)v116;
      do
      {
        for (uint64_t k = 0; k != v48; ++k)
        {
          if (*(void *)v116 != v49) {
            objc_enumerationMutation(obja);
          }
          v51 = *(void **)(*((void *)&v115 + 1) + 8 * k);
          v52 = objc_opt_new();
          v53 = (void *)MEMORY[0x1E4F1BA20];
          v54 = [v51 label];
          v55 = [v53 localizedStringForLabel:v54];

          if ([v55 length])
          {
            [v52 setKey:v55];
          }
          else
          {
            v56 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
            v57 = [v56 localizedStringForKey:@"ADDRESS_LABEL" value:&stru_1F1824018 table:@"SpotlightServices"];
            [v52 setKey:v57];
          }
          uint64_t v58 = (void *)MEMORY[0x1E4F1BA88];
          v59 = [v51 value];
          v60 = [v58 stringFromPostalAddress:v59 style:0];

          v61 = +[SSCommandConfiguration commandButtonItemForAddressLocation:v60];
          v131 = v61;
          v62 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v131 count:1];
          [v52 setValues:v62];

          [v46 addObject:v52];
        }
        uint64_t v48 = [obja countByEnumeratingWithState:&v115 objects:v132 count:16];
      }
      while (v48);
    }

    id v63 = objc_opt_new();
    [v63 setInfoTuples:v46];
    id v3 = v105;
    [v105 addObject:v63];

    id v4 = v104;
  }
  v64 = [v4 birthday];

  if (v64)
  {
    id v65 = objc_opt_new();
    objc_super v66 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
    v67 = [v66 localizedStringForKey:@"BIRTHDAY_LABEL" value:&stru_1F1824018 table:@"SpotlightServices"];
    [v65 setKey:v67];

    v68 = [v4 birthday];
    v69 = +[SSCommandConfiguration commandButtonItemForBirthday:v68];
    v130 = v69;
    v70 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v130 count:1];
    [v65 setValues:v70];

    v71 = objc_opt_new();
    v129 = v65;
    v72 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v129 count:1];
    [v71 setInfoTuples:v72];

    [v3 addObject:v71];
  }
  if ([v3 count])
  {
    v73 = objc_opt_new();
    [v73 setSymbolName:@"arrow.up.forward.app.fill"];
    [v73 setIsTemplate:1];
    id objb = [v4 identifier];
    v74 = objc_opt_new();
    [v74 setCoreSpotlightIdentifier:objb];
    if (isMacOS())
    {
      [v74 setApplicationBundleIdentifier:@"com.apple.AddressBook"];
      v75 = v109;
    }
    else
    {
      v75 = v109;
      v77 = [(id)objc_opt_class() bundleId];
      [v74 setApplicationBundleIdentifier:v77];
    }
    v78 = objc_opt_new();
    v79 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
    v80 = [v79 localizedStringForKey:@"OPEN_IN_CONTACTS_TITLE" value:&stru_1F1824018 table:@"SpotlightServices"];
    [v78 setTitle:v80];

    v110 = v73;
    [v78 setImage:v73];
    v103 = v74;
    [v78 setCommand:v74];
    v81 = objc_opt_new();
    v82 = (void *)MEMORY[0x1E4F9A378];
    v83 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
    v84 = [v83 localizedStringForKey:@"CONTACT_HEADER_TITLE" value:&stru_1F1824018 table:@"SpotlightServices"];
    v85 = [v82 textWithString:v84];
    [v81 setTitle:v85];

    v86 = objc_opt_new();
    [v81 setCollectionStyle:v86];

    [v81 setCardSections:v3];
    v102 = v78;
    [v81 setButtonItem:v78];
    v87 = objc_opt_new();
    v128 = v81;
    v88 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v128 count:1];
    [v87 setCardSections:v88];

    v76 = [(SSContactResultBuilder *)v75 buildResult];
    [v76 setContactIdentifier:objb];
    v89 = [(SSContactResultBuilder *)v75 personIdentifier];
    [v76 setPersonIdentifier:v89];

    [v76 setInlineCard:v87];
    [v76 setCompactCard:v87];
    if (objb)
    {
      v90 = (__CFString *)objb;
    }
    else
    {
      v90 = [(SSContactResultBuilder *)v75 personIdentifier];
    }
    v91 = v90;
    if (v90) {
      v92 = v90;
    }
    else {
      v92 = @"unknown";
    }
    v93 = [@"com.apple.spotlight.contactInfo" stringByAppendingString:v92];
    [v76 setIdentifier:v93];

    long long v113 = 0u;
    long long v114 = 0u;
    long long v111 = 0u;
    long long v112 = 0u;
    id v94 = v3;
    uint64_t v95 = [v94 countByEnumeratingWithState:&v111 objects:v127 count:16];
    if (v95)
    {
      uint64_t v96 = v95;
      uint64_t v97 = *(void *)v112;
      do
      {
        for (uint64_t m = 0; m != v96; ++m)
        {
          if (*(void *)v112 != v97) {
            objc_enumerationMutation(v94);
          }
          v99 = *(void **)(*((void *)&v111 + 1) + 8 * m);
          v100 = [v76 identifier];
          [v99 setResultIdentifier:v100];
        }
        uint64_t v96 = [v94 countByEnumeratingWithState:&v111 objects:v127 count:16];
      }
      while (v96);
    }

    id v4 = v104;
    id v3 = v105;
  }
  else
  {
    v76 = 0;
  }

  return v76;
}

uint64_t __52__SSContactResultBuilder_buildFooterResultForEntity__block_invoke()
{
  uint64_t v0 = [@"com.apple.spotlight.contactInfo" stringByAppendingString:@".phoneNumber"];
  v1 = (void *)buildFooterResultForEntity_phoneNumberCardSectionIdentifier;
  buildFooterResultForEntity_phoneNumberCardSectionIdentifier = v0;

  uint64_t v2 = [@"com.apple.spotlight.contactInfo" stringByAppendingString:@".emailAddress"];
  id v3 = (void *)buildFooterResultForEntity_emailAddressCardSectionIdentifier;
  buildFooterResultForEntity_emailAddressCardSectionIdentifier = v2;

  uint64_t v4 = [@"com.apple.spotlight.contactInfo" stringByAppendingString:@".address"];
  id v5 = (void *)buildFooterResultForEntity_addressCardSectionIdentifier;
  buildFooterResultForEntity_addressCardSectionIdentifier = v4;

  buildFooterResultForEntity_birthdayCardSectionIdentifier = [@"com.apple.spotlight.contactInfo" stringByAppendingString:@".birthday"];
  return MEMORY[0x1F41817F8]();
}

- (id)buildSocialMediaResultForEntity
{
  uint64_t v61 = *MEMORY[0x1E4F143B8];
  if (buildSocialMediaResultForEntity_onceToken != -1) {
    dispatch_once(&buildSocialMediaResultForEntity_onceToken, &__block_literal_global_108_0);
  }
  v51 = objc_opt_new();
  long long v55 = 0u;
  long long v56 = 0u;
  long long v57 = 0u;
  long long v58 = 0u;
  uint64_t v48 = self;
  id v3 = [(SSContactResultBuilder *)self contact];
  uint64_t v4 = [v3 socialProfiles];

  obuint64_t j = v4;
  uint64_t v52 = [v4 countByEnumeratingWithState:&v55 objects:v60 count:16];
  if (v52)
  {
    uint64_t v50 = *(void *)v56;
    do
    {
      for (uint64_t i = 0; i != v52; ++i)
      {
        if (*(void *)v56 != v50) {
          objc_enumerationMutation(obj);
        }
        uint64_t v6 = [*(id *)(*((void *)&v55 + 1) + 8 * i) value];
        uint64_t v7 = [v6 service];
        uint64_t v8 = [v6 urlString];
        uint64_t v9 = [v6 bundleIdentifiers];
        uint64_t v10 = [v9 firstObject];
        if ([v10 length])
        {
          uint64_t v11 = [v6 bundleIdentifiers];
          uint64_t v12 = [v11 firstObject];
        }
        else
        {
          uint64_t v12 = [(id)buildSocialMediaResultForEntity_bundleIDForDefaultServices objectForKeyedSubscript:v7];
        }

        uint64_t v13 = [MEMORY[0x1E4F223E0] defaultWorkspace];
        int v14 = [v13 applicationIsInstalled:v12];

        if (v14)
        {
          long long v15 = objc_opt_new();
          [v15 setBundleIdentifier:v12];
        }
        else
        {
          long long v15 = objc_opt_new();
          [v15 setSymbolName:@"safari"];
          [v15 setPunchThroughBackground:1];
          objc_msgSend(v15, "setSize:", 45.0, 45.0);
        }
        v53 = v8;
        v54 = (void *)v12;
        if ([v8 length])
        {
          long long v16 = (void *)MEMORY[0x1E4F9A2F8];
          long long v17 = [MEMORY[0x1E4F1CB10] URLWithString:v8];
          v18 = [v16 punchoutWithURL:v17];
        }
        else
        {
          v18 = 0;
        }
        uint64_t v19 = objc_opt_new();
        [v19 setPunchout:v18];
        uint64_t v20 = objc_opt_new();
        uint64_t v21 = (void *)MEMORY[0x1E4F9A378];
        id v22 = [MEMORY[0x1E4F1BAC0] localizedStringForService:v7];
        v23 = [v21 textWithString:v22];
        [v20 setTitle:v23];

        v24 = [v20 title];
        [v24 setMaxLines:1];

        id v25 = (void *)MEMORY[0x1E4F9A378];
        uint64_t v26 = [v6 username];
        v27 = [v25 textWithString:v26];
        [v20 setSubtitle:v27];

        v28 = [v20 subtitle];
        [v28 setMaxLines:1];

        [v20 setImage:v15];
        [v20 setCardSectionId:@"com.apple.MobileAddressBook.SocialMedia"];
        [v20 setCommand:v19];
        [v51 addObject:v20];
      }
      uint64_t v52 = [obj countByEnumeratingWithState:&v55 objects:v60 count:16];
    }
    while (v52);
  }

  if ([v51 count])
  {
    uint64_t v29 = objc_opt_new();
    [v29 setNumberOfRows:1];
    uint64_t v30 = objc_opt_new();
    uint64_t v31 = (void *)MEMORY[0x1E4F9A378];
    uint64_t v32 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
    long long v33 = [v32 localizedStringForKey:@"SOCIAL_MEDIA_SECTION_TITLE" value:&stru_1F1824018 table:@"SpotlightServices"];
    long long v34 = [v31 textWithString:v33];
    [v30 setTitle:v34];

    [v30 setCollectionStyle:v29];
    [v30 setCardSections:v51];
    long long v35 = objc_opt_new();
    v59 = v30;
    long long v36 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v59 count:1];
    [v35 setCardSections:v36];

    char v37 = [(SSContactResultBuilder *)v48 buildResult];
    [v37 setResultBundleId:@"com.apple.MobileAddressBook.SocialMedia"];
    [v37 setApplicationBundleIdentifier:@"com.apple.MobileAddressBook.SocialMedia"];
    int v38 = [(SSContactResultBuilder *)v48 realContactIdentifier];
    [v37 setContactIdentifier:v38];

    long long v39 = [(SSContactResultBuilder *)v48 personIdentifier];
    [v37 setPersonIdentifier:v39];

    [v37 setInlineCard:v35];
    [v37 setCompactCard:0];
    uint64_t v40 = [(SSContactResultBuilder *)v48 realContactIdentifier];
    v41 = v40;
    if (v40)
    {
      uint64_t v42 = v40;
    }
    else
    {
      uint64_t v42 = [(SSContactResultBuilder *)v48 personIdentifier];
    }
    v43 = v42;

    if (v43) {
      uint64_t v44 = v43;
    }
    else {
      uint64_t v44 = @"unknown";
    }
    uint64_t v45 = [@"com.apple.MobileAddressBook.SocialMedia" stringByAppendingString:v44];
    [v37 setIdentifier:v45];

    v46 = [v37 identifier];
    [v30 setResultIdentifier:v46];
  }
  else
  {
    char v37 = 0;
  }

  return v37;
}

void __57__SSContactResultBuilder_buildSocialMediaResultForEntity__block_invoke()
{
  v8[8] = *MEMORY[0x1E4F143B8];
  uint64_t v0 = *MEMORY[0x1E4F1B7E8];
  v7[0] = *MEMORY[0x1E4F1B7E0];
  v7[1] = v0;
  v8[0] = @"com.facebook.Facebook";
  v8[1] = @"com.yahoo.flickr";
  uint64_t v1 = *MEMORY[0x1E4F1B7F8];
  v7[2] = *MEMORY[0x1E4F1B7F0];
  v7[3] = v1;
  v8[2] = @"com.linkedin.LinkedIn";
  v8[3] = &stru_1F1824018;
  uint64_t v2 = *MEMORY[0x1E4F1B808];
  v7[4] = *MEMORY[0x1E4F1B800];
  v7[5] = v2;
  v8[4] = @"com.sina.weibo";
  v8[5] = @"com.sina.weibo";
  v7[6] = *MEMORY[0x1E4F1B810];
  int v3 = isMacOS();
  uint64_t v4 = @"com.atebits.Tweetie2";
  if (v3) {
    uint64_t v4 = @"maccatalyst.com.atebits.Tweetie2";
  }
  v7[7] = *MEMORY[0x1E4F1B818];
  v8[6] = v4;
  v8[7] = @"com.yelp.yelpiphone";
  uint64_t v5 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v8 forKeys:v7 count:8];
  uint64_t v6 = (void *)buildSocialMediaResultForEntity_bundleIDForDefaultServices;
  buildSocialMediaResultForEntity_bundleIDForDefaultServices = v5;
}

- (id)buildPreviewCommand
{
  int v3 = objc_opt_new();
  uint64_t v4 = [(SSContactResultBuilder *)self realContactIdentifier];
  [v3 setContactIdentifier:v4];

  return v3;
}

- (id)buildFootnote
{
  int v3 = [(SSContactResultBuilder *)self buildTitle];
  uint64_t v4 = [v3 text];
  uint64_t v5 = [(SSResultBuilder *)self buildHighlightedMatchedTextWithTitle:v4 headTruncation:1];

  [v5 setMaxLines:1];
  return v5;
}

- (id)buildDescriptions
{
  v11[1] = *MEMORY[0x1E4F143B8];
  if (SSSnippetModernizationEnabled())
  {
    if ((isIpad() & 1) == 0 && !isMacOS()) {
      goto LABEL_7;
    }
    int v3 = [(SSContactResultBuilder *)self contact];
    uint64_t v4 = [v3 organizationName];

    if (![v4 length]
      || ([(SSContactResultBuilder *)self displayName],
          uint64_t v5 = objc_claimAutoreleasedReturnValue(),
          int v6 = [v4 isEqualToString:v5],
          v5,
          v6))
    {

LABEL_7:
      uint64_t v7 = 0;
      goto LABEL_9;
    }
    uint64_t v9 = [MEMORY[0x1E4F9A378] textWithString:v4];
    [v9 setMaxLines:1];
    v11[0] = v9;
    uint64_t v7 = [MEMORY[0x1E4F1C978] arrayWithObjects:v11 count:1];
  }
  else
  {
    v10.receiver = self;
    v10.super_class = (Class)SSContactResultBuilder;
    uint64_t v7 = [(SSResultBuilder *)&v10 buildDescriptions];
  }
LABEL_9:
  return v7;
}

- (id)buildCommand
{
  int v3 = objc_opt_new();
  uint64_t v4 = objc_opt_new();
  [v4 setSymbolName:@"person.crop.circle"];
  [v4 setIsTemplate:1];
  uint64_t v5 = [(SSContactResultBuilder *)self fullName];
  [v3 setTokenString:v5];

  int v6 = [(SSContactResultBuilder *)self realContactIdentifier];
  uint64_t v7 = [(SSContactResultBuilder *)self personQueryIdentifier];
  if (v7)
  {
    [v3 setEntityIdentifier:v7];
  }
  else
  {
    uint64_t v8 = [(SSResultBuilder *)self result];
    uint64_t v9 = [v8 personQueryIdentifier];
    if (v9)
    {
      [v3 setEntityIdentifier:v9];
    }
    else
    {
      objc_super v10 = +[SPSearchContactEntity updatePersonQueryIdentifier:&stru_1F1824018 withContactIdentifier:v6];
      [v3 setEntityIdentifier:v10];
    }
  }

  [v3 setEntityType:2];
  [v3 setSymbolImage:v4];
  uint64_t v11 = [(SSContactResultBuilder *)self buildBackgroundColor];
  [v3 setEntityBackgroundColor:v11];

  return v3;
}

- (id)buildTitle
{
  int v3 = [(SSContactResultBuilder *)self displayName];
  if (![v3 length])
  {
    uint64_t v4 = [(SSContactResultBuilder *)self fullName];

    if ([v4 length])
    {
      int v3 = v4;
    }
    else
    {
      uint64_t v5 = [(SSContactResultBuilder *)self contact];
      int v6 = [v5 phoneNumbers];
      uint64_t v7 = [v6 firstObject];
      uint64_t v8 = [v7 value];
      int v3 = [v8 stringValue];

      if (![v3 length])
      {
        uint64_t v9 = [(SSContactResultBuilder *)self contact];
        objc_super v10 = [v9 emailAddresses];
        uint64_t v11 = [v10 firstObject];
        uint64_t v12 = [v11 value];

        if ([v12 length])
        {
          int v3 = v12;
        }
        else
        {
          uint64_t v13 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
          int v3 = [v13 localizedStringForKey:@"NO_NAME" value:&stru_1F1824018 table:@"SpotlightServices"];
        }
      }
    }
  }
  int v14 = [MEMORY[0x1E4F9A378] textWithString:v3];
  [v14 setMaxLines:2];

  return v14;
}

- (id)buildAction
{
  int v3 = objc_opt_new();
  uint64_t v4 = [(SSContactResultBuilder *)self realContactIdentifier];
  [v3 setContactIdentifier:v4];

  return v3;
}

- (id)buildThumbnail
{
  v9[1] = *MEMORY[0x1E4F143B8];
  int v3 = [(SSContactResultBuilder *)self realContactIdentifier];
  uint64_t v4 = objc_opt_new();
  if (v3)
  {
    [v4 setThreeDTouchEnabled:1];
    v9[0] = v3;
    uint64_t v5 = [MEMORY[0x1E4F1C978] arrayWithObjects:v9 count:1];
    [v4 setContactIdentifiers:v5];
  }
  else
  {
    [v4 setMonogramStyle:0];
    int v6 = (void *)MEMORY[0x1E4F1B910];
    uint64_t v5 = [(SSContactResultBuilder *)self contact];
    uint64_t v7 = [v6 stringFromContact:v5 style:1002];
    [v4 setMonogramLetters:v7];
  }
  return v4;
}

- (id)buildBadgingImageWithThumbnail:(id)a3
{
  return 0;
}

- (id)buildBackgroundColor
{
  int v3 = objc_opt_new();
  uint64_t v4 = [(SSContactResultBuilder *)self buildThumbnail];
  [v3 setImage:v4];

  return v3;
}

- (id)buildPreviewButtonItems
{
  v8[1] = *MEMORY[0x1E4F143B8];
  int v3 = [(SSContactResultBuilder *)self realContactIdentifier];
  if (v3)
  {
    uint64_t v4 = objc_opt_new();
    [v4 setContactIdentifier:v3];
    v8[0] = v4;
    uint64_t v5 = [MEMORY[0x1E4F1C978] arrayWithObjects:v8 count:1];
  }
  else
  {
    v7.receiver = self;
    v7.super_class = (Class)SSContactResultBuilder;
    uint64_t v5 = [(SSResultBuilder *)&v7 buildPreviewButtonItems];
  }

  return v5;
}

- (NSString)personIdentifier
{
  return self->_personIdentifier;
}

- (void)setPersonIdentifier:(id)a3
{
}

- (CNMutableContact)contact
{
  return self->_contact;
}

- (void)setContact:(id)a3
{
}

- (int)resultType
{
  return self->_resultType;
}

- (void)setResultType:(int)a3
{
  self->_resultType = a3;
}

- (NSString)displayName
{
  return self->_displayName;
}

- (void)setDisplayName:(id)a3
{
}

- (NSString)personQueryIdentifier
{
  return self->_personQueryIdentifier;
}

- (void)setPersonQueryIdentifier:(id)a3
{
}

- (NSString)realContactIdentifier
{
  return self->_realContactIdentifier;
}

- (void)setRealContactIdentifier:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_realContactIdentifier, 0);
  objc_storeStrong((id *)&self->_personQueryIdentifier, 0);
  objc_storeStrong((id *)&self->_displayName, 0);
  objc_storeStrong((id *)&self->_contact, 0);
  objc_storeStrong((id *)&self->_personIdentifier, 0);
}

@end