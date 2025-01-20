@interface WFWorkflowReference
+ (BOOL)supportsSecureCoding;
+ (NSArray)readableTypeIdentifiersForItemProvider;
+ (NSArray)writableTypeIdentifiersForItemProvider;
+ (id)objectWithItemProviderData:(id)a3 typeIdentifier:(id)a4 error:(id *)a5;
- (BOOL)disabledOnLockScreen;
- (BOOL)hasShortcutInputVariables;
- (BOOL)hiddenFromLibraryAndSync;
- (BOOL)isDeleted;
- (BOOL)isEqual:(id)a3;
- (NSData)remoteQuarantineHash;
- (NSDate)creationDate;
- (NSDate)lastRunDate;
- (NSDate)modificationDate;
- (NSNumber)runEventsCount;
- (NSString)actionsDescription;
- (NSString)attributionTitle;
- (NSString)source;
- (NSString)subtitle;
- (NSUserActivity)userActivityForViewing;
- (WFIcon)attributionIcon;
- (WFWorkflowIcon)icon;
- (WFWorkflowReference)initWithCoder:(id)a3;
- (WFWorkflowReference)initWithIdentifier:(id)a3 name:(id)a4 color:(int64_t)a5 glyphCharacter:(unsigned __int16)a6 associatedAppBundleIdentifier:(id)a7 subtitle:(id)a8 actionsDescription:(id)a9 actionCount:(unint64_t)a10 syncHash:(int64_t)a11 isDeleted:(BOOL)a12 hiddenFromLibraryAndSync:(BOOL)a13 creationDate:(id)a14 modificationDate:(id)a15 lastRunDate:(id)a16 remoteQuarantineStatus:(int64_t)a17 remoteQuarantineHash:(id)a18 hasShortcutInputVariables:(BOOL)a19 disabledOnLockScreen:(BOOL)a20 source:(id)a21 runEventsCount:(id)a22;
- (id)attributionIconWithSize:(CGSize)a3 scale:(double)a4 rounded:(BOOL)a5;
- (id)externalURLForRunningWithSource:(id)a3;
- (id)loadDataWithTypeIdentifier:(id)a3 forItemProviderCompletionHandler:(id)a4;
- (id)speakableString;
- (int64_t)remoteQuarantineStatus;
- (int64_t)syncHash;
- (unint64_t)actionCount;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
- (void)setSource:(id)a3;
@end

@implementation WFWorkflowReference

- (unint64_t)hash
{
  v36.receiver = self;
  v36.super_class = (Class)WFWorkflowReference;
  unint64_t v3 = [(WFWorkflowDescriptor *)&v36 hash];
  v4 = [(WFWorkflowReference *)self subtitle];
  v5 = v4;
  if (!v4) {
    v4 = &stru_1F229A4D8;
  }
  uint64_t v6 = [(__CFString *)v4 hash];
  v35 = [(WFWorkflowReference *)self actionsDescription];
  uint64_t v7 = v6 ^ [v35 hash];
  unint64_t v8 = v7 ^ [(WFWorkflowReference *)self actionCount] ^ v3;
  v9 = objc_msgSend(NSNumber, "numberWithLongLong:", -[WFWorkflowReference syncHash](self, "syncHash"));
  uint64_t v10 = v8 ^ [v9 hash];
  v11 = [(WFWorkflowReference *)self icon];
  uint64_t v12 = [v11 hash];
  v13 = [(WFWorkflowReference *)self creationDate];
  uint64_t v14 = v12 ^ [v13 hash];
  v15 = [(WFWorkflowReference *)self modificationDate];
  uint64_t v16 = v14 ^ [v15 hash];
  BOOL v17 = [(WFWorkflowReference *)self isDeleted];
  uint64_t v18 = 3133065982;
  if (v17) {
    uint64_t v18 = 3203381950;
  }
  uint64_t v19 = v16 ^ v18;
  BOOL v20 = [(WFWorkflowReference *)self hiddenFromLibraryAndSync];
  uint64_t v21 = 3405774846;
  if (v20) {
    uint64_t v21 = 3133079551;
  }
  uint64_t v22 = v19 ^ v21;
  BOOL v23 = [(WFWorkflowReference *)self disabledOnLockScreen];
  uint64_t v24 = 3133145087;
  if (!v23) {
    uint64_t v24 = 3404726270;
  }
  uint64_t v25 = v22 ^ v24;
  v26 = [(WFWorkflowReference *)self lastRunDate];
  uint64_t v27 = v10 ^ v25 ^ [v26 hash];
  int64_t v28 = [(WFWorkflowReference *)self remoteQuarantineStatus];
  v29 = [(WFWorkflowReference *)self remoteQuarantineHash];
  uint64_t v30 = v28 ^ [v29 hash];
  BOOL v31 = [(WFWorkflowReference *)self hasShortcutInputVariables];
  uint64_t v32 = 1093271700;
  if (v31) {
    uint64_t v32 = 1437221162;
  }
  unint64_t v33 = v27 ^ v30 ^ v32;

  return v33;
}

