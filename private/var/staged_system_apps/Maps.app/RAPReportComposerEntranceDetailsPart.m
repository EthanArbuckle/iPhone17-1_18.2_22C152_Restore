@interface RAPReportComposerEntranceDetailsPart
- (RAPReportComposerEntranceDetailsPart)initWithCorrectableString:(id)a3;
@end

@implementation RAPReportComposerEntranceDetailsPart

- (RAPReportComposerEntranceDetailsPart)initWithCorrectableString:(id)a3
{
  id v4 = a3;
  v5 = [[RAPReportComposerIncorrectNameSection alloc] initWithCorrectableString:v4 required:0];

  v6 = +[NSBundle mainBundle];
  v7 = [v6 localizedStringForKey:@"Details [Report a Problem, Access Point]", @"localized string not found", 0 value table];
  [(RAPTablePartSection *)v5 setHeaderTitle:v7];

  v12 = v5;
  v8 = +[NSArray arrayWithObjects:&v12 count:1];
  v11.receiver = self;
  v11.super_class = (Class)RAPReportComposerEntranceDetailsPart;
  v9 = [(RAPTablePart *)&v11 initWithSections:v8];

  return v9;
}

@end