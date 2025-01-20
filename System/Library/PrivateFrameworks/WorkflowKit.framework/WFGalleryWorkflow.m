@interface WFGalleryWorkflow
+ (NSDictionary)properties;
+ (NSString)recordType;
- (BOOL)isEqual:(id)a3;
- (CKRecordID)base;
- (CKRecordID)identifier;
- (NSArray)hiddenRegions;
- (NSArray)supportedIdioms;
- (NSDate)createdAt;
- (NSDate)modifiedAt;
- (NSNumber)iconColor;
- (NSNumber)iconGlyph;
- (NSNumber)searchable;
- (NSString)language;
- (NSString)longDescription;
- (NSString)name;
- (NSString)persistentIdentifier;
- (NSString)shortDescription;
- (NSString)signingStatus;
- (WFFileRepresentation)iconFile;
- (WFFileRepresentation)shortcutFile;
- (WFFileRepresentation)signedShortcutFile;
- (WFWorkflowIcon)icon;
- (WFWorkflowRecord)workflowRecord;
- (id)copyWithZone:(_NSZone *)a3;
- (id)ensureFileAssets;
- (id)mutableCopyWithZone:(_NSZone *)a3;
- (id)propertiesForEventLogging;
- (id)sharingURL;
- (int64_t)minVersion;
- (unint64_t)hash;
- (unint64_t)referenceActionForKey:(id)a3;
- (void)setCreatedAt:(id)a3 modifiedAt:(id)a4 createdBy:(id)a5;
- (void)setIconColor:(id)a3;
- (void)setIconGlyph:(id)a3;
- (void)setSignedShortcutFile:(id)a3;
- (void)setSigningStatus:(id)a3;
@end

@implementation WFGalleryWorkflow

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_signingStatus, 0);
  objc_storeStrong((id *)&self->_iconGlyph, 0);
  objc_storeStrong((id *)&self->_iconColor, 0);
  objc_storeStrong((id *)&self->_iconFile, 0);
  objc_storeStrong((id *)&self->_signedShortcutFile, 0);
  objc_storeStrong((id *)&self->_shortcutFile, 0);
  objc_storeStrong((id *)&self->_persistentIdentifier, 0);
  objc_storeStrong((id *)&self->_base, 0);
  objc_storeStrong((id *)&self->_language, 0);
  objc_storeStrong((id *)&self->_modifiedAt, 0);
  objc_storeStrong((id *)&self->_createdAt, 0);
  objc_storeStrong((id *)&self->_supportedIdioms, 0);
  objc_storeStrong((id *)&self->_hiddenRegions, 0);
  objc_storeStrong((id *)&self->_searchable, 0);
  objc_storeStrong((id *)&self->_longDescription, 0);
  objc_storeStrong((id *)&self->_shortDescription, 0);
  objc_storeStrong((id *)&self->_name, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_storeStrong((id *)&self->_workflowRecord, 0);
}

- (void)setSigningStatus:(id)a3
{
}

- (NSString)signingStatus
{
  return self->_signingStatus;
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

- (WFFileRepresentation)iconFile
{
  return self->_iconFile;
}

- (void)setSignedShortcutFile:(id)a3
{
}

- (WFFileRepresentation)signedShortcutFile
{
  return self->_signedShortcutFile;
}

- (WFFileRepresentation)shortcutFile
{
  return self->_shortcutFile;
}

- (NSString)persistentIdentifier
{
  return self->_persistentIdentifier;
}

- (CKRecordID)base
{
  return self->_base;
}

- (NSString)language
{
  return self->_language;
}

- (NSDate)modifiedAt
{
  return self->_modifiedAt;
}

- (NSDate)createdAt
{
  return self->_createdAt;
}

- (NSArray)supportedIdioms
{
  return self->_supportedIdioms;
}

- (NSArray)hiddenRegions
{
  return self->_hiddenRegions;
}

- (int64_t)minVersion
{
  return self->_minVersion;
}

- (NSNumber)searchable
{
  return self->_searchable;
}

- (NSString)longDescription
{
  return self->_longDescription;
}

- (NSString)shortDescription
{
  return self->_shortDescription;
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
  v9[3] = *MEMORY[0x1E4F143B8];
  v8[0] = @"workflow_identifier";
  v3 = [(WFGalleryWorkflow *)self persistentIdentifier];
  v9[0] = v3;
  v8[1] = @"workflow_name";
  v4 = [(WFGalleryWorkflow *)self name];
  v9[1] = v4;
  v8[2] = @"workflow_record_type";
  v5 = [(id)objc_opt_class() recordType];
  v9[2] = v5;
  v6 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v9 forKeys:v8 count:3];

  return v6;
}

