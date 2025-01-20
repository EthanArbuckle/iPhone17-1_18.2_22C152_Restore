@interface SlalomDecoder
+ (id)getDataAndCheckFeliCaServiceCode:(unsigned __int16)a3 withBlockNumber:(unsigned __int8)a4 withTransceiver:(id)a5 withError:(id *)a6;
+ (id)sharedInstance;
- (SlalomDecoder)init;
- (id)DecodeStartE1TLV:(id *)a3 error:(id *)a4;
- (id)DecodeTransactionE1TLV:(id *)a3 error:(id *)a4;
- (id)GetAppletProperties:(id)a3 withPackage:(id)a4 withModule:(id)a5 withTransceiver:(id)a6 withError:(id *)a7;
- (id)getAppletStateAndHistory:(id)a3 withApplet:(id)a4 withPackage:(id)a5 withModule:(id)a6 withError:(id *)a7;
- (id)getServiceProviderData:(id)a3 withPackage:(id)a4 withModule:(id)a5 withPublicKey:(id)a6 withEncryptionScheme:(id)a7 withTransceiver:(id)a8 withError:(id *)a9;
- (id)getServiceProviderData:(id)a3 withPackage:(id)a4 withModule:(id)a5 withTransceiver:(id)a6 withError:(id *)a7;
- (id)parseDeselectEvent:(id)a3 withApplet:(id)a4 error:(id *)a5;
- (id)parseEndEvent:(id)a3 withApplet:(id)a4 withTransceiver:(id)a5 error:(id *)a6;
- (id)parseHCIEvent:(id)a3 withApplet:(id)a4 withPackage:(id)a5 withModule:(id)a6 withTransceiver:(id)a7 withError:(id *)a8;
- (id)parseStartEvent:(id)a3 withApplet:(id)a4 error:(id *)a5;
- (id)parseTransactionEvent:(id)a3 withApplet:(id)a4 error:(id *)a5;
- (id)processEndOfTransaction:(id)a3 withApplet:(id)a4 withPackage:(id)a5 withModule:(id)a6 withError:(id *)a7;
- (void)cleanup;
@end

@implementation SlalomDecoder

+ (id)sharedInstance
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __31__SlalomDecoder_sharedInstance__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (sharedInstance_onceToken_0 != -1) {
    dispatch_once(&sharedInstance_onceToken_0, block);
  }
  v2 = (void *)sharedInstance__singleton_0;

  return v2;
}

uint64_t __31__SlalomDecoder_sharedInstance__block_invoke(uint64_t a1)
{
  sharedInstance__singleton_0 = (uint64_t)objc_alloc_init(*(Class *)(a1 + 32));

  return MEMORY[0x1F41817F8]();
}

- (SlalomDecoder)init
{
  v7.receiver = self;
  v7.super_class = (Class)SlalomDecoder;
  v2 = [(SlalomDecoder *)&v7 init];
  if (v2)
  {
    v3 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    hciArray = v2->_hciArray;
    v2->_hciArray = v3;

    v2->_eotInProgress = 0;
    if (+[AppletTranslator isInternalBuild]())
    {
      v5 = +[AppletTranslator userDefaults]();
      v2->_debug = [v5 BOOLForKey:@"debug.slalom"];
    }
    else
    {
      v2->_debug = 0;
    }
    +[AppletTranslator registerForCleanup:]((uint64_t)AppletTranslator, v2);
  }
  return v2;
}

- (void)cleanup
{
  [(NSMutableArray *)self->_hciArray removeAllObjects];
  self->_eotInProgress = 0;
  serviceProvider = self->_serviceProvider;
  self->_serviceProvider = 0;
}

- (id)parseHCIEvent:(id)a3 withApplet:(id)a4 withPackage:(id)a5 withModule:(id)a6 withTransceiver:(id)a7 withError:(id *)a8
{
  v73[1] = *MEMORY[0x1E4F143B8];
  id v14 = a3;
  id v15 = a4;
  id v16 = a5;
  id v17 = a6;
  id v18 = a7;
  if (self->_eotInProgress) {
    goto LABEL_28;
  }
  if ((unint64_t)[v14 length] <= 1)
  {
    v19 = ATLLogObject();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 67109120;
      *(_DWORD *)v66 = [v14 length];
      _os_log_impl(&dword_1CA552000, v19, OS_LOG_TYPE_ERROR, "Short eventData? %u", buf, 8u);
    }

    uint64_t v20 = [[NSString alloc] initWithFormat:@"Short eventData? %u", [v14 length]];
    v21 = (void *)v20;
    if (!a8) {
      goto LABEL_27;
    }
    id v22 = *a8;
    v23 = (void *)MEMORY[0x1E4F28C58];
    if (*a8)
    {
      uint64_t v24 = *MEMORY[0x1E4F28A50];
      v70[0] = *MEMORY[0x1E4F28568];
      v70[1] = v24;
      v71[0] = v20;
      v71[1] = v22;
      v25 = (void *)MEMORY[0x1E4F1C9E8];
      v26 = v71;
      v27 = v70;
      uint64_t v28 = 2;
    }
    else
    {
      uint64_t v72 = *MEMORY[0x1E4F28568];
      v73[0] = v20;
      v25 = (void *)MEMORY[0x1E4F1C9E8];
      v26 = v73;
      v27 = &v72;
      uint64_t v28 = 1;
    }
    v43 = [v25 dictionaryWithObjects:v26 forKeys:v27 count:v28];
    v44 = v23;
    uint64_t v45 = 6;
LABEL_26:
    *a8 = [v44 errorWithDomain:@"ATL" code:v45 userInfo:v43];

LABEL_27:
LABEL_28:
    v46 = 0;
    goto LABEL_29;
  }
  id v29 = v14;
  uint64_t v30 = *(unsigned __int8 *)[v29 bytes];
  id v31 = v29;
  uint64_t v32 = *(unsigned __int8 *)([v31 bytes] + 1);
  if (v30 == 16 && v32 == 1)
  {
    v33 = ATLLogObject();
    if (os_log_type_enabled(v33, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412802;
      *(void *)v66 = v15;
      *(_WORD *)&v66[8] = 2112;
      id v67 = v16;
      __int16 v68 = 2112;
      id v69 = v17;
      _os_log_impl(&dword_1CA552000, v33, OS_LOG_TYPE_ERROR, "No suitable decoder for AID %@ PID %@ MID %@", buf, 0x20u);
    }

    uint64_t v34 = [[NSString alloc] initWithFormat:@"No suitable decoder for AID %@ PID %@ MID %@", v15, v16, v17];
    v21 = (void *)v34;
    if (!a8) {
      goto LABEL_27;
    }
    id v35 = *a8;
    v36 = (void *)MEMORY[0x1E4F28C58];
    if (*a8)
    {
      uint64_t v37 = *MEMORY[0x1E4F28A50];
      v61[0] = *MEMORY[0x1E4F28568];
      v61[1] = v37;
      v62[0] = v34;
      v62[1] = v35;
      v38 = (void *)MEMORY[0x1E4F1C9E8];
      v39 = v62;
      v40 = v61;
      uint64_t v41 = 2;
    }
    else
    {
      uint64_t v63 = *MEMORY[0x1E4F28568];
      uint64_t v64 = v34;
      v38 = (void *)MEMORY[0x1E4F1C9E8];
      v39 = &v64;
      v40 = &v63;
      uint64_t v41 = 1;
    }
    v43 = [v38 dictionaryWithObjects:v39 forKeys:v40 count:v41];
    v44 = v36;
    uint64_t v45 = 2;
    goto LABEL_26;
  }
  if ((int)v30 > 16)
  {
    if (v30 == 17)
    {
      uint64_t v42 = [(SlalomDecoder *)self parseTransactionEvent:v31 withApplet:v15 error:a8];
      goto LABEL_34;
    }
    if (v30 == 18)
    {
      uint64_t v42 = [(SlalomDecoder *)self parseDeselectEvent:v31 withApplet:v15 error:a8];
      goto LABEL_34;
    }
LABEL_35:
    v48 = ATLLogObject();
    if (os_log_type_enabled(v48, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 67109376;
      *(_DWORD *)v66 = v30;
      *(_WORD *)&v66[4] = 1024;
      *(_DWORD *)&v66[6] = v32;
      _os_log_impl(&dword_1CA552000, v48, OS_LOG_TYPE_ERROR, "Invalid event type 0x%x version 0x%x", buf, 0xEu);
    }

    uint64_t v49 = [[NSString alloc] initWithFormat:@"Invalid event type 0x%x version 0x%x", v30, v32];
    v21 = (void *)v49;
    if (!a8) {
      goto LABEL_27;
    }
    id v50 = *a8;
    v51 = (void *)MEMORY[0x1E4F28C58];
    if (*a8)
    {
      uint64_t v52 = *MEMORY[0x1E4F28A50];
      v57[0] = *MEMORY[0x1E4F28568];
      v57[1] = v52;
      v58[0] = v49;
      v58[1] = v50;
      v53 = (void *)MEMORY[0x1E4F1C9E8];
      v54 = v58;
      v55 = v57;
      uint64_t v56 = 2;
    }
    else
    {
      uint64_t v59 = *MEMORY[0x1E4F28568];
      uint64_t v60 = v49;
      v53 = (void *)MEMORY[0x1E4F1C9E8];
      v54 = &v60;
      v55 = &v59;
      uint64_t v56 = 1;
    }
    v43 = [v53 dictionaryWithObjects:v54 forKeys:v55 count:v56];
    v44 = v51;
    uint64_t v45 = 3;
    goto LABEL_26;
  }
  if (v30 == 1)
  {
    uint64_t v42 = [(SlalomDecoder *)self parseStartEvent:v31 withApplet:v15 error:a8];
    goto LABEL_34;
  }
  if (v30 != 2) {
    goto LABEL_35;
  }
  uint64_t v42 = [(SlalomDecoder *)self parseEndEvent:v31 withApplet:v15 withTransceiver:v18 error:a8];
LABEL_34:
  v46 = (void *)v42;
LABEL_29:

  return v46;
}

- (id)parseStartEvent:(id)a3 withApplet:(id)a4 error:(id *)a5
{
  uint64_t v66 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  if ([v8 length] == 22)
  {
    id v10 = v8;
    uint64_t v11 = [v10 bytes];
    if (*(unsigned char *)(v11 + 1) == 7)
    {
      v55[0] = &unk_1F24E1FC0;
      v55[1] = &unk_1F24E1FD8;
      v56[0] = @"Contact";
      v56[1] = @"Contactless";
      v12 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v56 forKeys:v55 count:2];
      v13 = [NSNumber numberWithUnsignedChar:*(unsigned __int8 *)(v11 + 2)];
      id v14 = [v12 objectForKeyedSubscript:v13];

      if (v14)
      {
        *(void *)v65 = v11 + 3;
        *(void *)&v65[8] = [v10 length] - 3;
        id v15 = [(SlalomDecoder *)self DecodeStartE1TLV:v65 error:a5];
        v49[0] = @"EventType";
        v49[1] = @"appletIdentifier";
        v50[0] = @"StartEvent";
        v50[1] = v9;
        v49[2] = @"Version";
        id v16 = [NSNumber numberWithUnsignedChar:*(unsigned __int8 *)(v11 + 1)];
        v50[2] = v16;
        v50[3] = v14;
        v49[3] = @"Interface";
        v49[4] = @"IgnoreRFEvents";
        v50[4] = MEMORY[0x1E4F1CC28];
        v50[5] = MEMORY[0x1E4F1CC38];
        v49[5] = @"DontWaitForEOT";
        v49[6] = @"RequiresPowerCycle";
        v50[6] = MEMORY[0x1E4F1CC38];
        v50[7] = MEMORY[0x1E4F1CC38];
        v49[7] = @"EoTCallbackExpected";
        v49[8] = @"DelayExpressReentry";
        v50[8] = &unk_1F24E1FF0;
        id v17 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v50 forKeys:v49 count:9];

        id v18 = ATLLogObject();
        if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 138412290;
          v48 = v17;
          _os_log_impl(&dword_1CA552000, v18, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
        }

        v19 = [MEMORY[0x1E4F1CA60] dictionaryWithDictionary:v17];
        [(NSMutableArray *)self->_hciArray addObject:v19];
      }
      else
      {
        uint64_t v34 = ATLLogObject();
        if (os_log_type_enabled(v34, OS_LOG_TYPE_ERROR))
        {
          int v35 = *(unsigned __int8 *)(v11 + 2);
          *(_DWORD *)v65 = 67109120;
          *(_DWORD *)&v65[4] = v35;
          _os_log_impl(&dword_1CA552000, v34, OS_LOG_TYPE_ERROR, "Unknown interface type %u", v65, 8u);
        }

        uint64_t v36 = [[NSString alloc] initWithFormat:@"Unknown interface type %u", *(unsigned __int8 *)(v11 + 2)];
        uint64_t v37 = (void *)v36;
        if (a5)
        {
          id v38 = *a5;
          v39 = (void *)MEMORY[0x1E4F28C58];
          if (*a5)
          {
            uint64_t v40 = *MEMORY[0x1E4F28A50];
            v51[0] = *MEMORY[0x1E4F28568];
            v51[1] = v40;
            v52[0] = v36;
            v52[1] = v38;
            uint64_t v41 = (void *)MEMORY[0x1E4F1C9E8];
            uint64_t v42 = v52;
            v43 = v51;
            uint64_t v44 = 2;
          }
          else
          {
            uint64_t v53 = *MEMORY[0x1E4F28568];
            uint64_t v54 = v36;
            uint64_t v41 = (void *)MEMORY[0x1E4F1C9E8];
            uint64_t v42 = &v54;
            v43 = &v53;
            uint64_t v44 = 1;
          }
          v46 = [v41 dictionaryWithObjects:v42 forKeys:v43 count:v44];
          *a5 = [v39 errorWithDomain:@"ATL" code:3 userInfo:v46];
        }
      }
      goto LABEL_27;
    }
    uint64_t v28 = ATLLogObject();
    if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
    {
      int v29 = *(unsigned __int8 *)(v11 + 1);
      *(_DWORD *)v65 = 67109120;
      *(_DWORD *)&v65[4] = v29;
      _os_log_impl(&dword_1CA552000, v28, OS_LOG_TYPE_ERROR, "Start Event version %u", v65, 8u);
    }

    uint64_t v30 = [[NSString alloc] initWithFormat:@"Start Event version %u", *(unsigned __int8 *)(v11 + 1)];
    v12 = (void *)v30;
    if (a5)
    {
      id v31 = *a5;
      v23 = (void *)MEMORY[0x1E4F28C58];
      if (*a5)
      {
        uint64_t v32 = *MEMORY[0x1E4F28A50];
        v57[0] = *MEMORY[0x1E4F28568];
        v57[1] = v32;
        v58[0] = v30;
        v58[1] = v31;
        v25 = (void *)MEMORY[0x1E4F1C9E8];
        v26 = v58;
        v27 = v57;
        goto LABEL_17;
      }
      uint64_t v59 = *MEMORY[0x1E4F28568];
      uint64_t v60 = v30;
      v25 = (void *)MEMORY[0x1E4F1C9E8];
      v26 = &v60;
      v27 = &v59;
      goto LABEL_25;
    }
  }
  else
  {
    uint64_t v20 = ATLLogObject();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)v65 = 134218240;
      *(void *)&v65[4] = [v8 length];
      *(_WORD *)&v65[12] = 2048;
      *(void *)&v65[14] = 22;
      _os_log_impl(&dword_1CA552000, v20, OS_LOG_TYPE_ERROR, "Start Event length %zu (exp %zu)", v65, 0x16u);
    }

    uint64_t v21 = [[NSString alloc] initWithFormat:@"Start Event length %zu (exp %zu)", objc_msgSend(v8, "length"), 22];
    v12 = (void *)v21;
    if (a5)
    {
      id v22 = *a5;
      v23 = (void *)MEMORY[0x1E4F28C58];
      if (*a5)
      {
        uint64_t v24 = *MEMORY[0x1E4F28A50];
        v61[0] = *MEMORY[0x1E4F28568];
        v61[1] = v24;
        v62[0] = v21;
        v62[1] = v22;
        v25 = (void *)MEMORY[0x1E4F1C9E8];
        v26 = v62;
        v27 = v61;
LABEL_17:
        uint64_t v33 = 2;
LABEL_26:
        id v14 = [v25 dictionaryWithObjects:v26 forKeys:v27 count:v33];
        *a5 = [v23 errorWithDomain:@"ATL" code:3 userInfo:v14];
LABEL_27:

        goto LABEL_28;
      }
      uint64_t v63 = *MEMORY[0x1E4F28568];
      uint64_t v64 = v21;
      v25 = (void *)MEMORY[0x1E4F1C9E8];
      v26 = &v64;
      v27 = &v63;
LABEL_25:
      uint64_t v33 = 1;
      goto LABEL_26;
    }
  }
LABEL_28:

  return 0;
}

- (id)parseEndEvent:(id)a3 withApplet:(id)a4 withTransceiver:(id)a5 error:(id *)a6
{
  uint64_t v38 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  if ([v7 length] != 2)
  {
    uint64_t v20 = ATLLogObject();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 134218240;
      *(void *)uint64_t v36 = [v7 length];
      *(_WORD *)&v36[8] = 2048;
      uint64_t v37 = 2;
      _os_log_impl(&dword_1CA552000, v20, OS_LOG_TYPE_ERROR, "End Event length %zu (exp %zu)", buf, 0x16u);
    }

    uint64_t v21 = [[NSString alloc] initWithFormat:@"End Event length %zu (exp %zu)", objc_msgSend(v7, "length"), 2];
    v13 = (void *)v21;
    if (!a6) {
      goto LABEL_18;
    }
    id v22 = *a6;
    id v15 = (void *)MEMORY[0x1E4F28C58];
    if (*a6)
    {
      uint64_t v23 = *MEMORY[0x1E4F28A50];
      v31[0] = *MEMORY[0x1E4F28568];
      v31[1] = v23;
      v32[0] = v21;
      v32[1] = v22;
      id v17 = (void *)MEMORY[0x1E4F1C9E8];
      id v18 = v32;
      v19 = v31;
      goto LABEL_13;
    }
    uint64_t v33 = *MEMORY[0x1E4F28568];
    uint64_t v34 = v21;
    id v17 = (void *)MEMORY[0x1E4F1C9E8];
    id v18 = &v34;
    v19 = &v33;
LABEL_16:
    uint64_t v24 = 1;
    goto LABEL_17;
  }
  uint64_t v8 = [v7 bytes];
  if (*(unsigned char *)(v8 + 1) != 7)
  {
    uint64_t v9 = v8;
    id v10 = ATLLogObject();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      int v11 = *(unsigned __int8 *)(v9 + 1);
      *(_DWORD *)buf = 67109376;
      *(_DWORD *)uint64_t v36 = v11;
      *(_WORD *)&v36[4] = 1024;
      *(_DWORD *)&v36[6] = 7;
      _os_log_impl(&dword_1CA552000, v10, OS_LOG_TYPE_ERROR, "End Event version %u (exp %u)", buf, 0xEu);
    }

    uint64_t v12 = [[NSString alloc] initWithFormat:@"End Event version %u (exp %u)", *(unsigned __int8 *)(v9 + 1), 7];
    v13 = (void *)v12;
    if (!a6) {
      goto LABEL_18;
    }
    id v14 = *a6;
    id v15 = (void *)MEMORY[0x1E4F28C58];
    if (*a6)
    {
      uint64_t v16 = *MEMORY[0x1E4F28A50];
      v27[0] = *MEMORY[0x1E4F28568];
      v27[1] = v16;
      v28[0] = v12;
      v28[1] = v14;
      id v17 = (void *)MEMORY[0x1E4F1C9E8];
      id v18 = v28;
      v19 = v27;
LABEL_13:
      uint64_t v24 = 2;
LABEL_17:
      v25 = [v17 dictionaryWithObjects:v18 forKeys:v19 count:v24];
      *a6 = [v15 errorWithDomain:@"ATL" code:3 userInfo:v25];

LABEL_18:
      goto LABEL_19;
    }
    uint64_t v29 = *MEMORY[0x1E4F28568];
    uint64_t v30 = v12;
    id v17 = (void *)MEMORY[0x1E4F1C9E8];
    id v18 = &v30;
    v19 = &v29;
    goto LABEL_16;
  }
