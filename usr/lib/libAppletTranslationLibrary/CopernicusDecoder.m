@interface CopernicusDecoder
+ (BOOL)isAutomotiveAID:(id)a3;
+ (BOOL)isCopernicus:(id)a3;
+ (BOOL)isHomeAID:(id)a3;
+ (BOOL)isHydraAID:(id)a3;
+ (BOOL)supportsStepUp:(id)a3;
+ (id)getInstance;
- (CopernicusDecoder)init;
- (NSMutableDictionary)stepUpData;
- (NSString)endPointIdentifier;
- (id)GetAppletProperties:(id)a3 withPackage:(id)a4 withModule:(id)a5 withTransceiver:(id)a6 withError:(id *)a7;
- (id)_stringFromASCIIBytes:(id *)a3;
- (id)getAppletStateAndHistory:(id)a3 withApplet:(id)a4 withPackage:(id)a5 withModule:(id)a6 withError:(id *)a7;
- (id)handleApplicationSpecific:(id)a3 appletAID:(id)a4 error:(id *)a5;
- (id)handleControlFlow:(id)a3 appletAID:(id)a4 error:(id *)a5;
- (id)handleEventInDummy:(unsigned __int8)a3 eventData:(id)a4 appletAID:(id)a5 error:(id *)a6;
- (id)handleEventInFast:(unsigned __int8)a3 eventData:(id)a4 appletAID:(id)a5 error:(id *)a6;
- (id)handleEventInIdle:(unsigned __int8)a3 eventVersion:(unsigned __int8)a4 eventData:(id)a5 appletAID:(id)a6 error:(id *)a7;
- (id)handleEventInStandard:(unsigned __int8)a3 eventData:(id)a4 appletAID:(id)a5 error:(id *)a6;
- (id)handleFailure:(unsigned __int8)a3 appletAID:(id)a4 error:(id *)a5;
- (id)handleFailureWithImmediateExit:(unsigned __int8)a3 appletAID:(id)a4 error:(id *)a5;
- (id)handleMessageInExchange:(id)a3 appletAID:(id)a4 error:(id *)a5;
- (id)parseHCIEvent:(id)a3 withApplet:(id)a4 withPackage:(id)a5 withModule:(id)a6 withTransceiver:(id)a7 withError:(id *)a8;
- (id)processEndOfTransaction:(id)a3 withApplet:(id)a4 withPackage:(id)a5 withModule:(id)a6 withError:(id *)a7;
- (unsigned)state;
- (unsigned)transactionType;
- (void)cleanup;
- (void)parseHomeSpecificCFParameters:(id *)a3 into:(id)a4;
- (void)setEndPointIdentifier:(id)a3;
- (void)setState:(unsigned __int8)a3;
- (void)setStepUpData:(id)a3;
- (void)setTransactionType:(unsigned int)a3;
@end

@implementation CopernicusDecoder

+ (id)getInstance
{
  if (getInstance_onceToken_0 != -1) {
    dispatch_once(&getInstance_onceToken_0, &__block_literal_global_1);
  }
  v2 = (void *)getInstance_inst_0;

  return v2;
}

uint64_t __32__CopernicusDecoder_getInstance__block_invoke()
{
  getInstance_inst_0 = objc_opt_new();

  return MEMORY[0x1F41817F8]();
}

- (CopernicusDecoder)init
{
  v6.receiver = self;
  v6.super_class = (Class)CopernicusDecoder;
  v2 = [(CopernicusDecoder *)&v6 init];
  v3 = v2;
  if (v2)
  {
    [(CopernicusDecoder *)v2 setEndPointIdentifier:0];
    [(CopernicusDecoder *)v3 setState:0];
    [(CopernicusDecoder *)v3 setTransactionType:0xFFFFFFFFLL];
    v4 = objc_opt_new();
    [(CopernicusDecoder *)v3 setStepUpData:v4];

    +[AppletTranslator registerForCleanup:]((uint64_t)AppletTranslator, v3);
  }
  return v3;
}

- (void)cleanup
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  if ([(CopernicusDecoder *)self state])
  {
    v3 = ATLLogObject();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
    {
      v5[0] = 67109120;
      v5[1] = [(CopernicusDecoder *)self state];
      _os_log_impl(&dword_1CA552000, v3, OS_LOG_TYPE_INFO, "Clearing non-idle Copernicus state %d", (uint8_t *)v5, 8u);
    }

    [(CopernicusDecoder *)self setEndPointIdentifier:0];
    [(CopernicusDecoder *)self setState:0];
    [(CopernicusDecoder *)self setTransactionType:0xFFFFFFFFLL];
    v4 = [(CopernicusDecoder *)self stepUpData];
    [v4 removeAllObjects];
  }
}

