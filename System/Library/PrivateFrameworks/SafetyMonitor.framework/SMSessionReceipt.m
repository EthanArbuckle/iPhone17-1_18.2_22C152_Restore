@interface SMSessionReceipt
+ (BOOL)supportsSecureCoding;
- (BOOL)readStatus;
- (NSArray)receiverHandles;
- (NSDate)endTime;
- (NSDate)startTime;
- (NSUUID)sessionID;
- (SMSessionReceipt)initWithCoder:(id)a3;
- (SMSessionReceipt)initWithSessionID:(id)a3 sessionType:(unint64_t)a4 sessionStartTime:(id)a5 sessionEndTime:(id)a6 receiverHandles:(id)a7 safetyCacheReadStaus:(BOOL)a8;
- (id)description;
- (unint64_t)sessionType;
- (void)encodeWithCoder:(id)a3;
@end

@implementation SMSessionReceipt

- (SMSessionReceipt)initWithSessionID:(id)a3 sessionType:(unint64_t)a4 sessionStartTime:(id)a5 sessionEndTime:(id)a6 receiverHandles:(id)a7 safetyCacheReadStaus:(BOOL)a8
{
  id v15 = a3;
  id v16 = a5;
  id v25 = a6;
  id v17 = a7;
  v18 = v17;
  if (!v15)
  {
    v22 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (!os_log_type_enabled(v22, OS_LOG_TYPE_ERROR)) {
      goto LABEL_17;
    }
    *(_WORD *)buf = 0;
    v23 = "Invalid parameter not satisfying: sessionID";
LABEL_16:
    _os_log_error_impl(&dword_25B6E0000, v22, OS_LOG_TYPE_ERROR, v23, buf, 2u);
    goto LABEL_17;
  }
  if (!v17)
  {
    v22 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (!os_log_type_enabled(v22, OS_LOG_TYPE_ERROR)) {
      goto LABEL_17;
    }
    *(_WORD *)buf = 0;
    v23 = "Invalid parameter not satisfying: receiverHandles";
    goto LABEL_16;
  }
  if (!v16)
  {
    v22 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (!os_log_type_enabled(v22, OS_LOG_TYPE_ERROR)) {
      goto LABEL_17;
    }
    *(_WORD *)buf = 0;
    v23 = "Invalid parameter not satisfying: startTime";
    goto LABEL_16;
  }
  if (!v25)
  {
    v22 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      v23 = "Invalid parameter not satisfying: endTime";
      goto LABEL_16;
    }
LABEL_17:

    v21 = 0;
    goto LABEL_18;
  }
  v26.receiver = self;
  v26.super_class = (Class)SMSessionReceipt;
  v19 = [(SMSessionReceipt *)&v26 init];
  v20 = v19;
  if (v19)
  {
    objc_storeStrong((id *)&v19->_sessionID, a3);
    v20->_sessionType = a4;
    objc_storeStrong((id *)&v20->_startTime, a5);
    objc_storeStrong((id *)&v20->_endTime, a6);
    objc_storeStrong((id *)&v20->_receiverHandles, a7);
    v20->_readStatus = a8;
  }
  self = v20;
  v21 = self;
LABEL_18:

  return v21;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (SMSessionReceipt)initWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"__kSMSessionReceiptSessionIDKey"];
  uint64_t v6 = [v4 decodeIntegerForKey:@"__kSMSessionReceiptSessionTypeKey"];
  v7 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"__kSMSessionReceiptStartTimeKey"];
  v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"__kSMSessionReceiptEndTimeKey"];
  v9 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"__kSMSessionReceiptReceiverHandlesKey"];
  uint64_t v10 = [v4 decodeBoolForKey:@"__kSMSessionReceiptReadStatusKey"];

  v11 = [(SMSessionReceipt *)self initWithSessionID:v5 sessionType:v6 sessionStartTime:v7 sessionEndTime:v8 receiverHandles:v9 safetyCacheReadStaus:v10];
  return v11;
}

- (void)encodeWithCoder:(id)a3
{
  id v8 = a3;
  id v4 = [(SMSessionReceipt *)self sessionID];
  [v8 encodeObject:v4 forKey:@"__kSMSessionReceiptSessionIDKey"];

  objc_msgSend(v8, "encodeInteger:forKey:", -[SMSessionReceipt sessionType](self, "sessionType"), @"__kSMSessionReceiptSessionTypeKey");
  v5 = [(SMSessionReceipt *)self startTime];
  [v8 encodeObject:v5 forKey:@"__kSMSessionReceiptStartTimeKey"];

  uint64_t v6 = [(SMSessionReceipt *)self endTime];
  [v8 encodeObject:v6 forKey:@"__kSMSessionReceiptEndTimeKey"];

  v7 = [(SMSessionReceipt *)self receiverHandles];
  [v8 encodeObject:v7 forKey:@"__kSMSessionReceiptReceiverHandlesKey"];

  objc_msgSend(v8, "encodeBool:forKey:", -[SMSessionReceipt readStatus](self, "readStatus"), @"__kSMSessionReceiptReadStatusKey");
}

- (id)description
{
  v3 = NSString;
  id v4 = [(SMSessionReceipt *)self sessionID];
  unint64_t v5 = [(SMSessionReceipt *)self sessionType];
  uint64_t v6 = [(SMSessionReceipt *)self receiverHandles];
  v7 = [(SMSessionReceipt *)self startTime];
  id v8 = [v7 stringFromDate];
  v9 = [(SMSessionReceipt *)self endTime];
  uint64_t v10 = [v9 stringFromDate];
  v11 = [v3 stringWithFormat:@"sessionID, %@, sessionType, %d, receiverHandles, %@, startTime, %@, endTime, %@, readStatus, %d", v4, v5, v6, v8, v10, -[SMSessionReceipt readStatus](self, "readStatus")];

  return v11;
}

- (NSUUID)sessionID
{
  return self->_sessionID;
}

- (unint64_t)sessionType
{
  return self->_sessionType;
}

- (NSArray)receiverHandles
{
  return self->_receiverHandles;
}

- (BOOL)readStatus
{
  return self->_readStatus;
}

- (NSDate)startTime
{
  return self->_startTime;
}

- (NSDate)endTime
{
  return self->_endTime;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_endTime, 0);
  objc_storeStrong((id *)&self->_startTime, 0);
  objc_storeStrong((id *)&self->_receiverHandles, 0);
  objc_storeStrong((id *)&self->_sessionID, 0);
}

@end