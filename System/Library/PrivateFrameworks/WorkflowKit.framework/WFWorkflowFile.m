@interface WFWorkflowFile
+ (NSArray)writableTypeIdentifiersForItemProvider;
- (BOOL)disabledOnLockScreen;
- (BOOL)hasOutputFallback;
- (BOOL)hasShortcutInputVariables;
- (BOOL)isEqual:(id)a3;
- (BOOL)migrateRootObject;
- (BOOL)writeToFileURL:(id)a3 format:(unint64_t)a4 error:(id *)a5;
- (BOOL)writeToOutputStream:(id)a3 format:(unint64_t)a4 error:(id *)a5;
- (NSArray)actions;
- (NSArray)importQuestions;
- (NSArray)inputClasses;
- (NSArray)outputClasses;
- (NSArray)quickActionSurfacesForSharing;
- (NSArray)workflowTypes;
- (NSDate)creationDate;
- (NSDate)modificationDate;
- (NSDictionary)noInputBehavior;
- (NSDictionary)rootObject;
- (NSString)identifier;
- (NSString)lastMigratedClientVersion;
- (NSString)minimumClientVersion;
- (NSString)name;
- (WFFileRepresentation)file;
- (WFWorkflowFile)init;
- (WFWorkflowFile)initWithDescriptor:(id)a3 error:(id *)a4;
- (WFWorkflowFile)initWithDescriptor:(id)a3 performMigration:(BOOL)a4 error:(id *)a5;
- (WFWorkflowFile)initWithDictionary:(id)a3 name:(id)a4;
- (WFWorkflowFile)initWithDictionary:(id)a3 name:(id)a4 performMigration:(BOOL)a5;
- (WFWorkflowFile)initWithFileData:(id)a3 name:(id)a4 error:(id *)a5;
- (WFWorkflowIcon)icon;
- (WFWorkflowQuarantine)quarantine;
- (id)descriptor;
- (id)fileDataWithError:(id *)a3;
- (id)fileDataWithFormat:(unint64_t)a3 error:(id *)a4;
- (id)loadDataWithTypeIdentifier:(id)a3 forItemProviderCompletionHandler:(id)a4;
- (id)recordRepresentationWithError:(id *)a3;
- (id)writeToDiskWithError:(id *)a3;
- (id)writeToDiskWithFormat:(unint64_t)a3 error:(id *)a4;
- (unint64_t)estimatedSize;
- (void)setActions:(id)a3;
- (void)setCreationDate:(id)a3;
- (void)setDisabledOnLockScreen:(BOOL)a3;
- (void)setHasOutputFallback:(BOOL)a3;
- (void)setHasShortcutInputVariables:(BOOL)a3;
- (void)setIcon:(id)a3;
- (void)setImportQuestions:(id)a3;
- (void)setInputClasses:(id)a3;
- (void)setLastMigratedClientVersion:(id)a3;
- (void)setMinimumClientVersion:(id)a3;
- (void)setModificationDate:(id)a3;
- (void)setName:(id)a3;
- (void)setNoInputBehavior:(id)a3;
- (void)setOutputClasses:(id)a3;
- (void)setQuarantine:(id)a3;
- (void)setQuickActionSurfacesForSharing:(id)a3;
- (void)setWorkflowTypes:(id)a3;
@end

@implementation WFWorkflowFile

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_storeStrong((id *)&self->_file, 0);
  objc_storeStrong((id *)&self->_quarantine, 0);
  objc_storeStrong((id *)&self->_modificationDate, 0);
  objc_storeStrong((id *)&self->_creationDate, 0);
  objc_storeStrong((id *)&self->_name, 0);
  objc_storeStrong((id *)&self->_rootObject, 0);
}

- (NSString)identifier
{
  return self->_identifier;
}

- (WFFileRepresentation)file
{
  return self->_file;
}

- (void)setQuarantine:(id)a3
{
}

- (WFWorkflowQuarantine)quarantine
{
  return self->_quarantine;
}

- (void)setModificationDate:(id)a3
{
}

- (NSDate)modificationDate
{
  return self->_modificationDate;
}

