@interface SMActiveSessionDetails
+ (BOOL)supportsSecureCoding;
- (NSArray)receiverHandles;
- (NSDate)cacheReleasedDate;
- (NSString)scheduledSendGUID;
- (NSUUID)activeDeviceIdentifier;
- (NSUUID)sessionID;
- (SMActiveSessionDetails)initWithCoder:(id)a3;
- (SMActiveSessionDetails)initWithSessionID:(id)a3 activeDeviceIdentifier:(id)a4 cacheReleasedDate:(id)a5 scheduledSendGUID:(id)a6 receiverHandles:(id)a7;
- (id)description;
- (void)encodeWithCoder:(id)a3;
@end

@implementation SMActiveSessionDetails

- (SMActiveSessionDetails)initWithSessionID:(id)a3 activeDeviceIdentifier:(id)a4 cacheReleasedDate:(id)a5 scheduledSendGUID:(id)a6 receiverHandles:(id)a7
{
  id v13 = a3;
  id v14 = a4;
  id v15 = a5;
  id v26 = a6;
  id v16 = a7;
  v17 = v16;
  if (!v13)
  {
    v21 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (!os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
    {
LABEL_10:

      v20 = 0;
LABEL_11:
      v23 = v26;
      goto LABEL_12;
    }
    *(_WORD *)buf = 0;
    v22 = "Invalid parameter not satisfying: sessionID";
LABEL_17:
    _os_log_error_impl(&dword_25B6E0000, v21, OS_LOG_TYPE_ERROR, v22, buf, 2u);
    goto LABEL_10;
  }
  if (!v14)
  {
    v21 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (!os_log_type_enabled(v21, OS_LOG_TYPE_ERROR)) {
      goto LABEL_10;
    }
    *(_WORD *)buf = 0;
    v22 = "Invalid parameter not satisfying: activeDeviceIdentifier";
    goto LABEL_17;
  }
  if (v16)
  {
    v27.receiver = self;
    v27.super_class = (Class)SMActiveSessionDetails;
    v18 = [(SMActiveSessionDetails *)&v27 init];
    p_isa = (id *)&v18->super.isa;
    if (v18)
    {
      objc_storeStrong((id *)&v18->_sessionID, a3);
      objc_storeStrong(p_isa + 2, a4);
      objc_storeStrong(p_isa + 3, a5);
      objc_storeStrong(p_isa + 4, a6);
      objc_storeStrong(p_isa + 5, a7);
    }
    self = p_isa;
    v20 = self;
    goto LABEL_11;
  }
  v25 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
  v23 = v26;
  if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)buf = 0;
    _os_log_error_impl(&dword_25B6E0000, v25, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: receiverHandles", buf, 2u);
  }

  v20 = 0;
LABEL_12:

  return v20;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [(SMActiveSessionDetails *)self sessionID];
  [v4 encodeObject:v5 forKey:@"__kSMActiveSessionDetailsSessionIDKey"];

  v6 = [(SMActiveSessionDetails *)self activeDeviceIdentifier];
  [v4 encodeObject:v6 forKey:@"__kSMActiveSessionDetailsActiveDeviceIdentifierKey"];

  v7 = [(SMActiveSessionDetails *)self cacheReleasedDate];
  [v4 encodeObject:v7 forKey:@"__kSMActiveSessionDetailsCacheReleasedDateKey"];

  v8 = [(SMActiveSessionDetails *)self scheduledSendGUID];
  [v4 encodeObject:v8 forKey:@"__kSMActiveSessionDetailsScheduledSendGUIDKey"];

  id v9 = [(SMActiveSessionDetails *)self receiverHandles];
  [v4 encodeObject:v9 forKey:@"__kSMActiveSessionDetailsReceiverHandlesKey"];
}

- (SMActiveSessionDetails)initWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"__kSMActiveSessionDetailsSessionIDKey"];
  v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"__kSMActiveSessionDetailsActiveDeviceIdentifierKey"];
  v7 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"__kSMActiveSessionDetailsCacheReleasedDateKey"];
  v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"__kSMActiveSessionDetailsScheduledSendGUIDKey"];
  id v9 = (void *)MEMORY[0x263EFFA08];
  uint64_t v10 = objc_opt_class();
  v11 = objc_msgSend(v9, "setWithObjects:", v10, objc_opt_class(), 0);
  v12 = [v4 decodeObjectOfClasses:v11 forKey:@"__kSMActiveSessionDetailsReceiverHandlesKey"];

  id v13 = [(SMActiveSessionDetails *)self initWithSessionID:v5 activeDeviceIdentifier:v6 cacheReleasedDate:v7 scheduledSendGUID:v8 receiverHandles:v12];
  return v13;
}

- (id)description
{
  v3 = NSString;
  id v4 = [(SMActiveSessionDetails *)self sessionID];
  v5 = [(SMActiveSessionDetails *)self activeDeviceIdentifier];
  v6 = [(SMActiveSessionDetails *)self cacheReleasedDate];
  v7 = [v6 stringFromDate];
  v8 = [(SMActiveSessionDetails *)self scheduledSendGUID];
  id v9 = [(SMActiveSessionDetails *)self receiverHandles];
  uint64_t v10 = [v3 stringWithFormat:@"sessionID, %@, activeDeviceID, %@, cacheReleasedDate, %@, scheduledSendGUID, %@, receiverHandles, %@", v4, v5, v7, v8, v9];

  return v10;
}

- (NSUUID)sessionID
{
  return self->_sessionID;
}

- (NSUUID)activeDeviceIdentifier
{
  return self->_activeDeviceIdentifier;
}

- (NSDate)cacheReleasedDate
{
  return self->_cacheReleasedDate;
}

- (NSString)scheduledSendGUID
{
  return self->_scheduledSendGUID;
}

- (NSArray)receiverHandles
{
  return self->_receiverHandles;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_receiverHandles, 0);
  objc_storeStrong((id *)&self->_scheduledSendGUID, 0);
  objc_storeStrong((id *)&self->_cacheReleasedDate, 0);
  objc_storeStrong((id *)&self->_activeDeviceIdentifier, 0);
  objc_storeStrong((id *)&self->_sessionID, 0);
}

@end