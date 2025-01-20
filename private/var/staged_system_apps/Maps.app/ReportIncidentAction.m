@interface ReportIncidentAction
- (BOOL)forceEndNavigation;
- (BOOL)isCompatibleWithNavigation;
- (BOOL)isCompatibleWithRestorationTask;
- (BOOL)shouldResetUI;
- (INReportIncidentIntent)incidentIntent;
- (ReportIncidentAction)initWithIncidentIntent:(id)a3;
- (int)analyticsLaunchActionType;
@end

@implementation ReportIncidentAction

- (ReportIncidentAction)initWithIncidentIntent:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)ReportIncidentAction;
  v6 = [(ReportIncidentAction *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_incidentIntent, a3);
  }

  return v7;
}

- (BOOL)isCompatibleWithNavigation
{
  return 1;
}

- (BOOL)isCompatibleWithRestorationTask
{
  return 0;
}

- (BOOL)forceEndNavigation
{
  return 0;
}

- (BOOL)shouldResetUI
{
  return 0;
}

- (int)analyticsLaunchActionType
{
  return 38;
}

- (INReportIncidentIntent)incidentIntent
{
  return self->_incidentIntent;
}

- (void).cxx_destruct
{
}

@end