LABEL_19:

  return 0;
}

- (id)parseDeselectEvent:(id)a3 withApplet:(id)a4 error:(id *)a5
{
  uint64_t v61 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  if ([v8 length] == 3)
  {
    uint64_t v10 = [v8 bytes];
    if (*(unsigned char *)(v10 + 1) == 7)
    {
      v48[0] = &unk_1F24E1FC0;
      v48[1] = &unk_1F24E1FD8;
      v49[0] = @"Contact";
      v49[1] = @"Contactless";
      int v11 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v49 forKeys:v48 count:2];
      uint64_t v12 = [NSNumber numberWithUnsignedChar:*(unsigned __int8 *)(v10 + 2)];
      v13 = [v11 objectForKeyedSubscript:v12];

      if (v13)
      {
        v42[0] = @"EventType";
        v42[1] = @"appletIdentifier";
        v43[0] = @"DeselectEvent";
        v43[1] = v9;
        v42[2] = @"Interface";
        v43[2] = v13;
        id v14 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v43 forKeys:v42 count:3];
        id v15 = ATLLogObject();
        if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 138412290;
          *(void *)uint64_t v59 = v14;
          _os_log_impl(&dword_1CA552000, v15, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
        }

        [(NSMutableArray *)self->_hciArray addObject:v14];
      }
      else
      {
        uint64_t v30 = ATLLogObject();
        if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
        {
          int v31 = *(unsigned __int8 *)(v10 + 2);
          *(_DWORD *)buf = 67109120;
          *(_DWORD *)uint64_t v59 = v31;
          _os_log_impl(&dword_1CA552000, v30, OS_LOG_TYPE_ERROR, "Unknown interface type %u", buf, 8u);
        }

        uint64_t v32 = [[NSString alloc] initWithFormat:@"Unknown interface type %u", *(unsigned __int8 *)(v10 + 2)];
        id v14 = (void *)v32;
        if (a5)
        {
          id v33 = *a5;
          uint64_t v34 = (void *)MEMORY[0x1E4F28C58];
          if (*a5)
          {
            uint64_t v35 = *MEMORY[0x1E4F28A50];
            v44[0] = *MEMORY[0x1E4F28568];
            v44[1] = v35;
            v45[0] = v32;
            v45[1] = v33;
            uint64_t v36 = (void *)MEMORY[0x1E4F1C9E8];
            uint64_t v37 = v45;
            uint64_t v38 = v44;
            uint64_t v39 = 2;
          }
          else
          {
            uint64_t v46 = *MEMORY[0x1E4F28568];
            uint64_t v47 = v32;
            uint64_t v36 = (void *)MEMORY[0x1E4F1C9E8];
            uint64_t v37 = &v47;
            uint64_t v38 = &v46;
            uint64_t v39 = 1;
          }
          uint64_t v40 = [v36 dictionaryWithObjects:v37 forKeys:v38 count:v39];
          *a5 = [v34 errorWithDomain:@"ATL" code:3 userInfo:v40];
        }
      }

      goto LABEL_30;
    }
    uint64_t v24 = ATLLogObject();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
    {
      int v25 = *(unsigned __int8 *)(v10 + 1);
      *(_DWORD *)buf = 67109376;
      *(_DWORD *)uint64_t v59 = v25;
      *(_WORD *)&v59[4] = 1024;
      *(_DWORD *)&v59[6] = 1;
      _os_log_impl(&dword_1CA552000, v24, OS_LOG_TYPE_ERROR, "Deselect Event version  %u (exp %u)", buf, 0xEu);
    }

    uint64_t v26 = [[NSString alloc] initWithFormat:@"Deselect Event version  %u (exp %u)", *(unsigned __int8 *)(v10 + 1), 1];
    int v11 = (void *)v26;
    if (a5)
    {
      id v27 = *a5;
      v19 = (void *)MEMORY[0x1E4F28C58];
      if (*a5)
      {
        uint64_t v28 = *MEMORY[0x1E4F28A50];
        v50[0] = *MEMORY[0x1E4F28568];
        v50[1] = v28;
        v51[0] = v26;
        v51[1] = v27;
        uint64_t v21 = (void *)MEMORY[0x1E4F1C9E8];
        id v22 = v51;
        uint64_t v23 = v50;
        goto LABEL_17;
      }
      uint64_t v52 = *MEMORY[0x1E4F28568];
      uint64_t v53 = v26;
      uint64_t v21 = (void *)MEMORY[0x1E4F1C9E8];
      id v22 = &v53;
      uint64_t v23 = &v52;
      goto LABEL_25;
    }
  }
  else
  {
    uint64_t v16 = ATLLogObject();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 134218240;
      *(void *)uint64_t v59 = [v8 length];
      *(_WORD *)&v59[8] = 2048;
      uint64_t v60 = 3;
      _os_log_impl(&dword_1CA552000, v16, OS_LOG_TYPE_ERROR, "Deselect Event length %zu (exp %zu)", buf, 0x16u);
    }

    uint64_t v17 = [[NSString alloc] initWithFormat:@"Deselect Event length %zu (exp %zu)", objc_msgSend(v8, "length"), 3];
    int v11 = (void *)v17;
    if (a5)
    {
      id v18 = *a5;
      v19 = (void *)MEMORY[0x1E4F28C58];
      if (*a5)
      {
        uint64_t v20 = *MEMORY[0x1E4F28A50];
        v54[0] = *MEMORY[0x1E4F28568];
        v54[1] = v20;
        v55[0] = v17;
        v55[1] = v18;
        uint64_t v21 = (void *)MEMORY[0x1E4F1C9E8];
        id v22 = v55;
        uint64_t v23 = v54;
LABEL_17:
        uint64_t v29 = 2;
LABEL_26:
        v13 = [v21 dictionaryWithObjects:v22 forKeys:v23 count:v29];
        *a5 = [v19 errorWithDomain:@"ATL" code:3 userInfo:v13];
LABEL_30:

        goto LABEL_31;
      }
      uint64_t v56 = *MEMORY[0x1E4F28568];
      uint64_t v57 = v17;
      uint64_t v21 = (void *)MEMORY[0x1E4F1C9E8];
      id v22 = &v57;
      uint64_t v23 = &v56;
LABEL_25:
      uint64_t v29 = 1;
      goto LABEL_26;
    }
  }
LABEL_31:

  return 0;
}

- (id)parseTransactionEvent:(id)a3 withApplet:(id)a4 error:(id *)a5
{
  uint64_t v89 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  if ((unint64_t)[v8 length] <= 2)
  {
    uint64_t v10 = ATLLogObject();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 134218240;
      *(void *)&uint8_t buf[4] = [v8 length];
      *(_WORD *)&buf[12] = 2048;
      *(void *)&buf[14] = 3;
      _os_log_impl(&dword_1CA552000, v10, OS_LOG_TYPE_ERROR, "Transaction Event length %zu (at least %zu)", buf, 0x16u);
    }

    uint64_t v11 = [[NSString alloc] initWithFormat:@"Transaction Event length %zu (at least %zu)", [v8 length], 3];
    uint64_t v12 = (void *)v11;
    if (!a5) {
      goto LABEL_45;
    }
    id v13 = *a5;
    id v14 = (void *)MEMORY[0x1E4F28C58];
    if (*a5)
    {
      uint64_t v15 = *MEMORY[0x1E4F28A50];
      v84[0] = *MEMORY[0x1E4F28568];
      v84[1] = v15;
      v85[0] = v11;
      v85[1] = v13;
      uint64_t v16 = (void *)MEMORY[0x1E4F1C9E8];
      uint64_t v17 = v85;
      id v18 = v84;
LABEL_27:
      uint64_t v41 = 2;
LABEL_44:
      uint64_t v56 = [v16 dictionaryWithObjects:v17 forKeys:v18 count:v41];
      *a5 = [v14 errorWithDomain:@"ATL" code:3 userInfo:v56];

LABEL_45:
      v55 = 0;
      goto LABEL_51;
    }
    uint64_t v86 = *MEMORY[0x1E4F28568];
    uint64_t v87 = v11;
    uint64_t v16 = (void *)MEMORY[0x1E4F1C9E8];
    uint64_t v17 = &v87;
    id v18 = &v86;
    goto LABEL_43;
  }
  id v19 = v8;
  uint64_t v20 = [v19 bytes];
  uint64_t v21 = v20;
  if (*(unsigned char *)(v20 + 1) != 7)
  {
    uint64_t v36 = ATLLogObject();
    if (os_log_type_enabled(v36, OS_LOG_TYPE_ERROR))
    {
      int v37 = *(unsigned __int8 *)(v21 + 1);
      *(_DWORD *)buf = 67109376;
      *(_DWORD *)&uint8_t buf[4] = v37;
      *(_WORD *)&buf[8] = 1024;
      *(_DWORD *)&buf[10] = 7;
      _os_log_impl(&dword_1CA552000, v36, OS_LOG_TYPE_ERROR, "Transaction Event version %u (exp %u)", buf, 0xEu);
    }

    uint64_t v38 = [[NSString alloc] initWithFormat:@"Transaction Event version %u (exp %u)", *(unsigned __int8 *)(v21 + 1), 7];
    uint64_t v12 = (void *)v38;
    if (!a5) {
      goto LABEL_45;
    }
    id v39 = *a5;
    id v14 = (void *)MEMORY[0x1E4F28C58];
    if (*a5)
    {
      uint64_t v40 = *MEMORY[0x1E4F28A50];
      v80[0] = *MEMORY[0x1E4F28568];
      v80[1] = v40;
      v81[0] = v38;
      v81[1] = v39;
      uint64_t v16 = (void *)MEMORY[0x1E4F1C9E8];
      uint64_t v17 = v81;
      id v18 = v80;
      goto LABEL_27;
    }
    uint64_t v82 = *MEMORY[0x1E4F28568];
    uint64_t v83 = v38;
    uint64_t v16 = (void *)MEMORY[0x1E4F1C9E8];
    uint64_t v17 = &v83;
    id v18 = &v82;
LABEL_43:
    uint64_t v41 = 1;
    goto LABEL_44;
  }
  *(void *)buf = v20 + 3;
  *(void *)&buf[8] = [v19 length] - 3;
  id v22 = [(SlalomDecoder *)self DecodeTransactionE1TLV:buf error:a5];
  v78[0] = &unk_1F24E1FC0;
  v78[1] = &unk_1F24E1FD8;
  v79[0] = @"Contact";
  v79[1] = @"Contactless";
  uint64_t v23 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v79 forKeys:v78 count:2];
  uint64_t v24 = [NSNumber numberWithUnsignedChar:*(unsigned __int8 *)(v21 + 2)];
  int v25 = [v23 objectForKeyedSubscript:v24];

  if (v25)
  {
    v72[0] = @"EventType";
    v72[1] = @"appletIdentifier";
    v73[0] = @"TransactionEvent";
    v73[1] = v9;
    v72[2] = @"Version";
    uint64_t v26 = [NSNumber numberWithUnsignedChar:*(unsigned __int8 *)(v21 + 1)];
    v73[2] = v26;
    void v73[3] = v25;
    uint64_t v61 = v25;
    v72[3] = @"Interface";
    v72[4] = @"type";
    v73[4] = &unk_1F24E2008;
    v72[5] = @"tlv";
    id v27 = [MEMORY[0x1E4F1C9B8] dataWithDERItem:buf];
    v73[5] = v27;
    v72[6] = @"parsedInfo";
    uint64_t v28 = v22;
    if (!v22)
    {
      uint64_t v28 = [MEMORY[0x1E4F1CA98] null];
    }
    v73[6] = v28;
    uint64_t v60 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v73 forKeys:v72 count:7];
    if (!v22) {

    }
    v62 = v23;
    long long v65 = 0u;
    long long v66 = 0u;
    long long v63 = 0u;
    long long v64 = 0u;
    uint64_t v29 = self->_hciArray;
    uint64_t v30 = [(NSMutableArray *)v29 countByEnumeratingWithState:&v63 objects:v71 count:16];
    if (v30)
    {
      uint64_t v31 = v30;
      v58 = v22;
      id v59 = v9;
      uint64_t v32 = *(void *)v64;
      while (2)
      {
        for (uint64_t i = 0; i != v31; ++i)
        {
          if (*(void *)v64 != v32) {
            objc_enumerationMutation(v29);
          }
          uint64_t v34 = [*(id *)(*((void *)&v63 + 1) + 8 * i) objectForKeyedSubscript:@"EventType"];

          if (v34 == @"TransactionEvent")
          {
            int v35 = 0;
            goto LABEL_30;
          }
        }
        uint64_t v31 = [(NSMutableArray *)v29 countByEnumeratingWithState:&v63 objects:v71 count:16];
        if (v31) {
          continue;
        }
        break;
      }
      int v35 = 1;
LABEL_30:
      id v22 = v58;
      id v9 = v59;
    }
    else
    {
      int v35 = 1;
    }

    uint64_t v45 = (void *)v60;
    [(NSMutableArray *)self->_hciArray addObject:v60];
    uint64_t v53 = ATLLogObject();
    int v25 = v61;
    if (os_log_type_enabled(v53, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)id v69 = 138412290;
      uint64_t v70 = v60;
      _os_log_impl(&dword_1CA552000, v53, OS_LOG_TYPE_DEBUG, "%@", v69, 0xCu);
    }

    if (v35)
    {
      v67[0] = @"EventType";
      v67[1] = @"paymentMode";
      v68[0] = @"StartEvent";
      v68[1] = &unk_1F24E2020;
      v67[2] = @"appletIdentifier";
      v67[3] = @"Interface";
      v68[2] = v9;
      v68[3] = v61;
      v67[4] = @"Version";
      uint64_t v54 = [NSNumber numberWithUnsignedChar:*(unsigned __int8 *)(v21 + 1)];
      v68[4] = v54;
      v68[5] = MEMORY[0x1E4F1CC28];
      v67[5] = @"IgnoreRFEvents";
      v67[6] = @"DontWaitForEOT";
      v68[6] = MEMORY[0x1E4F1CC38];
      v68[7] = MEMORY[0x1E4F1CC38];
      v67[7] = @"RequiresPowerCycle";
      v67[8] = @"EoTCallbackExpected";
      v67[9] = @"DelayExpressReentry";
      v68[8] = MEMORY[0x1E4F1CC38];
      v68[9] = &unk_1F24E1FF0;
      v55 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v68 forKeys:v67 count:10];
      uint64_t v23 = v62;
LABEL_49:

      goto LABEL_50;
    }
    v55 = 0;
    uint64_t v23 = v62;
  }
  else
  {
    uint64_t v42 = ATLLogObject();
    if (os_log_type_enabled(v42, OS_LOG_TYPE_ERROR))
    {
      int v43 = *(unsigned __int8 *)(v21 + 2);
      *(_DWORD *)id v69 = 67109120;
      LODWORD(v70) = v43;
      _os_log_impl(&dword_1CA552000, v42, OS_LOG_TYPE_ERROR, "Unknown interface type %u", v69, 8u);
    }

    uint64_t v44 = [[NSString alloc] initWithFormat:@"Unknown interface type %u", *(unsigned __int8 *)(v21 + 2)];
    uint64_t v45 = (void *)v44;
    if (a5)
    {
      id v46 = *a5;
      uint64_t v47 = (void *)MEMORY[0x1E4F28C58];
      if (*a5)
      {
        uint64_t v48 = *MEMORY[0x1E4F28A50];
        v74[0] = *MEMORY[0x1E4F28568];
        v74[1] = v48;
        v75[0] = v44;
        v75[1] = v46;
        uint64_t v49 = (void *)MEMORY[0x1E4F1C9E8];
        id v50 = v75;
        v51 = v74;
        uint64_t v52 = 2;
      }
      else
      {
        uint64_t v76 = *MEMORY[0x1E4F28568];
        uint64_t v77 = v44;
        uint64_t v49 = (void *)MEMORY[0x1E4F1C9E8];
        id v50 = &v77;
        v51 = &v76;
        uint64_t v52 = 1;
      }
      uint64_t v54 = [v49 dictionaryWithObjects:v50 forKeys:v51 count:v52];
      [v47 errorWithDomain:@"ATL" code:3 userInfo:v54];
      v55 = 0;
      *a5 = (id)objc_claimAutoreleasedReturnValue();
      goto LABEL_49;
    }
    v55 = 0;
  }
LABEL_50:

LABEL_51:

  return v55;
}

