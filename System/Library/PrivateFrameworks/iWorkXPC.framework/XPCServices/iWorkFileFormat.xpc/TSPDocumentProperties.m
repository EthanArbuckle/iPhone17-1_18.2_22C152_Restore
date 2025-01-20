@interface TSPDocumentProperties
+ (BOOL)documentIsEncryptedAtURL:(id)a3;
+ (id)documentPropertiesRelativePath;
+ (id)documentRevisionAtURL:(id)a3;
+ (id)documentUUIDAtURL:(id)a3;
+ (id)keychainGenericItemForDocumentUUID:(id)a3;
+ (id)shareIdentifierRelativePath;
- (BOOL)writeToDocumentBundleURL:(id)a3 error:(id *)a4;
- (BOOL)writeToDocumentURL:(id)a3 writerBlock:(id)a4 error:(id *)a5;
- (BOOL)writeToPackageWriter:(id)a3 error:(id *)a4;
- (BOOL)writeToPropertiesURL:(id)a3 error:(id *)a4;
- (NSDictionary)additionalProperties;
- (NSUUID)documentUUID;
- (NSUUID)shareUUID;
- (NSUUID)stableDocumentUUID;
- (NSUUID)versionUUID;
- (TSPDocumentProperties)init;
- (TSPDocumentProperties)initWithDocumentBundleURL:(id)a3 allowMissingPropertyList:(BOOL)a4 error:(id *)a5;
- (TSPDocumentProperties)initWithDocumentFileURL:(id)a3 allowMissingPropertyList:(BOOL)a4 error:(id *)a5;
- (TSPDocumentProperties)initWithDocumentURL:(id)a3 allowMissingPropertyList:(BOOL)a4 error:(id *)a5;
- (TSPDocumentProperties)initWithDocumentURL:(id)a3 error:(id *)a4;
- (TSPDocumentProperties)initWithFilePackageURL:(id)a3 zipArchive:(id)a4 allowMissingPropertyList:(BOOL)a5 error:(id *)a6;
- (TSPDocumentProperties)initWithPropertiesURL:(id)a3 error:(id *)a4;
- (TSPDocumentRevision)revision;
- (id)UUIDFromDocumentProperties:(id)a3 key:(id)a4;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)encodedPropertyListWithError:(id *)a3;
- (id)hashPrivateUUIDWithDigest:(id)a3;
- (unint64_t)fileFormatVersion;
- (void)readDocumentPropertiesFromDictionary:(id)a3;
- (void)setAdditionalProperties:(id)a3;
- (void)setDocumentUUID:(id)a3;
- (void)setFileFormatVersion:(unint64_t)a3;
- (void)setRevision:(id)a3;
- (void)updateDocumentUUID;
- (void)updateDocumentUUIDAndPreserveShareUUID:(BOOL)a3 preserveStableDocumentUUID:(BOOL)a4;
- (void)updateVersionUUID;
@end

@implementation TSPDocumentProperties

- (TSPDocumentProperties)init
{
  v5.receiver = self;
  v5.super_class = (Class)TSPDocumentProperties;
  v2 = [(TSPDocumentProperties *)&v5 init];
  v3 = v2;
  if (v2) {
    [(TSPDocumentProperties *)v2 updateDocumentUUIDAndPreserveShareUUID:0 preserveStableDocumentUUID:1];
  }
  return v3;
}

- (TSPDocumentProperties)initWithDocumentURL:(id)a3 error:(id *)a4
{
  return [(TSPDocumentProperties *)self initWithDocumentURL:a3 allowMissingPropertyList:1 error:a4];
}

