@interface smbSearchContext
- (BOOL)checkSearchAborted;
- (BOOL)checkSearchDone;
- (BOOL)isAborted;
- (BOOL)isFinished;
- (BOOL)treeIsConnected;
- (LiveFSVolumeSearchResultConnector)handler;
- (NSDictionary)searchCriteria;
- (NSLock)searchLock;
- (NSMutableData)replyData;
- (NSString)searchToken;
- (SMBPiston)pd;
- (id)makeStandardPath:(id)a3;
- (id)parseSearchResults:(id)a3;
- (int)doConnectMessage:(unsigned int)a3 PrimaryConnect:(BOOL)a4;
- (int)doDisconnect:(unsigned int)a3;
- (int)doFreeCursor:(unsigned int)a3;
- (int)doGetRows:(unsigned int)a3 EndOfRowSet:(BOOL *)a4;
- (int)doQueryMessage:(unsigned int)a3 PrimaryQuery:(BOOL)a4;
- (int)doQueryStatusExMessage:(unsigned int)a3 QueryStatExResults:(id)a4;
- (int)doQueryStatusMessage:(unsigned int)a3 QTStatus:(unsigned int *)a4;
- (int)doSetBindings:(unsigned int)a3;
- (int)doTreeConnect;
- (int)doTreeDisconnect;
- (int)logoutDisconnect;
- (int)parseSearchCriteria:(id)a3;
- (int)pipeClose:(unsigned int)a3;
- (int)pipeOpen:(unsigned int)a3;
- (int)pipeTransceive:(unsigned int)a3 DataIn:(id)a4 DataOut:(id)a5;
- (int)pipeWait:(unsigned int)a3;
- (int)pipeWrite:(unsigned int)a3 WriteData:(id)a4;
- (int)procCheckIndexingEnabled:(unsigned int)a3 IndexEnable:(BOOL *)a4;
- (int)procPrimaryQuery:(unsigned int)a3 QueryExResults:(id)a4;
- (int)procSecondaryQuery:(unsigned int)a3 QueryExResults:(id)a4;
- (int)searchReturnTypes;
- (pipeChannel)pipe0;
- (pipeChannel)pipe1;
- (searchResults)searchRows;
- (smbSearchContext)init;
- (smb_tree_connect_disc)treeParam;
- (unint64_t)callerID;
- (void)logConfig;
- (void)setCallerID:(unint64_t)a3;
- (void)setHandler:(id)a3;
- (void)setIsAborted:(BOOL)a3;
- (void)setIsFinished:(BOOL)a3;
- (void)setPd:(id)a3;
- (void)setPipe0:(id)a3;
- (void)setPipe1:(id)a3;
- (void)setSearchAborted;
- (void)setSearchDone;
- (void)setSearchLock:(id)a3;
- (void)setSearchReturnTypes:(int)a3;
- (void)setSearchRows:(id)a3;
- (void)setSearchToken:(id)a3;
- (void)setTreeParam:(smb_tree_connect_disc *)a3;
- (void)setWctx:(id)a3;
- (wspContext)wctx;
@end

@implementation smbSearchContext

- (smbSearchContext)init
{
  v41.receiver = self;
  v41.super_class = (Class)smbSearchContext;
  v2 = [(smbSearchContext *)&v41 init];
  if (v2)
  {
    v3 = (NSLock *)objc_alloc_init((Class)NSLock);
    searchLock = v2->_searchLock;
    v2->_searchLock = v3;

    searchToken = v2->_searchToken;
    v2->_searchToken = 0;

    searchCriteria = v2->_searchCriteria;
    v2->_searchCriteria = 0;

    handler = v2->_handler;
    v2->_handler = 0;

    wctx = v2->_wctx;
    v2->_wctx = 0;

    v2->_isAborted = 0;
    v2->_searchReturnTypes = 0;
    v2->_treeIsConnected = 0;
    searchRows = v2->_searchRows;
    v2->_searchRows = 0;

    v10 = (NSMutableData *)[objc_alloc((Class)NSMutableData) initWithCapacity:0x4000];
    replyData = v2->_replyData;
    v2->_replyData = v10;

    if (!v2->_replyData)
    {
      BOOL v24 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR);
      if (v24) {
        sub_10004CFF8(v24, v25, v26, v27, v28, v29, v30, v31);
      }
      goto LABEL_11;
    }
    v12 = [[pipeChannel alloc] initWithName:@"MsFteWds" Channel:0];
    pipe0 = v2->_pipe0;
    v2->_pipe0 = v12;

    if (!v2->_pipe0)
    {
      BOOL v32 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR);
      if (v32) {
        sub_10004D070(v32, v33, v34, v35, v36, v37, v38, v39);
      }
      goto LABEL_11;
    }
    v14 = [[pipeChannel alloc] initWithName:@"MsFteWds" Channel:1];
    pipe1 = v2->_pipe1;
    v2->_pipe1 = v14;

    if (!v2->_pipe1)
    {
      BOOL v16 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR);
      if (v16) {
        sub_10004D0AC(v16, v17, v18, v19, v20, v21, v22, v23);
      }
LABEL_11:

      return 0;
    }
  }
  return v2;
}

- (BOOL)checkSearchAborted
{
  v3 = [(smbSearchContext *)self searchLock];
  [v3 lock];

  LOBYTE(v3) = [(smbSearchContext *)self isAborted];
  v4 = [(smbSearchContext *)self searchLock];
  [v4 unlock];

  return (char)v3;
}

- (void)setSearchAborted
{
  v3 = [(smbSearchContext *)self searchLock];
  [v3 lock];

  self->_isAborted = 1;
  id v4 = [(smbSearchContext *)self searchLock];
  [v4 unlock];
}

- (BOOL)checkSearchDone
{
  v3 = [(smbSearchContext *)self searchLock];
  [v3 lock];

  LOBYTE(v3) = [(smbSearchContext *)self isFinished];
  id v4 = [(smbSearchContext *)self searchLock];
  [v4 unlock];

  return (char)v3;
}

- (void)setSearchDone
{
  v3 = [(smbSearchContext *)self searchLock];
  [v3 lock];

  self->_isFinished = 1;
  id v4 = [(smbSearchContext *)self searchLock];
  [v4 unlock];
}

- (int)parseSearchCriteria:(id)a3
{
  id v4 = a3;
  v5 = [v4 objectForKey:LISearchObjTypeReturnAll];
  if (v5)
  {
    v6 = v5;
    if (![v5 BOOLValue]) {
      goto LABEL_22;
    }
    BOOL v7 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEBUG);
    if (v7) {
      sub_10004D384(v7, v8, v9, v10, v11, v12, v13, v14);
    }
    int v15 = 3;
    goto LABEL_21;
  }
  BOOL v16 = [v4 objectForKey:LISearchObjTypeReturnDirs];
  uint64_t v17 = v16;
  if (v16 && [v16 BOOLValue])
  {
    BOOL v18 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEBUG);
    if (v18) {
      sub_10004D348(v18, v19, v20, v21, v22, v23, v24, v25);
    }
    self->_searchReturnTypes |= 1u;
  }
  uint64_t v26 = [v4 objectForKey:LISearchObjTypeReturnFiles];

  if (v26 && [v26 BOOLValue])
  {
    BOOL v27 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEBUG);
    if (v27) {
      sub_10004D30C(v27, v28, v29, v30, v31, v32, v33, v34);
    }
    self->_searchReturnTypes |= 2u;
  }
  v6 = [v4 objectForKey:LISearchObjTypeReturnLinks];

  if (v6 && [v6 BOOLValue])
  {
    BOOL v35 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEBUG);
    if (v35) {
      sub_10004D2D0(v35, v36, v37, v38, v39, v40, v41, v42);
    }
    int v15 = self->_searchReturnTypes | 3;
