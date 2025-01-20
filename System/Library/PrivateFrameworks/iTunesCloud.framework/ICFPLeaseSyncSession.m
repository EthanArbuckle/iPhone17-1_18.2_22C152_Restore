@interface ICFPLeaseSyncSession
+ (id)leaseSyncSessionWithID:(id)a3 accountID:(unint64_t)a4 mediaKind:(unsigned int)a5 returningLeaseSyncRequestData:(id *)a6 error:(id *)a7;
- (BOOL)endLeaseSyncAndReturnError:(id *)a3;
- (BOOL)getLeaseSyncRenewRequestData:(id *)a3 error:(id *)a4;
- (BOOL)importLeaseSyncResponseData:(id)a3 error:(id *)a4;
- (BOOL)processRenewResponseData:(id)a3 error:(id *)a4;
- (id)_initWithFPLeaseSync:(FPLeaseSyncOpaque_ *)a3 leaseID:(id)a4 accountID:(unint64_t)a5 hardwareInfo:(FairPlayHWInfo_ *)a6 mediaKind:(unsigned int)a7;
- (id)leaseID;
- (unint64_t)accountID;
- (unsigned)mediaKind;
- (void)dealloc;
@end

@implementation ICFPLeaseSyncSession

- (void).cxx_destruct
{
}

- (unsigned)mediaKind
{
  return self->_mediaKind;
}

- (id)leaseID
{
  return self->_leaseID;
}

- (unint64_t)accountID
{
  return self->_accountID;
}

- (BOOL)processRenewResponseData:(id)a3 error:(id *)a4
{
  fpLeaseSync = self->_fpLeaseSync;
  id v6 = a3;
  uint64_t v7 = [v6 bytes];
  [v6 length];

  i1IfStf2DSO((uint64_t)fpLeaseSync, v7);
  int v9 = v8;
  if (!v8)
  {
    v10 = 0;
    if (!a4) {
      goto LABEL_4;
    }
    goto LABEL_3;
  }
  v10 = [MEMORY[0x1E4F28C58] errorWithDomain:@"ICFairPlayError" code:v8 userInfo:0];
  if (a4) {
LABEL_3:
  }
    *a4 = v10;
LABEL_4:

  return v9 == 0;
}

- (BOOL)importLeaseSyncResponseData:(id)a3 error:(id *)a4
{
  fpLeaseSync = self->_fpLeaseSync;
  id v6 = a3;
  uint64_t v7 = [v6 bytes];
  [v6 length];

  Xr9TNsiQ((uint64_t)fpLeaseSync, v7);
  int v9 = v8;
  if (!v8)
  {
    v10 = 0;
    if (!a4) {
      goto LABEL_4;
    }
    goto LABEL_3;
  }
  v10 = [MEMORY[0x1E4F28C58] errorWithDomain:@"ICFairPlayError" code:v8 userInfo:0];
  if (a4) {
LABEL_3:
  }
    *a4 = v10;
LABEL_4:

  return v9 == 0;
}

- (BOOL)getLeaseSyncRenewRequestData:(id *)a3 error:(id *)a4
{
  unsigned int v12 = 0;
  uint64_t v11 = 0;
  S12yWPyxCU((uint64_t)self->_fpLeaseSync, (uint64_t)&v11, (uint64_t)&v12);
  int v7 = v6;
  if (v6)
  {
    int v8 = [MEMORY[0x1E4F28C58] errorWithDomain:@"ICFairPlayError" code:v6 userInfo:0];
    int v9 = 0;
    if (!a3) {
      goto LABEL_4;
    }
    goto LABEL_3;
  }
  int v9 = objc_msgSend(MEMORY[0x1E4F1C9B8], "ic_dataWithFairPlayBytes:length:", v11, v12);
  int v8 = 0;
  if (a3) {
LABEL_3:
  }
    *a3 = v9;
LABEL_4:
  if (a4) {
    *a4 = v8;
  }

  return v7 == 0;
}

