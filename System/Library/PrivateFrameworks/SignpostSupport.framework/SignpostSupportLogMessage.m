@interface SignpostSupportLogMessage
+ (id)serializationTypeNumber;
- (BOOL)hasNonScalarDynamicData;
- (BOOL)isEqual:(id)a3;
- (NSString)debugDescription;
- (NSString)message;
- (NSString)processImagePath;
- (NSString)processName;
- (NSString)senderImagePath;
- (NSUUID)processImageUUID;
- (NSUUID)senderImageUUID;
- (SignpostSupportLogMessage)initWithDictionary:(id)a3;
- (SignpostSupportLogMessage)initWithSubsystem:(id)a3 category:(id)a4 timebaseRatio:(double)a5 unixDate:(timeval *)a6 unixTimeZone:(timezone *)a7;
- (id)_descriptionStringForColumn:(unint64_t)a3 timeFormat:(unint64_t)a4 asBegin:(BOOL)a5;
- (id)_dictionaryRepresentationWithIsHumanReadable:(BOOL)a3 shouldRedact:(BOOL)a4;
- (id)humanReadableType;
- (int)processID;
- (int)tv_usec;
- (int)tz_dsttime;
- (int)tz_minuteswest;
- (int64_t)tv_sec;
- (unint64_t)_machContinuousTimestamp;
- (unint64_t)durationMachContinuousTime;
- (unint64_t)processUniqueID;
- (unint64_t)threadID;
- (unsigned)messageType;
- (void)setHasNonScalarDynamicData:(BOOL)a3;
- (void)setMessage:(id)a3;
- (void)setMessageType:(unsigned __int8)a3;
- (void)setProcessID:(int)a3;
- (void)setProcessImagePath:(id)a3;
- (void)setProcessImageUUID:(id)a3;
- (void)setProcessName:(id)a3;
- (void)setProcessUniqueID:(unint64_t)a3;
- (void)setSenderImagePath:(id)a3;
- (void)setSenderImageUUID:(id)a3;
- (void)setThreadID:(unint64_t)a3;
- (void)setTv_sec:(int64_t)a3;
- (void)setTv_usec:(int)a3;
- (void)setTz_dsttime:(int)a3;
- (void)setTz_minuteswest:(int)a3;
- (void)set_machContinuousTimestamp:(unint64_t)a3;
@end

@implementation SignpostSupportLogMessage

+ (id)serializationTypeNumber
{
  if (serializationTypeNumber_onceToken_478 != -1) {
    dispatch_once(&serializationTypeNumber_onceToken_478, &__block_literal_global_481);
  }
  v2 = (void *)serializationTypeNumber_serializationTypeNumber_479;

  return v2;
}

void __67__SignpostSupportLogMessage_Serialization__serializationTypeNumber__block_invoke()
{
  v0 = (void *)serializationTypeNumber_serializationTypeNumber_479;
  serializationTypeNumber_serializationTypeNumber_479 = (uint64_t)&unk_1EF81E7D8;
}

- (id)humanReadableType
{
  return @"LogMessage";
}

- (id)_dictionaryRepresentationWithIsHumanReadable:(BOOL)a3 shouldRedact:(BOOL)a4
{
  BOOL v4 = a4;
  BOOL v5 = a3;
  v14.receiver = self;
  v14.super_class = (Class)SignpostSupportLogMessage;
  v7 = -[SignpostSupportObject _dictionaryRepresentationWithIsHumanReadable:shouldRedact:](&v14, sel__dictionaryRepresentationWithIsHumanReadable_shouldRedact_);
  _addArchiveEventFieldsInDictionaryWithArchiveEvent(v7, self, v5);
  if (v4 && [(SignpostSupportLogMessage *)self hasNonScalarDynamicData])
  {
    if (v5) {
      v8 = @"MessageString";
    }
    else {
      v8 = @"Mess";
    }
    [v7 setObject:@"<redacted>" forKeyedSubscript:v8];
  }
  else
  {
    v9 = [(SignpostSupportLogMessage *)self message];
    if (v5) {
      v10 = @"MessageString";
    }
    else {
      v10 = @"Mess";
    }
    [v7 setObject:v9 forKeyedSubscript:v10];
  }
  v11 = objc_msgSend(NSNumber, "numberWithUnsignedChar:", -[SignpostSupportLogMessage messageType](self, "messageType"));
  if (v5) {
    v12 = @"MessageType";
  }
  else {
    v12 = @"MessType";
  }
  [v7 setObject:v11 forKeyedSubscript:v12];

  return v7;
}

