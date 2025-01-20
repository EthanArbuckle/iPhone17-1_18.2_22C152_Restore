@interface RAPReportComposerPlaceSnippetTableViewCell
- (id)attributedStringFormat;
- (id)defaultReplacementAttributes;
- (void)_setImageForMapItem:(id)a3;
- (void)_setImageForMapItem:(id)a3 isCurrentLocation:(BOOL)a4;
- (void)_setPlaceName:(id)a3 singleLineAddress:(id)a4;
- (void)_setTransitImageForMapItem:(id)a3;
- (void)prepareForReuse;
- (void)setContentsFromMapItem:(id)a3;
- (void)setContentsFromMapItem:(id)a3 isCurrentLocation:(BOOL)a4;
@end

@implementation RAPReportComposerPlaceSnippetTableViewCell

- (void)prepareForReuse
{
  v4.receiver = self;
  v4.super_class = (Class)RAPReportComposerPlaceSnippetTableViewCell;
  [(RAPReportComposerPlaceSnippetTableViewCell *)&v4 prepareForReuse];
  v3 = [(RAPReportComposerPlaceSnippetTableViewCell *)self imageView];
  [v3 setImage:0];
}

- (id)attributedStringFormat
{
  v3 = +[NSBundle mainBundle];
  objc_super v4 = [v3 localizedStringForKey:@"PLACE NAME\nADDRESS [Report a Problem place snippet]" value:@"localized string not found" table:0];

  id v5 = objc_alloc((Class)NSAttributedString);
  v6 = [(RAPReportComposerPlaceSnippetTableViewCell *)self defaultReplacementAttributes];
  id v7 = [v5 initWithString:v4 attributes:v6];

  return v7;
}

- (id)defaultReplacementAttributes
{
  NSAttributedStringKey v5 = NSFontAttributeName;
  v2 = +[UIFont preferredFontForTextStyle:UIFontTextStyleHeadline];
  v6 = v2;
  v3 = +[NSDictionary dictionaryWithObjects:&v6 forKeys:&v5 count:1];

  return v3;
}

- (void)setContentsFromMapItem:(id)a3
{
}

- (void)setContentsFromMapItem:(id)a3 isCurrentLocation:(BOOL)a4
{
  BOOL v4 = a4;
  id v11 = a3;
  v6 = [v11 name];
  id v7 = [v11 _addressFormattedAsShortenedAddress];
  [(RAPReportComposerPlaceSnippetTableViewCell *)self _setPlaceName:v6 singleLineAddress:v7];

  [(RAPReportComposerPlaceSnippetTableViewCell *)self _setImageForMapItem:v11 isCurrentLocation:v4];
  if ([v11 _hasTransitLabels])
  {
    id v8 = [objc_alloc((Class)MKTransitInfoLabelView) initWithMapItem:v11];
    v9 = +[UIColor secondaryLabelColor];
    [v8 setTextColor:v9];

    v10 = +[UIFont system15];
    [v8 setFont:v10];

    [v8 setShieldSize:6];
    [(RAPReportComposerTwoLineSnippetTableViewCell *)self setThirdLineAccessoryView:v8];
  }
  else
  {
    [(RAPReportComposerTwoLineSnippetTableViewCell *)self setThirdLineAccessoryView:0];
  }
}

- (void)_setImageForMapItem:(id)a3 isCurrentLocation:(BOOL)a4
{
  BOOL v4 = a4;
  id v10 = a3;
  v6 = [(RAPReportComposerPlaceSnippetTableViewCell *)self imageView];
  id v7 = [v6 image];

  if (!v7)
  {
    if (v4)
    {
      id v8 = +[UIImage imageNamed:@"RAPCurrentLocation"];
      v9 = [(RAPReportComposerPlaceSnippetTableViewCell *)self imageView];
      [v9 setImage:v8];
    }
    else
    {
      [(RAPReportComposerPlaceSnippetTableViewCell *)self _setImageForMapItem:v10];
    }
  }
}

- (void)_setImageForMapItem:(id)a3
{
  id v10 = a3;
  BOOL v4 = [(RAPReportComposerPlaceSnippetTableViewCell *)self imageView];
  NSAttributedStringKey v5 = [v4 image];

  if (!v5)
  {
    if ([v10 _hasTransit])
    {
      [(RAPReportComposerPlaceSnippetTableViewCell *)self _setTransitImageForMapItem:v10];
    }
    else
    {
      v6 = +[UIScreen mainScreen];
      [v6 scale];
      id v7 = +[MKIconManager imageForMapItem:forScale:fallbackToBundleIcon:](MKIconManager, "imageForMapItem:forScale:fallbackToBundleIcon:", v10, 0);

      id v8 = [v7 imageScaledToSize:40.0, 40.0];
      v9 = [(RAPReportComposerPlaceSnippetTableViewCell *)self imageView];
      [v9 setImage:v8];
    }
  }
}

- (void)_setTransitImageForMapItem:(id)a3
{
  id v22 = a3;
  BOOL v4 = [(RAPReportComposerPlaceSnippetTableViewCell *)self imageView];
  NSAttributedStringKey v5 = [v4 image];

  v6 = v22;
  if (!v5)
  {
    id v7 = [v22 _transitInfo];
    id v8 = [v7 lines];
    v9 = [v8 firstObject];

    if (v9)
    {
      id v10 = [(RAPReportComposerPlaceSnippetTableViewCell *)self window];
      id v11 = [v10 screen];
      v12 = v11;
      if (v11)
      {
        [v11 scale];
        double v14 = v13;
      }
      else
      {
        v15 = +[UIScreen mainScreen];
        [v15 scale];
        double v14 = v16;
      }
      v17 = [v9 modeArtwork];
      v18 = +[UIImage _mapkit_transitArtworkImageWithDataSource:v17 size:6 scale:v14];

      v19 = +[UIColor colorWithRed:0.0824000016 green:0.493999988 blue:0.984000027 alpha:1.0];
      v20 = [v18 drawnInCircleWithDiameter:v19 backgroundColor:40.0];
      v21 = [(RAPReportComposerPlaceSnippetTableViewCell *)self imageView];
      [v21 setImage:v20];
    }
    v6 = v22;
  }
}

- (void)_setPlaceName:(id)a3 singleLineAddress:(id)a4
{
  v6 = (__CFString *)a4;
  id v7 = (__CFString *)a3;
  id v8 = objc_alloc_init((Class)NSMutableDictionary);
  v9 = v8;
  if (v7) {
    CFStringRef v10 = v7;
  }
  else {
    CFStringRef v10 = &stru_101324E70;
  }
  [v8 setObject:v10 forKeyedSubscript:@"placeName"];

  v17[0] = NSFontAttributeName;
  id v11 = +[UIFont system15];
  v18[0] = v11;
  v17[1] = NSForegroundColorAttributeName;
  v12 = +[UIColor secondaryLabelColor];
  v18[1] = v12;
  double v13 = +[NSDictionary dictionaryWithObjects:v18 forKeys:v17 count:2];

  id v14 = objc_alloc((Class)NSAttributedString);
  if (v6) {
    CFStringRef v15 = v6;
  }
  else {
    CFStringRef v15 = &stru_101324E70;
  }
  id v16 = [v14 initWithString:v15 attributes:v13];

  [v9 setObject:v16 forKeyedSubscript:@"address"];
  [(RAPReportComposerTwoLineSnippetTableViewCell *)self updateTextWithReplacements:v9];
}

@end