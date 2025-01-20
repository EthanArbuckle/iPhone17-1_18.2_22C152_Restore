@interface TVRCPerson
+ (id)personWithDictionary:(id)a3;
- (CGSize)imageSize;
- (NSDate)birthDate;
- (NSDate)deathDate;
- (NSString)bio;
- (NSString)birthplace;
- (NSString)identifier;
- (NSString)imageURLTemplate;
- (NSString)name;
- (NSURL)url;
- (TVRCPerson)initWithDictionary:(id)a3;
- (id)_dateFromNumber:(id)a3;
- (id)_formattedDateWithDate:(id)a3;
- (id)_urlFromString:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)formattedAge;
- (id)formattedBirthDate;
- (id)formattedDeathDate;
@end

@implementation TVRCPerson

- (TVRCPerson)initWithDictionary:(id)a3
{
  id v4 = a3;
  v35.receiver = self;
  v35.super_class = (Class)TVRCPerson;
  v5 = [(TVRCPerson *)&v35 init];
  if (v5)
  {
    v6 = [v4 objectForKeyedSubscript:@"images"];
    v7 = [v6 objectForKeyedSubscript:@"headshot"];

    uint64_t v8 = [v4 objectForKeyedSubscript:@"id"];
    identifier = v5->_identifier;
    v5->_identifier = (NSString *)v8;

    uint64_t v10 = [v4 objectForKeyedSubscript:@"title"];
    name = v5->_name;
    v5->_name = (NSString *)v10;

    uint64_t v12 = [v4 objectForKeyedSubscript:@"bio"];
    bio = v5->_bio;
    v5->_bio = (NSString *)v12;

    uint64_t v14 = [v7 objectForKeyedSubscript:@"url"];
    imageURLTemplate = v5->_imageURLTemplate;
    v5->_imageURLTemplate = (NSString *)v14;

    v16 = [v7 objectForKeyedSubscript:@"height"];
    v17 = [v7 objectForKeyedSubscript:@"width"];
    objc_opt_class();
    double v18 = 1000.0;
    if (objc_opt_isKindOfClass())
    {
      objc_opt_class();
      char isKindOfClass = objc_opt_isKindOfClass();
      double v20 = 1000.0;
      if (isKindOfClass)
      {
        objc_msgSend(v17, "floatValue", 1000.0);
        double v18 = v21;
        [v16 floatValue];
        double v20 = v22;
      }
    }
    else
    {
      double v20 = 1000.0;
    }
    v5->_imageSize.width = v18;
    v5->_imageSize.height = v20;

    uint64_t v23 = [v4 objectForKeyedSubscript:@"birthplace"];
    birthplace = v5->_birthplace;
    v5->_birthplace = (NSString *)v23;

    v25 = [v4 objectForKeyedSubscript:@"birthDate"];
    uint64_t v26 = [(TVRCPerson *)v5 _dateFromNumber:v25];
    birthDate = v5->_birthDate;
    v5->_birthDate = (NSDate *)v26;

    v28 = [v4 objectForKeyedSubscript:@"deathDate"];
    uint64_t v29 = [(TVRCPerson *)v5 _dateFromNumber:v28];
    deathDate = v5->_deathDate;
    v5->_deathDate = (NSDate *)v29;

    v31 = [v4 objectForKeyedSubscript:@"url"];
    uint64_t v32 = [(TVRCPerson *)v5 _urlFromString:v31];
    url = v5->_url;
    v5->_url = (NSURL *)v32;
  }
  return v5;
}

+ (id)personWithDictionary:(id)a3
{
  id v4 = a3;
  v5 = (void *)[objc_alloc((Class)a1) initWithDictionary:v4];

  return v5;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = objc_alloc_init(TVRCPerson);
  v5 = [(TVRCPerson *)self identifier];
  [(TVRCPerson *)v4 setIdentifier:v5];

  v6 = [(TVRCPerson *)self name];
  [(TVRCPerson *)v4 setName:v6];

  v7 = [(TVRCPerson *)self bio];
  [(TVRCPerson *)v4 setBio:v7];

  uint64_t v8 = [(TVRCPerson *)self imageURLTemplate];
  [(TVRCPerson *)v4 setImageURLTemplate:v8];

  [(TVRCPerson *)self imageSize];
  -[TVRCPerson setImageSize:](v4, "setImageSize:");
  v9 = [(TVRCPerson *)self birthplace];
  [(TVRCPerson *)v4 setBirthplace:v9];

  uint64_t v10 = [(TVRCPerson *)self birthDate];
  [(TVRCPerson *)v4 setBirthDate:v10];

  v11 = [(TVRCPerson *)self deathDate];
  [(TVRCPerson *)v4 setDeathDate:v11];

  uint64_t v12 = [(TVRCPerson *)self url];
  [(TVRCPerson *)v4 setUrl:v12];

  return v4;
}

