@interface PXStoryNullPersistableRecipeWriter
- (NSError)error;
- (PXStoryNullPersistableRecipeWriter)init;
- (PXStoryNullPersistableRecipeWriter)initWithError:(id)a3;
- (id)writePersistableRecipe:(id)a3 assetEdits:(id)a4 undoManager:(id)a5 resultHandler:(id)a6;
@end

@implementation PXStoryNullPersistableRecipeWriter

- (void).cxx_destruct
{
}

- (NSError)error
{
  return self->_error;
}

- (id)writePersistableRecipe:(id)a3 assetEdits:(id)a4 undoManager:(id)a5 resultHandler:(id)a6
{
  id v8 = a6;
  v9 = [(PXStoryNullPersistableRecipeWriter *)self error];
  (*((void (**)(id, void, void, void *))a6 + 2))(v8, 0, 0, v9);

  return 0;
}

- (PXStoryNullPersistableRecipeWriter)initWithError:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)PXStoryNullPersistableRecipeWriter;
  v6 = [(PXStoryNullPersistableRecipeWriter *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_error, a3);
  }

  return v7;
}

- (PXStoryNullPersistableRecipeWriter)init
{
  return [(PXStoryNullPersistableRecipeWriter *)self initWithError:0];
}

@end