@interface SBInsecureDrawingAlertItem
- (BOOL)ignoreIfAlreadyDisplaying;
- (BOOL)shouldShowInLockScreen;
- (NSSet)layerNames;
- (NSString)processName;
- (id)_buildVersion;
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
- (void)setLayerNames:(id)a3;
- (void)setProcessName:(id)a3;
@end

@implementation SBInsecureDrawingAlertItem

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
  v2 = [(SBInsecureDrawingAlertItem *)self processName];
  if ([v2 length])
  {
    v3 = NSString;
    v4 = [MEMORY[0x1E4F28B50] mainBundle];
    v5 = [v4 localizedStringForKey:@"INSECURE_DRAWING_ALERT_TITLE_WITH_PROCESS" value:&stru_1F3084718 table:@"SpringBoard"];
    v6 = objc_msgSend(v3, "stringWithFormat:", v5, v2);
  }
  else
  {
    v4 = [MEMORY[0x1E4F28B50] mainBundle];
    v6 = [v4 localizedStringForKey:@"INSECURE_DRAWING_ALERT_TITLE_NO_PROCESS" value:&stru_1F3084718 table:@"SpringBoard"];
  }

  return v6;
}

- (id)message
{
  v3 = NSString;
  v4 = [MEMORY[0x1E4F28B50] mainBundle];
  v5 = [v4 localizedStringForKey:@"INSECURE_DRAWING_ALERT_MESSAGE" value:&stru_1F3084718 table:@"SpringBoard"];
  v6 = [(SBInsecureDrawingAlertItem *)self radarComponentName];
  v7 = [(SBInsecureDrawingAlertItem *)self radarComponentVersion];
  v8 = objc_msgSend(v3, "stringWithFormat:", v5, v6, v7);

  return v8;
}

- (id)radarTitle
{
  v3 = [(SBInsecureDrawingAlertItem *)self processName];
  v4 = [(SBInsecureDrawingAlertItem *)self _buildVersion];
  if ([v3 length]) {
    [NSString stringWithFormat:@"%@: Secure Draw Violation Reported - %@", v4, v3];
  }
  else {
  v5 = [NSString stringWithFormat:@"%@: Secure Draw Violation Reported - Unknown Process", v4, v7];
  }

  return v5;
}

- (id)radarDescription
{
  v3 = [MEMORY[0x1E4F28B50] mainBundle];
  v4 = [v3 localizedStringForKey:@"INSECURE_DRAWING_RADAR_DESCRIPTION" value:&stru_1F3084718 table:@"SpringBoard"];

  v5 = [(SBDiagnosticRequestAlertItem *)self radarAttachments];
  v6 = objc_msgSend(v5, "bs_map:", &__block_literal_global_219);

  if ([v6 count])
  {
    uint64_t v7 = NSString;
    v8 = [v6 componentsJoinedByString:@"\n"];
    uint64_t v9 = [v7 stringWithFormat:@"%@\n\n%@", v4, v8];

    v4 = (void *)v9;
  }
  if ([(NSSet *)self->_layerNames count])
  {
    v10 = NSString;
    v11 = [(NSSet *)self->_layerNames allObjects];
    v12 = [v11 componentsJoinedByString:@"\n"];
    uint64_t v13 = [v10 stringWithFormat:@"%@\n\nLayer names:\n%@", v4, v12];

    v4 = (void *)v13;
  }

  return v4;
}

uint64_t __46__SBInsecureDrawingAlertItem_radarDescription__block_invoke(uint64_t a1, void *a2)
{
  return [a2 lastPathComponent];
}

- (id)radarKeywordIDs
{
  return &unk_1F3348108;
}

- (id)radarComponentID
{
  return &unk_1F334A6A0;
}

- (id)radarComponentName
{
  return @"SpringBoard";
}

- (id)radarComponentVersion
{
  return @"Secure Draw Violations";
}

- (int64_t)radarClassification
{
  return 7;
}

- (int64_t)radarReproducibility
{
  return 5;
}

- (id)_buildVersion
{
  v2 = (void *)_CFCopySystemVersionDictionaryValue();
  return v2;
}

- (NSString)processName
{
  return self->_processName;
}

- (void)setProcessName:(id)a3
{
}

- (NSSet)layerNames
{
  return self->_layerNames;
}

- (void)setLayerNames:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_layerNames, 0);
  objc_storeStrong((id *)&self->_processName, 0);
}

@end