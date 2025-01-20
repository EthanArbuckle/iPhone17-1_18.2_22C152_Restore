@interface NRTermsEvent
+ (BOOL)supportsSecureCoding;
+ (id)digestFromData:(id)a3;
+ (id)eventWithProtobuf:(id)a3;
+ (id)loadTermsWithPath:(id)a3;
+ (id)pathToTermsCache;
+ (id)pathToTermsWithDigest:(uint64_t)a1;
+ (uint64_t)shouldAllowArchivingOfTermsTextToFile;
- (BOOL)flaggedForSend;
- (BOOL)isTermsAlreadyArchived;
- (BOOL)writable;
- (NRTermsEvent)initWithCoder:(id)a3;
- (NRTermsEvent)initWithDeviceID:(id)a3;
- (NSString)termsDigest;
- (id)description;
- (id)termsText;
- (void)_setEventType:(unint64_t)a3;
- (void)_setLoggingProcessName:(id)a3;
- (void)encodeWithCoder:(id)a3;
- (void)saveEventTextToFileIfNeeded;
- (void)saveTerms;
- (void)setAcknowledgedDeviceName:(id)a3;
- (void)setAcknowledgedDeviceSerialNumber:(id)a3;
- (void)setDisplayDeviceName:(id)a3;
- (void)setDisplayDeviceSerialNumber:(id)a3;
- (void)setDocumentationID:(id)a3;
- (void)setEventDate:(double)a3;
- (void)setEventType:(int)a3;
- (void)setFlaggedForSend:(BOOL)a3;
- (void)setLoggingProcessName:(id)a3;
- (void)setPresentationLocation:(int)a3;
- (void)setPresentationReason:(id)a3;
- (void)setTermsDigest:(id)a3;
- (void)setTermsText:(id)a3;
- (void)setWritable:(BOOL)a3;
- (void)updateEventDate;
@end

@implementation NRTermsEvent

+ (BOOL)supportsSecureCoding
{
  return 1;
}

+ (id)pathToTermsCache
{
  self;
  v0 = (void *)MEMORY[0x1E4F1CB10];
  v1 = +[NRDataFilePaths pathToNanoRegistryStateDirectory];
  v2 = [v0 fileURLWithPath:v1];

  v3 = [v2 URLByAppendingPathComponent:@"termsCache"];

  return v3;
}

+ (id)pathToTermsWithDigest:(uint64_t)a1
{
  id v2 = a2;
  self;
  v3 = [MEMORY[0x1E4F28B88] alphanumericCharacterSet];
  v4 = (void *)[v3 mutableCopy];

  [v4 addCharactersInString:@"%."];
  v5 = [v2 stringByAppendingString:@".termsText"];

  v6 = +[NRTermsEvent pathToTermsCache]();
  v7 = [v6 URLByAppendingPathComponent:v5];

  return v7;
}

- (id)description
{
  v3 = NSString;
  v4 = (void *)MEMORY[0x1E4F28C10];
  v5 = [MEMORY[0x1E4F1C9C8] dateWithTimeIntervalSinceReferenceDate:self->super._eventDate];
  v6 = [v4 localizedStringFromDate:v5 dateStyle:1 timeStyle:1];
  uint64_t eventType = self->super._eventType;
  self;
  if ((unint64_t)(eventType - 1) > 4) {
    v8 = @"Not Set";
  }
  else {
    v8 = off_1E5B00110[eventType - 1];
  }
  v9 = [(NRTermsEvent *)self termsText];
  v10 = +[NRTermsEvent digestFromData:v9];
  v11 = [v3 stringWithFormat:@"NRTermsEvent[%@] \"%@\": digest(%@) docID(%@) process(%@) displayDeviceName(%@) acknowlegedDeviceName(%@) presentationReason(%@)", v6, v8, v10, self->super._documentationID, self->super._loggingProcessName, self->super._displayDeviceName, self->super._acknowledgedDeviceName, self->super._presentationReason];

  return v11;
}

+ (id)digestFromData:(id)a3
{
  v3 = [a3 NRSHA256];
  v4 = [v3 base64EncodedStringWithOptions:0];
  v5 = [MEMORY[0x1E4F28B88] alphanumericCharacterSet];
  v6 = [v4 stringByAddingPercentEncodingWithAllowedCharacters:v5];

  return v6;
}