- (id)mutableCopyWithZone:(_NSZone *)a3
{
  v5 = [+[WFMutableGalleryWorkflow allocWithZone:](WFMutableGalleryWorkflow, "allocWithZone:") init];
  v6 = [(WFGalleryWorkflow *)self identifier];
  v7 = (void *)[v6 copyWithZone:a3];
  [(WFMutableGalleryWorkflow *)v5 setIdentifier:v7];

  v8 = [(WFGalleryWorkflow *)self language];
  v9 = (void *)[v8 copyWithZone:a3];
  [(WFMutableGalleryWorkflow *)v5 setLanguage:v9];

  v10 = [(WFGalleryWorkflow *)self name];
  v11 = (void *)[v10 copyWithZone:a3];
  [(WFMutableGalleryWorkflow *)v5 setName:v11];

  v12 = [(WFGalleryWorkflow *)self shortDescription];
  v13 = (void *)[v12 copyWithZone:a3];
  [(WFMutableGalleryWorkflow *)v5 setShortDescription:v13];

  v14 = [(WFGalleryWorkflow *)self longDescription];
  v15 = (void *)[v14 copyWithZone:a3];
  [(WFMutableGalleryWorkflow *)v5 setLongDescription:v15];

  v16 = [(WFGalleryWorkflow *)self createdAt];
  v17 = (void *)[v16 copyWithZone:a3];
  [(WFMutableGalleryWorkflow *)v5 setCreatedAt:v17];

  v18 = [(WFGalleryWorkflow *)self modifiedAt];
  v19 = (void *)[v18 copyWithZone:a3];
  [(WFMutableGalleryWorkflow *)v5 setModifiedAt:v19];

  v20 = [(WFGalleryWorkflow *)self searchable];
  v21 = (void *)[v20 copyWithZone:a3];
  [(WFMutableGalleryWorkflow *)v5 setSearchable:v21];

  [(WFMutableGalleryWorkflow *)v5 setMinVersion:[(WFGalleryWorkflow *)self minVersion]];
  v22 = [(WFGalleryWorkflow *)self hiddenRegions];
  v23 = (void *)[v22 copyWithZone:a3];
  [(WFMutableGalleryWorkflow *)v5 setHiddenRegions:v23];

  v24 = [(WFGalleryWorkflow *)self supportedIdioms];
  v25 = (void *)[v24 copyWithZone:a3];
  [(WFMutableGalleryWorkflow *)v5 setSupportedIdioms:v25];

  v26 = [(WFGalleryWorkflow *)self language];
  v27 = (void *)[v26 copyWithZone:a3];
  [(WFMutableGalleryWorkflow *)v5 setLanguage:v27];

  v28 = [(WFGalleryWorkflow *)self base];
  [(WFMutableGalleryWorkflow *)v5 setBase:v28];

  v29 = [(WFGalleryWorkflow *)self persistentIdentifier];
  v30 = (void *)[v29 copyWithZone:a3];
  [(WFMutableGalleryWorkflow *)v5 setPersistentIdentifier:v30];

  v31 = [(WFGalleryWorkflow *)self iconFile];
  v32 = (void *)[v31 copyWithZone:a3];
  [(WFMutableGalleryWorkflow *)v5 setIconFile:v32];

  v33 = [(WFGalleryWorkflow *)self iconColor];
  v34 = (void *)[v33 copyWithZone:a3];
  [(WFGalleryWorkflow *)v5 setIconColor:v34];

  v35 = [(WFGalleryWorkflow *)self iconGlyph];
  v36 = (void *)[v35 copyWithZone:a3];
  [(WFGalleryWorkflow *)v5 setIconGlyph:v36];

  v37 = [(WFGalleryWorkflow *)self workflowRecord];
  v38 = (void *)[v37 copyWithZone:a3];
  [(WFMutableGalleryWorkflow *)v5 setWorkflowRecord:v38];

  v39 = [(WFGalleryWorkflow *)self shortcutFile];
  v40 = (void *)[v39 copyWithZone:a3];
  [(WFMutableGalleryWorkflow *)v5 setShortcutFile:v40];

  return v5;
}

