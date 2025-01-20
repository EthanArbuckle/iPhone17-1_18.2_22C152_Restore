@interface UARPAccessoryInternal
+ (BOOL)supportsSecureCoding;
+ (id)encodedClasses;
- (BOOL)isEqual:(id)a3;
- (NSString)dropboxFirmwarePath;
- (NSString)dropboxReleaseNotesPath;
- (NSString)identifier;
- (NSString)supplementalAssetName;
- (UARPAccessoryID)accessoryID;
- (UARPAccessoryInternal)initWithAccessoryID:(id)a3 assetID:(id)a4;
- (UARPAccessoryInternal)initWithCoder:(id)a3;
- (UARPAssetID)assetID;
- (id)analyticsUpdateStateForAssetID:(id)a3;
- (id)asset;
- (id)copyWithZone:(_NSZone *)a3;
- (id)createUpdateFirmwareEvent;
- (id)description;
- (id)query;
- (id)record;
- (unint64_t)hash;
- (void)analyticsSendUpdateFirmwareEventForAssetID:(id)a3 frameworkParams:(id)a4;
- (void)analyticsSetDownloadAvailableForAssetID:(id)a3;
- (void)analyticsSetDownloadCompleteForAssetID:(id)a3 status:(int64_t)a4;
- (void)analyticsSetDownloadConsentReceivedForAssetID:(id)a3 userIntent:(BOOL)a4;
- (void)analyticsSetDownloadConsentRequestedForAssetID:(id)a3;
- (void)checkDropbox;
- (void)dealloc;
- (void)dumpWithTabDepth:(unint64_t)a3 dumpString:(id)a4;
- (void)encodeWithCoder:(id)a3;
- (void)removeUpdateState:(id)a3;
- (void)sendUpdateFirmwareEventForState:(id)a3;
- (void)setAccessoryID:(id)a3;
- (void)setAsset:(id)a3;
- (void)setAssetID:(id)a3;
- (void)setDropboxFirmwarePath:(id)a3;
- (void)setDropboxReleaseNotesPath:(id)a3;
- (void)setIdentifier:(id)a3;
- (void)setQuery:(id)a3;
- (void)setRecord:(id)a3;
- (void)setSupplementalAssetName:(id)a3;
@end

@implementation UARPAccessoryInternal

+ (BOOL)supportsSecureCoding
{
  return 1;
}

+ (id)encodedClasses
{
  id v2 = objc_alloc_init((Class)NSMutableArray);
  [v2 addObject:objc_opt_class()];
  [v2 addObject:objc_opt_class()];
  [v2 addObject:objc_opt_class()];
  [v2 addObject:objc_opt_class()];
  [v2 addObject:objc_opt_class()];
  [v2 addObject:objc_opt_class()];
  [v2 addObject:objc_opt_class()];
  [v2 addObject:objc_opt_class()];
  [v2 addObject:objc_opt_class()];
  uint64_t v10 = 0;
  v11 = &v10;
  uint64_t v12 = 0x3052000000;
  v13 = sub_100043F78;
  v14 = sub_100043F88;
  uint64_t v15 = qword_100096408;
  if (!qword_100096408)
  {
    v5 = _NSConcreteStackBlock;
    uint64_t v6 = 3221225472;
    v7 = sub_100043F94;
    v8 = &unk_10007DAD8;
    v9 = &v10;
    sub_100043F94((uint64_t)&v5);
  }
  _Block_object_dispose(&v10, 8);
  [v2 addObject:objc_opt_class()];
  uint64_t v10 = 0;
  v11 = &v10;
  uint64_t v12 = 0x3052000000;
  v13 = sub_100043F78;
  v14 = sub_100043F88;
  uint64_t v15 = qword_100096418;
  if (!qword_100096418)
  {
    v5 = _NSConcreteStackBlock;
    uint64_t v6 = 3221225472;
    v7 = sub_10004415C;
    v8 = &unk_10007DAD8;
    v9 = &v10;
    sub_10004415C((uint64_t)&v5);
  }
  _Block_object_dispose(&v10, 8);
  [v2 addObject:objc_opt_class()];
  v3 = +[NSSet setWithArray:v2];

  return v3;
}

