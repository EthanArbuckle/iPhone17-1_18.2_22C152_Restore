@interface PPQuickTypeQuery
+ (BOOL)supportsSecureCoding;
+ (id)_labelFromLMFieldString:(id)a3 qualifiers:(id)a4;
+ (id)_peopleNamesFromLMQualifiers:(id)a3;
+ (id)_subfieldsFromString:(id)a3;
+ (id)quickTypeQueryFromLMTokens:(id)a3 localeIdentifier:(id)a4 recipients:(id)a5 bundleIdentifier:(id)a6;
+ (id)quickTypeQueryWithType:(unsigned __int8)a3 subtype:(unsigned __int8)a4 semanticTag:(unsigned __int8)a5 fields:(unsigned int)a6 time:(unsigned __int8)a7 options:(unsigned __int8)a8 subFields:(id)a9 label:(id)a10 people:(id)a11 localeIdentifier:(id)a12 bundleIdentifier:(id)a13 recipients:(id)a14;
+ (id)quickTypeQueryWithType:(unsigned __int8)a3 subtype:(unsigned __int8)a4 semanticTag:(unsigned __int8)a5 fields:(unsigned int)a6 time:(unsigned __int8)a7 subFields:(id)a8 label:(id)a9 people:(id)a10 localeIdentifier:(id)a11 bundleIdentifier:(id)a12 recipients:(id)a13;
+ (unsigned)_fieldsFromStrings:(id)a3;
+ (unsigned)_semanticTagFromString:(id)a3;
+ (unsigned)_subtypeFromString:(id)a3;
+ (unsigned)_timeFromString:(id)a3;
+ (unsigned)_typeFromString:(id)a3;
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqualToQuickTypeQuery:(id)a3;
- (BOOL)isResultEquivelentToQuickTypeQuery:(id)a3;
- (NSArray)people;
- (NSArray)recipients;
- (NSArray)subFields;
- (NSNumber)timeoutSeconds;
- (NSString)bundleIdentifier;
- (NSString)label;
- (NSString)localeIdentifier;
- (PPQuickTypeQuery)init;
- (PPQuickTypeQuery)initWithCoder:(id)a3;
- (PPQuickTypeQuery)initWithType:(unsigned __int8)a3 subtype:(unsigned __int8)a4 semanticTag:(unsigned __int8)a5 fields:(unsigned int)a6 time:(unsigned __int8)a7 options:(unsigned __int8)a8 subFields:(id)a9 label:(id)a10 people:(id)a11 localeIdentifier:(id)a12 bundleIdentifier:(id)a13 recipients:(id)a14 timeoutSeconds:(id)a15;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (unint64_t)hash;
- (unsigned)fields;
- (unsigned)options;
- (unsigned)semanticTag;
- (unsigned)subtype;
- (unsigned)time;
- (unsigned)type;
- (void)encodeWithCoder:(id)a3;
- (void)setBundleIdentifier:(id)a3;
- (void)setFields:(unsigned int)a3;
- (void)setLabel:(id)a3;
- (void)setLocaleIdentifier:(id)a3;
- (void)setOptions:(unsigned __int8)a3;
- (void)setPeople:(id)a3;
- (void)setRecipients:(id)a3;
- (void)setSemanticTag:(unsigned __int8)a3;
- (void)setSubFields:(id)a3;
- (void)setSubtype:(unsigned __int8)a3;
- (void)setTime:(unsigned __int8)a3;
- (void)setTimeoutSeconds:(id)a3;
- (void)setType:(unsigned __int8)a3;
@end

@implementation PPQuickTypeQuery

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_timeoutSeconds, 0);
  objc_storeStrong((id *)&self->_recipients, 0);
  objc_storeStrong((id *)&self->_bundleIdentifier, 0);
  objc_storeStrong((id *)&self->_localeIdentifier, 0);
  objc_storeStrong((id *)&self->_people, 0);
  objc_storeStrong((id *)&self->_label, 0);
  objc_storeStrong((id *)&self->_subFields, 0);
}

- (void)setTimeoutSeconds:(id)a3
{
}

- (NSNumber)timeoutSeconds
{
  return self->_timeoutSeconds;
}

- (void)setRecipients:(id)a3
{
}

- (NSArray)recipients
{
  return self->_recipients;
}

- (void)setBundleIdentifier:(id)a3
{
}

- (NSString)bundleIdentifier
{
  return self->_bundleIdentifier;
}

- (void)setLocaleIdentifier:(id)a3
{
}

- (NSString)localeIdentifier
{
  return self->_localeIdentifier;
}

- (void)setPeople:(id)a3
{
}

- (NSArray)people
{
  return self->_people;
}

- (void)setLabel:(id)a3
{
}

- (NSString)label
{
  return self->_label;
}

- (void)setSubFields:(id)a3
{
}

- (NSArray)subFields
{
  return self->_subFields;
}

- (void)setOptions:(unsigned __int8)a3
{
  self->_options = a3;
}

- (unsigned)options
{
  return self->_options;
}

- (void)setTime:(unsigned __int8)a3
{
  self->_time = a3;
}

- (unsigned)time
{
  return self->_time;
}

