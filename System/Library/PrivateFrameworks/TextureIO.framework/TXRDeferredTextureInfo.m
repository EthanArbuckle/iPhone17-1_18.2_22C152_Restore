@interface TXRDeferredTextureInfo
- (NSMutableArray)mipmaps;
- (TXRDeferredTextureInfo)initWithMipmapLevelCount:(unint64_t)a3 arrayLength:(unint64_t)a4 cubemap:(BOOL)a5;
- (TXRTextureInfo)info;
- (void)setInfo:(id)a3;
@end

@implementation TXRDeferredTextureInfo

- (TXRDeferredTextureInfo)initWithMipmapLevelCount:(unint64_t)a3 arrayLength:(unint64_t)a4 cubemap:(BOOL)a5
{
  BOOL v5 = a5;
  v14.receiver = self;
  v14.super_class = (Class)TXRDeferredTextureInfo;
  v8 = [(TXRDeferredTextureInfo *)&v14 init];
  if (v8)
  {
    uint64_t v9 = [objc_alloc(MEMORY[0x1E4F1CA48]) initWithCapacity:a3];
    mipmaps = v8->_mipmaps;
    v8->_mipmaps = (NSMutableArray *)v9;

    if (a3)
    {
      v11 = 0;
      do
      {
        v12 = v11;
        v11 = [[TXRDeferredMipmapInfo alloc] initWithArrayLength:a4 cubemap:v5];

        [(NSMutableArray *)v8->_mipmaps addObject:v11];
        --a3;
      }
      while (a3);
    }
  }
  return v8;
}

- (TXRTextureInfo)info
{
  return self->_info;
}

- (void)setInfo:(id)a3
{
}

- (NSMutableArray)mipmaps
{
  return self->_mipmaps;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_mipmaps, 0);
  objc_storeStrong((id *)&self->_info, 0);
}

@end