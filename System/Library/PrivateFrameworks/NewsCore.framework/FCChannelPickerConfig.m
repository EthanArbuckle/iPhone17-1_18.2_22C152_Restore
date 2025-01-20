@interface FCChannelPickerConfig
- (BOOL)showRelatedChannels;
- (FCChannelPickerConfig)initWithPickerID:(id)a3 configDictionary:(id)a4;
- (FCContentColorPair)featureTextColor;
- (NSArray)initialChannelIDs;
- (NSString)buttonTitle;
- (NSString)featureName;
- (NSString)pickerID;
- (NSString)titleText;
@end

@implementation FCChannelPickerConfig

- (FCChannelPickerConfig)initWithPickerID:(id)a3 configDictionary:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v23.receiver = self;
  v23.super_class = (Class)FCChannelPickerConfig;
  v8 = [(FCChannelPickerConfig *)&v23 init];
  if (v8)
  {
    uint64_t v9 = [v6 copy];
    pickerID = v8->_pickerID;
    v8->_pickerID = (NSString *)v9;

    uint64_t v11 = FCAppConfigurationStringValue(v7, @"titleText", 0);
    titleText = v8->_titleText;
    v8->_titleText = (NSString *)v11;

    uint64_t v13 = FCAppConfigurationStringValue(v7, @"featureName", 0);
    featureName = v8->_featureName;
    v8->_featureName = (NSString *)v13;

    uint64_t v15 = FCAppConfigurationStringValue(v7, @"buttonTitle", 0);
    buttonTitle = v8->_buttonTitle;
    v8->_buttonTitle = (NSString *)v15;

    v17 = FCAppConfigurationDictionaryValueWithDefaultValue(v7, @"featureTextColor", 0);
    uint64_t v18 = +[FCContentColorPair colorPairWithDictionary:v17];
    featureTextColor = v8->_featureTextColor;
    v8->_featureTextColor = (FCContentColorPair *)v18;

    v8->_showRelatedChannels = FCAppConfigurationBoolValue(v7, @"showRelatedChannels", 0);
    uint64_t v20 = FCAppConfigurationArrayValueWithDefaultValue(v7, @"initialChannelIDs", 0);
    initialChannelIDs = v8->_initialChannelIDs;
    v8->_initialChannelIDs = (NSArray *)v20;
  }
  return v8;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_initialChannelIDs, 0);
  objc_storeStrong((id *)&self->_featureTextColor, 0);
  objc_storeStrong((id *)&self->_buttonTitle, 0);
  objc_storeStrong((id *)&self->_featureName, 0);
  objc_storeStrong((id *)&self->_titleText, 0);
  objc_storeStrong((id *)&self->_pickerID, 0);
}

- (NSString)pickerID
{
  return self->_pickerID;
}

- (NSString)titleText
{
  return self->_titleText;
}

- (NSString)featureName
{
  return self->_featureName;
}

- (NSString)buttonTitle
{
  return self->_buttonTitle;
}

- (FCContentColorPair)featureTextColor
{
  return self->_featureTextColor;
}

- (NSArray)initialChannelIDs
{
  return self->_initialChannelIDs;
}

- (BOOL)showRelatedChannels
{
  return self->_showRelatedChannels;
}

@end