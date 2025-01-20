@interface SMBNode
+ (SMBNode)nodeWithParameters:(smb_create *)a3 onPiston:(id)a4 onShareID:(unsigned int)a5 withName:(id)a6 withStreamName:(id)a7 callBack:(id)a8;
+ (void)nodeForCmpd:(id)a3 onShareID:(unsigned int)a4 callBack:(id)a5;
- ($7DEDF3842AEFB7F1E6DF5AF62E424A02)fid;
- (NSString)name;
- (NSString)streamName;
- (SMBPiston)pd;
- (id)init:(id)a3;
- (id)init:(smb_create *)a3 onPiston:(id)a4 onShareID:(unsigned int)a5 withName:(id)a6 withStreamName:(id)a7 callBack:(id)a8;
- (id)initForCmpd:(id)a3 onShareID:(unsigned int)a4;
- (int)cmpdAddClose:(smb_close *)a3 withFlags:(unsigned __int16)a4;
- (int)cmpdAddCreate:(smb_create *)a3 withName:(id)a4 withStreamName:(id)a5;
- (int)cmpdAddIoctl:(smb_ioctl *)a3 getReparsePoint:(id)a4;
- (int)cmpdAddIoctl:(smb_ioctl *)a3 pipeTransceive:(id)a4 withRecvData:(id)a5;
- (int)cmpdAddIoctl:(smb_ioctl *)a3 setReparsePoint:(id)a4;
- (int)cmpdAddQueryDirectory:(smb_query_dir *)a3 onDir:(id)a4 returnDataIn:(id)a5;
- (int)cmpdAddQueryInformation:(smb_query_info *)a3 withStreamName:(id)a4 forFileAllInfo:(id)a5 withInputBuffer:(id)a6 withOutputBuffer:(id)a7;
- (int)cmpdAddRead:(smb_read_write *)a3 intoBuffer:(id)a4;
- (int)cmpdAddSetInformation:(smb_setinfo *)a3 withInputBuffer:(id)a4 withRenameTarget:(id)a5;
- (int)cmpdAddWrite:(smb_read_write *)a3 fromBuffer:(id)a4;
- (int)cmpdParseClose:(smb_close *)a3 withFlags:(unsigned __int16)a4;
- (int)cmpdParseCreate:(smb_create *)a3;
- (int)cmpdParseIoctl:(smb_ioctl *)a3 reparsePoint:(id)a4 sendInputBuffer:(id)a5 rcvOutputBuffer:(id)a6;
- (int)cmpdParseQueryDirectory:(smb_query_dir *)a3 returnDataIn:(id)a4;
- (int)cmpdParseQueryInformation:(smb_query_info *)a3 withStreamName:(id)a4 forFileAllInfo:(id)a5 withOutputBuffer:(id)a6;
- (int)cmpdParseRead:(smb_read_write *)a3 intoBuffer:(id)a4;
- (int)cmpdParseSetInformation:(smb_setinfo *)a3;
- (int)cmpdParseWrite:(smb_read_write *)a3;
- (int)commonInit:(id)a3 onShareID:(unsigned int)a4;
- (int)commonInit:(id)a3 onShareID:(unsigned int)a4 name:(id)a5 streamName:(id)a6;
- (int)isCmpd;
- (int)parseNextHeader:(unsigned __int16)a3 retNTStatus:(unsigned int *)a4 retMdpp:(mdchain *)a5;
- (int)resetCmpdRequest;
- (int)updateCmpdHdr;
- (unint64_t)cmpdNextCmdOffset;
- (unsigned)isOpen;
- (unsigned)marshallPos;
- (unsigned)onEncryptedShare;
- (unsigned)parsePos;
- (unsigned)shareID;
- (unsigned)treeID;
- (void)changeNotify:(smb_change_notify *)a3 withFlags:(unsigned __int16)a4 withFilter:(unsigned int)a5 returnDataIn:(id)a6 callBack:(id)a7;
- (void)close:(smb_close *)a3 withFlags:(unsigned __int16)a4 callBack:(id)a5;
- (void)dealloc;
- (void)flush:(smb_flush *)a3 callBack:(id)a4;
- (void)ioctl:(smb_ioctl *)a3 getReparsePoint:(id)a4 callBack:(id)a5;
- (void)ioctl:(smb_ioctl *)a3 pipeTransceive:(id)a4 withRecvData:(id)a5 callBack:(id)a6;
- (void)ioctl:(smb_ioctl *)a3 setReparsePoint:(id)a4 callBack:(id)a5;
- (void)lockUnlock:(smb_lock *)a3 callBack:(id)a4;
- (void)queryDirectory:(smb_query_dir *)a3 onDir:(id)a4 returnDataIn:(id)a5 callBack:(id)a6;
- (void)queryInformation:(smb_query_info *)a3 withStreamName:(id)a4 forFileAllInfo:(id)a5 withInputBuffer:(id)a6 withOutputBuffer:(id)a7 callBack:(id)a8;
- (void)read:(smb_read_write *)a3 intoBuffer:(id)a4 callBack:(id)a5;
- (void)resetCmpdRequest;
- (void)sendCmpdRequest:(id)a3;
- (void)setCmpdNextCmdOffset:(unint64_t)a3;
- (void)setFid:(id)a3;
- (void)setInformation:(smb_setinfo *)a3 withInputBuffer:(id)a4 withRenameTarget:(id)a5 callBack:(id)a6;
- (void)setIsCmpd:(int)a3;
- (void)setIsOpen:(unsigned int)a3;
- (void)setMarshallPos:(unsigned int)a3;
- (void)setName:(id)a3;
- (void)setOnEncryptedShare:(unsigned int)a3;
- (void)setParsePos:(unsigned int)a3;
- (void)setPd:(id)a3;
- (void)setShareID:(unsigned int)a3;
- (void)setStreamName:(id)a3;
- (void)setTreeID:(unsigned int)a3;
- (void)updateCmpdHdr;
- (void)write:(smb_read_write *)a3 fromBuffer:(id)a4 callBack:(id)a5;
@end

@implementation SMBNode

- (id)init:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)SMBNode;
  v5 = [(SMBNode *)&v9 init];
  v6 = v5;
  if (v5)
  {
    [(SMBNode *)v5 setPd:v4];
    v7 = v6;
  }

  return v6;
}

