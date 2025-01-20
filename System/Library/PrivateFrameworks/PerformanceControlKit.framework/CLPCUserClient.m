@interface CLPCUserClient
- (BOOL)setContextualPowerMode:(BOOL)a3 options:(unint64_t)a4 error:(id *)a5;
- (BOOL)setDockMode:(BOOL)a3 options:(unint64_t)a4 error:(id *)a5;
- (BOOL)setGameMode:(BOOL)a3 options:(unint64_t)a4 error:(id *)a5;
- (BOOL)setGameModeOnProcess:(BOOL)a3 targetProcess:(int)a4 options:(unint64_t)a5 error:(id *)a6;
- (BOOL)setHotInPocketMode:(BOOL)a3 options:(unint64_t)a4 error:(id *)a5;
- (BOOL)setLowPowerMode:(BOOL)a3 options:(unint64_t)a4 error:(id *)a5;
- (BOOL)setSustainableMode:(BOOL)a3 options:(unint64_t)a4 error:(id *)a5;
- (BOOL)setTaskingMode:(BOOL)a3 options:(unint64_t)a4 error:(id *)a5;
- (CLPCUserClient)init;
- (id).cxx_construct;
- (id)init:(id *)a3;
- (id)reportingObfuscationData:(id *)a3;
- (uint64_t)connect:(uint64_t)result;
- (unint64_t)isInContextualPowerMode:(id *)a3;
- (unint64_t)isInDockMode:(id *)a3;
- (unint64_t)isInGameMode:(id *)a3;
- (unint64_t)isInHotInPocketMode:(id *)a3;
- (unint64_t)isInLowPowerMode:(id *)a3;
- (unint64_t)isInSustainableMode:(id *)a3;
- (unint64_t)isInTaskingMode:(id *)a3;
@end

@implementation CLPCUserClient

- (id)init:(id *)a3
{
  v8.receiver = self;
  v8.super_class = (Class)CLPCUserClient;
  v4 = [(CLPCUserClient *)&v8 init];
  v5 = v4;
  if (v4 && (-[CLPCUserClient connect:]((uint64_t)v4, a3) & 1) != 0) {
    v6 = v5;
  }
  else {
    v6 = 0;
  }

  return v6;
}

- (uint64_t)connect:(uint64_t)result
{
  kern_return_t v3;
  void *v4;
  uint64_t v5;
  void v6[2];

  v6[1] = *MEMORY[0x263EF8340];
  if (result)
  {
    if (*(_DWORD *)(result + 20))
    {
      return 1;
    }
    else
    {
      v3 = IOServiceOpen(*(_DWORD *)(result + 16), *MEMORY[0x263EF8960], 0, (io_connect_t *)(result + 20));
      result = v3 == 0;
      if (a2)
      {
        if (v3)
        {
          v5 = *MEMORY[0x263F07F80];
          v6[0] = @"Failed to open user client connection to AppleCLPC.";
          v4 = [NSDictionary dictionaryWithObjects:v6 forKeys:&v5 count:1];
          *a2 = [MEMORY[0x263F087E8] errorWithDomain:@"CLPCErrorDomain" code:v3 userInfo:v4];

          return 0;
        }
      }
    }
  }
  return result;
}

- (CLPCUserClient)init
{
  return (CLPCUserClient *)[(CLPCUserClient *)self init:0];
}

- (unint64_t)isInLowPowerMode:(id *)a3
{
  kern_return_t v4;
  void *v5;
  uint32_t outputCnt;
  uint64_t output;
  uint64_t input[2];
  long long v10;
  long long v11;
  uint64_t v12;
  void v13[2];

  v13[1] = *MEMORY[0x263EF8340];
  *(int64x2_t *)input = vdupq_n_s64(1uLL);
  v10 = 0u;
  v11 = 0u;
  output = 0;
  outputCnt = 1;
  v4 = IOConnectCallMethod(self->clpc.connect, 4u, input, 6u, 0, 0, &output, &outputCnt, 0, 0);
  if (v4)
  {
    if (a3)
    {
      v12 = *MEMORY[0x263F07F80];
      v13[0] = @"Failed to determine if Low Power Mode is enabled.";
      v5 = [NSDictionary dictionaryWithObjects:v13 forKeys:&v12 count:1];
      *a3 = [MEMORY[0x263F087E8] errorWithDomain:@"CLPCErrorDomain" code:v4 userInfo:v5];
    }
    return 0;
  }
  else if (output)
  {
    return 2;
  }
  else
  {
    return 1;
  }
}

