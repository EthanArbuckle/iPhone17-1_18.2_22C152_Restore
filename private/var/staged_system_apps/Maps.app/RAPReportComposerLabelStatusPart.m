@interface RAPReportComposerLabelStatusPart
- (RAPReportComposerLabelStatusPart)initWithCorrectableFlag:(id)a3;
@end

@implementation RAPReportComposerLabelStatusPart

- (RAPReportComposerLabelStatusPart)initWithCorrectableFlag:(id)a3
{
  id v4 = a3;
  v5 = [[RAPReportComposerLabelStatusSection alloc] initWithCorrectableFlag:v4];

  v10 = v5;
  v6 = +[NSArray arrayWithObjects:&v10 count:1];
  v9.receiver = self;
  v9.super_class = (Class)RAPReportComposerLabelStatusPart;
  v7 = [(RAPTablePart *)&v9 initWithSections:v6];

  if (v7) {
    objc_storeStrong((id *)&v7->_statusSection, v5);
  }

  return v7;
}

- (void).cxx_destruct
{
}

@end