@interface SUUIReleaseNote
+ (id)dateFormatter;
- (NSDate)date;
- (NSString)changeNotes;
- (NSString)versionString;
- (SUUIReleaseNote)initWithReleaseNoteDictionary:(id)a3 dateFormatter:(id)a4;
@end

@implementation SUUIReleaseNote

- (SUUIReleaseNote)initWithReleaseNoteDictionary:(id)a3 dateFormatter:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v19.receiver = self;
  v19.super_class = (Class)SUUIReleaseNote;
  v8 = [(SUUIReleaseNote *)&v19 init];
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
  id v2 = objc_alloc_init(MEMORY[0x263F08790]);
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

@end