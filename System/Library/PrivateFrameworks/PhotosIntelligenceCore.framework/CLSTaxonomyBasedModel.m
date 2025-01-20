@interface CLSTaxonomyBasedModel
- (BOOL)nodeIsSupported:(id)a3;
- (BOOL)nodeRefIsSupported:(void *)a3;
- (CLSTaxonomyBasedModel)initWithSceneTaxonomy:(id)a3;
- (NSString)identifier;
- (PFSceneTaxonomy)sceneTaxonomy;
- (id)confidenceThresholdBySceneIdentifierForSceneNames:(id)a3 withThresholdType:(unint64_t)a4;
- (id)nodeForSignalIdentifier:(unint64_t)a3;
- (id)sceneIdentifierBySceneNameForSceneNames:(id)a3;
- (id)sceneIdentifiersForSceneNames:(id)a3 includingChildScenes:(BOOL)a4;
- (id)sceneIdentifiersFromSceneClassifications:(id)a3 passingThresholdOfType:(unint64_t)a4;
- (id)sceneNamesFromSceneClassifications:(id)a3 passingThresholdOfType:(unint64_t)a4;
- (id)taxonomyNodeForName:(id)a3;
- (id)taxonomyNodeForSceneIdentifier:(unint64_t)a3;
- (void)taxonomyNodeRefForName:(id)a3;
- (void)taxonomyNodeRefForSceneIdentifier:(unint64_t)a3;
@end

@implementation CLSTaxonomyBasedModel

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_storeStrong((id *)&self->_sceneTaxonomy, 0);
  objc_storeStrong((id *)&self->_signalNodeBySignalIdentifier, 0);
  objc_storeStrong((id *)&self->_signalNodeBySignalName, 0);
}

- (NSString)identifier
{
  return (NSString *)objc_getProperty(self, a2, 32, 1);
}

- (PFSceneTaxonomy)sceneTaxonomy
{
  return (PFSceneTaxonomy *)objc_getProperty(self, a2, 24, 1);
}

- (void)taxonomyNodeRefForName:(id)a3
{
  result = (void *)[(PFSceneTaxonomy *)self->_sceneTaxonomy nodeRefForName:a3];
  if (result)
  {
    v5 = result;
    if ([(CLSTaxonomyBasedModel *)self nodeRefIsSupported:result]) {
      return v5;
    }
    else {
      return 0;
    }
  }
  return result;
}

- (void)taxonomyNodeRefForSceneIdentifier:(unint64_t)a3
{
  result = (void *)[(PFSceneTaxonomy *)self->_sceneTaxonomy nodeRefForExtendedSceneClassId:a3];
  if (result)
  {
    v5 = result;
    if ([(CLSTaxonomyBasedModel *)self nodeRefIsSupported:result]) {
      return v5;
    }
    else {
      return 0;
    }
  }
  return result;
}

- (id)taxonomyNodeForName:(id)a3
{
  v4 = [(PFSceneTaxonomy *)self->_sceneTaxonomy nodeForName:a3];
  if (v4 && ![(CLSTaxonomyBasedModel *)self nodeIsSupported:v4])
  {

    v4 = 0;
  }
  return v4;
}

- (id)taxonomyNodeForSceneIdentifier:(unint64_t)a3
{
  v4 = [(PFSceneTaxonomy *)self->_sceneTaxonomy nodeForExtendedSceneClassId:a3];
  if (v4 && ![(CLSTaxonomyBasedModel *)self nodeIsSupported:v4])
  {

    v4 = 0;
  }
  return v4;
}

- (BOOL)nodeRefIsSupported:(void *)a3
{
  v5 = objc_msgSend(MEMORY[0x263F08690], "currentHandler", a3);
  [v5 handleFailureInMethod:a2 object:self file:@"CLSTaxonomyBasedModel.m" lineNumber:265 description:@"Subclasses need to implement this"];

  return 0;
}

- (BOOL)nodeIsSupported:(id)a3
{
  v5 = objc_msgSend(MEMORY[0x263F08690], "currentHandler", a3);
  [v5 handleFailureInMethod:a2 object:self file:@"CLSTaxonomyBasedModel.m" lineNumber:260 description:@"Subclasses need to implement this"];

  return 0;
}

