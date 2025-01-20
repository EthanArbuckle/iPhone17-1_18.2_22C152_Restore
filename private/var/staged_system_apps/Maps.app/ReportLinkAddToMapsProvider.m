@interface ReportLinkAddToMapsProvider
- (id)createReportLink;
- (int64_t)reportLinkType;
@end

@implementation ReportLinkAddToMapsProvider

- (id)createReportLink
{
  int BOOL = GEOConfigGetBOOL();
  v4 = +[NSBundle mainBundle];
  v5 = v4;
  if (BOOL) {
    CFStringRef v6 = @"[Reports] Report Something Missing";
  }
  else {
    CFStringRef v6 = @"[Reports] Add to Maps";
  }
  v7 = [v4 localizedStringForKey:v6 value:@"localized string not found" table:0];

  v8 = [ReportLink alloc];
  v9 = +[UIImage _systemImageNamed:@"pin.point.of.interest.badge.plus"];
  v10 = [(ReportLink *)v8 initWithTitle:v7 icon:v9];

  [(ReportLink *)v10 setReportLinkType:[(ReportLinkAddToMapsProvider *)self reportLinkType]];

  return v10;
}

- (int64_t)reportLinkType
{
  return 0;
}

@end