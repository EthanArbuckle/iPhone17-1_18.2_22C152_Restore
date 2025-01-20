@interface DreamworksReaderContext
+ (id)readAllFiles:(id)a3 debug:(BOOL)a4 error:(id *)a5;
- (NSData)filePurseInfo;
- (NSMutableArray)filePurse;
- (NSMutableArray)fileTrans;
- (NSNumber)balance;
- (NSNumber)filePurseMaxRecCount;
- (id)readAll:(id)a3 debug:(BOOL)a4 error:(id *)a5;
- (id)readBalance:(id)a3 error:(id *)a4;
- (id)readRecord:(id)a3 sfi:(unsigned __int8)a4 index:(unsigned __int8)a5 error:(id *)a6;
- (id)readTransSN:(id)a3 error:(id *)a4;
- (void)dumpAllFiles;
- (void)setBalance:(id)a3;
- (void)setFilePurse:(id)a3;
- (void)setFilePurseInfo:(id)a3;
- (void)setFilePurseMaxRecCount:(id)a3;
- (void)setFileTrans:(id)a3;
@end

@implementation DreamworksReaderContext

+ (id)readAllFiles:(id)a3 debug:(BOOL)a4 error:(id *)a5
{
  BOOL v6 = a4;
  id v7 = a3;
  v8 = objc_alloc_init(DreamworksReaderContext);
  v9 = [(DreamworksReaderContext *)v8 readAll:v7 debug:v6 error:a5];

  return v9;
}