- (int)commonInit:(id)a3 onShareID:(unsigned int)a4 name:(id)a5 streamName:(id)a6
{
  uint64_t v7 = *(void *)&a4;
  id v10 = a5;
  id v11 = a6;
  int v12 = [(SMBNode *)self commonInit:a3 onShareID:v7];
  if (!v12)
  {
    [(SMBNode *)self setName:v10];
    [(SMBNode *)self setStreamName:v11];
  }

  return v12;
}

- (int)commonInit:(id)a3 onShareID:(unsigned int)a4
{
  uint64_t v4 = *(void *)&a4;
  id v6 = a3;
  uint64_t v7 = [v6 getShare:v4];
  if (v7)
  {
    [(SMBNode *)self setPd:v6];
    [(SMBNode *)self setShareID:v4];
    -[SMBNode setTreeID:](self, "setTreeID:", objc_msgSend(v7, "tree_id"));
    -[SMBNode setOnEncryptedShare:](self, "setOnEncryptedShare:", [v7 isEncrypted]);
    int v8 = 0;
  }
  else
  {
    if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
      -[SMBNode commonInit:onShareID:]();
    }
    int v8 = 2;
  }

  return v8;
}

- (id)initForCmpd:(id)a3 onShareID:(unsigned int)a4
{
  uint64_t v4 = *(void *)&a4;
  id v6 = a3;
  v11.receiver = self;
  v11.super_class = (Class)SMBNode;
  uint64_t v7 = [(SMBNode *)&v11 init];
  int v8 = v7;
  if (v7 && ![(SMBNode *)v7 commonInit:v6 onShareID:v4])
  {
    v8->_isCmpd = 1;
    objc_super v9 = v8;
  }
  else
  {
    objc_super v9 = 0;
  }

  return v9;
}

+ (void)nodeForCmpd:(id)a3 onShareID:(unsigned int)a4 callBack:(id)a5
{
  uint64_t v5 = *(void *)&a4;
  objc_super v9 = (void (**)(void))a5;
  id v7 = a3;
  int v8 = objc_alloc_init(SMBNode);
  LODWORD(v5) = [(SMBNode *)v8 commonInit:v7 onShareID:v5];

  if (!v5) {
    [(SMBNode *)v8 setIsCmpd:1];
  }
  v9[2]();
}

- (id)init:(smb_create *)a3 onPiston:(id)a4 onShareID:(unsigned int)a5 withName:(id)a6 withStreamName:(id)a7 callBack:(id)a8
{
  uint64_t v11 = *(void *)&a5;
  id v14 = a4;
  id v15 = a6;
  id v16 = a7;
  id v17 = a8;
  v22.receiver = self;
  v22.super_class = (Class)SMBNode;
  v18 = [(SMBNode *)&v22 init];
  v19 = v18;
  if (v18
    && ![(SMBNode *)v18 commonInit:v14 onShareID:v11 name:v15 streamName:v16])
  {
    piston_create_file(v19, (uint64_t)a3, v17);
    v20 = v19;
  }
  else
  {
    v20 = 0;
  }

  return v20;
}

+ (SMBNode)nodeWithParameters:(smb_create *)a3 onPiston:(id)a4 onShareID:(unsigned int)a5 withName:(id)a6 withStreamName:(id)a7 callBack:(id)a8
{
  uint64_t v10 = *(void *)&a5;
  v13 = (void (**)(id, uint64_t, void))a8;
  id v14 = a7;
  id v15 = a6;
  id v16 = a4;
  id v17 = objc_alloc_init(SMBNode);
  uint64_t v18 = [(SMBNode *)v17 commonInit:v16 onShareID:v10 name:v15 streamName:v14];

  if (v18)
  {
    v13[2](v13, v18, 0);
  }
  else
  {
    v20[0] = MEMORY[0x263EF8330];
    v20[1] = 3221225472;
    v20[2] = __82__SMBNode_nodeWithParameters_onPiston_onShareID_withName_withStreamName_callBack___block_invoke;
    v20[3] = &unk_265072D90;
    objc_super v22 = v13;
    v21 = v17;
    piston_create_file(v21, (uint64_t)a3, v20);
  }
  return result;
}

uint64_t __82__SMBNode_nodeWithParameters_onPiston_onShareID_withName_withStreamName_callBack___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 40) + 16))();
}

- (int)cmpdAddCreate:(smb_create *)a3 withName:(id)a4 withStreamName:(id)a5
{
  id v8 = a4;
  id v9 = a5;
  if (!self->_isCmpd)
  {
    BOOL v18 = os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR);
    if (v18) {
      -[SMBNode cmpdAddCreate:withName:withStreamName:](v18, v19, v20, v21, v22, v23, v24, v25);
    }
    goto LABEL_7;
  }
  if (self->_marshallPos >= 5)
  {
    BOOL v10 = os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR);
    if (v10) {
      -[SMBNode cmpdAddCreate:withName:withStreamName:](v10, v11, v12, v13, v14, v15, v16, v17);
    }
LABEL_7:
    int v26 = 12;
    goto LABEL_8;
  }
  [(SMBNode *)self setName:v8];
  [(SMBNode *)self setStreamName:v9];
  id v33 = 0;
  int v26 = smb2_smb_create(self, (uint64_t)a3, 0, &v33, 0);
  id v28 = v33;
  v29 = v28;
  if (v26 || !v28)
  {
    if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
      -[SMBNode cmpdAddCreate:withName:withStreamName:]();
    }
  }
  else
  {
    v30 = &self->super.isa + self->_marshallPos;
    Class v31 = v30[1];
    v30[1] = (Class)v28;
    id v32 = v28;

    [(SMBNode *)self updateCmpdHdr];
    int v26 = 0;
  }
LABEL_8:

  return v26;
}

- (int)cmpdParseCreate:(smb_create *)a3
{
  unsigned int v7 = 0;
  id v6 = 0;
  int result = [(SMBNode *)self parseNextHeader:5 retNTStatus:&v7 retMdpp:&v6];
  a3->var10 = v7;
  if (!result)
  {
    int result = smb2_smb_parse_create(self, v6, (uint64_t)a3, 0);
    if (!result)
    {
      -[SMBNode setFid:](self, "setFid:", a3->var22.var0, a3->var22.var1);
      return 0;
    }
  }
  return result;
}

