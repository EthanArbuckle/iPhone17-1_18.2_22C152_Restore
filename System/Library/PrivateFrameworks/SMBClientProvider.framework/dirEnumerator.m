@interface dirEnumerator
- (OS_dispatch_queue)dirEnumerationSyncQueue;
- (SMBDirEntry)dentObjSave;
- (SMBDirEntry)tmpDent;
- (SMBDirEnumerator)deObj;
- (dirEnumerator)initWithNode:(id)a3;
- (int)closeEnumeration;
- (int)enumState;
- (int)fillDirEntry:(char *)a3 withBufLen:(unint64_t)a4 DirEntry:(id)a5 IsReadDirAttr:(BOOL)a6 retBytesWritten:(unsigned int *)a7;
- (int)fillNextEntry:(char *)a3 BufLen:(unint64_t)a4 IsReadDirAttr:(BOOL)a5 BytesFilled:(unsigned int *)a6;
- (int)openEnumeration;
- (int)resetCurrentIndex:(unint64_t)a3;
- (int)restart_dir_enum;
- (int)skipAnEntry;
- (smbNode)dnp;
- (unint64_t)entryIndex;
- (void)_getEntriesInBuffer:(char *)a3 BufferLen:(unint64_t)a4 CookieIn:(unint64_t)a5 VerifyIn:(unint64_t)a6 IsReadDirAttr:(BOOL)a7 CompletionHandler:(id)a8;
- (void)close_dir_enum;
- (void)getEntriesInBuffer:(char *)a3 BufferLen:(unint64_t)a4 CookieIn:(unint64_t)a5 VerifyIn:(unint64_t)a6 IsReadDirAttr:(BOOL)a7 CompletionHandler:(id)a8;
- (void)processNextEntry:(unsigned int)a3 inbufPtr:(char *)a4 prevEntry:(void *)a5 inbufRemain:(unint64_t)a6 bytesFilled:(unsigned int)a7 IsReadDirAttr:(BOOL)a8 CompletionHandler:(id)a9;
- (void)resetAfterReconnect;
- (void)setDeObj:(id)a3;
- (void)setDentObjSave:(id)a3;
- (void)setDirEnumerationSyncQueue:(id)a3;
- (void)setEnumState:(int)a3;
- (void)setTmpDent:(id)a3;
@end

@implementation dirEnumerator

- (dirEnumerator)initWithNode:(id)a3
{
  id v5 = a3;
  v14.receiver = self;
  v14.super_class = (Class)dirEnumerator;
  v6 = [(dirEnumerator *)&v14 init];
  v7 = v6;
  if (v6)
  {
    deObj = v6->_deObj;
    v6->_deObj = 0;

    tmpDent = v7->_tmpDent;
    v7->_tmpDent = 0;

    objc_storeStrong((id *)&v7->_dnp, a3);
    dentObjSave = v7->_dentObjSave;
    v7->_dentObjSave = 0;

    v7->_entryIndex = 0;
    v7->_enumState = 0;
    dispatch_queue_t v11 = dispatch_queue_create("com.apple.SMBProvider.dirEnumerationSyncQueue", 0);
    dirEnumerationSyncQueue = v7->_dirEnumerationSyncQueue;
    v7->_dirEnumerationSyncQueue = (OS_dispatch_queue *)v11;
  }
  return v7;
}

- (void)resetAfterReconnect
{
  if ([(dirEnumerator *)self enumState] == 1)
  {
    [(dirEnumerator *)self closeEnumeration];
    [(dirEnumerator *)self setEnumState:0];
  }
}

