@interface OspreyAuthService
- (OspreyAuthService)initWithChannel:(id)a3 authStrategyVersion:(unint64_t)a4;
- (void)certificateDataWithSuccess:(id)a3 failure:(id)a4;
- (void)createClientSessionWithData:(id)a3 success:(id)a4 failure:(id)a5;
@end

@implementation OspreyAuthService

- (OspreyAuthService)initWithChannel:(id)a3 authStrategyVersion:(unint64_t)a4
{
  id v7 = a3;
  v13.receiver = self;
  v13.super_class = (Class)OspreyAuthService;
  v8 = [(OspreyAuthService *)&v13 init];
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_channel, a3);
    uint64_t v10 = [MEMORY[0x1E4F29128] UUID];
    authUUID = v9->_authUUID;
    v9->_authUUID = (NSUUID *)v10;

    v9->_authStrategyVersion = a4;
  }

  return v9;
}

- (void)certificateDataWithSuccess:(id)a3 failure:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  OspreyLoggingInit();
  v8 = OspreyLogContextAbsinthe;
  if (os_log_type_enabled((os_log_t)OspreyLogContextAbsinthe, OS_LOG_TYPE_DEBUG)) {
    -[OspreyAuthService certificateDataWithSuccess:failure:](v8, v9, v10, v11, v12, v13, v14, v15);
  }
  uint64_t v29 = 0;
  char v30 = 0;
  long long v31 = xmmword_1BEE12A60;
  long long v32 = 0u;
  long long v33 = 0u;
  uint64_t v34 = 0;
  uint64_t v35 = 1;
  __int16 v36 = 256;
  uint64_t v37 = 0;
  flatbuffers::FlatBufferBuilder::NotNested((uint64_t)&v29);
  BYTE6(v34) = 1;
  unsigned int v16 = flatbuffers::FlatBufferBuilder::EndTable((flatbuffers::FlatBufferBuilder *)&v29, (int)v32 - (int)v33 + DWORD2(v32));
  flatbuffers::FlatBufferBuilder::Finish((flatbuffers::FlatBufferBuilder *)&v29, v16, 0, 0);
  id v17 = objc_alloc(MEMORY[0x1E4F1C9B8]);
  uint64_t BufferPointer = flatbuffers::FlatBufferBuilder::GetBufferPointer((flatbuffers::FlatBufferBuilder *)&v29);
  v19 = (void *)[v17 initWithBytes:BufferPointer length:(v32 - v33 + DWORD2(v32))];
  v20 = +[OspreyRequest requestWithMethodName:@"/siri.sidecars.auth.AuthSession/GetCertificate"];
  v21 = [(NSUUID *)self->_authUUID UUIDString];
  [v20 setClientTraceId:v21];

  v22 = [NSNumber numberWithUnsignedInteger:self->_authStrategyVersion];
  [v20 setDeviceAuthenticationVersion:v22];

  channel = self->_channel;
  v26[0] = MEMORY[0x1E4F143A8];
  v26[1] = 3221225472;
  v26[2] = __56__OspreyAuthService_certificateDataWithSuccess_failure___block_invoke;
  v26[3] = &unk_1E63CBD10;
  id v24 = v7;
  id v27 = v24;
  id v25 = v6;
  id v28 = v25;
  [(OspreyGRPCChannel *)channel unaryRequest:v20 requestData:v19 responseHandler:v26];

  flatbuffers::FlatBufferBuilder::~FlatBufferBuilder((flatbuffers::FlatBufferBuilder *)&v29);
}

void __56__OspreyAuthService_certificateDataWithSuccess_failure___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  if (v6)
  {
    OspreyLoggingInit();
    id v7 = (id)OspreyLogContextAbsinthe;
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      v8 = [v6 localizedDescription];
      __56__OspreyAuthService_certificateDataWithSuccess_failure___block_invoke_cold_3(v8, v21);
    }

    (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  }
  else if ([v5 length])
  {
    OspreyLoggingInit();
    uint64_t v9 = OspreyLogContextAbsinthe;
    if (os_log_type_enabled((os_log_t)OspreyLogContextAbsinthe, OS_LOG_TYPE_DEBUG)) {
      __56__OspreyAuthService_certificateDataWithSuccess_failure___block_invoke_cold_2(v9, v10, v11, v12, v13, v14, v15, v16);
    }
    id v17 = (unsigned int *)[v5 bytes];
    v18 = (unsigned int *)((char *)v17
                         + *v17
                         + *(unsigned __int16 *)((char *)v17 + *v17 - *(unsigned int *)((char *)v17 + *v17) + 4));
    v19 = (void *)[objc_alloc(MEMORY[0x1E4F1C9B8]) initWithBytes:(char *)v18 + *v18 + 4 length:*(unsigned int *)((char *)v18 + *v18)];
    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  }
  else
  {
    OspreyLoggingInit();
    v20 = OspreyLogContextAbsinthe;
    if (os_log_type_enabled((os_log_t)OspreyLogContextAbsinthe, OS_LOG_TYPE_ERROR)) {
      __56__OspreyAuthService_certificateDataWithSuccess_failure___block_invoke_cold_1(v20);
    }
    (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  }
}

