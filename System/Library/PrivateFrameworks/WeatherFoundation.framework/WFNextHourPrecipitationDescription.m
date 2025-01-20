@interface WFNextHourPrecipitationDescription
+ (BOOL)supportsSecureCoding;
- (BOOL)isValidAtDate:(id)a3;
- (NSDate)validUntil;
- (NSDictionary)parameters;
- (NSString)longDescription;
- (NSString)longTemplate;
- (NSString)shortDescription;
- (NSString)shortTemplate;
- (NSString)token;
- (WFNextHourPrecipitationDescription)initWithCoder:(id)a3;
- (WFNextHourPrecipitationDescription)initWithShortTemplate:(id)a3 longTemplate:(id)a4 parameters:(id)a5 validUntil:(id)a6;
- (WFNextHourPrecipitationDescription)initWithToken:(id)a3 shortTemplate:(id)a4 longTemplate:(id)a5 parameters:(id)a6 validUntil:(id)a7;
- (id)copyWithZone:(_NSZone *)a3;
- (id)fillTemplate:(id)a3 withDate:(id)a4;
- (void)encodeWithCoder:(id)a3;
- (void)setLongTemplate:(id)a3;
- (void)setParameters:(id)a3;
- (void)setShortTemplate:(id)a3;
- (void)setToken:(id)a3;
@end

@implementation WFNextHourPrecipitationDescription

- (WFNextHourPrecipitationDescription)initWithToken:(id)a3 shortTemplate:(id)a4 longTemplate:(id)a5 parameters:(id)a6 validUntil:(id)a7
{
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  id v16 = a7;
  v29.receiver = self;
  v29.super_class = (Class)WFNextHourPrecipitationDescription;
  v17 = [(WFNextHourPrecipitationDescription *)&v29 init];
  if (v17)
  {
    uint64_t v18 = [v12 copy];
    token = v17->_token;
    v17->_token = (NSString *)v18;

    uint64_t v20 = [v13 copy];
    shortTemplate = v17->_shortTemplate;
    v17->_shortTemplate = (NSString *)v20;

    uint64_t v22 = [v14 copy];
    longTemplate = v17->_longTemplate;
    v17->_longTemplate = (NSString *)v22;

    uint64_t v24 = [v15 copy];
    parameters = v17->_parameters;
    v17->_parameters = (NSDictionary *)v24;

    uint64_t v26 = [v16 copy];
    validUntil = v17->_validUntil;
    v17->_validUntil = (NSDate *)v26;
  }
  return v17;
}

- (WFNextHourPrecipitationDescription)initWithShortTemplate:(id)a3 longTemplate:(id)a4 parameters:(id)a5 validUntil:(id)a6
{
  return [(WFNextHourPrecipitationDescription *)self initWithToken:&stru_26CD4CE08 shortTemplate:a3 longTemplate:a4 parameters:a5 validUntil:a6];
}

- (id)copyWithZone:(_NSZone *)a3
{
  v4 = (void *)[(id)objc_opt_class() allocWithZone:a3];
  v5 = (void *)[(NSString *)self->_token copy];
  v6 = (void *)[(NSString *)self->_shortTemplate copy];
  v7 = (void *)[(NSString *)self->_longTemplate copy];
  v8 = (void *)[(NSDictionary *)self->_parameters copy];
  v9 = (void *)[(NSDate *)self->_validUntil copy];
  v10 = (void *)[v4 initWithToken:v5 shortTemplate:v6 longTemplate:v7 parameters:v8 validUntil:v9];

  return v10;
}

- (NSString)shortDescription
{
  v3 = [MEMORY[0x263EFF910] date];
  v4 = [(WFNextHourPrecipitationDescription *)self fillTemplate:self->_shortTemplate withDate:v3];

  return (NSString *)v4;
}

- (NSString)longDescription
{
  v3 = [MEMORY[0x263EFF910] date];
  v4 = [(WFNextHourPrecipitationDescription *)self fillTemplate:self->_longTemplate withDate:v3];

  return (NSString *)v4;
}

- (BOOL)isValidAtDate:(id)a3
{
  validUntil = self->_validUntil;
  if (!validUntil) {
    return 1;
  }
  [(NSDate *)validUntil timeIntervalSinceDate:a3];
  return v4 > 91.0;
}

