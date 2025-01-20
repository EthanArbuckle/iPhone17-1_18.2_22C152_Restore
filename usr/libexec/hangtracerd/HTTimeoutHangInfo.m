@interface HTTimeoutHangInfo
- (BOOL)captureMicroHang;
- (BOOL)isThirdPartyDevSupportModeHang;
- (BOOL)saveTailspin;
- (HTProcessInfo)processInfo;
- (HTTimeoutHangInfo)initWithServiceName:(id)a3 threadID:(unint64_t)a4 startTime:(unint64_t)a5 endTime:(unint64_t)a6 saveTailspin:(BOOL)a7 subType:(int64_t)a8 userActionData:(id)a9 isThirdPartyDevSupportModeHang:(BOOL)a10 processInfo:(id)a11 captureMicroHang:(BOOL)a12;
- (NSData)userActionData;
- (NSString)serviceName;
- (int64_t)subtype;
- (unint64_t)endTime;
- (unint64_t)startTime;
- (unint64_t)threadID;
- (void)recordHang;
@end

@implementation HTTimeoutHangInfo

- (HTTimeoutHangInfo)initWithServiceName:(id)a3 threadID:(unint64_t)a4 startTime:(unint64_t)a5 endTime:(unint64_t)a6 saveTailspin:(BOOL)a7 subType:(int64_t)a8 userActionData:(id)a9 isThirdPartyDevSupportModeHang:(BOOL)a10 processInfo:(id)a11 captureMicroHang:(BOOL)a12
{
  id v18 = a3;
  id v19 = a9;
  id v20 = a11;
  v27.receiver = self;
  v27.super_class = (Class)HTTimeoutHangInfo;
  v21 = [(HTTimeoutHangInfo *)&v27 init];
  if (v21)
  {
    v22 = (NSString *)[v18 copy];
    serviceName = v21->_serviceName;
    v21->_serviceName = v22;

    v21->_threadID = a4;
    v21->_startTime = a5;
    v21->_saveTailspin = a7;
    v21->_endTime = a6;
    v21->_subtype = a8;
    v24 = (NSData *)[v19 copy];
    userActionData = v21->_userActionData;
    v21->_userActionData = v24;

    v21->_isThirdPartyDevSupportModeHang = a10;
    objc_storeStrong((id *)&v21->_processInfo, a11);
    v21->_captureMicroHang = a12;
  }

  return v21;
}

- (void)recordHang
{
  id v12 = [(HTTimeoutHangInfo *)self processInfo];
  v3 = [(HTTimeoutHangInfo *)self serviceName];
  unint64_t v4 = [(HTTimeoutHangInfo *)self threadID];
  unint64_t v5 = [(HTTimeoutHangInfo *)self startTime];
  unint64_t v6 = [(HTTimeoutHangInfo *)self endTime];
  BOOL v7 = [(HTTimeoutHangInfo *)self saveTailspin];
  int64_t v8 = [(HTTimeoutHangInfo *)self subtype];
  v9 = [(HTTimeoutHangInfo *)self userActionData];
  unsigned __int8 v10 = [(HTTimeoutHangInfo *)self isThirdPartyDevSupportModeHang];
  BYTE1(v11) = [(HTTimeoutHangInfo *)self captureMicroHang];
  LOBYTE(v11) = v10;
  [v12 recordHang:v3 threadID:v4 startTime:v5 endTime:v6 saveTailspin:v7 subtype:v8 userActionData:v9 isThirdPartyDevSupportModeHang:v11 captureMicroHang:];
}

- (NSString)serviceName
{
  return self->_serviceName;
}

- (unint64_t)threadID
{
  return self->_threadID;
}

- (unint64_t)startTime
{
  return self->_startTime;
}

- (unint64_t)endTime
{
  return self->_endTime;
}

- (BOOL)saveTailspin
{
  return self->_saveTailspin;
}

- (int64_t)subtype
{
  return self->_subtype;
}

- (NSData)userActionData
{
  return self->_userActionData;
}

- (BOOL)isThirdPartyDevSupportModeHang
{
  return self->_isThirdPartyDevSupportModeHang;
}

- (HTProcessInfo)processInfo
{
  return self->_processInfo;
}

- (BOOL)captureMicroHang
{
  return self->_captureMicroHang;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_processInfo, 0);
  objc_storeStrong((id *)&self->_userActionData, 0);

  objc_storeStrong((id *)&self->_serviceName, 0);
}

@end