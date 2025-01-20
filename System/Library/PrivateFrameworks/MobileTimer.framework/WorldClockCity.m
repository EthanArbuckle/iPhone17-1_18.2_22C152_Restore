@interface WorldClockCity
+ (BOOL)isCachedLanguageStaleForProperties:(id)a3;
+ (BOOL)isCachedLanguageStaleForProperties:(id)a3 systemLanguage:(id)a4;
+ (BOOL)isWorldClockCityProperties:(id)a3;
+ (id)unlocalizedExampleCity;
- (ALCity)alCity;
- (BOOL)isEqual:(id)a3;
- (NSDictionary)properties;
- (NSNumber)alCityId;
- (NSString)countryCode;
- (NSString)countryName;
- (NSString)name;
- (NSString)timeZone;
- (NSString)unlocalizedCityName;
- (NSString)unlocalizedCountryName;
- (NSURL)idUrl;
- (WorldClockCity)initWithALCity:(id)a3;
- (WorldClockCity)initWithALCityIdentifier:(int)a3;
- (WorldClockCity)initWithProperties:(id)a3;
- (WorldClockCity)initWithTimeZone:(id)a3 countryCode:(id)a4 name:(id)a5 countryName:(id)a6 unlocalizedName:(id)a7 unlocalizedCountryName:(id)a8;
- (id)description;
- (unint64_t)hash;
@end

@implementation WorldClockCity

+ (BOOL)isCachedLanguageStaleForProperties:(id)a3 systemLanguage:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if ([a1 isWorldClockCityProperties:v6])
  {
    v8 = [v6 objectForKey:@"languageCode"];
    if (v8) {
      int v9 = [v7 isEqualToString:v8] ^ 1;
    }
    else {
      LOBYTE(v9) = 1;
    }
  }
  else
  {
    LOBYTE(v9) = 0;
  }

  return v9;
}

+ (BOOL)isWorldClockCityProperties:(id)a3
{
  v3 = [a3 objectForKey:@"type"];
  BOOL v4 = [v3 integerValue] == 2 || objc_msgSend(v3, "integerValue") == 1;

  return v4;
}

- (WorldClockCity)initWithProperties:(id)a3
{
  id v4 = a3;
  v24.receiver = self;
  v24.super_class = (Class)WorldClockCity;
  v5 = [(WorldClockCity *)&v24 init];
  if (v5)
  {
    id v6 = [v4 objectForKey:@"type"];
    id v7 = [v4 objectForKey:@"city"];
    int v8 = [v6 intValue];
    if (v8 == 2)
    {
      uint64_t v21 = [objc_alloc(MEMORY[0x1E4F4BE30]) initWithProperties:v7];
      alCity = v5->_alCity;
      v5->_alCity = (ALCity *)v21;
    }
    else
    {
      if (v8 != 1)
      {
LABEL_7:
        v22 = v5;

        goto LABEL_8;
      }
      uint64_t v9 = [v7 objectForKey:@"timeZone"];
      timeZone = v5->_timeZone;
      v5->_timeZone = (NSString *)v9;

      uint64_t v11 = [v7 objectForKey:@"countryCode"];
      countryCode = v5->_countryCode;
      v5->_countryCode = (NSString *)v11;

      uint64_t v13 = [v7 objectForKey:@"name"];
      name = v5->_name;
      v5->_name = (NSString *)v13;

      uint64_t v15 = [v7 objectForKey:@"countryName"];
      countryName = v5->_countryName;
      v5->_countryName = (NSString *)v15;

      uint64_t v17 = [v7 objectForKey:@"unlocalizedName"];
      unlocalizedName = v5->_unlocalizedName;
      v5->_unlocalizedName = (NSString *)v17;

      uint64_t v19 = [v7 objectForKey:@"unlocalizedCountryName"];
      alCity = v5->_unlocalizedCountryName;
      v5->_unlocalizedCountryName = (NSString *)v19;
    }

    goto LABEL_7;
  }
LABEL_8:

  return v5;
}

+ (BOOL)isCachedLanguageStaleForProperties:(id)a3
{
  id v4 = (void *)MEMORY[0x1E4F1CA20];
  id v5 = a3;
  id v6 = [v4 currentLocale];
  id v7 = [v6 objectForKey:*MEMORY[0x1E4F1C438]];

  LOBYTE(a1) = [a1 isCachedLanguageStaleForProperties:v5 systemLanguage:v7];
  return (char)a1;
}

+ (id)unlocalizedExampleCity
{
  v2 = [[WorldClockCity alloc] initWithTimeZone:@"America/Los_Angeles" countryCode:@"US" name:@"Cupertino" countryName:@"USA" unlocalizedName:@"Cupertino" unlocalizedCountryName:@"USA"];
  return v2;
}

- (WorldClockCity)initWithALCity:(id)a3
{
  id v5 = a3;
  v10.receiver = self;
  v10.super_class = (Class)WorldClockCity;
  id v6 = [(WorldClockCity *)&v10 init];
  id v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_alCity, a3);
    int v8 = v7;
  }

  return v7;
}