- (int)closeEnumeration
{
  v3 = dispatch_group_create();
  uint64_t v15 = 0;
  v16 = &v15;
  uint64_t v17 = 0x2020000000;
  int v18 = 0;
  dispatch_group_enter(v3);
  v4 = [(dirEnumerator *)self deObj];
  v9 = _NSConcreteStackBlock;
  uint64_t v10 = 3221225472;
  dispatch_queue_t v11 = sub_100003A08;
  v12 = &unk_1000886F8;
  objc_super v14 = &v15;
  id v5 = v3;
  v13 = v5;
  +[smb_subr enumDirClose:v4 CompletionHandler:&v9];

  dispatch_group_wait(v5, 0xFFFFFFFFFFFFFFFFLL);
  v6 = [(dirEnumerator *)self dentObjSave];

  if (v6) {
    [(dirEnumerator *)self setDentObjSave:0];
  }
  self->_entryIndex = 0;
  self->_enumState = 0;
  int v7 = *((_DWORD *)v16 + 6);

  _Block_object_dispose(&v15, 8);
  return v7;
}

- (int)openEnumeration
{
  uint64_t v12 = 0;
  v13 = &v12;
  uint64_t v14 = 0x2020000000;
  int v15 = 0;
  v3 = dispatch_group_create();
  *((_DWORD *)v13 + 6) = 0;
  v4 = [(dirEnumerator *)self dentObjSave];

  if (v4) {
    [(dirEnumerator *)self setDentObjSave:0];
  }
  self->_entryIndex = 0;
  dispatch_group_enter(v3);
  id v5 = [(dirEnumerator *)self dnp];
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_100003B80;
  v9[3] = &unk_100088720;
  dispatch_queue_t v11 = &v12;
  v9[4] = self;
  v6 = v3;
  uint64_t v10 = v6;
  +[smb_subr enumDirOpen:v5 SearchPattern:@"*" IsWildcard:1 CompletionHandler:v9];

  dispatch_group_wait(v6, 0xFFFFFFFFFFFFFFFFLL);
  int v7 = *((_DWORD *)v13 + 6);

  _Block_object_dispose(&v12, 8);
  return v7;
}

- (int)restart_dir_enum
{
  int enumState = self->_enumState;
  if ((enumState - 1) >= 2)
  {
    if (enumState)
    {
      return 0;
    }
    else
    {
      int v4 = [(dirEnumerator *)self openEnumeration];
      if (v4 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
        sub_10004C3CC();
      }
    }
  }
  else
  {
    [(dirEnumerator *)self closeEnumeration];
    int v4 = [(dirEnumerator *)self openEnumeration];
    if (v4 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      sub_10004C43C();
    }
  }
  return v4;
}

- (void)close_dir_enum
{
  if ((self->_enumState - 1) <= 1) {
    [(dirEnumerator *)self closeEnumeration];
  }
}

- (int)skipAnEntry
{
  uint64_t v16 = 0;
  uint64_t v17 = &v16;
  uint64_t v18 = 0x2020000000;
  int v19 = 0;
  unint64_t entryIndex = self->_entryIndex;
  if (entryIndex > 1)
  {
    id v5 = [(dirEnumerator *)self tmpDent];

    if (v5
      || (id v6 = objc_alloc_init((Class)SMBDirEntry),
          [(dirEnumerator *)self setTmpDent:v6],
          v6,
          [(dirEnumerator *)self tmpDent],
          int v7 = objc_claimAutoreleasedReturnValue(),
          v7,
          v7))
    {
      v8 = dispatch_group_create();
      dispatch_group_enter(v8);
      v9 = [(dirEnumerator *)self deObj];
      uint64_t v10 = [(dirEnumerator *)self tmpDent];
      v13[0] = _NSConcreteStackBlock;
      v13[1] = 3221225472;
      v13[2] = sub_100003EAC;
      v13[3] = &unk_100088748;
      int v15 = &v16;
      v13[4] = self;
      dispatch_queue_t v11 = v8;
      uint64_t v14 = v11;
      +[smb_subr enumDirNext:v9 DirEnt:v10 CompletionHandler:v13];

      dispatch_group_wait(v11, 0xFFFFFFFFFFFFFFFFLL);
      int v3 = *((_DWORD *)v17 + 6);
    }
    else
    {
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
        sub_10004C4C4();
      }
      int v3 = 12;
      *((_DWORD *)v17 + 6) = 12;
    }
  }
  else
  {
    int v3 = 0;
    self->_unint64_t entryIndex = entryIndex + 1;
  }
  _Block_object_dispose(&v16, 8);
  return v3;
}