- (id)DecodeTransactionE1TLV:(id *)a3 error:(id *)a4
{
  v112[1] = *MEMORY[0x1E4F143B8];
  unint64_t v82 = 0;
  uint64_t v83 = 0;
  uint64_t v84 = 0;
  uint64_t v6 = DERDecodeItemCtx((uint64_t)a3, &v82);
  if (v6)
  {
    uint64_t v7 = v6;
    id v8 = ATLLogObject();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 67109120;
      LODWORD(v108) = v7;
      _os_log_impl(&dword_1CA552000, v8, OS_LOG_TYPE_ERROR, "Failed to decode Transaction Event E1 %d", buf, 8u);
    }

    uint64_t v9 = [[NSString alloc] initWithFormat:@"Failed to decode Transaction Event E1 %d", v7];
    uint64_t v10 = (void *)v9;
    if (a4)
    {
      id v11 = *a4;
      uint64_t v12 = (void *)MEMORY[0x1E4F28C58];
      if (*a4)
      {
        uint64_t v13 = *MEMORY[0x1E4F28A50];
        v109[0] = *MEMORY[0x1E4F28568];
        v109[1] = v13;
        v110[0] = v9;
        v110[1] = v11;
        id v14 = (void *)MEMORY[0x1E4F1C9E8];
        uint64_t v15 = v110;
        uint64_t v16 = v109;
        uint64_t v17 = 2;
      }
      else
      {
        uint64_t v111 = *MEMORY[0x1E4F28568];
        v112[0] = v9;
        id v14 = (void *)MEMORY[0x1E4F1C9E8];
        uint64_t v15 = v112;
        uint64_t v16 = &v111;
        uint64_t v17 = 1;
      }
      uint64_t v45 = [v14 dictionaryWithObjects:v15 forKeys:v16 count:v17];
      *a4 = [v12 errorWithDomain:@"ATL" code:3 userInfo:v45];
    }
LABEL_32:
    id v33 = 0;
    goto LABEL_33;
  }
  if (v82 != 0xE000000000000001)
  {
    uint64_t v34 = ATLLogObject();
    if (os_log_type_enabled(v34, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 134217984;
      unint64_t v108 = v82;
      _os_log_impl(&dword_1CA552000, v34, OS_LOG_TYPE_ERROR, "Unexpected tag 0x%llx", buf, 0xCu);
    }

    id v35 = [NSString alloc];
    uint64_t v80 = v82;
    uint64_t v36 = [v35 initWithFormat:@"Unexpected tag 0x%llx"];
    int v37 = (void *)v36;
    if (a4)
    {
      id v38 = *a4;
      id v39 = (void *)MEMORY[0x1E4F28C58];
      if (*a4)
      {
        uint64_t v40 = *MEMORY[0x1E4F28A50];
        v103[0] = *MEMORY[0x1E4F28568];
        v103[1] = v40;
        v104[0] = v36;
        v104[1] = v38;
        uint64_t v41 = (void *)MEMORY[0x1E4F1C9E8];
        uint64_t v42 = v104;
        int v43 = v103;
        uint64_t v44 = 2;
      }
      else
      {
        uint64_t v105 = *MEMORY[0x1E4F28568];
        uint64_t v106 = v36;
        uint64_t v41 = (void *)MEMORY[0x1E4F1C9E8];
        uint64_t v42 = &v106;
        int v43 = &v105;
        uint64_t v44 = 1;
      }
      id v46 = [v41 dictionaryWithObjects:v42 forKeys:v43 count:v44];
      *a4 = [v39 errorWithDomain:@"ATL" code:3 userInfo:v46];
    }
    LogBinary(OS_LOG_TYPE_ERROR, (uint64_t)"-[SlalomDecoder DecodeTransactionE1TLV:error:]", 356, (uint64_t)a3->var0, a3->var1, @"E1 TLV data", v47, v48, v80);
    goto LABEL_32;
  }
  id v18 = [MEMORY[0x1E4F1CA48] array];
  v81 = [MEMORY[0x1E4F1CA48] array];
  int v19 = v84;
  if ((int)v84 < 1)
  {
LABEL_20:
    v85[0] = @"OPRead";
    v85[1] = @"OPWrite";
    uint64_t v32 = v81;
    v86[0] = v18;
    v86[1] = v81;
    id v33 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v86 forKeys:v85 count:2];
    goto LABEL_66;
  }
  int v20 = 0;
  uint64_t v21 = v83;
  while (1)
  {
    if (v19 - v20 <= 1)
    {
      id v50 = [MEMORY[0x1E4F1C9B8] dataWithBytes:v21];
      v51 = ATLLogObject();
      if (os_log_type_enabled(v51, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        unint64_t v108 = (unint64_t)v50;
        _os_log_impl(&dword_1CA552000, v51, OS_LOG_TYPE_ERROR, "Failed to decode Transaction Event E1, length issue: %@", buf, 0xCu);
      }

      uint64_t v52 = [[NSString alloc] initWithFormat:@"Failed to decode Transaction Event E1, length issue: %@", v50];
      uint64_t v53 = (void *)v52;
      if (!a4) {
        goto LABEL_64;
      }
      id v54 = *a4;
      v55 = (void *)MEMORY[0x1E4F28C58];
      if (*a4)
      {
        uint64_t v56 = *MEMORY[0x1E4F28A50];
        v99[0] = *MEMORY[0x1E4F28568];
        v99[1] = v56;
        v100[0] = v52;
        v100[1] = v54;
        uint64_t v57 = (void *)MEMORY[0x1E4F1C9E8];
        v58 = v100;
        id v59 = v99;
        goto LABEL_56;
      }
      uint64_t v101 = *MEMORY[0x1E4F28568];
      uint64_t v102 = v52;
      uint64_t v57 = (void *)MEMORY[0x1E4F1C9E8];
      v58 = &v102;
      id v59 = &v101;
      goto LABEL_62;
    }
    id v22 = (unsigned __int8 *)(v21 + v20);
    uint64_t v23 = *v22;
    uint64_t v24 = v20 + 2;
    if (v23 != 194) {
      break;
    }
    if (v19 - (int)v24 <= 3)
    {
      id v50 = [MEMORY[0x1E4F1C9B8] dataWithBytes:v21];
      v73 = ATLLogObject();
      if (os_log_type_enabled(v73, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        unint64_t v108 = (unint64_t)v50;
        _os_log_impl(&dword_1CA552000, v73, OS_LOG_TYPE_ERROR, "Failed to decode Transaction Event C2 tag, length issue: %@", buf, 0xCu);
      }

      uint64_t v74 = [[NSString alloc] initWithFormat:@"Failed to decode Transaction Event C2 tag, length issue: %@", v50];
      uint64_t v53 = (void *)v74;
      if (!a4) {
        goto LABEL_64;
      }
      id v75 = *a4;
      v55 = (void *)MEMORY[0x1E4F28C58];
      if (*a4)
      {
        uint64_t v76 = *MEMORY[0x1E4F28A50];
        v91[0] = *MEMORY[0x1E4F28568];
        v91[1] = v76;
        v92[0] = v74;
        v92[1] = v75;
        uint64_t v57 = (void *)MEMORY[0x1E4F1C9E8];
        v58 = v92;
        id v59 = v91;
LABEL_56:
        uint64_t v77 = 2;
LABEL_63:
        v79 = [v57 dictionaryWithObjects:v58 forKeys:v59 count:v77];
        *a4 = [v55 errorWithDomain:@"ATL" code:3 userInfo:v79];

LABEL_64:
        goto LABEL_65;
      }
      uint64_t v93 = *MEMORY[0x1E4F28568];
      uint64_t v94 = v74;
      uint64_t v57 = (void *)MEMORY[0x1E4F1C9E8];
      v58 = &v94;
      id v59 = &v93;
LABEL_62:
      uint64_t v77 = 1;
      goto LABEL_63;
    }
    id v27 = v18;
    int v28 = v22[1];
    int v25 = objc_alloc_init(SlalomWriteOperation);
    uint64_t v29 = *(unsigned __int16 *)(v24 + v21);
    uint64_t v30 = *((unsigned __int16 *)v22 + 2);
    uint64_t v31 = v20 + 6;
    [(SlalomWriteOperation *)v25 setServiceCode:v29];
    [(SlalomWriteOperation *)v25 setBlockNumber:v30];
    if (v28 == 6)
    {
      [(SlalomWriteOperation *)v25 setOffsets:bswap32(*(unsigned __int16 *)(v31 + v21)) >> 16];
      LODWORD(v31) = v20 + 8;
    }
    [v81 addObject:v25];
    int v20 = v31;
    id v18 = v27;
LABEL_19:

    int v19 = v84;
    if (v20 >= (int)v84) {
      goto LABEL_20;
    }
  }
  if (v23 == 193)
  {
    if (v19 - (int)v24 <= 3)
    {
      id v50 = [MEMORY[0x1E4F1C9B8] dataWithBytes:v21];
      id v69 = ATLLogObject();
      if (os_log_type_enabled(v69, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        unint64_t v108 = (unint64_t)v50;
        _os_log_impl(&dword_1CA552000, v69, OS_LOG_TYPE_ERROR, "Failed to decode Transaction Event C1 tag, length issue: %@", buf, 0xCu);
      }

      uint64_t v70 = [[NSString alloc] initWithFormat:@"Failed to decode Transaction Event C1 tag, length issue: %@", v50];
      uint64_t v53 = (void *)v70;
      if (!a4) {
        goto LABEL_64;
      }
      id v71 = *a4;
      v55 = (void *)MEMORY[0x1E4F28C58];
      if (*a4)
      {
        uint64_t v72 = *MEMORY[0x1E4F28A50];
        v95[0] = *MEMORY[0x1E4F28568];
        v95[1] = v72;
        v96[0] = v70;
        v96[1] = v71;
        uint64_t v57 = (void *)MEMORY[0x1E4F1C9E8];
        v58 = v96;
        id v59 = v95;
        goto LABEL_56;
      }
      uint64_t v97 = *MEMORY[0x1E4F28568];
      uint64_t v98 = v70;
      uint64_t v57 = (void *)MEMORY[0x1E4F1C9E8];
      v58 = &v98;
      id v59 = &v97;
      goto LABEL_62;
    }
    int v25 = objc_alloc_init(SlalomReadOperation);
    uint64_t v26 = *(unsigned __int16 *)(v24 + v21);
    v20 += 6;
    [(SlalomWriteOperation *)v25 setBlockNumber:*((unsigned __int16 *)v22 + 2)];
    [(SlalomWriteOperation *)v25 setServiceCode:v26];
    [v18 addObject:v25];
    goto LABEL_19;
  }
  uint64_t v60 = ATLLogObject();
  if (os_log_type_enabled(v60, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 67109120;
    LODWORD(v108) = v23;
    _os_log_impl(&dword_1CA552000, v60, OS_LOG_TYPE_ERROR, "Failed to decode Transaction Event E1, tag received was not C0 or C1: %2X", buf, 8u);
  }

  uint64_t v61 = [[NSString alloc] initWithFormat:@"Failed to decode Transaction Event E1, tag received was not C0 or C1: %2X", v23];
  id v50 = (void *)v61;
  if (a4)
  {
    id v62 = *a4;
    long long v63 = (void *)MEMORY[0x1E4F28C58];
    if (*a4)
    {
      uint64_t v64 = *MEMORY[0x1E4F28A50];
      v87[0] = *MEMORY[0x1E4F28568];
      v87[1] = v64;
      v88[0] = v61;
      v88[1] = v62;
      long long v65 = (void *)MEMORY[0x1E4F1C9E8];
      long long v66 = v88;
      id v67 = v87;
      uint64_t v68 = 2;
    }
    else
    {
      uint64_t v89 = *MEMORY[0x1E4F28568];
      uint64_t v90 = v61;
      long long v65 = (void *)MEMORY[0x1E4F1C9E8];
      long long v66 = &v90;
      id v67 = &v89;
      uint64_t v68 = 1;
    }
    v78 = [v65 dictionaryWithObjects:v66 forKeys:v67 count:v68];
    *a4 = [v63 errorWithDomain:@"ATL" code:3 userInfo:v78];
  }
LABEL_65:

  id v33 = 0;
  uint64_t v32 = v81;
LABEL_66:

LABEL_33:

  return v33;
}

- (id)DecodeStartE1TLV:(id *)a3 error:(id *)a4
{
  v91[1] = *MEMORY[0x1E4F143B8];
  uint64_t v67 = 0;
  v68[0] = 0;
  v68[1] = 0;
  uint64_t v7 = DERDecodeItemCtx((uint64_t)a3, (unint64_t *)&v67);
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = ATLLogObject();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      LODWORD(buf) = 67109120;
      DWORD1(buf) = v8;
      _os_log_impl(&dword_1CA552000, v9, OS_LOG_TYPE_ERROR, "Failed to decode Start Event E1 %d", (uint8_t *)&buf, 8u);
    }

    uint64_t v10 = [[NSString alloc] initWithFormat:@"Failed to decode Start Event E1 %d", v8];
    id v11 = (void *)v10;
    if (a4)
    {
      id v12 = *a4;
      uint64_t v13 = (void *)MEMORY[0x1E4F28C58];
      if (*a4)
      {
        uint64_t v14 = *MEMORY[0x1E4F28A50];
        v88[0] = *MEMORY[0x1E4F28568];
        v88[1] = v14;
        v89[0] = v10;
        v89[1] = v12;
        uint64_t v15 = (void *)MEMORY[0x1E4F1C9E8];
        uint64_t v16 = v89;
        uint64_t v17 = v88;
        uint64_t v18 = 2;
      }
      else
      {
        uint64_t v90 = *MEMORY[0x1E4F28568];
        v91[0] = v10;
        uint64_t v15 = (void *)MEMORY[0x1E4F1C9E8];
        uint64_t v16 = v91;
        uint64_t v17 = &v90;
        uint64_t v18 = 1;
      }
      uint64_t v41 = [v15 dictionaryWithObjects:v16 forKeys:v17 count:v18];
      *a4 = [v13 errorWithDomain:@"ATL" code:3 userInfo:v41];
    }
    goto LABEL_39;
  }
  if (v67 == 0xE000000000000001)
  {
    long long v82 = 0u;
    long long v83 = 0u;
    long long buf = 0u;
    uint64_t v19 = DERParseSequenceSpec((uint64_t)v68, (uint64_t)&startEventE1ContentSpec, (char *)&buf, 0x30uLL);
    if (v19)
    {
      uint64_t v20 = v19;
      uint64_t v21 = ATLLogObject();
      if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)v73 = 67109120;
        LODWORD(v74) = v20;
        _os_log_impl(&dword_1CA552000, v21, OS_LOG_TYPE_ERROR, "Failed to decode Start Event E1 contents %d", v73, 8u);
      }

      uint64_t v22 = [[NSString alloc] initWithFormat:@"Failed to decode Start Event E1 contents %d", v20];
      id v11 = (void *)v22;
      if (!a4) {
        goto LABEL_39;
      }
      id v23 = *a4;
      uint64_t v24 = (void *)MEMORY[0x1E4F28C58];
      if (*a4)
      {
        uint64_t v25 = *MEMORY[0x1E4F28A50];
        v77[0] = *MEMORY[0x1E4F28568];
        v77[1] = v25;
        v78[0] = v22;
        v78[1] = v23;
        uint64_t v26 = (void *)MEMORY[0x1E4F1C9E8];
        id v27 = v78;
        int v28 = v77;
        uint64_t v29 = 2;
      }
      else
      {
        uint64_t v79 = *MEMORY[0x1E4F28568];
        uint64_t v80 = v22;
        uint64_t v26 = (void *)MEMORY[0x1E4F1C9E8];
        id v27 = &v80;
        int v28 = &v79;
        uint64_t v29 = 1;
      }
      uint64_t v42 = [v26 dictionaryWithObjects:v27 forKeys:v28 count:v29];
      *a4 = [v24 errorWithDomain:@"ATL" code:3 userInfo:v42];
      goto LABEL_38;
    }
    id v11 = [MEMORY[0x1E4F1CA60] dictionaryWithCapacity:3];
    v75[0] = &unk_1F24E1FD8;
    v75[1] = &unk_1F24E2038;
    v76[0] = @"Suica";
    v76[1] = @"QuicPay";
    void v75[2] = &unk_1F24E2050;
    v75[3] = &unk_1F24E2068;
    v76[2] = @"iD";
    v76[3] = @"Octopus";
    v75[4] = &unk_1F24E2080;
    v75[5] = &unk_1F24E2098;
    v76[4] = @"Cross";
    v76[5] = @"Mogul";
    v75[6] = &unk_1F24E20B0;
    v75[7] = &unk_1F24E20C8;
    v76[6] = @"Gondola";
    v76[7] = @"Wildcat";
    uint64_t v42 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v76 forKeys:v75 count:8];
    if (*((void *)&v83 + 1)
      && ([NSNumber numberWithUnsignedChar:*(unsigned __int8 *)v83],
          int v43 = objc_claimAutoreleasedReturnValue(),
          [v42 objectForKeyedSubscript:v43],
          uint64_t v44 = objc_claimAutoreleasedReturnValue(),
          v43,
          v44))
    {
      uint64_t v45 = [NSNumber numberWithUnsignedChar:*(unsigned __int8 *)v83];
      serviceProvider = self->_serviceProvider;
      self->_serviceProvider = v45;

      [v11 setObject:v44 forKeyedSubscript:@"SP"];
      uint64_t v47 = [NSNumber numberWithUnsignedChar:*(unsigned __int8 *)v83];
      [v11 setObject:v47 forKeyedSubscript:@"SPRaw"];

      uint64_t v48 = [NSNumber numberWithUnsignedChar:*(unsigned __int8 *)buf];
      [v11 setObject:v48 forKeyedSubscript:@"SystemCode"];

      uint64_t v49 = [MEMORY[0x1E4F1C9B8] dataWithBytes:(void)v82 length:8];
      id v50 = [v49 asHexString];
      [v11 setObject:v50 forKeyedSubscript:@"IDm"];
    }
    else
    {
      id v54 = ATLLogObject();
      if (os_log_type_enabled(v54, OS_LOG_TYPE_ERROR))
      {
        v55 = [MEMORY[0x1E4F1C9B8] dataWithDERItem:&v83];
        *(_DWORD *)v73 = 138412290;
        uint64_t v74 = v55;
        _os_log_impl(&dword_1CA552000, v54, OS_LOG_TYPE_ERROR, "Unknown SP identifier %@", v73, 0xCu);
      }
      id v56 = [NSString alloc];
      uint64_t v57 = [MEMORY[0x1E4F1C9B8] dataWithDERItem:&v83];
      uint64_t v44 = (void *)[v56 initWithFormat:@"Unknown SP identifier %@", v57];

      if (!a4) {
        goto LABEL_37;
      }
      id v58 = *a4;
      id v59 = (void *)MEMORY[0x1E4F28C58];
      if (*a4)
      {
        uint64_t v60 = *MEMORY[0x1E4F28A50];
        v69[0] = *MEMORY[0x1E4F28568];
        v69[1] = v60;
        v70[0] = v44;
        v70[1] = v58;
        uint64_t v61 = (void *)MEMORY[0x1E4F1C9E8];
        id v62 = (void **)v70;
        long long v63 = v69;
        uint64_t v64 = 2;
      }
      else
      {
        uint64_t v71 = *MEMORY[0x1E4F28568];
        uint64_t v72 = v44;
        uint64_t v61 = (void *)MEMORY[0x1E4F1C9E8];
        id v62 = &v72;
        long long v63 = &v71;
        uint64_t v64 = 1;
      }
      uint64_t v49 = [v61 dictionaryWithObjects:v62 forKeys:v63 count:v64];
      *a4 = [v59 errorWithDomain:@"ATL" code:3 userInfo:v49];
    }

LABEL_37:
LABEL_38:

LABEL_39:
    return 0;
  }
  uint64_t v30 = ATLLogObject();
  if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
  {
    LODWORD(buf) = 134217984;
    *(void *)((char *)&buf + 4) = v67;
    _os_log_impl(&dword_1CA552000, v30, OS_LOG_TYPE_ERROR, "Unexpected tag 0x%llx", (uint8_t *)&buf, 0xCu);
  }

  id v31 = [NSString alloc];
  uint64_t v66 = v67;
  uint64_t v32 = [v31 initWithFormat:@"Unexpected tag 0x%llx"];
  id v33 = (void *)v32;
  if (a4)
  {
    id v34 = *a4;
    id v35 = (void *)MEMORY[0x1E4F28C58];
    if (*a4)
    {
      uint64_t v36 = *MEMORY[0x1E4F28A50];
      v84[0] = *MEMORY[0x1E4F28568];
      v84[1] = v36;
      v85[0] = v32;
      v85[1] = v34;
      int v37 = (void *)MEMORY[0x1E4F1C9E8];
      id v38 = v85;
      id v39 = v84;
      uint64_t v40 = 2;
    }
    else
    {
      uint64_t v86 = *MEMORY[0x1E4F28568];
      uint64_t v87 = v32;
      int v37 = (void *)MEMORY[0x1E4F1C9E8];
      id v38 = &v87;
      id v39 = &v86;
      uint64_t v40 = 1;
    }
    v51 = [v37 dictionaryWithObjects:v38 forKeys:v39 count:v40];
    *a4 = [v35 errorWithDomain:@"ATL" code:3 userInfo:v51];
  }
  LogBinary(OS_LOG_TYPE_ERROR, (uint64_t)"-[SlalomDecoder DecodeStartE1TLV:error:]", 446, (uint64_t)a3->var0, a3->var1, @"E1 TLV data", v52, v53, v66);
  return 0;
}