- (void)setCreationDate:(id)a3
{
}

- (NSDate)creationDate
{
  return self->_creationDate;
}

- (void)setName:(id)a3
{
}

- (NSString)name
{
  return self->_name;
}

- (NSDictionary)rootObject
{
  return &self->_rootObject->super;
}

- (BOOL)migrateRootObject
{
  uint64_t v12 = 0;
  v13 = &v12;
  uint64_t v14 = 0x2020000000;
  char v15 = 0;
  dispatch_semaphore_t v3 = dispatch_semaphore_create(0);
  rootObject = self->_rootObject;
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __35__WFWorkflowFile_migrateRootObject__block_invoke;
  v9[3] = &unk_1E6550030;
  v11 = &v12;
  v9[4] = self;
  v5 = v3;
  v10 = v5;
  +[WFWorkflowMigrator migrateWorkflowIfNeeded:rootObject completion:v9];
  dispatch_semaphore_wait(v5, 0xFFFFFFFFFFFFFFFFLL);
  v6 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
  v7 = [v6 objectForInfoDictionaryKey:*MEMORY[0x1E4F1D020]];
  [(WFWorkflowFile *)self setLastMigratedClientVersion:v7];
  LOBYTE(self) = *((unsigned char *)v13 + 24);

  _Block_object_dispose(&v12, 8);
  return (char)self;
}

intptr_t __35__WFWorkflowFile_migrateRootObject__block_invoke(void *a1, char a2, void *a3)
{
  *(unsigned char *)(*(void *)(a1[6] + 8) + 24) = a2;
  if (*(unsigned char *)(*(void *)(a1[6] + 8) + 24))
  {
    uint64_t v4 = [a3 mutableCopy];
    uint64_t v5 = a1[4];
    v6 = *(void **)(v5 + 8);
    *(void *)(v5 + 8) = v4;
  }
  v7 = a1[5];
  return dispatch_semaphore_signal(v7);
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v5 = [v4 rootObject];
    v6 = [(WFWorkflowFile *)self rootObject];
    char v7 = [v5 isEqualToDictionary:v6];
  }
  else
  {
    char v7 = 0;
  }

  return v7;
}

- (BOOL)writeToOutputStream:(id)a3 format:(unint64_t)a4 error:(id *)a5
{
  id v8 = a3;
  [v8 open];
  v9 = (void *)MEMORY[0x1E4F28F98];
  v10 = [(WFWorkflowFile *)self rootObject];
  id v20 = 0;
  uint64_t v11 = [v9 writePropertyList:v10 toStream:v8 format:a4 options:0 error:&v20];
  id v12 = v20;
  BOOL v13 = v11 > 0;

  if (a4 == 100 && v11 <= 0)
  {
    uint64_t v14 = (void *)MEMORY[0x1E4F28F98];
    char v15 = [(WFWorkflowFile *)self rootObject];
    id v19 = 0;
    uint64_t v16 = [v14 writePropertyList:v15 toStream:v8 format:200 options:0 error:&v19];
    id v17 = v19;

    BOOL v13 = v16 != 0;
    id v12 = v17;
  }
  [v8 close];
  if (a5 && v12) {
    *a5 = v12;
  }

  return v13;
}

- (id)loadDataWithTypeIdentifier:(id)a3 forItemProviderCompletionHandler:(id)a4
{
  uint64_t v5 = (void (**)(id, void *, void))a4;
  v6 = [MEMORY[0x1E4F1CAA8] outputStreamToMemory];
  id v11 = 0;
  BOOL v7 = [(WFWorkflowFile *)self writeToOutputStream:v6 format:200 error:&v11];
  id v8 = v11;
  if (v7)
  {
    v9 = [v6 propertyForKey:*MEMORY[0x1E4F1C4C0]];
    v5[2](v5, v9, 0);
  }
  else
  {
    ((void (**)(id, void *, id))v5)[2](v5, 0, v8);
  }

  return 0;
}

- (id)fileDataWithError:(id *)a3
{
  return [(WFWorkflowFile *)self fileDataWithFormat:200 error:a3];
}

