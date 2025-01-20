@interface SDBetaProgram
+ (BOOL)isPad;
+ (BOOL)supportsSecureCoding;
+ (id)betaProgramWithID:(int64_t)a3 title:(id)a4 program:(id)a5 catalog:(id)a6 assetUpdate:(id)a7 assetBrain:(id)a8 assetAudience:(id)a9 legalDocs:(id)a10 platform:(unint64_t)a11 buildPrefix:(id)a12 accountID:(int64_t)a13 betaEnrollmentToken:(id)a14;
+ (id)betaProgramWithJSON:(id)a3;
- (BOOL)isMDMProgram;
- (NSArray)legalDocs;
- (NSString)assetAudience;
- (NSString)betaEnrollmentToken;
- (NSString)buildPrefix;
- (NSString)title;
- (NSURL)assetBrain;
- (NSURL)assetUpdate;
- (NSURL)catalog;
- (SDBetaProgram)initWithCoder:(id)a3;
- (SDBetaProgram)initWithID:(int64_t)a3 title:(id)a4 program:(id)a5 catalog:(id)a6 assetUpdate:(id)a7 assetBrain:(id)a8 assetAudience:(id)a9 legalDocs:(id)a10 platform:(unint64_t)a11 buildPrefix:(id)a12 accountID:(int64_t)a13 betaEnrollmentToken:(id)a14;
- (id)debugDescription;
- (id)description;
- (int64_t)accountID;
- (int64_t)program;
- (int64_t)programID;
- (unint64_t)platform;
- (void)encodeWithCoder:(id)a3;
- (void)setAccountID:(int64_t)a3;
- (void)setAssetAudience:(id)a3;
- (void)setAssetBrain:(id)a3;
- (void)setAssetUpdate:(id)a3;
- (void)setBetaEnrollmentToken:(id)a3;
- (void)setBuildPrefix:(id)a3;
- (void)setCatalog:(id)a3;
- (void)setLegalDocs:(id)a3;
- (void)setPlatform:(unint64_t)a3;
- (void)setProgram:(int64_t)a3;
- (void)setProgramID:(int64_t)a3;
- (void)setTitle:(id)a3;
@end

@implementation SDBetaProgram

+ (id)betaProgramWithID:(int64_t)a3 title:(id)a4 program:(id)a5 catalog:(id)a6 assetUpdate:(id)a7 assetBrain:(id)a8 assetAudience:(id)a9 legalDocs:(id)a10 platform:(unint64_t)a11 buildPrefix:(id)a12 accountID:(int64_t)a13 betaEnrollmentToken:(id)a14
{
  id v19 = a14;
  id v20 = a12;
  id v21 = a10;
  id v22 = a9;
  id v23 = a8;
  id v24 = a7;
  id v25 = a6;
  id v26 = a5;
  id v27 = a4;
  v28 = [[SDBetaProgram alloc] initWithID:a3 title:v27 program:v26 catalog:v25 assetUpdate:v24 assetBrain:v23 assetAudience:v22 legalDocs:v21 platform:a11 buildPrefix:v20 accountID:a13 betaEnrollmentToken:v19];

  return v28;
}