- (void)dealloc
{
  memset(v12, 0, sizeof(v12));
  if (self->_isOpen)
  {
    pd = self->_pd;
    if (pd)
    {
      uint64_t v4 = [(SMBPiston *)pd sock];
      if (v4)
      {
        uint64_t v5 = (void *)v4;
        id v6 = [(SMBPiston *)self->_pd sock];
        int v7 = [v6 writeEnabled];

        if (v7 == 1) {
          [(SMBNode *)self close:v12 withFlags:0 callBack:0];
        }
      }
    }
  }
  if (self->_isCmpd)
  {
    for (uint64_t i = 8; i != 48; i += 8)
    {
      id v9 = *(Class *)((char *)&self->super.isa + i);
      if (v9)
      {
        objc_msgSend(v9, "smb_rq_done");
        BOOL v10 = *(Class *)((char *)&self->super.isa + i);
        *(Class *)((char *)&self->super.isa + i) = 0;
      }
    }
  }
  v11.receiver = self;
  v11.super_class = (Class)SMBNode;
  [(SMBNode *)&v11 dealloc];
}

- (void)close:(smb_close *)a3 withFlags:(unsigned __int16)a4 callBack:(id)a5
{
}

- (int)cmpdAddClose:(smb_close *)a3 withFlags:(unsigned __int16)a4
{
  if (!self->_isCmpd)
  {
    BOOL v13 = os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR);
    if (v13) {
      -[SMBNode cmpdAddClose:withFlags:](v13, v14, v15, v16, v17, v18, v19, v20);
    }
    return 12;
  }
  if (self->_marshallPos >= 5)
  {
    BOOL v5 = os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR);
    if (v5) {
      -[SMBNode cmpdAddClose:withFlags:](v5, v6, v7, v8, v9, v10, v11, v12);
    }
    return 12;
  }
  id v28 = 0;
  int v21 = smb2_smb_close(self, a4, a3, &v28, 0);
  id v23 = v28;
  uint64_t v24 = v23;
  if (v21 || !v23)
  {
    if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
      -[SMBNode cmpdAddClose:withFlags:]();
    }
  }
  else
  {
    uint64_t v25 = &self->super.isa + self->_marshallPos;
    Class v26 = v25[1];
    v25[1] = (Class)v23;
    id v27 = v23;

    [(SMBNode *)self updateCmpdHdr];
    return 0;
  }
  return v21;
}

- (int)cmpdParseClose:(smb_close *)a3 withFlags:(unsigned __int16)a4
{
  char v4 = a4;
  unsigned int v9 = 0;
  uint64_t v8 = 0;
  int result = [(SMBNode *)self parseNextHeader:6 retNTStatus:&v9 retMdpp:&v8];
  a3->var0 = v9;
  if (!result)
  {
    int result = smb2_smb_parse_close(v8, v4 & 1, (uint64_t)a3);
    if (!result)
    {
      [(SMBNode *)self setIsOpen:0];
      return 0;
    }
  }
  return result;
}

- (void)flush:(smb_flush *)a3 callBack:(id)a4
{
}

- (void)read:(smb_read_write *)a3 intoBuffer:(id)a4 callBack:(id)a5
{
}

- (int)cmpdAddRead:(smb_read_write *)a3 intoBuffer:(id)a4
{
  id v6 = a4;
  if (!self->_isCmpd)
  {
    BOOL v15 = os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR);
    if (v15) {
      -[SMBNode cmpdAddRead:intoBuffer:](v15, v16, v17, v18, v19, v20, v21, v22);
    }
    goto LABEL_7;
  }
  if (self->_marshallPos >= 5)
  {
    BOOL v7 = os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR);
    if (v7) {
      -[SMBNode cmpdAddRead:intoBuffer:](v7, v8, v9, v10, v11, v12, v13, v14);
    }
LABEL_7:
    int v23 = 12;
    goto LABEL_8;
  }
  id v30 = 0;
  int v23 = smb2_smb_read_one(self, (uint64_t)a3, v6, &v30, 0);
  id v25 = v30;
  Class v26 = v25;
  if (v23 || !v25)
  {
    if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
      -[SMBNode cmpdAddRead:intoBuffer:]();
    }
  }
  else
  {
    id v27 = &self->super.isa + self->_marshallPos;
    Class v28 = v27[1];
    v27[1] = (Class)v25;
    id v29 = v25;

    [(SMBNode *)self updateCmpdHdr];
    int v23 = 0;
  }
LABEL_8:

  return v23;
}

- (int)cmpdParseRead:(smb_read_write *)a3 intoBuffer:(id)a4
{
  id v6 = a4;
  unsigned int v10 = 0;
  uint64_t v9 = 0;
  int one = [(SMBNode *)self parseNextHeader:8 retNTStatus:&v10 retMdpp:&v9];
  a3->var4 = v10;
  if (!one) {
    int one = smb2_smb_parse_read_one(v9, (uint64_t)a3);
  }

  return one;
}

- (void)write:(smb_read_write *)a3 fromBuffer:(id)a4 callBack:(id)a5
{
}

- (int)cmpdAddWrite:(smb_read_write *)a3 fromBuffer:(id)a4
{
  id v6 = a4;
  if (!self->_isCmpd)
  {
    BOOL v15 = os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR);
    if (v15) {
      -[SMBNode cmpdAddWrite:fromBuffer:](v15, v16, v17, v18, v19, v20, v21, v22);
    }
    goto LABEL_7;
  }
  if (self->_marshallPos >= 5)
  {
    BOOL v7 = os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR);
    if (v7) {
      -[SMBNode cmpdAddWrite:fromBuffer:](v7, v8, v9, v10, v11, v12, v13, v14);
    }
LABEL_7:
    int v23 = 12;
    goto LABEL_8;
  }
  id v30 = 0;
  int v23 = smb2_smb_write_one(self, (uint64_t)a3, v6, &v30, 0);
  id v25 = v30;
  Class v26 = v25;
  if (v23 || !v25)
  {
    if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
      -[SMBNode cmpdAddWrite:fromBuffer:]();
    }
  }
  else
  {
    id v27 = &self->super.isa + self->_marshallPos;
    Class v28 = v27[1];
    v27[1] = (Class)v25;
    id v29 = v25;

    [(SMBNode *)self updateCmpdHdr];
    int v23 = 0;
  }
LABEL_8:

  return v23;
}

- (int)cmpdParseWrite:(smb_read_write *)a3
{
  unsigned int v6 = 0;
  BOOL v5 = 0;
  int result = [(SMBNode *)self parseNextHeader:9 retNTStatus:&v6 retMdpp:&v5];
  a3->var4 = v6;
  if (!result) {
    return smb2_smb_parse_write_one(v5, (uint64_t)a3);
  }
  return result;
}