- (id)fileDataWithFormat:(unint64_t)a3 error:(id *)a4
{
  BOOL v7 = [(WFWorkflowFile *)self file];

  if (v7)
  {
    id v8 = [(WFWorkflowFile *)self file];
    uint64_t v9 = [v8 mappedData];
LABEL_5:
    v10 = (void *)v9;
    goto LABEL_7;
  }
  id v8 = [MEMORY[0x1E4F1CAA8] outputStreamToMemory];
  if ([(WFWorkflowFile *)self writeToOutputStream:v8 format:a3 error:a4])
  {
    uint64_t v9 = [v8 propertyForKey:*MEMORY[0x1E4F1C4C0]];
    goto LABEL_5;
  }
  v10 = 0;
LABEL_7:

  return v10;
}

- (BOOL)writeToFileURL:(id)a3 format:(unint64_t)a4 error:(id *)a5
{
  id v8 = [MEMORY[0x1E4F1CAA8] outputStreamWithURL:a3 append:0];
  LOBYTE(a5) = [(WFWorkflowFile *)self writeToOutputStream:v8 format:a4 error:a5];

  return (char)a5;
}

- (id)writeToDiskWithError:(id *)a3
{
  return [(WFWorkflowFile *)self writeToDiskWithFormat:200 error:a3];
}

- (id)writeToDiskWithFormat:(unint64_t)a3 error:(id *)a4
{
  id v7 = [(WFWorkflowFile *)self file];
  if (!v7)
  {
    id v8 = [MEMORY[0x1E4FB4718] typeWithString:@"com.apple.shortcuts.workflow-file"];
    uint64_t v9 = (void *)MEMORY[0x1E4F5A900];
    v10 = [(WFWorkflowFile *)self name];
    id v11 = [v9 proposedFilenameForFile:v10 ofType:v8];

    id v12 = [MEMORY[0x1E4F5AA28] proposedTemporaryFileURLForFilename:v11];
    BOOL v13 = [MEMORY[0x1E4F28CB8] defaultManager];
    uint64_t v14 = [v12 path];
    [v13 createFileAtPath:v14 contents:0 attributes:0];

    id v7 = [MEMORY[0x1E4F5A900] fileWithURL:v12 options:1 ofType:v8];

    if (!v7) {
      goto LABEL_5;
    }
  }
  char v15 = [v7 fileURL];
  BOOL v16 = [(WFWorkflowFile *)self writeToFileURL:v15 format:a3 error:a4];

  if (v16)
  {
    objc_storeStrong((id *)&self->_file, v7);
    id v7 = v7;
    id v17 = v7;
  }
  else
  {
LABEL_5:
    id v17 = 0;
  }

  return v17;
}

- (void)setMinimumClientVersion:(id)a3
{
  rootObject = self->_rootObject;
  id v5 = a3;
  [(NSMutableDictionary *)rootObject setValue:v5 forKey:@"WFWorkflowMinimumClientVersionString"];
  v6 = self->_rootObject;
  id v7 = NSNumber;
  uint64_t v8 = [v5 integerValue];

  id v9 = [v7 numberWithInteger:v8];
  [(NSMutableDictionary *)v6 setValue:v9 forKey:@"WFWorkflowMinimumClientVersion"];
}

- (NSString)minimumClientVersion
{
  dispatch_semaphore_t v3 = [(NSMutableDictionary *)self->_rootObject objectForKeyedSubscript:@"WFWorkflowMinimumClientVersionString"];
  if (v3) {
    id v4 = @"WFWorkflowMinimumClientVersionString";
  }
  else {
    id v4 = @"WFWorkflowMinimumClientVersion";
  }
  id v5 = [(NSMutableDictionary *)self->_rootObject objectForKeyedSubscript:v4];
  v6 = WFConvertToBundleString(v5);

  return (NSString *)v6;
}

- (void)setLastMigratedClientVersion:(id)a3
{
}

- (NSString)lastMigratedClientVersion
{
  v2 = [(NSMutableDictionary *)self->_rootObject objectForKeyedSubscript:@"WFWorkflowClientVersion"];
  dispatch_semaphore_t v3 = WFConvertToBundleString(v2);

  return (NSString *)v3;
}