- (WFWorkflowIcon)icon
{
  return self->_icon;
}

- (int64_t)syncHash
{
  return self->_syncHash;
}

- (NSString)subtitle
{
  return self->_subtitle;
}

- (int64_t)remoteQuarantineStatus
{
  return self->_remoteQuarantineStatus;
}

- (NSData)remoteQuarantineHash
{
  return self->_remoteQuarantineHash;
}

- (NSDate)modificationDate
{
  return self->_modificationDate;
}

- (NSDate)lastRunDate
{
  return self->_lastRunDate;
}

- (BOOL)isDeleted
{
  return self->_isDeleted;
}

- (BOOL)hiddenFromLibraryAndSync
{
  return self->_hiddenFromLibraryAndSync;
}

- (BOOL)hasShortcutInputVariables
{
  return self->_hasShortcutInputVariables;
}

- (BOOL)disabledOnLockScreen
{
  return self->_disabledOnLockScreen;
}

- (NSDate)creationDate
{
  return self->_creationDate;
}

- (NSString)actionsDescription
{
  return self->_actionsDescription;
}

- (unint64_t)actionCount
{
  return self->_actionCount;
}

- (WFWorkflowReference)initWithIdentifier:(id)a3 name:(id)a4 color:(int64_t)a5 glyphCharacter:(unsigned __int16)a6 associatedAppBundleIdentifier:(id)a7 subtitle:(id)a8 actionsDescription:(id)a9 actionCount:(unint64_t)a10 syncHash:(int64_t)a11 isDeleted:(BOOL)a12 hiddenFromLibraryAndSync:(BOOL)a13 creationDate:(id)a14 modificationDate:(id)a15 lastRunDate:(id)a16 remoteQuarantineStatus:(int64_t)a17 remoteQuarantineHash:(id)a18 hasShortcutInputVariables:(BOOL)a19 disabledOnLockScreen:(BOOL)a20 source:(id)a21 runEventsCount:(id)a22
{
  unsigned int v46 = a6;
  id v49 = a3;
  id v25 = a4;
  id v26 = a7;
  id v48 = a8;
  id v47 = a9;
  id v44 = a14;
  id v27 = a15;
  id v45 = a16;
  id v28 = a18;
  id v29 = a21;
  id v30 = a22;
  if (!v27)
  {
    v40 = [MEMORY[0x1E4F28B00] currentHandler];
    [v40 handleFailureInMethod:a2, self, @"WFWorkflowReference.m", 46, @"Invalid parameter not satisfying: %@", @"modificationDate" object file lineNumber description];
  }
  v50.receiver = self;
  v50.super_class = (Class)WFWorkflowReference;
  BOOL v31 = [(WFWorkflowDescriptor *)&v50 initWithIdentifier:v49 name:v25 color:a5 glyphCharacter:v46 associatedAppBundleIdentifier:v26];
  if (v31)
  {
    uint64_t v32 = [v48 copy];
    subtitle = v31->_subtitle;
    v31->_subtitle = (NSString *)v32;

    uint64_t v34 = [v47 copy];
    actionsDescription = v31->_actionsDescription;
    v31->_actionsDescription = (NSString *)v34;

    v31->_actionCount = a10;
    v31->_syncHash = a11;
    uint64_t v36 = [objc_alloc(MEMORY[0x1E4FB4A50]) initWithBackgroundColorValue:a5 glyphCharacter:v46 customImageData:0];
    icon = v31->_icon;
    v31->_icon = (WFWorkflowIcon *)v36;

    v31->_isDeleted = a12;
    v31->_hiddenFromLibraryAndSync = a13;
    objc_storeStrong((id *)&v31->_creationDate, a14);
    objc_storeStrong((id *)&v31->_modificationDate, a15);
    objc_storeStrong((id *)&v31->_lastRunDate, a16);
    v31->_remoteQuarantineStatus = a17;
    objc_storeStrong((id *)&v31->_remoteQuarantineHash, a18);
    v31->_hasShortcutInputVariables = a19;
    v31->_disabledOnLockScreen = a20;
    objc_storeStrong((id *)&v31->_source, a21);
    objc_storeStrong((id *)&v31->_runEventsCount, a22);
    v38 = v31;
  }

  return v31;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_runEventsCount, 0);
  objc_storeStrong((id *)&self->_source, 0);
  objc_storeStrong((id *)&self->_remoteQuarantineHash, 0);
  objc_storeStrong((id *)&self->_lastRunDate, 0);
  objc_storeStrong((id *)&self->_modificationDate, 0);
  objc_storeStrong((id *)&self->_creationDate, 0);
  objc_storeStrong((id *)&self->_icon, 0);
  objc_storeStrong((id *)&self->_actionsDescription, 0);
  objc_storeStrong((id *)&self->_subtitle, 0);
}