LABEL_21:
    self->_searchReturnTypes = v15;
  }
LABEL_22:
  if (!self->_searchReturnTypes)
  {
    BOOL v55 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR);
    if (v55) {
      sub_10004D0E8(v55, v56, v57, v58, v59, v60, v61, v62);
    }
    v53 = 0;
    v44 = 0;
    goto LABEL_30;
  }
  uint64_t v43 = [v4 objectForKey:LISearchObjXattrsInclude];
  if (!v43)
  {
    v63 = [v4 objectForKey:LISearchFileNameContains];
    if (v63)
    {
      BOOL v64 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEBUG);
      if (v64) {
        sub_10004D258(v64, v65, v66, v67, v68, v69, v70, v71);
      }
      [(wspContext *)self->_wctx setFilenameSearch:v63];
      int v72 = 1;
    }
    else
    {
      int v72 = 0;
    }
    v44 = [v4 objectForKey:LISearchFileNameEndsWith];

    if (v44)
    {
      BOOL v73 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEBUG);
      if (v73) {
        sub_10004D21C(v73, v74, v75, v76, v77, v78, v79, v80);
      }
      [(wspContext *)self->_wctx setFileExtSearch:v44];
      int v72 = 1;
    }
    v53 = [v4 objectForKey:LISearchFileContentsInclude];
    if (v53)
    {
      BOOL v81 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEBUG);
      if (v81) {
        sub_10004D1E0(v81, v82, v83, v84, v85, v86, v87, v88);
      }
      [(wspContext *)self->_wctx setContentSearch:v53];
      int v72 = 1;
    }
    uint64_t v89 = [v4 objectForKey:LISearchObjModifiedAfter];
    if (v89)
    {
      v90 = (void *)v89;
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEBUG)) {
        sub_10004D160((uint64_t)v90);
      }
      [(wspContext *)self->_wctx setModDate:v90];

      goto LABEL_49;
    }
    if (v72)
    {
LABEL_49:
      int v54 = 0;
      goto LABEL_50;
    }
    BOOL v92 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR);
    if (v92) {
      sub_10004D124(v92, v93, v94, v95, v96, v97, v98, v99);
    }
LABEL_30:
    int v54 = 22;
    goto LABEL_50;
  }
  v44 = (void *)v43;
  BOOL v45 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR);
  if (v45) {
    sub_10004D294(v45, v46, v47, v48, v49, v50, v51, v52);
  }
  v53 = 0;
  int v54 = 45;
LABEL_50:

  return v54;
}

- (int)doTreeConnect
{
  if (self->_pd)
  {
    if (self->_treeIsConnected)
    {
      BOOL v3 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR);
      if (v3) {
        sub_10004D46C(v3, v4, v5, v6, v7, v8, v9, v10);
      }
      return 37;
    }
    else
    {
      unsigned int v20 = +[smb_subr sendTreeConnect:ShareName:Param:](smb_subr, "sendTreeConnect:ShareName:Param:");
      if (v20)
      {
        int v11 = v20;
        if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
          sub_10004D3FC();
        }
      }
      else
      {
        uint64_t v21 = [(smbSearchContext *)self pipe0];
        uint64_t v22 = [(smbSearchContext *)self pd];
        [v21 setPd:v22];

        uint64_t v23 = [(smbSearchContext *)self pipe0];
        [v23 setShareID:self->_treeParam.shareId];

        uint64_t v24 = [(smbSearchContext *)self pipe1];
        uint64_t v25 = [(smbSearchContext *)self pd];
        [v24 setPd:v25];

        uint64_t v26 = [(smbSearchContext *)self pipe1];
        [v26 setShareID:self->_treeParam.shareId];

        int v11 = 0;
        self->_treeIsConnected = 1;
      }
    }
  }
  else
  {
    BOOL v12 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR);
    if (v12) {
      sub_10004D3C0(v12, v13, v14, v15, v16, v17, v18, v19);
    }
    return 22;
  }
  return v11;
}

- (int)logoutDisconnect
{
  if (self->_treeIsConnected)
  {
    [(smbSearchContext *)self doTreeDisconnect];
    return 0;
  }
  else
  {
    BOOL v3 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR);
    if (v3) {
      sub_10004D4A8(v3, v4, v5, v6, v7, v8, v9, v10);
    }
    return 57;
  }
}

- (int)doTreeDisconnect
{
  if (self->_treeIsConnected)
  {
    BOOL v3 = [(smbSearchContext *)self pipe0];
    [v3 pipeClose];

    uint64_t v4 = [(smbSearchContext *)self pipe1];
    [v4 pipeClose];

    self->_treeIsConnected = 0;
    int v5 = +[smb_subr sendTreeDisonnect:self->_pd ShareID:self->_treeParam.shareId Param:&self->_treeParam];
    if (v5 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      sub_10004D520();
    }
  }
  else
  {
    BOOL v6 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR);
    if (v6) {
      sub_10004D4E4(v6, v7, v8, v9, v10, v11, v12, v13);
    }
    return 37;
  }
  return v5;
}

- (int)procCheckIndexingEnabled:(unsigned int)a3 IndexEnable:(BOOL *)a4
{
  uint64_t v5 = *(void *)&a3;
  int v21 = 0;
  if ([(smbSearchContext *)self treeIsConnected])
  {
    id v7 = objc_alloc_init((Class)QueryStatusExResults);
    if (v7)
    {
      uint64_t v8 = v7;
      if ([(smbSearchContext *)self pipeOpen:v5])
      {
        if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
          sub_10004D994();
        }

        return 5;
      }
      unsigned int v10 = [(smbSearchContext *)self doConnectMessage:v5 PrimaryConnect:1];
      if (v10)
      {
        int v9 = v10;
        if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
          sub_10004D924();
        }
        goto LABEL_38;
      }
      id v11 = objc_alloc((Class)pidMapper);
      uint64_t v12 = [(smbSearchContext *)self wctx];
      id v13 = [v11 initWithCtx:v12];

      if (!v13)
      {
        if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
          sub_10004D600();
        }
        int v9 = 12;
        goto LABEL_37;
      }
      uint64_t v14 = [(smbSearchContext *)self wctx];
      [v14 setPidMap:v13];

      unsigned int v15 = [(smbSearchContext *)self doQueryMessage:v5 PrimaryQuery:1];
      if (v15)
      {
        int v9 = v15;
        if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
          sub_10004D8B4();
        }
        goto LABEL_37;
      }
      unsigned int v16 = [(smbSearchContext *)self doSetBindings:v5];
      if (v16)
      {
        int v9 = v16;
        if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
          sub_10004D844();
        }
        goto LABEL_36;
      }
      unsigned int v17 = [(smbSearchContext *)self doQueryStatusMessage:v5 QTStatus:&v21];
      if (v17)
      {
        int v9 = v17;
        if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
          sub_10004D7D4();
        }
        goto LABEL_36;
      }
      if ((v21 & 7) == 2)
      {
        unsigned int v18 = [(smbSearchContext *)self doQueryStatusExMessage:v5 QueryStatExResults:v8];
        if (v18)
        {
          int v9 = v18;
          if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
            sub_10004D6F0();
          }
          goto LABEL_36;
        }
        if (([v8 qStatus] & 7) == 2)
        {
          *a4 = [v8 dwRatioFinishedDenominator] != 0;
          unsigned int v20 = [(smbSearchContext *)self wctx];
          objc_msgSend(v20, "setWhereID:", objc_msgSend(v8, "whereID"));

          int v9 = 0;
          goto LABEL_36;
        }
        if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
          sub_10004D670(v8);
        }
      }
      else if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
      {
        sub_10004D760();
      }
      int v9 = 5;