- (void)setImportQuestions:(id)a3
{
}

- (NSArray)importQuestions
{
  v2 = [(NSMutableDictionary *)self->_rootObject objectForKeyedSubscript:@"WFWorkflowImportQuestions"];
  uint64_t v3 = objc_opt_class();
  id v4 = WFEnforceClass(v2, v3);
  id v5 = v4;
  if (!v4) {
    id v4 = (void *)MEMORY[0x1E4F1CBF0];
  }
  v6 = v4;

  return v6;
}

- (void)setActions:(id)a3
{
}

- (NSArray)actions
{
  v2 = [(NSMutableDictionary *)self->_rootObject objectForKeyedSubscript:@"WFWorkflowActions"];
  uint64_t v3 = objc_opt_class();
  id v4 = WFEnforceClass(v2, v3);
  id v5 = v4;
  if (!v4) {
    id v4 = (void *)MEMORY[0x1E4F1CBF0];
  }
  v6 = v4;

  return v6;
}

- (void)setDisabledOnLockScreen:(BOOL)a3
{
  rootObject = self->_rootObject;
  if (a3)
  {
    id v5 = [NSNumber numberWithBool:1];
    [(NSMutableDictionary *)rootObject setValue:v5 forKey:@"WFWorkflowIsDisabledOnLockScreen"];
  }
  else
  {
    id v4 = self->_rootObject;
    [(NSMutableDictionary *)v4 removeObjectForKey:@"WFWorkflowIsDisabledOnLockScreen"];
  }
}

- (BOOL)disabledOnLockScreen
{
  v2 = [(NSMutableDictionary *)self->_rootObject objectForKeyedSubscript:@"WFWorkflowIsDisabledOnLockScreen"];
  uint64_t v3 = objc_opt_class();
  id v4 = WFEnforceClass(v2, v3);
  char v5 = [v4 BOOLValue];

  return v5;
}

- (void)setHasOutputFallback:(BOOL)a3
{
  rootObject = self->_rootObject;
  id v4 = [NSNumber numberWithBool:a3];
  [(NSMutableDictionary *)rootObject setValue:v4 forKey:@"WFWorkflowHasOutputFallback"];
}

- (BOOL)hasOutputFallback
{
  v2 = [(NSMutableDictionary *)self->_rootObject objectForKeyedSubscript:@"WFWorkflowHasOutputFallback"];
  uint64_t v3 = objc_opt_class();
  id v4 = WFEnforceClass(v2, v3);
  char v5 = [v4 BOOLValue];

  return v5;
}

- (void)setHasShortcutInputVariables:(BOOL)a3
{
  rootObject = self->_rootObject;
  id v4 = [NSNumber numberWithBool:a3];
  [(NSMutableDictionary *)rootObject setValue:v4 forKey:@"WFWorkflowHasShortcutInputVariables"];
}

- (BOOL)hasShortcutInputVariables
{
  v2 = [(NSMutableDictionary *)self->_rootObject objectForKeyedSubscript:@"WFWorkflowHasShortcutInputVariables"];
  uint64_t v3 = objc_opt_class();
  id v4 = WFEnforceClass(v2, v3);
  char v5 = [v4 BOOLValue];

  return v5;
}

- (void)setOutputClasses:(id)a3
{
}

- (NSArray)outputClasses
{
  v2 = [(NSMutableDictionary *)self->_rootObject objectForKeyedSubscript:@"WFWorkflowOutputContentItemClasses"];
  uint64_t v3 = objc_opt_class();
  id v4 = WFEnforceClass(v2, v3);
  char v5 = v4;
  if (!v4) {
    id v4 = (void *)MEMORY[0x1E4F1CBF0];
  }
  v6 = v4;

  return v6;
}

- (void)setNoInputBehavior:(id)a3
{
}

