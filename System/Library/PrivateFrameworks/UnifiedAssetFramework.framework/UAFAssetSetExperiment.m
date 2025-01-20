@interface UAFAssetSetExperiment
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (NSDictionary)assetSpecifiers;
- (NSString)experimentId;
- (NSUUID)uuid;
- (UAFAssetSetExperiment)initWithCoder:(id)a3;
- (UAFAssetSetExperiment)initWithConfiguration:(id)a3 uuid:(id)a4;
- (UAFAssetSetExperiment)initWithExperimentId:(id)a3 assetSpecifiers:(id)a4;
- (id)description;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
- (void)setAssetSpecifiers:(id)a3;
- (void)setExperimentId:(id)a3;
- (void)setUuid:(id)a3;
@end

@implementation UAFAssetSetExperiment

- (NSDictionary)assetSpecifiers
{
  return self->_assetSpecifiers;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_assetSpecifiers, 0);
  objc_storeStrong((id *)&self->_experimentId, 0);

  objc_storeStrong((id *)&self->_uuid, 0);
}

- (UAFAssetSetExperiment)initWithConfiguration:(id)a3 uuid:(id)a4
{
  uint64_t v58 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  v8 = [(UAFAssetSetExperiment *)self initWithExperimentId:0 assetSpecifiers:0];
  if (!v8) {
    goto LABEL_19;
  }
  v9 = [v6 trialProject];
  if (!v9) {
    goto LABEL_20;
  }
  uint64_t v10 = [v6 trialNamespace];
  if (!v10)
  {

    goto LABEL_19;
  }
  v11 = (void *)v10;
  v12 = [v6 trialFactor];

  if (!v12)
  {
LABEL_19:
    v9 = 0;
    goto LABEL_20;
  }
  p_uuid = &v8->_uuid;
  objc_storeStrong((id *)&v8->_uuid, a4);
  v14 = UAFGetLogCategory((void **)&UAFLogContextClient);
  os_signpost_id_t v15 = os_signpost_id_generate(v14);

  v16 = UAFGetLogCategory((void **)&UAFLogContextClient);
  v17 = v16;
  unint64_t v18 = v15 - 1;
  if (v15 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v16))
  {
    v19 = (const char *)*p_uuid;
    *(_DWORD *)buf = 138543362;
    v53 = v19;
    _os_signpost_emit_with_name_impl(&dword_23797A000, v17, OS_SIGNPOST_INTERVAL_BEGIN, v15, "Experiment AutoAssets", "%{public}@", buf, 0xCu);
  }

  v20 = [v6 trialProject];
  v21 = +[UAFCommonUtilities trialClientWithProject:v20];

  if (v21)
  {
    v48 = &v8->_uuid;
    os_signpost_id_t v49 = v15;
    v22 = [v6 trialNamespace];
    v23 = [v6 trialFactor];
    v24 = +[UAFCommonUtilities getDirectoryPath:v21 trialNamespace:v22 trialFactor:v23];

    if (v24)
    {
      v25 = [NSURL fileURLWithPath:v24 isDirectory:1];
      uint64_t v26 = [v25 URLByAppendingPathComponent:@"experiment.plist"];

      id v51 = 0;
      v27 = +[UAFAssetSetExperimentConfiguration fromContentsOfURL:v26 error:&v51];
      id v50 = v51;
      if (v50)
      {
        v28 = UAFGetLogCategory((void **)&UAFLogContextClient);
        if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 136315650;
          v53 = "-[UAFAssetSetExperiment initWithConfiguration:uuid:]";
          __int16 v54 = 2112;
          uint64_t v55 = v26;
          __int16 v56 = 2114;
          id v57 = v50;
          _os_log_error_impl(&dword_23797A000, v28, OS_LOG_TYPE_ERROR, "%s Could not load asset set experiment at %@: %{public}@", buf, 0x20u);
        }
      }
      v47 = (void *)v26;
      uint64_t v29 = objc_msgSend(v27, "assetSpecifiers", v27);
      assetSpecifiers = v8->_assetSpecifiers;
      v8->_assetSpecifiers = (NSDictionary *)v29;

      v31 = [v6 trialNamespace];
      v32 = +[UAFCommonUtilities experimentIdentifiersTrialClient:v21 trialNamespace:v31];

      uint64_t v33 = [v32 experimentId];
      experimentId = v8->_experimentId;
      v8->_experimentId = (NSString *)v33;

      v35 = UAFGetLogCategory((void **)&UAFLogContextClient);
      v36 = v35;
      if (v18 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v35))
      {
        v37 = (const char *)*v48;
        *(_DWORD *)buf = 138543362;
        v53 = v37;
        _os_signpost_emit_with_name_impl(&dword_23797A000, v36, OS_SIGNPOST_INTERVAL_END, v49, "Experiment AutoAssets", "%{public}@", buf, 0xCu);
      }

      v9 = v8;
    }
    else
    {
      v42 = UAFGetLogCategory((void **)&UAFLogContextClient);
      v43 = v42;
      if (v18 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v42))
      {
        v44 = (const char *)*v48;
        *(_DWORD *)buf = 138543362;
        v53 = v44;
        _os_signpost_emit_with_name_impl(&dword_23797A000, v43, OS_SIGNPOST_INTERVAL_END, v49, "Experiment AutoAssets", "%{public}@", buf, 0xCu);
      }

      v9 = v8;
      v24 = 0;
    }
  }
  else
  {
    v39 = UAFGetLogCategory((void **)&UAFLogContextClient);
    if (os_log_type_enabled(v39, OS_LOG_TYPE_ERROR))
    {
      v45 = [v6 trialProject];
      *(_DWORD *)buf = 136315394;
      v53 = "-[UAFAssetSetExperiment initWithConfiguration:uuid:]";
      __int16 v54 = 2114;
      uint64_t v55 = (uint64_t)v45;
      _os_log_error_impl(&dword_23797A000, v39, OS_LOG_TYPE_ERROR, "%s Could not create trial client for project %{public}@", buf, 0x16u);
    }
    v40 = UAFGetLogCategory((void **)&UAFLogContextClient);
    v24 = v40;
    if (v18 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v40))
    {
      v41 = (const char *)*p_uuid;
      *(_DWORD *)buf = 138543362;
      v53 = v41;
      _os_signpost_emit_with_name_impl(&dword_23797A000, v24, OS_SIGNPOST_INTERVAL_END, v15, "Experiment AutoAssets", "%{public}@", buf, 0xCu);
    }
    v9 = 0;
  }

