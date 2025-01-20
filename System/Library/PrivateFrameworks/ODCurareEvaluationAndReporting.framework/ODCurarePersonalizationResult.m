@interface ODCurarePersonalizationResult
- (BOOL)newPersonalizedModelIsSelected;
- (BOOL)saveNewPersonalizedModel;
- (NSDictionary)metadata;
- (NSString)personalizedModelIdentifier;
- (NSURL)currentlyUsedModelPath;
- (NSURL)personalizedModelPath;
- (ODCurarePersonalizationResult)initWithNewPersonalizedModelPath:(id)a3 currentlyUsedModelPath:(id)a4 isSelected:(BOOL)a5 saveModel:(BOOL)a6 newPersonalizedModelIdentifier:(id)a7;
- (void)setCurrentlyUsedModelPath:(id)a3;
- (void)setMetadata:(id)a3;
- (void)setNewPersonalizedModelIsSelected:(BOOL)a3;
- (void)setPersonalizedModelIdentifier:(id)a3;
- (void)setPersonalizedModelPath:(id)a3;
- (void)setSaveNewPersonalizedModel:(BOOL)a3;
@end

@implementation ODCurarePersonalizationResult

- (ODCurarePersonalizationResult)initWithNewPersonalizedModelPath:(id)a3 currentlyUsedModelPath:(id)a4 isSelected:(BOOL)a5 saveModel:(BOOL)a6 newPersonalizedModelIdentifier:(id)a7
{
  BOOL v8 = a6;
  BOOL v9 = a5;
  id v12 = a3;
  id v13 = a4;
  id v14 = a7;
  v18.receiver = self;
  v18.super_class = (Class)ODCurarePersonalizationResult;
  v15 = [(ODCurarePersonalizationResult *)&v18 init];
  v16 = v15;
  if (v15)
  {
    [(ODCurarePersonalizationResult *)v15 setPersonalizedModelPath:v12];
    [(ODCurarePersonalizationResult *)v16 setCurrentlyUsedModelPath:v13];
    [(ODCurarePersonalizationResult *)v16 setNewPersonalizedModelIsSelected:v9];
    [(ODCurarePersonalizationResult *)v16 setSaveNewPersonalizedModel:v8];
    [(ODCurarePersonalizationResult *)v16 setPersonalizedModelIdentifier:v14];
  }

  return v16;
}

- (NSURL)personalizedModelPath
{
  return self->_personalizedModelPath;
}

- (void)setPersonalizedModelPath:(id)a3
{
}

- (NSURL)currentlyUsedModelPath
{
  return self->_currentlyUsedModelPath;
}

- (void)setCurrentlyUsedModelPath:(id)a3
{
}

- (BOOL)newPersonalizedModelIsSelected
{
  return self->_newPersonalizedModelIsSelected;
}

- (void)setNewPersonalizedModelIsSelected:(BOOL)a3
{
  self->_newPersonalizedModelIsSelected = a3;
}

- (BOOL)saveNewPersonalizedModel
{
  return self->_saveNewPersonalizedModel;
}

- (void)setSaveNewPersonalizedModel:(BOOL)a3
{
  self->_saveNewPersonalizedModel = a3;
}

- (NSString)personalizedModelIdentifier
{
  return self->_personalizedModelIdentifier;
}

- (void)setPersonalizedModelIdentifier:(id)a3
{
}

- (NSDictionary)metadata
{
  return self->_metadata;
}

- (void)setMetadata:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_metadata, 0);
  objc_storeStrong((id *)&self->_personalizedModelIdentifier, 0);
  objc_storeStrong((id *)&self->_currentlyUsedModelPath, 0);
  objc_storeStrong((id *)&self->_personalizedModelPath, 0);
}

@end