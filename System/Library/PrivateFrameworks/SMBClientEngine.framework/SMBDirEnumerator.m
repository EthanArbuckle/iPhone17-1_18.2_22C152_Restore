@interface SMBDirEnumerator
+ (void)enumeratorWithParameters:(id)a3 onShareID:(unsigned int)a4 dirName:(id)a5 lookUpName:(id)a6 searchFlags:(unsigned int)a7 outParameters:(smb_dir_enum_out *)a8 callBack:(id)a9;
- (id)init:(id)a3 onShareID:(unsigned int)a4 dirName:(id)a5 lookUpName:(id)a6 searchFlags:(unsigned int)a7 outParameters:(smb_dir_enum_out *)a8 callBack:(id)a9;
- (int)cleanup;
- (int)commonInit:(id)a3 onShareID:(unsigned int)a4 dirName:(id)a5 lookUpName:(id)a6 searchFlags:(unsigned int)a7 outParameters:(smb_dir_enum_out *)a8;
- (int)smb2_smb_parse_query_dir_both_dir_info:(mdchain *)a3;
- (int)smb2_smb_query_dir:(unsigned int *)a3;
- (int)smb2fs_smb_findnext:(unsigned int *)a3;
- (void)cleanup;
- (void)close:(smb_dir_enum_out *)a3 callBack:(id)a4;
- (void)dealloc;
- (void)nextEntry:(id)a3 outParameters:(smb_dir_enum_out *)a4 callBack:(id)a5;
@end

@implementation SMBDirEnumerator

- (int)cleanup
{
  f_create_rqp = self->f_create_rqp;
  if (f_create_rqp)
  {
    [(SMB_rq *)f_create_rqp smb_rq_done];
    v4 = self->f_create_rqp;
    self->f_create_rqp = 0;
  }
  f_query_dir_rqp = self->f_query_dir_rqp;
  if (f_query_dir_rqp)
  {
    [(SMB_rq *)f_query_dir_rqp smb_rq_done];
    v6 = self->f_query_dir_rqp;
    self->f_query_dir_rqp = 0;
  }
  if (self->f_need_close == 1)
  {
    pd = self->pd;
    if (pd)
    {
      v8 = [(SMBPiston *)pd sock];
      if (!v8)
      {
LABEL_15:
        self->f_need_close = 0;
        goto LABEL_16;
      }
      v9 = [(SMBPiston *)self->pd sock];
      int v10 = [v9 writeEnabled];

      if (v10 == 1)
      {
        LODWORD(v8) = smb2_smb_close_fid(self->f_node, 0, 0);
        if (v8 && piston_log_level && os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
          -[SMBDirEnumerator cleanup]();
        }
        goto LABEL_15;
      }
    }
    LODWORD(v8) = 0;
    goto LABEL_15;
  }
  LODWORD(v8) = 0;
LABEL_16:
  self->f_flags = 0;
  return (int)v8;
}

- (void)close:(smb_dir_enum_out *)a3 callBack:(id)a4
{
  v5 = (void (**)(id, uint64_t))a4;
  objc_initWeak(&location, self);
  v6 = [(SMBPiston *)self->pd sock];

  if (!v6)
  {
    BOOL v9 = os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR);
    if (v9)
    {
      -[SMBDirEnumerator close:callBack:](v9, v10, v11, v12, v13, v14, v15, v16);
      if (!v5) {
        goto LABEL_6;
      }
    }
    else if (!v5)
    {
      goto LABEL_6;
    }
    v5[2](v5, 57);
    goto LABEL_6;
  }
  v7 = [(SMBPiston *)self->pd sock];
  v8 = objc_msgSend(v7, "signing_queue");
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __35__SMBDirEnumerator_close_callBack___block_invoke;
  block[3] = &unk_265072C28;
  v18 = v5;
  objc_copyWeak(&v19, &location);
  dispatch_async(v8, block);

  objc_destroyWeak(&v19);
LABEL_6:
  objc_destroyWeak(&location);
}

void __35__SMBDirEnumerator_close_callBack___block_invoke(uint64_t a1)
{
  uint64_t v5 = MEMORY[0x2455D48A0](*(void *)(a1 + 32));
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  uint64_t v3 = [WeakRetained cleanup];

  v4 = (void *)v5;
  if (v5)
  {
    (*(void (**)(uint64_t, uint64_t))(v5 + 16))(v5, v3);
    v4 = (void *)v5;
  }
}

- (void)dealloc
{
  [(SMBDirEnumerator *)self cleanup];
  v3.receiver = self;
  v3.super_class = (Class)SMBDirEnumerator;
  [(SMBDirEnumerator *)&v3 dealloc];
}

- (int)commonInit:(id)a3 onShareID:(unsigned int)a4 dirName:(id)a5 lookUpName:(id)a6 searchFlags:(unsigned int)a7 outParameters:(smb_dir_enum_out *)a8
{
  char v9 = a7;
  id v15 = a3;
  id v16 = a5;
  v17 = (NSString *)a6;
  objc_storeStrong((id *)&self->pd, a3);
  int v18 = self->f_flags | 1;
  self->f_shareID = a4;
  self->f_flags = v18;
  if (v16) {
    id v19 = (NSString *)v16;
  }
  else {
    id v19 = 0;
  }
  f_createName = self->f_createName;
  self->f_createName = v19;

  if (v9)
  {
    unsigned int v21 = [(SMBPiston *)self->pd getSessionPtr][80] / 0x60u;
  }
  else
  {
    self->f_flags |= 4u;
    self->f_sfm_conversion = 32;
    LOWORD(v21) = 1;
  }
  self->f_searchCount = v21;
  self->f_infolevel = 37;
  self->f_attrmask = 22;
  f_lookupName = self->f_lookupName;
  self->f_lookupName = v17;

  bzero(self->f_NetworkNameBuffer, 0x3FCuLL);
  a8->var0 = 0;

  return 0;
}

