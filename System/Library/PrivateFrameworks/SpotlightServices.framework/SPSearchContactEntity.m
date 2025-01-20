@interface SPSearchContactEntity
+ (BOOL)stringA:(id)a3 isSameToStringB:(id)a4;
+ (BOOL)supportsSecureCoding;
+ (id)updatePersonQueryIdentifier:(id)a3 withContactIdentifier:(id)a4;
+ (id)updatePersonQueryIdentifier:(id)a3 withPersonIdentifier:(id)a4;
- (BOOL)hasSameContactAsContactEntity:(id)a3;
- (BOOL)isContactEntitySearch;
- (BOOL)isScopedSearch;
- (NSArray)addresses;
- (NSArray)emailAddresses;
- (NSArray)phoneNumbers;
- (NSArray)rawPhoneNumbers;
- (NSDateComponents)birthdayComponents;
- (NSString)contactIdentifier;
- (NSString)name;
- (NSString)personIdentifier;
- (NSString)personQueryIdentifier;
- (SPSearchContactEntity)initWithCoder:(id)a3;
- (SPSearchContactEntity)initWithContactIdentifier:(id)a3 fromSuggestion:(BOOL)a4;
- (SPSearchContactEntity)initWithPersonQueryIdentifier:(id)a3 personName:(id)a4 fromSuggestion:(BOOL)a5;
- (id)contact;
- (id)currentSearchString;
- (id)spotlightFilterQueries;
- (id)spotlightQueryString;
- (id)spotlightRankTerms;
- (id)symbolName;
- (void)commonInit;
- (void)encodeWithCoder:(id)a3;
- (void)getVariantsForPhoneNumber:(id)a3 searchNumbers:(id)a4 displayNumbers:(id)a5 fallbackDisplayNumbers:(id)a6;
- (void)updateSearchString:(id)a3;
@end

@implementation SPSearchContactEntity

+ (id)updatePersonQueryIdentifier:(id)a3 withContactIdentifier:(id)a4
{
  if (a3)
  {
    v5 = [NSString stringWithFormat:@"%@\tcontactIdentifier=%@", a3, a4];
  }
  else
  {
    v5 = 0;
  }
  return v5;
}

+ (id)updatePersonQueryIdentifier:(id)a3 withPersonIdentifier:(id)a4
{
  if (a3)
  {
    v5 = [NSString stringWithFormat:@"%@\tpersonIdentifier=%@", a3, a4];
  }
  else
  {
    v5 = 0;
  }
  return v5;
}

- (SPSearchContactEntity)initWithContactIdentifier:(id)a3 fromSuggestion:(BOOL)a4
{
  BOOL v4 = a4;
  id v7 = a3;
  v13.receiver = self;
  v13.super_class = (Class)SPSearchContactEntity;
  v8 = [(SPSearchContactEntity *)&v13 init];
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_contactIdentifier, a3);
    [(SPSearchEntity *)v9 setIsSuggestion:v4];
    [(SPSearchContactEntity *)v9 commonInit];
    v10 = [(SPSearchContactEntity *)v9 name];
    [(SPSearchEntity *)v9 setTokenString:v10];

    v11 = [(SPSearchContactEntity *)v9 name];
    [(SPSearchEntity *)v9 setDisplayString:v11];
  }
  return v9;
}

- (SPSearchContactEntity)initWithPersonQueryIdentifier:(id)a3 personName:(id)a4 fromSuggestion:(BOOL)a5
{
  BOOL v5 = a5;
  id v9 = a3;
  id v10 = a4;
  v16.receiver = self;
  v16.super_class = (Class)SPSearchContactEntity;
  v11 = [(SPSearchContactEntity *)&v16 init];
  v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_name, a4);
    objc_storeStrong((id *)&v12->_personQueryIdentifier, a3);
    [(SPSearchEntity *)v12 setIsSuggestion:v5];
    [(SPSearchContactEntity *)v12 commonInit];
    objc_super v13 = [(SPSearchContactEntity *)v12 name];
    [(SPSearchEntity *)v12 setTokenString:v13];

    v14 = [(SPSearchContactEntity *)v12 name];
    [(SPSearchEntity *)v12 setDisplayString:v14];
  }
  return v12;
}

