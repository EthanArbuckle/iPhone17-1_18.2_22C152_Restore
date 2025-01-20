@interface SFIESCiphertext_Ivars
@end

@implementation SFIESCiphertext_Ivars

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->authenticationCode, 0);
  objc_storeStrong((id *)&self->ephemeralSenderPublicKey, 0);
}

@end