- (BOOL)endLeaseSyncAndReturnError:(id *)a3
{
  fpLeaseSync = self->_fpLeaseSync;
  if (fpLeaseSync)
  {
    AohBfJYWOS6((uint64_t)fpLeaseSync);
    self->_fpLeaseSync = 0;
  }
  if (a3) {
    *a3 = 0;
  }
  return 1;
}

- (void)dealloc
{
  fpLeaseSync = self->_fpLeaseSync;
  if (fpLeaseSync)
  {
    AohBfJYWOS6((uint64_t)fpLeaseSync);
    self->_fpLeaseSync = 0;
  }
  v4.receiver = self;
  v4.super_class = (Class)ICFPLeaseSyncSession;
  [(ICFPLeaseSyncSession *)&v4 dealloc];
}

- (id)_initWithFPLeaseSync:(FPLeaseSyncOpaque_ *)a3 leaseID:(id)a4 accountID:(unint64_t)a5 hardwareInfo:(FairPlayHWInfo_ *)a6 mediaKind:(unsigned int)a7
{
  id v13 = a4;
  v18.receiver = self;
  v18.super_class = (Class)ICFPLeaseSyncSession;
  v14 = [(ICFPLeaseSyncSession *)&v18 init];
  v15 = v14;
  if (v14)
  {
    v14->_fpLeaseSync = a3;
    objc_storeStrong(&v14->_leaseID, a4);
    v15->_accountID = a5;
    long long v16 = *(_OWORD *)&a6->IDLength;
    *(void *)&v15->_hardwareInfo.ID[12] = *(void *)&a6->ID[12];
    *(_OWORD *)&v15->_hardwareInfo.IDLength = v16;
    v15->_mediaKind = a7;
  }

  return v15;
}

+ (id)leaseSyncSessionWithID:(id)a3 accountID:(unint64_t)a4 mediaKind:(unsigned int)a5 returningLeaseSyncRequestData:(id *)a6 error:(id *)a7
{
  uint64_t v9 = *(void *)&a5;
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  id v12 = a3;
  if (leaseSyncSessionWithID_accountID_mediaKind_returningLeaseSyncRequestData_error__sOnceToken != -1) {
    dispatch_once(&leaseSyncSessionWithID_accountID_mediaKind_returningLeaseSyncRequestData_error__sOnceToken, &__block_literal_global_7212);
  }
  long long v28 = 0uLL;
  uint64_t v29 = 0;
  if (!ICFairPlayGetHardwareInfo((uint64_t)&v28))
  {
    long long v16 = (void *)MEMORY[0x1E4F28C58];
    v15 = @"ICError";
    uint64_t v14 = -7500;
    goto LABEL_7;
  }
  uint64_t v25 = 0;
  unsigned int v24 = 0;
  uint64_t v23 = 0;
  WGrQCCz7(a4, (uint64_t)&v28, v9, (uint64_t)&v25, (uint64_t)&v23, (uint64_t)&v24);
  if (v13)
  {
    uint64_t v14 = v13;
    v15 = @"ICFairPlayError";
    long long v16 = (void *)MEMORY[0x1E4F28C58];
    goto LABEL_7;
  }
  if (!v25)
  {
    long long v16 = (void *)MEMORY[0x1E4F28C58];
    v15 = @"ICError";
    uint64_t v14 = 0;
LABEL_7:
    v17 = [v16 errorWithDomain:v15 code:v14 userInfo:0];
    objc_super v18 = 0;
    v19 = 0;
    if (!a7) {
      goto LABEL_9;
    }
    goto LABEL_8;
  }
  id v22 = objc_alloc((Class)a1);
  long long v26 = v28;
  uint64_t v27 = v29;
  objc_super v18 = (void *)[v22 _initWithFPLeaseSync:v25 leaseID:v12 accountID:a4 hardwareInfo:&v26 mediaKind:v9];
  v19 = objc_msgSend(MEMORY[0x1E4F1C9B8], "ic_dataWithFairPlayBytes:length:", v23, v24);
  v17 = 0;
  if (a7) {
LABEL_8:
  }
    *a7 = v17;
LABEL_9:
  if (a6) {
    *a6 = v19;
  }
  id v20 = v18;

  return v20;
}

@end