LABEL_36:
      [(smbSearchContext *)self doFreeCursor:v5];
LABEL_37:
      [(smbSearchContext *)self doDisconnect:v5];

LABEL_38:
      [(smbSearchContext *)self pipeClose:v5];

      return v9;
    }
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      sub_10004D590();
    }
    return 12;
  }
  else
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      sub_10004DA04();
    }
    return 57;
  }
}

- (int)procPrimaryQuery:(unsigned int)a3 QueryExResults:(id)a4
{
  uint64_t v4 = *(void *)&a3;
  id v6 = a4;
  int v17 = 0;
  unsigned int v7 = [(smbSearchContext *)self pipeOpen:v4];
  if (!v7)
  {
    unsigned int v9 = [(smbSearchContext *)self doConnectMessage:v4 PrimaryConnect:1];
    if (v9)
    {
      int v8 = v9;
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
        sub_10004DD98();
      }
    }
    else
    {
      unsigned int v10 = [(smbSearchContext *)self pipeWait:v4];
      if (v10)
      {
        int v8 = v10;
        if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
          sub_10004DD28();
        }
      }
      else
      {
        unsigned int v11 = [(smbSearchContext *)self doQueryMessage:v4 PrimaryQuery:1];
        if (v11)
        {
          int v8 = v11;
          if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
            sub_10004DCB8();
          }
        }
        else
        {
          unsigned int v12 = [(smbSearchContext *)self doSetBindings:v4];
          if (v12)
          {
            int v8 = v12;
            if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
              sub_10004DC48();
            }
          }
          else
          {
            unsigned int v13 = [(smbSearchContext *)self doQueryStatusMessage:v4 QTStatus:&v17];
            if (v13)
            {
              int v8 = v13;
              if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
                sub_10004DBD8();
              }
            }
            else
            {
              if ((v17 & 7) == 2)
              {
                unsigned int v14 = [(smbSearchContext *)self doQueryStatusExMessage:v4 QueryStatExResults:v6];
                if (v14)
                {
                  int v8 = v14;
                  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
                    sub_10004DAF4();
                  }
                  goto LABEL_26;
                }
                if (([v6 qStatus] & 7) == 2)
                {
                  unsigned int v16 = [(smbSearchContext *)self wctx];
                  objc_msgSend(v16, "setWhereID:", objc_msgSend(v6, "whereID"));

                  int v8 = 0;
                  goto LABEL_27;
                }
                if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
                  sub_10004DA74(v6);
                }
              }
              else if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
              {
                sub_10004DB64();
              }
              int v8 = 5;
            }
          }
        }
      }
    }
LABEL_26:
    [(smbSearchContext *)self pipeClose:v4];
    goto LABEL_27;
  }
  int v8 = v7;
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
    sub_10004DE08();
  }
LABEL_27:

  return v8;
}

- (int)procSecondaryQuery:(unsigned int)a3 QueryExResults:(id)a4
{
  uint64_t v4 = *(void *)&a3;
  id v6 = a4;
  int v16 = 0;
  unsigned int v7 = [(smbSearchContext *)self pipeOpen:v4];
  if (!v7)
  {
    unsigned int v9 = [(smbSearchContext *)self doConnectMessage:v4 PrimaryConnect:0];
    if (v9)
    {
      int v8 = v9;
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
        sub_10004E19C();
      }
    }
    else
    {
      unsigned int v10 = [(smbSearchContext *)self pipeWait:v4];
      if (v10)
      {
        int v8 = v10;
        if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
          sub_10004E12C();
        }
      }
      else
      {
        unsigned int v11 = [(smbSearchContext *)self doQueryMessage:v4 PrimaryQuery:0];
        if (v11)
        {
          int v8 = v11;
          if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
            sub_10004E0BC();
          }
        }
        else
        {
          unsigned int v12 = [(smbSearchContext *)self doSetBindings:v4];
          if (v12)
          {
            int v8 = v12;
            if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
              sub_10004E04C();
            }
          }
          else
          {
            unsigned int v13 = [(smbSearchContext *)self doQueryStatusMessage:v4 QTStatus:&v16];
            if (v13)
            {
              int v8 = v13;
              if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
                sub_10004DFDC();
              }
            }
            else
            {
              if ((v16 & 7) == 2)
              {
                unsigned int v14 = [(smbSearchContext *)self doQueryStatusExMessage:v4 QueryStatExResults:v6];
                if (v14)
                {
                  int v8 = v14;
                  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
                    sub_10004DEF8();
                  }
                  goto LABEL_26;
                }
                if (([v6 qStatus] & 7) == 2)
                {
                  int v8 = 0;
                  goto LABEL_27;
                }
                if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
                  sub_10004DE78(v6);
                }
              }
              else if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
              {
                sub_10004DF68();
              }
              int v8 = 5;
            }
          }
        }
      }
    }
LABEL_26:
    [(smbSearchContext *)self pipeClose:v4];
    goto LABEL_27;
  }
  int v8 = v7;
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
    sub_10004E20C();
  }
LABEL_27:

  return v8;
}

- (int)doConnectMessage:(unsigned int)a3 PrimaryConnect:(BOOL)a4
{
  BOOL v4 = a4;
  uint64_t v5 = *(void *)&a3;
  uint64_t v27 = 0;
  id v7 = [objc_alloc((Class)NSMutableData) initWithCapacity:4096];
  int v8 = v7;
  if (v7)
  {
    [v7 setLength:4096];
    id v9 = v8;
    bzero([v9 bytes], 0x1000uLL);
    id v10 = [objc_alloc((Class)NSMutableData) initWithCapacity:128];
    [v10 setLength:128];
    id v11 = objc_alloc((Class)wspConnectIn);
    unsigned int v12 = [(smbSearchContext *)self wctx];
    if (v4)
    {
      uint64_t v13 = 0;
      uint64_t v14 = 1;
      uint64_t v15 = 0;
    }
    else
    {
      uint64_t v13 = 1;
      uint64_t v14 = 0;
      uint64_t v15 = 1;
    }
    id v16 = [v11 initWithCtx:v12 EnableRowSetEvents:v13 NoExpensiveProps:v14 UseExtendedBTypes:v15];

    if (v16)
    {
      unsigned int v17 = [v16 encodeBuffer:v9 BufferOffset:0 BytesWritten:(char *)&v27 + 4];
      if (v17)
      {
        int v18 = v17;
        if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
          sub_10004E5BC();
        }
LABEL_18:

LABEL_19:
        goto LABEL_20;
      }
      [v9 setLength:HIDWORD(v27)];
      unsigned int v19 = [(smbSearchContext *)self pipeTransceive:v5 DataIn:v9 DataOut:v10];
      if (v19)
      {
        int v18 = v19;
        if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
          sub_10004E54C();
        }
        goto LABEL_18;
      }
      if (![v10 length])
      {
        if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
          sub_10004E360();
        }

        goto LABEL_30;
      }
      id v21 = objc_alloc_init((Class)wspConnectOut);
      if (v21)
      {
        uint64_t v22 = v21;
        unsigned int v23 = [v21 decodeBuffer:v10 BufferOffset:0 BytesDecoded:&v27];
        if (v23)
        {
          int v18 = v23;
          if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
            sub_10004E4DC();
          }

          goto LABEL_19;
        }
        uint64_t v24 = [v22 whdr];
        unsigned int v25 = [v24 status];

        if (!v25)
        {
          uint64_t v26 = [(smbSearchContext *)self wctx];
          objc_msgSend(v26, "setServerVersion:", objc_msgSend(v22, "serverVersion"));

          int v18 = 0;
          goto LABEL_20;
        }
        if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
          sub_10004E440(v22);
        }