- (UARPAccessoryInternal)initWithAccessoryID:(id)a3 assetID:(id)a4
{
  v11.receiver = self;
  v11.super_class = (Class)UARPAccessoryInternal;
  uint64_t v6 = [(UARPAccessoryInternal *)&v11 init];
  if (v6)
  {
    v6->_accessoryID = (UARPAccessoryID *)[a3 copy];
    v6->_assetID = (UARPAssetID *)a4;
    if ([(UARPAccessoryID *)v6->_accessoryID productGroup]
      && [(UARPAccessoryID *)v6->_accessoryID productNumber])
    {
      v7 = (NSString *)[objc_alloc((Class)NSString) initWithFormat:@"%@-%@", -[UARPAccessoryID productGroup](v6->_accessoryID, "productGroup"), -[UARPAccessoryID productNumber](v6->_accessoryID, "productNumber")];
    }
    else
    {
      if (![(UARPAccessoryID *)v6->_accessoryID modelNumber])
      {
LABEL_9:
        v6->_analyticsUpdateStates = (NSMutableArray *)objc_alloc_init((Class)NSMutableArray);
        v6->_analyticsLog = (OS_os_log *)os_log_create("com.apple.accessoryupdater.uarp", "analytics");
        v6->_assetManagerLog = (OS_os_log *)os_log_create("com.apple.accessoryupdater.uarp", "assetManager");
        return v6;
      }
      v8 = (NSString *)objc_msgSend(-[UARPAccessoryID modelNumber](v6->_accessoryID, "modelNumber"), "copy");
      v6->_identifier = v8;
      id v9 = +[UARPSupportedAccessory findByAppleModelNumber:v8];
      if (!v9) {
        return 0;
      }
      v7 = (NSString *)objc_msgSend(objc_msgSend(v9, "mobileAssetAppleModelNumber"), "copy");
    }
    v6->_identifier = v7;
    goto LABEL_9;
  }
  return v6;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)UARPAccessoryInternal;
  [(UARPAccessoryInternal *)&v3 dealloc];
}

- (void)analyticsSetDownloadAvailableForAssetID:(id)a3
{
  analyticsLog = self->_analyticsLog;
  if (os_log_type_enabled(analyticsLog, OS_LOG_TYPE_INFO))
  {
    int v7 = 136315394;
    v8 = "-[UARPAccessoryInternal analyticsSetDownloadAvailableForAssetID:]";
    __int16 v9 = 2112;
    id v10 = a3;
    _os_log_impl((void *)&_mh_execute_header, analyticsLog, OS_LOG_TYPE_INFO, "%s: %@", (uint8_t *)&v7, 0x16u);
  }
  uint64_t v6 = [(UARPAccessoryInternal *)self analyticsUpdateStateForAssetID:a3];
  if (!v6)
  {
    uint64_t v6 = [[UARPAnalyticsAUDUpdateFirmwareState alloc] initWithAccessoryID:self->_accessoryID assetID:self->_assetID];
    [(NSMutableArray *)self->_analyticsUpdateStates addObject:v6];
  }
  [(UARPAnalyticsAUDUpdateFirmwareState *)v6 setAssetAvailableForDownload];
}

- (void)analyticsSetDownloadConsentRequestedForAssetID:(id)a3
{
  analyticsLog = self->_analyticsLog;
  if (os_log_type_enabled(analyticsLog, OS_LOG_TYPE_INFO))
  {
    int v7 = 136315394;
    v8 = "-[UARPAccessoryInternal analyticsSetDownloadConsentRequestedForAssetID:]";
    __int16 v9 = 2112;
    id v10 = a3;
    _os_log_impl((void *)&_mh_execute_header, analyticsLog, OS_LOG_TYPE_INFO, "%s: %@", (uint8_t *)&v7, 0x16u);
  }
  id v6 = [(UARPAccessoryInternal *)self analyticsUpdateStateForAssetID:a3];
  if (v6)
  {
    [v6 setDownloadConsentRequested];
  }
  else if (os_log_type_enabled((os_log_t)self->_analyticsLog, OS_LOG_TYPE_ERROR))
  {
    sub_100052FDC();
  }
}

