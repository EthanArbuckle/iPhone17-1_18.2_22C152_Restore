@interface MacTrafficIncidentsDetailsCellModel
- (BOOL)hasDataToShow;
- (MacTrafficIncidentsDetailsCellModel)initWithVKTrafficIncidentFeature:(id)a3;
- (NSString)dateText;
- (TrafficIncidentsDateFormatter)dateFormatter;
- (VKTrafficIncidentFeature)incident;
- (void)setDateFormatter:(id)a3;
- (void)setIncident:(id)a3;
@end

@implementation MacTrafficIncidentsDetailsCellModel

- (MacTrafficIncidentsDetailsCellModel)initWithVKTrafficIncidentFeature:(id)a3
{
  id v5 = a3;
  v11.receiver = self;
  v11.super_class = (Class)MacTrafficIncidentsDetailsCellModel;
  v6 = [(MacTrafficIncidentsDetailsCellModel *)&v11 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_incident, a3);
    v8 = objc_alloc_init(TrafficIncidentsDateFormatter);
    dateFormatter = v7->_dateFormatter;
    v7->_dateFormatter = v8;
  }
  return v7;
}

- (NSString)dateText
{
  v3 = [(MacTrafficIncidentsDetailsCellModel *)self incident];
  unsigned int v4 = [v3 isRestrictionIncident];

  id v5 = [(MacTrafficIncidentsDetailsCellModel *)self incident];
  v6 = v5;
  if (v4)
  {
    v7 = [v5 restrictionEffectiveTimeRange];
LABEL_5:

    goto LABEL_7;
  }
  v8 = [v5 endDate];

  if (v8)
  {
    v9 = +[NSBundle mainBundle];
    v6 = [v9 localizedStringForKey:@"TrafficIncidentEndDate" value:@"localized string not found" table:0];

    v10 = [(MacTrafficIncidentsDetailsCellModel *)self dateFormatter];
    objc_super v11 = [(MacTrafficIncidentsDetailsCellModel *)self incident];
    v12 = [v11 endDate];
    v13 = [v10 dateStringForDate:v12];
    v14 = [(MacTrafficIncidentsDetailsCellModel *)self dateFormatter];
    v15 = [(MacTrafficIncidentsDetailsCellModel *)self incident];
    v16 = [v15 endDate];
    v17 = [v14 timeStringForDate:v16];
    +[NSString localizedStringWithFormat:](NSString, "localizedStringWithFormat:", v6, v13, v17);
    v7 = (__CFString *)objc_claimAutoreleasedReturnValue();

    goto LABEL_5;
  }
  v7 = &stru_101324E70;
LABEL_7:

  return (NSString *)v7;
}

- (BOOL)hasDataToShow
{
  v2 = [(MacTrafficIncidentsDetailsCellModel *)self dateText];
  BOOL v3 = [v2 length] != 0;

  return v3;
}

- (VKTrafficIncidentFeature)incident
{
  return self->_incident;
}

- (void)setIncident:(id)a3
{
}

- (TrafficIncidentsDateFormatter)dateFormatter
{
  return self->_dateFormatter;
}

- (void)setDateFormatter:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dateFormatter, 0);

  objc_storeStrong((id *)&self->_incident, 0);
}

@end