LABEL_30:
        int v18 = 5;
        goto LABEL_20;
      }
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
        sub_10004E3D0();
      }
    }
    else
    {
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
        sub_10004E2F0();
      }
    }
  }
  else if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
  {
    sub_10004E27C();
  }
  int v18 = 12;
LABEL_20:

  return v18;
}

- (int)doQueryMessage:(unsigned int)a3 PrimaryQuery:(BOOL)a4
{
  BOOL v4 = a4;
  uint64_t v5 = *(void *)&a3;
  uint64_t v30 = 0;
  id v7 = [(wspContext *)self->_wctx searchPath];
  unsigned int v8 = [v7 length];
  id v9 = [(wspContext *)self->_wctx fextPatterns];
  size_t v10 = 80 * [v9 count] + 2 * v8 + 1024;

  id v11 = [objc_alloc((Class)NSMutableData) initWithCapacity:v10];
  unsigned int v12 = v11;
  if (!v11)
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      sub_10004E62C();
    }
    goto LABEL_10;
  }
  [v11 setLength:v10];
  id v13 = v12;
  bzero([v13 bytes], v10);
  id v14 = [objc_alloc((Class)NSMutableData) initWithCapacity:v10];
  [v14 setLength:28];
  id v15 = objc_alloc((Class)wspQueryIn);
  id v16 = [(smbSearchContext *)self wctx];
  id v17 = [v15 initWithCtx:v16];

  if (!v17)
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      sub_10004E6A0();
    }

    goto LABEL_10;
  }
  if (v4) {
    unsigned int v18 = [v17 encodePrimaryQuery:v13 BufferOffset:0 BytesWritten:(char *)&v30 + 4];
  }
  else {
    unsigned int v18 = [v17 encodeSecondaryQuery:v13 BufferOffset:0 BytesWritten:(char *)&v30 + 4];
  }
  int v19 = v18;
  if (v18)
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      sub_10004E900();
    }
LABEL_18:

LABEL_19:
    goto LABEL_20;
  }
  [v13 setLength:HIDWORD(v30)];
  unsigned int v20 = [(smbSearchContext *)self pipeTransceive:v5 DataIn:v13 DataOut:v14];
  if (v20)
  {
    int v19 = v20;
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      sub_10004E890();
    }
    goto LABEL_18;
  }
  id v22 = objc_alloc_init((Class)wspQueryOut);
  if (!v22)
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      sub_10004E714();
    }

LABEL_10:
    int v19 = 12;
    goto LABEL_20;
  }
  unsigned int v23 = v22;
  unsigned int v24 = [v22 decodeBuffer:v14 BufferOffset:0 BytesDecoded:&v30];
  if (v24)
  {
    int v19 = v24;
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      sub_10004E820();
    }

    goto LABEL_19;
  }
  unsigned int v25 = [v23 whdr];
  unsigned int v26 = [v25 status];

  if (v26)
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      sub_10004E784(v23);
    }

    int v19 = 5;
  }
  else
  {
    uint64_t v27 = [(smbSearchContext *)self wctx];
    objc_msgSend(v27, "setTrueSequential:", objc_msgSend(v23, "trueSequential"));

    uint64_t v28 = [(smbSearchContext *)self wctx];
    objc_msgSend(v28, "setWorkID:", objc_msgSend(v23, "workID"));

    uint64_t v29 = [(smbSearchContext *)self wctx];
    objc_msgSend(v29, "setCursor:", objc_msgSend(v23, "cursor"));

    int v19 = 0;
  }
LABEL_20:

  return v19;
}

- (int)doQueryStatusMessage:(unsigned int)a3 QTStatus:(unsigned int *)a4
{
  uint64_t v5 = *(void *)&a3;
  uint64_t v24 = 0;
  id v7 = [objc_alloc((Class)NSMutableData) initWithCapacity:128];
  unsigned int v8 = v7;
  if (!v7)
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      sub_10004E970();
    }
    goto LABEL_11;
  }
  [v7 setLength:128];
  id v9 = v8;
  size_t v10 = [v9 bytes];
  _OWORD *v10 = 0u;
  v10[1] = 0u;
  v10[2] = 0u;
  v10[3] = 0u;
  v10[4] = 0u;
  v10[5] = 0u;
  v10[6] = 0u;
  v10[7] = 0u;
  id v11 = [objc_alloc((Class)NSMutableData) initWithCapacity:128];
  [v11 setLength:128];
  id v12 = objc_alloc((Class)wspQueryStatusIn);
  id v13 = [(smbSearchContext *)self wctx];
  id v14 = [v12 initWithCtx:v13];

  if (!v14)
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      sub_10004E9E0();
    }

    goto LABEL_11;
  }
  unsigned int v15 = [v14 encodeBuffer:v9 BufferOffset:0 BytesWritten:(char *)&v24 + 4];
  if (v15)
  {
    int v16 = v15;
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      sub_10004EC30();
    }
LABEL_15:

LABEL_16:
    goto LABEL_17;
  }
  [v9 setLength:HIDWORD(v24)];
  unsigned int v17 = [(smbSearchContext *)self pipeTransceive:v5 DataIn:v9 DataOut:v11];
  if (v17)
  {
    int v16 = v17;
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      sub_10004EBC0();
    }
    goto LABEL_15;
  }
  id v19 = objc_alloc_init((Class)wspQueryStatusOut);
  if (!v19)
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      sub_10004EA50();
    }

LABEL_11:
    int v16 = 12;
    goto LABEL_17;
  }
  unsigned int v20 = v19;
  unsigned int v21 = [v19 decodeBuffer:v11 BufferOffset:0 BytesDecoded:&v24];
  if (v21)
  {
    int v16 = v21;
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      sub_10004EB50();
    }

    goto LABEL_16;
  }
  id v22 = [v20 whdr];
  unsigned int v23 = [v22 status];

  if (v23)
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      sub_10004EAC0(v20);
    }

    int v16 = 5;
  }
  else
  {
    *a4 = [v20 qStatus];

    int v16 = 0;
  }
LABEL_17:

  return v16;
}

- (int)doQueryStatusExMessage:(unsigned int)a3 QueryStatExResults:(id)a4
{
  uint64_t v4 = *(void *)&a3;
  id v6 = a4;
  uint64_t v24 = 0;
  id v7 = [objc_alloc((Class)NSMutableData) initWithCapacity:128];
  unsigned int v8 = v7;
  if (!v7)
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      sub_10004ECA0();
    }
    id v11 = 0;
    goto LABEL_11;
  }
  [v7 setLength:128];
  id v9 = v8;
  size_t v10 = [v9 bytes];
  _OWORD *v10 = 0u;
  v10[1] = 0u;
  v10[2] = 0u;
  v10[3] = 0u;
  v10[4] = 0u;
  v10[5] = 0u;
  v10[6] = 0u;
  v10[7] = 0u;
  id v11 = [objc_alloc((Class)NSMutableData) initWithCapacity:56];
  [v11 setLength:56];
  id v12 = objc_alloc((Class)wspQueryStatusExIn);
  id v13 = [(smbSearchContext *)self wctx];
  id v14 = [v12 initWithCtx:v13];

  if (!v14)
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      sub_10004ED10();
    }
LABEL_11:
    unsigned int v17 = 0;
    id v14 = 0;
LABEL_12:
    int v16 = 12;
    goto LABEL_17;
  }
  unsigned int v15 = [v14 encodeBuffer:v9 BufferOffset:0 BytesWritten:(char *)&v24 + 4];
  if (v15)
  {
    int v16 = v15;
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      sub_10004EF60();
    }