- (TSPDocumentProperties)initWithDocumentURL:(id)a3 allowMissingPropertyList:(BOOL)a4 error:(id *)a5
{
  BOOL v6 = a4;
  id v8 = a3;
  if (+[TSPDirectoryPackage isValidPackageAtURL:v8]
    || +[TSPExpandedDirectoryPackage isValidPackageAtURL:v8])
  {
    v9 = [(TSPDocumentProperties *)self initWithDocumentBundleURL:v8 allowMissingPropertyList:v6 error:a5];
  }
  else
  {
    v9 = [(TSPDocumentProperties *)self initWithDocumentFileURL:v8 allowMissingPropertyList:v6 error:a5];
  }
  v10 = v9;

  return v10;
}

- (TSPDocumentProperties)initWithDocumentBundleURL:(id)a3 allowMissingPropertyList:(BOOL)a4 error:(id *)a5
{
  BOOL v6 = a4;
  id v8 = a3;
  v14.receiver = self;
  v14.super_class = (Class)TSPDocumentProperties;
  v9 = [(TSPDocumentProperties *)&v14 init];
  if (v9)
  {
    v10 = [(id)objc_opt_class() documentPropertiesRelativePath];
    v11 = [v8 URLByAppendingPathComponent:v10 isDirectory:0];

    v12 = +[NSPropertyListSerialization tsu_propertyListWithContentsOfURL:v11 options:0 error:a5];
    if (v12)
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        [(TSPDocumentProperties *)v9 readDocumentPropertiesFromDictionary:v12];
LABEL_8:

        goto LABEL_9;
      }
    }
    else if (v6)
    {
      [(TSPDocumentProperties *)v9 updateDocumentUUIDAndPreserveShareUUID:0 preserveStableDocumentUUID:1];
      goto LABEL_8;
    }

    v9 = 0;
    goto LABEL_8;
  }
LABEL_9:

  return v9;
}

- (TSPDocumentProperties)initWithDocumentFileURL:(id)a3 allowMissingPropertyList:(BOOL)a4 error:(id *)a5
{
  BOOL v6 = a4;
  id v8 = a3;
  v9 = +[TSUZipFileArchive zipArchiveFromURL:v8 options:5 error:a5];
  if (!v9) {
    goto LABEL_6;
  }
  if (!+[TSPFilePackage isValidPackageAtZipArchive:v9])
  {
    if (a5)
    {
      +[NSError tsp_readCorruptedDocumentErrorWithUserInfo:0];
      v10 = 0;
      *a5 = (id)objc_claimAutoreleasedReturnValue();
      goto LABEL_7;
    }
LABEL_6:
    v10 = 0;
    goto LABEL_7;
  }
  self = [(TSPDocumentProperties *)self initWithFilePackageURL:v8 zipArchive:v9 allowMissingPropertyList:v6 error:a5];
  v10 = self;
LABEL_7:

  return v10;
}

- (TSPDocumentProperties)initWithFilePackageURL:(id)a3 zipArchive:(id)a4 allowMissingPropertyList:(BOOL)a5 error:(id *)a6
{
  BOOL v7 = a5;
  id v10 = a3;
  id v11 = a4;
  if (!v11)
  {
    +[TSUAssertionHandler _atomicIncrementAssertCount];
    if (TSUAssertCat_init_token != -1) {
      dispatch_once(&TSUAssertCat_init_token, &stru_1001C7458);
    }
    if (os_log_type_enabled((os_log_t)TSUAssertCat_log_t, OS_LOG_TYPE_ERROR)) {
      sub_1001631B8();
    }
    v12 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[TSPDocumentProperties initWithFilePackageURL:zipArchive:allowMissingPropertyList:error:]");
    v13 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/iWorkXPC/shared/persistence/src/TSPDocumentProperties.mm"];
    +[TSUAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](TSUAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v12, v13, 145, 0, "invalid nil value for '%{public}s'", "zipArchive");

    +[TSUAssertionHandler logBacktraceThrottled];
  }
  v22.receiver = self;
  v22.super_class = (Class)TSPDocumentProperties;
  objc_super v14 = [(TSPDocumentProperties *)&v22 init];
  if (v14)
  {
    v15 = [(id)objc_opt_class() documentPropertiesRelativePath];
    v16 = [v11 entryForName:v15];

    v17 = objc_msgSend(v11, "tsp_dataForEntry:", v16);
    if (v17
      && (uint64_t v18 = objc_opt_class(),
          +[NSPropertyListSerialization propertyListWithData:v17 options:0 format:0 error:a6], v19 = objc_claimAutoreleasedReturnValue(), TSUDynamicCast(v18, (uint64_t)v19), v20 = objc_claimAutoreleasedReturnValue(), v19, v20))
    {
      [(TSPDocumentProperties *)v14 readDocumentPropertiesFromDictionary:v20];
    }
    else
    {
      if (v7)
      {
        [(TSPDocumentProperties *)v14 updateDocumentUUIDAndPreserveShareUUID:0 preserveStableDocumentUUID:1];
LABEL_15:

        goto LABEL_16;
      }
      v20 = v14;
      objc_super v14 = 0;
    }

    goto LABEL_15;
  }
LABEL_16:

  return v14;
}