- (void)getVariantsForPhoneNumber:(id)a3 searchNumbers:(id)a4 displayNumbers:(id)a5 fallbackDisplayNumbers:(id)a6
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  id v12 = a6;
  objc_super v13 = [MEMORY[0x1E4F28B88] decimalDigitCharacterSet];
  v14 = [v13 invertedSet];

  v15 = [v9 stringValue];

  if (v15)
  {
    objc_super v16 = [v9 stringValue];
    v17 = [v16 componentsSeparatedByCharactersInSet:v14];
    v18 = [v17 componentsJoinedByString:&stru_1F1824018];

    v31 = v18;
    if ([v18 length])
    {
      v19 = [v9 formattedStringValue];
      v20 = [v9 formattedInternationalStringValue];
      uint64_t v21 = [v9 unformattedInternationalStringValue];
      v22 = (void *)v21;
      if (v19 && v20 && v21)
      {
        if (([v10 containsObject:v19] & 1) == 0) {
          [v10 addObject:v19];
        }
        if (([v10 containsObject:v20] & 1) == 0) {
          [v10 addObject:v20];
        }
        if (([v10 containsObject:v22] & 1) == 0) {
          [v10 addObject:v22];
        }
        if ((unint64_t)[v22 length] <= 3)
        {
          id v23 = v22;
        }
        else
        {
          objc_msgSend(v22, "substringFromIndex:", objc_msgSend(v22, "length") - 4);
          id v23 = (id)objc_claimAutoreleasedReturnValue();
        }
        v24 = v23;
        v25 = [v11 objectForKey:v23];

        if (!v25)
        {
          v26 = objc_opt_new();
          [v11 setObject:v26 forKey:v24];
        }
        v27 = [v12 objectForKey:v24];

        if (!v27)
        {
          v28 = objc_opt_new();
          [v12 setObject:v28 forKey:v24];
        }
        if ([v19 isEqualToString:v20]) {
          v29 = v11;
        }
        else {
          v29 = v12;
        }
        v30 = [v29 objectForKeyedSubscript:v24];
        [v30 addObject:v9];
      }
    }
  }
}

- (void)commonInit
{
  uint64_t v2 = *MEMORY[0x1E4F143B8];
  OUTLINED_FUNCTION_2_0();
  _os_log_debug_impl(&dword_1BDB2A000, v0, OS_LOG_TYPE_DEBUG, "contactEntity rankTerms: %@", v1, 0xCu);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  v8.receiver = self;
  v8.super_class = (Class)SPSearchContactEntity;
  id v4 = a3;
  [(SPSearchEntity *)&v8 encodeWithCoder:v4];
  objc_msgSend(v4, "encodeObject:forKey:", self->_rankTerms, @"rankTerms", v8.receiver, v8.super_class);
  BOOL v5 = [(SPSearchContactEntity *)self contactIdentifier];
  [v4 encodeObject:v5 forKey:kContactIdentifierKey];

  v6 = [(SPSearchContactEntity *)self personIdentifier];
  [v4 encodeObject:v6 forKey:kPersonIdentifierKey];

  id v7 = [(SPSearchContactEntity *)self personQueryIdentifier];
  [v4 encodeObject:v7 forKey:kPersonQueryIdentifierKey];

  objc_msgSend(v4, "encodeBool:forKey:", -[SPSearchEntity isSuggestion](self, "isSuggestion"), @"isSuggestion");
}