- (BOOL)setLowPowerMode:(BOOL)a3 options:(unint64_t)a4 error:(id *)a5
{
  BOOL v6 = a3;
  v24[1] = *MEMORY[0x263EF8340];
  uint64_t v7 = 2;
  if (!a3) {
    uint64_t v7 = 0;
  }
  input[0] = 1;
  input[1] = v7;
  long long v21 = 0u;
  long long v22 = 0u;
  uint64_t output = 0;
  uint32_t outputCnt = 1;
  uint64_t v8 = IOConnectCallMethod(self->clpc.connect, 4u, input, 6u, 0, 0, &output, &outputCnt, 0, 0);
  if (v8) {
    uint64_t v9 = v8 << 32;
  }
  else {
    uint64_t v9 = 256;
  }
  if (output) {
    BOOL v10 = v8 == 0;
  }
  else {
    BOOL v10 = 0;
  }
  unsigned int v11 = v9 >> 8;
  if (HIDWORD(v9)) {
    BOOL v12 = 1;
  }
  else {
    BOOL v12 = v11 == 0;
  }
  if (!v12) {
    return 1;
  }
  if (a5)
  {
    v13 = @"disable";
    if (v6) {
      v13 = @"enable";
    }
    v14 = [NSString stringWithFormat:@"Failed to %@ Low Power Mode.", v13];
    v15 = (void *)MEMORY[0x263F087E8];
    uint64_t v23 = *MEMORY[0x263F07F80];
    v24[0] = v14;
    v16 = [NSDictionary dictionaryWithObjects:v24 forKeys:&v23 count:1];
    *a5 = [v15 errorWithDomain:@"CLPCErrorDomain" code:v9 >> 32 userInfo:v16];
  }
  if (v11) {
    return v10 ^ v6 ^ 1;
  }
  else {
    return 0;
  }
}

- (unint64_t)isInHotInPocketMode:(id *)a3
{
  kern_return_t v4;
  void *v5;
  uint32_t outputCnt;
  uint64_t output;
  uint64_t input[2];
  long long v10;
  long long v11;
  uint64_t v12;
  void v13[2];

  v13[1] = *MEMORY[0x263EF8340];
  *(_OWORD *)input = xmmword_258FEA030;
  BOOL v10 = 0u;
  unsigned int v11 = 0u;
  uint64_t output = 0;
  uint32_t outputCnt = 1;
  v4 = IOConnectCallMethod(self->clpc.connect, 4u, input, 6u, 0, 0, &output, &outputCnt, 0, 0);
  if (v4)
  {
    if (a3)
    {
      BOOL v12 = *MEMORY[0x263F07F80];
      v13[0] = @"Failed to determine if Hot In Pocket Mode is enabled.";
      v5 = [NSDictionary dictionaryWithObjects:v13 forKeys:&v12 count:1];
      *a3 = [MEMORY[0x263F087E8] errorWithDomain:@"CLPCErrorDomain" code:v4 userInfo:v5];
    }
    return 0;
  }
  else if (output)
  {
    return 2;
  }
  else
  {
    return 1;
  }
}