- (NSNumber)runEventsCount
{
  return self->_runEventsCount;
}

- (void)setSource:(id)a3
{
}

- (NSString)source
{
  return self->_source;
}

- (id)loadDataWithTypeIdentifier:(id)a3 forItemProviderCompletionHandler:(id)a4
{
  v5 = (void *)MEMORY[0x1E4F28DB0];
  uint64_t v6 = (void (**)(id, void *, id))a4;
  uint64_t v7 = (void *)[(WFWorkflowReference *)self copy];
  id v11 = 0;
  unint64_t v8 = [v5 archivedDataWithRootObject:v7 requiringSecureCoding:1 error:&v11];
  id v9 = v11;

  v6[2](v6, v8, v9);
  return 0;
}

- (id)attributionIconWithSize:(CGSize)a3 scale:(double)a4 rounded:(BOOL)a5
{
  BOOL v5 = a5;
  double height = a3.height;
  double width = a3.width;
  if ([(WFWorkflowReference *)self hiddenFromLibraryAndSync])
  {
    uint64_t v10 = [MEMORY[0x1E4FB4770] applicationIconImageForBundleIdentifier:*MEMORY[0x1E4FB4BB8] format:1];
  }
  else
  {
    id v11 = objc_alloc(MEMORY[0x1E4FB4A58]);
    uint64_t v12 = [(WFWorkflowReference *)self icon];
    v13 = (void *)[v11 initWithIcon:v12];

    [v13 setRounded:v5];
    uint64_t v10 = objc_msgSend(v13, "imageWithSize:scale:", width, height, a4);
  }
  return v10;
}

