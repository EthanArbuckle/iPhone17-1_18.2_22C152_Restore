@interface liveFSNode
+ (id)FileProviderFileHandleForFileID:(unint64_t)a3;
- (BOOL)decmpfsTypeIsDataless:(unsigned int)a3;
- (BOOL)lfn_check_appledouble;
- (BOOL)verifyFileIsFSCompressed:(int *)a3;
- (LiveFSAppleDouble)lfn_appledouble;
- (LiveFSXattrCache)lfn_xattrCache;
- (NSData)getAttrData;
- (NSString)lfn_fh;
- (NSString)lfn_name;
- (id)getFH;
- (int)blockmapWithRange:(_NSRange)a3 startIO:(int)a4 flags:(unsigned int)a5 operationID:(unint64_t)a6 extentCount:(unsigned int *)a7 extents:(id)a8;
- (int)cloneFileToDirectory:(id)a3 withName:(id)a4 attrs:(id)a5 flags:(unsigned int)a6 andResultingNode:(id *)a7;
- (int)createDirEntry:(id)a3 withAttrs:(id)a4 withData:(id)a5 withResultingNode:(id *)a6;
- (int)decmpfsFetchCompressedHeader:(id *)a3;
- (int)endIOWithRange:(_NSRange)a3 status:(int)a4 flags:(unsigned int)a5 operationID:(unint64_t)a6;
- (int)fetchUncompressedData:(id *)a3 offset:(unint64_t)a4 length:(unint64_t)a5 vectorSize:(int)a6 vector:(id *)a7 withLengthOut:(unint64_t *)a8;
- (int)getAttribute:(id *)a3;
- (int)getDeviceFD;
- (int)getFileSystemAttribute:(id)a3 andResult:(id *)a4;
- (int)getXAttr:(id)a3 withBuffer:(id *)a4;
- (int)hiddenStatus;
- (int)lfn_openCount;
- (int)lfn_wasWritten;
- (int)link:(id)a3 withName:(id)a4 fileAttrOut:(id *)a5 dirAttrOut:(id *)a6;
- (int)listXattr:(id *)a3;
- (int)lookup:(id)a3 withResultingNode:(id *)a4;
- (int)pathConf:(id *)a3;
- (int)readData:(unint64_t)a3 intoDataBuffer:(id)a4 withLengthOut:(unint64_t *)a5;
- (int)readDirectoryEntries:(id)a3 withCookie:(unint64_t)a4 withLengthOut:(int64_t *)a5 andWithVerifier:(unint64_t *)a6;
- (int)readDirectoryEntriesWithAttrs:(id)a3 withCookie:(unint64_t)a4 withLengthOut:(int64_t *)a5 andWithVerifier:(unint64_t *)a6;
- (int)readSymLinkDataInto:(void *)a3 ofSize:(int)a4 withSymLinkDataSize:(unint64_t *)a5 andWithSymLinkAttrData:(id *)a6;
- (int)readUncompressedData:(unint64_t)a3 intoDataBuffer:(id)a4 withLengthOut:(unint64_t *)a5;
- (int)reclaim;
- (int)remove:(int)a3 named:(id)a4 node:(id)a5 usingFlags:(int)a6;
- (int)rename:(id)a3 named:(id)a4 withToDirNode:(id)a5 withToNode:(id)a6 withToName:(id)a7 andFlags:(unsigned int)a8;
- (int)scanDirectoryForMatches:(id)a3 withScanDirCookie:(unint64_t *)a4 withScanDirCookieVerifier:(unint64_t *)a5 withSearchResultType:(int *)a6 withSearchResult:(id *)a7 withSearchResultAttr:(_LIFileAttributes *)a8;
- (int)scanVolumeForFileIDs:(const unint64_t *)a3 count:(unsigned int)a4 returningAttributes:(unint64_t)a5 withBlock:(id)a6;
- (int)setAttributeTo:(id)a3 withResultingAttribute:(id *)a4;
- (int)setFileSystemAttributes:(id)a3 toValue:(id)a4 andResult:(id *)a5;
- (int)setXAttr:(id)a3 withXAttr:(id)a4 how:(int)a5;
- (int)statFS:(id *)a3;
- (int)syncTheFileSystem:(unint64_t)a3;
- (int)unloadFileSystem:(int)a3;
- (int)updateName:(id)a3 andParent:(id)a4;
- (int)writeData:(unint64_t)a3 fromBuffer:(id)a4 withLengthOut:(unint64_t *)a5;
- (liveFSNode)initWithVolume:(id)a3 andParent:(id)a4 andName:(id)a5 andUVFSNode:(void *)a6;
- (liveFSNode)initWithVolume:(id)a3 andRootUVFSNode:(void *)a4;
- (liveFSNode)lfn_parent;
- (unint64_t)lfn_fileid;
- (unint64_t)lfn_inUseClientSet;
- (unint64_t)lfn_interestedClients;
- (unint64_t)lfn_seqno;
- (unsigned)decmpfsGetDirectoryEntries:(id *)a3;
- (unsigned)getLinkCount;
- (void)UVFSNode;
- (void)createFilterAttr:(_LIFileAttributes *)a3 FromCriteria:(id)a4;
- (void)createScanDirReplyRequest:(_scandir_matching_reply *)a3;
- (void)createScanDirSearchRequest:(_scandir_matching_request *)a3 withFilter:(_LIFileAttributes *)a4 withCookie:(unint64_t *)a5 withCookieVerifier:(unint64_t *)a6 fromSearchCriteria:(id)a7;
- (void)dealloc;
- (void)forceUpdateAttrs;
- (void)getCompressionFileInfo;
- (void)setCachedAttrs:(id)a3;
- (void)setLfn_appledouble:(id)a3;
- (void)setLfn_check_appledouble:(BOOL)a3;
- (void)setLfn_fh:(id)a3;
- (void)setLfn_inUseClientSet:(unint64_t)a3;
- (void)setLfn_interestedClients:(unint64_t)a3;
- (void)setLfn_name:(id)a3;
- (void)setLfn_openCount:(int)a3;
- (void)setLfn_parent:(id)a3;
- (void)setLfn_seqno:(unint64_t)a3;
- (void)setLfn_wasWritten:(int)a3;
- (void)setLfn_xattrCache:(id)a3;
@end

@implementation liveFSNode

+ (id)FileProviderFileHandleForFileID:(unint64_t)a3
{
  unint64_t v7 = a3;
  v3 = +[NSData dataWithBytes:&v7 length:8];
  v4 = [v3 base64EncodedStringWithOptions:1];
  v5 = [v4 stringByReplacingOccurrencesOfString:@"/" withString:@":"];

  return v5;
}

- (liveFSNode)initWithVolume:(id)a3 andRootUVFSNode:(void *)a4
{
  id v7 = a3;
  v8 = [(liveFSNode *)self init];
  v9 = v8;
  if (v8)
  {
    v8->_UVFSNode = a4;
    v10 = [v7 volumeRawDevice];
    v11 = [v10 fsPlugin];
    v9->FSOps = (_UVFSFSOps *)[v11 FSOps];

    objc_storeStrong((id *)&v9->volume, a3);
    v9->isFSCompressed = 0;
    v9->streamNode = 0;
    v9->_lfn_fileid = 2;
    uint64_t v12 = +[liveFSNode FileProviderFileHandleForFileID:[(liveFSNode *)v9 lfn_fileid]];
    lfn_fh = v9->_lfn_fh;
    v9->_lfn_fh = (NSString *)v12;

    v9->_lfn_wasWritten = 0;
    v14 = [(userFSVolume *)v9->volume appleDoubleManager];
    v9->_lfn_check_appledouble = v14 != 0;

    uint64_t v15 = +[LiveFSXattrCache xattrCacheWithMaxItems:4 andMaxItemSize:64];
    lfn_xattrCache = v9->_lfn_xattrCache;
    v9->_lfn_xattrCache = (LiveFSXattrCache *)v15;
  }
  return v9;
}

- (liveFSNode)initWithVolume:(id)a3 andParent:(id)a4 andName:(id)a5 andUVFSNode:(void *)a6
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  v14 = [(liveFSNode *)self init];
  uint64_t v15 = v14;
  if (!v14) {
    goto LABEL_19;
  }
  p_volume = (id *)&v14->volume;
  objc_storeStrong((id *)&v14->volume, a3);
  v15->_UVFSNode = a6;
  v17 = [v11 volumeRawDevice];
  v18 = [v17 fsPlugin];
  v15->FSOps = (_UVFSFSOps *)[v18 FSOps];

  v15->isFSCompressed = 0;
  v15->streamNode = 0;
  v19 = [(liveFSNode *)v15 getAttrData];
  v20 = v19;
  if (v19)
  {
    if ([v19 bytes] && v15->attrsData)
    {
      if ([*p_volume supportsPersistentObjectIdentifier])
      {
        id v21 = (id)*((void *)[(NSMutableData *)v15->attrsData bytes] + 8);
      }
      else
      {
        id v21 = [*p_volume getNextObjectIdentifier];
        if ((unint64_t)v21 <= 2 && os_log_type_enabled((os_log_t)userfs_log_default, OS_LOG_TYPE_ERROR)) {
          sub_100026854();
        }
        v22 = [(NSMutableData *)v15->attrsData mutableBytes];
        v22[1] |= 0x100uLL;
        *((void *)[(NSMutableData *)v15->attrsData mutableBytes] + 8) = v21;
      }
      if ((*((unsigned char *)[(NSMutableData *)v15->attrsData bytes] + 44) & 0x20) != 0) {
        [(liveFSNode *)v15 getCompressionFileInfo];
      }
      goto LABEL_16;
    }
LABEL_9:

    uint64_t v15 = 0;
    goto LABEL_19;
  }
  if (!v15->attrsData) {
    goto LABEL_9;
  }
  id v21 = 0;
