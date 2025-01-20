@interface SeosDecoder
+ (id)parseEndEvent:(id)a3 withApplet:(id)a4 error:(id *)a5;
+ (id)parseStartEvent:(id)a3 withApplet:(id)a4 error:(id *)a5;
+ (id)resolveServiceProvider:(unsigned __int8)a3;
- (id)GetAppletProperties:(id)a3 withPackage:(id)a4 withModule:(id)a5 withTransceiver:(id)a6 withError:(id *)a7;
- (id)getAppletStateAndHistory:(id)a3 withApplet:(id)a4 withPackage:(id)a5 withModule:(id)a6 withError:(id *)a7;
- (id)parseHCIEvent:(id)a3 withApplet:(id)a4 withPackage:(id)a5 withModule:(id)a6 withTransceiver:(id)a7 withError:(id *)a8;
- (id)processEndOfTransaction:(id)a3 withApplet:(id)a4 withPackage:(id)a5 withModule:(id)a6 withError:(id *)a7;
@end

@implementation SeosDecoder

- (id)parseHCIEvent:(id)a3 withApplet:(id)a4 withPackage:(id)a5 withModule:(id)a6 withTransceiver:(id)a7 withError:(id *)a8
{
  v73[1] = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  id v11 = a4;
  if ((unint64_t)[v10 length] > 1)
  {
    id v22 = v10;
    uint64_t v23 = *(unsigned __int8 *)[v22 bytes];
    id v24 = v22;
    uint64_t v25 = *(unsigned __int8 *)([v24 bytes] + 1);
    if (v25 == 1)
    {
      v26 = ATLLogObject();
      if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1CA552000, v26, OS_LOG_TYPE_ERROR, "Legacy SEOS, punting", buf, 2u);
      }

      uint64_t v27 = [[NSString alloc] initWithFormat:@"Legacy SEOS, punting"];
      v14 = (void *)v27;
      if (!a8) {
        goto LABEL_33;
      }
      id v28 = *a8;
      v29 = (void *)MEMORY[0x1E4F28C58];
      if (*a8)
      {
        uint64_t v30 = *MEMORY[0x1E4F28A50];
        v66[0] = *MEMORY[0x1E4F28568];
        v66[1] = v30;
        v67[0] = v27;
        v67[1] = v28;
        v31 = (void *)MEMORY[0x1E4F1C9E8];
        v32 = v67;
        v33 = v66;
        uint64_t v34 = 2;
      }
      else
      {
        uint64_t v68 = *MEMORY[0x1E4F28568];
        uint64_t v69 = v27;
        v31 = (void *)MEMORY[0x1E4F1C9E8];
        v32 = &v69;
        v33 = &v68;
        uint64_t v34 = 1;
      }
      v40 = [v31 dictionaryWithObjects:v32 forKeys:v33 count:v34];
      v41 = v29;
      uint64_t v42 = 2;
      goto LABEL_32;
    }
    if ((unint64_t)[v24 length] > 9)
    {
      if (v23 == 1 && v25 == 255)
      {
        uint64_t v39 = +[SeosDecoder parseStartEvent:v24 withApplet:v11 error:a8];
      }
      else
      {
        if (v23 != 2 || v25 != 255)
        {
          v45 = ATLLogObject();
          if (os_log_type_enabled(v45, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 67109376;
            int v59 = v23;
            __int16 v60 = 1024;
            int v61 = v25;
            _os_log_impl(&dword_1CA552000, v45, OS_LOG_TYPE_ERROR, "Invalid event type 0x%x version 0x%x", buf, 0xEu);
          }

          uint64_t v46 = [[NSString alloc] initWithFormat:@"Invalid event type 0x%x version 0x%x", v23, v25];
          v14 = (void *)v46;
          if (!a8) {
            goto LABEL_33;
          }
          id v47 = *a8;
          v48 = (void *)MEMORY[0x1E4F28C58];
          if (*a8)
          {
            uint64_t v49 = *MEMORY[0x1E4F28A50];
            v54[0] = *MEMORY[0x1E4F28568];
            v54[1] = v49;
            v55[0] = v46;
            v55[1] = v47;
            v50 = (void *)MEMORY[0x1E4F1C9E8];
            v51 = v55;
            v52 = v54;
            uint64_t v53 = 2;
          }
          else
          {
            uint64_t v56 = *MEMORY[0x1E4F28568];
            uint64_t v57 = v46;
            v50 = (void *)MEMORY[0x1E4F1C9E8];
            v51 = &v57;
            v52 = &v56;
            uint64_t v53 = 1;
          }
          v40 = [v50 dictionaryWithObjects:v51 forKeys:v52 count:v53];
          v41 = v48;
          uint64_t v42 = 3;
          goto LABEL_32;
        }
        uint64_t v39 = +[SeosDecoder parseEndEvent:v24 withApplet:v11 error:a8];
      }
      v43 = (void *)v39;
      goto LABEL_34;
    }
    v35 = ATLLogObject();
    if (os_log_type_enabled(v35, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 67109120;
      int v59 = [v24 length];
      _os_log_impl(&dword_1CA552000, v35, OS_LOG_TYPE_ERROR, "Invalid eventData length %u", buf, 8u);
    }

    uint64_t v36 = [[NSString alloc] initWithFormat: @"Invalid eventData length %u", [v24 length]];
    v14 = (void *)v36;
    if (!a8) {
      goto LABEL_33;
    }
    id v37 = *a8;
    v16 = (void *)MEMORY[0x1E4F28C58];
    if (*a8)
    {
      uint64_t v38 = *MEMORY[0x1E4F28A50];
      v62[0] = *MEMORY[0x1E4F28568];
      v62[1] = v38;
      v63[0] = v36;
      v63[1] = v37;
      v18 = (void *)MEMORY[0x1E4F1C9E8];
      v19 = v63;
      v20 = v62;
      goto LABEL_7;
    }
    uint64_t v64 = *MEMORY[0x1E4F28568];
    uint64_t v65 = v36;
    v18 = (void *)MEMORY[0x1E4F1C9E8];
    v19 = &v65;
    v20 = &v64;
LABEL_24:
    uint64_t v21 = 1;
    goto LABEL_25;
  }
  v12 = ATLLogObject();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 67109120;
    int v59 = [v10 length];
    _os_log_impl(&dword_1CA552000, v12, OS_LOG_TYPE_ERROR, "Invalid eventData length %u", buf, 8u);
  }

  uint64_t v13 = [[NSString alloc] initWithFormat:@"Invalid eventData length %u", [v10 length]];
  v14 = (void *)v13;
  if (!a8) {
    goto LABEL_33;
  }
  id v15 = *a8;
  v16 = (void *)MEMORY[0x1E4F28C58];
  if (!*a8)
  {
    uint64_t v72 = *MEMORY[0x1E4F28568];
    v73[0] = v13;
    v18 = (void *)MEMORY[0x1E4F1C9E8];
    v19 = v73;
    v20 = &v72;
    goto LABEL_24;
  }
  uint64_t v17 = *MEMORY[0x1E4F28A50];
  v70[0] = *MEMORY[0x1E4F28568];
  v70[1] = v17;
  v71[0] = v13;
  v71[1] = v15;
  v18 = (void *)MEMORY[0x1E4F1C9E8];
  v19 = v71;
  v20 = v70;
