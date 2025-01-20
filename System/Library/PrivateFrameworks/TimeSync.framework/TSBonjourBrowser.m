@interface TSBonjourBrowser
- (BOOL)startBrowsingWithError:(id *)a3;
- (BOOL)stopBrowsing;
- (NSArray)nodes;
- (TSBonjourBrowser)init;
- (TSBonjourBrowserDelegate)delegate;
- (void)addedServiceWithName:(const char *)a3 regType:(const char *)a4 domain:(const char *)a5 onInterface:(unsigned int)a6 withFlags:(unsigned int)a7;
- (void)dealloc;
- (void)removedServiceWithName:(const char *)a3 regType:(const char *)a4 domain:(const char *)a5 onInterface:(unsigned int)a6 withFlags:(unsigned int)a7;
- (void)setDelegate:(id)a3;
- (void)setNodes:(id)a3;
@end

@implementation TSBonjourBrowser

- (TSBonjourBrowser)init
{
  v8.receiver = self;
  v8.super_class = (Class)TSBonjourBrowser;
  v2 = [(TSBonjourBrowser *)&v8 init];
  if (v2)
  {
    dispatch_queue_t v3 = dispatch_queue_create("com.apple.timesync.bonjour.browse", 0);
    queue = v2->_queue;
    v2->_queue = (OS_dispatch_queue *)v3;

    v5 = (NSArray *)objc_alloc_init(MEMORY[0x1E4F1C978]);
    nodes = v2->_nodes;
    v2->_nodes = v5;
  }
  return v2;
}

- (void)addedServiceWithName:(const char *)a3 regType:(const char *)a4 domain:(const char *)a5 onInterface:(unsigned int)a6 withFlags:(unsigned int)a7
{
  uint64_t v65 = *MEMORY[0x1E4F143B8];
  *(void *)v63 = 0;
  uint64_t v64 = 0;
  if_indextoname(a6, v63);
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136316418;
    v52 = a3;
    __int16 v53 = 2080;
    v54 = a4;
    __int16 v55 = 2080;
    v56 = a5;
    __int16 v57 = 1024;
    unsigned int v58 = a7;
    __int16 v59 = 2080;
    v60 = v63;
    __int16 v61 = 1024;
    unsigned int v62 = a6;
    _os_log_impl(&dword_1BA88B000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT, "Added service with name %s type %s domain %s flags 0x%08x on interface %s (%u)\n", buf, 0x36u);
  }
  if (a6)
  {
    unsigned int v42 = a6;
    uint64_t v41 = [NSString stringWithUTF8String:v63];
    v13 = [NSString stringWithUTF8String:a3];
    v45 = [NSString stringWithUTF8String:a4];
    [NSString stringWithUTF8String:a5];
    v44 = v43 = self;
    long long v46 = 0u;
    long long v47 = 0u;
    long long v48 = 0u;
    long long v49 = 0u;
    v14 = [(TSBonjourBrowser *)self nodes];
    uint64_t v15 = [v14 countByEnumeratingWithState:&v46 objects:v50 count:16];
    if (v15)
    {
      uint64_t v16 = v15;
      uint64_t v17 = *(void *)v47;
LABEL_6:
      uint64_t v18 = 0;
      while (1)
      {
        if (*(void *)v47 != v17) {
          objc_enumerationMutation(v14);
        }
        v19 = *(void **)(*((void *)&v46 + 1) + 8 * v18);
        v20 = [v19 name];
        if (![v20 isEqualToString:v13]) {
          goto LABEL_14;
        }
        v21 = [v19 type];
        if (([v21 isEqualToString:v45] & 1) == 0) {
          break;
        }
        v22 = [v19 domain];
        char v23 = [v22 isEqualToString:v44];

        if (v23)
        {
          v27 = v19;

          v24 = v43;
          uint64_t v25 = v42;
          v26 = (void *)v41;
          if (v27) {
            goto LABEL_26;
          }
          goto LABEL_19;
        }
LABEL_15:
        if (v16 == ++v18)
        {
          uint64_t v16 = [v14 countByEnumeratingWithState:&v46 objects:v50 count:16];
          if (v16) {
            goto LABEL_6;
          }
          goto LABEL_17;
        }
      }

LABEL_14:
      goto LABEL_15;
    }
LABEL_17:

    v24 = v43;
    uint64_t v25 = v42;
    v26 = (void *)v41;
LABEL_19:
    v27 = [[TSBonjourNode alloc] initWithServiceName:v13 type:v45 andDomain:v44];
    v28 = [(TSBonjourBrowser *)v24 nodes];

    if (v28)
    {
      v29 = [(TSBonjourBrowser *)v24 nodes];
      v30 = [v29 arrayByAddingObject:v27];
    }
    else
    {
      v30 = [MEMORY[0x1E4F1C978] arrayWithObject:v27];
    }
    [(TSBonjourBrowser *)v24 setNodes:v30];
    uint64_t v31 = [(TSBonjourBrowser *)v24 delegate];
    if (v31)
    {
      v32 = (void *)v31;
      v33 = [(TSBonjourBrowser *)v24 delegate];
      char v34 = objc_opt_respondsToSelector();

      if (v34)
      {
        v35 = [(TSBonjourBrowser *)v24 delegate];
        [v35 didAddNode:v27 onBrowser:v24];
      }
    }

LABEL_26:
    [(TSBonjourNode *)v27 addedOnInterface:v25 named:v26];
    uint64_t v36 = [(TSBonjourBrowser *)v24 delegate];
    if (v36)
    {
      v37 = (void *)v36;
      v38 = [(TSBonjourBrowser *)v24 delegate];
      char v39 = objc_opt_respondsToSelector();

      if (v39)
      {
        v40 = [(TSBonjourBrowser *)v24 delegate];
        [v40 didAddInterface:v26 toNode:v27 onBrowser:v24];
      }
    }
  }
}

