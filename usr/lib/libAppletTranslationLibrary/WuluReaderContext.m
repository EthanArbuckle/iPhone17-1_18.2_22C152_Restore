@interface WuluReaderContext
+ (id)readAllFiles:(id)a3 appletPID:(id)a4 debug:(BOOL)a5 error:(id *)a6;
- (NSData)file15;
- (NSData)file17;
- (NSMutableArray)file18;
- (NSMutableArray)file1A;
- (NSMutableArray)file1E;
- (NSMutableArray)localRecords;
- (NSNumber)balance;
- (NSNumber)overdraft;
- (id)readAll:(id)a3 debug:(BOOL)a4 error:(id *)a5;
- (id)readBalance:(id)a3 error:(id *)a4;
- (id)readBinary:(id)a3 sfi:(unsigned __int8)a4 error:(id *)a5;
- (id)readExtendedRecord:(id)a3 sfi:(unsigned __int8)a4 index:(unsigned __int8)a5 error:(id *)a6;
- (id)readRecord:(id)a3 sfi:(unsigned __int8)a4 index:(unsigned __int8)a5 error:(id *)a6;
- (id)readWuluRecord:(id)a3 sfi:(unsigned __int8)a4 index:(unsigned __int8)a5;
- (unsigned)localRecordFormat;
- (void)dumpAllFiles;
- (void)readAdditionalFile:(id)a3 cityCode:(id)a4;
- (void)setBalance:(id)a3;
- (void)setFile15:(id)a3;
- (void)setFile17:(id)a3;
- (void)setFile18:(id)a3;
- (void)setFile1A:(id)a3;
- (void)setFile1E:(id)a3;
- (void)setLocalRecordFormat:(unsigned int)a3;
- (void)setLocalRecords:(id)a3;
- (void)setOverdraft:(id)a3;
@end

@implementation WuluReaderContext

+ (id)readAllFiles:(id)a3 appletPID:(id)a4 debug:(BOOL)a5 error:(id *)a6
{
  BOOL v7 = a5;
  id v9 = a4;
  id v10 = a3;
  v11 = objc_alloc_init(WuluReaderContext);
  int v12 = [v9 isEqualToString:@"A000000704A00110110700"];

  [(WuluReaderContext *)v11 setLocalRecordFormat:v12 ^ 1u];
  v13 = [(WuluReaderContext *)v11 readAll:v10 debug:v7 error:a6];

  return v13;
}

- (id)readAll:(id)a3 debug:(BOOL)a4 error:(id *)a5
{
  BOOL v6 = a4;
  v96[1] = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = [(WuluReaderContext *)self readBalance:v8 error:a5];
  id v10 = v9;
  if (!v9)
  {
    v25 = ATLLogObject();
    if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1CA552000, v25, OS_LOG_TYPE_ERROR, "Failed to get balance", buf, 2u);
    }

    uint64_t v26 = [[NSString alloc] initWithFormat:@"Failed to get balance"];
    v18 = (void *)v26;
    if (a5)
    {
      id v27 = *a5;
      v20 = (void *)MEMORY[0x1E4F28C58];
      if (*a5)
      {
        uint64_t v28 = *MEMORY[0x1E4F28A50];
        v93[0] = *MEMORY[0x1E4F28568];
        v93[1] = v28;
        v94[0] = v26;
        v94[1] = v27;
        v22 = (void *)MEMORY[0x1E4F1C9E8];
        v23 = v94;
        v24 = v93;
        goto LABEL_14;
      }
      uint64_t v95 = *MEMORY[0x1E4F28568];
      v96[0] = v26;
      v22 = (void *)MEMORY[0x1E4F1C9E8];
      v23 = v96;
      v24 = &v95;
LABEL_56:
      uint64_t v29 = 1;
      goto LABEL_57;
    }