LABEL_7:
  uint64_t v21 = 2;
LABEL_25:
  v40 = [v18 dictionaryWithObjects:v19 forKeys:v20 count:v21];
  v41 = v16;
  uint64_t v42 = 6;
LABEL_32:
  *a8 = [v41 errorWithDomain:@"ATL" code:v42 userInfo:v40];

LABEL_33:
  v43 = 0;
LABEL_34:

  return v43;
}

- (id)getAppletStateAndHistory:(id)a3 withApplet:(id)a4 withPackage:(id)a5 withModule:(id)a6 withError:(id *)a7
{
  v24[1] = *MEMORY[0x1E4F143B8];
  v8 = ATLLogObject();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)v20 = 0;
    _os_log_impl(&dword_1CA552000, v8, OS_LOG_TYPE_ERROR, "SeosDecoder doesn't support GetState", v20, 2u);
  }

  uint64_t v9 = [[NSString alloc] initWithFormat:@"SeosDecoder doesn't support GetState"];
  id v10 = (void *)v9;
  if (a7)
  {
    id v11 = *a7;
    v12 = (void *)MEMORY[0x1E4F28C58];
    if (*a7)
    {
      uint64_t v13 = *MEMORY[0x1E4F28A50];
      v21[0] = *MEMORY[0x1E4F28568];
      v21[1] = v13;
      v22[0] = v9;
      v22[1] = v11;
      v14 = (void *)MEMORY[0x1E4F1C9E8];
      id v15 = v22;
      v16 = v21;
      uint64_t v17 = 2;
    }
    else
    {
      uint64_t v23 = *MEMORY[0x1E4F28568];
      v24[0] = v9;
      v14 = (void *)MEMORY[0x1E4F1C9E8];
      id v15 = v24;
      v16 = &v23;
      uint64_t v17 = 1;
    }
    v18 = [v14 dictionaryWithObjects:v15 forKeys:v16 count:v17];
    *a7 = [v12 errorWithDomain:@"ATL" code:2 userInfo:v18];
  }
  return 0;
}