- (void)removedServiceWithName:(const char *)a3 regType:(const char *)a4 domain:(const char *)a5 onInterface:(unsigned int)a6 withFlags:(unsigned int)a7
{
  uint64_t v62 = *MEMORY[0x1E4F143B8];
  *(void *)v60 = 0;
  uint64_t v61 = 0;
  if_indextoname(a6, v60);
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136316418;
    long long v49 = a3;
    __int16 v50 = 2080;
    v51 = a4;
    __int16 v52 = 2080;
    __int16 v53 = a5;
    __int16 v54 = 1024;
    unsigned int v55 = a7;
    __int16 v56 = 2080;
    __int16 v57 = v60;
    __int16 v58 = 1024;
    unsigned int v59 = a6;
    _os_log_impl(&dword_1BA88B000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT, "Removed service with name %s type %s domain %s flags 0x%08x on interface %s (%u)\n", buf, 0x36u);
  }
  unsigned int v40 = a6;
  v13 = [NSString stringWithUTF8String:v60];
  v14 = [NSString stringWithUTF8String:a3];
  unsigned int v42 = [NSString stringWithUTF8String:a4];
  uint64_t v41 = [NSString stringWithUTF8String:a5];
  long long v43 = 0u;
  long long v44 = 0u;
  long long v45 = 0u;
  long long v46 = 0u;
  uint64_t v15 = [(TSBonjourBrowser *)self nodes];
  id v16 = (id)[v15 countByEnumeratingWithState:&v43 objects:v47 count:16];
  if (!v16)
  {
LABEL_25:

    goto LABEL_27;
  }
  v38 = self;
  char v39 = v13;
  uint64_t v17 = *(void *)v44;
