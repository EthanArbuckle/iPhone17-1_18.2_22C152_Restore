@interface smb_subr
+ (id)encodePath:(id)a3;
+ (id)makeWindowsPath:(id)a3 withName:(id)a4;
+ (int)queryShareRootSync:(id)a3 ShareID:(unsigned int)a4 FAttrs:(smbfattr *)a5;
+ (int)sendLogoff:(id)a3 Param:(smb_login_out *)a4;
+ (int)sendNegotiate:(id)a3 Server:(id)a4 netBIOSName:(id)a5 VPNCookie:(id)a6 Result:(smb_negotiate *)a7;
+ (int)sendQueryShare:(id)a3 ShareID:(unsigned int)a4 Model:(id)a5 FSName:(id)a6 Param:(smb_query_share *)a7;
+ (int)sendSessionSetup:(id)a3 User:(id)a4 Password:(id)a5 Realm:(id)a6 Param:(smb_login_out *)a7;
+ (int)sendTreeConnect:(id)a3 ShareName:(id)a4 Param:(smb_tree_connect_disc *)a5;
+ (int)sendTreeDisonnect:(id)a3 ShareID:(unsigned int)a4 Param:(smb_tree_connect_disc *)a5;
+ (void)checkForWindowsSymlink:(id)a3 CompletionHandler:(id)a4;
+ (void)createFile:(id)a3 NewName:(id)a4 FileType:(int)a5 RetAttr:(smbfattr *)a6 CompletionHandler:(id)a7;
+ (void)createReparseSymlink:(id)a3 NewName:(id)a4 Target:(id)a5 RetAttr:(smbfattr *)a6 CompletionHandler:(id)a7;
+ (void)createWindowsSymlink:(id)a3 NewName:(id)a4 Target:(id)a5 RetAttr:(smbfattr *)a6 CompletionHandler:(id)a7;
+ (void)deleteNameInParent:(id)a3 DeleteName:(id)a4 FileType:(int)a5 CompletionHandler:(id)a6;
+ (void)deleteNodeStream:(id)a3 StreamName:(id)a4 CompletionHandler:(id)a5;
+ (void)enumDirClose:(id)a3 CompletionHandler:(id)a4;
+ (void)enumDirNext:(id)a3 DirEnt:(id)a4 CompletionHandler:(id)a5;
+ (void)enumDirOpen:(id)a3 SearchPattern:(id)a4 IsWildcard:(BOOL)a5 CompletionHandler:(id)a6;
+ (void)listNodeStreams:(id)a3 CompletionHandler:(id)a4;
+ (void)openFileInParent:(id)a3 withName:(id)a4 withStream:(id)a5 withArgs:(openFileArgs *)a6 CompletionHandler:(id)a7;
+ (void)openFileNode:(id)a3 withStream:(id)a4 withArgs:(openFileArgs *)a5 CompletionHandler:(id)a6;
+ (void)queryDirOneAttr:(id)a3 ShareID:(unsigned int)a4 DirNode:(id)a5 withName:(id)a6 FAttrs:(smbfattr *)a7 CompletionHandler:(id)a8;
+ (void)queryMaxAccess:(id)a3 CompletionHandler:(id)a4;
+ (void)queryNameInParent:(id)a3 QueryName:(id)a4 FAttrs:(smbfattr *)a5 CompletionHandler:(id)a6;
+ (void)queryNode:(id)a3 attrs:(smbfattr *)a4 CompletionHandler:(id)a5;
+ (void)queryNodeAttr:(id)a3 ShareID:(unsigned int)a4 QueryNode:(id)a5 QueryStream:(id)a6 FAttrs:(smbfattr *)a7 CompletionHandler:(id)a8;
+ (void)queryNodeStream:(id)a3 StreamName:(id)a4 CompletionHandler:(id)a5;
+ (void)queryShareRoot:(id)a3 ShareID:(unsigned int)a4 FAttrs:(smbfattr *)a5 CompletionHandler:(id)a6;
+ (void)readNodeStream:(id)a3 StreamName:(id)a4 ReadBuffer:(id)a5 MaxReadXferLen:(unsigned int)a6 CompletionHandler:(id)a7;
+ (void)readNodeStreamChunk:(id)a3 FileNode:(id)a4 ReadBuffer:(id)a5 MaxReadXferLen:(unsigned int)a6 StreamOffset:(unsigned int)a7 rdparamPtr:(smb_read_write *)a8 result:(int)a9 bytesRead:(unint64_t)a10 bytesRemain:(unint64_t)a11 pass:(unint64_t)a12 reply:(id)a13;
+ (void)readNodeStreamChunks:(id)a3 StreamName:(id)a4 ReadBuffer:(id)a5 MaxReadXferLen:(unsigned int)a6 CompletionHandler:(id)a7;
+ (void)readNodeStreamCompound:(id)a3 StreamName:(id)a4 ReadBuffer:(id)a5 CompletionHandler:(id)a6;
+ (void)readReparseSymlink:(id)a3 completionHandler:(id)a4;
+ (void)readSymlink:(id)a3 completionHandler:(id)a4;
+ (void)readWindowsSymlink:(id)a3 completionHandler:(id)a4;
+ (void)renameFile:(id)a3 FileName:(id)a4 NewParent:(id)a5 NewName:(id)a6 VType:(int)a7 CompletionHandler:(id)a8;
+ (void)sendChangeNotify:(id)a3 Param:(changeNotifyArgs *)a4 CompletionHandler:(id)a5 NotifyHandler:(id)a6;
+ (void)sendClose:(id)a3 Param:(smb_close *)a4 GetPostAttrs:(BOOL)a5 CompletionHandler:(id)a6;
+ (void)sendCreateFile:(id)a3 ShareID:(unsigned int)a4 FileName:(id)a5 StreamName:(id)a6 Param:(smb_create *)a7 CompletionHandler:(id)a8;
+ (void)sendPipeTransceive:(id)a3 InData:(id)a4 OutData:(id)a5 CompletionHandler:(id)a6;
+ (void)sendPipeWait:(id)a3 Pipe:(id)a4 ShareID:(unsigned int)a5 Timeout:(unint64_t)a6 CompletionHandler:(id)a7;
+ (void)sendRead:(id)a3 Param:(smb_read_write *)a4 ReadBuf:(id)a5 CompletionHandler:(id)a6;
+ (void)sendSetInfo:(id)a3 Param:(smb_setinfo *)a4 InputBuffer:(id)a5 RenameTarget:(id)a6 CompletionHandler:(id)a7;
+ (void)sendWrite:(id)a3 Param:(smb_read_write *)a4 WriteBuf:(id)a5 CompletionHandler:(id)a6;
+ (void)setChangeNotify:(id)a3 Param:(changeNotifyArgs *)a4 CompletionHandler:(id)a5 NotifyHandler:(id)a6;
+ (void)setNodeBasicInfo:(id)a3 BasicInfo:(smb2_file_basic_info *)a4 FileType:(int)a5 CompletionHandler:(id)a6;
+ (void)setNodeEOF:(id)a3 Eof:(unint64_t)a4 FileType:(int)a5 CompletionHandler:(id)a6;
+ (void)statFS:(id)a3 ShareID:(unsigned int)a4 CompletionHandler:(id)a5;
+ (void)writeNodeStream:(id)a3 StreamName:(id)a4 How:(int)a5 MaxWriteXferLen:(unsigned int)a6 WriteBuffer:(id)a7 CompletionHandler:(id)a8;
+ (void)writeNodeStreamChunk:(id)a3 FileNode:(id)a4 WriteBuffer:(id)a5 MaxWriteXferLen:(unsigned int)a6 StreamOffset:(unsigned int)a7 wrparamPtr:(smb_read_write *)a8 result:(int)a9 bytesWritten:(unint64_t)a10 bytesRemain:(unint64_t)a11 pass:(unint64_t)a12 reply:(id)a13;
+ (void)writeNodeStreamChunks:(id)a3 StreamName:(id)a4 How:(int)a5 MaxWriteXferLen:(unsigned int)a6 WriteBuffer:(id)a7 CompletionHandler:(id)a8;
+ (void)writeNodeStreamCompound:(id)a3 StreamName:(id)a4 How:(int)a5 WriteBuffer:(id)a6 CompletionHandler:(id)a7;
@end

@implementation smb_subr

+ (int)sendNegotiate:(id)a3 Server:(id)a4 netBIOSName:(id)a5 VPNCookie:(id)a6 Result:(smb_negotiate *)a7
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  uint64_t v26 = 0;
  v27 = &v26;
  uint64_t v28 = 0x2020000000;
  int v29 = 0;
  uint64_t v20 = 0;
  v21 = &v20;
  uint64_t v22 = 0x3032000000;
  v23 = sub_1000374A4;
  v24 = sub_1000374B4;
  id v25 = 0;
  dispatch_group_t v15 = dispatch_group_create();
  v16 = (void *)v21[5];
  v21[5] = (uint64_t)v15;

  dispatch_group_enter((dispatch_group_t)v21[5]);
  v19[0] = _NSConcreteStackBlock;
  v19[1] = 3221225472;
  v19[2] = sub_1000374BC;
  v19[3] = &unk_10008A218;
  v19[4] = &v26;
  v19[5] = &v20;
  [v11 negotiateTo:v12 netBIOSname:v13 withVPNCookie:v14 outParameters:a7 callBack:v19];
  dispatch_group_wait((dispatch_group_t)v21[5], 0xFFFFFFFFFFFFFFFFLL);
  if (*((_DWORD *)v27 + 6))
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      sub_10005A12C();
    }
    int v17 = *((_DWORD *)v27 + 6);
  }
  else
  {
    int v17 = 0;
  }
  _Block_object_dispose(&v20, 8);

  _Block_object_dispose(&v26, 8);
  return v17;
}