- (id)init:(id)a3 onShareID:(unsigned int)a4 dirName:(id)a5 lookUpName:(id)a6 searchFlags:(unsigned int)a7 outParameters:(smb_dir_enum_out *)a8 callBack:(id)a9
{
  id v15 = a3;
  id v16 = a5;
  id v17 = a6;
  int v18 = (void (**)(id, uint64_t))a9;
  v44.receiver = self;
  v44.super_class = (Class)SMBDirEnumerator;
  id v19 = [(SMBDirEnumerator *)&v44 init];
  if (!v19) {
    goto LABEL_7;
  }
  v20 = [v15 sock];

  if (!v20)
  {
    BOOL v25 = os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR);
    if (v25)
    {
      -[SMBDirEnumerator init:onShareID:dirName:lookUpName:searchFlags:outParameters:callBack:](v25, v26, v27, v28, v29, v30, v31, v32);
      if (!v18) {
        goto LABEL_7;
      }
    }
    else if (!v18)
    {
LABEL_7:
      v24 = 0;
      goto LABEL_8;
    }
    v18[2](v18, 57);
    goto LABEL_7;
  }
  v34 = [v15 sock];
  unsigned int v21 = objc_msgSend(v34, "signing_queue");
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __89__SMBDirEnumerator_init_onShareID_dirName_lookUpName_searchFlags_outParameters_callBack___block_invoke;
  block[3] = &unk_265072C50;
  v22 = a8;
  v23 = v19;
  v36 = v23;
  id v37 = v15;
  unsigned int v42 = a4;
  id v38 = v16;
  unsigned int v43 = a7;
  id v39 = v17;
  v41 = v22;
  v40 = v18;
  dispatch_async(v21, block);

  v24 = v23;
LABEL_8:

  return v24;
}

uint64_t __89__SMBDirEnumerator_init_onShareID_dirName_lookUpName_searchFlags_outParameters_callBack___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) commonInit:*(void *)(a1 + 40) onShareID:*(unsigned int *)(a1 + 80) dirName:*(void *)(a1 + 48) lookUpName:*(void *)(a1 + 56) searchFlags:*(unsigned int *)(a1 + 84) outParameters:*(void *)(a1 + 72)];
  uint64_t result = *(void *)(a1 + 64);
  if (result)
  {
    objc_super v3 = *(uint64_t (**)(void))(result + 16);
    return v3();
  }
  return result;
}

+ (void)enumeratorWithParameters:(id)a3 onShareID:(unsigned int)a4 dirName:(id)a5 lookUpName:(id)a6 searchFlags:(unsigned int)a7 outParameters:(smb_dir_enum_out *)a8 callBack:(id)a9
{
  uint64_t v10 = *(void *)&a7;
  uint64_t v13 = *(void *)&a4;
  id v14 = a3;
  id v15 = a5;
  id v16 = a6;
  id v17 = (void (**)(id, uint64_t, void))a9;
  int v18 = objc_alloc_init(SMBDirEnumerator);
  id v19 = [v14 sock];

  if (!v19)
  {
    BOOL v20 = os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR);
    if (v20) {
      +[SMBDirEnumerator enumeratorWithParameters:onShareID:dirName:lookUpName:searchFlags:outParameters:callBack:](v20, v21, v22, v23, v24, v25, v26, v27);
    }
    v17[2](v17, 57, 0);
  }
  uint64_t v28 = [(SMBDirEnumerator *)v18 commonInit:v14 onShareID:v13 dirName:v15 lookUpName:v16 searchFlags:v10 outParameters:a8];
  if (v28) {
    uint64_t v29 = 0;
  }
  else {
    uint64_t v29 = v18;
  }
  ((void (**)(id, uint64_t, SMBDirEnumerator *))v17)[2](v17, v28, v29);
}

- (void)nextEntry:(id)a3 outParameters:(smb_dir_enum_out *)a4 callBack:(id)a5
{
  id v8 = a3;
  char v9 = (void (**)(id, uint64_t))a5;
  objc_initWeak(&location, self);
  if (!v8)
  {
    BOOL v13 = os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR);
    if (v13)
    {
      -[SMBDirEnumerator nextEntry:outParameters:callBack:](v13, v14, v15, v16, v17, v18, v19, v20);
      if (!v9) {
        goto LABEL_11;
      }
    }
    else if (!v9)
    {
      goto LABEL_11;
    }
    uint64_t v21 = 22;
LABEL_10:
    v9[2](v9, v21);
    goto LABEL_11;
  }
  uint64_t v10 = [(SMBPiston *)self->pd sock];

  if (!v10)
  {
    BOOL v22 = os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR);
    if (v22)
    {
      -[SMBDirEnumerator nextEntry:outParameters:callBack:](v22, v23, v24, v25, v26, v27, v28, v29);
      if (!v9) {
        goto LABEL_11;
      }
    }
    else if (!v9)
    {
      goto LABEL_11;
    }
    uint64_t v21 = 57;
    goto LABEL_10;
  }
  uint64_t v11 = [(SMBPiston *)self->pd sock];
  uint64_t v12 = objc_msgSend(v11, "signing_queue");
  v30[0] = MEMORY[0x263EF8330];
  v30[1] = 3221225472;
  v30[2] = __53__SMBDirEnumerator_nextEntry_outParameters_callBack___block_invoke;
  v30[3] = &unk_265072C78;
  v30[4] = self;
  objc_copyWeak(v33, &location);
  id v31 = v8;
  v33[1] = a4;
  uint64_t v32 = v9;
  dispatch_async(v12, v30);

  objc_destroyWeak(v33);
LABEL_11:
  objc_destroyWeak(&location);
}

