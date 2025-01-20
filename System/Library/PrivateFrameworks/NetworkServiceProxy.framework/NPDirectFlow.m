@interface NPDirectFlow
+ (void)initializeProtocol;
- (NPDirectFlow)initWithParameters:(id)a3;
- (NSDate)connectionStartDate;
- (NSDate)firstTxByteTimestamp;
- (NSDate)startDate;
- (NSNumber)identifier;
- (NSPConnectionInfo)connectionInfo;
- (nw_protocol)protocol;
- (void)createConnectionInfo;
- (void)handleDetachedFromProtocol;
- (void)setConnectionInfo:(id)a3;
- (void)setConnectionStartDate:(id)a3;
- (void)setFirstTxByteTimestamp:(id)a3;
@end

@implementation NPDirectFlow

+ (void)initializeProtocol
{
  if (_MergedGlobals_31 != -1) {
    dispatch_once(&_MergedGlobals_31, &__block_literal_global_1);
  }
}

- (NPDirectFlow)initWithParameters:(id)a3
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v19.receiver = self;
  v19.super_class = (Class)NPDirectFlow;
  v5 = [(NPDirectFlow *)&v19 init];
  if (v5)
  {
    v6 = (void *)nw_parameters_copy_metadata();
    if (v6)
    {
      id v7 = objc_alloc(MEMORY[0x1E4F1C9B8]);
      bytes_ptr = xpc_data_get_bytes_ptr(v6);
      v9 = [v7 initWithBytesNoCopy:bytes_ptr length:xpc_data_get_length(v6) freeWhenDone:0];
      v10 = createPropertiesFromMetaData(v9);
      v11 = v10;
      if (v10)
      {
        uint64_t v12 = objc_msgSend(NSNumber, "numberWithUnsignedInt:", objc_msgSend(v10, "flowIdentifier"));
        v13 = (void *)*((void *)v5 + 9);
        *((void *)v5 + 9) = v12;

        v14 = nplog_obj();
        if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
        {
          uint64_t v15 = *((void *)v5 + 9);
          *(_DWORD *)buf = 138412290;
          uint64_t v21 = v15;
          _os_log_impl(&dword_1A0FEE000, v14, OS_LOG_TYPE_DEFAULT, "Created direct flow with identifier %@", buf, 0xCu);
        }
      }
      else
      {
        v14 = nplog_obj();
        if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
        {
          *(_WORD *)buf = 0;
          _os_log_error_impl(&dword_1A0FEE000, v14, OS_LOG_TYPE_ERROR, "Failed to create properties dictionary from flow metadata", buf, 2u);
        }
      }
    }
    else
    {
      v9 = nplog_obj();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_error_impl(&dword_1A0FEE000, v9, OS_LOG_TYPE_ERROR, "Direct flow has no metadata", buf, 2u);
      }
    }

    *(_OWORD *)(v5 + 24) = 0u;
    *(_OWORD *)(v5 + 56) = 0u;
    *(_OWORD *)(v5 + 40) = 0u;
    *(_OWORD *)(v5 + 8) = 0u;
    *((void *)v5 + 3) = &xmmword_1EB53BC08;
    *((void *)v5 + 4) = &xmmword_1EB53BC30;
    id v16 = objc_alloc_init(MEMORY[0x1E4F1C9C8]);
    v17 = (void *)*((void *)v5 + 11);
    *((void *)v5 + 11) = v16;
  }
  return (NPDirectFlow *)v5;
}

- (nw_protocol)protocol
{
  return &self->_protocol;
}

- (void)handleDetachedFromProtocol
{
  v3 = [(NPDirectFlow *)self connectionInfo];

  if (v3)
  {
    id v6 = +[NSPManager sharedManager];
    id v4 = [(NPDirectFlow *)self connectionInfo];
    v5 = [(NPDirectFlow *)self identifier];
    [v6 setConnectionInfo:v4 forIdentifier:v5];
  }
}