- (void)setFields:(unsigned int)a3
{
  self->_fields = a3;
}

- (unsigned)fields
{
  return self->_fields;
}

- (void)setSemanticTag:(unsigned __int8)a3
{
  self->_semanticTag = a3;
}

- (unsigned)semanticTag
{
  return self->_semanticTag;
}

- (void)setSubtype:(unsigned __int8)a3
{
  self->_subtype = a3;
}

- (unsigned)subtype
{
  return self->_subtype;
}

- (void)setType:(unsigned __int8)a3
{
  self->_type = a3;
}

- (unsigned)type
{
  return self->_type;
}

- (BOOL)isResultEquivelentToQuickTypeQuery:(id)a3
{
  v4 = (id *)a3;
  v5 = v4;
  if (!v4
    || self->_type != *((unsigned __int8 *)v4 + 8)
    || self->_subtype != *((unsigned __int8 *)v4 + 9)
    || self->_semanticTag != *((unsigned __int8 *)v4 + 10)
    || self->_fields != *((_DWORD *)v4 + 4)
    || self->_time != *((unsigned __int8 *)v4 + 11))
  {
    goto LABEL_21;
  }
  subFields = self->_subFields;
  v7 = (NSArray *)v4[3];
  if (subFields == v7)
  {
  }
  else
  {
    v8 = v7;
    v9 = subFields;
    char v10 = [(NSArray *)v9 isEqual:v8];

    if ((v10 & 1) == 0) {
      goto LABEL_21;
    }
  }
  label = self->_label;
  v12 = (NSString *)v5[4];
  if (label == v12)
  {
  }
  else
  {
    v13 = v12;
    v14 = label;
    char v15 = [(NSString *)v14 isEqual:v13];

    if ((v15 & 1) == 0) {
      goto LABEL_21;
    }
  }
  people = self->_people;
  v17 = (NSArray *)v5[5];
  if (people == v17)
  {
  }
  else
  {
    v18 = v17;
    v19 = people;
    char v20 = [(NSArray *)v19 isEqual:v18];

    if ((v20 & 1) == 0) {
      goto LABEL_21;
    }
  }
  localeIdentifier = self->_localeIdentifier;
  v22 = (NSString *)v5[6];
  if (localeIdentifier == v22)
  {
  }
  else
  {
    v23 = v22;
    v24 = localeIdentifier;
    char v25 = [(NSString *)v24 isEqual:v23];

    if ((v25 & 1) == 0)
    {
LABEL_21:
      char v26 = 0;
      goto LABEL_22;
    }
  }
  v28 = self->_recipients;
  v29 = v28;
  if (v28 == v5[8]) {
    char v26 = 1;
  }
  else {
    char v26 = -[NSArray isEqual:](v28, "isEqual:");
  }

LABEL_22:
  return v26;
}

- (BOOL)isEqualToQuickTypeQuery:(id)a3
{
  v4 = (id *)a3;
  if (!v4
    || ![(PPQuickTypeQuery *)self isResultEquivelentToQuickTypeQuery:v4]
    || self->_options != *((unsigned __int8 *)v4 + 12))
  {
    goto LABEL_6;
  }
  bundleIdentifier = self->_bundleIdentifier;
  v6 = (NSString *)v4[7];
  if (bundleIdentifier == v6)
  {
  }
  else
  {
    v7 = v6;
    v8 = bundleIdentifier;
    char v9 = [(NSString *)v8 isEqual:v7];

    if ((v9 & 1) == 0)
    {
LABEL_6:
      char v10 = 0;
      goto LABEL_7;
    }
  }
  v12 = self->_timeoutSeconds;
  v13 = v12;
  if (v12 == v4[9]) {
    char v10 = 1;
  }
  else {
    char v10 = -[NSNumber isEqual:](v12, "isEqual:");
  }

LABEL_7:
  return v10;
}

- (BOOL)isEqual:(id)a3
{
  v4 = (PPQuickTypeQuery *)a3;
  v5 = v4;
  if (v4 == self) {
    BOOL v6 = 1;
  }
  else {
    BOOL v6 = v4
  }
      && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
      && [(PPQuickTypeQuery *)self isEqualToQuickTypeQuery:v5];

  return v6;
}

