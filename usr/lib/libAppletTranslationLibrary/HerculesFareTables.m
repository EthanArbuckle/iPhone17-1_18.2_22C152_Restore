@interface HerculesFareTables
+ (unsigned)getProductIDWithTicketType:(unsigned __int8)a3 withOperatorID:(unsigned __int8)a4 withRiderClass:(unsigned __int8)a5 forCity:(id)a6 withProductCategory:(char *)a7 withError:(id *)a8;
@end

@implementation HerculesFareTables

+ (unsigned)getProductIDWithTicketType:(unsigned __int8)a3 withOperatorID:(unsigned __int8)a4 withRiderClass:(unsigned __int8)a5 forCity:(id)a6 withProductCategory:(char *)a7 withError:(id *)a8
{
  uint64_t v10 = a5;
  uint64_t v11 = a4;
  uint64_t v12 = a3;
  v67[1] = *MEMORY[0x1E4F143B8];
  id v13 = a6;
  v14 = +[AppletConfigurationData getHerculesSettings];
  v15 = [v14 objectForKeyedSubscript:@"fareTables"];
  v16 = [v13 stringValue];
  v17 = [v15 objectForKeyedSubscript:v16];

  if (v17)
  {
    id v18 = [MEMORY[0x1E4F1C9B8] dataWithBase64:v17];
    if (![v18 length] || (objc_msgSend(v18, "length") & 7) != 0)
    {
      v19 = ATLLogObject();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412546;
        id v55 = v13;
        __int16 v56 = 2112;
        *(void *)v57 = v17;
        _os_log_impl(&dword_1CA552000, v19, OS_LOG_TYPE_ERROR, "Invalid fare table for city %@ %@", buf, 0x16u);
      }

      uint64_t v20 = [[NSString alloc] initWithFormat:@"Invalid fare table for city %@ %@", v13, v17];
      v21 = (void *)v20;
      if (!a8) {
        goto LABEL_32;
      }
      id v22 = *a8;
      v23 = (void *)MEMORY[0x1E4F28C58];
      if (*a8)
      {
        uint64_t v24 = *MEMORY[0x1E4F28A50];
        v60[0] = *MEMORY[0x1E4F28568];
        v60[1] = v24;
        v61[0] = v20;
        v61[1] = v22;
        v25 = (void *)MEMORY[0x1E4F1C9E8];
        v26 = v61;
        v27 = v60;
LABEL_25:
        uint64_t v46 = 2;
LABEL_31:
        v48 = [v25 dictionaryWithObjects:v26 forKeys:v27 count:v46];
        *a8 = [v23 errorWithDomain:@"ATL" code:3 userInfo:v48];

LABEL_32:
LABEL_33:
        LODWORD(a8) = 0;
        goto LABEL_34;
      }
      uint64_t v62 = *MEMORY[0x1E4F28568];
      uint64_t v63 = v20;
      v25 = (void *)MEMORY[0x1E4F1C9E8];
      v26 = &v63;
      v27 = &v62;
      goto LABEL_30;
    }
    id v37 = v18;
    uint64_t v38 = [v37 bytes];
    unint64_t v39 = v38 + [v37 length];
    id v18 = v37;
    v40 = (unsigned __int8 *)[v18 bytes];
    if ((unint64_t)v40 >= v39)
    {
LABEL_20:
      v42 = ATLLogObject();
      if (os_log_type_enabled(v42, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138413058;
        id v55 = v13;
        __int16 v56 = 1024;
        *(_DWORD *)v57 = v12;
        *(_WORD *)&v57[4] = 1024;
        *(_DWORD *)&v57[6] = v11;
        __int16 v58 = 1024;
        int v59 = v10;
        _os_log_impl(&dword_1CA552000, v42, OS_LOG_TYPE_ERROR, "No Product ID for City %@ TicketType %hhu OperatorID %hhu RiderClass %hhu", buf, 0x1Eu);
      }

      uint64_t v43 = [[NSString alloc] initWithFormat:@"No Product ID for City %@ TicketType %hhu OperatorID %hhu RiderClass %hhu", v13, v12, v11, v10];
      v21 = (void *)v43;
      if (!a8) {
        goto LABEL_32;
      }
      id v44 = *a8;
      v23 = (void *)MEMORY[0x1E4F28C58];
      if (*a8)
      {
        uint64_t v45 = *MEMORY[0x1E4F28A50];
        v50[0] = *MEMORY[0x1E4F28568];
        v50[1] = v45;
        v51[0] = v43;
        v51[1] = v44;
        v25 = (void *)MEMORY[0x1E4F1C9E8];
        v26 = v51;
        v27 = v50;
        goto LABEL_25;
      }
      uint64_t v52 = *MEMORY[0x1E4F28568];
      uint64_t v53 = v43;
      v25 = (void *)MEMORY[0x1E4F1C9E8];
      v26 = &v53;
      v27 = &v52;
LABEL_30:
      uint64_t v46 = 1;
      goto LABEL_31;
    }
    v41 = (unsigned int *)(v40 + 4);
    while (*v40 != v12 || v40[1] != v11 || v40[2] != v10)
    {
      v40 += 8;
      v41 += 2;
      if ((unint64_t)v40 >= v39) {
        goto LABEL_20;
      }
    }
    *a7 = v40[3];
    LODWORD(a8) = bswap32(*v41);
  }
  else
  {
    v28 = ATLLogObject();
    if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      id v55 = v13;
      _os_log_impl(&dword_1CA552000, v28, OS_LOG_TYPE_ERROR, "No fare table for city %@", buf, 0xCu);
    }

    uint64_t v29 = [[NSString alloc] initWithFormat:@"No fare table for city %@", v13];
    id v18 = (id)v29;
    if (a8)
    {
      id v30 = *a8;
      v31 = (void *)MEMORY[0x1E4F28C58];
      if (*a8)
      {
        uint64_t v32 = *MEMORY[0x1E4F28A50];
        v64[0] = *MEMORY[0x1E4F28568];
        v64[1] = v32;
        v65[0] = v29;
        v65[1] = v30;
        v33 = (void *)MEMORY[0x1E4F1C9E8];
        v34 = v65;
        v35 = v64;
        uint64_t v36 = 2;
      }
      else
      {
        uint64_t v66 = *MEMORY[0x1E4F28568];
        v67[0] = v29;
        v33 = (void *)MEMORY[0x1E4F1C9E8];
        v34 = v67;
        v35 = &v66;
        uint64_t v36 = 1;
      }
      v47 = [v33 dictionaryWithObjects:v34 forKeys:v35 count:v36];
      *a8 = [v31 errorWithDomain:@"ATL" code:3 userInfo:v47];

      goto LABEL_33;
    }
  }
LABEL_34:

  return a8;
}

@end