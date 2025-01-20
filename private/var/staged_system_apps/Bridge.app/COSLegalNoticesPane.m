@interface COSLegalNoticesPane
- (id)markupString;
- (id)title;
@end

@implementation COSLegalNoticesPane

- (id)title
{
  v2 = +[NSBundle bundleForClass:objc_opt_class()];
  v3 = [v2 localizedStringForKey:@"LEGAL_NOTICES" value:&stru_100249230 table:@"Legal"];

  return v3;
}

- (id)markupString
{
  id WeakRetained = objc_loadWeakRetained(&qword_10029AF10);
  v3 = [WeakRetained legalNoticesMarkup];

  return v3;
}

@end