- (void)createConnectionInfo
{
  uint64_t v3 = (uint64_t)[(NPDirectFlow *)self protocol][48];
  uint64_t v4 = (uint64_t)[(NPDirectFlow *)self protocol][32];
  if (v3) {
    BOOL v5 = v4 == 0;
  }
  else {
    BOOL v5 = 1;
  }
  if (!v5)
  {
    (*(void (**)(uint64_t))(*(void *)(v3 + 24) + 120))(v3);
    id v32 = (id)objc_claimAutoreleasedReturnValue();
    id v6 = (*(void (**)(uint64_t))(*(void *)(v3 + 24) + 112))(v3);
    id v7 = *(void (**)(uint64_t))(*(void *)(v4 + 24) + 208);
    if (v7)
    {
      v8 = v7(v4);
    }
    else
    {
      v8 = 0;
    }
    v9 = (*(void (**)(uint64_t))(*(void *)(v3 + 24) + 136))(v3);
    v10 = [(NPDirectFlow *)self connectionInfo];

    if (!v10)
    {
      v11 = +[NSPManager sharedManager];
      uint64_t v12 = [(NPDirectFlow *)self identifier];
      v13 = [v11 getConnectionInfoForIdentifier:v12];
      [(NPDirectFlow *)self setConnectionInfo:v13];

      v14 = [(NPDirectFlow *)self connectionInfo];

      if (!v14)
      {
        uint64_t v15 = objc_alloc_init(NSPConnectionInfo);
        [(NPDirectFlow *)self setConnectionInfo:v15];
      }
    }
    id v16 = [(NPDirectFlow *)self connectionInfo];
    +[NPUtilities fillOutConnectionInfo:v16 withPath:v32 interface:v8 remoteEndpoint:v9 parameters:v6 outputHandler:v4];

    v17 = [(NPDirectFlow *)self connectionInfo];
    [v17 setPathType:2];

    v18 = [(NPDirectFlow *)self connectionStartDate];

    if (v18)
    {
      objc_super v19 = [(NPDirectFlow *)self startDate];
      v20 = [(NPDirectFlow *)self connectionStartDate];
      [v19 timeIntervalSinceDate:v20];
      double v22 = v21;

      if (v22 < 0.0)
      {
        v23 = [(NPDirectFlow *)self connectionInfo];
        [v23 setConnectionDelay:v22 * -1000.0];
      }
    }
    v24 = [(NPDirectFlow *)self firstTxByteTimestamp];
    v25 = [(NPDirectFlow *)self connectionInfo];
    [v25 setFirstTxByteTimeStamp:v24];

    v26 = [(NPDirectFlow *)self firstTxByteTimestamp];

    if (v26)
    {
      v27 = [(NPDirectFlow *)self startDate];
      v28 = [(NPDirectFlow *)self firstTxByteTimestamp];
      [v27 timeIntervalSinceDate:v28];
      double v30 = v29;

      if (v30 < 0.0)
      {
        v31 = [(NPDirectFlow *)self connectionInfo];
        [v31 setFirstTxByteDelay:v30 * -1000.0];
      }
    }
  }
}

- (NSNumber)identifier
{
  return (NSNumber *)objc_getProperty(self, a2, 72, 1);
}

- (NSPConnectionInfo)connectionInfo
{
  return (NSPConnectionInfo *)objc_getProperty(self, a2, 80, 1);
}

- (void)setConnectionInfo:(id)a3
{
}

- (NSDate)startDate
{
  return (NSDate *)objc_getProperty(self, a2, 88, 1);
}

- (NSDate)connectionStartDate
{
  return (NSDate *)objc_getProperty(self, a2, 96, 1);
}

- (void)setConnectionStartDate:(id)a3
{
}

- (NSDate)firstTxByteTimestamp
{
  return (NSDate *)objc_getProperty(self, a2, 104, 1);
}

- (void)setFirstTxByteTimestamp:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_firstTxByteTimestamp, 0);
  objc_storeStrong((id *)&self->_connectionStartDate, 0);
  objc_storeStrong((id *)&self->_startDate, 0);
  objc_storeStrong((id *)&self->_connectionInfo, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
}

@end