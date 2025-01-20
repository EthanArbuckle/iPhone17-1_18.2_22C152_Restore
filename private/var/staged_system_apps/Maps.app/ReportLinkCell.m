@interface ReportLinkCell
- (ReportLink)reportLink;
- (ReportLinkCell)initWithFrame:(CGRect)a3;
- (void)setReportLink:(id)a3;
@end

@implementation ReportLinkCell

- (ReportLinkCell)initWithFrame:(CGRect)a3
{
  v10.receiver = self;
  v10.super_class = (Class)ReportLinkCell;
  v3 = -[UserProfilePersonalizationLinkCell initWithFrame:](&v10, "initWithFrame:", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    v4 = (objc_class *)objc_opt_class();
    v5 = NSStringFromClass(v4);
    [(ReportLinkCell *)v3 setAccessibilityIdentifier:v5];

    v6 = +[UIColor systemBlueColor];
    [(UserProfilePersonalizationLinkCell *)v3 setGlyphTintColor:v6];

    v7 = +[UIColor systemLightGrayColor];
    [(UserProfilePersonalizationLinkCell *)v3 setGlyphBackgroundColor:v7];

    v8 = [(UserProfilePersonalizationLinkCell *)v3 titleLabel];
    [v8 setNumberOfLines:2];
  }
  return v3;
}

- (void)setReportLink:(id)a3
{
  id v8 = a3;
  if ((-[ReportLink isEqual:](self->_reportLink, "isEqual:") & 1) == 0)
  {
    objc_storeStrong((id *)&self->_reportLink, a3);
    v5 = [v8 title];
    v6 = [v8 subtitle];
    v7 = [v8 icon];
    [(UserProfilePersonalizationLinkCell *)self updateTitle:v5 subtitle:v6 icon:v7];
  }
}

- (ReportLink)reportLink
{
  return self->_reportLink;
}

- (void).cxx_destruct
{
}

@end