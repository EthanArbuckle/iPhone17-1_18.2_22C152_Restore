@interface MRRequestDetails
+ (BOOL)_isCLIBundleID:(id)a3;
+ (BOOL)_isSiriBundleID:(id)a3;
+ (BOOL)supportsSecureCoding;
+ (id)_inferInitatorForBundleID:(id)a3;
- (BOOL)initiatorWasInferred;
- (BOOL)userInitiated;
- (MRRequestDetails)initWithCoder:(id)a3;
- (MRRequestDetails)initWithData:(id)a3;
- (MRRequestDetails)initWithInitiator:(id)a3 requestID:(id)a4 reason:(id)a5;
- (MRRequestDetails)initWithInitiator:(id)a3 requestID:(id)a4 reason:(id)a5 userInitiated:(BOOL)a6;
- (MRRequestDetails)initWithInitiator:(id)a3 requestID:(id)a4 reason:(id)a5 userInitiated:(BOOL)a6 originatingBundleID:(id)a7;
- (MRRequestDetails)initWithName:(id)a3 requestID:(id)a4 reason:(id)a5;
- (MRRequestDetails)initWithProtobuf:(id)a3;
- (NSData)data;
- (NSDate)startDate;
- (NSString)initiator;
- (NSString)label;
- (NSString)originatingBundleID;
- (NSString)reason;
- (NSString)requestID;
- (NSString)requestReasonID;
- (_MRRequestDetailsProtobuf)protobuf;
- (id)debugDescription;
- (id)description;
- (unsigned)qos;
- (void)encodeWithCoder:(id)a3;
@end

@implementation MRRequestDetails

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_originatingBundleID, 0);
  objc_storeStrong((id *)&self->_startDate, 0);
  objc_storeStrong((id *)&self->_requestID, 0);
  objc_storeStrong((id *)&self->_reason, 0);

  objc_storeStrong((id *)&self->_initiator, 0);
}

- (MRRequestDetails)initWithName:(id)a3 requestID:(id)a4 reason:(id)a5
{
  return [(MRRequestDetails *)self initWithInitiator:a3 requestID:a4 reason:a5 userInitiated:0];
}

- (MRRequestDetails)initWithInitiator:(id)a3 requestID:(id)a4 reason:(id)a5 userInitiated:(BOOL)a6
{
  BOOL v6 = a6;
  v10 = (void *)MEMORY[0x1E4F28B50];
  id v11 = a5;
  id v12 = a4;
  id v13 = a3;
  v14 = [v10 mainBundle];
  v15 = [v14 bundleIdentifier];
  v16 = [(MRRequestDetails *)self initWithInitiator:v13 requestID:v12 reason:v11 userInitiated:v6 originatingBundleID:v15];

  return v16;
}

- (NSString)reason
{
  return self->_reason;
}

- (NSString)requestID
{
  return self->_requestID;
}

- (MRRequestDetails)initWithInitiator:(id)a3 requestID:(id)a4 reason:(id)a5
{
  return [(MRRequestDetails *)self initWithInitiator:a3 requestID:a4 reason:a5 userInitiated:0];
}

- (MRRequestDetails)initWithInitiator:(id)a3 requestID:(id)a4 reason:(id)a5 userInitiated:(BOOL)a6 originatingBundleID:(id)a7
{
  id v13 = a3;
  id v14 = a4;
  v15 = (__CFString *)a5;
  id v16 = a7;
  v31.receiver = self;
  v31.super_class = (Class)MRRequestDetails;
  v17 = [(MRRequestDetails *)&v31 init];
  if (!v17) {
    goto LABEL_11;
  }
  if (![v13 isEqualToString:@"Infer"])
  {
    objc_storeStrong((id *)&v17->_initiator, a3);
    if (v14) {
      goto LABEL_4;
    }
LABEL_6:
    v21 = [MEMORY[0x1E4F29128] UUID];
    uint64_t v22 = [v21 UUIDString];
    requestID = v17->_requestID;
    v17->_requestID = (NSString *)v22;

    goto LABEL_7;
  }
  uint64_t v18 = [(id)objc_opt_class() _inferInitatorForBundleID:v16];
  initiator = v17->_initiator;
  v17->_initiator = (NSString *)v18;

  v17->_initiatorWasInferred = 1;
  if (!v14) {
    goto LABEL_6;
  }
LABEL_4:
  v20 = (NSString *)v14;
  v21 = v17->_requestID;
  v17->_requestID = v20;
LABEL_7:

  if (v15) {
    v24 = v15;
  }
  else {
    v24 = &stru_1EE60E7D8;
  }
  objc_storeStrong((id *)&v17->_reason, v24);
  v17->_qos = qos_class_self();
  uint64_t v25 = [MEMORY[0x1E4F1C9C8] now];
  startDate = v17->_startDate;
  v17->_startDate = (NSDate *)v25;

  v17->_userInitiated = a6;
  v27 = [MEMORY[0x1E4F28B50] mainBundle];
  uint64_t v28 = [v27 bundleIdentifier];
  originatingBundleID = v17->_originatingBundleID;
  v17->_originatingBundleID = (NSString *)v28;

LABEL_11:
  return v17;
}