- (id)parseHCIEvent:(id)a3 withApplet:(id)a4 withPackage:(id)a5 withModule:(id)a6 withTransceiver:(id)a7 withError:(id *)a8
{
  v72[1] = *MEMORY[0x1E4F143B8];
  id v11 = a3;
  id v12 = a4;
  if ((unint64_t)[v11 length] <= 1)
  {
    v13 = ATLLogObject();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 67109120;
      unsigned int v66 = [v11 length];
      _os_log_impl(&dword_1CA552000, v13, OS_LOG_TYPE_ERROR, "Short eventData? %u", buf, 8u);
    }

    uint64_t v14 = [[NSString alloc] initWithFormat:@"Short eventData? %u", [v11 length]];
    v15 = (void *)v14;
    if (!a8) {
      goto LABEL_26;
    }
    id v16 = *a8;
    v17 = (void *)MEMORY[0x1E4F28C58];
    if (*a8)
    {
      v69[0] = *MEMORY[0x1E4F28568];
      v69[1] = *MEMORY[0x1E4F28A50];
      v70[0] = v14;
      v70[1] = v16;
      v18 = (void *)MEMORY[0x1E4F1C9E8];
      v19 = v70;
      v20 = v69;
      uint64_t v21 = 2;
    }
    else
    {
      uint64_t v71 = *MEMORY[0x1E4F28568];
      v72[0] = v14;
      v18 = (void *)MEMORY[0x1E4F1C9E8];
      v19 = v72;
      v20 = &v71;
      uint64_t v21 = 1;
    }
    v41 = [v18 dictionaryWithObjects:v19 forKeys:v20 count:v21];
    v42 = v17;
    uint64_t v43 = 6;
LABEL_25:
    *a8 = [v42 errorWithDomain:@"ATL" code:v43 userInfo:v41];

LABEL_26:
LABEL_27:
    v44 = 0;
    goto LABEL_28;
  }
  uint64_t v22 = [v11 u8:0];
  uint64_t v23 = [v11 u8:1];
  if ((v23 - 18) <= 0xFDu)
  {
    v24 = ATLLogObject();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 67109376;
      unsigned int v66 = v23;
      __int16 v67 = 1024;
      int v68 = v22;
      _os_log_impl(&dword_1CA552000, v24, OS_LOG_TYPE_ERROR, "Decoder only support version 0x10 and 0x11 of HCI event, got version=0x%02X with eventType=0x%02X", buf, 0xEu);
    }

    uint64_t v25 = [[NSString alloc] initWithFormat:@"Decoder only support version 0x10 and 0x11 of HCI event, got version=0x%02X with eventType=0x%02X", v23, v22];
    v15 = (void *)v25;
    if (!a8) {
      goto LABEL_26;
    }
    id v26 = *a8;
    v27 = (void *)MEMORY[0x1E4F28C58];
    if (*a8)
    {
      uint64_t v28 = *MEMORY[0x1E4F28A50];
      v61[0] = *MEMORY[0x1E4F28568];
      v61[1] = v28;
      v62[0] = v25;
      v62[1] = v26;
      v29 = (void *)MEMORY[0x1E4F1C9E8];
      v30 = v62;
      v31 = v61;
      uint64_t v32 = 2;
    }
    else
    {
      uint64_t v63 = *MEMORY[0x1E4F28568];
      uint64_t v64 = v25;
      v29 = (void *)MEMORY[0x1E4F1C9E8];
      v30 = &v64;
      v31 = &v63;
      uint64_t v32 = 1;
    }
    v41 = [v29 dictionaryWithObjects:v30 forKeys:v31 count:v32];
    v42 = v27;
    uint64_t v43 = 3;
    goto LABEL_25;
  }
  if (v22 == 23 && (unint64_t)[v11 length] >= 4)
  {
    unsigned __int16 v56 = 0;
    v33 = [v11 subdataWithRange:2, 2];
    [v33 getBytes:&v56 length:2];

    v34 = ATLLogObject();
    if (os_log_type_enabled(v34, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 67109120;
      unsigned int v66 = bswap32(v56) >> 16;
      v35 = "Fatal Copernicus Error: 0x%04X";
      v36 = v34;
      os_log_type_t v37 = OS_LOG_TYPE_ERROR;
      uint32_t v38 = 8;
LABEL_42:
      _os_log_impl(&dword_1CA552000, v36, v37, v35, buf, v38);
    }
LABEL_43:

    goto LABEL_27;
  }
  v39 = ATLLogObject();
  if (os_log_type_enabled(v39, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 67109376;
    unsigned int v66 = v22;
    __int16 v67 = 1024;
    int v68 = [(CopernicusDecoder *)self state];
    _os_log_impl(&dword_1CA552000, v39, OS_LOG_TYPE_DEFAULT, "Received event 0x%02X in state %d", buf, 0xEu);
  }

  switch([(CopernicusDecoder *)self state])
  {
    case 0u:
      uint64_t v40 = [(CopernicusDecoder *)self handleEventInIdle:v22 eventVersion:v23 eventData:v11 appletAID:v12 error:a8];
      break;
    case 1u:
      uint64_t v40 = [(CopernicusDecoder *)self handleEventInStandard:v22 eventData:v11 appletAID:v12 error:a8];
      break;
    case 2u:
      uint64_t v40 = [(CopernicusDecoder *)self handleEventInFast:v22 eventData:v11 appletAID:v12 error:a8];
      break;
    case 3u:
    case 4u:
      uint64_t v40 = [(CopernicusDecoder *)self handleEventInDummy:v22 eventData:v11 appletAID:v12 error:a8];
      break;
    case 5u:
      v34 = ATLLogObject();
      if (!os_log_type_enabled(v34, OS_LOG_TYPE_DEFAULT)) {
        goto LABEL_43;
      }
      *(_WORD *)buf = 0;
      v35 = "Transaction already ended . . .";
      v36 = v34;
      os_log_type_t v37 = OS_LOG_TYPE_DEFAULT;
      uint32_t v38 = 2;
      goto LABEL_42;
    default:
      v46 = ATLLogObject();
      if (os_log_type_enabled(v46, OS_LOG_TYPE_ERROR))
      {
        unsigned int v47 = [(CopernicusDecoder *)self state];
        *(_DWORD *)buf = 67109120;
        unsigned int v66 = v47;
        _os_log_impl(&dword_1CA552000, v46, OS_LOG_TYPE_ERROR, "Invalid state %d", buf, 8u);
      }

      uint64_t v48 = [[NSString alloc] initWithFormat:@"Invalid state %d", -[CopernicusDecoder state](self, "state")];
      v15 = (void *)v48;
      if (!a8) {
        goto LABEL_26;
      }
      id v49 = *a8;
      v50 = (void *)MEMORY[0x1E4F28C58];
      if (*a8)
      {
        uint64_t v51 = *MEMORY[0x1E4F28A50];
        v57[0] = *MEMORY[0x1E4F28568];
        v57[1] = v51;
        v58[0] = v48;
        v58[1] = v49;
        v52 = (void *)MEMORY[0x1E4F1C9E8];
        v53 = v58;
        v54 = v57;
        uint64_t v55 = 2;
      }
      else
      {
        uint64_t v59 = *MEMORY[0x1E4F28568];
        uint64_t v60 = v48;
        v52 = (void *)MEMORY[0x1E4F1C9E8];
        v53 = &v60;
        v54 = &v59;
        uint64_t v55 = 1;
      }
      v41 = [v52 dictionaryWithObjects:v53 forKeys:v54 count:v55];
      v42 = v50;
      uint64_t v43 = 8;
      goto LABEL_25;
  }
  v44 = (void *)v40;
LABEL_28:

  return v44;
}

- (id)handleEventInIdle:(unsigned __int8)a3 eventVersion:(unsigned __int8)a4 eventData:(id)a5 appletAID:(id)a6 error:(id *)a7
{
  uint64_t v9 = a4;
  uint64_t v10 = a3;
  uint64_t v78 = *MEMORY[0x1E4F143B8];
  id v12 = a5;
  id v13 = a6;
  uint64_t v14 = 0;
  switch((int)v10)
  {
    case 1:
    case 2:
    case 8:
    case 9:
    case 10:
    case 11:
    case 13:
    case 15:
      goto LABEL_62;
    case 3:
    case 4:
      if (v10 == 4) {
        uint64_t v24 = 3;
      }
      else {
        uint64_t v24 = 4;
      }
      [(CopernicusDecoder *)self setState:v24];
      if (v9 != 17)
      {
        if (v9 == 16)
        {
          if ([v12 length] == 31)
          {
            uint64_t v25 = [v12 bytes] + 2;
            id v26 = (void *)MEMORY[0x1E4F1C9B8];
LABEL_35:
            v45 = [v26 dataWithBytes:v25 length:20];
            v46 = [v45 asHexString];
            [(CopernicusDecoder *)self setEndPointIdentifier:v46];

            goto LABEL_61;
          }
          v17 = ATLLogObject();
          if (!os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT)) {
            goto LABEL_60;
          }
LABEL_55:
          unsigned int v47 = [v12 asHexString];
          *(_DWORD *)buf = 138412290;
          *(void *)v75 = v47;
          uint64_t v48 = "No endpoint to retrieve: %@";
          id v49 = v17;
          uint32_t v50 = 12;
          goto LABEL_56;
        }
        v17 = ATLLogObject();
        if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
        {
          unsigned int v47 = [v12 asHexString];
          *(_DWORD *)buf = 67109378;
          *(_DWORD *)v75 = v9;
          *(_WORD *)&v75[4] = 2112;
          *(void *)&v75[6] = v47;
          uint64_t v48 = "Unexpected event version %d for event %@";
          id v49 = v17;
          uint32_t v50 = 18;
LABEL_56:
          _os_log_impl(&dword_1CA552000, v49, OS_LOG_TYPE_DEFAULT, v48, buf, v50);
        }
LABEL_60:

        goto LABEL_61;
      }
      if ([v12 length] != 32)
      {
        if ([v12 length] == 40)
        {
          uint64_t v56 = [v12 bytes];
          v57 = ATLLogObject();
          if (os_log_type_enabled(v57, OS_LOG_TYPE_DEFAULT))
          {
            int v58 = *(unsigned __int8 *)(v56 + 39);
            *(_DWORD *)buf = 67109120;
            *(_DWORD *)v75 = v58;
            _os_log_impl(&dword_1CA552000, v57, OS_LOG_TYPE_DEFAULT, "Reason for endpoint not found: %d", buf, 8u);
          }

          if (*(unsigned char *)(v56 + 39) != 4)
          {
            uint64_t v59 = [MEMORY[0x1E4F1C9B8] dataWithBytes:v56 + 2 length:20];
            uint64_t v60 = [v59 asHexString];
            [(CopernicusDecoder *)self setEndPointIdentifier:v60];
          }
          v17 = ATLLogObject();
          if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
          {
            int v61 = *(unsigned __int8 *)(v56 + 39);
            *(_DWORD *)buf = 67109120;
            *(_DWORD *)v75 = v61;
            os_log_type_t v37 = "Reason for endpoint not found: %d";
LABEL_24:
            _os_log_impl(&dword_1CA552000, v17, OS_LOG_TYPE_DEFAULT, v37, buf, 8u);
          }
          goto LABEL_60;
        }
        v17 = ATLLogObject();
        if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT)) {
          goto LABEL_55;
        }
        goto LABEL_60;
      }
      uint64_t v42 = [v12 bytes];
      uint64_t v43 = ATLLogObject();
      if (os_log_type_enabled(v43, OS_LOG_TYPE_DEFAULT))
      {
        int v44 = *(unsigned __int8 *)(v42 + 31);
        *(_DWORD *)buf = 67109120;
        *(_DWORD *)v75 = v44;
        _os_log_impl(&dword_1CA552000, v43, OS_LOG_TYPE_DEFAULT, "Reason for endpoint not found: %d", buf, 8u);
      }

      if (*(unsigned char *)(v42 + 31) != 4)
      {
        id v26 = (void *)MEMORY[0x1E4F1C9B8];
        uint64_t v25 = v42 + 2;
        goto LABEL_35;
      }
