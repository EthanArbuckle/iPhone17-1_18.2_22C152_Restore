@interface TISettingValueDescriptor
+ (id)settingValueDescriptorWithMetricName:(id)a3 settingName:(id)a4;
- (NSString)settingName;
- (TISettingValueDescriptor)initWithMetricName:(id)a3 settingName:(id)a4;
- (void)setSettingName:(id)a3;
@end

@implementation TISettingValueDescriptor

- (void).cxx_destruct
{
}

- (void)setSettingName:(id)a3
{
}

- (NSString)settingName
{
  return (NSString *)objc_getProperty(self, a2, 16, 1);
}

- (TISettingValueDescriptor)initWithMetricName:(id)a3 settingName:(id)a4
{
  id v7 = a4;
  v11.receiver = self;
  v11.super_class = (Class)TISettingValueDescriptor;
  v8 = [(TIMetricDescriptor *)&v11 initWithMetricName:a3];
  v9 = v8;
  if (v8) {
    objc_storeStrong((id *)&v8->_settingName, a4);
  }

  return v9;
}

+ (id)settingValueDescriptorWithMetricName:(id)a3 settingName:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  id v7 = [[TISettingValueDescriptor alloc] initWithMetricName:v6 settingName:v5];

  return v7;
}

@end