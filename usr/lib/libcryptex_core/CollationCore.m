@interface CollationCore
- (BOOL)appendCollationElement:(id)a3;
- (BOOL)isEmpty;
- (BOOL)removeCollationElementWithPath:(id)a3;
- (CollationCore)initWithID:(unsigned int)a3;
- (CollationCore)initWithXPC:(id)a3;
- (NSMutableSet)coll_elems;
- (OS_dispatch_queue)dq;
- (OS_os_log)log;
- (OS_xpc_object)listener;
- (id)createEndpoint;
- (id)description;
- (id)getValidPaths:(id)a3 forBundleID:(id)a4;
- (id)mountPointOfBundleID:(id)a3;
- (id)packToXPC;
- (unsigned)coll_uid;
- (void)enumerateCollationElements:(id)a3;
- (void)enumerateElements:(id)a3;
- (void)parseMessage:(id)a3;
- (void)setColl_elems:(id)a3;
- (void)setColl_uid:(unsigned int)a3;
- (void)setDq:(id)a3;
- (void)setListener:(id)a3;
- (void)setLog:(id)a3;
- (void)setupHandler;
@end

@implementation CollationCore

- (CollationCore)initWithID:(unsigned int)a3
{
  uint64_t v3 = *(void *)&a3;
  v12.receiver = self;
  v12.super_class = (Class)CollationCore;
  v4 = [(CollationCore *)&v12 init];
  if (v4)
  {
    os_log_t v5 = os_log_create("com.apple.libcryptex", "CollationCore");
    [(CollationCore *)v4 setLog:v5];

    [(CollationCore *)v4 setColl_uid:v3];
    v6 = [MEMORY[0x263EFF9C0] set];
    [(CollationCore *)v4 setColl_elems:v6];

    dispatch_queue_t v7 = dispatch_queue_create("CollationCore", 0);
    [(CollationCore *)v4 setDq:v7];

    v8 = [(CollationCore *)v4 dq];
    xpc_connection_t v9 = xpc_connection_create(0, v8);
    [(CollationCore *)v4 setListener:v9];

    v10 = [(CollationCore *)v4 listener];

    if (v10) {
      [(CollationCore *)v4 setupHandler];
    }
  }
  return v4;
}

- (CollationCore)initWithXPC:(id)a3
{
  id v4 = a3;
  os_log_t v5 = [(CollationCore *)self initWithID:xpc_dictionary_get_uint64(v4, "uid")];
  if (v5)
  {
    v6 = xpc_dictionary_get_array(v4, "collation_cryptexes");
    if (v6)
    {
      applier[0] = MEMORY[0x263EF8330];
      applier[1] = 3221225472;
      applier[2] = __29__CollationCore_initWithXPC___block_invoke;
      applier[3] = &unk_264439180;
      xpc_connection_t v9 = v5;
      xpc_array_apply(v6, applier);
    }
  }

  return v5;
}

uint64_t __29__CollationCore_initWithXPC___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v4 = a3;
  os_log_t v5 = [[CollationElement alloc] initWithXPC:v4];

  v6 = [*(id *)(a1 + 32) coll_elems];
  [v6 addObject:v5];

  return 1;
}

- (id)packToXPC
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  xpc_object_t empty = xpc_dictionary_create_empty();
  xpc_object_t v4 = xpc_array_create_empty();
  xpc_dictionary_set_int64(empty, "uid", [(CollationCore *)self coll_uid]);
  long long v14 = 0u;
  long long v15 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  os_log_t v5 = [(CollationCore *)self coll_elems];
  uint64_t v6 = [v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v13;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v13 != v8) {
          objc_enumerationMutation(v5);
        }
        v10 = [*(id *)(*((void *)&v12 + 1) + 8 * i) package];
        xpc_array_append_value(v4, v10);
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v7);
  }

  xpc_dictionary_set_value(empty, "collation_cryptexes", v4);

  return empty;
}

