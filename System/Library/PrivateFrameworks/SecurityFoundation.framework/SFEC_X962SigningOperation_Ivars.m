@interface SFEC_X962SigningOperation_Ivars
@end

@implementation SFEC_X962SigningOperation_Ivars

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->digestOperation, 0);
  objc_storeStrong((id *)&self->keySpecifier, 0);
}

@end