- (void)createClientSessionWithData:(id)a3 success:(id)a4 failure:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  OspreyLoggingInit();
  uint64_t v11 = OspreyLogContextAbsinthe;
  if (os_log_type_enabled((os_log_t)OspreyLogContextAbsinthe, OS_LOG_TYPE_DEBUG)) {
    -[OspreyAuthService createClientSessionWithData:success:failure:](v11, v12, v13, v14, v15, v16, v17, v18);
  }
  id v19 = v8;
  v20 = (const void *)[v19 bytes];
  size_t v21 = [v19 length];
  v49 = 0;
  v50 = 0;
  uint64_t v51 = 0;
  std::vector<unsigned char>::__init_with_size[abi:ne180100]<unsigned char *,unsigned char *>(&v49, v20, (uint64_t)v20 + v21, v21);
  uint64_t v40 = 0;
  char v41 = 0;
  long long v42 = xmmword_1BEE12A60;
  long long v43 = 0u;
  long long v44 = 0u;
  uint64_t v45 = 0;
  uint64_t v46 = 1;
  __int16 v47 = 256;
  if (v50 == v49) {
    uint64_t v22 = &flatbuffers::data<unsigned char,std::allocator<unsigned char>>(std::vector<unsigned char> const&)::t;
  }
  else {
    uint64_t v22 = v49;
  }
  uint64_t v48 = 0;
  unsigned int v23 = flatbuffers::FlatBufferBuilder::CreateVector<unsigned char>((flatbuffers::FlatBufferBuilder *)&v40, v22, v50 - v49);
  flatbuffers::FlatBufferBuilder::NotNested((uint64_t)&v40);
  BYTE6(v45) = 1;
  int v24 = DWORD2(v43);
  int v25 = v44;
  int v26 = v43;
  flatbuffers::FlatBufferBuilder::AddOffset<flatbuffers::Vector<unsigned char>>((flatbuffers::FlatBufferBuilder *)&v40, 4, v23);
  unsigned int v27 = flatbuffers::FlatBufferBuilder::EndTable((flatbuffers::FlatBufferBuilder *)&v40, v26 - v25 + v24);
  flatbuffers::FlatBufferBuilder::Finish((flatbuffers::FlatBufferBuilder *)&v40, v27, 0, 0);
  id v28 = (void *)MEMORY[0x1E4F1C9B8];
  uint64_t BufferPointer = flatbuffers::FlatBufferBuilder::GetBufferPointer((flatbuffers::FlatBufferBuilder *)&v40);
  char v30 = [v28 dataWithBytes:BufferPointer length:(v43 - v44 + DWORD2(v43))];
  long long v31 = +[OspreyRequest requestWithMethodName:@"/siri.sidecars.auth.AuthSession/CreateSession"];
  long long v32 = [(NSUUID *)self->_authUUID UUIDString];
  [v31 setClientTraceId:v32];

  long long v33 = [NSNumber numberWithUnsignedInteger:self->_authStrategyVersion];
  [v31 setDeviceAuthenticationVersion:v33];

  channel = self->_channel;
  v37[0] = MEMORY[0x1E4F143A8];
  v37[1] = 3221225472;
  v37[2] = __65__OspreyAuthService_createClientSessionWithData_success_failure___block_invoke;
  v37[3] = &unk_1E63CBD10;
  id v35 = v10;
  id v38 = v35;
  id v36 = v9;
  id v39 = v36;
  [(OspreyGRPCChannel *)channel unaryRequest:v31 requestData:v30 responseHandler:v37];

  flatbuffers::FlatBufferBuilder::~FlatBufferBuilder((flatbuffers::FlatBufferBuilder *)&v40);
  if (v49)
  {
    v50 = v49;
    operator delete(v49);
  }
}