uint64_t __53__SMBDirEnumerator_nextEntry_outParameters_callBack___block_invoke(uint64_t a1)
{
  uint64_t v37 = *MEMORY[0x263EF8340];
  unsigned int v34 = 0;
  unint64_t v33 = 0;
  v2 = (id *)(a1 + 56);
  uint64_t v3 = *(void *)(a1 + 32);
  while (1)
  {
    long long v35 = *(_OWORD *)(v3 + 1216);
    v4 = (_OWORD *)(v3 + 1112);
    _OWORD *v4 = 0u;
    v4[1] = 0u;
    v4[2] = 0u;
    v4[3] = 0u;
    v4[4] = 0u;
    v4[5] = 0u;
    v4[6] = 0u;
    v4[7] = 0u;
    v4[8] = 0u;
    v4[9] = 0u;
    v4[10] = 0u;
    v4[11] = 0u;
    v4[12] = 0u;
    v4[13] = 0u;
    v4[14] = 0u;
    *(_OWORD *)(*(void *)(a1 + 32) + 1216) = v35;
    id WeakRetained = objc_loadWeakRetained(v2);
    uint64_t v6 = objc_msgSend(WeakRetained, "smb2fs_smb_findnext:", &v34, v33);

    if (v6 == 35)
    {
      v7 = *(_OWORD **)(a1 + 32);
      long long v35 = v7[76];
      v7 = (_OWORD *)((char *)v7 + 1112);
      _OWORD *v7 = 0u;
      v7[1] = 0u;
      v7[2] = 0u;
      v7[3] = 0u;
      v7[4] = 0u;
      v7[5] = 0u;
      v7[6] = 0u;
      v7[7] = 0u;
      v7[8] = 0u;
      v7[9] = 0u;
      v7[10] = 0u;
      v7[11] = 0u;
      v7[12] = 0u;
      v7[13] = 0u;
      v7[14] = 0u;
      *(_OWORD *)(*(void *)(a1 + 32) + 1216) = v35;
      id v8 = objc_loadWeakRetained(v2);
      uint64_t v6 = objc_msgSend(v8, "smb2fs_smb_findnext:", &v34);
    }
    if (v6) {
      break;
    }
    uint64_t v3 = *(void *)(a1 + 32);
    uint64_t v9 = *(unsigned int *)(v3 + 1104);
    if (v9 == 4)
    {
      if (*(_DWORD *)(v3 + 84) != 3014702) {
        goto LABEL_10;
      }
    }
    else if (v9 != 2 || *(_WORD *)(v3 + 84) != 46)
    {
LABEL_10:
      unint64_t v33 = *(unsigned int *)(v3 + 1104);
      if ((unint64_t)(9 * v9) >= 0x1FFFF) {
        size_t v10 = 0x1FFFFLL;
      }
      else {
        size_t v10 = 9 * v9;
      }
      uint64_t v11 = (UInt8 *)malloc_type_malloc(v10, 0xA51215ECuLL);
      if (v11)
      {
        uint64_t v12 = v11;
        bzero(v11, v10);
        uint64_t v6 = smbfs_ntwrkname_tolocal_buffer((const UInt8 *)(*(void *)(a1 + 32) + 84), &v33, v12, v10, 1);
        if (!v6)
        {
          objc_msgSend(*(id *)(a1 + 40), "setNtstatus:", v34, v33);
          if (strnlen((const char *)v12, v10))
          {
            BOOL v13 = *(void **)(a1 + 40);
            uint64_t v14 = (void *)[[NSString alloc] initWithCString:v12 encoding:4];
            [v13 setName:v14];
          }
          uint64_t v15 = *(void **)(a1 + 40);
          uint64_t v16 = (_OWORD *)(*(void *)(a1 + 32) + 1112);
          long long v17 = *(_OWORD *)(*(void *)(a1 + 32) + 1320);
          v36[12] = *(_OWORD *)(*(void *)(a1 + 32) + 1304);
          v36[13] = v17;
          v36[14] = v16[14];
          long long v18 = v16[9];
          v36[8] = v16[8];
          v36[9] = v18;
          long long v19 = v16[11];
          v36[10] = v16[10];
          v36[11] = v19;
          long long v20 = v16[5];
          v36[4] = v16[4];
          v36[5] = v20;
          long long v21 = v16[7];
          v36[6] = v16[6];
          v36[7] = v21;
          long long v22 = v16[1];
          v36[0] = *v16;
          v36[1] = v22;
          long long v23 = v16[3];
          v36[2] = v16[2];
          v36[3] = v23;
          [v15 setAttributes:v36];
        }
        free(v12);
      }
      else
      {
        BOOL v24 = os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR);
        if (v24) {
          __53__SMBDirEnumerator_nextEntry_outParameters_callBack___block_invoke_cold_1(v24, v25, v26, v27, v28, v29, v30, v31);
        }
        uint64_t v6 = 12;
      }
      break;
    }
  }
  **(_DWORD **)(a1 + 64) = v34;
  uint64_t result = *(void *)(a1 + 48);
  if (result) {
    return (*(uint64_t (**)(uint64_t, uint64_t))(result + 16))(result, v6);
  }
  return result;
}

