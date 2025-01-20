@interface CRLLocale
+ (CRLLocale)currentLocale;
+ (CRLLocale)preferredLocale;
- (BOOL)isEqual:(id)a3;
- (CRLLocale)init;
- (NSLocale)locale;
- (id)languageCode;
- (id)regionCode;
- (void)p_setLocale:(id)a3;
@end

@implementation CRLLocale

+ (CRLLocale)preferredLocale
{
  return +[CRLLocale currentLocale];
}

+ (CRLLocale)currentLocale
{
  v2 = objc_alloc_init(CRLLocale);

  return v2;
}

- (CRLLocale)init
{
  v6.receiver = self;
  v6.super_class = (Class)CRLLocale;
  v2 = [(CRLLocale *)&v6 init];
  if (v2)
  {
    uint64_t v3 = +[NSLocale currentLocale];
    locale = v2->_locale;
    v2->_locale = (NSLocale *)v3;
  }
  return v2;
}

- (id)regionCode
{
  return [(NSLocale *)self->_locale regionCode];
}

- (id)languageCode
{
  return [(NSLocale *)self->_locale languageCode];
}

- (BOOL)isEqual:(id)a3
{
  if (self == a3) {
    return 1;
  }
  id v4 = a3;
  uint64_t v5 = objc_opt_class();
  objc_super v6 = sub_1002469D0(v5, v4);

  if (v6)
  {
    v7 = [(CRLLocale *)self locale];
    v8 = [v6 locale];
    unsigned __int8 v9 = [v7 isEqual:v8];
  }
  else
  {
    unsigned __int8 v9 = 0;
  }

  return v9;
}

- (void)p_setLocale:(id)a3
{
}

- (NSLocale)locale
{
  return (NSLocale *)objc_getProperty(self, a2, 8, 1);
}

- (void).cxx_destruct
{
}

@end