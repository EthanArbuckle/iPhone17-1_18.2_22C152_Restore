@interface OSAExclaveContainer
- (BOOL)isExclaveValid;
- (NSMutableArray)notes;
- (NSMutableDictionary)addressSpaces;
- (NSMutableDictionary)layouts;
- (NSMutableDictionary)threadIdToScId;
- (NSMutableDictionary)threads;
- (OSAExclaveContainer)init;
- (id)getFramesForThread:(id)a3 usingCatalog:(id)a4;
- (kcdata_iter)parseKCdata:(kcdata_iter)a3;
- (void)appendNotesTo:(id)a3;
- (void)setIsExclaveValid:(BOOL)a3;
- (void)setNotes:(id)a3;
- (void)setThreadId:(id)a3 withScId:(id)a4;
@end

@implementation OSAExclaveContainer

- (OSAExclaveContainer)init
{
  v14.receiver = self;
  v14.super_class = (Class)OSAExclaveContainer;
  v2 = [(OSAExclaveContainer *)&v14 init];
  if (v2)
  {
    uint64_t v3 = objc_opt_new();
    addressSpaces = v2->_addressSpaces;
    v2->_addressSpaces = (NSMutableDictionary *)v3;

    uint64_t v5 = objc_opt_new();
    layouts = v2->_layouts;
    v2->_layouts = (NSMutableDictionary *)v5;

    uint64_t v7 = objc_opt_new();
    threads = v2->_threads;
    v2->_threads = (NSMutableDictionary *)v7;

    uint64_t v9 = objc_opt_new();
    threadIdToScId = v2->_threadIdToScId;
    v2->_threadIdToScId = (NSMutableDictionary *)v9;

    uint64_t v11 = objc_opt_new();
    notes = v2->_notes;
    v2->_notes = (NSMutableArray *)v11;

    v2->_isExclaveValid = 1;
  }
  return v2;
}

- (void)setThreadId:(id)a3 withScId:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [(OSAExclaveContainer *)self threadIdToScId];
  [v8 setObject:v6 forKeyedSubscript:v7];
}

- (id)getFramesForThread:(id)a3 usingCatalog:(id)a4
{
  *(void *)&v54[5] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  if ([(OSAExclaveContainer *)self isExclaveValid])
  {
    id v8 = [(OSAExclaveContainer *)self threadIdToScId];
    uint64_t v9 = [v8 objectForKeyedSubscript:v6];

    if (v9)
    {
      v10 = [(OSAExclaveContainer *)self threads];
      uint64_t v11 = [v10 objectForKeyedSubscript:v9];

      if (v11)
      {
        v48 = v9;
        id v49 = v6;
        v12 = [MEMORY[0x1E4F1CA48] array];
        v13 = [v11 stackEntries];
        uint64_t v14 = [v13 count];

        if (v14)
        {
          uint64_t v15 = 0;
          v50 = self;
          v51 = v11;
          while (1)
          {
            v16 = [v11 stackEntries];
            v17 = [v11 stackEntries];
            v18 = objc_msgSend(v16, "objectAtIndexedSubscript:", objc_msgSend(v17, "count") + ~v15);

            v19 = [(OSAExclaveContainer *)self addressSpaces];
            v20 = [v18 addressSpaceId];
            v21 = [v19 objectForKeyedSubscript:v20];

            if (!v21) {
              break;
            }
            v22 = [(OSAExclaveContainer *)self layouts];
            v23 = [v21 layoutId];
            v24 = [v22 objectForKeyedSubscript:v23];

            if (!v24)
            {
              if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
                -[OSAExclaveContainer getFramesForThread:usingCatalog:].cold.4(v53, v21, v54);
              }

              goto LABEL_25;
            }
            uint64_t v52 = v15;
            v25 = [v18 frames];
            uint64_t v26 = [v25 count];

            if (v26)
            {
              unint64_t v27 = 0;
              do
              {
                v28 = [v18 frames];
                v29 = [v28 objectAtIndexedSubscript:v27];
                uint64_t v30 = [v29 unsignedLongLongValue];
                v31 = [v24 segments];
                v32 = [v7 searchFrame:v30 in:v31 result:0];
                [v12 addObject:v32];

                ++v27;
                v33 = [v18 frames];
                unint64_t v34 = [v33 count];
              }
              while (v34 > v27);
            }

            uint64_t v11 = v51;
            uint64_t v15 = v52 + 1;
            v35 = [v51 stackEntries];
            unint64_t v36 = [v35 count];

            self = v50;
            if (v36 <= v52 + 1) {
              goto LABEL_12;
            }
          }
          if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
            -[OSAExclaveContainer getFramesForThread:usingCatalog:](v18);
          }
LABEL_25:

          id v37 = 0;
        }
        else
        {
LABEL_12:
          id v37 = v12;
        }
        uint64_t v9 = v48;
        id v6 = v49;
      }
      else
      {
        if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
          -[OSAExclaveContainer getFramesForThread:usingCatalog:]((uint64_t)v9, v40, v41, v42, v43, v44, v45, v46);
        }
        id v37 = 0;
      }
    }
    else
    {
      if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
        -[OSAExclaveContainer getFramesForThread:usingCatalog:](v6);
      }
      id v37 = 0;
    }
  }
  else
  {
    v38 = [(OSAExclaveContainer *)self notes];
    v39 = objc_msgSend(NSString, "stringWithFormat:", @"Omitted invalid exclave data for thread %llu", objc_msgSend(v6, "unsignedLongLongValue"));
    [v38 addObject:v39];

    id v37 = 0;
  }

  return v37;
}