+ (id)parseStartEvent:(id)a3 withApplet:(id)a4 error:(id *)a5
{
  v50[1] = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  if ([v7 length] != 10)
  {
    id v15 = ATLLogObject();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 67109120;
      int v44 = [v7 length];
      _os_log_impl(&dword_1CA552000, v15, OS_LOG_TYPE_ERROR, "Invalid eventData length %u", buf, 8u);
    }

    uint64_t v16 = [[NSString alloc] initWithFormat:@"Invalid eventData length %u", [v7 length]];
    id v10 = (void *)v16;
    if (a5)
    {
      id v17 = *a5;
      v18 = (void *)MEMORY[0x1E4F28C58];
      if (*a5)
      {
        uint64_t v19 = *MEMORY[0x1E4F28A50];
        v47[0] = *MEMORY[0x1E4F28568];
        v47[1] = v19;
        v48[0] = v16;
        v48[1] = v17;
        v20 = (void *)MEMORY[0x1E4F1C9E8];
        uint64_t v21 = v48;
        id v22 = v47;
        uint64_t v23 = 2;
      }
      else
      {
        uint64_t v49 = *MEMORY[0x1E4F28568];
        v50[0] = v16;
        v20 = (void *)MEMORY[0x1E4F1C9E8];
        uint64_t v21 = v50;
        id v22 = &v49;
        uint64_t v23 = 1;
      }
      id v11 = [v20 dictionaryWithObjects:v21 forKeys:v22 count:v23];
      uint64_t v34 = v18;
      uint64_t v35 = 6;
      goto LABEL_19;
    }
LABEL_14:
    v14 = 0;
    goto LABEL_21;
  }
  uint64_t v9 = [v7 bytes];
  if ((~*(_DWORD *)(v9 + 5) & 0xA580) != 0)
  {
    id v24 = ATLLogObject();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
    {
      int v25 = *(_DWORD *)(v9 + 5);
      *(_DWORD *)buf = 67109376;
      int v44 = v25;
      __int16 v45 = 1024;
      int v46 = 42368;
      _os_log_impl(&dword_1CA552000, v24, OS_LOG_TYPE_ERROR, "Unexpected cmd of StartEvent %u (exp) %u", buf, 0xEu);
    }

    uint64_t v26 = [[NSString alloc] initWithFormat:@"Unexpected cmd of StartEvent %u (exp) %u", *(unsigned int *)(v9 + 5), 42368];
    id v10 = (void *)v26;
    if (a5)
    {
      id v27 = *a5;
      id v28 = (void *)MEMORY[0x1E4F28C58];
      if (*a5)
      {
        uint64_t v29 = *MEMORY[0x1E4F28A50];
        v39[0] = *MEMORY[0x1E4F28568];
        v39[1] = v29;
        v40[0] = v26;
        v40[1] = v27;
        uint64_t v30 = (void *)MEMORY[0x1E4F1C9E8];
        v31 = v40;
        v32 = v39;
        uint64_t v33 = 2;
      }
      else
      {
        uint64_t v41 = *MEMORY[0x1E4F28568];
        uint64_t v42 = v26;
        uint64_t v30 = (void *)MEMORY[0x1E4F1C9E8];
        v31 = &v42;
        v32 = &v41;
        uint64_t v33 = 1;
      }
      id v11 = [v30 dictionaryWithObjects:v31 forKeys:v32 count:v33];
      uint64_t v34 = v28;
      uint64_t v35 = 3;
LABEL_19:
      [v34 errorWithDomain:@"ATL" code:v35 userInfo:v11];
      v14 = 0;
      *a5 = (id)objc_claimAutoreleasedReturnValue();
      goto LABEL_20;
    }
    goto LABEL_14;
  }
  v37[0] = @"EventType";
  v37[1] = @"appletIdentifier";
  v38[0] = @"StartEvent";
  v38[1] = v8;
  v37[2] = @"Version";
  id v10 = [NSNumber numberWithUnsignedChar:*(unsigned __int8 *)(v9 + 1)];
  v38[2] = v10;
  v37[3] = @"command";
  id v11 = [NSNumber numberWithUnsignedInt:bswap32(*(_DWORD *)(v9 + 5))];
  v38[3] = v11;
  v37[4] = @"selectStatus";
  v12 = [NSNumber numberWithUnsignedShort:bswap32(*(unsigned __int16 *)(v9 + 2)) >> 16];
  v38[4] = v12;
  v37[5] = @"spIdentifier";
  uint64_t v13 = +[SeosDecoder resolveServiceProvider:*(unsigned __int8 *)(v9 + 9)];
  v37[6] = @"IgnoreRFEvents";
  v37[7] = @"DontWaitForEOT";
  v38[5] = v13;
  v38[6] = MEMORY[0x1E4F1CC38];
  v38[7] = MEMORY[0x1E4F1CC38];
  v38[8] = MEMORY[0x1E4F1CC28];
  v37[8] = @"RequiresPowerCycle";
  v37[9] = @"DelayExpressReentry";
  v38[9] = &unk_1F24E2518;
  v14 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v38 forKeys:v37 count:10];