- (int)resetCurrentIndex:(unint64_t)a3
{
  if (self->_entryIndex <= a3 || (unsigned int v5 = [(dirEnumerator *)self restart_dir_enum]) == 0)
  {
    do
    {
      if (self->_entryIndex == a3) {
        return 0;
      }
      unsigned int v10 = [(dirEnumerator *)self skipAnEntry];
    }
    while (!v10);
    int v6 = v10;
    if (!os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      return v6;
    }
    int v7 = [(smbNode *)self->_dnp name];
    unint64_t entryIndex = self->_entryIndex;
    int v13 = 138413058;
    uint64_t v14 = v7;
    __int16 v15 = 2048;
    unint64_t v16 = entryIndex;
    __int16 v17 = 2048;
    unint64_t v18 = a3;
    __int16 v19 = 1024;
    int v20 = v6;
    v9 = "resetCurrentIndex: dnp: %@, entryIndex: %llu, requestedIndex: %llu, skipAnEntry error: %d\n";
    goto LABEL_9;
  }
  int v6 = v5;
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
  {
    int v7 = [(smbNode *)self->_dnp name];
    unint64_t v8 = self->_entryIndex;
    int v13 = 138413058;
    uint64_t v14 = v7;
    __int16 v15 = 2048;
    unint64_t v16 = v8;
    __int16 v17 = 2048;
    unint64_t v18 = a3;
    __int16 v19 = 1024;
    int v20 = v6;
    v9 = "resetCurrentIndex: dnp: %@, entryIndex: %llu, requestedIndex: %llu, restart_dir_enum error: %d\n";
LABEL_9:
    _os_log_error_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR, v9, (uint8_t *)&v13, 0x26u);
  }
  return v6;
}

- (int)fillDirEntry:(char *)a3 withBufLen:(unint64_t)a4 DirEntry:(id)a5 IsReadDirAttr:(BOOL)a6 retBytesWritten:(unsigned int *)a7
{
  BOOL v8 = a6;
  id v12 = a5;
  int v13 = v12;
  if (v12)
  {
    [v12 attributes];
    if (DWORD2(v87) == 1)
    {
      int v14 = 1;
      int v15 = 1;
      goto LABEL_12;
    }
    [v13 attributes];
    if (DWORD2(v72) == 2)
    {
      int v14 = 0;
      int v15 = 2;
      goto LABEL_12;
    }
    [v13 attributes];
    if (DWORD2(v57) == 5)
    {
      int v14 = 0;
      int v15 = 3;
      goto LABEL_12;
    }
  }
  else
  {
    long long v94 = 0u;
    long long v93 = 0u;
    long long v92 = 0u;
    long long v91 = 0u;
    long long v90 = 0u;
    long long v89 = 0u;
    long long v88 = 0u;
    long long v87 = 0u;
    long long v86 = 0u;
    long long v85 = 0u;
    long long v84 = 0u;
    long long v83 = 0u;
    long long v82 = 0u;
    long long v81 = 0u;
    long long v80 = 0u;
    long long v65 = 0u;
    long long v66 = 0u;
    long long v67 = 0u;
    long long v68 = 0u;
    long long v69 = 0u;
    long long v70 = 0u;
    long long v71 = 0u;
    long long v72 = 0u;
    long long v73 = 0u;
    long long v74 = 0u;
    long long v75 = 0u;
    long long v76 = 0u;
    long long v77 = 0u;
    long long v78 = 0u;
    long long v79 = 0u;
    long long v64 = 0u;
    long long v63 = 0u;
    long long v62 = 0u;
    long long v61 = 0u;
    long long v60 = 0u;
    long long v59 = 0u;
    long long v58 = 0u;
    long long v57 = 0u;
    memset(&v56[240], 0, 112);
  }
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
    sub_10004C6E0(v13, v13 == 0, v56);
  }
  int v14 = 0;
  int v15 = 0;
