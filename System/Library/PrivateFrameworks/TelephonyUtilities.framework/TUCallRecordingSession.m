@interface TUCallRecordingSession
+ (BOOL)supportsSecureCoding;
- (BOOL)isRedisclosing;
- (NSDate)recordingEndedDate;
- (NSDate)recordingStartedDate;
- (NSString)callUUID;
- (NSUUID)UUID;
- (NSUUID)requestUUID;
- (TUCallRecordingSession)initWithCoder:(id)a3;
- (TUCallRecordingSession)initWithUUID:(id)a3 state:(int)a4 callUUID:(id)a5 requestUUID:(id)a6 recordingStartedDate:(id)a7 recordingEndedDate:(id)a8 isRedisclosing:(BOOL)a9;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (int)recordingState;
- (void)encodeWithCoder:(id)a3;
- (void)setCallUUID:(id)a3;
- (void)setRecordingEndedDate:(id)a3;
- (void)setRecordingStartedDate:(id)a3;
- (void)setRecordingState:(int)a3;
- (void)setRedisclosing:(BOOL)a3;
- (void)setRequestUUID:(id)a3;
- (void)setUUID:(id)a3;
@end

@implementation TUCallRecordingSession

- (TUCallRecordingSession)initWithUUID:(id)a3 state:(int)a4 callUUID:(id)a5 requestUUID:(id)a6 recordingStartedDate:(id)a7 recordingEndedDate:(id)a8 isRedisclosing:(BOOL)a9
{
  id v15 = a3;
  id v16 = a5;
  id v17 = a6;
  id v23 = a7;
  id v18 = a8;
  v24.receiver = self;
  v24.super_class = (Class)TUCallRecordingSession;
  v19 = [(TUCallRecordingSession *)&v24 init];
  v20 = v19;
  if (v19)
  {
    objc_storeStrong((id *)&v19->_UUID, a3);
    v20->_recordingState = a4;
    objc_storeStrong((id *)&v20->_callUUID, a5);
    objc_storeStrong((id *)&v20->_requestUUID, a6);
    objc_storeStrong((id *)&v20->_recordingStartedDate, a7);
    objc_storeStrong((id *)&v20->_recordingEndedDate, a8);
    v20->_redisclosing = a9;
  }

  return v20;
}

- (id)description
{
  v3 = [MEMORY[0x1E4F28E78] stringWithFormat:@"<%@ %p", objc_opt_class(), self];
  v4 = [(TUCallRecordingSession *)self UUID];
  [v3 appendFormat:@" UUID=%@", v4];

  objc_msgSend(v3, "appendFormat:", @" state=%d", -[TUCallRecordingSession recordingState](self, "recordingState"));
  v5 = [(TUCallRecordingSession *)self callUUID];
  [v3 appendFormat:@" callUUID=%@", v5];

  [v3 appendString:@">"];

  return v3;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  UUID = self->_UUID;
  id v5 = a3;
  [v5 encodeObject:UUID forKey:@"UUID"];
  [v5 encodeObject:self->_requestUUID forKey:@"requestUUID"];
  [v5 encodeInt:self->_recordingState forKey:@"recordingState"];
  [v5 encodeObject:self->_callUUID forKey:@"callUUID"];
  [v5 encodeObject:self->_recordingStartedDate forKey:@"recordingStartedDate"];
  [v5 encodeObject:self->_recordingEndedDate forKey:@"_recordingEndedDate"];
  [v5 encodeBool:self->_redisclosing forKey:@"_redisclosing"];
}

- (TUCallRecordingSession)initWithCoder:(id)a3
{
  id v4 = a3;
  id v5 = [(TUCallRecordingSession *)self init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"UUID"];
    UUID = v5->_UUID;
    v5->_UUID = (NSUUID *)v6;

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"requestUUID"];
    requestUUID = v5->_requestUUID;
    v5->_requestUUID = (NSUUID *)v8;

    v5->_recordingState = [v4 decodeIntForKey:@"recordingState"];
    uint64_t v10 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"callUUID"];
    callUUID = v5->_callUUID;
    v5->_callUUID = (NSString *)v10;

    uint64_t v12 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"recordingStartedDate"];
    recordingStartedDate = v5->_recordingStartedDate;
    v5->_recordingStartedDate = (NSDate *)v12;

    uint64_t v14 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"recordingEndedDate"];
    recordingEndedDate = v5->_recordingEndedDate;
    v5->_recordingEndedDate = (NSDate *)v14;

    v5->_redisclosing = [v4 decodeBoolForKey:@"_redisclosing"];
  }

  return v5;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  id v5 = [(TUCallRecordingSession *)self UUID];
  [v4 setUUID:v5];

  uint64_t v6 = [(TUCallRecordingSession *)self callUUID];
  [v4 setCallUUID:v6];

  v7 = [(TUCallRecordingSession *)self requestUUID];
  [v4 setRequestUUID:v7];

  objc_msgSend(v4, "setRecordingState:", -[TUCallRecordingSession recordingState](self, "recordingState"));
  uint64_t v8 = [(TUCallRecordingSession *)self recordingStartedDate];
  [v4 setRecordingStartedDate:v8];

  v9 = [(TUCallRecordingSession *)self recordingEndedDate];
  [v4 setRecordingEndedDate:v9];

  objc_msgSend(v4, "setRedisclosing:", -[TUCallRecordingSession isRedisclosing](self, "isRedisclosing"));
  return v4;
}

- (int)recordingState
{
  return self->_recordingState;
}

- (void)setRecordingState:(int)a3
{
  self->_recordingState = a3;
}

- (NSUUID)UUID
{
  return self->_UUID;
}

- (void)setUUID:(id)a3
{
}

- (NSString)callUUID
{
  return self->_callUUID;
}

- (void)setCallUUID:(id)a3
{
}

- (NSDate)recordingStartedDate
{
  return self->_recordingStartedDate;
}

- (void)setRecordingStartedDate:(id)a3
{
}

- (NSDate)recordingEndedDate
{
  return self->_recordingEndedDate;
}

- (void)setRecordingEndedDate:(id)a3
{
}

- (BOOL)isRedisclosing
{
  return self->_redisclosing;
}

- (void)setRedisclosing:(BOOL)a3
{
  self->_redisclosing = a3;
}

- (NSUUID)requestUUID
{
  return self->_requestUUID;
}

- (void)setRequestUUID:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_requestUUID, 0);
  objc_storeStrong((id *)&self->_recordingEndedDate, 0);
  objc_storeStrong((id *)&self->_recordingStartedDate, 0);
  objc_storeStrong((id *)&self->_callUUID, 0);

  objc_storeStrong((id *)&self->_UUID, 0);
}

@end