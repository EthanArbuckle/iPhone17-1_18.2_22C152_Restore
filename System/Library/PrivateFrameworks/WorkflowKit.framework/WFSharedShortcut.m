@interface WFSharedShortcut
+ (NSDictionary)properties;
+ (NSString)recordType;
- (CKRecordID)identifier;
- (NSDate)createdAt;
- (NSNumber)iconColor;
- (NSNumber)iconGlyph;
- (NSString)createdBy;
- (NSString)name;
- (NSString)signingStatus;
- (WFFileRepresentation)iconFile;
- (WFFileRepresentation)shortcutFile;
- (WFFileRepresentation)signedShortcutFile;
- (WFWorkflowIcon)icon;
- (WFWorkflowRecord)workflowRecord;
- (id)ensureFileAssets;
- (id)propertiesForEventLogging;
- (id)sharingURL;
- (void)setCreatedAt:(id)a3 modifiedAt:(id)a4 createdBy:(id)a5;
- (void)setIcon:(id)a3;
- (void)setIconColor:(id)a3;
- (void)setIconFile:(id)a3;
- (void)setIconGlyph:(id)a3;
- (void)setName:(id)a3;
- (void)setShortcutFile:(id)a3;
- (void)setSignedShortcutFile:(id)a3;
- (void)setSigningStatus:(id)a3;
- (void)setWorkflowRecord:(id)a3;
@end

@implementation WFSharedShortcut

+ (NSDictionary)properties
{
  v15[7] = *MEMORY[0x1E4F143B8];
  v14[0] = @"name";
  v13 = +[WFCloudKitItemProperty objectPropertyWithName:](WFCloudKitItemProperty, "objectPropertyWithName:");
  v15[0] = v13;
  v14[1] = @"icon_color";
  v2 = +[WFCloudKitItemProperty objectPropertyWithName:@"iconColor"];
  v15[1] = v2;
  v14[2] = @"icon_glyph";
  v3 = +[WFCloudKitItemProperty objectPropertyWithName:@"iconGlyph"];
  v15[2] = v3;
  v14[3] = @"icon";
  v4 = [MEMORY[0x1E4FB4718] typeWithUTType:*MEMORY[0x1E4F44400]];
  v5 = +[WFCloudKitItemProperty assetPropertyWithName:@"iconFile" fileType:v4 ignoredByDefault:1 encrypted:0];
  v15[3] = v5;
  v14[4] = @"shortcut";
  v6 = [MEMORY[0x1E4FB4718] typeWithString:@"com.apple.shortcuts.workflow-file"];
  v7 = +[WFCloudKitItemProperty assetPropertyWithName:@"shortcutFile" fileType:v6];
  v15[4] = v7;
  v14[5] = @"signedShortcut";
  v8 = [MEMORY[0x1E4FB4718] typeWithString:@"com.apple.shortcut"];
  v9 = +[WFCloudKitItemProperty assetPropertyWithName:@"signedShortcutFile" fileType:v8];
  v15[5] = v9;
  v14[6] = @"signingStatus";
  v10 = +[WFCloudKitItemProperty objectPropertyWithName:](WFCloudKitItemProperty, "objectPropertyWithName:");
  v15[6] = v10;
  v11 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v15 forKeys:v14 count:7];

  return (NSDictionary *)v11;
}

+ (NSString)recordType
{
  return (NSString *)@"SharedShortcut";
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_iconFile, 0);
  objc_storeStrong((id *)&self->_signingStatus, 0);
  objc_storeStrong((id *)&self->_shortcutFile, 0);
  objc_storeStrong((id *)&self->_iconGlyph, 0);
  objc_storeStrong((id *)&self->_iconColor, 0);
  objc_storeStrong((id *)&self->_signedShortcutFile, 0);
  objc_storeStrong((id *)&self->_createdBy, 0);
  objc_storeStrong((id *)&self->_createdAt, 0);
  objc_storeStrong((id *)&self->_workflowRecord, 0);
  objc_storeStrong((id *)&self->_name, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
}

- (void)setIconFile:(id)a3
{
}

- (WFFileRepresentation)iconFile
{
  return self->_iconFile;
}

- (void)setSigningStatus:(id)a3
{
}

