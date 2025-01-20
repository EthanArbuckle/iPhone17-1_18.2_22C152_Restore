@interface VKClientLocalizedStrings
- (VKClientLocalizedStrings)initWithStrings:(id)a3 locale:(id)a4;
- (void)getAnnotationTextForChargersAvailable:(unint64_t)a3 total:(unint64_t)a4 text:(id *)a5 locale:(id *)a6;
- (void)getAnnotationTextForChargersNoStatus:(unint64_t)a3 text:(id *)a4 locale:(id *)a5;
- (void)getAnnotationTextForChargersNoneAvailable:(id *)a3 locale:(id *)a4;
- (void)getClusterAnnotationTextForClusterCount:(unint64_t)a3 text:(id *)a4 locale:(id *)a5;
- (void)getTextForKey:(id)a3 text:(id *)a4 locale:(id *)a5;
@end

@implementation VKClientLocalizedStrings

- (VKClientLocalizedStrings)initWithStrings:(id)a3 locale:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v13.receiver = self;
  v13.super_class = (Class)VKClientLocalizedStrings;
  v8 = [(VKClientLocalizedStrings *)&v13 init];
  if (v8)
  {
    uint64_t v9 = [v6 copy];
    stringDictionary = v8->_stringDictionary;
    v8->_stringDictionary = (NSDictionary *)v9;

    objc_storeStrong((id *)&v8->_locale, a4);
    v11 = v8;
  }

  return v8;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_locale, 0);
  objc_storeStrong((id *)&self->_stringDictionary, 0);
}

- (void)getAnnotationTextForChargersNoStatus:(unint64_t)a3 text:(id *)a4 locale:(id *)a5
{
  id v10 = 0;
  [(VKClientLocalizedStrings *)self getTextForKey:&unk_1EF5BB400 text:&v10 locale:0];
  id v9 = v10;
  if (v9)
  {
    objc_msgSend(NSString, "localizedStringWithValidatedFormat:validFormatSpecifiers:error:", v9, @"%lu", 0, a3);
    *a4 = (id)objc_claimAutoreleasedReturnValue();
    if (a5) {
      *a5 = self->_locale;
    }
  }
}

- (void)getAnnotationTextForChargersAvailable:(unint64_t)a3 total:(unint64_t)a4 text:(id *)a5 locale:(id *)a6
{
  id v12 = 0;
  [(VKClientLocalizedStrings *)self getTextForKey:&unk_1EF5BB3E8 text:&v12 locale:0];
  id v11 = v12;
  if (v11)
  {
    objc_msgSend(NSString, "localizedStringWithValidatedFormat:validFormatSpecifiers:error:", v11, @"%1$u%2$lu", 0, a3, a4);
    *a5 = (id)objc_claimAutoreleasedReturnValue();
    if (a6) {
      *a6 = self->_locale;
    }
  }
}

- (void)getAnnotationTextForChargersNoneAvailable:(id *)a3 locale:(id *)a4
{
  id v8 = 0;
  [(VKClientLocalizedStrings *)self getTextForKey:&unk_1EF5BB3D0 text:&v8 locale:0];
  id v7 = v8;
  if (v7)
  {
    objc_msgSend(NSString, "localizedStringWithValidatedFormat:validFormatSpecifiers:error:", v7, @"%d", 0, 0);
    *a3 = (id)objc_claimAutoreleasedReturnValue();
    if (a4) {
      *a4 = self->_locale;
    }
  }
}

- (void)getClusterAnnotationTextForClusterCount:(unint64_t)a3 text:(id *)a4 locale:(id *)a5
{
  if (a3 >= 2)
  {
    int v7 = a3;
    id v10 = 0;
    [(VKClientLocalizedStrings *)self getTextForKey:&unk_1EF5BB3B8 text:&v10 locale:0];
    id v9 = v10;
    if (v9)
    {
      objc_msgSend(NSString, "localizedStringWithValidatedFormat:validFormatSpecifiers:error:", v9, @"%d", 0, (v7 - 1));
      *a4 = (id)objc_claimAutoreleasedReturnValue();
      if (a5) {
        *a5 = self->_locale;
      }
    }
  }
}

- (void)getTextForKey:(id)a3 text:(id *)a4 locale:(id *)a5
{
  id v8 = a3;
  -[NSDictionary objectForKeyedSubscript:](self->_stringDictionary, "objectForKeyedSubscript:");
  *a4 = (id)objc_claimAutoreleasedReturnValue();
  if (a5) {
    *a5 = self->_locale;
  }
}

@end