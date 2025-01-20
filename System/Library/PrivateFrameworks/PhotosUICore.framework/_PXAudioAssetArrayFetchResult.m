@interface _PXAudioAssetArrayFetchResult
- (BOOL)containsObject:(id)a3;
- (NSString)description;
- (PXAudioAsset)firstObject;
- (PXAudioAsset)lastObject;
- (_PXAudioAssetArrayFetchResult)init;
- (_PXAudioAssetArrayFetchResult)initWithArray:(id)a3;
- (id)objectAtIndex:(unint64_t)a3;
- (id)objectsAtIndexes:(id)a3;
- (int64_t)count;
- (void)enumerateObjectsUsingBlock:(id)a3;
@end

@implementation _PXAudioAssetArrayFetchResult

- (void).cxx_destruct
{
}

- (void)enumerateObjectsUsingBlock:(id)a3
{
  v4 = (void (**)(id, void *, unint64_t, unsigned char *))a3;
  unsigned __int8 v8 = 0;
  if ([(_PXAudioAssetArrayFetchResult *)self count])
  {
    unint64_t v5 = 0;
    do
    {
      v6 = [(NSArray *)self->_assets objectAtIndexedSubscript:v5];
      v4[2](v4, v6, v5, &v8);
      int v7 = v8;

      if (v7) {
        break;
      }
      ++v5;
    }
    while (v5 < [(_PXAudioAssetArrayFetchResult *)self count]);
  }
}

- (PXAudioAsset)lastObject
{
  return (PXAudioAsset *)[(NSArray *)self->_assets lastObject];
}

- (PXAudioAsset)firstObject
{
  return (PXAudioAsset *)[(NSArray *)self->_assets firstObject];
}

- (BOOL)containsObject:(id)a3
{
  return [(NSArray *)self->_assets containsObject:a3];
}

- (id)objectsAtIndexes:(id)a3
{
  return [(NSArray *)self->_assets objectsAtIndexes:a3];
}

- (id)objectAtIndex:(unint64_t)a3
{
  return [(NSArray *)self->_assets objectAtIndexedSubscript:a3];
}

- (int64_t)count
{
  return [(NSArray *)self->_assets count];
}

- (NSString)description
{
  v2 = objc_msgSend([NSString alloc], "initWithFormat:", @"<%@; %p; Assets: %@>",
                 objc_opt_class(),
                 self,
                 self->_assets);
  return (NSString *)v2;
}

- (_PXAudioAssetArrayFetchResult)init
{
  return [(_PXAudioAssetArrayFetchResult *)self initWithArray:0];
}

- (_PXAudioAssetArrayFetchResult)initWithArray:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)_PXAudioAssetArrayFetchResult;
  unint64_t v5 = [(_PXAudioAssetArrayFetchResult *)&v9 init];
  if (v5)
  {
    uint64_t v6 = [v4 copy];
    assets = v5->_assets;
    v5->_assets = (NSArray *)v6;
  }
  return v5;
}

@end