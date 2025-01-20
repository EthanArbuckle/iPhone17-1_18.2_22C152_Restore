@interface PGAssetCollectionFeatureDefinition
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (PGAssetCollectionFeatureDefinition)initWithAssetFilterByName:(id)a3;
- (PGAssetCollectionFeatureDefinition)initWithCoder:(id)a3;
- (PGAudioAssetFilter)audioAssetFilter;
- (PGCLIPQueryAssetFilter)CLIPQueryAssetFilter;
- (PGCustomFoodieAssetFilter)customAssetFilter;
- (PGPeopleAssetFilter)peopleAssetFilter;
- (PGSceneAssetFilter)sceneAssetFilter;
- (PGSocialGroupAssetFilter)socialGroupAssetFilter;
- (id)description;
- (void)encodeWithCoder:(id)a3;
@end

@implementation PGAssetCollectionFeatureDefinition

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_CLIPQueryAssetFilter, 0);
  objc_storeStrong((id *)&self->_customAssetFilter, 0);
  objc_storeStrong((id *)&self->_audioAssetFilter, 0);
  objc_storeStrong((id *)&self->_socialGroupAssetFilter, 0);
  objc_storeStrong((id *)&self->_peopleAssetFilter, 0);
  objc_storeStrong((id *)&self->_sceneAssetFilter, 0);
}

- (PGCLIPQueryAssetFilter)CLIPQueryAssetFilter
{
  return self->_CLIPQueryAssetFilter;
}

- (PGCustomFoodieAssetFilter)customAssetFilter
{
  return self->_customAssetFilter;
}

- (PGAudioAssetFilter)audioAssetFilter
{
  return self->_audioAssetFilter;
}

- (PGSocialGroupAssetFilter)socialGroupAssetFilter
{
  return self->_socialGroupAssetFilter;
}

- (PGPeopleAssetFilter)peopleAssetFilter
{
  return self->_peopleAssetFilter;
}

- (PGSceneAssetFilter)sceneAssetFilter
{
  return self->_sceneAssetFilter;
}

- (BOOL)isEqual:(id)a3
{
  v5 = (PGAssetCollectionFeatureDefinition *)a3;
  if (self == v5)
  {
    char v13 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v6 = v5;
      v7 = v6;
      sceneAssetFilter = self->_sceneAssetFilter;
      v9 = sceneAssetFilter;
      if (!sceneAssetFilter)
      {
        uint64_t v10 = [(PGAssetCollectionFeatureDefinition *)v6 sceneAssetFilter];
        if (!v10) {
          goto LABEL_12;
        }
        v3 = (void *)v10;
        v9 = self->_sceneAssetFilter;
      }
      v11 = [(PGAssetCollectionFeatureDefinition *)v7 sceneAssetFilter];
      BOOL v12 = [(PGSceneAssetFilter *)v9 isEqual:v11];

      if (sceneAssetFilter)
      {
        if (!v12) {
          goto LABEL_39;
        }
      }
      else
      {

        if (!v12) {
          goto LABEL_39;
        }
      }
LABEL_12:
      peopleAssetFilter = self->_peopleAssetFilter;
      v15 = peopleAssetFilter;
      if (!peopleAssetFilter)
      {
        uint64_t v16 = [(PGAssetCollectionFeatureDefinition *)v7 peopleAssetFilter];
        if (!v16) {
          goto LABEL_19;
        }
        v3 = (void *)v16;
        v15 = self->_peopleAssetFilter;
      }
      v17 = [(PGAssetCollectionFeatureDefinition *)v7 peopleAssetFilter];
      BOOL v18 = [(PGPeopleAssetFilter *)v15 isEqual:v17];

      if (peopleAssetFilter)
      {
        if (!v18) {
          goto LABEL_39;
        }
      }
      else
      {

        if (!v18) {
          goto LABEL_39;
        }
      }
LABEL_19:
      socialGroupAssetFilter = self->_socialGroupAssetFilter;
      v20 = socialGroupAssetFilter;
      if (!socialGroupAssetFilter)
      {
        v3 = [(PGAssetCollectionFeatureDefinition *)v7 socialGroupAssetFilter];
        if (!v3)
        {
          int v22 = 1;
          goto LABEL_26;
        }
        v20 = self->_socialGroupAssetFilter;
      }
      v21 = [(PGAssetCollectionFeatureDefinition *)v7 socialGroupAssetFilter];
      int v22 = [(PGSocialGroupAssetFilter *)v20 isEqual:v21];

      if (socialGroupAssetFilter)
      {
        if (!v22) {
          goto LABEL_39;
        }
        goto LABEL_27;
      }
LABEL_26:

      if (!v22) {
        goto LABEL_39;
      }
LABEL_27:
      audioAssetFilter = self->_audioAssetFilter;
      v24 = audioAssetFilter;
      if (!audioAssetFilter)
      {
        v3 = [(PGAssetCollectionFeatureDefinition *)v7 audioAssetFilter];
        if (!v3)
        {
          int v26 = 1;
          goto LABEL_38;
        }
        v24 = self->_audioAssetFilter;
      }
      v25 = [(PGAssetCollectionFeatureDefinition *)v7 audioAssetFilter];
      int v26 = [(PGAudioAssetFilter *)v24 isEqual:v25];

      if (audioAssetFilter)
      {
        if (v26) {
          goto LABEL_32;
        }
        goto LABEL_39;
      }
LABEL_38:

      if (v26)
      {
LABEL_32:
        CLIPQueryAssetFilter = self->_CLIPQueryAssetFilter;
        v28 = CLIPQueryAssetFilter;
        if (!CLIPQueryAssetFilter)
        {
          v3 = [(PGAssetCollectionFeatureDefinition *)v7 CLIPQueryAssetFilter];
          if (!v3)
          {
            char v13 = 1;
            goto LABEL_43;
          }
          v28 = self->_CLIPQueryAssetFilter;
        }
        v29 = [(PGAssetCollectionFeatureDefinition *)v7 CLIPQueryAssetFilter];
        char v13 = [(PGCLIPQueryAssetFilter *)v28 isEqual:v29];

        if (CLIPQueryAssetFilter)
        {
LABEL_40:

          goto LABEL_41;
        }
LABEL_43:

        goto LABEL_40;
      }
LABEL_39:
      char v13 = 0;
      goto LABEL_40;
    }
    char v13 = 0;
  }