- (id)readAll:(id)a3 debug:(BOOL)a4 error:(id *)a5
{
  v79[1] = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  char v67 = 0;
  int v66 = 61824;
  v9 = [v8 transceiveBytesAndCheckSW:&v66 length:5 error:a5];
  v10 = v9;
  if (v9 && (unint64_t)[v9 length] > 0x8F)
  {
    unsigned int v21 = *(unsigned __int16 *)([v10 bytes] + 52);
    uint64_t v22 = __rev16(v21);
    v23 = [NSNumber numberWithUnsignedInteger:v22];
    [(DreamworksReaderContext *)self setFilePurseMaxRecCount:v23];

    v13 = [(DreamworksReaderContext *)self readBalance:v8 error:a5];
    if (v13)
    {
      [(DreamworksReaderContext *)self setBalance:v13];
      v24 = [(DreamworksReaderContext *)self readRecord:v8 sfi:2 index:1 error:a5];
      if ([v24 length] == 51)
      {
        BOOL v61 = a4;
        v62 = v24;
        v63 = v13;
        [(DreamworksReaderContext *)self setFilePurseInfo:v24];
        v25 = [MEMORY[0x1E4F1CA48] arrayWithCapacity:v22];
        [(DreamworksReaderContext *)self setFilePurse:v25];

        if (v21)
        {
          unsigned __int8 v26 = 1;
          do
          {
            v27 = [(DreamworksReaderContext *)self readRecord:v8 sfi:4 index:v26 error:a5];
            if ([v27 length] == 46 && (objc_msgSend(v27, "isAll00") & 1) == 0)
            {
              v28 = [(DreamworksReaderContext *)self filePurse];
              v29 = +[DreamworksPurseRecord recordNumber:v26 recordData:v27];
              [v28 addObject:v29];
            }
            ++v26;
          }
          while (v22 >= v26);
        }
        v30 = [(DreamworksReaderContext *)self filePurse];
        +[DreamworksPurseRecord adjustRecords:v30];

        v64 = [(DreamworksReaderContext *)self readTransSN:v8 error:a5];
        unint64_t v31 = [v64 count];
        v32 = [MEMORY[0x1E4F1CA48] arrayWithCapacity:v31];
        [(DreamworksReaderContext *)self setFileTrans:v32];

        if (v31)
        {
          uint64_t v33 = 1;
          for (i = 1; i <= v31; uint64_t v33 = ++i)
          {
            v35 = [(DreamworksReaderContext *)self readRecord:v8 sfi:3 index:i error:a5];
            if ([v35 length] == 52 && (objc_msgSend(v35, "isAll00") & 1) == 0)
            {
              v36 = [(DreamworksReaderContext *)self fileTrans];
              v37 = [v64 objectAtIndexedSubscript:v33 - 1];
              v38 = +[DreamworksTransRecord recordNumber:recordData:seqnum:](DreamworksTransRecord, "recordNumber:recordData:seqnum:", i, v35, [v37 unsignedIntValue]);
              [v36 addObject:v38];
            }
          }
        }
        if (v61) {
          [(DreamworksReaderContext *)self dumpAllFiles];
        }
        v39 = self;
        v24 = v62;
        v13 = v63;
        v40 = v64;
      }
      else
      {
        v50 = ATLLogObject();
        if (os_log_type_enabled(v50, OS_LOG_TYPE_ERROR))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_1CA552000, v50, OS_LOG_TYPE_ERROR, "Failed to read EF_Purse_Info", buf, 2u);
        }

        uint64_t v51 = [[NSString alloc] initWithFormat:@"Failed to read EF_Purse_Info"];
        v40 = (void *)v51;
        if (a5)
        {
          id v52 = *a5;
          v53 = (void *)MEMORY[0x1E4F28C58];
          if (*a5)
          {
            uint64_t v54 = *MEMORY[0x1E4F28A50];
            v68[0] = *MEMORY[0x1E4F28568];
            v68[1] = v54;
            v69[0] = v51;
            v69[1] = v52;
            v55 = (void *)MEMORY[0x1E4F1C9E8];
            v56 = v69;
            v57 = v68;
            uint64_t v58 = 2;
          }
          else
          {
            uint64_t v70 = *MEMORY[0x1E4F28568];
            uint64_t v71 = v51;
            v55 = (void *)MEMORY[0x1E4F1C9E8];
            v56 = &v71;
            v57 = &v70;
            uint64_t v58 = 1;
          }
          v59 = [v55 dictionaryWithObjects:v56 forKeys:v57 count:v58];
          *a5 = [v53 errorWithDomain:@"ATL" code:5 userInfo:v59];
        }
        v39 = 0;
      }
    }
    else
    {
      v41 = ATLLogObject();
      if (os_log_type_enabled(v41, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1CA552000, v41, OS_LOG_TYPE_ERROR, "Failed to get balance", buf, 2u);
      }

      uint64_t v42 = [[NSString alloc] initWithFormat:@"Failed to get balance"];
      v24 = (void *)v42;
      if (!a5)
      {
        v39 = 0;
        goto LABEL_45;
      }
      id v43 = *a5;
      v44 = (void *)MEMORY[0x1E4F28C58];
      if (*a5)
      {
        uint64_t v45 = *MEMORY[0x1E4F28A50];
        v72[0] = *MEMORY[0x1E4F28568];
        v72[1] = v45;
        v73[0] = v42;
        v73[1] = v43;
        v46 = (void *)MEMORY[0x1E4F1C9E8];
        v47 = v73;
        v48 = v72;
        uint64_t v49 = 2;
      }
      else
      {
        uint64_t v74 = *MEMORY[0x1E4F28568];
        uint64_t v75 = v42;
        v46 = (void *)MEMORY[0x1E4F1C9E8];
        v47 = &v75;
        v48 = &v74;
        uint64_t v49 = 1;
      }
      v40 = [v46 dictionaryWithObjects:v47 forKeys:v48 count:v49];
      [v44 errorWithDomain:@"ATL" code:5 userInfo:v40];
      v39 = 0;
      *a5 = (id)objc_claimAutoreleasedReturnValue();
    }

    goto LABEL_45;
  }
  v11 = ATLLogObject();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1CA552000, v11, OS_LOG_TYPE_ERROR, "Failed to get correct signed state", buf, 2u);
  }

  uint64_t v12 = [[NSString alloc] initWithFormat:@"Failed to get correct signed state"];
  v13 = (void *)v12;
  if (!a5)
  {
    v39 = 0;
    goto LABEL_46;
  }
  id v14 = *a5;
  v15 = (void *)MEMORY[0x1E4F28C58];
  if (*a5)
  {
    uint64_t v16 = *MEMORY[0x1E4F28A50];
    v76[0] = *MEMORY[0x1E4F28568];
    v76[1] = v16;
    v77[0] = v12;
    v77[1] = v14;
    v17 = (void *)MEMORY[0x1E4F1C9E8];
    v18 = v77;
    v19 = v76;
    uint64_t v20 = 2;
  }
  else
  {
    uint64_t v78 = *MEMORY[0x1E4F28568];
    v79[0] = v12;
    v17 = (void *)MEMORY[0x1E4F1C9E8];
    v18 = v79;
    v19 = &v78;
    uint64_t v20 = 1;
  }
  v24 = [v17 dictionaryWithObjects:v18 forKeys:v19 count:v20];
  [v15 errorWithDomain:@"ATL" code:5 userInfo:v24];
  v39 = 0;
  *a5 = (id)objc_claimAutoreleasedReturnValue();