- (TSPDocumentProperties)initWithPropertiesURL:(id)a3 error:(id *)a4
{
  id v6 = a3;
  uint64_t v7 = objc_opt_class();
  id v8 = +[NSPropertyListSerialization tsu_propertyListWithContentsOfURL:v6 options:0 error:a4];
  v9 = TSUDynamicCast(v7, (uint64_t)v8);

  if (v9)
  {
    v13.receiver = self;
    v13.super_class = (Class)TSPDocumentProperties;
    id v10 = [(TSPDocumentProperties *)&v13 init];
    id v11 = v10;
    if (v10) {
      [(TSPDocumentProperties *)v10 readDocumentPropertiesFromDictionary:v9];
    }
  }
  else
  {

    id v11 = 0;
  }

  return v11;
}

- (void)readDocumentPropertiesFromDictionary:(id)a3
{
  id v4 = a3;
  objc_super v5 = [(TSPDocumentProperties *)self UUIDFromDocumentProperties:v4 key:@"documentUUID"];
  documentUUID = self->_documentUUID;
  self->_documentUUID = v5;

  uint64_t v7 = [(TSPDocumentProperties *)self UUIDFromDocumentProperties:v4 key:@"versionUUID"];
  versionUUID = self->_versionUUID;
  self->_versionUUID = v7;

  v9 = [(TSPDocumentProperties *)self UUIDFromDocumentProperties:v4 key:@"shareUUID"];
  shareUUID = self->_shareUUID;
  self->_shareUUID = v9;

  id v11 = [(TSPDocumentProperties *)self UUIDFromDocumentProperties:v4 key:@"stableDocumentUUID"];
  stableDocumentUUID = self->_stableDocumentUUID;
  self->_stableDocumentUUID = v11;

  objc_super v13 = [(TSPDocumentProperties *)self UUIDFromDocumentProperties:v4 key:@"privateUUID"];
  privateUUID = self->_privateUUID;
  self->_privateUUID = v13;

  v15 = [v4 objectForKeyedSubscript:@"fileFormatVersion"];
  self->_fileFormatVersion = UnsafePointer(v15);

  v16 = [TSPDocumentRevision alloc];
  v17 = [v4 objectForKeyedSubscript:@"revision"];
  uint64_t v18 = [(TSPDocumentRevision *)v16 initWithRevisionString:v17];
  revision = self->_revision;
  self->_revision = v18;

  if (!self->_documentUUID) {
    [(TSPDocumentProperties *)self updateDocumentUUID];
  }
  if (!self->_shareUUID) {
    objc_storeStrong((id *)&self->_shareUUID, self->_documentUUID);
  }
  if (!self->_stableDocumentUUID) {
    objc_storeStrong((id *)&self->_stableDocumentUUID, self->_documentUUID);
  }
  if (!self->_privateUUID)
  {
    v20 = +[NSUUID UUID];
    v21 = self->_privateUUID;
    self->_privateUUID = v20;
  }
  objc_super v22 = (NSDictionary *)[v4 mutableCopy];
  long long v30 = 0u;
  long long v31 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  v23 = sub_1000309D0();
  id v24 = [v23 countByEnumeratingWithState:&v28 objects:v32 count:16];
  if (v24)
  {
    uint64_t v25 = *(void *)v29;
    do
    {
      for (i = 0; i != v24; i = (char *)i + 1)
      {
        if (*(void *)v29 != v25) {
          objc_enumerationMutation(v23);
        }
        -[NSDictionary removeObjectForKey:](v22, "removeObjectForKey:", *(void *)(*((void *)&v28 + 1) + 8 * i), (void)v28);
      }
      id v24 = [v23 countByEnumeratingWithState:&v28 objects:v32 count:16];
    }
    while (v24);
  }

  additionalProperties = self->_additionalProperties;
  self->_additionalProperties = v22;
}

