@interface PLAssetCollectionGenerationResult
- (BOOL)frequentLocationsDidChange;
- (NSSet)insertedOrUpdatedMoments;
- (PLAssetCollectionGenerationResult)initWithInsertedOrUpdatedMoments:(id)a3 frequentLocationsDidChange:(BOOL)a4;
@end

@implementation PLAssetCollectionGenerationResult

- (void).cxx_destruct
{
}

- (BOOL)frequentLocationsDidChange
{
  return self->_frequentLocationsDidChange;
}

- (NSSet)insertedOrUpdatedMoments
{
  return self->_insertedOrUpdatedMoments;
}

- (PLAssetCollectionGenerationResult)initWithInsertedOrUpdatedMoments:(id)a3 frequentLocationsDidChange:(BOOL)a4
{
  id v7 = a3;
  v11.receiver = self;
  v11.super_class = (Class)PLAssetCollectionGenerationResult;
  v8 = [(PLAssetCollectionGenerationResult *)&v11 init];
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_insertedOrUpdatedMoments, a3);
    v9->_frequentLocationsDidChange = a4;
  }

  return v9;
}

@end