LABEL_20:
  return v9;
}

- (UAFAssetSetExperiment)initWithExperimentId:(id)a3 assetSpecifiers:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v13.receiver = self;
  v13.super_class = (Class)UAFAssetSetExperiment;
  v9 = [(UAFAssetSetExperiment *)&v13 init];
  uint64_t v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_experimentId, a3);
    objc_storeStrong((id *)&v10->_assetSpecifiers, a4);
    v11 = v10;
  }

  return v10;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  experimentId = self->_experimentId;
  id v5 = a3;
  [v5 encodeObject:experimentId forKey:@"experimentId"];
  [v5 encodeObject:self->_assetSpecifiers forKey:@"assetSpecifiers"];
}

- (UAFAssetSetExperiment)initWithCoder:(id)a3
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"experimentId"];
  if (v5)
  {
    id v6 = (void *)MEMORY[0x263EFFA08];
    uint64_t v7 = objc_opt_class();
    id v8 = objc_msgSend(v6, "setWithObjects:", v7, objc_opt_class(), 0);
    v9 = [v4 decodeObjectOfClasses:v8 forKey:@"assetSpecifiers"];

    self = [(UAFAssetSetExperiment *)self initWithExperimentId:v5 assetSpecifiers:v9];
    uint64_t v10 = self;
  }
  else
  {
    v9 = UAFGetLogCategory((void **)&UAFLogContextClient);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315138;
      objc_super v13 = "-[UAFAssetSetExperiment initWithCoder:]";
      _os_log_error_impl(&dword_23797A000, v9, OS_LOG_TYPE_ERROR, "%s Decoding of the asset set experiment id failed", buf, 0xCu);
    }
    uint64_t v10 = 0;
  }

  return v10;
}

