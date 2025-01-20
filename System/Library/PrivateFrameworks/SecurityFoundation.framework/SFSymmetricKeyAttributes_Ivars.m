@interface SFSymmetricKeyAttributes_Ivars
@end

@implementation SFSymmetricKeyAttributes_Ivars

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->keyDomain, 0);
  objc_storeStrong((id *)&self->keySpecifier, 0);
  objc_storeStrong((id *)&self->localizedDescription, 0);
  objc_storeStrong((id *)&self->localizedLabel, 0);
}

@end