- (BOOL)setHotInPocketMode:(BOOL)a3 options:(unint64_t)a4 error:(id *)a5
{
  BOOL v6 = a3;
  v24[1] = *MEMORY[0x263EF8340];
  uint64_t v7 = 2;
  if (!a3) {
    uint64_t v7 = 0;
  }
  input[0] = 4;
  input[1] = v7;
  long long v21 = 0u;
  long long v22 = 0u;
  uint64_t output = 0;
  uint32_t outputCnt = 1;
  uint64_t v8 = IOConnectCallMethod(self->clpc.connect, 4u, input, 6u, 0, 0, &output, &outputCnt, 0, 0);
  if (v8) {
    uint64_t v9 = v8 << 32;
  }
  else {
    uint64_t v9 = 256;
  }
  if (output) {
    BOOL v10 = v8 == 0;
  }
  else {
    BOOL v10 = 0;
  }
  unsigned int v11 = v9 >> 8;
  if (HIDWORD(v9)) {
    BOOL v12 = 1;
  }
  else {
    BOOL v12 = v11 == 0;
  }
  if (!v12) {
    return 1;
  }
  if (a5)
  {
    v13 = @"disable";
    if (v6) {
      v13 = @"enable";
    }
    v14 = [NSString stringWithFormat:@"Failed to %@ Hot In Pocket Mode.", v13];
    v15 = (void *)MEMORY[0x263F087E8];
    uint64_t v23 = *MEMORY[0x263F07F80];
    v24[0] = v14;
    v16 = [NSDictionary dictionaryWithObjects:v24 forKeys:&v23 count:1];
    *a5 = [v15 errorWithDomain:@"CLPCErrorDomain" code:v9 >> 32 userInfo:v16];
  }
  if (v11) {
    return v10 ^ v6 ^ 1;
  }
  else {
    return 0;
  }
}

- (unint64_t)isInGameMode:(id *)a3
{
  kern_return_t v4;
  void *v5;
  uint32_t outputCnt;
  uint64_t output;
  uint64_t input[2];
  long long v10;
  long long v11;
  uint64_t v12;
  void v13[2];

  v13[1] = *MEMORY[0x263EF8340];
  *(_OWORD *)input = xmmword_258FEA040;
  BOOL v10 = 0u;
  unsigned int v11 = 0u;
  uint64_t output = 0;
  uint32_t outputCnt = 1;
  v4 = IOConnectCallMethod(self->clpc.connect, 4u, input, 6u, 0, 0, &output, &outputCnt, 0, 0);
  if (v4)
  {
    if (a3)
    {
      BOOL v12 = *MEMORY[0x263F07F80];
      v13[0] = @"Failed to determine if Game Mode is enabled.";
      v5 = [NSDictionary dictionaryWithObjects:v13 forKeys:&v12 count:1];
      *a3 = [MEMORY[0x263F087E8] errorWithDomain:@"CLPCErrorDomain" code:v4 userInfo:v5];
    }
    return 0;
  }
  else if (output)
  {
    return 2;
  }
  else
  {
    return 1;
  }
}

- (BOOL)setGameMode:(BOOL)a3 options:(unint64_t)a4 error:(id *)a5
{
  BOOL v6 = a3;
  v22[1] = *MEMORY[0x263EF8340];
  if (a3) {
    uint64_t v7 = 2;
  }
  else {
    uint64_t v7 = 0;
  }
  input[0] = 2;
  input[1] = v7;
  uint64_t input[2] = a4;
  memset(&input[3], 0, 24);
  uint64_t output = 0;
  uint32_t outputCnt = 1;
  uint64_t v8 = IOConnectCallMethod(self->clpc.connect, 4u, input, 6u, 0, 0, &output, &outputCnt, 0, 0);
  if (v8) {
    uint64_t v9 = v8 << 32;
  }
  else {
    uint64_t v9 = 256;
  }
  if (output) {
    BOOL v10 = v8 == 0;
  }
  else {
    BOOL v10 = 0;
  }
  unsigned int v11 = v9 >> 8;
  if (HIDWORD(v9)) {
    BOOL v12 = 1;
  }
  else {
    BOOL v12 = v11 == 0;
  }
  if (!v12) {
    return 1;
  }
  if (a5)
  {
    v13 = @"disable";
    if (v6) {
      v13 = @"enable";
    }
    v14 = [NSString stringWithFormat:@"Failed to %@ Game Mode.", v13];
    v15 = (void *)MEMORY[0x263F087E8];
    uint64_t v21 = *MEMORY[0x263F07F80];
    v22[0] = v14;
    v16 = [NSDictionary dictionaryWithObjects:v22 forKeys:&v21 count:1];
    *a5 = [v15 errorWithDomain:@"CLPCErrorDomain" code:v9 >> 32 userInfo:v16];
  }
  if (v11) {
    return v10 ^ v6 ^ 1;
  }
  else {
    return 0;
  }
}

