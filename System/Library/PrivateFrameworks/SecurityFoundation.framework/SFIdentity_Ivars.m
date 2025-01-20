@interface SFIdentity_Ivars
@end

@implementation SFIdentity_Ivars

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->attributes, 0);
  objc_storeStrong((id *)&self->certificate, 0);
  objc_storeStrong((id *)&self->keyPair, 0);
  objc_storeStrong((id *)&self->publicKey, 0);
}

@end