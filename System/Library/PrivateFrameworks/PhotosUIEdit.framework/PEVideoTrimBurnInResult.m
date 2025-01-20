@interface PEVideoTrimBurnInResult
- (PHAsset)asset;
- (PHContentEditingInput)contentEditingInput;
- (PICompositionController)compositionController;
- (void)setAsset:(id)a3;
- (void)setCompositionController:(id)a3;
- (void)setContentEditingInput:(id)a3;
@end

@implementation PEVideoTrimBurnInResult

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_contentEditingInput, 0);
  objc_storeStrong((id *)&self->_compositionController, 0);
  objc_storeStrong((id *)&self->_asset, 0);
}

- (void)setContentEditingInput:(id)a3
{
}

- (PHContentEditingInput)contentEditingInput
{
  return self->_contentEditingInput;
}

- (void)setCompositionController:(id)a3
{
}

- (PICompositionController)compositionController
{
  return self->_compositionController;
}

- (void)setAsset:(id)a3
{
}

- (PHAsset)asset
{
  return self->_asset;
}

@end