- (id)getAppletStateAndHistory:(id)a3 withApplet:(id)a4 withPackage:(id)a5 withModule:(id)a6 withError:(id *)a7
{
  v510[1] = *MEMORY[0x1E4F143B8];
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  uint64_t v16 = [MEMORY[0x1E4F1C9B8] dataWithHexString:v13];
  uint64_t v17 = SelectByNameCmd(v16);

  uint64_t v18 = [v12 transceiveAndCheckSW:v17 error:a7];
  if (!v18)
  {
    id v33 = 0;
    goto LABEL_341;
  }
  uint64_t v19 = v18;
  v418[0] = (unsigned __int8 *)[v18 bytes];
  id v407 = v19;
  v418[1] = (unsigned __int8 *)[v19 length];
  uint64_t v416 = 0;
  v417[0] = 0;
  v417[1] = 0;
  DERFindItem(v418, 0xA000000000000005, (uint64_t)&v416);
  if (!v20)
  {
    long long v506 = 0u;
    long long v505 = 0u;
    long long v504 = 0u;
    long long v503 = 0u;
    long long v502 = 0u;
    long long v501 = 0u;
    *(_OWORD *)long long buf = 0u;
    uint64_t v34 = DERParseSequenceSpec((uint64_t)v417, (uint64_t)&selectResponseA5ContentSpec, (char *)buf, 0x18uLL);
    if (v34)
    {
      uint64_t v35 = v34;
      uint64_t v36 = v17;
      int v37 = ATLLogObject();
      if (os_log_type_enabled(v37, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)v484 = 67109120;
        int v485 = v35;
        _os_log_impl(&dword_1CA552000, v37, OS_LOG_TYPE_ERROR, "Failed to decode SELECT response contents %d", v484, 8u);
      }

      uint64_t v38 = [[NSString alloc] initWithFormat:@"Failed to decode SELECT response contents %d", v35];
      id v39 = (void *)v38;
      if (a7)
      {
        id v40 = *a7;
        uint64_t v41 = (void *)MEMORY[0x1E4F28C58];
        uint64_t v17 = v36;
        if (*a7)
        {
          uint64_t v42 = *MEMORY[0x1E4F28A50];
          v496[0] = *MEMORY[0x1E4F28568];
          v496[1] = v42;
          v497[0] = v38;
          v497[1] = v40;
          int v43 = (void *)MEMORY[0x1E4F1C9E8];
          uint64_t v44 = v497;
          uint64_t v45 = v496;
          uint64_t v46 = 2;
        }
        else
        {
          uint64_t v498 = *MEMORY[0x1E4F28568];
          uint64_t v499 = v38;
          int v43 = (void *)MEMORY[0x1E4F1C9E8];
          uint64_t v44 = &v499;
          uint64_t v45 = &v498;
          uint64_t v46 = 1;
        }
        uint64_t v67 = [v43 dictionaryWithObjects:v44 forKeys:v45 count:v46];
        [v41 errorWithDomain:@"ATL" code:3 userInfo:v67];
        id v33 = 0;
        *a7 = (id)objc_claimAutoreleasedReturnValue();
        goto LABEL_338;
      }
      id v33 = 0;
      uint64_t v17 = v36;
LABEL_339:

      goto LABEL_340;
    }
    v399 = [MEMORY[0x1E4F1CA60] dictionary];
    uint64_t v48 = *(unsigned __int8 *)v505;
    v398 = [MEMORY[0x1E4F1C9B8] dataWithBytes:v501];
    v406 = [MEMORY[0x1E4F1CA48] array];
    v396 = v17;
    id v397 = v14;
    switch((int)v48)
    {
      case 1:
      case 6:
      case 8:
        id v392 = v13;
        uint64_t v49 = [NSNumber numberWithUnsignedChar:v48];
        [v399 setObject:v49 forKeyedSubscript:@"NFServiceProviderID"];

        int v50 = 0;
        v51 = 0;
        uint64_t v52 = 0;
        uint64_t v53 = 0;
        while (1)
        {
          id v54 = v51;
          v51 = FelicaGetDataFileSystemCommand(2319, v50);

          if (v51)
          {
            id v55 = v15;
            id v56 = [v12 transceiveAndCheckSW:v51 error:a7];

            if (!v56)
            {
              uint64_t v52 = 0;
              id v33 = 0;
              id v13 = v392;
              goto LABEL_127;
            }
            uint64_t v57 = FeliCaGetBlockDataFromGetDataCommand(v56);

            if (v57)
            {
              [v406 addObject:v57];
              uint64_t v53 = (void *)v57;
            }
            else
            {
              id v58 = ATLLogObject();
              if (os_log_type_enabled(v58, OS_LOG_TYPE_DEFAULT))
              {
                *(_DWORD *)v484 = 67109378;
                int v485 = v50;
                __int16 v486 = 2112;
                *(void *)v487 = v56;
                _os_log_impl(&dword_1CA552000, v58, OS_LOG_TYPE_DEFAULT, "failed to get block for Suica history, blocknumber %04x with response %@", v484, 0x12u);
              }

              uint64_t v53 = 0;
            }
            uint64_t v52 = v56;
            id v15 = v55;
          }
          if (++v50 == 20)
          {
            id v55 = v15;
            if ([v406 count])
            {
              id v59 = +[HPHistoryDecoder parseSuicaHistoryBlocks:v406 withIDm:v398];
              [v399 addEntriesFromDictionary:v59];

              [v399 setObject:&unk_1F24E1FD8 forKeyedSubscript:@"NFServiceProviderID"];
              uint64_t v60 = [v398 asHexString];
              [v399 setObject:v60 forKeyedSubscript:@"NFDPAN"];

              uint64_t v61 = FelicaGetDataFileSystemCommand(4239, 0);

              id v13 = v392;
              if (!v61)
              {
                id v33 = v52;
                goto LABEL_118;
              }
              id v33 = [v12 transceiveAndCheckSW:v61 error:a7];

              if (v33)
              {
                uint64_t v62 = FeliCaGetBlockDataFromGetDataCommand(v33);

                if (v62)
                {
                  $06D0163FE0D7AFE752A9F21F38483579 v63 = ($06D0163FE0D7AFE752A9F21F38483579)+[HPHistoryDecoder getInOutStation:v62];
                  uint64_t var1 = v63.var1;
                  long long v65 = [NSNumber numberWithInt:v63.var0];
                  [v399 setObject:v65 forKeyedSubscript:@"NFInStation"];

                  uint64_t v66 = [NSNumber numberWithInt:var1];
                  [v399 setObject:v66 forKeyedSubscript:@"NFInStationShinkansen"];

                  uint64_t v53 = (void *)v62;
                }
                else
                {
                  uint64_t v53 = 0;
                }
LABEL_118:
                v51 = FelicaGetDataFileSystemCommand(6219, 0);

                if (v51)
                {
                  uint64_t v52 = [v12 transceiveAndCheckSW:v51 error:a7];

                  id v15 = v55;
                  if (!v52) {
                    goto LABEL_316;
                  }
                  uint64_t v185 = FeliCaGetBlockDataFromGetDataCommand(v52);

                  if (v185)
                  {
                    BOOL v186 = +[HPHistoryDecoder getGreenCarTicketUsed:v185];
                    v187 = [NSNumber numberWithBool:v186];
                    [v399 setObject:v187 forKeyedSubscript:@"NFTicketUsed"];

                    v188 = [MEMORY[0x1E4F1CA48] array];
                    v189 = (void *)v185;
                    uint64_t v190 = v185;
                    v191 = v188;
                    [v188 addObject:v190];
                    v192 = +[HPHistoryDecoder parseGreencarBlocks:v191];
                    if (v192)
                    {
                      [v399 setObject:v192 forKeyedSubscript:@"NFGreenCarTicket"];
                    }
                    else
                    {
                      v267 = v191;
                      v268 = ATLLogObject();
                      if (os_log_type_enabled(v268, OS_LOG_TYPE_DEFAULT))
                      {
                        *(_WORD *)v484 = 0;
                        _os_log_impl(&dword_1CA552000, v268, OS_LOG_TYPE_DEFAULT, "failed to parse GreenCar blocks", v484, 2u);
                      }

                      v191 = v267;
                    }
                  }
                  else
                  {
                    v189 = 0;
                  }
                }
                else
                {
                  v189 = v53;
                  uint64_t v52 = v33;
                  id v15 = v55;
                }
                uint64_t v269 = FelicaGetDataFileSystemCommand(139, 0);

                if (!v269)
                {
                  v163 = 0;
                  v277 = v189;
                  goto LABEL_336;
                }
                v162 = [v12 transceiveAndCheckSW:v269 error:a7];

                if (v162)
                {
                  uint64_t v402 = v269;
                  v270 = FeliCaGetBlockDataFromGetDataCommand(v162);

                  if (v270)
                  {
                    $391024036B902F3EE9BCB0FBA5EF777F v271 = +[HPHistoryDecoder getCommuterBalance:v270];
                    v272 = [NSNumber numberWithUnsignedInt:HIDWORD(*(unint64_t *)&v271)];
                    [v399 setObject:v272 forKeyedSubscript:@"NFBalance"];

                    id v273 = v270;
                    unsigned int v274 = *(unsigned __int8 *)([v273 bytes] + 8);
                    v275 = [NSNumber numberWithInt:(v274 >> 4) & 1];
                    [v399 setObject:v275 forKeyedSubscript:@"NFNotifyOnLowBalance"];

                    v276 = [NSNumber numberWithInt:(v274 >> 5) & 1];
                    [v399 setObject:v276 forKeyedSubscript:@"NFAllowBalanceUsageForCommute"];

                    id v161 = v273;
                    v160 = [NSNumber numberWithBool:+[HPHistoryDecoder getIsDenyListed:](HPHistoryDecoder, "getIsDenyListed:", v273)];
                    [v399 setObject:v160 forKeyedSubscript:@"NFBlacklisted"];
                    v163 = (void *)v402;
                    goto LABEL_195;
                  }
                  v277 = 0;
                  uint64_t v52 = v162;
                  v163 = (void *)v402;
                  goto LABEL_336;
                }
                uint64_t v52 = 0;
                id v33 = 0;
                uint64_t v53 = v189;
                v51 = (void *)v269;
LABEL_337:

                uint64_t v17 = v396;
                id v14 = v397;
                uint64_t v67 = v398;
                id v39 = v399;
LABEL_338:

                goto LABEL_339;
              }
              uint64_t v52 = 0;
              v51 = v61;
            }
            else
            {
              v100 = ATLLogObject();
              id v13 = v392;
              if (os_log_type_enabled(v100, OS_LOG_TYPE_ERROR))
              {
                *(_WORD *)v484 = 0;
                _os_log_impl(&dword_1CA552000, v100, OS_LOG_TYPE_ERROR, "Suica History failure: could not get a single history block. Aborting.", v484, 2u);
              }

              uint64_t v101 = [[NSString alloc] initWithFormat:@"Suica History failure: could not get a single history block. Aborting."];
              uint64_t v102 = (void *)v101;
              if (a7)
              {
                id v103 = *a7;
                v104 = (void *)MEMORY[0x1E4F28C58];
                if (*a7)
                {
                  uint64_t v105 = *MEMORY[0x1E4F28A50];
                  v492[0] = *MEMORY[0x1E4F28568];
                  v492[1] = v105;
                  v493[0] = v101;
                  v493[1] = v103;
                  uint64_t v106 = (void *)MEMORY[0x1E4F1C9E8];
                  v107 = v493;
                  unint64_t v108 = v492;
                  uint64_t v109 = 2;
                }
                else
                {
                  uint64_t v494 = *MEMORY[0x1E4F28568];
                  uint64_t v495 = v101;
                  uint64_t v106 = (void *)MEMORY[0x1E4F1C9E8];
                  v107 = &v495;
                  unint64_t v108 = &v494;
                  uint64_t v109 = 1;
                }
                v193 = [v106 dictionaryWithObjects:v107 forKeys:v108 count:v109];
                *a7 = [v104 errorWithDomain:@"ATL" code:3 userInfo:v193];
              }
              id v33 = 0;
            }
LABEL_127:
            id v15 = v55;
            goto LABEL_337;
          }
        }
      case 4:
        v78 = [MEMORY[0x1E4F1CA60] dictionary];
        [v78 setObject:&unk_1F24E2098 forKeyedSubscript:@"SPRaw"];
        [v78 setObject:@"Mogul" forKeyedSubscript:@"SP"];
        uint64_t v79 = +[SlalomDecoder getDataAndCheckFeliCaServiceCode:21899 withBlockNumber:0 withTransceiver:v12 withError:a7];
        uint64_t v80 = +[SlalomDecoder getDataAndCheckFeliCaServiceCode:21899 withBlockNumber:1 withTransceiver:v12 withError:a7];
        v81 = (void *)v80;
        if (v79 && v80)
        {
          id v393 = v13;
          long long v82 = +[MogulDecoder decodeCardID:v79];
          [v78 setObject:v82 forKeyedSubscript:@"CardIdentifier"];
          int v83 = +[MogulDecoder decodeEnableFlag:v81];
          int v84 = +[MogulDecoder decodeStatusFlag:v81];
          v383 = v78;
          if (!v83 || (v84 & 0xFFFFFFFD) != 0)
          {
            v135 = [NSNumber numberWithInt:v83 != 1];
            [v78 setObject:v135 forKeyedSubscript:@"CardDenyListed"];
          }
          else
          {
            [v78 setObject:MEMORY[0x1E4F1CC38] forKeyedSubscript:@"CardDenyListed"];
          }
          v387 = v81;
          v136 = +[MogulDecoder decodeChargeAmountFlagValue:v81];
          if (v136) {
            [v78 setObject:v136 forKeyedSubscript:@"CardDefaultAAVSAmount"];
          }

          v137 = [MEMORY[0x1E4F1CA48] arrayWithCapacity:3];
          uint64_t v138 = +[SlalomDecoder getDataAndCheckFeliCaServiceCode:21911 withBlockNumber:0 withTransceiver:v12 withError:a7];

          if (v138)
          {
            uint64_t v79 = (void *)v138;
            v139 = +[MogulDecoder getPurseBalance:v138];
            v438[0] = @"BalanceIdentifier";
            v438[1] = @"Balance";
            v439[0] = @"Purse";
            v439[1] = v139;
            v438[2] = @"BalanceCurrency";
            v438[3] = @"BalanceCurrencyExponent";
            v439[2] = @"JPY";
            v439[3] = &unk_1F24E1FC0;
            v140 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v439 forKeys:v438 count:4];
            v401 = v137;
            [v137 addObject:v140];

            v141 = [MEMORY[0x1E4F1CA48] array];
            unsigned __int8 v142 = 0;
            v143 = 0;
            do
            {
              v144 = v143;
              v143 = +[SlalomDecoder getDataAndCheckFeliCaServiceCode:22095 withBlockNumber:v142 withTransceiver:v12 withError:a7];

              if (!v143)
              {
                v194 = ATLLogObject();
                if (os_log_type_enabled(v194, OS_LOG_TYPE_ERROR))
                {
                  *(_WORD *)v484 = 0;
                  _os_log_impl(&dword_1CA552000, v194, OS_LOG_TYPE_ERROR, "Failed to retrieve Mogul history, invalid block", v484, 2u);
                }

                uint64_t v195 = [[NSString alloc] initWithFormat:@"Failed to retrieve Mogul history, invalid block"];
                v196 = (void *)v195;
                v78 = v383;
                if (a7)
                {
                  id v197 = *a7;
                  v198 = (void *)MEMORY[0x1E4F28C58];
                  if (*a7)
                  {
                    uint64_t v199 = *MEMORY[0x1E4F28A50];
                    v430[0] = *MEMORY[0x1E4F28568];
                    v430[1] = v199;
                    v431[0] = v195;
                    v431[1] = v197;
                    v200 = (void *)MEMORY[0x1E4F1C9E8];
                    v201 = v431;
                    v202 = v430;
                    uint64_t v203 = 2;
                  }
                  else
                  {
                    uint64_t v432 = *MEMORY[0x1E4F28568];
                    uint64_t v433 = v195;
                    v200 = (void *)MEMORY[0x1E4F1C9E8];
                    v201 = &v433;
                    v202 = &v432;
                    uint64_t v203 = 1;
                  }
                  v320 = [v200 dictionaryWithObjects:v201 forKeys:v202 count:v203];
                  *a7 = [v198 errorWithDomain:@"ATL" code:3 userInfo:v320];
                }
                goto LABEL_312;
              }
              v145 = +[MogulDecoder decodeTransactionHistoryEntry:v143];
              if (v145) {
                [v141 addObject:v145];
              }

              unsigned int v146 = v142++;
            }
            while (v146 <= 3);
            [v399 setObject:v141 forKeyedSubscript:@"TransactionHistory"];

            uint64_t v147 = +[SlalomDecoder getDataAndCheckFeliCaServiceCode:22027 withBlockNumber:0 withTransceiver:v12 withError:a7];

            uint64_t v148 = +[SlalomDecoder getDataAndCheckFeliCaServiceCode:22027 withBlockNumber:1 withTransceiver:v12 withError:a7];

            if (v147 && v148)
            {
              v378 = (void *)v148;
              id v374 = v12;
              v388 = (void *)v147;
              v149 = +[MogulDecoder decodePointsData:v147 andWith:v148];
              v150 = v149;
              if (v149)
              {
                long long v410 = 0u;
                long long v411 = 0u;
                long long v408 = 0u;
                long long v409 = 0u;
                uint64_t v151 = [v149 countByEnumeratingWithState:&v408 objects:v429 count:16];
                if (v151)
                {
                  uint64_t v152 = v151;
                  uint64_t v153 = *(void *)v409;
                  do
                  {
                    for (uint64_t i = 0; i != v152; ++i)
                    {
                      if (*(void *)v409 != v153) {
                        objc_enumerationMutation(v150);
                      }
                      v155 = *(void **)(*((void *)&v408 + 1) + 8 * i);
                      v427[0] = @"Balance";
                      v156 = [v155 balance];
                      v428[0] = v156;
                      v428[1] = @"XXX";
                      v427[1] = @"BalanceCurrency";
                      v427[2] = @"BalanceCurrencyExponent";
                      v428[2] = &unk_1F24E1FC0;
                      v427[3] = @"BalanceExpirationDate";
                      v157 = [v155 expiration];
                      v428[3] = v157;
                      v427[4] = @"BalanceIdentifier";
                      v158 = [v155 name];
                      v428[4] = v158;
                      v159 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v428 forKeys:v427 count:5];
                      [v401 addObject:v159];
                    }
                    uint64_t v152 = [v150 countByEnumeratingWithState:&v408 objects:v429 count:16];
                  }
                  while (v152);
                }
              }

              v160 = v383;
              [v383 setObject:v401 forKeyedSubscript:@"Balances"];
              [v399 setObject:v383 forKeyedSubscript:@"State"];

              id v161 = 0;
              v162 = 0;
              v163 = 0;
              id v12 = v374;
              id v13 = v393;
LABEL_195:

              uint64_t v52 = v162;
              v277 = v161;
              goto LABEL_336;
            }
            v301 = ATLLogObject();
            if (os_log_type_enabled(v301, OS_LOG_TYPE_ERROR))
            {
              *(_WORD *)v484 = 0;
              _os_log_impl(&dword_1CA552000, v301, OS_LOG_TYPE_ERROR, "Failed to retrieve Mogul loyalty points, invalid blocks", v484, 2u);
            }

            uint64_t v302 = [[NSString alloc] initWithFormat:@"Failed to retrieve Mogul loyalty points, invalid blocks"];
            v141 = (void *)v302;
            uint64_t v79 = (void *)v147;
            if (a7)
            {
              id v303 = *a7;
              v304 = (void *)MEMORY[0x1E4F28C58];
              v78 = v383;
              if (*a7)
              {
                uint64_t v305 = *MEMORY[0x1E4F28A50];
                v423[0] = *MEMORY[0x1E4F28568];
                v423[1] = v305;
                v424[0] = v302;
                v424[1] = v303;
                v306 = (void *)MEMORY[0x1E4F1C9E8];
                v307 = v424;
                v308 = v423;
                uint64_t v309 = 2;
              }
              else
              {
                uint64_t v425 = *MEMORY[0x1E4F28568];
                uint64_t v426 = v302;
                v306 = (void *)MEMORY[0x1E4F1C9E8];
                v307 = &v426;
                v308 = &v425;
                uint64_t v309 = 1;
              }
              v367 = [v306 dictionaryWithObjects:v307 forKeys:v308 count:v309];
              *a7 = [v304 errorWithDomain:@"ATL" code:3 userInfo:v367];

              v387 = (void *)v148;
            }
            else
            {
              v387 = (void *)v148;
              v78 = v383;
            }
LABEL_312:
            v112 = v401;
          }
          else
          {
            v175 = v137;
            v176 = ATLLogObject();
            if (os_log_type_enabled(v176, OS_LOG_TYPE_ERROR))
            {
              *(_WORD *)v484 = 0;
              _os_log_impl(&dword_1CA552000, v176, OS_LOG_TYPE_ERROR, "Failed to retrieve Mogul purse balance, invalid block", v484, 2u);
            }

            uint64_t v177 = [[NSString alloc] initWithFormat:@"Failed to retrieve Mogul purse balance, invalid block"];
            v141 = (void *)v177;
            if (a7)
            {
              id v178 = *a7;
              v179 = (void *)MEMORY[0x1E4F28C58];
              if (*a7)
              {
                uint64_t v180 = *MEMORY[0x1E4F28A50];
                v434[0] = *MEMORY[0x1E4F28568];
                v434[1] = v180;
                v435[0] = v177;
                v435[1] = v178;
                v181 = (void *)MEMORY[0x1E4F1C9E8];
                v182 = v435;
                v183 = v434;
                uint64_t v184 = 2;
              }
              else
              {
                uint64_t v436 = *MEMORY[0x1E4F28568];
                uint64_t v437 = v177;
                v181 = (void *)MEMORY[0x1E4F1C9E8];
                v182 = &v437;
                v183 = &v436;
                uint64_t v184 = 1;
              }
              v319 = [v181 dictionaryWithObjects:v182 forKeys:v183 count:v184];
              *a7 = [v179 errorWithDomain:@"ATL" code:3 userInfo:v319];
            }
            uint64_t v79 = 0;
            v112 = v175;
          }
        }
        else
        {
          v110 = ATLLogObject();
          if (os_log_type_enabled(v110, OS_LOG_TYPE_ERROR))
          {
            *(_WORD *)v484 = 0;
            _os_log_impl(&dword_1CA552000, v110, OS_LOG_TYPE_ERROR, "Failed to retrieve Mogul card settings, invalid blocks", v484, 2u);
          }

          uint64_t v111 = [[NSString alloc] initWithFormat:@"Failed to retrieve Mogul card settings, invalid blocks"];
          v112 = (void *)v111;
          if (!a7) {
            goto LABEL_314;
          }
          v387 = v81;
          id v113 = *a7;
          v114 = (void *)MEMORY[0x1E4F28C58];
          if (*a7)
          {
            uint64_t v115 = *MEMORY[0x1E4F28A50];
            v440[0] = *MEMORY[0x1E4F28568];
            v440[1] = v115;
            v441[0] = v111;
            v441[1] = v113;
            v116 = (void *)MEMORY[0x1E4F1C9E8];
            v117 = v441;
            v118 = v440;
            uint64_t v119 = 2;
          }
          else
          {
            uint64_t v442 = *MEMORY[0x1E4F28568];
            uint64_t v443 = v111;
            v116 = (void *)MEMORY[0x1E4F1C9E8];
            v117 = &v443;
            v118 = &v442;
            uint64_t v119 = 1;
          }
          v141 = [v116 dictionaryWithObjects:v117 forKeys:v118 count:v119];
          *a7 = [v114 errorWithDomain:@"ATL" code:3 userInfo:v141];
        }

        v81 = v387;
LABEL_314:

        goto LABEL_315;
      case 5:
        v85 = [MEMORY[0x1E4F1CA60] dictionary];
        [v85 setObject:&unk_1F24E2068 forKeyedSubscript:@"SPRaw"];
        v51 = FelicaGetDataFileSystemCommand(279, 0);
        if (!v51)
        {
          uint64_t v89 = 0;
          uint64_t v53 = 0;
          uint64_t v52 = 0;
          goto LABEL_76;
        }
        uint64_t v86 = [v12 transceiveAndCheckSW:v51 error:a7];
        uint64_t v52 = v86;
        if (!v86)
        {
          uint64_t v89 = 0;
          uint64_t v53 = 0;
          goto LABEL_300;
        }
        uint64_t v87 = FeliCaGetBlockDataFromGetDataCommand(v86);
        if (v87)
        {
          uint64_t v53 = (void *)v87;
          uint64_t v88 = +[OctopusDecoder getPurseBalance:v87];
          if (v88)
          {
            uint64_t v89 = (void *)v88;
LABEL_76:
            v130 = FelicaGetDataFileSystemCommand(1800, 0);

            v376 = v89;
            if (!v130)
            {
              v131 = v52;
              goto LABEL_208;
            }
            v131 = [v12 transceiveAndCheckSW:v130 error:a7];

            if (v131)
            {
              v132 = v130;
              uint64_t v133 = FeliCaGetBlockDataFromGetDataCommand(v131);

              if (v133)
              {
                v134 = +[OctopusDecoder getLoyaltyBalance:v133];
                [v85 setObject:v134 forKeyedSubscript:@"PointBalance"];
                uint64_t v53 = (void *)v133;
              }
              else
              {
                v134 = ATLLogObject();
                if (os_log_type_enabled(v134, OS_LOG_TYPE_DEFAULT))
                {
                  *(_DWORD *)v484 = 67109634;
                  int v485 = 1800;
                  __int16 v486 = 1024;
                  *(_DWORD *)v487 = 0;
                  *(_WORD *)&v487[4] = 2112;
                  *(void *)&v487[6] = v131;
                  _os_log_impl(&dword_1CA552000, v134, OS_LOG_TYPE_DEFAULT, "Octopus Rewards : GET DATA for Service Code %d and block %d is invalid: %@", v484, 0x18u);
                }
                uint64_t v53 = 0;
              }

              v130 = v132;
LABEL_208:
              v288 = [v85 objectForKeyedSubscript:@"PointBalance"];

              if (!v288)
              {
                v289 = ATLLogObject();
                if (os_log_type_enabled(v289, OS_LOG_TYPE_DEFAULT))
                {
                  *(_WORD *)v484 = 0;
                  _os_log_impl(&dword_1CA552000, v289, OS_LOG_TYPE_DEFAULT, "failed to retrieved rewards", v484, 2u);
                }
              }
              v385 = v85;
              v290 = v131;
              uint64_t v291 = [MEMORY[0x1E4F1C9C8] date];
              v51 = FelicaGetDataFileSystemCommand(776, 0);

              if (v51)
              {
                v390 = (void *)v291;
                uint64_t v52 = [v12 transceiveAndCheckSW:v51 error:a7];

                if (!v52)
                {
                  int v299 = 1;
                  v293 = v385;
                  v300 = v390;
                  goto LABEL_323;
                }
                uint64_t v292 = FeliCaGetBlockDataFromGetDataCommand(v52);

                v293 = v385;
                if (!v292)
                {
                  v310 = ATLLogObject();
                  if (os_log_type_enabled(v310, OS_LOG_TYPE_ERROR))
                  {
                    *(_DWORD *)v484 = 67109634;
                    int v485 = 776;
                    __int16 v486 = 1024;
                    *(_DWORD *)v487 = 0;
                    *(_WORD *)&v487[4] = 2112;
                    *(void *)&v487[6] = v52;
                    _os_log_impl(&dword_1CA552000, v310, OS_LOG_TYPE_ERROR, "Octopus Internal : GET DATA for Service Code %d and block %d is invalid: %@", v484, 0x18u);
                  }

                  v311 = (void *)[[NSString alloc] initWithFormat:@"Octopus Internal : GET DATA for Service Code %d and block %d is invalid: %@", 776, 0, v52];
                  if (a7)
                  {
                    id v312 = *a7;
                    v313 = (void *)MEMORY[0x1E4F28C58];
                    id v373 = v311;
                    if (*a7)
                    {
                      uint64_t v314 = *MEMORY[0x1E4F28A50];
                      v476[0] = *MEMORY[0x1E4F28568];
                      v476[1] = v314;
                      v477[0] = v311;
                      v477[1] = v312;
                      v315 = (void *)MEMORY[0x1E4F1C9E8];
                      v316 = (void **)v477;
                      v317 = v476;
                      uint64_t v318 = 2;
                    }
                    else
                    {
                      uint64_t v478 = *MEMORY[0x1E4F28568];
                      v479 = v311;
                      v315 = (void *)MEMORY[0x1E4F1C9E8];
                      v316 = &v479;
                      v317 = &v478;
                      uint64_t v318 = 1;
                    }
                    v344 = [v315 dictionaryWithObjects:v316 forKeys:v317 count:v318];
                    [v313 errorWithDomain:@"ATL" code:3 userInfo:v344];
                    v298 = 0;
                    *a7 = (id)objc_claimAutoreleasedReturnValue();
                    int v299 = 1;
                    v300 = v390;
                    goto LABEL_321;
                  }
                  v298 = 0;
                  int v299 = 1;
                  v300 = v390;
                  goto LABEL_322;
                }
                uint64_t v294 = +[OctopusDecoder getBaseDate:v292];

                id v373 = +[OctopusDecoder getNegativeValueLimit:v292];
                v403 = (void *)v292;
                v295 = +[OctopusDecoder getAAVSAmount:v292];
                v296 = v376;
                if (v295)
                {
                  v297 = v385;
                  [v385 setObject:v295 forKeyedSubscript:@"CardDefaultAAVSAmount"];
                }
                else
                {
                  v321 = ATLLogObject();
                  v297 = v385;
                  if (os_log_type_enabled(v321, OS_LOG_TYPE_DEFAULT))
                  {
                    *(_WORD *)v484 = 0;
                    _os_log_impl(&dword_1CA552000, v321, OS_LOG_TYPE_DEFAULT, "failed to retrieved AAVS amount", v484, 2u);
                  }

                  v296 = v376;
                }

                if (v373 && v296)
                {
                  v322 = [v296 decimalNumberBySubtracting:];
                  [v297 setObject:v322 forKeyedSubscript:@"Balance"];

                  *(_WORD *)v484 = 0;
                  v323 = +[ATLCurrency currencyCodeForNumber:344 exponentOut:v484];
                  if (v323)
                  {
                    [v297 setObject:v323 forKeyedSubscript:@"CardCurrency"];
                    v324 = [NSNumber numberWithShort:*(__int16 *)v484];
                    [v297 setObject:v324 forKeyedSubscript:@"CardCurrencyExponent"];

                    [v297 setObject:&unk_1F24E20E0 forKeyedSubscript:@"CardCurrencyCode"];
                  }

                  v298 = v403;
LABEL_250:
                  v391 = (void *)v294;
                  v380 = [MEMORY[0x1E4F1CA48] array];
                  int v326 = 0;
                  v404 = v52;
                  id v395 = v13;
                  id v382 = v15;
                  while (1)
                  {
                    v327 = v51;
                    v51 = FelicaGetDataFileSystemCommand(1036, v326);

                    if (v51)
                    {
                      v328 = [v12 transceiveAndCheckSW:v51 error:a7];

                      if (!v328)
                      {
                        uint64_t v52 = 0;
                        goto LABEL_278;
                      }
                      v404 = v328;
                      uint64_t v329 = FeliCaGetBlockDataFromGetDataCommand(v328);

                      if (v329)
                      {
                        v330 = +[OctopusDecoder parseTLOGBlock:v329 withBaseDate:v391];
                        if (v330)
                        {
                          v331 = [v385 objectForKeyedSubscript:@"CardDefaultAAVSAmount"];
                          v332 = [v385 objectForKeyedSubscript:@"Balance"];
                          v333 = +[OctopusDecoder injectTLOGAAVS:v330 withAAVSAmount:v331 andBalance:v332];

                          if (!+[OctopusDecoder filterHistoryEntry:](OctopusDecoder, "filterHistoryEntry:", v330))[v380 addObject:v330]; {
                          if (v333)
                          }
                            [v380 addObject:v333];

                          id v13 = v395;
                          id v15 = v382;
                        }
                      }
                      else
                      {
                        v330 = ATLLogObject();
                        if (os_log_type_enabled(v330, OS_LOG_TYPE_DEFAULT))
                        {
                          *(_DWORD *)v484 = 67109634;
                          int v485 = 1036;
                          __int16 v486 = 1024;
                          *(_DWORD *)v487 = v326;
                          *(_WORD *)&v487[4] = 2112;
                          *(void *)&v487[6] = v328;
                          _os_log_impl(&dword_1CA552000, v330, OS_LOG_TYPE_DEFAULT, "Octopus TLOG : GET DATA for Service Code %d and block %d is invalid: %@", v484, 0x18u);
                        }
                        uint64_t v329 = 0;
                      }

                      v298 = (void *)v329;
                    }
                    if (++v326 == 10)
                    {
                      v334 = FelicaGetDataFileSystemCommand(520, 0);

                      if (!v334)
                      {
                        v335 = v399;
                        uint64_t v52 = v404;
                        unint64_t v336 = 0x1E4F1C000uLL;
LABEL_271:
                        v405 = v298;
                        v51 = FelicaGetDataFileSystemCommand(2312, 0);

                        v300 = v391;
                        if (v51)
                        {
                          v341 = [v12 transceiveAndCheckSW:v51 error:0];

                          if (v341)
                          {
                            uint64_t v342 = FeliCaGetBlockDataFromGetDataCommand(v341);

                            if (v342)
                            {
                              if (+[OctopusDecoder getEnRouteStatus:v342])
                              {
                                v343 = [*(id *)(v336 + 2632) arrayWithObject:@"TransitTrain"];
                                [v385 setObject:v343 forKeyedSubscript:@"TransactionInProgress"];
                              }
                              v405 = (void *)v342;
                            }
                            else
                            {
                              v405 = 0;
                            }
                          }
                        }
                        else
                        {
                          v341 = v52;
                        }
                        v344 = v380;
                        [v335 setObject:v380 forKeyedSubscript:@"TransactionHistory"];
                        v368 = v335;
                        v293 = v385;
                        [v368 setObject:v385 forKeyedSubscript:@"State"];
                        int v299 = 6;
                        uint64_t v52 = v341;
                        v298 = v405;
                        goto LABEL_321;
                      }
                      uint64_t v52 = [v12 transceiveAndCheckSW:v334 error:a7];

                      v335 = v399;
                      unint64_t v336 = 0x1E4F1C000;
                      if (v52)
                      {
                        uint64_t v337 = FeliCaGetBlockDataFromGetDataCommand(v52);
                        v338 = v298;
                        v298 = (void *)v337;

                        if (v298)
                        {
                          v339 = v334;
                          v340 = [NSNumber numberWithInt:+[OctopusDecoder isDenyListed:](OctopusDecoder, "isDenyListed:", v298)];
                          [v385 setObject:v340 forKeyedSubscript:@"CardDenyListed"];

                          v334 = v339;
                          goto LABEL_271;
                        }
                        v351 = ATLLogObject();
                        if (os_log_type_enabled(v351, OS_LOG_TYPE_ERROR))
                        {
                          *(_DWORD *)v484 = 67109634;
                          int v485 = 520;
                          __int16 v486 = 1024;
                          *(_DWORD *)v487 = 0;
                          *(_WORD *)&v487[4] = 2112;
                          *(void *)&v487[6] = v52;
                          _os_log_impl(&dword_1CA552000, v351, OS_LOG_TYPE_ERROR, "Octopus Card Settings : GET DATA for Service Code %d and block %d is invalid: %@", v484, 0x18u);
                        }
                        v51 = v334;

                        uint64_t v352 = [[NSString alloc] initWithFormat:@"Octopus Card Settings : GET DATA for Service Code %d and block %d is invalid: %@", 520, 0, v52];
                        v353 = (void *)v352;
                        v293 = v385;
                        if (a7)
                        {
                          id v354 = *a7;
                          v355 = (void *)MEMORY[0x1E4F28C58];
                          if (*a7)
                          {
                            uint64_t v356 = *MEMORY[0x1E4F28A50];
                            v472[0] = *MEMORY[0x1E4F28568];
                            v472[1] = v356;
                            v473[0] = v352;
                            v473[1] = v354;
                            v357 = (void *)MEMORY[0x1E4F1C9E8];
                            v358 = v473;
                            v359 = v472;
                            uint64_t v360 = 2;
                          }
                          else
                          {
                            uint64_t v474 = *MEMORY[0x1E4F28568];
                            uint64_t v475 = v352;
                            v357 = (void *)MEMORY[0x1E4F1C9E8];
                            v358 = &v475;
                            v359 = &v474;
                            uint64_t v360 = 1;
                          }
                          v369 = [v357 dictionaryWithObjects:v358 forKeys:v359 count:v360];
                          *a7 = [v355 errorWithDomain:@"ATL" code:3 userInfo:v369];
                        }
                        v298 = 0;
                        int v299 = 1;
LABEL_279:
                        v300 = v391;
                        v344 = v380;
LABEL_321:

                        v311 = v373;
LABEL_322:

                        uint64_t v53 = v298;
LABEL_323:

                        if (v299 == 6)
                        {
                          v277 = v53;
                          v163 = v51;
                          goto LABEL_336;
                        }
LABEL_316:
                        id v33 = 0;
                        goto LABEL_337;
                      }
                      v51 = v334;
LABEL_278:
                      int v299 = 1;
                      v293 = v385;
                      goto LABEL_279;
                    }
                  }
                }
                v298 = v403;
              }
              else
              {
                id v373 = 0;
                uint64_t v52 = v290;
                v298 = v53;
                uint64_t v294 = v291;
              }
              v325 = ATLLogObject();
              if (os_log_type_enabled(v325, OS_LOG_TYPE_DEFAULT))
              {
                *(_WORD *)v484 = 0;
                _os_log_impl(&dword_1CA552000, v325, OS_LOG_TYPE_DEFAULT, "failed to retrieved negative value limit", v484, 2u);
              }

              goto LABEL_250;
            }
            uint64_t v52 = 0;
            v51 = v130;
LABEL_300:

            goto LABEL_316;
          }
          v258 = ATLLogObject();
          if (os_log_type_enabled(v258, OS_LOG_TYPE_ERROR))
          {
            *(_WORD *)v484 = 0;
            _os_log_impl(&dword_1CA552000, v258, OS_LOG_TYPE_ERROR, "failed to retrieved balance", v484, 2u);
          }

          uint64_t v259 = [[NSString alloc] initWithFormat:@"failed to retrieved balance"];
          v206 = (void *)v259;
          if (a7)
          {
            id v381 = v15;
            id v260 = *a7;
            v261 = (void *)MEMORY[0x1E4F28C58];
            if (*a7)
            {
              uint64_t v262 = *MEMORY[0x1E4F28A50];
              v488[0] = *MEMORY[0x1E4F28568];
              v488[1] = v262;
              v489[0] = v259;
              v489[1] = v260;
              v263 = (void *)MEMORY[0x1E4F1C9E8];
              v264 = v489;
              v265 = v488;
              uint64_t v266 = 2;
            }
            else
            {
              uint64_t v490 = *MEMORY[0x1E4F28568];
              uint64_t v491 = v259;
              v263 = (void *)MEMORY[0x1E4F1C9E8];
              v264 = &v491;
              v265 = &v490;
              uint64_t v266 = 1;
            }
            v345 = [v263 dictionaryWithObjects:v264 forKeys:v265 count:v266];
            v346 = [v261 errorWithDomain:@"ATL" code:3 userInfo:v345];
            id v15 = v381;
LABEL_298:
            *a7 = v346;
          }
        }
        else
        {
          v204 = ATLLogObject();
          if (os_log_type_enabled(v204, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)v484 = 67109634;
            int v485 = 279;
            __int16 v486 = 1024;
            *(_DWORD *)v487 = 0;
            *(_WORD *)&v487[4] = 2112;
            *(void *)&v487[6] = v52;
            _os_log_impl(&dword_1CA552000, v204, OS_LOG_TYPE_ERROR, "Octopus Purse : GET DATA for Service Code %d and block %d is invalid: %@", v484, 0x18u);
          }

          uint64_t v205 = [[NSString alloc] initWithFormat:@"Octopus Purse : GET DATA for Service Code %d and block %d is invalid: %@", 279, 0, v52];
          v206 = (void *)v205;
          if (a7)
          {
            id v207 = *a7;
            v208 = (void *)MEMORY[0x1E4F28C58];
            if (*a7)
            {
              uint64_t v209 = *MEMORY[0x1E4F28A50];
              v480[0] = *MEMORY[0x1E4F28568];
              v480[1] = v209;
              v481[0] = v205;
              v481[1] = v207;
              v210 = (void *)MEMORY[0x1E4F1C9E8];
              v211 = v481;
              v212 = v480;
              uint64_t v213 = 2;
            }
            else
            {
              uint64_t v482 = *MEMORY[0x1E4F28568];
              uint64_t v483 = v205;
              v210 = (void *)MEMORY[0x1E4F1C9E8];
              v211 = &v483;
              v212 = &v482;
              uint64_t v213 = 1;
            }
            v345 = [v210 dictionaryWithObjects:v211 forKeys:v212 count:v213];
            v346 = [v208 errorWithDomain:@"ATL" code:3 userInfo:v345];
            uint64_t v53 = 0;
            goto LABEL_298;
          }
          uint64_t v53 = 0;
        }

        uint64_t v89 = 0;
        goto LABEL_300;
      case 7:
        uint64_t v90 = [MEMORY[0x1E4F1CA60] dictionary];
        [v90 setObject:&unk_1F24E20B0 forKeyedSubscript:@"SPRaw"];
        [v90 setObject:@"Gondola" forKeyedSubscript:@"SP"];
        v91 = +[SlalomDecoder getDataAndCheckFeliCaServiceCode:26575 withBlockNumber:0 withTransceiver:v12 withError:a7];
        uint64_t v92 = +[SlalomDecoder getDataAndCheckFeliCaServiceCode:26575 withBlockNumber:1 withTransceiver:v12 withError:a7];
        uint64_t v93 = (void *)v92;
        if (!v91 || !v92)
        {
          v120 = ATLLogObject();
          if (os_log_type_enabled(v120, OS_LOG_TYPE_ERROR))
          {
            *(_WORD *)v484 = 0;
            _os_log_impl(&dword_1CA552000, v120, OS_LOG_TYPE_ERROR, "Failed to retrieve Gondola S/N, invalid blocks", v484, 2u);
          }

          uint64_t v121 = [[NSString alloc] initWithFormat:@"Failed to retrieve Gondola S/N, invalid blocks"];
          v122 = (void *)v121;
          if (!a7)
          {
            int v174 = 1;
            goto LABEL_335;
          }
          v400 = v93;
          id v123 = *a7;
          v124 = (void *)MEMORY[0x1E4F28C58];
          if (*a7)
          {
            uint64_t v125 = *MEMORY[0x1E4F28A50];
            v468[0] = *MEMORY[0x1E4F28568];
            v468[1] = v125;
            v469[0] = v121;
            v469[1] = v123;
            v126 = (void *)MEMORY[0x1E4F1C9E8];
            v127 = v469;
            v128 = v468;
            uint64_t v129 = 2;
          }
          else
          {
            uint64_t v470 = *MEMORY[0x1E4F28568];
            uint64_t v471 = v121;
            v126 = (void *)MEMORY[0x1E4F1C9E8];
            v127 = &v471;
            v128 = &v470;
            uint64_t v129 = 1;
          }
          v247 = [v126 dictionaryWithObjects:v127 forKeys:v128 count:v129];
          *a7 = [v124 errorWithDomain:@"ATL" code:3 userInfo:v247];
          int v174 = 1;
          goto LABEL_334;
        }
        uint64_t v94 = +[GondolaDecoder decodeCardNumberFromBlock0:v91 andBlock1:v92];
        v384 = v90;
        [v90 setObject:v94 forKeyedSubscript:@"CardIdentifier"];

        v95 = +[SlalomDecoder getDataAndCheckFeliCaServiceCode:26571 withBlockNumber:0 withTransceiver:v12 withError:a7];

        uint64_t v96 = +[SlalomDecoder getDataAndCheckFeliCaServiceCode:26571 withBlockNumber:1 withTransceiver:v12 withError:a7];

        v386 = v95;
        if (!v95 || !v96)
        {
          v164 = ATLLogObject();
          if (os_log_type_enabled(v164, OS_LOG_TYPE_ERROR))
          {
            *(_WORD *)v484 = 0;
            _os_log_impl(&dword_1CA552000, v164, OS_LOG_TYPE_ERROR, "Failed to retrieve Gondola Usage Flag and/or Effectiveness Flag, invalid blocks", v484, 2u);
          }

          uint64_t v165 = [[NSString alloc] initWithFormat:@"Failed to retrieve Gondola Usage Flag and/or Effectiveness Flag, invalid blocks"];
          v122 = (void *)v165;
          uint64_t v90 = v384;
          if (!a7)
          {
            int v174 = 1;
            uint64_t v93 = (void *)v96;
            v91 = v386;
            goto LABEL_335;
          }
          id v166 = *a7;
          v167 = (void *)MEMORY[0x1E4F28C58];
          if (*a7)
          {
            uint64_t v168 = *MEMORY[0x1E4F28A50];
            v464[0] = *MEMORY[0x1E4F28568];
            v464[1] = v168;
            v465[0] = v165;
            v465[1] = v166;
            v169 = (void *)MEMORY[0x1E4F1C9E8];
            v170 = v465;
            v171 = v464;
            uint64_t v172 = 2;
          }
          else
          {
            uint64_t v466 = *MEMORY[0x1E4F28568];
            uint64_t v467 = v165;
            v169 = (void *)MEMORY[0x1E4F1C9E8];
            v170 = &v467;
            v171 = &v466;
            uint64_t v172 = 1;
          }
          v247 = [v169 dictionaryWithObjects:v170 forKeys:v171 count:v172];
          *a7 = [v167 errorWithDomain:@"ATL" code:3 userInfo:v247];
          int v174 = 1;
          v400 = (void *)v96;
          v91 = v386;
LABEL_334:

          uint64_t v93 = v400;
LABEL_335:

          v277 = 0;
          uint64_t v52 = 0;
          v163 = 0;
          uint64_t v53 = 0;
          v51 = 0;
          id v33 = 0;
          if (v174 != 6) {
            goto LABEL_337;
          }
LABEL_336:
          id v33 = v399;
          uint64_t v53 = v277;
          v51 = v163;
          goto LABEL_337;
        }
        BOOL v97 = +[GondolaDecoder isCardUsageFlag:v95];
        v400 = (void *)v96;
        BOOL v98 = +[GondolaDecoder isCardEffectiveFlag:v96];
        if (v97)
        {
          v99 = [NSNumber numberWithInt:v98 ^ 1];
          [v384 setObject:v99 forKeyedSubscript:@"CardDenyListed"];
        }
        else
        {
          [v384 setObject:MEMORY[0x1E4F1CC28] forKeyedSubscript:@"CardDenyListed"];
        }
        if (self->_debug)
        {
          v214 = [NSNumber numberWithBool:v97];
          [v384 setObject:v214 forKeyedSubscript:@"CardActivated"];

          v215 = [NSNumber numberWithBool:v98];
          [v384 setObject:v215 forKeyedSubscript:@"CardEffective"];

          v216 = [NSString hexStringFromBytes:(void)v506 length:2];
          [v384 setObject:v216 forKeyedSubscript:@"LifeCycleState"];
        }
        v122 = +[GondolaDecoder decodeEnrollmentDateAfterDelivery:v96];
        uint64_t v217 = [MEMORY[0x1E4F1CA48] arrayWithCapacity:3];
        v91 = +[SlalomDecoder getDataAndCheckFeliCaServiceCode:26647 withBlockNumber:0 withTransceiver:v12 withError:a7];

        v379 = (void *)v217;
        if (v91)
        {
          v377 = v122;
          id v394 = v13;
          v218 = +[GondolaDecoder getPurseBalance:v91];
          v462[0] = @"BalanceIdentifier";
          v462[1] = @"Balance";
          v463[0] = @"Purse";
          v463[1] = v218;
          v462[2] = @"BalanceCurrency";
          v462[3] = @"BalanceCurrencyExponent";
          v463[2] = @"JPY";
          v463[3] = &unk_1F24E1FC0;
          uint64_t v219 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v463 forKeys:v462 count:4];
          v220 = (void *)v217;
          v221 = (void *)v219;
          [v220 addObject:v219];

          v389 = [MEMORY[0x1E4F1CA48] array];
          unsigned __int8 v222 = 0;
          v223 = v400;
          do
          {
            v224 = v91;
            v91 = +[SlalomDecoder getDataAndCheckFeliCaServiceCode:26635 withBlockNumber:v222 withTransceiver:v12 withError:a7];

            uint64_t v225 = +[SlalomDecoder getDataAndCheckFeliCaServiceCode:26635 withBlockNumber:v222 | 1u withTransceiver:v12 withError:a7];

            if (v91) {
              BOOL v226 = v225 == 0;
            }
            else {
              BOOL v226 = 1;
            }
            v400 = (void *)v225;
            if (v226)
            {
              v278 = ATLLogObject();
              uint64_t v90 = v384;
              if (os_log_type_enabled(v278, OS_LOG_TYPE_ERROR))
              {
                *(_WORD *)v484 = 0;
                _os_log_impl(&dword_1CA552000, v278, OS_LOG_TYPE_ERROR, "Failed to retrieve Gondola history, invalid blocks", v484, 2u);
              }

              uint64_t v279 = [[NSString alloc] initWithFormat:@"Failed to retrieve Gondola history, invalid blocks"];
              v280 = (void *)v279;
              id v13 = v394;
              if (a7)
              {
                id v281 = *a7;
                v282 = (void *)MEMORY[0x1E4F28C58];
                if (*a7)
                {
                  uint64_t v283 = *MEMORY[0x1E4F28A50];
                  v454[0] = *MEMORY[0x1E4F28568];
                  v454[1] = v283;
                  v455[0] = v279;
                  v455[1] = v281;
                  v284 = (void *)MEMORY[0x1E4F1C9E8];
                  v285 = v455;
                  v286 = v454;
                  uint64_t v287 = 2;
                }
                else
                {
                  uint64_t v456 = *MEMORY[0x1E4F28568];
                  uint64_t v457 = v279;
                  v284 = (void *)MEMORY[0x1E4F1C9E8];
                  v285 = &v457;
                  v286 = &v456;
                  uint64_t v287 = 1;
                }
                v361 = [v284 dictionaryWithObjects:v285 forKeys:v286 count:v287];
                *a7 = [v282 errorWithDomain:@"ATL" code:3 userInfo:v361];
              }
              goto LABEL_333;
            }
            v227 = +[GondolaDecoder decodeHistoryBlock1:v91 andWithBlock2:v225];
            v228 = [v227 objectForKeyedSubscript:@"TopUp"];
            v229 = [v228 objectForKeyedSubscript:@"Amount"];

            if (v229)
            {
              v230 = [v227 objectForKeyedSubscript:@"TopUp"];
              [v389 addObject:v230];
            }
            v231 = [v227 objectForKeyedSubscript:@"Charge"];
            v232 = [v231 objectForKeyedSubscript:@"Amount"];

            if (v232)
            {
              v233 = [v227 objectForKeyedSubscript:@"Charge"];
              [v389 addObject:v233];
            }
            unsigned int v234 = v222;
            v222 += 2;
            v223 = v400;
          }
          while (v234 < 4);
          id v375 = v12;
          id v372 = [MEMORY[0x1E4F29008] sortDescriptorWithKey:@"SerialNumber" ascending:0];
          id v453 = v372;
          v235 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v453 count:1];
          v236 = [v389 sortedArrayUsingDescriptors:v235];
          [v399 setObject:v236 forKeyedSubscript:@"TransactionHistory"];

          long long v414 = 0u;
          long long v415 = 0u;
          long long v412 = 0u;
          long long v413 = 0u;
          id v237 = v389;
          uint64_t v238 = [v237 countByEnumeratingWithState:&v412 objects:v452 count:16];
          if (v238)
          {
            uint64_t v239 = v238;
            uint64_t v240 = *(void *)v413;
            do
            {
              for (uint64_t j = 0; j != v239; ++j)
              {
                if (*(void *)v413 != v240) {
                  objc_enumerationMutation(v237);
                }
                v242 = *(void **)(*((void *)&v412 + 1) + 8 * j);
                v243 = [v242 objectForKey:@"fakeTransactionId"];

                if (v243)
                {
                  v244 = [v242 objectForKeyedSubscript:@"fakeTransactionId"];
                  [v242 setObject:v244 forKeyedSubscript:@"SerialNumber"];

                  [v242 removeObjectForKey:@"fakeTransactionId"];
                }
              }
              uint64_t v239 = [v237 countByEnumeratingWithState:&v412 objects:v452 count:16];
            }
            while (v239);
          }

          id v12 = v375;
          v245 = +[SlalomDecoder getDataAndCheckFeliCaServiceCode:26635 withBlockNumber:7 withTransceiver:v375 withError:a7];

          if (v245)
          {
            v246 = +[GondolaDecoder decodeAutoTopUpAmount:v245];
            id v13 = v394;
            v122 = v377;
            if ((int)[v246 intValue] >= 1) {
              [v399 setObject:v246 forKeyedSubscript:@"CardDefaultAAVSAmount"];
            }

            v91 = +[SlalomDecoder getDataAndCheckFeliCaServiceCode:26699 withBlockNumber:0 withTransceiver:v375 withError:a7];

            if (v91)
            {
              v247 = v379;
              if (v377)
              {
                v248 = +[GondolaDecoder decodeLoyaltyPointBalancesAndExpiration:v91 withActivationDate:v377];
                if (v248) {
                  [v379 addObjectsFromArray:v248];
                }
              }
              [v384 setObject:v379 forKeyedSubscript:@"Balances"];
              uint64_t v90 = v384;
              [v399 setObject:v384 forKeyedSubscript:@"State"];
              int v174 = 6;
              goto LABEL_334;
            }
            v362 = ATLLogObject();
            if (os_log_type_enabled(v362, OS_LOG_TYPE_ERROR))
            {
              *(_WORD *)v484 = 0;
              _os_log_impl(&dword_1CA552000, v362, OS_LOG_TYPE_ERROR, "Failed to retrieve Gondola loyalty balances, invalid block", v484, 2u);
            }

            uint64_t v363 = [[NSString alloc] initWithFormat:@"Failed to retrieve Gondola loyalty balances, invalid block"];
            v251 = (void *)v363;
            uint64_t v90 = v384;
            if (!a7) {
              goto LABEL_332;
            }
            id v364 = *a7;
            v253 = (void *)MEMORY[0x1E4F28C58];
            if (*a7)
            {
              uint64_t v365 = *MEMORY[0x1E4F28A50];
              v444[0] = *MEMORY[0x1E4F28568];
              v444[1] = v365;
              v445[0] = v363;
              v445[1] = v364;
              v255 = (void *)MEMORY[0x1E4F1C9E8];
              v256 = v445;
              v257 = v444;
LABEL_309:
              uint64_t v366 = 2;
LABEL_331:
              v370 = [v255 dictionaryWithObjects:v256 forKeys:v257 count:v366];
              *a7 = [v253 errorWithDomain:@"ATL" code:3 userInfo:v370];

LABEL_332:
              v91 = 0;
LABEL_333:
              int v174 = 1;
              v247 = v379;
              goto LABEL_334;
            }
            uint64_t v446 = *MEMORY[0x1E4F28568];
            uint64_t v447 = v363;
            v255 = (void *)MEMORY[0x1E4F1C9E8];
            v256 = &v447;
            v257 = &v446;
          }
          else
          {
            v347 = ATLLogObject();
            id v13 = v394;
            v122 = v377;
            if (os_log_type_enabled(v347, OS_LOG_TYPE_ERROR))
            {
              *(_WORD *)v484 = 0;
              _os_log_impl(&dword_1CA552000, v347, OS_LOG_TYPE_ERROR, "Failed to retrieve Gondola AAVS settings, invalid block", v484, 2u);
            }

            uint64_t v348 = [[NSString alloc] initWithFormat:@"Failed to retrieve Gondola AAVS settings, invalid block"];
            v251 = (void *)v348;
            uint64_t v90 = v384;
            if (!a7) {
              goto LABEL_332;
            }
            id v349 = *a7;
            v253 = (void *)MEMORY[0x1E4F28C58];
            if (*a7)
            {
              uint64_t v350 = *MEMORY[0x1E4F28A50];
              v448[0] = *MEMORY[0x1E4F28568];
              v448[1] = v350;
              v449[0] = v348;
              v449[1] = v349;
              v255 = (void *)MEMORY[0x1E4F1C9E8];
              v256 = v449;
              v257 = v448;
              goto LABEL_309;
            }
            uint64_t v450 = *MEMORY[0x1E4F28568];
            uint64_t v451 = v348;
            v255 = (void *)MEMORY[0x1E4F1C9E8];
            v256 = &v451;
            v257 = &v450;
          }
        }
        else
        {
          v249 = ATLLogObject();
          if (os_log_type_enabled(v249, OS_LOG_TYPE_ERROR))
          {
            *(_WORD *)v484 = 0;
            _os_log_impl(&dword_1CA552000, v249, OS_LOG_TYPE_ERROR, "Failed to retrieve Gondola purse, invalid block", v484, 2u);
          }

          uint64_t v250 = [[NSString alloc] initWithFormat:@"Failed to retrieve Gondola purse, invalid block"];
          v251 = (void *)v250;
          uint64_t v90 = v384;
          if (!a7) {
            goto LABEL_332;
          }
          id v252 = *a7;
          v253 = (void *)MEMORY[0x1E4F28C58];
          if (*a7)
          {
            uint64_t v254 = *MEMORY[0x1E4F28A50];
            v458[0] = *MEMORY[0x1E4F28568];
            v458[1] = v254;
            v459[0] = v250;
            v459[1] = v252;
            v255 = (void *)MEMORY[0x1E4F1C9E8];
            v256 = v459;
            v257 = v458;
            goto LABEL_309;
          }
          uint64_t v460 = *MEMORY[0x1E4F28568];
          uint64_t v461 = v250;
          v255 = (void *)MEMORY[0x1E4F1C9E8];
          v256 = &v461;
          v257 = &v460;
        }
        uint64_t v366 = 1;
        goto LABEL_331;
      default:
        uint64_t v68 = ATLLogObject();
        if (os_log_type_enabled(v68, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)v484 = 67109120;
          int v485 = v48;
          _os_log_impl(&dword_1CA552000, v68, OS_LOG_TYPE_ERROR, "Could not GET APPLET HISTORY: unknown Service Provider ID %d in SELECT Response", v484, 8u);
        }

        uint64_t v69 = [[NSString alloc] initWithFormat:@"Could not GET APPLET HISTORY: unknown Service Provider ID %d in SELECT Response", v48];
        uint64_t v70 = (void *)v69;
        if (a7)
        {
          id v71 = *a7;
          uint64_t v72 = (void *)MEMORY[0x1E4F28C58];
          if (*a7)
          {
            uint64_t v73 = *MEMORY[0x1E4F28A50];
            v419[0] = *MEMORY[0x1E4F28568];
            v419[1] = v73;
            v420[0] = v69;
            v420[1] = v71;
            uint64_t v74 = (void *)MEMORY[0x1E4F1C9E8];
            id v75 = v420;
            uint64_t v76 = v419;
            uint64_t v77 = 2;
          }
          else
          {
            uint64_t v421 = *MEMORY[0x1E4F28568];
            uint64_t v422 = v69;
            uint64_t v74 = (void *)MEMORY[0x1E4F1C9E8];
            id v75 = &v422;
            uint64_t v76 = &v421;
            uint64_t v77 = 1;
          }
          v173 = [v74 dictionaryWithObjects:v75 forKeys:v76 count:v77];
          *a7 = [v72 errorWithDomain:@"ATL" code:3 userInfo:v173];
        }
