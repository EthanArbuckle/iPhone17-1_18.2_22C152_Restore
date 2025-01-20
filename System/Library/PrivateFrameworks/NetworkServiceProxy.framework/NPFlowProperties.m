@interface NPFlowProperties
- (BOOL)disableIdleTimeout;
- (BOOL)enableNSP;
- (BOOL)isLoopback;
- (NPFlowProperties)initWithTLVData:(id)a3;
- (NPTunnelTuscanyEndpoint)replacementEndpoint;
- (NSData)requestData;
- (NSDictionary)replacementAddressMap;
- (NWEndpoint)directEndpoint;
- (double)fallbackTimeout;
- (id)copyTLVData;
- (int)dataMode;
- (unint64_t)serviceID;
- (unint64_t)timestamps;
- (unsigned)flags;
- (unsigned)flowIdentifier;
- (void)dealloc;
- (void)setDataMode:(int)a3;
- (void)setDirectEndpoint:(id)a3;
- (void)setDisableIdleTimeout:(BOOL)a3;
- (void)setEnableNSP:(BOOL)a3;
- (void)setFallbackTimeout:(double)a3;
- (void)setFlags:(unsigned int)a3;
- (void)setFlowIdentifier:(unsigned int)a3;
- (void)setIsLoopback:(BOOL)a3;
- (void)setReplacementAddressMap:(id)a3;
- (void)setReplacementEndpoint:(id)a3;
- (void)setRequestData:(id)a3;
- (void)setServiceID:(unint64_t)a3;
- (void)setTimestamps:(unint64_t *)a3;
@end

@implementation NPFlowProperties

- (NPFlowProperties)initWithTLVData:(id)a3
{
  id v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)NPFlowProperties;
  v5 = [(NPFlowProperties *)&v10 init];
  if (v5)
  {
    v6 = (void *)[v4 mutableCopy];
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = __36__NPFlowProperties_initWithTLVData___block_invoke;
    v8[3] = &unk_1E5A3BB00;
    v9 = v5;
    -[NSMutableData enumerateTLVsUsingBlock:](v6, v8);
  }
  return v5;
}

