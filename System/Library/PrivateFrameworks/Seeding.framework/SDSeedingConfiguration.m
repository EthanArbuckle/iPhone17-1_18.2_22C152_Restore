@interface SDSeedingConfiguration
+ (BOOL)supportsSecureCoding;
+ (SDSeedingConfiguration)nullConfiguration;
+ (id)currentConfiguration;
- (BOOL)isEqual:(id)a3;
- (NSDictionary)dictionaryRepresentation;
- (NSDictionary)enrollmentMetadata;
- (NSNumber)accountID;
- (NSNumber)seedProgramID;
- (NSString)assetAudience;
- (NSString)catalog;
- (SDSeedingConfiguration)initWithBetaProgram:(id)a3;
- (SDSeedingConfiguration)initWithCoder:(id)a3;
- (SDSeedingConfiguration)initWithDictionaryRepresentation:(id)a3;
- (id)description;
- (int64_t)seedProgram;
- (void)encodeWithCoder:(id)a3;
- (void)setAccountID:(id)a3;
- (void)setAssetAudience:(id)a3;
- (void)setCatalog:(id)a3;
- (void)setSeedProgram:(int64_t)a3;
- (void)setSeedProgramID:(id)a3;
@end

@implementation SDSeedingConfiguration

- (SDSeedingConfiguration)initWithDictionaryRepresentation:(id)a3
{
  id v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)SDSeedingConfiguration;
  v5 = [(SDSeedingConfiguration *)&v11 init];
  if (v5)
  {
    v6 = [v4 objectForKeyedSubscript:@"seedProgram"];
    [(SDSeedingConfiguration *)v5 setSeedProgram:+[SDSeedProgramManager _seedProgramForString:v6]];

    v7 = [v4 objectForKeyedSubscript:@"assetAudience"];
    [(SDSeedingConfiguration *)v5 setAssetAudience:v7];

    v8 = [v4 objectForKeyedSubscript:@"catalog"];
    [(SDSeedingConfiguration *)v5 setCatalog:v8];

    v9 = [v4 objectForKeyedSubscript:@"accountID"];
    [(SDSeedingConfiguration *)v5 setAccountID:v9];
  }
  return v5;
}

- (SDSeedingConfiguration)initWithBetaProgram:(id)a3
{
  id v4 = a3;
  v16.receiver = self;
  v16.super_class = (Class)SDSeedingConfiguration;
  v5 = [(SDSeedingConfiguration *)&v16 init];
  if (v5)
  {
    -[SDSeedingConfiguration setSeedProgram:](v5, "setSeedProgram:", [v4 program]);
    uint64_t v6 = [v4 assetAudience];
    v7 = (void *)v6;
    if (v6) {
      v8 = (__CFString *)v6;
    }
    else {
      v8 = &stru_1F38E69D8;
    }
    [(SDSeedingConfiguration *)v5 setAssetAudience:v8];

    v9 = [v4 catalog];
    uint64_t v10 = [v9 absoluteString];
    objc_super v11 = (void *)v10;
    if (v10) {
      v12 = (__CFString *)v10;
    }
    else {
      v12 = &stru_1F38E69D8;
    }
    [(SDSeedingConfiguration *)v5 setCatalog:v12];

    v13 = objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(v4, "programID"));
    [(SDSeedingConfiguration *)v5 setSeedProgramID:v13];

    v14 = objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(v4, "accountID"));
    [(SDSeedingConfiguration *)v5 setAccountID:v14];
  }
  return v5;
}