void __65__OspreyAuthService_createClientSessionWithData_success_failure___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  if (v6)
  {
    OspreyLoggingInit();
    id v7 = (id)OspreyLogContextAbsinthe;
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      id v8 = [v6 localizedDescription];
      __65__OspreyAuthService_createClientSessionWithData_success_failure___block_invoke_cold_4(v8, v32);
    }

    (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
    goto LABEL_21;
  }
  if (!v5 || ![v5 length])
  {
    OspreyLoggingInit();
    int v26 = OspreyLogContextAbsinthe;
    if (os_log_type_enabled((os_log_t)OspreyLogContextAbsinthe, OS_LOG_TYPE_ERROR)) {
      __65__OspreyAuthService_createClientSessionWithData_success_failure___block_invoke_cold_1(v26);
    }
    goto LABEL_20;
  }
  id v9 = (unsigned int *)[v5 bytes];
  id v10 = (unsigned int *)((char *)v9 + *v9);
  uint64_t v11 = (unsigned __int16 *)((char *)v10 - (int)*v10);
  if (*v11 < 5u || (uint64_t v12 = v11[2]) == 0)
  {
    int v13 = 0;
LABEL_18:
    OspreyLoggingInit();
    unsigned int v27 = OspreyLogContextAbsinthe;
    if (os_log_type_enabled((os_log_t)OspreyLogContextAbsinthe, OS_LOG_TYPE_ERROR)) {
      __65__OspreyAuthService_createClientSessionWithData_success_failure___block_invoke_cold_2(v13, v27);
    }
LABEL_20:
    (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
    goto LABEL_21;
  }
  int v13 = *(unsigned int *)((char *)v10 + v12);
  if (v13 != 1) {
    goto LABEL_18;
  }
  OspreyLoggingInit();
  uint64_t v14 = OspreyLogContextAbsinthe;
  if (os_log_type_enabled((os_log_t)OspreyLogContextAbsinthe, OS_LOG_TYPE_DEBUG)) {
    __65__OspreyAuthService_createClientSessionWithData_success_failure___block_invoke_cold_3(v14, v15, v16, v17, v18, v19, v20, v21);
  }
  uint64_t v22 = (unsigned __int16 *)((char *)v10 - (int)*v10);
  uint64_t v23 = v22[3];
  if (v22[3])
  {
    uint64_t v24 = *(unsigned int *)((char *)v10 + v23);
    int v25 = (char *)v10 + v23 + v24;
  }
  else
  {
    uint64_t v23 = 0;
    int v25 = 0;
    uint64_t v24 = *v10;
  }
  double v28 = 0.0;
  if (*v22 >= 9u)
  {
    uint64_t v29 = v22[4];
    if (v29) {
      double v28 = (double)*(unint64_t *)((char *)v10 + v29);
    }
  }
  uint64_t v30 = *(void *)(a1 + 40);
  long long v31 = [MEMORY[0x1E4F1C9B8] dataWithBytes:v25 + 4 length:*(unsigned int *)((char *)v10 + v23 + v24)];
  (*(void (**)(uint64_t, void *, double))(v30 + 16))(v30, v31, v28);

LABEL_21:
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_authUUID, 0);

  objc_storeStrong((id *)&self->_channel, 0);
}

- (void)certificateDataWithSuccess:(uint64_t)a3 failure:(uint64_t)a4 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void __56__OspreyAuthService_certificateDataWithSuccess_failure___block_invoke_cold_1(os_log_t log)
{
  uint64_t v3 = *MEMORY[0x1E4F143B8];
  int v1 = 136315138;
  v2 = "-[OspreyAuthService certificateDataWithSuccess:failure:]_block_invoke";
  _os_log_error_impl(&dword_1BEDB4000, log, OS_LOG_TYPE_ERROR, "%s Certificate data was empty!", (uint8_t *)&v1, 0xCu);
}

void __56__OspreyAuthService_certificateDataWithSuccess_failure___block_invoke_cold_2(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void __56__OspreyAuthService_certificateDataWithSuccess_failure___block_invoke_cold_3(void *a1, _DWORD *a2)
{
  *a2 = 136315394;
  OUTLINED_FUNCTION_1_3((uint64_t)a1, (uint64_t)a2, (uint64_t)"-[OspreyAuthService certificateDataWithSuccess:failure:]_block_invoke");
  _os_log_error_impl(&dword_1BEDB4000, v3, OS_LOG_TYPE_ERROR, "%s Error fetching cert from auth service! Error: %@", v4, 0x16u);
}

- (void)createClientSessionWithData:(uint64_t)a3 success:(uint64_t)a4 failure:(uint64_t)a5 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void __65__OspreyAuthService_createClientSessionWithData_success_failure___block_invoke_cold_1(os_log_t log)
{
  uint64_t v3 = *MEMORY[0x1E4F143B8];
  int v1 = 136315138;
  v2 = "-[OspreyAuthService createClientSessionWithData:success:failure:]_block_invoke";
  _os_log_error_impl(&dword_1BEDB4000, log, OS_LOG_TYPE_ERROR, "%s Could not get signed session info from auth service!", (uint8_t *)&v1, 0xCu);
}

void __65__OspreyAuthService_createClientSessionWithData_success_failure___block_invoke_cold_2(int a1, NSObject *a2)
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  int v2 = 136315394;
  uint64_t v3 = "-[OspreyAuthService createClientSessionWithData:success:failure:]_block_invoke";
  __int16 v4 = 1024;
  int v5 = a1;
  _os_log_error_impl(&dword_1BEDB4000, a2, OS_LOG_TYPE_ERROR, "%s Auth server responded with non 1 code. Code: %d", (uint8_t *)&v2, 0x12u);
}

void __65__OspreyAuthService_createClientSessionWithData_success_failure___block_invoke_cold_3(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void __65__OspreyAuthService_createClientSessionWithData_success_failure___block_invoke_cold_4(void *a1, _DWORD *a2)
{
  *a2 = 136315394;
  OUTLINED_FUNCTION_1_3((uint64_t)a1, (uint64_t)a2, (uint64_t)"-[OspreyAuthService createClientSessionWithData:success:failure:]_block_invoke");
  _os_log_error_impl(&dword_1BEDB4000, v3, OS_LOG_TYPE_ERROR, "%s Error getting session info response from auth service! Error: %@", v4, 0x16u);
}

@end