uint64_t __36__NPFlowProperties_initWithTLVData___block_invoke(uint64_t a1, int a2, unsigned int a3, long long *a4)
{
  uint64_t v39 = *MEMORY[0x1E4F143B8];
  switch(a2)
  {
    case 1:
      if (a3 == 8) {
        *(void *)(*(void *)(a1 + 32) + 24) = *(void *)a4;
      }
      return 1;
    case 2:
      if (a3 == 4) {
        *(_DWORD *)(*(void *)(a1 + 32) + 8) = *(_DWORD *)a4;
      }
      return 1;
    case 3:
      if (a3 == 8) {
        *(void *)(*(void *)(a1 + 32) + 32) = *(void *)a4;
      }
      return 1;
    case 4:
      if (a3 == 4) {
        *(_DWORD *)(*(void *)(a1 + 32) + 16) = *(_DWORD *)a4;
      }
      return 1;
    case 5:
      uint64_t v6 = [objc_alloc(MEMORY[0x1E4F1C9B8]) initWithBytes:a4 length:a3];
      uint64_t v7 = *(void *)(a1 + 32);
      v8 = *(void **)(v7 + 40);
      *(void *)(v7 + 40) = v6;

      return 1;
    case 6:
      v9 = (void *)[objc_alloc(MEMORY[0x1E4F1C9B8]) initWithBytes:a4 length:a3];
      objc_super v10 = [[NPTunnelTuscanyEndpoint alloc] initWithEncodedData:v9];
      uint64_t v11 = *(void *)(a1 + 32);
      v12 = *(void **)(v11 + 48);
      *(void *)(v11 + 48) = v10;

      goto LABEL_19;
    case 9:
      v9 = (void *)[objc_alloc(MEMORY[0x1E4F1C9B8]) initWithBytesNoCopy:a4 length:a3 freeWhenDone:0];
      id v35 = 0;
      uint64_t v13 = [MEMORY[0x1E4F28DC0] unarchivedObjectOfClass:objc_opt_class() fromData:v9 error:&v35];
      id v14 = v35;
      uint64_t v15 = *(void *)(a1 + 32);
      v16 = *(void **)(v15 + 64);
      *(void *)(v15 + 64) = v13;

      if (!v14) {
        goto LABEL_18;
      }
      v17 = nplog_obj();
      if (!os_log_type_enabled(v17, OS_LOG_TYPE_ERROR)) {
        goto LABEL_17;
      }
      *(_DWORD *)buf = 138412290;
      id v38 = v14;
      v18 = "Failed to decode the direct endpoint: %@";
      break;
    case 10:
      v9 = (void *)[objc_alloc(MEMORY[0x1E4F1C9B8]) initWithBytesNoCopy:a4 length:a3 freeWhenDone:0];
      v19 = (void *)MEMORY[0x1E4F28DC0];
      v20 = (void *)MEMORY[0x1E4F1CAD0];
      uint64_t v21 = objc_opt_class();
      uint64_t v22 = objc_opt_class();
      v23 = objc_msgSend(v20, "setWithObjects:", v21, v22, objc_opt_class(), 0);
      id v36 = 0;
      uint64_t v24 = [v19 unarchivedObjectOfClasses:v23 fromData:v9 error:&v36];
      id v14 = v36;
      uint64_t v25 = *(void *)(a1 + 32);
      v26 = *(void **)(v25 + 56);
      *(void *)(v25 + 56) = v24;

      if (!v14) {
        goto LABEL_18;
      }
      v17 = nplog_obj();
      if (!os_log_type_enabled(v17, OS_LOG_TYPE_ERROR)) {
        goto LABEL_17;
      }
      *(_DWORD *)buf = 138412290;
      id v38 = v14;
      v18 = "Failed to decode the replacement address map: %@";
      break;
    case 11:
      if (a3 == 120)
      {
        v28 = malloc_type_malloc(0x78uLL, 0x723C59F1uLL);
        if (v28)
        {
          long long v29 = *a4;
          long long v30 = a4[1];
          long long v31 = a4[3];
          v28[2] = a4[2];
          v28[3] = v31;
          _OWORD *v28 = v29;
          v28[1] = v30;
          long long v32 = a4[4];
          long long v33 = a4[5];
          long long v34 = a4[6];
          *((void *)v28 + 14) = *((void *)a4 + 14);
          v28[5] = v33;
          v28[6] = v34;
          v28[4] = v32;
          *(void *)(*(void *)(a1 + 32) + 72) = v28;
        }
      }
      return 1;
    default:
      return 1;
  }
  _os_log_error_impl(&dword_1A0FEE000, v17, OS_LOG_TYPE_ERROR, v18, buf, 0xCu);
LABEL_17:

LABEL_18:
LABEL_19:

  return 1;
}

- (void)dealloc
{
  timestamps = self->_timestamps;
  if (timestamps)
  {
    free(timestamps);
    self->_timestamps = 0;
  }
  v4.receiver = self;
  v4.super_class = (Class)NPFlowProperties;
  [(NPFlowProperties *)&v4 dealloc];
}