LABEL_42:
    v55 = 0;
    goto LABEL_65;
  }
  v11 = [v9 objectAtIndexedSubscript:0];
  [(WuluReaderContext *)self setBalance:v11];

  int v12 = [v10 objectAtIndexedSubscript:1];
  [(WuluReaderContext *)self setOverdraft:v12];

  v13 = [(WuluReaderContext *)self balance];
  if (![v13 unsignedIntValue])
  {

    goto LABEL_16;
  }
  v14 = [(WuluReaderContext *)self overdraft];
  int v15 = [v14 unsignedIntValue];

  if (!v15)
  {
LABEL_16:
    v18 = [(WuluReaderContext *)self readBinary:v8 sfi:21 error:a5];
    if ([v18 length] != 30)
    {
      v56 = ATLLogObject();
      if (os_log_type_enabled(v56, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1CA552000, v56, OS_LOG_TYPE_ERROR, "Failed to read SFI 15", buf, 2u);
      }

      uint64_t v57 = [[NSString alloc] initWithFormat:@"Failed to read SFI 15"];
      v30 = (void *)v57;
      if (a5)
      {
        id v58 = *a5;
        v59 = (void *)MEMORY[0x1E4F28C58];
        if (*a5)
        {
          uint64_t v60 = *MEMORY[0x1E4F28A50];
          v85[0] = *MEMORY[0x1E4F28568];
          v85[1] = v60;
          v86[0] = v57;
          v86[1] = v58;
          v61 = (void *)MEMORY[0x1E4F1C9E8];
          v62 = v86;
          v63 = v85;
          uint64_t v64 = 2;
        }
        else
        {
          uint64_t v87 = *MEMORY[0x1E4F28568];
          uint64_t v88 = v57;
          v61 = (void *)MEMORY[0x1E4F1C9E8];
          v62 = &v88;
          v63 = &v87;
          uint64_t v64 = 1;
        }
        v54 = [v61 dictionaryWithObjects:v62 forKeys:v63 count:v64];
        [v59 errorWithDomain:@"ATL" code:5 userInfo:v54];
        v55 = 0;
        *a5 = (id)objc_claimAutoreleasedReturnValue();
        goto LABEL_63;
      }
      v55 = 0;
      goto LABEL_64;
    }
    [(WuluReaderContext *)self setFile15:v18];
    v30 = [(WuluReaderContext *)self readBinary:v8 sfi:23 error:a5];
    if ([v30 length] != 60)
    {
      v65 = ATLLogObject();
      if (os_log_type_enabled(v65, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1CA552000, v65, OS_LOG_TYPE_ERROR, "Failed to read SFI 17", buf, 2u);
      }

      uint64_t v66 = [[NSString alloc] initWithFormat:@"Failed to read SFI 17"];
      v54 = (void *)v66;
      if (a5)
      {
        id v67 = *a5;
        v68 = (void *)MEMORY[0x1E4F28C58];
        if (*a5)
        {
          uint64_t v69 = *MEMORY[0x1E4F28A50];
          v81[0] = *MEMORY[0x1E4F28568];
          v81[1] = v69;
          v82[0] = v66;
          v82[1] = v67;
          v70 = (void *)MEMORY[0x1E4F1C9E8];
          v71 = v82;
          v72 = v81;
          uint64_t v73 = 2;
        }
        else
        {
          uint64_t v83 = *MEMORY[0x1E4F28568];
          uint64_t v84 = v66;
          v70 = (void *)MEMORY[0x1E4F1C9E8];
          v71 = &v84;
          v72 = &v83;
          uint64_t v73 = 1;
        }
        v74 = [v70 dictionaryWithObjects:v71 forKeys:v72 count:v73];
        *a5 = [v68 errorWithDomain:@"ATL" code:5 userInfo:v74];
      }
      v55 = 0;
LABEL_63:

      goto LABEL_64;
    }
    BOOL v78 = v6;
    v76 = v30;
    v77 = v18;
    [(WuluReaderContext *)self setFile17:v30];
    v31 = [MEMORY[0x1E4F1CA48] arrayWithCapacity:10];
    [(WuluReaderContext *)self setFile18:v31];

    v32 = [MEMORY[0x1E4F1CA48] arrayWithCapacity:10];
    [(WuluReaderContext *)self setFile1E:v32];

    unsigned __int8 v33 = 1;
    while (1)
    {
      v34 = [(WuluReaderContext *)self readRecord:v8 sfi:24 index:v33 error:a5];
      if ([v34 length] == 23 && (objc_msgSend(v34, "isAll00") & 1) == 0)
      {
        v35 = [(WuluReaderContext *)self file18];
        id v36 = v34;
        v37 = +[WuluRecord withRecordSfi:recordNumber:recordData:associatedSerialNumber:](WuluRecord, "withRecordSfi:recordNumber:recordData:associatedSerialNumber:", 24, v33, v36, bswap32(*(unsigned __int16 *)[v36 bytes]) >> 16);
        [v35 addObject:v37];
      }
      v38 = [(WuluReaderContext *)self readExtendedRecord:v8 sfi:30 index:v33 error:a5];
      v39 = [v38 data];
      if ([v39 length] != 48) {
        goto LABEL_25;
      }
      v40 = [v38 data];
      char v41 = [v40 isAll00];

      if ((v41 & 1) == 0) {
        break;
      }
LABEL_26:

      unsigned int v42 = v33++;
      if (v42 >= 0xA)
      {
        v43 = [MEMORY[0x1E4F1CA48] arrayWithCapacity:3];
        [(WuluReaderContext *)self setFile1A:v43];

        uint64_t v44 = 0;
        while (1)
        {
          int v45 = readAll_debug_error__file1A_indices[v44];
          v46 = [(WuluReaderContext *)self readExtendedRecord:v8 sfi:26 index:readAll_debug_error__file1A_indices[v44] error:0];
          v47 = v46;
          if (!v46) {
            break;
          }
          id v48 = [v46 data];
          int v49 = *(unsigned __int8 *)([v48 bytes] + 14);

          if (v49)
          {
            v50 = [(WuluReaderContext *)self file1A];
            [v50 addObject:v47];
            goto LABEL_37;
          }
          if (v78)
          {
            v50 = ATLLogObject();
            if (os_log_type_enabled(v50, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 67109120;
              int v80 = v45;
              v51 = v50;
              v52 = "SFI 0x1A index %d is not initialized";
LABEL_36:
              _os_log_impl(&dword_1CA552000, v51, OS_LOG_TYPE_DEFAULT, v52, buf, 8u);
            }
            goto LABEL_37;
          }
LABEL_38:

          if (++v44 == 3)
          {
            v53 = [(WuluReaderContext *)self file17];
            v54 = [v53 subdataWithOffset:6 length:2];

            [(WuluReaderContext *)self readAdditionalFile:v8 cityCode:v54];
            if (v78) {
              [(WuluReaderContext *)self dumpAllFiles];
            }
            v55 = self;
            v30 = v76;
            v18 = v77;
            goto LABEL_63;
          }
        }
        v50 = ATLLogObject();
        if (os_log_type_enabled(v50, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 67109120;
          int v80 = v45;
          v51 = v50;
          v52 = "Failed to get SFI 0x1A index %u";
          goto LABEL_36;
        }
LABEL_37:

        goto LABEL_38;
      }
    }
    v39 = [(WuluReaderContext *)self file1E];
    [v39 addObject:v38];
LABEL_25:

    goto LABEL_26;
  }
  v16 = ATLLogObject();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1CA552000, v16, OS_LOG_TYPE_ERROR, "Balance and overdraft are not consistent.", buf, 2u);
  }

  uint64_t v17 = [[NSString alloc] initWithFormat:@"Balance and overdraft are not consistent."];
  v18 = (void *)v17;
  if (!a5) {
    goto LABEL_42;
  }
  id v19 = *a5;
  v20 = (void *)MEMORY[0x1E4F28C58];
  if (!*a5)
  {
    uint64_t v91 = *MEMORY[0x1E4F28568];
    uint64_t v92 = v17;
    v22 = (void *)MEMORY[0x1E4F1C9E8];
    v23 = &v92;
    v24 = &v91;
    goto LABEL_56;
  }
  uint64_t v21 = *MEMORY[0x1E4F28A50];
  v89[0] = *MEMORY[0x1E4F28568];
  v89[1] = v21;
  v90[0] = v17;
  v90[1] = v19;
  v22 = (void *)MEMORY[0x1E4F1C9E8];
  v23 = v90;
  v24 = v89;