- (NSDictionary)noInputBehavior
{
  v2 = [(NSMutableDictionary *)self->_rootObject objectForKeyedSubscript:@"WFWorkflowNoInputBehavior"];
  uint64_t v3 = objc_opt_class();
  id v4 = WFEnforceClass(v2, v3);

  return (NSDictionary *)v4;
}

- (void)setInputClasses:(id)a3
{
}

- (NSArray)inputClasses
{
  v2 = [(NSMutableDictionary *)self->_rootObject objectForKeyedSubscript:@"WFWorkflowInputContentItemClasses"];
  uint64_t v3 = objc_opt_class();
  id v4 = WFEnforceClass(v2, v3);
  char v5 = v4;
  if (!v4) {
    id v4 = (void *)MEMORY[0x1E4F1CBF0];
  }
  v6 = v4;

  return v6;
}

- (void)setQuickActionSurfacesForSharing:(id)a3
{
}

- (NSArray)quickActionSurfacesForSharing
{
  v2 = [(NSMutableDictionary *)self->_rootObject objectForKeyedSubscript:@"WFQuickActionSurfaces"];
  uint64_t v3 = objc_opt_class();
  id v4 = WFEnforceClass(v2, v3);
  char v5 = v4;
  if (!v4) {
    id v4 = (void *)MEMORY[0x1E4F1CBF0];
  }
  v6 = v4;

  return v6;
}

- (void)setWorkflowTypes:(id)a3
{
}

- (NSArray)workflowTypes
{
  v2 = [(NSMutableDictionary *)self->_rootObject objectForKeyedSubscript:@"WFWorkflowTypes"];
  uint64_t v3 = objc_opt_class();
  id v4 = WFEnforceClass(v2, v3);
  char v5 = v4;
  if (!v4) {
    id v4 = (void *)MEMORY[0x1E4F1CBF0];
  }
  v6 = v4;

  return v6;
}

- (void)setIcon:(id)a3
{
  id v10 = a3;
  if (v10)
  {
    id v4 = objc_opt_new();
    char v5 = objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(v10, "backgroundColorValue"));
    [v4 setObject:v5 forKeyedSubscript:@"WFWorkflowIconStartColor"];

    v6 = objc_msgSend(NSNumber, "numberWithUnsignedShort:", objc_msgSend(v10, "glyphCharacter"));
    [v4 setObject:v6 forKeyedSubscript:@"WFWorkflowIconGlyphNumber"];

    id v7 = [v10 customImageData];

    if (v7)
    {
      uint64_t v8 = [v10 customImageData];
      [v4 setObject:v8 forKeyedSubscript:@"WFWorkflowIconImageData"];
    }
    id v9 = (void *)[v4 copy];
    [(NSMutableDictionary *)self->_rootObject setObject:v9 forKeyedSubscript:@"WFWorkflowIcon"];
  }
  else
  {
    [(NSMutableDictionary *)self->_rootObject removeObjectForKey:@"WFWorkflowIcon"];
  }
}

- (WFWorkflowIcon)icon
{
  v2 = [(NSMutableDictionary *)self->_rootObject objectForKeyedSubscript:@"WFWorkflowIcon"];
  uint64_t v3 = objc_opt_class();
  id v4 = WFEnforceClass(v2, v3);

  char v5 = [v4 objectForKeyedSubscript:@"WFWorkflowIconStartColor"];
  uint64_t v6 = objc_opt_class();
  id v7 = WFEnforceClass(v5, v6);
  uint64_t v8 = [v7 integerValue];

  id v9 = [v4 objectForKeyedSubscript:@"WFWorkflowIconGlyphNumber"];
  uint64_t v10 = objc_opt_class();
  id v11 = WFEnforceClass(v9, v10);
  unsigned __int16 v12 = [v11 unsignedIntegerValue];

  BOOL v13 = [v4 objectForKeyedSubscript:@"WFWorkflowIconImageData"];
  uint64_t v14 = objc_opt_class();
  char v15 = WFEnforceClass(v13, v14);

  BOOL v16 = (void *)[objc_alloc(MEMORY[0x1E4FB4A50]) initWithBackgroundColorValue:v8 glyphCharacter:v12 customImageData:v15];
  return (WFWorkflowIcon *)v16;
}