LABEL_20:
LABEL_21:

  return v14;
}

+ (id)parseEndEvent:(id)a3 withApplet:(id)a4 error:(id *)a5
{
  v107[1] = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  if ((unint64_t)[v7 length] <= 0x30)
  {
    uint64_t v9 = ATLLogObject();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 134218240;
      *(void *)&uint8_t buf[4] = [v7 length];
      *(_WORD *)&buf[12] = 2048;
      *(void *)&buf[14] = 49;
      _os_log_impl(&dword_1CA552000, v9, OS_LOG_TYPE_ERROR, "End event length %zu (exp) %zu", buf, 0x16u);
    }

    uint64_t v10 = [[NSString alloc] initWithFormat:@"End event length %zu (exp) %zu", objc_msgSend(v7, "length"), 49];
    id v11 = (void *)v10;
    if (!a5) {
      goto LABEL_42;
    }
    id v12 = *a5;
    uint64_t v13 = (void *)MEMORY[0x1E4F28C58];
    if (*a5)
    {
      uint64_t v14 = *MEMORY[0x1E4F28A50];
      v104[0] = *MEMORY[0x1E4F28568];
      v104[1] = v14;
      v105[0] = v10;
      v105[1] = v12;
      id v15 = (void *)MEMORY[0x1E4F1C9E8];
      uint64_t v16 = v105;
      id v17 = v104;
LABEL_29:
      uint64_t v45 = 2;
LABEL_41:
      int v59 = [v15 dictionaryWithObjects:v16 forKeys:v17 count:v45];
      *a5 = [v13 errorWithDomain:@"ATL" code:3 userInfo:v59];

LABEL_42:
      v58 = 0;
      goto LABEL_43;
    }
    uint64_t v106 = *MEMORY[0x1E4F28568];
    v107[0] = v10;
    id v15 = (void *)MEMORY[0x1E4F1C9E8];
    uint64_t v16 = v107;
    id v17 = &v106;
    goto LABEL_40;
  }
  id v18 = v7;
  uint64_t v19 = [v18 bytes];
  uint64_t v20 = v19;
  int v21 = *(unsigned __int16 *)(v19 + 40);
  if (v21 != 1 && v21 != 0x4000)
  {
    uint64_t v35 = ATLLogObject();
    if (os_log_type_enabled(v35, OS_LOG_TYPE_ERROR))
    {
      int v36 = *(unsigned __int16 *)(v20 + 40);
      *(_DWORD *)buf = 67109120;
      *(_DWORD *)&uint8_t buf[4] = v36;
      _os_log_impl(&dword_1CA552000, v35, OS_LOG_TYPE_ERROR, "Unexpected Transaction Status %d", buf, 8u);
    }

    uint64_t v37 = [[NSString alloc] initWithFormat:@"Unexpected Transaction Status %d", *(unsigned __int16 *)(v20 + 40)];
    id v11 = (void *)v37;
    if (!a5) {
      goto LABEL_42;
    }
    id v38 = *a5;
    uint64_t v13 = (void *)MEMORY[0x1E4F28C58];
    if (*a5)
    {
      uint64_t v39 = *MEMORY[0x1E4F28A50];
      v100[0] = *MEMORY[0x1E4F28568];
      v100[1] = v39;
      v101[0] = v37;
      v101[1] = v38;
      id v15 = (void *)MEMORY[0x1E4F1C9E8];
      uint64_t v16 = v101;
      id v17 = v100;
      goto LABEL_29;
    }
    uint64_t v102 = *MEMORY[0x1E4F28568];
    uint64_t v103 = v37;
    id v15 = (void *)MEMORY[0x1E4F1C9E8];
    uint64_t v16 = &v103;
    id v17 = &v102;
LABEL_40:
    uint64_t v45 = 1;
    goto LABEL_41;
  }
  if ((*(unsigned __int16 *)(v19 + 42) | 0x2000) != 0x2002)
  {
    v40 = ATLLogObject();
    if (os_log_type_enabled(v40, OS_LOG_TYPE_ERROR))
    {
      int v41 = *(unsigned __int16 *)(v20 + 42);
      *(_DWORD *)buf = 67109120;
      *(_DWORD *)&uint8_t buf[4] = v41;
      _os_log_impl(&dword_1CA552000, v40, OS_LOG_TYPE_ERROR, "Unexpected Informative %d", buf, 8u);
    }

    uint64_t v42 = [[NSString alloc] initWithFormat:@"Unexpected Informative %d", *(unsigned __int16 *)(v20 + 42)];
    id v11 = (void *)v42;
    if (!a5) {
      goto LABEL_42;
    }
    id v43 = *a5;
    uint64_t v13 = (void *)MEMORY[0x1E4F28C58];
    if (*a5)
    {
      uint64_t v44 = *MEMORY[0x1E4F28A50];
      v96[0] = *MEMORY[0x1E4F28568];
      v96[1] = v44;
      v97[0] = v42;
      v97[1] = v43;
      id v15 = (void *)MEMORY[0x1E4F1C9E8];
      uint64_t v16 = v97;
      id v17 = v96;
      goto LABEL_29;
    }
    uint64_t v98 = *MEMORY[0x1E4F28568];
    uint64_t v99 = v42;
    id v15 = (void *)MEMORY[0x1E4F1C9E8];
    uint64_t v16 = &v99;
    id v17 = &v98;
    goto LABEL_40;
  }
  id v11 = [v18 subdataWithRange:NSMakeRange(49, [v18 length] - 49)];
  v76[0] = [v11 bytes];
  v76[1] = [v11 length];
  memset(buf, 0, sizeof(buf));
  uint64_t v22 = DERDecodeItemCtx((uint64_t)v76, (unint64_t *)buf);
  if (v22 || *(void *)buf != 0xE000000000000001)
  {
    int v46 = ATLLogObject();
    if (os_log_type_enabled(v46, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)v93 = 67109376;
      *(_DWORD *)&v93[4] = v22;
      LOWORD(v94[0]) = 2048;
      *(void *)((char *)v94 + 2) = *(void *)buf;
      _os_log_impl(&dword_1CA552000, v46, OS_LOG_TYPE_ERROR, "Failed to decode E1 tag %d or wrong tag 0x%llx", v93, 0x12u);
    }

    id v47 = [NSString alloc];
    uint64_t v48 = [v47 initWithFormat:@"Failed to decode E1 tag %d or wrong tag 0x%llx", v22, *(void *)buf];
    uint64_t v49 = (void *)v48;
    if (a5)
    {
      id v50 = *a5;
      v51 = (void *)MEMORY[0x1E4F28C58];
      if (*a5)
      {
        uint64_t v52 = *MEMORY[0x1E4F28A50];
        v89[0] = *MEMORY[0x1E4F28568];
        v89[1] = v52;
        v90[0] = v48;
        v90[1] = v50;
        uint64_t v53 = (void *)MEMORY[0x1E4F1C9E8];
        v54 = v90;
        v55 = v89;
        uint64_t v56 = 2;
      }
      else
      {
        uint64_t v91 = *MEMORY[0x1E4F28568];
        uint64_t v92 = v48;
        uint64_t v53 = (void *)MEMORY[0x1E4F1C9E8];
        v54 = &v92;
        v55 = &v91;
        uint64_t v56 = 1;
      }
      int v61 = [v53 dictionaryWithObjects:v54 forKeys:v55 count:v56];
      *a5 = [v51 errorWithDomain:@"ATL" code:3 userInfo:v61];
    }
    goto LABEL_42;
  }
  *(void *)v93 = 0;
  v94[0] = 0;
  uint64_t v23 = DERParseSequenceSpec((uint64_t)&buf[8], (uint64_t)&seosE1TLVSpec, (char *)v93, 0x10uLL);
  if (!v23)
  {
    if (v94[0])
    {
      uint64_t v57 = +[SeosDecoder resolveServiceProvider:**(unsigned char **)v93];
    }
    else
    {
      uint64_t v57 = @"ABSENT";
    }
    v75 = v57;
    v80 = v57;
    v81 = @"State";
    v79 = @"SP";
    v63 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v80 forKeys:&v79 count:1];
    v82 = v63;
    v62 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v82 forKeys:&v81 count:1];

    BOOL v64 = *(unsigned __int16 *)(v20 + 42) == 2;
    BOOL v66 = *(_WORD *)(v20 + 40) == 0x4000 && *(_WORD *)(v20 + 2) == 144;
    v77[0] = @"EventType";
    v77[1] = @"appletIdentifier";
    v78[0] = @"EndEvent";
    v78[1] = v8;
    v77[2] = @"Version";
    v74 = [NSNumber numberWithUnsignedChar:*(unsigned __int8 *)(v20 + 1)];
    BOOL v67 = !v66 || !v64;
    v78[2] = v74;
    v77[3] = @"didError";
    if (v66 && v64) {
      uint64_t v68 = 64;
    }
    else {
      uint64_t v68 = 256;
    }
    uint64_t v69 = [NSNumber numberWithBool:v67];
    v78[3] = v69;
    v77[4] = @"command";
    v70 = [NSNumber numberWithUnsignedInt:bswap32(*(_DWORD *)(v20 + 4))];
    v78[4] = v70;
    v77[5] = @"status";
    v71 = [NSNumber numberWithUnsignedShort:bswap32(*(unsigned __int16 *)(v20 + 2)) >> 16];
    v78[5] = v71;
    v77[6] = @"result";
    uint64_t v72 = [NSNumber numberWithUnsignedShort:v68];
    v78[6] = v72;
    v77[7] = @"informative";
    v73 = [NSNumber numberWithUnsignedShort:bswap32(*(unsigned __int16 *)(v20 + 42)) >> 16];
    v78[7] = v73;
    v78[8] = &unk_1F24E2530;
    v77[8] = @"type";
    v77[9] = @"tlv";
    v77[10] = @"parsedInfo";
    v78[9] = v11;
    v78[10] = v62;
    v58 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v78 forKeys:v77 count:11];

    id v27 = v75;
    goto LABEL_62;
  }
  uint64_t v24 = v23;
  int v25 = ATLLogObject();
  if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)v87 = 67109120;
    int v88 = v24;
    _os_log_impl(&dword_1CA552000, v25, OS_LOG_TYPE_ERROR, "Failed to decode E1 contents %d", v87, 8u);
  }

  uint64_t v26 = [[NSString alloc] initWithFormat:@"Failed to decode E1 contents %d", v24];
  id v27 = (void *)v26;
  if (a5)
  {
    id v28 = *a5;
    uint64_t v29 = (void *)MEMORY[0x1E4F28C58];
    if (*a5)
    {
      uint64_t v30 = *MEMORY[0x1E4F28A50];
      v83[0] = *MEMORY[0x1E4F28568];
      v83[1] = v30;
      v84[0] = v26;
      v84[1] = v28;
      v31 = (void *)MEMORY[0x1E4F1C9E8];
      v32 = v84;
      uint64_t v33 = v83;
      uint64_t v34 = 2;
    }
    else
    {
      uint64_t v85 = *MEMORY[0x1E4F28568];
      uint64_t v86 = v26;
      v31 = (void *)MEMORY[0x1E4F1C9E8];
      v32 = &v86;
      uint64_t v33 = &v85;
      uint64_t v34 = 1;
    }
    v62 = [v31 dictionaryWithObjects:v32 forKeys:v33 count:v34];
    [v29 errorWithDomain:@"ATL" code:3 userInfo:v62];
    v58 = 0;
    *a5 = (id)objc_claimAutoreleasedReturnValue();
LABEL_62:

    goto LABEL_63;
  }
  v58 = 0;