- (SPSearchContactEntity)initWithCoder:(id)a3
{
  id v4 = a3;
  if (initWithCoder__onceQueryTermClassesToken != -1) {
    dispatch_once(&initWithCoder__onceQueryTermClassesToken, &__block_literal_global_57);
  }
  v23.receiver = self;
  v23.super_class = (Class)SPSearchContactEntity;
  BOOL v5 = [(SPSearchEntity *)&v23 initWithCoder:v4];
  if (v5)
  {
    v6 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v7 = objc_opt_class();
    uint64_t v8 = objc_opt_class();
    id v9 = objc_msgSend(v6, "setWithObjects:", v7, v8, objc_opt_class(), 0);
    uint64_t v10 = [v4 decodeObjectOfClasses:v9 forKey:@"rankTerms"];
    rankTerms = v5->_rankTerms;
    v5->_rankTerms = (NSDictionary *)v10;

    uint64_t v12 = [v4 decodeObjectOfClass:objc_opt_class() forKey:kContactIdentifierKey];
    contactIdentifier = v5->_contactIdentifier;
    v5->_contactIdentifier = (NSString *)v12;

    uint64_t v14 = [v4 decodeObjectOfClass:objc_opt_class() forKey:kPersonIdentifierKey];
    personIdentifier = v5->_personIdentifier;
    v5->_personIdentifier = (NSString *)v14;

    uint64_t v16 = [v4 decodeObjectOfClass:objc_opt_class() forKey:kPersonQueryIdentifierKey];
    personQueryIdentifier = v5->_personQueryIdentifier;
    v5->_personQueryIdentifier = (NSString *)v16;

    uint64_t v18 = [(SPSearchEntity *)v5 tokenText];
    name = v5->_name;
    v5->_name = (NSString *)v18;

    -[SPSearchEntity setIsSuggestion:](v5, "setIsSuggestion:", [v4 decodeBoolForKey:@"isSuggestion"]);
    [(SPSearchContactEntity *)v5 commonInit];
    v20 = [(SPSearchContactEntity *)v5 name];
    [(SPSearchEntity *)v5 setTokenString:v20];

    uint64_t v21 = [(SPSearchContactEntity *)v5 name];
    [(SPSearchEntity *)v5 setDisplayString:v21];
  }
  return v5;
}

void __39__SPSearchContactEntity_initWithCoder___block_invoke()
{
  v4[2] = *MEMORY[0x1E4F143B8];
  os_log_t v0 = (void *)MEMORY[0x1E4F1CAD0];
  v4[0] = objc_opt_class();
  v4[1] = objc_opt_class();
  v1 = [MEMORY[0x1E4F1C978] arrayWithObjects:v4 count:2];
  uint64_t v2 = [v0 setWithArray:v1];
  v3 = (void *)initWithCoder__queryTermClassesToDecode;
  initWithCoder__queryTermClassesToDecode = v2;
}

- (void)updateSearchString:(id)a3
{
  uint64_t v10 = (__CFString *)a3;
  id v4 = [(SPSearchEntity *)self displayString];
  BOOL v5 = v4;
  if (v10 && v4)
  {
    v6 = [(SPSearchEntity *)self displayString];
    int v7 = [v6 isEqualToString:v10];

    if (v7)
    {
      uint64_t v8 = &stru_1F1824018;
      id v9 = self;
      goto LABEL_7;
    }
  }
  else
  {
  }
  id v9 = self;
  uint64_t v8 = v10;
LABEL_7:
  [(SPSearchEntity *)v9 setSearchString:v8];
}

- (BOOL)isContactEntitySearch
{
  return 1;
}

- (BOOL)isScopedSearch
{
  return 1;
}

- (id)spotlightFilterQueries
{
  v5[4] = *MEMORY[0x1E4F143B8];
  uint64_t v2 = [NSString stringWithFormat:@"(_kMDItemBundleID!=\"%@\" || InRange(%@, $time.now(-%luM), $time.now(+%luM)) || InRange(%@, $time.now(-%luM), $time.now(+%luM)))", @"com.apple.mobilecal", *MEMORY[0x1E4F235A8], 1, 3, *MEMORY[0x1E4F22D58], 1, 3];
  v5[0] = v2;
  v5[1] = @"kMDItemContentTypeTree!=\"public.contact\"";
  v5[2] = @"kMDItemContentType!=\"com.apple.application\"";
  v5[3] = @"_kMDItemBundleID!=\"com.apple.MobileAddressBook\"";
  v3 = [MEMORY[0x1E4F1C978] arrayWithObjects:v5 count:4];

  return v3;
}