- (id)copyWithZone:(_NSZone *)a3
{
  objc_opt_class();
  uint64_t v4 = objc_opt_new();
  v5 = (id *)v4;
  if (v4)
  {
    *(unsigned char *)(v4 + 8) = self->_type;
    *(unsigned char *)(v4 + 9) = self->_subtype;
    *(unsigned char *)(v4 + 10) = self->_semanticTag;
    *(_DWORD *)(v4 + 16) = self->_fields;
    *(unsigned char *)(v4 + 11) = self->_time;
    *(unsigned char *)(v4 + 12) = self->_options;
    objc_storeStrong((id *)(v4 + 24), self->_subFields);
    objc_storeStrong(v5 + 4, self->_label);
    objc_storeStrong(v5 + 5, self->_people);
    objc_storeStrong(v5 + 6, self->_localeIdentifier);
    objc_storeStrong(v5 + 7, self->_bundleIdentifier);
    objc_storeStrong(v5 + 8, self->_recipients);
    objc_storeStrong(v5 + 9, self->_timeoutSeconds);
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  uint64_t type = self->_type;
  id v5 = a3;
  [v5 encodeInt32:type forKey:@"typ"];
  [v5 encodeInt32:self->_subtype forKey:@"stp"];
  [v5 encodeInt32:self->_semanticTag forKey:@"stg"];
  [v5 encodeInt32:self->_fields forKey:@"fld"];
  [v5 encodeInt32:self->_time forKey:@"tim"];
  [v5 encodeInt32:self->_options forKey:@"opt"];
  [v5 encodeObject:self->_subFields forKey:@"sfd"];
  [v5 encodeObject:self->_label forKey:@"lab"];
  [v5 encodeObject:self->_people forKey:@"pep"];
  [v5 encodeObject:self->_localeIdentifier forKey:@"lid"];
  [v5 encodeObject:self->_bundleIdentifier forKey:@"bid"];
  [v5 encodeObject:self->_recipients forKey:@"rec"];
  [v5 encodeObject:self->_timeoutSeconds forKey:@"tsc"];
}

- (PPQuickTypeQuery)initWithCoder:(id)a3
{
  id v3 = a3;
  uint64_t v4 = objc_opt_class();
  uint64_t v5 = objc_opt_class();
  unsigned __int8 v26 = [v3 decodeInt32ForKey:@"typ"];
  unsigned __int8 v25 = [v3 decodeInt32ForKey:@"stp"];
  unsigned __int8 v23 = [v3 decodeInt32ForKey:@"stg"];
  unsigned int v22 = [v3 decodeInt32ForKey:@"fld"];
  unsigned __int8 v21 = [v3 decodeInt32ForKey:@"tim"];
  unsigned __int8 v6 = [v3 decodeInt32ForKey:@"opt"];
  v7 = (void *)MEMORY[0x192F97350]();
  v24 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CAD0]), "initWithObjects:", v4, v5, 0);
  v19 = [v3 decodeObjectOfClasses:v24 forKey:@"sfd"];
  v8 = [v3 decodeObjectOfClass:v5 forKey:@"lab"];
  char v9 = (void *)MEMORY[0x192F97350]();
  char v20 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CAD0]), "initWithObjects:", v4, v5, 0);
  char v10 = [v3 decodeObjectOfClasses:v20 forKey:@"pep"];
  v11 = [v3 decodeObjectOfClass:v5 forKey:@"lid"];
  v12 = [v3 decodeObjectOfClass:v5 forKey:@"bid"];
  v13 = (void *)MEMORY[0x192F97350]();
  v14 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CAD0]), "initWithObjects:", v4, v5, 0);
  char v15 = [v3 decodeObjectOfClasses:v14 forKey:@"rec"];
  v16 = [v3 decodeObjectOfClass:objc_opt_class() forKey:@"tsc"];
  v17 = [(PPQuickTypeQuery *)self initWithType:v26 subtype:v25 semanticTag:v23 fields:v22 time:v21 options:v6 subFields:v19 label:v8 people:v10 localeIdentifier:v11 bundleIdentifier:v12 recipients:v15 timeoutSeconds:v16];

  return v17;
}

- (unint64_t)hash
{
  unint64_t v3 = self->_subtype - (unint64_t)self->_type + 32 * self->_type;
  uint64_t v4 = self->_semanticTag - v3 + 32 * v3;
  uint64_t v5 = self->_fields - v4 + 32 * v4;
  uint64_t v6 = self->_time - v5 + 32 * v5;
  uint64_t v7 = self->_options - v6 + 32 * v6;
  uint64_t v8 = [(NSArray *)self->_subFields hash] - v7 + 32 * v7;
  NSUInteger v9 = [(NSString *)self->_label hash] - v8 + 32 * v8;
  uint64_t v10 = [(NSArray *)self->_people hash] - v9 + 32 * v9;
  NSUInteger v11 = [(NSString *)self->_localeIdentifier hash] - v10 + 32 * v10;
  NSUInteger v12 = [(NSString *)self->_bundleIdentifier hash] - v11 + 32 * v11;
  return [(NSArray *)self->_recipients hash] - v12 + 32 * v12;
}

- (id)description
{
  v2 = (void *)[[NSString alloc] initWithFormat:@"<PPQuickTypeQuery t:%lu st:%lu sm:%lu f:%lu tm:%lu o:%lu sf:%@ l:%@ p:%@ li:%@ bi:%@ r:%@ to:%@>", self->_type, self->_subtype, self->_semanticTag, self->_fields, self->_time, self->_options, self->_subFields, self->_label, self->_people, self->_localeIdentifier, self->_bundleIdentifier, self->_recipients, self->_timeoutSeconds];
  return v2;
}

- (PPQuickTypeQuery)init
{
  return [(PPQuickTypeQuery *)self initWithType:0 subtype:0 semanticTag:0 fields:0 time:0 options:0 subFields:0 label:0 people:0 localeIdentifier:0 bundleIdentifier:0 recipients:0 timeoutSeconds:0];
}

