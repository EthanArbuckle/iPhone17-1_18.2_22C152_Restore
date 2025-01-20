@interface SFECDHKeySource_Ivars
@end

@implementation SFECDHKeySource_Ivars

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->remotePublicKey, 0);
  objc_storeStrong((id *)&self->localKeyPair, 0);
}

@end