+ (NSDictionary)properties
{
  v24[16] = *MEMORY[0x1E4F143B8];
  v23[0] = @"name";
  v22 = +[WFCloudKitItemProperty objectPropertyWithName:](WFCloudKitItemProperty, "objectPropertyWithName:");
  v24[0] = v22;
  v23[1] = @"shortDescription";
  v21 = +[WFCloudKitItemProperty objectPropertyWithName:](WFCloudKitItemProperty, "objectPropertyWithName:");
  v24[1] = v21;
  v23[2] = @"longDescription";
  v20 = +[WFCloudKitItemProperty objectPropertyWithName:](WFCloudKitItemProperty, "objectPropertyWithName:");
  v24[2] = v20;
  v23[3] = @"icon_color";
  v19 = +[WFCloudKitItemProperty objectPropertyWithName:@"iconColor"];
  v24[3] = v19;
  v23[4] = @"icon_glyph";
  v18 = +[WFCloudKitItemProperty objectPropertyWithName:@"iconGlyph"];
  v24[4] = v18;
  v23[5] = @"icon";
  v17 = [MEMORY[0x1E4FB4718] typeWithUTType:*MEMORY[0x1E4F44400]];
  v16 = +[WFCloudKitItemProperty assetPropertyWithName:@"iconFile" fileType:v17 ignoredByDefault:1 encrypted:0];
  v24[5] = v16;
  v23[6] = @"shortcut";
  v15 = [MEMORY[0x1E4FB4718] typeWithString:@"com.apple.shortcuts.workflow-file"];
  v14 = +[WFCloudKitItemProperty assetPropertyWithName:@"shortcutFile" fileType:v15 ignoredByDefault:1 encrypted:0];
  v24[6] = v14;
  v23[7] = @"searchable";
  v13 = +[WFCloudKitItemProperty objectPropertyWithName:](WFCloudKitItemProperty, "objectPropertyWithName:");
  v24[7] = v13;
  v23[8] = @"minVersion";
  v2 = +[WFCloudKitItemProperty scalarPropertyWithName:nilValue:](WFCloudKitItemProperty, "scalarPropertyWithName:nilValue:");
  v24[8] = v2;
  v23[9] = @"hiddenRegions";
  v3 = +[WFCloudKitItemProperty objectPropertyWithName:](WFCloudKitItemProperty, "objectPropertyWithName:");
  v24[9] = v3;
  v23[10] = @"supportedIdioms";
  v4 = +[WFCloudKitItemProperty objectPropertyWithName:](WFCloudKitItemProperty, "objectPropertyWithName:");
  v24[10] = v4;
  v23[11] = @"language";
  v5 = +[WFCloudKitItemProperty objectPropertyWithName:ignoredByDefault:encrypted:](WFCloudKitItemProperty, "objectPropertyWithName:ignoredByDefault:encrypted:");
  v24[11] = v5;
  v23[12] = @"base";
  v6 = +[WFCloudKitItemProperty itemReferencePropertyWithName:@"base" itemClass:objc_opt_class()];
  v24[12] = v6;
  v23[13] = @"persistentIdentifier";
  v7 = +[WFCloudKitItemProperty objectPropertyWithName:](WFCloudKitItemProperty, "objectPropertyWithName:");
  v24[13] = v7;
  v23[14] = @"signedShortcut";
  v8 = [MEMORY[0x1E4FB4718] typeWithString:@"com.apple.shortcut"];
  v9 = +[WFCloudKitItemProperty assetPropertyWithName:@"signedShortcutFile" fileType:v8 ignoredByDefault:1 encrypted:0];
  v24[14] = v9;
  v23[15] = @"signingStatus";
  v10 = +[WFCloudKitItemProperty objectPropertyWithName:ignoredByDefault:encrypted:](WFCloudKitItemProperty, "objectPropertyWithName:ignoredByDefault:encrypted:");
  v24[15] = v10;
  v11 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v24 forKeys:v23 count:16];

  return (NSDictionary *)v11;
}