- (id)sceneIdentifiersFromSceneClassifications:(id)a3 passingThresholdOfType:(unint64_t)a4
{
  uint64_t v26 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = objc_alloc_init(MEMORY[0x263EFF9C0]);
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  id v8 = v6;
  uint64_t v9 = [v8 countByEnumeratingWithState:&v21 objects:v25 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v22;
    unint64_t v12 = a4 - 1;
    do
    {
      for (uint64_t i = 0; i != v10; ++i)
      {
        if (*(void *)v22 != v11) {
          objc_enumerationMutation(v8);
        }
        v14 = *(void **)(*((void *)&v21 + 1) + 8 * i);
        uint64_t v15 = objc_msgSend(v14, "extendedSceneIdentifier", (void)v21);
        if ([(CLSTaxonomyBasedModel *)self taxonomyNodeRefForSceneIdentifier:v15])
        {
          switch(v12)
          {
            case 0uLL:
              PFSceneTaxonomyNodeSearchThreshold();
              goto LABEL_15;
            case 1uLL:
              PFSceneTaxonomyNodeF0Point5Threshold();
              goto LABEL_15;
            case 2uLL:
              PFSceneTaxonomyNodeF2Threshold();
              goto LABEL_15;
            case 3uLL:
              PFSceneTaxonomyNodeF1Threshold();
              goto LABEL_15;
            case 4uLL:
              PFSceneTaxonomyNodeGraphHighPrecisionThreshold();
              goto LABEL_15;
            case 5uLL:
              PFSceneTaxonomyNodeGraphHighRecallThreshold();
LABEL_15:
              double v17 = v16;
              break;
            default:
              double v17 = 1.79769313e308;
              break;
          }
          [v14 confidence];
          if (v18 >= v17)
          {
            v19 = [NSNumber numberWithUnsignedLongLong:v15];
            [v7 addObject:v19];
          }
        }
      }
      uint64_t v10 = [v8 countByEnumeratingWithState:&v21 objects:v25 count:16];
    }
    while (v10);
  }

  return v7;
}

- (id)sceneNamesFromSceneClassifications:(id)a3 passingThresholdOfType:(unint64_t)a4
{
  uint64_t v25 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = objc_alloc_init(MEMORY[0x263EFF9C0]);
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  id v8 = v6;
  uint64_t v9 = [v8 countByEnumeratingWithState:&v20 objects:v24 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v21;
    unint64_t v12 = a4 - 1;
    do
    {
      for (uint64_t i = 0; i != v10; ++i)
      {
        if (*(void *)v21 != v11) {
          objc_enumerationMutation(v8);
        }
        v14 = *(void **)(*((void *)&v20 + 1) + 8 * i);
        if (-[CLSTaxonomyBasedModel taxonomyNodeRefForSceneIdentifier:](self, "taxonomyNodeRefForSceneIdentifier:", objc_msgSend(v14, "extendedSceneIdentifier", (void)v20)))
        {
          switch(v12)
          {
            case 0uLL:
              PFSceneTaxonomyNodeSearchThreshold();
              goto LABEL_15;
            case 1uLL:
              PFSceneTaxonomyNodeF0Point5Threshold();
              goto LABEL_15;
            case 2uLL:
              PFSceneTaxonomyNodeF2Threshold();
              goto LABEL_15;
            case 3uLL:
              PFSceneTaxonomyNodeF1Threshold();
              goto LABEL_15;
            case 4uLL:
              PFSceneTaxonomyNodeGraphHighPrecisionThreshold();
              goto LABEL_15;
            case 5uLL:
              PFSceneTaxonomyNodeGraphHighRecallThreshold();
LABEL_15:
              double v16 = v15;
              break;
            default:
              double v16 = 1.79769313e308;
              break;
          }
          [v14 confidence];
          if (v17 >= v16)
          {
            double v18 = PFSceneTaxonomyNodeName();
            [v7 addObject:v18];
          }
        }
      }
      uint64_t v10 = [v8 countByEnumeratingWithState:&v20 objects:v24 count:16];
    }
    while (v10);
  }

  return v7;
}

