@interface TXRDeferredElementInfo
- (NSMutableArray)faces;
- (id)initAsCubemap:(BOOL)a3;
@end

@implementation TXRDeferredElementInfo

- (id)initAsCubemap:(BOOL)a3
{
  BOOL v3 = a3;
  v13.receiver = self;
  v13.super_class = (Class)TXRDeferredElementInfo;
  v4 = [(TXRDeferredElementInfo *)&v13 init];
  if (v4)
  {
    id v5 = objc_alloc(MEMORY[0x1E4F1CA48]);
    if (v3) {
      uint64_t v6 = 6;
    }
    else {
      uint64_t v6 = 1;
    }
    uint64_t v7 = [v5 initWithCapacity:v6];
    faces = v4->_faces;
    v4->_faces = (NSMutableArray *)v7;

    if (v3)
    {
      v9 = 0;
      int v10 = 6;
      do
      {
        v11 = objc_alloc_init(TXRDeferredImageInfo);

        [(NSMutableArray *)v4->_faces addObject:v11];
        v9 = v11;
        --v10;
      }
      while (v10);
    }
    else
    {
      v11 = objc_alloc_init(TXRDeferredImageInfo);
      [(NSMutableArray *)v4->_faces addObject:v11];
    }
  }
  return v4;
}

- (NSMutableArray)faces
{
  return self->_faces;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_faces, 0);
  objc_storeStrong((id *)&self->_infoLoaded, 0);
}

@end