- (BOOL)setGameModeOnProcess:(BOOL)a3 targetProcess:(int)a4 options:(unint64_t)a5 error:(id *)a6
{
  uint64_t v7 = *(void *)&a4;
  BOOL v8 = a3;
  v17[1] = *MEMORY[0x263EF8340];
  int v9 = setpriority(7, a4, a3);
  if (v9)
  {
    uint64_t v10 = *__error();
    unsigned int v11 = @"disable";
    if (v8) {
      unsigned int v11 = @"enable";
    }
    BOOL v12 = [NSString stringWithFormat:@"Failed to %@ Game Mode on process %d.", v11, v7];
    v13 = (void *)MEMORY[0x263F087E8];
    uint64_t v16 = *MEMORY[0x263F07F80];
    v17[0] = v12;
    v14 = [NSDictionary dictionaryWithObjects:v17 forKeys:&v16 count:1];
    *a6 = [v13 errorWithDomain:@"CLPCErrorDomain" code:v10 userInfo:v14];
  }
  return v9 == 0;
}

- (unint64_t)isInSustainableMode:(id *)a3
{
  kern_return_t v4;
  void *v5;
  uint32_t outputCnt;
  uint64_t output;
  uint64_t input[2];
  long long v10;
  long long v11;
  uint64_t v12;
  void v13[2];

  v13[1] = *MEMORY[0x263EF8340];
  *(_OWORD *)input = xmmword_258FEA050;
  uint64_t v10 = 0u;
  unsigned int v11 = 0u;
  uint64_t output = 0;
  uint32_t outputCnt = 1;
  v4 = IOConnectCallMethod(self->clpc.connect, 4u, input, 6u, 0, 0, &output, &outputCnt, 0, 0);
  if (v4)
  {
    if (a3)
    {
      BOOL v12 = *MEMORY[0x263F07F80];
      v13[0] = @"Failed to determine if Sustainable Mode is enabled.";
      v5 = [NSDictionary dictionaryWithObjects:v13 forKeys:&v12 count:1];
      *a3 = [MEMORY[0x263F087E8] errorWithDomain:@"CLPCErrorDomain" code:v4 userInfo:v5];
    }
    return 0;
  }
  else if (output)
  {
    return 2;
  }
  else
  {
    return 1;
  }
}

- (BOOL)setSustainableMode:(BOOL)a3 options:(unint64_t)a4 error:(id *)a5
{
  BOOL v6 = a3;
  v24[1] = *MEMORY[0x263EF8340];
  uint64_t v7 = 2;
  if (!a3) {
    uint64_t v7 = 0;
  }
  input[0] = 3;
  input[1] = v7;
  long long v21 = 0u;
  long long v22 = 0u;
  uint64_t output = 0;
  uint32_t outputCnt = 1;
  uint64_t v8 = IOConnectCallMethod(self->clpc.connect, 4u, input, 6u, 0, 0, &output, &outputCnt, 0, 0);
  if (v8) {
    uint64_t v9 = v8 << 32;
  }
  else {
    uint64_t v9 = 256;
  }
  if (output) {
    BOOL v10 = v8 == 0;
  }
  else {
    BOOL v10 = 0;
  }
  unsigned int v11 = v9 >> 8;
  if (HIDWORD(v9)) {
    BOOL v12 = 1;
  }
  else {
    BOOL v12 = v11 == 0;
  }
  if (!v12) {
    return 1;
  }
  if (a5)
  {
    v13 = @"disable";
    if (v6) {
      v13 = @"enable";
    }
    v14 = [NSString stringWithFormat:@"Failed to %@ Sustainable Mode.", v13];
    v15 = (void *)MEMORY[0x263F087E8];
    uint64_t v23 = *MEMORY[0x263F07F80];
    v24[0] = v14;
    uint64_t v16 = [NSDictionary dictionaryWithObjects:v24 forKeys:&v23 count:1];
    *a5 = [v15 errorWithDomain:@"CLPCErrorDomain" code:v9 >> 32 userInfo:v16];
  }
  if (v11) {
    return v10 ^ v6 ^ 1;
  }
  else {
    return 0;
  }
}

