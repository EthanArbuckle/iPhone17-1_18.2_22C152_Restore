@interface SFKeySearchFilter_Ivars
@end

@implementation SFKeySearchFilter_Ivars

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->domains, 0);
  objc_storeStrong((id *)&self->specifiers, 0);
}

@end