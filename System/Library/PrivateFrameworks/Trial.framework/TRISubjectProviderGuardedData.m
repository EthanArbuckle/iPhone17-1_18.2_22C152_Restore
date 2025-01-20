@interface TRISubjectProviderGuardedData
@end

@implementation TRISubjectProviderGuardedData

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->tempDeviceIds, 0);
  objc_storeStrong((id *)&self->nextRotationDate, 0);
  objc_storeStrong((id *)&self->subject, 0);
}

@end