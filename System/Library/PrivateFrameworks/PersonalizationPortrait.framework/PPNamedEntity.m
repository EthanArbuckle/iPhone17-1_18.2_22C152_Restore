@interface PPNamedEntity
+ (BOOL)supportsSecureCoding;
+ (id)clusterIdentifierFromName:(id)a3;
+ (id)describeCategory:(unint64_t)a3;
+ (unint64_t)categoryForDescription:(id)a3;
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqualToNamedEntity:(id)a3;
- (NSSet)featureNames;
- (NSString)bestLanguage;
- (NSString)clusterIdentifier;
- (NSString)dynamicCategory;
- (NSString)name;
- (PPNamedEntity)initWithCoder:(id)a3;
- (PPNamedEntity)initWithName:(id)a3 category:(unint64_t)a4 dynamicCategory:(id)a5 language:(id)a6;
- (PPNamedEntity)initWithName:(id)a3 category:(unint64_t)a4 dynamicCategory:(id)a5 language:(id)a6 mostRelevantRecord:(id)a7;
- (PPNamedEntity)initWithName:(id)a3 category:(unint64_t)a4 language:(id)a5;
- (PPNamedEntityRecord)mostRelevantRecord;
- (double)sentimentScore;
- (id)description;
- (id)featureValueForName:(id)a3;
- (unint64_t)category;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
@end

@implementation PPNamedEntity

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_clusterIdentifier, 0);
  objc_storeStrong((id *)&self->_bestLanguage, 0);
  objc_storeStrong((id *)&self->_dynamicCategory, 0);
  objc_storeStrong((id *)&self->_name, 0);
}

- (NSString)clusterIdentifier
{
  return self->_clusterIdentifier;
}

- (NSString)bestLanguage
{
  return self->_bestLanguage;
}

- (NSString)dynamicCategory
{
  return self->_dynamicCategory;
}

- (unint64_t)category
{
  return self->_category;
}

- (NSString)name
{
  return self->_name;
}

- (id)featureValueForName:(id)a3
{
  id v4 = a3;
  if ([v4 isEqualToString:@"name"])
  {
    v5 = (void *)MEMORY[0x1E4F1E950];
    name = self->_name;
LABEL_3:
    uint64_t v7 = [v5 featureValueWithString:name];
LABEL_6:
    v8 = (void *)v7;
    goto LABEL_7;
  }
  if ([v4 isEqualToString:@"category"])
  {
    uint64_t v7 = [MEMORY[0x1E4F1E950] featureValueWithInt64:self->_category];
    goto LABEL_6;
  }
  if ([v4 isEqualToString:@"dynamicCategory"])
  {
    v10 = (void *)MEMORY[0x1E4F1E950];
    uint64_t v11 = [(PPNamedEntity *)self dynamicCategory];
    v12 = (void *)v11;
    if (v11) {
      v13 = (__CFString *)v11;
    }
    else {
      v13 = &stru_1EDA56F70;
    }
    v8 = [v10 featureValueWithString:v13];

    goto LABEL_7;
  }
  if ([v4 isEqualToString:@"bestLanguage"])
  {
    v5 = (void *)MEMORY[0x1E4F1E950];
    name = self->_bestLanguage;
    goto LABEL_3;
  }
  if ([v4 isEqualToString:@"sentimentScore"])
  {
    v14 = (void *)MEMORY[0x1E4F1E950];
    [(PPNamedEntity *)self sentimentScore];
    uint64_t v7 = objc_msgSend(v14, "featureValueWithDouble:");
    goto LABEL_6;
  }
  v8 = 0;
LABEL_7:

  return v8;
}

- (NSSet)featureNames
{
  if (featureNames__pasOnceToken6 != -1) {
    dispatch_once(&featureNames__pasOnceToken6, &__block_literal_global_236);
  }
  v2 = (void *)featureNames__pasExprOnceResult_237;
  return (NSSet *)v2;
}

void __29__PPNamedEntity_featureNames__block_invoke()
{
  v0 = (void *)MEMORY[0x192F97350]();
  v1 = (void *)MEMORY[0x192F97350]();
  uint64_t v2 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CAD0]), "initWithObjects:", @"name", @"bestLanguage", @"category", @"dynamicCategory", @"sentimentScore", 0);
  v3 = (void *)featureNames__pasExprOnceResult_237;
  featureNames__pasExprOnceResult_237 = v2;
}

- (double)sentimentScore
{
  return 0.0;
}

- (id)description
{
  id v3 = [NSString alloc];
  name = self->_name;
  v5 = +[PPNamedEntity describeCategory:self->_category];
  v6 = (void *)[v3 initWithFormat:@"<PPNamedEntity n:'%@' c:'%@' l:%@>", name, v5, self->_bestLanguage];

  return v6;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (PPNamedEntity *)a3;
  if (v4 == self)
  {
    BOOL v5 = 1;
  }
  else
  {
    objc_opt_class();
    BOOL v5 = (objc_opt_isKindOfClass() & 1) != 0
      && [(PPNamedEntity *)self isEqualToNamedEntity:v4];
  }

  return v5;
}