- (id)UUIDFromDocumentProperties:(id)a3 key:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  if (v6)
  {
    uint64_t v7 = [v5 objectForKeyedSubscript:v6];
    if (v7) {
      id v8 = [objc_alloc((Class)NSUUID) initWithUUIDString:v7];
    }
    else {
      id v8 = 0;
    }
  }
  else
  {
    id v8 = 0;
  }

  return v8;
}

- (BOOL)writeToDocumentURL:(id)a3 writerBlock:(id)a4 error:(id *)a5
{
  uint64_t v7 = (uint64_t (**)(id, void *, void *))a4;
  id v8 = [(TSPDocumentProperties *)self encodedPropertyListWithError:a5];
  if (v8
    && ([(id)objc_opt_class() documentPropertiesRelativePath],
        v9 = objc_claimAutoreleasedReturnValue(),
        int v10 = v7[2](v7, v8, v9),
        v9,
        v10))
  {
    id v11 = [(TSPDocumentProperties *)self shareUUID];
    v12 = [v11 UUIDString];
    objc_super v13 = [v12 dataUsingEncoding:4];

    objc_super v14 = [(id)objc_opt_class() shareIdentifierRelativePath];
    char v15 = v7[2](v7, v13, v14);

    if (a5) {
      char v16 = v15;
    }
    else {
      char v16 = 1;
    }
    if ((v16 & 1) == 0)
    {
      *a5 = +[NSError tsp_saveDocumentErrorWithUserInfo:0];
    }
  }
  else
  {
    char v15 = 0;
  }

  return v15;
}

- (BOOL)writeToPackageWriter:(id)a3 error:(id *)a4
{
  id v6 = a3;
  uint64_t v7 = [v6 URL];
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_100030D5C;
  v10[3] = &unk_1001C7480;
  id v8 = v6;
  id v11 = v8;
  v12 = a4;
  LOBYTE(a4) = [(TSPDocumentProperties *)self writeToDocumentURL:v7 writerBlock:v10 error:a4];

  return (char)a4;
}

- (BOOL)writeToDocumentBundleURL:(id)a3 error:(id *)a4
{
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_100030E3C;
  v8[3] = &unk_1001C7480;
  id v9 = a3;
  int v10 = a4;
  id v6 = v9;
  LOBYTE(a4) = [(TSPDocumentProperties *)self writeToDocumentURL:v6 writerBlock:v8 error:a4];

  return (char)a4;
}

