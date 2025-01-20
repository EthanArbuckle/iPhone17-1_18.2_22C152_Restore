@interface MRUpdateActiveSystemEndpointRequest
- (BOOL)demoteWhenSyncingToCompanion;
- (BOOL)isPairedDeviceSync;
- (BOOL)suppressPairedDeviceSync;
- (MRUpdateActiveSystemEndpointRequest)initWithOutputDeviceUID:(id)a3 reason:(id)a4;
- (MRUpdateActiveSystemEndpointRequest)initWithOutputDeviceUID:(id)a3 type:(int64_t)a4 reason:(id)a5;
- (MRUpdateActiveSystemEndpointRequest)initWithProtobuf:(id)a3;
- (NSString)clientBundleIdentifier;
- (NSString)outputDeviceUID;
- (NSString)reason;
- (_MRUpdateActiveSystemEndpointRequestProtobuf)protobuf;
- (double)disableDuration;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (int64_t)changeType;
- (int64_t)type;
- (void)perform:(id)a3 completion:(id)a4;
- (void)setChangeType:(int64_t)a3;
- (void)setClientBundleIdentifier:(id)a3;
- (void)setDemoteWhenSyncingToCompanion:(BOOL)a3;
- (void)setDisableDuration:(double)a3;
- (void)setOutputDeviceUID:(id)a3;
- (void)setPairedDeviceSync:(BOOL)a3;
- (void)setReason:(id)a3;
- (void)setSuppressPairedDeviceSync:(BOOL)a3;
- (void)setType:(int64_t)a3;
@end

@implementation MRUpdateActiveSystemEndpointRequest

- (MRUpdateActiveSystemEndpointRequest)initWithOutputDeviceUID:(id)a3 type:(int64_t)a4 reason:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  v16.receiver = self;
  v16.super_class = (Class)MRUpdateActiveSystemEndpointRequest;
  v10 = [(MRUpdateActiveSystemEndpointRequest *)&v16 init];
  if (v10)
  {
    uint64_t v11 = [v8 copy];
    outputDeviceUID = v10->_outputDeviceUID;
    v10->_outputDeviceUID = (NSString *)v11;

    uint64_t v13 = [v9 copy];
    reason = v10->_reason;
    v10->_reason = (NSString *)v13;

    v10->_type = a4;
  }

  return v10;
}

- (MRUpdateActiveSystemEndpointRequest)initWithOutputDeviceUID:(id)a3 reason:(id)a4
{
  return [(MRUpdateActiveSystemEndpointRequest *)self initWithOutputDeviceUID:a3 type:0 reason:a4];
}

- (MRUpdateActiveSystemEndpointRequest)initWithProtobuf:(id)a3
{
  id v4 = a3;
  v14.receiver = self;
  v14.super_class = (Class)MRUpdateActiveSystemEndpointRequest;
  v5 = [(MRUpdateActiveSystemEndpointRequest *)&v14 init];
  if (v5)
  {
    v6 = [v4 outputDeviceUID];
    uint64_t v7 = [v6 copy];
    outputDeviceUID = v5->_outputDeviceUID;
    v5->_outputDeviceUID = (NSString *)v7;

    v5->_changeType = (int)[v4 changeType];
    id v9 = [v4 reason];
    uint64_t v10 = [v9 copy];
    reason = v5->_reason;
    v5->_reason = (NSString *)v10;

    v5->_pairedDeviceSync = [v4 pairedDeviceSync];
    v5->_type = [v4 type];
    [v4 disableDuration];
    v5->_disableDuration = v12;
    v5->_demoteWhenSyncingToCompanion = [v4 demoteWhenSyncingToCompanion];
  }

  return v5;
}

