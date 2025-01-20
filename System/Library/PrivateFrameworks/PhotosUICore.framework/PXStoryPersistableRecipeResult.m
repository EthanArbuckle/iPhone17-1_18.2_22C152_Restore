@interface PXStoryPersistableRecipeResult
- (PFStoryRecipe)recipe;
- (PXStoryMiroMemoryConverter)miroInfo;
- (PXStoryPersistableRecipeResult)init;
- (PXStoryPersistableRecipeResult)initWithPersistableRecipe:(id)a3;
- (PXStoryPersistableRecipeResult)initWithPersistableRecipe:(id)a3 miroInfo:(id)a4;
@end

@implementation PXStoryPersistableRecipeResult

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_miroInfo, 0);
  objc_storeStrong((id *)&self->_recipe, 0);
}

- (PXStoryMiroMemoryConverter)miroInfo
{
  return self->_miroInfo;
}

- (PFStoryRecipe)recipe
{
  return self->_recipe;
}

- (PXStoryPersistableRecipeResult)initWithPersistableRecipe:(id)a3 miroInfo:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)PXStoryPersistableRecipeResult;
  v9 = [(PXStoryPersistableRecipeResult *)&v12 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_recipe, a3);
    objc_storeStrong((id *)&v10->_miroInfo, a4);
  }

  return v10;
}

- (PXStoryPersistableRecipeResult)initWithPersistableRecipe:(id)a3
{
  return [(PXStoryPersistableRecipeResult *)self initWithPersistableRecipe:a3 miroInfo:0];
}

- (PXStoryPersistableRecipeResult)init
{
  v4 = [MEMORY[0x1E4F28B00] currentHandler];
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"PXStoryPersistableRecipeResult.m", 16, @"%s is not available as initializer", "-[PXStoryPersistableRecipeResult init]");

  abort();
}

@end