+ (int)sendSessionSetup:(id)a3 User:(id)a4 Password:(id)a5 Realm:(id)a6 Param:(smb_login_out *)a7
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  uint64_t v26 = 0;
  v27 = &v26;
  uint64_t v28 = 0x2020000000;
  int v29 = 0;
  uint64_t v20 = 0;
  v21 = &v20;
  uint64_t v22 = 0x3032000000;
  v23 = sub_1000374A4;
  v24 = sub_1000374B4;
  id v25 = 0;
  dispatch_group_t v15 = dispatch_group_create();
  v16 = (void *)v21[5];
  v21[5] = (uint64_t)v15;

  dispatch_group_enter((dispatch_group_t)v21[5]);
  v19[0] = _NSConcreteStackBlock;
  v19[1] = 3221225472;
  v19[2] = sub_1000376C4;
  v19[3] = &unk_10008A218;
  v19[4] = &v26;
  v19[5] = &v20;
  [v11 login:a7 asUser:v12 withPassword:v13 inRealm:v14 callBack:v19];
  dispatch_group_wait((dispatch_group_t)v21[5], 0xFFFFFFFFFFFFFFFFLL);
  if (*((_DWORD *)v27 + 6))
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      sub_10005A19C();
    }
    int v17 = *((_DWORD *)v27 + 6);
  }
  else
  {
    int v17 = 0;
  }
  _Block_object_dispose(&v20, 8);

  _Block_object_dispose(&v26, 8);
  return v17;
}

+ (int)sendLogoff:(id)a3 Param:(smb_login_out *)a4
{
  id v5 = a3;
  uint64_t v17 = 0;
  v18 = &v17;
  uint64_t v19 = 0x2020000000;
  int v20 = 0;
  uint64_t v11 = 0;
  id v12 = &v11;
  uint64_t v13 = 0x3032000000;
  id v14 = sub_1000374A4;
  dispatch_group_t v15 = sub_1000374B4;
  id v16 = 0;
  dispatch_group_t v6 = dispatch_group_create();
  v7 = (void *)v12[5];
  v12[5] = (uint64_t)v6;

  dispatch_group_enter((dispatch_group_t)v12[5]);
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_100037880;
  v10[3] = &unk_10008A218;
  v10[4] = &v17;
  v10[5] = &v11;
  [v5 logoff:a4 callBack:v10];
  dispatch_group_wait((dispatch_group_t)v12[5], 0xFFFFFFFFFFFFFFFFLL);
  if (*((_DWORD *)v18 + 6))
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      sub_10005A20C();
    }
    int v8 = *((_DWORD *)v18 + 6);
  }
  else
  {
    int v8 = 0;
  }
  _Block_object_dispose(&v11, 8);

  _Block_object_dispose(&v17, 8);
  return v8;
}

+ (int)sendTreeConnect:(id)a3 ShareName:(id)a4 Param:(smb_tree_connect_disc *)a5
{
  id v7 = a3;
  id v8 = a4;
  uint64_t v20 = 0;
  v21 = &v20;
  uint64_t v22 = 0x2020000000;
  int v23 = 0;
  uint64_t v14 = 0;
  dispatch_group_t v15 = &v14;
  uint64_t v16 = 0x3032000000;
  uint64_t v17 = sub_1000374A4;
  v18 = sub_1000374B4;
  id v19 = 0;
  dispatch_group_t v9 = dispatch_group_create();
  v10 = (void *)v15[5];
  v15[5] = (uint64_t)v9;

  dispatch_group_enter((dispatch_group_t)v15[5]);
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = sub_100037A58;
  v13[3] = &unk_10008A218;
  v13[4] = &v20;
  v13[5] = &v14;
  [v7 treeConnect:a5 toShare:v8 callBack:v13];
  dispatch_group_wait((dispatch_group_t)v15[5], 0xFFFFFFFFFFFFFFFFLL);
  if (*((_DWORD *)v21 + 6))
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      sub_10005A27C();
    }
    int v11 = *((_DWORD *)v21 + 6);
  }
  else
  {
    int v11 = 0;
  }
  _Block_object_dispose(&v14, 8);

  _Block_object_dispose(&v20, 8);
  return v11;
}

+ (int)sendTreeDisonnect:(id)a3 ShareID:(unsigned int)a4 Param:(smb_tree_connect_disc *)a5
{
  uint64_t v6 = *(void *)&a4;
  id v7 = a3;
  uint64_t v19 = 0;
  uint64_t v20 = &v19;
  uint64_t v21 = 0x2020000000;
  int v22 = 0;
  uint64_t v13 = 0;
  uint64_t v14 = &v13;
  uint64_t v15 = 0x3032000000;
  uint64_t v16 = sub_1000374A4;
  uint64_t v17 = sub_1000374B4;
  id v18 = 0;
  dispatch_group_t v8 = dispatch_group_create();
  dispatch_group_t v9 = (void *)v14[5];
  v14[5] = (uint64_t)v8;

  dispatch_group_enter((dispatch_group_t)v14[5]);
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = sub_100037C24;
  v12[3] = &unk_10008A218;
  v12[4] = &v19;
  v12[5] = &v13;
  [v7 treeDisconnect:a5 fromShareID:v6 callBack:v12];
  dispatch_group_wait((dispatch_group_t)v14[5], 0xFFFFFFFFFFFFFFFFLL);
  if (*((_DWORD *)v20 + 6))
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      sub_10005A2EC();
    }
    int v10 = *((_DWORD *)v20 + 6);
  }
  else
  {
    int v10 = 0;
  }
  _Block_object_dispose(&v13, 8);

  _Block_object_dispose(&v19, 8);
  return v10;
}

+ (int)sendQueryShare:(id)a3 ShareID:(unsigned int)a4 Model:(id)a5 FSName:(id)a6 Param:(smb_query_share *)a7
{
  uint64_t v10 = *(void *)&a4;
  id v11 = a3;
  id v12 = a5;
  id v13 = a6;
  uint64_t v25 = 0;
  uint64_t v26 = &v25;
  uint64_t v27 = 0x2020000000;
  int v28 = 0;
  uint64_t v19 = 0;
  uint64_t v20 = &v19;
  uint64_t v21 = 0x3032000000;
  int v22 = sub_1000374A4;
  int v23 = sub_1000374B4;
  id v24 = 0;
  dispatch_group_t v14 = dispatch_group_create();
  uint64_t v15 = (void *)v20[5];
  v20[5] = (uint64_t)v14;

  dispatch_group_enter((dispatch_group_t)v20[5]);
  v18[0] = _NSConcreteStackBlock;
  v18[1] = 3221225472;
  v18[2] = sub_100037E20;
  v18[3] = &unk_10008A218;
  v18[4] = &v25;
  v18[5] = &v19;
  [v11 queryShareInformation:a7 forShareID:v10 forModelInfo:v12 forFileSystemName:v13 callBack:v18];
  dispatch_group_wait((dispatch_group_t)v20[5], 0xFFFFFFFFFFFFFFFFLL);
  if (*((_DWORD *)v26 + 6))
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      sub_10005A35C();
    }
    int v16 = *((_DWORD *)v26 + 6);
  }
  else
  {
    int v16 = 0;
  }
  _Block_object_dispose(&v19, 8);

  _Block_object_dispose(&v25, 8);
  return v16;
}

+ (void)sendCreateFile:(id)a3 ShareID:(unsigned int)a4 FileName:(id)a5 StreamName:(id)a6 Param:(smb_create *)a7 CompletionHandler:(id)a8
{
  uint64_t v11 = *(void *)&a4;
  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472;
  v14[2] = sub_100037F14;
  v14[3] = &unk_10008A240;
  id v15 = a8;
  id v13 = v15;
  +[SMBNode nodeWithParameters:a7 onPiston:a3 onShareID:v11 withName:a5 withStreamName:a6 callBack:v14];
}

+ (void)sendClose:(id)a3 Param:(smb_close *)a4 GetPostAttrs:(BOOL)a5 CompletionHandler:(id)a6
{
  BOOL v6 = a5;
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_100037FD0;
  v10[3] = &unk_1000889C8;
  id v11 = a6;
  id v9 = v11;
  [a3 close:a4 withFlags:v6 callBack:v10];
}

+ (void)sendWrite:(id)a3 Param:(smb_read_write *)a4 WriteBuf:(id)a5 CompletionHandler:(id)a6
{
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_10003808C;
  v10[3] = &unk_10008A268;
  id v11 = a6;
  id v12 = a4;
  id v9 = v11;
  [a3 write:a4 fromBuffer:a5 callBack:v10];
}

+ (void)sendRead:(id)a3 Param:(smb_read_write *)a4 ReadBuf:(id)a5 CompletionHandler:(id)a6
{
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_100038198;
  v10[3] = &unk_10008A268;
  id v11 = a6;
  id v12 = a4;
  id v9 = v11;
  [a3 read:a4 intoBuffer:a5 callBack:v10];
}

+ (void)sendPipeWait:(id)a3 Pipe:(id)a4 ShareID:(unsigned int)a5 Timeout:(unint64_t)a6 CompletionHandler:(id)a7
{
  uint64_t v8 = *(void *)&a5;
  id v11 = a7;
  id v12 = a4;
  id v13 = a3;
  dispatch_group_t v14 = malloc_type_malloc(0x60uLL, 0x1000040718B784FuLL);
  *dispatch_group_t v14 = 0u;
  v14[1] = 0u;
  v14[2] = 0u;
  v14[3] = 0u;
  void v14[4] = 0u;
  v14[5] = 0u;
  *((_DWORD *)v14 + 1) = 1114136;
  v16[0] = _NSConcreteStackBlock;
  v16[1] = 3221225472;
  v16[2] = sub_100038314;
  v16[3] = &unk_10008A268;
  id v17 = v11;
  id v18 = v14;
  id v15 = v11;
  [v13 ioctl:v14 onShareID:v8 pipeWaitOnName:v12 withTimeOut:a6 callBack:v16];
}