LABEL_45:

LABEL_46:

  return v39;
}

- (void)dumpAllFiles
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  v3 = ATLLogObject();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v15 = 0;
    _os_log_impl(&dword_1CA552000, v3, OS_LOG_TYPE_INFO, "--- Dreamworks DUMP BEGIN --", v15, 2u);
  }

  v4 = ATLLogObject();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    v5 = [(DreamworksReaderContext *)self balance];
    *(_DWORD *)v15 = 138412290;
    *(void *)&v15[4] = v5;
    _os_log_impl(&dword_1CA552000, v4, OS_LOG_TYPE_INFO, "    Balance File %@", v15, 0xCu);
  }
  id v6 = [(DreamworksReaderContext *)self filePurseInfo];
  uint64_t v7 = [v6 bytes];
  id v8 = [(DreamworksReaderContext *)self filePurseInfo];
  uint64_t v9 = [v8 length];
  LogBinary(OS_LOG_TYPE_DEFAULT, (uint64_t)"-[DreamworksReaderContext dumpAllFiles]", 109, v7, v9, @"    SFI 0x02:", v10, v11, *(uint64_t *)v15);

  uint64_t v12 = [(DreamworksReaderContext *)self filePurse];
  [v12 enumerateObjectsUsingBlock:&__block_literal_global_2];

  v13 = [(DreamworksReaderContext *)self fileTrans];
  [v13 enumerateObjectsUsingBlock:&__block_literal_global_578];

  id v14 = ATLLogObject();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v15 = 0;
    _os_log_impl(&dword_1CA552000, v14, OS_LOG_TYPE_INFO, "--- Dreamworks DUMP END --", v15, 2u);
  }
}

void __39__DreamworksReaderContext_dumpAllFiles__block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  id v9 = [v2 data];
  uint64_t v3 = [v9 bytes];
  v4 = [v2 data];
  uint64_t v5 = [v4 length];
  unsigned int v6 = [v2 number];
  [v2 seqnum];

  LogBinary(OS_LOG_TYPE_DEFAULT, (uint64_t)"-[DreamworksReaderContext dumpAllFiles]_block_invoke", 112, v3, v5, @"    Purse file record %u (SN 0x%X)", v7, v8, v6);
}

void __39__DreamworksReaderContext_dumpAllFiles__block_invoke_2(uint64_t a1, void *a2)
{
  id v2 = a2;
  id v9 = [v2 data];
  uint64_t v3 = [v9 bytes];
  v4 = [v2 data];
  uint64_t v5 = [v4 length];
  unsigned int v6 = [v2 number];
  [v2 seqnum];

  LogBinary(OS_LOG_TYPE_DEFAULT, (uint64_t)"-[DreamworksReaderContext dumpAllFiles]_block_invoke_2", 115, v3, v5, @"    Trans file record %u (SN 0x%X)", v7, v8, v6);
}

- (id)readRecord:(id)a3 sfi:(unsigned __int8)a4 index:(unsigned __int8)a5 error:(id *)a6
{
  uint64_t v7 = a4;
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  if (a4 < 0x1Fu)
  {
    *(_WORD *)buf = -19968;
    buf[2] = a5;
    buf[3] = (8 * a4) | 4;
    LOBYTE(v26) = 0;
    v18 = [a3 transceiveBytesAndCheckSW:buf length:5 inArray:&unk_1F24E2638 error:a6];
  }
  else
  {
    uint64_t v8 = ATLLogObject();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 67109120;
      int v26 = v7;
      _os_log_impl(&dword_1CA552000, v8, OS_LOG_TYPE_ERROR, "Invalid SFI for read record 0x%x", buf, 8u);
    }

    uint64_t v9 = [[NSString alloc] initWithFormat:@"Invalid SFI for read record 0x%x", v7];
    uint64_t v10 = (void *)v9;
    if (a6)
    {
      id v11 = *a6;
      uint64_t v12 = (void *)MEMORY[0x1E4F28C58];
      if (*a6)
      {
        uint64_t v13 = *MEMORY[0x1E4F28A50];
        v21[0] = *MEMORY[0x1E4F28568];
        v21[1] = v13;
        v22[0] = v9;
        v22[1] = v11;
        id v14 = (void *)MEMORY[0x1E4F1C9E8];
        v15 = v22;
        uint64_t v16 = v21;
        uint64_t v17 = 2;
      }
      else
      {
        uint64_t v23 = *MEMORY[0x1E4F28568];
        uint64_t v24 = v9;
        id v14 = (void *)MEMORY[0x1E4F1C9E8];
        v15 = &v24;
        uint64_t v16 = &v23;
        uint64_t v17 = 1;
      }
      v19 = [v14 dictionaryWithObjects:v15 forKeys:v16 count:v17];
      *a6 = [v12 errorWithDomain:@"ATL" code:8 userInfo:v19];
    }
    v18 = 0;
  }

  return v18;
}

