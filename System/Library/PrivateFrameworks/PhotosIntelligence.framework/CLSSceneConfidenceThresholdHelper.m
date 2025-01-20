@interface CLSSceneConfidenceThresholdHelper
- (CLSSceneConfidenceThresholdHelper)initWithSceneNames:(id)a3 thresholdType:(unint64_t)a4;
- (id)confidenceThresholdBySceneIdentifierWithCurationModel:(id)a3;
- (id)initForEntityNetWithSceneNames:(id)a3 thresholdType:(unint64_t)a4;
- (void)_commonInitWithSceneNames:(id)a3 thresholdType:(unint64_t)a4;
@end

@implementation CLSSceneConfidenceThresholdHelper

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_confidenceThresholdBySceneIdentifierBySceneModelIdentifier, 0);
  objc_storeStrong((id *)&self->_sceneNames, 0);
}

- (id)confidenceThresholdBySceneIdentifierWithCurationModel:(id)a3
{
  p_confidenceThresholdBySceneIdentifierBySceneModelIdentifierLock = &self->_confidenceThresholdBySceneIdentifierBySceneModelIdentifierLock;
  id v5 = a3;
  os_unfair_lock_lock(p_confidenceThresholdBySceneIdentifierBySceneModelIdentifierLock);
  if (self->_useEntityNet) {
    [v5 entityNetModel];
  }
  else {
  v6 = [v5 sceneModel];
  }

  v7 = [v6 identifier];
  if (v7)
  {
    v8 = [(NSMutableDictionary *)self->_confidenceThresholdBySceneIdentifierBySceneModelIdentifier objectForKeyedSubscript:v7];
    if (!v8)
    {
      v8 = [v6 confidenceThresholdBySceneIdentifierForSceneNames:self->_sceneNames withThresholdType:self->_thresholdType];
      [(NSMutableDictionary *)self->_confidenceThresholdBySceneIdentifierBySceneModelIdentifier setObject:v8 forKeyedSubscript:v7];
    }
  }
  else
  {
    v8 = (void *)MEMORY[0x263EFFA78];
  }
  os_unfair_lock_unlock(p_confidenceThresholdBySceneIdentifierBySceneModelIdentifierLock);

  return v8;
}

- (void)_commonInitWithSceneNames:(id)a3 thresholdType:(unint64_t)a4
{
  objc_storeStrong((id *)&self->_sceneNames, a3);
  id v7 = a3;
  self->_thresholdType = a4;
  v8 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x263EFF9A0]);
  confidenceThresholdBySceneIdentifierBySceneModelIdentifier = self->_confidenceThresholdBySceneIdentifierBySceneModelIdentifier;
  self->_confidenceThresholdBySceneIdentifierBySceneModelIdentifier = v8;

  self->_confidenceThresholdBySceneIdentifierBySceneModelIdentifierLock._os_unfair_lock_opaque = 0;
}

- (id)initForEntityNetWithSceneNames:(id)a3 thresholdType:(unint64_t)a4
{
  id v6 = a3;
  v10.receiver = self;
  v10.super_class = (Class)CLSSceneConfidenceThresholdHelper;
  id v7 = [(CLSSceneConfidenceThresholdHelper *)&v10 init];
  v8 = v7;
  if (v7)
  {
    [(CLSSceneConfidenceThresholdHelper *)v7 _commonInitWithSceneNames:v6 thresholdType:a4];
    v8->_useEntityNet = 1;
  }

  return v8;
}

- (CLSSceneConfidenceThresholdHelper)initWithSceneNames:(id)a3 thresholdType:(unint64_t)a4
{
  id v6 = a3;
  v10.receiver = self;
  v10.super_class = (Class)CLSSceneConfidenceThresholdHelper;
  id v7 = [(CLSSceneConfidenceThresholdHelper *)&v10 init];
  v8 = v7;
  if (v7)
  {
    [(CLSSceneConfidenceThresholdHelper *)v7 _commonInitWithSceneNames:v6 thresholdType:a4];
    v8->_useEntityNet = 0;
  }

  return v8;
}

@end