- (void)analyticsSetDownloadConsentReceivedForAssetID:(id)a3 userIntent:(BOOL)a4
{
  BOOL v4 = a4;
  analyticsLog = self->_analyticsLog;
  if (os_log_type_enabled(analyticsLog, OS_LOG_TYPE_INFO))
  {
    v8 = "NO";
    *(void *)&v10[4] = "-[UARPAccessoryInternal analyticsSetDownloadConsentReceivedForAssetID:userIntent:]";
    *(_DWORD *)id v10 = 136315650;
    if (v4) {
      v8 = "YES";
    }
    *(_WORD *)&v10[12] = 2112;
    *(void *)&v10[14] = a3;
    __int16 v11 = 2080;
    uint64_t v12 = v8;
    _os_log_impl((void *)&_mh_execute_header, analyticsLog, OS_LOG_TYPE_INFO, "%s: %@ userIntent=%s", v10, 0x20u);
  }
  id v9 = -[UARPAccessoryInternal analyticsUpdateStateForAssetID:](self, "analyticsUpdateStateForAssetID:", a3, *(_OWORD *)v10);
  if (v9)
  {
    [v9 setDownloadConsentReceived:v4];
  }
  else if (os_log_type_enabled((os_log_t)self->_analyticsLog, OS_LOG_TYPE_ERROR))
  {
    sub_100053060();
  }
}

- (void)analyticsSetDownloadCompleteForAssetID:(id)a3 status:(int64_t)a4
{
  analyticsLog = self->_analyticsLog;
  if (os_log_type_enabled(analyticsLog, OS_LOG_TYPE_INFO))
  {
    int v10 = 136315650;
    __int16 v11 = "-[UARPAccessoryInternal analyticsSetDownloadCompleteForAssetID:status:]";
    __int16 v12 = 2112;
    id v13 = a3;
    __int16 v14 = 2080;
    uint64_t v15 = sub_10001813C(a4);
    _os_log_impl((void *)&_mh_execute_header, analyticsLog, OS_LOG_TYPE_INFO, "%s: %@ status=%s", (uint8_t *)&v10, 0x20u);
  }
  id v8 = [(UARPAccessoryInternal *)self analyticsUpdateStateForAssetID:a3];
  if (v8)
  {
    id v9 = v8;
    [v8 setDownloadComplete:a4];
    if ((unint64_t)(a4 - 3) <= 0xFFFFFFFFFFFFFFFDLL)
    {
      [(UARPAccessoryInternal *)self sendUpdateFirmwareEventForState:v9];
      [(UARPAccessoryInternal *)self removeUpdateState:v9];
    }
  }
  else if (os_log_type_enabled((os_log_t)self->_analyticsLog, OS_LOG_TYPE_ERROR))
  {
    sub_1000530E4();
  }
}

- (void)analyticsSendUpdateFirmwareEventForAssetID:(id)a3 frameworkParams:(id)a4
{
  analyticsLog = self->_analyticsLog;
  if (os_log_type_enabled(analyticsLog, OS_LOG_TYPE_INFO))
  {
    int v11 = 136315394;
    __int16 v12 = "-[UARPAccessoryInternal analyticsSendUpdateFirmwareEventForAssetID:frameworkParams:]";
    __int16 v13 = 2112;
    id v14 = a3;
    _os_log_impl((void *)&_mh_execute_header, analyticsLog, OS_LOG_TYPE_INFO, "%s: %@", (uint8_t *)&v11, 0x16u);
  }
  id v8 = [(UARPAccessoryInternal *)self analyticsUpdateStateForAssetID:a3];
  if (v8)
  {
    id v9 = v8;
    id v10 = [(UARPAccessoryInternal *)self createUpdateFirmwareEvent];
    objc_msgSend(v10, "setDownloadConsentDuration:", +[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v9, "downloadConsentDuration")));
    objc_msgSend(v10, "setDownloadUserInitiated:", +[NSNumber numberWithBool:](NSNumber, "numberWithBool:", objc_msgSend(v9, "downloadUserIntent")));
    objc_msgSend(v10, "setDownloadStatus:", objc_msgSend(v9, "downloadStatus"));
    [v10 updateWithFrameworkParams:a4];
    [v10 send];

    [(UARPAccessoryInternal *)self removeUpdateState:v9];
  }
  else if (os_log_type_enabled((os_log_t)self->_analyticsLog, OS_LOG_TYPE_ERROR))
  {
    sub_100053168();
  }
}

