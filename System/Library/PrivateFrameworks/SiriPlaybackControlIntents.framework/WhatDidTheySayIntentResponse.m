@interface WhatDidTheySayIntentResponse
- (WhatDidTheySayIntentResponse)init;
- (WhatDidTheySayIntentResponse)initWithBackingStore:(id)a3;
- (WhatDidTheySayIntentResponse)initWithCode:(int64_t)a3 userActivity:(id)a4;
- (WhatDidTheySayIntentResponse)initWithCoder:(id)a3;
- (WhatDidTheySayIntentResponse)initWithPropertiesByName:(id)a3;
- (int64_t)code;
- (void)setCode:(int64_t)a3;
@end

@implementation WhatDidTheySayIntentResponse

- (int64_t)code
{
  return sub_232A4FEEC();
}

- (void)setCode:(int64_t)a3
{
}

- (WhatDidTheySayIntentResponse)initWithCode:(int64_t)a3 userActivity:(id)a4
{
  id v6 = a4;
  return (WhatDidTheySayIntentResponse *)WhatDidTheySayIntentResponse.init(code:userActivity:)(a3, a4);
}

- (WhatDidTheySayIntentResponse)init
{
  return (WhatDidTheySayIntentResponse *)WhatDidTheySayIntentResponse.init()();
}

- (WhatDidTheySayIntentResponse)initWithCoder:(id)a3
{
  return (WhatDidTheySayIntentResponse *)WhatDidTheySayIntentResponse.init(coder:)(a3);
}

- (WhatDidTheySayIntentResponse)initWithBackingStore:(id)a3
{
  id v4 = a3;
  return (WhatDidTheySayIntentResponse *)WhatDidTheySayIntentResponse.init(backingStore:)(a3);
}

- (WhatDidTheySayIntentResponse)initWithPropertiesByName:(id)a3
{
  if (a3) {
    uint64_t v3 = sub_232A684F8();
  }
  else {
    uint64_t v3 = 0;
  }
  return (WhatDidTheySayIntentResponse *)WhatDidTheySayIntentResponse.init(propertiesByName:)(v3);
}

@end