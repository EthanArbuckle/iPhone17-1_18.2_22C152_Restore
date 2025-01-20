@interface WLKLocale
- (NSLocale)locale;
- (NSString)displayName;
- (WLKLocale)init;
- (WLKLocale)initWithDictionary:(id)a3;
@end

@implementation WLKLocale

- (WLKLocale)init
{
  return [(WLKLocale *)self initWithDictionary:0];
}

- (WLKLocale)initWithDictionary:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    v14.receiver = self;
    v14.super_class = (Class)WLKLocale;
    v5 = [(WLKLocale *)&v14 init];
    if (v5)
    {
      uint64_t v6 = objc_msgSend(v4, "wlk_stringForKey:", @"displayName");
      displayName = v5->_displayName;
      v5->_displayName = (NSString *)v6;

      v8 = objc_msgSend(v4, "wlk_stringForKey:", @"locale");
      if (v8)
      {
        v9 = [MEMORY[0x1E4F1CA20] localeWithLocaleIdentifier:v8];
        uint64_t v10 = [v9 copy];
        locale = v5->_locale;
        v5->_locale = (NSLocale *)v10;
      }
    }
    self = v5;
    v12 = self;
  }
  else
  {
    v12 = 0;
  }

  return v12;
}

- (NSString)displayName
{
  return self->_displayName;
}

- (NSLocale)locale
{
  return self->_locale;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_locale, 0);

  objc_storeStrong((id *)&self->_displayName, 0);
}

@end