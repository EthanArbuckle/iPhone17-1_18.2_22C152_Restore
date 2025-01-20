@interface MKImportAnalytics
+ (void)initialize;
- (MKImportAnalytics)initWithContentType:(int64_t)a3;
- (void)complete:(BOOL)a3;
- (void)send:(id)a3;
- (void)send:(id)a3 extension:(id)a4;
@end

@implementation MKImportAnalytics

+ (void)initialize
{
  v5[15] = *MEMORY[0x263EF8340];
  v4[0] = &unk_26DF7AC68;
  v4[1] = &unk_26DF7AC80;
  v5[0] = @"account";
  v5[1] = @"application";
  v4[2] = &unk_26DF7AC98;
  v4[3] = &unk_26DF7ACB0;
  v5[2] = @"bookmark";
  v5[3] = @"calendar";
  v4[4] = &unk_26DF7ACC8;
  v4[5] = &unk_26DF7ACE0;
  v5[4] = @"contact";
  v5[5] = @"container";
  v4[6] = &unk_26DF7ACF8;
  v4[7] = &unk_26DF7AD10;
  v5[6] = @"file";
  v5[7] = @"message";
  v4[8] = &unk_26DF7AD28;
  v4[9] = &unk_26DF7AD40;
  v5[8] = @"placeholder";
  v5[9] = @"accessibility_setting";
  v4[10] = &unk_26DF7AD58;
  v4[11] = &unk_26DF7AD70;
  v5[10] = @"display_setting";
  v5[11] = @"image";
  v4[12] = &unk_26DF7AD88;
  v4[13] = &unk_26DF7ADA0;
  v5[12] = @"video";
  v5[13] = @"photo_album";
  v4[14] = &unk_26DF7ADB8;
  v5[14] = @"sim";
  uint64_t v2 = [NSDictionary dictionaryWithObjects:v5 forKeys:v4 count:15];
  v3 = (void *)contentTypes;
  contentTypes = v2;
}

- (MKImportAnalytics)initWithContentType:(int64_t)a3
{
  v10.receiver = self;
  v10.super_class = (Class)MKImportAnalytics;
  v4 = [(MKImportAnalytics *)&v10 init];
  if (v4)
  {
    v5 = (void *)contentTypes;
    v6 = [NSNumber numberWithInteger:a3];
    uint64_t v7 = [v5 objectForKeyedSubscript:v6];
    contentType = v4->_contentType;
    v4->_contentType = (NSString *)v7;
  }
  return v4;
}

- (void)complete:(BOOL)a3
{
  BOOL v3 = a3;
  v4 = [NSString stringWithFormat:@"%@.import", self->_contentType];
  v5 = @"-1";
  if (v3) {
    v5 = @"0";
  }
  v8 = v4;
  v9 = v5;
  v6 = v9;
  id v7 = v4;
  AnalyticsSendEventLazy();
}

id __30__MKImportAnalytics_complete___block_invoke(uint64_t a1)
{
  v5[2] = *MEMORY[0x263EF8340];
  v4[0] = @"type";
  v4[1] = @"code";
  uint64_t v1 = *(void *)(a1 + 40);
  v5[0] = *(void *)(a1 + 32);
  v5[1] = v1;
  uint64_t v2 = [NSDictionary dictionaryWithObjects:v5 forKeys:v4 count:2];
  return v2;
}

- (void)send:(id)a3
{
  BOOL v3 = NSString;
  contentType = self->_contentType;
  v5 = (__CFString *)a3;
  v6 = [v3 stringWithFormat:@"%@.import.error.code", contentType];
  id v7 = @"unknown";
  if (v5) {
    id v7 = v5;
  }
  v8 = v7;

  v11 = v6;
  v9 = v8;
  id v10 = v6;
  AnalyticsSendEventLazy();
}

id __26__MKImportAnalytics_send___block_invoke(uint64_t a1)
{
  v5[2] = *MEMORY[0x263EF8340];
  v4[0] = @"type";
  v4[1] = @"code";
  uint64_t v1 = *(void *)(a1 + 40);
  v5[0] = *(void *)(a1 + 32);
  v5[1] = v1;
  uint64_t v2 = [NSDictionary dictionaryWithObjects:v5 forKeys:v4 count:2];
  return v2;
}

- (void)send:(id)a3 extension:(id)a4
{
  v6 = (__CFString *)a3;
  id v7 = (__CFString *)a4;
  if (![(__CFString *)v6 length])
  {

    v6 = @"unknown";
  }
  if (![(__CFString *)v7 length])
  {

    id v7 = @"unknown";
  }
  v11 = [NSString stringWithFormat:@"%@.import.error.format", self->_contentType];
  v12 = v6;
  v13 = v7;
  v8 = v7;
  v9 = v6;
  id v10 = v11;
  AnalyticsSendEventLazy();
}

id __36__MKImportAnalytics_send_extension___block_invoke(uint64_t a1)
{
  uint64_t v7 = *MEMORY[0x263EF8340];
  long long v1 = *(_OWORD *)(a1 + 32);
  v4[0] = @"type";
  v4[1] = @"format";
  long long v5 = v1;
  void v4[2] = @"extension";
  uint64_t v6 = *(void *)(a1 + 48);
  uint64_t v2 = [NSDictionary dictionaryWithObjects:&v5 forKeys:v4 count:3];
  return v2;
}

- (void).cxx_destruct
{
}

@end