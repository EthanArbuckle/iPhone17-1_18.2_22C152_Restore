@interface PGCurationSceneTrait
- (BOOL)isActive;
- (NSSet)sceneNames;
- (PGCurationSceneTrait)initWithSceneNames:(id)a3;
- (id)confidenceThresholdBySceneIdentifierWithCurationModel:(id)a3;
- (unint64_t)targetNumberOfMatches;
- (void)setTargetNumberOfMatches:(unint64_t)a3;
@end

@implementation PGCurationSceneTrait

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sceneNames, 0);
  objc_storeStrong((id *)&self->_helper, 0);
}

- (void)setTargetNumberOfMatches:(unint64_t)a3
{
  self->_targetNumberOfMatches = a3;
}

- (unint64_t)targetNumberOfMatches
{
  return self->_targetNumberOfMatches;
}

- (NSSet)sceneNames
{
  return (NSSet *)objc_getProperty(self, a2, 24, 1);
}

- (id)confidenceThresholdBySceneIdentifierWithCurationModel:(id)a3
{
  return (id)[(CLSSceneConfidenceThresholdHelper *)self->_helper confidenceThresholdBySceneIdentifierWithCurationModel:a3];
}

- (BOOL)isActive
{
  return 1;
}

- (PGCurationSceneTrait)initWithSceneNames:(id)a3
{
  id v5 = a3;
  v13.receiver = self;
  v13.super_class = (Class)PGCurationSceneTrait;
  v6 = [(PGCurationTrait *)&v13 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_sceneNames, a3);
    id v8 = objc_alloc(MEMORY[0x1E4F8E788]);
    v9 = [(NSSet *)v7->_sceneNames allObjects];
    uint64_t v10 = [v8 initWithSceneNames:v9 thresholdType:5];
    helper = v7->_helper;
    v7->_helper = (CLSSceneConfidenceThresholdHelper *)v10;
  }
  return v7;
}

@end