- (_MRUpdateActiveSystemEndpointRequestProtobuf)protobuf
{
  v3 = objc_alloc_init(_MRUpdateActiveSystemEndpointRequestProtobuf);
  id v4 = [(MRUpdateActiveSystemEndpointRequest *)self outputDeviceUID];
  [(_MRUpdateActiveSystemEndpointRequestProtobuf *)v3 setOutputDeviceUID:v4];

  [(_MRUpdateActiveSystemEndpointRequestProtobuf *)v3 setChangeType:[(MRUpdateActiveSystemEndpointRequest *)self changeType]];
  v5 = [(MRUpdateActiveSystemEndpointRequest *)self reason];
  [(_MRUpdateActiveSystemEndpointRequestProtobuf *)v3 setReason:v5];

  [(_MRUpdateActiveSystemEndpointRequestProtobuf *)v3 setPairedDeviceSync:[(MRUpdateActiveSystemEndpointRequest *)self isPairedDeviceSync]];
  [(_MRUpdateActiveSystemEndpointRequestProtobuf *)v3 setType:[(MRUpdateActiveSystemEndpointRequest *)self type]];
  [(MRUpdateActiveSystemEndpointRequest *)self disableDuration];
  -[_MRUpdateActiveSystemEndpointRequestProtobuf setDisableDuration:](v3, "setDisableDuration:");
  [(_MRUpdateActiveSystemEndpointRequestProtobuf *)v3 setDemoteWhenSyncingToCompanion:[(MRUpdateActiveSystemEndpointRequest *)self demoteWhenSyncingToCompanion]];

  return v3;
}

- (id)description
{
  v3 = [(MRUpdateActiveSystemEndpointRequest *)self outputDeviceUID];
  id v4 = @"Update";
  if (!v3) {
    id v4 = @"Clear";
  }
  v5 = v4;

  int64_t v6 = [(MRUpdateActiveSystemEndpointRequest *)self changeType];
  uint64_t v7 = @"Deferrable";
  if (v6 != 1) {
    uint64_t v7 = 0;
  }
  if (v6) {
    id v8 = v7;
  }
  else {
    id v8 = @"Immediate";
  }
  id v9 = (void *)[(__CFString *)v8 copy];
  unint64_t v10 = [(MRUpdateActiveSystemEndpointRequest *)self type];
  uint64_t v11 = 0;
  if (v10 <= 5) {
    uint64_t v11 = off_1E57D76F0[v10];
  }
  double v12 = (void *)[(__CFString *)v11 copy];
  id v13 = [NSString alloc];
  objc_super v14 = [(MRUpdateActiveSystemEndpointRequest *)self outputDeviceUID];
  v15 = [(MRUpdateActiveSystemEndpointRequest *)self clientBundleIdentifier];
  objc_super v16 = [(MRUpdateActiveSystemEndpointRequest *)self reason];
  if ([(MRUpdateActiveSystemEndpointRequest *)self demoteWhenSyncingToCompanion]) {
    v17 = @"YES";
  }
  else {
    v17 = @"NO";
  }
  [(MRUpdateActiveSystemEndpointRequest *)self disableDuration];
  v19 = (void *)[v13 initWithFormat:@"outputDevice = <%@>, client = <%@>, reason = <%@>, operation = <%@>, changeType = <%@>, type = <%@>, demote = <%@> disableDuration = <%lf>", v14, v15, v16, v5, v9, v12, v17, v18];

  return v19;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v5 = objc_alloc_init((Class)objc_opt_class());
  int64_t v6 = [(MRUpdateActiveSystemEndpointRequest *)self outputDeviceUID];
  uint64_t v7 = (void *)[v6 copyWithZone:a3];
  [v5 setOutputDeviceUID:v7];

  objc_msgSend(v5, "setChangeType:", -[MRUpdateActiveSystemEndpointRequest changeType](self, "changeType"));
  id v8 = [(MRUpdateActiveSystemEndpointRequest *)self reason];
  id v9 = (void *)[v8 copyWithZone:a3];
  [v5 setReason:v9];

  unint64_t v10 = [(MRUpdateActiveSystemEndpointRequest *)self clientBundleIdentifier];
  uint64_t v11 = (void *)[v10 copyWithZone:a3];
  [v5 setClientBundleIdentifier:v11];

  objc_msgSend(v5, "setPairedDeviceSync:", -[MRUpdateActiveSystemEndpointRequest isPairedDeviceSync](self, "isPairedDeviceSync"));
  objc_msgSend(v5, "setSuppressPairedDeviceSync:", -[MRUpdateActiveSystemEndpointRequest suppressPairedDeviceSync](self, "suppressPairedDeviceSync"));
  objc_msgSend(v5, "setDemoteWhenSyncingToCompanion:", -[MRUpdateActiveSystemEndpointRequest demoteWhenSyncingToCompanion](self, "demoteWhenSyncingToCompanion"));
  objc_msgSend(v5, "setType:", -[MRUpdateActiveSystemEndpointRequest type](self, "type"));
  [(MRUpdateActiveSystemEndpointRequest *)self disableDuration];
  objc_msgSend(v5, "setDisableDuration:");
  return v5;
}