- (SDSeedingConfiguration)initWithCoder:(id)a3
{
  id v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)SDSeedingConfiguration;
  v5 = [(SDSeedingConfiguration *)&v12 init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"seedProgram"];
    [(SDSeedingConfiguration *)v5 setSeedProgram:+[SDSeedProgramManager _seedProgramForString:v6]];
    v7 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"assetAudience"];
    [(SDSeedingConfiguration *)v5 setAssetAudience:v7];

    v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"catalog"];
    [(SDSeedingConfiguration *)v5 setCatalog:v8];

    v9 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"seedProgramID"];
    [(SDSeedingConfiguration *)v5 setSeedProgramID:v9];

    uint64_t v10 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"accountID"];
    [(SDSeedingConfiguration *)v5 setAccountID:v10];
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  v5 = +[SDSeedProgramManager stringForSeedProgram:[(SDSeedingConfiguration *)self seedProgram]];
  [v4 encodeObject:v5 forKey:@"seedProgram"];

  uint64_t v6 = [(SDSeedingConfiguration *)self assetAudience];
  [v4 encodeObject:v6 forKey:@"assetAudience"];

  v7 = [(SDSeedingConfiguration *)self catalog];
  [v4 encodeObject:v7 forKey:@"catalog"];

  v8 = [(SDSeedingConfiguration *)self seedProgramID];
  [v4 encodeObject:v8 forKey:@"seedProgramID"];

  id v9 = [(SDSeedingConfiguration *)self accountID];
  [v4 encodeObject:v9 forKey:@"accountID"];
}

+ (id)currentConfiguration
{
  v2 = objc_alloc_init(SDSeedingConfiguration);
  v3 = +[SDBetaManager _currentBetaProgram];
  id v4 = v3;
  if (v3) {
    uint64_t v5 = [v3 program];
  }
  else {
    uint64_t v5 = 0;
  }
  [(SDSeedingConfiguration *)v2 setSeedProgram:v5];
  uint64_t v6 = +[SDCatalogUtilities _currentAssetAudience];
  v7 = (void *)v6;
  if (v6) {
    v8 = (__CFString *)v6;
  }
  else {
    v8 = &stru_1F38E69D8;
  }
  [(SDSeedingConfiguration *)v2 setAssetAudience:v8];

  id v9 = +[SDBetaManager sharedManager];
  uint64_t v10 = [v9 _assetServerURLString];
  objc_super v11 = (void *)v10;
  if (v10) {
    objc_super v12 = (__CFString *)v10;
  }
  else {
    objc_super v12 = &stru_1F38E69D8;
  }
  [(SDSeedingConfiguration *)v2 setCatalog:v12];

  v13 = objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(v4, "programID"));
  [(SDSeedingConfiguration *)v2 setSeedProgramID:v13];

  v14 = objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(v4, "accountID"));
  [(SDSeedingConfiguration *)v2 setAccountID:v14];

  return v2;
}

- (NSDictionary)dictionaryRepresentation
{
  v22[5] = *MEMORY[0x1E4F143B8];
  v21[0] = @"seedProgram";
  uint64_t v3 = +[SDSeedProgramManager stringForSeedProgram:[(SDSeedingConfiguration *)self seedProgram]];
  id v4 = (void *)v3;
  if (v3) {
    uint64_t v5 = (__CFString *)v3;
  }
  else {
    uint64_t v5 = &stru_1F38E69D8;
  }
  v22[0] = v5;
  v21[1] = @"assetAudience";
  uint64_t v6 = [(SDSeedingConfiguration *)self assetAudience];
  v7 = (void *)v6;
  if (v6) {
    v8 = (__CFString *)v6;
  }
  else {
    v8 = &stru_1F38E69D8;
  }
  v22[1] = v8;
  v21[2] = @"catalog";
  uint64_t v9 = [(SDSeedingConfiguration *)self catalog];
  uint64_t v10 = (void *)v9;
  if (v9) {
    objc_super v11 = (__CFString *)v9;
  }
  else {
    objc_super v11 = &stru_1F38E69D8;
  }
  v22[2] = v11;
  v21[3] = @"seedProgramID";
  objc_super v12 = [(SDSeedingConfiguration *)self seedProgramID];
  uint64_t v13 = [v12 stringValue];
  v14 = (void *)v13;
  if (v13) {
    v15 = (__CFString *)v13;
  }
  else {
    v15 = &stru_1F38E69D8;
  }
  v22[3] = v15;
  v21[4] = @"accountID";
  uint64_t v16 = [(SDSeedingConfiguration *)self accountID];
  v17 = (void *)v16;
  v18 = &unk_1F38EAF78;
  if (v16) {
    v18 = (void *)v16;
  }
  v22[4] = v18;
  v19 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v22 forKeys:v21 count:5];

  return (NSDictionary *)v19;
}