LABEL_63:

LABEL_43:

  return v58;
}

- (id)GetAppletProperties:(id)a3 withPackage:(id)a4 withModule:(id)a5 withTransceiver:(id)a6 withError:(id *)a7
{
  v10[2] = *MEMORY[0x1E4F143B8];
  v9[0] = @"Supported";
  v9[1] = @"DelayExpressReentry";
  v10[0] = MEMORY[0x1E4F1CC38];
  v10[1] = &unk_1F24E2518;
  id v7 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v10, v9, count:2, a6, a7];

  return v7;
}

- (id)processEndOfTransaction:(id)a3 withApplet:(id)a4 withPackage:(id)a5 withModule:(id)a6 withError:(id *)a7
{
  v24[1] = *MEMORY[0x1E4F143B8];
  id v8 = ATLLogObject();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)uint64_t v20 = 0;
    _os_log_impl(&dword_1CA552000, v8, OS_LOG_TYPE_ERROR, "SEOS decoder doesn't expect processEndOfTransaction", v20, 2u);
  }

  uint64_t v9 = [[NSString alloc] initWithFormat:@"SEOS decoder doesn't expect processEndOfTransaction"];
  uint64_t v10 = (void *)v9;
  if (a7)
  {
    id v11 = *a7;
    id v12 = (void *)MEMORY[0x1E4F28C58];
    if (*a7)
    {
      uint64_t v13 = *MEMORY[0x1E4F28A50];
      v21[0] = *MEMORY[0x1E4F28568];
      v21[1] = v13;
      v22[0] = v9;
      v22[1] = v11;
      uint64_t v14 = (void *)MEMORY[0x1E4F1C9E8];
      id v15 = v22;
      uint64_t v16 = v21;
      uint64_t v17 = 2;
    }
    else
    {
      uint64_t v23 = *MEMORY[0x1E4F28568];
      v24[0] = v9;
      uint64_t v14 = (void *)MEMORY[0x1E4F1C9E8];
      id v15 = v24;
      uint64_t v16 = &v23;
      uint64_t v17 = 1;
    }
    id v18 = [v14 dictionaryWithObjects:v15 forKeys:v16 count:v17];
    *a7 = [v12 errorWithDomain:@"ATL" code:7 userInfo:v18];
  }
  return 0;
}

+ (id)resolveServiceProvider:(unsigned __int8)a3
{
  uint64_t v3 = a3;
  v11[1] = *MEMORY[0x1E4F143B8];
  uint64_t v10 = &unk_1F24E2548;
  v11[0] = @"HID";
  v4 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v11 forKeys:&v10 count:1];
  v5 = [NSNumber numberWithUnsignedChar:v3];
  v6 = [v4 objectForKeyedSubscript:v5];

  if (v6)
  {
    id v7 = v6;
  }
  else
  {
    [NSString stringWithFormat:@"%d", v3];
    id v7 = (id)objc_claimAutoreleasedReturnValue();
  }
  id v8 = v7;

  return v8;
}

@end