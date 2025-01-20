@interface WhatDidTheySayIntent
+ (BOOL)shouldSkipDefaultSchemaCheck;
- (WhatDidTheySayIntent)init;
- (WhatDidTheySayIntent)initWithCoder:(id)a3;
- (WhatDidTheySayIntent)initWithDomain:(id)a3 verb:(id)a4 parametersByName:(id)a5;
- (WhatDidTheySayIntent)initWithIdentifier:(id)a3 backingStore:(id)a4;
@end

@implementation WhatDidTheySayIntent

+ (BOOL)shouldSkipDefaultSchemaCheck
{
  return 1;
}

- (WhatDidTheySayIntent)init
{
  return (WhatDidTheySayIntent *)WhatDidTheySayIntent.init()();
}

- (WhatDidTheySayIntent)initWithCoder:(id)a3
{
  return (WhatDidTheySayIntent *)WhatDidTheySayIntent.init(coder:)(a3);
}

- (WhatDidTheySayIntent)initWithIdentifier:(id)a3 backingStore:(id)a4
{
  if (a3)
  {
    uint64_t v5 = sub_232A68588();
    uint64_t v7 = v6;
  }
  else
  {
    uint64_t v5 = 0;
    uint64_t v7 = 0;
  }
  id v8 = a4;
  return (WhatDidTheySayIntent *)WhatDidTheySayIntent.init(identifier:backingStore:)(v5, v7, a4);
}

- (WhatDidTheySayIntent)initWithDomain:(id)a3 verb:(id)a4 parametersByName:(id)a5
{
  if (a5) {
    sub_232A684F8();
  }
  return (WhatDidTheySayIntent *)WhatDidTheySayIntent.init(domain:verb:parametersByName:)();
}

@end