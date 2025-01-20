@interface MIBUNFCResponse
- (BOOL)_deserialize:(id)a3;
- (BOOL)rejected;
- (MIBUNFCResponse)init;
- (MIBUNFCResponse)initWithResponsePayload:(id)a3;
- (NSError)error;
- (id)serialize;
- (void)setError:(id)a3;
- (void)setRejected:(BOOL)a3;
@end

@implementation MIBUNFCResponse

- (MIBUNFCResponse)init
{
  v5.receiver = self;
  v5.super_class = (Class)MIBUNFCResponse;
  v2 = [(MIBUNFCResponse *)&v5 init];
  v3 = v2;
  if (v2)
  {
    [(MIBUNFCResponse *)v2 setRejected:0];
    [(MIBUNFCResponse *)v3 setError:0];
  }
  return v3;
}

- (MIBUNFCResponse)initWithResponsePayload:(id)a3
{
  id v4 = a3;
  objc_super v5 = [(MIBUNFCResponse *)self init];
  v6 = v5;
  if (v5 && ![(MIBUNFCResponse *)v5 _deserialize:v4]) {
    v7 = 0;
  }
  else {
    v7 = v6;
  }

  return v7;
}

- (id)serialize
{
  v3 = objc_opt_new();
  id v4 = [(MIBUNFCResponse *)self error];
  unsigned __int8 v5 = [v3 serializeResponseError:v4];

  if (v5)
  {
    v6 = [v3 serializedData];
  }
  else
  {
    if (qword_10006C958 != -1) {
      dispatch_once(&qword_10006C958, &stru_10005BA70);
    }
    v8 = (void *)qword_10006C950;
    if (os_log_type_enabled((os_log_t)qword_10006C950, OS_LOG_TYPE_ERROR)) {
      sub_100040BF4(v8, self);
    }
    v6 = 0;
  }

  return v6;
}

- (BOOL)_deserialize:(id)a3
{
  id v4 = a3;
  unsigned __int8 v5 = [[MIBUDeserializer alloc] initWithData:v4];

  v6 = [(MIBUDeserializer *)v5 deserialize];

  if (!v6)
  {
    if (qword_10006C958 != -1) {
      dispatch_once(&qword_10006C958, &stru_10005BA90);
    }
    v11 = qword_10006C950;
    if (os_log_type_enabled((os_log_t)qword_10006C950, OS_LOG_TYPE_ERROR)) {
      sub_100040C9C(v11, v12, v13, v14, v15, v16, v17, v18);
    }
    goto LABEL_14;
  }
  id v27 = 0;
  unsigned __int8 v7 = [(MIBUDeserializer *)v5 deserializeResponseError:&v27];
  id v8 = v27;
  if ((v7 & 1) == 0)
  {
    if (qword_10006C958 != -1) {
      dispatch_once(&qword_10006C958, &stru_10005BAB0);
    }
    v19 = qword_10006C950;
    if (os_log_type_enabled((os_log_t)qword_10006C950, OS_LOG_TYPE_ERROR)) {
      sub_100040CD4(v19, v20, v21, v22, v23, v24, v25, v26);
    }

LABEL_14:
    BOOL v9 = 0;
    goto LABEL_4;
  }
  [(MIBUNFCResponse *)self setError:v8];

  BOOL v9 = 1;
LABEL_4:

  return v9;
}

- (BOOL)rejected
{
  return self->_rejected;
}

- (void)setRejected:(BOOL)a3
{
  self->_rejected = a3;
}

- (NSError)error
{
  return self->_error;
}

- (void)setError:(id)a3
{
}

- (void).cxx_destruct
{
}

@end