+ (NSString)recordType
{
  return (NSString *)@"GalleryShortcut";
}

- (id)copyWithZone:(_NSZone *)a3
{
  v5 = [+[WFGalleryWorkflow allocWithZone:](WFGalleryWorkflow, "allocWithZone:") init];
  v6 = [(WFGalleryWorkflow *)self identifier];
  uint64_t v7 = [v6 copyWithZone:a3];
  identifier = v5->_identifier;
  v5->_identifier = (CKRecordID *)v7;

  v9 = [(WFGalleryWorkflow *)self name];
  uint64_t v10 = [v9 copyWithZone:a3];
  name = v5->_name;
  v5->_name = (NSString *)v10;

  v12 = [(WFGalleryWorkflow *)self shortDescription];
  uint64_t v13 = [v12 copyWithZone:a3];
  shortDescription = v5->_shortDescription;
  v5->_shortDescription = (NSString *)v13;

  v15 = [(WFGalleryWorkflow *)self longDescription];
  uint64_t v16 = [v15 copyWithZone:a3];
  longDescription = v5->_longDescription;
  v5->_longDescription = (NSString *)v16;

  v18 = [(WFGalleryWorkflow *)self createdAt];
  uint64_t v19 = [v18 copyWithZone:a3];
  createdAt = v5->_createdAt;
  v5->_createdAt = (NSDate *)v19;

  v21 = [(WFGalleryWorkflow *)self modifiedAt];
  uint64_t v22 = [v21 copyWithZone:a3];
  modifiedAt = v5->_modifiedAt;
  v5->_modifiedAt = (NSDate *)v22;

  v24 = [(WFGalleryWorkflow *)self searchable];
  uint64_t v25 = [v24 copyWithZone:a3];
  searchable = v5->_searchable;
  v5->_searchable = (NSNumber *)v25;

  v5->_minVersion = [(WFGalleryWorkflow *)self minVersion];
  v27 = [(WFGalleryWorkflow *)self hiddenRegions];
  uint64_t v28 = [v27 copyWithZone:a3];
  hiddenRegions = v5->_hiddenRegions;
  v5->_hiddenRegions = (NSArray *)v28;

  v30 = [(WFGalleryWorkflow *)self supportedIdioms];
  uint64_t v31 = [v30 copyWithZone:a3];
  supportedIdioms = v5->_supportedIdioms;
  v5->_supportedIdioms = (NSArray *)v31;

  v33 = [(WFGalleryWorkflow *)self language];
  uint64_t v34 = [v33 copyWithZone:a3];
  language = v5->_language;
  v5->_language = (NSString *)v34;

  uint64_t v36 = [(WFGalleryWorkflow *)self base];
  base = v5->_base;
  v5->_base = (CKRecordID *)v36;

  v38 = [(WFGalleryWorkflow *)self persistentIdentifier];
  uint64_t v39 = [v38 copyWithZone:a3];
  persistentIdentifier = v5->_persistentIdentifier;
  v5->_persistentIdentifier = (NSString *)v39;

  v41 = [(WFGalleryWorkflow *)self iconFile];
  uint64_t v42 = [v41 copyWithZone:a3];
  iconFile = v5->_iconFile;
  v5->_iconFile = (WFFileRepresentation *)v42;

  v44 = [(WFGalleryWorkflow *)self iconColor];
  uint64_t v45 = [v44 copyWithZone:a3];
  iconColor = v5->_iconColor;
  v5->_iconColor = (NSNumber *)v45;

  v47 = [(WFGalleryWorkflow *)self iconGlyph];
  uint64_t v48 = [v47 copyWithZone:a3];
  iconGlyph = v5->_iconGlyph;
  v5->_iconGlyph = (NSNumber *)v48;

  v50 = [(WFGalleryWorkflow *)self workflowRecord];
  uint64_t v51 = [v50 copyWithZone:a3];
  workflowRecord = v5->_workflowRecord;
  v5->_workflowRecord = (WFWorkflowRecord *)v51;

  v53 = [(WFGalleryWorkflow *)self shortcutFile];
  uint64_t v54 = [v53 copyWithZone:a3];
  shortcutFile = v5->_shortcutFile;
  v5->_shortcutFile = (WFFileRepresentation *)v54;

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  v4 = (WFGalleryWorkflow *)a3;
  if (self == v4)
  {
    char v10 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v5 = [(WFGalleryWorkflow *)self identifier];
      v6 = [(WFGalleryWorkflow *)v4 identifier];
      id v7 = v5;
      id v8 = v6;
      v9 = v8;
      if (v7 == v8)
      {
      }
      else
      {
        char v10 = 0;
        v11 = v8;
        id v12 = v7;
        if (!v7 || !v8) {
          goto LABEL_78;
        }
        int v13 = [v7 isEqual:v8];

        if (!v13)
        {
          char v10 = 0;
LABEL_79:

          goto LABEL_80;
        }
      }
      v14 = [(WFGalleryWorkflow *)self name];
      v15 = [(WFGalleryWorkflow *)v4 name];
      id v12 = v14;
      id v16 = v15;
      v11 = v16;
      if (v12 == v16)
      {
      }
      else
      {
        char v10 = 0;
        v17 = v16;
        id v18 = v12;
        if (!v12 || !v16) {
          goto LABEL_77;
        }
        int v19 = [v12 isEqualToString:v16];

        if (!v19)
        {
          char v10 = 0;
LABEL_78:

          goto LABEL_79;
        }
      }
      v20 = [(WFGalleryWorkflow *)self createdAt];
      v21 = [(WFGalleryWorkflow *)v4 createdAt];
      id v18 = v20;
      id v22 = v21;
      v17 = v22;
      if (v18 == v22)
      {

        id v81 = v18;
      }
      else
      {
        char v10 = 0;
        v23 = v22;
        id v24 = v18;
        if (!v18 || !v22) {
          goto LABEL_76;
        }
        uint64_t v25 = v18;
        int v26 = [v18 isEqual:v22];

        id v81 = v25;
        if (!v26)
        {
          char v10 = 0;
          id v18 = v25;
LABEL_77:

          goto LABEL_78;
        }
      }
      v27 = [(WFGalleryWorkflow *)self modifiedAt];
      uint64_t v28 = [(WFGalleryWorkflow *)v4 modifiedAt];
      id v24 = v27;
      id v29 = v28;
      v80 = v29;
      if (v24 != v29)
      {
        char v10 = 0;
        if (v24)
        {
          v30 = v29;
          uint64_t v31 = v24;
          if (v29)
          {
            int v78 = [v24 isEqual:v29];

            id v18 = v81;
            if (!v78) {
              goto LABEL_35;
            }
LABEL_29:
            int64_t v32 = [(WFGalleryWorkflow *)self minVersion];
            if (v32 != [(WFGalleryWorkflow *)v4 minVersion])
            {
LABEL_35:
              char v10 = 0;
              v23 = v80;
LABEL_76:

              goto LABEL_77;
            }
            id v81 = v18;
            id v79 = v24;
            v33 = [(WFGalleryWorkflow *)self hiddenRegions];
            uint64_t v34 = [(WFGalleryWorkflow *)v4 hiddenRegions];
            id v35 = v33;
            id v36 = v34;
            v76 = v36;
            v77 = v35;
            if (v35 != v36)
            {
              char v10 = 0;
              if (v35)
              {
                v37 = v36;
                id v38 = v35;
                id v24 = v79;
                if (v36)
                {
                  int v39 = [v77 isEqualToArray:v36];

                  if (!v39)
                  {
                    char v10 = 0;
                    id v24 = v79;
LABEL_74:
                    v30 = v76;
                    uint64_t v31 = v77;
                    goto LABEL_75;
                  }
LABEL_38:
                  v40 = [(WFGalleryWorkflow *)self supportedIdioms];
                  v41 = [(WFGalleryWorkflow *)v4 supportedIdioms];
                  id v38 = v40;
                  id v42 = v41;
                  v75 = v42;
                  if (v38 != v42)
                  {
                    char v10 = 0;
                    if (v38)
                    {
                      v43 = v42;
                      id v44 = v38;
                      id v24 = v79;
                      if (v42)
                      {
                        uint64_t v45 = v38;
                        int v46 = [v38 isEqualToArray:v42];

                        id v74 = v45;
                        if (!v46)
                        {
                          char v10 = 0;
                          id v24 = v79;
                          id v38 = v74;
LABEL_72:
                          v37 = v75;
                          goto LABEL_73;
                        }
LABEL_44:
                        v47 = [(WFGalleryWorkflow *)self shortDescription];
                        uint64_t v48 = [(WFGalleryWorkflow *)v4 shortDescription];
                        id v49 = v47;
                        id v50 = v48;
                        v72 = v50;
                        v73 = v49;
                        if (v49 != v50)
                        {
                          char v10 = 0;
                          if (v49)
                          {
                            uint64_t v51 = v50;
                            id v52 = v49;
                            id v24 = v79;
                            id v38 = v74;
                            if (v50)
                            {
                              int v53 = [v73 isEqualToString:v50];

                              if (!v53)
                              {
                                char v10 = 0;
                                id v24 = v79;
                                id v38 = v74;
LABEL_70:
                                v43 = v72;
                                id v44 = v73;
                                goto LABEL_71;
                              }
LABEL_51:
                              uint64_t v54 = [(WFGalleryWorkflow *)self longDescription];
                              v55 = [(WFGalleryWorkflow *)v4 longDescription];
                              id v56 = v54;
                              id v57 = v55;
                              v70 = v56;
                              v71 = v57;
                              if (v56 == v57)
                              {
                              }
                              else
                              {
                                char v10 = 0;
                                if (!v56)
                                {
                                  v58 = v57;
                                  id v59 = 0;
                                  id v24 = v79;
                                  id v38 = v74;
                                  goto LABEL_67;
                                }
                                v58 = v57;
                                id v59 = v56;
                                id v24 = v79;
                                id v38 = v74;
                                if (!v57)
                                {
LABEL_67:
                                  v65 = v59;

                                  id v52 = v70;
                                  goto LABEL_68;
                                }
                                int v60 = [v70 isEqualToString:v57];

                                if (!v60)
                                {
                                  char v10 = 0;
                                  id v52 = v70;
                                  id v24 = v79;
                                  id v38 = v74;
LABEL_68:
                                  uint64_t v51 = v71;
                                  goto LABEL_69;
                                }
                              }
                              v61 = [(WFGalleryWorkflow *)self workflowRecord];
                              v62 = [(WFGalleryWorkflow *)v4 workflowRecord];
                              id v63 = v61;
                              id v64 = v62;
                              v69 = v64;
                              if (v63 == v64)
                              {
                                char v10 = 1;
                              }
                              else
                              {
                                char v10 = 0;
                                if (v63)
                                {
                                  id v24 = v79;
                                  id v38 = v74;
                                  if (v64) {
                                    char v10 = [v63 isEqual:v64];
                                  }
                                  goto LABEL_65;
                                }
                              }
                              id v24 = v79;
                              id v38 = v74;
LABEL_65:

                              v58 = v69;
                              id v59 = v63;
                              goto LABEL_67;
                            }
                          }
                          else
                          {
                            uint64_t v51 = v50;
                            id v52 = 0;
                            id v24 = v79;
                            id v38 = v74;
                          }
LABEL_69:
                          v66 = v52;

                          goto LABEL_70;
                        }

                        goto LABEL_51;
                      }
                    }
                    else
                    {
                      v43 = v42;
                      id v44 = 0;
                      id v24 = v79;
                    }
LABEL_71:
                    v67 = v44;

                    goto LABEL_72;
                  }

                  id v74 = v38;
                  goto LABEL_44;
                }
              }
              else
              {
                v37 = v36;
                id v38 = 0;
                id v24 = v79;
              }
LABEL_73:

              goto LABEL_74;
            }

            goto LABEL_38;
          }
        }
        else
        {
          v30 = v29;
          uint64_t v31 = 0;
        }
LABEL_75:

        v23 = v80;
        id v18 = v81;
        goto LABEL_76;
      }

      id v18 = v81;
      goto LABEL_29;
    }
    char v10 = 0;
  }