LABEL_12:
  id v16 = [v13 name];
  __int16 v17 = (const char *)[v16 UTF8String];

  size_t v18 = strnlen(v17, 0xFFuLL);
  size_t v19 = v18;
  if (v8)
  {
    if (a4 <= 0xC7)
    {
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEBUG)) {
        sub_10004C5D4(a4);
      }
      goto LABEL_22;
    }
    *((_WORD *)a3 + 5) = 200;
    unsigned __int16 v20 = (v18 & 0xFFF8) + 208;
    if ((v20 & 0xFFF8u) > a4)
    {
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEBUG)) {
        sub_10004C654();
      }
      goto LABEL_22;
    }
    *(void *)a3 = self->_entryIndex + 1;
    *((_WORD *)a3 + 4) = v20;
    *((_WORD *)a3 + 6) = v18;
    *((void *)a3 + 3) = 0;
    if (v13)
    {
      [v13 attributes];
      char v23 = v55;
    }
    else
    {
      char v23 = 0;
    }
    if ((((v23 & 1) == 0) & ~v14) == 0)
    {
      *((_DWORD *)a3 + 10) = v15;
      *((void *)a3 + 3) |= 1uLL;
    }
    if (v13)
    {
      [v13 attributes];
      if ((v54 & 0x40) != 0)
      {
        [v13 attributes];
        int v25 = sub_10003331C(v53);
      }
      else
      {
        int v25 = 448;
      }
      *((_DWORD *)a3 + 11) = v25;
      *((void *)a3 + 3) |= 2uLL;
      [v13 attributes];
      *((void *)a3 + 8) = v52;
      *((void *)a3 + 3) |= 0x40uLL;
      [v13 attributes];
      *((void *)a3 + 9) = v51;
      *((void *)a3 + 3) |= 0x80uLL;
      [v13 attributes];
      *((void *)a3 + 10) = v50;
      *((void *)a3 + 3) |= 0x100uLL;
      [v13 attributes];
      *((_OWORD *)a3 + 6) = v49;
      *((void *)a3 + 3) |= 0x400uLL;
      [v13 attributes];
      *((_OWORD *)a3 + 7) = v48;
      *((void *)a3 + 3) |= 0x800uLL;
      [v13 attributes];
      uint64_t v27 = *((void *)a3 + 3);
    }
    else
    {
      *((_DWORD *)a3 + 11) = 448;
      uint64_t v26 = *((void *)a3 + 3);
      *((void *)a3 + 3) = v26 | 2;
      *((void *)a3 + 8) = 0;
      *((void *)a3 + 9) = 0;
      *((void *)a3 + 10) = 0;
      *((_OWORD *)a3 + 6) = 0u;
      *((_OWORD *)a3 + 7) = 0u;
      uint64_t v27 = v26 | 0xDC2;
      long long v47 = 0u;
    }
    *((_OWORD *)a3 + 8) = v47;
    *((void *)a3 + 3) = v27 | 0x1000;
    memcpy(&a3[*((unsigned __int16 *)a3 + 5)], v17, v19);
    a3[*((unsigned __int16 *)a3 + 5) + v19] = 0;
    *((_DWORD *)a3 + 15) = 0;
    if (!v13 || ([v13 attributes], v46 != 2) && (objc_msgSend(v13, "attributes"), (v45 & 0x20) == 0)) {
      *((_DWORD *)a3 + 15) |= 0x10000u;
    }
    v28 = [(smbNode *)self->_dnp mp];
    v29 = v28;
    if (v28)
    {
      [v28 shareInfo];

      if ((BYTE8(v31) & 0x10) != 0)
      {
        if (!v13) {
          goto LABEL_56;
        }
        goto LABEL_47;
      }
    }
    else
    {
      uint64_t v36 = 0;
      long long v34 = 0u;
      long long v35 = 0u;
      long long v32 = 0u;
      long long v33 = 0u;
      long long v31 = 0u;
    }
    if (!v13)
    {
LABEL_56:
      *((void *)a3 + 3) |= 0x20uLL;
LABEL_57:
      int v22 = 0;
      *a7 = v20;
      goto LABEL_58;
    }
    [v13 attributes];
    if (v44 == 2)
    {
LABEL_49:
      objc_msgSend(v13, "attributes", (void)v31);
      if ((v42 & 2) != 0) {
        *((_DWORD *)a3 + 15) |= 0x8000u;
      }
      [v13 attributes];
      if ((v41 & 4) != 0)
      {
        [v13 attributes];
        if (v40 == -2147483618)
        {
          [v13 attributes];
          if ((v39 & 0x40) != 0 || ([v13 attributes], (v38 & 0x12) != 0)) {
            *((_DWORD *)a3 + 15) |= 0x40000000u;
          }
        }
      }
      goto LABEL_56;
    }
