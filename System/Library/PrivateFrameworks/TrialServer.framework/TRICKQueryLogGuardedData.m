@interface TRICKQueryLogGuardedData
@end

@implementation TRICKQueryLogGuardedData

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->fh, 0);
  objc_storeStrong((id *)&self->uniqueLines, 0);
}

@end