+ (void)sendPipeTransceive:(id)a3 InData:(id)a4 OutData:(id)a5 CompletionHandler:(id)a6
{
  id v9 = a6;
  id v10 = a5;
  id v11 = a4;
  id v12 = a3;
  id v13 = malloc_type_malloc(0x60uLL, 0x1000040718B784FuLL);
  *id v13 = 0u;
  v13[1] = 0u;
  v13[2] = 0u;
  v13[3] = 0u;
  v13[4] = 0u;
  v13[5] = 0u;
  *((_DWORD *)v13 + 1) = 1163287;
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472;
  v15[2] = sub_100038494;
  v15[3] = &unk_10008A268;
  id v16 = v9;
  id v17 = v13;
  id v14 = v9;
  [v12 ioctl:v13 pipeTransceive:v11 withRecvData:v10 callBack:v15];
}

+ (void)sendSetInfo:(id)a3 Param:(smb_setinfo *)a4 InputBuffer:(id)a5 RenameTarget:(id)a6 CompletionHandler:(id)a7
{
  id v11 = a7;
  id v12 = a6;
  id v13 = a5;
  id v14 = a3;
  a4->var0 = [v14 shareID];
  v16[0] = _NSConcreteStackBlock;
  v16[1] = 3221225472;
  v16[2] = sub_100038608;
  v16[3] = &unk_10008A268;
  id v17 = v11;
  id v18 = a4;
  id v15 = v11;
  [v14 setInformation:a4 withInputBuffer:v13 withRenameTarget:v12 callBack:v16];
}

+ (void)sendChangeNotify:(id)a3 Param:(changeNotifyArgs *)a4 CompletionHandler:(id)a5 NotifyHandler:(id)a6
{
  id v9 = a3;
  id v10 = (void (**)(id, void))a5;
  id v11 = a6;
  uint64_t v31 = 0;
  v32 = &v31;
  uint64_t v33 = 0x3032000000;
  v34 = sub_1000374A4;
  v35 = sub_1000374B4;
  id v36 = 0;
  id v12 = [objc_alloc((Class)NSMutableData) initWithCapacity:0x10000];
  id v13 = (void *)v32[5];
  v32[5] = (uint64_t)v12;

  id v14 = (void *)v32[5];
  if (v14)
  {
    [v14 setLength:0x10000];
    a4->pending = 1;
    uint64_t flags = a4->flags;
    uint64_t filter = a4->filter;
    uint64_t v17 = v32[5];
    v26[0] = _NSConcreteStackBlock;
    v26[1] = 3221225472;
    v26[2] = sub_100038860;
    v26[3] = &unk_10008A2B0;
    int v29 = &v31;
    v30 = a4;
    id v27 = v9;
    id v28 = v11;
    [v27 changeNotify:a4 withFlags:flags withFilter:filter returnDataIn:v17 callBack:v26];
    v10[2](v10, 0);
  }
  else
  {
    BOOL v18 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR);
    if (v18) {
      sub_10005A624(v18, v19, v20, v21, v22, v23, v24, v25);
    }
    v10[2](v10, 12);
  }
  _Block_object_dispose(&v31, 8);
}

+ (void)queryShareRoot:(id)a3 ShareID:(unsigned int)a4 FAttrs:(smbfattr *)a5 CompletionHandler:(id)a6
{
  uint64_t v8 = *(void *)&a4;
  id v9 = a3;
  v15[0] = 0;
  v15[1] = v15;
  v15[2] = 0x2020000000;
  int v16 = 0;
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_100038AD4;
  v11[3] = &unk_10008A300;
  id v10 = a6;
  id v12 = v10;
  id v13 = v15;
  id v14 = a5;
  +[SMBNode nodeForCmpd:v9 onShareID:v8 callBack:v11];

  _Block_object_dispose(v15, 8);
}

+ (int)queryShareRootSync:(id)a3 ShareID:(unsigned int)a4 FAttrs:(smbfattr *)a5
{
  uint64_t v6 = *(void *)&a4;
  id v7 = a3;
  uint64_t v17 = 0;
  BOOL v18 = &v17;
  uint64_t v19 = 0x3032000000;
  uint64_t v20 = sub_1000374A4;
  uint64_t v21 = sub_1000374B4;
  id v22 = 0;
  uint64_t v13 = 0;
  id v14 = &v13;
  uint64_t v15 = 0x2020000000;
  int v16 = 0;
  dispatch_group_t v8 = dispatch_group_create();
  id v9 = (void *)v18[5];
  v18[5] = (uint64_t)v8;

  dispatch_group_enter((dispatch_group_t)v18[5]);
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = sub_1000392A4;
  v12[3] = &unk_10008A218;
  v12[4] = &v13;
  v12[5] = &v17;
  +[smb_subr queryShareRoot:v7 ShareID:v6 FAttrs:a5 CompletionHandler:v12];
  dispatch_group_wait((dispatch_group_t)v18[5], 0xFFFFFFFFFFFFFFFFLL);
  if (*((_DWORD *)v14 + 6))
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      sub_10005ABD0();
    }
    int v10 = *((_DWORD *)v14 + 6);
  }
  else
  {
    int v10 = 0;
  }
  _Block_object_dispose(&v13, 8);
  _Block_object_dispose(&v17, 8);

  return v10;
}

+ (void)queryDirOneAttr:(id)a3 ShareID:(unsigned int)a4 DirNode:(id)a5 withName:(id)a6 FAttrs:(smbfattr *)a7 CompletionHandler:(id)a8
{
  uint64_t v12 = *(void *)&a4;
  id v13 = a3;
  id v14 = a5;
  id v15 = a6;
  int v16 = (void (**)(id, uint64_t))a8;
  v37[0] = 0;
  v37[1] = v37;
  v37[2] = 0x2020000000;
  int v38 = 0;
  if (v15)
  {
    id v17 = v14;
    id v18 = v15;
  }
  else
  {
    id v17 = [v14 parent];
    id v18 = [v14 name];
    if (!v17)
    {
      BOOL v22 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR);
      if (v22) {
        sub_10005AC48(v22, v23, v24, v25, v26, v27, v28, v29);
      }
      v16[2](v16, 22);
      id v17 = 0;
      goto LABEL_8;
    }
  }
  if ([v17 isRoot])
  {
    uint64_t v19 = 0;
LABEL_7:
    v30[0] = _NSConcreteStackBlock;
    v30[1] = 3221225472;
    v30[2] = sub_10003957C;
    v30[3] = &unk_10008A350;
    v34 = v16;
    v35 = v37;
    id v20 = v19;
    id v31 = v20;
    id v32 = v15;
    id v36 = a7;
    id v33 = v14;
    +[SMBNode nodeForCmpd:v13 onShareID:v12 callBack:v30];

    goto LABEL_8;
  }
  uint64_t v19 = +[smb_subr makeWindowsPath:v14 withName:0];
  if (v19) {
    goto LABEL_7;
  }
  id v21 = &_os_log_default;
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
  {
    [v14 name];
    [ objc_claimAutoreleasedReturnValue() UTF8String];
    sub_10005AC84();
  }

  v16[2](v16, 22);
LABEL_8:
  _Block_object_dispose(v37, 8);
}

+ (void)queryNodeAttr:(id)a3 ShareID:(unsigned int)a4 QueryNode:(id)a5 QueryStream:(id)a6 FAttrs:(smbfattr *)a7 CompletionHandler:(id)a8
{
  uint64_t v12 = *(void *)&a4;
  id v13 = a3;
  id v14 = a5;
  id v15 = a6;
  int v16 = (void (**)(id, uint64_t))a8;
  v29[0] = 0;
  v29[1] = v29;
  v29[2] = 0x2020000000;
  int v30 = 0;
  id v17 = objc_alloc_init((Class)SMBFileAllInformation);
  if (!v17)
  {
    id v19 = &_os_log_default;
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
    {
      [v14 name];
      objc_claimAutoreleasedReturnValue();
      sub_10005B058();
    }
    goto LABEL_10;
  }
  if (([v14 isRoot] & 1) == 0)
  {
    id v18 = +[smb_subr makeWindowsPath:v14 withName:0];
    if (v18) {
      goto LABEL_7;
    }
    id v21 = &_os_log_default;
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
    {
      [v14 name];
      objc_claimAutoreleasedReturnValue();
      sub_10005B0A4();
    }
LABEL_10:

    v16[2](v16, 22);
    goto LABEL_11;
  }
  id v18 = 0;
LABEL_7:
  v22[0] = _NSConcreteStackBlock;
  v22[1] = 3221225472;
  v22[2] = sub_100039E88;
  v22[3] = &unk_10008A378;
  uint64_t v26 = v16;
  id v23 = v14;
  uint64_t v27 = v29;
  id v20 = v18;
  id v24 = v20;
  id v25 = v17;
  uint64_t v28 = a7;
  +[SMBNode nodeForCmpd:v13 onShareID:v12 callBack:v22];

LABEL_11:
  _Block_object_dispose(v29, 8);
}

+ (void)queryNameInParent:(id)a3 QueryName:(id)a4 FAttrs:(smbfattr *)a5 CompletionHandler:(id)a6
{
  id v9 = a6;
  id v10 = a4;
  id v11 = a3;
  uint64_t v12 = [v11 mp];
  id v13 = [v12 pd];
  id v14 = [v11 mp];
  id v15 = [v14 shareID];
  v17[0] = _NSConcreteStackBlock;
  v17[1] = 3221225472;
  v17[2] = sub_10003A5D8;
  v17[3] = &unk_1000889C8;
  id v18 = v9;
  id v16 = v9;
  +[smb_subr queryDirOneAttr:v13 ShareID:v15 DirNode:v11 withName:v10 FAttrs:a5 CompletionHandler:v17];
}

