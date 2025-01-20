@interface RAPReportComposerIncorrectNamePart
- (RAPPlaceCorrectableString)correctableString;
- (RAPReportComposerIncorrectNamePart)initWithCorrectableString:(id)a3;
- (void)setCorrectableString:(id)a3;
@end

@implementation RAPReportComposerIncorrectNamePart

- (RAPReportComposerIncorrectNamePart)initWithCorrectableString:(id)a3
{
  id v5 = a3;
  v6 = [[RAPReportComposerIncorrectNameSection alloc] initWithCorrectableString:v5 required:1];
  v13 = v6;
  v7 = +[NSArray arrayWithObjects:&v13 count:1];
  v12.receiver = self;
  v12.super_class = (Class)RAPReportComposerIncorrectNamePart;
  v8 = [(RAPTablePart *)&v12 initWithSections:v7];

  if (v8)
  {
    objc_storeStrong((id *)&v8->_incorrectNameSection, v6);
    objc_storeStrong((id *)&v8->_correctableString, a3);
    v9 = +[NSBundle mainBundle];
    v10 = [v9 localizedStringForKey:@"Name [Labels]" value:@"localized string not found" table:0];
    [(RAPTablePartSection *)v8->_incorrectNameSection setHeaderTitle:v10];
  }
  return v8;
}

- (void)setCorrectableString:(id)a3
{
  id v5 = (RAPPlaceCorrectableString *)a3;
  if (self->_correctableString != v5)
  {
    v6 = v5;
    objc_storeStrong((id *)&self->_correctableString, a3);
    [(RAPReportComposerIncorrectNameSection *)self->_incorrectNameSection setCurrentLabelCorrectableString:self->_correctableString];
    id v5 = v6;
  }
}

- (RAPPlaceCorrectableString)correctableString
{
  return self->_correctableString;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_correctableString, 0);

  objc_storeStrong((id *)&self->_incorrectNameSection, 0);
}

@end