- (kcdata_iter)parseKCdata:(kcdata_iter)a3
{
  end = (kcdata_item *)a3.end;
  kcdata_item_t item = a3.item;
  id v6 = [MEMORY[0x1E4F1CA48] array];
  kcdata_item_t v7 = item + 1;
  kcdata_item_t v8 = item;
  v57 = item;
  if (&item[1] <= end)
  {
    kcdata_item_t v8 = item;
    do
    {
      unint64_t v9 = (unint64_t)v7 + v8->size;
      if (v9 > (unint64_t)end) {
        break;
      }
      if (v8->type == -242132755) {
        goto LABEL_13;
      }
      if (v8->type == 19 && v8[1].type == 2377) {
        break;
      }
      kcdata_item_t v7 = (kcdata_item_t)(v9 + 16);
      kcdata_item_t v8 = (kcdata_item_t)v9;
    }
    while (v9 + 16 <= (unint64_t)end);
  }
  v56 = self;
  unint64_t v10 = (unint64_t)&v8[1];
  if (v8->type != -242132755 && v10 <= (unint64_t)end)
  {
    LOBYTE(flags) = 0;
    unint64_t v15 = 0x1E4F28000uLL;
    do
    {
      if (v10 + v8->size > (unint64_t)end || (flags & 1) != 0) {
        break;
      }
      LOBYTE(flags) = 0;
      int type = v8->type;
      if ((v8->type & 0xFFFFFFF0) == 0x20) {
        int type = 17;
      }
      if (type > 2378)
      {
        switch(type)
        {
          case 2379:
            v17 = [v6 top];
            if (!v17 || (v18 = v17, [v17 type] != 2378)) {
              -[OSAExclaveContainer parseKCdata:].cold.4();
            }
            v19 = [v18 data];
            v20 = [v19 objectForKeyedSubscript:&unk_1EFE25838];

            v21 = [*(id *)(v15 + 3792) numberWithUnsignedLongLong:*(void *)&v8[1].type];
            [(ExclaveThread *)v20 setSchedulingContextId:v21];
            goto LABEL_71;
          case 2381:
            v24 = [v6 top];
            if (!v24 || (v18 = v24, [v24 type] != 2380)) {
              -[OSAExclaveContainer parseKCdata:].cold.5();
            }
            v25 = [v18 data];
            v20 = [v25 objectForKeyedSubscript:&unk_1EFE25880];

            v21 = [*(id *)(v15 + 3792) numberWithUnsignedLongLong:*(void *)&v8[1].type];
            [(ExclaveThread *)v20 setAddressSpaceId:v21];
            goto LABEL_71;
          case 2384:
            uint64_t v26 = [v6 top];
            if (!v26 || (v18 = v26, [v26 type] != 2383)) {
              -[OSAExclaveContainer parseKCdata:].cold.6();
            }
            unint64_t v27 = [v18 data];
            v20 = [v27 objectForKeyedSubscript:&unk_1EFE25850];

            v28 = [*(id *)(v15 + 3792) numberWithUnsignedLongLong:*(void *)&v8[1].type];
            [(ExclaveThread *)v20 setAddressSpaceId:v28];

            v29 = *(void **)(v15 + 3792);
            uint64_t v30 = *(void *)&v8[2].type;
            goto LABEL_41;
          case 2385:
            v31 = [v6 top];
            if (!v31 || (v18 = v31, [v31 type] != 2383)) {
              -[OSAExclaveContainer parseKCdata:].cold.7();
            }
            v32 = [v18 data];
            v20 = [v32 objectForKeyedSubscript:&unk_1EFE25850];

            v21 = [NSString stringWithUTF8String:&v8[1]];
            [(ExclaveThread *)v20 setName:v21];
            goto LABEL_71;
          case 2387:
            v33 = [v6 top];
            if (!v33 || (v18 = v33, [v33 type] != 2386)) {
              -[OSAExclaveContainer parseKCdata:].cold.8();
            }
            unint64_t v34 = [v18 data];
            v20 = [v34 objectForKeyedSubscript:&unk_1EFE25868];

            v29 = *(void **)(v15 + 3792);
            uint64_t v30 = *(void *)&v8[1].type;
LABEL_41:
            v21 = objc_msgSend(v29, "numberWithUnsignedLongLong:", v30, v56);
            [(ExclaveThread *)v20 setLayoutId:v21];
            goto LABEL_71;
          default:
            goto LABEL_75;
        }
      }
      switch(type)
      {
        case 17:
          uint64_t flags = v8->flags;
          if ([v6 count])
          {
            v18 = [v6 top];
          }
          else
          {
            v18 = 0;
          }
          if (HIDWORD(flags) == 2388)
          {
            if (!v18 || [v18 type] != 2386) {
              -[OSAExclaveContainer parseKCdata:]();
            }
            uint64_t v46 = [v18 data];
            v20 = [v46 objectForKeyedSubscript:&unk_1EFE25868];

            if (flags)
            {
              kcdata_item_t v47 = v8 + 1;
              uint64_t flags = flags;
              do
              {
                v48 = [(ExclaveThread *)v20 segments];
                [v48 addImage:v47 address:*(void *)&v47[1].type size:0];

                kcdata_item_t v47 = (kcdata_item_t)((char *)v47 + 24);
                --flags;
              }
              while (flags);
            }
            v21 = [(ExclaveThread *)v20 segments];
            [v21 sortByAddressAndSetInferredSizes];
            LOBYTE(flags) = 0;
            goto LABEL_72;
          }
          if (HIDWORD(flags) == 2382)
          {
            if (!v18 || [v18 type] != 2380) {
              -[OSAExclaveContainer parseKCdata:]();
            }
            uint64_t v42 = [v18 data];
            v20 = [v42 objectForKeyedSubscript:&unk_1EFE25880];

            if (flags)
            {
              uint64_t v43 = v8 + 1;
              uint64_t flags = flags;
              do
              {
                uint64_t v44 = *(void *)&v43->type;
                uint64_t v43 = (kcdata_item *)((char *)v43 + 8);
                uint64_t v45 = objc_msgSend(*(id *)(v15 + 3792), "numberWithUnsignedLongLong:", v44, v56);
                [(ExclaveThread *)v20 addFrames:v45];

                --flags;
              }
              while (flags);
            }
            goto LABEL_73;
          }
          LOBYTE(flags) = 0;
          break;
        case 19:
          v35 = -[KCContainer initWithKCData:]([KCContainer alloc], "initWithKCData:", v8, end);
          [v6 push:v35];

          LOBYTE(flags) = 0;
          switch(v8[1].type)
          {
            case 0x94Au:
              v18 = [v6 top];
              v20 = objc_alloc_init(ExclaveThread);
              unint64_t v36 = [v18 data];
              v21 = v36;
              id v37 = v20;
              v38 = &unk_1EFE25838;
              goto LABEL_70;
            case 0x94Cu:
              v18 = [v6 top];
              v20 = objc_alloc_init(ExclaveStackEntry);
              unint64_t v36 = [v18 data];
              v21 = v36;
              id v37 = v20;
              v38 = &unk_1EFE25880;
              goto LABEL_70;
            case 0x94Fu:
              v18 = [v6 top];
              v20 = objc_alloc_init(ExclaveAddressSpace);
              unint64_t v36 = [v18 data];
              v21 = v36;
              id v37 = v20;
              v38 = &unk_1EFE25850;
              goto LABEL_70;
            case 0x952u:
              v18 = [v6 top];
              v20 = objc_alloc_init(ExclaveLayout);
              unint64_t v36 = [v18 data];
              v21 = v36;
              id v37 = v20;
              v38 = &unk_1EFE25868;
LABEL_70:
              objc_msgSend(v36, "setObject:forKeyedSubscript:", v37, v38, v56);
LABEL_71:
              LOBYTE(flags) = 0;
              goto LABEL_72;
            default:
              goto LABEL_75;
          }
        case 20:
          v18 = [v6 pop];
          uint64_t v22 = v8->flags;
          if (v22 != [v18 tag]) {
            -[OSAExclaveContainer parseKCdata:]();
          }
          int v23 = [v18 type];
          LOBYTE(flags) = v23 == 2377;
          if (v23 != 2377)
          {
            if ([v18 type] == 2380)
            {
              v20 = [v6 top];
              v39 = [v18 data];
              v21 = [v39 objectForKeyedSubscript:&unk_1EFE25880];

              uint64_t v40 = [(ExclaveThread *)v20 data];
              uint64_t v41 = [v40 objectForKeyedSubscript:&unk_1EFE25838];

              [v41 addStackEntries:v21];
              goto LABEL_84;
            }
            if ([v18 type] == 2378)
            {
              id v49 = [v18 data];
              v20 = [v49 objectForKeyedSubscript:&unk_1EFE25838];

              v50 = [(ExclaveThread *)v20 schedulingContextId];

              if (v50)
              {
                v21 = [(OSAExclaveContainer *)v56 threads];
                uint64_t v51 = [(ExclaveThread *)v20 schedulingContextId];
LABEL_83:
                uint64_t v41 = (void *)v51;
                objc_msgSend(v21, "setObject:forKeyedSubscript:", v20, v51, v56);
LABEL_84:

LABEL_72:
                unint64_t v15 = 0x1E4F28000;
              }
            }
            else if ([v18 type] == 2383)
            {
              uint64_t v52 = [v18 data];
              v20 = [v52 objectForKeyedSubscript:&unk_1EFE25850];

              v53 = [(ExclaveThread *)v20 addressSpaceId];

              if (v53)
              {
                v21 = [(OSAExclaveContainer *)v56 addressSpaces];
                uint64_t v51 = [(ExclaveThread *)v20 addressSpaceId];
                goto LABEL_83;
              }
            }
            else
            {
              if ([v18 type] != 2386) {
                break;
              }
              v54 = [v18 data];
              v20 = [v54 objectForKeyedSubscript:&unk_1EFE25868];

              v55 = [(ExclaveThread *)v20 layoutId];

              if (v55)
              {
                v21 = [(OSAExclaveContainer *)v56 layouts];
                uint64_t v51 = [(ExclaveThread *)v20 layoutId];
                goto LABEL_83;
              }
            }
LABEL_73:

            break;
          }
          v57 = v8;
          break;
        default:
          goto LABEL_75;
      }

LABEL_75:
      kcdata_item_t v8 = (kcdata_item_t)(v10 + v8->size);
      unint64_t v10 = (unint64_t)&v8[1];
    }
    while (&v8[1] <= end);
  }
LABEL_13:

  v12 = v57;
  v13 = end;
  result.end = v13;
  result.kcdata_item_t item = v12;
  return result;
}

