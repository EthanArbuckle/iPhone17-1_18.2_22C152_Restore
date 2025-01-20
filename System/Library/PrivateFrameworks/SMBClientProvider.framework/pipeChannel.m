@interface pipeChannel
- (BOOL)pipeIsOpen;
- (NSString)pipeName;
- (SMBNode)fidCtx;
- (SMBPiston)pd;
- (int)pipeClose;
- (int)pipeOpen;
- (int)pipeTransceive:(id)a3 DataOut:(id)a4;
- (int)pipeWait;
- (int)pipeWrite:(id)a3;
- (pipeChannel)initWithName:(id)a3 Channel:(unsigned int)a4;
- (unsigned)channel;
- (unsigned)shareID;
- (void)setChannel:(unsigned int)a3;
- (void)setFidCtx:(id)a3;
- (void)setPd:(id)a3;
- (void)setPipeName:(id)a3;
- (void)setShareID:(unsigned int)a3;
@end

@implementation pipeChannel

- (pipeChannel)initWithName:(id)a3 Channel:(unsigned int)a4
{
  id v7 = a3;
  v13.receiver = self;
  v13.super_class = (Class)pipeChannel;
  v8 = [(pipeChannel *)&v13 init];
  v9 = v8;
  if (v8)
  {
    pd = v8->_pd;
    v8->_pd = 0;

    fidCtx = v9->_fidCtx;
    v9->_fidCtx = 0;

    v9->_shareID = 0;
    objc_storeStrong((id *)&v9->_pipeName, a3);
    v9->_channel = a4;
    v9->_pipeIsOpen = 0;
  }

  return v9;
}

- (int)pipeOpen
{
  uint64_t v31 = 0;
  v32 = &v31;
  uint64_t v33 = 0x3032000000;
  v34 = sub_100005DDC;
  v35 = sub_100005DEC;
  id v36 = 0;
  uint64_t v28 = 0;
  v29[0] = &v28;
  v29[1] = 0x2020000000;
  uint64_t v45 = 0;
  v46 = &v45;
  uint64_t v47 = 0x11810000000;
  long long v49 = 0u;
  long long v50 = 0u;
  long long v51 = 0u;
  long long v52 = 0u;
  long long v53 = 0u;
  long long v54 = 0u;
  long long v55 = 0u;
  long long v56 = 0u;
  long long v57 = 0u;
  long long v58 = 0u;
  long long v59 = 0u;
  long long v60 = 0u;
  long long v61 = 0u;
  long long v62 = 0u;
  long long v63 = 0u;
  v48 = &unk_10007BB3D;
  uint64_t v64 = 0;
  int v30 = 0;
  if (self->_pipeIsOpen)
  {
    id v3 = &_os_log_default;
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
    {
      int v4 = [(pipeChannel *)self channel];
      sub_10004CDD4((uint64_t)buf, v4, v5);
    }

    int v6 = 0;
  }
  else
  {
    unsigned int v7 = [(pipeChannel *)self pipeWait];
    *(_DWORD *)(v29[0] + 24) = v7;
    if (v7)
    {
      id v8 = &_os_log_default;
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
        sub_10004CD74((uint64_t)v29, buf, [(pipeChannel *)self channel]);
      }

      int v6 = *(_DWORD *)(v29[0] + 24);
    }
    else
    {
      v9 = dispatch_group_create();
      v10 = malloc_type_malloc(0xF8uLL, 0x10800407AD7242AuLL);
      _OWORD *v10 = 0u;
      v10[1] = 0u;
      *((void *)v10 + 30) = 0;
      v10[13] = 0u;
      v10[14] = 0u;
      v10[11] = 0u;
      v10[12] = 0u;
      v10[9] = 0u;
      v10[10] = 0u;
      v10[7] = 0u;
      v10[8] = 0u;
      v10[5] = 0u;
      v10[6] = 0u;
      v10[3] = 0u;
      v10[4] = 0u;
      v10[2] = 0u;
      *((_DWORD *)v10 + 7) = 1;
      *(_OWORD *)((char *)v10 + 12) = xmmword_10006C3B0;
      dispatch_group_enter(v9);
      v11 = [(pipeChannel *)self pd];
      uint64_t v12 = [(pipeChannel *)self shareID];
      objc_super v13 = [(pipeChannel *)self pipeName];
      v22[0] = _NSConcreteStackBlock;
      v22[1] = 3221225472;
      v22[2] = sub_100005DF4;
      v22[3] = &unk_1000887C0;
      v24 = &v45;
      v25 = &v31;
      v26 = &v28;
      v27 = v10;
      v14 = v9;
      v23 = v14;
      +[smb_subr sendCreateFile:v11 ShareID:v12 FileName:v13 StreamName:0 Param:v10 CompletionHandler:v22];

      dispatch_group_wait(v14, 0xFFFFFFFFFFFFFFFFLL);
      [(pipeChannel *)self setFidCtx:v32[5]];
      v15 = [(pipeChannel *)self fidCtx];
      LOBYTE(v10) = v15 == 0;

      if (v10)
      {
        id v16 = &_os_log_default;
        if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
        {
          unsigned int v18 = [(pipeChannel *)self channel];
          v19 = [(pipeChannel *)self pipeName];
          int v20 = *(_DWORD *)(v29[0] + 24);
          int v21 = *((_DWORD *)v46 + 21);
          *(_DWORD *)buf = 67109890;
          unsigned int v38 = v18;
          __int16 v39 = 2112;
          v40 = v19;
          __int16 v41 = 1024;
          int v42 = v20;
          __int16 v43 = 1024;
          int v44 = v21;
          _os_log_error_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR, "loginSession: channel: %u, failed to open pipe %@, sendCreateFile error: %d, ntstatus: 0x%x\n", buf, 0x1Eu);
        }
        int v6 = *(_DWORD *)(v29[0] + 24);
        if (!v6)
        {
          int v6 = 5;
          *(_DWORD *)(v29[0] + 24) = 5;
        }
      }
      else
      {
        self->_pipeIsOpen = 1;
        int v6 = *(_DWORD *)(v29[0] + 24);
      }
    }
  }
  _Block_object_dispose(&v45, 8);
  _Block_object_dispose(&v28, 8);
  _Block_object_dispose(&v31, 8);

  return v6;
}

