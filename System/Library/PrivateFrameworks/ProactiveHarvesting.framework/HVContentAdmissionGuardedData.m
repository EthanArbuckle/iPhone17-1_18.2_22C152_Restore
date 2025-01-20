@interface HVContentAdmissionGuardedData
@end

@implementation HVContentAdmissionGuardedData

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_configurableBundleIdentifierDenyListAsset, 0);
  objc_storeStrong((id *)&self->_observers, 0);
  objc_storeStrong((id *)&self->_configurableBundleIdentifierDenyList, 0);

  objc_storeStrong((id *)&self->_learnFromThisAppBundleIdentifierDenylist, 0);
}

@end