LABEL_61:
      uint64_t v14 = 0;
LABEL_62:

      return v14;
    case 5:
    case 6:
    case 7:
      if ((unint64_t)[v12 length] > 0x17)
      {
        uint64_t v27 = [v12 bytes];
        unsigned int v28 = bswap32(*(unsigned __int16 *)(v27 + 22));
        uint64_t v29 = HIWORD(v28);
        v30 = [MEMORY[0x1E4F1C9B8] dataWithBytes:v27 + 2 length:20];
        v31 = [v30 asHexString];
        [(CopernicusDecoder *)self setEndPointIdentifier:v31];

        if (v10 == 6) {
          uint64_t v32 = 2;
        }
        else {
          uint64_t v32 = 1;
        }
        [(CopernicusDecoder *)self setState:v32];
        [(CopernicusDecoder *)self setTransactionType:BYTE2(v28)];
        v33 = &unk_1F24E1BD0;
        if (!+[CopernicusDecoder isHomeAID:v13]
          && !+[CopernicusDecoder isHydraAID:v13])
        {
          v33 = &unk_1F24E1BE8;
        }
        v68[0] = @"EventType";
        v68[1] = @"appletIdentifier";
        v69[0] = @"StartEvent";
        v69[1] = v13;
        void v69[2] = &unk_1F24E1C00;
        v68[2] = @"selectStatus";
        v68[3] = @"command";
        v34 = [NSNumber numberWithUnsignedShort:v29];
        v69[3] = v34;
        v68[4] = @"endPointIdentifier";
        v35 = [(CopernicusDecoder *)self endPointIdentifier];
        v69[4] = v35;
        v68[5] = @"BackgroundTransaction";
        v36 = [NSNumber numberWithInt:-[CopernicusDecoder transactionType](self, "transactionType") == 5];
        v69[5] = v36;
        v69[6] = MEMORY[0x1E4F1CC38];
        v68[6] = @"IgnoreRFEvents";
        v68[7] = @"DontWaitForEOT";
        v69[7] = MEMORY[0x1E4F1CC38];
        v69[8] = MEMORY[0x1E4F1CC28];
        v68[8] = @"RequiresPowerCycle";
        v68[9] = @"DelayExpressReentry";
        v69[9] = v33;
        uint64_t v14 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v69 forKeys:v68 count:10];

        goto LABEL_62;
      }
      v15 = ATLLogObject();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 67109888;
        *(_DWORD *)v75 = v10;
        *(_WORD *)&v75[4] = 1024;
        *(_DWORD *)&v75[6] = v9;
        *(_WORD *)&v75[10] = 2048;
        *(void *)&v75[12] = 24;
        __int16 v76 = 1024;
        int v77 = [v12 length];
        _os_log_impl(&dword_1CA552000, v15, OS_LOG_TYPE_ERROR, "Event type %d with version 0x%x expected length at least 0x%lx, got 0x%x", buf, 0x1Eu);
      }

      uint64_t v16 = [[NSString alloc] initWithFormat:@"Event type %d with version 0x%x expected length at least 0x%lx, got 0x%x", v10, v9, 24, [v12 length]];
      v17 = v16;
      if (!a7) {
        goto LABEL_60;
      }
      id v18 = *a7;
      v19 = (void *)MEMORY[0x1E4F28C58];
      if (*a7)
      {
        uint64_t v20 = *MEMORY[0x1E4F28A50];
        v70[0] = *MEMORY[0x1E4F28568];
        v70[1] = v20;
        v71[0] = v16;
        v71[1] = v18;
        uint64_t v21 = (void *)MEMORY[0x1E4F1C9E8];
        uint64_t v22 = v71;
        uint64_t v23 = v70;
        goto LABEL_43;
      }
      uint64_t v72 = *MEMORY[0x1E4F28568];
      uint64_t v73 = v16;
      uint64_t v21 = (void *)MEMORY[0x1E4F1C9E8];
      uint64_t v22 = &v73;
      uint64_t v23 = &v72;
      goto LABEL_58;
    case 14:
      if ([v12 length] == 23)
      {
        uint64_t v38 = [v12 bytes];
        v39 = [MEMORY[0x1E4F1C9B8] dataWithBytes:v38 + 2 length:20];
        uint64_t v40 = [v39 asHexString];
        [(CopernicusDecoder *)self setEndPointIdentifier:v40];

        if (*(unsigned char *)(v38 + 22)) {
          uint64_t v41 = 3;
        }
        else {
          uint64_t v41 = 4;
        }
        [(CopernicusDecoder *)self setState:v41];
        goto LABEL_61;
      }
      uint64_t v51 = ATLLogObject();
      if (os_log_type_enabled(v51, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 134218240;
        *(void *)v75 = 23;
        *(_WORD *)&v75[8] = 1024;
        *(_DWORD *)&v75[10] = [v12 length];
        _os_log_impl(&dword_1CA552000, v51, OS_LOG_TYPE_ERROR, "Event type 0x0E expected length 0x%lx got 0x%x", buf, 0x12u);
      }

      uint64_t v52 = [[NSString alloc] initWithFormat:@"Event type 0x0E expected length 0x%lx got 0x%x", 23, [v12 length]];
      v17 = v52;
      if (a7)
      {
        id v53 = *a7;
        v19 = (void *)MEMORY[0x1E4F28C58];
        if (*a7)
        {
          uint64_t v54 = *MEMORY[0x1E4F28A50];
          v64[0] = *MEMORY[0x1E4F28568];
          v64[1] = v54;
          v65[0] = v52;
          v65[1] = v53;
          uint64_t v21 = (void *)MEMORY[0x1E4F1C9E8];
          uint64_t v22 = v65;
          uint64_t v23 = v64;
LABEL_43:
          uint64_t v55 = 2;
        }
        else
        {
          uint64_t v66 = *MEMORY[0x1E4F28568];
          uint64_t v67 = v52;
          uint64_t v21 = (void *)MEMORY[0x1E4F1C9E8];
          uint64_t v22 = &v67;
          uint64_t v23 = &v66;
LABEL_58:
          uint64_t v55 = 1;
        }
        v62 = [v21 dictionaryWithObjects:v22 forKeys:v23 count:v55];
        *a7 = [v19 errorWithDomain:@"ATL" code:3 userInfo:v62];
      }
      goto LABEL_60;
    default:
      v17 = ATLLogObject();
      if (!os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT)) {
        goto LABEL_60;
      }
      *(_DWORD *)buf = 67109120;
      *(_DWORD *)v75 = v10;
      os_log_type_t v37 = "Unknown event type 0x%02X, ignoring";
      goto LABEL_24;
  }
}