- (id)spotlightRankTerms
{
  return self->_rankTerms;
}

- (id)currentSearchString
{
  v3 = [(SPSearchEntity *)self searchString];
  uint64_t v4 = [v3 length];

  if (v4)
  {
    BOOL v5 = NSString;
    v6 = [(SPSearchEntity *)self tokenText];
    int v7 = [(SPSearchEntity *)self searchString];
    uint64_t v8 = [v5 stringWithFormat:@"%@ %@", v6, v7];
  }
  else
  {
    uint64_t v8 = [(SPSearchContactEntity *)self name];
  }
  return v8;
}

- (id)spotlightQueryString
{
  uint64_t v70 = *MEMORY[0x1E4F143B8];
  v3 = objc_opt_new();
  uint64_t v4 = [(SPSearchContactEntity *)self contactIdentifier];

  if (v4)
  {
    uint64_t v5 = *MEMORY[0x1E4F22B10];
    v6 = [(SPSearchContactEntity *)self contactIdentifier];
    [(SPSearchEntity *)self appendToQuery:v3 key:v5 value:v6 additions:0 flags:0];

    uint64_t v7 = *MEMORY[0x1E4F22C10];
    uint64_t v8 = [(SPSearchContactEntity *)self contactIdentifier];
    [(SPSearchEntity *)self appendToQuery:v3 key:v7 value:v8 additions:0 flags:0];

    uint64_t v9 = *MEMORY[0x1E4F232E8];
    uint64_t v10 = [(SPSearchContactEntity *)self contactIdentifier];
    [(SPSearchEntity *)self appendToQuery:v3 key:v9 value:v10 additions:0 flags:0];
  }
  long long v65 = 0u;
  long long v66 = 0u;
  long long v63 = 0u;
  long long v64 = 0u;
  obuint64_t j = self->_allNames;
  uint64_t v11 = [(NSMutableArray *)obj countByEnumeratingWithState:&v63 objects:v69 count:16];
  if (v11)
  {
    uint64_t v12 = v11;
    uint64_t v52 = *(void *)v64;
    id v48 = (id)*MEMORY[0x1E4F22B30];
    uint64_t v47 = *MEMORY[0x1E4F234B0];
    uint64_t v46 = *MEMORY[0x1E4F22CE8];
    uint64_t v44 = *MEMORY[0x1E4F232F8];
    uint64_t v45 = *MEMORY[0x1E4F23658];
    uint64_t v42 = *MEMORY[0x1E4F22C18];
    uint64_t v43 = *MEMORY[0x1E4F23300];
    uint64_t v41 = *MEMORY[0x1E4F231D8];
    uint64_t v13 = *MEMORY[0x1E4F230E0];
    do
    {
      for (uint64_t i = 0; i != v12; ++i)
      {
        if (*(void *)v64 != v52) {
          objc_enumerationMutation(obj);
        }
        v15 = SSEscapedStringForSearchQuery(*(void **)(*((void *)&v63 + 1) + 8 * i));
        uint64_t v16 = [(SPSearchContactEntity *)self personIdentifier];
        if (v16) {
          v17 = 0;
        }
        else {
          v17 = v15;
        }
        id v18 = v17;

        v19 = [(SPSearchContactEntity *)self personIdentifier];
        if (v19) {
          v20 = v15;
        }
        else {
          v20 = 0;
        }
        id v21 = v20;

        v22 = [NSString stringWithFormat:@"_kMDItemBundleID=\"%@\", @"com.apple.mobilecal""];
        [(SPSearchEntity *)self appendToQuery:v3 key:v48 value:v18 optionalValue:v21 additions:0 flags:@"cwdx"];
        [(SPSearchEntity *)self appendToQuery:v3 key:v47 value:v18 optionalValue:v21 additions:v22 flags:@"cwdx"];
        [(SPSearchEntity *)self appendToQuery:v3 key:v46 value:v18 optionalValue:v21 additions:0 flags:@"cwdx"];
        [(SPSearchEntity *)self appendToQuery:v3 key:v45 value:v18 optionalValue:v21 additions:0 flags:@"cwdx"];
        [(SPSearchEntity *)self appendToQuery:v3 key:v44 value:v18 optionalValue:v21 additions:0 flags:@"cwdx"];
        [(SPSearchEntity *)self appendToQuery:v3 key:v43 value:v18 optionalValue:v21 additions:0 flags:@"cwdx"];
        [(SPSearchEntity *)self appendToQuery:v3 key:v42 value:v18 optionalValue:v21 additions:0 flags:@"cwdx"];
        [(SPSearchEntity *)self appendToQuery:v3 key:v41 value:v18 optionalValue:v21 additions:0 flags:@"cwdx"];
        [(SPSearchEntity *)self appendToQuery:v3 key:v13 value:v18 optionalValue:v21 additions:0 flags:@"cwdx"];
      }
      uint64_t v12 = [(NSMutableArray *)obj countByEnumeratingWithState:&v63 objects:v69 count:16];
    }
    while (v12);
  }

  long long v61 = 0u;
  long long v62 = 0u;
  long long v59 = 0u;
  long long v60 = 0u;
  v50 = self->_allEmailAddresses;
  uint64_t v23 = [(NSMutableArray *)v50 countByEnumeratingWithState:&v59 objects:v68 count:16];
  if (v23)
  {
    uint64_t v24 = v23;
    uint64_t v53 = *(void *)v60;
    uint64_t v25 = *MEMORY[0x1E4F22D48];
    uint64_t v26 = *MEMORY[0x1E4F22B18];
    uint64_t v27 = *MEMORY[0x1E4F232F0];
    uint64_t v28 = *MEMORY[0x1E4F233C8];
    do
    {
      for (uint64_t j = 0; j != v24; ++j)
      {
        if (*(void *)v60 != v53) {
          objc_enumerationMutation(v50);
        }
        v30 = SSEscapedStringForSearchQuery(*(void **)(*((void *)&v59 + 1) + 8 * j));
        [(SPSearchEntity *)self appendToQuery:v3 key:v25 value:v30 additions:0 flags:@"cdx"];
        [(SPSearchEntity *)self appendToQuery:v3 key:v26 value:v30 additions:0 flags:@"cdx"];
        [(SPSearchEntity *)self appendToQuery:v3 key:v27 value:v30 additions:0 flags:@"cdx"];
        [(SPSearchEntity *)self appendToQuery:v3 key:v28 value:v30 additions:0 flags:@"cdx"];
      }
      uint64_t v24 = [(NSMutableArray *)v50 countByEnumeratingWithState:&v59 objects:v68 count:16];
    }
    while (v24);
  }

  long long v57 = 0u;
  long long v58 = 0u;
  long long v55 = 0u;
  long long v56 = 0u;
  v49 = self->_allPhoneNumbers;
  uint64_t v31 = [(NSMutableArray *)v49 countByEnumeratingWithState:&v55 objects:v67 count:16];
  if (v31)
  {
    uint64_t v32 = v31;
    uint64_t v54 = *(void *)v56;
    id v51 = (id)*MEMORY[0x1E4F22B00];
    uint64_t v33 = *MEMORY[0x1E4F23230];
    uint64_t v34 = *MEMORY[0x1E4F23658];
    uint64_t v35 = *MEMORY[0x1E4F22CE8];
    do
    {
      for (uint64_t k = 0; k != v32; ++k)
      {
        if (*(void *)v56 != v54) {
          objc_enumerationMutation(v49);
        }
        v37 = SSEscapedStringForSearchQuery(*(void **)(*((void *)&v55 + 1) + 8 * k));
        [(SPSearchEntity *)self appendToQuery:v3 key:v51 value:v37 additions:0 flags:@"cdx"];
        [(SPSearchEntity *)self appendToQuery:v3 key:v33 value:v37 additions:0 flags:@"cdx"];
        [(SPSearchEntity *)self appendToQuery:v3 key:v34 value:0 optionalValue:v37 additions:0 flags:@"cwdx"];
        [(SPSearchEntity *)self appendToQuery:v3 key:v35 value:0 optionalValue:v37 additions:0 flags:@"cwdx"];
      }
      uint64_t v32 = [(NSMutableArray *)v49 countByEnumeratingWithState:&v55 objects:v67 count:16];
    }
    while (v32);
  }

  if ([v3 length])
  {
    v38 = [NSString stringWithFormat:@"(%@)", v3];
  }
  else
  {
    v38 = @"(*=*)";
  }

  return v38;
}

