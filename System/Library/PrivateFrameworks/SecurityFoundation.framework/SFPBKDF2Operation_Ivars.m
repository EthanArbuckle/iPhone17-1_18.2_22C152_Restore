@interface SFPBKDF2Operation_Ivars
@end

@implementation SFPBKDF2Operation_Ivars

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->salt, 0);
  objc_storeStrong((id *)&self->pseudoRandomFunction, 0);
}

@end