LABEL_47:
    objc_msgSend(v13, "attributes", v31, v32, v33, v34, v35, v36);
    if (v43) {
      *((_DWORD *)a3 + 15) |= 2u;
    }
    goto LABEL_49;
  }
  if ((((int)v18 + 29) & 0xFFF8uLL) <= a4)
  {
    unsigned __int16 v20 = (v18 + 29) & 0xFFF8;
    if (v13)
    {
      [v13 attributes];
      uint64_t v21 = v37;
    }
    else
    {
      uint64_t v21 = 0;
    }
    *(void *)a3 = v21;
    *((void *)a3 + 1) = self->_entryIndex + 1;
    *((_WORD *)a3 + 8) = v20;
    *((_WORD *)a3 + 9) = v19;
    a3[20] = v15;
    v24 = a3 + 21;
    memcpy(v24, v17, v19);
    v24[v19] = 0;
    goto LABEL_57;
  }
LABEL_22:
  int v22 = 55;
LABEL_58:

  return v22;
}

- (int)fillNextEntry:(char *)a3 BufLen:(unint64_t)a4 IsReadDirAttr:(BOOL)a5 BytesFilled:(unsigned int *)a6
{
  BOOL v7 = a5;
  uint64_t v66 = 0;
  long long v67 = &v66;
  uint64_t v68 = 0x2020000000;
  unsigned int v65 = 0;
  int v69 = 0;
  id v11 = objc_alloc_init((Class)SMBDirEntry);
  if (!v11)
  {
    *((_DWORD *)v67 + 6) = 12;
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      sub_10004C7B4();
    }
    goto LABEL_25;
  }
  if (!v7)
  {
    unint64_t entryIndex = self->_entryIndex;
    if (entryIndex == 1)
    {
      uint64_t v37 = [(smbNode *)self->_dnp parent];
      if (!v37) {
        uint64_t v37 = self->_dnp;
      }
      char v38 = [(smbNode *)v37 getSmbFattr];
      long long v39 = *(_OWORD *)&v38->fa_valid_mask;
      timespec fa_atime = v38->fa_atime;
      *(_OWORD *)&buf[16] = *(_OWORD *)&v38->fa_size;
      timespec v71 = fa_atime;
      *(_OWORD *)buf = v39;
      timespec fa_chtime = v38->fa_chtime;
      timespec fa_mtime = v38->fa_mtime;
      long long v43 = *(_OWORD *)&v38->fa_ino;
      timespec fa_crtime = v38->fa_crtime;
      long long v75 = v43;
      timespec v72 = fa_chtime;
      timespec v73 = fa_mtime;
      long long v44 = *(_OWORD *)&v38->fa_reqtime.tv_nsec;
      long long v45 = *(_OWORD *)&v38->fa_uid;
      long long v46 = *(_OWORD *)&v38->fa_flags_mask;
      long long v78 = *(_OWORD *)&v38->fa_permissions;
      long long v79 = v46;
      long long v76 = v44;
      long long v77 = v45;
      long long v47 = *(_OWORD *)&v38->fa_created_disp;
      long long v48 = *(_OWORD *)&v38->fa_rsrc_alloc;
      long long v49 = *(_OWORD *)&v38->fa_finder_info[24];
      long long v82 = *(_OWORD *)&v38->fa_finder_info[8];
      long long v83 = v49;
      long long v80 = v47;
      long long v81 = v48;
      [v11 setAttributes:buf];
      [v11 setName:@".."];
      unsigned int v50 = [(dirEnumerator *)self fillDirEntry:a3 withBufLen:a4 DirEntry:v11 IsReadDirAttr:0 retBytesWritten:&v65];
      uint64_t v51 = v67;
      *((_DWORD *)v67 + 6) = v50;
      if (v50)
      {
        if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
          sub_10004C8DC();
        }
        uint64_t v51 = v67;
      }
      else
      {
        *a6 = v65;
      }
      int v52 = *((_DWORD *)v51 + 6);

      goto LABEL_27;
    }
    if (!entryIndex)
    {
      int v13 = [(smbNode *)self->_dnp getSmbFattr];
      long long v14 = *(_OWORD *)&v13->fa_valid_mask;
      timespec v15 = v13->fa_atime;
      *(_OWORD *)&buf[16] = *(_OWORD *)&v13->fa_size;
      timespec v71 = v15;
      *(_OWORD *)buf = v14;
      timespec v16 = v13->fa_chtime;
      timespec v17 = v13->fa_mtime;
      long long v18 = *(_OWORD *)&v13->fa_ino;
      timespec fa_crtime = v13->fa_crtime;
      long long v75 = v18;
      timespec v72 = v16;
      timespec v73 = v17;
      long long v19 = *(_OWORD *)&v13->fa_reqtime.tv_nsec;
      long long v20 = *(_OWORD *)&v13->fa_uid;
      long long v21 = *(_OWORD *)&v13->fa_flags_mask;
      long long v78 = *(_OWORD *)&v13->fa_permissions;
      long long v79 = v21;
      long long v76 = v19;
      long long v77 = v20;
      long long v22 = *(_OWORD *)&v13->fa_created_disp;
      long long v23 = *(_OWORD *)&v13->fa_rsrc_alloc;
      long long v24 = *(_OWORD *)&v13->fa_finder_info[24];
      long long v82 = *(_OWORD *)&v13->fa_finder_info[8];
      long long v83 = v24;
      long long v80 = v22;
      long long v81 = v23;
      [v11 setAttributes:buf];
      [v11 setName:@"."];
      unsigned int v25 = [(dirEnumerator *)self fillDirEntry:a3 withBufLen:a4 DirEntry:v11 IsReadDirAttr:0 retBytesWritten:&v65];
      uint64_t v26 = v67;
      *((_DWORD *)v67 + 6) = v25;
      if (!v25)
      {
        *a6 = v65;
        goto LABEL_26;
      }
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
        sub_10004C86C();
      }
