@interface MRGroupTopologyModificationRequest
+ (BOOL)_initiatorShouldClearPredictedRoutesByDefault:(id)a3 forModificationType:(unint64_t)a4;
+ (BOOL)supportsSecureCoding;
- (BOOL)fadeAudio;
- (BOOL)muteUntilFinished;
- (BOOL)shouldClearPredictedRoutes;
- (BOOL)shouldModifyPredictedRoutes;
- (BOOL)shouldNotPauseIfLastDeviceRemoved;
- (BOOL)suppressErrorDialog;
- (MRGroupTopologyModificationRequest)initWithCoder:(id)a3;
- (MRGroupTopologyModificationRequest)initWithData:(id)a3;
- (MRGroupTopologyModificationRequest)initWithProtobuf:(id)a3;
- (MRGroupTopologyModificationRequest)initWithRequestDetails:(id)a3 type:(unint64_t)a4 outputDeviceUIDs:(id)a5;
- (MRGroupTopologyModificationRequest)initWithRequestDetails:(id)a3 type:(unint64_t)a4 outputDevices:(id)a5;
- (MRRequestDetails)requestDetails;
- (NSArray)outputDeviceUIDs;
- (NSArray)outputDevices;
- (NSData)data;
- (NSString)password;
- (_MRGroupTopologyModificationRequestProtobuf)protobuf;
- (id)copyWithOutputDeviceUIDs:(id)a3;
- (id)copyWithType:(unint64_t)a3 outputDeviceUIDs:(id)a4;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (unint64_t)type;
- (void)encodeWithCoder:(id)a3;
- (void)setFadeAudio:(BOOL)a3;
- (void)setMuteUntilFinished:(BOOL)a3;
- (void)setPassword:(id)a3;
- (void)setShouldClearPredictedRoutes:(BOOL)a3;
- (void)setShouldModifyPredictedRoutes:(BOOL)a3;
- (void)setShouldNotPauseIfLastDeviceRemoved:(BOOL)a3;
- (void)setSuppressErrorDialog:(BOOL)a3;
@end

@implementation MRGroupTopologyModificationRequest

- (MRGroupTopologyModificationRequest)initWithRequestDetails:(id)a3 type:(unint64_t)a4 outputDevices:(id)a5
{
  id v8 = a5;
  id v9 = a3;
  v10 = objc_msgSend(v8, "msv_compactMap:", &__block_literal_global_103);
  v11 = [(MRGroupTopologyModificationRequest *)self initWithRequestDetails:v9 type:a4 outputDeviceUIDs:v10];

  if (v11)
  {
    uint64_t v12 = [v8 copy];
    outputDevices = v11->_outputDevices;
    v11->_outputDevices = (NSArray *)v12;
  }
  return v11;
}

uint64_t __80__MRGroupTopologyModificationRequest_initWithRequestDetails_type_outputDevices___block_invoke(uint64_t a1, void *a2)
{
  return [a2 uid];
}

- (MRGroupTopologyModificationRequest)initWithRequestDetails:(id)a3 type:(unint64_t)a4 outputDeviceUIDs:(id)a5
{
  id v9 = a3;
  id v10 = a5;
  v18.receiver = self;
  v18.super_class = (Class)MRGroupTopologyModificationRequest;
  v11 = [(MRGroupTopologyModificationRequest *)&v18 init];
  uint64_t v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_requestDetails, a3);
    v12->_type = a4;
    uint64_t v13 = [v10 copy];
    outputDeviceUIDs = v12->_outputDeviceUIDs;
    v12->_outputDeviceUIDs = (NSArray *)v13;

    v15 = objc_opt_class();
    v16 = [v9 initiator];
    v12->_shouldClearPredictedRoutes = [v15 _initiatorShouldClearPredictedRoutesByDefault:v16 forModificationType:a4];
  }
  return v12;
}

- (id)copyWithOutputDeviceUIDs:(id)a3
{
  id v4 = a3;
  id v5 = [(MRGroupTopologyModificationRequest *)self copyWithType:[(MRGroupTopologyModificationRequest *)self type] outputDeviceUIDs:v4];

  return v5;
}

