@interface SFRSASigningOperation_Ivars
@end

@implementation SFRSASigningOperation_Ivars

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->digestOperation, 0);
  objc_storeStrong((id *)&self->keySpecifier, 0);
}

@end