- (id)handleEventInStandard:(unsigned __int8)a3 eventData:(id)a4 appletAID:(id)a5 error:(id *)a6
{
  int v8 = a3;
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v10 = a4;
  id v11 = a5;
  id v12 = 0;
  switch(v8)
  {
    case 1:
    case 3:
    case 4:
    case 5:
    case 6:
    case 7:
    case 9:
    case 14:
    case 15:
      break;
    case 2:
      uint64_t v13 = [(CopernicusDecoder *)self handleControlFlow:v10 appletAID:v11 error:a6];
      goto LABEL_10;
    case 8:
      uint64_t v13 = [(CopernicusDecoder *)self handleFailureWithImmediateExit:8 appletAID:v11 error:a6];
      goto LABEL_10;
    case 10:
      uint64_t v13 = [(CopernicusDecoder *)self handleApplicationSpecific:v10 appletAID:v11 error:a6];
      goto LABEL_10;
    case 11:
      uint64_t v13 = [(CopernicusDecoder *)self handleFailure:11 appletAID:v11 error:a6];
      goto LABEL_10;
    case 13:
      uint64_t v13 = [(CopernicusDecoder *)self handleMessageInExchange:v10 appletAID:v11 error:a6];
LABEL_10:
      id v12 = (void *)v13;
      break;
    default:
      uint64_t v14 = ATLLogObject();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
      {
        v16[0] = 67109120;
        v16[1] = v8;
        _os_log_impl(&dword_1CA552000, v14, OS_LOG_TYPE_DEFAULT, "Unknown event type 0x%02X, ignoring", (uint8_t *)v16, 8u);
      }

      id v12 = 0;
      break;
  }

  return v12;
}

- (id)handleEventInFast:(unsigned __int8)a3 eventData:(id)a4 appletAID:(id)a5 error:(id *)a6
{
  int v8 = a3;
  v20[9] = *MEMORY[0x1E4F143B8];
  id v10 = a4;
  id v11 = a5;
  id v12 = 0;
  switch(v8)
  {
    case 1:
    case 3:
    case 4:
    case 5:
    case 6:
    case 7:
    case 9:
    case 10:
    case 13:
    case 14:
      goto LABEL_2;
    case 2:
      uint64_t v14 = [(CopernicusDecoder *)self handleControlFlow:v10 appletAID:v11 error:a6];
      goto LABEL_14;
    case 8:
      uint64_t v14 = [(CopernicusDecoder *)self handleFailureWithImmediateExit:8 appletAID:v11 error:a6];
      goto LABEL_14;
    case 11:
      if (+[CopernicusDecoder isAutomotiveAID:v11])
      {
        v15 = [(CopernicusDecoder *)self endPointIdentifier];
        [(CopernicusDecoder *)self setState:5];
        v19[0] = @"EventType";
        v19[1] = @"appletIdentifier";
        v20[0] = @"EndEvent";
        v20[1] = v11;
        v19[2] = @"didError";
        v19[3] = @"command";
        v20[2] = &unk_1F24E1BE8;
        v20[3] = &unk_1F24E1C18;
        v19[4] = @"endPointIdentifier";
        v19[5] = @"informative";
        v20[4] = v15;
        v20[5] = &unk_1F24E1BE8;
        v19[6] = @"BackgroundTransaction";
        uint64_t v16 = [[NSNumber numberWithInt:-[CopernicusDecoder transactionType](self, "transactionType") == 5];
        v20[6] = v16;
        v20[7] = &unk_1F24E1C30;
        v19[7] = @"ptaTransactionMode";
        v19[8] = @"result";
        v20[8] = &unk_1F24E1C48;
        id v12 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v20 forKeys:v19 count:9];
      }
      else
      {
        uint64_t v14 = [(CopernicusDecoder *)self handleFailure:11 appletAID:v11 error:a6];
LABEL_14:
        id v12 = (void *)v14;
      }
LABEL_2:

      return v12;
    case 15:
      id v12 = 0;
      self->_state = 1;
      goto LABEL_2;
    default:
      uint64_t v17 = ATLLogObject();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
      {
        v18[0] = 67109120;
        v18[1] = v8;
        _os_log_impl(&dword_1CA552000, v17, OS_LOG_TYPE_DEFAULT, "Unknown event type 0x%02X, ignoring", (uint8_t *)v18, 8u);
      }

      id v12 = 0;
      goto LABEL_2;
  }
}

- (id)handleEventInDummy:(unsigned __int8)a3 eventData:(id)a4 appletAID:(id)a5 error:(id *)a6
{
  uint64_t v8 = a3;
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v10 = a4;
  id v11 = a5;
  if (v8 > 0xF) {
    goto LABEL_9;
  }
  if (((1 << v8) & 0xE6FE) != 0)
  {
LABEL_3:
    id v12 = 0;
    goto LABEL_4;
  }
  if (((1 << v8) & 0x900) == 0)
  {
LABEL_9:
    uint64_t v14 = ATLLogObject();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      v15[0] = 67109120;
      v15[1] = v8;
      _os_log_impl(&dword_1CA552000, v14, OS_LOG_TYPE_DEFAULT, "Unknown event type 0x%02X, ignoring", (uint8_t *)v15, 8u);
    }

    goto LABEL_3;
  }
  id v12 = [(CopernicusDecoder *)self handleFailureWithImmediateExit:v8 appletAID:v11 error:a6];