LABEL_16:
    unsigned int v17 = 0;
    goto LABEL_17;
  }
  [v9 setLength:HIDWORD(v24)];
  unsigned int v18 = [(smbSearchContext *)self pipeTransceive:v4 DataIn:v9 DataOut:v11];
  if (v18)
  {
    int v16 = v18;
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      sub_10004EEF0();
    }
    goto LABEL_16;
  }
  id v20 = objc_alloc_init((Class)wspQueryStatusExOut);
  if (!v20)
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      sub_10004ED80();
    }
    unsigned int v17 = 0;
    goto LABEL_12;
  }
  unsigned int v17 = v20;
  unsigned int v21 = [v20 decodeBuffer:v11 BufferOffset:0 BytesDecoded:&v24];
  if (v21)
  {
    int v16 = v21;
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      sub_10004EE80();
    }
  }
  else
  {
    id v22 = [v17 whdr];
    unsigned int v23 = [v22 status];

    if (v23)
    {
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
        sub_10004EDF0(v17);
      }
      int v16 = 5;
    }
    else
    {
      if (v6)
      {
        objc_msgSend(v6, "setQStatus:", objc_msgSend(v17, "qStatus"));
        objc_msgSend(v6, "setCFilteredDocuments:", objc_msgSend(v17, "cFilteredDocuments"));
        objc_msgSend(v6, "setCDocumentsToFilter:", objc_msgSend(v17, "cDocumentsToFilter"));
        objc_msgSend(v6, "setDwRatioFinishedDenominator:", objc_msgSend(v17, "dwRatioFinishedDenominator"));
        objc_msgSend(v6, "setDwRatioFinishedNumerator:", objc_msgSend(v17, "dwRatioFinishedNumerator"));
        objc_msgSend(v6, "setRowsetBookMark:", objc_msgSend(v17, "rowsetBookMark"));
        objc_msgSend(v6, "setCRowsTotal:", objc_msgSend(v17, "cRowsTotal"));
        objc_msgSend(v6, "setMaxRank:", objc_msgSend(v17, "maxRank"));
        objc_msgSend(v6, "setCResultsFound:", objc_msgSend(v17, "cResultsFound"));
        objc_msgSend(v6, "setWhereID:", objc_msgSend(v17, "whereID"));
      }
      int v16 = 0;
    }
  }
LABEL_17:

  return v16;
}

- (int)doSetBindings:(unsigned int)a3
{
  uint64_t v3 = *(void *)&a3;
  uint64_t v19 = 0;
  id v5 = [objc_alloc((Class)NSMutableData) initWithCapacity:1024];
  id v6 = v5;
  if (!v5)
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      sub_10004EFD0();
    }
    id v8 = 0;
    goto LABEL_11;
  }
  [v5 setLength:1024];
  id v7 = v6;
  bzero([v7 bytes], 0x400uLL);
  id v8 = [objc_alloc((Class)NSMutableData) initWithCapacity:128];
  [v8 setLength:128];
  id v9 = objc_alloc((Class)wspSetBindingsIn);
  size_t v10 = [(smbSearchContext *)self wctx];
  id v11 = [v9 initWithCtx:v10];

  if (!v11)
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      sub_10004F040();
    }
LABEL_11:
    id v14 = 0;
    id v11 = 0;
LABEL_12:
    int v13 = 12;
    goto LABEL_17;
  }
  unsigned int v12 = [v11 encodeBuffer:v7 BufferOffset:0 BytesWritten:(char *)&v19 + 4];
  if (v12)
  {
    int v13 = v12;
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      sub_10004F300();
    }
LABEL_16:
    id v14 = 0;
    goto LABEL_17;
  }
  [v7 setLength:HIDWORD(v19)];
  unsigned int v15 = [(smbSearchContext *)self pipeTransceive:v3 DataIn:v7 DataOut:v8];
  if (v15)
  {
    int v13 = v15;
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      sub_10004F290();
    }
    goto LABEL_16;
  }
  id v17 = objc_alloc_init((Class)wspHeader);
  if (!v17)
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      sub_10004F0B0();
    }
    id v14 = 0;
    goto LABEL_12;
  }
  id v14 = v17;
  unsigned int v18 = [v17 decodeBuffer:v8 BufferOffset:0 BytesDecoded:&v19];
  if (v18)
  {
    int v13 = v18;
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      sub_10004F220();
    }
  }
  else
  {
    if ([v14 msgid] == 208)
    {
      if (![v14 status])
      {
        int v13 = 0;
        goto LABEL_17;
      }
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
        sub_10004F120(v14);
      }
    }
    else if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
    {
      sub_10004F1A0(v14);
    }
    int v13 = 5;
  }
LABEL_17:

  return v13;
}

- (int)doFreeCursor:(unsigned int)a3
{
  uint64_t v3 = *(void *)&a3;
  uint64_t v19 = 0;
  id v5 = [objc_alloc((Class)NSMutableData) initWithCapacity:32];
  id v6 = v5;
  if (!v5)
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      sub_10004F370();
    }
    id v9 = 0;
    goto LABEL_11;
  }
  [v5 setLength:32];
  id v7 = v6;
  id v8 = [v7 bytes];
  *id v8 = 0u;
  v8[1] = 0u;
  id v9 = [objc_alloc((Class)NSMutableData) initWithCapacity:32];
  [v9 setLength:32];
  id v10 = objc_alloc((Class)wspFreeCursorIn);
  id v11 = [(smbSearchContext *)self wctx];
  id v12 = objc_msgSend(v10, "initWithCursor:", objc_msgSend(v11, "cursor"));

  if (!v12)
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      sub_10004F3E0();
    }
LABEL_11:
    unsigned int v15 = 0;
    id v12 = 0;
LABEL_12:
    int v14 = 12;
    goto LABEL_17;
  }
  unsigned int v13 = [v12 encodeBuffer:v7 BufferOffset:0 BytesWritten:(char *)&v19 + 4];
  if (v13)
  {
    int v14 = v13;
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      sub_10004F5A0();
    }
LABEL_16:
    unsigned int v15 = 0;
    goto LABEL_17;
  }
  [v7 setLength:HIDWORD(v19)];
  unsigned int v16 = [(smbSearchContext *)self pipeTransceive:v3 DataIn:v7 DataOut:v9];
  if (v16)
  {
    int v14 = v16;
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      sub_10004F530();
    }
    goto LABEL_16;
  }
  id v18 = objc_alloc_init((Class)wspFreeCursorOut);
  if (!v18)
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      sub_10004F450();
    }
    unsigned int v15 = 0;
    goto LABEL_12;
  }
  unsigned int v15 = v18;
  int v14 = [v18 decodeBuffer:v9 BufferOffset:0 BytesDecoded:&v19];
  if (v14 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
    sub_10004F4C0();
  }
LABEL_17:

  return v14;
}

- (int)doDisconnect:(unsigned int)a3
{
  uint64_t v3 = *(void *)&a3;
  unsigned int v15 = 0;
  id v5 = [objc_alloc((Class)NSMutableData) initWithCapacity:32];
  id v6 = v5;
  if (!v5)
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      sub_10004F610();
    }
    id v9 = 0;
    goto LABEL_11;
  }
  [v5 setLength:32];
  id v7 = v6;
  id v8 = [v7 bytes];
  *id v8 = 0u;
  v8[1] = 0u;
  id v9 = [objc_alloc((Class)NSMutableData) initWithCapacity:32];
  [v9 setLength:32];
  id v10 = objc_alloc_init((Class)wspDisconnectIn);
  if (!v10)
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      sub_10004F680();
    }