- (id)confidenceThresholdBySceneIdentifierForSceneNames:(id)a3 withThresholdType:(unint64_t)a4
{
  uint64_t v34 = *MEMORY[0x263EF8340];
  id v5 = a3;
  id v23 = objc_alloc_init(MEMORY[0x263EFF9A0]);
  long long v25 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  id v6 = v5;
  uint64_t v7 = [v6 countByEnumeratingWithState:&v25 objects:v33 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v26;
    uint64_t v10 = &_os_log_internal;
    do
    {
      uint64_t v11 = 0;
      uint64_t v24 = v8;
      do
      {
        if (*(void *)v26 != v9) {
          objc_enumerationMutation(v6);
        }
        id v12 = *(id *)(*((void *)&v25 + 1) + 8 * v11);
        if ([(CLSTaxonomyBasedModel *)self taxonomyNodeRefForName:v12])
        {
          switch(a4)
          {
            case 1uLL:
              PFSceneTaxonomyNodeSearchThreshold();
              goto LABEL_16;
            case 2uLL:
              PFSceneTaxonomyNodeF0Point5Threshold();
              goto LABEL_16;
            case 3uLL:
              PFSceneTaxonomyNodeF2Threshold();
              goto LABEL_16;
            case 4uLL:
              PFSceneTaxonomyNodeF1Threshold();
              goto LABEL_16;
            case 5uLL:
              PFSceneTaxonomyNodeGraphHighPrecisionThreshold();
              goto LABEL_16;
            case 6uLL:
              PFSceneTaxonomyNodeGraphHighRecallThreshold();
LABEL_16:
              if (v13 == 1.79769313e308) {
                goto LABEL_17;
              }
              objc_msgSend(NSNumber, "numberWithDouble:");
              uint64_t v15 = v9;
              double v16 = self;
              id v17 = v6;
              v19 = double v18 = v10;
              long long v20 = [NSNumber numberWithUnsignedLongLong:PFSceneTaxonomyNodeExtendedSceneClassId()];
              [v23 setObject:v19 forKeyedSubscript:v20];

              uint64_t v10 = v18;
              id v6 = v17;
              self = v16;
              uint64_t v9 = v15;
              uint64_t v8 = v24;
              break;
            default:
LABEL_17:
              if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
              {
                v14 = PFSceneTaxonomyNodeName();
                *(_DWORD *)buf = 138412546;
                id v30 = v14;
                __int16 v31 = 1024;
                int v32 = a4;
                _os_log_error_impl(&dword_259939000, v10, OS_LOG_TYPE_ERROR, "No confidence threshold found for node with name %@ and thresholdType %d", buf, 0x12u);
              }
              break;
          }
        }
        else if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138412290;
          id v30 = v12;
          _os_log_error_impl(&dword_259939000, v10, OS_LOG_TYPE_ERROR, "%@ is not a scene name", buf, 0xCu);
        }

        ++v11;
      }
      while (v8 != v11);
      uint64_t v8 = [v6 countByEnumeratingWithState:&v25 objects:v33 count:16];
    }
    while (v8);
  }

  return v23;
}

- (id)sceneIdentifiersForSceneNames:(id)a3 includingChildScenes:(BOOL)a4
{
  BOOL v22 = a4;
  uint64_t v32 = *MEMORY[0x263EF8340];
  id v5 = a3;
  id v6 = objc_alloc_init(MEMORY[0x263EFF9C0]);
  long long v25 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  id obj = v5;
  uint64_t v7 = [obj countByEnumeratingWithState:&v25 objects:v31 count:16];
  if (v7)
  {
    uint64_t v9 = v7;
    uint64_t v10 = *(void *)v26;
    uint64_t v11 = &_os_log_internal;
    *(void *)&long long v8 = 138412290;
    long long v20 = v8;
    do
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v26 != v10) {
          objc_enumerationMutation(obj);
        }
        id v13 = *(id *)(*((void *)&v25 + 1) + 8 * i);
        v14 = [v13 lowercaseString];
        if (([v14 isEqualToString:v13] & 1) == 0)
        {
          if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = v20;
            id v30 = v13;
            _os_log_impl(&dword_259939000, v11, OS_LOG_TYPE_INFO, "Scene names should be lower case, %@ is not", buf, 0xCu);
          }
          id v15 = v14;

          id v13 = v15;
        }
        double v16 = -[CLSTaxonomyBasedModel taxonomyNodeForName:](self, "taxonomyNodeForName:", v13, v20);
        id v17 = v16;
        if (v16)
        {
          double v18 = objc_msgSend(NSNumber, "numberWithUnsignedLongLong:", objc_msgSend(v16, "extendedSceneClassId"));
          [v6 addObject:v18];

          if (v22)
          {
            v23[0] = MEMORY[0x263EF8330];
            v23[1] = 3221225472;
            v23[2] = __76__CLSTaxonomyBasedModel_sceneIdentifiersForSceneNames_includingChildScenes___block_invoke;
            v23[3] = &unk_265454110;
            v23[4] = self;
            id v24 = v6;
            [v17 traverse:1 visitor:v23];
          }
        }
        else if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = v20;
          id v30 = v13;
          _os_log_error_impl(&dword_259939000, v11, OS_LOG_TYPE_ERROR, "[CLSSceneModel] %@ is not a scene name", buf, 0xCu);
        }
      }
      uint64_t v9 = [obj countByEnumeratingWithState:&v25 objects:v31 count:16];
    }
    while (v9);
  }

  return v6;
}

