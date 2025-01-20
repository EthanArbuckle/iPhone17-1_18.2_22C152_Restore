@interface BRCPCSChainEnumerator
- (BRCPCSChainEnumerator)initWithPCSChainInfo:(id)a3 clientZone:(id)a4;
- (id)error;
- (id)itemIDNeedingListing;
- (id)nextObject;
- (void)nextObject;
@end

@implementation BRCPCSChainEnumerator

- (id)itemIDNeedingListing
{
  return self->_itemIDNeedingListing;
}

- (BRCPCSChainEnumerator)initWithPCSChainInfo:(id)a3 clientZone:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v18.receiver = self;
  v18.super_class = (Class)BRCPCSChainEnumerator;
  v8 = [(BRCPCSChainEnumerator *)&v18 init];
  if (v8)
  {
    v9 = [v7 mangledID];
    v10 = +[BRCUserDefaults defaultsForMangledID:v9];
    v8->_maxPathDepth = [v10 pcsChainingMaxPathDepth];

    objc_storeStrong((id *)&v8->_clientZone, a4);
    uint64_t v11 = objc_opt_new();
    stack = v8->_stack;
    v8->_stack = (NSMutableArray *)v11;

    if ([v6 itemType] == 9)
    {
      uint64_t v13 = [v6 itemID];
      itemIDNeedingListing = v8->_itemIDNeedingListing;
      v8->_itemIDNeedingListing = (BRCItemID *)v13;

      brc_bread_crumbs();
      v15 = (BRCPCSChainBreadthEnumerator *)objc_claimAutoreleasedReturnValue();
      v16 = brc_default_log();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG)) {
        -[BRCPCSChainEnumerator initWithPCSChainInfo:clientZone:](&v8->_itemIDNeedingListing, (uint64_t)v15, v16);
      }
    }
    else
    {
      v15 = [[BRCPCSChainBreadthEnumerator alloc] initWithPCSChainInfo:v6 clientZone:v7];
      [(NSMutableArray *)v8->_stack addObject:v15];
    }
  }
  return v8;
}

- (id)nextObject
{
  uint64_t v29 = *MEMORY[0x263EF8340];
  if ([(NSMutableArray *)self->_stack count])
  {
    *(void *)&long long v3 = 138412546;
    long long v24 = v3;
    while (1)
    {
      v4 = [(NSMutableArray *)self->_stack lastObject];
      v5 = [v4 nextObject];
      id v6 = v5;
      if (!v5)
      {
        v12 = brc_bread_crumbs();
        uint64_t v13 = brc_default_log();
        if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG)) {
          -[BRCPCSChainEnumerator nextObject](v4);
        }

        [(NSMutableArray *)self->_stack removeLastObject];
        id v14 = [v4 chainInfo];
        goto LABEL_19;
      }
      if ([v5 itemType] == 9)
      {
        v15 = brc_bread_crumbs();
        v16 = brc_default_log();
        if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG)) {
          -[BRCPCSChainEnumerator nextObject](v6);
        }

        v17 = [v6 itemID];
        uint64_t v18 = 40;
        goto LABEL_21;
      }
      if ([v6 itemType])
      {
        v19 = [v6 itemID];

        if (!v19)
        {
          v22 = brc_bread_crumbs();
          v23 = brc_default_log();
          if (os_log_type_enabled(v23, OS_LOG_TYPE_FAULT)) {
            -[BRCPCSChainBreadthEnumerator nextObject]();
          }
        }
        id v14 = v6;
LABEL_19:
        uint64_t v11 = v14;
        goto LABEL_22;
      }
      if ([(NSMutableArray *)self->_stack count] >= self->_maxPathDepth) {
        break;
      }
      id v7 = brc_bread_crumbs();
      v8 = brc_default_log();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
      {
        v10 = [v6 itemID];
        *(_DWORD *)buf = v24;
        v26 = v10;
        __int16 v27 = 2112;
        v28 = v7;
        _os_log_debug_impl(&dword_23FA42000, v8, OS_LOG_TYPE_DEBUG, "[DEBUG] Enumerating pcs under new directory %@%@", buf, 0x16u);
      }
      v9 = [[BRCPCSChainBreadthEnumerator alloc] initWithPCSChainInfo:v6 clientZone:self->_clientZone];
      [(NSMutableArray *)self->_stack addObject:v9];

      if (![(NSMutableArray *)self->_stack count]) {
        goto LABEL_10;
      }
    }
    objc_msgSend(MEMORY[0x263F087E8], "brc_errorFolderHierarchyTooDeep");
    v17 = (objc_class *)objc_claimAutoreleasedReturnValue();
    uint64_t v18 = 32;
LABEL_21:
    v20 = *(Class *)((char *)&self->super.super.isa + v18);
    *(Class *)((char *)&self->super.super.isa + v18) = v17;

    uint64_t v11 = 0;
LABEL_22:
  }
  else
  {
LABEL_10:
    uint64_t v11 = 0;
  }
  return v11;
}

- (id)error
{
  return self->_error;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_itemIDNeedingListing, 0);
  objc_storeStrong((id *)&self->_error, 0);
  objc_storeStrong((id *)&self->_stack, 0);
  objc_storeStrong((id *)&self->_clientZone, 0);
}

- (void)initWithPCSChainInfo:(NSObject *)a3 clientZone:.cold.1(void *a1, uint64_t a2, NSObject *a3)
{
  *(_DWORD *)long long v3 = 138412546;
  *(void *)&v3[4] = *a1;
  *(_WORD *)&v3[12] = 2112;
  *(void *)&v3[14] = a2;
  OUTLINED_FUNCTION_1(&dword_23FA42000, a2, a3, "[DEBUG] We need to list the root item %@%@", *(void *)v3, *(void *)&v3[8], *(void *)&v3[16], *MEMORY[0x263EF8340]);
}

- (void)nextObject
{
  v1 = [a1 itemID];
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_3_1(&dword_23FA42000, v2, v3, "[DEBUG] We need to list %@%@", v4, v5, v6, v7, v8);
}

@end