- (id)recordRepresentationWithError:(id *)a3
{
  uint64_t v3 = [(WFRecord *)[WFWorkflowRecord alloc] initWithStorage:self];
  return v3;
}

- (unint64_t)estimatedSize
{
  v2 = [(WFWorkflowFile *)self file];
  unint64_t v3 = [v2 fileSize];

  return v3;
}

- (id)descriptor
{
  unint64_t v3 = [(WFWorkflowFile *)self file];

  if (v3)
  {
    id v4 = [WFWorkflowFileDescriptor alloc];
    char v5 = [(WFWorkflowFile *)self file];
    uint64_t v6 = [(WFWorkflowFile *)self name];
    id v7 = [(WFWorkflowFile *)self quarantine];
    uint64_t v8 = [v7 sourceAppIdentifier];
    id v9 = [(WFWorkflowFileDescriptor *)v4 initWithFile:v5 name:v6 sourceAppIdentifier:v8];
  }
  else
  {
    id v9 = 0;
  }
  return v9;
}

- (WFWorkflowFile)initWithDescriptor:(id)a3 performMigration:(BOOL)a4 error:(id *)a5
{
  BOOL v6 = a4;
  id v9 = a3;
  if (!v9)
  {
    v35 = [MEMORY[0x1E4F28B00] currentHandler];
    [v35 handleFailureInMethod:a2, self, @"WFWorkflowFile.m", 155, @"Invalid parameter not satisfying: %@", @"descriptor" object file lineNumber description];
  }
  uint64_t v10 = [v9 file];
  id v11 = [v10 inputStream];
  [v11 open];
  unsigned __int16 v12 = [MEMORY[0x1E4F28F98] propertyListWithStream:v11 options:0 format:0 error:a5];
  [v11 close];
  if (v12
    && (v36.receiver = self,
        v36.super_class = (Class)WFWorkflowFile,
        (self = [(WFWorkflowFile *)&v36 init]) != 0))
  {
    BOOL v13 = [MEMORY[0x1E4F29128] UUID];
    uint64_t v14 = [v13 UUIDString];
    identifier = self->_identifier;
    self->_identifier = v14;

    objc_storeStrong((id *)&self->_file, v10);
    BOOL v16 = (NSMutableDictionary *)[v12 mutableCopy];
    rootObject = self->_rootObject;
    self->_rootObject = v16;

    v18 = [v9 name];
    id v19 = (NSString *)[v18 copy];
    name = self->_name;
    self->_name = v19;

    v21 = [v10 creationDate];
    creationDate = self->_creationDate;
    self->_creationDate = v21;

    v23 = [v10 modificationDate];
    v24 = v23;
    if (v23)
    {
      v25 = v23;
    }
    else
    {
      v25 = [MEMORY[0x1E4F1C9C8] date];
    }
    modificationDate = self->_modificationDate;
    self->_modificationDate = v25;

    v28 = [v9 sourceAppIdentifier];

    if (v28)
    {
      v29 = [WFWorkflowQuarantine alloc];
      v30 = [v9 sourceAppIdentifier];
      v31 = [MEMORY[0x1E4F1C9C8] date];
      v32 = [(WFWorkflowQuarantine *)v29 initWithSourceAppIdentifier:v30 importDate:v31];
      quarantine = self->_quarantine;
      self->_quarantine = v32;
    }
    if (v6) {
      [(WFWorkflowFile *)self migrateRootObject];
    }
    self = self;
    v26 = self;
  }
  else
  {
    v26 = 0;
  }

  return v26;
}

- (WFWorkflowFile)initWithDescriptor:(id)a3 error:(id *)a4
{
  return [(WFWorkflowFile *)self initWithDescriptor:a3 performMigration:1 error:a4];
}

