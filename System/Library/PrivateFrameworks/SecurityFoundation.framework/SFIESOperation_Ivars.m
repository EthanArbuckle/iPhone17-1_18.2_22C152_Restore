@interface SFIESOperation_Ivars
@end

@implementation SFIESOperation_Ivars

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->digestOperation, 0);
  objc_storeStrong((id *)&self->encryptionOperation, 0);
  objc_storeStrong((id *)&self->diffieHellmanOperation, 0);
}

@end