LABEL_14:
  uint64_t v29 = 2;
LABEL_57:
  v30 = [v22 dictionaryWithObjects:v23 forKeys:v24 count:v29];
  [v20 errorWithDomain:@"ATL" code:5 userInfo:v30];
  v55 = 0;
  *a5 = (id)objc_claimAutoreleasedReturnValue();
LABEL_64:

LABEL_65:

  return v55;
}

- (void)readAdditionalFile:(id)a3 cityCode:(id)a4
{
  v81[3] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  id v8 = +[AppletConfigurationData getWuluSettings];
  id v9 = [v8 objectForKeyedSubscript:@"cityRules"];
  id v10 = [v7 asHexString];
  v11 = [v9 objectForKeyedSubscript:v10];

  if (!v11)
  {
    uint64_t v17 = ATLLogObject();
    if (!os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_65;
    }
    *(_DWORD *)buf = 138412290;
    id v75 = v7;
    v31 = "Configuration does not define city rules for city code %@";
LABEL_37:
    _os_log_impl(&dword_1CA552000, v17, OS_LOG_TYPE_DEFAULT, v31, buf, 0xCu);
    goto LABEL_65;
  }
  int v12 = [v11 unsignedIntValue];
  if (v12 == 7 || v12 == 5)
  {
    v14 = +[AppletConfigurationData getWuluSettings];
    int v15 = [v14 objectForKeyedSubscript:@"localLogSettings"];
    v16 = [v7 asHexString];
    uint64_t v17 = [v15 objectForKeyedSubscript:v16];

    if (!v17)
    {
      id v19 = ATLLogObject();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        id v75 = v7;
        _os_log_impl(&dword_1CA552000, v19, OS_LOG_TYPE_DEFAULT, "Local log data settings missing for city %@.", buf, 0xCu);
      }
      goto LABEL_64;
    }
    v18 = [MEMORY[0x1E4F1CA48] arrayWithCapacity:3];
    [(WuluReaderContext *)self setLocalRecords:v18];

    id v19 = [v17 objectForKey:@"localRecordSfi"];
    v62 = v17;
    uint64_t v20 = [v17 objectForKey:@"localRecordId"];
    uint64_t v21 = (void *)v20;
    if (!v19 || !v20)
    {
      id v27 = ATLLogObject();
      if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        id v75 = v7;
        _os_log_impl(&dword_1CA552000, v27, OS_LOG_TYPE_DEFAULT, "Local log data is not retrived from settings for city %@.", buf, 0xCu);
      }
      goto LABEL_63;
    }
    id v58 = v11;
    v22 = [MEMORY[0x1E4F1C9B8] dataWithHexString:v19];
    uint64_t v23 = [v22 u8:0];

    v24 = [MEMORY[0x1E4F1C9B8] dataWithHexString:v21];
    uint64_t v25 = [v24 u8:0];

    uint64_t v26 = [(WuluReaderContext *)self readWuluRecord:v6 sfi:v23 index:v25];
    if (!v26)
    {
      id v27 = ATLLogObject();
      if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        id v75 = v7;
        _os_log_impl(&dword_1CA552000, v27, OS_LOG_TYPE_DEFAULT, "Local record not read for city %@.", buf, 0xCu);
      }
      goto LABEL_62;
    }
    id v27 = v26;
    uint64_t v28 = [(WuluReaderContext *)self localRecords];
    [v28 addObject:v27];

    if ([v11 unsignedIntValue] == 5)
    {
      uint64_t v29 = [(WuluReaderContext *)self localRecords];
      [v29 addObject:v27];

      v30 = [(WuluReaderContext *)self localRecords];
      [v30 addObject:v27];

LABEL_62:
      v11 = v58;
LABEL_63:

      uint64_t v17 = v62;
LABEL_64:

      goto LABEL_65;
    }
    id v43 = v7;
    uint64_t v44 = (void *)MEMORY[0x1E4F1C9B8];
    int v45 = [v62 objectForKey:@"metroEntryStationCode"];
    v46 = [v44 dataWithHexString:v45];

    if (!v46 || [v46 length] != 4)
    {
      v52 = ATLLogObject();
      if (os_log_type_enabled(v52, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        id v75 = v43;
        _os_log_impl(&dword_1CA552000, v52, OS_LOG_TYPE_DEFAULT, "Local log extra data is not retrived from settings for city %@.", buf, 0xCu);
      }
      goto LABEL_61;
    }
    uint64_t v47 = [-[WuluReaderContext readWuluRecord:sfi:index:](self, "readWuluRecord:sfi:index:", v6, [v46 u8:2], [v46 u8:3]);

    id v27 = v47;
    if (v47)
    {
      id v48 = ATLLogObject();
      if (os_log_type_enabled(v48, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        id v75 = v43;
        _os_log_impl(&dword_1CA552000, v48, OS_LOG_TYPE_DEFAULT, "Local entry record not read for city %@.", buf, 0xCu);
      }

      int v49 = [(WuluReaderContext *)self localRecords];
      [v49 addObject:v27];
    }
    v50 = (void *)MEMORY[0x1E4F1C9B8];
    v51 = [v62 objectForKey:@"metroExitStationCode"];
    v52 = [v50 dataWithHexString:v51];

    if (v52 && [v52 length] == 4)
    {
      uint64_t v53 = [(WuluReaderContext *)self readWuluRecord:v6 sfi:[v52 u8:2] index:[v52 u8:3]];
      v54 = v27;
      id v27 = v53;

      if (!v27)
      {
LABEL_61:

        id v7 = v43;
        goto LABEL_62;
      }
      v55 = ATLLogObject();
      if (os_log_type_enabled(v55, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        id v75 = v43;
        _os_log_impl(&dword_1CA552000, v55, OS_LOG_TYPE_DEFAULT, "Local exit record not read for city %@.", buf, 0xCu);
      }

      v56 = [(WuluReaderContext *)self localRecords];
      [v56 addObject:v27];
    }
    else
    {
      v56 = ATLLogObject();
      if (os_log_type_enabled(v56, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        id v75 = v43;
        _os_log_impl(&dword_1CA552000, v56, OS_LOG_TYPE_DEFAULT, "Local log extra data is not retrived from settings for city %@.", buf, 0xCu);
      }
    }

    goto LABEL_61;
  }
  if (v12 != 4)
  {
    uint64_t v17 = ATLLogObject();
    if (!os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_65;
    }
    *(_DWORD *)buf = 138412290;
    id v75 = v11;
    v31 = "Configuration gave us unknown rule type %@";
    goto LABEL_37;
  }
  id v57 = v7;
  v59 = v11;
  v80[0] = &unk_1F24E1E40;
  v80[1] = &unk_1F24E1EA0;
  v81[0] = &unk_1F24E2668;
  v81[1] = &unk_1F24E2680;
  v80[2] = &unk_1F24E1EB8;
  void v81[2] = &unk_1F24E2698;
  uint64_t v17 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v81 forKeys:v80 count:3];
  v32 = [MEMORY[0x1E4F1CA48] arrayWithCapacity:3 * -[NSObject count](v17, "count")];
  [(WuluReaderContext *)self setLocalRecords:v32];

  long long v72 = 0u;
  long long v73 = 0u;
  long long v70 = 0u;
  long long v71 = 0u;
  id obj = [v17 allKeys];
  uint64_t v64 = [obj countByEnumeratingWithState:&v70 objects:v79 count:16];
  if (v64)
  {
    uint64_t v61 = *(void *)v71;
    v63 = v17;
    do
    {
      uint64_t v33 = 0;
      do
      {
        if (*(void *)v71 != v61) {
          objc_enumerationMutation(obj);
        }
        uint64_t v65 = v33;
        v34 = *(void **)(*((void *)&v70 + 1) + 8 * v33);
        long long v66 = 0u;
        long long v67 = 0u;
        long long v68 = 0u;
        long long v69 = 0u;
        v35 = [v17 objectForKeyedSubscript:v34];
        uint64_t v36 = [v35 countByEnumeratingWithState:&v66 objects:v78 count:16];
        if (v36)
        {
          uint64_t v37 = v36;
          uint64_t v38 = *(void *)v67;
          do
          {
            for (uint64_t i = 0; i != v37; ++i)
            {
              if (*(void *)v67 != v38) {
                objc_enumerationMutation(v35);
              }
              v40 = *(void **)(*((void *)&v66 + 1) + 8 * i);
              char v41 = [-[WuluReaderContext readWuluRecord:sfi:index:](self, "readWuluRecord:sfi:index:", v6, [v34 unsignedCharValue], [v40 unsignedCharValue]);
              if (v41)
              {
                unsigned int v42 = [(WuluReaderContext *)self localRecords];
                [v42 addObject:v41];
              }
              else
              {
                unsigned int v42 = ATLLogObject();
                if (os_log_type_enabled(v42, OS_LOG_TYPE_DEFAULT))
                {
                  *(_DWORD *)buf = 138412546;
                  id v75 = v34;
                  __int16 v76 = 2112;
                  v77 = v40;
                  _os_log_impl(&dword_1CA552000, v42, OS_LOG_TYPE_DEFAULT, "Failed to get SFI %@ index %@", buf, 0x16u);
                }
              }
            }
            uint64_t v37 = [v35 countByEnumeratingWithState:&v66 objects:v78 count:16];
          }
          while (v37);
        }

        uint64_t v33 = v65 + 1;
        uint64_t v17 = v63;
      }
      while (v65 + 1 != v64);
      uint64_t v64 = [obj countByEnumeratingWithState:&v70 objects:v79 count:16];
    }
    while (v64);
  }

  id v7 = v57;
  v11 = v59;
LABEL_65:
}

- (id)readWuluRecord:(id)a3 sfi:(unsigned __int8)a4 index:(unsigned __int8)a5
{
  uint64_t v5 = a5;
  uint64_t v6 = a4;
  id v8 = a3;
  if ([(WuluReaderContext *)self localRecordFormat] == 1)
  {
    id v9 = [(WuluReaderContext *)self readExtendedRecord:v8 sfi:v6 index:v5 error:0];
  }
  else if ([(WuluReaderContext *)self localRecordFormat] {
         || ([(WuluReaderContext *)self readRecord:v8 sfi:v6 index:v5 error:0],
  }
             (uint64_t v10 = objc_claimAutoreleasedReturnValue()) == 0))
  {
    id v9 = 0;
  }
  else
  {
    v11 = (void *)v10;
    id v9 = +[WuluRecord withRecordSfi:v6 recordNumber:v5 recordData:v10 associatedSerialNumber:0];
  }

  return v9;
}

- (void)dumpAllFiles
{
  uint64_t v44 = *MEMORY[0x1E4F143B8];
  v3 = ATLLogObject();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1CA552000, v3, OS_LOG_TYPE_INFO, "--- WULU DUMP BEGIN --", buf, 2u);
  }

  v4 = ATLLogObject();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    uint64_t v5 = [(WuluReaderContext *)self balance];
    *(_DWORD *)buf = 138412290;
    id v43 = v5;
    _os_log_impl(&dword_1CA552000, v4, OS_LOG_TYPE_INFO, "    Balance File %@", buf, 0xCu);
  }
  id v6 = [(WuluReaderContext *)self file15];
  uint64_t v7 = [v6 bytes];
  id v8 = [(WuluReaderContext *)self file15];
  uint64_t v9 = [v8 length];
  LogBinary(OS_LOG_TYPE_DEFAULT, (uint64_t)"-[WuluReaderContext dumpAllFiles]", 241, v7, v9, @"    SFI 0x15:", v10, v11, v34);

  id v12 = [(WuluReaderContext *)self file17];
  uint64_t v13 = [v12 bytes];
  v14 = [(WuluReaderContext *)self file17];
  uint64_t v15 = [v14 length];
  LogBinary(OS_LOG_TYPE_DEFAULT, (uint64_t)"-[WuluReaderContext dumpAllFiles]", 242, v13, v15, @"    SFI 0x17:", v16, v17, v35);

  v18 = [(WuluReaderContext *)self file18];
  [v18 enumerateObjectsUsingBlock:&__block_literal_global_4];

  id v19 = [(WuluReaderContext *)self file1E];
  [v19 enumerateObjectsUsingBlock:&__block_literal_global_579];

  uint64_t v20 = [(WuluReaderContext *)self file1A];
  [v20 enumerateObjectsUsingBlock:&__block_literal_global_584];

  long long v39 = 0u;
  long long v40 = 0u;
  long long v37 = 0u;
  long long v38 = 0u;
  id obj = [(WuluReaderContext *)self localRecords];
  uint64_t v21 = [obj countByEnumeratingWithState:&v37 objects:v41 count:16];
  if (v21)
  {
    uint64_t v22 = v21;
    uint64_t v23 = *(void *)v38;
    do
    {
      for (uint64_t i = 0; i != v22; ++i)
      {
        if (*(void *)v38 != v23) {
          objc_enumerationMutation(obj);
        }
        uint64_t v25 = *(void **)(*((void *)&v37 + 1) + 8 * i);
        id v26 = [v25 data];
        uint64_t v27 = [v26 bytes];
        uint64_t v28 = [v25 data];
        uint64_t v29 = [v28 length];
        unsigned int v30 = [v25 sfi];
        [v25 number];
        [v25 associatedSerialNumber];
        LogBinary(OS_LOG_TYPE_DEFAULT, (uint64_t)"-[WuluReaderContext dumpAllFiles]", 254, v27, v29, @"    SFI %02X record %u (SN 0x%X) localRecord", v31, v32, v30);
      }
      uint64_t v22 = [obj countByEnumeratingWithState:&v37 objects:v41 count:16];
    }
    while (v22);
  }

  uint64_t v33 = ATLLogObject();
  if (os_log_type_enabled(v33, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1CA552000, v33, OS_LOG_TYPE_INFO, "--- WULU DUMP END --", buf, 2u);
  }
}