- (unint64_t)isInDockMode:(id *)a3
{
  kern_return_t v4;
  void *v5;
  uint32_t outputCnt;
  uint64_t output;
  uint64_t input[2];
  long long v10;
  long long v11;
  uint64_t v12;
  void v13[2];

  v13[1] = *MEMORY[0x263EF8340];
  *(_OWORD *)input = xmmword_258FEA060;
  BOOL v10 = 0u;
  unsigned int v11 = 0u;
  uint64_t output = 0;
  uint32_t outputCnt = 1;
  v4 = IOConnectCallMethod(self->clpc.connect, 4u, input, 6u, 0, 0, &output, &outputCnt, 0, 0);
  if (v4)
  {
    if (a3)
    {
      BOOL v12 = *MEMORY[0x263F07F80];
      v13[0] = @"Failed to determine if Dock Mode is enabled.";
      v5 = [NSDictionary dictionaryWithObjects:v13 forKeys:&v12 count:1];
      *a3 = [MEMORY[0x263F087E8] errorWithDomain:@"CLPCErrorDomain" code:v4 userInfo:v5];
    }
    return 0;
  }
  else if (output)
  {
    return 2;
  }
  else
  {
    return 1;
  }
}

- (BOOL)setDockMode:(BOOL)a3 options:(unint64_t)a4 error:(id *)a5
{
  BOOL v6 = a3;
  v24[1] = *MEMORY[0x263EF8340];
  uint64_t v7 = 2;
  if (!a3) {
    uint64_t v7 = 0;
  }
  input[0] = 5;
  input[1] = v7;
  long long v21 = 0u;
  long long v22 = 0u;
  uint64_t output = 0;
  uint32_t outputCnt = 1;
  uint64_t v8 = IOConnectCallMethod(self->clpc.connect, 4u, input, 6u, 0, 0, &output, &outputCnt, 0, 0);
  if (v8) {
    uint64_t v9 = v8 << 32;
  }
  else {
    uint64_t v9 = 256;
  }
  if (output) {
    BOOL v10 = v8 == 0;
  }
  else {
    BOOL v10 = 0;
  }
  unsigned int v11 = v9 >> 8;
  if (HIDWORD(v9)) {
    BOOL v12 = 1;
  }
  else {
    BOOL v12 = v11 == 0;
  }
  if (!v12) {
    return 1;
  }
  if (a5)
  {
    v13 = @"disable";
    if (v6) {
      v13 = @"enable";
    }
    v14 = [NSString stringWithFormat:@"Failed to %@ Dock Mode.", v13];
    v15 = (void *)MEMORY[0x263F087E8];
    uint64_t v23 = *MEMORY[0x263F07F80];
    v24[0] = v14;
    uint64_t v16 = [NSDictionary dictionaryWithObjects:v24 forKeys:&v23 count:1];
    *a5 = [v15 errorWithDomain:@"CLPCErrorDomain" code:v9 >> 32 userInfo:v16];
  }
  if (v11) {
    return v10 ^ v6 ^ 1;
  }
  else {
    return 0;
  }
}