LABEL_41:

  return v13;
}

- (id)description
{
  v3 = (void *)MEMORY[0x1E4F28E78];
  v17.receiver = self;
  v17.super_class = (Class)PGAssetCollectionFeatureDefinition;
  v4 = [(PGAssetCollectionFeatureDefinition *)&v17 description];
  v5 = [v3 stringWithFormat:@"%@", v4];

  v6 = +[PGSceneAssetFilter name];
  v7 = [(PGSceneAssetFilter *)self->_sceneAssetFilter description];
  [v5 appendFormat:@" %@: %@", v6, v7];

  v8 = +[PGPeopleAssetFilter name];
  v9 = [(PGPeopleAssetFilter *)self->_peopleAssetFilter description];
  [v5 appendFormat:@" %@: %@", v8, v9];

  uint64_t v10 = +[PGSocialGroupAssetFilter name];
  v11 = [(PGSocialGroupAssetFilter *)self->_socialGroupAssetFilter description];
  [v5 appendFormat:@" %@: %@", v10, v11];

  BOOL v12 = +[PGAudioAssetFilter name];
  char v13 = [(PGAudioAssetFilter *)self->_audioAssetFilter description];
  [v5 appendFormat:@" %@: %@", v12, v13];

  v14 = +[PGCLIPQueryAssetFilter name];
  v15 = [(PGCLIPQueryAssetFilter *)self->_CLIPQueryAssetFilter description];
  [v5 appendFormat:@" %@: %@", v14, v15];

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v14 = a3;
  sceneAssetFilter = self->_sceneAssetFilter;
  if (sceneAssetFilter)
  {
    v5 = +[PGSceneAssetFilter name];
    [v14 encodeObject:sceneAssetFilter forKey:v5];
  }
  peopleAssetFilter = self->_peopleAssetFilter;
  if (peopleAssetFilter)
  {
    v7 = +[PGPeopleAssetFilter name];
    [v14 encodeObject:peopleAssetFilter forKey:v7];
  }
  socialGroupAssetFilter = self->_socialGroupAssetFilter;
  if (socialGroupAssetFilter)
  {
    v9 = +[PGSocialGroupAssetFilter name];
    [v14 encodeObject:socialGroupAssetFilter forKey:v9];
  }
  audioAssetFilter = self->_audioAssetFilter;
  if (audioAssetFilter)
  {
    v11 = +[PGAudioAssetFilter name];
    [v14 encodeObject:audioAssetFilter forKey:v11];
  }
  CLIPQueryAssetFilter = self->_CLIPQueryAssetFilter;
  if (CLIPQueryAssetFilter)
  {
    char v13 = +[PGCLIPQueryAssetFilter name];
    [v14 encodeObject:CLIPQueryAssetFilter forKey:v13];
  }
}

