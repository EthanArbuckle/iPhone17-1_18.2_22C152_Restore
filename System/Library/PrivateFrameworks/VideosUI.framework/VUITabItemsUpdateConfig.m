@interface VUITabItemsUpdateConfig
- (NSDictionary)eventDescriptors;
- (VUITabItemsUpdateConfig)init;
- (void)setEventDescriptors:(id)a3;
@end

@implementation VUITabItemsUpdateConfig

- (VUITabItemsUpdateConfig)init
{
  v10[2] = *MEMORY[0x1E4F143B8];
  v8.receiver = self;
  v8.super_class = (Class)VUITabItemsUpdateConfig;
  v2 = [(VUITabItemsUpdateConfig *)&v8 init];
  if (v2)
  {
    v3 = (NSDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    v9[0] = @"value";
    v4 = [MEMORY[0x1E4F28ED0] numberWithDouble:28800.0];
    v9[1] = @"animated";
    v10[0] = v4;
    v10[1] = MEMORY[0x1E4F1CC28];
    v5 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v10 forKeys:v9 count:2];
    [(NSDictionary *)v3 setObject:v5 forKey:@"refreshTTL"];

    eventDescriptors = v2->_eventDescriptors;
    v2->_eventDescriptors = v3;
  }
  return v2;
}

- (NSDictionary)eventDescriptors
{
  return self->_eventDescriptors;
}

- (void)setEventDescriptors:(id)a3
{
}

- (void).cxx_destruct
{
}

@end