- (void)perform:(id)a3 completion:(id)a4
{
  uint64_t v41 = *MEMORY[0x1E4F143B8];
  id v6 = a4;
  uint64_t v7 = (void *)MEMORY[0x1E4F1C9C8];
  id v8 = a3;
  id v9 = [v7 date];
  unint64_t v10 = [MEMORY[0x1E4F29128] UUID];
  uint64_t v11 = [v10 UUIDString];

  double v12 = [(MRUpdateActiveSystemEndpointRequest *)self outputDeviceUID];
  id v13 = [NSString alloc];
  objc_super v14 = [(MRUpdateActiveSystemEndpointRequest *)self outputDeviceUID];
  if (v14) {
    v15 = @"Update";
  }
  else {
    v15 = @"Clear";
  }
  objc_super v16 = (void *)[@"UserSelected" copy];
  v17 = (void *)[v13 initWithFormat:@"%@%@ActiveEndpoint", v15, v16];

  uint64_t v18 = (void *)[objc_alloc(MEMORY[0x1E4F28E78]) initWithFormat:@"%@<%@>", v17, v11];
  v19 = v18;
  if (v12) {
    [v18 appendFormat:@" for %@", v12];
  }
  v20 = [(MRUpdateActiveSystemEndpointRequest *)self reason];

  if (v20)
  {
    v21 = [(MRUpdateActiveSystemEndpointRequest *)self reason];
    [v19 appendFormat:@" because %@", v21];
  }
  v22 = _MRLogForCategory(0xAuLL);
  if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    v40 = v19;
    _os_log_impl(&dword_194F3C000, v22, OS_LOG_TYPE_DEFAULT, "Request: %{public}@", buf, 0xCu);
  }

  v23 = [(MRUpdateActiveSystemEndpointRequest *)self clientBundleIdentifier];

  if (!v23)
  {
    v24 = [MEMORY[0x1E4F28B50] mainBundle];
    v25 = [v24 bundleIdentifier];
    [(MRUpdateActiveSystemEndpointRequest *)self setClientBundleIdentifier:v25];
  }
  v26 = [[MRUpdateActiveSystemEndpointMessage alloc] initWithRequest:self];
  v27 = (void *)MRGetSharedService();
  v33[0] = MEMORY[0x1E4F143A8];
  v33[1] = 3221225472;
  v33[2] = __58__MRUpdateActiveSystemEndpointRequest_perform_completion___block_invoke;
  v33[3] = &unk_1E57D7680;
  id v34 = v12;
  id v35 = v17;
  id v36 = v11;
  id v37 = v9;
  id v38 = v6;
  id v28 = v6;
  id v29 = v9;
  id v30 = v11;
  id v31 = v17;
  id v32 = v12;
  MRMediaRemoteServiceUpdateActiveSystemEndpointUID(v27, v26, v8, v33);
}

