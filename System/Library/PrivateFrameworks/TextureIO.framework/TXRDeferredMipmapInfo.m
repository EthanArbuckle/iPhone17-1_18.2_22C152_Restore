@interface TXRDeferredMipmapInfo
- (NSMutableArray)elements;
- (TXRDeferredMipmapInfo)initWithArrayLength:(unint64_t)a3 cubemap:(BOOL)a4;
@end

@implementation TXRDeferredMipmapInfo

- (TXRDeferredMipmapInfo)initWithArrayLength:(unint64_t)a3 cubemap:(BOOL)a4
{
  BOOL v4 = a4;
  v12.receiver = self;
  v12.super_class = (Class)TXRDeferredMipmapInfo;
  v6 = [(TXRDeferredMipmapInfo *)&v12 init];
  if (v6)
  {
    uint64_t v7 = [objc_alloc(MEMORY[0x1E4F1CA48]) initWithCapacity:a3];
    elements = v6->_elements;
    v6->_elements = (NSMutableArray *)v7;

    if (a3)
    {
      id v9 = 0;
      do
      {
        v10 = v9;
        id v9 = [[TXRDeferredElementInfo alloc] initAsCubemap:v4];

        [(NSMutableArray *)v6->_elements addObject:v9];
        --a3;
      }
      while (a3);
    }
  }
  return v6;
}

- (NSMutableArray)elements
{
  return self->_elements;
}

- (void).cxx_destruct
{
}

@end