void __33__WuluReaderContext_dumpAllFiles__block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  id v9 = [v2 data];
  uint64_t v3 = [v9 bytes];
  v4 = [v2 data];
  uint64_t v5 = [v4 length];
  unsigned int v6 = [v2 number];
  [v2 associatedSerialNumber];

  LogBinary(OS_LOG_TYPE_DEFAULT, (uint64_t)"-[WuluReaderContext dumpAllFiles]_block_invoke", 244, v3, v5, @"    SFI 18 record %u (SN 0x%X)", v7, v8, v6);
}

void __33__WuluReaderContext_dumpAllFiles__block_invoke_2(uint64_t a1, void *a2)
{
  id v2 = a2;
  id v9 = [v2 data];
  uint64_t v3 = [v9 bytes];
  v4 = [v2 data];
  uint64_t v5 = [v4 length];
  unsigned int v6 = [v2 number];
  [v2 associatedSerialNumber];

  LogBinary(OS_LOG_TYPE_DEFAULT, (uint64_t)"-[WuluReaderContext dumpAllFiles]_block_invoke_2", 247, v3, v5, @"    SFI 1E record %u (SN 0x%X)", v7, v8, v6);
}

void __33__WuluReaderContext_dumpAllFiles__block_invoke_3(uint64_t a1, void *a2)
{
  id v2 = a2;
  id v9 = [v2 data];
  uint64_t v3 = [v9 bytes];
  v4 = [v2 data];
  uint64_t v5 = [v4 length];
  unsigned int v6 = [v2 number];
  [v2 associatedSerialNumber];

  LogBinary(OS_LOG_TYPE_DEFAULT, (uint64_t)"-[WuluReaderContext dumpAllFiles]_block_invoke_3", 250, v3, v5, @"    SFI 1A record %u (SN 0x%X)", v7, v8, v6);
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
    v18 = [a3 transceiveBytesAndCheckSW:buf length:5 error:a6];
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
      id v12 = (void *)MEMORY[0x1E4F28C58];
      if (*a6)
      {
        uint64_t v13 = *MEMORY[0x1E4F28A50];
        v21[0] = *MEMORY[0x1E4F28568];
        v21[1] = v13;
        v22[0] = v9;
        v22[1] = v11;
        v14 = (void *)MEMORY[0x1E4F1C9E8];
        uint64_t v15 = v22;
        uint64_t v16 = v21;
        uint64_t v17 = 2;
      }
      else
      {
        uint64_t v23 = *MEMORY[0x1E4F28568];
        uint64_t v24 = v9;
        v14 = (void *)MEMORY[0x1E4F1C9E8];
        uint64_t v15 = &v24;
        uint64_t v16 = &v23;
        uint64_t v17 = 1;
      }
      id v19 = [v14 dictionaryWithObjects:v15 forKeys:v16 count:v17];
      *a6 = [v12 errorWithDomain:@"ATL" code:8 userInfo:v19];
    }
    v18 = 0;
  }

  return v18;
}

