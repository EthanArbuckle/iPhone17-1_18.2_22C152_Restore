@interface NSPPrivateAccessTokenRequest
- (void)dealloc;
@end

@implementation NSPPrivateAccessTokenRequest

- (void)dealloc
{
  if (self)
  {
    ephemeralPrivateKey = self->_ephemeralPrivateKey;
    if (ephemeralPrivateKey)
    {
      CFRelease(ephemeralPrivateKey);
      self->_ephemeralPrivateKey = 0;
    }
    hpkeContext = self->_hpkeContext;
    if (hpkeContext)
    {
      free(hpkeContext);
      self->_hpkeContext = 0;
    }
  }
  v5.receiver = self;
  v5.super_class = (Class)NSPPrivateAccessTokenRequest;
  [(NSPPrivateAccessTokenRequest *)&v5 dealloc];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_hpkeEnc, 0);
  objc_storeStrong((id *)&self->_requestSignature, 0);
  objc_storeStrong((id *)&self->_requestKey, 0);
  objc_storeStrong((id *)&self->_encryptedTokenRequest, 0);
  objc_storeStrong((id *)&self->_originName, 0);
  objc_storeStrong((id *)&self->_issuerEncapKeyID, 0);
  objc_storeStrong((id *)&self->_issuerEncapKey, 0);
  objc_storeStrong((id *)&self->_blindedRequest, 0);

  objc_storeStrong((id *)&self->_requestData, 0);
}

@end