LABEL_315:
        uint64_t v53 = 0;
        uint64_t v52 = 0;
        v51 = 0;
        goto LABEL_316;
    }
  }
  uint64_t v21 = v20;
  uint64_t v22 = v17;
  id v23 = ATLLogObject();
  if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)long long buf = 67109120;
    *(_DWORD *)&uint8_t buf[4] = v21;
    _os_log_impl(&dword_1CA552000, v23, OS_LOG_TYPE_ERROR, "Failed to find tag 'A5' in Slalom SELECT response, %d", buf, 8u);
  }

  uint64_t v24 = [[NSString alloc] initWithFormat:@"Failed to find tag 'A5' in Slalom SELECT response, %d", v21];
  uint64_t v25 = (void *)v24;
  if (a7)
  {
    id v26 = *a7;
    id v27 = (void *)MEMORY[0x1E4F28C58];
    if (*a7)
    {
      uint64_t v28 = *MEMORY[0x1E4F28A50];
      v507[0] = *MEMORY[0x1E4F28568];
      v507[1] = v28;
      v508[0] = v24;
      v508[1] = v26;
      uint64_t v29 = (void *)MEMORY[0x1E4F1C9E8];
      uint64_t v30 = v508;
      id v31 = v507;
      uint64_t v32 = 2;
    }
    else
    {
      uint64_t v509 = *MEMORY[0x1E4F28568];
      v510[0] = v24;
      uint64_t v29 = (void *)MEMORY[0x1E4F1C9E8];
      uint64_t v30 = v510;
      id v31 = &v509;
      uint64_t v32 = 1;
    }
    uint64_t v47 = [v29 dictionaryWithObjects:v30 forKeys:v31 count:v32];
    *a7 = [v27 errorWithDomain:@"ATL" code:3 userInfo:v47];
  }
  id v33 = 0;
  uint64_t v17 = v22;