LABEL_16:
  objc_storeStrong((id *)&v15->_lfn_name, a5);
  objc_storeStrong((id *)&v15->_lfn_parent, a4);
  v15->_lfn_fileid = (unint64_t)v21;
  uint64_t v23 = +[liveFSNode FileProviderFileHandleForFileID:v21];
  lfn_fh = v15->_lfn_fh;
  v15->_lfn_fh = (NSString *)v23;

  v15->_lfn_wasWritten = 0;
  v25 = [(userFSVolume *)v15->volume appleDoubleManager];
  v15->_lfn_check_appledouble = v25 != 0;

  uint64_t v26 = +[LiveFSXattrCache xattrCacheWithMaxItems:4 andMaxItemSize:64];
  lfn_xattrCache = v15->_lfn_xattrCache;
  v15->_lfn_xattrCache = (LiveFSXattrCache *)v26;

  [(userFSVolume *)v15->volume insertIntoFHCache:v15];
  [(userFSVolume *)v15->volume insertIntoNameCache:v15 withParent:v12];
  v28 = (void *)userfs_log_default;
  if (os_log_type_enabled((os_log_t)userfs_log_default, OS_LOG_TYPE_DEBUG))
  {
    v30 = v15->_lfn_fh;
    v31 = v28;
    v32 = objc_msgSend(v12, "lfn_fh");
    int v33 = 134219010;
    v34 = v15;
    __int16 v35 = 2112;
    id v36 = v13;
    __int16 v37 = 2112;
    v38 = v30;
    __int16 v39 = 2048;
    v40 = a6;
    __int16 v41 = 2112;
    v42 = v32;
    _os_log_debug_impl((void *)&_mh_execute_header, v31, OS_LOG_TYPE_DEBUG, "LFN[%p]: Created node for name: %@ with filehandle: %@ and UVFSFileNode: %p and parent: %@", (uint8_t *)&v33, 0x34u);
  }
LABEL_19:

  return v15;
}

- (void)dealloc
{
  if (self->_UVFSNode)
  {
    if (os_log_type_enabled((os_log_t)userfs_log_default, OS_LOG_TYPE_ERROR)) {
      sub_100026954();
    }
    if ([(liveFSNode *)self reclaim] && os_log_type_enabled((os_log_t)userfs_log_default, OS_LOG_TYPE_ERROR)) {
      sub_1000268D8();
    }
  }
  v3.receiver = self;
  v3.super_class = (Class)liveFSNode;
  [(liveFSNode *)&v3 dealloc];
}

- (id)getFH
{
  return self->_lfn_fh;
}

- (unsigned)getLinkCount
{
  if (![(userFSVolume *)self->volume supportsHardLinks]) {
    return 1;
  }
  uint64_t v3 = [(liveFSNode *)self getAttrData];
  if (!v3) {
    return 1;
  }
  v4 = (void *)v3;
  id v5 = [(liveFSNode *)self getAttrData];
  v6 = [v5 bytes];
  if (!v6 || (id v7 = v6, v8 = v6[1], (v8 & 1) == 0) || *((_DWORD *)v6 + 6) == 2)
  {

    return 1;
  }

  if ((v8 & 4) == 0) {
    return 1;
  }
  return *((_DWORD *)v7 + 8);
}

- (int)hiddenStatus
{
  if ([(liveFSNode *)self getLinkCount] > 1) {
    return 0;
  }
  uint64_t v3 = [(liveFSNode *)self lfn_name];
  unsigned int v4 = [v3 hasPrefix:@"."];

  if (v4) {
    return 2;
  }
  else {
    return 0;
  }
}

- (void)forceUpdateAttrs
{
  v2 = self;
  objc_sync_enter(v2);
  attrsData = v2->attrsData;
  v2->attrsData = 0;

  objc_sync_exit(v2);
  id v4 = [(liveFSNode *)v2 getAttrData];
}

- (int)updateName:(id)a3 andParent:(id)a4
{
  id v6 = a4;
  [(liveFSNode *)self setLfn_name:a3];
  [(liveFSNode *)self setLfn_parent:v6];

  return 0;
}

- (int)unloadFileSystem:(int)a3
{
  FSOps = self->FSOps;
  if (!FSOps) {
    return 0;
  }
  var7 = (uint64_t (*)(void *, uint64_t))FSOps->var7;
  if (!var7) {
    return 0;
  }
  if ((a3 & 8) != 0) {
    uint64_t v6 = 3;
  }
  else {
    uint64_t v6 = a3 & 1;
  }
  int result = var7(self->_UVFSNode, v6);
  if (!result) {
    self->_UVFSNode = 0;
  }
  return result;
}

- (int)syncTheFileSystem:(unint64_t)a3
{
  FSOps = self->FSOps;
  if (!FSOps) {
    return 0;
  }
  if (!FSOps->var5) {
    return 0;
  }
  char v4 = a3;
  if ([(userFSVolume *)self->volume readOnly] || !self->_UVFSNode) {
    return 0;
  }
  uint64_t v6 = self->FSOps;
  if ((v4 & 2) == 0 || (var5 = (uint64_t (*)(void))v6->var6) == 0) {
    var5 = (uint64_t (*)(void))v6->var5;
  }

  return var5();
}

- (int)getFileSystemAttribute:(id)a3 andResult:(id *)a4
{
  uint64_t v6 = (const char *)[a3 UTF8String];
  uint64_t v30 = 0;
  uint64_t v31 = 0;
  *a4 = 0;
  if (!strcmp(v6, "_S_f_location"))
  {
    uint64_t v15 = [(userFSVolume *)self->volume volumeRawDevice];
    v16 = [v15 deviceName];
    v17 = +[NSString stringWithFormat:@"/dev/%@", v16];

    id v18 = v17;
    v19 = (const char *)[v18 UTF8String];
    id v20 = +[NSData dataWithBytes:v19 length:strlen(v19) + 1];
    *a4 = v20;
    if (v20) {
      int v13 = 0;
    }
    else {
      int v13 = 12;
    }
LABEL_22:

    return v13;
  }
  if (!strcmp(v6, "_B_has_perm_enforcement") || !strcmp(v6, "_B_has_access_check"))
  {
    LOBYTE(v31) = 0;
LABEL_16:
    id v14 = [objc_alloc((Class)NSData) initWithBytes:&v31 length:8];
    *a4 = v14;
    if (v14) {
      return 0;
    }
    else {
      return 12;
    }
  }
  if (!strcmp(v6, "_N_mntflags"))
  {
    if (self->_UVFSNode && (var8 = (unsigned int (*)(void))self->FSOps->var8) != 0 && !var8()) {
      uint64_t v23 = v31 | 0x10000000;
    }
    else {
      uint64_t v23 = 0x10000000;
    }
    uint64_t v31 = v23;
    if ([(userFSVolume *)self->volume readOnly]) {
      v31 |= 1uLL;
    }
    goto LABEL_16;
  }
  if (!strcmp(v6, "_O_f_uuid"))
  {
    v32[0] = 0;
    v32[1] = 0;
    id v7 = objc_alloc((Class)NSUUID);
    uint64_t v8 = [(userFSVolume *)self->volume volumeName];
    id v9 = [v7 initWithUUIDString:v8];
    [v9 getUUIDBytes:v32];

    *a4 = +[NSData dataWithBytes:v32 length:16];
  }
  FSOps = self->FSOps;
  if (!FSOps) {
    return 45;
  }
  id v11 = (uint64_t (*)(void))FSOps->var8;
  if (!v11) {
    return 45;
  }
  if (!self->_UVFSNode) {
    return 22;
  }
  if (*v6 == 95)
  {
    int v12 = *((unsigned __int8 *)v6 + 1);
    if (v12 == 78 || v12 == 66)
    {
      int v13 = v11();
      if (v13) {
        return v13;
      }
      goto LABEL_16;
    }
  }
  int v24 = v11();
  int v13 = v24;
  if (v24 == 2) {
    return v13;
  }
  if (v24 == 7)
  {
    id v25 = objc_alloc((Class)NSMutableData);
    id v26 = [v25 initWithLength:v30];
    v27 = (uint64_t (*)(void *, const char *, id, uint64_t, uint64_t *))self->FSOps->var8;
    UVFSNode = self->_UVFSNode;
    id v18 = v26;
    id v29 = [v18 mutableBytes];
    int v13 = v27(UVFSNode, v6, v29, v30, &v30);
    if (v13)
    {
      if (os_log_type_enabled((os_log_t)userfs_log_default, OS_LOG_TYPE_ERROR)) {
        sub_100026A40();
      }
    }
    else
    {
      *a4 = v18;
    }
    goto LABEL_22;
  }
  if (v24 != 45)
  {
    if (os_log_type_enabled((os_log_t)userfs_log_default, OS_LOG_TYPE_ERROR)) {
      sub_1000269C8();
    }
    return 5;
  }
  return v13;
}

- (int)getAttribute:(id *)a3
{
  *a3 = 0;
  FSOps = self->FSOps;
  if (!FSOps || !FSOps->var10) {
    return 45;
  }
  if (!self->_UVFSNode) {
    return 22;
  }
  uint64_t v6 = +[NSMutableData dataWithLength:184];
  id v7 = v6;
  if (v6)
  {
    var10 = (uint64_t (*)(void *, id))self->FSOps->var10;
    UVFSNode = self->_UVFSNode;
    id v10 = v6;
    int v11 = var10(UVFSNode, [v10 mutableBytes]);
    if (!v11) {
      *a3 = v10;
    }
  }
  else
  {
    int v11 = 12;
  }

  return v11;
}