- (int)pipeWait
{
  uint64_t v17 = 0;
  unsigned int v18 = &v17;
  uint64_t v19 = 0x2020000000;
  int v20 = 0;
  id v3 = dispatch_group_create();
  dispatch_group_enter(v3);
  int v4 = [(pipeChannel *)self pd];
  uint64_t v5 = [(pipeChannel *)self pipeName];
  uint64_t v6 = [(pipeChannel *)self shareID];
  v11 = _NSConcreteStackBlock;
  uint64_t v12 = 3221225472;
  objc_super v13 = sub_1000060C8;
  v14 = &unk_1000886F8;
  id v16 = &v17;
  unsigned int v7 = v3;
  v15 = v7;
  +[smb_subr sendPipeWait:v4 Pipe:v5 ShareID:v6 Timeout:0 CompletionHandler:&v11];

  dispatch_group_wait(v7, 0xFFFFFFFFFFFFFFFFLL);
  if (*((_DWORD *)v18 + 6))
  {
    id v8 = &_os_log_default;
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
    {
      [(pipeChannel *)self channel];
      [(pipeChannel *)self pipeName];
      objc_claimAutoreleasedReturnValue();
      sub_10004CE18();
    }

    int v9 = *((_DWORD *)v18 + 6);
  }
  else
  {
    int v9 = 0;
  }

  _Block_object_dispose(&v17, 8);
  return v9;
}

- (int)pipeClose
{
  uint64_t v15 = 0;
  id v16 = &v15;
  uint64_t v17 = 0x2020000000;
  int v18 = 0;
  if (self->_pipeIsOpen)
  {
    id v3 = [(pipeChannel *)self fidCtx];

    if (v3)
    {
      int v4 = dispatch_group_create();
      uint64_t v5 = malloc_type_malloc(0x40uLL, 0x100004022DBA428uLL);
      v5[2] = 0u;
      v5[3] = 0u;
      *uint64_t v5 = 0u;
      v5[1] = 0u;
      dispatch_group_enter(v4);
      uint64_t v6 = [(pipeChannel *)self fidCtx];
      v11[0] = _NSConcreteStackBlock;
      v11[1] = 3221225472;
      v11[2] = sub_100006300;
      v11[3] = &unk_1000887E8;
      objc_super v13 = &v15;
      v14 = v5;
      id v3 = v4;
      uint64_t v12 = v3;
      +[smb_subr sendClose:v6 Param:v5 GetPostAttrs:0 CompletionHandler:v11];

      dispatch_group_wait(v3, 0xFFFFFFFFFFFFFFFFLL);
      if (*((_DWORD *)v16 + 6))
      {
        id v7 = &_os_log_default;
        if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
        {
          [(pipeChannel *)self channel];
          [(pipeChannel *)self pipeName];
          objc_claimAutoreleasedReturnValue();
          sub_10004CE64();
        }
      }
    }
    self->_pipeIsOpen = 0;
    fidCtx = self->_fidCtx;
    self->_fidCtx = 0;

    int v9 = *((_DWORD *)v16 + 6);
  }
  else
  {
    int v9 = 0;
  }
  _Block_object_dispose(&v15, 8);
  return v9;
}