- (NSString)signingStatus
{
  return self->_signingStatus;
}

- (void)setShortcutFile:(id)a3
{
}

- (WFFileRepresentation)shortcutFile
{
  return self->_shortcutFile;
}

- (void)setIconGlyph:(id)a3
{
}

- (NSNumber)iconGlyph
{
  return self->_iconGlyph;
}

- (void)setIconColor:(id)a3
{
}

- (NSNumber)iconColor
{
  return self->_iconColor;
}

- (void)setSignedShortcutFile:(id)a3
{
}

- (WFFileRepresentation)signedShortcutFile
{
  return self->_signedShortcutFile;
}

- (NSString)createdBy
{
  return self->_createdBy;
}

- (NSDate)createdAt
{
  return self->_createdAt;
}

- (void)setWorkflowRecord:(id)a3
{
}

- (void)setName:(id)a3
{
}

- (NSString)name
{
  return self->_name;
}

- (CKRecordID)identifier
{
  return self->_identifier;
}

- (id)propertiesForEventLogging
{
  v10[3] = *MEMORY[0x1E4F143B8];
  v9[0] = @"workflow_identifier";
  v3 = [(WFSharedShortcut *)self identifier];
  v4 = [v3 recordName];
  v10[0] = v4;
  v9[1] = @"workflow_name";
  v5 = [(WFSharedShortcut *)self name];
  v10[1] = v5;
  v9[2] = @"workflow_record_type";
  v6 = [(id)objc_opt_class() recordType];
  v10[2] = v6;
  v7 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v10 forKeys:v9 count:3];

  return v7;
}

- (id)sharingURL
{
  v2 = [(WFSharedShortcut *)self identifier];
  v3 = [v2 recordName];
  v4 = WFGallerySharingURLForIdentifier(v3);

  return v4;
}

- (void)setCreatedAt:(id)a3 modifiedAt:(id)a4 createdBy:(id)a5
{
  objc_storeStrong((id *)&self->_createdAt, a3);
  id v11 = a3;
  id v8 = a5;
  v9 = (NSString *)[v8 copy];

  createdBy = self->_createdBy;
  self->_createdBy = v9;
}

- (id)ensureFileAssets
{
  if (self->_workflowRecord)
  {
    v3 = [(WFSharedShortcut *)self workflowRecord];
    v4 = [v3 fileRepresentation];

    v5 = [(WFSharedShortcut *)self identifier];
    v6 = [v5 recordName];
    [v4 setName:v6];

    v7 = [v4 writeToDiskWithError:0];
    [(WFSharedShortcut *)self setShortcutFile:v7];
  }
  id v8 = [(WFSharedShortcut *)self icon];

  if (v8)
  {
    id v9 = objc_alloc(MEMORY[0x1E4FB4A58]);
    v10 = [(WFSharedShortcut *)self icon];
    id v11 = (void *)[v9 initWithIcon:v10];

    [v11 setCornerRadius:8.0];
    v12 = objc_msgSend(v11, "imageWithSize:", 150.0, 150.0);
    v13 = (void *)MEMORY[0x1E4F5A900];
    v14 = [v12 PNGRepresentation];
    v15 = [MEMORY[0x1E4FB4718] typeWithUTType:*MEMORY[0x1E4F44460]];
    v16 = [v13 fileWithData:v14 ofType:v15 proposedFilename:0];
    [(WFSharedShortcut *)self setIconFile:v16];
  }
  else
  {
    [(WFSharedShortcut *)self setIconFile:0];
  }
  return 0;
}

- (void)setIcon:(id)a3
{
  v4 = NSNumber;
  id v5 = a3;
  v6 = objc_msgSend(v4, "numberWithInteger:", objc_msgSend(v5, "backgroundColorValue"));
  [(WFSharedShortcut *)self setIconColor:v6];

  v7 = NSNumber;
  uint64_t v8 = [v5 glyphCharacter];

  id v9 = [v7 numberWithUnsignedShort:v8];
  [(WFSharedShortcut *)self setIconGlyph:v9];
}