- (PPQuickTypeQuery)initWithType:(unsigned __int8)a3 subtype:(unsigned __int8)a4 semanticTag:(unsigned __int8)a5 fields:(unsigned int)a6 time:(unsigned __int8)a7 options:(unsigned __int8)a8 subFields:(id)a9 label:(id)a10 people:(id)a11 localeIdentifier:(id)a12 bundleIdentifier:(id)a13 recipients:(id)a14 timeoutSeconds:(id)a15
{
  id v31 = a9;
  id v30 = a10;
  id v29 = a11;
  id v28 = a12;
  id v27 = a13;
  id v16 = a14;
  id v17 = a15;
  v32.receiver = self;
  v32.super_class = (Class)PPQuickTypeQuery;
  v18 = [(PPQuickTypeQuery *)&v32 init];
  v19 = v18;
  if (v18)
  {
    v18->_uint64_t type = a3;
    v18->_subuint64_t type = a4;
    v18->_semanticTag = a5;
    v18->_fields = a6;
    v18->_time = a7;
    v18->_options = a8;
    objc_storeStrong((id *)&v18->_subFields, a9);
    objc_storeStrong((id *)&v19->_label, a10);
    objc_storeStrong((id *)&v19->_people, a11);
    objc_storeStrong((id *)&v19->_localeIdentifier, a12);
    objc_storeStrong((id *)&v19->_bundleIdentifier, a13);
    objc_storeStrong((id *)&v19->_recipients, a14);
    objc_storeStrong((id *)&v19->_timeoutSeconds, a15);
  }

  return v19;
}

+ (id)_peopleNamesFromLMQualifiers:(id)a3
{
  v31[1] = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  uint64_t v4 = objc_opt_new();
  uint64_t v5 = [v3 objectForKeyedSubscript:*MEMORY[0x1E4F72238]];
  if (v5)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v6 = v5;
    }
    else
    {
      v31[0] = v5;
      id v6 = [MEMORY[0x1E4F1C978] arrayWithObjects:v31 count:1];
    }
    id v9 = v6;
    goto LABEL_32;
  }
  uint64_t v7 = [v3 objectForKeyedSubscript:*MEMORY[0x1E4F72248]];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v30 = v7;
    id v8 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v30 count:1];
LABEL_10:
    uint64_t v10 = v8;
    goto LABEL_12;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v8 = v7;
    goto LABEL_10;
  }
  uint64_t v10 = 0;
LABEL_12:
  NSUInteger v11 = [v3 objectForKeyedSubscript:*MEMORY[0x1E4F72318]];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v29 = v11;
    id v12 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v29 count:1];
LABEL_16:
    v13 = v12;
    if (v10 && v12)
    {
      unsigned __int8 v26 = v11;
      id v27 = v7;
      id v28 = v3;
      unint64_t v14 = [v12 count];
      unint64_t v15 = [v10 count];
      if (v14 >= v15) {
        unint64_t v16 = v15;
      }
      else {
        unint64_t v16 = v14;
      }
      id v17 = v4;
      if (v16)
      {
        for (uint64_t i = 0; i != v16; ++i)
        {
          v19 = (void *)MEMORY[0x192F97350]();
          char v20 = [v10 objectAtIndexedSubscript:i];
          unsigned __int8 v21 = [v20 stringByAppendingString:@" "];
          unsigned int v22 = [v13 objectAtIndexedSubscript:i];
          unsigned __int8 v23 = [v21 stringByAppendingString:v22];
          [v17 addObject:v23];
        }
      }
      id v9 = v17;
      uint64_t v5 = 0;
      id v3 = v28;
      uint64_t v4 = v17;
      NSUInteger v11 = v26;
      uint64_t v7 = v27;
      goto LABEL_31;
    }
    if (!v10)
    {
      if (!v12)
      {
        id v9 = 0;
        goto LABEL_31;
      }
      id v24 = v12;
      v13 = v24;
      goto LABEL_30;
    }
LABEL_29:
    id v24 = v10;
LABEL_30:
    id v9 = v24;
    goto LABEL_31;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v12 = v11;
    goto LABEL_16;
  }
  v13 = 0;
  id v9 = 0;
  if (v10) {
    goto LABEL_29;
  }
LABEL_31:

LABEL_32:
  return v9;
}

+ (id)_labelFromLMFieldString:(id)a3 qualifiers:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  if (_labelFromLMFieldString_qualifiers__once != -1) {
    dispatch_once(&_labelFromLMFieldString_qualifiers__once, &__block_literal_global_202);
  }
  uint64_t v7 = [v6 objectForKeyedSubscript:*MEMORY[0x1E4F72288]];
  id v8 = v7;
  if (v7)
  {
    id v9 = v7;
  }
  else
  {
    id v9 = [(id)_labelFromLMFieldString_qualifiers__map objectForKeyedSubscript:v5];
  }
  uint64_t v10 = v9;

  return v10;
}