- (void)lockUnlock:(smb_lock *)a3 callBack:(id)a4
{
}

- (void)ioctl:(smb_ioctl *)a3 getReparsePoint:(id)a4 callBack:(id)a5
{
}

- (void)ioctl:(smb_ioctl *)a3 setReparsePoint:(id)a4 callBack:(id)a5
{
}

- (void)ioctl:(smb_ioctl *)a3 pipeTransceive:(id)a4 withRecvData:(id)a5 callBack:(id)a6
{
}

- (int)cmpdAddIoctl:(smb_ioctl *)a3 getReparsePoint:(id)a4
{
  id v6 = a4;
  if (!self->_isCmpd) {
    self->_isCmpd = 1;
  }
  if (self->_marshallPos < 5)
  {
    id v22 = 0;
    int v15 = smb2_smb_ioctl(0, self, 0, (uint64_t)a3, v6, 0, 0, 0, 0, &v22, 0);
    id v16 = v22;
    uint64_t v17 = v16;
    if (v15 || !v16)
    {
      if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
        -[SMBNode cmpdAddIoctl:getReparsePoint:]();
      }
    }
    else
    {
      uint64_t v18 = &self->super.isa + self->_marshallPos;
      Class v19 = v18[1];
      v18[1] = (Class)v16;
      id v20 = v16;

      [(SMBNode *)self updateCmpdHdr];
      int v15 = 0;
    }
  }
  else
  {
    BOOL v7 = os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR);
    if (v7) {
      -[SMBNode cmpdAddIoctl:getReparsePoint:](v7, v8, v9, v10, v11, v12, v13, v14);
    }
    int v15 = 12;
  }

  return v15;
}

- (int)cmpdAddIoctl:(smb_ioctl *)a3 setReparsePoint:(id)a4
{
  id v6 = a4;
  if (!self->_isCmpd) {
    self->_isCmpd = 1;
  }
  if (self->_marshallPos < 5)
  {
    id v22 = 0;
    int v15 = smb2_smb_ioctl(0, self, 0, (uint64_t)a3, v6, 0, 0, 0, 0, &v22, 0);
    id v16 = v22;
    uint64_t v17 = v16;
    if (v15 || !v16)
    {
      if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
        -[SMBNode cmpdAddIoctl:setReparsePoint:]();
      }
    }
    else
    {
      uint64_t v18 = &self->super.isa + self->_marshallPos;
      Class v19 = v18[1];
      v18[1] = (Class)v16;
      id v20 = v16;

      [(SMBNode *)self updateCmpdHdr];
      int v15 = 0;
    }
  }
  else
  {
    BOOL v7 = os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR);
    if (v7) {
      -[SMBNode cmpdAddIoctl:setReparsePoint:](v7, v8, v9, v10, v11, v12, v13, v14);
    }
    int v15 = 12;
  }

  return v15;
}

- (int)cmpdAddIoctl:(smb_ioctl *)a3 pipeTransceive:(id)a4 withRecvData:(id)a5
{
  id v8 = a4;
  id v9 = a5;
  if (!self->_isCmpd) {
    self->_isCmpd = 1;
  }
  if (self->_marshallPos < 5)
  {
    id v25 = 0;
    int v18 = smb2_smb_ioctl(0, self, 0, (uint64_t)a3, 0, v8, v9, 0, 0, &v25, 0);
    id v19 = v25;
    id v20 = v19;
    if (v18 || !v19)
    {
      if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
        -[SMBNode cmpdAddIoctl:pipeTransceive:withRecvData:]();
      }
    }
    else
    {
      uint64_t v21 = &self->super.isa + self->_marshallPos;
      Class v22 = v21[1];
      v21[1] = (Class)v19;
      id v23 = v19;

      [(SMBNode *)self updateCmpdHdr];
      int v18 = 0;
    }
  }
  else
  {
    BOOL v10 = os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR);
    if (v10) {
      -[SMBNode cmpdAddIoctl:pipeTransceive:withRecvData:](v10, v11, v12, v13, v14, v15, v16, v17);
    }
    int v18 = 12;
  }

  return v18;
}

- (int)cmpdParseIoctl:(smb_ioctl *)a3 reparsePoint:(id)a4 sendInputBuffer:(id)a5 rcvOutputBuffer:(id)a6
{
  id v10 = a4;
  id v11 = a5;
  id v12 = a6;
  unsigned int v16 = 0;
  uint64_t v15 = 0;
  int v13 = [(SMBNode *)self parseNextHeader:11 retNTStatus:&v16 retMdpp:&v15];
  a3->var3 = v16;
  if (!v13) {
    int v13 = smb2_smb_parse_ioctl(self, v15, (uint64_t)a3, v10, v11, v12);
  }

  return v13;
}

- (void)queryDirectory:(smb_query_dir *)a3 onDir:(id)a4 returnDataIn:(id)a5 callBack:(id)a6
{
}

- (int)cmpdAddQueryDirectory:(smb_query_dir *)a3 onDir:(id)a4 returnDataIn:(id)a5
{
  id v8 = a4;
  id v9 = a5;
  if (!self->_isCmpd)
  {
    BOOL v18 = os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR);
    if (v18) {
      -[SMBNode cmpdAddQueryDirectory:onDir:returnDataIn:](v18, v19, v20, v21, v22, v23, v24, v25);
    }
    goto LABEL_7;
  }
  if (self->_marshallPos >= 5)
  {
    BOOL v10 = os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR);
    if (v10) {
      -[SMBNode cmpdAddQueryDirectory:onDir:returnDataIn:](v10, v11, v12, v13, v14, v15, v16, v17);
    }
LABEL_7:
    int v26 = 12;
    goto LABEL_8;
  }
  id v33 = 0;
  int v26 = smb2_smb_query_dir(self, (uint64_t)a3, v8, v9, 0, &v33, 0);
  id v28 = v33;
  id v29 = v28;
  if (v26 || !v28)
  {
    if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
      -[SMBNode cmpdAddQueryDirectory:onDir:returnDataIn:]();
    }
  }
  else
  {
    id v30 = &self->super.isa + self->_marshallPos;
    Class v31 = v30[1];
    v30[1] = (Class)v28;
    id v32 = v28;

    [(SMBNode *)self updateCmpdHdr];
    int v26 = 0;
  }
LABEL_8:

  return v26;
}

