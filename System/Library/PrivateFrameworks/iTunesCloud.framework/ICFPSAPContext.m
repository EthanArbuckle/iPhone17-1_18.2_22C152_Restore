@interface ICFPSAPContext
- (BOOL)exchangeWithSAPVersion:(unsigned int)a3 data:(id)a4 returningData:(id *)a5 exchangeStatus:(char *)a6 error:(id *)a7;
- (BOOL)processResponseWithSignatureData:(id)a3 data:(id)a4 error:(id *)a5;
- (BOOL)signData:(id)a3 returningSignatureData:(id *)a4 error:(id *)a5;
- (id)initReturningError:(id *)a3;
- (void)dealloc;
@end

@implementation ICFPSAPContext

- (BOOL)processResponseWithSignatureData:(id)a3 data:(id)a4 error:(id *)a5
{
  id v7 = a3;
  id v8 = a4;
  id v9 = v7;
  [v9 bytes];
  [v9 length];

  id v10 = v8;
  [v10 mutableBytes];
  [v10 length];

  gLg1CWr7p();
  if (!v11)
  {
    v12 = 0;
    if (!a5) {
      goto LABEL_4;
    }
    goto LABEL_3;
  }
  v12 = [MEMORY[0x1E4F28C58] errorWithDomain:@"ICFairPlayError" code:v11 userInfo:0];
  if (a5) {
LABEL_3:
  }
    *a5 = v12;
LABEL_4:

  return v12 == 0;
}

- (BOOL)exchangeWithSAPVersion:(unsigned int)a3 data:(id)a4 returningData:(id *)a5 exchangeStatus:(char *)a6 error:(id *)a7
{
  uint64_t v10 = *(void *)&a3;
  uint64_t v22 = 0;
  unsigned int v21 = 0;
  char v20 = -1;
  p_hardwareInfo = &self->_hardwareInfo;
  fairPlaySAPContext = self->_fairPlaySAPContext;
  id v13 = a4;
  uint64_t v14 = [v13 bytes];
  uint64_t v15 = [v13 length];

  Mib5yocT(v10, (uint64_t)p_hardwareInfo, (uint64_t)fairPlaySAPContext, v14, v15, (uint64_t)&v22, (uint64_t)&v21, (uint64_t)&v20);
  if (v16)
  {
    v17 = [MEMORY[0x1E4F28C58] errorWithDomain:@"ICFairPlayError" code:v16 userInfo:0];
    v18 = 0;
    if (!a5) {
      goto LABEL_4;
    }
    goto LABEL_3;
  }
  v18 = objc_msgSend(MEMORY[0x1E4F1C9B8], "ic_dataWithFairPlayBytes:length:", v22, v21);
  v17 = 0;
  if (a5) {
LABEL_3:
  }
    *a5 = v18;
LABEL_4:
  if (a6) {
    *a6 = v20;
  }
  if (a7) {
    *a7 = v17;
  }

  return v17 == 0;
}

- (BOOL)signData:(id)a3 returningSignatureData:(id *)a4 error:(id *)a5
{
  uint64_t v16 = 0;
  unsigned int v15 = 0;
  fairPlaySAPContext = self->_fairPlaySAPContext;
  id v8 = a3;
  uint64_t v9 = [v8 bytes];
  uint64_t v10 = [v8 length];

  Fc3vhtJDvr((uint64_t)fairPlaySAPContext, v9, v10, (uint64_t)&v16, (uint64_t)&v15);
  if (v11)
  {
    v12 = [MEMORY[0x1E4F28C58] errorWithDomain:@"ICFairPlayError" code:v11 userInfo:0];
    id v13 = 0;
    if (!a4) {
      goto LABEL_4;
    }
    goto LABEL_3;
  }
  id v13 = objc_msgSend(MEMORY[0x1E4F1C9B8], "ic_dataWithFairPlayBytes:length:", v16, v15);
  v12 = 0;
  if (a4) {
LABEL_3:
  }
    *a4 = v13;
LABEL_4:
  if (a5) {
    *a5 = v12;
  }

  return v12 == 0;
}

- (id)initReturningError:(id *)a3
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  unsigned int v15 = 0;
  long long v16 = 0uLL;
  uint64_t v17 = 0;
  if (!ICFairPlayGetHardwareInfo((uint64_t)&v16))
  {
    id v8 = (void *)MEMORY[0x1E4F28C58];
    id v7 = @"ICError";
    uint64_t v6 = -7500;
LABEL_5:
    uint64_t v9 = [v8 errorWithDomain:v7 code:v6 userInfo:0];
    if (!a3) {
      goto LABEL_7;
    }
    goto LABEL_6;
  }
  cp2g1b9ro((uint64_t)&v15, (uint64_t)&v16);
  if (v5)
  {
    uint64_t v6 = v5;
    id v7 = @"ICFairPlayError";
    id v8 = (void *)MEMORY[0x1E4F28C58];
    goto LABEL_5;
  }
  uint64_t v9 = 0;
  if (a3) {
LABEL_6:
  }
    *a3 = v9;
LABEL_7:
  if (v15)
  {
    v14.receiver = self;
    v14.super_class = (Class)ICFPSAPContext;
    uint64_t v10 = [(ICFPSAPContext *)&v14 init];
    if (v10)
    {
      uint64_t v11 = v17;
      *(_OWORD *)&v10->_hardwareInfo.IDLength = v16;
      *(void *)&v10->_hardwareInfo.ID[12] = v11;
      v10->_fairPlaySAPContext = v15;
    }
    self = v10;
    v12 = self;
  }
  else
  {
    v12 = 0;
  }

  return v12;
}

- (void)dealloc
{
  fairPlaySAPContext = self->_fairPlaySAPContext;
  if (fairPlaySAPContext) {
    IPaI1oem5iL((uint64_t)fairPlaySAPContext);
  }
  v4.receiver = self;
  v4.super_class = (Class)ICFPSAPContext;
  [(ICFPSAPContext *)&v4 dealloc];
}

@end