void __55__PPQuickTypeQuery__labelFromLMFieldString_qualifiers___block_invoke()
{
  v11[8] = *MEMORY[0x1E4F143B8];
  uint64_t v0 = *MEMORY[0x1E4F1B728];
  uint64_t v1 = *MEMORY[0x1E4F72268];
  v10[0] = *MEMORY[0x1E4F72290];
  v10[1] = v1;
  uint64_t v2 = *MEMORY[0x1E4F1B6F8];
  v11[0] = v0;
  v11[1] = v2;
  uint64_t v3 = *MEMORY[0x1E4F1B770];
  uint64_t v4 = *MEMORY[0x1E4F72220];
  v10[2] = *MEMORY[0x1E4F72350];
  v10[3] = v4;
  uint64_t v5 = *MEMORY[0x1E4F1B710];
  v11[2] = v3;
  v11[3] = v5;
  uint64_t v6 = *MEMORY[0x1E4F72340];
  v10[4] = *MEMORY[0x1E4F72258];
  v10[5] = v6;
  v11[4] = v2;
  v11[5] = v3;
  uint64_t v7 = *MEMORY[0x1E4F72348];
  v10[6] = *MEMORY[0x1E4F72260];
  v10[7] = v7;
  v11[6] = v2;
  v11[7] = v3;
  uint64_t v8 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v11 forKeys:v10 count:8];
  id v9 = (void *)_labelFromLMFieldString_qualifiers__map;
  _labelFromLMFieldString_qualifiers__map = v8;
}

+ (id)_subfieldsFromString:(id)a3
{
  v8[1] = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  if (_subfieldsFromString__once != -1) {
    dispatch_once(&_subfieldsFromString__once, &__block_literal_global_200);
  }
  uint64_t v4 = [(id)_subfieldsFromString__map objectForKeyedSubscript:v3];
  uint64_t v5 = (void *)v4;
  if (v4)
  {
    v8[0] = v4;
    uint64_t v6 = [MEMORY[0x1E4F1C978] arrayWithObjects:v8 count:1];
  }
  else
  {
    uint64_t v6 = 0;
  }

  return v6;
}

void __41__PPQuickTypeQuery__subfieldsFromString___block_invoke()
{
  uint64_t v0 = (void *)_subfieldsFromString__map;
  _subfieldsFromString__map = MEMORY[0x1E4F1CC08];
}

+ (unsigned)_timeFromString:(id)a3
{
  uint64_t v3 = _timeFromString__once;
  id v4 = a3;
  if (v3 != -1) {
    dispatch_once(&_timeFromString__once, &__block_literal_global_198);
  }
  uint64_t v5 = [(id)_timeFromString__map objectForKeyedSubscript:v4];

  unsigned __int8 v6 = [v5 unsignedIntValue];
  return v6;
}

void __36__PPQuickTypeQuery__timeFromString___block_invoke()
{
  v6[6] = *MEMORY[0x1E4F143B8];
  uint64_t v0 = *MEMORY[0x1E4F722B8];
  v5[0] = *MEMORY[0x1E4F722B0];
  v5[1] = v0;
  v6[0] = &unk_1EDA6ACF0;
  v6[1] = &unk_1EDA6ACF0;
  uint64_t v1 = *MEMORY[0x1E4F72270];
  v5[2] = *MEMORY[0x1E4F721E0];
  v5[3] = v1;
  v6[2] = &unk_1EDA6ACF0;
  v6[3] = &unk_1EDA6AD08;
  uint64_t v2 = *MEMORY[0x1E4F72278];
  v5[4] = *MEMORY[0x1E4F72328];
  v5[5] = v2;
  v6[4] = &unk_1EDA6ACF0;
  v6[5] = &unk_1EDA6ACF0;
  uint64_t v3 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v6 forKeys:v5 count:6];
  id v4 = (void *)_timeFromString__map;
  _timeFromString__map = v3;
}

+ (unsigned)_fieldsFromStrings:(id)a3
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  if (_fieldsFromStrings__once != -1) {
    dispatch_once(&_fieldsFromStrings__once, &__block_literal_global_157);
  }
  long long v14 = 0u;
  long long v15 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  id v4 = v3;
  uint64_t v5 = [v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    unsigned int v7 = 0;
    uint64_t v8 = *(void *)v13;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v13 != v8) {
          objc_enumerationMutation(v4);
        }
        uint64_t v10 = objc_msgSend((id)_fieldsFromStrings__map, "objectForKeyedSubscript:", *(void *)(*((void *)&v12 + 1) + 8 * i), (void)v12);
        v7 |= [v10 unsignedIntValue];
      }
      uint64_t v6 = [v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v6);
  }
  else
  {
    unsigned int v7 = 0;
  }

  return v7;
}