LABEL_11:
    id v11 = 0;
    int v13 = 12;
    goto LABEL_12;
  }
  id v11 = v10;
  unsigned int v12 = [v10 encodeBuffer:v7 BufferOffset:0 BytesWritten:&v15];
  if (v12)
  {
    int v13 = v12;
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      sub_10004F760();
    }
  }
  else
  {
    [v7 setLength:v15];
    int v13 = [(smbSearchContext *)self pipeWrite:v3 WriteData:v7];
    if (v13 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      sub_10004F6F0();
    }
  }
LABEL_12:

  return v13;
}

- (int)doGetRows:(unsigned int)a3 EndOfRowSet:(BOOL *)a4
{
  uint64_t v5 = *(void *)&a3;
  uint64_t v38 = 0;
  id v7 = [objc_alloc((Class)NSMutableData) initWithCapacity:128];
  id v8 = v7;
  if (!v7)
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      sub_10004F7D0();
    }
    id v11 = 0;
    goto LABEL_11;
  }
  [v7 setLength:128];
  id v9 = v8;
  id v10 = [v9 bytes];
  _OWORD *v10 = 0u;
  v10[1] = 0u;
  v10[2] = 0u;
  v10[3] = 0u;
  v10[4] = 0u;
  v10[5] = 0u;
  v10[6] = 0u;
  v10[7] = 0u;
  id v11 = [(smbSearchContext *)self replyData];
  [v11 setLength:0x4000];
  id v12 = objc_alloc((Class)wspGetRows);
  int v13 = [(smbSearchContext *)self wctx];
  id v14 = [v12 initWithCtx:v13];

  if (!v14)
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      sub_10004F840();
    }
LABEL_11:
    id v17 = 0;
    id v14 = 0;
LABEL_12:
    LODWORD(v16) = 12;
    goto LABEL_17;
  }
  unsigned int v15 = [v14 encodeBuffer:v9 BufferOffset:0 BytesWritten:(char *)&v38 + 4];
  if (v15)
  {
    LODWORD(v16) = v15;
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      sub_10004FB38();
    }
LABEL_16:
    id v17 = 0;
    goto LABEL_17;
  }
  [v9 setLength:HIDWORD(v38)];
  unsigned int v18 = [(smbSearchContext *)self pipeTransceive:v5 DataIn:v9 DataOut:v11];
  if (v18)
  {
    LODWORD(v16) = v18;
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      sub_10004FAC8();
    }
    goto LABEL_16;
  }
  id v20 = objc_alloc((Class)wspGetRowsOut);
  unsigned int v21 = [(smbSearchContext *)self wctx];
  id v17 = [v20 initWithCtx:v21];

  if (!v17)
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      sub_10004F840();
    }
    id v17 = 0;
    goto LABEL_12;
  }
  unsigned int v22 = [v17 decodeBuffer:v11 BufferOffset:0 BytesWritten:&v38];
  if (v22)
  {
    LODWORD(v16) = v22;
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      sub_10004FA58();
    }
    goto LABEL_17;
  }
  unsigned int v23 = [v17 whdr];
  unsigned int v24 = [v23 status];

  if (!v24)
  {
    unsigned int v26 = [v17 results];
    uint64_t v27 = [v26 rows];
    id v28 = [v27 count];

    BOOL v29 = v28 == 0;
    goto LABEL_36;
  }
  unsigned int v25 = [v17 whdr];
  if ([v25 status] == 265926)
  {

LABEL_30:
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEBUG)) {
      sub_10004F92C(v17);
    }
    uint64_t v31 = [v17 results];
    uint64_t v32 = [v31 rows];
    id v33 = [v32 count];

    if (v33) {
      goto LABEL_37;
    }
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEBUG)) {
      sub_10004F8B0();
    }
    BOOL v29 = 1;
LABEL_36:
    *a4 = v29;
LABEL_37:
    uint64_t v34 = [v17 results];
    BOOL v35 = [v34 rows];
    id v16 = [v35 count];

    if (v16)
    {
      uint64_t v36 = [v17 results];
      [(smbSearchContext *)self setSearchRows:v36];

      LODWORD(v16) = 0;
    }
    goto LABEL_17;
  }
  uint64_t v30 = [v17 whdr];
  unsigned int v37 = [v30 status];

  if (v37 == 265933) {
    goto LABEL_30;
  }
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
    sub_10004F9C8(v17);
  }
  LODWORD(v16) = 5;
LABEL_17:

  return (int)v16;
}

- (int)pipeOpen:(unsigned int)a3
{
  if (a3 == 1)
  {
    uint64_t v3 = [(smbSearchContext *)self pipe1];
    goto LABEL_5;
  }
  if (!a3)
  {
    uint64_t v3 = [(smbSearchContext *)self pipe0];
LABEL_5:
    uint64_t v4 = v3;
    int v5 = [v3 pipeOpen];

    return v5;
  }
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
    sub_10004FBA8();
  }
  return 22;
}

- (int)pipeWait:(unsigned int)a3
{
  if (self->_treeIsConnected)
  {
    if (a3 == 1)
    {
      uint64_t v3 = [(smbSearchContext *)self pipe1];
      goto LABEL_9;
    }
    if (!a3)
    {
      uint64_t v3 = [(smbSearchContext *)self pipe0];
LABEL_9:
      int v5 = v3;
      int v6 = [v3 pipeWait];

      return v6;
    }
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      sub_10004FC88();
    }
    return 22;
  }
  else
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      sub_10004FC18();
    }
    return 9;
  }
}

- (int)pipeTransceive:(unsigned int)a3 DataIn:(id)a4 DataOut:(id)a5
{
  id v8 = a4;
  id v9 = a5;
  if (self->_treeIsConnected)
  {
    if (a3 == 1)
    {
      id v10 = [(smbSearchContext *)self pipe1];
      goto LABEL_9;
    }
    if (!a3)
    {
      id v10 = [(smbSearchContext *)self pipe0];
LABEL_9:
      id v12 = v10;
      int v11 = [v10 pipeTransceive:v8 DataOut:v9];

      goto LABEL_13;
    }
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      sub_10004FD68();
    }
    int v11 = 22;
  }
  else
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      sub_10004FCF8();
    }
    int v11 = 9;
  }
LABEL_13:

  return v11;
}

- (int)pipeWrite:(unsigned int)a3 WriteData:(id)a4
{
  id v6 = a4;
  if (self->_treeIsConnected)
  {
    if (a3 == 1)
    {
      id v7 = [(smbSearchContext *)self pipe1];
      goto LABEL_9;
    }
    if (!a3)
    {
      id v7 = [(smbSearchContext *)self pipe0];
LABEL_9:
      id v9 = v7;
      int v8 = [v7 pipeWrite:v6];

      goto LABEL_13;
    }
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      sub_10004FE48();
    }
    int v8 = 22;
  }
  else
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      sub_10004FDD8();
    }
    int v8 = 9;
  }
LABEL_13:

  return v8;
}

- (int)pipeClose:(unsigned int)a3
{
  if (self->_treeIsConnected)
  {
    if (a3 == 1)
    {
      uint64_t v3 = [(smbSearchContext *)self pipe1];
      goto LABEL_9;
    }
    if (!a3)
    {
      uint64_t v3 = [(smbSearchContext *)self pipe0];
LABEL_9:
      int v5 = v3;
      int v6 = [v3 pipeClose];

      return v6;
    }
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      sub_10004FF28();
    }
    return 22;
  }
  else
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      sub_10004FEB8();
    }
    return 9;
  }
}