LABEL_340:
  uint64_t v18 = v407;
LABEL_341:

  return v33;
}

- (id)GetAppletProperties:(id)a3 withPackage:(id)a4 withModule:(id)a5 withTransceiver:(id)a6 withError:(id *)a7
{
  v10[2] = *MEMORY[0x1E4F143B8];
  v9[0] = @"Supported";
  v9[1] = @"DelayExpressReentry";
  v10[0] = MEMORY[0x1E4F1CC38];
  v10[1] = &unk_1F24E1FF0;
  uint64_t v7 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v10, v9, 2, a6, a7];

  return v7;
}

- (id)processEndOfTransaction:(id)a3 withApplet:(id)a4 withPackage:(id)a5 withModule:(id)a6 withError:(id *)a7
{
  v82[1] = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  id v11 = a4;
  if (v10)
  {
    self->_eotInProgress = 1;
    id v12 = [MEMORY[0x1E4F1C9B8] dataWithHexString:v11];
    id v13 = EndOfTransactionCmd(v12, 0);
    id v14 = (id)[v10 transceive:v13 error:0];
    id v15 = SelectByNameCmd(v12);

    uint64_t v16 = [v10 transceiveAndCheckSW:v15 error:a7];
    v59[0] = (unsigned __int8 *)[v16 bytes];
    v59[1] = (unsigned __int8 *)[v16 length];
    uint64_t v57 = 0;
    v58[0] = 0;
    v58[1] = 0;
    DERFindItem(v59, 0xA000000000000005, (uint64_t)&v57);
    if (v17)
    {
      uint64_t v18 = v17;
      uint64_t v19 = ATLLogObject();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)long long buf = 67109120;
        *(_DWORD *)&uint8_t buf[4] = v18;
        _os_log_impl(&dword_1CA552000, v19, OS_LOG_TYPE_ERROR, "Failed to find tag 'A5' in Slalom SELECT response, %d", buf, 8u);
      }

      uint64_t v20 = [[NSString alloc] initWithFormat:@"Failed to find tag 'A5' in Slalom SELECT response, %d", v18];
      uint64_t v21 = (void *)v20;
      if (!a7) {
        goto LABEL_30;
      }
      id v22 = *a7;
      id v23 = (void *)MEMORY[0x1E4F28C58];
      if (*a7)
      {
        uint64_t v24 = *MEMORY[0x1E4F28A50];
        v75[0] = *MEMORY[0x1E4F28568];
        v75[1] = v24;
        v76[0] = v20;
        v76[1] = v22;
        uint64_t v25 = (void *)MEMORY[0x1E4F1C9E8];
        id v26 = v76;
        id v27 = v75;
LABEL_19:
        uint64_t v44 = 2;
LABEL_29:
        int v50 = [v25 dictionaryWithObjects:v26 forKeys:v27 count:v44];
        *a7 = [v23 errorWithDomain:@"ATL" code:3 userInfo:v50];

LABEL_30:
        self->_eotInProgress = 0;
        [(NSMutableArray *)self->_hciArray removeAllObjects];
        uint64_t v46 = 0;
LABEL_31:

        goto LABEL_32;
      }
      uint64_t v77 = *MEMORY[0x1E4F28568];
      uint64_t v78 = v20;
      uint64_t v25 = (void *)MEMORY[0x1E4F1C9E8];
      id v26 = &v78;
      id v27 = &v77;
      goto LABEL_28;
    }
    long long v73 = 0u;
    long long v74 = 0u;
    long long v71 = 0u;
    long long v72 = 0u;
    long long v69 = 0u;
    long long v70 = 0u;
    *(_OWORD *)long long buf = 0u;
    uint64_t v38 = DERParseSequenceSpec((uint64_t)v58, (uint64_t)&selectResponseA5ContentSpec, (char *)buf, 0x18uLL);
    if (v38)
    {
      uint64_t v39 = v38;
      id v40 = ATLLogObject();
      if (os_log_type_enabled(v40, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)uint64_t v66 = 67109120;
        int v67 = v39;
        _os_log_impl(&dword_1CA552000, v40, OS_LOG_TYPE_ERROR, "Failed to decode SELECT response contents %d", v66, 8u);
      }

      uint64_t v41 = [[NSString alloc] initWithFormat:@"Failed to decode SELECT response contents %d", v39];
      uint64_t v21 = (void *)v41;
      if (!a7) {
        goto LABEL_30;
      }
      id v42 = *a7;
      id v23 = (void *)MEMORY[0x1E4F28C58];
      if (*a7)
      {
        uint64_t v43 = *MEMORY[0x1E4F28A50];
        v62[0] = *MEMORY[0x1E4F28568];
        v62[1] = v43;
        v63[0] = v41;
        v63[1] = v42;
        uint64_t v25 = (void *)MEMORY[0x1E4F1C9E8];
        id v26 = v63;
        id v27 = v62;
        goto LABEL_19;
      }
      uint64_t v64 = *MEMORY[0x1E4F28568];
      uint64_t v65 = v41;
      uint64_t v25 = (void *)MEMORY[0x1E4F1C9E8];
      id v26 = &v65;
      id v27 = &v64;
LABEL_28:
      uint64_t v44 = 1;
      goto LABEL_29;
    }
    uint64_t v47 = *(unsigned __int8 *)v73;
    unint64_t v48 = 0x1E4F28000uLL;
    if (v47 == 3)
    {
      uint64_t v49 = &off_1E65ADA58;
    }
    else
    {
      if (v47 != 2)
      {
        self->_eotInProgress = 0;
        [(NSMutableArray *)self->_hciArray removeAllObjects];
        goto LABEL_44;
      }
      uint64_t v49 = &off_1E65ADB48;
    }
    uint64_t v52 = [(__objc2_class *)*v49 generateEndEventFromHCI:self->_hciArray withTransceiver:v10];
    [(NSMutableArray *)self->_hciArray removeAllObjects];
    if (v52)
    {
      uint64_t v53 = [v52 objectForKeyedSubscript:@"NFServiceProviderID"];
      id v54 = [v52 objectForKeyedSubscript:@"readOnly"];
      if ([v53 intValue] == 1
        || [v53 intValue] == 4
        || [v53 intValue] == 5
        || [v53 intValue] == 8)
      {
        unsigned __int16 v55 = -4095;
      }
      else if ([v54 BOOLValue])
      {
        unsigned __int16 v55 = -4094;
      }
      else
      {
        unsigned __int16 v55 = -4095;
      }

      unint64_t v48 = 0x1E4F28000;
      goto LABEL_45;
    }