void __39__PPQuickTypeQuery__fieldsFromStrings___block_invoke()
{
  v17[28] = *MEMORY[0x1E4F143B8];
  uint64_t v0 = *MEMORY[0x1E4F72290];
  v16[0] = *MEMORY[0x1E4F722C8];
  v16[1] = v0;
  v17[0] = &unk_1EDA6AEB8;
  v17[1] = &unk_1EDA6AEB8;
  uint64_t v1 = *MEMORY[0x1E4F72350];
  v16[2] = *MEMORY[0x1E4F72268];
  v16[3] = v1;
  v17[2] = &unk_1EDA6AEB8;
  v17[3] = &unk_1EDA6AEB8;
  uint64_t v2 = *MEMORY[0x1E4F72200];
  v16[4] = *MEMORY[0x1E4F72220];
  v16[5] = v2;
  v17[4] = &unk_1EDA6AEB8;
  v17[5] = &unk_1EDA6AED0;
  uint64_t v3 = *MEMORY[0x1E4F72258];
  v16[6] = *MEMORY[0x1E4F721B0];
  v16[7] = v3;
  v17[6] = &unk_1EDA6AEE8;
  v17[7] = &unk_1EDA6AEE8;
  uint64_t v4 = *MEMORY[0x1E4F72240];
  v16[8] = *MEMORY[0x1E4F72340];
  v16[9] = v4;
  v17[8] = &unk_1EDA6AEE8;
  v17[9] = &unk_1EDA6AF30;
  uint64_t v5 = *MEMORY[0x1E4F72230];
  v16[10] = *MEMORY[0x1E4F72310];
  v16[11] = v5;
  v17[10] = &unk_1EDA6AF48;
  v17[11] = &unk_1EDA6AF60;
  uint64_t v6 = *MEMORY[0x1E4F72348];
  v16[12] = *MEMORY[0x1E4F72260];
  v16[13] = v6;
  v17[12] = &unk_1EDA6AF00;
  v17[13] = &unk_1EDA6AF00;
  uint64_t v7 = *MEMORY[0x1E4F721C0];
  v16[14] = *MEMORY[0x1E4F722D0];
  v16[15] = v7;
  v17[14] = &unk_1EDA6AF18;
  v17[15] = &unk_1EDA6AF78;
  uint64_t v8 = *MEMORY[0x1E4F722B0];
  v16[16] = *MEMORY[0x1E4F721B8];
  v16[17] = v8;
  v17[16] = &unk_1EDA6AF90;
  v17[17] = &unk_1EDA6AFC0;
  uint64_t v9 = *MEMORY[0x1E4F721E0];
  v16[18] = *MEMORY[0x1E4F722B8];
  v16[19] = v9;
  v17[18] = &unk_1EDA6AFF0;
  v17[19] = &unk_1EDA6B008;
  uint64_t v10 = *MEMORY[0x1E4F72328];
  v16[20] = *MEMORY[0x1E4F72270];
  v16[21] = v10;
  v17[20] = &unk_1EDA6AFF0;
  v17[21] = &unk_1EDA6AFF0;
  uint64_t v11 = *MEMORY[0x1E4F72300];
  v16[22] = *MEMORY[0x1E4F72278];
  v16[23] = v11;
  v17[22] = &unk_1EDA6AFD8;
  v17[23] = &unk_1EDA6AFA8;
  uint64_t v12 = *MEMORY[0x1E4F721F8];
  v16[24] = *MEMORY[0x1E4F721F0];
  v16[25] = v12;
  v17[24] = &unk_1EDA6B038;
  v17[25] = &unk_1EDA6B020;
  uint64_t v13 = *MEMORY[0x1E4F721A8];
  v16[26] = *MEMORY[0x1E4F721E8];
  v16[27] = v13;
  v17[26] = &unk_1EDA6B050;
  v17[27] = &unk_1EDA6B068;
  uint64_t v14 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v17 forKeys:v16 count:28];
  long long v15 = (void *)_fieldsFromStrings__map;
  _fieldsFromStrings__map = v14;
}

+ (unsigned)_semanticTagFromString:(id)a3
{
  uint64_t v3 = _semanticTagFromString__once;
  id v4 = a3;
  if (v3 != -1) {
    dispatch_once(&_semanticTagFromString__once, &__block_literal_global_141);
  }
  uint64_t v5 = [(id)_semanticTagFromString__map objectForKeyedSubscript:v4];

  unsigned __int8 v6 = [v5 unsignedIntValue];
  return v6;
}

void __43__PPQuickTypeQuery__semanticTagFromString___block_invoke()
{
  v3[22] = *MEMORY[0x1E4F143B8];
  v2[0] = @"name";
  v2[1] = @"honorifix-prefix";
  v3[0] = &unk_1EDA6ADE0;
  v3[1] = &unk_1EDA6AE28;
  v2[2] = @"given-name";
  v2[3] = @"additional-name";
  v3[2] = &unk_1EDA6AE10;
  v3[3] = &unk_1EDA6AEA0;
  v2[4] = @"family-name";
  v2[5] = @"nickname";
  v3[4] = &unk_1EDA6ADF8;
  v3[5] = &unk_1EDA6AEA0;
  v2[6] = @"honorifix-suffix";
  v2[7] = @"organization-title";
  v3[6] = &unk_1EDA6AE40;
  v3[7] = &unk_1EDA6AEA0;
  v2[8] = @"organization";
  v2[9] = @"location";
  v3[8] = &unk_1EDA6AD08;
  v3[9] = &unk_1EDA6AD20;
  v2[10] = @"street-address";
  v2[11] = @"address-line1";
  v3[10] = &unk_1EDA6ACF0;
  v3[11] = &unk_1EDA6AD38;
  v2[12] = @"address-line2";
  v2[13] = @"address-level2";
  v3[12] = &unk_1EDA6AEA0;
  v3[13] = &unk_1EDA6AD50;
  v2[14] = @"address-level1+2";
  v2[15] = @"address-level1";
  v3[14] = &unk_1EDA6ADB0;
  v3[15] = &unk_1EDA6AD80;
  v2[16] = @"address-level3";
  v2[17] = @"country-name";
  v3[16] = &unk_1EDA6ADC8;
  v3[17] = &unk_1EDA6AD98;
  v2[18] = @"postal-code";
  v2[19] = @"tel";
  v3[18] = &unk_1EDA6AD68;
  v3[19] = &unk_1EDA6AE70;
  v2[20] = @"email";
  v2[21] = @"url";
  v3[20] = &unk_1EDA6AE58;
  v3[21] = &unk_1EDA6AE88;
  uint64_t v0 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v3 forKeys:v2 count:22];
  uint64_t v1 = (void *)_semanticTagFromString__map;
  _semanticTagFromString__map = v0;
}