- (void)appendNotesTo:(id)a3
{
  id v4 = a3;
  id v5 = [(OSAExclaveContainer *)self notes];
  [v4 addObjectsFromArray:v5];
}

- (NSMutableDictionary)addressSpaces
{
  return self->_addressSpaces;
}

- (NSMutableDictionary)layouts
{
  return self->_layouts;
}

- (NSMutableDictionary)threads
{
  return self->_threads;
}

- (NSMutableDictionary)threadIdToScId
{
  return self->_threadIdToScId;
}

- (NSMutableArray)notes
{
  return self->_notes;
}

- (void)setNotes:(id)a3
{
}

- (BOOL)isExclaveValid
{
  return self->_isExclaveValid;
}

- (void)setIsExclaveValid:(BOOL)a3
{
  self->_isExclaveValid = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_notes, 0);
  objc_storeStrong((id *)&self->_threadIdToScId, 0);
  objc_storeStrong((id *)&self->_threads, 0);
  objc_storeStrong((id *)&self->_layouts, 0);
  objc_storeStrong((id *)&self->_addressSpaces, 0);
}

- (void)getFramesForThread:(void *)a1 usingCatalog:.cold.1(void *a1)
{
  [a1 unsignedLongLongValue];
  OUTLINED_FUNCTION_4_0(&dword_1A7C6D000, MEMORY[0x1E4F14500], v1, "Exclave data not present for thread %llu", v2, v3, v4, v5, 0);
}

