@interface SFMessage
+ (BOOL)supportsSecureCoding;
- (BOOL)expectsResponse;
- (NSData)bodyData;
- (NSDictionary)headerFields;
- (NSSet)deviceIDs;
- (NSUUID)identifier;
- (SFDevice)peerDevice;
- (SFMessage)initWithCoder:(id)a3;
- (SFSession)session;
- (id)completionHandler;
- (id)description;
- (void)encodeWithCoder:(id)a3;
- (void)invalidate;
- (void)setBodyData:(id)a3;
- (void)setCompletionHandler:(id)a3;
- (void)setDeviceIDs:(id)a3;
- (void)setExpectsResponse:(BOOL)a3;
- (void)setHeaderFields:(id)a3;
- (void)setIdentifier:(id)a3;
- (void)setPeerDevice:(id)a3;
- (void)setSession:(id)a3;
@end

@implementation SFMessage

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (SFMessage)initWithCoder:(id)a3
{
  id v4 = a3;
  v34.receiver = self;
  v34.super_class = (Class)SFMessage;
  v5 = [(SFMessage *)&v34 init];
  if (v5)
  {
    if ([v4 containsValueForKey:@"bodyData"])
    {
      uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"bodyData"];
      bodyData = v5->_bodyData;
      v5->_bodyData = (NSData *)v6;
    }
    if ([v4 containsValueForKey:@"deviceIDs"])
    {
      v8 = (void *)MEMORY[0x1E4F1CAD0];
      uint64_t v9 = objc_opt_class();
      v10 = objc_msgSend(v8, "setWithObjects:", v9, objc_opt_class(), 0);
      v11 = [v4 decodeObjectOfClasses:v10 forKey:@"deviceIDs"];
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        v12 = (void *)MEMORY[0x1E4F1CA00];
        uint64_t v13 = *MEMORY[0x1E4F1C3C8];
        v14 = _NSMethodExceptionProem();
        [v12 raise:v13, @"%@: non-set value for key %@ : %@", v14, @"deviceIDs", v11 format];
      }
      objc_storeStrong((id *)&v5->_deviceIDs, v11);
    }
    else
    {
      v10 = 0;
      v11 = 0;
    }
    if ([v4 containsValueForKey:@"expectsResponse"]) {
      v5->_expectsResponse = [v4 decodeBoolForKey:@"expectsResponse"];
    }
    if ([v4 containsValueForKey:@"headerFields"])
    {
      v33 = (void *)MEMORY[0x1E4F1CAD0];
      uint64_t v32 = objc_opt_class();
      uint64_t v15 = objc_opt_class();
      uint64_t v16 = objc_opt_class();
      uint64_t v17 = objc_opt_class();
      uint64_t v18 = objc_opt_class();
      uint64_t v19 = objc_opt_class();
      uint64_t v20 = objc_opt_class();
      uint64_t v21 = objc_msgSend(v33, "setWithObjects:", v32, v15, v16, v17, v18, v19, v20, objc_opt_class(), 0);

      v22 = [v4 decodeObjectOfClasses:v21 forKey:@"headerFields"];

      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        v23 = (void *)MEMORY[0x1E4F1CA00];
        uint64_t v24 = *MEMORY[0x1E4F1C3C8];
        v25 = _NSMethodExceptionProem();
        [v23 raise:v24, @"%@: non-dictionary value for key %@ : %@", v25, @"headerFields", v22 format];
      }
      objc_storeStrong((id *)&v5->_headerFields, v22);
      v10 = (void *)v21;
    }
    else
    {
      v22 = v11;
    }
    if ([v4 containsValueForKey:@"identifier"])
    {
      uint64_t v26 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"identifier"];
      identifier = v5->_identifier;
      v5->_identifier = (NSUUID *)v26;
    }
    if ([v4 containsValueForKey:@"peerDevice"])
    {
      uint64_t v28 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"peerDevice"];
      peerDevice = v5->_peerDevice;
      v5->_peerDevice = (SFDevice *)v28;
    }
    v30 = v5;
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  bodyData = self->_bodyData;
  id v10 = v4;
  if (bodyData)
  {
    [v4 encodeObject:bodyData forKey:@"bodyData"];
    id v4 = v10;
  }
  deviceIDs = self->_deviceIDs;
  if (deviceIDs)
  {
    [v10 encodeObject:deviceIDs forKey:@"deviceIDs"];
    id v4 = v10;
  }
  if (self->_expectsResponse)
  {
    [v10 encodeBool:1 forKey:@"expectsResponse"];
    id v4 = v10;
  }
  headerFields = self->_headerFields;
  if (headerFields)
  {
    [v10 encodeObject:headerFields forKey:@"headerFields"];
    id v4 = v10;
  }
  identifier = self->_identifier;
  if (identifier)
  {
    [v10 encodeObject:identifier forKey:@"identifier"];
    id v4 = v10;
  }
  peerDevice = self->_peerDevice;
  if (peerDevice)
  {
    [v10 encodeObject:peerDevice forKey:@"peerDevice"];
    id v4 = v10;
  }
}

- (id)description
{
  v3 = (objc_class *)objc_opt_class();
  identifier = NSStringFromClass(v3);
  NSAppendPrintF();
  id v4 = 0;

  if (self->_identifier)
  {
    identifier = self->_identifier;
    NSAppendPrintF();
    id v5 = v4;

    id v4 = v5;
  }
  [(NSDictionary *)self->_headerFields count];
  [(NSData *)self->_bodyData length];
  NSAppendPrintF();
  id v6 = v4;

  return v6;
}

- (void)invalidate
{
  id completionHandler = self->_completionHandler;
  self->_id completionHandler = 0;
}

- (NSData)bodyData
{
  return self->_bodyData;
}

- (void)setBodyData:(id)a3
{
}

- (id)completionHandler
{
  return self->_completionHandler;
}

- (void)setCompletionHandler:(id)a3
{
}

- (BOOL)expectsResponse
{
  return self->_expectsResponse;
}

- (void)setExpectsResponse:(BOOL)a3
{
  self->_expectsResponse = a3;
}

- (NSDictionary)headerFields
{
  return self->_headerFields;
}

- (void)setHeaderFields:(id)a3
{
}

- (NSUUID)identifier
{
  return self->_identifier;
}

- (void)setIdentifier:(id)a3
{
}

- (SFDevice)peerDevice
{
  return self->_peerDevice;
}

- (void)setPeerDevice:(id)a3
{
}

- (SFSession)session
{
  return self->_session;
}

- (void)setSession:(id)a3
{
}

- (NSSet)deviceIDs
{
  return self->_deviceIDs;
}

- (void)setDeviceIDs:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_deviceIDs, 0);
  objc_storeStrong((id *)&self->_session, 0);
  objc_storeStrong((id *)&self->_headerFields, 0);
  objc_storeStrong(&self->_completionHandler, 0);
  objc_storeStrong((id *)&self->_bodyData, 0);
  objc_storeStrong((id *)&self->_peerDevice, 0);

  objc_storeStrong((id *)&self->_identifier, 0);
}

@end