+ (unsigned)_subtypeFromString:(id)a3
{
  uint64_t v3 = _subtypeFromString__once;
  id v4 = a3;
  if (v3 != -1) {
    dispatch_once(&_subtypeFromString__once, &__block_literal_global_125);
  }
  uint64_t v5 = [(id)_subtypeFromString__map objectForKeyedSubscript:v4];

  unsigned __int8 v6 = [v5 unsignedIntValue];
  return v6;
}

void __39__PPQuickTypeQuery__subtypeFromString___block_invoke()
{
  v12[18] = *MEMORY[0x1E4F143B8];
  uint64_t v0 = *MEMORY[0x1E4F722F8];
  v11[0] = *MEMORY[0x1E4F72228];
  v11[1] = v0;
  v12[0] = &unk_1EDA6ACF0;
  v12[1] = &unk_1EDA6AD08;
  uint64_t v1 = *MEMORY[0x1E4F722B0];
  v11[2] = *MEMORY[0x1E4F72320];
  v11[3] = v1;
  v12[2] = &unk_1EDA6AD08;
  v12[3] = &unk_1EDA6AD20;
  uint64_t v2 = *MEMORY[0x1E4F72278];
  v11[4] = *MEMORY[0x1E4F72328];
  v11[5] = v2;
  v12[4] = &unk_1EDA6AD20;
  v12[5] = &unk_1EDA6AD20;
  uint64_t v3 = *MEMORY[0x1E4F721E0];
  v11[6] = *MEMORY[0x1E4F722B8];
  v11[7] = v3;
  v12[6] = &unk_1EDA6AD38;
  v12[7] = &unk_1EDA6AD38;
  uint64_t v4 = *MEMORY[0x1E4F722E8];
  v11[8] = *MEMORY[0x1E4F72270];
  void v11[9] = v4;
  v12[8] = &unk_1EDA6AD38;
  v12[9] = &unk_1EDA6AD68;
  uint64_t v5 = *MEMORY[0x1E4F721F0];
  v11[10] = *MEMORY[0x1E4F722E0];
  v11[11] = v5;
  v12[10] = &unk_1EDA6AD80;
  v12[11] = &unk_1EDA6AD98;
  uint64_t v6 = *MEMORY[0x1E4F721F8];
  v11[12] = *MEMORY[0x1E4F721E8];
  v11[13] = v6;
  v12[12] = &unk_1EDA6AD98;
  v12[13] = &unk_1EDA6AD98;
  uint64_t v7 = *MEMORY[0x1E4F72298];
  v11[14] = *MEMORY[0x1E4F721D8];
  v11[15] = v7;
  v12[14] = &unk_1EDA6ADB0;
  v12[15] = &unk_1EDA6ADC8;
  uint64_t v8 = *MEMORY[0x1E4F72218];
  v11[16] = *MEMORY[0x1E4F722A0];
  v11[17] = v8;
  v12[16] = &unk_1EDA6ADE0;
  v12[17] = &unk_1EDA6ADF8;
  uint64_t v9 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v12 forKeys:v11 count:18];
  uint64_t v10 = (void *)_subtypeFromString__map;
  _subtypeFromString__map = v9;
}

+ (unsigned)_typeFromString:(id)a3
{
  uint64_t v3 = _typeFromString__once;
  id v4 = a3;
  if (v3 != -1) {
    dispatch_once(&_typeFromString__once, &__block_literal_global_156);
  }
  uint64_t v5 = [(id)_typeFromString__map objectForKeyedSubscript:v4];

  unsigned __int8 v6 = [v5 unsignedIntValue];
  return v6;
}

void __36__PPQuickTypeQuery__typeFromString___block_invoke()
{
  v5[5] = *MEMORY[0x1E4F143B8];
  uint64_t v0 = *MEMORY[0x1E4F72208];
  v4[0] = *MEMORY[0x1E4F722C0];
  v4[1] = v0;
  v5[0] = &unk_1EDA6ACF0;
  v5[1] = &unk_1EDA6AD08;
  uint64_t v1 = *MEMORY[0x1E4F722A8];
  v4[2] = *MEMORY[0x1E4F72280];
  v4[3] = v1;
  v5[2] = &unk_1EDA6AD20;
  v5[3] = &unk_1EDA6AD38;
  v4[4] = *MEMORY[0x1E4F72338];
  v5[4] = &unk_1EDA6AD50;
  uint64_t v2 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v5 forKeys:v4 count:5];
  uint64_t v3 = (void *)_typeFromString__map;
  _typeFromString__map = v2;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