LABEL_25:
      uint64_t v26 = v67;
LABEL_26:
      int v52 = *((_DWORD *)v26 + 6);
      goto LABEL_27;
    }
  }
  uint64_t v27 = [(dirEnumerator *)self dentObjSave];
  BOOL v28 = v27 == 0;

  if (!v28)
  {
    v29 = [(dirEnumerator *)self dentObjSave];
    unsigned int v30 = [(dirEnumerator *)self fillDirEntry:a3 withBufLen:a4 DirEntry:v29 IsReadDirAttr:v7 retBytesWritten:&v65];
    *((_DWORD *)v67 + 6) = v30;

    if (*((_DWORD *)v67 + 6))
    {
      id v31 = &_os_log_default;
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEBUG))
      {
        long long v58 = [(dirEnumerator *)self dentObjSave];
        id v59 = [v58 name];
        id v60 = [v59 UTF8String];
        int v61 = *((_DWORD *)v67 + 6);
        *(_DWORD *)buf = 136315394;
        *(void *)&buf[4] = v60;
        *(_WORD *)&buf[12] = 1024;
        *(_DWORD *)&buf[14] = v61;
        _os_log_debug_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEBUG, "fillNextEntry: fattrSave- fillDirEntry for %s returned error: %d", buf, 0x12u);
      }
    }
    else
    {
      *a6 = v65;
      [(dirEnumerator *)self setDentObjSave:0];
    }
    goto LABEL_25;
  }
  long long v32 = dispatch_group_create();
  dispatch_group_enter(v32);
  long long v33 = [(dirEnumerator *)self deObj];
  v62[0] = _NSConcreteStackBlock;
  v62[1] = 3221225472;
  v62[2] = sub_100004FBC;
  v62[3] = &unk_1000886F8;
  long long v64 = &v66;
  long long v34 = v32;
  long long v63 = v34;
  +[smb_subr enumDirNext:v33 DirEnt:v11 CompletionHandler:v62];

  dispatch_group_wait(v34, 0xFFFFFFFFFFFFFFFFLL);
  long long v35 = v67;
  int v36 = *((_DWORD *)v67 + 6);
  if (v36)
  {
    if (v36 == 2)
    {
      *((_DWORD *)v67 + 6) = -1;
    }
    else
    {
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
        sub_10004C7FC();
      }
      long long v35 = v67;
    }
    v56 = (int *)(v35 + 3);
  }
  else
  {
    unsigned int v54 = [(dirEnumerator *)self fillDirEntry:a3 withBufLen:a4 DirEntry:v11 IsReadDirAttr:v7 retBytesWritten:&v65];
    char v55 = v67;
    *((_DWORD *)v67 + 6) = v54;
    v56 = (int *)(v55 + 3);
    if (v54)
    {
      [(dirEnumerator *)self setDentObjSave:v11];
      long long v57 = v67;
      *((_DWORD *)v67 + 6) = 55;
      v56 = (int *)(v57 + 3);
    }
    else
    {
      *a6 = v65;
    }
  }
  int v52 = *v56;