- (WFIcon)attributionIcon
{
  if ([(WFWorkflowReference *)self hiddenFromLibraryAndSync])
  {
    id v3 = objc_alloc(MEMORY[0x1E4FB4560]);
    v4 = (void *)[v3 initWithBundleIdentifier:*MEMORY[0x1E4FB4BE8]];
  }
  else
  {
    BOOL v5 = [(WFWorkflowDescriptor *)self associatedAppBundleIdentifier];
    uint64_t v6 = [v5 length];

    if (v6)
    {
      id v7 = objc_alloc(MEMORY[0x1E4FB4560]);
      unint64_t v8 = [(WFWorkflowDescriptor *)self associatedAppBundleIdentifier];
      v4 = (void *)[v7 initWithBundleIdentifier:v8];
    }
    else
    {
      id v9 = [(WFWorkflowReference *)self icon];
      v4 = [v9 icon];
    }
  }
  return (WFIcon *)v4;
}

- (NSString)attributionTitle
{
  if ([(WFWorkflowReference *)self hiddenFromLibraryAndSync]) {
    WFLocalizedString(@"Shortcuts");
  }
  else {
  id v3 = [(WFWorkflowDescriptor *)self name];
  }
  return (NSString *)v3;
}

- (id)externalURLForRunningWithSource:(id)a3
{
  if (a3)
  {
    v4 = objc_msgSend(@"&source=", "stringByAppendingString:");
    BOOL v5 = [MEMORY[0x1E4F28B88] URLPathAllowedCharacterSet];
    uint64_t v6 = [v4 stringByAddingPercentEncodingWithAllowedCharacters:v5];
  }
  else
  {
    uint64_t v6 = &stru_1F229A4D8;
  }
  id v7 = (void *)MEMORY[0x1E4F1CB10];
  unint64_t v8 = NSString;
  id v9 = [(WFWorkflowDescriptor *)self name];
  uint64_t v10 = [MEMORY[0x1E4F28B88] URLPathAllowedCharacterSet];
  id v11 = [v9 stringByAddingPercentEncodingWithAllowedCharacters:v10];
  uint64_t v12 = [(WFWorkflowReference *)self identifier];
  v13 = [MEMORY[0x1E4F28B88] URLPathAllowedCharacterSet];
  uint64_t v14 = [v12 stringByAddingPercentEncodingWithAllowedCharacters:v13];
  v15 = [v8 stringWithFormat:@"shortcuts://x-callback-url/run-shortcut?name=%@&id=%@%@", v11, v14, v6];
  uint64_t v16 = [v7 URLWithString:v15];

  return v16;
}

- (void)encodeWithCoder:(id)a3
{
  v16.receiver = self;
  v16.super_class = (Class)WFWorkflowReference;
  id v4 = a3;
  [(WFWorkflowDescriptor *)&v16 encodeWithCoder:v4];
  BOOL v5 = [(WFWorkflowReference *)self icon];
  [v4 encodeObject:v5 forKey:@"icon"];

  uint64_t v6 = [(WFWorkflowReference *)self subtitle];
  [v4 encodeObject:v6 forKey:@"subtitle"];

  id v7 = [(WFWorkflowReference *)self actionsDescription];
  [v4 encodeObject:v7 forKey:@"actionsDescription"];

  unint64_t v8 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", -[WFWorkflowReference actionCount](self, "actionCount"));
  [v4 encodeObject:v8 forKey:@"actionCount"];

  id v9 = objc_msgSend(NSNumber, "numberWithLongLong:", -[WFWorkflowReference syncHash](self, "syncHash"));
  [v4 encodeObject:v9 forKey:@"syncHash"];

  objc_msgSend(v4, "encodeBool:forKey:", -[WFWorkflowReference isDeleted](self, "isDeleted"), @"isDeleted");
  objc_msgSend(v4, "encodeBool:forKey:", -[WFWorkflowReference hiddenFromLibraryAndSync](self, "hiddenFromLibraryAndSync"), @"hiddenFromLibraryAndSync");
  uint64_t v10 = [(WFWorkflowReference *)self creationDate];
  [v4 encodeObject:v10 forKey:@"creationDate"];

  id v11 = [(WFWorkflowReference *)self modificationDate];
  [v4 encodeObject:v11 forKey:@"modificationDate"];

  uint64_t v12 = [(WFWorkflowReference *)self lastRunDate];
  [v4 encodeObject:v12 forKey:@"lastRunDate"];

  objc_msgSend(v4, "encodeInteger:forKey:", -[WFWorkflowReference remoteQuarantineStatus](self, "remoteQuarantineStatus"), @"remoteQuarantineStatus");
  v13 = [(WFWorkflowReference *)self remoteQuarantineHash];
  [v4 encodeObject:v13 forKey:@"remoteQuarantineHash"];

  objc_msgSend(v4, "encodeBool:forKey:", -[WFWorkflowReference hasShortcutInputVariables](self, "hasShortcutInputVariables"), @"hasShortcutInputVariables");
  objc_msgSend(v4, "encodeBool:forKey:", -[WFWorkflowReference disabledOnLockScreen](self, "disabledOnLockScreen"), @"disabledOnLockScreen");
  uint64_t v14 = [(WFWorkflowReference *)self source];
  [v4 encodeObject:v14 forKey:@"source"];

  v15 = [(WFWorkflowReference *)self runEventsCount];
  [v4 encodeObject:v15 forKey:@"runEventsCount"];
}