- (PGAssetCollectionFeatureDefinition)initWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [MEMORY[0x1E4F1CA60] dictionary];
  v6 = +[PGSceneAssetFilter name];
  int v7 = [v4 containsValueForKey:v6];

  if (v7)
  {
    uint64_t v8 = objc_opt_class();
    v9 = +[PGSceneAssetFilter name];
    uint64_t v10 = [v4 decodeObjectOfClass:v8 forKey:v9];
    v11 = +[PGSceneAssetFilter name];
    [v5 setObject:v10 forKeyedSubscript:v11];
  }
  BOOL v12 = +[PGPeopleAssetFilter name];
  int v13 = [v4 containsValueForKey:v12];

  if (v13)
  {
    uint64_t v14 = objc_opt_class();
    v15 = +[PGPeopleAssetFilter name];
    uint64_t v16 = [v4 decodeObjectOfClass:v14 forKey:v15];
    objc_super v17 = +[PGPeopleAssetFilter name];
    [v5 setObject:v16 forKeyedSubscript:v17];
  }
  BOOL v18 = +[PGSocialGroupAssetFilter name];
  int v19 = [v4 containsValueForKey:v18];

  if (v19)
  {
    uint64_t v20 = objc_opt_class();
    v21 = +[PGSocialGroupAssetFilter name];
    int v22 = [v4 decodeObjectOfClass:v20 forKey:v21];
    v23 = +[PGSocialGroupAssetFilter name];
    [v5 setObject:v22 forKeyedSubscript:v23];
  }
  v24 = +[PGAudioAssetFilter name];
  int v25 = [v4 containsValueForKey:v24];

  if (v25)
  {
    uint64_t v26 = objc_opt_class();
    v27 = +[PGAudioAssetFilter name];
    v28 = [v4 decodeObjectOfClass:v26 forKey:v27];
    v29 = +[PGAudioAssetFilter name];
    [v5 setObject:v28 forKeyedSubscript:v29];
  }
  v30 = +[PGCLIPQueryAssetFilter name];
  int v31 = [v4 containsValueForKey:v30];

  if (v31)
  {
    uint64_t v32 = objc_opt_class();
    v33 = +[PGCLIPQueryAssetFilter name];
    v34 = [v4 decodeObjectOfClass:v32 forKey:v33];
    v35 = +[PGCLIPQueryAssetFilter name];
    [v5 setObject:v34 forKeyedSubscript:v35];
  }
  v36 = [(PGAssetCollectionFeatureDefinition *)self initWithAssetFilterByName:v5];

  return v36;
}

- (PGAssetCollectionFeatureDefinition)initWithAssetFilterByName:(id)a3
{
  id v4 = a3;
  v25.receiver = self;
  v25.super_class = (Class)PGAssetCollectionFeatureDefinition;
  v5 = [(PGAssetCollectionFeatureDefinition *)&v25 init];
  if (v5)
  {
    v6 = +[PGSceneAssetFilter name];
    uint64_t v7 = [v4 objectForKeyedSubscript:v6];
    sceneAssetFilter = v5->_sceneAssetFilter;
    v5->_sceneAssetFilter = (PGSceneAssetFilter *)v7;

    v9 = +[PGPeopleAssetFilter name];
    uint64_t v10 = [v4 objectForKeyedSubscript:v9];
    peopleAssetFilter = v5->_peopleAssetFilter;
    v5->_peopleAssetFilter = (PGPeopleAssetFilter *)v10;

    BOOL v12 = +[PGSocialGroupAssetFilter name];
    uint64_t v13 = [v4 objectForKeyedSubscript:v12];
    socialGroupAssetFilter = v5->_socialGroupAssetFilter;
    v5->_socialGroupAssetFilter = (PGSocialGroupAssetFilter *)v13;

    v15 = +[PGAudioAssetFilter name];
    uint64_t v16 = [v4 objectForKeyedSubscript:v15];
    audioAssetFilter = v5->_audioAssetFilter;
    v5->_audioAssetFilter = (PGAudioAssetFilter *)v16;

    BOOL v18 = +[PGCustomFoodieAssetFilter name];
    uint64_t v19 = [v4 objectForKeyedSubscript:v18];
    customAssetFilter = v5->_customAssetFilter;
    v5->_customAssetFilter = (PGCustomFoodieAssetFilter *)v19;

    v21 = +[PGCLIPQueryAssetFilter name];
    uint64_t v22 = [v4 objectForKeyedSubscript:v21];
    CLIPQueryAssetFilter = v5->_CLIPQueryAssetFilter;
    v5->_CLIPQueryAssetFilter = (PGCLIPQueryAssetFilter *)v22;
  }
  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end