@interface SBCaptureApplicationTerminationAlertItem
- (BOOL)ignoreIfAlreadyDisplaying;
- (BOOL)shouldShowInLockScreen;
- (SBCaptureApplicationTerminationAlertItem)initWithTerminationInfo:(id)a3;
- (SBCaptureApplicationTerminationInfo)terminationInfo;
- (id)message;
- (id)radarComponentID;
- (id)radarComponentName;
- (id)radarComponentVersion;
- (id)radarDescription;
- (id)radarKeywordIDs;
- (id)radarTitle;
- (id)title;
- (int64_t)radarClassification;
- (int64_t)radarReproducibility;
@end

@implementation SBCaptureApplicationTerminationAlertItem

- (SBCaptureApplicationTerminationAlertItem)initWithTerminationInfo:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)SBCaptureApplicationTerminationAlertItem;
  v6 = [(SBAlertItem *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_terminationInfo, a3);
  }

  return v7;
}

- (BOOL)shouldShowInLockScreen
{
  return 1;
}

- (BOOL)ignoreIfAlreadyDisplaying
{
  return 1;
}

- (id)title
{
  v3 = [(SBCaptureApplicationTerminationInfo *)self->_terminationInfo processName];
  v4 = [(SBCaptureApplicationTerminationInfo *)self->_terminationInfo terminationReason];
  uint64_t v5 = [v3 length];
  v6 = NSString;
  v7 = [MEMORY[0x1E4F28B50] mainBundle];
  v8 = v7;
  if (v5)
  {
    objc_super v9 = [v7 localizedStringForKey:@"CAPTURE_APPLICATION_TERMINATION_ALERT_TITLE_WITH_PROCESS_REASON" value:&stru_1F3084718 table:@"SpringBoard"];
    objc_msgSend(v6, "stringWithFormat:", v9, v3, v4);
  }
  else
  {
    objc_super v9 = [v7 localizedStringForKey:@"CAPTURE_APPLICATION_TERMINATION_ALERT_TITLE_NO_PROCESS_WITH_REASON" value:&stru_1F3084718 table:@"SpringBoard"];
    objc_msgSend(v6, "stringWithFormat:", v9, v4, v12);
  v10 = };

  return v10;
}

- (id)message
{
  v3 = NSString;
  v4 = [MEMORY[0x1E4F28B50] mainBundle];
  uint64_t v5 = [v4 localizedStringForKey:@"CAPTURE_APPLICATION_TERMINATION_ALERT_MESSAGE" value:&stru_1F3084718 table:@"SpringBoard"];
  v6 = [(SBCaptureApplicationTerminationAlertItem *)self radarComponentName];
  v7 = [(SBCaptureApplicationTerminationAlertItem *)self radarComponentVersion];
  v8 = objc_msgSend(v3, "stringWithFormat:", v5, v6, v7);

  return v8;
}

- (id)radarTitle
{
  v3 = [(SBCaptureApplicationTerminationInfo *)self->_terminationInfo processName];
  v4 = [(SBCaptureApplicationTerminationInfo *)self->_terminationInfo terminationReason];
  uint64_t v5 = [(SBCaptureApplicationTerminationInfo *)self->_terminationInfo buildVersion];
  v6 = @"Unknown Process";
  if (v3) {
    v6 = v3;
  }
  v7 = [NSString stringWithFormat:@"%@: Capture Application Termination Reported - %@ - %@", v5, v6, v4];

  return v7;
}

- (id)radarDescription
{
  v3 = [(SBCaptureApplicationTerminationInfo *)self->_terminationInfo terminationReason];
  v4 = NSString;
  uint64_t v5 = [MEMORY[0x1E4F28B50] mainBundle];
  v6 = [v5 localizedStringForKey:@"CAPTURE_APPLICATION_TERMINATION_RADAR_DESCRIPTION" value:&stru_1F3084718 table:@"SpringBoard"];
  v7 = objc_msgSend(v4, "stringWithFormat:", v6, v3);

  v8 = [(SBDiagnosticRequestAlertItem *)self radarAttachments];
  objc_super v9 = objc_msgSend(v8, "bs_map:", &__block_literal_global_43);

  if ([v9 count])
  {
    v10 = NSString;
    v11 = [v9 componentsJoinedByString:@"\n"];
    uint64_t v12 = [v10 stringWithFormat:@"%@\n\n%@", v7, v11];

    v7 = (void *)v12;
  }

  return v7;
}

uint64_t __60__SBCaptureApplicationTerminationAlertItem_radarDescription__block_invoke(uint64_t a1, void *a2)
{
  return [a2 lastPathComponent];
}

- (id)radarKeywordIDs
{
  return &unk_1F3347970;
}

- (id)radarComponentID
{
  return &unk_1F3349740;
}

- (id)radarComponentName
{
  return @"SpringBoard";
}

- (id)radarComponentVersion
{
  return @"Capture Extensions";
}

- (int64_t)radarClassification
{
  return 7;
}

- (int64_t)radarReproducibility
{
  return 5;
}

- (SBCaptureApplicationTerminationInfo)terminationInfo
{
  return self->_terminationInfo;
}

- (void).cxx_destruct
{
}

@end