- (int)decmpfsFetchCompressedHeader:(id *)a3
{
  char v13 = 0;
  id v5 = [(LiveFSXattrCache *)self->_lfn_xattrCache dataForName:@"com.apple.decmpfs" wasNegative:&v13];
  if (v5
    || (id v12 = 0,
        int v10 = [(liveFSNode *)self getXAttr:@"com.apple.decmpfs" withBuffer:&v12],
        id v5 = v12,
        !v10))
  {
    uint64_t v6 = +[NSMutableData dataWithLength:](NSMutableData, "dataWithLength:", (char *)[v5 length] + 4);
    if (!v6)
    {
      if (os_log_type_enabled((os_log_t)userfs_log_default, OS_LOG_TYPE_ERROR)) {
        sub_100026AB8();
      }
      id v7 = 0;
      int v10 = 12;
      goto LABEL_21;
    }
    id v7 = v6;
    *a3 = ($8EF4127CF77ECA3DDB612FCF233DC3A8 *)[v7 mutableBytes];
    *(_DWORD *)*a3 = [v5 length];
    id v5 = v5;
    uint64_t v8 = [v5 bytes];
    id v9 = *a3;
    *(void *)((char *)v9 + 4) = *v8;
    *(void *)((char *)v9 + 12) = v8[1];
    memcpy((char *)*a3 + 20, v8 + 2, (size_t)[v5 length] - 16);
    if (*((_DWORD *)*a3 + 1) == 1668116582)
    {
      if (*((_DWORD *)*a3 + 2) < 0xFFu || -[liveFSNode decmpfsTypeIsDataless:](self, "decmpfsTypeIsDataless:"))
      {
        int v10 = 0;
        goto LABEL_22;
      }
      if (os_log_type_enabled((os_log_t)userfs_log_default, OS_LOG_TYPE_ERROR)) {
        sub_100026AEC();
      }
    }
    else if (os_log_type_enabled((os_log_t)userfs_log_default, OS_LOG_TYPE_ERROR))
    {
      sub_100026B5C();
    }
    int v10 = 22;
LABEL_20:
    if (!*a3) {
      goto LABEL_22;
    }
LABEL_21:
    *a3 = 0;
    goto LABEL_22;
  }
  if (os_log_type_enabled((os_log_t)userfs_log_default, OS_LOG_TYPE_ERROR)) {
    sub_100026BEC();
  }
  id v7 = 0;
  if (v10 != 34) {
    goto LABEL_20;
  }
LABEL_22:

  return v10;
}

- (BOOL)decmpfsTypeIsDataless:(unsigned int)a3
{
  return a3 + 0x7FFFFFFF < 2;
}

- (unsigned)decmpfsGetDirectoryEntries:(id *)a3
{
  if (a3->var1 == 1668116582 && a3->var2 == -2147483646) {
    return *(void *)(&a3->var2 + 1) >> 40;
  }
  else {
    return *(void *)(&a3->var2 + 1);
  }
}

- (BOOL)verifyFileIsFSCompressed:(int *)a3
{
  uint64_t v10 = 0;
  if ((*((unsigned char *)[(NSMutableData *)self->attrsData mutableBytes] + 44) & 0x20) == 0) {
    goto LABEL_2;
  }
  int v6 = [(liveFSNode *)self decmpfsFetchCompressedHeader:&v10];
  *a3 = v6;
  if (v6)
  {
    BOOL v5 = os_log_type_enabled((os_log_t)userfs_log_default, OS_LOG_TYPE_ERROR);
    if (!v5) {
      goto LABEL_16;
    }
    sub_100026CE4();
    goto LABEL_2;
  }
  if (*((_DWORD *)[(NSMutableData *)self->attrsData mutableBytes] + 6) != 1
    && ![(liveFSNode *)self decmpfsTypeIsDataless:*(unsigned int *)(v10 + 8)]
    && *((_DWORD *)[(NSMutableData *)self->attrsData mutableBytes] + 6) == 2)
  {
LABEL_2:
    LOBYTE(v5) = 0;
    goto LABEL_16;
  }
  id v7 = userfs_log_default;
  if (os_log_type_enabled((os_log_t)userfs_log_default, OS_LOG_TYPE_DEBUG)) {
    sub_100026C54((uint64_t)&v10, v7);
  }
  if (v10)
  {
    Func = (uint64_t (*)(uint64_t))decmpGetFunc(*(_DWORD *)(v10 + 8), 2);
    if (Func) {
      Func = (uint64_t (*)(uint64_t))Func(v10);
    }
    self->deCmpFlags = (unint64_t)Func;
  }
  LOBYTE(v5) = 1;
LABEL_16:
  self->isFSCompressed = v5;
  return v5;
}

- (void)getCompressionFileInfo
{
  FSOps = self->FSOps;
  if (FSOps)
  {
    var34 = (uint64_t (*)(void *, void **))FSOps->var34;
    if (var34)
    {
      id v9 = 0;
      int v5 = var34(self->_UVFSNode, &v9);
      int v10 = v5;
      if (v5) {
        BOOL v6 = 1;
      }
      else {
        BOOL v6 = v9 == 0;
      }
      if (v6)
      {
LABEL_21:
        if (!v5) {
          return;
        }
        goto LABEL_22;
      }
      self->streamNode = v9;
      id v7 = +[NSMutableData dataWithLength:184];
      if (v7)
      {
        if ([(liveFSNode *)self verifyFileIsFSCompressed:&v10])
        {
LABEL_20:

          int v5 = v10;
          goto LABEL_21;
        }
        if (v10)
        {
          if (os_log_type_enabled((os_log_t)userfs_log_default, OS_LOG_TYPE_ERROR)) {
            sub_100026DEC();
          }
          goto LABEL_20;
        }
        if (os_log_type_enabled((os_log_t)userfs_log_default, OS_LOG_TYPE_DEBUG)) {
          sub_100026DB8();
        }
        int v8 = 22;
      }
      else
      {
        if (os_log_type_enabled((os_log_t)userfs_log_default, OS_LOG_TYPE_ERROR)) {
          sub_100026D84();
        }
        int v8 = 12;
      }
      int v10 = v8;
      goto LABEL_20;
    }
  }
  int v10 = 45;
LABEL_22:
  if (os_log_type_enabled((os_log_t)userfs_log_default, OS_LOG_TYPE_ERROR)) {
    sub_100026D50();
  }
  self->streamNode = 0;
  self->isFSCompressed = 0;
}

- (void)setCachedAttrs:(id)a3
{
  id v5 = a3;
  if (v5)
  {
    id v9 = v5;
    if (![(userFSVolume *)self->volume supportsPersistentObjectIdentifier]
      && [(liveFSNode *)self lfn_fileid] >= 3)
    {
      id v6 = v9;
      id v7 = [v6 mutableBytes];
      v7[1] |= 0x100uLL;
      unint64_t v8 = [(liveFSNode *)self lfn_fileid];
      *((void *)[v6 mutableBytes] + 8) = v8;
    }
    objc_storeStrong((id *)&self->attrsData, a3);
    id v5 = v9;
  }
}

- (int)getDeviceFD
{
  volume = self->volume;
  if (!volume) {
    return -1;
  }
  uint64_t v3 = [(userFSVolume *)volume volumeRawDevice];
  int v4 = [v3 deviceFD];

  return v4;
}

- (NSData)getAttrData
{
  v2 = self;
  objc_sync_enter(v2);
  if (v2->attrsData)
  {
    uint64_t v3 = (id)userfs_log_default;
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG)) {
      sub_100026F0C((uint64_t)[(NSMutableData *)v2->attrsData bytes], buf, v3);
    }
  }
  else
  {
    id v9 = 0;
    unsigned int v4 = [(liveFSNode *)v2 getAttribute:&v9];
    uint64_t v3 = v9;
    if (v4)
    {
      if (os_log_type_enabled((os_log_t)userfs_log_default, OS_LOG_TYPE_ERROR)) {
        sub_100026EA4();
      }
    }
    else
    {
      id v5 = [(liveFSNode *)v2 lfn_seqno];
      [(liveFSNode *)v2 setLfn_seqno:v5 + 1];
      uint64_t v3 = v3;
      *((void *)[v3 mutableBytes] + 2) = v5;
      [(liveFSNode *)v2 setCachedAttrs:v3];
      id v6 = (id)userfs_log_default;
      if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG)) {
        sub_100026E58((uint64_t)[(NSMutableData *)v2->attrsData bytes], buf, v6);
      }
    }
  }

  id v7 = +[NSData dataWithData:v2->attrsData];
  objc_sync_exit(v2);

  return (NSData *)v7;
}