- (id)formattedBirthDate
{
  v3 = [(TVRCPerson *)self birthDate];

  if (v3)
  {
    id v4 = [(TVRCPerson *)self birthDate];
    v5 = [(TVRCPerson *)self _formattedDateWithDate:v4];
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (id)formattedDeathDate
{
  v3 = [(TVRCPerson *)self deathDate];

  if (v3)
  {
    id v4 = [(TVRCPerson *)self deathDate];
    v5 = [(TVRCPerson *)self _formattedDateWithDate:v4];
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (id)formattedAge
{
  v3 = [(TVRCPerson *)self birthDate];
  id v4 = [(TVRCPerson *)self deathDate];
  v5 = v4;
  if (v4)
  {
    id v6 = v4;
  }
  else
  {
    id v6 = [MEMORY[0x263EFF910] now];
  }
  v7 = v6;

  uint64_t v8 = 0;
  if (v3 && v7)
  {
    if (formattedAge_onceToken != -1) {
      dispatch_once(&formattedAge_onceToken, &__block_literal_global_0);
    }
    [v7 timeIntervalSinceDate:v3];
    uint64_t v8 = objc_msgSend((id)formattedAge_formatter, "stringFromTimeInterval:");
  }

  return v8;
}

uint64_t __26__TVRCPerson_formattedAge__block_invoke()
{
  id v0 = objc_alloc_init(MEMORY[0x263F08780]);
  v1 = (void *)formattedAge_formatter;
  formattedAge_formatter = (uint64_t)v0;

  [(id)formattedAge_formatter setUnitsStyle:1];
  v2 = (void *)formattedAge_formatter;

  return [v2 setAllowedUnits:4];
}

- (id)_dateFromNumber:(id)a3
{
  id v3 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0
    && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
    && ([v3 doubleValue], v4 != 0.0))
  {
    v5 = [MEMORY[0x263EFF910] dateWithTimeIntervalSince1970:v4 / 1000.0];
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (id)_urlFromString:(id)a3
{
  if (a3)
  {
    double v4 = objc_msgSend(NSURL, "URLWithString:");
  }
  else
  {
    double v4 = 0;
  }
  return v4;
}

- (id)_formattedDateWithDate:(id)a3
{
  id v3 = a3;
  if (v3)
  {
    if (_formattedDateWithDate__onceToken != -1) {
      dispatch_once(&_formattedDateWithDate__onceToken, &__block_literal_global_37);
    }
    double v4 = [(id)_formattedDateWithDate__formatter stringFromDate:v3];
  }
  else
  {
    double v4 = 0;
  }

  return v4;
}

uint64_t __37__TVRCPerson__formattedDateWithDate___block_invoke()
{
  id v0 = objc_alloc_init(MEMORY[0x263F08790]);
  v1 = (void *)_formattedDateWithDate__formatter;
  _formattedDateWithDate__formatter = (uint64_t)v0;

  [(id)_formattedDateWithDate__formatter setDateStyle:2];
  v2 = (void *)_formattedDateWithDate__formatter;

  return [v2 setTimeStyle:0];
}

- (NSString)identifier
{
  return self->_identifier;
}

- (NSString)name
{
  return self->_name;
}

- (NSString)bio
{
  return self->_bio;
}

- (NSString)birthplace
{
  return self->_birthplace;
}

- (NSDate)birthDate
{
  return self->_birthDate;
}

- (NSDate)deathDate
{
  return self->_deathDate;
}

- (NSURL)url
{
  return self->_url;
}

- (NSString)imageURLTemplate
{
  return self->_imageURLTemplate;
}

- (CGSize)imageSize
{
  double width = self->_imageSize.width;
  double height = self->_imageSize.height;
  result.double height = height;
  result.double width = width;
  return result;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_imageURLTemplate, 0);
  objc_storeStrong((id *)&self->_url, 0);
  objc_storeStrong((id *)&self->_deathDate, 0);
  objc_storeStrong((id *)&self->_birthDate, 0);
  objc_storeStrong((id *)&self->_birthplace, 0);
  objc_storeStrong((id *)&self->_bio, 0);
  objc_storeStrong((id *)&self->_name, 0);

  objc_storeStrong((id *)&self->_identifier, 0);
}

@end