- (id)copyWithType:(unint64_t)a3 outputDeviceUIDs:(id)a4
{
  id v6 = a4;
  v7 = [(MRGroupTopologyModificationRequest *)self protobuf];
  id v8 = (void *)[v6 mutableCopy];

  [v7 setOutputDeviceUIDs:v8];
  [v7 setType:a3];
  id v9 = (void *)[objc_alloc((Class)objc_opt_class()) initWithProtobuf:v7];

  return v9;
}

- (id)description
{
  id v3 = objc_alloc(MEMORY[0x1E4F28E78]);
  id v4 = MRGroupTopologyModificationRequestTypeDescription([(MRGroupTopologyModificationRequest *)self type]);
  id v5 = [(MRGroupTopologyModificationRequest *)self requestDetails];
  id v6 = (void *)[v3 initWithFormat:@"requestType=%@/%@/", v4, v5];

  if (self->_fadeAudio) {
    [v6 appendFormat:@"FadeAudio/"];
  }
  if (self->_shouldNotPauseIfLastDeviceRemoved) {
    [v6 appendFormat:@"DontPause/"];
  }
  if (self->_suppressErrorDialog) {
    [v6 appendFormat:@"SuppressErrorDialog/"];
  }
  if (self->_muteUntilFinished) {
    [v6 appendFormat:@"MuteUntilFinished/"];
  }
  if (self->_shouldModifyPredictedRoutes) {
    [v6 appendFormat:@"shouldModifyPredictedRoutes/"];
  }
  if (self->_shouldClearPredictedRoutes) {
    [v6 appendFormat:@"shouldClearPredictedRoutes/"];
  }
  v7 = [(MRGroupTopologyModificationRequest *)self outputDeviceUIDs];
  [v6 appendFormat:@"outputDeviceUIDs=%@", v7];

  return v6;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  id v5 = [(MRGroupTopologyModificationRequest *)self protobuf];
  [v4 encodeObject:v5 forKey:@"protobuf"];
}

- (MRGroupTopologyModificationRequest)initWithCoder:(id)a3
{
  id v4 = a3;
  id v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"protobuf"];

  id v6 = [(MRGroupTopologyModificationRequest *)self initWithProtobuf:v5];
  return v6;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v3 = self;
  id v4 = [(MRGroupTopologyModificationRequest *)v3 protobuf];
  id v5 = [(MRGroupTopologyModificationRequest *)v3 initWithProtobuf:v4];

  return v5;
}

- (MRGroupTopologyModificationRequest)initWithData:(id)a3
{
  if (a3)
  {
    id v4 = a3;
    id v5 = [[_MRGroupTopologyModificationRequestProtobuf alloc] initWithData:v4];

    self = [(MRGroupTopologyModificationRequest *)self initWithProtobuf:v5];
    id v6 = self;
  }
  else
  {
    id v6 = 0;
  }

  return v6;
}

- (MRGroupTopologyModificationRequest)initWithProtobuf:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    id v5 = [MRRequestDetails alloc];
    id v6 = [v4 details];
    v7 = [(MRRequestDetails *)v5 initWithProtobuf:v6];
    uint64_t v8 = (int)[v4 type];
    id v9 = [v4 outputDeviceUIDs];
    id v10 = [(MRGroupTopologyModificationRequest *)self initWithRequestDetails:v7 type:v8 outputDeviceUIDs:v9];

    if (v10)
    {
      v10->_fadeAudio = [v4 fadeAudio];
      v10->_shouldNotPauseIfLastDeviceRemoved = [v4 shouldNotPauseIfLastDeviceRemoved];
      v10->_suppressErrorDialog = [v4 suppressErrorDialog];
      v10->_muteUntilFinished = [v4 muteUntilFinished];
      v10->_shouldModifyPredictedRoutes = [v4 shouldModifyPredictedRoutes];
      v10->_shouldClearPredictedRoutes = [v4 shouldClearPredictedRoutes];
    }
    self = v10;
    v11 = self;
  }
  else
  {
    v11 = 0;
  }

  return v11;
}

- (NSData)data
{
  v2 = [(MRGroupTopologyModificationRequest *)self protobuf];
  id v3 = [v2 data];

  return (NSData *)v3;
}

