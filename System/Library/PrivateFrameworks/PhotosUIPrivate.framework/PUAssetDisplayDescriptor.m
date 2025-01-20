@interface PUAssetDisplayDescriptor
+ (id)assetDisplayDescriptorForSimpleNavigationToAssetReference:(id)a3;
- ($3CC8671D27C23BF42ADDB32F2B5E48AE)videoSeekTime;
- (NSDate)modifiedAfterDate;
- (PUAssetDisplayDescriptor)init;
- (PUAssetDisplayDescriptor)initWithAssetReference:(id)a3 modifiedAfterDate:(id)a4 videoSeekTime:(id *)a5;
- (PUAssetReference)assetReference;
@end

@implementation PUAssetDisplayDescriptor

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_modifiedAfterDate, 0);
  objc_storeStrong((id *)&self->_assetReference, 0);
}

- (NSDate)modifiedAfterDate
{
  return self->_modifiedAfterDate;
}

- ($3CC8671D27C23BF42ADDB32F2B5E48AE)videoSeekTime
{
  *($95D729B680665BEAEFA1D6FCA8238556 *)retstr = ($95D729B680665BEAEFA1D6FCA8238556)self[1];
  return self;
}

- (PUAssetReference)assetReference
{
  return self->_assetReference;
}

- (PUAssetDisplayDescriptor)initWithAssetReference:(id)a3 modifiedAfterDate:(id)a4 videoSeekTime:(id *)a5
{
  id v9 = a3;
  id v10 = a4;
  v15.receiver = self;
  v15.super_class = (Class)PUAssetDisplayDescriptor;
  v11 = [(PUAssetDisplayDescriptor *)&v15 init];
  v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_assetReference, a3);
    objc_storeStrong((id *)&v12->_modifiedAfterDate, a4);
    long long v13 = *(_OWORD *)&a5->var0;
    v12->_videoSeekTime.epoch = a5->var3;
    *(_OWORD *)&v12->_videoSeekTime.value = v13;
  }

  return v12;
}

- (PUAssetDisplayDescriptor)init
{
  long long v3 = *MEMORY[0x1E4F1F9F8];
  uint64_t v4 = *(void *)(MEMORY[0x1E4F1F9F8] + 16);
  return [(PUAssetDisplayDescriptor *)self initWithAssetReference:0 modifiedAfterDate:0 videoSeekTime:&v3];
}

+ (id)assetDisplayDescriptorForSimpleNavigationToAssetReference:(id)a3
{
  if (a3)
  {
    id v3 = a3;
    uint64_t v4 = [PUAssetDisplayDescriptor alloc];
    long long v7 = *MEMORY[0x1E4F1F9F8];
    uint64_t v8 = *(void *)(MEMORY[0x1E4F1F9F8] + 16);
    v5 = [(PUAssetDisplayDescriptor *)v4 initWithAssetReference:v3 modifiedAfterDate:0 videoSeekTime:&v7];
  }
  else
  {
    v5 = 0;
  }
  return v5;
}

@end