+ (id)quickTypeQueryWithType:(unsigned __int8)a3 subtype:(unsigned __int8)a4 semanticTag:(unsigned __int8)a5 fields:(unsigned int)a6 time:(unsigned __int8)a7 options:(unsigned __int8)a8 subFields:(id)a9 label:(id)a10 people:(id)a11 localeIdentifier:(id)a12 bundleIdentifier:(id)a13 recipients:(id)a14
{
  unsigned int v26 = a7;
  unsigned int v27 = a8;
  uint64_t v14 = a5;
  uint64_t v15 = a4;
  uint64_t v16 = a3;
  id v17 = a14;
  id v18 = a13;
  id v19 = a12;
  id v20 = a11;
  id v21 = a10;
  id v22 = a9;
  unsigned __int8 v23 = [[PPQuickTypeQuery alloc] initWithType:v16 subtype:v15 semanticTag:v14 fields:a6 time:v26 options:v27 subFields:v22 label:v21 people:v20 localeIdentifier:v19 bundleIdentifier:v18 recipients:v17 timeoutSeconds:0];

  return v23;
}

+ (id)quickTypeQueryWithType:(unsigned __int8)a3 subtype:(unsigned __int8)a4 semanticTag:(unsigned __int8)a5 fields:(unsigned int)a6 time:(unsigned __int8)a7 subFields:(id)a8 label:(id)a9 people:(id)a10 localeIdentifier:(id)a11 bundleIdentifier:(id)a12 recipients:(id)a13
{
  unsigned int v26 = a7;
  uint64_t v14 = a5;
  uint64_t v15 = a4;
  uint64_t v16 = a3;
  id v17 = a13;
  id v18 = a12;
  id v19 = a11;
  id v20 = a10;
  id v21 = a9;
  id v22 = a8;
  unsigned __int8 v23 = [[PPQuickTypeQuery alloc] initWithType:v16 subtype:v15 semanticTag:v14 fields:a6 time:v26 options:0 subFields:v22 label:v21 people:v20 localeIdentifier:v19 bundleIdentifier:v18 recipients:v17 timeoutSeconds:0];

  return v23;
}

+ (id)quickTypeQueryFromLMTokens:(id)a3 localeIdentifier:(id)a4 recipients:(id)a5 bundleIdentifier:(id)a6
{
  v41[1] = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  uint64_t v11 = *MEMORY[0x1E4F722F0];
  id v38 = a6;
  id v12 = a5;
  id v37 = a4;
  uint64_t v13 = [v10 objectForKeyedSubscript:v11];
  uint64_t v14 = (void *)MEMORY[0x1E4F721D0];
  uint64_t v15 = [v10 objectForKeyedSubscript:*MEMORY[0x1E4F721D0]];
  uint64_t v16 = (void *)v15;
  if (v13)
  {
    v41[0] = v13;
    id v17 = [MEMORY[0x1E4F1C978] arrayWithObjects:v41 count:1];
    if (!v16) {
      goto LABEL_4;
    }
    goto LABEL_3;
  }
  id v17 = 0;
  if (v15)
  {
LABEL_3:
    v40 = v16;
    uint64_t v18 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v40 count:1];

    id v17 = (void *)v18;
  }
LABEL_4:
  id v19 = [v10 objectForKeyedSubscript:*MEMORY[0x1E4F722D8]];
  v34 = [PPQuickTypeQuery alloc];
  v35 = [v10 objectForKeyedSubscript:*MEMORY[0x1E4F72330]];
  unsigned int v33 = objc_msgSend(a1, "_typeFromString:");
  uint64_t v20 = (uint64_t)v13;
  if (!v13)
  {
    uint64_t v20 = [v10 objectForKeyedSubscript:*MEMORY[0x1E4F72308]];
  }
  v39 = v16;
  unsigned int v32 = [a1 _subtypeFromString:v20];
  id v21 = [v10 objectForKeyedSubscript:@"textContentTypeTag"];
  unsigned int v30 = [a1 _semanticTagFromString:v21];
  unsigned int v29 = [a1 _fieldsFromStrings:v17];
  v36 = v17;
  if (v13)
  {
    unsigned int v28 = [a1 _timeFromString:v13];
    uint64_t v22 = [a1 _subfieldsFromString:v13];
    id v31 = v21;
    id v21 = (void *)v22;
  }
  else
  {
    unsigned int v28 = 0;
    uint64_t v22 = 0;
    id v31 = (void *)v20;
  }
  unsigned __int8 v23 = [v10 objectForKeyedSubscript:*v14];
  id v24 = [a1 _labelFromLMFieldString:v23 qualifiers:v19];
  unsigned __int8 v25 = [a1 _peopleNamesFromLMQualifiers:v19];
  unsigned int v26 = [(PPQuickTypeQuery *)v34 initWithType:v33 subtype:v32 semanticTag:v30 fields:v29 time:v28 options:0 subFields:v22 label:v24 people:v25 localeIdentifier:v37 bundleIdentifier:v38 recipients:v12 timeoutSeconds:&unk_1EDA6ACC0];

  return v26;
}

@end