- (int)setAttributeTo:(id)a3 withResultingAttribute:(id *)a4
{
  id v6 = a3;
  uint64_t v43 = 0;
  long long v41 = 0u;
  long long v42 = 0u;
  long long v39 = 0u;
  long long v40 = 0u;
  long long v37 = 0u;
  long long v38 = 0u;
  long long v35 = 0u;
  long long v36 = 0u;
  long long v33 = 0u;
  long long v34 = 0u;
  long long v32 = 0u;
  +[NSMutableData dataWithData:](NSMutableData, "dataWithData:", v6, 0);
  id v7 = objc_claimAutoreleasedReturnValue();
  unint64_t v8 = [v7 mutableBytes];

  *a4 = 0;
  FSOps = self->FSOps;
  if (!FSOps || !FSOps->var11)
  {
    int v10 = 45;
    goto LABEL_8;
  }
  if (self->isFSCompressed && (v8[8] & 0x40) != 0)
  {
    int v10 = 1;
    goto LABEL_8;
  }
  if ([(userFSVolume *)self->volume readOnly])
  {
    int v10 = 30;
    goto LABEL_8;
  }
  if (!self->_UVFSNode)
  {
LABEL_36:
    int v10 = 22;
    goto LABEL_8;
  }
  uint64_t v12 = *((void *)v8 + 1);
  if (v12)
  {
    if ((v12 & 0x20) != 0)
    {
      id v20 = [v6 mutableCopy];
      id v21 = [v20 mutableBytes];

      if (!v21
        || (int v24 = v21[11],
            v22 = v21 + 11,
            int v23 = v24,
            [(liveFSNode *)self getAttrData],
            id v25 = objc_claimAutoreleasedReturnValue(),
            id v26 = [v25 bytes],
            v25,
            !v26))
      {
        int v10 = 12;
        goto LABEL_8;
      }
      if ((v26[8] & 0x20) == 0 || ((*v22 ^ *((_DWORD *)v26 + 11)) & 0x20) != 0)
      {
        if (os_log_type_enabled((os_log_t)userfs_log_default, OS_LOG_TYPE_DEBUG)) {
          sub_100027084();
        }
        goto LABEL_36;
      }
      int v27 = *v22 & 0x3FFFFFFF;
      int *v22 = v27;
      if (v23 != v27)
      {
        v28 = userfs_log_default;
        if (os_log_type_enabled((os_log_t)userfs_log_default, OS_LOG_TYPE_DEBUG)) {
          sub_1000270B8(v22, v23, v28);
        }
      }
    }
    var11 = (uint64_t (*)(void *, id, long long *))self->FSOps->var11;
    UVFSNode = self->_UVFSNode;
    id v15 = v6;
    int v10 = var11(UVFSNode, [v15 bytes], &v32);
    if (!v10 && *((void *)&v32 + 1))
    {
      *(void *)&long long v36 = [(liveFSNode *)self lfn_fileid];
      unint64_t v16 = [(liveFSNode *)self lfn_seqno];
      [(liveFSNode *)self setLfn_seqno:v16 + 1];
      *(void *)&long long v33 = v16;
      v17 = +[NSMutableData dataWithBytes:&v32 length:184];
      if (v17)
      {
        id v18 = self;
        objc_sync_enter(v18);
        objc_storeStrong((id *)&v18->attrsData, v17);
        *a4 = v17;
        objc_sync_exit(v18);

        int v10 = 0;
      }
      else
      {
        int v10 = 12;
      }

      goto LABEL_8;
    }
    id v29 = self;
    objc_sync_enter(v29);
    attrsData = v29->attrsData;
    v29->attrsData = 0;

    objc_sync_exit(v29);
    uint64_t v31 = (void *)userfs_log_default;
    if (!v10 && !*((void *)&v32 + 1))
    {
      if (os_log_type_enabled((os_log_t)userfs_log_default, OS_LOG_TYPE_FAULT)) {
        sub_100026F8C();
      }
      goto LABEL_36;
    }
    if (os_log_type_enabled((os_log_t)userfs_log_default, OS_LOG_TYPE_ERROR)) {
      sub_100026FCC(v15, v31, v10);
    }
  }
  else
  {
    if (os_log_type_enabled((os_log_t)userfs_log_default, OS_LOG_TYPE_DEBUG)) {
      sub_100026F58();
    }
    id v19 = [(liveFSNode *)self getAttrData];
    *a4 = v19;
    if (v19) {
      int v10 = 0;
    }
    else {
      int v10 = 12;
    }
  }
LABEL_8:

  return v10;
}

- (int)lookup:(id)a3 withResultingNode:(id *)a4
{
  id v6 = a3;
  id v7 = [(userFSVolume *)self->volume lookupWithParent:self andName:v6];
  *a4 = v7;
  if (v7)
  {
LABEL_2:
    int v8 = 0;
    goto LABEL_3;
  }
  uint64_t v26 = 0;
  id v10 = v6;
  id v11 = [v10 UTF8String];
  if (v11)
  {
    FSOps = self->FSOps;
    if (!FSOps || (var12 = (uint64_t (*)(void *, id, uint64_t *))FSOps->var12) == 0)
    {
      int v8 = 45;
      goto LABEL_3;
    }
    int v8 = var12(self->_UVFSNode, v11, &v26);
    if (!v8)
    {
      if ([(userFSVolume *)self->volume supportsHardLinks]
        && (+[NSMutableData dataWithLength:184],
            (id v14 = objc_claimAutoreleasedReturnValue()) != 0))
      {
        id v15 = v14;
        unint64_t v16 = [v15 bytes];
        if (v16)
        {
          v17 = v16;
          if (!((unsigned int (*)(uint64_t, void *))self->FSOps->var10)(v26, v16))
          {
            uint64_t v18 = v17[1];
            if ((v18 & 1) != 0
              && (v18 & 4) != 0
              && *((_DWORD *)v17 + 6) != 2
              && *((_DWORD *)v17 + 8) >= 2u
              && [(userFSVolume *)self->volume getNodeFromFileID:v17[8] outNode:a4])
            {
              id v19 = userfs_log_default;
              if (os_log_type_enabled((os_log_t)userfs_log_default, OS_LOG_TYPE_DEBUG))
              {
                uint64_t v24 = v17[8];
                id v25 = *a4;
                *(_DWORD *)buf = 134218754;
                v28 = self;
                __int16 v29 = 2048;
                uint64_t v30 = v24;
                __int16 v31 = 2112;
                id v32 = v10;
                __int16 v33 = 2048;
                id v34 = v25;
                _os_log_debug_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_DEBUG, "LFN[%p]: inode [%llu] of file %@ already exists. using UVFSFileNode: %p", buf, 0x2Au);
              }
              [(userFSVolume *)self->volume insertIntoNameCache:*a4 withParent:self withName:v10];
              id v20 = *a4;
              id v21 = (char *)objc_msgSend(*a4, "lfn_seqno");
              objc_msgSend(v20, "setLfn_seqno:", v21 + 1);
              v17[2] = v21;
              [*a4 setCachedAttrs:v15];
              [*a4 updateName:v10 andParent:self];
              ((void (*)(uint64_t, void))self->FSOps->var13)(v26, 0);

              goto LABEL_2;
            }
          }
        }
      }
      else
      {
        id v15 = 0;
      }
      v22 = [liveFSNode alloc];
      int v23 = [(liveFSNode *)v22 initWithVolume:self->volume andParent:self andName:v10 andUVFSNode:v26];
      *a4 = v23;
      if (v23)
      {
        int v8 = 0;
      }
      else
      {
        ((void (*)(uint64_t, void))self->FSOps->var13)(v26, 0);
        int v8 = 12;
      }
    }
  }
  else
  {
    if (os_log_type_enabled((os_log_t)userfs_log_default, OS_LOG_TYPE_ERROR)) {
      sub_100027144();
    }
    int v8 = 22;
  }
LABEL_3:

  return v8;
}

- (int)readSymLinkDataInto:(void *)a3 ofSize:(int)a4 withSymLinkDataSize:(unint64_t *)a5 andWithSymLinkAttrData:(id *)a6
{
  *a6 = 0;
  FSOps = self->FSOps;
  if (!FSOps) {
    return 45;
  }
  uint64_t v26 = 0;
  long long v24 = 0u;
  long long v25 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v15 = 0u;
  var14 = (uint64_t (*)(void *, void *, void, unint64_t *, long long *))FSOps->var14;
  if (!var14) {
    return 45;
  }
  UVFSNode = self->_UVFSNode;
  if (!UVFSNode) {
    return 22;
  }
  int v11 = var14(UVFSNode, a3, a4, a5, &v15);
  if (!v11)
  {
    *(void *)&long long v19 = [(liveFSNode *)self lfn_fileid];
    uint64_t v12 = +[NSMutableData dataWithBytes:&v15 length:184];
    if (v12)
    {
      char v13 = self;
      objc_sync_enter(v13);
      objc_storeStrong((id *)&v13->attrsData, v12);
      *a6 = v12;
      objc_sync_exit(v13);

      int v11 = 0;
    }
    else
    {
      int v11 = 12;
    }
  }
  return v11;
}

- (int)fetchUncompressedData:(id *)a3 offset:(unint64_t)a4 length:(unint64_t)a5 vectorSize:(int)a6 vector:(id *)a7 withLengthOut:(unint64_t *)a8
{
  *a8 = 0;
  unint64_t v8 = *(void *)(&a3->var2 + 1);
  if (v8 <= a4) {
    return 0;
  }
  unint64_t v10 = a5 + a4 <= v8 ? a5 : v8 - a4;
  if (!v10) {
    return 0;
  }
  uint64_t v13 = *(void *)&a6;
  Func = (uint64_t (*)(void *, _UVFSFSOps *, $8FA35A1492004E09C92A828F214C9B53 *, unint64_t, unint64_t, uint64_t, $0C2EF9BCB429C3135CF0227F394ACC8C *, unint64_t *))decmpGetFunc(a3->var2, 1);
  if (Func)
  {
    int v17 = Func(self->streamNode, self->FSOps, a3, a4, v10, v13, a7, a8);
    if (v17 && os_log_type_enabled((os_log_t)userfs_log_default, OS_LOG_TYPE_ERROR)) {
      sub_1000271EC();
    }
  }
  else
  {
    if (os_log_type_enabled((os_log_t)userfs_log_default, OS_LOG_TYPE_ERROR)) {
      sub_1000271B8();
    }
    return 45;
  }
  return v17;
}

