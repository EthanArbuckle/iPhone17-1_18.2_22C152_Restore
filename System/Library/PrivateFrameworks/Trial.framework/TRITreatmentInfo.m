@interface TRITreatmentInfo
+ (id)loadInfoForTreatment:(id)a3 namespaceName:(id)a4 paths:(id)a5;
- (BOOL)load;
- (BOOL)loadFromUrl:(id)a3;
- (BOOL)save;
- (BOOL)saveToDir:(id)a3;
- (BOOL)saveToUrl:(id)a3;
- (NSString)experimentId;
- (NSString)namespaceName;
- (NSString)treatmentId;
- (TRITreatmentInfo)initWithPaths:(id)a3;
- (id)_treatmentBasePath;
- (id)baseUrlForTreatment:(id)a3 namespaceName:(id)a4;
- (id)baseUrlForTreatmentsWithNamespaceName:(id)a3;
- (id)infoDictionary;
- (id)treatmentDirectory;
- (id)url;
- (id)urlWithDir:(id)a3;
- (int)deploymentId;
- (void)setDeploymentId:(int)a3;
- (void)setExperimentId:(id)a3;
- (void)setNamespaceName:(id)a3;
- (void)setTreatmentId:(id)a3;
@end

@implementation TRITreatmentInfo

- (TRITreatmentInfo)initWithPaths:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)TRITreatmentInfo;
  v6 = [(TRITreatmentInfo *)&v9 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_paths, a3);
    v7->_deploymentId = -1;
  }

  return v7;
}

- (id)_treatmentBasePath
{
  return (id)[(TRIPaths *)self->_paths treatmentsDir];
}

- (id)baseUrlForTreatmentsWithNamespaceName:(id)a3
{
  v15[2] = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  uint64_t v6 = [MEMORY[0x1E4FB05B8] namespaceIdFromName:v5];
  if (v6)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"%u", v6);
    id v7 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v7 = v5;
  }
  v8 = v7;
  objc_super v9 = (void *)MEMORY[0x1E4F1CB10];
  v10 = [(TRITreatmentInfo *)self _treatmentBasePath];
  v15[0] = v10;
  v15[1] = v8;
  v11 = [MEMORY[0x1E4F1C978] arrayWithObjects:v15 count:2];
  v12 = [v9 fileURLWithPathComponents:v11];

  if (!v12)
  {
    v14 = [MEMORY[0x1E4F28B00] currentHandler];
    [v14 handleFailureInMethod:a2, self, @"TRITreatmentInfo.m", 50, @"base URL for treatments with namespace %@ is nil", v5 object file lineNumber description];
  }
  return v12;
}

- (id)baseUrlForTreatment:(id)a3 namespaceName:(id)a4
{
  id v7 = a3;
  v8 = [(TRITreatmentInfo *)self baseUrlForTreatmentsWithNamespaceName:a4];
  objc_super v9 = [v8 URLByAppendingPathComponent:v7];

  if (!v9)
  {
    v11 = [MEMORY[0x1E4F28B00] currentHandler];
    [v11 handleFailureInMethod:a2 object:self file:@"TRITreatmentInfo.m" lineNumber:57 description:@"baseUrlForTreatment is nil"];
  }
  return v9;
}

+ (id)loadInfoForTreatment:(id)a3 namespaceName:(id)a4 paths:(id)a5
{
  id v7 = a5;
  id v8 = a4;
  id v9 = a3;
  v10 = [[TRITreatmentInfo alloc] initWithPaths:v7];

  [(TRITreatmentInfo *)v10 setTreatmentId:v9];
  [(TRITreatmentInfo *)v10 setNamespaceName:v8];

  if ([(TRITreatmentInfo *)v10 load]) {
    v11 = v10;
  }
  else {
    v11 = 0;
  }

  return v11;
}

- (id)treatmentDirectory
{
  uint64_t v3 = [(TRITreatmentInfo *)self treatmentId];
  if (v3
    && (v4 = (void *)v3,
        [(TRITreatmentInfo *)self namespaceName],
        id v5 = objc_claimAutoreleasedReturnValue(),
        v5,
        v4,
        v5))
  {
    uint64_t v6 = [(TRITreatmentInfo *)self treatmentId];
    id v7 = [(TRITreatmentInfo *)self namespaceName];
    id v8 = [(TRITreatmentInfo *)self baseUrlForTreatment:v6 namespaceName:v7];
  }
  else
  {
    id v8 = 0;
  }
  return v8;
}