+ (void)openFileNode:(id)a3 withStream:(id)a4 withArgs:(openFileArgs *)a5 CompletionHandler:(id)a6
{
  id v9 = a3;
  id v10 = a4;
  id v23 = a6;
  if ([v9 isRoot])
  {
    id v11 = 0;
    goto LABEL_4;
  }
  id v11 = +[smb_subr makeWindowsPath:v9 withName:0];
  if (v11)
  {
LABEL_4:
    uint64_t v12 = malloc_type_malloc(0xF8uLL, 0x10800407AD7242AuLL);
    id v13 = v12;
    v12[2] = 0u;
    v12[3] = 0u;
    v12[4] = 0u;
    v12[5] = 0u;
    void v12[6] = 0u;
    v12[7] = 0u;
    v12[8] = 0u;
    v12[9] = 0u;
    v12[10] = 0u;
    v12[11] = 0u;
    v12[12] = 0u;
    v12[13] = 0u;
    v12[14] = 0u;
    *((void *)v12 + 30) = 0;
    *uint64_t v12 = 0u;
    v12[1] = 0u;
    unsigned int var0 = a5->var0;
    unsigned int var1 = a5->var1;
    *((_DWORD *)v12 + 3) = 2;
    *((_DWORD *)v12 + 4) = var1;
    int var3 = a5->var3;
    *((_DWORD *)v12 + 6) = a5->var2;
    *((_DWORD *)v12 + 7) = var0;
    if (var3 == 2)
    {
      *((_DWORD *)v12 + 5) = 16;
      int v17 = 1;
    }
    else
    {
      *((_DWORD *)v12 + 5) = 128;
      if (var3 != 5)
      {
LABEL_9:
        if (v10) {
          *(void *)uint64_t v12 = 2;
        }
        id v18 = [v9 mp];
        id v19 = [v18 pd];
        id v20 = [v9 mp];
        id v21 = [v20 shareID];
        v24[0] = _NSConcreteStackBlock;
        v24[1] = 3221225472;
        v24[2] = sub_10003A828;
        v24[3] = &unk_10008A3A0;
        uint64_t v26 = v13;
        uint64_t v27 = a5;
        BOOL v22 = v23;
        id v25 = v23;
        +[smb_subr sendCreateFile:v19 ShareID:v21 FileName:v11 StreamName:v10 Param:v13 CompletionHandler:v24];

        goto LABEL_12;
      }
      int v17 = 0x200000;
    }
    *((_DWORD *)v12 + 8) = v17;
    goto LABEL_9;
  }
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
    sub_10005B400(v9);
  }
  BOOL v22 = v23;
  (*((void (**)(id, uint64_t, void))v23 + 2))(v23, 22, 0);
LABEL_12:
}

+ (void)openFileInParent:(id)a3 withName:(id)a4 withStream:(id)a5 withArgs:(openFileArgs *)a6 CompletionHandler:(id)a7
{
  id v11 = a3;
  id v12 = a5;
  id v13 = a7;
  id v14 = +[smb_subr makeWindowsPath:v11 withName:a4];
  if (v14)
  {
    id v15 = malloc_type_malloc(0xF8uLL, 0x10800407AD7242AuLL);
    id v16 = v15;
    v15[2] = 0u;
    void v15[3] = 0u;
    void v15[4] = 0u;
    v15[5] = 0u;
    v15[6] = 0u;
    v15[7] = 0u;
    v15[8] = 0u;
    v15[9] = 0u;
    v15[10] = 0u;
    v15[11] = 0u;
    v15[12] = 0u;
    v15[13] = 0u;
    v15[14] = 0u;
    *((void *)v15 + 30) = 0;
    *id v15 = 0u;
    v15[1] = 0u;
    unsigned int var0 = a6->var0;
    unsigned int var1 = a6->var1;
    *((_DWORD *)v15 + 3) = 2;
    *((_DWORD *)v15 + 4) = var1;
    *((_DWORD *)v15 + 7) = var0;
    unsigned int var2 = a6->var2;
    int var3 = a6->var3;
    *((_DWORD *)v15 + 5) = 128;
    *((_DWORD *)v15 + 6) = var2;
    if (var3 == 5)
    {
      int v21 = 0x200000;
    }
    else
    {
      if (var3 != 2)
      {
LABEL_10:
        if (v12) {
          *(void *)id v15 = 2;
        }
        BOOL v22 = objc_msgSend(v11, "mp", v12);
        id v23 = [v22 pd];
        id v24 = [v11 mp];
        id v25 = [v24 shareID];
        v27[0] = _NSConcreteStackBlock;
        v27[1] = 3221225472;
        v27[2] = sub_10003AAE0;
        v27[3] = &unk_10008A3A0;
        uint64_t v29 = v16;
        int v30 = a6;
        id v28 = v13;
        id v12 = v26;
        +[smb_subr sendCreateFile:v23 ShareID:v25 FileName:v14 StreamName:v26 Param:v16 CompletionHandler:v27];

        goto LABEL_13;
      }
      *((_DWORD *)v15 + 5) = 16;
      int v21 = 1;
    }
    *((_DWORD *)v15 + 8) = v21;
    goto LABEL_10;
  }
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
    sub_10005B50C(v11);
  }
  (*((void (**)(id, uint64_t, void))v13 + 2))(v13, 22, 0);
LABEL_13:
}

+ (void)createFile:(id)a3 NewName:(id)a4 FileType:(int)a5 RetAttr:(smbfattr *)a6 CompletionHandler:(id)a7
{
  id v11 = a3;
  id v12 = a4;
  id v13 = (void (**)(id, uint64_t))a7;
  v29[0] = 0;
  v29[1] = v29;
  v29[2] = 0x2020000000;
  int v30 = 0;
  if ((a5 - 3) <= 0xFFFFFFFD)
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      sub_10005B610();
    }
LABEL_9:
    v13[2](v13, 22);
    goto LABEL_10;
  }
  id v14 = +[smb_subr makeWindowsPath:v11 withName:v12];
  if (!v14)
  {
    id v20 = &_os_log_default;
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
    {
      [v11 name];
      objc_claimAutoreleasedReturnValue();
      sub_10005B680();
    }

    goto LABEL_9;
  }
  id v15 = [v11 mp];
  id v16 = [v15 pd];
  int v17 = [v11 mp];
  id v18 = [v17 shareID];
  v21[0] = _NSConcreteStackBlock;
  v21[1] = 3221225472;
  v21[2] = sub_10003ADF0;
  v21[3] = &unk_10008A418;
  int v28 = a5;
  id v25 = v13;
  uint64_t v26 = v29;
  id v19 = v14;
  id v22 = v19;
  id v23 = v11;
  id v24 = v12;
  uint64_t v27 = a6;
  +[SMBNode nodeForCmpd:v16 onShareID:v18 callBack:v21];

LABEL_10:
  _Block_object_dispose(v29, 8);
}

+ (void)queryNode:(id)a3 attrs:(smbfattr *)a4 CompletionHandler:(id)a5
{
  id v7 = a3;
  id v8 = a5;
  if ([v7 isRoot])
  {
    id v9 = [v7 mp];
    id v10 = [v9 pd];
    id v11 = [v7 mp];
    id v12 = [v11 shareID];
    v24[0] = _NSConcreteStackBlock;
    v24[1] = 3221225472;
    v24[2] = sub_10003B810;
    v24[3] = &unk_10008A268;
    uint64_t v26 = a4;
    id v25 = v8;
    +[smb_subr queryShareRoot:v10 ShareID:v12 FAttrs:a4 CompletionHandler:v24];
  }
  else
  {
    id v13 = [v7 parent];

    if (v13)
    {
      id v14 = [v7 mp];
      id v15 = [v14 pd];
      id v16 = [v7 mp];
      id v17 = [v16 shareID];
      id v18 = [v7 parent];
      id v19 = [v7 name];
      v20[0] = _NSConcreteStackBlock;
      v20[1] = 3221225472;
      v20[2] = sub_10003B884;
      v20[3] = &unk_10008A088;
      id v21 = v7;
      id v23 = a4;
      id v22 = v8;
      +[smb_subr queryDirOneAttr:v15 ShareID:v17 DirNode:v18 withName:v19 FAttrs:a4 CompletionHandler:v20];
    }
    else
    {
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
        sub_10005BAF4(v7);
      }
      (*((void (**)(id, uint64_t))v8 + 2))(v8, 22);
    }
  }
}

+ (void)createReparseSymlink:(id)a3 NewName:(id)a4 Target:(id)a5 RetAttr:(smbfattr *)a6 CompletionHandler:(id)a7
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  id v14 = (void (**)(id, uint64_t))a7;
  v46[0] = 0;
  v46[1] = v46;
  v46[2] = 0x2020000000;
  int v47 = 0;
  if (!v13)
  {
    BOOL v20 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR);
    if (v20) {
      sub_10005BD08(v20, v21, v22, v23, v24, v25, v26, v27);
    }
    goto LABEL_9;
  }
  if (![v13 length])
  {
    BOOL v28 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR);
    if (v28) {
      sub_10005BD44(v28, v29, v30, v31, v32, v33, v34, v35);
    }
LABEL_9:
    v14[2](v14, 22);
    goto LABEL_14;
  }
  id v15 = +[smb_subr makeWindowsPath:v11 withName:v12];
  if (v15)
  {
    id v16 = [v11 mp];
    id v17 = [v16 pd];
    id v18 = [v11 mp];
    id v19 = [v18 shareID];
    v38[0] = _NSConcreteStackBlock;
    v38[1] = 3221225472;
    v38[2] = sub_10003BD58;
    v38[3] = &unk_10008A4B8;
    v43 = v14;
    v44 = v46;
    id v39 = v15;
    id v40 = v13;
    id v41 = v11;
    id v42 = v12;
    v45 = a6;
    +[SMBNode nodeForCmpd:v17 onShareID:v19 callBack:v38];
  }
  else
  {
    id v36 = &_os_log_default;
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
    {
      id v37 = [v11 name];
      sub_10005BD80((uint64_t)[v37 UTF8String], (uint64_t)objc_msgSend(v12, "UTF8String"), (uint64_t)v48, v37);
    }

    v14[2](v14, 22);
  }