LABEL_80:

  return v10;
}

- (unint64_t)hash
{
  v3 = [(WFGalleryWorkflow *)self identifier];
  uint64_t v4 = [v3 hash];
  v5 = [(WFGalleryWorkflow *)self name];
  uint64_t v6 = [v5 hash] ^ v4;
  id v7 = [(WFGalleryWorkflow *)self createdAt];
  uint64_t v8 = [v7 hash];
  int64_t v9 = v6 ^ v8 ^ [(WFGalleryWorkflow *)self minVersion];
  char v10 = [(WFGalleryWorkflow *)self modifiedAt];
  uint64_t v11 = [v10 hash];
  id v12 = [(WFGalleryWorkflow *)self shortDescription];
  uint64_t v13 = v11 ^ [v12 hash];
  v14 = [(WFGalleryWorkflow *)self longDescription];
  uint64_t v15 = v9 ^ v13 ^ [v14 hash];
  id v16 = [(WFGalleryWorkflow *)self workflowRecord];
  unint64_t v17 = v15 ^ [v16 hash];

  return v17;
}

- (id)ensureFileAssets
{
  if (self->_workflowRecord)
  {
    v3 = [(WFGalleryWorkflow *)self workflowRecord];
    uint64_t v4 = [v3 fileRepresentation];

    v5 = [(WFGalleryWorkflow *)self identifier];
    uint64_t v6 = [v5 recordName];
    [v4 setName:v6];

    id v7 = [v4 writeToDiskWithError:0];
    shortcutFile = self->_shortcutFile;
    self->_shortcutFile = v7;
  }
  int64_t v9 = [(WFGalleryWorkflow *)self icon];

  if (v9)
  {
    id v10 = objc_alloc(MEMORY[0x1E4FB4A58]);
    uint64_t v11 = [(WFGalleryWorkflow *)self icon];
    id v12 = (WFFileRepresentation *)[v10 initWithIcon:v11];

    [(WFFileRepresentation *)v12 setCornerRadius:8.0];
    uint64_t v13 = -[WFFileRepresentation imageWithSize:](v12, "imageWithSize:", 60.0, 60.0);
    v14 = (void *)MEMORY[0x1E4F5A900];
    uint64_t v15 = [v13 PNGRepresentation];
    id v16 = [MEMORY[0x1E4FB4718] typeWithUTType:*MEMORY[0x1E4F44460]];
    unint64_t v17 = [v14 fileWithData:v15 ofType:v16 proposedFilename:0];
    iconFile = self->_iconFile;
    self->_iconFile = v17;
  }
  else
  {
    id v12 = self->_iconFile;
    self->_iconFile = 0;
  }

  return 0;
}

