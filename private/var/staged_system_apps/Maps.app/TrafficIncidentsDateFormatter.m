@interface TrafficIncidentsDateFormatter
- (TrafficIncidentsDateFormatter)init;
- (id)dateStringForDate:(id)a3;
- (id)lastUpdatedUIStringForDate:(id)a3;
- (id)timeStringForDate:(id)a3;
@end

@implementation TrafficIncidentsDateFormatter

- (TrafficIncidentsDateFormatter)init
{
  v5.receiver = self;
  v5.super_class = (Class)TrafficIncidentsDateFormatter;
  v2 = [(TrafficIncidentsDateFormatter *)&v5 init];
  if (v2)
  {
    if (qword_10160EEF0 != -1) {
      dispatch_once(&qword_10160EEF0, &stru_1012ED1A8);
    }
    v3 = v2;
  }

  return v2;
}

- (id)dateStringForDate:(id)a3
{
  return [(id)qword_10160EEF8 stringFromDate:a3];
}

- (id)timeStringForDate:(id)a3
{
  return [(id)qword_10160EF00 stringFromDate:a3];
}

- (id)lastUpdatedUIStringForDate:(id)a3
{
  id v4 = a3;
  objc_super v5 = +[NSBundle mainBundle];
  v6 = [v5 localizedStringForKey:@"TrafficIncidentLastUpdateDate" value:@"localized string not found" table:0];

  v7 = [(TrafficIncidentsDateFormatter *)self dateStringForDate:v4];
  v8 = [(TrafficIncidentsDateFormatter *)self timeStringForDate:v4];

  v9 = +[NSString localizedStringWithFormat:](NSString, "localizedStringWithFormat:", v6, v7, v8);

  return v9;
}

@end