LABEL_14:
  _Block_object_dispose(v46, 8);
}

+ (void)createWindowsSymlink:(id)a3 NewName:(id)a4 Target:(id)a5 RetAttr:(smbfattr *)a6 CompletionHandler:(id)a7
{
  id v11 = a3;
  id v23 = a4;
  id v12 = a5;
  id v13 = (void (**)(id, uint64_t))a7;
  v31[0] = 0;
  v31[1] = v31;
  v31[2] = 0x2020000000;
  int v32 = 0;
  unsigned int v30 = 0;
  id v14 = sub_100033A90(v12, (int *)&v30);
  if (!v14)
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEBUG)) {
      sub_10005C458();
    }
    uint64_t v21 = v30;
    goto LABEL_10;
  }
  id v15 = +[smb_subr makeWindowsPath:v11 withName:v23];
  if (!v15)
  {
    id v22 = &_os_log_default;
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
    {
      [v11 name];
      objc_claimAutoreleasedReturnValue();
      sub_10005C4D8();
    }

    free(v14);
    uint64_t v21 = 22;
LABEL_10:
    v13[2](v13, v21);
    goto LABEL_11;
  }
  id v16 = [v11 mp];
  id v17 = [v16 pd];
  id v18 = [v11 mp];
  id v19 = [v18 shareID];
  v24[0] = _NSConcreteStackBlock;
  v24[1] = 3221225472;
  v24[2] = sub_10003CBA4;
  v24[3] = &unk_10008A4E0;
  uint64_t v26 = v13;
  uint64_t v27 = v31;
  id v20 = v15;
  id v25 = v20;
  BOOL v28 = v14;
  uint64_t v29 = a6;
  +[SMBNode nodeForCmpd:v17 onShareID:v19 callBack:v24];

LABEL_11:
  _Block_object_dispose(v31, 8);
}

+ (void)readSymlink:(id)a3 completionHandler:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  if (objc_msgSend(v5, "np_flag"))
  {
    v10[0] = _NSConcreteStackBlock;
    v10[1] = 3221225472;
    v10[2] = sub_10003D42C;
    v10[3] = &unk_10008A508;
    id v11 = v6;
    +[smb_subr readWindowsSymlink:v5 completionHandler:v10];
    id v7 = v11;
LABEL_8:

    goto LABEL_9;
  }
  if ((objc_msgSend(v5, "np_flag") & 2) != 0)
  {
    v8[0] = _NSConcreteStackBlock;
    v8[1] = 3221225472;
    v8[2] = sub_10003D43C;
    v8[3] = &unk_10008A508;
    id v9 = v6;
    +[smb_subr readReparseSymlink:v5 completionHandler:v8];
    id v7 = v9;
    goto LABEL_8;
  }
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
    sub_10005C8E0(v5);
  }
  (*((void (**)(id, uint64_t, void))v6 + 2))(v6, 22, 0);
LABEL_9:
}

+ (void)readReparseSymlink:(id)a3 completionHandler:(id)a4
{
  id v5 = a3;
  id v6 = (void (**)(id, uint64_t, void))a4;
  v22[0] = 0;
  v22[1] = v22;
  v22[2] = 0x2020000000;
  int v23 = 0;
  id v7 = objc_alloc_init((Class)NSMutableString);
  if (!v7)
  {
    id v9 = &_os_log_default;
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
    {
      [v5 name];
      objc_claimAutoreleasedReturnValue();
      sub_10005C984();
    }
    uint64_t v10 = 12;
    goto LABEL_12;
  }
  if (([v5 isRoot] & 1) == 0)
  {
    id v8 = +[smb_subr makeWindowsPath:v5 withName:0];
    if (v8) {
      goto LABEL_8;
    }
    id v16 = &_os_log_default;
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
    {
      [v5 name];
      [ objc_claimAutoreleasedReturnValue() UTF8String];
      sub_10005C9D0();
    }
    uint64_t v10 = 22;
LABEL_12:

    v6[2](v6, v10, 0);
    goto LABEL_13;
  }
  id v8 = 0;
LABEL_8:
  id v11 = [v5 mp];
  id v12 = [v11 pd];
  id v13 = [v5 mp];
  id v14 = [v13 shareID];
  v17[0] = _NSConcreteStackBlock;
  v17[1] = 3221225472;
  v17[2] = sub_10003D6F0;
  v17[3] = &unk_10008A558;
  id v20 = v6;
  uint64_t v21 = v22;
  id v15 = v8;
  id v18 = v15;
  id v19 = v7;
  +[SMBNode nodeForCmpd:v12 onShareID:v14 callBack:v17];

LABEL_13:
  _Block_object_dispose(v22, 8);
}

+ (void)readWindowsSymlink:(id)a3 completionHandler:(id)a4
{
  id v5 = a3;
  id v6 = (void (**)(id, uint64_t, void))a4;
  v29[0] = 0;
  v29[1] = v29;
  v29[2] = 0x2020000000;
  int v30 = 0;
  id v7 = [objc_alloc((Class)NSMutableData) initWithCapacity:1067];
  if (!v7)
  {
    BOOL v9 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR);
    if (v9) {
      sub_10005CD9C(v9, v10, v11, v12, v13, v14, v15, v16);
    }
    uint64_t v17 = 12;
    goto LABEL_12;
  }
  if (([v5 isRoot] & 1) == 0)
  {
    id v8 = +[smb_subr makeWindowsPath:v5 withName:0];
    if (v8) {
      goto LABEL_8;
    }
    id v23 = &_os_log_default;
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
    {
      [v5 name];
      [ objc_claimAutoreleasedReturnValue() UTF8String];
      sub_10005CDD8();
    }

    uint64_t v17 = 22;
LABEL_12:
    v6[2](v6, v17, 0);
    goto LABEL_13;
  }
  id v8 = 0;
LABEL_8:
  id v18 = [v5 mp];
  id v19 = [v18 pd];
  id v20 = [v5 mp];
  id v21 = [v20 shareID];
  v24[0] = _NSConcreteStackBlock;
  v24[1] = 3221225472;
  v24[2] = sub_10003DE64;
  v24[3] = &unk_10008A558;
  uint64_t v27 = v6;
  BOOL v28 = v29;
  id v22 = v8;
  id v25 = v22;
  id v26 = v7;
  +[SMBNode nodeForCmpd:v19 onShareID:v21 callBack:v24];

LABEL_13:
  _Block_object_dispose(v29, 8);
}

+ (void)checkForWindowsSymlink:(id)a3 CompletionHandler:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  v29[0] = 0;
  v29[1] = v29;
  v29[2] = 0x2020000000;
  int v30 = 0;
  id v7 = [objc_alloc((Class)NSMutableData) initWithCapacity:1067];
  if (!v7)
  {
    BOOL v9 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR);
    if (v9) {
      sub_10005D28C(v9, v10, v11, v12, v13, v14, v15, v16);
    }
    uint64_t v17 = 12;
    goto LABEL_12;
  }
  if (([v5 isRoot] & 1) == 0)
  {
    id v8 = +[smb_subr makeWindowsPath:v5 withName:0];
    if (v8) {
      goto LABEL_8;
    }
    id v23 = &_os_log_default;
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
    {
      [v5 name];
      [ objc_claimAutoreleasedReturnValue() UTF8String];
      sub_10005D2C8();
    }

    uint64_t v17 = 22;
LABEL_12:
    (*((void (**)(id, uint64_t, void, void))v6 + 2))(v6, v17, 0, 0);
    goto LABEL_13;
  }
  id v8 = 0;
LABEL_8:
  id v18 = [v5 mp];
  id v19 = [v18 pd];
  id v20 = [v5 mp];
  id v21 = [v20 shareID];
  v24[0] = _NSConcreteStackBlock;
  v24[1] = 3221225472;
  v24[2] = sub_10003E6CC;
  v24[3] = &unk_10008A558;
  id v27 = v6;
  BOOL v28 = v29;
  id v22 = v8;
  id v25 = v22;
  id v26 = v7;
  +[SMBNode nodeForCmpd:v19 onShareID:v21 callBack:v24];

LABEL_13:
  _Block_object_dispose(v29, 8);
}

+ (void)listNodeStreams:(id)a3 CompletionHandler:(id)a4
{
  id v5 = a3;
  id v6 = (void (**)(id, uint64_t, void))a4;
  v22[0] = 0;
  v22[1] = v22;
  v22[2] = 0x2020000000;
  int v23 = 0;
  id v7 = objc_alloc_init((Class)NSMutableData);
  if (!v7)
  {
    uint64_t v9 = 12;
    goto LABEL_10;
  }
  if (([v5 isRoot] & 1) == 0)
  {
    id v8 = +[smb_subr makeWindowsPath:v5 withName:0];
    if (v8) {
      goto LABEL_6;
    }
    id v15 = &_os_log_default;
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
    {
      [v5 name];
      [ objc_claimAutoreleasedReturnValue() UTF8String];
      sub_10005D70C();
    }

    uint64_t v9 = 22;
LABEL_10:
    v6[2](v6, v9, 0);
    goto LABEL_11;
  }
  id v8 = 0;
LABEL_6:
  uint64_t v10 = [v5 mp];
  uint64_t v11 = [v10 pd];
  uint64_t v12 = [v5 mp];
  id v13 = [v12 shareID];
  v16[0] = _NSConcreteStackBlock;
  v16[1] = 3221225472;
  v16[2] = sub_10003EEC8;
  v16[3] = &unk_10008A580;
  id v20 = v6;
  id v17 = v5;
  id v21 = v22;
  id v14 = v8;
  id v18 = v14;
  id v19 = v7;
  +[SMBNode nodeForCmpd:v11 onShareID:v13 callBack:v16];

LABEL_11:
  _Block_object_dispose(v22, 8);
}

