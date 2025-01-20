@interface SKUIReleaseNote
+ (id)dateFormatter;
- (NSDate)date;
- (NSString)changeNotes;
- (NSString)versionString;
- (SKUIReleaseNote)initWithReleaseNoteDictionary:(id)a3 dateFormatter:(id)a4;
@end

@implementation SKUIReleaseNote

- (SKUIReleaseNote)initWithReleaseNoteDictionary:(id)a3 dateFormatter:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (os_variant_has_internal_content()
    && _os_feature_enabled_impl()
    && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT))
  {
    -[SKUIReleaseNote initWithReleaseNoteDictionary:dateFormatter:]();
  }
  v19.receiver = self;
  v19.super_class = (Class)SKUIReleaseNote;
  v8 = [(SKUIReleaseNote *)&v19 init];
  if (v8)
  {
    v9 = [v6 objectForKey:@"releaseNotes"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      uint64_t v10 = [v9 copy];
      changeNotes = v8->_changeNotes;
      v8->_changeNotes = (NSString *)v10;
    }
    v12 = [v6 objectForKey:@"versionString"];

    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      uint64_t v13 = [v12 copy];
      versionString = v8->_versionString;
      v8->_versionString = (NSString *)v13;
    }
    v15 = [v6 objectForKey:@"releaseDate"];

    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      uint64_t v16 = [v7 dateFromString:v15];
      date = v8->_date;
      v8->_date = (NSDate *)v16;
    }
  }

  return v8;
}

+ (id)dateFormatter
{
  id v2 = objc_alloc_init(MEMORY[0x1E4F28C10]);
  [v2 setDateFormat:@"yyyy-MM-dd'T'HH:mm:ssZZZZZ"];

  return v2;
}

- (NSString)changeNotes
{
  return self->_changeNotes;
}

- (NSDate)date
{
  return self->_date;
}

- (NSString)versionString
{
  return self->_versionString;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_versionString, 0);
  objc_storeStrong((id *)&self->_date, 0);

  objc_storeStrong((id *)&self->_changeNotes, 0);
}

- (void)initWithReleaseNoteDictionary:dateFormatter:.cold.1()
{
  uint64_t v2 = *MEMORY[0x1E4F143B8];
  int v0 = 136446210;
  v1 = "-[SKUIReleaseNote initWithReleaseNoteDictionary:dateFormatter:]";
}

@end