- (void)parseMessage:(id)a3
{
  id v4 = a3;
  xpc_object_t reply = xpc_dictionary_create_reply(v4);
  if (reply)
  {
    string = xpc_dictionary_get_string(v4, "command");
    if (string)
    {
      uint64_t v7 = (uint64_t)string;
      if (!strcmp(string, "package"))
      {
        uint64_t v8 = [(CollationCore *)self packToXPC];
        xpc_dictionary_set_value(reply, "package", v8);
      }
      else
      {
        uint64_t v8 = [(CollationCore *)self log];
        if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
          -[CollationCore parseMessage:](v7, v8);
        }
      }
    }
    xpc_dictionary_send_reply();
  }
  else if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR))
  {
    -[CollationCore parseMessage:]();
  }
}

- (void)setupHandler
{
  uint64_t v3 = [(CollationCore *)self listener];
  handler[0] = MEMORY[0x263EF8330];
  handler[1] = 3221225472;
  handler[2] = __29__CollationCore_setupHandler__block_invoke;
  handler[3] = &unk_2644391D0;
  handler[4] = self;
  xpc_connection_set_event_handler(v3, handler);

  id v4 = [(CollationCore *)self listener];
  xpc_connection_activate(v4);
}

void __29__CollationCore_setupHandler__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  id v3 = a2;
  uint64_t v4 = MEMORY[0x21D4B8200]();
  if (v4 != MEMORY[0x263EF86F0])
  {
    uint64_t v5 = v4;
    uint64_t v6 = MEMORY[0x263EF8720];
    uint64_t v7 = [*(id *)(a1 + 32) log];
    BOOL v8 = os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT);
    if (v5 == v6)
    {
      if (v8)
      {
        string = xpc_dictionary_get_string(v3, (const char *)*MEMORY[0x263EF86B0]);
        *(_DWORD *)buf = 136315138;
        uint64_t v17 = string;
        xpc_connection_t v9 = "connection error: %s";
        v10 = v7;
        uint32_t v11 = 12;
        goto LABEL_8;
      }
    }
    else if (v8)
    {
      *(_WORD *)buf = 0;
      xpc_connection_t v9 = "unrecognized connection event";
      v10 = v7;
      uint32_t v11 = 2;
LABEL_8:
      _os_log_impl(&dword_21CBD9000, v10, OS_LOG_TYPE_DEFAULT, v9, buf, v11);
    }

    goto LABEL_10;
  }
  v14[0] = MEMORY[0x263EF8330];
  v14[1] = 3221225472;
  v14[2] = __29__CollationCore_setupHandler__block_invoke_2;
  v14[3] = &unk_2644391A8;
  v14[4] = *(void *)(a1 + 32);
  id v12 = v3;
  id v15 = v12;
  xpc_connection_set_event_handler((xpc_connection_t)v12, v14);
  xpc_connection_activate((xpc_connection_t)v12);

LABEL_10:
}

void __29__CollationCore_setupHandler__block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (MEMORY[0x21D4B8200]() == MEMORY[0x263EF8708]) {
    [*(id *)(a1 + 32) parseMessage:v3];
  }
  else {
    xpc_connection_cancel(*(xpc_connection_t *)(a1 + 40));
  }
}

- (id)description
{
  v2 = NSString;
  uint64_t coll_uid = self->_coll_uid;
  uint64_t v4 = [(NSMutableSet *)self->_coll_elems description];
  uint64_t v5 = [v2 stringWithFormat:@"[Collation %d]\n%@", coll_uid, v4];

  return v5;
}

- (id)mountPointOfBundleID:(id)a3
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  id v4 = a3;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  uint64_t v5 = [(CollationCore *)self coll_elems];
  uint64_t v6 = (void *)[v5 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (!v6) {
    goto LABEL_12;
  }
  uint64_t v7 = 0;
  uint64_t v8 = *(void *)v16;
  do
  {
    for (uint64_t i = 0; i != v6; uint64_t i = (char *)i + 1)
    {
      if (*(void *)v16 != v8) {
        objc_enumerationMutation(v5);
      }
      v10 = *(void **)(*((void *)&v15 + 1) + 8 * i);
      uint32_t v11 = [v10 cle_bundle_id];
      int v12 = [v11 isEqualToString:v4];

      if (v12)
      {
        id v13 = v10;

        uint64_t v7 = v13;
      }
    }
    uint64_t v6 = (void *)[v5 countByEnumeratingWithState:&v15 objects:v19 count:16];
  }
  while (v6);

  if (v7)
  {
    uint64_t v6 = [v7 cle_mnt_path];
    uint64_t v5 = v7;
LABEL_12:

    goto LABEL_14;
  }
  uint64_t v6 = 0;
LABEL_14:

  return v6;
}