- (id)fillTemplate:(id)a3 withDate:(id)a4
{
  id v6 = a4;
  v7 = (void *)[a3 mutableCopy];
  v8 = [(NSDictionary *)self->_parameters objectForKeyedSubscript:@"firstAt"];
  if (v8)
  {
    v9 = [NSString stringWithFormat:@"{%@}", @"firstAt"];
    [v8 timeIntervalSinceDate:v6];
    v11 = objc_msgSend(NSString, "stringWithFormat:", @"%0.0f", round(v10 / 60.0));
    objc_msgSend(v7, "replaceOccurrencesOfString:withString:options:range:", v9, v11, 0, 0, objc_msgSend(v7, "length"));
    id v12 = [(NSDictionary *)self->_parameters objectForKeyedSubscript:@"secondAt"];
    if (v12)
    {
      id v13 = [NSString stringWithFormat:@"{%@}", @"secondAt"];
      [v12 timeIntervalSinceDate:v8];
      id v15 = objc_msgSend(NSString, "stringWithFormat:", @"%0.0f", round(v14 / 60.0));
      objc_msgSend(v7, "replaceOccurrencesOfString:withString:options:range:", v13, v15, 0, 0, objc_msgSend(v7, "length"));
    }
  }

  return v7;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [(WFNextHourPrecipitationDescription *)self token];
  [v4 encodeObject:v5 forKey:@"WFNextHourPrecipitationDescriptionTokenKey"];

  id v6 = [(WFNextHourPrecipitationDescription *)self shortTemplate];
  [v4 encodeObject:v6 forKey:@"WFNextHourPrecipitationDescriptionShortTemplateKey"];

  v7 = [(WFNextHourPrecipitationDescription *)self longTemplate];
  [v4 encodeObject:v7 forKey:@"WFNextHourPrecipitationDescriptionLongTemplateKey"];

  v8 = [(WFNextHourPrecipitationDescription *)self parameters];
  [v4 encodeObject:v8 forKey:@"WFNextHourPrecipitationDescriptionParametersKey"];

  id v9 = [(WFNextHourPrecipitationDescription *)self validUntil];
  [v4 encodeObject:v9 forKey:@"WFNextHourPrecipitationDescriptionValidUntilKey"];
}

- (WFNextHourPrecipitationDescription)initWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"WFNextHourPrecipitationDescriptionTokenKey"];
  id v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"WFNextHourPrecipitationDescriptionShortTemplateKey"];
  v7 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"WFNextHourPrecipitationDescriptionLongTemplateKey"];
  if (initWithCoder__onceToken_3 != -1) {
    dispatch_once(&initWithCoder__onceToken_3, &__block_literal_global_25);
  }
  v8 = [v4 decodeObjectOfClasses:initWithCoder__classes_2 forKey:@"WFNextHourPrecipitationDescriptionParametersKey"];
  id v9 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"WFNextHourPrecipitationDescriptionValidUntilKey"];
  double v10 = [(WFNextHourPrecipitationDescription *)self initWithToken:v5 shortTemplate:v6 longTemplate:v7 parameters:v8 validUntil:v9];

  return v10;
}

uint64_t __52__WFNextHourPrecipitationDescription_initWithCoder___block_invoke()
{
  v0 = (void *)MEMORY[0x263EFFA08];
  uint64_t v1 = objc_opt_class();
  uint64_t v2 = objc_opt_class();
  uint64_t v3 = objc_msgSend(v0, "setWithObjects:", v1, v2, objc_opt_class(), 0);
  uint64_t v4 = initWithCoder__classes_2;
  initWithCoder__classes_2 = v3;
  return MEMORY[0x270F9A758](v3, v4);
}

- (NSString)token
{
  return self->_token;
}

- (void)setToken:(id)a3
{
}

- (NSDate)validUntil
{
  return self->_validUntil;
}

- (NSString)shortTemplate
{
  return self->_shortTemplate;
}

- (void)setShortTemplate:(id)a3
{
}

- (NSString)longTemplate
{
  return self->_longTemplate;
}

- (void)setLongTemplate:(id)a3
{
}

- (NSDictionary)parameters
{
  return self->_parameters;
}

- (void)setParameters:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_parameters, 0);
  objc_storeStrong((id *)&self->_longTemplate, 0);
  objc_storeStrong((id *)&self->_shortTemplate, 0);
  objc_storeStrong((id *)&self->_validUntil, 0);
  objc_storeStrong((id *)&self->_token, 0);
}

@end