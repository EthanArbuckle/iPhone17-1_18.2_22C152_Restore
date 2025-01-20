@interface AXPhoenixAnalyticsEvent
+ (BOOL)supportsSecureCoding;
- (AXPhoenixAnalyticsEvent)init;
- (AXPhoenixAnalyticsEvent)initWithCoder:(id)a3;
- (AXPhoenixAnalyticsEvent)initWithEventType:(int64_t)a3 eventInfo:(id)a4;
- (NSDictionary)eventInfo;
- (id)_jsonData;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (int64_t)eventType;
- (void)encodeWithCoder:(id)a3;
- (void)setEventInfo:(id)a3;
- (void)setEventType:(int64_t)a3;
@end

@implementation AXPhoenixAnalyticsEvent

- (AXPhoenixAnalyticsEvent)init
{
  id location = self;
  objc_storeStrong(&location, 0);
  return 0;
}

- (AXPhoenixAnalyticsEvent)initWithEventType:(int64_t)a3 eventInfo:(id)a4
{
  v11 = self;
  SEL v10 = a2;
  int64_t v9 = a3;
  id location = 0;
  objc_storeStrong(&location, a4);
  v4 = v11;
  v11 = 0;
  v7.receiver = v4;
  v7.super_class = (Class)AXPhoenixAnalyticsEvent;
  v11 = [(AXPhoenixAnalyticsEvent *)&v7 init];
  objc_storeStrong((id *)&v11, v11);
  if (v11)
  {
    v11->_eventType = v9;
    objc_storeStrong((id *)&v11->_eventInfo, location);
  }
  v6 = v11;
  objc_storeStrong(&location, 0);
  objc_storeStrong((id *)&v11, 0);
  return v6;
}

- (id)description
{
  id v3 = [NSString alloc];
  id v4 = [(AXPhoenixAnalyticsEvent *)self _jsonData];
  id v5 = (id)objc_msgSend(v3, "initWithData:encoding:");

  return v5;
}

- (id)copyWithZone:(_NSZone *)a3
{
  return self;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  [location[0] encodeInteger:v4->_eventType forKey:@"_eventType"];
  [location[0] encodeObject:v4->_eventInfo forKey:@"_eventInfo"];
  objc_storeStrong(location, 0);
}

- (AXPhoenixAnalyticsEvent)initWithCoder:(id)a3
{
  v17[3] = *MEMORY[0x263EF8340];
  v16 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v3 = v16;
  int64_t eventType = v16->_eventType;
  eventInfo = v16->_eventInfo;
  v16 = 0;
  v16 = [(AXPhoenixAnalyticsEvent *)v3 initWithEventType:eventType eventInfo:eventInfo];
  objc_storeStrong((id *)&v16, v16);
  if (v16)
  {
    uint64_t v6 = [location[0] decodeIntegerForKey:@"_eventType"];
    v16->_int64_t eventType = v6;
    id v12 = location[0];
    v11 = (void *)MEMORY[0x263EFFA08];
    v17[0] = objc_opt_class();
    v17[1] = objc_opt_class();
    v17[2] = objc_opt_class();
    id v14 = (id)[MEMORY[0x263EFF8C0] arrayWithObjects:v17 count:3];
    id v13 = (id)objc_msgSend(v11, "setWithArray:");
    objc_super v7 = (NSDictionary *)(id)objc_msgSend(v12, "decodeObjectOfClasses:forKey:");
    v8 = v16->_eventInfo;
    v16->_eventInfo = v7;
  }
  SEL v10 = v16;
  objc_storeStrong(location, 0);
  objc_storeStrong((id *)&v16, 0);
  return v10;
}

- (id)_jsonData
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  id v13 = self;
  location[1] = (id)a2;
  if ([MEMORY[0x263F08900] isValidJSONObject:self->_eventInfo])
  {
    id v10 = 0;
    id v9 = 0;
    eventInfo = v13->_eventInfo;
    id v8 = 0;
    id v6 = (id)[MEMORY[0x263F08900] dataWithJSONObject:eventInfo options:0 error:&v8];
    objc_storeStrong(&v10, v8);
    id v3 = v9;
    id v9 = v6;

    if (v10)
    {
      os_log_t oslog = (os_log_t)(id)AXLogBackTap();
      if (os_log_type_enabled(oslog, OS_LOG_TYPE_ERROR))
      {
        __os_log_helper_16_2_3_8_32_8_64_8_64((uint64_t)v15, (uint64_t)"-[AXPhoenixAnalyticsEvent _jsonData]", (uint64_t)v13->_eventInfo, (uint64_t)v10);
        _os_log_error_impl(&dword_2372C8000, oslog, OS_LOG_TYPE_ERROR, "[PHOENIX] %s Failed to serialize context %@ to JSON due to error %@.", v15, 0x20u);
      }
      objc_storeStrong((id *)&oslog, 0);
      objc_storeStrong(&v9, 0);
    }
    id v14 = v9;
    objc_storeStrong(&v9, 0);
    objc_storeStrong(&v10, 0);
  }
  else
  {
    location[0] = (id)AXLogBackTap();
    os_log_type_t v11 = OS_LOG_TYPE_ERROR;
    if (os_log_type_enabled((os_log_t)location[0], OS_LOG_TYPE_ERROR))
    {
      __os_log_helper_16_2_2_8_32_8_64((uint64_t)v16, (uint64_t)"-[AXPhoenixAnalyticsEvent _jsonData]", (uint64_t)v13->_eventInfo);
      _os_log_error_impl(&dword_2372C8000, (os_log_t)location[0], v11, "[PHOENIX] %s EventInfo is not valid json: %@", v16, 0x16u);
    }
    objc_storeStrong(location, 0);
    id v14 = 0;
  }
  id v4 = v14;
  return v4;
}

- (int64_t)eventType
{
  return self->_eventType;
}

- (void)setEventType:(int64_t)a3
{
  self->_int64_t eventType = a3;
}

- (NSDictionary)eventInfo
{
  return self->_eventInfo;
}

- (void)setEventInfo:(id)a3
{
}

- (void).cxx_destruct
{
}

@end