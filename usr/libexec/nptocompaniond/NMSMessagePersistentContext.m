@interface NMSMessagePersistentContext
+ (BOOL)supportsSecureCoding;
- (BOOL)isFromFile;
- (BOOL)isFromRequest;
- (BOOL)shouldUnlinkFile;
- (NMSMessagePersistentContext)initWithCoder:(id)a3;
- (NSDate)date;
- (NSDictionary)userInfo;
- (NSString)filePath;
- (NSString)idsIdentifier;
- (id)description;
- (unsigned)messageID;
- (void)encodeWithCoder:(id)a3;
- (void)setDate:(id)a3;
- (void)setFilePath:(id)a3;
- (void)setFromFile:(BOOL)a3;
- (void)setFromRequest:(BOOL)a3;
- (void)setIdsIdentifier:(id)a3;
- (void)setMessageID:(unsigned __int16)a3;
- (void)setShouldUnlinkFile:(BOOL)a3;
- (void)setUserInfo:(id)a3;
@end

@implementation NMSMessagePersistentContext

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (NMSMessagePersistentContext)initWithCoder:(id)a3
{
  id v4 = a3;
  v16.receiver = self;
  v16.super_class = (Class)NMSMessagePersistentContext;
  v5 = [(NMSMessagePersistentContext *)&v16 init];
  if (v5)
  {
    v5->_messageID = (unsigned __int16)[v4 decodeIntegerForKey:@"m"];
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"i"];
    idsIdentifier = v5->_idsIdentifier;
    v5->_idsIdentifier = (NSString *)v6;

    if (qword_1000A4ED8 != -1) {
      dispatch_once(&qword_1000A4ED8, &stru_100093A50);
    }
    id v8 = (id)qword_1000A4EE0;
    uint64_t v9 = [v4 decodeObjectOfClasses:v8 forKey:@"u"];
    userInfo = v5->_userInfo;
    v5->_userInfo = (NSDictionary *)v9;

    uint64_t v11 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"d"];
    date = v5->_date;
    v5->_date = (NSDate *)v11;

    v5->_fromRequest = [v4 decodeBoolForKey:@"r"];
    v5->_fromFile = [v4 decodeBoolForKey:@"f"];
    uint64_t v13 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"p"];
    filePath = v5->_filePath;
    v5->_filePath = (NSString *)v13;

    v5->_shouldUnlinkFile = [v4 decodeBoolForKey:@"l"];
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  uint64_t messageID = self->_messageID;
  id v5 = a3;
  [v5 encodeInteger:messageID forKey:@"m"];
  [v5 encodeObject:self->_idsIdentifier forKey:@"i"];
  [v5 encodeObject:self->_userInfo forKey:@"u"];
  [v5 encodeObject:self->_date forKey:@"d"];
  [v5 encodeBool:self->_fromRequest forKey:@"r"];
  [v5 encodeBool:self->_fromFile forKey:@"f"];
  [v5 encodeObject:self->_filePath forKey:@"p"];
  [v5 encodeBool:self->_shouldUnlinkFile forKey:@"l"];
}

- (id)description
{
  BOOL fromFile = self->_fromFile;
  id v4 = (objc_class *)objc_opt_class();
  uint64_t v5 = NSStringFromClass(v4);
  uint64_t v6 = (void *)v5;
  uint64_t messageID = self->_messageID;
  userInfo = self->_userInfo;
  date = self->_date;
  idsIdentifier = self->_idsIdentifier;
  if (fromFile) {
    +[NSString stringWithFormat:@"<%@:%p id:%hu ids:%@ date:%@ fromRequest:%d userInfo:%@ path:%@ shouldUnlink:%d>", v5, self, messageID, idsIdentifier, date, self->_fromRequest, userInfo, self->_filePath, self->_shouldUnlinkFile];
  }
  else {
  uint64_t v11 = +[NSString stringWithFormat:@"<%@:%p id:%hu ids:%@ date:%@ fromRequest:%d userInfo:%@>", v5, self, messageID, idsIdentifier, date, self->_fromRequest, userInfo, v13, v14];
  }

  return v11;
}

- (unsigned)messageID
{
  return self->_messageID;
}

- (void)setMessageID:(unsigned __int16)a3
{
  self->_uint64_t messageID = a3;
}

- (NSString)idsIdentifier
{
  return self->_idsIdentifier;
}

- (void)setIdsIdentifier:(id)a3
{
}

- (NSDictionary)userInfo
{
  return self->_userInfo;
}

- (void)setUserInfo:(id)a3
{
}

- (NSDate)date
{
  return self->_date;
}

- (void)setDate:(id)a3
{
}

- (BOOL)isFromRequest
{
  return self->_fromRequest;
}

- (void)setFromRequest:(BOOL)a3
{
  self->_fromRequest = a3;
}

- (BOOL)isFromFile
{
  return self->_fromFile;
}

- (void)setFromFile:(BOOL)a3
{
  self->_BOOL fromFile = a3;
}

- (NSString)filePath
{
  return self->_filePath;
}

- (void)setFilePath:(id)a3
{
}

- (BOOL)shouldUnlinkFile
{
  return self->_shouldUnlinkFile;
}

- (void)setShouldUnlinkFile:(BOOL)a3
{
  self->_shouldUnlinkFile = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_filePath, 0);
  objc_storeStrong((id *)&self->_date, 0);
  objc_storeStrong((id *)&self->_userInfo, 0);

  objc_storeStrong((id *)&self->_idsIdentifier, 0);
}

@end