- (int)smb2fs_smb_findnext:(unsigned int *)a3
{
  *(void *)&v45[5] = *MEMORY[0x263EF8340];
  uint64_t v5 = [(SMBPiston *)self->pd getSessionPtr];
  objc_initWeak(&location, self);
  unsigned int v41 = 0;
  *a3 = 0;
  if (!self->f_output_buf_len)
  {
    if ((self->f_flags & 2) != 0)
    {
      int fid = 2;
      goto LABEL_39;
    }
    v43.tv_sec = 0;
    *(void *)&v43.tv_usec = 0;
    gettimeofday(&v43, 0);
    f_create_rqp = self->f_create_rqp;
    if (f_create_rqp)
    {
      [(SMB_rq *)f_create_rqp smb_rq_done];
      uint64_t v14 = self->f_create_rqp;
      self->f_create_rqp = 0;
    }
    f_query_dir_rqp = self->f_query_dir_rqp;
    if (f_query_dir_rqp)
    {
      [(SMB_rq *)f_query_dir_rqp smb_rq_done];
      uint64_t v16 = self->f_query_dir_rqp;
      self->f_query_dir_rqp = 0;
    }
    unsigned int f_flags = self->f_flags;
    self->unsigned int f_flags = f_flags & 0xFFFFEFFF;
    int v18 = f_flags & 1 | (2 * ((f_flags >> 2) & 1));
    char v19 = 1;
    while (1)
    {
      self->f_query_inp.fileInfoClass = self->f_infolevel;
      self->f_query_inp.flags = v18;
      self->f_query_inp.fileIndex = 0;
      if ((v5->option_flags & 4) != 0)
      {
        unsigned int sv_maxtransact = 0x10000;
      }
      else
      {
        unsigned int sv_maxtransact = v5->sv_maxtransact;
        if (sv_maxtransact >= 0x100000) {
          unsigned int sv_maxtransact = 0x100000;
        }
      }
      self->f_query_buffer_len = sv_maxtransact;
      self->f_query_inp.fileNameFlags = self->f_sfm_conversion;
      if (self->f_need_close)
      {
        self->f_output_buf_len = 0;
        id v21 = objc_loadWeakRetained(&location);
        int v22 = objc_msgSend(v21, "smb2_smb_query_dir:", &v41);
      }
      else
      {
        long long v23 = [[SMBNode alloc] init:self->pd];
        f_node = self->f_node;
        self->f_node = v23;

        uint64_t v25 = self->f_node;
        if (!v25)
        {
          BOOL v33 = os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR);
          if (v33) {
            -[SMBDirEnumerator smb2fs_smb_findnext:](v33, v34, v35, v36, v37, v38, v39, v40);
          }
          int fid = 12;
          goto LABEL_39;
        }
        int fid = [(SMBNode *)v25 commonInit:self->pd onShareID:self->f_shareID];
        if (fid)
        {
          if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
            -[SMBDirEnumerator smb2fs_smb_findnext:].cold.5();
          }
          goto LABEL_39;
        }
        int fid = smb2_smb_create_fid(self->f_node, self->f_createName, 0, 1048705, 2, 7, 1, 0, 0, 0, 0);
        if (fid)
        {
          if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
            -[SMBDirEnumerator smb2fs_smb_findnext:].cold.4();
          }
          goto LABEL_39;
        }
        self->f_need_close = 1;
        id v21 = objc_loadWeakRetained(&location);
        int v22 = objc_msgSend(v21, "smb2_smb_query_dir:", &v41);
      }
      int fid = v22;

      *a3 = v41;
      if (fid != 22) {
        break;
      }
      if (self->f_query_inp.ntStatus != -1073741811) {
        goto LABEL_37;
      }
      unint64_t option_flags = v5->option_flags;
      if ((option_flags >> 2) & 1 | ((v19 & 1) == 0)) {
        goto LABEL_37;
      }
      if (piston_log_level)
      {
        if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
          -[SMBDirEnumerator smb2fs_smb_findnext:](buf, v45);
        }
        unint64_t option_flags = v5->option_flags;
      }
      v5->unint64_t option_flags = option_flags | 4;
      uint64_t v27 = self->f_create_rqp;
      if (v27)
      {
        [(SMB_rq *)v27 smb_rq_done];
        uint64_t v28 = self->f_create_rqp;
        self->f_create_rqp = 0;
      }
      char v19 = 0;
      uint64_t v29 = self->f_query_dir_rqp;
      if (v29)
      {
        [(SMB_rq *)v29 smb_rq_done];
        uint64_t v30 = self->f_query_dir_rqp;
        self->f_query_dir_rqp = 0;

        char v19 = 0;
      }
    }
    if (fid)
    {
      if (fid == 2) {
        self->f_flags |= 2u;
      }
      goto LABEL_39;
    }
    int v32 = self->f_flags;
    if (v32) {
      self->unsigned int f_flags = v32 & 0xFFFFFFFE;
    }
    self->f_eofs = 0;
    self->f_attr.fa_reqtime.tv_sec = v43.tv_sec;
    self->f_attr.fa_reqtime.tv_nsec = 1000 * v43.tv_usec;
  }
  self->f_NetworkNameLen = 0;
  uint64_t v6 = self->f_query_dir_rqp;
  if (self->f_create_rqp)
  {
    char v7 = [(SMB_rq *)v6 sr_extflags];
    p_f_create_rqp = &self->f_create_rqp;
    if ((v7 & 2) != 0) {
      p_f_create_rqp = &self->f_query_dir_rqp;
    }
    uint64_t v6 = *p_f_create_rqp;
  }
  uint64_t v9 = [(SMB_rq *)v6 smb_rq_getreply];
  if (self->f_infolevel - 37 > 1)
  {
    if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
      -[SMBDirEnumerator smb2fs_smb_findnext:]();
    }
LABEL_37:
    int fid = 22;
  }
  else
  {
    uint64_t v10 = v9;
    id v11 = objc_loadWeakRetained(&location);
    int fid = objc_msgSend(v11, "smb2_smb_parse_query_dir_both_dir_info:", v10);
  }
LABEL_39:
  objc_destroyWeak(&location);
  return fid;
}