- (int)readUncompressedData:(unint64_t)a3 intoDataBuffer:(id)a4 withLengthOut:(unint64_t *)a5
{
  id v8 = a4;
  unint64_t v30 = 0;
  unint64_t v31 = a3;
  id v9 = [v8 length];
  uint64_t v28 = 0;
  uint64_t v29 = (uint64_t)v9;
  *a5 = 0;
  unsigned int v10 = [(liveFSNode *)self decmpfsFetchCompressedHeader:&v28];
  if (v10)
  {
    int v11 = v10;
    if (os_log_type_enabled((os_log_t)userfs_log_default, OS_LOG_TYPE_ERROR)) {
      sub_100027380();
    }
    goto LABEL_35;
  }
  if (*(void *)(v28 + 12) <= a3)
  {
    id v14 = userfs_log_default;
    if (os_log_type_enabled((os_log_t)userfs_log_default, OS_LOG_TYPE_DEBUG)) {
      sub_1000272F0((uint64_t)&v28, a3, v14);
    }
    goto LABEL_9;
  }
  Func = (void (*)(uint64_t, unint64_t *, uint64_t *))decmpGetFunc(*(_DWORD *)(v28 + 8), 0);
  if (Func)
  {
    Func(v28, &v31, &v29);
    unint64_t v13 = v31;
    id v9 = (id)v29;
  }
  else
  {
    unint64_t v13 = a3;
  }
  unint64_t v15 = a3 - v13;
  BOOL v16 = a3 == v13;
  unint64_t v17 = *(void *)(v28 + 12);
  if ((unint64_t)v9 + v13 > v17) {
    uint64_t v29 = v17 - v13;
  }
  if (!decmpGetFunc(*(_DWORD *)(v28 + 8), 1))
  {
    if (os_log_type_enabled((os_log_t)userfs_log_default, OS_LOG_TYPE_ERROR)) {
      sub_100027254();
    }
    int v11 = 45;
    goto LABEL_35;
  }
  uint64_t v18 = v29;
  if (v29 < 1)
  {
LABEL_9:
    int v11 = 0;
    goto LABEL_35;
  }
  unint64_t v19 = 0;
  while (1)
  {
    v31 += v19;
    uint64_t v20 = (unint64_t)v18 >= 0x10000 ? 0x10000 : v18;
    if (v16)
    {
      long long v21 = (NSMutableData *)((char *)[v8 mutableBytes] + *a5);
    }
    else
    {
      long long v21 = +[NSMutableData dataWithLength:v20];
      if (!v21)
      {
        *a5 = 0;
        int v11 = 12;
        goto LABEL_35;
      }
    }
    v27[0] = v21;
    v27[1] = v20;
    unsigned int v22 = [(liveFSNode *)self fetchUncompressedData:v28 offset:v31 length:v18 vectorSize:1 vector:v27 withLengthOut:&v30];
    if (v22) {
      break;
    }
    if (v16)
    {
      unint64_t v23 = v30;
      unint64_t v24 = *a5;
      unint64_t v19 = v30;
    }
    else
    {
      id v25 = [v8 mutableBytes];
      memcpy(v25, (char *)v21 + v15, v30 - v15);
      unint64_t v19 = v30;
      unint64_t v24 = v30 - v15;
      unint64_t v23 = *a5;
    }
    int v11 = 0;
    *a5 = v24 + v23;
    v18 -= v19;
    BOOL v16 = 1;
    if (v18 <= 0) {
      goto LABEL_35;
    }
  }
  int v11 = v22;
  if (os_log_type_enabled((os_log_t)userfs_log_default, OS_LOG_TYPE_ERROR)) {
    sub_100027288();
  }
  *a5 = 0;
LABEL_35:

  return v11;
}

- (int)readData:(unint64_t)a3 intoDataBuffer:(id)a4 withLengthOut:(unint64_t *)a5
{
  id v8 = a4;
  id v9 = v8;
  FSOps = self->FSOps;
  if (FSOps && !self->isFSCompressed)
  {
    if (FSOps->var15) {
      goto LABEL_4;
    }
LABEL_13:
    int v13 = 45;
    goto LABEL_16;
  }
  if (!FSOps->var36) {
    goto LABEL_13;
  }
LABEL_4:
  if (a5 && v8 && (UVFSNode = self->_UVFSNode) != 0)
  {
    if (self->isFSCompressed) {
      unsigned int v12 = [(liveFSNode *)self readUncompressedData:a3 intoDataBuffer:v8 withLengthOut:a5];
    }
    else {
      unsigned int v12 = ((uint64_t (*)(void *, unint64_t, id, id, unint64_t *))FSOps->var15)(UVFSNode, a3, [v8 length], objc_msgSend(v8, "mutableBytes"), a5);
    }
    int v13 = v12;
  }
  else
  {
    if (a5) {
      *a5 = 0;
    }
    int v13 = 22;
  }
LABEL_16:

  return v13;
}

- (int)writeData:(unint64_t)a3 fromBuffer:(id)a4 withLengthOut:(unint64_t *)a5
{
  id v8 = a4;
  FSOps = self->FSOps;
  if (FSOps && FSOps->var16)
  {
    if (self->isFSCompressed)
    {
      int v10 = 1;
    }
    else if ([(userFSVolume *)self->volume readOnly])
    {
      int v10 = 30;
    }
    else if (a5 && v8 && (UVFSNode = self->_UVFSNode) != 0)
    {
      int v10 = ((uint64_t (*)(void *, unint64_t, id, id, unint64_t *))self->FSOps->var16)(UVFSNode, a3, [v8 length], objc_msgSend(v8, "bytes"), a5);
      int v13 = self;
      objc_sync_enter(v13);
      attrsData = v13->attrsData;
      v13->attrsData = 0;

      objc_sync_exit(v13);
    }
    else
    {
      if (a5) {
        *a5 = 0;
      }
      int v10 = 22;
    }
  }
  else
  {
    int v10 = 45;
  }

  return v10;
}

- (int)createDirEntry:(id)a3 withAttrs:(id)a4 withData:(id)a5 withResultingNode:(id *)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  *a6 = 0;
  if (!self->FSOps) {
    goto LABEL_20;
  }
  if ([(userFSVolume *)self->volume readOnly])
  {
    int v13 = 30;
    goto LABEL_21;
  }
  if (!self->_UVFSNode) {
    goto LABEL_12;
  }
  uint64_t v28 = 0;
  id v14 = v11;
  unint64_t v15 = [v14 mutableBytes];
  uint64_t v16 = v15[1];
  if ((v16 & 2) == 0)
  {
    v15[1] = v16 | 2;
    *((_DWORD *)v15 + 7) |= 0x1C0u;
  }
  int v17 = *((_DWORD *)v15 + 6);
  switch(v17)
  {
    case 3:
      var19 = (uint64_t (*)(void *, id, id, void *, uint64_t *))self->FSOps->var19;
      if (!var19) {
        goto LABEL_20;
      }
      int v19 = var19(self->_UVFSNode, [v10 UTF8String], objc_msgSend(objc_retainAutorelease(v12), "UTF8String"), v15, &v28);
      break;
    case 2:
      var18 = (uint64_t (*)(void *, id, void *, uint64_t *))self->FSOps->var18;
      if (!var18) {
        goto LABEL_20;
      }
      int v19 = var18(self->_UVFSNode, [v10 UTF8String], v15, &v28);
      break;
    case 1:
      var17 = (uint64_t (*)(void *, id, id, uint64_t *))self->FSOps->var17;
      if (var17)
      {
        int v19 = var17(self->_UVFSNode, [v10 UTF8String], objc_msgSend(objc_retainAutorelease(v14), "bytes"), &v28);
        break;
      }
LABEL_20:
      int v13 = 45;
      goto LABEL_21;
    default:
LABEL_12:
      int v13 = 22;
      goto LABEL_21;
  }
  int v13 = v19;
  if (!v19)
  {
    unsigned int v22 = self;
    objc_sync_enter(v22);
    attrsData = v22->attrsData;
    v22->attrsData = 0;

    objc_sync_exit(v22);
    unint64_t v24 = [liveFSNode alloc];
    id v25 = [(liveFSNode *)v24 initWithVolume:self->volume andParent:v22 andName:v10 andUVFSNode:v28];
    uint64_t v26 = v25;
    if (v25)
    {
      int v13 = 0;
      *a6 = v25;
    }
    else
    {
      ((void (*)(uint64_t, void))self->FSOps->var13)(v28, 0);
      int v13 = 12;
    }
  }
LABEL_21:

  return v13;
}

- (int)remove:(int)a3 named:(id)a4 node:(id)a5 usingFlags:(int)a6
{
  id v9 = a4;
  id v10 = a5;
  if (!self->FSOps) {
    goto LABEL_8;
  }
  if ([(userFSVolume *)self->volume readOnly])
  {
    int v11 = 30;
    goto LABEL_16;
  }
  UVFSNode = self->_UVFSNode;
  if (!UVFSNode) {
    goto LABEL_9;
  }
  if (a3 == 2)
  {
    var21 = (uint64_t (*)(void *, id, uint64_t))self->FSOps->var21;
    if (!var21) {
      goto LABEL_8;
    }
    goto LABEL_11;
  }
  if (a3 != 1)
  {
LABEL_9:
    int v11 = 22;
    goto LABEL_16;
  }
  var21 = (uint64_t (*)(void *, id, uint64_t))self->FSOps->var20;
  if (!var21)
  {
LABEL_8:
    int v11 = 45;
    goto LABEL_16;
  }
LABEL_11:
  id v14 = [v9 UTF8String];
  if (v10) {
    uint64_t v15 = v10[10];
  }
  else {
    uint64_t v15 = 0;
  }
  int v11 = var21(UVFSNode, v14, v15);
  if (!v11)
  {
    uint64_t v16 = self;
    objc_sync_enter(v16);
    attrsData = v16->attrsData;
    v16->attrsData = 0;

    objc_sync_exit(v16);
  }
LABEL_16:

  return v11;
}

- (int)rename:(id)a3 named:(id)a4 withToDirNode:(id)a5 withToNode:(id)a6 withToName:(id)a7 andFlags:(unsigned int)a8
{
  uint64_t v8 = *(void *)&a8;
  id v14 = a3;
  id v15 = a4;
  uint64_t v16 = a5;
  int v17 = a6;
  id v18 = a7;
  FSOps = self->FSOps;
  if (FSOps && FSOps->var22)
  {
    if ([(userFSVolume *)self->volume readOnly])
    {
      int v20 = 30;
    }
    else
    {
      UVFSNode = self->_UVFSNode;
      if (UVFSNode)
      {
        if (v17) {
          uint64_t v29 = v17[10];
        }
        else {
          uint64_t v29 = 0;
        }
        int v20 = ((uint64_t (*)(void *, void, id, void, uint64_t, id, uint64_t))self->FSOps->var22)(UVFSNode, v14[10], [v15 UTF8String], v16[10], v29, objc_msgSend(objc_retainAutorelease(v18), "UTF8String"), v8);
        unint64_t v23 = v14;
        objc_sync_enter(v23);
        unint64_t v24 = (void *)v23[3];
        v23[3] = 0;

        objc_sync_exit(v23);
        id v25 = self;
        objc_sync_enter(v25);
        attrsData = v25->attrsData;
        v25->attrsData = 0;

        objc_sync_exit(v25);
        int v27 = v16;
        objc_sync_enter(v27);
        uint64_t v28 = (void *)v27[3];
        v27[3] = 0;

        objc_sync_exit(v27);
      }
      else
      {
        int v20 = 22;
      }
    }
  }
  else
  {
    int v20 = 45;
  }

  return v20;
}