void __58__MRUpdateActiveSystemEndpointRequest_perform_completion___block_invoke(void *a1, void *a2)
{
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  uint64_t v4 = a1[4];
  id v5 = _MRLogForCategory(0xAuLL);
  id v6 = v5;
  if (!v3)
  {
    BOOL v13 = os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT);
    if (v4)
    {
      if (!v13) {
        goto LABEL_14;
      }
      uint64_t v15 = a1[5];
      uint64_t v14 = a1[6];
      objc_super v16 = (void *)a1[4];
      uint64_t v11 = [MEMORY[0x1E4F1C9C8] date];
      [v11 timeIntervalSinceDate:a1[7]];
      int v25 = 138544130;
      uint64_t v26 = v15;
      __int16 v27 = 2114;
      uint64_t v28 = v14;
      __int16 v29 = 2114;
      id v30 = v16;
      __int16 v31 = 2048;
      uint64_t v32 = v17;
      uint64_t v18 = "Response: %{public}@<%{public}@> returned for %{public}@ in %.4lf seconds";
      v19 = v6;
      uint32_t v20 = 42;
    }
    else
    {
      if (!v13) {
        goto LABEL_14;
      }
      uint64_t v21 = a1[5];
      uint64_t v22 = a1[6];
      uint64_t v11 = [MEMORY[0x1E4F1C9C8] date];
      [v11 timeIntervalSinceDate:a1[7]];
      int v25 = 138543874;
      uint64_t v26 = v21;
      __int16 v27 = 2114;
      uint64_t v28 = v22;
      __int16 v29 = 2048;
      id v30 = v23;
      uint64_t v18 = "Response: %{public}@<%{public}@> returned in %.4lf seconds";
      v19 = v6;
      uint32_t v20 = 32;
    }
    _os_log_impl(&dword_194F3C000, v19, OS_LOG_TYPE_DEFAULT, v18, (uint8_t *)&v25, v20);
    goto LABEL_13;
  }
  BOOL v7 = os_log_type_enabled(v5, OS_LOG_TYPE_ERROR);
  if (v4)
  {
    if (!v7) {
      goto LABEL_14;
    }
    uint64_t v9 = a1[5];
    uint64_t v8 = a1[6];
    uint64_t v10 = a1[4];
    uint64_t v11 = [MEMORY[0x1E4F1C9C8] date];
    [v11 timeIntervalSinceDate:a1[7]];
    int v25 = 138544386;
    uint64_t v26 = v9;
    __int16 v27 = 2114;
    uint64_t v28 = v8;
    __int16 v29 = 2114;
    id v30 = v3;
    __int16 v31 = 2114;
    uint64_t v32 = v10;
    __int16 v33 = 2048;
    uint64_t v34 = v12;
    _os_log_error_impl(&dword_194F3C000, v6, OS_LOG_TYPE_ERROR, "Response: %{public}@<%{public}@> returned with error <%{public}@> for %{public}@ in %.4lf seconds", (uint8_t *)&v25, 0x34u);
LABEL_13:

    goto LABEL_14;
  }
  if (v7) {
    __94__MRAVDiscoverySessionHelper_searchAVOutputDeviceForUID_timeout_identifier_reason_completion___block_invoke_cold_1(a1, (uint64_t)v3, v6);
  }
LABEL_14:

  if (a1[8])
  {
    v24 = [[MRUpdateActiveSystemEndpointResponse alloc] initWithError:v3];
    (*(void (**)(void))(a1[8] + 16))();
  }
}

- (NSString)outputDeviceUID
{
  return self->_outputDeviceUID;
}

- (void)setOutputDeviceUID:(id)a3
{
}

- (NSString)reason
{
  return self->_reason;
}

- (void)setReason:(id)a3
{
}

- (int64_t)changeType
{
  return self->_changeType;
}

- (void)setChangeType:(int64_t)a3
{
  self->_changeType = a3;
}

- (NSString)clientBundleIdentifier
{
  return self->_clientBundleIdentifier;
}

- (void)setClientBundleIdentifier:(id)a3
{
}

- (BOOL)isPairedDeviceSync
{
  return self->_pairedDeviceSync;
}

- (void)setPairedDeviceSync:(BOOL)a3
{
  self->_pairedDeviceSync = a3;
}

- (int64_t)type
{
  return self->_type;
}

- (void)setType:(int64_t)a3
{
  self->_type = a3;
}

- (BOOL)demoteWhenSyncingToCompanion
{
  return self->_demoteWhenSyncingToCompanion;
}

- (void)setDemoteWhenSyncingToCompanion:(BOOL)a3
{
  self->_demoteWhenSyncingToCompanion = a3;
}

- (BOOL)suppressPairedDeviceSync
{
  return self->_suppressPairedDeviceSync;
}

- (void)setSuppressPairedDeviceSync:(BOOL)a3
{
  self->_suppressPairedDeviceSync = a3;
}

- (double)disableDuration
{
  return self->_disableDuration;
}

- (void)setDisableDuration:(double)a3
{
  self->_disableDuration = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_clientBundleIdentifier, 0);
  objc_storeStrong((id *)&self->_reason, 0);

  objc_storeStrong((id *)&self->_outputDeviceUID, 0);
}

@end