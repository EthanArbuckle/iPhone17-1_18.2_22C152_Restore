@interface PXAssetCollectionDataSourceInfo
- (BOOL)UUIDFilterHidesSomeAssets;
- (BOOL)explicitlyDisableFilters;
- (NSArray)manualOrderUUIDs;
- (NSSet)allowedUUIDs;
- (void)_setExplicitlyDisableFilters:(BOOL)a3;
- (void)_setUUIDFilterHidesSomeAssets:(BOOL)a3;
- (void)setAllowedUUIDs:(id)a3;
- (void)setManualOrderUUIDs:(id)a3;
@end

@implementation PXAssetCollectionDataSourceInfo

- (BOOL)explicitlyDisableFilters
{
  return self->_explicitlyDisableFilters;
}

- (NSSet)allowedUUIDs
{
  return self->_allowedUUIDs;
}

- (void)_setUUIDFilterHidesSomeAssets:(BOOL)a3
{
  self->_UUIDFilterHidesSomeAssets = a3;
}

- (NSArray)manualOrderUUIDs
{
  return self->_manualOrderUUIDs;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_manualOrderUUIDs, 0);
  objc_storeStrong((id *)&self->_allowedUUIDs, 0);
}

- (void)setManualOrderUUIDs:(id)a3
{
}

- (void)setAllowedUUIDs:(id)a3
{
}

- (void)_setExplicitlyDisableFilters:(BOOL)a3
{
  self->_explicitlyDisableFilters = a3;
}

- (BOOL)UUIDFilterHidesSomeAssets
{
  return self->_UUIDFilterHidesSomeAssets;
}

@end