- (WorldClockCity)initWithALCityIdentifier:(int)a3
{
  uint64_t v3 = *(void *)&a3;
  v13.receiver = self;
  v13.super_class = (Class)WorldClockCity;
  id v4 = [(WorldClockCity *)&v13 init];
  if (v4)
  {
    id v5 = objc_msgSend([NSString alloc], "initWithFormat:", @"%d", v3);
    id v6 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1C978]), "initWithObjects:", v5, 0);
    id v7 = [MEMORY[0x1E4F4BE38] sharedManager];
    int v8 = [v7 citiesWithIdentifiers:v6];

    uint64_t v9 = [v8 objectAtIndex:0];
    alCity = v4->_alCity;
    v4->_alCity = (ALCity *)v9;

    uint64_t v11 = v4;
  }

  return v4;
}

- (WorldClockCity)initWithTimeZone:(id)a3 countryCode:(id)a4 name:(id)a5 countryName:(id)a6 unlocalizedName:(id)a7 unlocalizedCountryName:(id)a8
{
  id v24 = a3;
  id v23 = a4;
  id v22 = a5;
  id v15 = a6;
  id v16 = a7;
  id v17 = a8;
  v25.receiver = self;
  v25.super_class = (Class)WorldClockCity;
  v18 = [(WorldClockCity *)&v25 init];
  uint64_t v19 = v18;
  if (v18)
  {
    objc_storeStrong((id *)&v18->_timeZone, a3);
    objc_storeStrong((id *)&v19->_countryCode, a4);
    objc_storeStrong((id *)&v19->_name, a5);
    objc_storeStrong((id *)&v19->_countryName, a6);
    objc_storeStrong((id *)&v19->_unlocalizedName, a7);
    objc_storeStrong((id *)&v19->_unlocalizedCountryName, a8);
    v20 = v19;
  }

  return v19;
}

- (id)description
{
  uint64_t v3 = NSString;
  if (self->_alCity)
  {
    v9.receiver = self;
    v9.super_class = (Class)WorldClockCity;
    id v4 = [(WorldClockCity *)&v9 description];
    id v5 = [(ALCity *)self->_alCity description];
    id v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];
  }
  else
  {
    v8.receiver = self;
    v8.super_class = (Class)WorldClockCity;
    id v4 = [(WorldClockCity *)&v8 description];
    id v6 = [v3 stringWithFormat:@"%@ %@, %@ || %@ %@ || %@, %@", v4, self->_name, self->_countryName, self->_timeZone, self->_countryCode, self->_unlocalizedName, self->_unlocalizedCountryName];
  }

  return v6;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if ([v4 isMemberOfClass:objc_opt_class()])
  {
    id v5 = v4;
    alCity = self->_alCity;
    uint64_t v7 = v5[1];
    if (alCity)
    {
      if (v7)
      {
        char v8 = -[ALCity isEqual:](alCity, "isEqual:");
LABEL_5:
        BOOL v9 = v8;
LABEL_9:

        goto LABEL_10;
      }
LABEL_8:
      BOOL v9 = 0;
      goto LABEL_9;
    }
    if (v7) {
      goto LABEL_8;
    }
    timeZone = self->_timeZone;
    if (timeZone != (NSString *)v5[2] && !-[NSString isEqualToString:](timeZone, "isEqualToString:")) {
      goto LABEL_8;
    }
    countryCode = self->_countryCode;
    if (countryCode != (NSString *)v5[5] && !-[NSString isEqualToString:](countryCode, "isEqualToString:")) {
      goto LABEL_8;
    }
    unlocalizedName = self->_unlocalizedName;
    if (unlocalizedName != (NSString *)v5[6])
    {
      if (!-[NSString isEqualToString:](unlocalizedName, "isEqualToString:")) {
        goto LABEL_8;
      }
      unlocalizedName = self->_unlocalizedName;
    }
    if (unlocalizedName || (name = self->_name, name == (NSString *)v5[3]))
    {
      BOOL v9 = 1;
      goto LABEL_9;
    }
    char v8 = -[NSString isEqualToString:](name, "isEqualToString:");
    goto LABEL_5;
  }
  BOOL v9 = 0;
LABEL_10:

  return v9;
}

- (unint64_t)hash
{
  alCity = (NSString *)self->_alCity;
  if (alCity || (alCity = self->_unlocalizedName) != 0) {
    name = alCity;
  }
  else {
    name = self->_name;
  }
  return [(NSString *)name hash];
}

