@interface PEEditActionResult
- (NSError)error;
- (NSString)sourceAssetUUID;
- (PEAsset)savedAsset;
- (PEEditAction)sourceAction;
- (PEEditAction)targetAction;
- (PEEditActionResult)initWithAssetUUID:(id)a3 targetAction:(id)a4;
- (void)setError:(id)a3;
- (void)setSavedAsset:(id)a3;
- (void)setSourceAction:(id)a3;
@end

@implementation PEEditActionResult

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_error, 0);
  objc_storeStrong((id *)&self->_savedAsset, 0);
  objc_storeStrong((id *)&self->_sourceAction, 0);
  objc_storeStrong((id *)&self->_targetAction, 0);
  objc_storeStrong((id *)&self->_sourceAssetUUID, 0);
}

- (void)setError:(id)a3
{
}

- (NSError)error
{
  return self->_error;
}

- (void)setSavedAsset:(id)a3
{
}

- (PEAsset)savedAsset
{
  return self->_savedAsset;
}

- (void)setSourceAction:(id)a3
{
}

- (PEEditAction)sourceAction
{
  return self->_sourceAction;
}

- (PEEditAction)targetAction
{
  return self->_targetAction;
}

- (NSString)sourceAssetUUID
{
  return self->_sourceAssetUUID;
}

- (PEEditActionResult)initWithAssetUUID:(id)a3 targetAction:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)PEEditActionResult;
  v9 = [(PEEditActionResult *)&v12 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_sourceAssetUUID, a3);
    objc_storeStrong((id *)&v10->_targetAction, a4);
  }

  return v10;
}

@end