- (int)link:(id)a3 withName:(id)a4 fileAttrOut:(id *)a5 dirAttrOut:(id *)a6
{
  id v10 = a3;
  id v11 = a4;
  *a5 = 0;
  *a6 = 0;
  FSOps = self->FSOps;
  if (FSOps && FSOps->var25)
  {
    if ([(userFSVolume *)self->volume readOnly])
    {
      int v13 = 30;
    }
    else if (self->_UVFSNode)
    {
      id v15 = +[NSMutableData dataWithLength:184];
      uint64_t v16 = +[NSMutableData dataWithLength:184];
      int v13 = 12;
      if (v15 && v16)
      {
        UVFSNode = self->_UVFSNode;
        uint64_t v35 = v10[10];
        var25 = (uint64_t (*)(void *, uint64_t, id, id, id))self->FSOps->var25;
        id v18 = v16;
        id v19 = [v11 UTF8String];
        long long v38 = v15;
        id v20 = v15;
        id v21 = [v20 mutableBytes];
        long long v37 = v18;
        id v22 = v18;
        int v13 = var25(UVFSNode, v35, v19, v21, [v22 mutableBytes]);
        if (v13)
        {
          unint64_t v23 = v10;
          objc_sync_enter(v23);
          unint64_t v24 = (void *)v23[3];
          v23[3] = 0;
        }
        else
        {
          unint64_t v25 = [(liveFSNode *)self lfn_seqno];
          [(liveFSNode *)self setLfn_seqno:v25 + 1];
          uint64_t v26 = v22;
          id v27 = v20;
          *((void *)[v27 mutableBytes] + 2) = v25;
          uint64_t v28 = (char *)objc_msgSend(v10, "lfn_seqno");
          objc_msgSend(v10, "setLfn_seqno:", v28 + 1);
          id v29 = v26;
          *((void *)[v29 mutableBytes] + 2) = v28;
          *a5 = v27;
          id v30 = v29;
          *a6 = v30;
          unint64_t v31 = v10;
          objc_sync_enter(v31);
          id v32 = v30;
          unint64_t v24 = (void *)v31[3];
          v31[3] = v32;
        }

        objc_sync_exit(v10);
        __int16 v33 = self;
        objc_sync_enter(v33);
        attrsData = v33->attrsData;
        v33->attrsData = 0;

        objc_sync_exit(v33);
        uint64_t v16 = v37;
        id v15 = v38;
      }
    }
    else
    {
      int v13 = 22;
    }
  }
  else
  {
    int v13 = 45;
  }

  return v13;
}

- (int)readDirectoryEntries:(id)a3 withCookie:(unint64_t)a4 withLengthOut:(int64_t *)a5 andWithVerifier:(unint64_t *)a6
{
  id v10 = a3;
  id v11 = v10;
  FSOps = self->FSOps;
  if (FSOps
    && (var23 = (uint64_t (*)(void *, id, id, unint64_t, int64_t *, unint64_t *))FSOps->var23) != 0)
  {
    UVFSNode = self->_UVFSNode;
    if (UVFSNode)
    {
      id v15 = v10;
      int v16 = var23(UVFSNode, [v15 mutableBytes], objc_msgSend(v15, "length"), a4, a5, a6);
    }
    else
    {
      int v16 = 22;
    }
  }
  else
  {
    int v16 = 45;
  }

  return v16;
}

- (int)readDirectoryEntriesWithAttrs:(id)a3 withCookie:(unint64_t)a4 withLengthOut:(int64_t *)a5 andWithVerifier:(unint64_t *)a6
{
  id v10 = a3;
  id v11 = v10;
  FSOps = self->FSOps;
  if (FSOps
    && (var24 = (uint64_t (*)(void *, id, id, unint64_t, int64_t *, unint64_t *))FSOps->var24) != 0)
  {
    UVFSNode = self->_UVFSNode;
    if (UVFSNode)
    {
      id v15 = v10;
      int v16 = var24(UVFSNode, [v15 mutableBytes], objc_msgSend(v15, "length"), a4, a5, a6);
    }
    else
    {
      int v16 = 22;
    }
  }
  else
  {
    int v16 = 45;
  }

  return v16;
}

- (int)statFS:(id *)a3
{
  *a3 = 0;
  FSOps = self->FSOps;
  if (!FSOps || !FSOps->var8) {
    return 45;
  }
  if (!self->_UVFSNode) {
    return 22;
  }
  long long v20 = 0u;
  long long v21 = 0u;
  id v18 = 0;
  int v6 = [(liveFSNode *)self getFileSystemAttribute:@"_N_f_bsize" andResult:&v18];
  id v7 = v18;
  if (!v6)
  {
    id v8 = v7;
    uint64_t v9 = *(void *)[v8 bytes];

    id v17 = 0;
    int v6 = [(liveFSNode *)self getFileSystemAttribute:@"_N_f_blocks" andResult:&v17];
    id v7 = v17;
    if (!v6)
    {
      id v10 = v7;
      uint64_t v19 = *(void *)[v10 bytes] * v9;

      id v16 = 0;
      int v6 = [(liveFSNode *)self getFileSystemAttribute:@"_N_f_bavail" andResult:&v16];
      id v7 = v16;
      if (!v6)
      {
        id v11 = v7;
        *(void *)&long long v20 = *(void *)[v11 bytes] * v9;

        id v15 = 0;
        int v6 = [(liveFSNode *)self getFileSystemAttribute:@"_N_f_bfree" andResult:&v15];
        id v7 = v15;
        if (!v6)
        {
          id v12 = v7;
          *((void *)&v20 + 1) = *(void *)[v12 bytes] * v9;

          long long v21 = xmmword_100037100;
          id v13 = +[NSData dataWithBytes:&v19 length:40];
          id v7 = 0;
          *a3 = v13;
          if (v13) {
            int v6 = 0;
          }
          else {
            int v6 = 12;
          }
        }
      }
    }
  }

  return v6;
}

- (int)pathConf:(id *)a3
{
  *a3 = 0;
  FSOps = self->FSOps;
  if (!FSOps || !FSOps->var8) {
    return 45;
  }
  uint64_t v20 = 0;
  uint64_t v21 = 0;
  id v19 = 0;
  int v6 = [(liveFSNode *)self getFileSystemAttribute:@"_N_PC_LINK_MAX" andResult:&v19];
  id v7 = v19;
  if (!v6)
  {
    id v8 = v7;
    LODWORD(v20) = *(void *)[v8 bytes];

    id v18 = 0;
    int v6 = [(liveFSNode *)self getFileSystemAttribute:@"_N_PC_NAME_MAX" andResult:&v18];
    id v7 = v18;
    if (!v6)
    {
      id v9 = v7;
      HIDWORD(v20) = *(void *)[v9 bytes];

      BYTE4(v21) = 2;
      id v17 = 0;
      int v6 = [(liveFSNode *)self getFileSystemAttribute:@"_N_caps_format" andResult:&v17];
      id v7 = v17;
      if (!v6)
      {
        id v10 = v7;
        int v11 = (*(_DWORD *)[v10 bytes] >> 6) & 4;
        id v12 = v10;
        BYTE4(v21) = (v11 | (*(_DWORD *)[v12 bytes] >> 6) & 8) ^ 6;

        id v16 = 0;
        int v6 = [(liveFSNode *)self getFileSystemAttribute:@"_N_PC_FILESIZEBITS" andResult:&v16];
        id v7 = v16;
        if (!v6)
        {
          id v13 = v7;
          LODWORD(v21) = *(void *)[v13 bytes];

          id v14 = +[NSData dataWithBytes:&v20 length:16];
          id v7 = 0;
          *a3 = v14;
          if (v14) {
            int v6 = 0;
          }
          else {
            int v6 = 12;
          }
        }
      }
    }
  }

  return v6;
}

- (int)reclaim
{
  FSOps = self->FSOps;
  if (!FSOps || !FSOps->var13 || !self->_UVFSNode) {
    return 0;
  }
  if (self->isFSCompressed)
  {
    if (self->streamNode)
    {
      var35 = (uint64_t (*)(void))FSOps->var35;
      if (var35)
      {
        int v5 = var35();
        if (v5)
        {
          int v6 = v5;
          if (os_log_type_enabled((os_log_t)userfs_log_default, OS_LOG_TYPE_ERROR)) {
            sub_1000273E8();
          }
          return v6;
        }
        self->streamNode = 0;
        self->isFSCompressed = 0;
      }
    }
  }
  volume = self->volume;
  if (volume)
  {
    id v9 = [(userFSVolume *)volume volumeRawDevice];
    id v10 = [v9 deviceIsClosed];
  }
  else
  {
    id v10 = 0;
  }
  int result = ((uint64_t (*)(void *, id))self->FSOps->var13)(self->_UVFSNode, v10);
  self->_UVFSNode = 0;
  return result;
}

- (int)getXAttr:(id)a3 withBuffer:(id *)a4
{
  id v6 = a3;
  id v7 = v6;
  *a4 = 0;
  FSOps = self->FSOps;
  if (FSOps && (id v9 = (uint64_t (*)(void, void, void, void, void))FSOps->var27) != 0)
  {
    UVFSNode = self->_UVFSNode;
    if (UVFSNode)
    {
      uint64_t v21 = 0;
      id v11 = v6;
      int v12 = v9(UVFSNode, [v11 UTF8String], 0, 0, &v21);
      if (v12) {
        BOOL v13 = 1;
      }
      else {
        BOOL v13 = v21 == 0;
      }
      if (!v13)
      {
        uint64_t v14 = +[NSMutableData dataWithLength:](NSMutableData, "dataWithLength:");
        if (v14)
        {
          id v15 = (void *)v14;
          var27 = (uint64_t (*)(void *, id, id, id, uint64_t *))self->FSOps->var27;
          id v17 = self->_UVFSNode;
          id v18 = [v11 UTF8String];
          id v19 = v15;
          int v12 = var27(v17, v18, [v19 mutableBytes], objc_msgSend(v19, "length"), &v21);
          if (!v12) {
            *a4 = v19;
          }
        }
        else
        {
          int v12 = 12;
        }
      }
    }
    else
    {
      int v12 = 22;
    }
  }
  else
  {
    int v12 = 45;
  }

  return v12;
}