+ (void)queryNodeStream:(id)a3 StreamName:(id)a4 CompletionHandler:(id)a5
{
  id v7 = a3;
  id v8 = a4;
  id v9 = a5;
  v28[0] = 0;
  v28[1] = v28;
  v28[2] = 0x2020000000;
  int v29 = 0;
  v27[0] = 0;
  v27[1] = v27;
  v27[2] = 0x2020000000;
  v27[3] = 0;
  v25[0] = 0;
  v25[1] = v25;
  v25[2] = 0x2020000000;
  int v26 = 0;
  if ([v7 isRoot])
  {
    uint64_t v10 = 0;
LABEL_4:
    uint64_t v11 = [v7 mp];
    uint64_t v12 = [v11 pd];
    id v13 = [v7 mp];
    id v14 = [v13 shareID];
    v17[0] = _NSConcreteStackBlock;
    v17[1] = 3221225472;
    v17[2] = sub_10003F6E0;
    v17[3] = &unk_10008A5D0;
    id v21 = v9;
    id v18 = v7;
    id v22 = v28;
    id v15 = v10;
    id v19 = v15;
    id v20 = v8;
    int v23 = v27;
    uint64_t v24 = v25;
    +[SMBNode nodeForCmpd:v12 onShareID:v14 callBack:v17];

    goto LABEL_5;
  }
  uint64_t v10 = +[smb_subr makeWindowsPath:v7 withName:0];
  if (v10) {
    goto LABEL_4;
  }
  id v16 = &_os_log_default;
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
  {
    [v7 name];
    [ objc_claimAutoreleasedReturnValue() UTF8String];
    sub_10005DAD8();
  }

  (*((void (**)(id, uint64_t, void, void))v9 + 2))(v9, 22, 0, 0);
LABEL_5:
  _Block_object_dispose(v25, 8);
  _Block_object_dispose(v27, 8);
  _Block_object_dispose(v28, 8);
}

+ (void)readNodeStream:(id)a3 StreamName:(id)a4 ReadBuffer:(id)a5 MaxReadXferLen:(unsigned int)a6 CompletionHandler:(id)a7
{
  uint64_t v7 = *(void *)&a6;
  id v12 = a7;
  id v13 = a5;
  id v14 = a4;
  id v15 = a3;
  if ((unint64_t)[v13 length] <= v7)
  {
    v21[0] = _NSConcreteStackBlock;
    v21[1] = 3221225472;
    v21[2] = sub_10003FE18;
    v21[3] = &unk_10008A5F8;
    id v16 = &v22;
    id v22 = v12;
    id v18 = v12;
    [a1 readNodeStreamCompound:v15 StreamName:v14 ReadBuffer:v13 CompletionHandler:v21];
  }
  else
  {
    v19[0] = _NSConcreteStackBlock;
    v19[1] = 3221225472;
    v19[2] = sub_10003FE28;
    v19[3] = &unk_10008A5F8;
    id v16 = &v20;
    id v20 = v12;
    id v17 = v12;
    [a1 readNodeStreamChunks:v15 StreamName:v14 ReadBuffer:v13 MaxReadXferLen:v7 CompletionHandler:v19];
  }
}

+ (void)readNodeStreamChunks:(id)a3 StreamName:(id)a4 ReadBuffer:(id)a5 MaxReadXferLen:(unsigned int)a6 CompletionHandler:(id)a7
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  id v14 = a7;
  if ([v11 isRoot])
  {
    uint64_t v15 = 0;
LABEL_4:
    id v21 = (void *)v15;
    id v16 = malloc_type_malloc(0xF8uLL, 0x10800407AD7242AuLL);
    _OWORD *v16 = 0u;
    v16[1] = 0u;
    v16[2] = 0u;
    v16[3] = 0u;
    void v16[4] = 0u;
    v16[5] = 0u;
    v16[6] = 0u;
    v16[7] = 0u;
    v16[8] = 0u;
    v16[9] = 0u;
    v16[10] = 0u;
    v16[11] = 0u;
    v16[12] = 0u;
    v16[13] = 0u;
    v16[14] = 0u;
    *((void *)v16 + 30) = 0;
    *(_OWORD *)((char *)v16 + 12) = xmmword_10006C500;
    *((_DWORD *)v16 + 7) = 1;
    if (*((_DWORD *)[v11 getSmbFattr] + 30) == 5) {
      *((_DWORD *)v16 + 8) |= 0x200000u;
    }
    id v17 = [v11 mp];
    id v18 = [v17 pd];
    id v19 = [v11 mp];
    id v20 = [v19 shareID];
    v22[0] = _NSConcreteStackBlock;
    v22[1] = 3221225472;
    v22[2] = sub_1000400B4;
    void v22[3] = &unk_10008A670;
    id v23 = v11;
    id v24 = v12;
    id v27 = v16;
    id v26 = v14;
    id v25 = v13;
    unsigned int v28 = a6;
    +[smb_subr sendCreateFile:v18 ShareID:v20 FileName:v21 StreamName:v24 Param:v16 CompletionHandler:v22];

    goto LABEL_7;
  }
  uint64_t v15 = +[smb_subr makeWindowsPath:v11 withName:0];
  if (v15) {
    goto LABEL_4;
  }
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
    sub_10005DEA4(v11);
  }
  (*((void (**)(id, uint64_t, void))v14 + 2))(v14, 22, 0);
LABEL_7:
}

+ (void)readNodeStreamChunk:(id)a3 FileNode:(id)a4 ReadBuffer:(id)a5 MaxReadXferLen:(unsigned int)a6 StreamOffset:(unsigned int)a7 rdparamPtr:(smb_read_write *)a8 result:(int)a9 bytesRead:(unint64_t)a10 bytesRemain:(unint64_t)a11 pass:(unint64_t)a12 reply:(id)a13
{
  id v16 = a3;
  id v17 = a4;
  id v18 = a5;
  id v19 = a13;
  id v20 = [v16 xattrIOQueue];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10004080C;
  block[3] = &unk_10008A6C0;
  unsigned int v38 = a6;
  unsigned int v39 = a7;
  unint64_t v33 = a10;
  unint64_t v34 = a11;
  int v40 = a9;
  id v29 = v16;
  id v30 = v18;
  id v31 = v17;
  id v32 = v19;
  uint64_t v35 = a8;
  unint64_t v36 = a12;
  id v37 = a1;
  id v21 = v17;
  id v22 = v18;
  id v23 = v19;
  id v24 = v16;
  dispatch_async(v20, block);
}

+ (void)readNodeStreamCompound:(id)a3 StreamName:(id)a4 ReadBuffer:(id)a5 CompletionHandler:(id)a6
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  id v12 = a6;
  v26[0] = 0;
  v26[1] = v26;
  v26[2] = 0x2020000000;
  int v27 = 0;
  if ([v9 isRoot])
  {
    id v13 = 0;
LABEL_4:
    id v14 = [v9 mp];
    uint64_t v15 = [v14 pd];
    id v16 = [v9 mp];
    id v17 = [v16 shareID];
    v20[0] = _NSConcreteStackBlock;
    v20[1] = 3221225472;
    v20[2] = sub_100040CEC;
    v20[3] = &unk_10008A6E8;
    id v24 = v12;
    id v25 = v26;
    id v18 = v13;
    id v21 = v18;
    id v22 = v10;
    id v23 = v11;
    +[SMBNode nodeForCmpd:v15 onShareID:v17 callBack:v20];

    goto LABEL_5;
  }
  id v13 = +[smb_subr makeWindowsPath:v9 withName:0];
  if (v13) {
    goto LABEL_4;
  }
  id v19 = &_os_log_default;
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
  {
    [v9 name];
    [ objc_claimAutoreleasedReturnValue() UTF8String];
    sub_10005E180();
  }

  (*((void (**)(id, uint64_t, void))v12 + 2))(v12, 22, 0);
LABEL_5:
  _Block_object_dispose(v26, 8);
}

+ (void)writeNodeStream:(id)a3 StreamName:(id)a4 How:(int)a5 MaxWriteXferLen:(unsigned int)a6 WriteBuffer:(id)a7 CompletionHandler:(id)a8
{
  uint64_t v9 = *(void *)&a6;
  uint64_t v10 = *(void *)&a5;
  id v14 = a8;
  id v15 = a7;
  id v16 = a4;
  id v17 = a3;
  if ((unint64_t)[v15 length] <= v9)
  {
    v23[0] = _NSConcreteStackBlock;
    v23[1] = 3221225472;
    v23[2] = sub_1000413E0;
    v23[3] = &unk_1000889C8;
    id v18 = &v24;
    id v24 = v14;
    id v20 = v14;
    [a1 writeNodeStreamCompound:v17 StreamName:v16 How:v10 WriteBuffer:v15 CompletionHandler:v23];
  }
  else
  {
    v21[0] = _NSConcreteStackBlock;
    v21[1] = 3221225472;
    v21[2] = sub_1000413F0;
    v21[3] = &unk_1000889C8;
    id v18 = &v22;
    id v22 = v14;
    id v19 = v14;
    [a1 writeNodeStreamChunks:v17 StreamName:v16 How:v10 MaxWriteXferLen:v9 WriteBuffer:v15 CompletionHandler:v21];
  }
}

