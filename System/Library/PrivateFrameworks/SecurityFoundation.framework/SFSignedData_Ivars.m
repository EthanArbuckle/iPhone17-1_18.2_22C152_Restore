@interface SFSignedData_Ivars
@end

@implementation SFSignedData_Ivars

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->signature, 0);
  objc_storeStrong((id *)&self->data, 0);
}

@end