+ (id)betaProgramWithJSON:(id)a3
{
  v89[1] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = [v4 objectForKeyedSubscript:@"catalog"];
  v6 = NilIfNSNull(v5);

  if (v6)
  {
    v7 = (void *)MEMORY[0x1E4F1CB10];
    v8 = [v4 objectForKeyedSubscript:@"catalog"];
    uint64_t v9 = [v7 URLWithString:v8];
  }
  else
  {
    uint64_t v9 = 0;
  }
  v10 = [v4 objectForKeyedSubscript:@"id"];
  v11 = NilIfNSNull(v10);

  if (v11)
  {
    v12 = [v4 objectForKeyedSubscript:@"id"];
    uint64_t v13 = [v12 integerValue];
  }
  else
  {
    uint64_t v13 = 0;
  }
  v14 = [v4 objectForKeyedSubscript:@"title"];
  v15 = NilIfNSNull(v14);

  if (v15)
  {
    v16 = [v4 objectForKeyedSubscript:@"title"];
    if ([a1 isPad])
    {
      uint64_t v17 = [v16 stringByReplacingOccurrencesOfString:@"iOS" withString:@"iPadOS"];

      v16 = (void *)v17;
    }
  }
  else
  {
    v16 = 0;
  }
  v18 = [v4 objectForKeyedSubscript:@"program"];
  id v19 = NilIfNSNull(v18);

  if (v19)
  {
    id v20 = [v4 objectForKeyedSubscript:@"program"];
    uint64_t v21 = NilIfNSNull(v20);
  }
  else
  {
    uint64_t v21 = 0;
  }
  id v22 = [v4 objectForKeyedSubscript:@"asset_update_url"];
  id v23 = NilIfNSNull(v22);

  if (v23)
  {
    id v24 = (void *)MEMORY[0x1E4F1CB10];
    id v25 = [v4 objectForKeyedSubscript:@"asset_update_url"];
    v79 = [v24 URLWithString:v25];
  }
  else
  {
    v79 = 0;
  }
  id v26 = [v4 objectForKeyedSubscript:@"asset_brain_url"];
  id v27 = NilIfNSNull(v26);

  if (v27)
  {
    v28 = (void *)MEMORY[0x1E4F1CB10];
    v29 = [v4 objectForKeyedSubscript:@"asset_brain_url"];
    v78 = [v28 URLWithString:v29];
  }
  else
  {
    v78 = 0;
  }
  v30 = [v4 objectForKeyedSubscript:@"asset_audience"];
  v31 = NilIfNSNull(v30);

  if (v31)
  {
    v77 = [v4 objectForKeyedSubscript:@"asset_audience"];
  }
  else
  {
    v77 = 0;
  }
  v32 = [v4 objectForKeyedSubscript:@"legal_id"];
  v33 = NilIfNSNull(v32);

  if (v33)
  {
    v34 = [v4 objectForKeyedSubscript:@"legal_id"];
    uint64_t v35 = [v34 integerValue];

    [v4 objectForKeyedSubscript:@"legal"];
    v37 = uint64_t v36 = v21;
    v38 = +[SDLegalDoc legalDocWithID:v35 title:@"Legal" content:v37];
    v89[0] = v38;
    v76 = [MEMORY[0x1E4F1C978] arrayWithObjects:v89 count:1];

    uint64_t v21 = v36;
  }
  else
  {
    v76 = (void *)MEMORY[0x1E4F1CBF0];
  }
  v39 = [v4 objectForKeyedSubscript:@"platform"];
  v40 = NilIfNSNull(v39);

  if (v40)
  {
    v41 = [v4 objectForKeyedSubscript:@"platform"];
    uint64_t v42 = SDPlatformFromString(v41);
  }
  else
  {
    v41 = +[SDSeedingLogging fwHandle];
    if (os_log_type_enabled(v41, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134218242;
      uint64_t v86 = v13;
      __int16 v87 = 2114;
      v88 = v16;
      _os_log_impl(&dword_1DD702000, v41, OS_LOG_TYPE_DEFAULT, "No platform specified for beta program [%ld: %{public}@], falling back to TV", buf, 0x16u);
    }
    uint64_t v42 = 4;
  }

  v43 = [v4 objectForKeyedSubscript:@"program"];
  v44 = NilIfNSNull(v43);

  if (v44)
  {
    v45 = [v4 objectForKeyedSubscript:@"program"];
    +[SDSeedProgramManager _seedProgramForString:v45];
  }
  else
  {
    v45 = +[SDSeedingLogging fwHandle];
    if (os_log_type_enabled(v45, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134218242;
      uint64_t v86 = v13;
      __int16 v87 = 2114;
      v88 = v16;
      _os_log_impl(&dword_1DD702000, v45, OS_LOG_TYPE_DEFAULT, "No programType specified for beta program [%ld: %{public}@], falling back to None", buf, 0x16u);
    }
  }

  v46 = [v4 objectForKeyedSubscript:@"build_prefix"];
  v47 = NilIfNSNull(v46);

  if (v47)
  {
    v75 = [v4 objectForKeyedSubscript:@"build_prefix"];
  }
  else
  {
    v75 = 0;
  }
  v48 = [v4 objectForKeyedSubscript:@"account_id"];
  v49 = NilIfNSNull(v48);

  if (v49)
  {
    v50 = [v4 objectForKeyedSubscript:@"account_id"];
    id v73 = (id)[v50 integerValue];
  }
  else
  {
    id v73 = 0;
  }
  v51 = [v4 objectForKeyedSubscript:@"provided_by"];
  v52 = NilIfNSNull(v51);

  v72 = v52;
  if (v52 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    v70 = v16;
    uint64_t v71 = v13;
    long long v82 = 0u;
    long long v83 = 0u;
    long long v80 = 0u;
    long long v81 = 0u;
    id v53 = v52;
    uint64_t v54 = [v53 countByEnumeratingWithState:&v80 objects:v84 count:16];
    if (v54)
    {
      uint64_t v55 = v54;
      uint64_t v68 = v42;
      v69 = (void *)v9;
      uint64_t v56 = *(void *)v81;
      while (2)
      {
        for (uint64_t i = 0; i != v55; ++i)
        {
          if (*(void *)v81 != v56) {
            objc_enumerationMutation(v53);
          }
          v58 = *(void **)(*((void *)&v80 + 1) + 8 * i);
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            id v59 = v58;
            v60 = [v59 objectForKeyedSubscript:@"type"];
            v61 = NilIfNSNull(v60);

            v62 = [v59 objectForKeyedSubscript:@"token"];
            v63 = NilIfNSNull(v62);

            objc_opt_class();
            if (objc_opt_isKindOfClass())
            {
              objc_opt_class();
              if ((objc_opt_isKindOfClass() & 1) != 0
                && [v61 isEqualToString:@"BetaEnrollmentToken"]
                && [v63 length])
              {

                goto LABEL_59;
              }
            }
          }
        }
        uint64_t v55 = [v53 countByEnumeratingWithState:&v80 objects:v84 count:16];
        if (v55) {
          continue;
        }
        break;
      }
      v63 = 0;
LABEL_59:
      v66 = v69;
      uint64_t v42 = v68;
      v64 = (void *)v21;
    }
    else
    {
      v64 = (void *)v21;
      v66 = (void *)v9;
      v63 = 0;
    }

    v65 = v70;
    uint64_t v13 = v71;
  }
  else
  {
    v64 = (void *)v21;
    v65 = v16;
    v66 = (void *)v9;
    v63 = 0;
  }
  id v74 = +[SDBetaProgram betaProgramWithID:v13 title:v65 program:v64 catalog:v66 assetUpdate:v79 assetBrain:v78 assetAudience:v77 legalDocs:v76 platform:v42 buildPrefix:v75 accountID:v73 betaEnrollmentToken:v63];

  return v74;
}

- (SDBetaProgram)initWithID:(int64_t)a3 title:(id)a4 program:(id)a5 catalog:(id)a6 assetUpdate:(id)a7 assetBrain:(id)a8 assetAudience:(id)a9 legalDocs:(id)a10 platform:(unint64_t)a11 buildPrefix:(id)a12 accountID:(int64_t)a13 betaEnrollmentToken:(id)a14
{
  id v31 = a4;
  id v30 = a5;
  id v29 = a6;
  id v20 = a7;
  id v21 = a8;
  id v22 = a9;
  id v23 = a10;
  id v24 = a12;
  id v25 = a14;
  v32.receiver = self;
  v32.super_class = (Class)SDBetaProgram;
  id v26 = [(SDBetaProgram *)&v32 init];
  id v27 = v26;
  if (v26)
  {
    [(SDBetaProgram *)v26 setProgramID:a3];
    [(SDBetaProgram *)v27 setTitle:v31];
    [(SDBetaProgram *)v27 setProgram:+[SDSeedProgramManager _seedProgramForString:v30]];
    [(SDBetaProgram *)v27 setCatalog:v29];
    [(SDBetaProgram *)v27 setAssetUpdate:v20];
    [(SDBetaProgram *)v27 setAssetBrain:v21];
    [(SDBetaProgram *)v27 setAssetAudience:v22];
    [(SDBetaProgram *)v27 setLegalDocs:v23];
    [(SDBetaProgram *)v27 setPlatform:a11];
    [(SDBetaProgram *)v27 setBuildPrefix:v24];
    [(SDBetaProgram *)v27 setAccountID:a13];
    [(SDBetaProgram *)v27 setBetaEnrollmentToken:v25];
  }

  return v27;
}

- (BOOL)isMDMProgram
{
  v2 = [(SDBetaProgram *)self betaEnrollmentToken];
  BOOL v3 = [v2 length] != 0;

  return v3;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (SDBetaProgram)initWithCoder:(id)a3
{
  id v4 = a3;
  v22.receiver = self;
  v22.super_class = (Class)SDBetaProgram;
  v5 = [(SDBetaProgram *)&v22 init];
  if (v5)
  {
    v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"programID"];
    -[SDBetaProgram setProgramID:](v5, "setProgramID:", [v6 integerValue]);
    v7 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"title"];
    [(SDBetaProgram *)v5 setTitle:v7];

    v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"program"];
    [(SDBetaProgram *)v5 setProgram:+[SDSeedProgramManager _seedProgramForString:v8]];

    uint64_t v9 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"catalog"];
    [(SDBetaProgram *)v5 setCatalog:v9];

    v10 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"assetUpdate"];
    [(SDBetaProgram *)v5 setAssetUpdate:v10];

    v11 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"assetBrain"];
    [(SDBetaProgram *)v5 setAssetBrain:v11];

    v12 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"assetAudience"];
    [(SDBetaProgram *)v5 setAssetAudience:v12];

    uint64_t v13 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v14 = objc_opt_class();
    v15 = objc_msgSend(v13, "setWithObjects:", v14, objc_opt_class(), 0);
    v16 = [v4 decodeObjectOfClasses:v15 forKey:@"legalDocs"];
    [(SDBetaProgram *)v5 setLegalDocs:v16];

    uint64_t v17 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"platform"];
    -[SDBetaProgram setPlatform:](v5, "setPlatform:", [v17 integerValue]);
    v18 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"buildPrefix"];
    [(SDBetaProgram *)v5 setBuildPrefix:v18];

    id v19 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"accountID"];
    -[SDBetaProgram setAccountID:](v5, "setAccountID:", [v19 integerValue]);
    id v20 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"betaEnrollmentToken"];
    [(SDBetaProgram *)v5 setBetaEnrollmentToken:v20];
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v17 = a3;
  id v4 = objc_msgSend(NSNumber, "numberWithInteger:", -[SDBetaProgram programID](self, "programID"));
  [v17 encodeObject:v4 forKey:@"programID"];

  v5 = [(SDBetaProgram *)self title];
  [v17 encodeObject:v5 forKey:@"title"];

  v6 = +[SDSeedProgramManager stringForSeedProgram:[(SDBetaProgram *)self program]];
  [v17 encodeObject:v6 forKey:@"program"];

  v7 = [(SDBetaProgram *)self catalog];
  [v17 encodeObject:v7 forKey:@"catalog"];

  v8 = [(SDBetaProgram *)self assetUpdate];
  [v17 encodeObject:v8 forKey:@"assetUpdate"];

  uint64_t v9 = [(SDBetaProgram *)self assetBrain];
  [v17 encodeObject:v9 forKey:@"assetBrain"];

  v10 = [(SDBetaProgram *)self assetAudience];
  [v17 encodeObject:v10 forKey:@"assetAudience"];

  v11 = [(SDBetaProgram *)self legalDocs];
  [v17 encodeObject:v11 forKey:@"legalDocs"];

  v12 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", -[SDBetaProgram platform](self, "platform"));
  [v17 encodeObject:v12 forKey:@"platform"];

  uint64_t v13 = [(SDBetaProgram *)self buildPrefix];
  [v17 encodeObject:v13 forKey:@"buildPrefix"];

  uint64_t v14 = objc_msgSend(NSNumber, "numberWithInteger:", -[SDBetaProgram accountID](self, "accountID"));
  [v17 encodeObject:v14 forKey:@"accountID"];

  v15 = [(SDBetaProgram *)self betaEnrollmentToken];

  if (v15)
  {
    v16 = [(SDBetaProgram *)self betaEnrollmentToken];
    [v17 encodeObject:v16 forKey:@"betaEnrollmentToken"];
  }
}