LABEL_4:

  return v12;
}

- (id)handleControlFlow:(id)a3 appletAID:(id)a4 error:(id *)a5
{
  uint64_t v56 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  if ((unint64_t)[v8 length] <= 3)
  {
    id v10 = ATLLogObject();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 134218240;
      *(void *)&uint8_t buf[4] = 4;
      *(_WORD *)&buf[12] = 1024;
      *(_DWORD *)&buf[14] = [v8 length];
      _os_log_impl(&dword_1CA552000, v10, OS_LOG_TYPE_ERROR, "Event type 0x02 expected length 0x%lx got 0x%x", buf, 0x12u);
    }

    uint64_t v11 = [[NSString alloc] initWithFormat: @"Event type 0x02 expected length 0x%lx got 0x%x", 4, [v8 length]];
    id v12 = v11;
    if (!a5) {
      goto LABEL_31;
    }
    id v13 = *a5;
    uint64_t v14 = (void *)MEMORY[0x1E4F28C58];
    if (*a5)
    {
      uint64_t v15 = *MEMORY[0x1E4F28A50];
      v51[0] = *MEMORY[0x1E4F28568];
      v51[1] = v15;
      v52[0] = v11;
      v52[1] = v13;
      uint64_t v16 = (void *)MEMORY[0x1E4F1C9E8];
      uint64_t v17 = v52;
      id v18 = v51;
LABEL_17:
      uint64_t v27 = 2;
LABEL_30:
      v39 = [v16 dictionaryWithObjects:v17 forKeys:v18 count:v27];
      *a5 = [v14 errorWithDomain:@"ATL" code:3 userInfo:v39];

LABEL_31:
      os_log_type_t v37 = 0;
      goto LABEL_32;
    }
    uint64_t v53 = *MEMORY[0x1E4F28568];
    uint64_t v54 = v11;
    uint64_t v16 = (void *)MEMORY[0x1E4F1C9E8];
    uint64_t v17 = &v54;
    id v18 = &v53;
    goto LABEL_29;
  }
  v19 = [(CopernicusDecoder *)self endPointIdentifier];

  if (!v19)
  {
    uint64_t v23 = ATLLogObject();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1CA552000, v23, OS_LOG_TYPE_ERROR, "Control flow with no endPointIdentifier?!", buf, 2u);
    }

    uint64_t v24 = [[NSString alloc] initWithFormat:@"Control flow with no endPointIdentifier?!"];
    id v12 = v24;
    if (!a5) {
      goto LABEL_31;
    }
    id v25 = *a5;
    uint64_t v14 = (void *)MEMORY[0x1E4F28C58];
    if (*a5)
    {
      uint64_t v26 = *MEMORY[0x1E4F28A50];
      v47[0] = *MEMORY[0x1E4F28568];
      v47[1] = v26;
      v48[0] = v24;
      v48[1] = v25;
      uint64_t v16 = (void *)MEMORY[0x1E4F1C9E8];
      uint64_t v17 = v48;
      id v18 = v47;
      goto LABEL_17;
    }
    uint64_t v49 = *MEMORY[0x1E4F28568];
    uint64_t v50 = v24;
    uint64_t v16 = (void *)MEMORY[0x1E4F1C9E8];
    uint64_t v17 = &v50;
    id v18 = &v49;
LABEL_29:
    uint64_t v27 = 1;
    goto LABEL_30;
  }
  id v20 = v8;
  uint64_t v21 = [v20 bytes];
  unsigned int v22 = *(unsigned __int8 *)(v21 + 2);
  if (v22 >= 2)
  {
    id v12 = ATLLogObject();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      int v28 = *(unsigned __int8 *)(v21 + 2);
      *(_DWORD *)buf = 67109120;
      *(_DWORD *)&uint8_t buf[4] = v28;
      _os_log_impl(&dword_1CA552000, v12, OS_LOG_TYPE_DEFAULT, "Ignoring CF with P1 0x%X", buf, 8u);
    }
    goto LABEL_31;
  }
  uint64_t v41 = v20;
  BOOL v42 = *(unsigned char *)(v21 + 2)
     && [(CopernicusDecoder *)self state] == 1
     && +[CopernicusDecoder isAutomotiveAID:v9];
  id v12 = [(CopernicusDecoder *)self endPointIdentifier];
  int v29 = [(CopernicusDecoder *)self state];
  [(CopernicusDecoder *)self setState:5];
  v45[0] = @"EventType";
  v45[1] = @"appletIdentifier";
  v46[0] = @"EndEvent";
  v46[1] = v9;
  v45[2] = @"didError";
  uint64_t v43 = [NSNumber numberWithBool:v22 == 0];
  v46[2] = v43;
  v46[3] = &unk_1F24E1C60;
  v45[3] = @"command";
  v45[4] = @"endPointIdentifier";
  v46[4] = v12;
  v45[5] = @"informative";
  v30 = [NSNumber numberWithInt:__rev16(*(unsigned __int16 *)(v21 + 2))];
  v46[5] = v30;
  v45[6] = @"BackgroundTransaction";
  id v44 = v9;
  v31 = [NSNumber numberWithInt:-[CopernicusDecoder transactionType](self, "transactionType") == 5];
  v46[6] = v31;
  v45[7] = @"result";
  uint64_t v32 = [NSNumber numberWithUnsignedShort:(v22 != 0) << 6];
  v46[7] = v32;
  v45[8] = @"ptaTransactionMode";
  if (v29 == 2) {
    uint64_t v33 = 1;
  }
  else {
    uint64_t v33 = 2;
  }
  v34 = [NSNumber numberWithUnsignedChar:v33];
  v46[8] = v34;
  v46[9] = MEMORY[0x1E4F1CC28];
  v45[9] = @"DontWaitForEOT";
  v45[10] = @"ForceExpressExit";
  v35 = [NSNumber numberWithBool:v42];
  v46[10] = v35;
  v36 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v46 forKeys:v45 count:11];
  os_log_type_t v37 = (void *)[v36 mutableCopy];

  id v9 = v44;
  if (+[CopernicusDecoder isHomeAID:v44]
    && (unint64_t)[v41 length] >= 5)
  {
    id v38 = v41;
    *(void *)buf = [v38 bytes] + 4;
    *(void *)&buf[8] = [v38 length] - 4;
    [(CopernicusDecoder *)self parseHomeSpecificCFParameters:buf into:v37];
  }
LABEL_32:

  return v37;
}