- (id)symbolName
{
  return @"person.crop.circle";
}

- (id)contact
{
  v3 = [(SPSearchContactEntity *)self contactIdentifier];

  if (!v3
    || ([(SPSearchContactEntity *)self contactIdentifier],
        uint64_t v4 = objc_claimAutoreleasedReturnValue(),
        +[SSContactStore contactForContactIdentifier:v4],
        uint64_t v5 = objc_claimAutoreleasedReturnValue(),
        v4,
        !v5))
  {
    v6 = [(SPSearchEntity *)self tokenText];
    uint64_t v5 = +[SSNameFormatManager contactFromName:v6];
  }
  return v5;
}

+ (BOOL)stringA:(id)a3 isSameToStringB:(id)a4
{
  if ((unint64_t)a3 | (unint64_t)a4) {
    return [a3 isEqualToString:a4];
  }
  else {
    return 1;
  }
}

- (BOOL)hasSameContactAsContactEntity:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(SPSearchContactEntity *)self personIdentifier];
  v6 = [(SPSearchContactEntity *)self contactIdentifier];
  uint64_t v7 = [v4 personIdentifier];
  uint64_t v8 = [v4 contactIdentifier];

  if ([(id)objc_opt_class() stringA:v6 isSameToStringB:v8]) {
    char v9 = [(id)objc_opt_class() stringA:v5 isSameToStringB:v7];
  }
  else {
    char v9 = 0;
  }

  return v9;
}