- (int)cmpdParseQueryDirectory:(smb_query_dir *)a3 returnDataIn:(id)a4
{
  id v6 = a4;
  unsigned int v10 = 0;
  id v9 = 0;
  int dir = [(SMBNode *)self parseNextHeader:14 retNTStatus:&v10 retMdpp:&v9];
  a3->ntStatus = v10;
  if (!dir) {
    int dir = smb2_smb_parse_query_dir(v9, (uint64_t)a3, v6, 0);
  }

  return dir;
}

- (void)changeNotify:(smb_change_notify *)a3 withFlags:(unsigned __int16)a4 withFilter:(unsigned int)a5 returnDataIn:(id)a6 callBack:(id)a7
{
}

- (void)queryInformation:(smb_query_info *)a3 withStreamName:(id)a4 forFileAllInfo:(id)a5 withInputBuffer:(id)a6 withOutputBuffer:(id)a7 callBack:(id)a8
{
}

- (int)cmpdAddQueryInformation:(smb_query_info *)a3 withStreamName:(id)a4 forFileAllInfo:(id)a5 withInputBuffer:(id)a6 withOutputBuffer:(id)a7
{
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  id v15 = a7;
  if (!self->_isCmpd)
  {
    BOOL v24 = os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR);
    if (v24) {
      -[SMBNode cmpdAddQueryInformation:withStreamName:forFileAllInfo:withInputBuffer:withOutputBuffer:](v24, v25, v26, v27, v28, v29, v30, v31);
    }
    goto LABEL_7;
  }
  if (self->_marshallPos >= 5)
  {
    BOOL v16 = os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR);
    if (v16) {
      -[SMBNode cmpdAddQueryInformation:withStreamName:forFileAllInfo:withInputBuffer:withOutputBuffer:](v16, v17, v18, v19, v20, v21, v22, v23);
    }
LABEL_7:
    int v32 = 12;
    goto LABEL_8;
  }
  id v39 = 0;
  int v32 = smb2_smb_query_info(self, &a3->var0, v12, v13, v14, v15, &v39, 0);
  id v34 = v39;
  v35 = v34;
  if (v32 || !v34)
  {
    if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
      -[SMBNode cmpdAddQueryInformation:withStreamName:forFileAllInfo:withInputBuffer:withOutputBuffer:]();
    }
  }
  else
  {
    v36 = &self->super.isa + self->_marshallPos;
    Class v37 = v36[1];
    v36[1] = (Class)v34;
    id v38 = v34;

    [(SMBNode *)self updateCmpdHdr];
    int v32 = 0;
  }
LABEL_8:

  return v32;
}

- (int)cmpdParseQueryInformation:(smb_query_info *)a3 withStreamName:(id)a4 forFileAllInfo:(id)a5 withOutputBuffer:(id)a6
{
  id v10 = a4;
  id v11 = a5;
  id v12 = a6;
  unsigned int v16 = 0;
  id v15 = 0;
  int info = [(SMBNode *)self parseNextHeader:16 retNTStatus:&v16 retMdpp:&v15];
  a3->var4 = v16;
  if (!info) {
    int info = smb2_smb_parse_query_info(self, v15, &a3->var0, v10, v11, v12);
  }

  return info;
}

- (void)setInformation:(smb_setinfo *)a3 withInputBuffer:(id)a4 withRenameTarget:(id)a5 callBack:(id)a6
{
}

- (int)cmpdAddSetInformation:(smb_setinfo *)a3 withInputBuffer:(id)a4 withRenameTarget:(id)a5
{
  id v8 = a4;
  id v9 = a5;
  if (!self->_isCmpd) {
    self->_isCmpd = 1;
  }
  if (self->_marshallPos < 5)
  {
    id v25 = 0;
    int v18 = smb2_smb_set_info(self, (uint64_t)a3, v8, v9, &v25, 0);
    id v19 = v25;
    uint64_t v20 = v19;
    if (v18 || !v19)
    {
      if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
        -[SMBNode cmpdAddSetInformation:withInputBuffer:withRenameTarget:]();
      }
    }
    else
    {
      uint64_t v21 = &self->super.isa + self->_marshallPos;
      Class v22 = v21[1];
      v21[1] = (Class)v19;
      id v23 = v19;

      [(SMBNode *)self updateCmpdHdr];
      int v18 = 0;
    }
  }
  else
  {
    BOOL v10 = os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR);
    if (v10) {
      -[SMBNode cmpdAddSetInformation:withInputBuffer:withRenameTarget:](v10, v11, v12, v13, v14, v15, v16, v17);
    }
    int v18 = 12;
  }

  return v18;
}

- (int)cmpdParseSetInformation:(smb_setinfo *)a3
{
  unsigned int v6 = 0;
  uint64_t v5 = 0;
  int result = [(SMBNode *)self parseNextHeader:17 retNTStatus:&v6 retMdpp:&v5];
  a3->var8 = v6;
  return result;
}

- (int)updateCmpdHdr
{
  if (self->_isCmpd)
  {
    unsigned int marshallPos = self->_marshallPos;
    if (marshallPos)
    {
      rqp = self->rqp;
      unsigned int v5 = [*((id *)&self->super.isa + marshallPos) writeLen];
      uint64_t v6 = v5;
      if ((v5 & 7) != 0) {
        uint64_t v6 = (v5 & 0xFFFFFFF8) + 8;
      }
      if (v5) {
        uint64_t v7 = v6;
      }
      else {
        uint64_t v7 = 0;
      }
      [(SMB_rq *)rqp[self->_marshallPos - 1] smb_rq_set_sr_nextcmdp:v7];
      [(SMB_rq *)rqp[self->_marshallPos - 1] setSr_next_rqp:rqp[self->_marshallPos]];
      [(SMB_rq *)rqp[self->_marshallPos] smb_rq_set_srflagsp:4];
      unsigned int v8 = self->_marshallPos + 1;
    }
    else
    {
      unsigned int v8 = 1;
    }
    int result = 0;
    self->_unsigned int marshallPos = v8;
  }
  else
  {
    BOOL v9 = os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR);
    if (v9) {
      [(SMBNode *)v9 updateCmpdHdr];
    }
    return 22;
  }
  return result;
}