- (WFWorkflowReference)initWithCoder:(id)a3
{
  id v4 = a3;
  v28.receiver = self;
  v28.super_class = (Class)WFWorkflowReference;
  BOOL v5 = [(WFWorkflowDescriptor *)&v28 initWithCoder:v4];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"icon"];
    icon = v5->_icon;
    v5->_icon = (WFWorkflowIcon *)v6;

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"subtitle"];
    subtitle = v5->_subtitle;
    v5->_subtitle = (NSString *)v8;

    uint64_t v10 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"actionsDescription"];
    actionsDescription = v5->_actionsDescription;
    v5->_actionsDescription = (NSString *)v10;

    uint64_t v12 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"actionCount"];
    v5->_actionCount = [v12 unsignedIntegerValue];

    v13 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"syncHash"];
    v5->_syncHash = [v13 longValue];

    v5->_isDeleted = [v4 decodeBoolForKey:@"isDeleted"];
    v5->_hiddenFromLibraryAndSync = [v4 decodeBoolForKey:@"hiddenFromLibraryAndSync"];
    uint64_t v14 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"creationDate"];
    creationDate = v5->_creationDate;
    v5->_creationDate = (NSDate *)v14;

    uint64_t v16 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"modificationDate"];
    modificationDate = v5->_modificationDate;
    v5->_modificationDate = (NSDate *)v16;

    uint64_t v18 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"lastRunDate"];
    lastRunDate = v5->_lastRunDate;
    v5->_lastRunDate = (NSDate *)v18;

    v5->_remoteQuarantineStatus = [v4 decodeIntegerForKey:@"remoteQuarantineStatus"];
    uint64_t v20 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"remoteQuarantineHash"];
    remoteQuarantineHash = v5->_remoteQuarantineHash;
    v5->_remoteQuarantineHash = (NSData *)v20;

    v5->_hasShortcutInputVariables = [v4 decodeBoolForKey:@"hasShortcutInputVariables"];
    v5->_disabledOnLockScreen = [v4 decodeBoolForKey:@"disabledOnLockScreen"];
    uint64_t v22 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"source"];
    source = v5->_source;
    v5->_source = (NSString *)v22;

    uint64_t v24 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"runEventsCount"];
    runEventsCount = v5->_runEventsCount;
    v5->_runEventsCount = (NSNumber *)v24;

    id v26 = v5;
  }

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  BOOL v5 = (WFWorkflowReference *)a3;
  if (v5 == self)
  {
    BOOL v13 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      uint64_t v6 = v5;
      v79.receiver = self;
      v79.super_class = (Class)WFWorkflowReference;
      if (![(WFWorkflowDescriptor *)&v79 isEqual:v6])
      {
        BOOL v13 = 0;
LABEL_93:

        goto LABEL_94;
      }
      id v7 = [(WFWorkflowReference *)self subtitle];
      uint64_t v8 = [(WFWorkflowReference *)v6 subtitle];
      id v9 = v7;
      id v10 = v8;
      id v11 = v10;
      if (v9 == v10)
      {
      }
      else
      {
        if (!v9 || !v10)
        {

LABEL_20:
          uint64_t v20 = [(WFWorkflowReference *)self subtitle];
          if ([v20 length])
          {
            char v21 = 0;
LABEL_91:

            BOOL v13 = v21;
            goto LABEL_92;
          }
          v77 = v20;
          id v3 = [(WFWorkflowReference *)v6 subtitle];
          if ([v3 length])
          {
            char v21 = 0;
LABEL_90:

            uint64_t v20 = v77;
            goto LABEL_91;
          }
          int v78 = 1;
LABEL_14:
          uint64_t v14 = [(WFWorkflowReference *)self actionsDescription];
          v15 = [(WFWorkflowReference *)v6 actionsDescription];
          id v16 = v14;
          id v17 = v15;
          uint64_t v18 = v17;
          if (v16 == v17)
          {
          }
          else
          {
            if (!v16 || !v17)
            {

              goto LABEL_31;
            }
            int v19 = [v16 isEqualToString:v17];

            if (!v19)
            {
LABEL_31:

              char v21 = 0;
              BOOL v13 = 0;
              if (!v78) {
                goto LABEL_92;
              }
              goto LABEL_90;
            }
          }
          unint64_t v22 = [(WFWorkflowReference *)self actionCount];
          if (v22 != [(WFWorkflowReference *)v6 actionCount]) {
            goto LABEL_31;
          }
          int64_t v23 = [(WFWorkflowReference *)self syncHash];
          if (v23 != [(WFWorkflowReference *)v6 syncHash]) {
            goto LABEL_31;
          }
          v76 = v3;
          uint64_t v24 = [(WFWorkflowReference *)self icon];
          id v25 = [(WFWorkflowReference *)v6 icon];
          id v26 = v24;
          id v27 = v25;
          v74 = v27;
          v75 = v26;
          if (v26 != v27)
          {
            char v21 = 0;
            if (v26)
            {
              objc_super v28 = v27;
              id v3 = v76;
              if (v27)
              {
                int v29 = [v26 isEqual:v27];

                if (!v29)
                {
                  char v21 = 0;
                  id v3 = v76;
                  goto LABEL_89;
                }
LABEL_37:
                id v30 = [(WFWorkflowReference *)self creationDate];
                BOOL v31 = [(WFWorkflowReference *)v6 creationDate];
                id v32 = v30;
                id v33 = v31;
                v72 = v33;
                id v73 = v32;
                if (v32 != v33)
                {
                  char v21 = 0;
                  if (v32)
                  {
                    uint64_t v34 = v33;
                    id v3 = v76;
                    if (v33)
                    {
                      int v35 = [v32 isEqual:v33];

                      if (!v35)
                      {
                        char v21 = 0;
                        id v3 = v76;
LABEL_87:
                        objc_super v28 = v72;
                        id v26 = v73;
                        goto LABEL_88;
                      }
LABEL_43:
                      uint64_t v36 = [(WFWorkflowReference *)self modificationDate];
                      v37 = [(WFWorkflowReference *)v6 modificationDate];
                      id v32 = v36;
                      id v38 = v37;
                      id v71 = v38;
                      if (v32 != v38)
                      {
                        char v21 = 0;
                        if (v32)
                        {
                          v39 = v38;
                          id v40 = v32;
                          id v3 = v76;
                          if (v38)
                          {
                            v41 = v38;
                            int v42 = [v32 isEqual:v38];

                            if (!v42)
                            {
LABEL_53:
                              char v21 = 0;
                              id v3 = v76;
LABEL_85:
                              uint64_t v34 = v71;
                              goto LABEL_86;
                            }
LABEL_50:
                            BOOL v43 = [(WFWorkflowReference *)self isDeleted];
                            if (v43 != [(WFWorkflowReference *)v6 isDeleted]) {
                              goto LABEL_53;
                            }
                            BOOL v44 = [(WFWorkflowReference *)self disabledOnLockScreen];
                            if (v44 != [(WFWorkflowReference *)v6 disabledOnLockScreen]) {
                              goto LABEL_53;
                            }
                            BOOL v45 = [(WFWorkflowReference *)self hiddenFromLibraryAndSync];
                            if (v45 != [(WFWorkflowReference *)v6 hiddenFromLibraryAndSync]) {
                              goto LABEL_53;
                            }
                            unsigned int v46 = [(WFWorkflowReference *)self lastRunDate];
                            id v47 = [(WFWorkflowReference *)v6 lastRunDate];
                            id v48 = v46;
                            id v49 = v47;
                            v69 = v49;
                            id v70 = v48;
                            if (v48 != v49)
                            {
                              char v21 = 0;
                              if (v48)
                              {
                                objc_super v50 = v49;
                                if (v49)
                                {
                                  int v67 = [v48 isEqual:v49];

                                  if (!v67) {
                                    goto LABEL_68;
                                  }
LABEL_62:
                                  int64_t v51 = [(WFWorkflowReference *)self remoteQuarantineStatus];
                                  if (v51 != [(WFWorkflowReference *)v6 remoteQuarantineStatus])
                                  {
LABEL_68:
                                    char v21 = 0;
LABEL_83:
                                    id v3 = v76;
                                    v39 = v69;
                                    id v40 = v70;
                                    goto LABEL_84;
                                  }
                                  id v65 = v32;
                                  v52 = [(WFWorkflowReference *)self remoteQuarantineHash];
                                  v53 = [(WFWorkflowReference *)v6 remoteQuarantineHash];
                                  id v54 = v52;
                                  id v66 = v53;
                                  v68 = v54;
                                  if (v54 == v66)
                                  {
                                  }
                                  else
                                  {
                                    char v21 = 0;
                                    if (!v54)
                                    {
                                      v56 = v66;
                                      id v55 = v68;
                                      goto LABEL_80;
                                    }
                                    id v55 = v54;
                                    v56 = v66;
                                    if (!v66)
                                    {
LABEL_80:

                                      goto LABEL_81;
                                    }
                                    int v57 = [v68 isEqual:v66];

                                    if (!v57) {
                                      goto LABEL_72;
                                    }
                                  }
                                  BOOL v58 = [(WFWorkflowReference *)self hasShortcutInputVariables];
                                  if (v58 != [(WFWorkflowReference *)v6 hasShortcutInputVariables])
                                  {
LABEL_72:
                                    char v21 = 0;
LABEL_81:
                                    id v32 = v65;
                                    objc_super v50 = v66;
                                    id v48 = v68;
                                    goto LABEL_82;
                                  }
                                  v59 = [(WFWorkflowReference *)self runEventsCount];
                                  v60 = [(WFWorkflowReference *)v6 runEventsCount];
                                  id v55 = v59;
                                  id v61 = v60;
                                  v56 = v61;
                                  if (v55 == v61)
                                  {
                                    char v21 = 1;
                                  }
                                  else
                                  {
                                    char v21 = 0;
                                    if (v55 && v61) {
                                      char v21 = [v55 isEqual:v61];
                                    }
                                  }

                                  goto LABEL_80;
                                }
                              }
                              else
                              {
                                objc_super v50 = v49;
                              }
LABEL_82:

                              goto LABEL_83;
                            }

                            goto LABEL_62;
                          }
                        }
                        else
                        {
                          v39 = v38;
                          id v40 = 0;
                          id v3 = v76;
                        }
LABEL_84:
                        id v62 = v32;
                        v63 = v40;

                        id v32 = v62;
                        goto LABEL_85;
                      }

                      goto LABEL_50;
                    }
                  }
                  else
                  {
                    uint64_t v34 = v33;
                    id v3 = v76;
                  }
LABEL_86:

                  goto LABEL_87;
                }

                goto LABEL_43;
              }
            }
            else
            {
              objc_super v28 = v27;
              id v3 = v76;
            }
LABEL_88:

LABEL_89:
            BOOL v13 = v21;
            if ((v78 & 1) == 0)
            {
LABEL_92:

              goto LABEL_93;
            }
            goto LABEL_90;
          }

          goto LABEL_37;
        }
        char v12 = [v9 isEqualToString:v10];

        if ((v12 & 1) == 0) {
          goto LABEL_20;
        }
      }
      int v78 = 0;
      goto LABEL_14;
    }
    BOOL v13 = 0;
  }