- (int)smb2_smb_parse_query_dir_both_dir_info:(mdchain *)a3
{
  uint64_t v298 = 0;
  unsigned int v297 = 0;
  uint64_t v295 = 0;
  unint64_t v296 = 0;
  long long v293 = 0u;
  long long v294 = 0u;
  uint64_t v292 = 0;
  long long v290 = 0u;
  long long v291 = 0u;
  unsigned __int16 v289 = 0;
  uint64_t v5 = [(SMBPiston *)self->pd getSessionPtr];
  __int16 v288 = 0;
  int uint32le = md_get_uint32le(a3, (_DWORD *)&v298 + 1);
  if (uint32le)
  {
    int v7 = uint32le;
    BOOL v8 = os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR);
    if (v8) {
      -[SMBDirEnumerator smb2_smb_parse_query_dir_both_dir_info:]9(v8, v9, v10, v11, v12, v13, v14, v15);
    }
    return v7;
  }
  int v16 = HIDWORD(v298);
  int v17 = md_get_uint32le(a3, &v297);
  if (v17)
  {
    int v7 = v17;
    BOOL v18 = os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR);
    if (v18) {
      -[SMBDirEnumerator smb2_smb_parse_query_dir_both_dir_info:]8(v18, v19, v20, v21, v22, v23, v24, v25);
    }
    return v7;
  }
  int uint64le = md_get_uint64le(a3, &v296);
  if (uint64le)
  {
    int v7 = uint64le;
    BOOL v27 = os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR);
    if (v27) {
      -[SMBDirEnumerator smb2_smb_parse_query_dir_both_dir_info:]7(v27, v28, v29, v30, v31, v32, v33, v34);
    }
    return v7;
  }
  if (v296) {
    smb_time_NT2local(v296, &self->f_attr.fa_crtime.tv_sec);
  }
  int v35 = md_get_uint64le(a3, &v296);
  if (v35)
  {
    int v7 = v35;
    BOOL v36 = os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR);
    if (v36) {
      -[SMBDirEnumerator smb2_smb_parse_query_dir_both_dir_info:]6(v36, v37, v38, v39, v40, v41, v42, v43);
    }
    return v7;
  }
  if (v296) {
    smb_time_NT2local(v296, &self->f_attr.fa_atime.tv_sec);
  }
  int v44 = md_get_uint64le(a3, &v296);
  if (v44)
  {
    int v7 = v44;
    BOOL v45 = os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR);
    if (v45) {
      -[SMBDirEnumerator smb2_smb_parse_query_dir_both_dir_info:]5(v45, v46, v47, v48, v49, v50, v51, v52);
    }
    return v7;
  }
  if (v296) {
    smb_time_NT2local(v296, &self->f_attr.fa_mtime.tv_sec);
  }
  int v53 = md_get_uint64le(a3, &v296);
  if (v53)
  {
    int v7 = v53;
    BOOL v54 = os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR);
    if (v54) {
      -[SMBDirEnumerator smb2_smb_parse_query_dir_both_dir_info:]4(v54, v55, v56, v57, v58, v59, v60, v61);
    }
    return v7;
  }
  if (v296) {
    smb_time_NT2local(v296, &self->f_attr.fa_chtime.tv_sec);
  }
  int v62 = md_get_uint64le(a3, &v296);
  if (v62)
  {
    int v7 = v62;
    BOOL v63 = os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR);
    if (v63) {
      -[SMBDirEnumerator smb2_smb_parse_query_dir_both_dir_info:]3(v63, v64, v65, v66, v67, v68, v69, v70);
    }
    return v7;
  }
  self->f_attr.fa_size = v296;
  int v71 = md_get_uint64le(a3, &v296);
  if (v71)
  {
    int v7 = v71;
    BOOL v72 = os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR);
    if (v72) {
      -[SMBDirEnumerator smb2_smb_parse_query_dir_both_dir_info:]2(v72, v73, v74, v75, v76, v77, v78, v79);
    }
    return v7;
  }
  self->f_attr.fa_data_alloc = v296;
  int v80 = md_get_uint32le(a3, &v298);
  if (v80)
  {
    int v7 = v80;
    BOOL v81 = os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR);
    if (v81) {
      -[SMBDirEnumerator smb2_smb_parse_query_dir_both_dir_info:]1(v81, v82, v83, v84, v85, v86, v87, v88);
    }
    return v7;
  }
  char v89 = v298;
  self->f_attr.fa_attr = v298;
  if ((v5->session_server_caps & 4) != 0 || (v89 & 0x10) != 0) {
    self->f_attr.fa_valid_mask |= 1uLL;
  }
  if ((v89 & 0x10) != 0) {
    int v90 = 2;
  }
  else {
    int v90 = 1;
  }
  self->f_attr.fa_vtype = v90;
  self->f_attr.fa_uid = 4294967195;
  self->f_attr.fa_gid = 4294967195;
  p_f_NetworkNameLen = (int *)&self->f_NetworkNameLen;
  int v92 = md_get_uint32le(a3, &self->f_NetworkNameLen);
  if (v92)
  {
    int v7 = v92;
    BOOL v93 = os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR);
    if (v93) {
      -[SMBDirEnumerator smb2_smb_parse_query_dir_both_dir_info:]0(v93, v94, v95, v96, v97, v98, v99, v100);
    }
    return v7;
  }
  self->f_attr.fa_valid_mask |= 2uLL;
  int v101 = md_get_uint32le(a3, (_DWORD *)&v295 + 1);
  if (v101)
  {
    int v7 = v101;
    BOOL v102 = os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR);
    if (v102) {
      -[SMBDirEnumerator smb2_smb_parse_query_dir_both_dir_info:]9(v102, v103, v104, v105, v106, v107, v108, v109);
    }
    return v7;
  }
  if ((self->f_attr.fa_attr & 0x400) != 0)
  {
    int v111 = HIDWORD(v295);
    self->f_attr.fa_reparse_tag = HIDWORD(v295);
    if (v111 == -1610612724)
    {
      self->f_attr.fa_valid_mask |= 1uLL;
      self->f_attr.fa_vtype = 5;
    }
  }
  else
  {
    self->f_attr.fa_reparse_tag = 0;
  }
  if (self->f_infolevel == 38)
  {
    int v112 = md_get_uint32le(a3, 0);
    if (v112)
    {
      int v7 = v112;
      BOOL v113 = os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR);
      if (v113) {
        -[SMBDirEnumerator smb2_smb_parse_query_dir_both_dir_info:].cold.4(v113, v114, v115, v116, v117, v118, v119, v120);
      }
      return v7;
    }
    int v130 = 80;
