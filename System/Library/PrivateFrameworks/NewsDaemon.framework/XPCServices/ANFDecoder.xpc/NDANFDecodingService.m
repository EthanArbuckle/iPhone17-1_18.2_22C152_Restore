@interface NDANFDecodingService
- (NDANFDecodingService)init;
- (NDANFHelper)anfHelper;
- (void)decodeANFDocumentData:(id)a3 completion:(id)a4;
@end

@implementation NDANFDecodingService

- (NDANFDecodingService)init
{
  v6.receiver = self;
  v6.super_class = (Class)NDANFDecodingService;
  v2 = [(NDANFDecodingService *)&v6 init];
  if (v2)
  {
    v3 = objc_alloc_init(NDANFHelper);
    anfHelper = v2->_anfHelper;
    v2->_anfHelper = v3;
  }
  return v2;
}

- (void)decodeANFDocumentData:(id)a3 completion:(id)a4
{
  id v7 = a4;
  id v8 = a3;
  id v10 = [(NDANFDecodingService *)self anfHelper];
  v9 = [v10 manifestFromANFDocumentData:v8];

  (*((void (**)(id, void *, void))a4 + 2))(v7, v9, 0);
}

- (NDANFHelper)anfHelper
{
  return self->_anfHelper;
}

- (void).cxx_destruct
{
}

@end