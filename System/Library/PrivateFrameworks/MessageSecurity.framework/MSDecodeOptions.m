@interface MSDecodeOptions
- (BOOL)verifySignatures;
- (BOOL)verifySigners;
- (BOOL)verifyTimestamps;
- (MSDecodeOptions)init;
- (MSDecodeOptions)initWithDecryptionIdentity:(__SecIdentity *)a3;
- (MSDecodeOptions)initWithDecryptionKey:(id)a3;
- (NSArray)additionalCertificates;
- (NSArray)anchorCertificates;
- (NSArray)signerPolicies;
- (NSData)LAContext;
- (NSData)key;
- (NSDate)verifyTime;
- (__SecIdentity)identity;
- (void)dealloc;
- (void)setAdditionalCertificates:(id)a3;
- (void)setAnchorCertificates:(id)a3;
- (void)setIdentity:(__SecIdentity *)a3;
- (void)setKey:(id)a3;
- (void)setLAContext:(id)a3;
- (void)setSignerPolicies:(id)a3;
- (void)setVerifySignatures:(BOOL)a3;
- (void)setVerifySigners:(BOOL)a3;
- (void)setVerifyTime:(id)a3;
- (void)setVerifyTimestamps:(BOOL)a3;
@end

@implementation MSDecodeOptions

- (MSDecodeOptions)init
{
  v7.receiver = self;
  v7.super_class = (Class)MSDecodeOptions;
  v2 = [(MSDecodeOptions *)&v7 init];
  v3 = v2;
  if (v2)
  {
    *(_WORD *)&v2->_verifySignatures = 0;
    signerPolicies = v2->_signerPolicies;
    v2->_signerPolicies = 0;

    key = v3->_key;
    v3->_identity = 0;
    v3->_key = 0;
  }
  return v3;
}

- (MSDecodeOptions)initWithDecryptionIdentity:(__SecIdentity *)a3
{
  v4 = [(MSDecodeOptions *)self init];
  if (v4)
  {
    if (a3) {
      CFRetain(a3);
    }
    v4->_identity = a3;
  }
  return v4;
}

- (MSDecodeOptions)initWithDecryptionKey:(id)a3
{
  id v5 = a3;
  v6 = [(MSDecodeOptions *)self init];
  objc_super v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_key, a3);
  }

  return v7;
}

- (void)dealloc
{
  identity = self->_identity;
  if (identity)
  {
    self->_identity = 0;
    CFRelease(identity);
  }
  v4.receiver = self;
  v4.super_class = (Class)MSDecodeOptions;
  [(MSDecodeOptions *)&v4 dealloc];
}

- (BOOL)verifySignatures
{
  return self->_verifySignatures;
}

- (void)setVerifySignatures:(BOOL)a3
{
  self->_verifySignatures = a3;
}

- (BOOL)verifySigners
{
  return self->_verifySigners;
}

- (void)setVerifySigners:(BOOL)a3
{
  self->_verifySigners = a3;
}

- (BOOL)verifyTimestamps
{
  return self->_verifyTimestamps;
}

- (void)setVerifyTimestamps:(BOOL)a3
{
  self->_verifyTimestamps = a3;
}

- (NSArray)signerPolicies
{
  return (NSArray *)objc_getProperty(self, a2, 16, 1);
}

- (void)setSignerPolicies:(id)a3
{
}

- (NSDate)verifyTime
{
  return (NSDate *)objc_getProperty(self, a2, 24, 1);
}

- (void)setVerifyTime:(id)a3
{
}

- (__SecIdentity)identity
{
  return self->_identity;
}

- (void)setIdentity:(__SecIdentity *)a3
{
  self->_identity = a3;
}

- (NSData)key
{
  return (NSData *)objc_getProperty(self, a2, 40, 1);
}

- (void)setKey:(id)a3
{
}

- (NSData)LAContext
{
  return (NSData *)objc_getProperty(self, a2, 48, 1);
}

- (void)setLAContext:(id)a3
{
}

- (NSArray)additionalCertificates
{
  return (NSArray *)objc_getProperty(self, a2, 56, 1);
}

- (void)setAdditionalCertificates:(id)a3
{
}

- (NSArray)anchorCertificates
{
  return (NSArray *)objc_getProperty(self, a2, 64, 1);
}

- (void)setAnchorCertificates:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_anchorCertificates, 0);
  objc_storeStrong((id *)&self->_additionalCertificates, 0);
  objc_storeStrong((id *)&self->_LAContext, 0);
  objc_storeStrong((id *)&self->_key, 0);
  objc_storeStrong((id *)&self->_verifyTime, 0);

  objc_storeStrong((id *)&self->_signerPolicies, 0);
}

@end