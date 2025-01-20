@interface REMetadataPredictor
+ (id)supportedFeatures;
- (id)_init;
- (id)featureValueForFeature:(id)a3 element:(id)a4 engine:(id)a5 trainingContext:(id)a6;
@end

@implementation REMetadataPredictor

+ (id)supportedFeatures
{
  v9[3] = *MEMORY[0x263EF8340];
  v2 = [REFeatureSet alloc];
  v3 = +[REFeature dataSourceFeature];
  v4 = +[REFeature sectionFeature];
  v9[1] = v4;
  v5 = +[REFeature interactionFeature];
  v9[2] = v5;
  v6 = [MEMORY[0x263EFF8C0] arrayWithObjects:v9 count:3];
  v7 = [(REFeatureSet *)v2 initWithFeatures:v6];

  return v7;
}

- (id)_init
{
  v8.receiver = self;
  v8.super_class = (Class)REMetadataPredictor;
  v2 = [(REPredictor *)&v8 _init];
  if (v2)
  {
    uint64_t v3 = [MEMORY[0x263EFF9A0] dictionary];
    v4 = (void *)v2[8];
    v2[8] = v3;

    uint64_t v5 = [MEMORY[0x263EFF9A0] dictionary];
    v6 = (void *)v2[9];
    v2[9] = v5;
  }
  return v2;
}

- (id)featureValueForFeature:(id)a3 element:(id)a4 engine:(id)a5 trainingContext:(id)a6
{
  id v8 = a3;
  id v9 = a4;
  v10 = +[REFeature dataSourceFeature];
  int v11 = [v8 isEqual:v10];

  if (v11)
  {
    v12 = [v9 bundleIdentifier];
    if (v12)
    {
      id v13 = +[REFeatureValue featureValueWithString:v12];
LABEL_14:

      goto LABEL_15;
    }
LABEL_13:
    id v13 = 0;
    goto LABEL_14;
  }
  v14 = +[REFeature sectionFeature];
  int v15 = [v8 isEqual:v14];

  if (v15)
  {
    v12 = [v9 section];
    if (!v12) {
      goto LABEL_13;
    }
    uint64_t v16 = 72;
LABEL_10:
    v19 = [*(id *)((char *)&self->super.super.super.super.isa + v16) objectForKeyedSubscript:v12];
    if (!v19)
    {
      v19 = +[REFeatureValue featureValueWithString:v12];
      [*(id *)((char *)&self->super.super.super.super.isa + v16) setObject:v19 forKeyedSubscript:v12];
    }
    id v13 = v19;

    goto LABEL_14;
  }
  v17 = +[REFeature interactionFeature];
  int v18 = [v8 isEqual:v17];

  if (v18)
  {
    v12 = [v9 interaction];
    if (!v12) {
      goto LABEL_13;
    }
    uint64_t v16 = 64;
    goto LABEL_10;
  }
  id v13 = 0;
LABEL_15:

  return v13;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sectionFeatureValueCache, 0);
  objc_storeStrong((id *)&self->_interactionFeatureValueCache, 0);
}

@end