- (WFWorkflowFile)initWithDictionary:(id)a3 name:(id)a4 performMigration:(BOOL)a5
{
  BOOL v5 = a5;
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  uint64_t v10 = getWFGeneralLogObject();
  os_signpost_id_t v11 = os_signpost_id_generate(v10);

  unsigned __int16 v12 = getWFGeneralLogObject();
  BOOL v13 = v12;
  if (v11 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v12))
  {
    *(_DWORD *)buf = 138412290;
    v32 = @"dictionary";
    _os_signpost_emit_with_name_impl(&dword_1C7F0A000, v13, OS_SIGNPOST_INTERVAL_BEGIN, v11, "WFWorkflowFileInit", "type=%{signpost.description:attribute}@", buf, 0xCu);
  }

  v30.receiver = self;
  v30.super_class = (Class)WFWorkflowFile;
  uint64_t v14 = [(WFWorkflowFile *)&v30 init];
  if (v14)
  {
    char v15 = [MEMORY[0x1E4F29128] UUID];
    uint64_t v16 = [v15 UUIDString];
    identifier = v14->_identifier;
    v14->_identifier = (NSString *)v16;

    uint64_t v18 = [v8 mutableCopy];
    rootObject = v14->_rootObject;
    v14->_rootObject = (NSMutableDictionary *)v18;

    uint64_t v20 = [v9 copy];
    name = v14->_name;
    v14->_name = (NSString *)v20;

    uint64_t v22 = [MEMORY[0x1E4F1C9C8] date];
    creationDate = v14->_creationDate;
    v14->_creationDate = (NSDate *)v22;

    uint64_t v24 = [MEMORY[0x1E4F1C9C8] date];
    modificationDate = v14->_modificationDate;
    v14->_modificationDate = (NSDate *)v24;

    if (v5) {
      [(WFWorkflowFile *)v14 migrateRootObject];
    }
    v26 = getWFGeneralLogObject();
    v27 = v26;
    if (v11 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v26))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_1C7F0A000, v27, OS_SIGNPOST_INTERVAL_END, v11, "WFWorkflowFileInit", "", buf, 2u);
    }

    v28 = v14;
  }

  return v14;
}

- (WFWorkflowFile)initWithDictionary:(id)a3 name:(id)a4
{
  return [(WFWorkflowFile *)self initWithDictionary:a3 name:a4 performMigration:1];
}

- (WFWorkflowFile)initWithFileData:(id)a3 name:(id)a4 error:(id *)a5
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v8 = a4;
  id v9 = a3;
  uint64_t v10 = getWFGeneralLogObject();
  os_signpost_id_t v11 = os_signpost_id_generate(v10);

  unsigned __int16 v12 = getWFGeneralLogObject();
  BOOL v13 = v12;
  if (v11 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v12))
  {
    int v19 = 138412290;
    uint64_t v20 = @"data";
    _os_signpost_emit_with_name_impl(&dword_1C7F0A000, v13, OS_SIGNPOST_INTERVAL_BEGIN, v11, "WFWorkflowFileInit", "type=%{signpost.description:attribute}@", (uint8_t *)&v19, 0xCu);
  }

  uint64_t v14 = [MEMORY[0x1E4F28F98] propertyListWithData:v9 options:0 format:0 error:a5];

  if (v14)
  {
    char v15 = getWFGeneralLogObject();
    uint64_t v16 = v15;
    if (v11 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v15))
    {
      LOWORD(v19) = 0;
      _os_signpost_emit_with_name_impl(&dword_1C7F0A000, v16, OS_SIGNPOST_INTERVAL_END, v11, "WFWorkflowFileInit", "", (uint8_t *)&v19, 2u);
    }

    self = [(WFWorkflowFile *)self initWithDictionary:v14 name:v8];
    id v17 = self;
  }
  else
  {
    id v17 = 0;
  }

  return v17;
}

- (WFWorkflowFile)init
{
  unint64_t v3 = objc_opt_new();
  id v4 = [(WFWorkflowFile *)self initWithDictionary:v3 name:0];

  return v4;
}

+ (NSArray)writableTypeIdentifiersForItemProvider
{
  v4[1] = *MEMORY[0x1E4F143B8];
  v4[0] = @"com.apple.shortcuts.workflow-file";
  v2 = [MEMORY[0x1E4F1C978] arrayWithObjects:v4 count:1];
  return (NSArray *)v2;
}

@end