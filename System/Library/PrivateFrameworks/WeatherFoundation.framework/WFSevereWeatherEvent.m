@interface WFSevereWeatherEvent
+ (BOOL)supportsSecureCoding;
- (NSDate)expirationDate;
- (NSString)areaName;
- (NSString)eventDescription;
- (NSString)identifier;
- (NSString)source;
- (NSURL)URL;
- (WFSevereWeatherEvent)initWithCoder:(id)a3;
- (WFSevereWeatherEvent)initWithIdentifier:(id)a3 areaName:(id)a4 eventDescription:(id)a5 source:(id)a6 expirationDate:(id)a7 URL:(id)a8 importance:(unint64_t)a9;
- (id)copyWithZone:(_NSZone *)a3;
- (unint64_t)importance;
- (void)encodeWithCoder:(id)a3;
@end

@implementation WFSevereWeatherEvent

- (WFSevereWeatherEvent)initWithIdentifier:(id)a3 areaName:(id)a4 eventDescription:(id)a5 source:(id)a6 expirationDate:(id)a7 URL:(id)a8 importance:(unint64_t)a9
{
  id v15 = a3;
  id v16 = a4;
  id v17 = a5;
  id v18 = a6;
  id v19 = a7;
  id v20 = a8;
  v37.receiver = self;
  v37.super_class = (Class)WFSevereWeatherEvent;
  v21 = [(WFSevereWeatherEvent *)&v37 init];
  if (v21)
  {
    uint64_t v22 = [v15 copy];
    identifier = v21->_identifier;
    v21->_identifier = (NSString *)v22;

    uint64_t v24 = [v16 copy];
    areaName = v21->_areaName;
    v21->_areaName = (NSString *)v24;

    uint64_t v26 = [v17 copy];
    eventDescription = v21->_eventDescription;
    v21->_eventDescription = (NSString *)v26;

    uint64_t v28 = [v18 copy];
    source = v21->_source;
    v21->_source = (NSString *)v28;

    v30 = (void *)[v19 copy];
    v31 = v30;
    if (v30)
    {
      v32 = v30;
    }
    else
    {
      v32 = [MEMORY[0x263EFF910] distantFuture];
    }
    expirationDate = v21->_expirationDate;
    v21->_expirationDate = v32;

    uint64_t v34 = [v20 copy];
    URL = v21->_URL;
    v21->_URL = (NSURL *)v34;

    v21->_importance = a9;
  }

  return v21;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v4 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  uint64_t v5 = [(NSString *)self->_identifier copy];
  v6 = (void *)v4[1];
  v4[1] = v5;

  uint64_t v7 = [(NSString *)self->_areaName copy];
  v8 = (void *)v4[2];
  v4[2] = v7;

  uint64_t v9 = [(NSString *)self->_eventDescription copy];
  v10 = (void *)v4[3];
  v4[3] = v9;

  uint64_t v11 = [(NSString *)self->_source copy];
  v12 = (void *)v4[4];
  v4[4] = v11;

  uint64_t v13 = [(NSDate *)self->_expirationDate copy];
  v14 = (void *)v4[5];
  v4[5] = v13;

  uint64_t v15 = [(NSURL *)self->_URL copy];
  id v16 = (void *)v4[6];
  v4[6] = v15;

  v4[7] = self->_importance;
  return v4;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(WFSevereWeatherEvent *)self identifier];
  [v4 encodeObject:v5 forKey:@"WFSevereWeatherEventIdentifierKey"];

  v6 = [(WFSevereWeatherEvent *)self areaName];
  [v4 encodeObject:v6 forKey:@"WFSevereWeatherEventAreaNameKey"];

  uint64_t v7 = [(WFSevereWeatherEvent *)self eventDescription];
  [v4 encodeObject:v7 forKey:@"WFSevereWeatherEventDescription"];

  v8 = [(WFSevereWeatherEvent *)self source];
  [v4 encodeObject:v8 forKey:@"WFSevereWeatherEventSourceKey"];

  uint64_t v9 = [(WFSevereWeatherEvent *)self expirationDate];
  [v4 encodeObject:v9 forKey:@"WFSevereWeatherEventExpirationDateKey"];

  objc_msgSend(v4, "encodeInteger:forKey:", -[WFSevereWeatherEvent importance](self, "importance"), @"WFSevereWeatherEventImportanceKey");
  id v10 = [(WFSevereWeatherEvent *)self URL];
  [v4 encodeObject:v10 forKey:@"WFSevereWeatherEventURLKey"];
}

- (WFSevereWeatherEvent)initWithCoder:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"WFSevereWeatherEventIdentifierKey"];
  v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"WFSevereWeatherEventAreaNameKey"];
  uint64_t v7 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"WFSevereWeatherEventDescription"];
  v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"WFSevereWeatherEventSourceKey"];
  uint64_t v9 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"WFSevereWeatherEventExpirationDateKey"];
  id v10 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"WFSevereWeatherEventURLKey"];
  uint64_t v11 = [v4 decodeIntegerForKey:@"WFSevereWeatherEventImportanceKey"];

  v12 = [(WFSevereWeatherEvent *)self initWithIdentifier:v5 areaName:v6 eventDescription:v7 source:v8 expirationDate:v9 URL:v10 importance:v11];
  return v12;
}

- (NSString)identifier
{
  return self->_identifier;
}

- (NSString)areaName
{
  return self->_areaName;
}

- (NSString)eventDescription
{
  return self->_eventDescription;
}

- (NSString)source
{
  return self->_source;
}

- (NSDate)expirationDate
{
  return self->_expirationDate;
}

- (NSURL)URL
{
  return self->_URL;
}

- (unint64_t)importance
{
  return self->_importance;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_URL, 0);
  objc_storeStrong((id *)&self->_expirationDate, 0);
  objc_storeStrong((id *)&self->_source, 0);
  objc_storeStrong((id *)&self->_eventDescription, 0);
  objc_storeStrong((id *)&self->_areaName, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
}

@end