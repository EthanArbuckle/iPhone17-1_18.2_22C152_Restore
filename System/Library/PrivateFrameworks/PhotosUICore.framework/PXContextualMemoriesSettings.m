@interface PXContextualMemoriesSettings
- (CLLocation)location;
- (NSArray)peopleNames;
- (NSArray)settings;
- (NSDate)date;
- (NSDictionary)extraParameters;
- (PXContextualMemoriesLocationSetting)locationSetting;
- (PXContextualMemoriesPeopleSetting)peopleSetting;
- (PXContextualMemoriesSettings)init;
- (PXContextualMemoriesTimeSetting)timeSetting;
- (void)setExtraParameters:(id)a3;
@end

@implementation PXContextualMemoriesSettings

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_settings, 0);
  objc_storeStrong((id *)&self->_peopleSetting, 0);
  objc_storeStrong((id *)&self->_locationSetting, 0);
  objc_storeStrong((id *)&self->_timeSetting, 0);
  objc_storeStrong((id *)&self->_extraParameters, 0);
}

- (NSArray)settings
{
  return self->_settings;
}

- (PXContextualMemoriesPeopleSetting)peopleSetting
{
  return self->_peopleSetting;
}

- (PXContextualMemoriesLocationSetting)locationSetting
{
  return self->_locationSetting;
}

- (PXContextualMemoriesTimeSetting)timeSetting
{
  return self->_timeSetting;
}

- (void)setExtraParameters:(id)a3
{
}

- (NSDictionary)extraParameters
{
  return self->_extraParameters;
}

- (NSArray)peopleNames
{
  v2 = [(PXContextualMemoriesPeopleSetting *)self->_peopleSetting peopleNames];
  v3 = v2;
  if (!v2) {
    v2 = (void *)MEMORY[0x1E4F1CBF0];
  }
  v4 = v2;

  return v4;
}

- (CLLocation)location
{
  return [(PXContextualMemoriesLocationSetting *)self->_locationSetting location];
}

- (NSDate)date
{
  return [(PXContextualMemoriesTimeSetting *)self->_timeSetting date];
}

- (PXContextualMemoriesSettings)init
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  v12.receiver = self;
  v12.super_class = (Class)PXContextualMemoriesSettings;
  v2 = [(PXContextualMemoriesSettings *)&v12 init];
  if (v2)
  {
    v3 = objc_alloc_init(PXContextualMemoriesTimeSetting);
    timeSetting = v2->_timeSetting;
    v2->_timeSetting = v3;

    v5 = objc_alloc_init(PXContextualMemoriesLocationSetting);
    locationSetting = v2->_locationSetting;
    v2->_locationSetting = v5;

    v7 = objc_alloc_init(PXContextualMemoriesPeopleSetting);
    peopleSetting = v2->_peopleSetting;
    v2->_peopleSetting = v7;

    long long v13 = *(_OWORD *)&v2->_timeSetting;
    v14 = v2->_peopleSetting;
    uint64_t v9 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v13 count:3];
    settings = v2->_settings;
    v2->_settings = (NSArray *)v9;
  }
  return v2;
}

@end