LABEL_44:
    uint64_t v60 = @"NFServiceProviderID";
    uint64_t v53 = [NSNumber numberWithUnsignedChar:v47];
    uint64_t v61 = v53;
    uint64_t v52 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v61 forKeys:&v60 count:1];
    unsigned __int16 v55 = -4094;
LABEL_45:

    uint64_t v46 = [MEMORY[0x1E4F1CA60] dictionary];
    [v46 setObject:v11 forKeyedSubscript:@"appletIdentifier"];
    [v46 setObject:&unk_1F24E2008 forKeyedSubscript:@"type"];
    id v56 = [*(id *)(v48 + 3792) numberWithUnsignedShort:v55];
    [v46 setObject:v56 forKeyedSubscript:@"result"];

    [v46 setObject:v52 forKeyedSubscript:@"felicaInfo"];
    self->_eotInProgress = 0;

    goto LABEL_31;
  }
  uint64_t v28 = ATLLogObject();
  if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)long long buf = 0;
    _os_log_impl(&dword_1CA552000, v28, OS_LOG_TYPE_ERROR, "Transceiver is required to process End of Transaction method call.", buf, 2u);
  }

  uint64_t v29 = [[NSString alloc] initWithFormat:@"Transceiver is required to process End of Transaction method call."];
  uint64_t v30 = (void *)v29;
  if (a7)
  {
    id v31 = *a7;
    uint64_t v32 = (void *)MEMORY[0x1E4F28C58];
    if (*a7)
    {
      uint64_t v33 = *MEMORY[0x1E4F28A50];
      v79[0] = *MEMORY[0x1E4F28568];
      v79[1] = v33;
      v80[0] = v29;
      v80[1] = v31;
      uint64_t v34 = (void *)MEMORY[0x1E4F1C9E8];
      uint64_t v35 = v80;
      uint64_t v36 = v79;
      uint64_t v37 = 2;
    }
    else
    {
      uint64_t v81 = *MEMORY[0x1E4F28568];
      v82[0] = v29;
      uint64_t v34 = (void *)MEMORY[0x1E4F1C9E8];
      uint64_t v35 = v82;
      uint64_t v36 = &v81;
      uint64_t v37 = 1;
    }
    uint64_t v45 = [v34 dictionaryWithObjects:v35 forKeys:v36 count:v37];
    *a7 = [v32 errorWithDomain:@"ATL" code:4 userInfo:v45];
  }
  [(NSMutableArray *)self->_hciArray removeAllObjects];
  uint64_t v46 = 0;
LABEL_32:

  return v46;
}