LABEL_61:
    int v7 = md_get_uint64le(a3, &self->f_attr.fa_ino);
    if (v7) {
      return v7;
    }
    unsigned int v131 = *p_f_NetworkNameLen;
    if (HIDWORD(v298)) {
      int v132 = HIDWORD(v298);
    }
    else {
      int v132 = *p_f_NetworkNameLen + v130;
    }
    if (v131 >= 0x3FD)
    {
      unsigned int v131 = 1020;
      int *p_f_NetworkNameLen = 1020;
    }
    f_NetworkNameBuffer = self->f_NetworkNameBuffer;
    int mem = md_get_mem(a3, (char *)self->f_NetworkNameBuffer, v131, 0);
    if (mem)
    {
      int v7 = mem;
      BOOL v135 = os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR);
      if (v135) {
        -[SMBDirEnumerator smb2_smb_parse_query_dir_both_dir_info:](v135, v136, v137, v138, v139, v140, v141, v142);
      }
      return v7;
    }
    smb2fs_smb_file_id_check((uint64_t)v5, self->f_attr.fa_ino, self->f_NetworkNameBuffer, *p_f_NetworkNameLen);
    unsigned int v175 = *p_f_NetworkNameLen;
    if (HIDWORD(v298))
    {
      uint64_t v176 = HIDWORD(v298) - v130 - v175;
      if ((int)v176 < 1)
      {
        if ((v176 & 0x80000000) != 0)
        {
          BOOL v204 = os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR);
          if (v204) {
            -[SMBDirEnumerator smb2_smb_parse_query_dir_both_dir_info:](v204, v205, v206, v207, v208, v209, v210, v211);
          }
          return 72;
        }
      }
      else
      {
        int v177 = md_get_mem(a3, 0, v176, 0);
        if (v177)
        {
          int v7 = v177;
          BOOL v178 = os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR);
          if (v178) {
            -[SMBDirEnumerator smb2_smb_parse_query_dir_both_dir_info:](v178, v179, v180, v181, v182, v183, v184, v185);
          }
          return v7;
        }
        unsigned int v175 = *p_f_NetworkNameLen;
      }
    }
    int v212 = v175 - 2;
    if (v175 >= 2)
    {
      if (f_NetworkNameBuffer[v175 - 1] || f_NetworkNameBuffer[v212]) {
        goto LABEL_109;
      }
      int *p_f_NetworkNameLen = v212;
      v175 -= 2;
    }
    if (v175)
    {
LABEL_109:
      int v7 = 0;
      self->f_resume_file_index = v297;
      self->f_eofs += v132;
      unsigned int v213 = self->f_output_buf_len - v132;
      if (!v16) {
        unsigned int v213 = 0;
      }
      self->f_output_buf_len = v213;
      return v7;
    }
    return 72;
  }
  int uint16 = md_get_uint16(a3, (char *)&v288);
  if (uint16)
  {
    int v7 = uint16;
    BOOL v122 = os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR);
    if (v122) {
      -[SMBDirEnumerator smb2_smb_parse_query_dir_both_dir_info:]8(v122, v123, v124, v125, v126, v127, v128, v129);
    }
    return v7;
  }
  if ((v5->option_flags & 0x40) != 0
    && (unint64_t session_server_caps = v5->session_server_caps, (session_server_caps & 0x11) != 0))
  {
    unsigned __int16 fa_fstatus = self->f_attr.fa_fstatus;
    self->f_attr.unsigned __int16 fa_fstatus = fa_fstatus & 0xFFFD;
    unint64_t fa_valid_mask = self->f_attr.fa_valid_mask;
    unint64_t v146 = fa_valid_mask & 0xFFFFFFFFFFFFFFFBLL;
    if (session_server_caps & 0x10) != 0 && (v288)
    {
      self->f_attr.unsigned __int16 fa_fstatus = fa_fstatus | 2;
      unint64_t v146 = fa_valid_mask | 4;
    }
    if ((self->f_attr.fa_attr & 0x400) != 0) {
      unsigned int v147 = 2032127;
    }
    else {
      unsigned int v147 = HIDWORD(v295);
    }
    self->f_attr.fa_max_access = v147;
    self->f_attr.unint64_t fa_valid_mask = v146 | 0x40;
    int v148 = md_get_uint64le(a3, &self->f_attr.fa_rsrc_size);
    if (v148)
    {
      int v7 = v148;
      BOOL v149 = os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR);
      if (v149) {
        -[SMBDirEnumerator smb2_smb_parse_query_dir_both_dir_info:]7(v149, v150, v151, v152, v153, v154, v155, v156);
      }
      return v7;
    }
    self->f_attr.fa_rsrc_alloc = smb2_smb_get_alloc_size(self->f_node, self->f_attr.fa_rsrc_size);
    self->f_attr.fa_valid_mask |= 0x10uLL;
    if (self->f_attr.fa_vtype == 2)
    {
      uint64_t v292 = 0;
      long long v290 = 0u;
      long long v291 = 0u;
      int v186 = md_get_uint64le(a3, &v290);
      if (v186)
      {
        int v7 = v186;
        BOOL v187 = os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR);
        if (v187) {
          -[SMBDirEnumerator smb2_smb_parse_query_dir_both_dir_info:]1(v187, v188, v189, v190, v191, v192, v193, v194);
        }
        return v7;
      }
      int uint16le = md_get_uint16le(a3, (_WORD *)&v290 + 4);
      if (uint16le)
      {
        int v7 = uint16le;
        BOOL v215 = os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR);
        if (v215) {
          -[SMBDirEnumerator smb2_smb_parse_query_dir_both_dir_info:]0(v215, v216, v217, v218, v219, v220, v221, v222);
        }
        return v7;
      }
      int v232 = md_get_uint16le(a3, (_WORD *)&v291 + 6);
      if (v232)
      {
        int v7 = v232;
        BOOL v233 = os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR);
        if (v233) {
          -[SMBDirEnumerator smb2_smb_parse_query_dir_both_dir_info:].cold.9(v233, v234, v235, v236, v237, v238, v239, v240);
        }
        return v7;
      }
      int v250 = md_get_uint32le(a3, (_DWORD *)&v291 + 2);
      if (v250)
      {
        int v7 = v250;
        BOOL v251 = os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR);
        if (v251) {
          -[SMBDirEnumerator smb2_smb_parse_query_dir_both_dir_info:].cold.8(v251, v252, v253, v254, v255, v256, v257, v258);
        }
        return v7;
      }
      long long v268 = v290;
      long long v269 = v291;
    }
    else
    {
      LODWORD(v295) = 0;
      long long v293 = 0u;
      long long v294 = 0u;
      int v195 = md_get_uint32le(a3, &v293);
      if (v195)
      {
        int v7 = v195;
        BOOL v196 = os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR);
        if (v196) {
          -[SMBDirEnumerator smb2_smb_parse_query_dir_both_dir_info:]6(v196, v197, v198, v199, v200, v201, v202, v203);
        }
        return v7;
      }
      int v223 = md_get_uint32le(a3, (_DWORD *)&v293 + 1);
      if (v223)
      {
        int v7 = v223;
        BOOL v224 = os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR);
        if (v224) {
          -[SMBDirEnumerator smb2_smb_parse_query_dir_both_dir_info:]5(v224, v225, v226, v227, v228, v229, v230, v231);
        }
        return v7;
      }
      int v241 = md_get_uint16le(a3, (_WORD *)&v293 + 4);
      if (v241)
      {
        int v7 = v241;
        BOOL v242 = os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR);
        if (v242) {
          -[SMBDirEnumerator smb2_smb_parse_query_dir_both_dir_info:]4(v242, v243, v244, v245, v246, v247, v248, v249);
        }
        return v7;
      }
      int v259 = md_get_uint16le(a3, (_WORD *)&v294 + 6);
      if (v259)
      {
        int v7 = v259;
        BOOL v260 = os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR);
        if (v260) {
          -[SMBDirEnumerator smb2_smb_parse_query_dir_both_dir_info:]3(v260, v261, v262, v263, v264, v265, v266, v267);
        }
        return v7;
      }
      int v270 = md_get_uint32le(a3, (_DWORD *)&v294 + 2);
      if (v270)
      {
        int v7 = v270;
        BOOL v271 = os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR);
        if (v271) {
          -[SMBDirEnumerator smb2_smb_parse_query_dir_both_dir_info:]2(v271, v272, v273, v274, v275, v276, v277, v278);
        }
        return v7;
      }
      long long v268 = v293;
      long long v269 = v294;
    }
    *(_OWORD *)self->f_attr.fa_finder_info = v268;
    *(_OWORD *)&self->f_attr.fa_finder_info[16] = v269;
    self->f_attr.fa_valid_mask |= 0x20uLL;
    int v279 = md_get_uint16le(a3, &v289);
    if (!v279)
    {
      int v130 = 104;
      if ((v5->session_server_caps & 4) != 0 && v289)
      {
        self->f_attr.fa_permissions = v289;
        self->f_attr.fa_valid_mask |= 8uLL;
      }
      goto LABEL_61;
    }
    int v7 = v279;
    BOOL v280 = os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR);
    if (v280) {
      -[SMBDirEnumerator smb2_smb_parse_query_dir_both_dir_info:].cold.7(v280, v281, v282, v283, v284, v285, v286, v287);
    }
  }
  else
  {
    int v157 = md_get_mem(a3, 0, 24, 0);
    if (v157)
    {
      int v7 = v157;
      BOOL v158 = os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR);
      if (v158) {
        -[SMBDirEnumerator smb2_smb_parse_query_dir_both_dir_info:].cold.6(v158, v159, v160, v161, v162, v163, v164, v165);
      }
    }
    else
    {
      int v166 = md_get_uint16le(a3, 0);
      if (!v166)
      {
        int v130 = 104;
        goto LABEL_61;
      }
      int v7 = v166;
      BOOL v167 = os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR);
      if (v167) {
        -[SMBDirEnumerator smb2_smb_parse_query_dir_both_dir_info:].cold.4(v167, v168, v169, v170, v171, v172, v173, v174);
      }
    }
  }
  return v7;
}