uint64_t __76__CLSTaxonomyBasedModel_sceneIdentifiersForSceneNames_includingChildScenes___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if ([*(id *)(a1 + 32) nodeIsSupported:v3])
  {
    v4 = *(void **)(a1 + 40);
    id v5 = objc_msgSend(NSNumber, "numberWithUnsignedLongLong:", objc_msgSend(v3, "extendedSceneClassId"));
    [v4 addObject:v5];
  }
  return 0;
}

- (id)sceneIdentifierBySceneNameForSceneNames:(id)a3
{
  uint64_t v28 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = objc_alloc_init(MEMORY[0x263EFF9A0]);
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  id obj = v4;
  uint64_t v6 = [obj countByEnumeratingWithState:&v21 objects:v27 count:16];
  if (v6)
  {
    uint64_t v8 = v6;
    uint64_t v9 = *(void *)v22;
    uint64_t v10 = &_os_log_internal;
    *(void *)&long long v7 = 138412290;
    long long v19 = v7;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v22 != v9) {
          objc_enumerationMutation(obj);
        }
        id v12 = *(id *)(*((void *)&v21 + 1) + 8 * i);
        id v13 = [v12 lowercaseString];
        if (([v13 isEqualToString:v12] & 1) == 0)
        {
          if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = v19;
            id v26 = v12;
            _os_log_impl(&dword_259939000, v10, OS_LOG_TYPE_INFO, "Scene names should be lower case, %@ is not", buf, 0xCu);
          }
          id v14 = v13;

          id v12 = v14;
        }
        id v15 = -[CLSTaxonomyBasedModel taxonomyNodeForName:](self, "taxonomyNodeForName:", v12, v19);
        double v16 = v15;
        if (v15)
        {
          id v17 = objc_msgSend(NSNumber, "numberWithUnsignedLongLong:", objc_msgSend(v15, "extendedSceneClassId"));
          [v5 setObject:v17 forKeyedSubscript:v12];
        }
        else if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = v19;
          id v26 = v12;
          _os_log_error_impl(&dword_259939000, v10, OS_LOG_TYPE_ERROR, "[CLSSceneModel] %@ is not a scene name", buf, 0xCu);
        }
      }
      uint64_t v8 = [obj countByEnumeratingWithState:&v21 objects:v27 count:16];
    }
    while (v8);
  }

  return v5;
}

- (id)nodeForSignalIdentifier:(unint64_t)a3
{
  signalNodeBySignalIdentifier = self->_signalNodeBySignalIdentifier;
  uint64_t v6 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:");
  long long v7 = [(NSMutableDictionary *)signalNodeBySignalIdentifier objectForKeyedSubscript:v6];

  if (v7)
  {
    uint64_t v8 = [MEMORY[0x263EFF9D0] null];

    if (v7 != v8) {
      goto LABEL_11;
    }
  }
  else
  {
    long long v7 = [(CLSTaxonomyBasedModel *)self taxonomyNodeForSceneIdentifier:a3];
    if (v7)
    {
      uint64_t v9 = [[CLSTaxonomyBasedSignalNode alloc] initWithTaxonomyNode:v7];
      if (v9)
      {
        uint64_t v10 = self->_signalNodeBySignalIdentifier;
        uint64_t v11 = [NSNumber numberWithUnsignedInteger:a3];
        [(NSMutableDictionary *)v10 setObject:v9 forKeyedSubscript:v11];
      }
      else
      {
        uint64_t v11 = [MEMORY[0x263EFF9D0] null];
        id v12 = self->_signalNodeBySignalIdentifier;
        id v13 = [NSNumber numberWithUnsignedInteger:a3];
        [(NSMutableDictionary *)v12 setObject:v11 forKeyedSubscript:v13];
      }
      goto LABEL_10;
    }
  }
  uint64_t v9 = 0;
LABEL_10:

  long long v7 = v9;
LABEL_11:
  return v7;
}

- (CLSTaxonomyBasedModel)initWithSceneTaxonomy:(id)a3
{
  id v5 = a3;
  v14.receiver = self;
  v14.super_class = (Class)CLSTaxonomyBasedModel;
  uint64_t v6 = [(CLSTaxonomyBasedModel *)&v14 init];
  if (v6)
  {
    long long v7 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x263EFF9A0]);
    signalNodeBySignalName = v6->_signalNodeBySignalName;
    v6->_signalNodeBySignalName = v7;

    uint64_t v9 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x263EFF9A0]);
    signalNodeBySignalIdentifier = v6->_signalNodeBySignalIdentifier;
    v6->_signalNodeBySignalIdentifier = v9;

    objc_storeStrong((id *)&v6->_sceneTaxonomy, a3);
    uint64_t v11 = [(PFSceneTaxonomy *)v6->_sceneTaxonomy digest];
    identifier = v6->_identifier;
    v6->_identifier = (NSString *)v11;
  }
  return v6;
}

@end