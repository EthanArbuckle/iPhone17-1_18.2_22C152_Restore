@interface SFIdentityAttributes_Ivars
@end

@implementation SFIdentityAttributes_Ivars

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->privateKeyDomain, 0);
  objc_storeStrong((id *)&self->identityName, 0);
  objc_storeStrong((id *)&self->keySpecifier, 0);
  objc_storeStrong((id *)&self->localizedDescription, 0);
  objc_storeStrong((id *)&self->localizedLabel, 0);
}

@end