- (id)handleFailureWithImmediateExit:(unsigned __int8)a3 appletAID:(id)a4 error:(id *)a5
{
  uint64_t v5 = a3;
  id v7 = a4;
  if (self->_state - 3 > 1)
  {
    unsigned __int16 v9 = 0;
  }
  else
  {
    id v8 = [(CopernicusDecoder *)self endPointIdentifier];
    if (v8) {
      unsigned __int16 v9 = -4091;
    }
    else {
      unsigned __int16 v9 = -4089;
    }
  }
  unsigned __int8 v10 = 1;
  if ([(CopernicusDecoder *)self state] != 3)
  {
    if ([(CopernicusDecoder *)self state] == 2) {
      unsigned __int8 v10 = 1;
    }
    else {
      unsigned __int8 v10 = 2;
    }
  }
  uint64_t v11 = (void *)MEMORY[0x1E4F1CA60];
  id v12 = [NSNumber numberWithUnsignedChar:v5];
  id v13 = [NSNumber numberWithUnsignedShort:v9];
  uint64_t v14 = [NSNumber numberWithInt:-[CopernicusDecoder transactionType](self, "transactionType") == 5];
  uint64_t v15 = [NSNumber numberWithUnsignedChar:v10];
  uint64_t v16 = [v11 dictionaryWithObjectsAndKeys:@"EndEvent", @"EventType", &unk_1F24E1C30, @"ForceExpressExit", v7, @"appletIdentifier", &unk_1F24E1C30, @"didError", v12, @"command", v13, @"result", v14, @"BackgroundTransaction", v15, @"ptaTransactionMode", 0];

  uint64_t v17 = [(CopernicusDecoder *)self endPointIdentifier];

  if (v17)
  {
    id v18 = [(CopernicusDecoder *)self endPointIdentifier];
    [v16 setObject:v18 forKeyedSubscript:@"endPointIdentifier"];
  }
  if (v5 == 11) {
    [v16 setObject:MEMORY[0x1E4F1CC38] forKeyedSubscript:@"DontWaitForEOT"];
  }
  [(CopernicusDecoder *)self setState:5];

  return v16;
}

- (id)handleFailure:(unsigned __int8)a3 appletAID:(id)a4 error:(id *)a5
{
  uint64_t v6 = a3;
  uint64_t v36 = *MEMORY[0x1E4F143B8];
  id v8 = a4;
  unsigned __int16 v9 = [(CopernicusDecoder *)self endPointIdentifier];

  if (v9)
  {
    if (v6 == 11) {
      unsigned __int16 v10 = -4096;
    }
    else {
      unsigned __int16 v10 = -1;
    }
    unsigned __int8 v11 = 1;
    if ([(CopernicusDecoder *)self state] != 3)
    {
      if ([(CopernicusDecoder *)self state] == 2) {
        unsigned __int8 v11 = 1;
      }
      else {
        unsigned __int8 v11 = 2;
      }
    }
    [(CopernicusDecoder *)self setState:5];
    v28[0] = @"EventType";
    v28[1] = @"appletIdentifier";
    v29[0] = @"EndEvent";
    v29[1] = v8;
    v29[2] = &unk_1F24E1C30;
    v28[2] = @"didError";
    v28[3] = @"command";
    id v12 = [NSNumber numberWithUnsignedChar:v6];
    v29[3] = v12;
    v28[4] = @"endPointIdentifier";
    id v13 = [(CopernicusDecoder *)self endPointIdentifier];
    v29[4] = v13;
    v29[5] = &unk_1F24E1BE8;
    v28[5] = @"informative";
    v28[6] = @"BackgroundTransaction";
    uint64_t v14 = [[NSNumber numberWithInt:-[CopernicusDecoder transactionType](self, "transactionType") == 5];
    v29[6] = v14;
    v28[7] = @"ptaTransactionMode";
    uint64_t v15 = [NSNumber numberWithUnsignedChar:v11];
    v29[7] = v15;
    v28[8] = @"result";
    uint64_t v16 = [NSNumber numberWithUnsignedShort:v10];
    v29[8] = v16;
    uint64_t v17 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v29 forKeys:v28 count:9];
  }
  else
  {
    id v18 = ATLLogObject();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 67109120;
      int v35 = v6;
      _os_log_impl(&dword_1CA552000, v18, OS_LOG_TYPE_ERROR, "Failure %d with no endpoint identifier?", buf, 8u);
    }

    uint64_t v19 = [[NSString alloc] initWithFormat:@"Failure %d with no endpoint identifier?", v6];
    id v12 = (void *)v19;
    if (!a5)
    {
      uint64_t v17 = 0;
      goto LABEL_19;
    }
    id v20 = *a5;
    uint64_t v21 = (void *)MEMORY[0x1E4F28C58];
    if (*a5)
    {
      uint64_t v22 = *MEMORY[0x1E4F28A50];
      v30[0] = *MEMORY[0x1E4F28568];
      v30[1] = v22;
      v31[0] = v19;
      v31[1] = v20;
      uint64_t v23 = (void *)MEMORY[0x1E4F1C9E8];
      uint64_t v24 = v31;
      id v25 = v30;
      uint64_t v26 = 2;
    }
    else
    {
      uint64_t v32 = *MEMORY[0x1E4F28568];
      uint64_t v33 = v19;
      uint64_t v23 = (void *)MEMORY[0x1E4F1C9E8];
      uint64_t v24 = &v33;
      id v25 = &v32;
      uint64_t v26 = 1;
    }
    id v13 = [v23 dictionaryWithObjects:v24 forKeys:v25 count:v26];
    [v21 errorWithDomain:@"ATL" code:3 userInfo:v13];
    uint64_t v17 = 0;
    *a5 = (id)objc_claimAutoreleasedReturnValue();
  }

LABEL_19:

  return v17;
}

- (id)handleApplicationSpecific:(id)a3 appletAID:(id)a4 error:(id *)a5
{
  v49[1] = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  unsigned __int16 v10 = [(CopernicusDecoder *)self endPointIdentifier];

  if (!v10)
  {
    id v20 = ATLLogObject();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1CA552000, v20, OS_LOG_TYPE_ERROR, "Application Specific with no endpoint identifier?", buf, 2u);
    }

    uint64_t v21 = [[NSString alloc] initWithFormat:@"Application Specific with no endpoint identifier?"];
    id v13 = (void *)v21;
    if (!a5) {
      goto LABEL_27;
    }
    id v22 = *a5;
    uint64_t v15 = (void *)MEMORY[0x1E4F28C58];
    if (*a5)
    {
      uint64_t v23 = *MEMORY[0x1E4F28A50];
      v46[0] = *MEMORY[0x1E4F28568];
      v46[1] = v23;
      v47[0] = v21;
      v47[1] = v22;
      uint64_t v17 = (void *)MEMORY[0x1E4F1C9E8];
      id v18 = v47;
      uint64_t v19 = v46;
      goto LABEL_13;
    }
    uint64_t v48 = *MEMORY[0x1E4F28568];
    v49[0] = v21;
    uint64_t v17 = (void *)MEMORY[0x1E4F1C9E8];
    id v18 = v49;
    uint64_t v19 = &v48;