- (BOOL)isTermsAlreadyArchived
{
  id v2 = *(void **)&self->_flaggedForSend;
  if (!v2) {
    return 0;
  }
  v3 = +[NRTermsEvent pathToTermsWithDigest:]((uint64_t)NRTermsEvent, v2);
  v4 = [MEMORY[0x1E4F28CB8] defaultManager];
  v5 = [v3 path];
  char v6 = [v4 fileExistsAtPath:v5];

  return v6;
}

- (id)termsText
{
  termsText = self->super._termsText;
  if (!termsText)
  {
    if (+[NRTermsEvent shouldAllowArchivingOfTermsTextToFile]())
    {
      v4 = +[NRTermsEvent pathToTermsWithDigest:]((uint64_t)NRTermsEvent, *(void **)&self->_flaggedForSend);
      v5 = [(id)objc_opt_class() loadTermsWithPath:v4];

      goto LABEL_6;
    }
    termsText = self->super._termsText;
  }
  v5 = termsText;
LABEL_6:

  return v5;
}

+ (uint64_t)shouldAllowArchivingOfTermsTextToFile
{
  self;
  uint64_t v0 = getpid();
  id v2 = NRProcessNameForPID(v0, v1);
  if ([@"nanoregistryd" isEqualToString:v2]) {
    uint64_t v3 = 1;
  }
  else {
    uint64_t v3 = [@"pairtool" isEqualToString:v2];
  }

  return v3;
}

- (void)saveTerms
{
  v18[1] = *MEMORY[0x1E4F143B8];
  if ([(NRTermsEvent *)self isTermsAlreadyArchived]) {
    return;
  }
  uint64_t v17 = *MEMORY[0x1E4F28370];
  v18[0] = *MEMORY[0x1E4F28378];
  uint64_t v3 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v18 forKeys:&v17 count:1];
  v4 = [MEMORY[0x1E4F28CB8] defaultManager];
  v5 = +[NRTermsEvent pathToTermsCache]();
  id v16 = 0;
  [v4 createDirectoryAtURL:v5 withIntermediateDirectories:1 attributes:v3 error:&v16];
  id v6 = v16;

  if (v6)
  {
    id v11 = v6;
    goto LABEL_10;
  }
  v7 = [(NRTermsEvent *)self termsText];
  if (v7)
  {
    uint64_t v8 = [(id)objc_opt_class() digestFromData:v7];
    v9 = *(void **)&self->_flaggedForSend;
    *(void *)&self->_flaggedForSend = v8;
  }
  v10 = +[NRTermsEvent pathToTermsWithDigest:]((uint64_t)NRTermsEvent, *(void **)&self->_flaggedForSend);
  id v15 = 0;
  [v7 writeToURL:v10 options:1073741825 error:&v15];
  id v11 = v15;
  if (v11) {
LABEL_10:
  }
    objc_exception_throw(v11);
  v12 = [v10 path];
  char v13 = [v7 matchesDataAtFilePath:v12];

  if ((v13 & 1) == 0)
  {
    id v14 = +[NRTermsAcknowledgementRegistry errorWithEnum:2];
    objc_exception_throw(v14);
  }
}

+ (id)loadTermsWithPath:(id)a3
{
  id v3 = a3;
  id v8 = 0;
  v4 = [MEMORY[0x1E4F1C9B8] dataWithContentsOfURL:v3 options:0 error:&v8];
  id v5 = v8;
  if (v4) {
    BOOL v6 = v5 == 0;
  }
  else {
    BOOL v6 = 0;
  }
  if (!v6) {
    objc_exception_throw(v5);
  }

  return v4;
}

- (NRTermsEvent)initWithCoder:(id)a3
{
  id v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)NRTermsEvent;
  id v5 = [(NRTermsEvent *)&v12 initWithCoder:v4];
  BOOL v6 = v5;
  if (v5)
  {
    if (!v5->super._termsText && +[NRTermsEvent shouldAllowArchivingOfTermsTextToFile]())
    {
      uint64_t v7 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"termsDigest"];
      id v8 = *(void **)&v6->_flaggedForSend;
      *(void *)&v6->_flaggedForSend = v7;
    }
    if ((+[NRTermsEvent shouldAllowArchivingOfTermsTextToFile]() & 1) == 0)
    {
      v9 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"termsDigest"];

      if (v9)
      {
        id v11 = +[NRTermsAcknowledgementRegistry errorWithEnum:4];
        objc_exception_throw(v11);
      }
    }
  }

  return v6;
}