- (BOOL)isEqual:(id)a3
{
  id v6 = (UAFAssetSetExperiment *)a3;
  uint64_t v7 = v6;
  if (v6)
  {
    if (self == v6)
    {
      char v12 = 1;
      goto LABEL_35;
    }
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v8 = v7;
      v9 = [(UAFAssetSetExperiment *)v8 experimentId];
      if (!v9)
      {
        uint64_t v13 = [(UAFAssetSetExperiment *)self experimentId];
        if (v13)
        {
          uint64_t v14 = (void *)v13;
          char v12 = 0;
LABEL_33:

          goto LABEL_34;
        }
      }
      uint64_t v10 = [(UAFAssetSetExperiment *)v8 experimentId];
      if (v10)
      {
        v3 = (void *)v10;
        v11 = [(UAFAssetSetExperiment *)self experimentId];

        if (v9)
        {

          if (!v11) {
            goto LABEL_21;
          }
        }
        else if (!v11)
        {
LABEL_21:
          char v12 = 0;
LABEL_34:

          goto LABEL_35;
        }
      }
      else if (v9)
      {
      }
      uint64_t v14 = [(UAFAssetSetExperiment *)v8 experimentId];
      if (v14
        || ([(UAFAssetSetExperiment *)self experimentId],
            (v22 = objc_claimAutoreleasedReturnValue()) != 0))
      {
        v3 = [(UAFAssetSetExperiment *)v8 experimentId];
        id v4 = [(UAFAssetSetExperiment *)self experimentId];
        if (![v3 isEqualToString:v4])
        {
          char v12 = 0;
LABEL_30:

LABEL_31:
          if (!v14) {

          }
          goto LABEL_33;
        }
        int v15 = 1;
      }
      else
      {
        v22 = 0;
        int v15 = 0;
      }
      v16 = [(UAFAssetSetExperiment *)v8 assetSpecifiers];
      if (v16
        || ([(UAFAssetSetExperiment *)self assetSpecifiers],
            (uint64_t v20 = objc_claimAutoreleasedReturnValue()) != 0))
      {
        v17 = [(UAFAssetSetExperiment *)v8 assetSpecifiers];
        unint64_t v18 = [(UAFAssetSetExperiment *)self assetSpecifiers];
        char v12 = [v17 isEqual:v18];

        if (v16) {
          goto LABEL_29;
        }
      }
      else
      {
        v21 = 0;
        char v12 = 1;
      }

LABEL_29:
      if (!v15) {
        goto LABEL_31;
      }
      goto LABEL_30;
    }
  }
  char v12 = 0;
LABEL_35:

  return v12;
}

- (unint64_t)hash
{
  NSUInteger v3 = [(NSString *)self->_experimentId hash];
  return [(NSDictionary *)self->_assetSpecifiers hash] ^ v3;
}

- (id)description
{
  NSUInteger v3 = NSString;
  id v4 = [(UAFAssetSetExperiment *)self experimentId];
  id v5 = [(UAFAssetSetExperiment *)self assetSpecifiers];
  id v6 = [v3 stringWithFormat:@"Experiment '%@' with assetSpecifiers %@", v4, v5];

  return v6;
}

- (NSUUID)uuid
{
  return self->_uuid;
}

- (void)setUuid:(id)a3
{
}

- (NSString)experimentId
{
  return self->_experimentId;
}

- (void)setExperimentId:(id)a3
{
}

- (void)setAssetSpecifiers:(id)a3
{
}

@end