- (WFWorkflowRecord)workflowRecord
{
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  if (self->_workflowRecord) {
    goto LABEL_2;
  }
  uint64_t v4 = [(WFGalleryWorkflow *)self shortcutFile];
  if (v4)
  {
  }
  else
  {
    v5 = [(WFGalleryWorkflow *)self signedShortcutFile];

    if (!v5)
    {
LABEL_2:
      v3 = self->_workflowRecord;
      goto LABEL_21;
    }
  }
  uint64_t v6 = [(WFGalleryWorkflow *)self signedShortcutFile];

  if (v6)
  {
    id v7 = [WFShortcutPackageFile alloc];
    uint64_t v8 = [(WFGalleryWorkflow *)self signedShortcutFile];
    int64_t v9 = [v8 data];
    id v10 = [(WFGalleryWorkflow *)self name];
    uint64_t v11 = [(WFShortcutPackageFile *)v7 initWithSignedShortcutData:v9 shortcutName:v10];

    id v30 = 0;
    id v12 = [(WFShortcutPackageFile *)v11 extractShortcutFileRepresentationWithError:&v30];
    id v13 = v30;
    if (!v12
      || ([(WFGalleryWorkflow *)self signingStatus],
          v14 = objc_claimAutoreleasedReturnValue(),
          char v15 = [v14 isEqualToString:@"APPROVED"],
          v14,
          (v15 & 1) == 0))
    {
      id v16 = getWFGeneralLogObject();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136315394;
        int64_t v32 = "-[WFGalleryWorkflow workflowRecord]";
        __int16 v33 = 2114;
        id v34 = v13;
        _os_log_impl(&dword_1C7F0A000, v16, OS_LOG_TYPE_ERROR, "%s WFSharedShortcut was unable to verify signed shortcut: %{public}@", buf, 0x16u);
      }

      goto LABEL_20;
    }
  }
  else
  {
    id v12 = [(WFGalleryWorkflow *)self shortcutFile];

    if (v12)
    {
      id v12 = [(WFGalleryWorkflow *)self shortcutFile];
    }
  }
  unint64_t v17 = [WFWorkflowFileDescriptor alloc];
  id v18 = [(WFGalleryWorkflow *)self name];
  int v19 = [(WFWorkflowFileDescriptor *)v17 initWithFile:v12 name:v18];

  id v29 = 0;
  v20 = [[WFWorkflowFile alloc] initWithDescriptor:v19 error:&v29];
  id v21 = v29;
  id v28 = v21;
  id v22 = [(WFWorkflowFile *)v20 recordRepresentationWithError:&v28];
  id v23 = v28;

  id v24 = [(WFGalleryWorkflow *)self persistentIdentifier];
  [v22 setGalleryIdentifier:v24];

  [v22 setSource:@"ShortcutSourceGallery"];
  if (v22)
  {
    uint64_t v25 = v22;
    p_super = &self->_workflowRecord->super.super;
    self->_workflowRecord = v25;
  }
  else
  {
    p_super = getWFGeneralLogObject();
    if (os_log_type_enabled(p_super, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      int64_t v32 = "-[WFGalleryWorkflow workflowRecord]";
      __int16 v33 = 2114;
      id v34 = v23;
      _os_log_impl(&dword_1C7F0A000, p_super, OS_LOG_TYPE_ERROR, "%s WFGalleryWorkflow was unable to load record from shortcut file: %{public}@", buf, 0x16u);
    }
  }

  if (v22) {
    goto LABEL_2;
  }
LABEL_20:
  v3 = 0;
LABEL_21:
  return v3;
}