+ (id)eventWithProtobuf:(id)a3
{
  id v3 = a3;
  id v4 = objc_opt_new();
  [v4 setWritable:1];
  [v4 mergeFrom:v3];

  if ([v4 hasTermsText])
  {
    id v5 = [v4 termsText];
    BOOL v6 = +[NRTermsEvent digestFromData:v5];
    [v4 setTermsDigest:v6];
  }
  [v4 setWritable:0];

  return v4;
}

- (void)saveEventTextToFileIfNeeded
{
  if (![(NRTermsEvent *)self isTermsAlreadyArchived])
  {
    uint64_t v3 = [(NRTermsEvent *)self termsText];
    if (!v3 || self->super._eventDate == 0.0)
    {
      id v5 = +[NRTermsAcknowledgementRegistry errorWithEnum:3];
      objc_exception_throw(v5);
    }
    uint64_t v4 = v3;
    if (*(void *)&self->_flaggedForSend)
    {
      uint64_t v6 = v3;
      uint64_t v3 = +[NRTermsEvent shouldAllowArchivingOfTermsTextToFile]();
      uint64_t v4 = v6;
      if (v3)
      {
        uint64_t v3 = [(NRTermsEvent *)self saveTerms];
        uint64_t v4 = v6;
      }
    }
    MEMORY[0x1F41817F8](v3, v4);
  }
}

- (NRTermsEvent)initWithDeviceID:(id)a3
{
  uint64_t v52 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = [(NRTermsEvent *)self init];
  uint64_t v6 = v5;
  if (v5)
  {
    *((unsigned char *)&v5->super._has + 5) = 1;
    uint64_t v7 = +[NRPairedDeviceRegistry sharedInstance];
    id v8 = [v7 getAllDevicesWithArchivedAltAccountDevicesMatching:&__block_literal_global];

    long long v41 = 0u;
    long long v42 = 0u;
    long long v39 = 0u;
    long long v40 = 0u;
    id v9 = v8;
    uint64_t v10 = [v9 countByEnumeratingWithState:&v39 objects:v51 count:16];
    if (v10)
    {
      uint64_t v11 = v10;
      uint64_t v12 = *(void *)v40;
      while (2)
      {
        for (uint64_t i = 0; i != v11; ++i)
        {
          if (*(void *)v40 != v12) {
            objc_enumerationMutation(v9);
          }
          id v14 = *(void **)(*((void *)&v39 + 1) + 8 * i);
          id v15 = [v14 valueForProperty:@"pairingID"];
          int v16 = [v15 isEqual:v4];

          if (v16)
          {
            id v17 = v14;
            goto LABEL_12;
          }
        }
        uint64_t v11 = [v9 countByEnumeratingWithState:&v39 objects:v51 count:16];
        if (v11) {
          continue;
        }
        break;
      }
    }
    id v17 = 0;
LABEL_12:

    uint64_t v18 = [v17 valueForProperty:@"localizedModel"];
    acknowledgedDeviceName = v6->super._acknowledgedDeviceName;
    v6->super._acknowledgedDeviceName = (NSString *)v18;

    uint64_t v20 = [v17 valueForProperty:@"serialNumber"];
    acknowledgedDeviceSerialNumber = v6->super._acknowledgedDeviceSerialNumber;
    v6->super._acknowledgedDeviceSerialNumber = (NSString *)v20;

    uint64_t v22 = MGCopyAnswer();
    displayDeviceName = v6->super._displayDeviceName;
    v6->super._displayDeviceName = (NSString *)v22;

    uint64_t v24 = MGCopyAnswer();
    displayDeviceSerialNumber = v6->super._displayDeviceSerialNumber;
    v6->super._displayDeviceSerialNumber = (NSString *)v24;

    [MEMORY[0x1E4F1C9C8] timeIntervalSinceReferenceDate];
    v38.receiver = v6;
    v38.super_class = (Class)NRTermsEvent;
    -[NRPBTermsEvent setEventDate:](&v38, sel_setEventDate_);
    uint64_t v26 = getpid();
    uint64_t v28 = NRProcessNameForPID(v26, v27);
    loggingProcessName = v6->super._loggingProcessName;
    v6->super._loggingProcessName = (NSString *)v28;

    if (v4
      && (!v6->super._acknowledgedDeviceName
       || !v6->super._acknowledgedDeviceSerialNumber
       || !v6->super._displayDeviceName
       || !v6->super._displayDeviceSerialNumber))
    {
      v30 = nr_daemon_log();
      BOOL v31 = os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT);

      if (v31)
      {
        v32 = nr_daemon_log();
        if (os_log_type_enabled(v32, OS_LOG_TYPE_DEFAULT))
        {
          v33 = v6->super._acknowledgedDeviceName;
          v34 = v6->super._acknowledgedDeviceSerialNumber;
          v35 = v6->super._displayDeviceName;
          v36 = v6->super._displayDeviceSerialNumber;
          *(_DWORD *)buf = 138413058;
          v44 = v33;
          __int16 v45 = 2112;
          v46 = v34;
          __int16 v47 = 2112;
          v48 = v35;
          __int16 v49 = 2112;
          v50 = v36;
          _os_log_impl(&dword_1A356E000, v32, OS_LOG_TYPE_DEFAULT, "_acknowledgedDeviceName: %@ _acknowledgedDeviceSerialNumber: %@ _displayDeviceName:%@ _displayDeviceSerialNumber:%@", buf, 0x2Au);
        }
      }
    }
  }
  return v6;
}

