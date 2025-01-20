@interface MFSendAsEMLTriageInteraction
+ (id)log;
- (BOOL)forTriageTeam;
- (id)_iconImageName;
- (id)_previewImageName;
- (id)accessibilityIdentifer;
- (id)title;
- (void)_performInteraction_Internal;
- (void)setForTriageTeam:(BOOL)a3;
@end

@implementation MFSendAsEMLTriageInteraction

+ (id)log
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1001E5630;
  block[3] = &unk_1006044D8;
  block[4] = a1;
  if (qword_100699D20 != -1) {
    dispatch_once(&qword_100699D20, block);
  }
  v2 = (void *)qword_100699D18;

  return v2;
}

- (void)_performInteraction_Internal
{
  id v3 = [objc_alloc((Class)_MFMailCompositionContext) initWithComposeType:0];
  v4 = [(MFMessageCompositionTriageInteraction *)self emailMessage];
  v5 = +[EMContentRequestOptions optionsWithRequestedRepresentationType:EMContentRepresentationTypeRaw networkUsage:2];
  id location = (id)0xAAAAAAAAAAAAAAAALL;
  objc_initWeak(&location, self);
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_1001E5840;
  v9[3] = &unk_10060D1F8;
  objc_copyWeak(&v12, &location);
  id v6 = v3;
  id v10 = v6;
  id v7 = v4;
  id v11 = v7;
  id v8 = [v7 requestRepresentationWithOptions:v5 completionHandler:v9];

  objc_destroyWeak(&v12);
  objc_destroyWeak(&location);
}

- (id)title
{
  unsigned int v2 = [(MFSendAsEMLTriageInteraction *)self forTriageTeam];
  id v3 = +[NSBundle mainBundle];
  v4 = v3;
  if (v2) {
    [v3 localizedStringForKey:@"SEND_EML_TRIAGE" value:&stru_100619928 table:@"Main"];
  }
  else {
  v5 = [v3 localizedStringForKey:@"SEND_EML" value:&stru_100619928 table:@"Main"];
  }

  return v5;
}

- (id)accessibilityIdentifer
{
  return MSAccessibilityIdentifierActionsViewControllerSendAsEml;
}

- (id)_iconImageName
{
  return MFImageGlyphFiles;
}

- (id)_previewImageName
{
  return MFImageGlyphFiles;
}

- (BOOL)forTriageTeam
{
  return self->_forTriageTeam;
}

- (void)setForTriageTeam:(BOOL)a3
{
  self->_forTriageTeam = a3;
}

@end