@interface _PXMappingAudioAssetFetchResult
- (BOOL)containsObject:(id)a3;
- (PXAudioAsset)firstObject;
- (PXAudioAsset)lastObject;
- (_PXMappingAudioAssetFetchResult)initWithFetchResult:(id)a3 block:(id)a4;
- (id)objectAtIndex:(unint64_t)a3;
- (id)objectsAtIndexes:(id)a3;
- (int64_t)count;
- (void)enumerateObjectsUsingBlock:(id)a3;
@end

@implementation _PXMappingAudioAssetFetchResult

- (void).cxx_destruct
{
  objc_storeStrong(&self->_block, 0);
  objc_storeStrong((id *)&self->_fetchResult, 0);
}

- (void)enumerateObjectsUsingBlock:(id)a3
{
  id v4 = a3;
  fetchResult = self->_fetchResult;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __62___PXMappingAudioAssetFetchResult_enumerateObjectsUsingBlock___block_invoke;
  v7[3] = &unk_1E5DC6220;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  [(PXAudioAssetFetchResult *)fetchResult enumerateObjectsUsingBlock:v7];
}

- (BOOL)containsObject:(id)a3
{
  id v4 = a3;
  uint64_t v12 = 0;
  v13 = &v12;
  uint64_t v14 = 0x2020000000;
  char v15 = 0;
  fetchResult = self->_fetchResult;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __50___PXMappingAudioAssetFetchResult_containsObject___block_invoke;
  v8[3] = &unk_1E5DC61F8;
  id v6 = v4;
  id v9 = v6;
  v10 = self;
  v11 = &v12;
  [(PXAudioAssetFetchResult *)fetchResult enumerateObjectsUsingBlock:v8];
  LOBYTE(self) = *((unsigned char *)v13 + 24);

  _Block_object_dispose(&v12, 8);
  return (char)self;
}

- (id)objectsAtIndexes:(id)a3
{
}

- (PXAudioAsset)lastObject
{
  if ([(_PXMappingAudioAssetFetchResult *)self count] < 1)
  {
    v5 = 0;
  }
  else
  {
    block = (void (**)(id, void *))self->_block;
    id v4 = [(PXAudioAssetFetchResult *)self->_fetchResult lastObject];
    v5 = block[2](block, v4);
  }
  return (PXAudioAsset *)v5;
}

- (PXAudioAsset)firstObject
{
  if ([(_PXMappingAudioAssetFetchResult *)self count] < 1)
  {
    v5 = 0;
  }
  else
  {
    block = (void (**)(id, void *))self->_block;
    id v4 = [(PXAudioAssetFetchResult *)self->_fetchResult firstObject];
    v5 = block[2](block, v4);
  }
  return (PXAudioAsset *)v5;
}

- (id)objectAtIndex:(unint64_t)a3
{
  block = (void (**)(id, void *))self->_block;
  id v4 = [(PXAudioAssetFetchResult *)self->_fetchResult objectAtIndexedSubscript:a3];
  v5 = block[2](block, v4);

  return v5;
}

- (int64_t)count
{
  return [(PXAudioAssetFetchResult *)self->_fetchResult count];
}

- (_PXMappingAudioAssetFetchResult)initWithFetchResult:(id)a3 block:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v14.receiver = self;
  v14.super_class = (Class)_PXMappingAudioAssetFetchResult;
  id v9 = [(_PXMappingAudioAssetFetchResult *)&v14 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_fetchResult, a3);
    uint64_t v11 = [v8 copy];
    id block = v10->_block;
    v10->_id block = (id)v11;
  }
  return v10;
}

@end