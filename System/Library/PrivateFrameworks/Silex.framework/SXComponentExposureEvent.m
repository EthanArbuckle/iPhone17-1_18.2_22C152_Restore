@interface SXComponentExposureEvent
- (NSDictionary)metaData;
- (NSString)componentIdentifier;
- (NSString)componentRole;
- (NSString)componentType;
- (SXComponentExposureEvent)initWithComponent:(id)a3;
- (id)description;
@end

@implementation SXComponentExposureEvent

- (SXComponentExposureEvent)initWithComponent:(id)a3
{
  id v4 = a3;
  v17.receiver = self;
  v17.super_class = (Class)SXComponentExposureEvent;
  v5 = [(SXAnalyticsEvent *)&v17 init];
  if (v5)
  {
    uint64_t v6 = [v4 identifier];
    componentIdentifier = v5->_componentIdentifier;
    v5->_componentIdentifier = (NSString *)v6;

    v8 = [v4 classification];
    uint64_t v9 = [(id)objc_opt_class() roleString];
    componentRole = v5->_componentRole;
    v5->_componentRole = (NSString *)v9;

    uint64_t v11 = [v4 type];
    componentType = v5->_componentType;
    v5->_componentType = (NSString *)v11;

    v13 = [v4 analytics];
    uint64_t v14 = [v13 jsonDictionary];
    metaData = v5->_metaData;
    v5->_metaData = (NSDictionary *)v14;
  }
  return v5;
}

- (id)description
{
  v3 = [MEMORY[0x263F089D8] stringWithFormat:@"<%@; %p", objc_opt_class(), self];
  id v4 = [(SXComponentExposureEvent *)self componentType];
  [v3 appendFormat:@"; type: %@", v4];

  v5 = [(SXComponentExposureEvent *)self componentIdentifier];
  [v3 appendFormat:@"; identifier: %@", v5];

  uint64_t v6 = [(SXAnalyticsEvent *)self endDate];

  if (v6)
  {
    v7 = [(SXAnalyticsEvent *)self endDate];
    [v7 timeIntervalSinceReferenceDate];
    double v9 = v8;
    v10 = [(SXAnalyticsEvent *)self startDate];
    [v10 timeIntervalSinceReferenceDate];
    objc_msgSend(v3, "appendFormat:", @"; duration: %f", v9 - v11);
  }
  else
  {
    [v3 appendString:@"; duration: undetermined"];
  }
  [v3 appendString:@">"];
  return v3;
}

- (NSString)componentIdentifier
{
  return self->_componentIdentifier;
}

- (NSString)componentType
{
  return self->_componentType;
}

- (NSString)componentRole
{
  return self->_componentRole;
}

- (NSDictionary)metaData
{
  return self->_metaData;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_metaData, 0);
  objc_storeStrong((id *)&self->_componentRole, 0);
  objc_storeStrong((id *)&self->_componentType, 0);
  objc_storeStrong((id *)&self->_componentIdentifier, 0);
}

@end