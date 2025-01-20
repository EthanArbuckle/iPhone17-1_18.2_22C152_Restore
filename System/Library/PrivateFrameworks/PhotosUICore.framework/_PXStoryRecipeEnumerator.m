@interface _PXStoryRecipeEnumerator
- (BOOL)didEnumerateRecipeDisplayAsset:(id)a3 error:(id *)a4;
- (_PXStoryRecipeEnumerator)initWithBatchSize:(unint64_t)a3 photoLibrary:(id)a4 scheme:(id)a5 block:(id)a6;
- (id)block;
- (void)_flush;
- (void)setBlock:(id)a3;
@end

@implementation _PXStoryRecipeEnumerator

- (void).cxx_destruct
{
  objc_storeStrong(&self->_block, 0);
  objc_storeStrong((id *)&self->_identifierMap, 0);
  objc_storeStrong((id *)&self->_scheme, 0);
  objc_storeStrong((id *)&self->_photoLibrary, 0);
}

- (void)setBlock:(id)a3
{
}

- (id)block
{
  return self->_block;
}

- (void)_flush
{
}

- (BOOL)didEnumerateRecipeDisplayAsset:(id)a3 error:(id *)a4
{
  v17[1] = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  if (!a4)
  {
    v15 = [MEMORY[0x1E4F28B00] currentHandler];
    [v15 handleFailureInMethod:a2, self, @"PFStoryRecipe+PXStory+PhotoKit.m", 249, @"Invalid parameter not satisfying: %@", @"error != nil" object file lineNumber description];
  }
  v8 = [v7 scheme];
  char v9 = [v8 isEqualToString:self->_scheme];

  if (v9)
  {
    identifierMap = self->_identifierMap;
    v11 = [v7 cloudIdentifier];
    [(NSMutableDictionary *)identifierMap setObject:v7 forKeyedSubscript:v11];

    if ([(NSMutableDictionary *)self->_identifierMap count] >= self->_batchSize) {
      [(_PXStoryRecipeEnumerator *)self _flush];
    }
  }
  else
  {
    v12 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v16 = *MEMORY[0x1E4F28228];
    v17[0] = @"Recipe asset doesn't refer to a PhotoKit Asset";
    v13 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v17 forKeys:&v16 count:1];
    *a4 = [v12 errorWithDomain:@"PXStoryErrorDomain" code:1 userInfo:v13];
  }
  return v9;
}

- (_PXStoryRecipeEnumerator)initWithBatchSize:(unint64_t)a3 photoLibrary:(id)a4 scheme:(id)a5 block:(id)a6
{
  v11 = (PHPhotoLibrary *)a4;
  id v12 = a5;
  id v13 = a6;
  if (!v11)
  {
    v24 = [MEMORY[0x1E4F28B00] currentHandler];
    [v24 handleFailureInMethod:a2, self, @"PFStoryRecipe+PXStory+PhotoKit.m", 232, @"Invalid parameter not satisfying: %@", @"photoLibrary != nil" object file lineNumber description];

    if (v12) {
      goto LABEL_3;
    }
LABEL_5:
    v25 = [MEMORY[0x1E4F28B00] currentHandler];
    [v25 handleFailureInMethod:a2, self, @"PFStoryRecipe+PXStory+PhotoKit.m", 233, @"Invalid parameter not satisfying: %@", @"scheme != nil" object file lineNumber description];

    goto LABEL_3;
  }
  if (!v12) {
    goto LABEL_5;
  }
LABEL_3:
  v26.receiver = self;
  v26.super_class = (Class)_PXStoryRecipeEnumerator;
  v14 = [(_PXStoryRecipeEnumerator *)&v26 init];
  photoLibrary = v14->_photoLibrary;
  v14->_batchSize = a3;
  v14->_photoLibrary = v11;
  uint64_t v16 = v11;

  uint64_t v17 = [v12 copy];
  scheme = v14->_scheme;
  v14->_scheme = (NSString *)v17;

  v19 = _Block_copy(v13);
  id block = v14->_block;
  v14->_id block = v19;

  uint64_t v21 = [objc_alloc(MEMORY[0x1E4F1CA60]) initWithCapacity:a3];
  identifierMap = v14->_identifierMap;
  v14->_identifierMap = (NSMutableDictionary *)v21;

  return v14;
}

@end