@interface _PASAsset2GuardedData
@end

@implementation _PASAsset2GuardedData

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_overrides, 0);
  objc_storeStrong((id *)&self->_bestAvailableAsset, 0);

  objc_storeStrong((id *)&self->_defaultBundlePath, 0);
}

@end