- (SignpostSupportLogMessage)initWithDictionary:(id)a3
{
  id v4 = a3;
  if (!v4) {
    goto LABEL_9;
  }
  v10.receiver = self;
  v10.super_class = (Class)SignpostSupportLogMessage;
  BOOL v5 = [(SignpostSupportObject *)&v10 initWithDictionary:v4];
  self = v5;
  if (!v5)
  {
LABEL_8:
    self = self;
    v6 = self;
    goto LABEL_10;
  }
  if (!_initArchiveEventFieldsWithSerializedObjectDictionary(v5, v4))
  {
LABEL_9:
    v6 = 0;
    goto LABEL_10;
  }
  v6 = [v4 objectForKeyedSubscript:@"Mess"];
  if (v6)
  {
    [(SignpostSupportLogMessage *)self setMessage:v6];
    v7 = [v4 objectForKeyedSubscript:@"MessType"];
    v8 = v7;
    if (v7) {
      -[SignpostSupportLogMessage setMessageType:](self, "setMessageType:", [v7 unsignedCharValue]);
    }

    goto LABEL_8;
  }
LABEL_10:

  return v6;
}

- (SignpostSupportLogMessage)initWithSubsystem:(id)a3 category:(id)a4 timebaseRatio:(double)a5 unixDate:(timeval *)a6 unixTimeZone:(timezone *)a7
{
  v10.receiver = self;
  v10.super_class = (Class)SignpostSupportLogMessage;
  result = [(SignpostSupportObject *)&v10 initWithSubsystem:a3 category:a4 timebaseRatio:a5];
  if (result)
  {
    if (a6)
    {
      result->_tv_sec = a6->tv_sec;
      result->_tv_usec = a6->tv_usec;
    }
    if (a7)
    {
      result->_tz_minuteswest = a7->tz_minuteswest;
      result->_tz_dsttime = a7->tz_dsttime;
    }
  }
  return result;
}

- (id)_descriptionStringForColumn:(unint64_t)a3 timeFormat:(unint64_t)a4 asBegin:(BOOL)a5
{
  v15.receiver = self;
  v15.super_class = (Class)SignpostSupportLogMessage;
  v7 = [(SignpostSupportObject *)&v15 _descriptionStringForColumn:a3 timeFormat:a4 asBegin:a5];
  v8 = v7;
  if (v7)
  {
    v9 = v7;
LABEL_3:
    objc_super v10 = v9;
    goto LABEL_4;
  }
  objc_super v10 = 0;
  if ((uint64_t)a3 > 9)
  {
    if (a3 == 10)
    {
      objc_msgSend(NSString, "stringWithFormat:", @"%#llx", -[SignpostSupportLogMessage threadID](self, "threadID"));
      v9 = (__CFString *)objc_claimAutoreleasedReturnValue();
      goto LABEL_3;
    }
    if (a3 == 18)
    {
      v9 = [(SignpostSupportLogMessage *)self message];
      goto LABEL_3;
    }
  }
  else if (a3 == 5)
  {
    int v14 = [(SignpostSupportLogMessage *)self messageType];
    if (v14 <= 1)
    {
      if (!v14)
      {
        objc_super v10 = @"Default";
        goto LABEL_4;
      }
      if (v14 == 1)
      {
        objc_super v10 = @"Info";
        goto LABEL_4;
      }
    }
    else
    {
      switch(v14)
      {
        case 2:
          objc_super v10 = @"Debug";
          goto LABEL_4;
        case 16:
          objc_super v10 = @"Error";
          goto LABEL_4;
        case 17:
          objc_super v10 = @"Fault";
          goto LABEL_4;
      }
    }
    objc_super v10 = @"UNKNOWN";
  }
  else if (a3 == 9)
  {
    v12 = NSString;
    v13 = [(SignpostSupportLogMessage *)self processName];
    objc_super v10 = [v12 stringWithFormat:@"%@[%d]", v13, -[SignpostSupportLogMessage processID](self, "processID")];
  }
LABEL_4:

  return v10;
}