- (id)copyTLVData
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v3 = objc_alloc_init(MEMORY[0x1E4F1CA58]);
  objc_super v4 = v3;
  if (self->_serviceID) {
    -[NSMutableData appendType:length:value:](v3, 1, 8u, (uint64_t)&self->_serviceID);
  }
  if (self->_flowIdentifier) {
    -[NSMutableData appendType:length:value:](v4, 2, 4u, (uint64_t)&self->_flowIdentifier);
  }
  if (self->_fallbackTimeout > 0.0) {
    -[NSMutableData appendType:length:value:](v4, 3, 8u, (uint64_t)&self->_fallbackTimeout);
  }
  if (self->_flags) {
    -[NSMutableData appendType:length:value:](v4, 4, 4u, (uint64_t)&self->_flags);
  }
  if ([(NSData *)self->_requestData length]) {
    -[NSMutableData appendType:length:value:](v4, 5, [(NSData *)self->_requestData length], (uint64_t)[(NSData *)self->_requestData bytes]);
  }
  if (self->_replacementEndpoint)
  {
    v5 = [(NPFlowProperties *)self replacementEndpoint];
    uint64_t v6 = [v5 encodedData];

    LOWORD(v5) = [v6 length];
    id v7 = v6;
    -[NSMutableData appendType:length:value:](v4, 6, (unsigned __int16)v5, [v7 bytes]);
  }
  if (self->_replacementAddressMap)
  {
    v8 = (void *)MEMORY[0x1E4F28DB0];
    v9 = [(NPFlowProperties *)self replacementAddressMap];
    id v21 = 0;
    objc_super v10 = [v8 archivedDataWithRootObject:v9 requiringSecureCoding:1 error:&v21];
    id v11 = v21;

    if (v10)
    {
      -[NSMutableData appendType:length:value:](v4, 10, [v10 length], objc_msgSend(v10, "bytes"));
    }
    else
    {
      v12 = nplog_obj();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        id v23 = v11;
        _os_log_error_impl(&dword_1A0FEE000, v12, OS_LOG_TYPE_ERROR, "Failed to encode replacement address map: %@", buf, 0xCu);
      }
    }
  }
  if (self->_directEndpoint)
  {
    uint64_t v13 = (void *)MEMORY[0x1E4F28DB0];
    id v14 = [(NPFlowProperties *)self directEndpoint];
    id v20 = 0;
    uint64_t v15 = [v13 archivedDataWithRootObject:v14 requiringSecureCoding:1 error:&v20];
    id v16 = v20;

    if (v15)
    {
      -[NSMutableData appendType:length:value:](v4, 9, [v15 length], objc_msgSend(v15, "bytes"));
    }
    else
    {
      v17 = nplog_obj();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        id v23 = v16;
        _os_log_error_impl(&dword_1A0FEE000, v17, OS_LOG_TYPE_ERROR, "Failed to encode replacement endpoint: %@", buf, 0xCu);
      }
    }
  }
  timestamps = self->_timestamps;
  if (timestamps) {
    -[NSMutableData appendType:length:value:](v4, 11, 0x78u, (uint64_t)timestamps);
  }
  return v4;
}

- (BOOL)enableNSP
{
  return self->_flags & 1;
}

- (void)setEnableNSP:(BOOL)a3
{
  self->_flags = self->_flags & 0xFFFFFFFE | a3;
}

- (BOOL)isLoopback
{
  return (LOBYTE(self->_flags) >> 1) & 1;
}

- (void)setIsLoopback:(BOOL)a3
{
  if (a3) {
    int v3 = 2;
  }
  else {
    int v3 = 0;
  }
  self->_flags = self->_flags & 0xFFFFFFFD | v3;
}

- (BOOL)disableIdleTimeout
{
  return (LOBYTE(self->_flags) >> 2) & 1;
}

- (void)setDisableIdleTimeout:(BOOL)a3
{
  if (a3) {
    int v3 = 4;
  }
  else {
    int v3 = 0;
  }
  self->_flags = self->_flags & 0xFFFFFFFB | v3;
}

- (unint64_t)serviceID
{
  return self->_serviceID;
}

- (void)setServiceID:(unint64_t)a3
{
  self->_serviceID = a3;
}

- (unsigned)flowIdentifier
{
  return self->_flowIdentifier;
}

- (void)setFlowIdentifier:(unsigned int)a3
{
  self->_flowIdentifier = a3;
}

- (double)fallbackTimeout
{
  return self->_fallbackTimeout;
}

- (void)setFallbackTimeout:(double)a3
{
  self->_fallbackTimeout = a3;
}

- (NSData)requestData
{
  return self->_requestData;
}

- (void)setRequestData:(id)a3
{
}

- (NPTunnelTuscanyEndpoint)replacementEndpoint
{
  return self->_replacementEndpoint;
}

- (void)setReplacementEndpoint:(id)a3
{
}

- (NSDictionary)replacementAddressMap
{
  return self->_replacementAddressMap;
}

- (void)setReplacementAddressMap:(id)a3
{
}

- (int)dataMode
{
  return self->_dataMode;
}

- (void)setDataMode:(int)a3
{
  self->_dataMode = a3;
}

- (NWEndpoint)directEndpoint
{
  return self->_directEndpoint;
}

- (void)setDirectEndpoint:(id)a3
{
}

- (unint64_t)timestamps
{
  return self->_timestamps;
}

- (void)setTimestamps:(unint64_t *)a3
{
  self->_timestamps = a3;
}

- (unsigned)flags
{
  return self->_flags;
}

- (void)setFlags:(unsigned int)a3
{
  self->_flags = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_directEndpoint, 0);
  objc_storeStrong((id *)&self->_replacementAddressMap, 0);
  objc_storeStrong((id *)&self->_replacementEndpoint, 0);
  objc_storeStrong((id *)&self->_requestData, 0);
}

@end