@interface SFX963KeyDerivationOperation_Ivars
@end

@implementation SFX963KeyDerivationOperation_Ivars

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->digestOperation, 0);
  objc_storeStrong((id *)&self->sharedSecretOperation, 0);
}

@end