- (unint64_t)durationMachContinuousTime
{
  return 0;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)SignpostSupportLogMessage;
  if ([(SignpostSupportObject *)&v12 isEqual:v4])
  {
    id v5 = v4;
    int v6 = [(SignpostSupportLogMessage *)self messageType];
    if (v6 == [v5 messageType]
      && ([(SignpostSupportLogMessage *)self message],
          v7 = objc_claimAutoreleasedReturnValue(),
          [v5 message],
          v8 = objc_claimAutoreleasedReturnValue(),
          int v9 = [v7 isEqualToString:v8],
          v8,
          v7,
          v9))
    {
      char v10 = _archiveEventsAreEqual(self, v5);
    }
    else
    {
      char v10 = 0;
    }
  }
  else
  {
    char v10 = 0;
  }

  return v10;
}

- (NSString)debugDescription
{
  v3 = NSString;
  unint64_t v4 = [(SignpostSupportLogMessage *)self startMachContinuousTime];
  id v5 = [(SignpostSupportLogMessage *)self message];
  int v6 = [v3 stringWithFormat:@"Log Message [mct: %llu] %@", v4, v5];

  return (NSString *)v6;
}

- (int64_t)tv_sec
{
  return self->_tv_sec;
}

- (void)setTv_sec:(int64_t)a3
{
  self->_tv_sec = a3;
}

- (int)tv_usec
{
  return self->_tv_usec;
}

- (void)setTv_usec:(int)a3
{
  self->_tv_usec = a3;
}

- (int)tz_minuteswest
{
  return self->_tz_minuteswest;
}

- (void)setTz_minuteswest:(int)a3
{
  self->_tz_minuteswest = a3;
}

- (int)tz_dsttime
{
  return self->_tz_dsttime;
}

- (void)setTz_dsttime:(int)a3
{
  self->_tz_dsttime = a3;
}

- (int)processID
{
  return self->_processID;
}

- (void)setProcessID:(int)a3
{
  self->_processID = a3;
}

- (unint64_t)processUniqueID
{
  return self->_processUniqueID;
}

- (void)setProcessUniqueID:(unint64_t)a3
{
  self->_processUniqueID = a3;
}

- (unint64_t)threadID
{
  return self->_threadID;
}

- (void)setThreadID:(unint64_t)a3
{
  self->_threadID = a3;
}

- (unsigned)messageType
{
  return self->_messageType;
}

- (void)setMessageType:(unsigned __int8)a3
{
  self->_messageType = a3;
}

- (NSUUID)processImageUUID
{
  return self->_processImageUUID;
}

- (void)setProcessImageUUID:(id)a3
{
}

- (NSString)processImagePath
{
  return self->_processImagePath;
}

- (void)setProcessImagePath:(id)a3
{
}

- (NSString)processName
{
  return self->_processName;
}

- (void)setProcessName:(id)a3
{
}

- (NSUUID)senderImageUUID
{
  return self->_senderImageUUID;
}

- (void)setSenderImageUUID:(id)a3
{
}

- (NSString)senderImagePath
{
  return self->_senderImagePath;
}

- (void)setSenderImagePath:(id)a3
{
}

- (NSString)message
{
  return self->_message;
}

- (void)setMessage:(id)a3
{
}

- (unint64_t)_machContinuousTimestamp
{
  return self->__machContinuousTimestamp;
}

- (void)set_machContinuousTimestamp:(unint64_t)a3
{
  self->__machContinuousTimestamp = a3;
}

- (BOOL)hasNonScalarDynamicData
{
  return self->_hasNonScalarDynamicData;
}

- (void)setHasNonScalarDynamicData:(BOOL)a3
{
  self->_hasNonScalarDynamicData = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_message, 0);
  objc_storeStrong((id *)&self->_senderImagePath, 0);
  objc_storeStrong((id *)&self->_senderImageUUID, 0);
  objc_storeStrong((id *)&self->_processName, 0);
  objc_storeStrong((id *)&self->_processImagePath, 0);

  objc_storeStrong((id *)&self->_processImageUUID, 0);
}

@end