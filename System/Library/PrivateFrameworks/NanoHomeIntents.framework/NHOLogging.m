@interface NHOLogging
- (NHOLogging)init;
- (id)logForCategory:(unint64_t)a3;
@end

@implementation NHOLogging

- (NHOLogging)init
{
  v9[9] = *MEMORY[0x263EF8340];
  v7.receiver = self;
  v7.super_class = (Class)NHOLogging;
  v2 = [(NHOLogging *)&v7 init];
  v3 = v2;
  if (v2)
  {
    v2->_lock._os_unfair_lock_opaque = 0;
    v8[0] = &unk_27064C0C0;
    v8[1] = &unk_27064C0D8;
    v9[0] = @"general";
    v9[1] = @"home";
    v8[2] = &unk_27064C0F0;
    v8[3] = &unk_27064C108;
    v9[2] = @"notification";
    v9[3] = @"radar76496236";
    v8[4] = &unk_27064C120;
    v8[5] = &unk_27064C138;
    v9[4] = @"invitation";
    v9[5] = @"onboarding";
    v8[6] = &unk_27064C150;
    v8[7] = &unk_27064C168;
    v9[6] = @"settings";
    v9[7] = @"contacts";
    v8[8] = &unk_27064C180;
    v9[8] = @"camera";
    uint64_t v4 = [NSDictionary dictionaryWithObjects:v9 forKeys:v8 count:9];
    categoryMap = v3->_categoryMap;
    v3->_categoryMap = (NSDictionary *)v4;
  }
  return v3;
}

- (id)logForCategory:(unint64_t)a3
{
  if (a3 < 9)
  {
    p_lock = &self->_lock;
    os_unfair_lock_lock(&self->_lock);
    v8 = [NSNumber numberWithUnsignedInteger:a3];
    v3 = [(NSMutableDictionary *)self->_logs objectForKeyedSubscript:v8];
    if (!v3)
    {
      id v9 = [(NSDictionary *)self->_categoryMap objectForKeyedSubscript:v8];
      v3 = os_log_create("com.apple.NanoHome", (const char *)[v9 cStringUsingEncoding:4]);
      [(NSMutableDictionary *)self->_logs setObject:v3 forKeyedSubscript:v8];
    }
    os_unfair_lock_unlock(p_lock);
  }
  else
  {
    v3 = (void *)&_os_log_internal;
    id v4 = &_os_log_internal;
  }

  return v3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_logs, 0);

  objc_storeStrong((id *)&self->_categoryMap, 0);
}

@end