- (id)urlWithDir:(id)a3
{
  v9[2] = *MEMORY[0x1E4F143B8];
  if (a3)
  {
    uint64_t v3 = (void *)MEMORY[0x1E4F1CB10];
    v9[0] = a3;
    v9[1] = @"info.plist";
    v4 = (void *)MEMORY[0x1E4F1C978];
    id v5 = a3;
    uint64_t v6 = [v4 arrayWithObjects:v9 count:2];
    id v7 = [v3 fileURLWithPathComponents:v6];
  }
  else
  {
    id v7 = 0;
  }
  return v7;
}

- (id)url
{
  uint64_t v3 = [(TRITreatmentInfo *)self treatmentDirectory];
  v4 = [v3 path];
  id v5 = [(TRITreatmentInfo *)self urlWithDir:v4];

  return v5;
}

- (BOOL)loadFromUrl:(id)a3
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  if (a3)
  {
    id v19 = 0;
    v4 = [MEMORY[0x1E4F1C9E8] dictionaryWithContentsOfURL:a3 error:&v19];
    id v5 = v19;
    uint64_t v6 = v5;
    if (v4) {
      BOOL v7 = v5 == 0;
    }
    else {
      BOOL v7 = 0;
    }
    BOOL v8 = v7;
    if (v7)
    {
      id v9 = [v4 objectForKeyedSubscript:@"experimentId"];
      [(TRITreatmentInfo *)self setExperimentId:v9];

      v10 = [v4 objectForKeyedSubscript:@"deploymentId"];
      v12 = v10;
      if (v10) {
        uint64_t v11 = [v10 intValue];
      }
      else {
        uint64_t v11 = 0xFFFFFFFFLL;
      }
      [(TRITreatmentInfo *)self setDeploymentId:v11];
    }
    else
    {
      v12 = TRILogCategory_ClientFramework();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      {
        v14 = [(TRITreatmentInfo *)self namespaceName];
        v15 = [(TRITreatmentInfo *)self treatmentId];
        *(_DWORD *)buf = 138412802;
        v21 = v14;
        __int16 v22 = 2112;
        v23 = v15;
        __int16 v24 = 2112;
        v25 = v6;
        _os_log_error_impl(&dword_19D909000, v12, OS_LOG_TYPE_ERROR, "could not load treatment info for namespace %@ with treatment id %@ -- %@", buf, 0x20u);
      }
    }
  }
  else
  {
    uint64_t v6 = TRILogCategory_ClientFramework();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      v17 = [(TRITreatmentInfo *)self namespaceName];
      v18 = [(TRITreatmentInfo *)self treatmentId];
      *(_DWORD *)buf = 138412546;
      v21 = v17;
      __int16 v22 = 2112;
      v23 = v18;
      _os_log_error_impl(&dword_19D909000, v6, OS_LOG_TYPE_ERROR, "could not load treatment info for namespace %@ with treatment id %@ -- path is nil", buf, 0x16u);
    }
    BOOL v8 = 0;
  }

  return v8;
}

- (BOOL)load
{
  v2 = self;
  uint64_t v3 = [(TRITreatmentInfo *)self url];
  LOBYTE(v2) = [(TRITreatmentInfo *)v2 loadFromUrl:v3];

  return (char)v2;
}

- (BOOL)saveToDir:(id)a3
{
  uint64_t v3 = self;
  v4 = [(TRITreatmentInfo *)self urlWithDir:a3];
  LOBYTE(v3) = [(TRITreatmentInfo *)v3 saveToUrl:v4];

  return (char)v3;
}

- (BOOL)save
{
  v2 = self;
  uint64_t v3 = [(TRITreatmentInfo *)self url];
  LOBYTE(v2) = [(TRITreatmentInfo *)v2 saveToUrl:v3];

  return (char)v2;
}

- (id)infoDictionary
{
  uint64_t v3 = [(TRITreatmentInfo *)self experimentId];

  if (v3)
  {
    v4 = objc_opt_new();
    id v5 = [(TRITreatmentInfo *)self experimentId];
    [v4 setObject:v5 forKeyedSubscript:@"experimentId"];

    if ([(TRITreatmentInfo *)self deploymentId] < 0)
    {
      [v4 setObject:0 forKeyedSubscript:@"deploymentId"];
    }
    else
    {
      uint64_t v6 = objc_msgSend(NSNumber, "numberWithInt:", -[TRITreatmentInfo deploymentId](self, "deploymentId"));
      [v4 setObject:v6 forKeyedSubscript:@"deploymentId"];
    }
  }
  else
  {
    v4 = (void *)MEMORY[0x1E4F1CC08];
  }
  return v4;
}