- (MRRequestDetails)initWithData:(id)a3
{
  if (a3)
  {
    id v4 = a3;
    v5 = [[_MRRequestDetailsProtobuf alloc] initWithData:v4];

    self = [(MRRequestDetails *)self initWithProtobuf:v5];
    BOOL v6 = self;
  }
  else
  {
    BOOL v6 = 0;
  }

  return v6;
}

- (MRRequestDetails)initWithProtobuf:(id)a3
{
  id v4 = a3;
  v5 = v4;
  if (v4)
  {
    BOOL v6 = [v4 initiator];
    v7 = [v5 requestID];
    v8 = [v5 reason];
    v9 = -[MRRequestDetails initWithInitiator:requestID:reason:userInitiated:](self, "initWithInitiator:requestID:reason:userInitiated:", v6, v7, v8, [v5 userInitiated]);

    if (v9)
    {
      v9->_qos = [v5 qos];
      uint64_t v10 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1C9C8]), "initWithTimeIntervalSinceReferenceDate:", (double)(unint64_t)objc_msgSend(v5, "startDate"));
      startDate = v9->_startDate;
      v9->_startDate = (NSDate *)v10;

      v9->_userInitiated = [v5 userInitiated];
      uint64_t v12 = [v5 originatingBundleID];
      originatingBundleID = v9->_originatingBundleID;
      v9->_originatingBundleID = (NSString *)v12;
    }
    self = v9;
    id v14 = self;
  }
  else
  {
    id v14 = 0;
  }

  return v14;
}

- (id)description
{
  id v3 = [NSString alloc];
  uint64_t v4 = objc_opt_class();
  v5 = [(MRRequestDetails *)self initiator];
  BOOL v6 = [(MRRequestDetails *)self originatingBundleID];
  v7 = [(MRRequestDetails *)self reason];
  v8 = (void *)[v3 initWithFormat:@"<%@:%p/initiator=%@/bundleID=%@/reason=%@/ui=%u/qos=%u/i=%u>", v4, self, v5, v6, v7, -[MRRequestDetails userInitiated](self, "userInitiated"), -[MRRequestDetails qos](self, "qos"), -[MRRequestDetails initiatorWasInferred](self, "initiatorWasInferred")];

  return v8;
}

- (id)debugDescription
{
  v2 = [(MRRequestDetails *)self protobuf];
  id v3 = [v2 debugDescription];

  return v3;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  id v5 = [(MRRequestDetails *)self protobuf];
  [v4 encodeObject:v5 forKey:@"protobuf"];
}

- (MRRequestDetails)initWithCoder:(id)a3
{
  id v4 = a3;
  id v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"protobuf"];

  BOOL v6 = [(MRRequestDetails *)self initWithProtobuf:v5];
  return v6;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (NSData)data
{
  v2 = [(MRRequestDetails *)self protobuf];
  id v3 = [v2 data];

  return (NSData *)v3;
}

