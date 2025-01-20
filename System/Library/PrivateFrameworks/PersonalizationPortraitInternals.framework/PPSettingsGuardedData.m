@interface PPSettingsGuardedData
@end

@implementation PPSettingsGuardedData

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_abGroupOverride, 0);
  objc_storeStrong((id *)&self->_entitiesMappingTrieSha256, 0);
  objc_storeStrong((id *)&self->_entitiesBackfillTimestamp, 0);
  objc_storeStrong((id *)&self->_queryPlanLoggingChangeHandlers, 0);
  objc_storeStrong((id *)&self->_donationDisabledChangeHandlers, 0);
  objc_storeStrong((id *)&self->_cloudKitDisabledBundleIdentifiers, 0);
  objc_storeStrong((id *)&self->_donationDisabledBundleIdentifiers, 0);
}

@end