- (id)encodedPropertyListWithError:(id *)a3
{
  id v5 = self->_additionalProperties;
  id v6 = objc_msgSend(objc_alloc((Class)NSMutableDictionary), "initWithCapacity:", (char *)-[NSDictionary count](v5, "count") + 5);
  uint64_t v7 = [(TSPDocumentProperties *)self documentUUID];
  id v8 = [v7 UUIDString];
  [v6 setObject:v8 forKeyedSubscript:@"documentUUID"];

  id v9 = [(TSPDocumentProperties *)self versionUUID];
  int v10 = [v9 UUIDString];
  [v6 setObject:v10 forKeyedSubscript:@"versionUUID"];

  id v11 = [(TSPDocumentProperties *)self shareUUID];
  v12 = [v11 UUIDString];
  [v6 setObject:v12 forKeyedSubscript:@"shareUUID"];

  objc_super v13 = [(TSPDocumentProperties *)self stableDocumentUUID];
  objc_super v14 = [v13 UUIDString];
  [v6 setObject:v14 forKeyedSubscript:@"stableDocumentUUID"];

  char v15 = [(NSUUID *)self->_privateUUID UUIDString];
  [v6 setObject:v15 forKeyedSubscript:@"privateUUID"];

  char v16 = NSStringFromTSPVersion([(TSPDocumentProperties *)self fileFormatVersion]);
  [v6 setObject:v16 forKeyedSubscript:@"fileFormatVersion"];

  v17 = self->_revision;
  uint64_t v18 = v17;
  if (v17)
  {
    v19 = [(TSPDocumentRevision *)v17 revisionString];
    [v6 setObject:v19 forKeyedSubscript:@"revision"];
  }
  if (v5) {
    [v6 addEntriesFromDictionary:v5];
  }
  v20 = +[NSPropertyListSerialization dataWithPropertyList:v6 format:200 options:0 error:a3];

  return v20;
}

- (BOOL)writeToPropertiesURL:(id)a3 error:(id *)a4
{
  id v6 = a3;
  uint64_t v7 = [(TSPDocumentProperties *)self encodedPropertyListWithError:a4];
  id v8 = v7;
  if (v7) {
    unsigned __int8 v9 = [v7 writeToURL:v6 options:0 error:a4];
  }
  else {
    unsigned __int8 v9 = 0;
  }

  return v9;
}

+ (id)documentUUIDAtURL:(id)a3
{
  id v3 = a3;
  value[0] = 0;
  value[1] = 0;
  id v4 = [v3 path];
  BOOL v5 = getxattr((const char *)[v4 UTF8String], "com.apple.iwork.documentUUID", value, 0x10uLL, 0, 0) == 16;

  if (v5)
  {
    id v6 = [objc_alloc((Class)NSUUID) initWithUUIDBytes:value];
  }
  else
  {
    uint64_t v7 = [[TSPDocumentProperties alloc] initWithDocumentURL:v3 error:0];
    id v6 = [(TSPDocumentProperties *)v7 documentUUID];
  }
  return v6;
}

+ (id)documentRevisionAtURL:(id)a3
{
  id v3 = a3;
  id v13 = 0;
  id v4 = [[TSPDocumentProperties alloc] initWithDocumentURL:v3 error:&v13];
  id v5 = v13;
  if (v5)
  {
    if (TSUDefaultCat_init_token != -1) {
      dispatch_once(&TSUDefaultCat_init_token, &stru_1001C74A0);
    }
    id v6 = TSUDefaultCat_log_t;
    if (os_log_type_enabled((os_log_t)v6, OS_LOG_TYPE_ERROR))
    {
      unsigned __int8 v9 = (objc_class *)objc_opt_class();
      NSStringFromClass(v9);
      id v10 = (id)objc_claimAutoreleasedReturnValue();
      id v11 = [v5 domain];
      id v12 = [v5 code];
      *(_DWORD *)buf = 138544130;
      id v15 = v10;
      __int16 v16 = 2114;
      v17 = v11;
      __int16 v18 = 2048;
      id v19 = v12;
      __int16 v20 = 2112;
      id v21 = v5;
      _os_log_error_impl((void *)&_mh_execute_header, (os_log_t)v6, OS_LOG_TYPE_ERROR, "Failed to read TSPDocumentProperties with error: errorClass=%{public}@, domain=%{public}@, code=%zd (%@) ", buf, 0x2Au);
    }
    uint64_t v7 = 0;
  }
  else
  {
    uint64_t v7 = [(TSPDocumentProperties *)v4 revision];
  }

  return v7;
}

