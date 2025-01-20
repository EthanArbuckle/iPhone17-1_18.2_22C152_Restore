@interface RAPReportComposerSnippetSection
- (BOOL)isCurrentLocation;
- (RAPReportComposerSnippetSection)initWithQuestion:(id)a3;
- (double)heightForRowAtIndex:(int64_t)a3;
- (id)cellForRowAtIndex:(int64_t)a3;
- (id)headerTitle;
- (int64_t)rowsCount;
@end

@implementation RAPReportComposerSnippetSection

- (RAPReportComposerSnippetSection)initWithQuestion:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)RAPReportComposerSnippetSection;
  v6 = [(RAPTablePartSection *)&v9 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_question, a3);
    [(RAPSnippetProtocol *)v7->_question addObserver:v7 changeHandler:&stru_1013238C0];
  }

  return v7;
}

- (id)headerTitle
{
  id v2 = [(RAPSnippetProtocol *)self->_question snippetStyle];
  if (v2 == (id)2)
  {
    v3 = +[NSBundle mainBundle];
    v4 = v3;
    CFStringRef v5 = @"Line [Report an issue Transit Line snippet title]";
    goto LABEL_5;
  }
  if (v2 == (id)1)
  {
    v3 = +[NSBundle mainBundle];
    v4 = v3;
    CFStringRef v5 = @"Name [Report an Issue Place snippet title]";
LABEL_5:
    v6 = [v3 localizedStringForKey:v5 value:@"localized string not found" table:0];

    goto LABEL_7;
  }
  v6 = 0;
LABEL_7:

  return v6;
}

- (int64_t)rowsCount
{
  return (char *)[(RAPSnippetProtocol *)self->_question snippetStyle] - 1 < (char *)2;
}

- (BOOL)isCurrentLocation
{
  if (![(RAPSnippetProtocol *)self->_question conformsToProtocol:&OBJC_PROTOCOL___RAPPlaceMenu])return 0; {
  v3 = [(RAPSnippetProtocol *)self->_question reportedPlace];
  }
  BOOL v4 = [v3 source] == 0;

  return v4;
}

- (id)cellForRowAtIndex:(int64_t)a3
{
  id v4 = [(RAPSnippetProtocol *)self->_question snippetStyle];
  if (v4 == (id)2)
  {
    v10 = [(RAPTablePartSection *)self namespacedReuseIdentifierWithSuffix:@"ReportedLineSnippet"];
    v6 = [(RAPTablePartSection *)self dequeueCellWithNamespacedReuseIdentifier:v10];

    if (!v6)
    {
      v11 = [RAPTransitLineTableViewCell alloc];
      v12 = [(RAPTablePartSection *)self namespacedReuseIdentifierWithSuffix:@"ReportedLineSnippet"];
      v6 = [(RAPTransitLineTableViewCell *)v11 initWithStyle:0 reuseIdentifier:v12];

      [(RAPTransitLineTableViewCell *)v6 setSelectionStyle:0];
    }
    objc_super v9 = [(RAPSnippetProtocol *)self->_question snippetTransitLine];
    [(RAPTransitLineTableViewCell *)v6 setContentsFromTransitLine:v9];
    goto LABEL_9;
  }
  if (v4 == (id)1)
  {
    CFStringRef v5 = [(RAPTablePartSection *)self namespacedReuseIdentifierWithSuffix:@"ReportedPlaceSnippet"];
    v6 = [(RAPTablePartSection *)self dequeueCellWithNamespacedReuseIdentifier:v5];

    if (!v6)
    {
      v7 = [RAPReportComposerPlaceSnippetTableViewCell alloc];
      v8 = [(RAPTablePartSection *)self namespacedReuseIdentifierWithSuffix:@"ReportedPlaceSnippet"];
      v6 = [(RAPReportComposerTwoLineSnippetTableViewCell *)v7 initWithStyle:0 reuseIdentifier:v8];
    }
    objc_super v9 = [(RAPSnippetProtocol *)self->_question snippetMapItem];
    [(RAPTransitLineTableViewCell *)v6 setContentsFromMapItem:v9 isCurrentLocation:[(RAPReportComposerSnippetSection *)self isCurrentLocation]];
LABEL_9:

    goto LABEL_11;
  }
  v6 = 0;
LABEL_11:

  return v6;
}

- (double)heightForRowAtIndex:(int64_t)a3
{
  id v4 = [(RAPSnippetProtocol *)self->_question snippetStyle];
  if (v4 == (id)2)
  {
    v6 = +[RAPTransitLineTableViewCell measuringCell];
    v7 = [(RAPSnippetProtocol *)self->_question snippetTransitLine];
    [v6 setContentsFromTransitLine:v7];
LABEL_7:

    v8 = [(RAPTablePartSection *)self tableView];
    [v6 preferredHeightInTableView:v8];
    double v10 = v9;

    return v10;
  }
  if (v4 == (id)1)
  {
    v6 = +[RAPReportComposerTwoLineSnippetTableViewCell measuringCell];
    v7 = [(RAPSnippetProtocol *)self->_question snippetMapItem];
    [v6 setContentsFromMapItem:v7 isCurrentLocation:[self isCurrentLocation]];
    goto LABEL_7;
  }
  if (!v4) {
    return UITableViewAutomaticDimension;
  }
  return result;
}

- (void).cxx_destruct
{
}

@end