- (id)description
{
  BOOL v3 = NSString;
  id v4 = [(SDBetaProgram *)self title];
  v5 = [v3 stringWithFormat:@"<SDBetaProgram: %@, ID: %ld MDM? %i>", v4, -[SDBetaProgram programID](self, "programID"), -[SDBetaProgram isMDMProgram](self, "isMDMProgram")];

  return v5;
}

- (id)debugDescription
{
  BOOL v3 = SDStringArrayFromPlatforms([(SDBetaProgram *)self platform]);
  id v4 = [v3 componentsJoinedByString:@","];

  v5 = NSString;
  v6 = [(SDBetaProgram *)self title];
  int64_t v7 = [(SDBetaProgram *)self programID];
  v8 = [(SDBetaProgram *)self assetAudience];
  uint64_t v9 = [(SDBetaProgram *)self buildPrefix];
  int64_t v10 = [(SDBetaProgram *)self accountID];
  v11 = [(SDBetaProgram *)self betaEnrollmentToken];
  v12 = [v5 stringWithFormat:@"<SDBetaProgram:\n\tTitle: %@\n\tID: %ld\n\tAssetAudience: %@\n\tPlatform: %@\n\tBuildPrefix: %@\n\tAccountID: %ld\n\tBetaEnrollmentToken: %@\n>", v6, v7, v8, v4, v9, v10, v11];

  return v12;
}