LABEL_5:
  uint64_t v18 = 0;
  while (1)
  {
    if (*(void *)v44 != v17) {
      objc_enumerationMutation(v15);
    }
    v19 = *(void **)(*((void *)&v43 + 1) + 8 * v18);
    v20 = [v19 name];
    if (![v20 isEqualToString:v14]) {
      goto LABEL_13;
    }
    v21 = [v19 type];
    if (([v21 isEqualToString:v42] & 1) == 0)
    {

LABEL_13:
      goto LABEL_14;
    }
    v22 = [v19 domain];
    char v23 = [v22 isEqualToString:v41];

    if (v23) {
      break;
    }
LABEL_14:
    if (v16 == (id)++v18)
    {
      id v16 = (id)[v15 countByEnumeratingWithState:&v43 objects:v47 count:16];
      if (v16) {
        goto LABEL_5;
      }
      v13 = v39;
      goto LABEL_25;
    }
  }
  id v16 = v19;

  if (!v16)
  {
    v13 = v39;
    goto LABEL_27;
  }
  uint64_t v24 = [(TSBonjourBrowser *)v38 delegate];
  v13 = v39;
  if (v24)
  {
    uint64_t v25 = (void *)v24;
    v26 = [(TSBonjourBrowser *)v38 delegate];
    char v27 = objc_opt_respondsToSelector();

    if (v27)
    {
      v28 = [(TSBonjourBrowser *)v38 delegate];
      [v28 didRemoveInterface:v39 fromNode:v16 onBrowser:v38];
    }
  }
  [v16 removedFromInterface:v40 named:v39];
  v29 = [v16 interfaces];
  uint64_t v30 = [v29 count];

  if (!v30)
  {
    id v31 = objc_alloc(MEMORY[0x1E4F1CA48]);
    v32 = [(TSBonjourBrowser *)v38 nodes];
    uint64_t v15 = (void *)[v31 initWithArray:v32];

    [v15 removeObject:v16];
    [(TSBonjourBrowser *)v38 setNodes:v15];
    uint64_t v33 = [(TSBonjourBrowser *)v38 delegate];
    if (v33)
    {
      char v34 = (void *)v33;
      v35 = [(TSBonjourBrowser *)v38 delegate];
      char v36 = objc_opt_respondsToSelector();

      if (v36)
      {
        v37 = [(TSBonjourBrowser *)v38 delegate];
        [v37 didRemoveNode:v16 onBrowser:v38];
      }
    }
    goto LABEL_25;
  }
LABEL_27:
}

- (BOOL)startBrowsingWithError:(id *)a3
{
  sdRef = self->_sdRef;
  p_sdRef = &self->_sdRef;
  if (sdRef) {
    return 1;
  }
  DNSServiceErrorType v8 = DNSServiceBrowse(p_sdRef, 0x100000u, 0, "_ptp-general._udp.", 0, (DNSServiceBrowseReply)TSBBBrowseServiceReply, self);
  if (a3 && v8)
  {
    TSBonjourErrorFromErrorCode(v8);
    id v9 = (id)objc_claimAutoreleasedReturnValue();
    BOOL result = 0;
    *a3 = v9;
  }
  else
  {
    if (!v8)
    {
      DNSServiceSetDispatchQueue(self->_sdRef, (dispatch_queue_t)self->_queue);
      return 1;
    }
    return 0;
  }
  return result;
}

- (BOOL)stopBrowsing
{
  sdRef = self->_sdRef;
  if (sdRef)
  {
    DNSServiceRefDeallocate(self->_sdRef);
    self->_sdRef = 0;
  }
  return sdRef != 0;
}

- (void)dealloc
{
  sdRef = self->_sdRef;
  if (sdRef) {
    DNSServiceRefDeallocate(sdRef);
  }
  v4.receiver = self;
  v4.super_class = (Class)TSBonjourBrowser;
  [(TSBonjourBrowser *)&v4 dealloc];
}

- (TSBonjourBrowserDelegate)delegate
{
  return self->_delegate;
}

- (void)setDelegate:(id)a3
{
  self->_delegate = (TSBonjourBrowserDelegate *)a3;
}

- (NSArray)nodes
{
  return self->_nodes;
}

- (void)setNodes:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_nodes, 0);
  objc_storeStrong((id *)&self->_queue, 0);
}

@end