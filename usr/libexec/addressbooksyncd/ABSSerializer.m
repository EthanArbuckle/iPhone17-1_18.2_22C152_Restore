@interface ABSSerializer
- (ABSSerializer)initWithOptions:(id)a3;
- (id)changeFromData:(id)a3 ofType:(int64_t)a4;
- (id)dataFromChange:(id)a3;
- (id)decodeChangeData:(id)a3 fromProtocolVersion:(int64_t)a4 ofType:(int64_t)a5;
- (id)encodeSYChangeForBackwardCompatibility:(id)a3 protocolVersion:(int64_t)a4;
@end

@implementation ABSSerializer

- (ABSSerializer)initWithOptions:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)ABSSerializer;
  v5 = [(ABSSerializer *)&v9 init];
  if (v5)
  {
    v6 = (NSDictionary *)[v4 copy];
    options = v5->_options;
    v5->_options = v6;
  }
  return v5;
}

- (id)dataFromChange:(id)a3
{
  id v4 = a3;
  v6 = [v4 createProtobufWithOptions:self->_options];
  if ((unint64_t)[v6 length] > 0x500000)
  {
    v8 = *(NSObject **)(qword_100069D78 + 8);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_FAULT)) {
      sub_1000382A0(v8);
    }
    id v7 = 0;
  }
  else
  {
    id v7 = v6;
  }

  return v7;
}

- (id)changeFromData:(id)a3 ofType:(int64_t)a4
{
  id v5 = a3;
  v6 = [[ABSSyContainer alloc] initWithData:v5];

  if (v6)
  {
    [(ABSSyContainer *)v6 setChangeType:a4];
    id v7 = v6;
  }
  else
  {
    v8 = *(NSObject **)(qword_100069D78 + 8);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_FAULT)) {
      sub_1000382E4(v8);
    }
    id v7 = +[SYDegenerateChange degenerateChange];
  }
  objc_super v9 = v7;

  return v9;
}

- (id)encodeSYChangeForBackwardCompatibility:(id)a3 protocolVersion:(int64_t)a4
{
  return -[ABSSerializer dataFromChange:](self, "dataFromChange:", a3, a4);
}

- (id)decodeChangeData:(id)a3 fromProtocolVersion:(int64_t)a4 ofType:(int64_t)a5
{
  return -[ABSSerializer changeFromData:ofType:](self, "changeFromData:ofType:", a3, 2, a5);
}

- (void).cxx_destruct
{
}

@end