- (int)parseNextHeader:(unsigned __int16)a3 retNTStatus:(unsigned int *)a4 retMdpp:(mdchain *)a5
{
  uint64_t v74 = *MEMORY[0x263EF8340];
  long long v65 = 0u;
  long long v66 = 0u;
  v64 = &v65;
  memset(__dst, 0, sizeof(__dst));
  if (!self->_isCmpd)
  {
    BOOL v16 = os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR);
    if (v16) {
      -[SMBNode parseNextHeader:retNTStatus:retMdpp:](v16, v17, v18, v19, v20, v21, v22, v23);
    }
    return 22;
  }
  p_parsePos = &self->_parsePos;
  rqp = self->rqp;
  unsigned int v8 = self->rqp[self->_parsePos];
  if (!v8)
  {
    BOOL v24 = os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR);
    if (v24) {
      -[SMBNode parseNextHeader:retNTStatus:retMdpp:](v24, v25, v26, v27, v28, v29, v30, v31);
    }
    return 22;
  }
  int v11 = a3;
  if ([(SMB_rq *)v8 sr_command] != a3)
  {
    if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
      -[SMBNode parseNextHeader:retNTStatus:retMdpp:].cold.8(p_parsePos, (uint64_t)rqp, v11);
    }
    return 22;
  }
  uint64_t v12 = *p_parsePos;
  if (v12)
  {
    if (!rqp[(v12 - 1)])
    {
      if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
        -[SMBNode parseNextHeader:retNTStatus:retMdpp:].cold.5((uint64_t)p_parsePos, v37, v38, v39, v40, v41, v42, v43);
      }
      return 22;
    }
    if (([(SMB_rq *)rqp[v12] sr_extflags] & 2) != 0)
    {
      uint64_t v13 = [(SMB_rq *)rqp[*p_parsePos] smb_rq_getreply];
      *a5 = v13;
    }
    else
    {
      uint64_t v13 = [(SMB_rq *)self->rqp[0] smb_rq_getreply];
      *a5 = v13;
      int command = smb2_rq_next_command(rqp[self->_parsePos - 1], &self->_cmpdNextCmdOffset, v13);
      if (command)
      {
        int v15 = command;
        if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
          -[SMBNode parseNextHeader:retNTStatus:retMdpp:].cold.7(p_parsePos, (uint64_t)rqp);
        }
        return v15;
      }
    }
    int mem = md_get_mem(v13, (char *)__dst, 64, 0);
    if (mem)
    {
      int v15 = mem;
      if (piston_log_level && os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
        -[SMBNode parseNextHeader:retNTStatus:retMdpp:].cold.6(p_parsePos, (uint64_t)rqp);
      }
    }
    else
    {
      int v15 = [(SMB_rq *)rqp[*p_parsePos] replyError];
      *a4 = [(SMB_rq *)rqp[(*p_parsePos)++] sr_ntstatus];
    }
  }
  else
  {
    uint64_t v33 = [(SMB_rq *)*rqp smb_rq_getreply];
    *a5 = (mdchain *)v33;
    long long v34 = *(_OWORD *)(v33 + 16);
    long long v65 = *(_OWORD *)v33;
    long long v66 = v34;
    int v36 = [(SMB_rq *)*rqp sr_command] == 5 && [(SMB_rq *)*rqp replyError] == 0;
    if (self->_marshallPos >= 2)
    {
      uint64_t v45 = 1;
      v46 = &_os_log_internal;
      *(void *)&long long v35 = 136315650;
      long long v63 = v35;
      v47 = (void **)rqp;
      do
      {
        if ((objc_msgSend(v47[1], "sr_extflags", v63) & 2) != 0)
        {
          v49 = (long long *)objc_msgSend(v47[1], "smb_rq_getreply");
          long long v50 = v49[1];
          long long v65 = *v49;
          long long v66 = v50;
        }
        else
        {
          if (!*v47)
          {
            if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
              -[SMBNode parseNextHeader:retNTStatus:retMdpp:](v45, v55, v56, v57, v58, v59, v60, v61);
            }
            return 22;
          }
          int v48 = smb2_rq_next_command(*v47, &self->_cmpdNextCmdOffset, &v65);
          if (v48)
          {
            int v15 = v48;
            if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
              -[SMBNode parseNextHeader:retNTStatus:retMdpp:].cold.4(v47);
            }
            return v15;
          }
        }
        int v51 = smb2_rq_parse_header(v47[1], &v64);
        if (v51) {
          BOOL v52 = piston_log_level == 0;
        }
        else {
          BOOL v52 = 1;
        }
        if (!v52)
        {
          int v53 = v51;
          if (os_log_type_enabled(v46, OS_LOG_TYPE_ERROR))
          {
            uint64_t v54 = objc_msgSend(v47[1], "sr_messageid");
            *(_DWORD *)buf = v63;
            v68 = "-[SMBNode parseNextHeader:retNTStatus:retMdpp:]";
            __int16 v69 = 1024;
            int v70 = v53;
            __int16 v71 = 2048;
            uint64_t v72 = v54;
            _os_log_error_impl(&dword_23F849000, v46, OS_LOG_TYPE_ERROR, "%s: smb2_rq_parse_header failed %d, id %lld\n", buf, 0x1Cu);
          }
        }
        if (objc_msgSend(v47[1], "sr_command") == 5 && !objc_msgSend(v47[1], "replyError")) {
          ++v36;
        }
        if (objc_msgSend(v47[1], "sr_command") == 6) {
          int v36 = (__PAIR64__(v36, [v47[1] replyError]) - 1) >> 32;
        }
        ++v45;
        ++v47;
      }
      while (self->_marshallPos > v45);
    }
    if (v36 >= 1) {
      [(SMBNode *)self setIsOpen:1];
    }
    self->_cmpdNextCmdOffset = 0;
    int v15 = [(SMB_rq *)rqp[self->_parsePos] replyError];
    *a4 = [(SMB_rq *)rqp[self->_parsePos++] sr_ntstatus];
  }
  return v15;
}

- (void)sendCmpdRequest:(id)a3
{
  char v4 = (void (**)(id, uint64_t))a3;
  if (!self->_isCmpd)
  {
    BOOL v9 = os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR);
    if (v9)
    {
      -[SMBNode sendCmpdRequest:](v9, v10, v11, v12, v13, v14, v15, v16);
      if (!v4) {
        goto LABEL_10;
      }
    }
    else if (!v4)
    {
      goto LABEL_10;
    }
    v4[2](v4, 22);
    goto LABEL_10;
  }
  unsigned int v5 = [(SMBNode *)self pd];
  uint64_t v6 = self->rqp[0];
  v17[0] = MEMORY[0x263EF8330];
  v17[1] = 3221225472;
  v17[2] = __27__SMBNode_sendCmpdRequest___block_invoke;
  v17[3] = &unk_265072D90;
  uint64_t v7 = v4;
  v17[4] = self;
  uint64_t v18 = v7;
  uint64_t v8 = smb_rq_simple_block(v5, v6, v17);

  if (v8)
  {
    if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR))
    {
      -[SMBNode sendCmpdRequest:]();
      if (!v7) {
        goto LABEL_6;
      }
      goto LABEL_5;
    }
    if (v7) {
LABEL_5:
    }
      v7[2](v7, v8);
  }