uint64_t __33__NRTermsEvent_initWithDeviceID___block_invoke()
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (!self->super._acknowledgedDeviceName
    || !self->super._acknowledgedDeviceSerialNumber
    || !self->super._displayDeviceName
    || !self->super._displayDeviceSerialNumber)
  {
    id v5 = nr_framework_log();
    BOOL v6 = os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT);

    if (v6)
    {
      uint64_t v7 = nr_framework_log();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
      {
        id v8 = +[NRTermsAcknowledgementRegistry errorWithEnum:3];
        *(_DWORD *)buf = 138412290;
        uint64_t v12 = v8;
        _os_log_impl(&dword_1A356E000, v7, OS_LOG_TYPE_DEFAULT, "Terms saved with missing device info.  This is not fatal: %@", buf, 0xCu);
      }
    }
  }
  uint64_t v9 = *(void *)&self->_flaggedForSend;
  if (v9) {
    [v4 encodeObject:v9 forKey:@"termsDigest"];
  }
  v10.receiver = self;
  v10.super_class = (Class)NRTermsEvent;
  [(NRTermsEvent *)&v10 encodeWithCoder:v4];
}

- (void)setEventType:(int)a3
{
  if (!*((unsigned char *)&self->super._has + 5))
  {
    id v3 = +[NRTermsAcknowledgementRegistry errorWithEnum:5];
    objc_exception_throw(v3);
  }
  v4.receiver = self;
  v4.super_class = (Class)NRTermsEvent;
  [(NRPBTermsEvent *)&v4 setEventType:*(void *)&a3];
}

- (void)_setEventType:(unint64_t)a3
{
  v3.receiver = self;
  v3.super_class = (Class)NRTermsEvent;
  [(NRPBTermsEvent *)&v3 setEventType:a3];
}

- (void)setTermsText:(id)a3
{
  id v4 = a3;
  if (!*((unsigned char *)&self->super._has + 5))
  {
    id v6 = +[NRTermsAcknowledgementRegistry errorWithEnum:5];
    objc_exception_throw(v6);
  }
  id v5 = v4;
  v7.receiver = self;
  v7.super_class = (Class)NRTermsEvent;
  [(NRPBTermsEvent *)&v7 setTermsText:v4];
}

- (void)setDocumentationID:(id)a3
{
  id v4 = a3;
  if (!*((unsigned char *)&self->super._has + 5))
  {
    id v6 = +[NRTermsAcknowledgementRegistry errorWithEnum:5];
    objc_exception_throw(v6);
  }
  id v5 = v4;
  v7.receiver = self;
  v7.super_class = (Class)NRTermsEvent;
  [(NRPBTermsEvent *)&v7 setDocumentationID:v4];
}

- (void)setPresentationReason:(id)a3
{
  id v4 = a3;
  if (!*((unsigned char *)&self->super._has + 5))
  {
    id v6 = +[NRTermsAcknowledgementRegistry errorWithEnum:5];
    objc_exception_throw(v6);
  }
  id v5 = v4;
  v7.receiver = self;
  v7.super_class = (Class)NRTermsEvent;
  [(NRPBTermsEvent *)&v7 setPresentationReason:v4];
}

