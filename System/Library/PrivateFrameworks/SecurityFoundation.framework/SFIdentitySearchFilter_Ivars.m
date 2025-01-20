@interface SFIdentitySearchFilter_Ivars
@end

@implementation SFIdentitySearchFilter_Ivars

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->keySpecifiers, 0);
  objc_storeStrong((id *)&self->certificateTypes, 0);
  objc_storeStrong((id *)&self->certificateSerialNumbers, 0);
}

@end