LABEL_6:

LABEL_10:
}

void __27__SMBNode_sendCmpdRequest___block_invoke(uint64_t a1, int a2)
{
  char v4 = (void (**)(void, void))MEMORY[0x2455D48A0](*(void *)(a1 + 40));
  if (a2 && os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR))
  {
    __27__SMBNode_sendCmpdRequest___block_invoke_cold_1(a1);
    if (!v4) {
      goto LABEL_5;
    }
    goto LABEL_4;
  }
  if (v4) {
LABEL_4:
  }
    v4[2](v4, 0);
LABEL_5:
}

- (int)resetCmpdRequest
{
  if (self->_isCmpd)
  {
    for (uint64_t i = 8; i != 48; i += 8)
    {
      char v4 = *(Class *)((char *)&self->super.isa + i);
      if (v4)
      {
        objc_msgSend(v4, "smb_rq_done");
        unsigned int v5 = *(Class *)((char *)&self->super.isa + i);
        *(Class *)((char *)&self->super.isa + i) = 0;
      }
    }
    int result = 0;
    self->_unsigned int marshallPos = 0;
    self->_parsePos = 0;
    self->_cmpdNextCmdOffset = 0;
  }
  else
  {
    BOOL v7 = os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR);
    if (v7) {
      [(SMBNode *)v7 resetCmpdRequest];
    }
    return 12;
  }
  return result;
}

- (SMBPiston)pd
{
  return (SMBPiston *)objc_getProperty(self, a2, 80, 1);
}

- (void)setPd:(id)a3
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

- (NSString)name
{
  return (NSString *)objc_getProperty(self, a2, 88, 1);
}

- (void)setName:(id)a3
{
}

- (NSString)streamName
{
  return (NSString *)objc_getProperty(self, a2, 96, 1);
}

- (void)setStreamName:(id)a3
{
}

- ($7DEDF3842AEFB7F1E6DF5AF62E424A02)fid
{
  objc_copyStruct(v4, &self->_fid, 16, 1, 0);
  unint64_t v2 = v4[0];
  unint64_t v3 = v4[1];
  result.var1 = v3;
  result.var0 = v2;
  return result;
}

- (void)setFid:(id)a3
{
  $7DEDF3842AEFB7F1E6DF5AF62E424A02 v3 = a3;
  objc_copyStruct(&self->_fid, &v3, 16, 1, 0);
}

- (unsigned)isOpen
{
  return self->_isOpen;
}

- (void)setIsOpen:(unsigned int)a3
{
  self->_isOpen = a3;
}

- (int)isCmpd
{
  return self->_isCmpd;
}

- (void)setIsCmpd:(int)a3
{
  self->_isCmpd = a3;
}

- (unsigned)marshallPos
{
  return self->_marshallPos;
}

- (void)setMarshallPos:(unsigned int)a3
{
  self->_unsigned int marshallPos = a3;
}

- (unsigned)parsePos
{
  return self->_parsePos;
}

- (void)setParsePos:(unsigned int)a3
{
  self->_parsePos = a3;
}

- (unint64_t)cmpdNextCmdOffset
{
  return self->_cmpdNextCmdOffset;
}

- (void)setCmpdNextCmdOffset:(unint64_t)a3
{
  self->_cmpdNextCmdOffset = a3;
}

- (unsigned)treeID
{
  return self->_treeID;
}

- (void)setTreeID:(unsigned int)a3
{
  self->_treeID = a3;
}

- (unsigned)onEncryptedShare
{
  return self->_onEncryptedShare;
}

- (void)setOnEncryptedShare:(unsigned int)a3
{
  self->_onEncryptedShare = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_streamName, 0);
  objc_storeStrong((id *)&self->_name, 0);
  objc_storeStrong((id *)&self->_pd, 0);
  uint64_t v3 = 40;
  do
  {
    objc_storeStrong((id *)((char *)&self->super.isa + v3), 0);
    v3 -= 8;
  }
  while (v3);
}

- (void)commonInit:onShareID:.cold.1()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_23F849000, &_os_log_internal, v0, "%s: share_id <%d> not found. \n", v1, v2, v3, v4, 2u);
}

- (void)cmpdAddCreate:(uint64_t)a3 withName:(uint64_t)a4 withStreamName:(uint64_t)a5 .cold.1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)cmpdAddCreate:(uint64_t)a3 withName:(uint64_t)a4 withStreamName:(uint64_t)a5 .cold.2(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)cmpdAddCreate:withName:withStreamName:.cold.3()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_23F849000, &_os_log_internal, v0, "%s: smb2_smb_create failed <%d> \n", v1, v2, v3, v4, 2u);
}

- (void)cmpdAddClose:(uint64_t)a3 withFlags:(uint64_t)a4 .cold.1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)cmpdAddClose:(uint64_t)a3 withFlags:(uint64_t)a4 .cold.2(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)cmpdAddClose:withFlags:.cold.3()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_23F849000, &_os_log_internal, v0, "%s: smb2_smb_close failed <%d> \n", v1, v2, v3, v4, 2u);
}

- (void)cmpdAddRead:(uint64_t)a3 intoBuffer:(uint64_t)a4 .cold.1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)cmpdAddRead:(uint64_t)a3 intoBuffer:(uint64_t)a4 .cold.2(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)cmpdAddRead:intoBuffer:.cold.3()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_23F849000, &_os_log_internal, v0, "%s: smb2_smb_read_one failed <%d> \n", v1, v2, v3, v4, 2u);
}

- (void)cmpdAddWrite:(uint64_t)a3 fromBuffer:(uint64_t)a4 .cold.1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)cmpdAddWrite:(uint64_t)a3 fromBuffer:(uint64_t)a4 .cold.2(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)cmpdAddWrite:fromBuffer:.cold.3()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_23F849000, &_os_log_internal, v0, "%s: smb2_smb_write_one failed <%d> \n", v1, v2, v3, v4, 2u);
}