- (id)readExtendedRecord:(id)a3 sfi:(unsigned __int8)a4 index:(unsigned __int8)a5 error:(id *)a6
{
  uint64_t v7 = a5;
  uint64_t v8 = a4;
  id v9 = a3;
  __int16 v15 = -3200;
  char v16 = v7;
  char v17 = (8 * v8) | 4;
  char v18 = 0;
  uint64_t v10 = [v9 transceiveBytesAndCheckSW:&v15 length:5 error:a6];
  if ((unint64_t)[v10 length] >= 3)
  {
    id v12 = [v10 subdataWithOffset:0 length:[v10 length] - 2];
    id v13 = v10;
    id v11 = [WuluRecord withRecordSfi:v8 recordNumber:v7 recordData:v12 associatedSerialNumber:bswap32(*(unsigned __int16 *)([v13 length] + objc_msgSend(v13, "bytes") - 2)) >> 16];
  }
  else
  {
    id v11 = 0;
  }

  return v11;
}

- (id)readBinary:(id)a3 sfi:(unsigned __int8)a4 error:(id *)a5
{
  uint64_t v6 = a4;
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  __int16 v20 = -20480;
  char v21 = a4 | 0x80;
  __int16 v22 = 0;
  uint64_t v7 = [a3 transceiveBytesAndCheckSW:&v20 length:5 error:nil];
  if (!v7)
  {
    uint64_t v8 = ATLLogObject();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 67109120;
      int v28 = v6;
      _os_log_impl(&dword_1CA552000, v8, OS_LOG_TYPE_ERROR, "sfi 0x%x", buf, 8u);
    }

    uint64_t v9 = [[NSString alloc] initWithFormat:@"sfi 0x%x", v6];
    uint64_t v10 = (void *)v9;
    if (a5)
    {
      id v11 = *a5;
      id v12 = (void *)MEMORY[0x1E4F28C58];
      if (*a5)
      {
        uint64_t v13 = *MEMORY[0x1E4F28A50];
        v23[0] = *MEMORY[0x1E4F28568];
        v23[1] = v13;
        v24[0] = v9;
        v24[1] = v11;
        v14 = (void *)MEMORY[0x1E4F1C9E8];
        __int16 v15 = v24;
        char v16 = v23;
        uint64_t v17 = 2;
      }
      else
      {
        uint64_t v25 = *MEMORY[0x1E4F28568];
        uint64_t v26 = v9;
        v14 = (void *)MEMORY[0x1E4F1C9E8];
        __int16 v15 = &v26;
        char v16 = &v25;
        uint64_t v17 = 1;
      }
      char v18 = [v14 dictionaryWithObjects:v15 forKeys:v16 count:v17];
      *a5 = [v12 errorWithDomain:@"ATL" code:5 userInfo:v18];
    }
  }

  return v7;
}