- (unint64_t)isInTaskingMode:(id *)a3
{
  kern_return_t v4;
  void *v5;
  uint32_t outputCnt;
  uint64_t output;
  uint64_t input[2];
  long long v10;
  long long v11;
  uint64_t v12;
  void v13[2];

  v13[1] = *MEMORY[0x263EF8340];
  *(_OWORD *)input = xmmword_258FEA070;
  BOOL v10 = 0u;
  unsigned int v11 = 0u;
  uint64_t output = 0;
  uint32_t outputCnt = 1;
  v4 = IOConnectCallMethod(self->clpc.connect, 4u, input, 6u, 0, 0, &output, &outputCnt, 0, 0);
  if (v4)
  {
    if (a3)
    {
      BOOL v12 = *MEMORY[0x263F07F80];
      v13[0] = @"Failed to determine if Tasking Mode is enabled.";
      v5 = [NSDictionary dictionaryWithObjects:v13 forKeys:&v12 count:1];
      *a3 = [MEMORY[0x263F087E8] errorWithDomain:@"CLPCErrorDomain" code:v4 userInfo:v5];
    }
    return 0;
  }
  else if (output)
  {
    return 2;
  }
  else
  {
    return 1;
  }
}

- (BOOL)setTaskingMode:(BOOL)a3 options:(unint64_t)a4 error:(id *)a5
{
  BOOL v6 = a3;
  v24[1] = *MEMORY[0x263EF8340];
  uint64_t v7 = 2;
  if (!a3) {
    uint64_t v7 = 0;
  }
  input[0] = 6;
  input[1] = v7;
  long long v21 = 0u;
  long long v22 = 0u;
  uint64_t output = 0;
  uint32_t outputCnt = 1;
  uint64_t v8 = IOConnectCallMethod(self->clpc.connect, 4u, input, 6u, 0, 0, &output, &outputCnt, 0, 0);
  if (v8) {
    uint64_t v9 = v8 << 32;
  }
  else {
    uint64_t v9 = 256;
  }
  if (output) {
    BOOL v10 = v8 == 0;
  }
  else {
    BOOL v10 = 0;
  }
  unsigned int v11 = v9 >> 8;
  if (HIDWORD(v9)) {
    BOOL v12 = 1;
  }
  else {
    BOOL v12 = v11 == 0;
  }
  if (!v12) {
    return 1;
  }
  if (a5)
  {
    v13 = @"disable";
    if (v6) {
      v13 = @"enable";
    }
    v14 = [NSString stringWithFormat:@"Failed to %@ Tasking Mode.", v13];
    v15 = (void *)MEMORY[0x263F087E8];
    uint64_t v23 = *MEMORY[0x263F07F80];
    v24[0] = v14;
    uint64_t v16 = [NSDictionary dictionaryWithObjects:v24 forKeys:&v23 count:1];
    *a5 = [v15 errorWithDomain:@"CLPCErrorDomain" code:v9 >> 32 userInfo:v16];
  }
  if (v11) {
    return v10 ^ v6 ^ 1;
  }
  else {
    return 0;
  }
}

- (unint64_t)isInContextualPowerMode:(id *)a3
{
  kern_return_t v4;
  void *v5;
  uint32_t outputCnt;
  uint64_t output;
  uint64_t input[2];
  long long v10;
  long long v11;
  uint64_t v12;
  void v13[2];

  v13[1] = *MEMORY[0x263EF8340];
  *(_OWORD *)input = xmmword_258FEA080;
  BOOL v10 = 0u;
  unsigned int v11 = 0u;
  uint64_t output = 0;
  uint32_t outputCnt = 1;
  v4 = IOConnectCallMethod(self->clpc.connect, 4u, input, 6u, 0, 0, &output, &outputCnt, 0, 0);
  if (v4)
  {
    if (a3)
    {
      BOOL v12 = *MEMORY[0x263F07F80];
      v13[0] = @"Failed to determine if Contextual Power Mode is enabled.";
      v5 = [NSDictionary dictionaryWithObjects:v13 forKeys:&v12 count:1];
      *a3 = [MEMORY[0x263F087E8] errorWithDomain:@"CLPCErrorDomain" code:v4 userInfo:v5];
    }
    return 0;
  }
  else if (output)
  {
    return 2;
  }
  else
  {
    return 1;
  }
}