- (_MRGroupTopologyModificationRequestProtobuf)protobuf
{
  id v3 = objc_alloc_init(_MRGroupTopologyModificationRequestProtobuf);
  id v4 = [(MRRequestDetails *)self->_requestDetails protobuf];
  [(_MRGroupTopologyModificationRequestProtobuf *)v3 setDetails:v4];

  [(_MRGroupTopologyModificationRequestProtobuf *)v3 setType:LODWORD(self->_type)];
  if ([(NSArray *)self->_outputDevices count])
  {
    id v5 = [(NSArray *)self->_outputDevices msv_compactMap:&__block_literal_global_30_0];
    id v6 = (void *)[v5 mutableCopy];
    [(_MRGroupTopologyModificationRequestProtobuf *)v3 setOutputDeviceUIDs:v6];
  }
  else
  {
    id v5 = (void *)[(NSArray *)self->_outputDeviceUIDs mutableCopy];
    [(_MRGroupTopologyModificationRequestProtobuf *)v3 setOutputDeviceUIDs:v5];
  }

  [(_MRGroupTopologyModificationRequestProtobuf *)v3 setFadeAudio:self->_fadeAudio];
  [(_MRGroupTopologyModificationRequestProtobuf *)v3 setShouldNotPauseIfLastDeviceRemoved:self->_shouldNotPauseIfLastDeviceRemoved];
  [(_MRGroupTopologyModificationRequestProtobuf *)v3 setSuppressErrorDialog:self->_suppressErrorDialog];
  [(_MRGroupTopologyModificationRequestProtobuf *)v3 setMuteUntilFinished:self->_muteUntilFinished];
  [(_MRGroupTopologyModificationRequestProtobuf *)v3 setShouldModifyPredictedRoutes:self->_shouldModifyPredictedRoutes];
  [(_MRGroupTopologyModificationRequestProtobuf *)v3 setShouldClearPredictedRoutes:self->_shouldClearPredictedRoutes];

  return v3;
}

uint64_t __46__MRGroupTopologyModificationRequest_protobuf__block_invoke(uint64_t a1, void *a2)
{
  return [a2 uid];
}

+ (BOOL)_initiatorShouldClearPredictedRoutesByDefault:(id)a3 forModificationType:(unint64_t)a4
{
  int v5 = [a3 isEqualToString:@"RoutePicker"] ^ 1;
  if (a4 == 3) {
    return v5;
  }
  else {
    return 0;
  }
}

- (MRRequestDetails)requestDetails
{
  return self->_requestDetails;
}

- (NSArray)outputDeviceUIDs
{
  return self->_outputDeviceUIDs;
}

- (NSArray)outputDevices
{
  return self->_outputDevices;
}

- (unint64_t)type
{
  return self->_type;
}

- (BOOL)fadeAudio
{
  return self->_fadeAudio;
}

- (void)setFadeAudio:(BOOL)a3
{
  self->_fadeAudio = a3;
}

- (NSString)password
{
  return self->_password;
}

- (void)setPassword:(id)a3
{
  self->_password = (NSString *)a3;
}

- (BOOL)shouldNotPauseIfLastDeviceRemoved
{
  return self->_shouldNotPauseIfLastDeviceRemoved;
}

- (void)setShouldNotPauseIfLastDeviceRemoved:(BOOL)a3
{
  self->_shouldNotPauseIfLastDeviceRemoved = a3;
}

- (BOOL)suppressErrorDialog
{
  return self->_suppressErrorDialog;
}

- (void)setSuppressErrorDialog:(BOOL)a3
{
  self->_suppressErrorDialog = a3;
}

- (BOOL)muteUntilFinished
{
  return self->_muteUntilFinished;
}

- (void)setMuteUntilFinished:(BOOL)a3
{
  self->_muteUntilFinished = a3;
}

- (BOOL)shouldModifyPredictedRoutes
{
  return self->_shouldModifyPredictedRoutes;
}

- (void)setShouldModifyPredictedRoutes:(BOOL)a3
{
  self->_shouldModifyPredictedRoutes = a3;
}

- (BOOL)shouldClearPredictedRoutes
{
  return self->_shouldClearPredictedRoutes;
}

- (void)setShouldClearPredictedRoutes:(BOOL)a3
{
  self->_shouldClearPredictedRoutes = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_outputDevices, 0);
  objc_storeStrong((id *)&self->_outputDeviceUIDs, 0);

  objc_storeStrong((id *)&self->_requestDetails, 0);
}

@end