@interface ICFPStreamContext
- (BOOL)getPlayerDelegateInfoDataUsingPlayerDelegateInfoResponseData:(id)a3 returningData:(id *)a4 error:(id *)a5;
- (BOOL)getStreamerInfoContextDataUsingPlayerInfoContextData:(id)a3 returningData:(id *)a4 error:(id *)a5;
- (ICFPStreamContext)initWithVersion:(unsigned int)a3 contextID:(unsigned int)a4 contentInfo:(id)a5 returningError:(id *)a6;
- (NSData)playerInfoContextRequestData;
- (unint64_t)accountID;
- (void)dealloc;
@end

@implementation ICFPStreamContext

- (void).cxx_destruct
{
}

- (NSData)playerInfoContextRequestData
{
  return self->_playerInfoContextRequestData;
}

- (unint64_t)accountID
{
  return self->_accountID;
}

- (BOOL)getStreamerInfoContextDataUsingPlayerInfoContextData:(id)a3 returningData:(id *)a4 error:(id *)a5
{
  id v8 = a3;
  v9 = v8;
  fpStreamRef = self->_fpStreamRef;
  if (!fpStreamRef)
  {
    v13 = 0;
LABEL_5:
    v14 = 0;
    if (!a5) {
      goto LABEL_7;
    }
    goto LABEL_6;
  }
  uint64_t v16 = 0;
  id v11 = v8;
  OflR7BMjGok3A7mYQFt9((uint64_t)fpStreamRef, [v11 bytes], objc_msgSend(v11, "length"), 0, 0, (uint64_t)&v16);
  LOBYTE(fpStreamRef) = v12 == 0;
  if (v12)
  {
    v13 = [MEMORY[0x1E4F28C58] errorWithDomain:@"ICFairPlayError" code:v12 userInfo:0];
    goto LABEL_5;
  }
  v14 = objc_msgSend(MEMORY[0x1E4F1C9B8], "ic_dataWithFairPlayBytes:length:", v16, 0);
  v13 = 0;
  if (a5) {
LABEL_6:
  }
    *a5 = v13;
LABEL_7:
  if (a4) {
    *a4 = v14;
  }

  return (char)fpStreamRef;
}

- (BOOL)getPlayerDelegateInfoDataUsingPlayerDelegateInfoResponseData:(id)a3 returningData:(id *)a4 error:(id *)a5
{
  id v8 = a3;
  v9 = v8;
  fpStreamRef = self->_fpStreamRef;
  if (!fpStreamRef)
  {
    v13 = 0;
LABEL_5:
    v14 = 0;
    if (!a5) {
      goto LABEL_7;
    }
    goto LABEL_6;
  }
  uint64_t v17 = 0;
  unsigned int v16 = 0;
  id v11 = v8;
  TBGzuU3p5n1n((uint64_t)fpStreamRef, [v11 bytes], objc_msgSend(v11, "length"), (uint64_t)&v17, (uint64_t)&v16);
  LOBYTE(fpStreamRef) = v12 == 0;
  if (v12)
  {
    v13 = [MEMORY[0x1E4F28C58] errorWithDomain:@"ICFairPlayError" code:v12 userInfo:0];
    goto LABEL_5;
  }
  v14 = objc_msgSend(MEMORY[0x1E4F1C9B8], "ic_dataWithFairPlayBytes:length:", v17, v16);
  v13 = 0;
  if (a5) {
LABEL_6:
  }
    *a5 = v13;
LABEL_7:
  if (a4) {
    *a4 = v14;
  }

  return (char)fpStreamRef;
}

- (void)dealloc
{
  if (self->_fpStreamRef) {
    TsbHVdUOnzCHizuzrAdwYFpb();
  }
  v3.receiver = self;
  v3.super_class = (Class)ICFPStreamContext;
  [(ICFPStreamContext *)&v3 dealloc];
}

- (ICFPStreamContext)initWithVersion:(unsigned int)a3 contextID:(unsigned int)a4 contentInfo:(id)a5 returningError:(id *)a6
{
  uint64_t v7 = *(void *)&a4;
  uint64_t v8 = *(void *)&a3;
  id v10 = a5;
  id v11 = v10;
  memset(v21, 0, sizeof(v21));
  if (v10) {
    [v10 fpContentInfo];
  }
  uint64_t v20 = 0;
  int v19 = 0;
  v18 = 0;
  J3NocDTIn(v8, v7, (uint64_t)v21);
  if (v12)
  {
    if (a6)
    {
      *a6 = [MEMORY[0x1E4F28C58] errorWithDomain:@"ICFairPlayError" code:v12 userInfo:0];
    }

    v13 = 0;
  }
  else
  {
    v17.receiver = self;
    v17.super_class = (Class)ICFPStreamContext;
    v13 = [(ICFPStreamContext *)&v17 init];
    if (v13)
    {
      v13->_accountID = [v11 accountID];
      if (v20 && v19)
      {
        uint64_t v14 = objc_msgSend(MEMORY[0x1E4F1C9B8], "ic_dataWithFairPlayBytes:length:");
        playerInfoContextRequestData = v13->_playerInfoContextRequestData;
        v13->_playerInfoContextRequestData = (NSData *)v14;
      }
      else
      {
        playerInfoContextRequestData = v13->_playerInfoContextRequestData;
        v13->_playerInfoContextRequestData = 0;
      }

      v13->_fpStreamRef = v18;
    }
    if (a6) {
      *a6 = 0;
    }
  }

  return v13;
}

@end