LABEL_94:

  return v13;
}

+ (id)objectWithItemProviderData:(id)a3 typeIdentifier:(id)a4 error:(id *)a5
{
  uint64_t v6 = (void *)MEMORY[0x1E4F28DC0];
  id v7 = a3;
  uint64_t v8 = [v6 unarchivedObjectOfClass:objc_opt_class() fromData:v7 error:a5];

  return v8;
}

+ (NSArray)writableTypeIdentifiersForItemProvider
{
  v6[1] = *MEMORY[0x1E4F143B8];
  v2 = [MEMORY[0x1E4F442D8] exportedTypeWithIdentifier:@"com.apple.shortcuts.workflow-reference"];
  id v3 = [v2 identifier];
  v6[0] = v3;
  id v4 = [MEMORY[0x1E4F1C978] arrayWithObjects:v6 count:1];

  return (NSArray *)v4;
}

+ (NSArray)readableTypeIdentifiersForItemProvider
{
  v6[1] = *MEMORY[0x1E4F143B8];
  v2 = [MEMORY[0x1E4F442D8] exportedTypeWithIdentifier:@"com.apple.shortcuts.workflow-reference"];
  id v3 = [v2 identifier];
  v6[0] = v3;
  id v4 = [MEMORY[0x1E4F1C978] arrayWithObjects:v6 count:1];

  return (NSArray *)v4;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (id)speakableString
{
  id v3 = objc_alloc(MEMORY[0x1E4F30750]);
  id v4 = [(WFWorkflowReference *)self identifier];
  BOOL v5 = [(WFWorkflowDescriptor *)self name];
  uint64_t v6 = (void *)[v3 initWithVocabularyIdentifier:v4 spokenPhrase:v5 pronunciationHint:0];

  return v6;
}

- (NSUserActivity)userActivityForViewing
{
  v15[2] = *MEMORY[0x1E4F143B8];
  id v3 = (void *)[objc_alloc(MEMORY[0x1E4F22488]) initWithActivityType:@"is.workflow.my.app.viewworkflow"];
  id v4 = [(WFWorkflowDescriptor *)self name];
  [v3 setTitle:v4];

  v14[0] = @"workflowID";
  BOOL v5 = [(WFWorkflowReference *)self identifier];
  v14[1] = @"workflowName";
  v15[0] = v5;
  uint64_t v6 = [(WFWorkflowDescriptor *)self name];
  v15[1] = v6;
  id v7 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v15 forKeys:v14 count:2];
  [v3 setUserInfo:v7];

  uint64_t v8 = @"workflowID";
  v13[0] = @"workflowID";
  id v9 = @"workflowName";
  v13[1] = @"workflowName";
  id v10 = (void *)[objc_alloc(MEMORY[0x1E4F1CAD0]) initWithObjects:v13 count:2];
  for (uint64_t i = 1; i != -1; --i)

  [v3 setRequiredUserInfoKeys:v10];
  [v3 setEligibleForHandoff:0];
  [v3 setEligibleForSearch:0];
  return (NSUserActivity *)v3;
}

@end