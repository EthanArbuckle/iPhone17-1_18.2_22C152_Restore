@interface ABSSyContainer
- (ABSPBSyncObject)pbObject;
- (ABSSyContainer)initWithData:(id)a3;
- (NSString)objectIdentifier;
- (NSString)sequencer;
- (int64_t)changeType;
- (void)setChangeType:(int64_t)a3;
@end

@implementation ABSSyContainer

- (ABSSyContainer)initWithData:(id)a3
{
  id v4 = a3;
  v22.receiver = self;
  v22.super_class = (Class)ABSSyContainer;
  v5 = [(ABSSyContainer *)&v22 init];
  if (v5)
  {
    v6 = [[ABSPBSyncObject alloc] initWithData:v4];
    pbObject = v5->_pbObject;
    v5->_pbObject = v6;

    double v8 = -1.0;
    if ([(ABSPBSyncObject *)v5->_pbObject hasSendTimestamp])
    {
      v9 = +[NSDate date];
      [v9 timeIntervalSinceReferenceDate];
      double v11 = v10;
      [(ABSPBSyncObject *)v5->_pbObject sendTimestamp];
      double v8 = v11 - v12;
    }
    if ([(ABSPBSyncObject *)v5->_pbObject hasSequenceNumber])
    {
      os_unfair_lock_lock(&stru_100069D1C);
      int v13 = [(ABSPBSyncObject *)v5->_pbObject sequenceNumber];
      unsigned int v14 = [(ABSPBSyncObject *)v5->_pbObject sequenceNumber];
      unsigned __int16 v15 = v14;
      BOOL v16 = dword_1000699E0 == 0x80000000 || v13 < 0;
      unsigned int v17 = v14 & 0x7FFFFFFF;
      int v18 = (dword_1000699E0 + 1) & 0x7FFFFFFF;
      if (v16) {
        int v18 = v14 & 0x7FFFFFFF;
      }
      dword_1000699E0 = v18;
      v19 = *(NSObject **)(qword_100069D78 + 8);
      if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 67109632;
        unsigned int v24 = HIWORD(v17);
        __int16 v25 = 1024;
        int v26 = v15;
        __int16 v27 = 2048;
        double v28 = v8;
        _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_DEFAULT, "receive R_PKT_NUM: %04x_%04x T: %f", buf, 0x18u);
      }
      if (dword_1000699E0 != v17)
      {
        v20 = *(NSObject **)(qword_100069D78 + 8);
        if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR)) {
          sub_100038550(v20);
        }
        dword_1000699E0 = v17;
      }
      os_unfair_lock_unlock(&stru_100069D1C);
    }
  }

  return v5;
}

- (NSString)objectIdentifier
{
  return (NSString *)&stru_100055F00;
}

- (NSString)sequencer
{
  return 0;
}

- (ABSPBSyncObject)pbObject
{
  return self->_pbObject;
}

- (int64_t)changeType
{
  return self->_changeType;
}

- (void)setChangeType:(int64_t)a3
{
  self->_changeType = a3;
}

- (void).cxx_destruct
{
}

@end