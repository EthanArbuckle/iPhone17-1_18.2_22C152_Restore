@interface OBUtilities
+ (id)localizedString:(id)a3 forTable:(id)a4 inBundle:(id)a5 forLanguage:(id)a6;
+ (id)stringWithFormat:(id)a3;
@end

@implementation OBUtilities

+ (id)localizedString:(id)a3 forTable:(id)a4 inBundle:(id)a5 forLanguage:(id)a6
{
  v21[1] = *MEMORY[0x1E4F143B8];
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  id v12 = a6;
  if ([v9 length] && objc_msgSend(v10, "length") && objc_msgSend(v12, "length"))
  {
    v13 = (void *)MEMORY[0x1E4F28B50];
    v14 = [v11 localizations];
    v21[0] = v12;
    v15 = [MEMORY[0x1E4F1C978] arrayWithObjects:v21 count:1];
    v16 = [v13 preferredLocalizationsFromArray:v14 forPreferences:v15];
    v17 = [v16 firstObject];

    v18 = [v11 localizedStringForKey:v9 value:0 table:v10 localization:v17];
  }
  else
  {
    v18 = 0;
  }
  if (![v18 length])
  {
    uint64_t v19 = [v11 localizedStringForKey:v9 value:&stru_1EEC28768 table:v10];

    v18 = (void *)v19;
  }

  return v18;
}

+ (id)stringWithFormat:(id)a3
{
  v3 = (objc_class *)NSString;
  id v4 = a3;
  v5 = (void *)[[v3 alloc] initWithFormat:v4 arguments:&v8];

  return v5;
}

@end