- (void)cmpdAddIoctl:(uint64_t)a3 getReparsePoint:(uint64_t)a4 .cold.1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)cmpdAddIoctl:getReparsePoint:.cold.2()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_23F849000, &_os_log_internal, v0, "%s: smb2_smb_ioctl failed <%d> \n", v1, v2, v3, v4, 2u);
}

- (void)cmpdAddIoctl:(uint64_t)a3 setReparsePoint:(uint64_t)a4 .cold.1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)cmpdAddIoctl:setReparsePoint:.cold.2()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_23F849000, &_os_log_internal, v0, "%s: smb2_smb_ioctl failed <%d> \n", v1, v2, v3, v4, 2u);
}

- (void)cmpdAddIoctl:(uint64_t)a3 pipeTransceive:(uint64_t)a4 withRecvData:(uint64_t)a5 .cold.1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)cmpdAddIoctl:pipeTransceive:withRecvData:.cold.2()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_23F849000, &_os_log_internal, v0, "%s: smb2_smb_ioctl failed <%d> \n", v1, v2, v3, v4, 2u);
}

- (void)cmpdAddQueryDirectory:(uint64_t)a3 onDir:(uint64_t)a4 returnDataIn:(uint64_t)a5 .cold.1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)cmpdAddQueryDirectory:(uint64_t)a3 onDir:(uint64_t)a4 returnDataIn:(uint64_t)a5 .cold.2(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)cmpdAddQueryDirectory:onDir:returnDataIn:.cold.3()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_23F849000, &_os_log_internal, v0, "%s: smb2_smb_query_dir failed <%d> \n", v1, v2, v3, v4, 2u);
}

- (void)cmpdAddQueryInformation:(uint64_t)a3 withStreamName:(uint64_t)a4 forFileAllInfo:(uint64_t)a5 withInputBuffer:(uint64_t)a6 withOutputBuffer:(uint64_t)a7 .cold.1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)cmpdAddQueryInformation:(uint64_t)a3 withStreamName:(uint64_t)a4 forFileAllInfo:(uint64_t)a5 withInputBuffer:(uint64_t)a6 withOutputBuffer:(uint64_t)a7 .cold.2(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)cmpdAddQueryInformation:withStreamName:forFileAllInfo:withInputBuffer:withOutputBuffer:.cold.3()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_23F849000, &_os_log_internal, v0, "%s: smb2_smb_query_info failed <%d> \n", v1, v2, v3, v4, 2u);
}

- (void)cmpdAddSetInformation:(uint64_t)a3 withInputBuffer:(uint64_t)a4 withRenameTarget:(uint64_t)a5 .cold.1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)cmpdAddSetInformation:withInputBuffer:withRenameTarget:.cold.2()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_23F849000, &_os_log_internal, v0, "%s: smb2_smb_set_info failed <%d> \n", v1, v2, v3, v4, 2u);
}

- (void)updateCmpdHdr
{
}

- (void)parseNextHeader:(uint64_t)a3 retNTStatus:(uint64_t)a4 retMdpp:(uint64_t)a5 .cold.1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)parseNextHeader:(uint64_t)a3 retNTStatus:(uint64_t)a4 retMdpp:(uint64_t)a5 .cold.2(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)parseNextHeader:(uint64_t)a3 retNTStatus:(uint64_t)a4 retMdpp:(uint64_t)a5 .cold.3(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)parseNextHeader:(id *)a1 retNTStatus:retMdpp:.cold.4(id *a1)
{
  objc_msgSend(*a1, "sr_messageid");
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_4_1(&dword_23F849000, &_os_log_internal, v1, "%s: smb2_rq_next_command failed %d id %lld\n", v2, v3, v4, v5, 2u);
}

- (void)parseNextHeader:(uint64_t)a3 retNTStatus:(uint64_t)a4 retMdpp:(uint64_t)a5 .cold.5(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)parseNextHeader:(unsigned int *)a1 retNTStatus:(uint64_t)a2 retMdpp:.cold.6(unsigned int *a1, uint64_t a2)
{
  objc_msgSend(*(id *)(a2 + 8 * *a1), "sr_messageid");
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_4_1(&dword_23F849000, &_os_log_internal, v2, "%s: md_get_mem failed %d, id %lld\n", v3, v4, v5, v6, 2u);
}

- (void)parseNextHeader:(_DWORD *)a1 retNTStatus:(uint64_t)a2 retMdpp:.cold.7(_DWORD *a1, uint64_t a2)
{
  objc_msgSend(*(id *)(a2 + 8 * (*a1 - 1)), "sr_messageid");
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_4_1(&dword_23F849000, &_os_log_internal, v2, "%s: smb2_rq_next_command failed %d id %lld\n", v3, v4, v5, v6, 2u);
}

- (void)parseNextHeader:(unsigned int *)a1 retNTStatus:(uint64_t)a2 retMdpp:(int)a3 .cold.8(unsigned int *a1, uint64_t a2, int a3)
{
  uint64_t v8 = *MEMORY[0x263EF8340];
  objc_msgSend(*(id *)(a2 + 8 * *a1), "sr_command");
  v5[0] = 136315650;
  OUTLINED_FUNCTION_2();
  __int16 v6 = v4;
  int v7 = a3;
  _os_log_error_impl(&dword_23F849000, &_os_log_internal, OS_LOG_TYPE_ERROR, "%s: Current reply doesn't match command %d != %d \n", (uint8_t *)v5, 0x18u);
}

- (void)sendCmpdRequest:(uint64_t)a3 .cold.1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)sendCmpdRequest:.cold.2()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_23F849000, &_os_log_internal, v0, "%s: smb_rq_simple_block failed <%d> \n", v1, v2, v3, v4, 2u);
}

void __27__SMBNode_sendCmpdRequest___block_invoke_cold_1(uint64_t a1)
{
  uint64_t v6 = *MEMORY[0x263EF8340];
  objc_msgSend(*(id *)(*(void *)(a1 + 32) + 8), "sr_ntstatus");
  v3[0] = 136315650;
  OUTLINED_FUNCTION_5_0();
  __int16 v4 = v1;
  int v5 = v2;
  _os_log_error_impl(&dword_23F849000, &_os_log_internal, OS_LOG_TYPE_ERROR, "%s: Reply failed <%d> ntStatus <0x%x> \n", (uint8_t *)v3, 0x18u);
}

- (void)resetCmpdRequest
{
}

@end