- (_MRRequestDetailsProtobuf)protobuf
{
  id v3 = objc_alloc_init(_MRRequestDetailsProtobuf);
  id v4 = [(MRRequestDetails *)self initiator];
  [(_MRRequestDetailsProtobuf *)v3 setInitiator:v4];

  id v5 = [(MRRequestDetails *)self requestID];
  [(_MRRequestDetailsProtobuf *)v3 setRequestID:v5];

  BOOL v6 = [(MRRequestDetails *)self reason];
  [(_MRRequestDetailsProtobuf *)v3 setReason:v6];

  [(_MRRequestDetailsProtobuf *)v3 setQos:[(MRRequestDetails *)self qos]];
  v7 = [(MRRequestDetails *)self startDate];
  [v7 timeIntervalSinceReferenceDate];
  [(_MRRequestDetailsProtobuf *)v3 setStartDate:(unint64_t)v8];

  [(_MRRequestDetailsProtobuf *)v3 setUserInitiated:[(MRRequestDetails *)self userInitiated]];
  [(_MRRequestDetailsProtobuf *)v3 setInitiatorWasInferred:[(MRRequestDetails *)self initiatorWasInferred]];
  v9 = [(MRRequestDetails *)self originatingBundleID];
  [(_MRRequestDetailsProtobuf *)v3 setOriginatingBundleID:v9];

  return v3;
}

- (NSString)requestReasonID
{
  id v3 = [NSString alloc];
  id v4 = [(MRRequestDetails *)self label];
  id v5 = [(MRRequestDetails *)self reason];
  BOOL v6 = (void *)[v3 initWithFormat:@"%@(%@)", v4, v5];

  return (NSString *)v6;
}

- (NSString)label
{
  id v3 = [NSString alloc];
  id v4 = [(MRRequestDetails *)self initiator];
  id v5 = [(MRRequestDetails *)self reason];
  BOOL v6 = (void *)[v3 initWithFormat:@"%@(%@)", v4, v5];

  return (NSString *)v6;
}

+ (id)_inferInitatorForBundleID:(id)a3
{
  id v4 = a3;
  if ([a1 _isSiriBundleID:v4])
  {
    id v5 = @"Siri";
  }
  else if ([v4 isEqualToString:@"com.apple.homed"])
  {
    id v5 = @"Automation";
  }
  else if ([v4 isEqualToString:@"com.apple.SoundBoard"])
  {
    id v5 = @"Alarm";
  }
  else if ([v4 isEqualToString:@"com.apple.BackgroundShortcutRunner"])
  {
    id v5 = @"Shortcut";
  }
  else if (([v4 isEqualToString:@"com.apple.MusicUIService"] & 1) != 0 {
         || ([v4 isEqualToString:@"com.apple.TVSystemUIService"] & 1) != 0
  }
         || ([v4 isEqualToString:@"com.apple.Siri"] & 1) != 0
         || ([v4 isEqualToString:@"com.apple.MediaRemoteUI"] & 1) != 0
         || ([v4 isEqualToString:@"com.apple.NanoNowPlaying"] & 1) != 0
         || ([v4 isEqualToString:@"com.apple.SpringBoard"] & 1) != 0)
  {
    id v5 = @"RoutePicker";
  }
  else if ([v4 isEqualToString:@"com.apple.proximitycontrold"])
  {
    id v5 = @"Proximity";
  }
  else if (+[MRSystemMediaBundles isProcessNameAirPlayReceiver:v4])
  {
    id v5 = @"AirPlay";
  }
  else if ([a1 _isCLIBundleID:v4])
  {
    id v5 = @"CLI";
  }
  else
  {
    id v5 = @"API";
  }

  return v5;
}

+ (BOOL)_isSiriBundleID:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"com.apple.assistant_service"]) {
    char v4 = 1;
  }
  else {
    char v4 = [v3 isEqualToString:@"assistantd"];
  }

  return v4;
}

+ (BOOL)_isCLIBundleID:(id)a3
{
  id v3 = a3;
  if (([v3 isEqualToString:@"com.apple.mediaremotetool"] & 1) != 0
    || ([v3 isEqualToString:@"com.apple.mediaplayertool"] & 1) != 0)
  {
    char v4 = 1;
  }
  else
  {
    char v4 = [v3 isEqualToString:@"com.apple.mediactl"];
  }

  return v4;
}

- (NSString)initiator
{
  return self->_initiator;
}

- (unsigned)qos
{
  return self->_qos;
}

- (NSDate)startDate
{
  return self->_startDate;
}

- (NSString)originatingBundleID
{
  return self->_originatingBundleID;
}

- (BOOL)userInitiated
{
  return self->_userInitiated;
}

- (BOOL)initiatorWasInferred
{
  return self->_initiatorWasInferred;
}

@end