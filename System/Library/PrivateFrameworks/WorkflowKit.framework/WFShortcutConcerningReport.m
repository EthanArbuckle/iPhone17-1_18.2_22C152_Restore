@interface WFShortcutConcerningReport
+ (NSDictionary)properties;
+ (NSString)recordType;
- (CKRecordID)identifier;
- (CKRecordID)shortcut;
- (NSString)reportMessage;
- (NSString)reportReason;
- (NSString)status;
- (WFFileRepresentation)shortcutContent;
- (WFShortcutConcerningReport)initWithReason:(id)a3 shortcutContent:(id)a4;
- (void)setReportMessage:(id)a3;
- (void)setReportReason:(id)a3;
- (void)setShortcut:(id)a3;
- (void)setShortcutContent:(id)a3;
- (void)setStatus:(id)a3;
@end

@implementation WFShortcutConcerningReport

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_status, 0);
  objc_storeStrong((id *)&self->_shortcutContent, 0);
  objc_storeStrong((id *)&self->_shortcut, 0);
  objc_storeStrong((id *)&self->_reportMessage, 0);
  objc_storeStrong((id *)&self->_reportReason, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
}

- (void)setStatus:(id)a3
{
}

- (NSString)status
{
  return self->_status;
}

- (void)setShortcutContent:(id)a3
{
}

- (WFFileRepresentation)shortcutContent
{
  return self->_shortcutContent;
}

- (void)setShortcut:(id)a3
{
}

- (CKRecordID)shortcut
{
  return self->_shortcut;
}

- (void)setReportMessage:(id)a3
{
}

- (NSString)reportMessage
{
  return self->_reportMessage;
}

- (void)setReportReason:(id)a3
{
}

- (NSString)reportReason
{
  return self->_reportReason;
}

- (CKRecordID)identifier
{
  return self->_identifier;
}

- (WFShortcutConcerningReport)initWithReason:(id)a3 shortcutContent:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v9 = v8;
  if (v7)
  {
    if (v8) {
      goto LABEL_3;
    }
  }
  else
  {
    v16 = [MEMORY[0x1E4F28B00] currentHandler];
    [v16 handleFailureInMethod:a2, self, @"WFGalleryPage.m", 711, @"Invalid parameter not satisfying: %@", @"reason" object file lineNumber description];

    if (v9) {
      goto LABEL_3;
    }
  }
  v17 = [MEMORY[0x1E4F28B00] currentHandler];
  [v17 handleFailureInMethod:a2, self, @"WFGalleryPage.m", 712, @"Invalid parameter not satisfying: %@", @"shortcutContent" object file lineNumber description];

LABEL_3:
  v18.receiver = self;
  v18.super_class = (Class)WFShortcutConcerningReport;
  v10 = [(WFShortcutConcerningReport *)&v18 init];
  if (v10)
  {
    uint64_t v11 = [v7 copy];
    reportReason = v10->_reportReason;
    v10->_reportReason = (NSString *)v11;

    objc_storeStrong((id *)&v10->_shortcutContent, a4);
    status = v10->_status;
    v10->_status = (NSString *)@"screen";

    v14 = v10;
  }

  return v10;
}

+ (NSDictionary)properties
{
  v11[5] = *MEMORY[0x1E4F143B8];
  v10[0] = @"reportMessage";
  v2 = +[WFCloudKitItemProperty objectPropertyWithName:](WFCloudKitItemProperty, "objectPropertyWithName:");
  v11[0] = v2;
  v10[1] = @"reportReason";
  v3 = +[WFCloudKitItemProperty objectPropertyWithName:](WFCloudKitItemProperty, "objectPropertyWithName:");
  v11[1] = v3;
  v10[2] = @"shortcut";
  v4 = +[WFCloudKitItemProperty itemReferencePropertyWithName:@"shortcut" itemClass:objc_opt_class()];
  v11[2] = v4;
  v10[3] = @"shortcutContent";
  v5 = [MEMORY[0x1E4FB4718] typeWithString:@"com.apple.shortcuts.workflow-file"];
  v6 = +[WFCloudKitItemProperty assetPropertyWithName:@"shortcutContent" fileType:v5];
  v11[3] = v6;
  v10[4] = @"status";
  id v7 = +[WFCloudKitItemProperty objectPropertyWithName:](WFCloudKitItemProperty, "objectPropertyWithName:");
  v11[4] = v7;
  id v8 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v11 forKeys:v10 count:5];

  return (NSDictionary *)v8;
}

+ (NSString)recordType
{
  return (NSString *)@"ShortcutConcerningReport";
}

@end