- (id)analyticsUpdateStateForAssetID:(id)a3
{
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  analyticsUpdateStates = self->_analyticsUpdateStates;
  id v5 = [(NSMutableArray *)analyticsUpdateStates countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (!v5) {
    return 0;
  }
  id v6 = v5;
  uint64_t v7 = *(void *)v13;
LABEL_3:
  uint64_t v8 = 0;
  while (1)
  {
    if (*(void *)v13 != v7) {
      objc_enumerationMutation(analyticsUpdateStates);
    }
    id v9 = *(void **)(*((void *)&v12 + 1) + 8 * v8);
    id v10 = objc_msgSend(objc_msgSend(v9, "assetID"), "type");
    if (v10 == [a3 type]
      && objc_msgSend(objc_msgSend(objc_msgSend(v9, "assetID"), "remoteURL"), "isEqual:", objc_msgSend(a3, "remoteURL"))&& (objc_msgSend(objc_msgSend(objc_msgSend(v9, "assetID"), "assetVersion"), "isEqual:", objc_msgSend(a3, "assetVersion")) & 1) != 0)
    {
      return v9;
    }
    if (v6 == (id)++v8)
    {
      id v6 = [(NSMutableArray *)analyticsUpdateStates countByEnumeratingWithState:&v12 objects:v16 count:16];
      if (v6) {
        goto LABEL_3;
      }
      return 0;
    }
  }
}

- (void)sendUpdateFirmwareEventForState:(id)a3
{
  id v4 = [(UARPAccessoryInternal *)self createUpdateFirmwareEvent];
  objc_msgSend(v4, "setDownloadConsentDuration:", +[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", objc_msgSend(a3, "downloadConsentDuration")));
  objc_msgSend(v4, "setDownloadUserInitiated:", +[NSNumber numberWithBool:](NSNumber, "numberWithBool:", objc_msgSend(a3, "downloadUserIntent")));
  objc_msgSend(v4, "setDownloadStatus:", objc_msgSend(a3, "downloadStatus"));
  [v4 send];
}

- (id)createUpdateFirmwareEvent
{
  objc_super v3 = objc_alloc_init(UARPUpdateFirmwareAnalyticsEvent);
  [(UARPUpdateFirmwareAnalyticsEvent *)v3 updateWithAccessoryID:self->_accessoryID assetID:self->_assetID];
  return v3;
}

- (void)removeUpdateState:(id)a3
{
  analyticsLog = self->_analyticsLog;
  if (os_log_type_enabled(analyticsLog, OS_LOG_TYPE_INFO))
  {
    int v6 = 138412290;
    id v7 = a3;
    _os_log_impl((void *)&_mh_execute_header, analyticsLog, OS_LOG_TYPE_INFO, "%@ tracking complete", (uint8_t *)&v6, 0xCu);
  }
  [(NSMutableArray *)self->_analyticsUpdateStates removeObject:a3];
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = [[UARPAccessoryInternal alloc] initWithAccessoryID:self->_accessoryID assetID:self->_assetID];
  v4->_record = [self->_record copy];
  return v4;
}

- (void)encodeWithCoder:(id)a3
{
  [a3 encodeObject:self->_identifier forKey:@"identifier"];
  [a3 encodeObject:self->_accessoryID forKey:@"accessoryID"];
  [a3 encodeObject:self->_assetID forKey:@"assetID"];
  [a3 encodeObject:self->_dropboxFirmwarePath forKey:@"dropboxFirmwarePath"];
  [a3 encodeObject:self->_dropboxReleaseNotesPath forKey:@"dropboxReleaseNotesPath"];
  analyticsUpdateStates = self->_analyticsUpdateStates;
  [a3 encodeObject:analyticsUpdateStates forKey:@"analyticsUpdateStates"];
}

- (UARPAccessoryInternal)initWithCoder:(id)a3
{
  id v5 = [a3 decodeObjectOfClass:objc_opt_class() forKey:@"accessoryID"];
  int v6 = -[UARPAccessoryInternal initWithAccessoryID:assetID:](self, "initWithAccessoryID:assetID:", v5, [a3 decodeObjectOfClass:objc_opt_class() forKey:@"assetID"]);
  if (v6)
  {
    v6->_identifier = (NSString *)[a3 decodeObjectForKey:@"identifier"];
    v6->_dropboxFirmwarePath = (NSString *)[a3 decodeObjectForKey:@"dropboxFirmwarePath"];
    v6->_dropboxReleaseNotesPath = (NSString *)[a3 decodeObjectForKey:@"dropboxReleaseNotesPath"];
    uint64_t v11 = objc_opt_class();
    uint64_t v12 = objc_opt_class();
    uint64_t v13 = objc_opt_class();
    uint64_t v14 = objc_opt_class();
    uint64_t v15 = objc_opt_class();
    id v7 = +[NSArray arrayWithObjects:&v11 count:5];
    uint64_t v8 = +[NSSet setWithArray:](NSSet, "setWithArray:", v7, v11, v12, v13, v14);
    analyticsUpdateStates = v6->_analyticsUpdateStates;
    if (analyticsUpdateStates)
    {

      v6->_analyticsUpdateStates = 0;
    }
    v6->_analyticsUpdateStates = (NSMutableArray *)objc_msgSend(objc_msgSend(a3, "decodeObjectOfClasses:forKey:", v8, @"analyticsUpdateStates"), "mutableCopy");
  }
  return v6;
}

- (unint64_t)hash
{
  id v2 = [(UARPAccessoryInternal *)self identifier];
  return [(NSString *)v2 hash];
}

- (BOOL)isEqual:(id)a3
{
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    if (self == a3)
    {
      LOBYTE(v5) = 1;
    }
    else
    {
      unsigned int v5 = sub_10002A724(-[UARPAccessoryInternal identifier](self, "identifier"), (uint64_t)[a3 identifier]);
      if (v5)
      {
        unsigned int v5 = sub_10002A724(-[UARPAccessoryInternal accessoryID](self, "accessoryID"), (uint64_t)[a3 accessoryID]);
        if (v5)
        {
          unsigned int v5 = sub_10002A724(-[UARPAccessoryInternal assetID](self, "assetID"), (uint64_t)[a3 assetID]);
          if (v5)
          {
            unsigned int v5 = sub_10002A724(-[UARPAccessoryInternal dropboxFirmwarePath](self, "dropboxFirmwarePath"), (uint64_t)[a3 dropboxFirmwarePath]);
            if (v5)
            {
              int v6 = [(UARPAccessoryInternal *)self dropboxReleaseNotesPath];
              id v7 = [a3 dropboxReleaseNotesPath];
              LOBYTE(v5) = sub_10002A724(v6, (uint64_t)v7);
            }
          }
        }
      }
    }
  }
  else
  {
    LOBYTE(v5) = 0;
  }
  return v5;
}

- (void)checkDropbox
{
  assetManagerLog = self->_assetManagerLog;
  if (os_log_type_enabled(assetManagerLog, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315138;
    uint64_t v11 = "-[UARPAccessoryInternal checkDropbox]";
    _os_log_impl((void *)&_mh_execute_header, assetManagerLog, OS_LOG_TYPE_INFO, "%s:", buf, 0xCu);
  }
  identifier = self->_identifier;
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_100043C28;
  v9[3] = &unk_10007DE70;
  v9[4] = self;
  sub_100042148((uint64_t)identifier, (uint64_t)v9);
  dropboxFirmwarePath = self->_dropboxFirmwarePath;
  if (dropboxFirmwarePath)
  {
    int v6 = self->_assetManagerLog;
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      dropboxReleaseNotesPath = self->_dropboxReleaseNotesPath;
      uint64_t v8 = self->_identifier;
      *(_DWORD *)buf = 138412802;
      uint64_t v11 = (const char *)dropboxFirmwarePath;
      __int16 v12 = 2112;
      uint64_t v13 = dropboxReleaseNotesPath;
      __int16 v14 = 2112;
      uint64_t v15 = v8;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "Found superbinary %@, release notes %@ in dropbox for %@", buf, 0x20u);
    }
  }
}

- (void)dumpWithTabDepth:(unint64_t)a3 dumpString:(id)a4
{
  [a4 appendWithTabDepth:a3, @"%@\n", self->_accessoryID format];
  unint64_t v7 = a3 + 1;
  if (self->_identifier) {
    [a4 appendWithTabDepth:a3 + 1, @"Identifier: %@\n", self->_identifier format];
  }
  [(UARPAssetID *)self->_assetID dumpWithTabDepth:a3 + 1 dumpString:a4];
  if (self->_dropboxFirmwarePath) {
    [a4 appendWithTabDepth:a3 + 1, @"Dropbox Firmware Path: %@\n", self->_dropboxFirmwarePath format];
  }
  objc_msgSend(a4, "appendWithTabDepth:format:", a3 + 1, @"Remote Check Status: %s\n", -[UARPAccessoryInternal remoteCheckStatusString](self, "remoteCheckStatusString"));
  if (self->_dropboxReleaseNotesPath) {
    [a4 appendWithTabDepth:a3 + 1, @"Dropbox Release Notes Path: %@\n", self->_dropboxReleaseNotesPath format];
  }
  if ([(NSMutableArray *)self->_analyticsUpdateStates count])
  {
    [a4 appendWithTabDepth:a3 + 1 format:@"Analytics Firmware Update States:\n"];
    long long v16 = 0u;
    long long v17 = 0u;
    long long v14 = 0u;
    long long v15 = 0u;
    analyticsUpdateStates = self->_analyticsUpdateStates;
    id v9 = [(NSMutableArray *)analyticsUpdateStates countByEnumeratingWithState:&v14 objects:v18 count:16];
    if (v9)
    {
      id v10 = v9;
      uint64_t v11 = *(void *)v15;
      unint64_t v12 = a3 + 2;
      do
      {
        for (i = 0; i != v10; i = (char *)i + 1)
        {
          if (*(void *)v15 != v11) {
            objc_enumerationMutation(analyticsUpdateStates);
          }
          [*(id *)(*((void *)&v14 + 1) + 8 * i) dumpWithTabDepth:v12 dumpString:a4];
        }
        id v10 = [(NSMutableArray *)analyticsUpdateStates countByEnumeratingWithState:&v14 objects:v18 count:16];
      }
      while (v10);
    }
  }
  if (objc_opt_respondsToSelector()) {
    [self->_record dumpWithTabDepth:v7 dumpString:a4];
  }
}

- (id)description
{
  objc_super v3 = (objc_class *)objc_opt_class();
  return +[NSString stringWithFormat:@"<%@: accessoryID=%@, assetID=%@, record=%@>", NSStringFromClass(v3), self->_accessoryID, self->_assetID, self->_record];
}

- (NSString)identifier
{
  return (NSString *)objc_getProperty(self, a2, 32, 1);
}

- (void)setIdentifier:(id)a3
{
}

- (UARPAccessoryID)accessoryID
{
  return (UARPAccessoryID *)objc_getProperty(self, a2, 40, 1);
}

- (void)setAccessoryID:(id)a3
{
}

- (UARPAssetID)assetID
{
  return (UARPAssetID *)objc_getProperty(self, a2, 48, 1);
}

- (void)setAssetID:(id)a3
{
}

- (NSString)supplementalAssetName
{
  return (NSString *)objc_getProperty(self, a2, 56, 1);
}

- (void)setSupplementalAssetName:(id)a3
{
}

- (NSString)dropboxFirmwarePath
{
  return (NSString *)objc_getProperty(self, a2, 64, 1);
}

- (void)setDropboxFirmwarePath:(id)a3
{
}

- (NSString)dropboxReleaseNotesPath
{
  return (NSString *)objc_getProperty(self, a2, 72, 1);
}

- (void)setDropboxReleaseNotesPath:(id)a3
{
}

- (id)asset
{
  return objc_getProperty(self, a2, 80, 1);
}

- (void)setAsset:(id)a3
{
}

- (id)query
{
  return objc_getProperty(self, a2, 88, 1);
}

- (void)setQuery:(id)a3
{
}

- (id)record
{
  return objc_getProperty(self, a2, 96, 1);
}

- (void)setRecord:(id)a3
{
}

@end