- (NSDictionary)enrollmentMetadata
{
  uint64_t v3 = [MEMORY[0x1E4F1CA60] dictionaryWithCapacity:3];
  id v4 = [(SDSeedingConfiguration *)self assetAudience];
  [v3 setObject:v4 forKeyedSubscript:@"AssetAudience"];

  uint64_t v5 = [(SDSeedingConfiguration *)self seedProgramID];
  uint64_t v6 = [v5 stringValue];
  [v3 setObject:v6 forKeyedSubscript:@"ProgramID"];

  v7 = +[SDSeedProgramManager stringForSeedProgram:[(SDSeedingConfiguration *)self seedProgram]];
  [v3 setObject:v7 forKeyedSubscript:@"SeedProgram"];

  v8 = [MEMORY[0x1E4F1C9E8] dictionaryWithDictionary:v3];

  return (NSDictionary *)v8;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (v4 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    id v5 = v4;
    int64_t v6 = [(SDSeedingConfiguration *)self seedProgram];
    if (v6 == [v5 seedProgram])
    {
      v7 = [(SDSeedingConfiguration *)self assetAudience];
      v8 = [v5 assetAudience];
      if ([v7 isEqualToString:v8])
      {
        uint64_t v9 = [(SDSeedingConfiguration *)self catalog];
        uint64_t v10 = [v5 catalog];
        if ([v9 isEqualToString:v10])
        {
          objc_super v11 = [(SDSeedingConfiguration *)self seedProgramID];
          objc_super v12 = [v5 seedProgramID];
          char v13 = [v11 isEqualToNumber:v12];
        }
        else
        {
          char v13 = 0;
        }
      }
      else
      {
        char v13 = 0;
      }
    }
    else
    {
      char v13 = 0;
    }
  }
  else
  {
    char v13 = 0;
  }

  return v13;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

+ (SDSeedingConfiguration)nullConfiguration
{
  v2 = objc_alloc_init(SDSeedingConfiguration);
  [(SDSeedingConfiguration *)v2 setSeedProgram:0];
  [(SDSeedingConfiguration *)v2 setAssetAudience:&stru_1F38E69D8];
  [(SDSeedingConfiguration *)v2 setCatalog:&stru_1F38E69D8];
  [(SDSeedingConfiguration *)v2 setSeedProgramID:&unk_1F38EAF90];
  [(SDSeedingConfiguration *)v2 setAccountID:&unk_1F38EAF90];
  return v2;
}

- (id)description
{
  uint64_t v3 = NSString;
  id v4 = (objc_class *)objc_opt_class();
  id v5 = NSStringFromClass(v4);
  int64_t v6 = +[SDSeedProgramManager stringForSeedProgram:[(SDSeedingConfiguration *)self seedProgram]];
  v7 = [(SDSeedingConfiguration *)self assetAudience];
  v8 = [v3 stringWithFormat:@"%@: %@ - %@", v5, v6, v7];

  return v8;
}

- (int64_t)seedProgram
{
  return self->_seedProgram;
}

- (void)setSeedProgram:(int64_t)a3
{
  self->_seedProgram = a3;
}

- (NSString)assetAudience
{
  return self->_assetAudience;
}

- (void)setAssetAudience:(id)a3
{
}

- (NSString)catalog
{
  return self->_catalog;
}

- (void)setCatalog:(id)a3
{
}

- (NSNumber)seedProgramID
{
  return self->_seedProgramID;
}

- (void)setSeedProgramID:(id)a3
{
}

- (NSNumber)accountID
{
  return self->_accountID;
}

- (void)setAccountID:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_accountID, 0);
  objc_storeStrong((id *)&self->_seedProgramID, 0);
  objc_storeStrong((id *)&self->_catalog, 0);
  objc_storeStrong((id *)&self->_assetAudience, 0);
}

@end