- (id)getServiceProviderData:(id)a3 withPackage:(id)a4 withModule:(id)a5 withTransceiver:(id)a6 withError:(id *)a7
{
  v209[1] = *MEMORY[0x1E4F143B8];
  id v9 = a6;
  id v10 = [MEMORY[0x1E4F1C9B8] dataWithHexString:a3];
  id v11 = SelectByNameCmd(v10);

  id v12 = [v9 transceiveAndCheckSW:v11 error:a7];
  id v13 = v12;
  if (!v12)
  {
LABEL_17:
    uint64_t v39 = 0;
    goto LABEL_112;
  }
  v156[0] = (unsigned __int8 *)[v12 bytes];
  v156[1] = (unsigned __int8 *)[v13 length];
  uint64_t v154 = 0;
  v155[0] = 0;
  v155[1] = 0;
  DERFindItem(v156, 0xA000000000000005, (uint64_t)&v154);
  if (v14)
  {
    uint64_t v15 = v14;
    uint64_t v16 = ATLLogObject();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    {
      LODWORD(buf) = 67109120;
      DWORD1(buf) = v15;
      _os_log_impl(&dword_1CA552000, v16, OS_LOG_TYPE_ERROR, "Failed to find tag 'A5' in Slalom SELECT response, %d", (uint8_t *)&buf, 8u);
    }

    uint64_t v17 = [[NSString alloc] initWithFormat:@"Failed to find tag 'A5' in Slalom SELECT response, %d", v15];
    uint64_t v18 = (void *)v17;
    if (a7)
    {
      id v19 = *a7;
      uint64_t v20 = (void *)MEMORY[0x1E4F28C58];
      if (*a7)
      {
        uint64_t v21 = *MEMORY[0x1E4F28A50];
        v206[0] = *MEMORY[0x1E4F28568];
        v206[1] = v21;
        v207[0] = v17;
        v207[1] = v19;
        id v22 = (void *)MEMORY[0x1E4F1C9E8];
        id v23 = v207;
        uint64_t v24 = v206;
        uint64_t v25 = 2;
      }
      else
      {
        uint64_t v208 = *MEMORY[0x1E4F28568];
        v209[0] = v17;
        id v22 = (void *)MEMORY[0x1E4F1C9E8];
        id v23 = v209;
        uint64_t v24 = &v208;
        uint64_t v25 = 1;
      }
      uint64_t v38 = [v22 dictionaryWithObjects:v23 forKeys:v24 count:v25];
      *a7 = [v20 errorWithDomain:@"ATL" code:3 userInfo:v38];
    }
    goto LABEL_17;
  }
  long long v204 = 0u;
  long long v205 = 0u;
  long long v202 = 0u;
  long long v203 = 0u;
  long long v200 = 0u;
  long long v201 = 0u;
  long long buf = 0u;
  uint64_t v26 = DERParseSequenceSpec((uint64_t)v155, (uint64_t)&selectResponseA5ContentSpec, (char *)&buf, 0x18uLL);
  if (v26)
  {
    uint64_t v27 = v26;
    uint64_t v28 = ATLLogObject();
    if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)id v197 = 67109120;
      int v198 = v27;
      _os_log_impl(&dword_1CA552000, v28, OS_LOG_TYPE_ERROR, "Failed to decode SELECT response contents %d", v197, 8u);
    }

    uint64_t v29 = [[NSString alloc] initWithFormat:@"Failed to decode SELECT response contents %d", v27];
    uint64_t v30 = (void *)v29;
    if (a7)
    {
      id v31 = *a7;
      uint64_t v32 = (void *)MEMORY[0x1E4F28C58];
      if (*a7)
      {
        uint64_t v33 = *MEMORY[0x1E4F28A50];
        v193[0] = *MEMORY[0x1E4F28568];
        v193[1] = v33;
        v194[0] = v29;
        v194[1] = v31;
        uint64_t v34 = (void *)MEMORY[0x1E4F1C9E8];
        uint64_t v35 = v194;
        uint64_t v36 = v193;
        uint64_t v37 = 2;
      }
      else
      {
        uint64_t v195 = *MEMORY[0x1E4F28568];
        uint64_t v196 = v29;
        uint64_t v34 = (void *)MEMORY[0x1E4F1C9E8];
        uint64_t v35 = &v196;
        uint64_t v36 = &v195;
        uint64_t v37 = 1;
      }
      uint64_t v41 = [v34 dictionaryWithObjects:v35 forKeys:v36 count:v37];
      id v54 = v32;
      uint64_t v55 = 3;
LABEL_27:
      [v54 errorWithDomain:@"ATL" code:v55 userInfo:v41];
      uint64_t v39 = 0;
      *a7 = (id)objc_claimAutoreleasedReturnValue();
LABEL_110:

      goto LABEL_111;
    }
    goto LABEL_40;
  }
  uint64_t v40 = *(unsigned __int8 *)v204;
  if (v40 == 7)
  {
    uint64_t v30 = objc_opt_new();
    id v56 = +[SlalomDecoder getDataAndCheckFeliCaServiceCode:26575 withBlockNumber:0 withTransceiver:v9 withError:a7];
    uint64_t v41 = +[SlalomDecoder getDataAndCheckFeliCaServiceCode:26575 withBlockNumber:1 withTransceiver:v9 withError:a7];
    if (v56)
    {
      uint64_t v57 = +[GondolaDecoder decodeCardNumberFromBlock0:v56 andBlock1:v41];
      id v58 = [v57 asHexString];
      [v30 setObject:v58 forKeyedSubscript:@"CardNumber"];

      id v59 = +[SlalomDecoder getDataAndCheckFeliCaServiceCode:26647 withBlockNumber:0 withTransceiver:v9 withError:a7];

      if (v59)
      {
        uint64_t v60 = [v59 subdataWithOffset:0 length:4];
        uint64_t v61 = [v60 asHexString];
        [v30 setObject:v61 forKeyedSubscript:@"Balance"];

        uint64_t v62 = +[SlalomDecoder getDataAndCheckFeliCaServiceCode:26571 withBlockNumber:1 withTransceiver:v9 withError:a7];

        $06D0163FE0D7AFE752A9F21F38483579 v63 = +[SlalomDecoder getDataAndCheckFeliCaServiceCode:26571 withBlockNumber:0 withTransceiver:v9 withError:a7];

        if (!v62 || !v63)
        {
          id v103 = ATLLogObject();
          if (os_log_type_enabled(v103, OS_LOG_TYPE_ERROR))
          {
            *(_WORD *)id v197 = 0;
            _os_log_impl(&dword_1CA552000, v103, OS_LOG_TYPE_ERROR, "Failed to decode Gondola SP Opaque Data", v197, 2u);
          }

          uint64_t v104 = [[NSString alloc] initWithFormat:@"Failed to decode Gondola SP Opaque Data"];
          uint64_t v105 = (void *)v104;
          if (a7)
          {
            id v106 = *a7;
            v107 = (void *)MEMORY[0x1E4F28C58];
            if (*a7)
            {
              uint64_t v108 = *MEMORY[0x1E4F28A50];
              v169[0] = *MEMORY[0x1E4F28568];
              v169[1] = v108;
              v170[0] = v104;
              v170[1] = v106;
              uint64_t v109 = (void *)MEMORY[0x1E4F1C9E8];
              v110 = v170;
              uint64_t v111 = v169;
              uint64_t v112 = 2;
            }
            else
            {
              uint64_t v171 = *MEMORY[0x1E4F28568];
              uint64_t v172 = v104;
              uint64_t v109 = (void *)MEMORY[0x1E4F1C9E8];
              v110 = &v172;
              uint64_t v111 = &v171;
              uint64_t v112 = 1;
            }
            unsigned int v146 = [v109 dictionaryWithObjects:v110 forKeys:v111 count:v112];
            *a7 = [v107 errorWithDomain:@"ATL" code:8 userInfo:v146];
          }
          goto LABEL_107;
        }
        uint64_t v64 = [v62 subdataWithOffset:3 length:3];
        uint64_t v65 = [v64 asHexString];
        [v30 setObject:v65 forKeyedSubscript:@"EntryDate"];

        uint64_t v66 = [[NSNumber numberWithBool:+[GondolaDecoder isCardUsageFlag:](GondolaDecoder, "isCardUsageFlag:", v63)];
        [v30 setObject:v66 forKeyedSubscript:@"UsageStartFlag"];

        int v67 = [NSNumber numberWithUnsignedChar:[v62 u8:12]];
        [v30 setObject:v67 forKeyedSubscript:@"BrandApplicationStatus"];

        uint64_t v68 = +[SlalomDecoder getDataAndCheckFeliCaServiceCode:26699 withBlockNumber:0 withTransceiver:v9 withError:a7];

        if (v68)
        {
          long long v69 = [v68 asHexString];
          [v30 setObject:v69 forKeyedSubscript:@"PointBlock"];

          $06D0163FE0D7AFE752A9F21F38483579 v63 = +[SlalomDecoder getDataAndCheckFeliCaServiceCode:26635 withBlockNumber:7 withTransceiver:v9 withError:a7];

          if (v63)
          {
            long long v70 = [v63 subdataWithOffset:4 length:5];
            long long v71 = [v70 asHexString];
            [v30 setObject:v71 forKeyedSubscript:@"BitData9"];

            uint64_t v39 = [MEMORY[0x1E4F28D90] dataWithJSONObject:v30 options:1 error:a7];
LABEL_108:
            uint64_t v41 = v62;
            goto LABEL_109;
          }
          v141 = ATLLogObject();
          if (os_log_type_enabled(v141, OS_LOG_TYPE_ERROR))
          {
            *(_WORD *)id v197 = 0;
            _os_log_impl(&dword_1CA552000, v141, OS_LOG_TYPE_ERROR, "Failed to decode Gondola SP Opaque Data", v197, 2u);
          }

          uint64_t v142 = [[NSString alloc] initWithFormat:@"Failed to decode Gondola SP Opaque Data"];
          $06D0163FE0D7AFE752A9F21F38483579 v63 = (void *)v142;
          if (!a7)
          {
LABEL_107:
            uint64_t v39 = 0;
            goto LABEL_108;
          }
          id v143 = *a7;
          v135 = (void *)MEMORY[0x1E4F28C58];
          if (*a7)
          {
            uint64_t v144 = *MEMORY[0x1E4F28A50];
            v161[0] = *MEMORY[0x1E4F28568];
            v161[1] = v144;
            v162[0] = v142;
            v162[1] = v143;
            v137 = (void *)MEMORY[0x1E4F1C9E8];
            uint64_t v138 = v162;
            v139 = v161;
            goto LABEL_92;
          }
          uint64_t v163 = *MEMORY[0x1E4F28568];
          uint64_t v164 = v142;
          v137 = (void *)MEMORY[0x1E4F1C9E8];
          uint64_t v138 = &v164;
          v139 = &v163;
        }
        else
        {
          v132 = ATLLogObject();
          if (os_log_type_enabled(v132, OS_LOG_TYPE_ERROR))
          {
            *(_WORD *)id v197 = 0;
            _os_log_impl(&dword_1CA552000, v132, OS_LOG_TYPE_ERROR, "Failed to decode Gondola SP Opaque Data", v197, 2u);
          }

          uint64_t v133 = [[NSString alloc] initWithFormat:@"Failed to decode Gondola SP Opaque Data"];
          $06D0163FE0D7AFE752A9F21F38483579 v63 = (void *)v133;
          if (!a7) {
            goto LABEL_107;
          }
          id v134 = *a7;
          v135 = (void *)MEMORY[0x1E4F28C58];
          if (*a7)
          {
            uint64_t v136 = *MEMORY[0x1E4F28A50];
            v165[0] = *MEMORY[0x1E4F28568];
            v165[1] = v136;
            v166[0] = v133;
            v166[1] = v134;
            v137 = (void *)MEMORY[0x1E4F1C9E8];
            uint64_t v138 = v166;
            v139 = v165;
LABEL_92:
            uint64_t v145 = 2;
LABEL_106:
            v149 = [v137 dictionaryWithObjects:v138 forKeys:v139 count:v145];
            *a7 = [v135 errorWithDomain:@"ATL" code:8 userInfo:v149];

            goto LABEL_107;
          }
          uint64_t v167 = *MEMORY[0x1E4F28568];
          uint64_t v168 = v133;
          v137 = (void *)MEMORY[0x1E4F1C9E8];
          uint64_t v138 = &v168;
          v139 = &v167;
        }
        uint64_t v145 = 1;
        goto LABEL_106;
      }
      BOOL v98 = ATLLogObject();
      if (os_log_type_enabled(v98, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)id v197 = 0;
        _os_log_impl(&dword_1CA552000, v98, OS_LOG_TYPE_ERROR, "Failed to decode Gondola SP Opaque Data", v197, 2u);
      }

      uint64_t v99 = [[NSString alloc] initWithFormat:@"Failed to decode Gondola SP Opaque Data"];
      $06D0163FE0D7AFE752A9F21F38483579 v63 = (void *)v99;
      if (!a7)
      {
LABEL_86:
        uint64_t v39 = 0;
LABEL_109:

        goto LABEL_110;
      }
      id v100 = *a7;
      uint64_t v93 = (void *)MEMORY[0x1E4F28C58];
      if (*a7)
      {
        uint64_t v101 = *MEMORY[0x1E4F28A50];
        v173[0] = *MEMORY[0x1E4F28568];
        v173[1] = v101;
        v174[0] = v99;
        v174[1] = v100;
        v95 = (void *)MEMORY[0x1E4F1C9E8];
        uint64_t v96 = v174;
        BOOL v97 = v173;
        goto LABEL_56;
      }
      uint64_t v175 = *MEMORY[0x1E4F28568];
      uint64_t v176 = v99;
      v95 = (void *)MEMORY[0x1E4F1C9E8];
      uint64_t v96 = &v176;
      BOOL v97 = &v175;
    }
    else
    {
      uint64_t v90 = ATLLogObject();
      if (os_log_type_enabled(v90, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)id v197 = 0;
        _os_log_impl(&dword_1CA552000, v90, OS_LOG_TYPE_ERROR, "Failed to decode Gondola SP Opaque Data", v197, 2u);
      }

      uint64_t v91 = [[NSString alloc] initWithFormat:@"Failed to decode Gondola SP Opaque Data"];
      $06D0163FE0D7AFE752A9F21F38483579 v63 = (void *)v91;
      if (!a7) {
        goto LABEL_86;
      }
      id v92 = *a7;
      uint64_t v93 = (void *)MEMORY[0x1E4F28C58];
      if (*a7)
      {
        uint64_t v94 = *MEMORY[0x1E4F28A50];
        v177[0] = *MEMORY[0x1E4F28568];
        v177[1] = v94;
        v178[0] = v91;
        v178[1] = v92;
        v95 = (void *)MEMORY[0x1E4F1C9E8];
        uint64_t v96 = v178;
        BOOL v97 = v177;
LABEL_56:
        uint64_t v102 = 2;
LABEL_85:
        v140 = [v95 dictionaryWithObjects:v96 forKeys:v97 count:v102];
        *a7 = [v93 errorWithDomain:@"ATL" code:8 userInfo:v140];

        goto LABEL_86;
      }
      uint64_t v179 = *MEMORY[0x1E4F28568];
      uint64_t v180 = v91;
      v95 = (void *)MEMORY[0x1E4F1C9E8];
      uint64_t v96 = &v180;
      BOOL v97 = &v179;
    }
    uint64_t v102 = 1;
    goto LABEL_85;
  }
  if (v40 == 4)
  {
    uint64_t v30 = objc_opt_new();
    uint64_t v41 = objc_opt_new();
    [v41 setDateFormat:@"yyyy-MM-dd'T'HH:mm:ssZ"];
    id v42 = +[SlalomDecoder getDataAndCheckFeliCaServiceCode:21899 withBlockNumber:0 withTransceiver:v9 withError:a7];
    uint64_t v43 = +[SlalomDecoder getDataAndCheckFeliCaServiceCode:21899 withBlockNumber:1 withTransceiver:v9 withError:a7];
    uint64_t v44 = (void *)v43;
    if (v42 && v43)
    {
      uint64_t v151 = +[MogulDecoder decodeCardID:v42];
      uint64_t v45 = [v151 asHexString];
      [v30 setObject:v45 forKeyedSubscript:@"CardNumber"];

      uint64_t v46 = [NSNumber numberWithUnsignedChar:+[MogulDecoder decodeTopupFlag:](MogulDecoder, "decodeTopupFlag:", v44)];
      [v30 setObject:v46 forKeyedSubscript:@"TopUpFlag"];

      uint64_t v47 = [NSNumber numberWithUnsignedChar:+[MogulDecoder decodeTopupSettings:](MogulDecoder, "decodeTopupSettings:", v44)];
      [v30 setObject:v47 forKeyedSubscript:@"TopUpSettings"];

      unint64_t v48 = [NSNumber numberWithInt:+[MogulDecoder decodeEnableFlag:](MogulDecoder, "decodeEnableFlag:", v44)];
      [v30 setObject:v48 forKeyedSubscript:@"EffectiveFlag"];

      uint64_t v49 = [NSNumber numberWithUnsignedChar:+[MogulDecoder decodeStatusFlag:](MogulDecoder, "decodeStatusFlag:", v44)];
      [v30 setObject:v49 forKeyedSubscript:@"StatusFlag"];

      int v50 = +[SlalomDecoder getDataAndCheckFeliCaServiceCode:21911 withBlockNumber:0 withTransceiver:v9 withError:a7];

      if (v50)
      {
        v51 = [v50 asHexString];
        [v30 setObject:v51 forKeyedSubscript:@"BalanceBlock"];

        +[SlalomDecoder getDataAndCheckFeliCaServiceCode:22027 withBlockNumber:1 withTransceiver:v9 withError:a7];
        v52 = id v42 = v50;

        if (v52)
        {
          uint64_t v53 = [v52 asHexString];
          [v30 setObject:v53 forKeyedSubscript:@"PointBlock"];

          uint64_t v39 = [MEMORY[0x1E4F28D90] dataWithJSONObject:v30 options:1 error:a7];
        }
        else
        {
          uint64_t v153 = v42;
          v122 = ATLLogObject();
          if (os_log_type_enabled(v122, OS_LOG_TYPE_ERROR))
          {
            *(_WORD *)id v197 = 0;
            _os_log_impl(&dword_1CA552000, v122, OS_LOG_TYPE_ERROR, "Failed to decode Mogul SP Opaque Data", v197, 2u);
          }

          uint64_t v123 = [[NSString alloc] initWithFormat:@"Failed to decode Mogul SP Opaque Data"];
          uint64_t v52 = (void *)v123;
          if (a7)
          {
            id v124 = *a7;
            uint64_t v125 = (void *)MEMORY[0x1E4F28C58];
            if (*a7)
            {
              uint64_t v126 = *MEMORY[0x1E4F28A50];
              v181[0] = *MEMORY[0x1E4F28568];
              v181[1] = v126;
              v182[0] = v123;
              v182[1] = v124;
              v127 = (void *)MEMORY[0x1E4F1C9E8];
              v128 = v182;
              uint64_t v129 = v181;
              uint64_t v130 = 2;
            }
            else
            {
              uint64_t v183 = *MEMORY[0x1E4F28568];
              uint64_t v184 = v123;
              v127 = (void *)MEMORY[0x1E4F1C9E8];
              v128 = &v184;
              uint64_t v129 = &v183;
              uint64_t v130 = 1;
            }
            uint64_t v148 = [v127 dictionaryWithObjects:v128 forKeys:v129 count:v130];
            *a7 = [v125 errorWithDomain:@"ATL" code:8 userInfo:v148];
          }
          uint64_t v39 = 0;
          id v42 = v153;
        }
      }
      else
      {
        id v113 = ATLLogObject();
        if (os_log_type_enabled(v113, OS_LOG_TYPE_ERROR))
        {
          *(_WORD *)id v197 = 0;
          _os_log_impl(&dword_1CA552000, v113, OS_LOG_TYPE_ERROR, "Failed to decode Mogul SP Opaque Data", v197, 2u);
        }

        uint64_t v114 = [[NSString alloc] initWithFormat:@"Failed to decode Mogul SP Opaque Data"];
        uint64_t v52 = (void *)v114;
        if (a7)
        {
          id v115 = *a7;
          v116 = (void *)MEMORY[0x1E4F28C58];
          if (*a7)
          {
            uint64_t v117 = *MEMORY[0x1E4F28A50];
            v185[0] = *MEMORY[0x1E4F28568];
            v185[1] = v117;
            v186[0] = v114;
            v186[1] = v115;
            v118 = (void *)MEMORY[0x1E4F1C9E8];
            uint64_t v119 = v186;
            v120 = v185;
            uint64_t v121 = 2;
          }
          else
          {
            uint64_t v187 = *MEMORY[0x1E4F28568];
            uint64_t v188 = v114;
            v118 = (void *)MEMORY[0x1E4F1C9E8];
            uint64_t v119 = &v188;
            v120 = &v187;
            uint64_t v121 = 1;
          }
          uint64_t v147 = [v118 dictionaryWithObjects:v119 forKeys:v120 count:v121];
          *a7 = [v116 errorWithDomain:@"ATL" code:8 userInfo:v147];
        }
        uint64_t v39 = 0;
        id v42 = v44;
      }
    }
    else
    {
      uint64_t v81 = ATLLogObject();
      if (os_log_type_enabled(v81, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)id v197 = 0;
        _os_log_impl(&dword_1CA552000, v81, OS_LOG_TYPE_ERROR, "Failed to decode Mogul SP Opaque Data", v197, 2u);
      }

      uint64_t v82 = [[NSString alloc] initWithFormat:@"Failed to decode Mogul SP Opaque Data"];
      int v83 = (void *)v82;
      if (a7)
      {
        id v84 = *a7;
        uint64_t v152 = (void *)MEMORY[0x1E4F28C58];
        if (*a7)
        {
          uint64_t v85 = *MEMORY[0x1E4F28A50];
          v189[0] = *MEMORY[0x1E4F28568];
          v189[1] = v85;
          v190[0] = v82;
          v190[1] = v84;
          uint64_t v86 = (void *)MEMORY[0x1E4F1C9E8];
          uint64_t v87 = v190;
          uint64_t v88 = v189;
          uint64_t v89 = 2;
        }
        else
        {
          uint64_t v191 = *MEMORY[0x1E4F28568];
          uint64_t v192 = v82;
          uint64_t v86 = (void *)MEMORY[0x1E4F1C9E8];
          uint64_t v87 = &v192;
          uint64_t v88 = &v191;
          uint64_t v89 = 1;
        }
        v131 = [v86 dictionaryWithObjects:v87 forKeys:v88 count:v89];
        *a7 = [v152 errorWithDomain:@"ATL" code:8 userInfo:v131];
      }
      uint64_t v39 = 0;
      uint64_t v52 = v44;
    }

    goto LABEL_110;
  }
  long long v72 = ATLLogObject();
  if (os_log_type_enabled(v72, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)id v197 = 67109120;
    int v198 = v40;
    _os_log_impl(&dword_1CA552000, v72, OS_LOG_TYPE_ERROR, "No Opaque Data for TypeF provider %d", v197, 8u);
  }

  uint64_t v73 = [[NSString alloc] initWithFormat: @"No Opaque Data for TypeF provider %d", v40];
  uint64_t v30 = (void *)v73;
  if (a7)
  {
    id v74 = *a7;
    id v75 = (void *)MEMORY[0x1E4F28C58];
    if (*a7)
    {
      uint64_t v76 = *MEMORY[0x1E4F28A50];
      v157[0] = *MEMORY[0x1E4F28568];
      v157[1] = v76;
      v158[0] = v73;
      v158[1] = v74;
      uint64_t v77 = (void *)MEMORY[0x1E4F1C9E8];
      uint64_t v78 = v158;
      uint64_t v79 = v157;
      uint64_t v80 = 2;
    }
    else
    {
      uint64_t v159 = *MEMORY[0x1E4F28568];
      uint64_t v160 = v73;
      uint64_t v77 = (void *)MEMORY[0x1E4F1C9E8];
      uint64_t v78 = &v160;
      uint64_t v79 = &v159;
      uint64_t v80 = 1;
    }
    uint64_t v41 = [v77 dictionaryWithObjects:v78 forKeys:v79 count:v80];
    id v54 = v75;
    uint64_t v55 = 2;
    goto LABEL_27;
  }
LABEL_40:
  uint64_t v39 = 0;
LABEL_111:

LABEL_112:

  return v39;
}

- (id)getServiceProviderData:(id)a3 withPackage:(id)a4 withModule:(id)a5 withPublicKey:(id)a6 withEncryptionScheme:(id)a7 withTransceiver:(id)a8 withError:(id *)a9
{
  return [(SlalomDecoder *)self getServiceProviderData:a3 withPackage:a4 withModule:a5 withTransceiver:a8 withError:a9];
}

+ (id)getDataAndCheckFeliCaServiceCode:(unsigned __int16)a3 withBlockNumber:(unsigned __int8)a4 withTransceiver:(id)a5 withError:(id *)a6
{
  uint64_t v7 = a4;
  uint64_t v8 = a3;
  uint64_t v36 = *MEMORY[0x1E4F143B8];
  id v9 = a5;
  id v10 = FelicaGetDataFileSystemCommand(v8, v7);
  if (v10)
  {
    id v11 = [v9 transceiveAndCheckSW:v10 error:a6];
    id v12 = v11;
    if (v11)
    {
      id v13 = FeliCaGetBlockDataFromGetDataCommand(v11);
    }
    else
    {
      uint64_t v14 = ATLLogObject();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)long long buf = 67109634;
        int v31 = v8;
        __int16 v32 = 1024;
        int v33 = v7;
        __int16 v34 = 2112;
        uint64_t v35 = 0;
        _os_log_impl(&dword_1CA552000, v14, OS_LOG_TYPE_ERROR, "FeliCa GET DATA for Service Code %d and block %d is invalid: %@", buf, 0x18u);
      }

      uint64_t v15 = [[NSString alloc] initWithFormat:@"FeliCa GET DATA for Service Code %d and block %d is invalid: %@", v8, v7, 0];
      uint64_t v16 = (void *)v15;
      if (a6)
      {
        id v17 = *a6;
        uint64_t v18 = (void *)MEMORY[0x1E4F28C58];
        if (*a6)
        {
          uint64_t v19 = *MEMORY[0x1E4F28A50];
          v26[0] = *MEMORY[0x1E4F28568];
          v26[1] = v19;
          v27[0] = v15;
          v27[1] = v17;
          uint64_t v20 = (void *)MEMORY[0x1E4F1C9E8];
          uint64_t v21 = v27;
          id v22 = v26;
          uint64_t v23 = 2;
        }
        else
        {
          uint64_t v28 = *MEMORY[0x1E4F28568];
          uint64_t v29 = v15;
          uint64_t v20 = (void *)MEMORY[0x1E4F1C9E8];
          uint64_t v21 = &v29;
          id v22 = &v28;
          uint64_t v23 = 1;
        }
        uint64_t v24 = [v20 dictionaryWithObjects:v21 forKeys:v22 count:v23];
        *a6 = [v18 errorWithDomain:@"ATL" code:3 userInfo:v24];
      }
      id v13 = 0;
    }
  }
  else
  {
    id v13 = 0;
  }

  return v13;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_serviceProvider, 0);

  objc_storeStrong((id *)&self->_hciArray, 0);
}

@end