- (int)setXAttr:(id)a3 withXAttr:(id)a4 how:(int)a5
{
  uint64_t v5 = *(void *)&a5;
  id v8 = a3;
  id v9 = a4;
  FSOps = self->FSOps;
  if (FSOps && FSOps->var28)
  {
    if (self->isFSCompressed)
    {
      int v11 = 1;
    }
    else if ([(userFSVolume *)self->volume readOnly])
    {
      int v11 = 30;
    }
    else
    {
      int v11 = 22;
      if (v5 <= 3 && self->_UVFSNode)
      {
        if ((unint64_t)[v8 length] <= 0x7F)
        {
          var28 = (uint64_t (*)(void *, id, id, id, uint64_t))self->FSOps->var28;
          UVFSNode = self->_UVFSNode;
          id v15 = [v8 UTF8String];
          id v16 = v9;
          int v11 = var28(UVFSNode, v15, [v16 bytes], objc_msgSend(v16, "length"), v5);
        }
        else
        {
          int v11 = 63;
        }
      }
    }
  }
  else
  {
    int v11 = 45;
  }

  return v11;
}

- (int)listXattr:(id *)a3
{
  *a3 = &__NSArray0__struct;
  FSOps = self->FSOps;
  if (!FSOps) {
    return 45;
  }
  var29 = (uint64_t (*)(void, void, void, void))FSOps->var29;
  if (!var29) {
    return 45;
  }
  UVFSNode = self->_UVFSNode;
  if (!UVFSNode) {
    return 22;
  }
  uint64_t v24 = 0;
  int v8 = var29(UVFSNode, 0, 0, &v24);
  if (v8) {
    BOOL v9 = 1;
  }
  else {
    BOOL v9 = v24 == 0;
  }
  if (!v9)
  {
    id v10 = +[NSMutableData dataWithLength:](NSMutableData, "dataWithLength:");
    int v11 = v10;
    if (v10)
    {
      int v12 = (uint64_t (*)(void *, id, id, uint64_t *))self->FSOps->var29;
      BOOL v13 = self->_UVFSNode;
      id v14 = v10;
      int v8 = v12(v13, [v14 mutableBytes], objc_msgSend(v14, "length"), &v24);
      if (v8) {
        BOOL v15 = 1;
      }
      else {
        BOOL v15 = v24 == 0;
      }
      if (!v15)
      {
        id v16 = (const char *)[v14 bytes];
        uint64_t v17 = v24;
        if (v16[v24 - 1])
        {
          if (os_log_type_enabled((os_log_t)userfs_log_default, OS_LOG_TYPE_ERROR)) {
            sub_100027450();
          }
          int v8 = 5;
        }
        else
        {
          id v19 = v16;
          for (i = +[NSMutableArray array];
          {
            if (*v19)
            {
              uint64_t v21 = +[NSString stringWithUTF8String:v19];
              [i addObject:v21];

              size_t v22 = strlen(v19) + 1;
              v17 -= v22;
            }
            else
            {
              --v17;
              size_t v22 = 1;
            }
          }
          id v23 = i;
          *a3 = v23;

          int v8 = 0;
        }
      }
    }
    else
    {
      int v8 = 12;
    }
  }
  return v8;
}

- (void)createFilterAttr:(_LIFileAttributes *)a3 FromCriteria:(id)a4
{
  id v5 = a4;
  *(_OWORD *)&a3->var0 = 0u;
  *(_OWORD *)&a3->var2 = 0u;
  *(_OWORD *)&a3->var5 = 0u;
  *(_OWORD *)&a3->var9 = 0u;
  *(_OWORD *)&a3->var11 = 0u;
  a3->var13 = 0u;
  a3->var14 = 0u;
  a3->var15 = 0u;
  a3->var16 = 0u;
  a3->var17 = 0u;
  a3->var18 = 0u;
  *(void *)&a3->var19 = 0;
  id v16 = v5;
  id v6 = [v5 objectForKeyedSubscript:LISearchObjTypeReturnAll];

  if (v6)
  {
    unsigned int v7 = 7;
LABEL_7:
    id v10 = v16;
LABEL_8:
    a3->var3 = v7;
    a3->var1 |= 1uLL;
    goto LABEL_9;
  }
  int v8 = [v16 objectForKeyedSubscript:LISearchObjTypeReturnFiles];

  if (v8)
  {
    unsigned int v7 = 1;
    goto LABEL_7;
  }
  BOOL v9 = [v16 objectForKeyedSubscript:LISearchObjTypeReturnDirs];

  if (v9)
  {
    unsigned int v7 = 2;
    goto LABEL_7;
  }
  BOOL v15 = [v16 objectForKeyedSubscript:LISearchObjTypeReturnLinks];

  id v10 = v16;
  if (v15)
  {
    unsigned int v7 = 4;
    goto LABEL_8;
  }
LABEL_9:
  int v11 = [v10 objectForKeyedSubscript:LISearchObjModifiedAfter];

  if (v11)
  {
    int v12 = [v16 objectForKeyedSubscript:LISearchObjModifiedAfter];
    [v12 timeIntervalSince1970];
    a3->var14.tv_sec = (uint64_t)v13;
    [v12 timeIntervalSince1970];
    a3->var14.tv_nsec = (uint64_t)((v14 - (double)a3->var14.tv_sec) * 1000000.0);
    a3->var1 |= 0x800uLL;
  }
}

- (void)createScanDirSearchRequest:(_scandir_matching_request *)a3 withFilter:(_LIFileAttributes *)a4 withCookie:(unint64_t *)a5 withCookieVerifier:(unint64_t *)a6 fromSearchCriteria:(id)a7
{
  id v22 = a7;
  [(liveFSNode *)self createFilterAttr:a4 FromCriteria:v22];
  unint64_t v12 = *a5;
  a3->var2 = a4;
  a3->var3 = v12;
  a3->var4 = *a6;
  double v13 = [v22 objectForKeyedSubscript:LISearchFileNameContains];

  if (v13)
  {
    double v14 = [v22 objectForKeyedSubscript:LISearchFileNameContains];
    a3->var0 = (char **)malloc_type_calloc(8uLL, (size_t)[v14 count] + 1, 0xC61BCDE5uLL);
    if ([v14 count])
    {
      unint64_t v15 = 0;
      do
      {
        id v16 = [v14 objectAtIndexedSubscript:v15];
        a3->var0[v15] = (char *)[v16 UTF8String];

        ++v15;
      }
      while ((unint64_t)[v14 count] > v15);
    }
  }
  uint64_t v17 = [v22 objectForKeyedSubscript:LISearchFileNameEndsWith];

  id v18 = v22;
  if (v17)
  {
    id v19 = [v22 objectForKeyedSubscript:LISearchFileNameEndsWith];
    a3->var1 = (char **)malloc_type_calloc(8uLL, (size_t)[v19 count] + 1, 0x52240963uLL);
    if ([v19 count])
    {
      unint64_t v20 = 0;
      do
      {
        id v21 = [v19 objectAtIndexedSubscript:v20];
        a3->var1[v20] = (char *)[v21 UTF8String];

        ++v20;
      }
      while ((unint64_t)[v19 count] > v20);
    }

    id v18 = v22;
  }
}

- (void)createScanDirReplyRequest:(_scandir_matching_reply *)a3
{
  a3->var1 = (_LIDirEntryAttr *)malloc_type_calloc(0x4C9uLL, 1uLL, 0x9D1B8B0AuLL);
}

- (int)scanDirectoryForMatches:(id)a3 withScanDirCookie:(unint64_t *)a4 withScanDirCookieVerifier:(unint64_t *)a5 withSearchResultType:(int *)a6 withSearchResult:(id *)a7 withSearchResultAttr:(_LIFileAttributes *)a8
{
  id v14 = a3;
  FSOps = self->FSOps;
  if (FSOps && FSOps->var30)
  {
    if (self->_UVFSNode)
    {
      uint64_t v31 = 0;
      uint64_t v32 = 0;
      *(_OWORD *)id v29 = 0u;
      long long v30 = 0u;
      memset(v35, 0, sizeof(v35));
      uint64_t v36 = 0;
      __int16 v33 = 0;
      unint64_t v34 = 0;
      *a7 = 0;
      [(liveFSNode *)self createScanDirSearchRequest:v29 withFilter:v35 withCookie:a4 withCookieVerifier:a5 fromSearchCriteria:v14];
      [(liveFSNode *)self createScanDirReplyRequest:&v32];
      int v16 = ((uint64_t (*)(void *, void **, uint64_t *))self->FSOps->var30)(self->_UVFSNode, v29, &v32);
      if (!v16)
      {
        *a7 = +[NSString stringWithUTF8String:(char *)v33 + *((unsigned __int16 *)v33 + 5)];
        uint64_t v17 = v33;
        unint64_t v18 = v34;
        long long v19 = *((_OWORD *)v33 + 4);
        long long v21 = *((_OWORD *)v33 + 1);
        long long v20 = *((_OWORD *)v33 + 2);
        *(_OWORD *)&a8->var5 = *((_OWORD *)v33 + 3);
        *(_OWORD *)&a8->var9 = v19;
        *(_OWORD *)&a8->var0 = v21;
        *(_OWORD *)&a8->var2 = v20;
        timespec v22 = (timespec)*((_OWORD *)v17 + 8);
        long long v24 = *((_OWORD *)v17 + 5);
        timespec v23 = (timespec)*((_OWORD *)v17 + 6);
        a8->var14 = (timespec)*((_OWORD *)v17 + 7);
        a8->var15 = v22;
        *(_OWORD *)&a8->var11 = v24;
        a8->var13 = v23;
        timespec v26 = (timespec)*((_OWORD *)v17 + 10);
        timespec v25 = (timespec)*((_OWORD *)v17 + 11);
        timespec v27 = (timespec)*((_OWORD *)v17 + 9);
        *(void *)&a8->var19 = *((void *)v17 + 24);
        a8->var17 = v26;
        a8->var18 = v25;
        a8->var16 = v27;
        *a4 = *(void *)v17;
        *a5 = v18;
        *a6 = v32;
      }
      free(v29[0]);
      free(v29[1]);
      free(v33);
    }
    else
    {
      int v16 = 22;
    }
  }
  else
  {
    int v16 = 45;
  }

  return v16;
}

- (int)cloneFileToDirectory:(id)a3 withName:(id)a4 attrs:(id)a5 flags:(unsigned int)a6 andResultingNode:(id *)a7
{
  uint64_t v8 = *(void *)&a6;
  unint64_t v12 = a3;
  id v13 = a4;
  id v14 = a5;
  unint64_t v15 = v14;
  *a7 = 0;
  FSOps = self->FSOps;
  if (FSOps && FSOps->var31)
  {
    if (self->_UVFSNode)
    {
      uint64_t v29 = 0;
      uint64_t v17 = [v14 bytes];
      unint64_t v18 = v17;
      uint64_t v19 = v17[1];
      if ((v19 & 2) == 0)
      {
        v17[1] = v19 | 2;
        *((_DWORD *)v17 + 7) |= 0x1C0u;
      }
      var31 = (uint64_t (*)(void *, uint64_t, id, void *, uint64_t, uint64_t *))self->FSOps->var31;
      UVFSNode = self->_UVFSNode;
      uint64_t v22 = v12[10];
      id v28 = v13;
      int v23 = var31(UVFSNode, v22, [v28 UTF8String], v18, v8, &v29);
      if (!v23)
      {
        long long v24 = [liveFSNode alloc];
        timespec v25 = [(liveFSNode *)v24 initWithVolume:self->volume andParent:v12 andName:v28 andUVFSNode:v29];
        timespec v26 = v25;
        if (v25)
        {
          int v23 = 0;
          *a7 = v25;
        }
        else
        {
          ((void (*)(uint64_t, void))self->FSOps->var13)(v29, 0);
          int v23 = 12;
        }
      }
    }
    else
    {
      int v23 = 22;
    }
  }
  else
  {
    int v23 = 45;
  }

  return v23;
}

- (int)scanVolumeForFileIDs:(const unint64_t *)a3 count:(unsigned int)a4 returningAttributes:(unint64_t)a5 withBlock:(id)a6
{
  uint64_t v7 = *(void *)&a4;
  id v10 = a6;
  FSOps = self->FSOps;
  if (FSOps
    && (var33 = (uint64_t (*)(void *, unint64_t, const unint64_t *, uint64_t, id))FSOps->var33) != 0)
  {
    UVFSNode = self->_UVFSNode;
    if (UVFSNode) {
      int v14 = var33(UVFSNode, a5, a3, v7, v10);
    }
    else {
      int v14 = 22;
    }
  }
  else
  {
    int v14 = 45;
  }

  return v14;
}

- (int)setFileSystemAttributes:(id)a3 toValue:(id)a4 andResult:(id *)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = v9;
  FSOps = self->FSOps;
  if (FSOps && FSOps->var9)
  {
    if (self->_UVFSNode)
    {
      if (a5) {
        *a5 = 0;
      }
      +[NSMutableData dataWithLength:](NSMutableData, "dataWithLength:", [v9 length]);
      id v12 = objc_claimAutoreleasedReturnValue();
      bzero([v12 mutableBytes], (size_t)objc_msgSend(v10, "length"));
      id v13 = (void *)userfs_log_default;
      if (os_log_type_enabled((os_log_t)userfs_log_default, OS_LOG_TYPE_DEBUG))
      {
        id v25 = v8;
        timespec v26 = v13;
        id v31 = [v25 UTF8String];
        id v27 = v10;
        id v28 = [v27 bytes];
        id v29 = [v27 length];
        id v30 = v12;
        *(_DWORD *)buf = 136316162;
        id v33 = v31;
        __int16 v34 = 2048;
        id v35 = v28;
        __int16 v36 = 2048;
        id v37 = v29;
        __int16 v38 = 2048;
        id v39 = [v30 mutableBytes];
        __int16 v40 = 2048;
        id v41 = [v30 length];
        _os_log_debug_impl((void *)&_mh_execute_header, v26, OS_LOG_TYPE_DEBUG, "%s: %p[%lu] %p[%lu]", buf, 0x34u);
      }
      var9 = (uint64_t (*)(void *, id, id, id, id, id))self->FSOps->var9;
      UVFSNode = self->_UVFSNode;
      id v16 = [v8 UTF8String];
      id v17 = v10;
      id v18 = [v17 bytes];
      id v19 = [v17 length];
      id v20 = v12;
      int v21 = var9(UVFSNode, v16, v18, v19, [v20 mutableBytes], objc_msgSend(v20, "length"));
      int v22 = v21;
      if (a5 && !v21)
      {
        id v20 = v20;
        *a5 = v20;
        int v23 = (void *)userfs_log_default;
        if (os_log_type_enabled((os_log_t)userfs_log_default, OS_LOG_TYPE_DEBUG)) {
          sub_100027484(a5, v20, v23);
        }
        int v22 = 0;
      }
    }
    else
    {
      id v20 = 0;
      int v22 = 22;
    }
  }
  else
  {
    id v20 = 0;
    int v22 = 45;
  }

  return v22;
}