- (void)setPresentationLocation:(int)a3
{
  if (!*((unsigned char *)&self->super._has + 5))
  {
    id v3 = +[NRTermsAcknowledgementRegistry errorWithEnum:5];
    objc_exception_throw(v3);
  }
  v4.receiver = self;
  v4.super_class = (Class)NRTermsEvent;
  [(NRPBTermsEvent *)&v4 setPresentationLocation:*(void *)&a3];
}

- (void)setAcknowledgedDeviceName:(id)a3
{
  id v4 = a3;
  if (!*((unsigned char *)&self->super._has + 5))
  {
    id v6 = +[NRTermsAcknowledgementRegistry errorWithEnum:5];
    objc_exception_throw(v6);
  }
  id v5 = v4;
  v7.receiver = self;
  v7.super_class = (Class)NRTermsEvent;
  [(NRPBTermsEvent *)&v7 setAcknowledgedDeviceName:v4];
}

- (void)setAcknowledgedDeviceSerialNumber:(id)a3
{
  id v4 = a3;
  if (!*((unsigned char *)&self->super._has + 5))
  {
    id v6 = +[NRTermsAcknowledgementRegistry errorWithEnum:5];
    objc_exception_throw(v6);
  }
  id v5 = v4;
  v7.receiver = self;
  v7.super_class = (Class)NRTermsEvent;
  [(NRPBTermsEvent *)&v7 setAcknowledgedDeviceSerialNumber:v4];
}

- (void)setDisplayDeviceName:(id)a3
{
  id v4 = a3;
  if (!*((unsigned char *)&self->super._has + 5))
  {
    id v6 = +[NRTermsAcknowledgementRegistry errorWithEnum:5];
    objc_exception_throw(v6);
  }
  id v5 = v4;
  v7.receiver = self;
  v7.super_class = (Class)NRTermsEvent;
  [(NRPBTermsEvent *)&v7 setDisplayDeviceName:v4];
}

- (void)setDisplayDeviceSerialNumber:(id)a3
{
  id v4 = a3;
  if (!*((unsigned char *)&self->super._has + 5))
  {
    id v6 = +[NRTermsAcknowledgementRegistry errorWithEnum:5];
    objc_exception_throw(v6);
  }
  id v5 = v4;
  v7.receiver = self;
  v7.super_class = (Class)NRTermsEvent;
  [(NRPBTermsEvent *)&v7 setDisplayDeviceSerialNumber:v4];
}

- (void)setEventDate:(double)a3
{
  if (!*((unsigned char *)&self->super._has + 5))
  {
    +[NRTermsAcknowledgementRegistry errorWithEnum:](NRTermsAcknowledgementRegistry, "errorWithEnum:", 5, a3);
    id v3 = (id)objc_claimAutoreleasedReturnValue();
    objc_exception_throw(v3);
  }
  v4.receiver = self;
  v4.super_class = (Class)NRTermsEvent;
  [(NRPBTermsEvent *)&v4 setEventDate:a3];
}

- (void)updateEventDate
{
  [MEMORY[0x1E4F1C9C8] timeIntervalSinceReferenceDate];
  v3.receiver = self;
  v3.super_class = (Class)NRTermsEvent;
  -[NRPBTermsEvent setEventDate:](&v3, sel_setEventDate_);
}

- (void)setLoggingProcessName:(id)a3
{
  id v4 = a3;
  if (!*((unsigned char *)&self->super._has + 5))
  {
    id v6 = +[NRTermsAcknowledgementRegistry errorWithEnum:5];
    objc_exception_throw(v6);
  }
  id v5 = v4;
  v7.receiver = self;
  v7.super_class = (Class)NRTermsEvent;
  [(NRPBTermsEvent *)&v7 setLoggingProcessName:v4];
}

- (void)_setLoggingProcessName:(id)a3
{
}

- (NSString)termsDigest
{
  return *(NSString **)&self->_flaggedForSend;
}

- (void)setTermsDigest:(id)a3
{
}

- (BOOL)flaggedForSend
{
  return *((unsigned char *)&self->super._has + 4);
}

- (void)setFlaggedForSend:(BOOL)a3
{
  *((unsigned char *)&self->super._has + 4) = a3;
}

- (BOOL)writable
{
  return *((unsigned char *)&self->super._has + 5);
}

- (void)setWritable:(BOOL)a3
{
  *((unsigned char *)&self->super._has + 5) = a3;
}

- (void).cxx_destruct
{
}

@end