+ (BOOL)isPad
{
  if (isPad_onceToken != -1) {
    dispatch_once(&isPad_onceToken, &__block_literal_global_4);
  }
  return isPad_isPad;
}

uint64_t __22__SDBetaProgram_isPad__block_invoke()
{
  uint64_t result = MGGetBoolAnswer();
  isPad_isPad = result;
  return result;
}

- (int64_t)programID
{
  return self->_programID;
}

- (void)setProgramID:(int64_t)a3
{
  self->_programID = a3;
}

- (NSString)title
{
  return (NSString *)objc_getProperty(self, a2, 16, 1);
}

- (void)setTitle:(id)a3
{
}

- (int64_t)program
{
  return self->_program;
}

- (void)setProgram:(int64_t)a3
{
  self->_program = a3;
}

- (NSURL)catalog
{
  return (NSURL *)objc_getProperty(self, a2, 32, 1);
}

- (void)setCatalog:(id)a3
{
}

- (NSURL)assetUpdate
{
  return (NSURL *)objc_getProperty(self, a2, 40, 1);
}

- (void)setAssetUpdate:(id)a3
{
}

- (NSURL)assetBrain
{
  return (NSURL *)objc_getProperty(self, a2, 48, 1);
}

- (void)setAssetBrain:(id)a3
{
}