LABEL_25:
    uint64_t v24 = 1;
    goto LABEL_26;
  }
  if ((unint64_t)[v8 length] <= 3)
  {
    unsigned __int8 v11 = ATLLogObject();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 67109120;
      *(_DWORD *)&uint8_t buf[4] = [v8 length];
      _os_log_impl(&dword_1CA552000, v11, OS_LOG_TYPE_ERROR, "Event Application Specific too small %u", buf, 8u);
    }

    uint64_t v12 = [[NSString alloc] initWithFormat:@"Event Application Specific too small %u", [v8 length]];
    id v13 = (void *)v12;
    if (!a5) {
      goto LABEL_27;
    }
    id v14 = *a5;
    uint64_t v15 = (void *)MEMORY[0x1E4F28C58];
    if (*a5)
    {
      uint64_t v16 = *MEMORY[0x1E4F28A50];
      v42[0] = *MEMORY[0x1E4F28568];
      v42[1] = v16;
      v43[0] = v12;
      v43[1] = v14;
      uint64_t v17 = (void *)MEMORY[0x1E4F1C9E8];
      id v18 = v43;
      uint64_t v19 = v42;
LABEL_13:
      uint64_t v24 = 2;
LABEL_26:
      int v35 = [v17 dictionaryWithObjects:v18 forKeys:v19 count:v24];
      *a5 = [v15 errorWithDomain:@"ATL" code:3 userInfo:v35];

LABEL_27:
LABEL_28:
      v30 = 0;
      goto LABEL_29;
    }
    uint64_t v44 = *MEMORY[0x1E4F28568];
    uint64_t v45 = v12;
    uint64_t v17 = (void *)MEMORY[0x1E4F1C9E8];
    id v18 = &v45;
    uint64_t v19 = &v44;
    goto LABEL_25;
  }
  id v25 = v8;
  uint64_t v26 = [v25 bytes];
  if (!+[CopernicusDecoder supportsStepUp:v9]
    || *(unsigned char *)(v26 + 2) != 64
    || *(unsigned __int8 *)(v26 + 3) != 160)
  {
    uint64_t v32 = ATLLogObject();
    if (os_log_type_enabled(v32, OS_LOG_TYPE_DEFAULT))
    {
      int v33 = *(unsigned __int8 *)(v26 + 2);
      int v34 = *(unsigned __int8 *)(v26 + 3);
      *(_DWORD *)buf = 138412802;
      *(void *)&uint8_t buf[4] = v9;
      *(_WORD *)&buf[12] = 1024;
      *(_DWORD *)&buf[14] = v33;
      __int16 v38 = 1024;
      int v39 = v34;
      _os_log_impl(&dword_1CA552000, v32, OS_LOG_TYPE_DEFAULT, "Not interested in Application Specific for AID %@ P1 0x%X P2 0x%X", buf, 0x18u);
    }

    goto LABEL_28;
  }
  [(CopernicusDecoder *)self setState:5];
  v40[0] = @"EventType";
  v40[1] = @"StepUpReaderData";
  stepUpData = self->_stepUpData;
  v41[0] = @"StepUpRequested";
  v41[1] = stepUpData;
  v41[2] = v9;
  v40[2] = @"appletIdentifier";
  v40[3] = @"endPointIdentifier";
  int v28 = [(CopernicusDecoder *)self endPointIdentifier];
  v41[3] = v28;
  int v29 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v41 forKeys:v40 count:4];
  v30 = (void *)[v29 mutableCopy];

  if (+[CopernicusDecoder isHomeAID:v9]
    && (unint64_t)[v25 length] >= 5)
  {
    id v31 = v25;
    *(void *)buf = [v31 bytes] + 4;
    *(void *)&buf[8] = [v31 length] - 4;
    [(CopernicusDecoder *)self parseHomeSpecificCFParameters:buf into:v30];
  }
LABEL_29:

  return v30;
}

- (id)handleMessageInExchange:(id)a3 appletAID:(id)a4 error:(id *)a5
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  if (+[CopernicusDecoder supportsStepUp:a4]
    && (unint64_t)[v7 length] >= 3)
  {
    id v8 = (unsigned __int8 *)([v7 length] - 3);
    id v9 = v7;
    v16[0] = (unsigned __int8 *)([v9 bytes] + 2);
    v16[1] = v8;
    v14[0] = MEMORY[0x1E4F143A8];
    v14[1] = 3221225472;
    v14[2] = __61__CopernicusDecoder_handleMessageInExchange_appletAID_error___block_invoke;
    v14[3] = &unk_1E65ADF98;
    v14[4] = self;
    id v15 = v9;
    int v10 = DERDecodeSequenceWithBlock(v16, (uint64_t)v14);
    if (v10)
    {
      int v11 = v10;
      uint64_t v12 = ATLLogObject();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 67109120;
        int v18 = v11;
        _os_log_impl(&dword_1CA552000, v12, OS_LOG_TYPE_ERROR, "Failed to decode contents of EXCHANGE %d", buf, 8u);
      }
    }
  }

  return 0;
}

uint64_t __61__CopernicusDecoder_handleMessageInExchange_appletAID_error___block_invoke(uint64_t a1, uint64_t *a2)
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  if (*a2 != 0xC000000000000000)
  {
    uint64_t v5 = ATLLogObject();
    if (!os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_11;
    }
    uint64_t v10 = *a2;
    int v13 = 134217984;
    uint64_t v14 = v10;
    uint64_t v6 = "Ignoring exchange tag 0x%llx";
    id v7 = v5;
    os_log_type_t v8 = OS_LOG_TYPE_DEFAULT;
LABEL_9:
    uint32_t v9 = 12;
    goto LABEL_10;
  }
  if (a2[2] != 32)
  {
    uint64_t v5 = ATLLogObject();
    if (!os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      goto LABEL_11;
    }
    uint64_t v11 = a2[2];
    int v13 = 134217984;
    uint64_t v14 = v11;
    uint64_t v6 = "StepUp -- invalid length %zx for shared secret";
    id v7 = v5;
    os_log_type_t v8 = OS_LOG_TYPE_ERROR;
    goto LABEL_9;
  }
  v4 = [[*(id *)(a1 + 40) subdataWithRange:4, 32];
  [*(id *)(*(void *)(a1 + 32) + 24) setObject:v4 forKeyedSubscript:@"SharedSecret"];

  uint64_t v5 = ATLLogObject();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(v13) = 0;
    uint64_t v6 = "StepUp - got shared secret over exchange";
    id v7 = v5;
    os_log_type_t v8 = OS_LOG_TYPE_DEFAULT;
    uint32_t v9 = 2;
LABEL_10:
    _os_log_impl(&dword_1CA552000, v7, v8, v6, (uint8_t *)&v13, v9);
  }
LABEL_11:

  return 0;
}

- (id)getAppletStateAndHistory:(id)a3 withApplet:(id)a4 withPackage:(id)a5 withModule:(id)a6 withError:(id *)a7
{
  v24[1] = *MEMORY[0x1E4F143B8];
  os_log_type_t v8 = ATLLogObject();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)id v20 = 0;
    _os_log_impl(&dword_1CA552000, v8, OS_LOG_TYPE_ERROR, "CopernicusDecoder doesn't support GetState", v20, 2u);
  }

  uint64_t v9 = [[NSString alloc] initWithFormat:@"CopernicusDecoder doesn't support GetState"];
  uint64_t v10 = (void *)v9;
  if (a7)
  {
    id v11 = *a7;
    uint64_t v12 = (void *)MEMORY[0x1E4F28C58];
    if (*a7)
    {
      uint64_t v13 = *MEMORY[0x1E4F28A50];
      v21[0] = *MEMORY[0x1E4F28568];
      v21[1] = v13;
      v22[0] = v9;
      v22[1] = v11;
      uint64_t v14 = (void *)MEMORY[0x1E4F1C9E8];
      uint64_t v15 = v22;
      uint64_t v16 = v21;
      uint64_t v17 = 2;
    }
    else
    {
      uint64_t v23 = *MEMORY[0x1E4F28568];
      v24[0] = v9;
      uint64_t v14 = (void *)MEMORY[0x1E4F1C9E8];
      uint64_t v15 = v24;
      uint64_t v16 = &v23;
      uint64_t v17 = 1;
    }
    int v18 = [v14 dictionaryWithObjects:v15 forKeys:v16 count:v17];
    *a7 = [v12 errorWithDomain:@"ATL" code:2 userInfo:v18];
  }
  return 0;
}

