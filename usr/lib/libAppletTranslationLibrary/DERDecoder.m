@interface DERDecoder
+ (id)DecodeItem:(id)a3 outTag:(unint64_t *)a4 outError:(id *)a5;
+ (id)DecodeSequence:(id)a3 specification:(id)a4 unordered:(BOOL)a5 ignoreUnknownTags:(BOOL)a6 outError:(id *)a7;
+ (id)dataWithSource:(id)a3 item:(id *)a4;
@end

@implementation DERDecoder

+ (id)DecodeItem:(id)a3 outTag:(unint64_t *)a4 outError:(id *)a5
{
  uint64_t v37 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  v26[0] = [v7 bytes];
  v26[1] = [v7 length];
  unint64_t v24 = 0;
  v25[0] = 0;
  v25[1] = 0;
  uint64_t v8 = DERDecodeItemCtx((uint64_t)v26, &v24);
  if (v8)
  {
    uint64_t v9 = v8;
    v10 = ATLLogObject();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412802;
      id v32 = v7;
      __int16 v33 = 1024;
      int v34 = v9;
      __int16 v35 = 2048;
      unint64_t v36 = v24;
      _os_log_impl(&dword_1CA552000, v10, OS_LOG_TYPE_ERROR, "Failed to decode item %@ : %d (0x%llx)", buf, 0x1Cu);
    }

    id v11 = [NSString alloc];
    uint64_t v12 = [v11 initWithFormat:@"Failed to decode item %@ : %d (0x%llx)", v7, v9, v24];
    v13 = (void *)v12;
    if (a5)
    {
      id v14 = *a5;
      v15 = (void *)MEMORY[0x1E4F28C58];
      if (*a5)
      {
        uint64_t v16 = *MEMORY[0x1E4F28A50];
        v27[0] = *MEMORY[0x1E4F28568];
        v27[1] = v16;
        v28[0] = v12;
        v28[1] = v14;
        v17 = (void *)MEMORY[0x1E4F1C9E8];
        v18 = v28;
        v19 = v27;
        uint64_t v20 = 2;
      }
      else
      {
        uint64_t v29 = *MEMORY[0x1E4F28568];
        uint64_t v30 = v12;
        v17 = (void *)MEMORY[0x1E4F1C9E8];
        v18 = &v30;
        v19 = &v29;
        uint64_t v20 = 1;
      }
      v22 = [v17 dictionaryWithObjects:v18 forKeys:v19 count:v20];
      *a5 = [v15 errorWithDomain:@"ATL" code:8 userInfo:v22];
    }
    v21 = 0;
  }
  else
  {
    if (a4) {
      *a4 = v24;
    }
    v21 = +[DERDecoder dataWithSource:v7 item:v25];
  }

  return v21;
}

