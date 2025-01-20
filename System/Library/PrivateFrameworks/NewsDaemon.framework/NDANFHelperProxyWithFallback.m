@interface NDANFHelperProxyWithFallback
- (NDANFHelper)inProcessHelper;
- (NDANFHelperProxy)proxyHelper;
- (NDANFHelperProxyWithFallback)init;
- (id)manifestFromANFDocumentData:(id)a3;
- (void)popInterest;
- (void)pushInterest;
@end

@implementation NDANFHelperProxyWithFallback

- (NDANFHelperProxyWithFallback)init
{
  v8.receiver = self;
  v8.super_class = (Class)NDANFHelperProxyWithFallback;
  v2 = [(NDANFHelperProxyWithFallback *)&v8 init];
  if (v2)
  {
    v3 = objc_alloc_init(NDANFHelperProxy);
    proxyHelper = v2->_proxyHelper;
    v2->_proxyHelper = v3;

    v5 = objc_alloc_init(NDANFHelper);
    inProcessHelper = v2->_inProcessHelper;
    v2->_inProcessHelper = v5;
  }
  return v2;
}

- (void)pushInterest
{
  v3 = [(NDANFHelperProxyWithFallback *)self proxyHelper];
  [v3 pushInterest];

  id v4 = [(NDANFHelperProxyWithFallback *)self inProcessHelper];
  [v4 pushInterest];
}

- (void)popInterest
{
  v3 = [(NDANFHelperProxyWithFallback *)self proxyHelper];
  [v3 popInterest];

  id v4 = [(NDANFHelperProxyWithFallback *)self inProcessHelper];
  [v4 popInterest];
}

- (id)manifestFromANFDocumentData:(id)a3
{
  id v4 = a3;
  char v13 = 0;
  v5 = [(NDANFHelperProxy *)self->_proxyHelper manifestFromANFDocumentData:v4 reachedService:&v13];
  v6 = (os_log_t *)MEMORY[0x1E4F7DDE8];
  if (!v13) {
    goto LABEL_6;
  }
  v7 = *MEMORY[0x1E4F7DDE8];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F7DDE8], OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1E00ED000, v7, OS_LOG_TYPE_DEFAULT, "Decoded ANF via XPC Service", buf, 2u);
  }
  if (v13)
  {
    objc_super v8 = v5;
  }
  else
  {
LABEL_6:
    objc_super v8 = [(NDANFHelper *)self->_inProcessHelper manifestFromANFDocumentData:v4];

    v9 = *v6;
    if (os_log_type_enabled(*v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v11 = 0;
      _os_log_impl(&dword_1E00ED000, v9, OS_LOG_TYPE_DEFAULT, "Decoded ANF in process", v11, 2u);
    }
  }

  return v8;
}

- (NDANFHelperProxy)proxyHelper
{
  return self->_proxyHelper;
}

- (NDANFHelper)inProcessHelper
{
  return self->_inProcessHelper;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_inProcessHelper, 0);

  objc_storeStrong((id *)&self->_proxyHelper, 0);
}

@end