- (BOOL)saveToUrl:(id)a3
{
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  if (v5)
  {
    uint64_t v6 = [MEMORY[0x1E4F28CB8] defaultManager];
    BOOL v7 = [v5 path];
    if (!v7)
    {
      __int16 v24 = [MEMORY[0x1E4F28B00] currentHandler];
      [v24 handleFailureInMethod:a2, self, @"TRITreatmentInfo.m", 141, @"Expression was unexpectedly nil/false: %@", @"url.path" object file lineNumber description];
    }
    id v26 = 0;
    BOOL v8 = [v6 triCreateDirectoryForPath:v7 isDirectory:0 error:&v26];
    id v9 = v26;

    if (!v8)
    {
      v10 = TRILogCategory_ClientFramework();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      {
        __int16 v22 = [(TRITreatmentInfo *)self namespaceName];
        v23 = [(TRITreatmentInfo *)self treatmentId];
        *(_DWORD *)buf = 138413058;
        id v28 = v22;
        __int16 v29 = 2112;
        v30 = v23;
        __int16 v31 = 2112;
        id v32 = v5;
        __int16 v33 = 2112;
        v34 = v9;
        _os_log_error_impl(&dword_19D909000, v10, OS_LOG_TYPE_ERROR, "failed to create directory to save treatment info for namespace %@ with treatment id %@ to path %@ -- %@", buf, 0x2Au);
      }
      BOOL v15 = 0;
      v12 = v9;
      goto LABEL_19;
    }
    v10 = [(TRITreatmentInfo *)self infoDictionary];
    v25 = v9;
    char v11 = [v10 writeToURL:v5 error:&v25];
    v12 = v25;

    if (v11)
    {
      v13 = (void *)MEMORY[0x1E4F28CB8];
      v14 = [v5 path];
      LOBYTE(v13) = [v13 triRemoveFileProtectionIfPresentForPath:v14];

      if (v13)
      {
        BOOL v15 = 1;
LABEL_19:

        goto LABEL_20;
      }
      v16 = TRILogCategory_ClientFramework();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        id v28 = v5;
        _os_log_error_impl(&dword_19D909000, v16, OS_LOG_TYPE_ERROR, "Failed to remove file protection from info.plist at %@", buf, 0xCu);
      }
    }
    else
    {
      v16 = TRILogCategory_ClientFramework();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
      {
        v17 = [(TRITreatmentInfo *)self namespaceName];
        v18 = [(TRITreatmentInfo *)self treatmentId];
        *(_DWORD *)buf = 138413058;
        id v28 = v17;
        __int16 v29 = 2112;
        v30 = v18;
        __int16 v31 = 2112;
        id v32 = v5;
        __int16 v33 = 2112;
        v34 = v12;
        _os_log_error_impl(&dword_19D909000, v16, OS_LOG_TYPE_ERROR, "could save treatment info for namespace %@ with treatment id %@ to path %@ -- %@", buf, 0x2Au);
      }
    }

    BOOL v15 = 0;
    goto LABEL_19;
  }
  v12 = TRILogCategory_ClientFramework();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
  {
    v20 = [(TRITreatmentInfo *)self namespaceName];
    v21 = [(TRITreatmentInfo *)self treatmentId];
    *(_DWORD *)buf = 138412546;
    id v28 = v20;
    __int16 v29 = 2112;
    v30 = v21;
    _os_log_error_impl(&dword_19D909000, v12, OS_LOG_TYPE_ERROR, "could save treatment info for namespace %@ with treatment id %@ -- path is nil", buf, 0x16u);
  }
  BOOL v15 = 0;
LABEL_20:

  return v15;
}

- (NSString)namespaceName
{
  return self->_namespaceName;
}

- (void)setNamespaceName:(id)a3
{
}

- (NSString)treatmentId
{
  return self->_treatmentId;
}

- (void)setTreatmentId:(id)a3
{
}

- (NSString)experimentId
{
  return self->_experimentId;
}

- (void)setExperimentId:(id)a3
{
}

- (int)deploymentId
{
  return self->_deploymentId;
}

- (void)setDeploymentId:(int)a3
{
  self->_deploymentId = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_experimentId, 0);
  objc_storeStrong((id *)&self->_treatmentId, 0);
  objc_storeStrong((id *)&self->_namespaceName, 0);
  objc_storeStrong((id *)&self->_paths, 0);
}

@end