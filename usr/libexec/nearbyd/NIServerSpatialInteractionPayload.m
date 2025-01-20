@interface NIServerSpatialInteractionPayload
- (BOOL)findingEnabled;
- (BOOL)presenceConfigEnabled;
- (NIServerSpatialInteractionPayload)initWithPresenceConfigData:(id)a3;
- (NIServerSpatialInteractionPayload)initWithUWBConfigData:(id)a3;
- (id)_initWithUWBConfigData:(id)a3 presenceConfigData:(id)a4;
- (unsigned)findingConfig;
- (unsigned)findingConfig2;
- (unsigned)findingStatus;
- (unsigned)handOrFaceDetection;
- (unsigned)regionPresenceDetection;
- (void)_parseUWBData:(id)a3 presenceData:(id)a4;
@end

@implementation NIServerSpatialInteractionPayload

- (NIServerSpatialInteractionPayload)initWithUWBConfigData:(id)a3
{
  return (NIServerSpatialInteractionPayload *)[(NIServerSpatialInteractionPayload *)self _initWithUWBConfigData:a3 presenceConfigData:0];
}

- (NIServerSpatialInteractionPayload)initWithPresenceConfigData:(id)a3
{
  return (NIServerSpatialInteractionPayload *)[(NIServerSpatialInteractionPayload *)self _initWithUWBConfigData:0 presenceConfigData:a3];
}

- (id)_initWithUWBConfigData:(id)a3 presenceConfigData:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v11.receiver = self;
  v11.super_class = (Class)NIServerSpatialInteractionPayload;
  v8 = [(NIServerSpatialInteractionPayload *)&v11 init];
  v9 = v8;
  if (v8)
  {
    *(_DWORD *)(v8 + 11) = 0;
    *((_DWORD *)v8 + 2) = 0;
    [v8 _parseUWBData:v6 presenceData:v7];
  }

  return v9;
}

- (void)_parseUWBData:(id)a3 presenceData:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = qword_1008ABDE0;
  if (os_log_type_enabled((os_log_t)qword_1008ABDE0, OS_LOG_TYPE_DEBUG))
  {
    sub_100424C84((uint64_t)v6, (uint64_t)v7, v8);
    if (!v6) {
      goto LABEL_8;
    }
  }
  else if (!v6)
  {
    goto LABEL_8;
  }
  if ((unint64_t)[v6 length] >= 5)
  {
    [v6 getBytes:v10 length:5];
    if (v10[0])
    {
      self->_findingEnabled = 1;
      self->_findingStatus = v10[1];
      *(_WORD *)&self->_findingConfig = v11;
    }
    v9 = qword_1008ABDE0;
    if (os_log_type_enabled((os_log_t)qword_1008ABDE0, OS_LOG_TYPE_DEBUG)) {
      sub_100424BE4((unsigned __int8 *)self, v9);
    }
  }
LABEL_8:
}

- (BOOL)findingEnabled
{
  return self->_findingEnabled;
}

- (unsigned)findingStatus
{
  return self->_findingStatus;
}

- (unsigned)findingConfig
{
  return self->_findingConfig;
}

- (unsigned)findingConfig2
{
  return self->_findingConfig2;
}

- (BOOL)presenceConfigEnabled
{
  return self->_presenceConfigEnabled;
}

- (unsigned)regionPresenceDetection
{
  return self->_regionPresenceDetection;
}

- (unsigned)handOrFaceDetection
{
  return self->_handOrFaceDetection;
}

@end