- (id)readBalance:(id)a3 error:(id *)a4
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  uint64_t v6 = [v5 transceiveBytesAndCheckSW:&readBalance_error__getBalanceCmd_0 length:5 error:a4];
  uint64_t v7 = v6;
  if (v6 && [v6 length] == 16)
  {
    uint64_t v8 = NSNumber;
    id v9 = v7;
    uint64_t v10 = [v8 numberWithUnsignedInt:bswap32(*(_DWORD *)[v9 bytes])];
    v23[0] = v10;
    id v11 = [NSNumber numberWithUnsignedInt:bswap32(*(_DWORD *)(objc_msgSend(v9, "bytes") + 8))];
    v23[1] = v11;
    id v12 = [MEMORY[0x1E4F1C978] arrayWithObjects:v23 count:2];
  }
  else
  {
    uint64_t v13 = ATLLogObject();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 67109120;
      int v29 = [v7 length];
      _os_log_impl(&dword_1CA552000, v13, OS_LOG_TYPE_ERROR, "Failed or short balance %u", buf, 8u);
    }

    uint64_t v14 = [[NSString alloc] initWithFormat:@"Failed or short balance %u", [v7 length]];
    uint64_t v10 = (void *)v14;
    if (!a4)
    {
      id v12 = 0;
      goto LABEL_13;
    }
    id v15 = *a4;
    char v16 = (void *)MEMORY[0x1E4F28C58];
    if (*a4)
    {
      uint64_t v17 = *MEMORY[0x1E4F28A50];
      v24[0] = *MEMORY[0x1E4F28568];
      v24[1] = v17;
      v25[0] = v14;
      v25[1] = v15;
      char v18 = (void *)MEMORY[0x1E4F1C9E8];
      id v19 = v25;
      __int16 v20 = v24;
      uint64_t v21 = 2;
    }
    else
    {
      uint64_t v26 = *MEMORY[0x1E4F28568];
      uint64_t v27 = v14;
      char v18 = (void *)MEMORY[0x1E4F1C9E8];
      id v19 = &v27;
      __int16 v20 = &v26;
      uint64_t v21 = 1;
    }
    id v11 = [v18 dictionaryWithObjects:v19 forKeys:v20 count:v21];
    [v16 errorWithDomain:@"ATL" code:5 userInfo:v11];
    id v12 = 0;
    *a4 = (id)objc_claimAutoreleasedReturnValue();
  }

