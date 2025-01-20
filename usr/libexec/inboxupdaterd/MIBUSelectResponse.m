@interface MIBUSelectResponse
- (BOOL)_deserialize:(id)a3;
- (MIBUSelectResponse)init;
- (NSNumber)protocolVersion;
- (id)serialize;
- (void)setProtocolVersion:(id)a3;
@end

@implementation MIBUSelectResponse

- (MIBUSelectResponse)init
{
  v5.receiver = self;
  v5.super_class = (Class)MIBUSelectResponse;
  v2 = [(MIBUNFCResponse *)&v5 init];
  v3 = v2;
  if (v2) {
    [(MIBUSelectResponse *)v2 setProtocolVersion:0];
  }
  return v3;
}

- (id)serialize
{
  v3 = objc_opt_new();
  if (![(MIBUNFCResponse *)self rejected])
  {
    v4 = [(MIBUSelectResponse *)self protocolVersion];
    v12 = v4;
    objc_super v5 = +[NSArray arrayWithObjects:&v12 count:1];
    unsigned __int8 v6 = [v3 serialize:&off_100061300 withValue:v5];

    if (v6)
    {
      v7 = [(MIBUNFCResponse *)self error];
      unsigned __int8 v8 = [v3 serializeResponseError:v7];

      if (v8)
      {
        v9 = [v3 serializedData];
        goto LABEL_5;
      }
      if (qword_10006C958 != -1) {
        dispatch_once(&qword_10006C958, &stru_10005BAF0);
      }
      v11 = (void *)qword_10006C950;
      if (os_log_type_enabled((os_log_t)qword_10006C950, OS_LOG_TYPE_ERROR)) {
        sub_10003E31C(v11, self);
      }
    }
    else
    {
      if (qword_10006C958 != -1) {
        dispatch_once(&qword_10006C958, &stru_10005BAD0);
      }
      if (os_log_type_enabled((os_log_t)qword_10006C950, OS_LOG_TYPE_ERROR)) {
        sub_100040D0C();
      }
    }
  }
  v9 = 0;
LABEL_5:

  return v9;
}

- (BOOL)_deserialize:(id)a3
{
  id v4 = a3;
  objc_super v5 = [[MIBUDeserializer alloc] initWithData:v4];

  unsigned __int8 v6 = [(MIBUDeserializer *)v5 deserialize];
  if (!v6)
  {
    if (qword_10006C958 != -1) {
      dispatch_once(&qword_10006C958, &stru_10005BB10);
    }
    if (os_log_type_enabled((os_log_t)qword_10006C950, OS_LOG_TYPE_ERROR)) {
      sub_100040D40();
    }
    goto LABEL_22;
  }
  id v14 = 0;
  unsigned __int8 v7 = [(MIBUDeserializer *)v5 deserializeResponseError:&v14];
  id v8 = v14;
  v9 = v8;
  if ((v7 & 1) == 0)
  {
    if (qword_10006C958 != -1) {
      dispatch_once(&qword_10006C958, &stru_10005BB30);
    }
    if (os_log_type_enabled((os_log_t)qword_10006C950, OS_LOG_TYPE_ERROR)) {
      sub_100040DA8();
    }
    v11 = 0;
    goto LABEL_23;
  }
  if (v8)
  {
    v11 = 0;
    goto LABEL_6;
  }
  uint64_t v10 = [v6 objectForKey:&off_1000604C8];
  if (!v10)
  {
    if (qword_10006C958 != -1) {
      dispatch_once(&qword_10006C958, &stru_10005BB50);
    }
    if (os_log_type_enabled((os_log_t)qword_10006C950, OS_LOG_TYPE_ERROR)) {
      sub_100040D74();
    }
LABEL_22:
    v11 = 0;
    v9 = 0;
LABEL_23:
    BOOL v12 = 0;
    goto LABEL_7;
  }
  v11 = (void *)v10;
  [(MIBUSelectResponse *)self setProtocolVersion:v10];
  v9 = 0;
LABEL_6:
  BOOL v12 = 1;
LABEL_7:
  [(MIBUNFCResponse *)self setError:v9];

  return v12;
}

- (NSNumber)protocolVersion
{
  return self->_protocolVersion;
}

- (void)setProtocolVersion:(id)a3
{
}

- (void).cxx_destruct
{
}

@end