LABEL_27:
  _Block_object_dispose(&v66, 8);
  return v52;
}

- (void)getEntriesInBuffer:(char *)a3 BufferLen:(unint64_t)a4 CookieIn:(unint64_t)a5 VerifyIn:(unint64_t)a6 IsReadDirAttr:(BOOL)a7 CompletionHandler:(id)a8
{
  id v14 = a8;
  timespec v15 = [(dirEnumerator *)self dirEnumerationSyncQueue];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000050B4;
  block[3] = &unk_100088798;
  long long v19 = a3;
  unint64_t v20 = a4;
  unint64_t v21 = a5;
  unint64_t v22 = a6;
  BOOL v23 = a7;
  block[4] = self;
  id v18 = v14;
  id v16 = v14;
  dispatch_async(v15, block);
}

- (void)_getEntriesInBuffer:(char *)a3 BufferLen:(unint64_t)a4 CookieIn:(unint64_t)a5 VerifyIn:(unint64_t)a6 IsReadDirAttr:(BOOL)a7 CompletionHandler:(id)a8
{
  BOOL v8 = a7;
  id v14 = a8;
  int enumState = self->_enumState;
  if (enumState == 2)
  {
    if (a5)
    {
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEBUG)) {
        sub_10004CC4C();
      }
      uint64_t v17 = 4294966295;
      uint64_t v18 = 1;
      goto LABEL_14;
    }
    self->_int enumState = 0;
    uint64_t v19 = [(dirEnumerator *)self openEnumeration];
    if (v19)
    {
      uint64_t v17 = v19;
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEBUG)) {
        sub_10004CBD0();
      }
      goto LABEL_13;
    }