LABEL_13:

  return v12;
}

- (NSData)file15
{
  return self->_file15;
}

- (void)setFile15:(id)a3
{
}

- (NSData)file17
{
  return self->_file17;
}

- (void)setFile17:(id)a3
{
}

- (NSMutableArray)file18
{
  return self->_file18;
}

- (void)setFile18:(id)a3
{
}

- (NSMutableArray)file1E
{
  return self->_file1E;
}

- (void)setFile1E:(id)a3
{
}

- (NSMutableArray)file1A
{
  return self->_file1A;
}

- (void)setFile1A:(id)a3
{
}

- (NSNumber)balance
{
  return self->_balance;
}

- (void)setBalance:(id)a3
{
}

- (NSNumber)overdraft
{
  return self->_overdraft;
}

- (void)setOverdraft:(id)a3
{
}

- (NSMutableArray)localRecords
{
  return self->_localRecords;
}

- (void)setLocalRecords:(id)a3
{
}

- (unsigned)localRecordFormat
{
  return self->_localRecordFormat;
}

- (void)setLocalRecordFormat:(unsigned int)a3
{
  self->_localRecordFormat = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_localRecords, 0);
  objc_storeStrong((id *)&self->_overdraft, 0);
  objc_storeStrong((id *)&self->_balance, 0);
  objc_storeStrong((id *)&self->_file1A, 0);
  objc_storeStrong((id *)&self->_file1E, 0);
  objc_storeStrong((id *)&self->_file18, 0);
  objc_storeStrong((id *)&self->_file17, 0);

  objc_storeStrong((id *)&self->_file15, 0);
}

@end