- (NSDictionary)properties
{
  uint64_t v3 = (void *)[objc_alloc(MEMORY[0x1E4F1CA60]) initWithCapacity:3];
  alCity = self->_alCity;
  id v5 = objc_alloc(MEMORY[0x1E4F28ED0]);
  if (alCity)
  {
    id v6 = (void *)[v5 initWithInt:2];
    [v3 setObject:v6 forKey:@"type"];
    uint64_t v7 = [(ALCity *)self->_alCity properties];
    [v3 setObject:v7 forKey:@"city"];

    char v8 = [MEMORY[0x1E4F1CA20] currentLocale];
    BOOL v9 = [v8 objectForKey:*MEMORY[0x1E4F1C438]];

    objc_super v10 = @"languageCode";
  }
  else
  {
    id v6 = (void *)[v5 initWithInt:1];
    BOOL v9 = (void *)[objc_alloc(MEMORY[0x1E4F1CA60]) initWithCapacity:6];
    [v9 setObject:self->_timeZone forKey:@"timeZone"];
    [v9 setObject:self->_countryCode forKey:@"countryCode"];
    [v9 setObject:self->_name forKey:@"name"];
    [v9 setObject:self->_countryName forKey:@"countryName"];
    if (self->_unlocalizedName) {
      unlocalizedName = (__CFString *)self->_unlocalizedName;
    }
    else {
      unlocalizedName = &stru_1EEDE16C8;
    }
    [v9 setObject:unlocalizedName forKey:@"unlocalizedName"];
    if (self->_unlocalizedCountryName) {
      unlocalizedCountryName = (__CFString *)self->_unlocalizedCountryName;
    }
    else {
      unlocalizedCountryName = &stru_1EEDE16C8;
    }
    [v9 setObject:unlocalizedCountryName forKey:@"unlocalizedCountryName"];
    [v3 setObject:v6 forKey:@"type"];
    objc_super v10 = @"city";
  }
  [v3 setObject:v9 forKey:v10];

  return (NSDictionary *)v3;
}

- (NSNumber)alCityId
{
  alCity = self->_alCity;
  if (alCity)
  {
    alCity = objc_msgSend(MEMORY[0x1E4F28ED0], "numberWithInt:", objc_msgSend(alCity, "identifier"));
  }
  return (NSNumber *)alCity;
}

- (NSString)timeZone
{
  alCity = self->_alCity;
  if (alCity)
  {
    id v4 = [(ALCity *)alCity timeZone];
  }
  else
  {
    id v4 = self->_timeZone;
  }
  return v4;
}

- (NSString)name
{
  alCity = self->_alCity;
  if (alCity)
  {
    id v4 = [(ALCity *)alCity name];
  }
  else
  {
    id v4 = self->_name;
  }
  return v4;
}

- (NSString)countryName
{
  alCity = self->_alCity;
  if (alCity)
  {
    id v4 = [(ALCity *)alCity countryName];
  }
  else
  {
    id v4 = self->_countryName;
  }
  return v4;
}

- (NSString)unlocalizedCityName
{
  alCity = self->_alCity;
  if (alCity)
  {
    id v4 = [(ALCity *)alCity unlocalizedName];
  }
  else
  {
    id v4 = self->_unlocalizedName;
  }
  return v4;
}

- (NSString)unlocalizedCountryName
{
  alCity = self->_alCity;
  if (alCity)
  {
    id v4 = [(ALCity *)alCity unlocalizedCountryName];
  }
  else
  {
    id v4 = self->_unlocalizedCountryName;
  }
  return v4;
}

- (NSString)countryCode
{
  alCity = self->_alCity;
  if (alCity)
  {
    id v4 = [(ALCity *)alCity localeCode];
  }
  else
  {
    id v4 = self->_countryCode;
  }
  return v4;
}

- (NSURL)idUrl
{
  uint64_t v3 = (void *)[objc_alloc(MEMORY[0x1E4F28E78]) initWithString:@"x-apple-clock:world-clock?"];
  alCity = self->_alCity;
  if (alCity)
  {
    objc_msgSend(v3, "appendFormat:", @"alcid=%d", -[ALCity identifier](alCity, "identifier"));
  }
  else
  {
    [v3 appendString:@"ccid="];
    [v3 appendString:self->_timeZone];
    [v3 appendString:@"$"];
    [v3 appendString:self->_countryCode];
    [v3 appendString:@"$"];
    unlocalizedName = self->_unlocalizedName;
    if (!unlocalizedName) {
      unlocalizedName = self->_name;
    }
    [v3 appendString:unlocalizedName];
  }
  id v6 = (void *)[objc_alloc(MEMORY[0x1E4F1CB10]) initWithString:v3];

  return (NSURL *)v6;
}

- (ALCity)alCity
{
  return self->_alCity;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_unlocalizedCountryName, 0);
  objc_storeStrong((id *)&self->_unlocalizedName, 0);
  objc_storeStrong((id *)&self->_countryCode, 0);
  objc_storeStrong((id *)&self->_countryName, 0);
  objc_storeStrong((id *)&self->_name, 0);
  objc_storeStrong((id *)&self->_timeZone, 0);
  objc_storeStrong((id *)&self->_alCity, 0);
}

@end