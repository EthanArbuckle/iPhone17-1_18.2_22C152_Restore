@interface MacTrafficIncidentsOverviewCellModel
- (BOOL)hasDataToShow;
- (MacTrafficIncidentsOverviewCellModel)initWithVKTrafficIncidentFeature:(id)a3;
- (NSString)overviewText;
- (VKTrafficIncidentFeature)incident;
- (void)setIncident:(id)a3;
@end

@implementation MacTrafficIncidentsOverviewCellModel

- (MacTrafficIncidentsOverviewCellModel)initWithVKTrafficIncidentFeature:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)MacTrafficIncidentsOverviewCellModel;
  v6 = [(MacTrafficIncidentsOverviewCellModel *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_incident, a3);
  }

  return v7;
}

- (NSString)overviewText
{
  v3 = [(MacTrafficIncidentsOverviewCellModel *)self incident];
  unsigned int v4 = [v3 isRestrictionIncident];

  id v5 = [(MacTrafficIncidentsOverviewCellModel *)self incident];
  v6 = v5;
  if (v4)
  {
    v7 = [v5 restrictionCombinedDetails];
    if (v7)
    {
LABEL_3:
      id v8 = v7;
      objc_super v9 = v8;
      goto LABEL_6;
    }
  }
  else
  {
    v7 = [v5 info];
    if (v7) {
      goto LABEL_3;
    }
  }
  v10 = [(MacTrafficIncidentsOverviewCellModel *)self incident];
  objc_super v9 = [v10 subtitle];

  id v8 = 0;
LABEL_6:

  return (NSString *)v9;
}

- (BOOL)hasDataToShow
{
  v2 = [(MacTrafficIncidentsOverviewCellModel *)self overviewText];
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

- (void).cxx_destruct
{
}

@end