- (id)parseSearchResults:(id)a3
{
  id v3 = a3;
  long long v75 = 0u;
  long long v76 = 0u;
  long long v77 = 0u;
  long long v70 = 0u;
  long long v71 = 0u;
  long long v72 = 0u;
  long long v73 = 0u;
  uint64_t v74 = 0;
  id v4 = objc_alloc_init((Class)NSMutableArray);
  if (v4)
  {
    long long v68 = 0u;
    long long v69 = 0u;
    long long v66 = 0u;
    long long v67 = 0u;
    id obj = [v3 rows];
    id v65 = [obj countByEnumeratingWithState:&v66 objects:v105 count:16];
    if (v65)
    {
      id v52 = v3;
      int v54 = 0;
      int v5 = 0;
      int v6 = 0;
      id v7 = 0;
      id v8 = 0;
      uint64_t v59 = 0;
      uint64_t v62 = 0;
      uint64_t v64 = *(void *)v67;
      v53 = v4;
      uint64_t v51 = &v94;
      while (1)
      {
        id v9 = 0;
        int v58 = v5;
        do
        {
          id v10 = v8;
          if (*(void *)v67 != v64) {
            objc_enumerationMutation(obj);
          }
          int v11 = v5 + v9;
          id v8 = *(id *)(*((void *)&v66 + 1) + 8 * (void)v9);

          long long v75 = 0u;
          long long v76 = 0u;
          long long v77 = 0u;
          long long v70 = 0u;
          long long v71 = 0u;
          long long v72 = 0u;
          long long v73 = 0u;
          uint64_t v74 = 0;
          int v13 = [v8 columns];
          id v14 = +[NSNumber numberWithUnsignedInt:12];
          unsigned int v15 = [v13 objectForKey:v14];

          if (v15)
          {
            id v16 = [v15 propValue];

            if ([v16 vType] == 31)
            {
              uint64_t v17 = [v16 strValue];

              if (!v17)
              {
                if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
                  sub_10004FFD8(&v101, v11, v102);
                }
                uint64_t v62 = 0;
                int v6 = v16;
                id v7 = v15;
                goto LABEL_69;
              }
              uint64_t v18 = [(smbSearchContext *)self makeStandardPath:v17];

              if (!v18)
              {
                if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
                {
                  *(_DWORD *)buf = 67109378;
                  *(_DWORD *)&buf[4] = v11;
                  *(_WORD *)&buf[8] = 2112;
                  *(void *)&buf[10] = v17;
                  _os_log_error_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR, "parseSearchResults: row: %u, unable to standardize path: %@\n", buf, 0x12u);
                }
                uint64_t v59 = 0;
                int v6 = v16;
                id v7 = v15;
                goto LABEL_68;
              }
              if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEBUG))
              {
                *(_DWORD *)buf = 67109378;
                *(_DWORD *)&buf[4] = v11;
                *(_WORD *)&buf[8] = 2112;
                *(void *)&buf[10] = v18;
                _os_log_debug_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEBUG, "Parsing row: %u, path: %@\n", buf, 0x12u);
              }
              v63 = (void *)v18;
              uint64_t v19 = objc_msgSend(v8, "columns", v51);
              id v20 = +[NSNumber numberWithUnsignedInt:13];
              id v7 = [v19 objectForKey:v20];

              if (!v7)
              {
                if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
                  sub_100050018(&v99, v11, v100);
                }
                id v7 = 0;
                int v6 = v16;
                goto LABEL_67;
              }
              int v6 = [v7 propValue];

              if ([v6 vType] != 19)
              {
                if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEBUG))
                {
                  unsigned int v27 = [v6 vType];
                  *(_DWORD *)buf = 67109376;
                  *(_DWORD *)&buf[4] = v11;
                  *(_WORD *)&buf[8] = 1024;
                  *(_DWORD *)&buf[10] = v27;
                  _os_log_debug_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEBUG, "parseSearchResults: row: %u, SystemFileAttributes property unexpected vType: 0x%x\n", buf, 0xEu);
                }
                goto LABEL_67;
              }
              unsigned __int16 v21 = (unsigned __int16)[v6 uint4Val];
              if ((v21 & 0x10) != 0)
              {
                if ([(smbSearchContext *)self searchReturnTypes])
                {
                  int v30 = 2;
                  goto LABEL_44;
                }
                if (!os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEBUG)) {
                  goto LABEL_67;
                }
                unsigned int v28 = [(smbSearchContext *)self searchReturnTypes];
                *(_DWORD *)buf = 67109634;
                *(_DWORD *)&buf[4] = v11;
                *(_WORD *)&buf[8] = 1024;
                *(_DWORD *)&buf[10] = v28;
                *(_WORD *)&buf[14] = 2112;
                unsigned int v25 = v63;
                *(void *)&buf[16] = v63;
                unsigned int v26 = "parseSearchResults: row: %u ReturnTypes: 0x%x, filter out folder type: %@\n";
              }
              else
              {
                unsigned __int16 v22 = v21;
                unsigned __int8 v23 = [(smbSearchContext *)self searchReturnTypes];
                if ((v22 & 0x400) == 0)
                {
                  if ((v23 & 2) == 0)
                  {
                    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEBUG))
                    {
                      unsigned int v24 = [(smbSearchContext *)self searchReturnTypes];
                      *(_DWORD *)buf = 67109634;
                      *(_DWORD *)&buf[4] = v11;
                      *(_WORD *)&buf[8] = 1024;
                      *(_DWORD *)&buf[10] = v24;
                      *(_WORD *)&buf[14] = 2112;
                      unsigned int v25 = v63;
                      *(void *)&buf[16] = v63;
                      unsigned int v26 = "parseSearchResults: row: %u ReturnTypes: 0x%x, filter out file type: %@\n";
                      goto LABEL_58;
                    }
LABEL_67:
                    uint64_t v59 = v63;
LABEL_68:
                    uint64_t v62 = (void *)v17;
LABEL_69:
                    int v5 = v58;
                    goto LABEL_70;
                  }
                  int v30 = 1;
LABEL_44:
                  int v60 = v30;
                  uint64_t v31 = [v8 columns];
                  uint64_t v32 = +[NSNumber numberWithUnsignedInt:1];
                  id v33 = [v31 objectForKey:v32];

                  if (!v33)
                  {
                    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
                      sub_100050058(&v97, v11, v98);
                    }
                    id v7 = 0;
                    goto LABEL_67;
                  }
                  uint64_t v34 = [v33 propValue];

                  if ([v34 vType] != 64)
                  {
                    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
                    {
                      unsigned int v45 = [v34 vType];
                      *(_DWORD *)buf = 67109376;
                      *(_DWORD *)&buf[4] = v11;
                      *(_WORD *)&buf[8] = 1024;
                      *(_DWORD *)&buf[10] = v45;
                      _os_log_error_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR, "parseSearchResults: row: %u, SystemDateModified property unexpected vType: 0x%x\n", buf, 0xEu);
                    }
                    int v6 = v34;
                    id v7 = v33;
                    goto LABEL_67;
                  }
                  id v35 = [v34 timeSpec];
                  uint64_t v55 = v36;
                  id v56 = v35;
                  unsigned int v37 = [v8 columns];
                  uint64_t v38 = +[NSNumber numberWithUnsignedInt:15];
                  id v7 = [v37 objectForKey:v38];

                  if (!v7)
                  {
                    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
                      sub_100050098(&v95, v11, v96);
                    }
                    id v7 = 0;
                    int v6 = v34;
                    goto LABEL_67;
                  }
                  int v6 = [v7 propValue];

                  if ([v6 vType] != 64)
                  {
                    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
                    {
                      unsigned int v44 = [v6 vType];
                      *(_DWORD *)buf = 67109376;
                      *(_DWORD *)&buf[4] = v11;
                      *(_WORD *)&buf[8] = 1024;
                      *(_DWORD *)&buf[10] = v44;
                      _os_log_error_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR, "parseSearchResults: row: %u, SystemDateAccessed property unexpected vType: 0x%x\n", buf, 0xEu);
                    }
                    goto LABEL_67;
                  }
                  id v39 = [v6 timeSpec];
                  uint64_t v41 = v40;
                  uint64_t v42 = objc_alloc_init(searchResultItem);

                  if (!v42)
                  {
                    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
                      sub_1000500D8(&v93, v11, v51);
                    }
                    int v54 = 0;
                    goto LABEL_67;
                  }
                  *(_OWORD *)buf = xmmword_10006C3C0;
                  *(void *)&buf[16] = 0;
                  int v79 = v60;
                  int v80 = 511;
                  long long v81 = v75;
                  long long v82 = v76;
                  long long v83 = v77;
                  id v84 = v39;
                  uint64_t v85 = v41;
                  id v86 = v56;
                  uint64_t v87 = v55;
                  uint64_t v92 = v74;
                  long long v90 = v72;
                  long long v91 = v73;
                  long long v88 = v70;
                  long long v89 = v71;
                  [(searchResultItem *)v42 setLiAttr:buf];
                  [(searchResultItem *)v42 setPath:v63];
                  [v53 addObject:v42];
                  int v54 = v42;
                  uint64_t v59 = v63;
                  goto LABEL_68;
                }
                if ((v23 & 3) != 0)
                {
                  int v30 = 3;
                  goto LABEL_44;
                }
                if (!os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEBUG)) {
                  goto LABEL_67;
                }
                unsigned int v43 = [(smbSearchContext *)self searchReturnTypes];
                *(_DWORD *)buf = 67109634;
                *(_DWORD *)&buf[4] = v11;
                *(_WORD *)&buf[8] = 1024;
                *(_DWORD *)&buf[10] = v43;
                *(_WORD *)&buf[14] = 2112;
                unsigned int v25 = v63;
                *(void *)&buf[16] = v63;
                unsigned int v26 = "parseSearchResults: row: %u ReturnTypes: 0x%x, filter out reparse type: %@\n";
              }