- (int)smb2_smb_query_dir:(unsigned int *)a3
{
  unsigned int f_query_buffer_len = self->f_query_buffer_len;
  unsigned int v29 = 0;
  *a3 = 0;
  uint64_t v5 = [(SMBNode *)self->f_node treeID];
  uint64_t v6 = [(SMBNode *)self->f_node onEncryptedShare];
  pd = self->pd;
  id v27 = 0;
  int dir = smb2_rq_alloc(14, v5, v6, &f_query_buffer_len, pd, &v27);
  id v9 = v27;
  id v10 = v27;
  if (dir) {
    goto LABEL_2;
  }
  objc_storeStrong((id *)&self->f_query_dir_rqp, v9);
  uint64_t v12 = [(SMB_rq *)self->f_query_dir_rqp smb_rq_getrequest];
  mb_put_uint16le((uint64_t)v12, 33);
  mb_put_uint8((uint64_t)v12, self->f_query_inp.fileInfoClass);
  mb_put_uint8((uint64_t)v12, self->f_query_inp.flags);
  mb_put_uint32le((uint64_t)v12, self->f_query_inp.fileIndex);
  mb_put_uint64le((uint64_t)v12, [(SMBNode *)self->f_node fid]);
  [(SMBNode *)self->f_node fid];
  mb_put_uint64le((uint64_t)v12, v13);
  mb_put_uint16le((uint64_t)v12, 96);
  uint64_t v14 = (_WORD *)mb_reserve((uint64_t)v12, 2uLL);
  mb_put_uint32le((uint64_t)v12, f_query_buffer_len);
  if (!self->f_lookupName)
  {
    *uint64_t v14 = 0;
    mb_put_uint16le((uint64_t)v12, 0);
LABEL_13:
    int dir = smb_rq_simple(self->pd, self->f_query_dir_rqp);
    *a3 = [(SMB_rq *)self->f_query_dir_rqp sr_ntstatus];
    if (dir)
    {
      if (dir != 2 && os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
        -[SMBDirEnumerator smb2_smb_query_dir:]((id *)&self->f_query_dir_rqp);
      }
    }
    else
    {
      uint64_t v25 = [(SMB_rq *)self->f_query_dir_rqp smb_rq_getreply];
      int dir = smb2_smb_parse_query_dir(v25, v26, 0, &self->f_output_buf_len);
    }
    goto LABEL_2;
  }
  smb2_rq_bstart(self->f_query_dir_rqp, (uint64_t)v14);
  cstring_len = (char *)smb_get_cstring_len(self->f_lookupName, &v29);
  if (cstring_len)
  {
    int v16 = smb2fs_fullpath((uint64_t)v12, cstring_len, v29, 0, 0, self->f_query_inp.fileNameFlags);
    if (v16)
    {
      int dir = v16;
      if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
        -[SMBDirEnumerator smb2_smb_query_dir:]();
      }
      goto LABEL_2;
    }
    smb_rq_bend(self->f_query_dir_rqp);
    goto LABEL_13;
  }
  BOOL v17 = os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR);
  if (v17) {
    -[SMBDirEnumerator smb2_smb_query_dir:](v17, v18, v19, v20, v21, v22, v23, v24);
  }
  int dir = 22;