- (WFWorkflowRecord)workflowRecord
{
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  if (self->_workflowRecord) {
    goto LABEL_2;
  }
  id v5 = [(WFSharedShortcut *)self signedShortcutFile];

  if (!v5) {
    goto LABEL_2;
  }
  v6 = [(WFSharedShortcut *)self signedShortcutFile];

  if (!v6)
  {
    v26 = getWFGeneralLogObject();
    if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315138;
      v31 = "-[WFSharedShortcut workflowRecord]";
      _os_log_impl(&dword_1C7F0A000, v26, OS_LOG_TYPE_ERROR, "%s WFSharedShortcut doesn't have signed shortcut file", buf, 0xCu);
    }

    goto LABEL_23;
  }
  v7 = [WFShortcutPackageFile alloc];
  uint64_t v8 = [(WFSharedShortcut *)self signedShortcutFile];
  id v9 = [v8 data];
  v10 = [(WFSharedShortcut *)self name];
  id v11 = [(WFShortcutPackageFile *)v7 initWithSignedShortcutData:v9 shortcutName:v10];

  id v29 = 0;
  v12 = [(WFShortcutPackageFile *)v11 extractShortcutFileRepresentationWithError:&v29];
  id v13 = v29;
  if (!v12) {
    goto LABEL_12;
  }
  v14 = [(WFSharedShortcut *)self signingStatus];
  char v15 = [v14 isEqualToString:@"APPROVED"];

  if (v15)
  {
    v16 = [WFWorkflowFileDescriptor alloc];
    v17 = [(WFSharedShortcut *)self name];
    v18 = [(WFWorkflowFileDescriptor *)v16 initWithFile:v12 name:v17];

    id v28 = 0;
    v19 = [[WFWorkflowFile alloc] initWithDescriptor:v18 error:&v28];
    id v20 = v28;
    id v27 = v20;
    v21 = [(WFWorkflowFile *)v19 recordRepresentationWithError:&v27];
    id v22 = v27;

    [v21 setSource:@"ShortcutSourceCloudLink"];
    if (v21)
    {
      v23 = v21;
      int v24 = 0;
      p_super = &self->_workflowRecord->super.super;
      self->_workflowRecord = v23;
    }
    else
    {
      p_super = getWFGeneralLogObject();
      if (os_log_type_enabled(p_super, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136315394;
        v31 = "-[WFSharedShortcut workflowRecord]";
        __int16 v32 = 2114;
        id v33 = v22;
        _os_log_impl(&dword_1C7F0A000, p_super, OS_LOG_TYPE_ERROR, "%s WFSharedShortcut was unable to load record from shortcut file: %{public}@", buf, 0x16u);
      }
      int v24 = 1;
    }
  }
  else
  {
LABEL_12:
    v18 = getWFGeneralLogObject();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      v31 = "-[WFSharedShortcut workflowRecord]";
      __int16 v32 = 2114;
      id v33 = v13;
      _os_log_impl(&dword_1C7F0A000, v18, OS_LOG_TYPE_ERROR, "%s WFSharedShortcut was unable to verify signed shortcut: %{public}@", buf, 0x16u);
    }
    int v24 = 1;
  }

  if (!v24)
  {
LABEL_2:
    v3 = self->_workflowRecord;
    goto LABEL_3;
  }
LABEL_23:
  v3 = 0;
LABEL_3:
  return v3;
}

- (WFWorkflowIcon)icon
{
  v3 = [(WFSharedShortcut *)self iconGlyph];
  uint64_t v4 = [(WFSharedShortcut *)self iconColor];
  if (!v3)
  {
    v3 = objc_msgSend(NSNumber, "numberWithUnsignedShort:", objc_msgSend(MEMORY[0x1E4FB4A50], "defaultGlyphCharacter"));
  }
  if (v4) {
    id v5 = (void *)v4;
  }
  else {
    id v5 = &unk_1F2316A10;
  }
  id v6 = objc_alloc(MEMORY[0x1E4FB4A50]);
  v7 = [(WFSharedShortcut *)self iconColor];
  uint64_t v8 = [v7 integerValue];
  id v9 = [(WFSharedShortcut *)self iconGlyph];
  v10 = objc_msgSend(v6, "initWithBackgroundColorValue:glyphCharacter:customImageData:", v8, (unsigned __int16)objc_msgSend(v9, "unsignedIntegerValue"), 0);

  return (WFWorkflowIcon *)v10;
}

@end