LABEL_15:
    unint64_t v20 = [(smbNode *)self->_dnp getReadDirVerifier];
    uint64_t v21 = v20;
    if (a5 && v20 != a6)
    {
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
        sub_10004CAC8(v21, a6);
      }
      unint64_t v22 = (void (*)(void *, uint64_t, uint64_t, void, void))v14[2];
      BOOL v23 = v14;
      uint64_t v24 = 4294966296;
LABEL_27:
      v22(v23, v24, v21, 0, 0);
      goto LABEL_28;
    }
    if (self->_entryIndex != a5)
    {
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
        sub_10004CA3C();
      }
      uint64_t v25 = [(dirEnumerator *)self resetCurrentIndex:a5];
      if (v25)
      {
        uint64_t v26 = v25;
        if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
          sub_10004C9CC();
        }
        unint64_t v22 = (void (*)(void *, uint64_t, uint64_t, void, void))v14[2];
        BOOL v23 = v14;
        uint64_t v24 = v26;
        goto LABEL_27;
      }
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEBUG)) {
        sub_10004C94C();
      }
    }
    [(dirEnumerator *)self processNextEntry:0 inbufPtr:a3 prevEntry:0 inbufRemain:a4 bytesFilled:0 IsReadDirAttr:v8 CompletionHandler:v14];
    goto LABEL_28;
  }
  if (enumState) {
    goto LABEL_15;
  }
  uint64_t v16 = [(dirEnumerator *)self openEnumeration];
  if (!v16) {
    goto LABEL_15;
  }
  uint64_t v17 = v16;
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEBUG)) {
    sub_10004CB54();
  }
LABEL_13:
  uint64_t v18 = 0;
LABEL_14:
  ((void (*)(void *, uint64_t, unint64_t, void, uint64_t))v14[2])(v14, v17, [(smbNode *)self->_dnp getReadDirVerifier], 0, v18);
LABEL_28:
}

- (void)processNextEntry:(unsigned int)a3 inbufPtr:(char *)a4 prevEntry:(void *)a5 inbufRemain:(unint64_t)a6 bytesFilled:(unsigned int)a7 IsReadDirAttr:(BOOL)a8 CompletionHandler:(id)a9
{
  id v16 = a9;
  uint64_t v17 = [(dirEnumerator *)self dirEnumerationSyncQueue];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000054C0;
  block[3] = &unk_100088798;
  BOOL v26 = a8;
  block[4] = self;
  id v20 = v16;
  unsigned int v24 = a3;
  unsigned int v25 = a7;
  uint64_t v21 = a5;
  unint64_t v22 = a4;
  unint64_t v23 = a6;
  id v18 = v16;
  dispatch_async(v17, block);
}

- (OS_dispatch_queue)dirEnumerationSyncQueue
{
  return (OS_dispatch_queue *)objc_getProperty(self, a2, 16, 1);
}

- (void)setDirEnumerationSyncQueue:(id)a3
{
}

- (SMBDirEnumerator)deObj
{
  return (SMBDirEnumerator *)objc_getProperty(self, a2, 24, 1);
}

- (void)setDeObj:(id)a3
{
}

- (SMBDirEntry)dentObjSave
{
  return (SMBDirEntry *)objc_getProperty(self, a2, 32, 1);
}

- (void)setDentObjSave:(id)a3
{
}

- (SMBDirEntry)tmpDent
{
  return (SMBDirEntry *)objc_getProperty(self, a2, 40, 1);
}

- (void)setTmpDent:(id)a3
{
}

- (smbNode)dnp
{
  return (smbNode *)objc_getProperty(self, a2, 48, 1);
}

- (unint64_t)entryIndex
{
  return self->_entryIndex;
}

- (int)enumState
{
  return self->_enumState;
}

- (void)setEnumState:(int)a3
{
  self->_int enumState = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dnp, 0);
  objc_storeStrong((id *)&self->_tmpDent, 0);
  objc_storeStrong((id *)&self->_dentObjSave, 0);
  objc_storeStrong((id *)&self->_deObj, 0);
  objc_storeStrong((id *)&self->_dirEnumerationSyncQueue, 0);
}

@end