- (NSString)assetAudience
{
  return (NSString *)objc_getProperty(self, a2, 56, 1);
}

- (void)setAssetAudience:(id)a3
{
}

- (NSArray)legalDocs
{
  return (NSArray *)objc_getProperty(self, a2, 64, 1);
}

- (void)setLegalDocs:(id)a3
{
}

- (unint64_t)platform
{
  return self->_platform;
}

- (void)setPlatform:(unint64_t)a3
{
  self->_platform = a3;
}

- (NSString)buildPrefix
{
  return (NSString *)objc_getProperty(self, a2, 80, 1);
}

- (void)setBuildPrefix:(id)a3
{
}

- (int64_t)accountID
{
  return self->_accountID;
}

- (void)setAccountID:(int64_t)a3
{
  self->_accountID = a3;
}

- (NSString)betaEnrollmentToken
{
  return (NSString *)objc_getProperty(self, a2, 96, 1);
}

- (void)setBetaEnrollmentToken:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_betaEnrollmentToken, 0);
  objc_storeStrong((id *)&self->_buildPrefix, 0);
  objc_storeStrong((id *)&self->_legalDocs, 0);
  objc_storeStrong((id *)&self->_assetAudience, 0);
  objc_storeStrong((id *)&self->_assetBrain, 0);
  objc_storeStrong((id *)&self->_assetUpdate, 0);
  objc_storeStrong((id *)&self->_catalog, 0);
  objc_storeStrong((id *)&self->_title, 0);
}

@end