+ (id)DecodeSequence:(id)a3 specification:(id)a4 unordered:(BOOL)a5 ignoreUnknownTags:(BOOL)a6 outError:(id *)a7
{
  BOOL v56 = a5;
  uint64_t v83 = *MEMORY[0x1E4F143B8];
  id v58 = a3;
  id v8 = a4;
  unsigned __int16 v54 = [v8 count];
  v59 = (char *)malloc_type_calloc(v54, 0x10uLL, 0x1010040FDD9F14CuLL);
  uint64_t v9 = (char *)malloc_type_calloc(v54, 0x20uLL, 0x1000040F0CC3A19uLL);
  long long v62 = 0u;
  long long v63 = 0u;
  long long v64 = 0u;
  long long v65 = 0u;
  id v10 = v8;
  uint64_t v11 = [v10 countByEnumeratingWithState:&v62 objects:v82 count:16];
  if (v11)
  {
    uint64_t v12 = v11;
    int v13 = 0;
    uint64_t v14 = *(void *)v63;
    while (2)
    {
      for (uint64_t i = 0; i != v12; ++i)
      {
        if (*(void *)v63 != v14) {
          objc_enumerationMutation(v10);
        }
        uint64_t v16 = *(void **)(*((void *)&v62 + 1) + 8 * i);
        if ([v16 count] != 4)
        {
          unint64_t v36 = ATLLogObject();
          if (os_log_type_enabled(v36, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 138412290;
            id v71 = v16;
            _os_log_impl(&dword_1CA552000, v36, OS_LOG_TYPE_ERROR, "Invalid spec item %@", buf, 0xCu);
          }

          uint64_t v37 = [[NSString alloc] initWithFormat:@"Invalid spec item %@", v16];
          v38 = (void *)v37;
          v23 = v58;
          v22 = v59;
          if (a7)
          {
            id v39 = *a7;
            v40 = (void *)MEMORY[0x1E4F28C58];
            if (*a7)
            {
              uint64_t v41 = *MEMORY[0x1E4F28A50];
              v78[0] = *MEMORY[0x1E4F28568];
              v78[1] = v41;
              v79[0] = v37;
              v79[1] = v39;
              v42 = (void *)MEMORY[0x1E4F1C9E8];
              v43 = v79;
              v44 = v78;
              uint64_t v45 = 2;
            }
            else
            {
              uint64_t v80 = *MEMORY[0x1E4F28568];
              uint64_t v81 = v37;
              v42 = (void *)MEMORY[0x1E4F1C9E8];
              v43 = &v81;
              v44 = &v80;
              uint64_t v45 = 1;
            }
            v52 = [v42 dictionaryWithObjects:v43 forKeys:v44 count:v45];
            *a7 = [v40 errorWithDomain:@"ATL" code:8 userInfo:v52];
          }
          v28 = v10;
          goto LABEL_31;
        }
        uint64_t v17 = (v13 + i);
        v18 = &v9[32 * v17];
        *(void *)v18 = 16 * v17;
        v19 = [v16 objectAtIndexedSubscript:1];
        *((void *)v18 + 1) = [v19 unsignedLongLongValue];

        uint64_t v20 = [v16 objectAtIndexedSubscript:2];
        *((_WORD *)v18 + 8) = [v20 unsignedShortValue];

        v21 = [v16 objectAtIndexedSubscript:3];
        *((void *)v18 + 3) = [v21 unsignedLongLongValue];
      }
      uint64_t v12 = [v10 countByEnumeratingWithState:&v62 objects:v82 count:16];
      v13 += i;
      if (v12) {
        continue;
      }
      break;
    }
  }

  v60[1] = v9;
  v60[0] = "<autogen>";
  uint64_t v61 = v54;
  BYTE2(v61) = v56;
  BYTE3(v61) = a6;
  v23 = v58;
  v22 = v59;
  uint64_t v24 = DERParseSequenceSpec(v58, (uint64_t)v60, v59, 0);
  if (v24)
  {
    uint64_t v25 = v24;
    v26 = ATLLogObject();
    if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138413058;
      id v71 = v58;
      __int16 v72 = 2112;
      id v73 = v10;
      __int16 v74 = 1024;
      BOOL v75 = v56;
      __int16 v76 = 1024;
      int v77 = v25;
      _os_log_impl(&dword_1CA552000, v26, OS_LOG_TYPE_ERROR, "Failed to decode seq %@ spec %@ unord %d ret %d", buf, 0x22u);
    }

    uint64_t v27 = [[NSString alloc] initWithFormat:@"Failed to decode seq %@ spec %@ unord %d ret %d", v58, v10, v56, v25];
    v28 = (void *)v27;
    if (a7)
    {
      id v29 = *a7;
      uint64_t v30 = (void *)MEMORY[0x1E4F28C58];
      if (*a7)
      {
        uint64_t v31 = *MEMORY[0x1E4F28A50];
        v66[0] = *MEMORY[0x1E4F28568];
        v66[1] = v31;
        v67[0] = v27;
        v67[1] = v29;
        id v32 = (void *)MEMORY[0x1E4F1C9E8];
        __int16 v33 = v67;
        int v34 = v66;
        uint64_t v35 = 2;
      }
      else
      {
        uint64_t v68 = *MEMORY[0x1E4F28568];
        uint64_t v69 = v27;
        id v32 = (void *)MEMORY[0x1E4F1C9E8];
        __int16 v33 = &v69;
        int v34 = &v68;
        uint64_t v35 = 1;
      }
      v38 = [v32 dictionaryWithObjects:v33 forKeys:v34 count:v35];
      *a7 = [v30 errorWithDomain:@"ATL" code:8 userInfo:v38];
LABEL_31:
    }
    v46 = 0;
  }
  else
  {
    v46 = [MEMORY[0x1E4F1CA60] dictionaryWithCapacity:v54];
    if (v54)
    {
      uint64_t v47 = 0;
      v48 = v59;
      do
      {
        if (*((void *)v48 + 1))
        {
          v49 = [v10 objectAtIndexedSubscript:v47];
          v50 = [v49 objectAtIndexedSubscript:0];

          v51 = +[DERDecoder dataWithSource:v58 item:v48];
          [v46 setObject:v51 forKeyedSubscript:v50];
        }
        ++v47;
        v48 += 16;
      }
      while (v54 != v47);
      v22 = v59;
    }
  }
  free(v22);
  free(v9);

  return v46;
}

+ (id)dataWithSource:(id)a3 item:(id *)a4
{
  var0 = a4->var0;
  id v6 = a3;
  id v7 = [v6 subdataWithRange:&var0[-[v6 bytes]] a4->var1];

  return v7;
}

@end