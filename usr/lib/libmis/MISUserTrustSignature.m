@interface MISUserTrustSignature
- (MISUserTrustSignature)initWithSignature:(id)a3;
- (NSData)signature;
@end

@implementation MISUserTrustSignature

- (void).cxx_destruct
{
}

- (NSData)signature
{
  return self->signature;
}

- (MISUserTrustSignature)initWithSignature:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)MISUserTrustSignature;
  v6 = [(MISUserTrustSignature *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->signature, a3);
  }

  return v7;
}

@end