+ (void)writeNodeStreamChunks:(id)a3 StreamName:(id)a4 How:(int)a5 MaxWriteXferLen:(unsigned int)a6 WriteBuffer:(id)a7 CompletionHandler:(id)a8
{
  id v14 = a3;
  id v15 = a4;
  id v16 = a7;
  id v17 = (void (**)(id, uint64_t))a8;
  if ([v14 isRoot])
  {
    id v18 = 0;
LABEL_4:
    id v19 = (char *)malloc_type_malloc(0xF8uLL, 0x10800407AD7242AuLL);
    *(_OWORD *)id v19 = 0u;
    *((_OWORD *)v19 + 1) = 0u;
    *((_OWORD *)v19 + 2) = 0u;
    *((_OWORD *)v19 + 3) = 0u;
    *((_OWORD *)v19 + 4) = 0u;
    *((_OWORD *)v19 + 5) = 0u;
    *((_OWORD *)v19 + 6) = 0u;
    *((_OWORD *)v19 + 7) = 0u;
    *((_OWORD *)v19 + 8) = 0u;
    *((_OWORD *)v19 + 9) = 0u;
    *((_OWORD *)v19 + 10) = 0u;
    *((_OWORD *)v19 + 11) = 0u;
    *((_OWORD *)v19 + 12) = 0u;
    *((_OWORD *)v19 + 13) = 0u;
    *((_OWORD *)v19 + 14) = 0u;
    *((void *)v19 + 30) = 0;
    *(void *)(v19 + 12) = 0x200000002;
    *((_DWORD *)v19 + 5) = 128;
    if (a5 >= 3)
    {
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
        sub_10005E5E8();
      }
      v17[2](v17, 22);
    }
    else
    {
      id v20 = v19;
      id v25 = a1;
      unsigned int v26 = a6;
      *((_DWORD *)v19 + 7) = dword_10006C520[a5];
      if (*((_DWORD *)[v14 getSmbFattr] + 30) == 5) {
        *((_DWORD *)v20 + 8) |= 0x200000u;
      }
      id v21 = [v14 mp];
      id v22 = [v21 pd];
      id v23 = [v14 mp];
      unsigned int v24 = [v23 shareID];
      v27[0] = _NSConcreteStackBlock;
      v27[1] = 3221225472;
      v27[2] = sub_1000416D8;
      v27[3] = &unk_10008A760;
      id v28 = v14;
      id v29 = v15;
      id v32 = v20;
      id v31 = v17;
      id v33 = v25;
      id v30 = v16;
      unsigned int v34 = v26;
      +[smb_subr sendCreateFile:v22 ShareID:v24 FileName:v18 StreamName:v29 Param:v20 CompletionHandler:v27];
    }
    goto LABEL_12;
  }
  id v18 = +[smb_subr makeWindowsPath:v14 withName:0];
  if (v18) {
    goto LABEL_4;
  }
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
    sub_10005E658(v14);
  }
  v17[2](v17, 22);
LABEL_12:
}

+ (void)writeNodeStreamChunk:(id)a3 FileNode:(id)a4 WriteBuffer:(id)a5 MaxWriteXferLen:(unsigned int)a6 StreamOffset:(unsigned int)a7 wrparamPtr:(smb_read_write *)a8 result:(int)a9 bytesWritten:(unint64_t)a10 bytesRemain:(unint64_t)a11 pass:(unint64_t)a12 reply:(id)a13
{
  id v16 = a3;
  id v17 = a4;
  id v18 = a5;
  id v19 = a13;
  id v20 = [v16 xattrIOQueue];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100041D30;
  block[3] = &unk_10008A6C0;
  unsigned int v38 = a6;
  unsigned int v39 = a7;
  unint64_t v33 = a10;
  unint64_t v34 = a11;
  int v40 = a9;
  id v29 = v16;
  id v30 = v18;
  id v31 = v17;
  id v32 = v19;
  uint64_t v35 = a8;
  unint64_t v36 = a12;
  id v37 = a1;
  id v21 = v17;
  id v22 = v18;
  id v23 = v19;
  id v24 = v16;
  dispatch_async(v20, block);
}

+ (void)writeNodeStreamCompound:(id)a3 StreamName:(id)a4 How:(int)a5 WriteBuffer:(id)a6 CompletionHandler:(id)a7
{
  id v11 = a3;
  id v21 = a4;
  id v12 = a6;
  id v13 = a7;
  v29[0] = 0;
  v29[1] = v29;
  v29[2] = 0x2020000000;
  int v30 = 0;
  if ([v11 isRoot])
  {
    id v14 = 0;
LABEL_4:
    id v15 = [v11 mp];
    id v16 = [v15 pd];
    id v17 = [v11 mp];
    id v18 = [v17 shareID];
    v22[0] = _NSConcreteStackBlock;
    v22[1] = 3221225472;
    v22[2] = sub_100042244;
    void v22[3] = &unk_10008A7B0;
    int v28 = a5;
    id v26 = v13;
    int v27 = v29;
    id v19 = v14;
    id v23 = v19;
    id v24 = v21;
    id v25 = v12;
    +[SMBNode nodeForCmpd:v16 onShareID:v18 callBack:v22];

    goto LABEL_5;
  }
  id v14 = +[smb_subr makeWindowsPath:v11 withName:0];
  if (v14) {
    goto LABEL_4;
  }
  id v20 = &_os_log_default;
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
  {
    [v11 name];
    [ objc_claimAutoreleasedReturnValue() UTF8String];
    sub_10005E93C();
  }

  (*((void (**)(id, uint64_t))v13 + 2))(v13, 22);
LABEL_5:
  _Block_object_dispose(v29, 8);
}

+ (void)deleteNodeStream:(id)a3 StreamName:(id)a4 CompletionHandler:(id)a5
{
  id v7 = a3;
  id v8 = a4;
  id v9 = a5;
  v23[0] = 0;
  v23[1] = v23;
  v23[2] = 0x2020000000;
  int v24 = 0;
  if ([v7 isRoot])
  {
    uint64_t v10 = 0;
LABEL_4:
    id v11 = [v7 mp];
    id v12 = [v11 pd];
    id v13 = [v7 mp];
    id v14 = [v13 shareID];
    v17[0] = _NSConcreteStackBlock;
    v17[1] = 3221225472;
    v17[2] = sub_1000429D4;
    v17[3] = &unk_10008A6E8;
    id v21 = v9;
    id v22 = v23;
    id v15 = v10;
    id v18 = v15;
    id v19 = v8;
    id v20 = v7;
    +[SMBNode nodeForCmpd:v12 onShareID:v14 callBack:v17];

    goto LABEL_5;
  }
  uint64_t v10 = +[smb_subr makeWindowsPath:v7 withName:0];
  if (v10) {
    goto LABEL_4;
  }
  id v16 = &_os_log_default;
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
  {
    [v7 name];
    [ objc_claimAutoreleasedReturnValue() UTF8String];
    sub_10005ED7C();
  }

  (*((void (**)(id, uint64_t))v9 + 2))(v9, 22);
LABEL_5:
  _Block_object_dispose(v23, 8);
}

+ (void)enumDirOpen:(id)a3 SearchPattern:(id)a4 IsWildcard:(BOOL)a5 CompletionHandler:(id)a6
{
  BOOL v18 = a5;
  id v8 = a3;
  id v9 = a6;
  id v10 = a4;
  if ([v8 isRoot])
  {
    id v17 = 0;
  }
  else
  {
    id v17 = +[smb_subr makeWindowsPath:v8 withName:0];
  }
  id v11 = malloc_type_malloc(8uLL, 0x100004000313F17uLL);
  id v12 = [v8 mp];
  id v13 = [v12 pd];
  id v14 = [v8 mp];
  id v15 = [v14 shareID];
  v19[0] = _NSConcreteStackBlock;
  v19[1] = 3221225472;
  v19[2] = sub_100043050;
  v19[3] = &unk_10008A7D8;
  id v20 = v9;
  id v21 = v11;
  id v16 = v9;
  +[SMBDirEnumerator enumeratorWithParameters:v13 onShareID:v15 dirName:v17 lookUpName:v10 searchFlags:v18 outParameters:v11 callBack:v19];
}

+ (void)enumDirNext:(id)a3 DirEnt:(id)a4 CompletionHandler:(id)a5
{
  id v7 = a5;
  id v8 = a4;
  id v9 = a3;
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_1000431D0;
  v11[3] = &unk_10008A268;
  id v12 = v7;
  id v13 = malloc_type_malloc(8uLL, 0x100004000313F17uLL);
  id v10 = v7;
  [v9 nextEntry:v8 outParameters:v13 callBack:v11];
}

+ (void)enumDirClose:(id)a3 CompletionHandler:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_100043340;
  v8[3] = &unk_10008A268;
  id v9 = v5;
  id v10 = malloc_type_malloc(8uLL, 0x100004000313F17uLL);
  id v7 = v5;
  [v6 close:v10 callBack:v8];
}

+ (void)statFS:(id)a3 ShareID:(unsigned int)a4 CompletionHandler:(id)a5
{
  uint64_t v6 = *(void *)&a4;
  id v7 = a3;
  v12[0] = 0;
  v12[1] = v12;
  v12[2] = 0x2020000000;
  int v13 = 0;
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_1000434DC;
  v9[3] = &unk_10008A800;
  id v8 = a5;
  id v10 = v8;
  id v11 = v12;
  +[SMBNode nodeForCmpd:v7 onShareID:v6 callBack:v9];

  _Block_object_dispose(v12, 8);
}

+ (void)setNodeBasicInfo:(id)a3 BasicInfo:(smb2_file_basic_info *)a4 FileType:(int)a5 CompletionHandler:(id)a6
{
  id v9 = a3;
  id v10 = a6;
  v25[0] = 0;
  v25[1] = v25;
  v25[2] = 0x2020000000;
  int v26 = 0;
  if ([v9 isRoot])
  {
    id v11 = 0;
LABEL_4:
    id v12 = [v9 mp];
    int v13 = [v12 pd];
    id v14 = [v9 mp];
    id v15 = [v14 shareID];
    v18[0] = _NSConcreteStackBlock;
    v18[1] = 3221225472;
    v18[2] = sub_100043C90;
    v18[3] = &unk_10008A828;
    id v19 = v9;
    int v24 = a5;
    id v21 = v10;
    id v22 = v25;
    id v16 = v11;
    id v20 = v16;
    id v23 = a4;
    +[SMBNode nodeForCmpd:v13 onShareID:v15 callBack:v18];

    goto LABEL_5;
  }
  id v11 = +[smb_subr makeWindowsPath:v9 withName:0];
  if (v11) {
    goto LABEL_4;
  }
  id v17 = &_os_log_default;
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
  {
    [v9 name];
    [ objc_claimAutoreleasedReturnValue() UTF8String];
    sub_10005F4D0();
  }

  (*((void (**)(id, uint64_t))v10 + 2))(v10, 22);
LABEL_5:
  _Block_object_dispose(v25, 8);
}