- (id)getValidPaths:(id)a3 forBundleID:(id)a4
{
  uint64_t v39 = *MEMORY[0x263EF8340];
  id v5 = a3;
  id v6 = a4;
  id v27 = objc_alloc_init(MEMORY[0x263EFF980]);
  v28 = [MEMORY[0x263F08850] defaultManager];
  v21 = v5;
  [v5 componentsSeparatedByString:@":"];
  long long v33 = 0u;
  long long v34 = 0u;
  long long v35 = 0u;
  long long v36 = 0u;
  id obj = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v25 = [obj countByEnumeratingWithState:&v33 objects:v38 count:16];
  uint64_t v7 = 0;
  if (v25)
  {
    uint64_t v23 = *(void *)v34;
    do
    {
      uint64_t v8 = 0;
      do
      {
        if (*(void *)v34 != v23) {
          objc_enumerationMutation(obj);
        }
        uint64_t v26 = v8;
        uint64_t v9 = *(void *)(*((void *)&v33 + 1) + 8 * v8);
        long long v29 = 0u;
        long long v30 = 0u;
        long long v31 = 0u;
        long long v32 = 0u;
        v10 = [(CollationCore *)self coll_elems];
        uint64_t v11 = [v10 countByEnumeratingWithState:&v29 objects:v37 count:16];
        if (v11)
        {
          uint64_t v12 = v11;
          uint64_t v13 = *(void *)v30;
          do
          {
            for (uint64_t i = 0; i != v12; ++i)
            {
              if (*(void *)v30 != v13) {
                objc_enumerationMutation(v10);
              }
              long long v15 = *(void **)(*((void *)&v29 + 1) + 8 * i);
              if (v6)
              {
                long long v16 = [*(id *)(*((void *)&v29 + 1) + 8 * i) cle_bundle_id];
                int v17 = [v6 isEqualToString:v16];

                if (!v17) {
                  continue;
                }
              }
              uint64_t v18 = [v15 copyAbsolutePath:v9];

              if ([v28 fileExistsAtPath:v18]) {
                [v27 addObject:v18];
              }
              uint64_t v7 = (void *)v18;
            }
            uint64_t v12 = [v10 countByEnumeratingWithState:&v29 objects:v37 count:16];
          }
          while (v12);
        }

        uint64_t v8 = v26 + 1;
      }
      while (v26 + 1 != v25);
      uint64_t v25 = [obj countByEnumeratingWithState:&v33 objects:v38 count:16];
    }
    while (v25);
  }
  v19 = [v27 componentsJoinedByString:@":"];

  return v19;
}

- (BOOL)appendCollationElement:(id)a3
{
  id v4 = a3;
  id v5 = [(CollationCore *)self coll_elems];
  [v5 addObject:v4];

  return 1;
}

- (BOOL)removeCollationElementWithPath:(id)a3
{
  uint64_t v24 = *MEMORY[0x263EF8340];
  id v4 = a3;
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  id v5 = [(CollationCore *)self coll_elems];
  uint64_t v6 = [v5 countByEnumeratingWithState:&v19 objects:v23 count:16];
  BOOL v7 = v6 != 0;
  if (v6)
  {
    uint64_t v8 = v6;
    BOOL v18 = v6 != 0;
    uint64_t v9 = 0;
    uint64_t v10 = *(void *)v20;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v20 != v10) {
          objc_enumerationMutation(v5);
        }
        uint64_t v12 = *(void **)(*((void *)&v19 + 1) + 8 * i);
        uint64_t v13 = [v12 cle_mnt_path];
        int v14 = [v13 isEqualToString:v4];

        if (v14)
        {
          id v15 = v12;

          uint64_t v9 = v15;
        }
      }
      uint64_t v8 = [v5 countByEnumeratingWithState:&v19 objects:v23 count:16];
    }
    while (v8);

    if (!v9)
    {
      BOOL v7 = 0;
      goto LABEL_15;
    }
    long long v16 = [(CollationCore *)self coll_elems];
    [v16 removeObject:v9];

    BOOL v7 = v18;
  }
  else
  {
    uint64_t v9 = v5;
  }