- (NSString)name
{
  return self->_name;
}

- (NSString)contactIdentifier
{
  return self->_contactIdentifier;
}

- (NSString)personIdentifier
{
  return self->_personIdentifier;
}

- (NSString)personQueryIdentifier
{
  return self->_personQueryIdentifier;
}

- (NSDateComponents)birthdayComponents
{
  return self->_birthdayComponents;
}

- (NSArray)phoneNumbers
{
  return self->_phoneNumbers;
}

- (NSArray)addresses
{
  return self->_addresses;
}

- (NSArray)rawPhoneNumbers
{
  return self->_rawPhoneNumbers;
}

- (NSArray)emailAddresses
{
  return self->_emailAddresses;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_emailAddresses, 0);
  objc_storeStrong((id *)&self->_rawPhoneNumbers, 0);
  objc_storeStrong((id *)&self->_addresses, 0);
  objc_storeStrong((id *)&self->_phoneNumbers, 0);
  objc_storeStrong((id *)&self->_birthdayComponents, 0);
  objc_storeStrong((id *)&self->_personQueryIdentifier, 0);
  objc_storeStrong((id *)&self->_personIdentifier, 0);
  objc_storeStrong((id *)&self->_contactIdentifier, 0);
  objc_storeStrong((id *)&self->_name, 0);
  objc_storeStrong((id *)&self->_rankTerms, 0);
  objc_storeStrong((id *)&self->_allEmailAddresses, 0);
  objc_storeStrong((id *)&self->_allPhoneNumbers, 0);
  objc_storeStrong((id *)&self->_allNames, 0);
}

- (void)getVariantsForPhoneNumber:(void *)a1 searchNumbers:displayNumbers:fallbackDisplayNumbers:.cold.1(void *a1)
{
  objc_begin_catch(a1);
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
    OUTLINED_FUNCTION_0_3(&dword_1BDB2A000, MEMORY[0x1E4F14500], v1, "Error parsing number: %@", v2, v3, v4, v5, 2u);
  }
  objc_end_catch();
}

@end