- (WFWorkflowIcon)icon
{
  v3 = [(WFGalleryWorkflow *)self iconGlyph];
  uint64_t v4 = [(WFGalleryWorkflow *)self iconColor];
  if (!v3)
  {
    v3 = objc_msgSend(NSNumber, "numberWithUnsignedShort:", objc_msgSend(MEMORY[0x1E4FB4A50], "defaultGlyphCharacter"));
  }
  if (!v4) {
    uint64_t v4 = &unk_1F2316A10;
  }
  v5 = objc_msgSend(objc_alloc(MEMORY[0x1E4FB4A50]), "initWithBackgroundColorValue:glyphCharacter:customImageData:", objc_msgSend(v4, "integerValue"), (unsigned __int16)objc_msgSend(v3, "unsignedIntegerValue"), 0);

  return (WFWorkflowIcon *)v5;
}

- (void)setCreatedAt:(id)a3 modifiedAt:(id)a4 createdBy:(id)a5
{
  id v7 = (NSDate *)a3;
  uint64_t v8 = (NSDate *)a4;
  createdAt = self->_createdAt;
  self->_createdAt = v7;
  uint64_t v11 = v7;

  modifiedAt = self->_modifiedAt;
  self->_modifiedAt = v8;
}

- (unint64_t)referenceActionForKey:(id)a3
{
  return [a3 isEqualToString:@"base"];
}

- (id)sharingURL
{
  v2 = [(WFGalleryWorkflow *)self identifier];
  v3 = [v2 recordName];
  uint64_t v4 = WFGallerySharingURLForIdentifier(v3);

  return v4;
}

@end