+ (BOOL)documentIsEncryptedAtURL:(id)a3
{
  id v3 = a3;
  id v4 = [v3 path];
  id v5 = +[NSFileManager defaultManager];
  char v11 = 0;
  if (![v5 fileExistsAtPath:v4 isDirectory:&v11]) {
    goto LABEL_10;
  }
  if (!v11)
  {
    if (+[SFUZipArchive isZipArchiveAtPath:v4])
    {
      id v6 = [[SFUZipArchive alloc] initWithPath:v4 collapseCommonRootDirectory:1];
      if (![(SFUZipArchive *)v6 isEncrypted])
      {
        unsigned __int8 v9 = [(SFUZipArchive *)v6 entryWithName:@".iwpv2"];
        unsigned __int8 v8 = v9 != 0;

        goto LABEL_8;
      }
      goto LABEL_7;
    }
LABEL_10:
    unsigned __int8 v8 = 0;
    goto LABEL_11;
  }
  id v6 = [v4 stringByAppendingPathComponent:@".iwpv2"];
  if ([v5 fileExistsAtPath:v6])
  {
LABEL_7:
    unsigned __int8 v8 = 1;
    goto LABEL_8;
  }
  uint64_t v7 = [v4 stringByAppendingPathComponent:@".iwpv"];
  unsigned __int8 v8 = [v5 fileExistsAtPath:v7];

LABEL_8:
LABEL_11:

  return v8;
}

+ (id)keychainGenericItemForDocumentUUID:(id)a3
{
  id v3 = [a3 UUIDString];
  id v4 = [v3 dataUsingEncoding:4];

  return v4;
}

+ (id)documentPropertiesRelativePath
{
  if (qword_1001EB358 != -1) {
    dispatch_once(&qword_1001EB358, &stru_1001C74C0);
  }
  v2 = (void *)qword_1001EB350;
  return v2;
}

+ (id)shareIdentifierRelativePath
{
  if (qword_1001EB368 != -1) {
    dispatch_once(&qword_1001EB368, &stru_1001C74E0);
  }
  v2 = (void *)qword_1001EB360;
  return v2;
}

- (NSUUID)documentUUID
{
  return self->_documentUUID;
}

- (void)updateDocumentUUID
{
  id v3 = +[NSUUID UUID];
  documentUUID = self->_documentUUID;
  self->_documentUUID = v3;

  self->_privateUUID = +[NSUUID UUID];
  _objc_release_x1();
}

- (void)updateDocumentUUIDAndPreserveShareUUID:(BOOL)a3 preserveStableDocumentUUID:(BOOL)a4
{
  [(TSPDocumentProperties *)self updateDocumentUUID];
  if (!a3) {
    objc_storeStrong((id *)&self->_shareUUID, self->_documentUUID);
  }
  if (!a4)
  {
    documentUUID = self->_documentUUID;
    objc_storeStrong((id *)&self->_stableDocumentUUID, documentUUID);
  }
}

- (NSUUID)versionUUID
{
  versionUUID = self->_versionUUID;
  if (!versionUUID)
  {
    [(TSPDocumentProperties *)self updateVersionUUID];
    versionUUID = self->_versionUUID;
  }
  return versionUUID;
}

- (void)updateVersionUUID
{
  self->_versionUUID = +[NSUUID UUID];
  _objc_release_x1();
}

- (NSUUID)shareUUID
{
  shareUUID = self->_shareUUID;
  p_shareUUID = &self->_shareUUID;
  id v4 = shareUUID;
  if (!shareUUID)
  {
    objc_storeStrong((id *)p_shareUUID, self->_documentUUID);
    id v4 = self->_shareUUID;
  }
  return v4;
}

- (NSUUID)stableDocumentUUID
{
  stableDocumentUUID = self->_stableDocumentUUID;
  p_stableDocumentUUID = &self->_stableDocumentUUID;
  id v4 = stableDocumentUUID;
  if (!stableDocumentUUID)
  {
    objc_storeStrong((id *)p_stableDocumentUUID, self->_documentUUID);
    id v4 = self->_stableDocumentUUID;
  }
  return v4;
}

