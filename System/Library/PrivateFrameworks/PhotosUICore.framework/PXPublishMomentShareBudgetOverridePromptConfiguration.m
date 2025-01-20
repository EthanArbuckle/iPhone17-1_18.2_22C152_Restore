@interface PXPublishMomentShareBudgetOverridePromptConfiguration
- (BOOL)useWLAN;
- (NSString)deviceModel;
- (PXPublishMomentShareBudgetOverridePromptConfiguration)initWithUseWLAN:(BOOL)a3 networkType:(unint64_t)a4 assetCount:(unint64_t)a5 deviceModel:(id)a6;
- (unint64_t)assetCount;
- (unint64_t)networkType;
- (void)setAssetCount:(unint64_t)a3;
- (void)setDeviceModel:(id)a3;
- (void)setNetworkType:(unint64_t)a3;
- (void)setUseWLAN:(BOOL)a3;
@end

@implementation PXPublishMomentShareBudgetOverridePromptConfiguration

- (void).cxx_destruct
{
}

- (void)setDeviceModel:(id)a3
{
}

- (NSString)deviceModel
{
  return self->_deviceModel;
}

- (void)setAssetCount:(unint64_t)a3
{
  self->_assetCount = a3;
}

- (unint64_t)assetCount
{
  return self->_assetCount;
}

- (void)setNetworkType:(unint64_t)a3
{
  self->_networkType = a3;
}

- (unint64_t)networkType
{
  return self->_networkType;
}

- (void)setUseWLAN:(BOOL)a3
{
  self->_useWLAN = a3;
}

- (BOOL)useWLAN
{
  return self->_useWLAN;
}

- (PXPublishMomentShareBudgetOverridePromptConfiguration)initWithUseWLAN:(BOOL)a3 networkType:(unint64_t)a4 assetCount:(unint64_t)a5 deviceModel:(id)a6
{
  id v10 = a6;
  v16.receiver = self;
  v16.super_class = (Class)PXPublishMomentShareBudgetOverridePromptConfiguration;
  v11 = [(PXPublishMomentShareBudgetOverridePromptConfiguration *)&v16 init];
  v12 = v11;
  if (v11)
  {
    v11->_useWLAN = a3;
    v11->_networkType = a4;
    v11->_assetCount = a5;
    uint64_t v13 = [v10 copy];
    deviceModel = v12->_deviceModel;
    v12->_deviceModel = (NSString *)v13;
  }
  return v12;
}

@end