LABEL_15:
  return v7;
}

- (void)enumerateCollationElements:(id)a3
{
  id v4 = a3;
  id v5 = [(CollationCore *)self coll_elems];
  uint64_t v6 = [v5 count];

  if (v6)
  {
    BOOL v7 = [(CollationCore *)self coll_elems];
    v8[0] = MEMORY[0x263EF8330];
    v8[1] = 3221225472;
    v8[2] = __44__CollationCore_enumerateCollationElements___block_invoke;
    v8[3] = &unk_2644391F8;
    id v9 = v4;
    [v7 enumerateObjectsUsingBlock:v8];
  }
}

uint64_t __44__CollationCore_enumerateCollationElements___block_invoke(uint64_t a1, uint64_t a2, unsigned char *a3)
{
  uint64_t result = (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
  *a3 = result ^ 1;
  return result;
}

- (void)enumerateElements:(id)a3
{
  id v4 = a3;
  id v5 = [(CollationCore *)self coll_elems];
  uint64_t v6 = [v5 count];

  if (v6)
  {
    BOOL v7 = [(CollationCore *)self coll_elems];
    v8[0] = MEMORY[0x263EF8330];
    v8[1] = 3221225472;
    v8[2] = __35__CollationCore_enumerateElements___block_invoke;
    v8[3] = &unk_2644391F8;
    id v9 = v4;
    [v7 enumerateObjectsUsingBlock:v8];
  }
}

void __35__CollationCore_enumerateElements___block_invoke(uint64_t a1, void *a2, unsigned char *a3)
{
  uint64_t v4 = *(void *)(a1 + 32);
  id v5 = a2;
  uint64_t v6 = [v5 cle_scope];
  [v5 cle_bundle_id];
  id v12 = objc_claimAutoreleasedReturnValue();
  uint64_t v7 = [v12 UTF8String];
  [v5 cle_bundle_version];
  id v8 = objc_claimAutoreleasedReturnValue();
  uint64_t v9 = [v8 UTF8String];
  uint64_t v10 = [v5 cle_mnt_path];

  id v11 = v10;
  *a3 = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(v4 + 16))(v4, v6, v7, v9, [v11 UTF8String]) ^ 1;
}

- (id)createEndpoint
{
  v2 = [(CollationCore *)self listener];
  xpc_endpoint_t v3 = xpc_endpoint_create(v2);

  return v3;
}

- (BOOL)isEmpty
{
  v2 = [(CollationCore *)self coll_elems];
  BOOL v3 = [v2 count] == 0;

  return v3;
}

- (OS_os_log)log
{
  return self->_log;
}

- (void)setLog:(id)a3
{
}

- (unsigned)coll_uid
{
  return self->_coll_uid;
}

- (void)setColl_uid:(unsigned int)a3
{
  self->_uint64_t coll_uid = a3;
}

- (NSMutableSet)coll_elems
{
  return self->_coll_elems;
}

- (void)setColl_elems:(id)a3
{
}

- (OS_dispatch_queue)dq
{
  return self->_dq;
}

- (void)setDq:(id)a3
{
}

- (OS_xpc_object)listener
{
  return self->_listener;
}

- (void)setListener:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_listener, 0);
  objc_storeStrong((id *)&self->_dq, 0);
  objc_storeStrong((id *)&self->_coll_elems, 0);

  objc_storeStrong((id *)&self->_log, 0);
}

- (void)parseMessage:.cold.1()
{
  *(_WORD *)v0 = 0;
  _os_log_error_impl(&dword_21CBD9000, MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR, "no reply context", v0, 2u);
}

- (void)parseMessage:(uint64_t)a1 .cold.2(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  int v2 = 136315138;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_21CBD9000, a2, OS_LOG_TYPE_ERROR, "Unknown subcommand %s", (uint8_t *)&v2, 0xCu);
}

@end