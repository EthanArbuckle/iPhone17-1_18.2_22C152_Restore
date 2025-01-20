@interface SFAuthenticatedCiphertext_Ivars
@end

@implementation SFAuthenticatedCiphertext_Ivars

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->initializationVector, 0);
  objc_storeStrong((id *)&self->authenticationCode, 0);
}

@end