- (int)pipeTransceive:(id)a3 DataOut:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v23 = 0;
  v24 = &v23;
  uint64_t v25 = 0x2020000000;
  int v26 = 0;
  if ([(pipeChannel *)self pipeIsOpen])
  {
    id v8 = dispatch_group_create();
    dispatch_group_enter(v8);
    int v9 = [(pipeChannel *)self fidCtx];
    uint64_t v17 = _NSConcreteStackBlock;
    uint64_t v18 = 3221225472;
    uint64_t v19 = sub_1000065A8;
    int v20 = &unk_1000886F8;
    v22 = &v23;
    v10 = v8;
    int v21 = v10;
    +[smb_subr sendPipeTransceive:v9 InData:v6 OutData:v7 CompletionHandler:&v17];

    dispatch_group_wait(v10, 0xFFFFFFFFFFFFFFFFLL);
    if (*((_DWORD *)v24 + 6))
    {
      id v11 = &_os_log_default;
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
      {
        [(pipeChannel *)self channel];
        [(pipeChannel *)self pipeName];
        objc_claimAutoreleasedReturnValue();
        sub_10004CEB0();
      }

      int v12 = *((_DWORD *)v24 + 6);
    }
    else
    {
      int v12 = 0;
    }
  }
  else
  {
    id v13 = &_os_log_default;
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
    {
      int v14 = [(pipeChannel *)self channel];
      uint64_t v15 = [(pipeChannel *)self pipeName];
      sub_10004CEFC(v15, (uint64_t)v27, v14);
    }

    int v12 = 9;
    *((_DWORD *)v24 + 6) = 9;
  }
  _Block_object_dispose(&v23, 8);

  return v12;
}

- (int)pipeWrite:(id)a3
{
  id v4 = a3;
  uint64_t v20 = 0;
  int v21 = &v20;
  uint64_t v22 = 0x2020000000;
  int v23 = 0;
  if ([(pipeChannel *)self pipeIsOpen])
  {
    uint64_t v5 = malloc_type_malloc(0x20uLL, 0x1010040BA4D407CuLL);
    *uint64_t v5 = 0u;
    v5[1] = 0u;
    *((_DWORD *)v5 + 4) = [v4 length];
    id v6 = v4;
    *((void *)v5 + 1) = [v6 bytes];
    id v7 = dispatch_group_create();
    dispatch_group_enter(v7);
    id v8 = [(pipeChannel *)self fidCtx];
    v16[0] = _NSConcreteStackBlock;
    v16[1] = 3221225472;
    v16[2] = sub_10000684C;
    v16[3] = &unk_1000887E8;
    uint64_t v18 = &v20;
    uint64_t v19 = v5;
    int v9 = v7;
    uint64_t v17 = v9;
    +[smb_subr sendWrite:v8 Param:v5 WriteBuf:v6 CompletionHandler:v16];

    dispatch_group_wait(v9, 0xFFFFFFFFFFFFFFFFLL);
    if (*((_DWORD *)v21 + 6))
    {
      id v10 = &_os_log_default;
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
      {
        [(pipeChannel *)self channel];
        [(pipeChannel *)self pipeName];
        objc_claimAutoreleasedReturnValue();
        sub_10004CF54();
      }

      int v11 = *((_DWORD *)v21 + 6);
    }
    else
    {
      int v11 = 0;
    }
  }
  else
  {
    int v9 = &_os_log_default;
    id v12 = &_os_log_default;
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
    {
      int v13 = [(pipeChannel *)self channel];
      int v14 = [(pipeChannel *)self pipeName];
      sub_10004CFA0(v14, (uint64_t)v24, v13);
      int v11 = 9;
      int v9 = &_os_log_default;
    }
    else
    {
      int v11 = 9;
    }
  }

  _Block_object_dispose(&v20, 8);
  return v11;
}

- (SMBPiston)pd
{
  return (SMBPiston *)objc_getProperty(self, a2, 24, 1);
}

- (void)setPd:(id)a3
{
}

- (NSString)pipeName
{
  return (NSString *)objc_getProperty(self, a2, 32, 1);
}

- (void)setPipeName:(id)a3
{
}

- (SMBNode)fidCtx
{
  return (SMBNode *)objc_getProperty(self, a2, 40, 1);
}

- (void)setFidCtx:(id)a3
{
}

- (unsigned)shareID
{
  return self->_shareID;
}

- (void)setShareID:(unsigned int)a3
{
  self->_shareID = a3;
}

- (unsigned)channel
{
  return self->_channel;
}

- (void)setChannel:(unsigned int)a3
{
  self->_channel = a3;
}

- (BOOL)pipeIsOpen
{
  return self->_pipeIsOpen;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_fidCtx, 0);
  objc_storeStrong((id *)&self->_pipeName, 0);
  objc_storeStrong((id *)&self->_pd, 0);
}

@end