- (BOOL)isEqualToNamedEntity:(id)a3
{
  id v4 = (PPNamedEntity *)a3;
  BOOL v5 = v4;
  if (v4 == self)
  {
    LOBYTE(v12) = 1;
  }
  else
  {
    if (v4)
    {
      v6 = self->_name;
      uint64_t v7 = [(PPNamedEntity *)v5 name];
      if ((unint64_t)v6 | v7)
      {
        uint64_t v11 = (void *)v7;
        LOBYTE(v12) = 0;
        if (!v6 || !v7) {
          goto LABEL_21;
        }
        BOOL v12 = [(NSString *)v6 isEqualToString:v7];

        if (!v12) {
          goto LABEL_22;
        }
      }
      unint64_t category = self->_category;
      if (category == [(PPNamedEntity *)v5 category])
      {
        v6 = self->_dynamicCategory;
        uint64_t v9 = [(PPNamedEntity *)v5 dynamicCategory];
        if (!((unint64_t)v6 | v9))
        {
LABEL_6:
          v6 = self->_bestLanguage;
          uint64_t v10 = [(PPNamedEntity *)v5 bestLanguage];
          if ((unint64_t)v6 | v10)
          {
            uint64_t v11 = (void *)v10;
            LOBYTE(v12) = 0;
            if (v6 && v10) {
              LOBYTE(v12) = [(NSString *)v6 isEqualToString:v10];
            }
          }
          else
          {
            uint64_t v11 = 0;
            v6 = 0;
            LOBYTE(v12) = 1;
          }
          goto LABEL_21;
        }
        uint64_t v11 = (void *)v9;
        LOBYTE(v12) = 0;
        if (v6 && v9)
        {
          BOOL v12 = [(NSString *)v6 isEqualToString:v9];

          if (!v12) {
            goto LABEL_22;
          }
          goto LABEL_6;
        }
LABEL_21:

        goto LABEL_22;
      }
    }
    LOBYTE(v12) = 0;
  }
LABEL_22:

  return v12;
}

- (unint64_t)hash
{
  unint64_t v3 = self->_category ^ [(NSString *)self->_name hash];
  NSUInteger v4 = [(NSString *)self->_bestLanguage hash];
  return v3 ^ v4 ^ [(NSString *)self->_dynamicCategory hash];
}

- (void)encodeWithCoder:(id)a3
{
  name = self->_name;
  id v5 = a3;
  [v5 encodeObject:name forKey:@"name"];
  [v5 encodeInt32:LODWORD(self->_category) forKey:@"cat"];
  [v5 encodeObject:self->_dynamicCategory forKey:@"dcat"];
  [v5 encodeObject:self->_bestLanguage forKey:@"lang"];
  id v6 = [(PPNamedEntity *)self mostRelevantRecord];
  [v5 encodeObject:v6 forKey:@"rec"];
}

- (PPNamedEntity)initWithCoder:(id)a3
{
  id v4 = a3;
  uint64_t v5 = objc_opt_class();
  id v6 = [v4 decodeObjectOfClass:v5 forKey:@"name"];
  int v7 = [v4 decodeInt32ForKey:@"cat"];
  v8 = [v4 decodeObjectOfClass:v5 forKey:@"dcat"];
  uint64_t v9 = [v4 decodeObjectOfClass:v5 forKey:@"lang"];
  uint64_t v10 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"rec"];

  if (v6) {
    BOOL v11 = v9 == 0;
  }
  else {
    BOOL v11 = 1;
  }
  if (v11)
  {
    BOOL v12 = 0;
  }
  else
  {
    self = [(PPNamedEntity *)self initWithName:v6 category:v7 dynamicCategory:v8 language:v9 mostRelevantRecord:v10];
    BOOL v12 = self;
  }

  return v12;
}

- (PPNamedEntityRecord)mostRelevantRecord
{
  return 0;
}

- (PPNamedEntity)initWithName:(id)a3 category:(unint64_t)a4 dynamicCategory:(id)a5 language:(id)a6
{
  return [(PPNamedEntity *)self initWithName:a3 category:a4 dynamicCategory:a5 language:a6 mostRelevantRecord:0];
}

- (PPNamedEntity)initWithName:(id)a3 category:(unint64_t)a4 language:(id)a5
{
  return [(PPNamedEntity *)self initWithName:a3 category:a4 dynamicCategory:0 language:a5 mostRelevantRecord:0];
}