- (BOOL)setContextualPowerMode:(BOOL)a3 options:(unint64_t)a4 error:(id *)a5
{
  BOOL v6 = a3;
  v22[1] = *MEMORY[0x263EF8340];
  uint64_t v7 = 2;
  if (!a3) {
    uint64_t v7 = 0;
  }
  input[0] = 7;
  input[1] = v7;
  uint64_t input[2] = a4;
  memset(&input[3], 0, 24);
  uint64_t output = 0;
  uint32_t outputCnt = 1;
  uint64_t v8 = IOConnectCallMethod(self->clpc.connect, 4u, input, 6u, 0, 0, &output, &outputCnt, 0, 0);
  if (v8) {
    uint64_t v9 = v8 << 32;
  }
  else {
    uint64_t v9 = 256;
  }
  if (output) {
    BOOL v10 = v8 == 0;
  }
  else {
    BOOL v10 = 0;
  }
  unsigned int v11 = v9 >> 8;
  if (HIDWORD(v9)) {
    BOOL v12 = 1;
  }
  else {
    BOOL v12 = v11 == 0;
  }
  if (!v12) {
    return 1;
  }
  if (a5)
  {
    v13 = @"disable";
    if (v6) {
      v13 = @"enable";
    }
    v14 = [NSString stringWithFormat:@"Failed to %@ Contextual Power Mode.", v13];
    v15 = (void *)MEMORY[0x263F087E8];
    uint64_t v21 = *MEMORY[0x263F07F80];
    v22[0] = v14;
    uint64_t v16 = [NSDictionary dictionaryWithObjects:v22 forKeys:&v21 count:1];
    *a5 = [v15 errorWithDomain:@"CLPCErrorDomain" code:v9 >> 32 userInfo:v16];
  }
  if (v11) {
    return v10 ^ v6 ^ 1;
  }
  else {
    return 0;
  }
}

- (id)reportingObfuscationData:(id *)a3
{
  kern_return_t v4;
  BOOL v5;
  int v6;
  void *v7;
  void *v8;
  uint32_t outputCnt;
  uint64_t v11;
  __CFString *v12;
  _OWORD v13[2];
  int v14;
  uint64_t output[2];
  long long v16;
  uint64_t v17;
  uint64_t vars8;

  v17 = *MEMORY[0x263EF8340];
  *(_OWORD *)uint64_t output = 0u;
  uint64_t v16 = 0u;
  uint32_t outputCnt = 4;
  v4 = IOConnectCallMethod(self->clpc.connect, 5u, 0, 0, 0, 0, output, &outputCnt, 0, 0);
  if (v4) {
    v5 = 1;
  }
  else {
    v5 = outputCnt == 4;
  }
  if (v5) {
    BOOL v6 = v4;
  }
  else {
    BOOL v6 = -536870212;
  }
  v13[0] = *(_OWORD *)output;
  v13[1] = v16;
  v14 = v6;
  if (v6)
  {
    if (a3)
    {
      unsigned int v11 = *MEMORY[0x263F07F80];
      BOOL v12 = @"Failed to get reporting obfuscation data.";
      uint64_t v7 = [NSDictionary dictionaryWithObjects:&v12 forKeys:&v11 count:1];
      *a3 = [MEMORY[0x263F087E8] errorWithDomain:@"CLPCErrorDomain" code:v6 userInfo:v7];
    }
    uint64_t v8 = 0;
  }
  else
  {
    uint64_t v8 = [MEMORY[0x263EFF8F8] dataWithBytes:v13 length:32];
  }
  return v8;
}

- (void).cxx_destruct
{
}

- (id).cxx_construct
{
  return self;
}

@end