@interface WLKStoreOfferPeriod
- (NSNumber)duration;
- (NSString)type;
- (WLKStoreOfferPeriod)initWithString:(id)a3;
- (id)_offerPeriodForString:(id)a3;
@end

@implementation WLKStoreOfferPeriod

- (WLKStoreOfferPeriod)initWithString:(id)a3
{
  v3 = self;
  v4 = [(WLKStoreOfferPeriod *)self _offerPeriodForString:a3];
  if (v4)
  {
    v14.receiver = v3;
    v14.super_class = (Class)WLKStoreOfferPeriod;
    v5 = [(WLKStoreOfferPeriod *)&v14 init];
    if (v5)
    {
      v6 = [v4 objectForKeyedSubscript:@"duration"];
      uint64_t v7 = [v6 copy];
      duration = v5->_duration;
      v5->_duration = (NSNumber *)v7;

      v9 = [v4 objectForKeyedSubscript:@"type"];
      uint64_t v10 = [v9 copy];
      type = v5->_type;
      v5->_type = (NSString *)v10;
    }
    v3 = v5;
    v12 = v3;
  }
  else
  {
    v12 = 0;
  }

  return v12;
}

- (id)_offerPeriodForString:(id)a3
{
  uint64_t v3 = _offerPeriodForString__onceToken;
  id v4 = a3;
  if (v3 != -1) {
    dispatch_once(&_offerPeriodForString__onceToken, &__block_literal_global_28);
  }
  v5 = [MEMORY[0x1E4F28B88] whitespaceCharacterSet];
  v6 = [v4 stringByTrimmingCharactersInSet:v5];

  uint64_t v7 = [v6 uppercaseString];

  if ((unint64_t)[v7 length] < 3)
  {
    v8 = 0;
  }
  else
  {
    v8 = 0;
    if ([v7 characterAtIndex:0] == 80)
    {
      v9 = [v7 substringFromIndex:1];
      if ((unint64_t)[v9 length] < 2)
      {
        v8 = 0;
      }
      else
      {
        uint64_t v10 = [MEMORY[0x1E4F28FE8] scannerWithString:v9];
        id v18 = 0;
        int v11 = [v10 scanUpToCharactersFromSet:_offerPeriodForString____durationSet intoString:&v18];
        id v12 = v18;
        v13 = v12;
        v8 = 0;
        if (v11)
        {
          if ([v12 isEqualToString:v9])
          {
            v8 = 0;
          }
          else
          {
            objc_super v14 = objc_msgSend(v9, "substringWithRange:", objc_msgSend(v9, "length") - 1, 1);
            v15 = (void *)[objc_alloc(MEMORY[0x1E4F1CA60]) initWithCapacity:2];
            v16 = objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(v13, "integerValue"));
            objc_msgSend(v15, "wlk_setObjectUnlessNil:forKey:", v16, @"duration");
            objc_msgSend(v15, "wlk_setObjectUnlessNil:forKey:", v14, @"type");
            v8 = (void *)[v15 copy];
          }
        }
      }
    }
  }

  return v8;
}

uint64_t __45__WLKStoreOfferPeriod__offerPeriodForString___block_invoke()
{
  _offerPeriodForString____durationSet = [MEMORY[0x1E4F28B88] characterSetWithCharactersInString:@"MDY"];

  return MEMORY[0x1F41817F8]();
}

- (NSString)type
{
  return self->_type;
}

- (NSNumber)duration
{
  return self->_duration;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_duration, 0);

  objc_storeStrong((id *)&self->_type, 0);
}

@end