+ (void)setNodeEOF:(id)a3 Eof:(unint64_t)a4 FileType:(int)a5 CompletionHandler:(id)a6
{
  id v9 = a3;
  id v10 = a6;
  v25[0] = 0;
  v25[1] = v25;
  v25[2] = 0x2020000000;
  int v26 = 0;
  if ([v9 isRoot])
  {
    id v11 = 0;
LABEL_4:
    id v12 = [v9 mp];
    int v13 = [v12 pd];
    id v14 = [v9 mp];
    id v15 = [v14 shareID];
    v18[0] = _NSConcreteStackBlock;
    v18[1] = 3221225472;
    v18[2] = sub_100044408;
    v18[3] = &unk_10008A828;
    id v19 = v9;
    int v24 = a5;
    id v21 = v10;
    id v22 = v25;
    id v16 = v11;
    id v20 = v16;
    unint64_t v23 = a4;
    +[SMBNode nodeForCmpd:v13 onShareID:v15 callBack:v18];

    goto LABEL_5;
  }
  id v11 = +[smb_subr makeWindowsPath:v9 withName:0];
  if (v11) {
    goto LABEL_4;
  }
  id v17 = &_os_log_default;
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
  {
    [v9 name];
    [ objc_claimAutoreleasedReturnValue() UTF8String];
    sub_10005F900();
  }

  (*((void (**)(id, uint64_t))v10 + 2))(v10, 22);
LABEL_5:
  _Block_object_dispose(v25, 8);
}

+ (void)deleteNameInParent:(id)a3 DeleteName:(id)a4 FileType:(int)a5 CompletionHandler:(id)a6
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a6;
  v25[0] = 0;
  v25[1] = v25;
  v25[2] = 0x2020000000;
  int v26 = 0;
  id v12 = +[smb_subr makeWindowsPath:v9 withName:v10];
  if (v12)
  {
    int v13 = [v9 mp];
    id v14 = [v13 pd];
    id v15 = [v9 mp];
    id v16 = [v15 shareID];
    v18[0] = _NSConcreteStackBlock;
    v18[1] = 3221225472;
    v18[2] = sub_100044B64;
    v18[3] = &unk_10008A850;
    id v19 = v9;
    id v20 = v10;
    int v24 = a5;
    id v22 = v11;
    unint64_t v23 = v25;
    id v21 = v12;
    +[SMBNode nodeForCmpd:v14 onShareID:v16 callBack:v18];
  }
  else
  {
    id v17 = &_os_log_default;
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
    {
      [v9 name];
      objc_claimAutoreleasedReturnValue();
      sub_10005FD30();
    }

    (*((void (**)(id, uint64_t))v11 + 2))(v11, 22);
  }
  _Block_object_dispose(v25, 8);
}

+ (void)renameFile:(id)a3 FileName:(id)a4 NewParent:(id)a5 NewName:(id)a6 VType:(int)a7 CompletionHandler:(id)a8
{
  id v13 = a3;
  id v31 = a4;
  id v14 = a5;
  id v15 = a6;
  id v16 = (void (**)(id, uint64_t))a8;
  v40[0] = 0;
  v40[1] = v40;
  v40[2] = 0x2020000000;
  int v41 = 0;
  id v29 = v14;
  id v30 = v15;
  if (v14)
  {
    id v17 = +[smb_subr makeWindowsPath:v14 withName:v15];
    if (!v17)
    {
      id v18 = &_os_log_default;
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
      {
        id v19 = [v14 name];
        sub_100060208((uint64_t)[v19 UTF8String], (uint64_t)objc_msgSend(v15, "UTF8String"), (uint64_t)v42, v19);
      }
LABEL_13:

      v16[2](v16, 22);
      id v17 = 0;
LABEL_14:
      id v25 = 0;
      goto LABEL_15;
    }
  }
  else
  {
    id v17 = +[smb_subr makeWindowsPath:v13 withName:v15];
    if (!v17)
    {
      id v27 = &_os_log_default;
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
      {
        id v28 = [v13 name];
        sub_10006016C((uint64_t)[v28 UTF8String], (uint64_t)objc_msgSend(v15, "UTF8String"), (uint64_t)v42, v28);
      }
      goto LABEL_13;
    }
  }
  id v20 = +[smb_subr makeWindowsPath:withName:](smb_subr, "makeWindowsPath:withName:", v13, v31, v14, v15);
  if (!v20)
  {
    id v26 = &_os_log_default;
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
    {
      [v13 name];
      objc_claimAutoreleasedReturnValue();
      sub_1000601BC();
    }

    v16[2](v16, 22);
    goto LABEL_14;
  }
  id v21 = [v13 mp];
  id v22 = [v21 pd];
  unint64_t v23 = [v13 mp];
  id v24 = [v23 shareID];
  v32[0] = _NSConcreteStackBlock;
  v32[1] = 3221225472;
  v32[2] = sub_100045430;
  v32[3] = &unk_10008A878;
  id v33 = v13;
  id v34 = v31;
  int v39 = a7;
  id v37 = v16;
  unsigned int v38 = v40;
  id v25 = v20;
  id v35 = v25;
  id v17 = v17;
  id v36 = v17;
  +[SMBNode nodeForCmpd:v22 onShareID:v24 callBack:v32];

LABEL_15:
  _Block_object_dispose(v40, 8);
}

+ (void)queryMaxAccess:(id)a3 CompletionHandler:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  v19[0] = 0;
  v19[1] = v19;
  v19[2] = 0x2020000000;
  int v20 = 0;
  if ([v5 isRoot])
  {
    id v7 = 0;
LABEL_4:
    id v8 = [v5 mp];
    id v9 = [v8 pd];
    id v10 = [v5 mp];
    id v11 = [v10 shareID];
    v14[0] = _NSConcreteStackBlock;
    v14[1] = 3221225472;
    v14[2] = sub_100045B78;
    v14[3] = &unk_10008A8C8;
    id v17 = v6;
    id v15 = v5;
    id v18 = v19;
    id v12 = v7;
    id v16 = v12;
    +[SMBNode nodeForCmpd:v9 onShareID:v11 callBack:v14];

    goto LABEL_5;
  }
  id v7 = +[smb_subr makeWindowsPath:v5 withName:0];
  if (v7) {
    goto LABEL_4;
  }
  id v13 = &_os_log_default;
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
  {
    [v5 name];
    objc_claimAutoreleasedReturnValue();
    sub_100060640();
  }

  (*((void (**)(id, uint64_t, void))v6 + 2))(v6, 22, 0);
LABEL_5:
  _Block_object_dispose(v19, 8);
}

+ (id)encodePath:(id)a3
{
  id v3 = a3;
  v4 = objc_msgSend(v3, "stringByReplacingOccurrencesOfString:withString:options:range:", @"/", @"\\", 2, 0, objc_msgSend(v3, "length""));

  if (v4)
  {
    id v5 = [v4 dataUsingEncoding:2483028224];
  }
  else
  {
    id v5 = 0;
  }

  return v5;
}

+ (id)makeWindowsPath:(id)a3 withName:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  id v7 = objc_alloc_init((Class)NSMutableString);
  id v8 = objc_alloc_init((Class)NSMutableArray);
  id v9 = v5;
  id v10 = v9;
  if (v9)
  {
    id v11 = v9;
    do
    {
      if ([v11 isRoot]) {
        break;
      }
      id v12 = [v11 name];
      [v8 addObject:v12];

      uint64_t v13 = [v11 parent];

      id v11 = (void *)v13;
    }
    while (v13);
  }
  long long v24 = 0u;
  long long v25 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  id v14 = [v8 reverseObjectEnumerator];
  id v15 = [v14 countByEnumeratingWithState:&v22 objects:v26 count:16];
  if (v15)
  {
    id v16 = v15;
    uint64_t v17 = *(void *)v23;
    do
    {
      for (i = 0; i != v16; i = (char *)i + 1)
      {
        if (*(void *)v23 != v17) {
          objc_enumerationMutation(v14);
        }
        [v7 appendFormat:@"%@/", *(void *)(*((void *)&v22 + 1) + 8 * i)];
      }
      id v16 = [v14 countByEnumeratingWithState:&v22 objects:v26 count:16];
    }
    while (v16);
  }

  if ([v7 length])
  {
    if (v6)
    {
      [v7 appendFormat:@"%@", v6];
      id v19 = v7;
    }
    else
    {
      objc_msgSend(v7, "substringToIndex:", (char *)objc_msgSend(v7, "length") - 1);
      id v19 = (id)objc_claimAutoreleasedReturnValue();
    }
    goto LABEL_19;
  }
  if (v6)
  {
    id v19 = [objc_alloc((Class)NSString) initWithString:v6];
LABEL_19:
    int v20 = v19;
    goto LABEL_20;
  }
  int v20 = 0;
LABEL_20:

  return v20;
}

+ (void)setChangeNotify:(id)a3 Param:(changeNotifyArgs *)a4 CompletionHandler:(id)a5 NotifyHandler:(id)a6
{
  id v9 = a3;
  id v10 = (void (**)(id, uint64_t))a5;
  id v11 = a6;
  if (v9)
  {
    +[smb_subr sendChangeNotify:v9 Param:a4 CompletionHandler:v10 NotifyHandler:v11];
  }
  else
  {
    BOOL v12 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR);
    if (v12) {
      sub_10006092C(v12, v13, v14);
    }
    v10[2](v10, 22);
  }
}

@end