- (id)readTransSN:(id)a3 error:(id *)a4
{
  char v12 = 0;
  int v11 = 130688;
  v4 = [a3 transceiveBytesAndCheckSW:&v11 length:5 error:a4];
  unint64_t v5 = [v4 length];
  if (v5 >= 4)
  {
    unint64_t v7 = v5;
    unsigned int v6 = [MEMORY[0x1E4F1CA48] arrayWithCapacity:v5 >> 2];
    for (unint64_t i = 0; i < v7; i += 4)
    {
      uint64_t v9 = [NSNumber numberWithUnsignedInt:[v4 u32BE:i]];
      [v6 addObject:v9];
    }
  }
  else
  {
    unsigned int v6 = 0;
  }

  return v6;
}

- (id)readBalance:(id)a3 error:(id *)a4
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  unint64_t v5 = [a3 transceiveBytesAndCheckSW:&readBalance_error__getBalanceCmd length:5 error:a4];
  unsigned int v6 = v5;
  if (v5 && [v5 length] == 4)
  {
    unint64_t v7 = [NSNumber numberWithUnsignedInt:bswap32(*(_DWORD *)[v6 bytes])];
  }
  else
  {
    uint64_t v8 = ATLLogObject();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 67109120;
      int v25 = [v6 length];
      _os_log_impl(&dword_1CA552000, v8, OS_LOG_TYPE_ERROR, "Failed or short balance %u", buf, 8u);
    }

    uint64_t v9 = [[NSString alloc] initWithFormat:@"Failed or short balance %u", [v6 length]];
    uint64_t v10 = (void *)v9;
    if (a4)
    {
      id v11 = *a4;
      char v12 = (void *)MEMORY[0x1E4F28C58];
      if (*a4)
      {
        uint64_t v13 = *MEMORY[0x1E4F28A50];
        v20[0] = *MEMORY[0x1E4F28568];
        v20[1] = v13;
        v21[0] = v9;
        v21[1] = v11;
        id v14 = (void *)MEMORY[0x1E4F1C9E8];
        v15 = v21;
        uint64_t v16 = v20;
        uint64_t v17 = 2;
      }
      else
      {
        uint64_t v22 = *MEMORY[0x1E4F28568];
        uint64_t v23 = v9;
        id v14 = (void *)MEMORY[0x1E4F1C9E8];
        v15 = &v23;
        uint64_t v16 = &v22;
        uint64_t v17 = 1;
      }
      v18 = [v14 dictionaryWithObjects:v15 forKeys:v16 count:v17];
      *a4 = [v12 errorWithDomain:@"ATL" code:5 userInfo:v18];
    }
    unint64_t v7 = 0;
  }

  return v7;
}

- (NSData)filePurseInfo
{
  return self->_filePurseInfo;
}

- (void)setFilePurseInfo:(id)a3
{
}

- (NSMutableArray)filePurse
{
  return self->_filePurse;
}

- (void)setFilePurse:(id)a3
{
}

- (NSMutableArray)fileTrans
{
  return self->_fileTrans;
}

- (void)setFileTrans:(id)a3
{
}

- (NSNumber)balance
{
  return self->_balance;
}

- (void)setBalance:(id)a3
{
}

- (NSNumber)filePurseMaxRecCount
{
  return self->_filePurseMaxRecCount;
}

- (void)setFilePurseMaxRecCount:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_filePurseMaxRecCount, 0);
  objc_storeStrong((id *)&self->_balance, 0);
  objc_storeStrong((id *)&self->_fileTrans, 0);
  objc_storeStrong((id *)&self->_filePurse, 0);

  objc_storeStrong((id *)&self->_filePurseInfo, 0);
}

@end