- (void)getFramesForThread:(uint64_t)a3 usingCatalog:(uint64_t)a4 .cold.2(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)getFramesForThread:(void *)a1 usingCatalog:.cold.3(void *a1)
{
  uint64_t v1 = [a1 addressSpaceId];
  OUTLINED_FUNCTION_4_0(&dword_1A7C6D000, MEMORY[0x1E4F14500], v2, "Address space info does exist for asid %@", v3, v4, v5, v6, 2u);
}

- (void)getFramesForThread:(void *)a3 usingCatalog:.cold.4(uint8_t *a1, void *a2, void *a3)
{
  uint64_t v5 = [a2 layoutId];
  *(_DWORD *)a1 = 138412290;
  *a3 = v5;
  _os_log_error_impl(&dword_1A7C6D000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "Layout info does not exist for layout id %@", a1, 0xCu);
}

- (void)parseKCdata:.cold.1()
{
  __assert_rtn("-[OSAExclaveContainer parseKCdata:]", "OSAExclave.m", 174, "kcdata_iter_container_id(kcData) == end.tag");
}

- (void)parseKCdata:.cold.2()
{
  __assert_rtn("-[OSAExclaveContainer parseKCdata:]", "OSAExclave.m", 216, "container && (container.type == STACKSHOT_KCCONTAINER_EXCLAVE_IPCSTACKENTRY)");
}