+ (BOOL)isCopernicus:(id)a3
{
  return [@"A000000704D011500000000002000000" isEqualToString:a3];
}

+ (BOOL)isAutomotiveAID:(id)a3
{
  return [a3 isEqualToString:@"A000000809434343444B417631"];
}

+ (BOOL)isHomeAID:(id)a3
{
  return [a3 hasPrefix:@"A0000008580101"];
}

+ (BOOL)isHydraAID:(id)a3
{
  return [a3 hasPrefix:@"A0000008580201"];
}

+ (BOOL)supportsStepUp:(id)a3
{
  id v3 = a3;
  BOOL v4 = +[CopernicusDecoder isHomeAID:v3]
    || +[CopernicusDecoder isHydraAID:v3];

  return v4;
}

- (id)GetAppletProperties:(id)a3 withPackage:(id)a4 withModule:(id)a5 withTransceiver:(id)a6 withError:(id *)a7
{
  v12[2] = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  os_log_type_t v8 = &unk_1F24E1BD0;
  if (!+[CopernicusDecoder isHomeAID:v7]
    && !+[CopernicusDecoder isHydraAID:v7])
  {
    os_log_type_t v8 = &unk_1F24E1BE8;
  }
  v11[0] = @"Supported";
  v11[1] = @"DelayExpressReentry";
  v12[0] = MEMORY[0x1E4F1CC38];
  v12[1] = v8;
  uint64_t v9 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v12 forKeys:v11 count:2];

  return v9;
}

- (id)processEndOfTransaction:(id)a3 withApplet:(id)a4 withPackage:(id)a5 withModule:(id)a6 withError:(id *)a7
{
  v24[1] = *MEMORY[0x1E4F143B8];
  os_log_type_t v8 = ATLLogObject();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)id v20 = 0;
    _os_log_impl(&dword_1CA552000, v8, OS_LOG_TYPE_ERROR, "Copernicus decoder doesn't expect processEndOfTransaction", v20, 2u);
  }

  uint64_t v9 = [[NSString alloc] initWithFormat:@"Copernicus decoder doesn't expect processEndOfTransaction"];
  uint64_t v10 = (void *)v9;
  if (a7)
  {
    id v11 = *a7;
    uint64_t v12 = (void *)MEMORY[0x1E4F28C58];
    if (*a7)
    {
      uint64_t v13 = *MEMORY[0x1E4F28A50];
      v21[0] = *MEMORY[0x1E4F28568];
      v21[1] = v13;
      v22[0] = v9;
      v22[1] = v11;
      uint64_t v14 = (void *)MEMORY[0x1E4F1C9E8];
      uint64_t v15 = v22;
      uint64_t v16 = v21;
      uint64_t v17 = 2;
    }
    else
    {
      uint64_t v23 = *MEMORY[0x1E4F28568];
      v24[0] = v9;
      uint64_t v14 = (void *)MEMORY[0x1E4F1C9E8];
      uint64_t v15 = v24;
      uint64_t v16 = &v23;
      uint64_t v17 = 1;
    }
    int v18 = [v14 dictionaryWithObjects:v15 forKeys:v16 count:v17];
    *a7 = [v12 errorWithDomain:@"ATL" code:7 userInfo:v18];
  }
  return 0;
}

- (unsigned)state
{
  return self->_state;
}

- (void)setState:(unsigned __int8)a3
{
  self->_state = a3;
}

- (NSString)endPointIdentifier
{
  return self->_endPointIdentifier;
}

- (void)setEndPointIdentifier:(id)a3
{
}

- (unsigned)transactionType
{
  return self->_transactionType;
}

- (void)setTransactionType:(unsigned int)a3
{
  self->_transactionType = a3;
}

- (NSMutableDictionary)stepUpData
{
  return self->_stepUpData;
}

- (void)setStepUpData:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_stepUpData, 0);

  objc_storeStrong((id *)&self->_endPointIdentifier, 0);
}

- (void)parseHomeSpecificCFParameters:(id *)a3 into:(id)a4
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v6 = a4;
  uint64_t v13 = MEMORY[0x1E4F143A8];
  uint64_t v14 = 3221225472;
  uint64_t v15 = __62__CopernicusDecoder_Home__parseHomeSpecificCFParameters_into___block_invoke;
  uint64_t v16 = &unk_1E65ADF98;
  uint64_t v17 = self;
  id v7 = v6;
  id v18 = v7;
  int v8 = DERDecodeSequenceWithBlock((unsigned __int8 **)a3, (uint64_t)&v13);
  if (v8)
  {
    int v9 = v8;
    uint64_t v10 = ATLLogObject();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      id v11 = [MEMORY[0x1E4F1C9B8] dataWithDERItem:a3, v13, v14, v15, v16, v17];
      uint64_t v12 = [v11 asHexString];
      *(_DWORD *)buf = 67109378;
      int v20 = v9;
      __int16 v21 = 2112;
      id v22 = v12;
      _os_log_impl(&dword_1CA552000, v10, OS_LOG_TYPE_ERROR, "Failed to parse additional HomeKit data (%d) - %@", buf, 0x12u);
    }
  }
}

uint64_t __62__CopernicusDecoder_Home__parseHomeSpecificCFParameters_into___block_invoke(uint64_t a1, void *a2)
{
  if (*a2 == 0x400000000000000DLL)
  {
    id v3 = [*(id *)(a1 + 32) _stringFromASCIIBytes:a2 + 1];
    if (v3)
    {
      BOOL v4 = *(void **)(a1 + 40);
      uint64_t v5 = @"HomeKitModel";
      goto LABEL_7;
    }
LABEL_8:

    return 0;
  }
  if (*a2 == 0x400000000000000CLL)
  {
    id v3 = [*(id *)(a1 + 32) _stringFromASCIIBytes:a2 + 1];
    if (v3)
    {
      BOOL v4 = *(void **)(a1 + 40);
      uint64_t v5 = @"HomeKitManufacturer";
LABEL_7:
      [v4 setObject:v3 forKeyedSubscript:v5];
      goto LABEL_8;
    }
    goto LABEL_8;
  }
  return 0;
}

- (id)_stringFromASCIIBytes:(id *)a3
{
  unint64_t var1 = a3->var1;
  if (var1)
  {
    var0 = a3->var0;
    while (1)
    {
      int v5 = *var0++;
      if (v5 < 0) {
        break;
      }
      if (!--var1) {
        goto LABEL_5;
      }
    }
    id v6 = 0;
  }
  else
  {
LABEL_5:
    id v6 = (void *)[[NSString alloc] initWithBytes:a3->var0 length:a3->var1 encoding:1];
  }

  return v6;
}

@end