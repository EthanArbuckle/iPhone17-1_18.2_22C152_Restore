@interface ReportLink
- (NSString)subtitle;
- (NSString)title;
- (ReportLink)initWithTitle:(id)a3 icon:(id)a4;
- (UIImage)icon;
- (int64_t)reportLinkType;
- (void)setIcon:(id)a3;
- (void)setReportLinkType:(int64_t)a3;
- (void)setSubtitle:(id)a3;
@end

@implementation ReportLink

- (ReportLink)initWithTitle:(id)a3 icon:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v12.receiver = self;
  v12.super_class = (Class)ReportLink;
  v8 = [(ReportLink *)&v12 init];
  if (v8)
  {
    v9 = (NSString *)[v6 copy];
    title = v8->_title;
    v8->_title = v9;

    objc_storeStrong((id *)&v8->_icon, a4);
  }

  return v8;
}

- (int64_t)reportLinkType
{
  return self->_reportLinkType;
}

- (void)setReportLinkType:(int64_t)a3
{
  self->_reportLinkType = a3;
}

- (NSString)title
{
  return self->_title;
}

- (NSString)subtitle
{
  return self->_subtitle;
}

- (void)setSubtitle:(id)a3
{
}

- (UIImage)icon
{
  return self->_icon;
}

- (void)setIcon:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_icon, 0);
  objc_storeStrong((id *)&self->_subtitle, 0);

  objc_storeStrong((id *)&self->_title, 0);
}

@end