- (PPNamedEntity)initWithName:(id)a3 category:(unint64_t)a4 dynamicCategory:(id)a5 language:(id)a6 mostRelevantRecord:(id)a7
{
  id v14 = a3;
  id v15 = a5;
  id v16 = a6;
  id v17 = a7;
  if (v14)
  {
    if (v16) {
      goto LABEL_3;
    }
LABEL_6:
    v26 = [MEMORY[0x1E4F28B00] currentHandler];
    [v26 handleFailureInMethod:a2, self, @"PPNamedEntity.m", 146, @"Invalid parameter not satisfying: %@", @"language" object file lineNumber description];

    if (v17) {
      goto LABEL_4;
    }
    goto LABEL_7;
  }
  v25 = [MEMORY[0x1E4F28B00] currentHandler];
  [v25 handleFailureInMethod:a2, self, @"PPNamedEntity.m", 145, @"Invalid parameter not satisfying: %@", @"name" object file lineNumber description];

  if (!v16) {
    goto LABEL_6;
  }
LABEL_3:
  if (v17)
  {
LABEL_4:
    v18 = [[PPNamedEntityWithRecord alloc] initWithName:v14 category:a4 dynamicCategory:v15 language:v16 mostRelevantRecord:v17];
    goto LABEL_10;
  }
LABEL_7:
  v27.receiver = self;
  v27.super_class = (Class)PPNamedEntity;
  v19 = [(PPNamedEntity *)&v27 init];
  v20 = v19;
  if (v19)
  {
    objc_storeStrong((id *)&v19->_name, a3);
    v20->_unint64_t category = a4;
    objc_storeStrong((id *)&v20->_dynamicCategory, a5);
    objc_storeStrong((id *)&v20->_bestLanguage, a6);
    uint64_t v21 = +[PPNamedEntity clusterIdentifierFromName:v14];
    clusterIdentifier = v20->_clusterIdentifier;
    v20->_clusterIdentifier = (NSString *)v21;
  }
  v18 = v20;
  self = &v18->super;
LABEL_10:
  p_super = &v18->super;

  return p_super;
}

+ (id)clusterIdentifierFromName:(id)a3
{
  id v3 = a3;
  id v4 = (void *)MEMORY[0x192F97350]();
  uint64_t v5 = [v3 lowercaseString];
  if ([v3 isEqualToString:v5])
  {
    id v6 = v3;

    uint64_t v5 = v6;
  }
  int v7 = (void *)[v5 copy];

  return v7;
}

+ (unint64_t)categoryForDescription:(id)a3
{
  v10[21] = *MEMORY[0x1E4F143B8];
  v9[0] = @"person";
  v9[1] = @"organization";
  v10[0] = &unk_1EDA6B080;
  v10[1] = &unk_1EDA6B098;
  v9[2] = @"location";
  v9[3] = @"restaurant";
  v10[2] = &unk_1EDA6B0B0;
  v10[3] = &unk_1EDA6B0C8;
  v9[4] = @"activity location";
  v9[5] = @"media";
  v10[4] = &unk_1EDA6B0E0;
  v10[5] = &unk_1EDA6B0F8;
  v9[6] = @"artist";
  v9[7] = @"street address";
  v10[6] = &unk_1EDA6B110;
  v10[7] = &unk_1EDA6B128;
  v9[8] = @"city";
  v9[9] = @"state";
  v10[8] = &unk_1EDA6B140;
  v10[9] = &unk_1EDA6B158;
  v9[10] = @"country";
  v9[11] = @"full address";
  v10[10] = &unk_1EDA6B170;
  v10[11] = &unk_1EDA6B188;
  v9[12] = @"tourist attraction";
  v9[13] = @"event title";
  v10[12] = &unk_1EDA6B1A0;
  v10[13] = &unk_1EDA6B1B8;
  v9[14] = @"sports team";
  v9[15] = @"professional athlete";
  v10[14] = &unk_1EDA6B1D0;
  v10[15] = &unk_1EDA6B1E8;
  v9[16] = @"musician";
  v9[17] = @"movie";
  v10[16] = &unk_1EDA6B200;
  v10[17] = &unk_1EDA6B218;
  v9[18] = @"dynamic";
  v9[19] = @"politician";
  v10[18] = &unk_1EDA6B230;
  v10[19] = &unk_1EDA6B248;
  v9[20] = @"tv show";
  v10[20] = &unk_1EDA6B260;
  id v3 = (void *)MEMORY[0x1E4F1C9E8];
  id v4 = a3;
  uint64_t v5 = [v3 dictionaryWithObjects:v10 forKeys:v9 count:21];
  id v6 = [v5 objectForKeyedSubscript:v4];

  if (v6) {
    unint64_t v7 = [v6 unsignedIntValue];
  }
  else {
    unint64_t v7 = 0;
  }

  return v7;
}

+ (id)describeCategory:(unint64_t)a3
{
  if (a3 - 1 >= 0x15)
  {
    id v4 = objc_msgSend([NSString alloc], "initWithFormat:", @"unknown (%lu)", a3);
    objc_msgSend(v4, "_pas_stringBackedByUTF8CString");
    id v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v3 = off_1E550DA28[a3 - 1];
  }
  return v3;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end