@interface NETrie
- (BOOL)search:(const char *)a3 length:(int)a4;
- (BOOL)searchWithString:(id)a3;
- (NETrie)initWithDomains:(id)a3 prefixCount:(int)a4 reverse:(BOOL)a5 partialSearchAllowed:(BOOL)a6 partialSearchTerminator:(char)a7 extra_bytes:(unint64_t)a8;
- (ne_trie)trie;
- (void)dealloc;
- (void)setTrie:(ne_trie *)a3;
@end

@implementation NETrie

- (void)setTrie:(ne_trie *)a3
{
}

- (ne_trie)trie
{
  objc_copyStruct(retstr, &self->_trie, 112, 1, 0);
  return result;
}

- (BOOL)searchWithString:(id)a3
{
  id v3 = a3;
  v4 = v3;
  if (v3 && [v3 length])
  {
    id v5 = v4;
    [v5 UTF8String];
    [v5 length];
    BOOL v6 = ne_trie_search() != 0xFFFF;
  }
  else
  {
    BOOL v6 = 0;
  }

  return v6;
}

- (BOOL)search:(const char *)a3 length:(int)a4
{
  BOOL v4 = 0;
  if (a3 && a4) {
    return ne_trie_search() != 0xFFFF;
  }
  return v4;
}

- (void)dealloc
{
  id v3 = ne_log_obj();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)buf = 0;
    _os_log_debug_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEBUG, "NETrie - dealloc", buf, 2u);
  }

  if (self->_trie.memory)
  {
    BOOL v4 = ne_log_obj();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)buf = 0;
      _os_log_debug_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEBUG, "NETrie - dealloc - free memory", buf, 2u);
    }

    free(self->_trie.memory);
  }
  *(_OWORD *)&self->_trie.child_maps_mem_size = 0u;
  *(_OWORD *)&self->_trie.is_mmap = 0u;
  *(_OWORD *)&self->_trie.nodes_count = 0u;
  *(_OWORD *)&self->_trie.trie_memory_size = 0u;
  *(_OWORD *)&self->_trie.nodes = 0u;
  *(_OWORD *)&self->_trie.bytes = 0u;
  *(_OWORD *)&self->_trie.magic = 0u;
  v5.receiver = self;
  v5.super_class = (Class)NETrie;
  [(NETrie *)&v5 dealloc];
}

- (NETrie)initWithDomains:(id)a3 prefixCount:(int)a4 reverse:(BOOL)a5 partialSearchAllowed:(BOOL)a6 partialSearchTerminator:(char)a7 extra_bytes:(unint64_t)a8
{
  id v13 = a3;
  v48.receiver = self;
  v48.super_class = (Class)NETrie;
  v14 = [(NETrie *)&v48 init];
  if (!v14)
  {
LABEL_32:
    v22 = v14;
    goto LABEL_33;
  }
  if (v13 && [v13 count])
  {
    long long v46 = 0u;
    long long v47 = 0u;
    long long v44 = 0u;
    long long v45 = 0u;
    id v38 = v13;
    id v15 = v13;
    id v16 = [v15 countByEnumeratingWithState:&v44 objects:v58 count:16];
    if (v16)
    {
      id v17 = v16;
      char v39 = a7;
      int v18 = 0;
      uint64_t v19 = *(void *)v45;
      do
      {
        for (i = 0; i != v17; i = (char *)i + 1)
        {
          if (*(void *)v45 != v19) {
            objc_enumerationMutation(v15);
          }
          v18 += [*(id *)(*((void *)&v44 + 1) + 8 * i) length];
        }
        id v17 = [v15 countByEnumeratingWithState:&v44 objects:v58 count:16];
      }
      while (v17);
      a7 = v39;
    }

    if (!a4) {
      [v15 count];
    }
    [v15 count];
    if (ne_trie_init())
    {
      v14->_reverse = a5;
      v14->_partialSearchAllowed = a6;
      v14->_partialSearchTerminator = a7;
      long long v42 = 0u;
      long long v43 = 0u;
      long long v40 = 0u;
      long long v41 = 0u;
      id v23 = v15;
      id v24 = [v23 countByEnumeratingWithState:&v40 objects:v57 count:16];
      if (v24)
      {
        id v25 = v24;
        uint64_t v26 = *(void *)v41;
        do
        {
          for (j = 0; j != v25; j = (char *)j + 1)
          {
            if (*(void *)v41 != v26) {
              objc_enumerationMutation(v23);
            }
            id v28 = *(id *)(*((void *)&v40 + 1) + 8 * (void)j);
            [v28 UTF8String];
            [v28 length];
            if (ne_trie_insert() == 0xFFFF)
            {
              v29 = ne_log_obj();
              if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
              {
                *(_DWORD *)buf = 138412290;
                *(void *)v50 = v28;
                _os_log_error_impl((void *)&_mh_execute_header, v29, OS_LOG_TYPE_ERROR, "NETrie - failed insert for %@", buf, 0xCu);
              }
            }
          }
          id v25 = [v23 countByEnumeratingWithState:&v40 objects:v57 count:16];
        }
        while (v25);
      }

      v30 = ne_log_obj();
      if (os_log_type_enabled(v30, OS_LOG_TYPE_DEBUG))
      {
        unsigned int v33 = [v23 count];
        int nodes_free_next = v14->_trie.nodes_free_next;
        int child_maps_free_next = v14->_trie.child_maps_free_next;
        int bytes_free_next = v14->_trie.bytes_free_next;
        int root = v14->_trie.root;
        *(_DWORD *)buf = 67110144;
        *(_DWORD *)v50 = v33;
        *(_WORD *)&v50[4] = 1024;
        *(_DWORD *)&v50[6] = nodes_free_next;
        __int16 v51 = 1024;
        int v52 = child_maps_free_next;
        __int16 v53 = 1024;
        int v54 = bytes_free_next;
        __int16 v55 = 1024;
        int v56 = root;
        _os_log_debug_impl((void *)&_mh_execute_header, v30, OS_LOG_TYPE_DEBUG, "NETrie - initialized with %d domains (Nodes used = %d, child maps used = %d, bytes used = %d, int root = %d)", buf, 0x20u);
      }

      id v13 = v38;
      goto LABEL_32;
    }
    v32 = ne_log_obj();
    if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl((void *)&_mh_execute_header, v32, OS_LOG_TYPE_ERROR, "NETrie - failed init", buf, 2u);
    }

    v22 = 0;
    id v13 = v38;
  }
  else
  {
    v21 = ne_log_obj();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_ERROR, "NETrie - No domain", buf, 2u);
    }

    v22 = 0;
  }
LABEL_33:

  return v22;
}

@end