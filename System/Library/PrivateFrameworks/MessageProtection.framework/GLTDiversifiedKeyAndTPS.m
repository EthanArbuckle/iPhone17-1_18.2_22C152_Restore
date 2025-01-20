@interface GLTDiversifiedKeyAndTPS
- (GLTDiversifiedKeyAndTPS)initWithKey:(__SecKey *)a3 trackingPreventionSalt:(id)a4;
- (NSData)trackingPreventionSalt;
- (__SecKey)diversifiedKey;
@end

@implementation GLTDiversifiedKeyAndTPS

- (GLTDiversifiedKeyAndTPS)initWithKey:(__SecKey *)a3 trackingPreventionSalt:(id)a4
{
  id v7 = a4;
  v11.receiver = self;
  v11.super_class = (Class)GLTDiversifiedKeyAndTPS;
  v8 = [(GLTDiversifiedKeyAndTPS *)&v11 init];
  v9 = v8;
  if (v8)
  {
    v8->_diversifiedKey = a3;
    objc_storeStrong((id *)&v8->_trackingPreventionSalt, a4);
  }

  return v9;
}

- (NSData)trackingPreventionSalt
{
  return self->_trackingPreventionSalt;
}

- (__SecKey)diversifiedKey
{
  return self->_diversifiedKey;
}

- (void).cxx_destruct
{
}

@end