- (int)blockmapWithRange:(_NSRange)a3 startIO:(int)a4 flags:(unsigned int)a5 operationID:(unint64_t)a6 extentCount:(unsigned int *)a7 extents:(id)a8
{
  uint64_t v10 = *(void *)&a5;
  NSUInteger length = a3.length;
  NSUInteger location = a3.location;
  id v15 = a8;
  FSOps = self->FSOps;
  if (FSOps && FSOps->var37)
  {
    unsigned __int8 v17 = [(userFSVolume *)self->volume readOnly];
    if (v10 & 0x200) != 0 && (v17)
    {
      int v18 = 30;
    }
    else
    {
      int v18 = 22;
      if (v15)
      {
        if (a7)
        {
          UVFSNode = self->_UVFSNode;
          if (UVFSNode) {
            int v18 = ((uint64_t (*)(void *, NSUInteger, NSUInteger, BOOL, uint64_t, unint64_t, id, unsigned int *))self->FSOps->var37)(UVFSNode, location, length, a4 != 0, v10, a6, [v15 mutableBytes], a7);
          }
        }
      }
    }
  }
  else
  {
    int v18 = 45;
  }

  return v18;
}

- (int)endIOWithRange:(_NSRange)a3 status:(int)a4 flags:(unsigned int)a5 operationID:(unint64_t)a6
{
  FSOps = self->FSOps;
  if (!FSOps) {
    return 45;
  }
  var38 = (uint64_t (*)(void, void, void, void, void, void))FSOps->var38;
  if (!var38) {
    return 45;
  }
  UVFSNode = self->_UVFSNode;
  if (!UVFSNode) {
    return 22;
  }
  int v10 = var38(UVFSNode, a3.location, a3.length, *(void *)&a4, *(void *)&a5, a6);
  int v11 = self;
  objc_sync_enter(v11);
  attrsData = v11->attrsData;
  v11->attrsData = 0;

  objc_sync_exit(v11);
  return v10;
}

- (void)UVFSNode
{
  return self->_UVFSNode;
}

- (NSString)lfn_name
{
  return (NSString *)objc_getProperty(self, a2, 88, 1);
}

- (void)setLfn_name:(id)a3
{
}

- (liveFSNode)lfn_parent
{
  return (liveFSNode *)objc_getProperty(self, a2, 96, 1);
}

- (void)setLfn_parent:(id)a3
{
}

- (NSString)lfn_fh
{
  return (NSString *)objc_getProperty(self, a2, 104, 1);
}

- (void)setLfn_fh:(id)a3
{
}

- (unint64_t)lfn_inUseClientSet
{
  return self->_lfn_inUseClientSet;
}

- (void)setLfn_inUseClientSet:(unint64_t)a3
{
  self->_lfn_inUseClientSet = a3;
}

- (unint64_t)lfn_interestedClients
{
  return self->_lfn_interestedClients;
}

- (void)setLfn_interestedClients:(unint64_t)a3
{
  self->_lfn_interestedClients = a3;
}

- (int)lfn_openCount
{
  return self->_lfn_openCount;
}

- (void)setLfn_openCount:(int)a3
{
  self->_lfn_openCount = a3;
}

- (int)lfn_wasWritten
{
  return self->_lfn_wasWritten;
}

- (void)setLfn_wasWritten:(int)a3
{
  self->_lfn_wasWritten = a3;
}

- (LiveFSAppleDouble)lfn_appledouble
{
  return (LiveFSAppleDouble *)objc_getProperty(self, a2, 128, 1);
}

- (void)setLfn_appledouble:(id)a3
{
}

- (LiveFSXattrCache)lfn_xattrCache
{
  return (LiveFSXattrCache *)objc_getProperty(self, a2, 136, 1);
}

- (void)setLfn_xattrCache:(id)a3
{
}

- (BOOL)lfn_check_appledouble
{
  return self->_lfn_check_appledouble;
}

- (void)setLfn_check_appledouble:(BOOL)a3
{
  self->_lfn_check_appledouble = a3;
}

- (unint64_t)lfn_fileid
{
  return self->_lfn_fileid;
}

- (unint64_t)lfn_seqno
{
  return self->_lfn_seqno;
}

- (void)setLfn_seqno:(unint64_t)a3
{
  self->_lfn_seqno = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lfn_xattrCache, 0);
  objc_storeStrong((id *)&self->_lfn_appledouble, 0);
  objc_storeStrong((id *)&self->_lfn_fh, 0);
  objc_storeStrong((id *)&self->_lfn_parent, 0);
  objc_storeStrong((id *)&self->_lfn_name, 0);
  objc_storeStrong((id *)&self->xattrCache, 0);
  objc_storeStrong((id *)&self->attrsData, 0);

  objc_storeStrong((id *)&self->volume, 0);
}

@end