- (id)hashPrivateUUIDWithDigest:(id)a3
{
  id v4 = a3;
  if (!self->_privateUUID)
  {
    +[TSUAssertionHandler _atomicIncrementAssertCount];
    if (TSUAssertCat_init_token != -1) {
      dispatch_once(&TSUAssertCat_init_token, &stru_1001C7500);
    }
    if (os_log_type_enabled((os_log_t)TSUAssertCat_log_t, OS_LOG_TYPE_ERROR)) {
      sub_1001632F0();
    }
    id v5 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[TSPDocumentProperties hashPrivateUUIDWithDigest:]");
    id v6 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/iWorkXPC/shared/persistence/src/TSPDocumentProperties.mm"];
    +[TSUAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](TSUAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v5, v6, 435, 0, "invalid nil value for '%{public}s'", "_privateUUID");

    +[TSUAssertionHandler logBacktraceThrottled];
  }
  if (!v4)
  {
    +[TSUAssertionHandler _atomicIncrementAssertCount];
    if (TSUAssertCat_init_token != -1) {
      dispatch_once(&TSUAssertCat_init_token, &stru_1001C7520);
    }
    if (os_log_type_enabled((os_log_t)TSUAssertCat_log_t, OS_LOG_TYPE_ERROR)) {
      sub_100163254();
    }
    uint64_t v7 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[TSPDocumentProperties hashPrivateUUIDWithDigest:]");
    unsigned __int8 v8 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/iWorkXPC/shared/persistence/src/TSPDocumentProperties.mm"];
    +[TSUAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](TSUAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v7, v8, 436, 0, "invalid nil value for '%{public}s'", "digest");

    +[TSUAssertionHandler logBacktraceThrottled];
  }
  unsigned __int8 v9 = +[NSUUID tsu_UUIDWithNamespaceUUID:bytes:size:](NSUUID, "tsu_UUIDWithNamespaceUUID:bytes:size:", self->_privateUUID, [v4 digestData], 20);

  return v9;
}

