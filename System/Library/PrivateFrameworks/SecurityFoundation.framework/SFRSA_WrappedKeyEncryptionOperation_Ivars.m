@interface SFRSA_WrappedKeyEncryptionOperation_Ivars
@end

@implementation SFRSA_WrappedKeyEncryptionOperation_Ivars

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->sessionEncryptionOperation, 0);
  objc_storeStrong((id *)&self->keyWrappingOperation, 0);
}

@end