- (void)parseKCdata:.cold.3()
{
  __assert_rtn("-[OSAExclaveContainer parseKCdata:]", "OSAExclave.m", 230, "container && (container.type == STACKSHOT_KCCONTAINER_EXCLAVE_TEXTLAYOUT)");
}

- (void)parseKCdata:.cold.4()
{
  __assert_rtn("-[OSAExclaveContainer parseKCdata:]", "OSAExclave.m", 248, "container && (container.type == STACKSHOT_KCCONTAINER_EXCLAVE_SCRESULT)");
}

- (void)parseKCdata:.cold.5()
{
  __assert_rtn("-[OSAExclaveContainer parseKCdata:]", "OSAExclave.m", 262, "container && (container.type == STACKSHOT_KCCONTAINER_EXCLAVE_IPCSTACKENTRY)");
}

- (void)parseKCdata:.cold.6()
{
  __assert_rtn("-[OSAExclaveContainer parseKCdata:]", "OSAExclave.m", 276, "container && (container.type == STACKSHOT_KCCONTAINER_EXCLAVE_ADDRESSSPACE)");
}

- (void)parseKCdata:.cold.7()
{
  __assert_rtn("-[OSAExclaveContainer parseKCdata:]", "OSAExclave.m", 291, "container && (container.type == STACKSHOT_KCCONTAINER_EXCLAVE_ADDRESSSPACE)");
}

- (void)parseKCdata:.cold.8()
{
  __assert_rtn("-[OSAExclaveContainer parseKCdata:]", "OSAExclave.m", 305, "container && (container.type == STACKSHOT_KCCONTAINER_EXCLAVE_TEXTLAYOUT)");
}

@end