- (void)setAdditionalProperties:(id)a3
{
  id v3 = a3;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  sub_1000309D0();
  id obj = (id)objc_claimAutoreleasedReturnValue();
  id v4 = [obj countByEnumeratingWithState:&v18 objects:v32 count:16];
  if (v4)
  {
    uint64_t v5 = *(void *)v19;
    do
    {
      id v6 = 0;
      do
      {
        if (*(void *)v19 != v5) {
          objc_enumerationMutation(obj);
        }
        uint64_t v7 = *(void *)(*((void *)&v18 + 1) + 8 * (void)v6);
        unsigned __int8 v8 = [v3 objectForKeyedSubscript:v7];
        BOOL v9 = v8 == 0;

        if (!v9)
        {
          unsigned int v10 = +[TSUAssertionHandler _atomicIncrementAssertCount];
          if (TSUAssertCat_init_token != -1) {
            dispatch_once(&TSUAssertCat_init_token, &stru_1001C7540);
          }
          char v11 = TSUAssertCat_log_t;
          if (os_log_type_enabled((os_log_t)TSUAssertCat_log_t, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 67110146;
            unsigned int v23 = v10;
            __int16 v24 = 2082;
            uint64_t v25 = "-[TSPDocumentProperties setAdditionalProperties:]";
            __int16 v26 = 2082;
            v27 = "/Library/Caches/com.apple.xbs/Sources/iWorkXPC/shared/persistence/src/TSPDocumentProperties.mm";
            __int16 v28 = 1024;
            int v29 = 445;
            __int16 v30 = 2114;
            uint64_t v31 = v7;
            _os_log_error_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_ERROR, "#Assert *** Assertion failure #%u: %{public}s %{public}s:%d Added property overwrites %{public}@", buf, 0x2Cu);
          }
          id v12 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[TSPDocumentProperties setAdditionalProperties:]");
          id v13 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/iWorkXPC/shared/persistence/src/TSPDocumentProperties.mm"];
          +[TSUAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](TSUAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v12, v13, 445, 0, "Added property overwrites %{public}@", v7);

          +[TSUAssertionHandler logBacktraceThrottled];
        }
        id v6 = (char *)v6 + 1;
      }
      while (v4 != v6);
      id v4 = [obj countByEnumeratingWithState:&v18 objects:v32 count:16];
    }
    while (v4);
  }

  objc_super v14 = (NSDictionary *)[v3 copy];
  additionalProperties = self->_additionalProperties;
  self->_additionalProperties = v14;
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5 = objc_alloc_init(TSPDocumentProperties);
  if (v5)
  {
    id v6 = (NSUUID *)[(NSUUID *)self->_documentUUID copyWithZone:a3];
    documentUUID = v5->_documentUUID;
    v5->_documentUUID = v6;

    unsigned __int8 v8 = (NSUUID *)[(NSUUID *)self->_versionUUID copyWithZone:a3];
    versionUUID = v5->_versionUUID;
    v5->_versionUUID = v8;

    unsigned int v10 = (NSUUID *)[(NSUUID *)self->_shareUUID copyWithZone:a3];
    shareUUID = v5->_shareUUID;
    v5->_shareUUID = v10;

    id v12 = (NSUUID *)[(NSUUID *)self->_stableDocumentUUID copyWithZone:a3];
    stableDocumentUUID = v5->_stableDocumentUUID;
    v5->_stableDocumentUUID = v12;

    objc_super v14 = (NSUUID *)[(NSUUID *)self->_privateUUID copyWithZone:a3];
    privateUUID = v5->_privateUUID;
    v5->_privateUUID = v14;

    v5->_fileFormatVersion = self->_fileFormatVersion;
    __int16 v16 = [(TSPDocumentRevision *)self->_revision copyWithZone:a3];
    revision = v5->_revision;
    v5->_revision = v16;

    long long v18 = (NSDictionary *)[(NSDictionary *)self->_additionalProperties copyWithZone:a3];
    additionalProperties = v5->_additionalProperties;
    v5->_additionalProperties = v18;
  }
  return v5;
}

- (id)description
{
  id v3 = (objc_class *)objc_opt_class();
  id v4 = NSStringFromClass(v3);
  uint64_t v5 = [(TSPDocumentProperties *)self documentUUID];
  id v6 = [(TSPDocumentProperties *)self versionUUID];
  uint64_t v7 = [(TSPDocumentProperties *)self shareUUID];
  unsigned __int8 v8 = [(TSPDocumentProperties *)self stableDocumentUUID];
  BOOL v9 = [(TSPDocumentProperties *)self revision];
  unsigned int v10 = +[NSString stringWithFormat:@"<%@ %p documentUUID:%@, versionUUID:%@, shareUUID:%@, stableDocumentUUID:%@, revision:%@>", v4, self, v5, v6, v7, v8, v9];

  return v10;
}

- (void)setDocumentUUID:(id)a3
{
}

- (unint64_t)fileFormatVersion
{
  return self->_fileFormatVersion;
}

- (void)setFileFormatVersion:(unint64_t)a3
{
  self->_fileFormatVersion = a3;
}

- (TSPDocumentRevision)revision
{
  return self->_revision;
}

- (void)setRevision:(id)a3
{
}

- (NSDictionary)additionalProperties
{
  return self->_additionalProperties;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_additionalProperties, 0);
  objc_storeStrong((id *)&self->_revision, 0);
  objc_storeStrong((id *)&self->_privateUUID, 0);
  objc_storeStrong((id *)&self->_stableDocumentUUID, 0);
  objc_storeStrong((id *)&self->_versionUUID, 0);
  objc_storeStrong((id *)&self->_documentUUID, 0);
  objc_storeStrong((id *)&self->_shareUUID, 0);
}

@end