LABEL_2:

  return dir;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->f_query_dir_rqp, 0);
  objc_storeStrong((id *)&self->f_create_rqp, 0);
  objc_storeStrong((id *)&self->f_node, 0);
  objc_storeStrong((id *)&self->f_createName, 0);
  objc_storeStrong((id *)&self->f_lookupName, 0);
  objc_storeStrong((id *)&self->pd, 0);
}

- (void)cleanup
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_23F849000, &_os_log_internal, v0, "%s: smb2_smb_close_fid failed %d\n", v1, v2, v3, v4, 2u);
}

- (void)close:(uint64_t)a3 callBack:(uint64_t)a4 .cold.1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)init:(uint64_t)a3 onShareID:(uint64_t)a4 dirName:(uint64_t)a5 lookUpName:(uint64_t)a6 searchFlags:(uint64_t)a7 outParameters:(uint64_t)a8 callBack:.cold.1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

+ (void)enumeratorWithParameters:(uint64_t)a3 onShareID:(uint64_t)a4 dirName:(uint64_t)a5 lookUpName:(uint64_t)a6 searchFlags:(uint64_t)a7 outParameters:(uint64_t)a8 callBack:.cold.1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)nextEntry:(uint64_t)a3 outParameters:(uint64_t)a4 callBack:(uint64_t)a5 .cold.1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)nextEntry:(uint64_t)a3 outParameters:(uint64_t)a4 callBack:(uint64_t)a5 .cold.2(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void __53__SMBDirEnumerator_nextEntry_outParameters_callBack___block_invoke_cold_1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)smb2fs_smb_findnext:(uint64_t)a3 .cold.1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)smb2fs_smb_findnext:.cold.2()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0(&dword_23F849000, &_os_log_internal, v0, "%s: unexpected info level %d\n", v1, v2, v3, v4, 2u);
}

- (void)smb2fs_smb_findnext:(uint8_t *)buf .cold.3(uint8_t *buf, void *a2)
{
  *(_DWORD *)buf = 136315138;
  *a2 = "-[SMBDirEnumerator smb2fs_smb_findnext:]";
  _os_log_error_impl(&dword_23F849000, &_os_log_internal, OS_LOG_TYPE_ERROR, "%s: SMB 2/3 server cant handle large OutputBufferLength in Query_Dir. Reducing to 64Kb.\n", buf, 0xCu);
}

- (void)smb2fs_smb_findnext:.cold.4()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_23F849000, &_os_log_internal, v0, "%s: Create failed <%d> \n", v1, v2, v3, v4, 2u);
}

- (void)smb2fs_smb_findnext:.cold.5()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_23F849000, &_os_log_internal, v0, "%s: commonInit failed %d \n", v1, v2, v3, v4, 2u);
}

- (void)smb2_smb_parse_query_dir_both_dir_info:(uint64_t)a3 .cold.1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)smb2_smb_parse_query_dir_both_dir_info:(uint64_t)a3 .cold.2(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)smb2_smb_parse_query_dir_both_dir_info:(uint64_t)a3 .cold.3(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)smb2_smb_parse_query_dir_both_dir_info:(uint64_t)a3 .cold.4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)smb2_smb_parse_query_dir_both_dir_info:(uint64_t)a3 .cold.6(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)smb2_smb_parse_query_dir_both_dir_info:(uint64_t)a3 .cold.7(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)smb2_smb_parse_query_dir_both_dir_info:(uint64_t)a3 .cold.8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)smb2_smb_parse_query_dir_both_dir_info:(uint64_t)a3 .cold.9(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)smb2_smb_parse_query_dir_both_dir_info:(uint64_t)a3 .cold.10(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)smb2_smb_parse_query_dir_both_dir_info:(uint64_t)a3 .cold.11(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)smb2_smb_parse_query_dir_both_dir_info:(uint64_t)a3 .cold.12(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)smb2_smb_parse_query_dir_both_dir_info:(uint64_t)a3 .cold.13(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)smb2_smb_parse_query_dir_both_dir_info:(uint64_t)a3 .cold.14(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)smb2_smb_parse_query_dir_both_dir_info:(uint64_t)a3 .cold.15(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)smb2_smb_parse_query_dir_both_dir_info:(uint64_t)a3 .cold.16(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)smb2_smb_parse_query_dir_both_dir_info:(uint64_t)a3 .cold.17(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)smb2_smb_parse_query_dir_both_dir_info:(uint64_t)a3 .cold.18(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)smb2_smb_parse_query_dir_both_dir_info:(uint64_t)a3 .cold.19(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)smb2_smb_parse_query_dir_both_dir_info:(uint64_t)a3 .cold.20(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)smb2_smb_parse_query_dir_both_dir_info:(uint64_t)a3 .cold.21(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)smb2_smb_parse_query_dir_both_dir_info:(uint64_t)a3 .cold.22(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)smb2_smb_parse_query_dir_both_dir_info:(uint64_t)a3 .cold.23(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)smb2_smb_parse_query_dir_both_dir_info:(uint64_t)a3 .cold.24(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)smb2_smb_parse_query_dir_both_dir_info:(uint64_t)a3 .cold.25(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)smb2_smb_parse_query_dir_both_dir_info:(uint64_t)a3 .cold.26(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)smb2_smb_parse_query_dir_both_dir_info:(uint64_t)a3 .cold.27(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)smb2_smb_parse_query_dir_both_dir_info:(uint64_t)a3 .cold.28(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)smb2_smb_parse_query_dir_both_dir_info:(uint64_t)a3 .cold.29(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)smb2_smb_query_dir:(id *)a1 .cold.1(id *a1)
{
  uint64_t v2 = *MEMORY[0x263EF8340];
  objc_msgSend(*a1, "sr_ntstatus");
  v1[0] = 136315650;
  OUTLINED_FUNCTION_2_0();
  _os_log_error_impl(&dword_23F849000, &_os_log_internal, OS_LOG_TYPE_ERROR, "%s: Reply failed <%d> ntStatus <0x%x> \n", (uint8_t *)v1, 0x18u);
}

- (void)smb2_smb_query_dir:(uint64_t)a3 .cold.2(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)smb2_smb_query_dir:.cold.3()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_23F849000, &_os_log_internal, v0, "%s: error 0x%x from smb_put_dmem for name\n", v1, v2, v3, v4, 2u);
}

@end