LABEL_58:
              _os_log_debug_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEBUG, v26, buf, 0x18u);
              uint64_t v59 = v25;
              goto LABEL_68;
            }
            if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
            {
              unsigned int v29 = [v16 vType];
              *(_DWORD *)buf = 67109376;
              *(_DWORD *)&buf[4] = v5 + v9;
              *(_WORD *)&buf[8] = 1024;
              *(_DWORD *)&buf[10] = v29;
              _os_log_error_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR, "parseSearchResults: row: %u, Path property unexpected vType: 0x%x\n", buf, 0xEu);
            }
            int v6 = v16;
            id v7 = v15;
          }
          else
          {
            if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
              sub_10004FF98(&v103, v5 + v9, &v104);
            }
            id v7 = 0;
          }
LABEL_70:
          id v9 = (char *)v9 + 1;
        }
        while (v65 != v9);
        v5 += (int)v9;
        id v65 = [obj countByEnumeratingWithState:&v66 objects:v105 count:16];
        if (!v65)
        {

          id v3 = v52;
          id v4 = v53;
          uint64_t v46 = v54;
          uint64_t v47 = v59;
          uint64_t v48 = v62;
          goto LABEL_75;
        }
      }
    }
    uint64_t v48 = 0;
    uint64_t v47 = 0;
    id v7 = 0;
    int v6 = 0;
    uint64_t v46 = 0;
LABEL_75:

    if ([v4 count])
    {
      id v49 = v4;
      goto LABEL_78;
    }
  }
  else
  {
    uint64_t v48 = 0;
    uint64_t v47 = 0;
    id v7 = 0;
    int v6 = 0;
    uint64_t v46 = 0;
  }
  id v49 = 0;
LABEL_78:

  return v49;
}

- (id)makeStandardPath:(id)a3
{
  id v3 = [a3 pathComponents];
  if ((unint64_t)[v3 count] < 4)
  {
    int v5 = 0;
    id v4 = 0;
  }
  else
  {
    id v4 = 0;
    int v5 = 0;
    unsigned int v6 = 4;
    uint64_t v7 = 3;
    do
    {
      id v8 = v5;
      int v5 = [v3 objectAtIndex:v7];

      if (v4)
      {
        id v9 = [v4 stringByAppendingString:@"/"];

        id v4 = [v9 stringByAppendingString:v5];
      }
      else
      {
        id v4 = v5;
      }
      uint64_t v7 = v6;
    }
    while ((unint64_t)[v3 count] > v6++);
  }

  return v4;
}

- (void)logConfig
{
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEBUG)) {
    sub_10005019C((uint64_t)self);
  }
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEBUG)) {
    sub_100050118((uint64_t)self);
  }
  [(wspContext *)self->_wctx logContents];
}

- (NSLock)searchLock
{
  return (NSLock *)objc_getProperty(self, a2, 16, 1);
}

- (void)setSearchLock:(id)a3
{
}

- (NSString)searchToken
{
  return (NSString *)objc_getProperty(self, a2, 24, 1);
}

- (void)setSearchToken:(id)a3
{
}

- (NSDictionary)searchCriteria
{
  return (NSDictionary *)objc_getProperty(self, a2, 32, 1);
}

- (unint64_t)callerID
{
  return self->_callerID;
}

- (void)setCallerID:(unint64_t)a3
{
  self->_callerID = a3;
}

- (LiveFSVolumeSearchResultConnector)handler
{
  return (LiveFSVolumeSearchResultConnector *)objc_getProperty(self, a2, 48, 1);
}

- (void)setHandler:(id)a3
{
}

- (wspContext)wctx
{
  return (wspContext *)objc_getProperty(self, a2, 56, 1);
}

- (void)setWctx:(id)a3
{
}

- (BOOL)isAborted
{
  return self->_isAborted;
}

- (void)setIsAborted:(BOOL)a3
{
  self->_isAborted = a3;
}

- (BOOL)isFinished
{
  return self->_isFinished;
}

- (void)setIsFinished:(BOOL)a3
{
  self->_isFinished = a3;
}

- (NSMutableData)replyData
{
  return (NSMutableData *)objc_getProperty(self, a2, 64, 1);
}

- (searchResults)searchRows
{
  return (searchResults *)objc_getProperty(self, a2, 72, 1);
}

- (void)setSearchRows:(id)a3
{
}

- (SMBPiston)pd
{
  return (SMBPiston *)objc_getProperty(self, a2, 80, 1);
}

- (void)setPd:(id)a3
{
}

- (smb_tree_connect_disc)treeParam
{
  objc_copyStruct(retstr, &self->_treeParam, 24, 1, 0);
  return result;
}

- (void)setTreeParam:(smb_tree_connect_disc *)a3
{
}

- (BOOL)treeIsConnected
{
  return self->_treeIsConnected;
}

- (pipeChannel)pipe0
{
  return (pipeChannel *)objc_getProperty(self, a2, 88, 1);
}

- (void)setPipe0:(id)a3
{
}

- (pipeChannel)pipe1
{
  return (pipeChannel *)objc_getProperty(self, a2, 96, 1);
}

- (void)setPipe1:(id)a3
{
}

- (int)searchReturnTypes
{
  return self->_searchReturnTypes;
}

- (void)setSearchReturnTypes:(int)a3
{
  self->_searchReturnTypes = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_pipe1, 0);
  objc_storeStrong((id *)&self->_pipe0, 0);
  objc_storeStrong((id *)&self->_pd, 0);
  objc_storeStrong((id *)&self->_searchRows, 0);
  objc_storeStrong((id *)&self->_replyData, 0);
  objc_storeStrong((id *)&self->_wctx, 0);
  objc_storeStrong((id *)&self->_handler, 0);
  objc_storeStrong((id *)&self->_searchCriteria, 0);
  objc_storeStrong((id *)&self->_searchToken, 0);
  objc_storeStrong((id *)&self->_searchLock, 0);
}

@end