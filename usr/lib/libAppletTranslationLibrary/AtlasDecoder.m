@interface AtlasDecoder
+ (id)DecodeTransactionE1TLV:(id *)a3 error:(id *)a4;
+ (id)amountDictionaryWithAmount:(id)a3 withIdentifier:(id)a4 usingAmountKey:(id)a5 usingCurrencyKey:(id)a6 usingExponentKey:(id)a7 usingIdentifierKey:(id)a8;
+ (id)calculateCommutePlanUniqueId:(id)a3 withExpiry:(id)a4;
+ (id)calculateTransactionSN:(id)a3 withTimeStamp:(id)a4 withEventCode:(id)a5 withSP:(id)a6 withContractPointer:(id)a7 withDifferentiator:(id)a8;
+ (id)commutePlanWithIdAndExpiry:(id)a3 withExpiry:(id)a4 withUniqueId:(id)a5;
+ (id)decodeBestContractList:(id)a3;
+ (id)decodeContractFFBitMap:(id)a3;
+ (id)decodeContractJourneyDataBitmap:(id)a3;
+ (id)decodeContractRestrictionBitmap:(id)a3;
+ (id)decodeContractSaleDataBitmap:(id)a3;
+ (id)decodeContractStructureFF:(id)a3;
+ (id)decodeContractValidityBitmap:(id)a3;
+ (id)decodeCounterStructure03:(id)a3;
+ (id)decodeCounterStructure0C:(id)a3;
+ (id)decodeEnvironmentBitMap:(id)a3;
+ (id)decodeEnvironmentData:(id)a3;
+ (id)decodeEnvironmentDataBitMap:(id)a3;
+ (id)decodeEventBitMap:(id)a3;
+ (id)decodeEventEntry:(id)a3;
+ (id)formatCommutePlanIdentifier:(id)a3 withTariffCode:(id)a4 withZoneList:(id)a5;
+ (id)formatTransitDetailRaw:(id)a3;
+ (id)getAbsoluteDateComponents:(id)a3 withTime:(id)a4;
+ (id)getAbsoluteDateComponentsWithDefaultMinutes:(id)a3 withTime:(id)a4 withDefaultMinutes:(id)a5;
+ (id)getInternalEnRouteStatus:(id)a3;
+ (id)getTransitModality:(id)a3;
+ (id)getUnvalidatableContracts:(id)a3;
+ (id)resolveServiceProvider:(unsigned __int8)a3;
+ (id)sharedInstance;
- (AtlasDecoder)init;
- (id)GetAppletProperties:(id)a3 withPackage:(id)a4 withModule:(id)a5 withTransceiver:(id)a6 withError:(id *)a7;
- (id)SelectRemoteTicketingCmd;
- (id)generateContactEndEvent:(id)a3 withDidError:(BOOL)a4;
- (id)generateEndEventFromHCI;
- (id)getATLTimer;
- (id)getAppletStateAndHistory:(id)a3 withApplet:(id)a4 withPackage:(id)a5 withModule:(id)a6 withError:(id *)a7;
- (id)getCardIdFromSelectResponse:(id)a3;
- (id)getServiceProviderData:(id)a3 withPackage:(id)a4 withModule:(id)a5 withPublicKey:(id)a6 withEncryptionScheme:(id)a7 withTransceiver:(id)a8 withError:(id *)a9;
- (id)getServiceProviderData:(id)a3 withPackage:(id)a4 withModule:(id)a5 withTransceiver:(id)a6 withError:(id *)a7;
- (id)parseCommandEvent:(id)a3 withApplet:(id)a4 error:(id *)a5;
- (id)parseDeselectEvent:(id)a3 withApplet:(id)a4 error:(id *)a5;
- (id)parseEndEvent:(id)a3 withApplet:(id)a4 error:(id *)a5;
- (id)parseHCIEvent:(id)a3 withApplet:(id)a4 withPackage:(id)a5 withModule:(id)a6 withTransceiver:(id)a7 withError:(id *)a8;
- (id)parseHistory:(id)a3 withContractList:(id)a4;
- (id)parseStartEvent:(id)a3 withApplet:(id)a4 error:(id *)a5;
- (id)parseTransactionEvent:(id)a3 withApplet:(id)a4 error:(id *)a5;
- (id)processEndOfTransaction:(id)a3 withApplet:(id)a4 withPackage:(id)a5 withModule:(id)a6 withError:(id *)a7;
- (id)readAndDecodeBestContractList:(id)a3 sfi:(unsigned __int8)a4 error:(id *)a5;
- (id)readAndDecodeContracts:(id)a3 sfi:(unsigned __int8)a4 count:(unsigned __int8)a5 error:(id *)a6;
- (id)readAndDecodeCounter:(id)a3 sfi:(unsigned __int8)a4 recNum:(unsigned __int8)a5 counterStructure:(unsigned __int8)a6 error:(id *)a7;
- (id)readAndDecodeEnvironment:(id)a3 sfi:(unsigned __int8)a4 error:(id *)a5;
- (id)readAndDecodeHistory:(id)a3 sfi:(unsigned __int8)a4 count:(unsigned __int8)a5 error:(id *)a6;
- (id)readPartnerRecords:(id)a3 sfi:(unsigned __int8)a4 count:(unsigned __int8)a5 error:(id *)a6;
- (id)readRecord:(id)a3 sfi:(unsigned __int8)a4 index:(unsigned __int8)a5 recLength:(unsigned __int8)a6 error:(id *)a7;
- (void)cleanup;
- (void)stripContract:(id)a3;
@end

@implementation AtlasDecoder

+ (id)sharedInstance
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __30__AtlasDecoder_sharedInstance__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (sharedInstance_onceToken != -1) {
    dispatch_once(&sharedInstance_onceToken, block);
  }
  v2 = (void *)sharedInstance__singleton;

  return v2;
}

uint64_t __30__AtlasDecoder_sharedInstance__block_invoke(uint64_t a1)
{
  sharedInstance__singleton = (uint64_t)objc_alloc_init(*(Class *)(a1 + 32));

  return MEMORY[0x1F41817F8]();
}

- (id)getATLTimer
{
  return self->_timer;
}

- (AtlasDecoder)init
{
  v13.receiver = self;
  v13.super_class = (Class)AtlasDecoder;
  v2 = [(AtlasDecoder *)&v13 init];
  if (v2)
  {
    v3 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    hciArray = v2->_hciArray;
    v2->_hciArray = v3;

    v5 = [ATLTimer alloc];
    v6 = dispatch_get_global_queue(0, 0);
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = __20__AtlasDecoder_init__block_invoke;
    v11[3] = &unk_1E65AE068;
    v7 = v2;
    v12 = v7;
    v8 = (ATLTimer *)-[ATLTimer initOnQueue:withTimerBlock:](v5, v6, v11);
    timer = v7->_timer;
    v7->_timer = v8;

    +[AppletTranslator registerForCleanup:]((uint64_t)AppletTranslator, v7);
  }
  return v2;
}

void __20__AtlasDecoder_init__block_invoke(uint64_t a1)
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  v2 = ATLLogObject();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
  {
    LOWORD(v7) = 0;
    _os_log_impl(&dword_1CA552000, v2, OS_LOG_TYPE_DEBUG, "dispatching timer block", (uint8_t *)&v7, 2u);
  }

  id v3 = *(id *)(a1 + 32);
  objc_sync_enter(v3);
  v4 = [*(id *)(a1 + 32) generateEndEventFromHCI];
  if (v4)
  {
    v5 = +[AppletTranslator getATLDelegate]();
    v6 = ATLLogObject();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
    {
      int v7 = 138412290;
      v8 = v4;
      _os_log_impl(&dword_1CA552000, v6, OS_LOG_TYPE_DEBUG, "EndEvent sent %@", (uint8_t *)&v7, 0xCu);
    }

    [v5 notifyTransactionEvent:v4];
  }

  objc_sync_exit(v3);
}

- (void)cleanup
{
  id v3 = ATLLogObject();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)uint64_t v9 = 0;
    _os_log_impl(&dword_1CA552000, v3, OS_LOG_TYPE_DEBUG, "Starting cleanup", v9, 2u);
  }

  v4 = self;
  objc_sync_enter(v4);
  [(NSMutableArray *)v4->_hciArray removeAllObjects];
  serviceProvider = v4->_serviceProvider;
  v4->_serviceProvider = 0;

  appletAID = v4->_appletAID;
  v4->_appletAID = 0;

  v4->_errorTransaction = 0;
  errorCode = v4->_errorCode;
  v4->_errorCode = 0;

  transactionDetailRaw = v4->_transactionDetailRaw;
  v4->_transactionDetailRaw = 0;

  -[ATLTimer stopTimer]((dispatch_source_t *)v4->_timer);
  objc_sync_exit(v4);
}

- (id)parseHCIEvent:(id)a3 withApplet:(id)a4 withPackage:(id)a5 withModule:(id)a6 withTransceiver:(id)a7 withError:(id *)a8
{
  v63[1] = *MEMORY[0x1E4F143B8];
  id v14 = a3;
  id v15 = a4;
  id v16 = a5;
  id v17 = a6;
  id v18 = a7;
  if (!self->_appletAID) {
    objc_storeStrong((id *)&self->_appletAID, a4);
  }
  if ((unint64_t)[v14 length] <= 1)
  {
    v19 = ATLLogObject();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 67109120;
      int v53 = [v14 length];
      _os_log_impl(&dword_1CA552000, v19, OS_LOG_TYPE_ERROR, "Invalid eventData length %u", buf, 8u);
    }

    uint64_t v20 = [[NSString alloc] initWithFormat: @"Invalid eventData length %u", [v14 length]];
    v21 = (void *)v20;
    if (a8)
    {
      id v22 = *a8;
      v23 = (void *)MEMORY[0x1E4F28C58];
      if (*a8)
      {
        uint64_t v24 = *MEMORY[0x1E4F28A50];
        v60[0] = *MEMORY[0x1E4F28568];
        v60[1] = v24;
        v61[0] = v20;
        v61[1] = v22;
        [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v61 forKeys:v60 count:2];
      }
      else
      {
        uint64_t v62 = *MEMORY[0x1E4F28568];
        v63[0] = v20;
        [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v63 forKeys:&v62 count:1];
      v36 = };
      *a8 = [v23 errorWithDomain:@"ATL" code:6 userInfo:v36];
    }
LABEL_28:

LABEL_29:
    v38 = 0;
    goto LABEL_34;
  }
  id v25 = v14;
  uint64_t v26 = *(unsigned __int8 *)[v25 bytes];
  id v27 = v25;
  uint64_t v28 = *(unsigned __int8 *)([v27 bytes] + 1);
  if (v28 != 7)
  {
    v31 = ATLLogObject();
    if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 67109120;
      int v53 = v28;
      _os_log_impl(&dword_1CA552000, v31, OS_LOG_TYPE_ERROR, "Unsupported version %u", buf, 8u);
    }

    uint64_t v32 = [[NSString alloc] initWithFormat:@"Unsupported version %u", v28];
    v21 = (void *)v32;
    if (a8)
    {
      id v33 = *a8;
      v34 = (void *)MEMORY[0x1E4F28C58];
      if (*a8)
      {
        uint64_t v35 = *MEMORY[0x1E4F28A50];
        v56[0] = *MEMORY[0x1E4F28568];
        v56[1] = v35;
        v57[0] = v32;
        v57[1] = v33;
        [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v57 forKeys:v56 count:2];
      }
      else
      {
        uint64_t v58 = *MEMORY[0x1E4F28568];
        uint64_t v59 = v32;
        [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v59 forKeys:&v58 count:1];
      v37 = };
      *a8 = [v34 errorWithDomain:@"ATL" code:2 userInfo:v37];
    }
    goto LABEL_28;
  }
  v29 = self;
  objc_sync_enter(v29);
  if ((int)v26 <= 16)
  {
    if (v26 == 1)
    {
      uint64_t v30 = [(AtlasDecoder *)v29 parseStartEvent:v27 withApplet:v15 error:a8];
      goto LABEL_33;
    }
    if (v26 == 2)
    {
      uint64_t v30 = [(AtlasDecoder *)v29 parseEndEvent:v27 withApplet:v15 error:a8];
      goto LABEL_33;
    }
LABEL_37:
    objc_sync_exit(v29);

    v40 = ATLLogObject();
    if (os_log_type_enabled(v40, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 67109376;
      int v53 = v26;
      __int16 v54 = 1024;
      int v55 = 7;
      _os_log_impl(&dword_1CA552000, v40, OS_LOG_TYPE_ERROR, "Invalid event type 0x%x version 0x%x", buf, 0xEu);
    }

    uint64_t v41 = [[NSString alloc] initWithFormat:@"Invalid event type 0x%x version 0x%x", v26, 7];
    v42 = (void *)v41;
    if (a8)
    {
      id v43 = *a8;
      v44 = (void *)MEMORY[0x1E4F28C58];
      if (*a8)
      {
        uint64_t v45 = *MEMORY[0x1E4F28A50];
        v48[0] = *MEMORY[0x1E4F28568];
        v48[1] = v45;
        v49[0] = v41;
        v49[1] = v43;
        uint64_t v46 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v49 forKeys:v48 count:2];
      }
      else
      {
        uint64_t v50 = *MEMORY[0x1E4F28568];
        uint64_t v51 = v41;
        uint64_t v46 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v51 forKeys:&v50 count:1];
      }
      v47 = (void *)v46;
      *a8 = [v44 errorWithDomain:@"ATL" code:3 userInfo:v46];
    }
    goto LABEL_29;
  }
  if (v26 == 17)
  {
    uint64_t v30 = [(AtlasDecoder *)v29 parseTransactionEvent:v27 withApplet:v15 error:a8];
    goto LABEL_33;
  }
  if (v26 == 18)
  {
    uint64_t v30 = [(AtlasDecoder *)v29 parseDeselectEvent:v27 withApplet:v15 error:a8];
    goto LABEL_33;
  }
  if (v26 != 19) {
    goto LABEL_37;
  }
  uint64_t v30 = [(AtlasDecoder *)v29 parseCommandEvent:v27 withApplet:v15 error:a8];
LABEL_33:
  v38 = (void *)v30;
  objc_sync_exit(v29);

LABEL_34:

  return v38;
}

- (id)parseCommandEvent:(id)a3 withApplet:(id)a4 error:(id *)a5
{
  v68[1] = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  if ([v8 length] == 10)
  {
    uint64_t v10 = [v8 bytes];
    if (*(unsigned char *)(v10 + 1) == 7)
    {
      v11 = [MEMORY[0x1E4F1C9B8] dataWithBytes:v10 + 3 length:5];
      unsigned int v12 = *(unsigned __int16 *)(v10 + 8);
      int v13 = [v11 u8:1];
      if (*(unsigned char *)(v10 + 2) == 1)
      {
        v36 = @"Contactless";
LABEL_33:
        v55[0] = @"EventType";
        v55[1] = @"appletIdentifier";
        v56[1] = v9;
        void v56[2] = v36;
        v56[0] = @"CommandEvent";
        v55[2] = @"Interface";
        v55[3] = @"Version";
        v49 = [NSNumber numberWithUnsignedChar:*(unsigned __int8 *)(v10 + 1)];
        v56[3] = v49;
        v56[4] = v11;
        v55[4] = @"command";
        v55[5] = @"status";
        uint64_t v50 = [NSNumber numberWithUnsignedShort:__rev16(v12)];
        v56[5] = v50;
        a5 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v56 forKeys:v55 count:6];

        uint64_t v51 = ATLLogObject();
        if (os_log_type_enabled(v51, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 138412290;
          __int16 v54 = a5;
          _os_log_impl(&dword_1CA552000, v51, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
        }

        [(NSMutableArray *)self->_hciArray addObject:a5];
        goto LABEL_29;
      }
      if (!*(unsigned char *)(v10 + 2))
      {
        if (v13 == 142)
        {
          [(AtlasDecoder *)self generateContactEndEvent:v9 withDidError:v12 != 144];
          a5 = (id *)objc_claimAutoreleasedReturnValue();
          goto LABEL_29;
        }
        v36 = @"Contact";
        goto LABEL_33;
      }
      v37 = ATLLogObject();
      if (os_log_type_enabled(v37, OS_LOG_TYPE_ERROR))
      {
        int v38 = *(unsigned __int8 *)(v10 + 2);
        *(_DWORD *)buf = 67109120;
        LODWORD(v54) = v38;
        _os_log_impl(&dword_1CA552000, v37, OS_LOG_TYPE_ERROR, "Unknown interface type %u", buf, 8u);
      }

      uint64_t v39 = [[NSString alloc] initWithFormat:@"Unknown interface type %u", *(unsigned __int8 *)(v10 + 2)];
      v40 = (void *)v39;
      if (a5)
      {
        id v41 = *a5;
        v42 = (void *)MEMORY[0x1E4F28C58];
        if (*a5)
        {
          uint64_t v43 = *MEMORY[0x1E4F28A50];
          v57[0] = *MEMORY[0x1E4F28568];
          v57[1] = v43;
          v58[0] = v39;
          v58[1] = v41;
          v44 = (void *)MEMORY[0x1E4F1C9E8];
          uint64_t v45 = v58;
          uint64_t v46 = v57;
          uint64_t v47 = 2;
        }
        else
        {
          uint64_t v59 = *MEMORY[0x1E4F28568];
          uint64_t v60 = v39;
          v44 = (void *)MEMORY[0x1E4F1C9E8];
          uint64_t v45 = &v60;
          uint64_t v46 = &v59;
          uint64_t v47 = 1;
        }
        v52 = [v44 dictionaryWithObjects:v45 forKeys:v46 count:v47];
        *a5 = [v42 errorWithDomain:@"ATL" code:3 userInfo:v52];
      }
LABEL_28:
      a5 = 0;
      goto LABEL_29;
    }
    v23 = ATLLogObject();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
    {
      int v24 = *(unsigned __int8 *)(v10 + 1);
      *(_DWORD *)buf = 67109120;
      LODWORD(v54) = v24;
      _os_log_impl(&dword_1CA552000, v23, OS_LOG_TYPE_ERROR, "Command Event version %u", buf, 8u);
    }

    uint64_t v25 = [[NSString alloc] initWithFormat:@"Command Event version %u", *(unsigned __int8 *)(v10 + 1)];
    v11 = (void *)v25;
    if (a5)
    {
      id v26 = *a5;
      id v27 = (void *)MEMORY[0x1E4F28C58];
      if (*a5)
      {
        uint64_t v28 = *MEMORY[0x1E4F28A50];
        v61[0] = *MEMORY[0x1E4F28568];
        v61[1] = v28;
        v62[0] = v25;
        v62[1] = v26;
        v29 = (void *)MEMORY[0x1E4F1C9E8];
        uint64_t v30 = v62;
        v31 = v61;
        uint64_t v32 = 2;
      }
      else
      {
        uint64_t v63 = *MEMORY[0x1E4F28568];
        uint64_t v64 = v25;
        v29 = (void *)MEMORY[0x1E4F1C9E8];
        uint64_t v30 = &v64;
        v31 = &v63;
        uint64_t v32 = 1;
      }
      id v33 = [v29 dictionaryWithObjects:v30 forKeys:v31 count:v32];
      v34 = v27;
      uint64_t v35 = 3;
LABEL_27:
      *a5 = [v34 errorWithDomain:@"ATL" code:v35 userInfo:v33];

      goto LABEL_28;
    }
  }
  else
  {
    id v14 = ATLLogObject();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 67109120;
      LODWORD(v54) = [v8 length];
      _os_log_impl(&dword_1CA552000, v14, OS_LOG_TYPE_ERROR, "Invalid eventData length %u", buf, 8u);
    }

    uint64_t v15 = [[NSString alloc] initWithFormat:@"Invalid eventData length %u", [v8 length]];
    v11 = (void *)v15;
    if (a5)
    {
      id v16 = *a5;
      id v17 = (void *)MEMORY[0x1E4F28C58];
      if (*a5)
      {
        uint64_t v18 = *MEMORY[0x1E4F28A50];
        v65[0] = *MEMORY[0x1E4F28568];
        v65[1] = v18;
        v66[0] = v15;
        v66[1] = v16;
        v19 = (void *)MEMORY[0x1E4F1C9E8];
        uint64_t v20 = v66;
        v21 = v65;
        uint64_t v22 = 2;
      }
      else
      {
        uint64_t v67 = *MEMORY[0x1E4F28568];
        v68[0] = v15;
        v19 = (void *)MEMORY[0x1E4F1C9E8];
        uint64_t v20 = v68;
        v21 = &v67;
        uint64_t v22 = 1;
      }
      id v33 = [v19 dictionaryWithObjects:v20 forKeys:v21 count:v22];
      v34 = v17;
      uint64_t v35 = 6;
      goto LABEL_27;
    }
  }
LABEL_29:

  return a5;
}

- (id)parseTransactionEvent:(id)a3 withApplet:(id)a4 error:(id *)a5
{
  v87[1] = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  if ((unint64_t)[v8 length] > 2)
  {
    id v20 = v8;
    uint64_t v21 = [v20 bytes];
    uint64_t v22 = v21;
    if (*(unsigned char *)(v21 + 1) == 7)
    {
      if (!*(unsigned char *)(v21 + 2))
      {
        v23 = @"Contact";
LABEL_19:
        v69[0] = v21 + 3;
        v69[1] = [v20 length] - 3;
        v36 = +[AtlasDecoder DecodeTransactionE1TLV:v69 error:a5];
        v37 = v36;
        if (a5)
        {
          int v38 = 0;
          if (*a5 || !v36) {
            goto LABEL_55;
          }
        }
        else if (!v36)
        {
          int v38 = 0;
LABEL_55:

          goto LABEL_61;
        }
        uint64_t v45 = [v36 objectForKeyedSubscript:@"recordData"];
        if ([v45 sfi] == 8 || objc_msgSend(v45, "sfi") == 29)
        {
          uint64_t v46 = [v45 content];
          uint64_t v47 = +[AtlasDecoder decodeEventEntry:v46];

          v48 = [v47 objectForKeyedSubscript:@"EventCode"];
          if (v48)
          {
            uint64_t v49 = +[AtlasDecoder formatTransitDetailRaw:v48];
            uint64_t v50 = (NSData *)v49;
            if (v49)
            {
              transactionDetailRaw = self->_transactionDetailRaw;
              if (transactionDetailRaw)
              {
                if ((NSData *)v49 != transactionDetailRaw)
                {
                  log = ATLLogObject();
                  if (os_log_type_enabled(log, OS_LOG_TYPE_DEFAULT))
                  {
                    v52 = self->_transactionDetailRaw;
                    *(_DWORD *)buf = 138412546;
                    v73 = v52;
                    __int16 v74 = 2112;
                    v75 = v50;
                    _os_log_impl(&dword_1CA552000, log, OS_LOG_TYPE_DEFAULT, "Inconsistent transaction details received during a single transaction %@ -> %@", buf, 0x16u);
                  }
                }
              }
            }
            int v53 = self->_transactionDetailRaw;
            self->_transactionDetailRaw = v50;
          }
          __int16 v54 = [v47 objectForKeyedSubscript:@"EventResult"];

          if (v54)
          {
            int v55 = [v47 objectForKeyedSubscript:@"EventResult"];
            errorCode = self->_errorCode;
            self->_errorCode = v55;

            uint64_t v57 = [(NSNumber *)self->_errorCode longLongValue];
            if ((unint64_t)(v57 - 32) >= 2 && (unint64_t)(v57 - 131) >= 2) {
              self->_errorTransaction = 1;
            }
            uint64_t v58 = ATLLogObject();
            if (os_log_type_enabled(v58, OS_LOG_TYPE_DEFAULT))
            {
              uint64_t v59 = self->_errorCode;
              *(_DWORD *)buf = 138412290;
              v73 = v59;
              _os_log_impl(&dword_1CA552000, v58, OS_LOG_TYPE_DEFAULT, "*** SpecialEvent written with ErrorCode = %@", buf, 0xCu);
            }
          }
        }
        uint64_t v60 = ATLLogObject();
        if (os_log_type_enabled(v60, OS_LOG_TYPE_DEBUG))
        {
          v61 = self->_transactionDetailRaw;
          *(_DWORD *)buf = 138412290;
          v73 = v61;
          _os_log_impl(&dword_1CA552000, v60, OS_LOG_TYPE_DEBUG, "*** _transactionDetailRaw = %@", buf, 0xCu);
        }

        v70[0] = @"EventType";
        v70[1] = @"appletIdentifier";
        v71[1] = v9;
        v71[2] = v23;
        v71[0] = @"TransactionEvent";
        v70[2] = @"Interface";
        v70[3] = @"Version";
        uint64_t v62 = [NSNumber numberWithUnsignedChar:*(unsigned __int8 *)(v22 + 1)];
        v71[3] = v62;
        v71[4] = &unk_1F24E1CC0;
        v70[4] = @"spIdentifier";
        v70[5] = @"sfi";
        uint64_t v63 = [NSNumber numberWithUnsignedChar:[v45 sfi]];
        v71[5] = v63;
        v70[6] = @"recordId";
        uint64_t v64 = [NSNumber numberWithUnsignedChar:[v45 recordId]];
        v71[6] = v64;
        v70[7] = @"recordContent";
        v65 = [v45 content];
        v71[7] = v65;
        int v38 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v71 forKeys:v70 count:8];

        v66 = ATLLogObject();
        if (os_log_type_enabled(v66, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 138412290;
          v73 = v38;
          _os_log_impl(&dword_1CA552000, v66, OS_LOG_TYPE_DEBUG, "TransactionEvent %@", buf, 0xCu);
        }

        [(NSMutableArray *)self->_hciArray addObject:v38];
        goto LABEL_55;
      }
      if (*(unsigned char *)(v21 + 2) == 1)
      {
        v23 = @"Contactless";
        goto LABEL_19;
      }
      uint64_t v39 = ATLLogObject();
      if (os_log_type_enabled(v39, OS_LOG_TYPE_ERROR))
      {
        int v40 = *(unsigned __int8 *)(v22 + 2);
        *(_DWORD *)buf = 67109120;
        LODWORD(v73) = v40;
        _os_log_impl(&dword_1CA552000, v39, OS_LOG_TYPE_ERROR, "Unknown interface type %u", buf, 8u);
      }

      uint64_t v41 = [[NSString alloc] initWithFormat:@"Unknown interface type %u", *(unsigned __int8 *)(v22 + 2)];
      unsigned int v12 = (void *)v41;
      if (!a5) {
        goto LABEL_60;
      }
      id v42 = *a5;
      uint64_t v28 = (void *)MEMORY[0x1E4F28C58];
      if (*a5)
      {
        uint64_t v43 = *MEMORY[0x1E4F28A50];
        v76[0] = *MEMORY[0x1E4F28568];
        v76[1] = v43;
        v77[0] = v41;
        v77[1] = v42;
        uint64_t v30 = (void *)MEMORY[0x1E4F1C9E8];
        v31 = v77;
        uint64_t v32 = v76;
        goto LABEL_28;
      }
      uint64_t v78 = *MEMORY[0x1E4F28568];
      uint64_t v79 = v41;
      uint64_t v30 = (void *)MEMORY[0x1E4F1C9E8];
      v31 = &v79;
      uint64_t v32 = &v78;
    }
    else
    {
      int v24 = ATLLogObject();
      if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
      {
        int v25 = *(unsigned __int8 *)(v22 + 1);
        *(_DWORD *)buf = 67109120;
        LODWORD(v73) = v25;
        _os_log_impl(&dword_1CA552000, v24, OS_LOG_TYPE_ERROR, "Start Event version %u", buf, 8u);
      }

      uint64_t v26 = [[NSString alloc] initWithFormat:@"Start Event version %u", *(unsigned __int8 *)(v22 + 1)];
      unsigned int v12 = (void *)v26;
      if (!a5) {
        goto LABEL_60;
      }
      id v27 = *a5;
      uint64_t v28 = (void *)MEMORY[0x1E4F28C58];
      if (*a5)
      {
        uint64_t v29 = *MEMORY[0x1E4F28A50];
        v80[0] = *MEMORY[0x1E4F28568];
        v80[1] = v29;
        v81[0] = v26;
        v81[1] = v27;
        uint64_t v30 = (void *)MEMORY[0x1E4F1C9E8];
        v31 = v81;
        uint64_t v32 = v80;
LABEL_28:
        uint64_t v44 = 2;
LABEL_58:
        id v33 = [v30 dictionaryWithObjects:v31 forKeys:v32 count:v44];
        v34 = v28;
        uint64_t v35 = 3;
        goto LABEL_59;
      }
      uint64_t v82 = *MEMORY[0x1E4F28568];
      uint64_t v83 = v26;
      uint64_t v30 = (void *)MEMORY[0x1E4F1C9E8];
      v31 = &v83;
      uint64_t v32 = &v82;
    }
    uint64_t v44 = 1;
    goto LABEL_58;
  }
  uint64_t v10 = ATLLogObject();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 67109120;
    LODWORD(v73) = [v8 length];
    _os_log_impl(&dword_1CA552000, v10, OS_LOG_TYPE_ERROR, "Invalid eventData length %u", buf, 8u);
  }

  uint64_t v11 = [[NSString alloc] initWithFormat:@"Invalid eventData length %u", [v8 length]];
  unsigned int v12 = (void *)v11;
  if (!a5) {
    goto LABEL_60;
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
    id v16 = (void *)MEMORY[0x1E4F1C9E8];
    id v17 = v85;
    uint64_t v18 = v84;
    uint64_t v19 = 2;
  }
  else
  {
    uint64_t v86 = *MEMORY[0x1E4F28568];
    v87[0] = v11;
    id v16 = (void *)MEMORY[0x1E4F1C9E8];
    id v17 = v87;
    uint64_t v18 = &v86;
    uint64_t v19 = 1;
  }
  id v33 = [v16 dictionaryWithObjects:v17 forKeys:v18 count:v19];
  v34 = v14;
  uint64_t v35 = 6;
LABEL_59:
  *a5 = [v34 errorWithDomain:@"ATL" code:v35 userInfo:v33];

LABEL_60:
  int v38 = 0;
LABEL_61:

  return v38;
}

- (id)parseStartEvent:(id)a3 withApplet:(id)a4 error:(id *)a5
{
  uint64_t v56 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  if ([v8 length] != 3)
  {
    id v13 = ATLLogObject();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 134218240;
      uint64_t v53 = [v8 length];
      __int16 v54 = 2048;
      uint64_t v55 = 3;
      _os_log_impl(&dword_1CA552000, v13, OS_LOG_TYPE_ERROR, "Start Event length %zu (exp %zu)", buf, 0x16u);
    }

    uint64_t v14 = [[NSString alloc] initWithFormat:@"Start Event length %zu (exp %zu)", objc_msgSend(v8, "length"), 3];
    uint64_t v15 = (void *)v14;
    if (!a5) {
      goto LABEL_33;
    }
    id v16 = *a5;
    id v17 = (void *)MEMORY[0x1E4F28C58];
    if (!*a5)
    {
      uint64_t v50 = *MEMORY[0x1E4F28568];
      uint64_t v51 = v14;
      uint64_t v19 = (void *)MEMORY[0x1E4F1C9E8];
      id v20 = &v51;
      uint64_t v21 = &v50;
      goto LABEL_31;
    }
    uint64_t v18 = *MEMORY[0x1E4F28A50];
    v48[0] = *MEMORY[0x1E4F28568];
    v48[1] = v18;
    v49[0] = v14;
    v49[1] = v16;
    uint64_t v19 = (void *)MEMORY[0x1E4F1C9E8];
    id v20 = v49;
    uint64_t v21 = v48;
LABEL_28:
    uint64_t v35 = 2;
LABEL_32:
    v36 = [v19 dictionaryWithObjects:v20 forKeys:v21 count:v35];
    *a5 = [v17 errorWithDomain:@"ATL" code:3 userInfo:v36];

    a5 = 0;
    goto LABEL_33;
  }
  uint64_t v10 = [v8 bytes];
  uint64_t v11 = v10;
  if (*(unsigned char *)(v10 + 1) != 7)
  {
    uint64_t v22 = ATLLogObject();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
    {
      int v23 = *(unsigned __int8 *)(v11 + 1);
      *(_DWORD *)buf = 67109120;
      LODWORD(v53) = v23;
      _os_log_impl(&dword_1CA552000, v22, OS_LOG_TYPE_ERROR, "Start Event version %u", buf, 8u);
    }

    uint64_t v24 = [[NSString alloc] initWithFormat:@"Start Event version %u", *(unsigned __int8 *)(v11 + 1)];
    uint64_t v15 = (void *)v24;
    if (!a5) {
      goto LABEL_33;
    }
    id v25 = *a5;
    id v17 = (void *)MEMORY[0x1E4F28C58];
    if (!*a5)
    {
      uint64_t v46 = *MEMORY[0x1E4F28568];
      uint64_t v47 = v24;
      uint64_t v19 = (void *)MEMORY[0x1E4F1C9E8];
      id v20 = &v47;
      uint64_t v21 = &v46;
      goto LABEL_31;
    }
    uint64_t v26 = *MEMORY[0x1E4F28A50];
    v44[0] = *MEMORY[0x1E4F28568];
    v44[1] = v26;
    v45[0] = v24;
    v45[1] = v25;
    uint64_t v19 = (void *)MEMORY[0x1E4F1C9E8];
    id v20 = v45;
    uint64_t v21 = v44;
    goto LABEL_28;
  }
  if (!*(unsigned char *)(v10 + 2))
  {
    unsigned int v12 = @"Contact";
    goto LABEL_18;
  }
  if (*(unsigned char *)(v10 + 2) == 1)
  {
    unsigned int v12 = @"Contactless";
LABEL_18:
    v38[0] = @"EventType";
    v38[1] = @"appletIdentifier";
    v39[1] = v9;
    v39[2] = v12;
    v39[0] = @"StartEvent";
    v38[2] = @"Interface";
    v38[3] = @"Version";
    id v27 = [NSNumber numberWithUnsignedChar:*(unsigned __int8 *)(v10 + 1)];
    v38[4] = @"IgnoreRFEvents";
    v38[5] = @"DontWaitForEOT";
    v39[5] = MEMORY[0x1E4F1CC38];
    v39[6] = MEMORY[0x1E4F1CC38];
    v39[3] = v27;
    v39[4] = MEMORY[0x1E4F1CC28];
    v38[6] = @"RequiresPowerCycle";
    v38[7] = @"EoTCallbackExpected";
    v38[8] = @"DelayExpressReentry";
    v39[7] = MEMORY[0x1E4F1CC28];
    v39[8] = &unk_1F24E1CD8;
    uint64_t v15 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v39 forKeys:v38 count:9];

    uint64_t v28 = ATLLogObject();
    if (os_log_type_enabled(v28, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 138412290;
      uint64_t v53 = (uint64_t)v15;
      _os_log_impl(&dword_1CA552000, v28, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
    }

    a5 = [MEMORY[0x1E4F1CA60] dictionaryWithDictionary:v15];
    uint64_t v29 = ATLLogObject();
    if (os_log_type_enabled(v29, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1CA552000, v29, OS_LOG_TYPE_DEBUG, "Stopping currently running timer due to incoming SELECT", buf, 2u);
    }

    -[ATLTimer stopTimer]((dispatch_source_t *)self->_timer);
    [(NSMutableArray *)self->_hciArray addObject:a5];
    goto LABEL_33;
  }
  uint64_t v30 = ATLLogObject();
  if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
  {
    int v31 = *(unsigned __int8 *)(v11 + 2);
    *(_DWORD *)buf = 67109120;
    LODWORD(v53) = v31;
    _os_log_impl(&dword_1CA552000, v30, OS_LOG_TYPE_ERROR, "Unknown interface type %u", buf, 8u);
  }

  uint64_t v32 = [[NSString alloc] initWithFormat:@"Unknown interface type %u", *(unsigned __int8 *)(v11 + 2)];
  uint64_t v15 = (void *)v32;
  if (a5)
  {
    id v33 = *a5;
    id v17 = (void *)MEMORY[0x1E4F28C58];
    if (*a5)
    {
      uint64_t v34 = *MEMORY[0x1E4F28A50];
      v40[0] = *MEMORY[0x1E4F28568];
      v40[1] = v34;
      v41[0] = v32;
      v41[1] = v33;
      uint64_t v19 = (void *)MEMORY[0x1E4F1C9E8];
      id v20 = v41;
      uint64_t v21 = v40;
      goto LABEL_28;
    }
    uint64_t v42 = *MEMORY[0x1E4F28568];
    uint64_t v43 = v32;
    uint64_t v19 = (void *)MEMORY[0x1E4F1C9E8];
    id v20 = &v43;
    uint64_t v21 = &v42;
LABEL_31:
    uint64_t v35 = 1;
    goto LABEL_32;
  }
LABEL_33:

  return a5;
}

- (id)parseDeselectEvent:(id)a3 withApplet:(id)a4 error:(id *)a5
{
  v51[1] = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  if ([v8 length] != 3)
  {
    id v16 = ATLLogObject();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 67109120;
      LODWORD(v41) = [v8 length];
      _os_log_impl(&dword_1CA552000, v16, OS_LOG_TYPE_ERROR, "Invalid eventData length %u", buf, 8u);
    }

    uint64_t v17 = [[NSString alloc] initWithFormat:@"Invalid eventData length %u", [v8 length]];
    uint64_t v18 = (void *)v17;
    if (!a5) {
      goto LABEL_24;
    }
    id v19 = *a5;
    id v20 = (void *)MEMORY[0x1E4F28C58];
    if (*a5)
    {
      uint64_t v21 = *MEMORY[0x1E4F28A50];
      v48[0] = *MEMORY[0x1E4F28568];
      v48[1] = v21;
      v49[0] = v17;
      v49[1] = v19;
      uint64_t v22 = (void *)MEMORY[0x1E4F1C9E8];
      int v23 = v49;
      uint64_t v24 = v48;
      uint64_t v25 = 2;
    }
    else
    {
      uint64_t v50 = *MEMORY[0x1E4F28568];
      v51[0] = v17;
      uint64_t v22 = (void *)MEMORY[0x1E4F1C9E8];
      int v23 = v51;
      uint64_t v24 = &v50;
      uint64_t v25 = 1;
    }
    v36 = [v22 dictionaryWithObjects:v23 forKeys:v24 count:v25];
    v37 = v20;
    uint64_t v38 = 6;
    goto LABEL_23;
  }
  uint64_t v10 = [v8 bytes];
  if (!*(unsigned char *)(v10 + 2))
  {
LABEL_25:
    id v13 = 0;
    goto LABEL_26;
  }
  uint64_t v11 = v10;
  if (*(unsigned char *)(v10 + 2) != 1)
  {
    uint64_t v26 = ATLLogObject();
    if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
    {
      int v27 = *(unsigned __int8 *)(v11 + 2);
      *(_DWORD *)buf = 67109120;
      LODWORD(v41) = v27;
      _os_log_impl(&dword_1CA552000, v26, OS_LOG_TYPE_ERROR, "Unknown interface type %u", buf, 8u);
    }

    uint64_t v28 = [[NSString alloc] initWithFormat:@"Unknown interface type %u", *(unsigned __int8 *)(v11 + 2)];
    uint64_t v18 = (void *)v28;
    if (!a5) {
      goto LABEL_24;
    }
    id v29 = *a5;
    uint64_t v30 = (void *)MEMORY[0x1E4F28C58];
    if (*a5)
    {
      uint64_t v31 = *MEMORY[0x1E4F28A50];
      v44[0] = *MEMORY[0x1E4F28568];
      v44[1] = v31;
      v45[0] = v28;
      v45[1] = v29;
      uint64_t v32 = (void *)MEMORY[0x1E4F1C9E8];
      id v33 = v45;
      uint64_t v34 = v44;
      uint64_t v35 = 2;
    }
    else
    {
      uint64_t v46 = *MEMORY[0x1E4F28568];
      uint64_t v47 = v28;
      uint64_t v32 = (void *)MEMORY[0x1E4F1C9E8];
      id v33 = &v47;
      uint64_t v34 = &v46;
      uint64_t v35 = 1;
    }
    v36 = [v32 dictionaryWithObjects:v33 forKeys:v34 count:v35];
    v37 = v30;
    uint64_t v38 = 3;
LABEL_23:
    *a5 = [v37 errorWithDomain:@"ATL" code:v38 userInfo:v36];

LABEL_24:
    goto LABEL_25;
  }
  v42[0] = @"EventType";
  v42[1] = @"appletIdentifier";
  v43[1] = v9;
  v43[2] = @"Contactless";
  v43[0] = @"DeselectEvent";
  v42[2] = @"Interface";
  v42[3] = @"Version";
  unsigned int v12 = [NSNumber numberWithUnsignedChar:*(unsigned __int8 *)(v10 + 1)];
  v42[4] = @"IgnoreRFEvents";
  v42[5] = @"DontWaitForEOT";
  v43[3] = v12;
  v43[4] = MEMORY[0x1E4F1CC38];
  v43[5] = MEMORY[0x1E4F1CC38];
  v43[6] = MEMORY[0x1E4F1CC28];
  v42[6] = @"RequiresPowerCycle";
  v42[7] = @"DelayExpressReentry";
  v43[7] = &unk_1F24E1CD8;
  id v13 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v43 forKeys:v42 count:8];

  uint64_t v14 = ATLLogObject();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 138412290;
    uint64_t v41 = v13;
    _os_log_impl(&dword_1CA552000, v14, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
  }

  [(NSMutableArray *)self->_hciArray addObject:v13];
  uint64_t v15 = ATLLogObject();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1CA552000, v15, OS_LOG_TYPE_DEBUG, "Starting 150 ms timer due to reception of DESELECT", buf, 2u);
  }

  -[ATLTimer startTimerWithDelay:]((uint64_t)self->_timer, 150.0);
LABEL_26:

  return v13;
}

- (id)parseEndEvent:(id)a3 withApplet:(id)a4 error:(id *)a5
{
  uint64_t v41 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  if ([v8 length] == 2)
  {
    uint64_t v10 = [v8 bytes];
    uint64_t v11 = !self->_errorTransaction << 6;
    if (self->_errorTransaction)
    {
      unsigned int v12 = ATLLogObject();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
      {
        errorCode = self->_errorCode;
        *(_DWORD *)buf = 138412290;
        uint64_t v38 = (uint64_t)errorCode;
        _os_log_impl(&dword_1CA552000, v12, OS_LOG_TYPE_DEFAULT, "*** Error occurred during transaction. SpecialEvents ErrorCode = %@", buf, 0xCu);
      }
    }
    v31[0] = @"EventType";
    v31[1] = @"appletIdentifier";
    v32[0] = @"EndEvent";
    v32[1] = v9;
    v31[2] = @"Version";
    uint64_t v14 = [NSNumber numberWithUnsignedChar:*(unsigned __int8 *)(v10 + 1)];
    v32[2] = v14;
    v32[3] = @"Contactless";
    v31[3] = @"Interface";
    v31[4] = @"didError";
    uint64_t v15 = [NSNumber numberWithBool:self->_errorTransaction];
    v32[4] = v15;
    v31[5] = @"result";
    id v16 = [NSNumber numberWithUnsignedShort:v11];
    v31[6] = @"type";
    v32[5] = v16;
    v32[6] = &unk_1F24E1CF0;
    uint64_t v17 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v32 forKeys:v31 count:7];

    uint64_t v18 = ATLLogObject();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 138412290;
      uint64_t v38 = (uint64_t)v17;
      _os_log_impl(&dword_1CA552000, v18, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
    }

    [(NSMutableArray *)self->_hciArray addObject:v17];
  }
  else
  {
    id v19 = ATLLogObject();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 134218240;
      uint64_t v38 = [v8 length];
      __int16 v39 = 2048;
      uint64_t v40 = 2;
      _os_log_impl(&dword_1CA552000, v19, OS_LOG_TYPE_ERROR, "End event length %zu (exp) %zu", buf, 0x16u);
    }

    uint64_t v20 = [[NSString alloc] initWithFormat:@"End event length %zu (exp) %zu", objc_msgSend(v8, "length"), 2];
    uint64_t v21 = (void *)v20;
    if (a5)
    {
      id v22 = *a5;
      int v23 = (void *)MEMORY[0x1E4F28C58];
      if (*a5)
      {
        uint64_t v24 = *MEMORY[0x1E4F28A50];
        v33[0] = *MEMORY[0x1E4F28568];
        v33[1] = v24;
        v34[0] = v20;
        v34[1] = v22;
        uint64_t v25 = (void *)MEMORY[0x1E4F1C9E8];
        uint64_t v26 = v34;
        int v27 = v33;
        uint64_t v28 = 2;
      }
      else
      {
        uint64_t v35 = *MEMORY[0x1E4F28568];
        uint64_t v36 = v20;
        uint64_t v25 = (void *)MEMORY[0x1E4F1C9E8];
        uint64_t v26 = &v36;
        int v27 = &v35;
        uint64_t v28 = 1;
      }
      id v29 = [v25 dictionaryWithObjects:v26 forKeys:v27 count:v28];
      *a5 = [v23 errorWithDomain:@"ATL" code:3 userInfo:v29];
    }
    uint64_t v17 = 0;
  }

  return v17;
}

- (id)generateEndEventFromHCI
{
  uint64_t v38 = *MEMORY[0x1E4F143B8];
  id v3 = ATLLogObject();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1CA552000, v3, OS_LOG_TYPE_DEBUG, "Generating EndEventfromHCI ...", buf, 2u);
  }

  if (![(NSMutableArray *)self->_hciArray count])
  {
    uint64_t v18 = ATLLogObject();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1CA552000, v18, OS_LOG_TYPE_DEFAULT, "HCI Array provided does not contain HCI events", buf, 2u);
    }
    id v22 = 0;
    goto LABEL_24;
  }
  if (self->_appletAID)
  {
    long long v27 = 0u;
    long long v28 = 0u;
    long long v25 = 0u;
    long long v26 = 0u;
    v4 = self->_hciArray;
    uint64_t v5 = [(NSMutableArray *)v4 countByEnumeratingWithState:&v25 objects:v37 count:16];
    if (v5)
    {
      uint64_t v7 = v5;
      uint64_t v8 = *(void *)v26;
      *(void *)&long long v6 = 138412290;
      long long v24 = v6;
      do
      {
        for (uint64_t i = 0; i != v7; ++i)
        {
          if (*(void *)v26 != v8) {
            objc_enumerationMutation(v4);
          }
          uint64_t v10 = *(NSNumber **)(*((void *)&v25 + 1) + 8 * i);
          uint64_t v11 = ATLLogObject();
          if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
          {
            *(_DWORD *)buf = v24;
            uint64_t v36 = v10;
            _os_log_impl(&dword_1CA552000, v11, OS_LOG_TYPE_DEBUG, "--> %@", buf, 0xCu);
          }
        }
        uint64_t v7 = [(NSMutableArray *)v4 countByEnumeratingWithState:&v25 objects:v37 count:16];
      }
      while (v7);
    }

    uint64_t v12 = !self->_errorTransaction << 6;
    if (self->_errorTransaction)
    {
      id v13 = ATLLogObject();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
      {
        errorCode = self->_errorCode;
        *(_DWORD *)buf = 138412290;
        uint64_t v36 = errorCode;
        _os_log_impl(&dword_1CA552000, v13, OS_LOG_TYPE_DEFAULT, "*** Error occurred during transaction. SpecialEvents ErrorCode = %@", buf, 0xCu);
      }
    }
    if (!self->_transactionDetailRaw)
    {
      uint64_t v15 = [MEMORY[0x1E4F1C9B8] dataWithHexString:@"010000"];
      transactionDetailRaw = self->_transactionDetailRaw;
      self->_transactionDetailRaw = v15;
    }
    v33[0] = @"EventType";
    v33[1] = @"appletIdentifier";
    appletAID = self->_appletAID;
    v34[0] = @"EndEvent";
    v34[1] = appletAID;
    void v33[2] = @"Version";
    v33[3] = @"Interface";
    void v34[2] = &unk_1F24E1D08;
    v34[3] = @"Contactless";
    v33[4] = @"didError";
    uint64_t v18 = [NSNumber numberWithBool:self->_errorTransaction v24, (void)v25];
    v34[4] = v18;
    v33[5] = @"result";
    id v19 = [NSNumber numberWithUnsignedShort:v12];
    v34[5] = v19;
    v34[6] = &unk_1F24E1CF0;
    v33[6] = @"type";
    v33[7] = @"parsedInfo";
    id v29 = @"TypeDetailRaw";
    uint64_t v30 = self->_transactionDetailRaw;
    uint64_t v31 = @"Transaction";
    uint64_t v20 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v30 forKeys:&v29 count:1];
    uint64_t v32 = v20;
    uint64_t v21 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v32 forKeys:&v31 count:1];
    v34[7] = v21;
    id v22 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v34 forKeys:v33 count:8];

LABEL_24:
    goto LABEL_26;
  }
  id v22 = 0;
LABEL_26:

  return v22;
}

- (id)generateContactEndEvent:(id)a3 withDidError:(BOOL)a4
{
  BOOL v4 = a4;
  uint64_t v40 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  uint64_t v7 = ATLLogObject();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1CA552000, v7, OS_LOG_TYPE_DEBUG, "Generating Contact EndEvent ...", buf, 2u);
  }
  long long v26 = v6;

  hciArray = self->_hciArray;
  if (!hciArray || ![(NSMutableArray *)hciArray count])
  {
    id v9 = ATLLogObject();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1CA552000, v9, OS_LOG_TYPE_DEBUG, "HCI Array provided does not contain HCI events (data presumed cleared)", buf, 2u);
    }
  }
  long long v29 = 0u;
  long long v30 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  uint64_t v10 = self->_hciArray;
  uint64_t v11 = [(NSMutableArray *)v10 countByEnumeratingWithState:&v27 objects:v39 count:16];
  if (v11)
  {
    uint64_t v12 = v11;
    uint64_t v13 = *(void *)v28;
    do
    {
      for (uint64_t i = 0; i != v12; ++i)
      {
        if (*(void *)v28 != v13) {
          objc_enumerationMutation(v10);
        }
        uint64_t v15 = *(void **)(*((void *)&v27 + 1) + 8 * i);
        id v16 = ATLLogObject();
        if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 138412290;
          uint64_t v38 = v15;
          _os_log_impl(&dword_1CA552000, v16, OS_LOG_TYPE_DEBUG, "--> %@", buf, 0xCu);
        }
      }
      uint64_t v12 = [(NSMutableArray *)v10 countByEnumeratingWithState:&v27 objects:v39 count:16];
    }
    while (v12);
  }

  uint64_t v17 = [MEMORY[0x1E4F1C9B8] dataWithHexString:@"020000"];
  v35[0] = @"EventType";
  v35[1] = @"appletIdentifier";
  v36[0] = @"EndEvent";
  v36[1] = v26;
  v35[2] = @"Version";
  v35[3] = @"Interface";
  v36[2] = &unk_1F24E1D08;
  v36[3] = @"Contact";
  v35[4] = @"didError";
  uint64_t v18 = [NSNumber numberWithBool:v4];
  v36[4] = v18;
  v35[5] = @"result";
  if (v4) {
    uint64_t v19 = 0;
  }
  else {
    uint64_t v19 = 64;
  }
  uint64_t v20 = [NSNumber numberWithUnsignedShort:v19];
  v36[5] = v20;
  v36[6] = &unk_1F24E1D20;
  v35[6] = @"type";
  v35[7] = @"parsedInfo";
  uint64_t v32 = v17;
  id v33 = @"Transaction";
  uint64_t v31 = @"TypeDetailRaw";
  uint64_t v21 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v32 forKeys:&v31 count:1];
  uint64_t v34 = v21;
  id v22 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v34 forKeys:&v33 count:1];
  v36[7] = v22;
  int v23 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v36 forKeys:v35 count:8];

  long long v24 = ATLLogObject();
  if (os_log_type_enabled(v24, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 138412290;
    uint64_t v38 = v23;
    _os_log_impl(&dword_1CA552000, v24, OS_LOG_TYPE_DEBUG, "EndEvent (Contact) %@", buf, 0xCu);
  }

  return v23;
}

- (id)GetAppletProperties:(id)a3 withPackage:(id)a4 withModule:(id)a5 withTransceiver:(id)a6 withError:(id *)a7
{
  v10[2] = *MEMORY[0x1E4F143B8];
  v9[0] = @"Supported";
  v9[1] = @"DelayExpressReentry";
  v10[0] = MEMORY[0x1E4F1CC38];
  v10[1] = &unk_1F24E1CD8;
  uint64_t v7 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v10, v9, 2, a6, a7];

  return v7;
}

- (id)processEndOfTransaction:(id)a3 withApplet:(id)a4 withPackage:(id)a5 withModule:(id)a6 withError:(id *)a7
{
  v24[1] = *MEMORY[0x1E4F143B8];
  uint64_t v8 = ATLLogObject();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)uint64_t v20 = 0;
    _os_log_impl(&dword_1CA552000, v8, OS_LOG_TYPE_ERROR, "Atlas decoder doesn't expect processEndOfTransaction", v20, 2u);
  }

  uint64_t v9 = [[NSString alloc] initWithFormat:@"Atlas decoder doesn't expect processEndOfTransaction"];
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
      id v16 = v21;
      uint64_t v17 = 2;
    }
    else
    {
      uint64_t v23 = *MEMORY[0x1E4F28568];
      v24[0] = v9;
      uint64_t v14 = (void *)MEMORY[0x1E4F1C9E8];
      uint64_t v15 = v24;
      id v16 = &v23;
      uint64_t v17 = 1;
    }
    uint64_t v18 = [v14 dictionaryWithObjects:v15 forKeys:v16 count:v17];
    *a7 = [v12 errorWithDomain:@"ATL" code:7 userInfo:v18];
  }
  return 0;
}

+ (id)DecodeTransactionE1TLV:(id *)a3 error:(id *)a4
{
  v58[1] = *MEMORY[0x1E4F143B8];
  unint64_t v39 = 0;
  uint64_t v40 = 0;
  uint64_t v41 = 0;
  uint64_t v5 = DERDecodeItemCtx((uint64_t)a3, &v39);
  if (v5 || v39 != 0xE000000000000001)
  {
    uint64_t v18 = ATLLogObject();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)uint64_t v50 = 67109376;
      *(_DWORD *)&v50[4] = v5;
      *(_WORD *)&v50[8] = 2048;
      *(void *)&v50[10] = v39;
      _os_log_impl(&dword_1CA552000, v18, OS_LOG_TYPE_ERROR, "Failed to decode E1 tag %d or wrong tag 0x%llx", v50, 0x12u);
    }

    id v19 = [NSString alloc];
    uint64_t v20 = [v19 initWithFormat:@"Failed to decode E1 tag %d or wrong tag 0x%llx", v5, v39];
    uint64_t v21 = (void *)v20;
    if (!a4) {
      goto LABEL_33;
    }
    id v22 = *a4;
    uint64_t v23 = (void *)MEMORY[0x1E4F28C58];
    if (*a4)
    {
      uint64_t v24 = *MEMORY[0x1E4F28A50];
      v55[0] = *MEMORY[0x1E4F28568];
      v55[1] = v24;
      v56[0] = v20;
      v56[1] = v22;
      long long v25 = (void *)MEMORY[0x1E4F1C9E8];
      long long v26 = v56;
      long long v27 = v55;
LABEL_20:
      uint64_t v32 = 2;
LABEL_32:
      v37 = [v25 dictionaryWithObjects:v26 forKeys:v27 count:v32];
      *a4 = [v23 errorWithDomain:@"ATL" code:3 userInfo:v37];

LABEL_33:
      a4 = 0;
      goto LABEL_34;
    }
    uint64_t v57 = *MEMORY[0x1E4F28568];
    v58[0] = v20;
    long long v25 = (void *)MEMORY[0x1E4F1C9E8];
    long long v26 = v58;
    long long v27 = &v57;
LABEL_31:
    uint64_t v32 = 1;
    goto LABEL_32;
  }
  if (!v41)
  {
    long long v28 = ATLLogObject();
    if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)uint64_t v50 = 0;
      _os_log_impl(&dword_1CA552000, v28, OS_LOG_TYPE_ERROR, "Missing E1 content", v50, 2u);
    }

    uint64_t v29 = [[NSString alloc] initWithFormat:@"Missing E1 content"];
    uint64_t v21 = (void *)v29;
    if (!a4) {
      goto LABEL_33;
    }
    id v30 = *a4;
    uint64_t v23 = (void *)MEMORY[0x1E4F28C58];
    if (*a4)
    {
      uint64_t v31 = *MEMORY[0x1E4F28A50];
      v51[0] = *MEMORY[0x1E4F28568];
      v51[1] = v31;
      v52[0] = v29;
      v52[1] = v30;
      long long v25 = (void *)MEMORY[0x1E4F1C9E8];
      long long v26 = v52;
      long long v27 = v51;
      goto LABEL_20;
    }
    uint64_t v53 = *MEMORY[0x1E4F28568];
    uint64_t v54 = v29;
    long long v25 = (void *)MEMORY[0x1E4F1C9E8];
    long long v26 = &v54;
    long long v27 = &v53;
    goto LABEL_31;
  }
  memset(v50, 0, 32);
  uint64_t v6 = DERParseSequenceSpec((uint64_t)&v40, (uint64_t)&AtlasTransactionEventE1ContentsSpec, (char *)v50, 0x20uLL);
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = ATLLogObject();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 67109120;
      int v49 = v7;
      _os_log_impl(&dword_1CA552000, v8, OS_LOG_TYPE_ERROR, "Failed to validate transaction event contents %d", buf, 8u);
    }

    uint64_t v9 = [[NSString alloc] initWithFormat:@"Failed to validate transaction event contents %d", v7];
    uint64_t v10 = (AtlasRecordData *)v9;
    if (a4)
    {
      id v11 = *a4;
      uint64_t v12 = (void *)MEMORY[0x1E4F28C58];
      if (*a4)
      {
        uint64_t v13 = *MEMORY[0x1E4F28A50];
        v44[0] = *MEMORY[0x1E4F28568];
        v44[1] = v13;
        v45[0] = v9;
        v45[1] = v11;
        uint64_t v14 = (void *)MEMORY[0x1E4F1C9E8];
        uint64_t v15 = v45;
        id v16 = v44;
        uint64_t v17 = 2;
      }
      else
      {
        uint64_t v46 = *MEMORY[0x1E4F28568];
        uint64_t v47 = v9;
        uint64_t v14 = (void *)MEMORY[0x1E4F1C9E8];
        uint64_t v15 = &v47;
        id v16 = &v46;
        uint64_t v17 = 1;
      }
      uint64_t v36 = [v14 dictionaryWithObjects:v15 forKeys:v16 count:v17];
      *a4 = [v12 errorWithDomain:@"ATL" code:3 userInfo:v36];

      a4 = 0;
    }
  }
  else
  {
    uint64_t v10 = objc_alloc_init(AtlasRecordData);
    [(AtlasRecordData *)v10 setSfi:**(unsigned char **)v50];
    [(AtlasRecordData *)v10 setRecordId:*(unsigned __int8 *)(*(void *)v50 + 1)];
    id v33 = [MEMORY[0x1E4F1C9B8] dataWithDERItem:&v50[16]];
    [(AtlasRecordData *)v10 setContent:v33];

    if ([(AtlasRecordData *)v10 sfi] >= 0x1F)
    {
      uint64_t v34 = ATLLogObject();
      if (os_log_type_enabled(v34, OS_LOG_TYPE_DEFAULT))
      {
        int v35 = [(AtlasRecordData *)v10 sfi];
        *(_DWORD *)buf = 67109120;
        int v49 = v35;
        _os_log_impl(&dword_1CA552000, v34, OS_LOG_TYPE_DEFAULT, "Unexpected SFI (0x%02X) provided in TransactionEvent", buf, 8u);
      }
    }
    uint64_t v42 = @"recordData";
    uint64_t v43 = v10;
    a4 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v43 forKeys:&v42 count:1];
  }

LABEL_34:

  return a4;
}

- (id)getServiceProviderData:(id)a3 withPackage:(id)a4 withModule:(id)a5 withPublicKey:(id)a6 withEncryptionScheme:(id)a7 withTransceiver:(id)a8 withError:(id *)a9
{
  uint64_t v13 = a9;
  v113[1] = *MEMORY[0x1E4F143B8];
  id v14 = a6;
  id v15 = a7;
  id v16 = a3;
  uint64_t v17 = +[TransceiverWrapper withTransceiver:a8];
  uint64_t v18 = [MEMORY[0x1E4F1CA60] dictionaryWithCapacity:2];
  id v19 = [MEMORY[0x1E4F1CA60] dictionaryWithCapacity:3];
  uint64_t v20 = [MEMORY[0x1E4F1C9B8] dataWithHexString:v16];

  uint64_t v21 = SelectByNameCmd(v20);

  id v105 = 0;
  id v22 = [v17 transceiveAndCheckSW:v21 error:&v105];
  id v23 = v105;
  if (!v23)
  {
    v90 = v22;
    if (!v22)
    {
      v61 = ATLLogObject();
      if (os_log_type_enabled(v61, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1CA552000, v61, OS_LOG_TYPE_ERROR, "No response to SELECT received", buf, 2u);
      }

      uint64_t v62 = [[NSString alloc] initWithFormat:@"No response to SELECT received"];
      uint64_t v63 = (void *)v62;
      if (a9)
      {
        uint64_t v64 = v21;
        id v65 = *a9;
        v66 = (void *)MEMORY[0x1E4F28C58];
        if (*a9)
        {
          uint64_t v67 = *MEMORY[0x1E4F28A50];
          v110[0] = *MEMORY[0x1E4F28568];
          v110[1] = v67;
          v111[0] = v62;
          v111[1] = v65;
          v68 = (void *)MEMORY[0x1E4F1C9E8];
          v69 = v111;
          v70 = v110;
          uint64_t v71 = 2;
        }
        else
        {
          uint64_t v112 = *MEMORY[0x1E4F28568];
          v113[0] = v62;
          v68 = (void *)MEMORY[0x1E4F1C9E8];
          v69 = v113;
          v70 = &v112;
          uint64_t v71 = 1;
        }
        v72 = [v68 dictionaryWithObjects:v69 forKeys:v70 count:v71];
        *a9 = [v66 errorWithDomain:@"ATL" code:5 userInfo:v72];

        uint64_t v21 = v64;
      }

      id v24 = 0;
      uint64_t v13 = 0;
      goto LABEL_89;
    }
    v75 = v21;
    [v22 base64EncodedStringWithOptions:0];
    v26 = long long v25 = v22;
    [v19 setObject:v26 forKeyedSubscript:@"answerSelectApplication"];

    uint64_t v79 = [(AtlasDecoder *)self getCardIdFromSelectResponse:v25];
    long long v27 = [v79 asHexString];
    [v18 setObject:v27 forKeyedSubscript:@"cardId"];

    uint64_t v78 = [(AtlasDecoder *)self SelectRemoteTicketingCmd];
    v77 = [v17 transceiveAndCheckSW:error:];
    long long v28 = [v77 base64EncodedStringWithOptions:0];
    [v19 setObject:v28 forKeyedSubscript:@"answerSelectFileRT"];

    uint64_t v29 = [MEMORY[0x1E4F1CA48] arrayWithCapacity:11];
    id v104 = 0;
    uint64_t v30 = [(AtlasDecoder *)self readPartnerRecords:v17 sfi:7 count:1 error:&v104];
    id v31 = v104;
    v80 = (void *)v30;
    if (v31)
    {
      uint64_t v32 = ATLLogObject();
      if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 67109120;
        int v109 = 7;
        _os_log_impl(&dword_1CA552000, v32, OS_LOG_TYPE_ERROR, "Failed to read Environment File SFI %d", buf, 8u);
      }

      uint64_t v30 = (uint64_t)v80;
    }
    if (v30) {
      [v29 addObject:v30];
    }
    id v103 = v31;
    v88 = [(AtlasDecoder *)self readPartnerRecords:v17 sfi:8 count:3 error:&v103];
    id v33 = v103;

    if (v33)
    {
      uint64_t v34 = ATLLogObject();
      if (os_log_type_enabled(v34, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 67109120;
        int v109 = 8;
        _os_log_impl(&dword_1CA552000, v34, OS_LOG_TYPE_ERROR, "Failed to read Transaction History SFI %d", buf, 8u);
      }
    }
    if (v88) {
      [v29 addObject:];
    }
    id v102 = v33;
    v87 = [(AtlasDecoder *)self readPartnerRecords:v17 sfi:9 count:4 error:&v102];
    id v35 = v102;

    if (v35)
    {
      uint64_t v36 = ATLLogObject();
      if (os_log_type_enabled(v36, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 67109120;
        int v109 = 9;
        _os_log_impl(&dword_1CA552000, v36, OS_LOG_TYPE_ERROR, "Failed to read Contracts File SFI %d", buf, 8u);
      }
    }
    if (v87) {
      [v29 addObject:];
    }
    id v101 = v35;
    uint64_t v86 = [(AtlasDecoder *)self readPartnerRecords:v17 sfi:10 count:1 error:&v101];
    id v37 = v101;

    if (v37)
    {
      uint64_t v38 = ATLLogObject();
      if (os_log_type_enabled(v38, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 67109120;
        int v109 = 10;
        _os_log_impl(&dword_1CA552000, v38, OS_LOG_TYPE_ERROR, "Failed to read Counters File SFI %d", buf, 8u);
      }
    }
    if (v86) {
      [v29 addObject:];
    }
    id v100 = v37;
    v85 = [(AtlasDecoder *)self readPartnerRecords:v17 sfi:11 count:1 error:&v100];
    id v39 = v100;

    if (v39)
    {
      uint64_t v40 = ATLLogObject();
      if (os_log_type_enabled(v40, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 67109120;
        int v109 = 11;
        _os_log_impl(&dword_1CA552000, v40, OS_LOG_TYPE_ERROR, "Failed to read Counters File SFI %d", buf, 8u);
      }
    }
    if (v85) {
      [v29 addObject:];
    }
    id v99 = v39;
    v84 = [(AtlasDecoder *)self readPartnerRecords:v17 sfi:12 count:1 error:&v99];
    id v41 = v99;

    if (v41)
    {
      uint64_t v42 = ATLLogObject();
      if (os_log_type_enabled(v42, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 67109120;
        int v109 = 12;
        _os_log_impl(&dword_1CA552000, v42, OS_LOG_TYPE_ERROR, "Failed to read Counters File SFI %d", buf, 8u);
      }
    }
    if (v84) {
      [v29 addObject:];
    }
    id v98 = v41;
    uint64_t v83 = [(AtlasDecoder *)self readPartnerRecords:v17 sfi:13 count:1 error:&v98];
    id v43 = v98;

    if (v43)
    {
      uint64_t v44 = ATLLogObject();
      if (os_log_type_enabled(v44, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 67109120;
        int v109 = 13;
        _os_log_impl(&dword_1CA552000, v44, OS_LOG_TYPE_ERROR, "Failed to read Counters File SFI %d", buf, 8u);
      }
    }
    if (v83) {
      [v29 addObject:];
    }
    id v97 = v43;
    uint64_t v82 = [(AtlasDecoder *)self readPartnerRecords:v17 sfi:6 count:4 error:&v97];
    id v45 = v97;

    if (v45)
    {
      uint64_t v46 = ATLLogObject();
      if (os_log_type_enabled(v46, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 67109120;
        int v109 = 6;
        _os_log_impl(&dword_1CA552000, v46, OS_LOG_TYPE_ERROR, "Failed to read Contract Extentions File SFI %d", buf, 8u);
      }
    }
    if (v82) {
      [v29 addObject:];
    }
    v91 = v29;
    id v96 = v45;
    uint64_t v47 = [(AtlasDecoder *)self readPartnerRecords:v17 sfi:29 count:3 error:&v96];
    id v48 = v96;

    if (v48)
    {
      int v49 = ATLLogObject();
      if (os_log_type_enabled(v49, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 67109120;
        int v109 = 29;
        _os_log_impl(&dword_1CA552000, v49, OS_LOG_TYPE_ERROR, "Failed to read Special Events File SFI %d", buf, 8u);
      }
    }
    v89 = v19;
    if (v47) {
      [v91 addObject:v47];
    }
    id v95 = v48;
    v81 = [(AtlasDecoder *)self readPartnerRecords:v17 sfi:30 count:1 error:&v95];
    id v50 = v95;

    if (v50)
    {
      uint64_t v51 = ATLLogObject();
      if (os_log_type_enabled(v51, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 67109120;
        int v109 = 30;
        _os_log_impl(&dword_1CA552000, v51, OS_LOG_TYPE_ERROR, "Failed to read Best Contracts SFI %d", buf, 8u);
      }
    }
    v76 = (void *)v47;
    v52 = v91;
    if (v81) {
      [v91 addObject:];
    }
    id v94 = v50;
    uint64_t v53 = -[AtlasDecoder readPartnerRecords:sfi:count:error:](self, "readPartnerRecords:sfi:count:error:", v17, 25, 1, &v94, a9);
    id v54 = v94;

    if (v54)
    {
      uint64_t v55 = ATLLogObject();
      if (os_log_type_enabled(v55, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 67109120;
        int v109 = 25;
        _os_log_impl(&dword_1CA552000, v55, OS_LOG_TYPE_ERROR, "Failed to read All Counters SFI %d", buf, 8u);
      }

      v52 = v91;
    }
    if (v53) {
      [v52 addObject:v53];
    }
    [v89 setObject:v52 forKeyedSubscript:@"recordFiles"];
    [v18 setObject:v89 forKeyedSubscript:@"cardBinaryrecord"];
    v106 = @"cardImage";
    v107 = v18;
    uint64_t v56 = v18;
    uint64_t v57 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v107 forKeys:&v106 count:1];
    id v93 = v54;
    uint64_t v58 = [MEMORY[0x1E4F28D90] dataWithJSONObject:v57 options:1 error:&v93];
    id v24 = v93;

    if (v14)
    {
      id v92 = v24;
      id v59 = v14;
      uint64_t v13 = +[OpaqueDataService serializedHPKEWithData:v58 publicKey:v14 scheme:v15 error:&v92];
      id v60 = v92;

      if (v74)
      {
        uint64_t v18 = v56;
        if (v60)
        {
          id v24 = v60;
          *__int16 v74 = v24;
        }
        else
        {
          id v24 = 0;
        }
        id v14 = v59;
        goto LABEL_85;
      }
      id v24 = v60;
      id v14 = v59;
    }
    else
    {
      uint64_t v13 = v58;
    }
    uint64_t v18 = v56;
LABEL_85:
    uint64_t v21 = v75;

    id v19 = v89;
LABEL_89:
    id v22 = v90;
    goto LABEL_90;
  }
  id v24 = v23;
  if (a9)
  {
    id v24 = v23;
    uint64_t v13 = 0;
    *a9 = v24;
  }
LABEL_90:

  return v13;
}

- (id)getServiceProviderData:(id)a3 withPackage:(id)a4 withModule:(id)a5 withTransceiver:(id)a6 withError:(id *)a7
{
  return [(AtlasDecoder *)self getServiceProviderData:a3 withPackage:a4 withModule:a5 withPublicKey:0 withEncryptionScheme:0 withTransceiver:a6 withError:a7];
}

- (id)getAppletStateAndHistory:(id)a3 withApplet:(id)a4 withPackage:(id)a5 withModule:(id)a6 withError:(id *)a7
{
  uint64_t v101 = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  id v11 = [MEMORY[0x1E4F1C9B8] dataWithHexString:a4];
  uint64_t v12 = SelectByNameCmd(v11);

  id v94 = 0;
  uint64_t v13 = [v10 transceiveAndCheckSW:v12 error:&v94];
  id v14 = v94;
  id v15 = v14;
  if (v13)
  {
    id v16 = [MEMORY[0x1E4F1CA60] dictionaryWithCapacity:5];
    uint64_t v17 = [MEMORY[0x1E4F1CA60] dictionaryWithCapacity:5];
    id v93 = v15;
    uint64_t v18 = [(AtlasDecoder *)self readAndDecodeContracts:v10 sfi:9 count:4 error:&v93];
    id v19 = v93;

    uint64_t v79 = v18;
    if (v19)
    {
      if (a7)
      {
        id v19 = v19;
        uint64_t v20 = 0;
        *a7 = v19;
      }
      else
      {
        uint64_t v20 = 0;
      }
    }
    else
    {
      uint64_t v21 = (void *)[v18 copy];
      [v16 setObject:v21 forKeyedSubscript:@"ContractList"];

      id v92 = 0;
      [(AtlasDecoder *)self readAndDecodeHistory:v10 sfi:8 count:10 error:&v92];
      v23 = id v22 = self;
      id v24 = v92;
      if (v24)
      {
        id v19 = v24;
        if (a7)
        {
          id v19 = v24;
          uint64_t v20 = 0;
          *a7 = v19;
        }
        else
        {
          uint64_t v20 = 0;
        }
      }
      else
      {
        [v16 setObject:v23 forKeyedSubscript:@"TransactionHistory"];
        uint64_t v76 = [(AtlasDecoder *)v22 parseHistory:v23 withContractList:v18];
        uint64_t v78 = [MEMORY[0x1E4F1CA48] arrayWithCapacity:4];
        id v91 = 0;
        uint64_t v25 = [(AtlasDecoder *)v22 readAndDecodeBestContractList:v10 sfi:30 error:&v91];
        id v26 = v91;
        v75 = (void *)v25;
        if (v26)
        {
          id v19 = v26;
          if (a7)
          {
            id v19 = v26;
            uint64_t v20 = 0;
            *a7 = v19;
          }
          else
          {
            uint64_t v20 = 0;
          }
          id v59 = (void *)v76;
        }
        else
        {
          v69 = v22;
          v70 = a7;
          uint64_t v71 = v17;
          v73 = v13;
          __int16 v74 = v12;
          v72 = v16;
          [v16 setObject:v25 forKeyedSubscript:@"BestContractList"];
          long long v27 = +[AtlasDecoder getUnvalidatableContracts:v25];
          long long v28 = ATLLogObject();
          if (os_log_type_enabled(v28, OS_LOG_TYPE_DEBUG))
          {
            *(_DWORD *)buf = 138412290;
            id v100 = v27;
            _os_log_impl(&dword_1CA552000, v28, OS_LOG_TYPE_DEBUG, "unValidatableContracts: %@", buf, 0xCu);
          }

          long long v89 = 0u;
          long long v90 = 0u;
          long long v87 = 0u;
          long long v88 = 0u;
          uint64_t v29 = v79;
          id obj = (id)[v79 copy];
          uint64_t v30 = [obj countByEnumeratingWithState:&v87 objects:v98 count:16];
          v77 = v27;
          if (v30)
          {
            uint64_t v31 = v30;
            unsigned __int16 v32 = 0;
            uint64_t v81 = *(void *)v88;
            do
            {
              uint64_t v33 = 0;
              do
              {
                if (*(void *)v88 != v81) {
                  objc_enumerationMutation(obj);
                }
                uint64_t v34 = *(void **)(*((void *)&v87 + 1) + 8 * v33);
                ++v32;
                id v35 = ATLLogObject();
                if (os_log_type_enabled(v35, OS_LOG_TYPE_DEBUG))
                {
                  *(_DWORD *)buf = 67109120;
                  LODWORD(v100) = v32;
                  _os_log_impl(&dword_1CA552000, v35, OS_LOG_TYPE_DEBUG, "contractPointerId %d", buf, 8u);
                }

                uint64_t v36 = ATLLogObject();
                if (os_log_type_enabled(v36, OS_LOG_TYPE_DEBUG))
                {
                  id v37 = [v34 objectForKeyedSubscript:@"ContractBitmap"];
                  *(_DWORD *)buf = 138412290;
                  id v100 = v37;
                  _os_log_impl(&dword_1CA552000, v36, OS_LOG_TYPE_DEBUG, "ContractBitmap %@", buf, 0xCu);
                }
                uint64_t v38 = ATLLogObject();
                if (os_log_type_enabled(v38, OS_LOG_TYPE_DEBUG))
                {
                  id v39 = [v34 objectForKeyedSubscript:@"ContractStatus"];
                  *(_DWORD *)buf = 138412290;
                  id v100 = v39;
                  _os_log_impl(&dword_1CA552000, v38, OS_LOG_TYPE_DEBUG, "ContractStatus %@", buf, 0xCu);
                }
                uint64_t v40 = ATLLogObject();
                if (os_log_type_enabled(v40, OS_LOG_TYPE_DEBUG))
                {
                  id v41 = [v34 objectForKeyedSubscript:@"ContractTariff"];
                  *(_DWORD *)buf = 138412290;
                  id v100 = v41;
                  _os_log_impl(&dword_1CA552000, v40, OS_LOG_TYPE_DEBUG, "ContractTariff %@", buf, 0xCu);
                }
                uint64_t v42 = ATLLogObject();
                if (os_log_type_enabled(v42, OS_LOG_TYPE_DEBUG))
                {
                  id v43 = [v34 objectForKeyedSubscript:@"ContractCounters"];
                  *(_DWORD *)buf = 138412290;
                  id v100 = v43;
                  _os_log_impl(&dword_1CA552000, v42, OS_LOG_TYPE_DEBUG, "ContractCounters %@", buf, 0xCu);
                }
                uint64_t v44 = ATLLogObject();
                if (os_log_type_enabled(v44, OS_LOG_TYPE_DEBUG))
                {
                  id v45 = [v34 objectForKeyedSubscript:@"ContractValidityJourneysData"];
                  *(_DWORD *)buf = 138412290;
                  id v100 = v45;
                  _os_log_impl(&dword_1CA552000, v44, OS_LOG_TYPE_DEBUG, "ContractValidityJourneysData %@", buf, 0xCu);
                }
                uint64_t v46 = [v34 objectForKeyedSubscript:@"ContractStatus"];
                uint64_t v47 = [v46 integerValue];

                if (v47 == 1
                  && ([NSNumber numberWithUnsignedShort:v32],
                      id v48 = objc_claimAutoreleasedReturnValue(),
                      [v27 objectForKeyedSubscript:v48],
                      int v49 = objc_claimAutoreleasedReturnValue(),
                      v49,
                      v48,
                      !v49))
                {
                  id v50 = [v34 objectForKeyedSubscript:@"ContractValidityJourneysData"];
                  uint64_t v51 = [v50 objectForKeyedSubscript:@"ContractCounterStructure"];

                  if ([v51 integerValue] == 12)
                  {
                    v52 = [v34 objectForKeyedSubscript:@"ContractCounters"];
                    uint64_t v53 = [v52 objectForKeyedSubscript:@"CounterContractCount"];

                    id v54 = [v34 objectForKeyedSubscript:@"CommutePlanIdentifier"];
                    uint64_t v55 = +[AtlasDecoder amountDictionaryWithAmount:v53 withIdentifier:v54 usingAmountKey:@"Balance" usingCurrencyKey:@"BalanceCurrency" usingExponentKey:@"BalanceCurrencyExponent" usingIdentifierKey:@"BalanceIdentifier"];

                    uint64_t v29 = v79;
                    [v78 addObject:v55];
                    [v79 removeObject:v34];

                    long long v27 = v77;
                  }
                }
                else
                {
                  [v29 removeObject:v34];
                }
                ++v33;
              }
              while (v31 != v33);
              uint64_t v56 = [obj countByEnumeratingWithState:&v87 objects:v98 count:16];
              uint64_t v31 = v56;
            }
            while (v56);
          }

          long long v85 = 0u;
          long long v86 = 0u;
          long long v83 = 0u;
          long long v84 = 0u;
          id v57 = v29;
          uint64_t v58 = [v57 countByEnumeratingWithState:&v83 objects:v97 count:16];
          uint64_t v17 = v71;
          id v59 = (void *)v76;
          if (v58)
          {
            uint64_t v60 = v58;
            uint64_t v61 = *(void *)v84;
            do
            {
              for (uint64_t i = 0; i != v60; ++i)
              {
                if (*(void *)v84 != v61) {
                  objc_enumerationMutation(v57);
                }
                [(AtlasDecoder *)v69 stripContract:*(void *)(*((void *)&v83 + 1) + 8 * i)];
              }
              uint64_t v60 = [v57 countByEnumeratingWithState:&v83 objects:v97 count:16];
            }
            while (v60);
          }

          [v71 setObject:v57 forKeyedSubscript:@"CommutePlans"];
          [v71 setObject:v78 forKeyedSubscript:@"Balances"];
          id v82 = 0;
          uint64_t v63 = [(AtlasDecoder *)v69 readAndDecodeEnvironment:v10 sfi:7 error:&v82];
          id v64 = v82;
          id v19 = v64;
          if (v64)
          {
            uint64_t v13 = v73;
            uint64_t v12 = v74;
            uint64_t v20 = 0;
            if (v70) {
              id *v70 = v64;
            }
          }
          else
          {
            id v65 = [v63 objectForKeyedSubscript:@"EnvApplicationEndDate"];

            uint64_t v13 = v73;
            if (v65)
            {
              v66 = [v63 objectForKeyedSubscript:@"EnvApplicationEndDate"];
              uint64_t v67 = +[AtlasDecoder getAbsoluteDateComponents:v66 withTime:0];
              [v71 setObject:v67 forKeyedSubscript:@"CardExpirationDate"];
            }
            v95[0] = @"State";
            v95[1] = @"TransactionHistory";
            v96[0] = v71;
            v96[1] = v76;
            uint64_t v20 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v96 forKeys:v95 count:2];
            uint64_t v12 = v74;
          }
          id v16 = v72;
        }
      }
    }
    id v15 = v19;
  }
  else if (a7)
  {
    id v15 = v14;
    uint64_t v20 = 0;
    *a7 = v15;
  }
  else
  {
    uint64_t v20 = 0;
  }

  return v20;
}

- (id)readAndDecodeContracts:(id)a3 sfi:(unsigned __int8)a4 count:(unsigned __int8)a5 error:(id *)a6
{
  unsigned int v6 = a5;
  uint64_t v7 = a4;
  v80[1] = *MEMORY[0x1E4F143B8];
  id v9 = a3;
  uint64_t v10 = [MEMORY[0x1E4F1CA48] arrayWithCapacity:v6];
  uint64_t v12 = (void *)v10;
  if (!v6)
  {
LABEL_43:
    id v45 = v12;
    goto LABEL_59;
  }
  int v13 = 0;
  *(void *)&long long v11 = 138412290;
  long long v59 = v11;
  id v65 = (void *)v10;
  id v66 = v9;
  unsigned int v63 = v7;
  unsigned int v64 = v6;
  uint64_t v62 = self;
  while (1)
  {
    int v14 = v13 + 1;
    id v72 = 0;
    id v15 = -[AtlasDecoder readRecord:sfi:index:recLength:error:](self, "readRecord:sfi:index:recLength:error:", v9, v7, (v13 + 1), 0, &v72, v59);
    id v16 = v72;
    uint64_t v17 = v16;
    if (!v16) {
      break;
    }
    if ([v16 code] != 9)
    {
      if (a6) {
        *a6 = v17;
      }
LABEL_57:

      goto LABEL_58;
    }
    uint64_t v18 = ATLLogObject();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 67109120;
      LODWORD(v74) = v13 + 1;
      _os_log_impl(&dword_1CA552000, v18, OS_LOG_TYPE_DEFAULT, "Contract record %d not found (unexpected)", buf, 8u);
    }
LABEL_42:

    int v13 = v14;
    if (v6 == v14) {
      goto LABEL_43;
    }
  }
  if ([v15 length] != 29)
  {
    uint64_t v46 = ATLLogObject();
    if (os_log_type_enabled(v46, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1CA552000, v46, OS_LOG_TYPE_ERROR, "Failed to decode Atlas record data", buf, 2u);
    }

    uint64_t v47 = [[NSString alloc] initWithFormat:@"Failed to decode Atlas record data"];
    id v48 = (void *)v47;
    if (a6)
    {
      id v49 = *a6;
      id v50 = (void *)MEMORY[0x1E4F28C58];
      if (*a6)
      {
        uint64_t v51 = *MEMORY[0x1E4F28A50];
        v77[0] = *MEMORY[0x1E4F28568];
        v77[1] = v51;
        v78[0] = v47;
        v78[1] = v49;
        v52 = (void *)MEMORY[0x1E4F1C9E8];
        uint64_t v53 = v78;
        id v54 = v77;
        uint64_t v55 = 2;
      }
      else
      {
        uint64_t v79 = *MEMORY[0x1E4F28568];
        v80[0] = v47;
        v52 = (void *)MEMORY[0x1E4F1C9E8];
        uint64_t v53 = v80;
        id v54 = &v79;
        uint64_t v55 = 1;
      }
      id v57 = [v52 dictionaryWithObjects:v53 forKeys:v54 count:v55];
      *a6 = [v50 errorWithDomain:@"ATL" code:8 userInfo:v57];
    }
    goto LABEL_57;
  }
  uint64_t v17 = +[AtlasDecoder decodeContractStructureFF:v15];
  id v19 = [NSNumber numberWithInt:(v13 + 1)];
  [v17 setObject:v19 forKeyedSubscript:@"ContractPointerNumber"];

  uint64_t v20 = [v17 objectForKeyedSubscript:@"ContractValidityJourneysData"];
  uint64_t v18 = v20;
  if (!v20)
  {
    id v24 = ATLLogObject();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 67109120;
      LODWORD(v74) = v13 + 1;
      id v26 = v24;
      long long v27 = "No validityJourneysData provided for contract %d";
LABEL_16:
      _os_log_impl(&dword_1CA552000, v26, OS_LOG_TYPE_DEFAULT, v27, buf, 8u);
    }
LABEL_17:
    id v22 = 0;
LABEL_18:

    uint64_t v28 = [v17 objectForKeyedSubscript:@"ContractValidityStartDate"];
    uint64_t v29 = [v17 objectForKeyedSubscript:@"ContractValidityStartTime"];
    uint64_t v30 = [v17 objectForKeyedSubscript:@"ContractValidityEndDate"];
    v70 = [v17 objectForKeyedSubscript:@"ContractValidityEndTime"];
    uint64_t v31 = ATLLogObject();
    if (os_log_type_enabled(v31, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 138412546;
      uint64_t v74 = v28;
      __int16 v75 = 2112;
      uint64_t v76 = v29;
      _os_log_impl(&dword_1CA552000, v31, OS_LOG_TYPE_DEBUG, "Contract Start Date/Time: %@ / %@", buf, 0x16u);
    }

    unsigned __int16 v32 = ATLLogObject();
    if (os_log_type_enabled(v32, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 138412546;
      uint64_t v74 = v30;
      __int16 v75 = 2112;
      uint64_t v76 = (uint64_t)v70;
      _os_log_impl(&dword_1CA552000, v32, OS_LOG_TYPE_DEBUG, "Contract End Date/Time: %@ / %@", buf, 0x16u);
    }

    v68 = v22;
    v69 = v15;
    uint64_t v67 = (void *)v30;
    if ([v22 integerValue] == 12)
    {
      uint64_t v33 = (void *)v28;
      uint64_t v34 = (void *)v29;
      id v35 = +[AtlasDecoder getAbsoluteDateComponents:v28 withTime:v29];
      uint64_t v36 = +[AtlasDecoder getAbsoluteDateComponents:v30 withTime:v70];
    }
    else
    {
      if ([v22 integerValue] == 3)
      {
        id v37 = [v17 objectForKeyedSubscript:@"ContractCounters"];
        uint64_t v38 = [v37 objectForKeyedSubscript:@"CounterCounterValidityEndDate"];

        uint64_t v61 = v38;
        if ([v38 integerValue])
        {
          id v39 = +[AtlasDecoder getAbsoluteDateComponentsWithDefaultMinutes:v38 withTime:0 withDefaultMinutes:&unk_1F24E1D38];
          uint64_t v40 = ATLLogObject();
          if (os_log_type_enabled(v40, OS_LOG_TYPE_DEBUG))
          {
            *(_DWORD *)buf = v59;
            uint64_t v74 = (uint64_t)v39;
            _os_log_impl(&dword_1CA552000, v40, OS_LOG_TYPE_DEBUG, "Overriding Contract Validity End from Counter: %@", buf, 0xCu);
          }
        }
        else
        {
          uint64_t v40 = ATLLogObject();
          if (os_log_type_enabled(v40, OS_LOG_TYPE_DEBUG))
          {
            *(_DWORD *)buf = v59;
            uint64_t v74 = 0;
            _os_log_impl(&dword_1CA552000, v40, OS_LOG_TYPE_DEBUG, "Contract Validity End from Counter not yet set: %@", buf, 0xCu);
          }
          id v39 = 0;
        }

        if (v28)
        {
          id v35 = +[AtlasDecoder getAbsoluteDateComponentsWithDefaultMinutes:v28 withTime:v29 withDefaultMinutes:&unk_1F24E1D20];
        }
        else
        {
          id v35 = 0;
        }
        uint64_t v34 = (void *)v29;
        uint64_t v33 = (void *)v28;

        goto LABEL_37;
      }
      uint64_t v33 = (void *)v28;
      uint64_t v34 = (void *)v29;
      id v35 = +[AtlasDecoder getAbsoluteDateComponentsWithDefaultMinutes:v28 withTime:v29 withDefaultMinutes:&unk_1F24E1D20];
      uint64_t v36 = +[AtlasDecoder getAbsoluteDateComponentsWithDefaultMinutes:v30 withTime:v70 withDefaultMinutes:&unk_1F24E1D38];
    }
    id v39 = (void *)v36;
LABEL_37:
    id v41 = [v17 objectForKeyedSubscript:@"ContractTariff"];
    uint64_t v42 = [v17 objectForKeyedSubscript:@"ContractValidityZones"];
    id v43 = +[AtlasDecoder formatCommutePlanIdentifier:v18 withTariffCode:v41 withZoneList:v42];

    [v17 setObject:v43 forKeyedSubscript:@"CommutePlanIdentifier"];
    if (v35) {
      [v17 setObject:v35 forKeyedSubscript:@"CommutePlanValidityStartDate"];
    }
    uint64_t v12 = v65;
    if (v39)
    {
      [v17 setObject:v39 forKeyedSubscript:@"CommutePlanValidityEndDate"];
      uint64_t v44 = +[AtlasDecoder calculateCommutePlanUniqueId:v43 withExpiry:v39];
      [v17 setObject:v44 forKeyedSubscript:@"CommutePlanUniqueIdentifier"];
    }
    [v65 addObject:v17];

    id v9 = v66;
    uint64_t v7 = v63;
    unsigned int v6 = v64;
    self = v62;
    id v15 = v69;
    goto LABEL_42;
  }
  uint64_t v21 = [v20 valueForKey:@"ContractCounterStructure"];
  if (!v21)
  {
    id v24 = ATLLogObject();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 67109120;
      LODWORD(v74) = v13 + 1;
      id v26 = v24;
      long long v27 = "No counterStructure provided for contract %d";
      goto LABEL_16;
    }
    goto LABEL_17;
  }
  id v22 = v21;
  unsigned __int8 v23 = [v21 integerValue];
  id v71 = 0;
  id v24 = [(AtlasDecoder *)self readAndDecodeCounter:v9 sfi:(v13 + 10) recNum:1 counterStructure:v23 error:&v71];
  id v25 = v71;
  if (!v25)
  {
    [v17 setObject:v24 forKeyedSubscript:@"ContractCounters"];
    goto LABEL_18;
  }
  uint64_t v56 = v25;
  if (a6) {
    *a6 = v25;
  }

LABEL_58:
  id v45 = 0;
LABEL_59:

  return v45;
}

- (void)stripContract:(id)a3
{
  id v3 = a3;
  [v3 removeObjectForKey:@"ContractBitmap"];
  [v3 removeObjectForKey:@"ContractTariff"];
  [v3 removeObjectForKey:@"ContractPointerNumber"];
  [v3 removeObjectForKey:@"ContractValidityStartDate"];
  [v3 removeObjectForKey:@"ContractValidityEndDate"];
  [v3 removeObjectForKey:@"ContractValidityStartTime"];
  [v3 removeObjectForKey:@"ContractValidityEndTime"];
  [v3 removeObjectForKey:@"ContractValidityInfoBitmap"];
}

- (id)readAndDecodeHistory:(id)a3 sfi:(unsigned __int8)a4 count:(unsigned __int8)a5 error:(id *)a6
{
  unsigned int v6 = a5;
  uint64_t v7 = a4;
  v50[1] = *MEMORY[0x1E4F143B8];
  id v9 = a3;
  uint64_t v40 = [MEMORY[0x1E4F1CA48] arrayWithCapacity:v6];
  id v10 = 0;
  if (!v6)
  {
LABEL_14:
    id v25 = v40;
    id v26 = v40;
    goto LABEL_26;
  }
  unsigned __int8 v11 = 0;
  p_vtable = &OBJC_METACLASS___HerculesDecoder.vtable;
  unsigned int v41 = v6;
  while (1)
  {
    int v13 = v10;
    ++v11;
    id v42 = v10;
    int v14 = [(AtlasDecoder *)self readRecord:v9 sfi:v7 index:v11 recLength:0 error:&v42];
    id v10 = v42;

    if (!v10) {
      break;
    }
    if ([v10 code] != 9)
    {
      id v25 = v40;
      if (a6) {
        *a6 = v10;
      }
      goto LABEL_25;
    }
LABEL_13:

    if (v6 <= v11) {
      goto LABEL_14;
    }
  }
  if ([v14 length] == 29)
  {
    id v15 = self;
    uint64_t v16 = v7;
    id v17 = v9;
    uint64_t v18 = [p_vtable + 102 decodeEventEntry:v14];
    id v19 = [v18 objectForKeyedSubscript:@"EventContractPointer"];
    uint64_t v20 = p_vtable;
    int v21 = [v19 unsignedIntValue];

    if ((v21 - 5) > 0xFFFFFFFB)
    {
      unsigned __int8 v23 = [v18 objectForKeyedSubscript:@"EventCode"];
      id v24 = [v20 + 102 getInternalEnRouteStatus:v23];
      [v18 setObject:v24 forKeyedSubscript:@"InternalEnRouteStatus"];

      [v40 addObject:v18];
    }
    else
    {
      id v22 = ATLLogObject();
      if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 67109378;
        int v44 = v21;
        __int16 v45 = 2112;
        uint64_t v46 = v18;
        _os_log_impl(&dword_1CA552000, v22, OS_LOG_TYPE_DEFAULT, "ContractPointer %d out of expected range [1,4] in %@. Skipping.", buf, 0x12u);
      }
    }
    id v9 = v17;

    p_vtable = (void **)(&OBJC_METACLASS___HerculesDecoder + 24);
    uint64_t v7 = v16;
    self = v15;
    unsigned int v6 = v41;
    goto LABEL_13;
  }
  long long v27 = ATLLogObject();
  if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1CA552000, v27, OS_LOG_TYPE_ERROR, "Failed to decode Atlas record data", buf, 2u);
  }

  uint64_t v28 = [[NSString alloc] initWithFormat:@"Failed to decode Atlas record data"];
  uint64_t v29 = (void *)v28;
  id v25 = v40;
  if (a6)
  {
    id v30 = *a6;
    uint64_t v31 = (void *)MEMORY[0x1E4F28C58];
    if (*a6)
    {
      uint64_t v32 = *MEMORY[0x1E4F28A50];
      v47[0] = *MEMORY[0x1E4F28568];
      v47[1] = v32;
      v48[0] = v28;
      v48[1] = v30;
      uint64_t v33 = (void *)MEMORY[0x1E4F1C9E8];
      uint64_t v34 = v48;
      id v35 = v47;
      uint64_t v36 = 2;
    }
    else
    {
      uint64_t v49 = *MEMORY[0x1E4F28568];
      v50[0] = v28;
      uint64_t v33 = (void *)MEMORY[0x1E4F1C9E8];
      uint64_t v34 = v50;
      id v35 = &v49;
      uint64_t v36 = 1;
    }
    id v37 = [v33 dictionaryWithObjects:v34 forKeys:v35 count:v36];
    *a6 = [v31 errorWithDomain:@"ATL" code:8 userInfo:v37];
  }
LABEL_25:

  id v26 = 0;
LABEL_26:

  return v26;
}

- (id)parseHistory:(id)a3 withContractList:(id)a4
{
  v74[1] = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v70 = a4;
  id v71 = v5;
  uint64_t v6 = [v5 count];
  id v69 = [MEMORY[0x1E4F1CA48] arrayWithCapacity:v6];
  unint64_t v72 = v6;
  if (v6)
  {
    uint64_t v7 = 0;
    p_vtable = &OBJC_METACLASS___HerculesDecoder.vtable;
    do
    {
      id v9 = [MEMORY[0x1E4F1CA60] dictionaryWithCapacity:8];
      id v10 = [v71 objectAtIndexedSubscript:v7];
      unsigned __int8 v11 = [v10 objectForKeyedSubscript:@"EventDateStamp"];
      uint64_t v12 = [v10 objectForKeyedSubscript:@"EventTimeStamp"];
      int v13 = [v10 objectForKeyedSubscript:@"EventCode"];
      int v14 = [v10 objectForKeyedSubscript:@"EventServiceProvider"];
      id v15 = [v10 objectForKeyedSubscript:@"EventContractPointer"];
      uint64_t v16 = [v10 objectForKeyedSubscript:@"EventSerialNumber"];
      id v17 = [p_vtable + 102 calculateTransactionSN:v11 withTimeStamp:v12 withEventCode:v13 withSP:v14 withContractPointer:v15 withDifferentiator:v16];
      [v9 setObject:v17 forKeyedSubscript:@"SerialNumber"];

      uint64_t v18 = [v10 objectForKeyedSubscript:@"EventCode"];
      id v19 = +[AtlasDecoder getInternalEnRouteStatus:v18];
      [v9 setObject:v19 forKeyedSubscript:@"InternalEnRouteStatus"];

      uint64_t v20 = [v10 objectForKeyedSubscript:@"EventCode"];
      int v21 = +[AtlasDecoder getTransitModality:v20];
      [v9 setObject:v21 forKeyedSubscript:@"TypeDetail"];

      id v22 = [v10 objectForKeyedSubscript:@"EventCode"];
      unsigned __int8 v23 = +[AtlasDecoder formatTransitDetailRaw:v22];
      [v9 setObject:v23 forKeyedSubscript:@"TypeDetailRaw"];

      id v24 = [v10 objectForKeyedSubscript:@"InternalEnRouteStatus"];
      unint64_t v25 = v7 + 1;

      uint64_t v26 = 1;
      if (v24 == @"CVPEnter" && v25 < v72)
      {
        long long v27 = [v71 objectAtIndexedSubscript:v25];
        uint64_t v28 = [v27 objectForKeyedSubscript:@"EventCode"];
        unsigned __int8 v29 = [v28 unsignedLongValue];

        uint64_t v30 = v29 >> 4;
        uint64_t v26 = 1;
        if (v30 != 1 && v30 != 4)
        {
          uint64_t v31 = [MEMORY[0x1E4F1C9B8] dataWithBytes:&AtlasCardReadBytes length:3];
          [v9 setObject:v31 forKeyedSubscript:@"TypeDetailRaw"];

          uint64_t v26 = 0;
        }
      }
      uint64_t v32 = [v9 objectForKeyedSubscript:@"TypeDetailRaw"];
      int v33 = [v32 isEqualToBytes:&AtlasCardReadBytes length:3];

      if (v33)
      {
        [v9 setObject:@"CardRead" forKeyedSubscript:@"TypeDetail"];
        uint64_t v26 = 0;
      }
      [v9 setObject:&unk_1F24E1D50 forKeyedSubscript:@"CityCode"];
      uint64_t v34 = [v10 objectForKeyedSubscript:@"EventLocationId"];

      if (v34)
      {
        id v35 = [v10 objectForKeyedSubscript:@"EventLocationId"];
        uint64_t v36 = [v35 integerValue];

        id v37 = [v9 objectForKeyedSubscript:@"InternalEnRouteStatus"];
        if (v37 == @"Enter")
        {
          BOOL v39 = 1;
        }
        else
        {
          uint64_t v38 = [v9 objectForKeyedSubscript:@"InternalEnRouteStatus"];
          BOOL v39 = v38 == @"CVPEnter";
        }
        if (v39 && v36)
        {
          uint64_t v40 = [MEMORY[0x1E4F1C9B8] dataWithIntBE:v36];
          [v9 setObject:v40 forKeyedSubscript:@"StartStation"];
        }
        unsigned int v41 = [v9 objectForKeyedSubscript:@"InternalEnRouteStatus"];
        if (v41 == @"Exit")
        {
          BOOL v43 = 1;
        }
        else
        {
          id v42 = [v9 objectForKeyedSubscript:@"InternalEnRouteStatus"];
          BOOL v43 = v42 == @"CVPExit";
        }
        if (v43 && v36)
        {
          int v44 = [MEMORY[0x1E4F1C9B8] dataWithIntBE:v36];
          [v9 setObject:v44 forKeyedSubscript:@"EndStation"];
        }
      }
      ++v7;
      __int16 v45 = [v10 objectForKeyedSubscript:@"EventDateStamp"];
      uint64_t v46 = [v10 objectForKeyedSubscript:@"EventTimeStamp"];
      uint64_t v47 = +[AtlasDecoder getAbsoluteDateComponents:v45 withTime:v46];
      [v9 setObject:v47 forKeyedSubscript:@"TransactionTime"];

      id v48 = [v10 objectForKeyedSubscript:@"EventDataDateFirstStamp"];

      if (v48)
      {
        uint64_t v49 = [v10 objectForKeyedSubscript:@"EventDataDateFirstStamp"];
        id v50 = [v10 objectForKeyedSubscript:@"EventDataTimeFirstStamp"];
        uint64_t v51 = +[AtlasDecoder getAbsoluteDateComponents:v49 withTime:v50];
        [v9 setObject:v51 forKeyedSubscript:@"FirstStampTime"];
      }
      v52 = [v10 objectForKeyedSubscript:@"EventContractPointer"];
      uint64_t v53 = [v52 unsignedIntValue] - 1;

      id v54 = [v70 objectAtIndex:v53];
      uint64_t v55 = [v54 objectForKeyedSubscript:@"ContractValidityJourneysData"];
      uint64_t v56 = [v55 objectForKeyedSubscript:@"ContractCounterStructure"];
      int v57 = [v56 unsignedIntValue];

      if (v57 == 12)
      {
        uint64_t v58 = [NSNumber numberWithUnsignedInt:v26];
        long long v59 = [v54 objectForKeyedSubscript:@"CommutePlanIdentifier"];
        uint64_t v60 = +[AtlasDecoder amountDictionaryWithAmount:v58 withIdentifier:v59 usingAmountKey:@"Amount" usingCurrencyKey:@"AmountCurrency" usingExponentKey:@"AmountCurrencyExponent" usingIdentifierKey:@"AmountIdentifier"];

        v74[0] = v60;
        uint64_t v61 = [MEMORY[0x1E4F1C978] arrayWithObjects:v74 count:1];
        uint64_t v62 = v9;
        unsigned int v63 = v61;
        unsigned int v64 = @"Amounts";
      }
      else
      {
        id v65 = [v54 objectForKeyedSubscript:@"CommutePlanIdentifier"];
        id v66 = [v54 objectForKeyedSubscript:@"CommutePlanValidityEndDate"];
        uint64_t v67 = [v54 objectForKeyedSubscript:@"CommutePlanUniqueIdentifier"];
        uint64_t v60 = +[AtlasDecoder commutePlanWithIdAndExpiry:v65 withExpiry:v66 withUniqueId:v67];

        v73 = v60;
        uint64_t v61 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v73 count:1];
        uint64_t v62 = v9;
        unsigned int v63 = v61;
        unsigned int v64 = @"CommutePlans";
      }
      [v62 setObject:v63 forKeyedSubscript:v64];

      [v69 addObject:v9];
      p_vtable = (void **)(&OBJC_METACLASS___HerculesDecoder + 24);
    }
    while (v72 != v7);
  }

  return v69;
}

- (id)readAndDecodeBestContractList:(id)a3 sfi:(unsigned __int8)a4 error:(id *)a5
{
  v27[1] = *MEMORY[0x1E4F143B8];
  id v23 = 0;
  uint64_t v6 = [(AtlasDecoder *)self readRecord:a3 sfi:a4 index:1 recLength:0 error:&v23];
  id v7 = v23;
  uint64_t v8 = v7;
  if (v7 && [v7 code] != 9)
  {
    if (a5)
    {
      id v9 = 0;
      *a5 = v8;
      goto LABEL_17;
    }
  }
  else if ([v6 length] == 29)
  {
    if (v6)
    {
      id v9 = +[AtlasDecoder decodeBestContractList:v6];
      goto LABEL_17;
    }
  }
  else
  {
    id v10 = ATLLogObject();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)id v22 = 0;
      _os_log_impl(&dword_1CA552000, v10, OS_LOG_TYPE_ERROR, "Failed to decode Atlas record data", v22, 2u);
    }

    uint64_t v11 = [[NSString alloc] initWithFormat:@"Failed to decode Atlas record data"];
    uint64_t v12 = (void *)v11;
    if (a5)
    {
      id v13 = *a5;
      int v14 = (void *)MEMORY[0x1E4F28C58];
      if (*a5)
      {
        uint64_t v15 = *MEMORY[0x1E4F28A50];
        v24[0] = *MEMORY[0x1E4F28568];
        v24[1] = v15;
        v25[0] = v11;
        v25[1] = v13;
        uint64_t v16 = (void *)MEMORY[0x1E4F1C9E8];
        id v17 = v25;
        uint64_t v18 = v24;
        uint64_t v19 = 2;
      }
      else
      {
        uint64_t v26 = *MEMORY[0x1E4F28568];
        v27[0] = v11;
        uint64_t v16 = (void *)MEMORY[0x1E4F1C9E8];
        id v17 = v27;
        uint64_t v18 = &v26;
        uint64_t v19 = 1;
      }
      uint64_t v20 = [v16 dictionaryWithObjects:v17 forKeys:v18 count:v19];
      *a5 = [v14 errorWithDomain:@"ATL" code:8 userInfo:v20];
    }
  }
  id v9 = 0;
LABEL_17:

  return v9;
}

- (id)readAndDecodeCounter:(id)a3 sfi:(unsigned __int8)a4 recNum:(unsigned __int8)a5 counterStructure:(unsigned __int8)a6 error:(id *)a7
{
  int v8 = a6;
  int v9 = a5;
  int v10 = a4;
  uint64_t v41 = *MEMORY[0x1E4F143B8];
  id v32 = 0;
  uint64_t v11 = [(AtlasDecoder *)self readRecord:a3 sfi:a4 index:a5 recLength:0 error:&v32];
  id v12 = v32;
  id v13 = v12;
  if (v12)
  {
    if ([v12 code] == 9)
    {
      int v14 = ATLLogObject();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 67109376;
        int v38 = v10;
        __int16 v39 = 1024;
        int v40 = v9;
        _os_log_impl(&dword_1CA552000, v14, OS_LOG_TYPE_DEFAULT, "Counter Structure Record not found: SFI 0x%02X Record 0x%02X", buf, 0xEu);
      }

      id v15 = 0;
      uint64_t v16 = (void *)MEMORY[0x1E4F1CC08];
      goto LABEL_28;
    }
    if (a7)
    {
      id v15 = 0;
      uint64_t v16 = 0;
      *a7 = v13;
      goto LABEL_28;
    }
LABEL_22:
    id v15 = 0;
    uint64_t v16 = 0;
    goto LABEL_28;
  }
  if ([v11 length] != 29)
  {
    uint64_t v19 = ATLLogObject();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1CA552000, v19, OS_LOG_TYPE_ERROR, "Failed to decode Atlas record data (unexpected length)", buf, 2u);
    }

    uint64_t v20 = [[NSString alloc] initWithFormat:@"Failed to decode Atlas record data (unexpected length)"];
    int v21 = (void *)v20;
    if (a7)
    {
      id v22 = *a7;
      id v23 = (void *)MEMORY[0x1E4F28C58];
      if (*a7)
      {
        uint64_t v24 = *MEMORY[0x1E4F28A50];
        v33[0] = *MEMORY[0x1E4F28568];
        v33[1] = v24;
        v34[0] = v20;
        v34[1] = v22;
        unint64_t v25 = (void *)MEMORY[0x1E4F1C9E8];
        uint64_t v26 = v34;
        long long v27 = v33;
        uint64_t v28 = 2;
      }
      else
      {
        uint64_t v35 = *MEMORY[0x1E4F28568];
        uint64_t v36 = v20;
        unint64_t v25 = (void *)MEMORY[0x1E4F1C9E8];
        uint64_t v26 = &v36;
        long long v27 = &v35;
        uint64_t v28 = 1;
      }
      unsigned __int8 v29 = [v25 dictionaryWithObjects:v26 forKeys:v27 count:v28];
      *a7 = [v23 errorWithDomain:@"ATL" code:8 userInfo:v29];
    }
    goto LABEL_22;
  }
  if (v11)
  {
    uint64_t v17 = [v11 subdataWithOffset:0 length:[v11 length]];

    if (v8 == 12)
    {
      uint64_t v18 = +[AtlasDecoder decodeCounterStructure0C:v17];
    }
    else if (v8 == 3)
    {
      uint64_t v18 = +[AtlasDecoder decodeCounterStructure03:v17];
    }
    else
    {
      uint64_t v30 = ATLLogObject();
      if (os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 67109120;
        int v38 = v8;
        _os_log_impl(&dword_1CA552000, v30, OS_LOG_TYPE_DEFAULT, "Unexpected counter structure %u", buf, 8u);
      }

      uint64_t v18 = (void *)MEMORY[0x1E4F1CC08];
    }
  }
  else
  {
    uint64_t v17 = 0;
    uint64_t v18 = 0;
  }
  id v15 = v18;
  uint64_t v11 = (void *)v17;
  uint64_t v16 = v15;
LABEL_28:

  return v16;
}

- (id)readAndDecodeEnvironment:(id)a3 sfi:(unsigned __int8)a4 error:(id *)a5
{
  v27[1] = *MEMORY[0x1E4F143B8];
  id v23 = 0;
  uint64_t v6 = [(AtlasDecoder *)self readRecord:a3 sfi:a4 index:1 recLength:0 error:&v23];
  id v7 = v23;
  int v8 = v7;
  if (v7)
  {
    if (a5)
    {
      int v9 = 0;
      *a5 = v7;
      goto LABEL_15;
    }
  }
  else
  {
    if ([v6 length] == 29)
    {
      int v9 = +[AtlasDecoder decodeEnvironmentData:v6];
      goto LABEL_15;
    }
    int v10 = ATLLogObject();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)id v22 = 0;
      _os_log_impl(&dword_1CA552000, v10, OS_LOG_TYPE_ERROR, "Failed to decode Atlas record data (unexpected length)", v22, 2u);
    }

    uint64_t v11 = [[NSString alloc] initWithFormat:@"Failed to decode Atlas record data (unexpected length)"];
    id v12 = (void *)v11;
    if (a5)
    {
      id v13 = *a5;
      int v14 = (void *)MEMORY[0x1E4F28C58];
      if (*a5)
      {
        uint64_t v15 = *MEMORY[0x1E4F28A50];
        v24[0] = *MEMORY[0x1E4F28568];
        v24[1] = v15;
        v25[0] = v11;
        v25[1] = v13;
        uint64_t v16 = (void *)MEMORY[0x1E4F1C9E8];
        uint64_t v17 = v25;
        uint64_t v18 = v24;
        uint64_t v19 = 2;
      }
      else
      {
        uint64_t v26 = *MEMORY[0x1E4F28568];
        v27[0] = v11;
        uint64_t v16 = (void *)MEMORY[0x1E4F1C9E8];
        uint64_t v17 = v27;
        uint64_t v18 = &v26;
        uint64_t v19 = 1;
      }
      uint64_t v20 = [v16 dictionaryWithObjects:v17 forKeys:v18 count:v19];
      *a5 = [v14 errorWithDomain:@"ATL" code:8 userInfo:v20];
    }
  }
  int v9 = 0;
LABEL_15:

  return v9;
}

- (id)readRecord:(id)a3 sfi:(unsigned __int8)a4 index:(unsigned __int8)a5 recLength:(unsigned __int8)a6 error:(id *)a7
{
  uint64_t v8 = a4;
  v52[1] = *MEMORY[0x1E4F143B8];
  if (a4 < 0x1Fu)
  {
    uint64_t v19 = a5;
    __int16 v37 = -19968;
    unsigned __int8 v38 = a5;
    char v39 = (8 * a4) | 4;
    unsigned __int8 v40 = a6;
    id v36 = 0;
    uint64_t v20 = [a3 transceiveBytesAndCheckSW:&v37 length:5 inArray:&unk_1F24E2650 keepingSW:1 error:&v36];
    id v21 = v36;
    uint64_t v11 = v21;
    if (v21)
    {
      if (a7)
      {
        id v22 = 0;
        *a7 = v21;
LABEL_24:

        goto LABEL_25;
      }
    }
    else
    {
      if (objc_msgSend(v20, "u16BE:", objc_msgSend(v20, "length") - 2) != 27267)
      {
        id v22 = [v20 subdataWithOffset:0 length:[v20 length] - 2];
        goto LABEL_24;
      }
      id v23 = ATLLogObject();
      if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 67109376;
        int v46 = v8;
        __int16 v47 = 1024;
        int v48 = v19;
        _os_log_impl(&dword_1CA552000, v23, OS_LOG_TYPE_ERROR, "Warning: SFI 0x%02X Record 0x%02X not found", buf, 0xEu);
      }

      uint64_t v24 = [[NSString alloc] initWithFormat:@"Warning: SFI 0x%02X Record 0x%02X not found", v8, v19];
      unint64_t v25 = (void *)v24;
      if (a7)
      {
        id v26 = *a7;
        long long v27 = (void *)MEMORY[0x1E4F28C58];
        if (*a7)
        {
          uint64_t v28 = *MEMORY[0x1E4F28A50];
          v41[0] = *MEMORY[0x1E4F28568];
          v41[1] = v28;
          v42[0] = v24;
          v42[1] = v26;
          unsigned __int8 v29 = (void *)MEMORY[0x1E4F1C9E8];
          uint64_t v30 = v42;
          uint64_t v31 = v41;
          uint64_t v32 = 2;
        }
        else
        {
          uint64_t v43 = *MEMORY[0x1E4F28568];
          uint64_t v44 = v24;
          unsigned __int8 v29 = (void *)MEMORY[0x1E4F1C9E8];
          uint64_t v30 = &v44;
          uint64_t v31 = &v43;
          uint64_t v32 = 1;
        }
        uint64_t v34 = [v29 dictionaryWithObjects:v30 forKeys:v31 count:v32];
        *a7 = [v27 errorWithDomain:@"ATL" code:9 userInfo:v34];
      }
    }
    id v22 = 0;
    goto LABEL_24;
  }
  int v9 = ATLLogObject();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 67109120;
    int v46 = v8;
    _os_log_impl(&dword_1CA552000, v9, OS_LOG_TYPE_ERROR, "Invalid SFI for read record 0x%X", buf, 8u);
  }

  uint64_t v10 = [[NSString alloc] initWithFormat:@"Invalid SFI for read record 0x%X", v8];
  uint64_t v11 = (void *)v10;
  if (a7)
  {
    id v12 = *a7;
    id v13 = (void *)MEMORY[0x1E4F28C58];
    if (*a7)
    {
      uint64_t v14 = *MEMORY[0x1E4F28A50];
      v49[0] = *MEMORY[0x1E4F28568];
      v49[1] = v14;
      v50[0] = v10;
      v50[1] = v12;
      uint64_t v15 = (void *)MEMORY[0x1E4F1C9E8];
      uint64_t v16 = v50;
      uint64_t v17 = v49;
      uint64_t v18 = 2;
    }
    else
    {
      uint64_t v51 = *MEMORY[0x1E4F28568];
      v52[0] = v10;
      uint64_t v15 = (void *)MEMORY[0x1E4F1C9E8];
      uint64_t v16 = v52;
      uint64_t v17 = &v51;
      uint64_t v18 = 1;
    }
    int v33 = [v15 dictionaryWithObjects:v16 forKeys:v17 count:v18];
    *a7 = [v13 errorWithDomain:@"ATL" code:6 userInfo:v33];
  }
  id v22 = 0;
LABEL_25:

  return v22;
}

- (id)readPartnerRecords:(id)a3 sfi:(unsigned __int8)a4 count:(unsigned __int8)a5 error:(id *)a6
{
  unsigned int v7 = a5;
  uint64_t v8 = a4;
  v25[1] = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  uint64_t v11 = [MEMORY[0x1E4F1CA48] arrayWithCapacity:v7];
  if (v7)
  {
    uint64_t v20 = a6;
    id v12 = 0;
    unsigned __int8 v13 = 0;
    while (1)
    {
      uint64_t v14 = v12;
      ++v13;
      id v21 = v12;
      uint64_t v15 = [(AtlasDecoder *)self readRecord:v10 sfi:v8 index:v13 recLength:0 error:&v21];
      id v12 = v21;

      if (v12)
      {
        if ([v12 code] != 9) {
          break;
        }
      }
      if (v15)
      {
        uint64_t v24 = @"record";
        uint64_t v16 = [v15 base64EncodedStringWithOptions:0];
        v25[0] = v16;
        uint64_t v17 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v25 forKeys:&v24 count:1];

        [v11 addObject:v17];
      }

      if (v7 <= v13) {
        goto LABEL_10;
      }
    }
    if (v20)
    {
      id v12 = v12;
      uint64_t v18 = 0;
      *uint64_t v20 = v12;
    }
    else
    {
      uint64_t v18 = 0;
    }
  }
  else
  {
    id v12 = 0;
LABEL_10:
    uint64_t v15 = [NSString stringWithFormat:@"%02X", v8];
    v22[0] = @"sfi";
    v22[1] = @"recordData";
    v23[0] = v15;
    v23[1] = v11;
    uint64_t v18 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v23 forKeys:v22 count:2];
  }

  return v18;
}

- (id)SelectRemoteTicketingCmd
{
  return (id)[MEMORY[0x1E4F1C9B8] dataWithBytes:&SelectRemoteTicketingCmd_cmdBytes length:7];
}

- (id)getCardIdFromSelectResponse:(id)a3
{
  id v3 = a3;
  v13[0] = (unsigned __int8 *)[v3 bytes];
  BOOL v4 = (unsigned __int8 *)[v3 length];

  v13[1] = v4;
  uint64_t v10 = 0;
  uint64_t v11 = 0;
  uint64_t v12 = 0;
  *(void *)&double v5 = DERFindItem(v13, 0xC000000000000007, (uint64_t)&v10).n128_u64[0];
  int v7 = v6;
  uint64_t v8 = 0;
  if (!v7)
  {
    uint64_t v8 = [MEMORY[0x1E4F1C9B8] dataWithBytes:v11 length:v12];
  }

  return v8;
}

+ (id)decodeEnvironmentBitMap:(id)a3
{
  v15[5] = *MEMORY[0x1E4F143B8];
  v14[0] = @"EnvNetworkId";
  id v3 = NSNumber;
  id v4 = a3;
  double v5 = [v3 numberWithBool:[v4 isBitSet:0]];
  v15[0] = v5;
  v14[1] = @"EnvApplicationIssuerId";
  int v6 = [NSNumber numberWithBool:[v4 isBitSet:1]];
  v15[1] = v6;
  v14[2] = @"EnvApplicationEndDate";
  int v7 = [NSNumber numberWithBool:[v4 isBitSet:2]];
  v15[2] = v7;
  v14[3] = @"EnvAuthenticator";
  uint64_t v8 = [NSNumber numberWithBool:[v4 isBitSet:4]];
  v15[3] = v8;
  v14[4] = @"EnvDataBitmap";
  int v9 = NSNumber;
  uint64_t v10 = [v4 isBitSet:6];

  uint64_t v11 = [v9 numberWithBool:v10];
  v15[4] = v11;
  uint64_t v12 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v15 forKeys:v14 count:5];

  return v12;
}

+ (id)decodeEnvironmentDataBitMap:(id)a3
{
  v7[1] = *MEMORY[0x1E4F143B8];
  int v6 = @"EnvDataCardStatus";
  id v3 = [NSNumber numberWithBool:[a3 isBitSet:0]];
  v7[0] = v3;
  id v4 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v7 forKeys:&v6 count:1];

  return v4;
}

+ (id)decodeEnvironmentData:(id)a3
{
  uint64_t v42 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  double v5 = [MEMORY[0x1E4F1CA60] dictionary];
  if ((unint64_t)[v4 length] > 0x1C)
  {
    uint64_t v8 = [v4 readBinaryValueAtBit:0 numberOfBits:6];
    int v9 = [NSNumber numberWithUnsignedLongLong:v8];
    [v5 setValue:v9 forKey:@"EnvVersionNumber"];

    uint64_t v10 = [v4 readBinaryValueAtBit:6 numberOfBits:7];
    uint64_t v11 = [NSNumber numberWithUnsignedLongLong:v10];
    uint64_t v12 = [a1 decodeEnvironmentBitMap:v11];

    unsigned __int8 v13 = [NSNumber numberWithUnsignedLongLong:v10];
    [v5 setValue:v13 forKey:@"EnvBitmap"];

    uint64_t v14 = [v12 objectForKeyedSubscript:@"EnvNetworkId"];
    int v15 = [v14 BOOLValue];

    if (v15)
    {
      uint64_t v16 = [v4 readBinaryValueAtBit:13 numberOfBits:24];
      uint64_t v17 = [NSNumber numberWithUnsignedLongLong:v16];
      [v5 setValue:v17 forKey:@"EnvNetworkId"];

      uint64_t v18 = 37;
    }
    else
    {
      uint64_t v18 = 13;
    }
    uint64_t v19 = [v12 objectForKeyedSubscript:@"EnvApplicationIssuerId"];
    int v20 = [v19 BOOLValue];

    if (v20)
    {
      uint64_t v21 = [v4 readBinaryValueAtBit:v18 numberOfBits:8];
      v18 += 8;
      id v22 = [NSNumber numberWithUnsignedLongLong:v21];
      [v5 setValue:v22 forKey:@"EnvApplicationIssuerId"];
    }
    id v23 = [v12 objectForKeyedSubscript:@"EnvApplicationEndDate"];
    int v24 = [v23 BOOLValue];

    if (v24)
    {
      uint64_t v25 = [v4 readBinaryValueAtBit:v18 numberOfBits:14];
      v18 += 14;
      id v26 = [NSNumber numberWithUnsignedLongLong:v25];
      [v5 setValue:v26 forKey:@"EnvApplicationEndDate"];
    }
    long long v27 = [v12 objectForKeyedSubscript:@"EnvAuthenticator"];
    int v28 = [v27 BOOLValue];

    if (v28)
    {
      uint64_t v29 = [v4 readBinaryValueAtBit:v18 numberOfBits:16];
      v18 += 16;
      uint64_t v30 = [NSNumber numberWithUnsignedLongLong:v29];
      [v5 setValue:v30 forKey:@"EnvAuthenticator"];
    }
    uint64_t v31 = [v12 objectForKeyedSubscript:@"EnvDataBitmap"];
    int v32 = [v31 BOOLValue];

    if (v32)
    {
      uint64_t v33 = [v4 readBinaryValueAtBit:v18 numberOfBits:2];
      uint64_t v34 = [NSNumber numberWithUnsignedLongLong:v33];
      [v5 setValue:v34 forKey:@"EnvDataBitmap"];

      uint64_t v35 = [NSNumber numberWithUnsignedLongLong:v10];
      id v36 = [a1 decodeEnvironmentDataBitMap:v35];

      __int16 v37 = [v36 objectForKeyedSubscript:@"EnvDataCardStatus"];
      LODWORD(v34) = [v37 BOOLValue];

      if (v34)
      {
        uint64_t v38 = [v4 readBinaryValueAtBit:v18 + 2 numberOfBits:1];
        char v39 = [NSNumber numberWithUnsignedLongLong:v38];
        [v5 setValue:v39 forKey:@"EnvDataCardStatus"];
      }
    }
    id v7 = v5;
  }
  else
  {
    int v6 = ATLLogObject();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      v41[0] = 67109120;
      v41[1] = [v4 length];
      _os_log_impl(&dword_1CA552000, v6, OS_LOG_TYPE_ERROR, "Invalid data length %u", (uint8_t *)v41, 8u);
    }

    id v7 = 0;
  }

  return v7;
}

+ (id)decodeBestContractList:(id)a3
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  if ([v3 length] == 29)
  {
    uint64_t v4 = [v3 readBinaryValueAtBit:0 numberOfBits:4];
    uint64_t v25 = [MEMORY[0x1E4F1CA48] arrayWithCapacity:v4];
    unint64_t v5 = 0x1E4F1C000uLL;
    if (v4)
    {
      int v6 = 0;
      uint64_t v7 = 4;
      unint64_t v24 = v4;
      do
      {
        uint64_t v8 = [v3 readBinaryValueAtBit:v7 numberOfBits:3];
        uint64_t v9 = [v3 readBinaryValueAtBit:v7 + 3 numberOfBits:4];
        uint64_t v10 = [v3 readBinaryValueAtBit:v7 + 7 numberOfBits:8];
        uint64_t v11 = [v3 readBinaryValueAtBit:v7 + 15 numberOfBits:4];
        uint64_t v12 = [v3 readBinaryValueAtBit:v7 + 19 numberOfBits:5];
        v28[0] = @"BestContractBitmap";
        unsigned __int8 v13 = [NSNumber numberWithUnsignedLongLong:v8];
        v29[0] = v13;
        v28[1] = @"BestContractIssuer";
        uint64_t v14 = [NSNumber numberWithUnsignedLongLong:v9];
        v29[1] = v14;
        v28[2] = @"BestContractType";
        int v15 = [NSNumber numberWithUnsignedLongLong:v10];
        v29[2] = v15;
        v28[3] = @"BestContractPriority";
        uint64_t v16 = [NSNumber numberWithUnsignedLongLong:v11];
        v29[3] = v16;
        v28[4] = @"BestContractPointer";
        uint64_t v17 = [NSNumber numberWithUnsignedLongLong:v12];
        v29[4] = v17;
        [*(id *)(v5 + 2536) dictionaryWithObjects:v29 forKeys:v28 count:5];
        v19 = unint64_t v18 = v5;
        [v25 addObject:v19];

        unint64_t v5 = v18;
        uint64_t v4 = v24;
        ++v6;
        v7 += 24;
      }
      while (v24 > v6);
    }
    v26[0] = @"BestContract";
    int v20 = [NSNumber numberWithUnsignedLongLong:v4];
    v26[1] = @"BestContractList";
    v27[0] = v20;
    uint64_t v21 = v25;
    v27[1] = v25;
    id v22 = [*(id *)(v5 + 2536) dictionaryWithObjects:v27 forKeys:v26 count:2];
  }
  else
  {
    uint64_t v21 = ATLLogObject();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 67109120;
      int v31 = [v3 length];
      _os_log_impl(&dword_1CA552000, v21, OS_LOG_TYPE_ERROR, "Invalid data length %u", buf, 8u);
    }
    id v22 = 0;
  }

  return v22;
}

+ (id)decodeCounterStructure03:(id)a3
{
  id v3 = (void *)MEMORY[0x1E4F1CA60];
  id v4 = a3;
  unint64_t v5 = [v3 dictionary];
  uint64_t v6 = [v4 readBinaryValueAtBit:0 numberOfBits:10];
  uint64_t v7 = [NSNumber numberWithUnsignedLongLong:v6];
  [v5 setValue:v7 forKey:@"CounterContractCount"];

  uint64_t v8 = [v4 readBinaryValueAtBit:10 numberOfBits:14];
  uint64_t v9 = [NSNumber numberWithUnsignedLongLong:v8];
  [v5 setValue:v9 forKey:@"CounterCounterValidityEndDate"];

  return v5;
}

+ (id)decodeCounterStructure0C:(id)a3
{
  id v3 = (void *)MEMORY[0x1E4F1CA60];
  id v4 = a3;
  unint64_t v5 = [v3 dictionary];
  uint64_t v6 = [v4 readBinaryValueAtBit:0 numberOfBits:6];
  uint64_t v7 = [NSNumber numberWithUnsignedLongLong:v6];
  [v5 setValue:v7 forKey:@"CounterContractCount"];

  uint64_t v8 = [v4 readBinaryValueAtBit:6 numberOfBits:18];
  uint64_t v9 = [NSNumber numberWithUnsignedLongLong:v8];
  [v5 setValue:v9 forKey:@"CounterCounterRelativeFirstStamp15Mn"];

  return v5;
}

+ (id)decodeContractStructureFF:(id)a3
{
  id v4 = a3;
  unint64_t v5 = [MEMORY[0x1E4F1CA60] dictionary];
  v190 = [MEMORY[0x1E4F1CA60] dictionary];
  uint64_t v6 = 20;
  uint64_t v7 = [v4 readBinaryValueAtBit:0 numberOfBits:20];
  uint64_t v8 = [NSNumber numberWithUnsignedLongLong:v7];
  uint64_t v9 = [a1 decodeContractFFBitMap:v8];

  uint64_t v10 = [NSNumber numberWithUnsignedLongLong:v7];
  [v5 setValue:v10 forKey:@"ContractBitmap"];

  uint64_t v11 = [v9 objectForKeyedSubscript:@"ContractNetworkId"];
  LODWORD(v8) = [v11 BOOLValue];

  if (v8)
  {
    uint64_t v12 = [v4 readBinaryValueAtBit:20 numberOfBits:24];
    unsigned __int8 v13 = [NSNumber numberWithUnsignedLongLong:v12];
    [v5 setValue:v13 forKey:@"ContractNetworkId"];

    uint64_t v6 = 44;
  }
  uint64_t v14 = [v9 objectForKeyedSubscript:@"ContractProvider"];
  int v15 = [v14 BOOLValue];

  if (v15)
  {
    uint64_t v16 = [v4 readBinaryValueAtBit:v6 numberOfBits:8];
    v6 += 8;
    uint64_t v17 = [NSNumber numberWithUnsignedLongLong:v16];
    [v5 setValue:v17 forKey:@"ContractProvider"];
  }
  unint64_t v18 = [v9 objectForKeyedSubscript:@"ContractTariff"];
  int v19 = [v18 BOOLValue];

  if (v19)
  {
    uint64_t v20 = [v4 readBinaryValueAtBit:v6 numberOfBits:16];
    v6 += 16;
    uint64_t v21 = [NSNumber numberWithUnsignedLongLong:v20];
    [v5 setValue:v21 forKey:@"ContractTariff"];
  }
  id v22 = [v9 objectForKeyedSubscript:@"ContractSerialNumber"];
  int v23 = [v22 BOOLValue];

  if (v23)
  {
    uint64_t v24 = [v4 readBinaryValueAtBit:v6 numberOfBits:32];
    v6 += 32;
    uint64_t v25 = [NSNumber numberWithUnsignedLongLong:v24];
    [v5 setValue:v25 forKey:@"ContractSerialNumber"];
  }
  id v26 = [v9 objectForKeyedSubscript:@"ContractCustomerInfoBitmap"];
  int v27 = [v26 BOOLValue];

  if (v27)
  {
    uint64_t v28 = [v4 readBinaryValueAtBit:v6 numberOfBits:2];
    uint64_t v29 = [NSNumber numberWithUnsignedLongLong:v28];
    int v30 = [v29 isBitSet:0];
    uint64_t v31 = 8;
    if (!v30) {
      uint64_t v31 = 2;
    }
    v6 += v31;
    if ([v29 isBitSet:1]) {
      v6 += 32;
    }
  }
  uint64_t v32 = [v9 objectForKeyedSubscript:@"ContractPassengerInfoBitmap"];
  int v33 = [v32 BOOLValue];

  if (v33)
  {
    uint64_t v34 = [v4 readBinaryValueAtBit:v6 numberOfBits:2];
    uint64_t v35 = [NSNumber numberWithUnsignedLongLong:v34];
    int v36 = [v35 isBitSet:0];
    uint64_t v37 = 10;
    if (!v36) {
      uint64_t v37 = 2;
    }
    v6 += v37;
    if ([v35 isBitSet:1]) {
      v6 += 8;
    }
  }
  uint64_t v38 = [v9 objectForKeyedSubscript:@"ContractPayMethod"];
  int v39 = [v38 BOOLValue];

  if (v39) {
    uint64_t v40 = v6 + 11;
  }
  else {
    uint64_t v40 = v6;
  }
  uint64_t v41 = [v9 objectForKeyedSubscript:@"ContractServices"];
  int v42 = [v41 BOOLValue];

  if (v42) {
    v40 += 16;
  }
  uint64_t v43 = [v9 objectForKeyedSubscript:@"ContractPriceAmount"];
  int v44 = [v43 BOOLValue];

  if (v44) {
    v40 += 16;
  }
  __int16 v45 = [v9 objectForKeyedSubscript:@"ContractPriceUnit"];
  int v46 = [v45 BOOLValue];

  if (v46) {
    v40 += 16;
  }
  __int16 v47 = [v9 objectForKeyedSubscript:@"ContractRestrictionBitmap"];
  int v48 = [v47 BOOLValue];

  if (v48)
  {
    uint64_t v49 = [v4 readBinaryValueAtBit:v40 numberOfBits:7];
    uint64_t v50 = v40 + 7;
    uint64_t v51 = [NSNumber numberWithUnsignedLongLong:v49];
    v52 = [a1 decodeContractRestrictionBitmap:v51];

    uint64_t v53 = [v52 objectForKeyedSubscript:@"ContractRestrictStart"];
    int v54 = [v53 BOOLValue];

    if (v54)
    {
      uint64_t v55 = [v4 readBinaryValueAtBit:v40 + 7 numberOfBits:11];
      uint64_t v50 = v40 + 18;
      uint64_t v56 = [NSNumber numberWithUnsignedLongLong:v55];
      [v5 setValue:v56 forKey:@"ContractRestrictStart"];
    }
    int v57 = [v52 objectForKeyedSubscript:@"ContractRestrictEnd"];
    int v58 = [v57 BOOLValue];

    if (v58)
    {
      uint64_t v59 = [v4 readBinaryValueAtBit:v50 numberOfBits:11];
      v50 += 11;
      uint64_t v60 = [NSNumber numberWithUnsignedLongLong:v59];
      [v5 setValue:v60 forKey:@"ContractRestrictEnd"];
    }
    uint64_t v61 = [v52 objectForKeyedSubscript:@"ContractRestrictDay"];
    int v62 = [v61 BOOLValue];

    if (v62)
    {
      uint64_t v63 = [v4 readBinaryValueAtBit:v50 numberOfBits:8];
      v50 += 8;
      unsigned int v64 = [NSNumber numberWithUnsignedLongLong:v63];
      [v5 setValue:v64 forKey:@"ContractRestrictDay"];
    }
    id v65 = [v52 objectForKeyedSubscript:@"ContractRestrictTimeCode"];
    int v66 = [v65 BOOLValue];

    if (v66)
    {
      uint64_t v67 = [v4 readBinaryValueAtBit:v50 numberOfBits:8];
      v50 += 8;
      v68 = [NSNumber numberWithUnsignedLongLong:v67];
      [v5 setValue:v68 forKey:@"ContractRestrictTimeCode"];
    }
    id v69 = [v52 objectForKeyedSubscript:@"ContractRestrictCode"];
    int v70 = [v69 BOOLValue];

    if (v70)
    {
      uint64_t v71 = [v4 readBinaryValueAtBit:v50 numberOfBits:8];
      v50 += 8;
      unint64_t v72 = [NSNumber numberWithUnsignedLongLong:v71];
      [v5 setValue:v72 forKey:@"ContractRestrictCode"];
    }
    v73 = [v52 objectForKeyedSubscript:@"ContractRestrictProduct"];
    int v74 = [v73 BOOLValue];

    if (v74)
    {
      uint64_t v75 = [v4 readBinaryValueAtBit:v50 numberOfBits:16];
      v50 += 16;
      uint64_t v76 = [NSNumber numberWithUnsignedLongLong:v75];
      [v5 setValue:v76 forKey:@"ContractRestrictProduct"];
    }
    v77 = [v52 objectForKeyedSubscript:@"ContractRestrictLocation"];
    int v78 = [v77 BOOLValue];

    if (v78)
    {
      uint64_t v79 = [v4 readBinaryValueAtBit:v50 numberOfBits:16];
      v50 += 16;
      v80 = [NSNumber numberWithUnsignedLongLong:v79];
      [v5 setValue:v80 forKey:@"ContractRestrictLocation"];
    }
    uint64_t v40 = v50;
  }
  uint64_t v81 = [v9 objectForKeyedSubscript:@"ContractValidityInfoBitmap"];
  int v82 = [v81 BOOLValue];

  if (v82)
  {
    uint64_t v83 = [v4 readBinaryValueAtBit:v40 numberOfBits:9];
    uint64_t v84 = v40 + 9;
    long long v85 = [NSNumber numberWithUnsignedLongLong:v83];
    [v5 setValue:v85 forKey:@"ContractValidityInfoBitmap"];

    long long v86 = [NSNumber numberWithUnsignedLongLong:v83];
    long long v87 = [a1 decodeContractValidityBitmap:v86];

    long long v88 = [v87 objectForKeyedSubscript:@"ContractValidityStartDate"];
    int v89 = [v88 BOOLValue];

    if (v89)
    {
      uint64_t v90 = [v4 readBinaryValueAtBit:v40 + 9 numberOfBits:14];
      uint64_t v84 = v40 + 23;
      id v91 = [NSNumber numberWithUnsignedLongLong:v90];
      [v5 setValue:v91 forKey:@"ContractValidityStartDate"];
    }
    id v92 = [v87 objectForKeyedSubscript:@"ContractValidityStartTime"];
    int v93 = [v92 BOOLValue];

    if (v93)
    {
      uint64_t v94 = [v4 readBinaryValueAtBit:v84 numberOfBits:11];
      v84 += 11;
      id v95 = [NSNumber numberWithUnsignedLongLong:v94];
      [v5 setValue:v95 forKey:@"ContractValidityStartTime"];
    }
    id v96 = [v87 objectForKeyedSubscript:@"ContractValidityEndDate"];
    int v97 = [v96 BOOLValue];

    if (v97)
    {
      uint64_t v98 = [v4 readBinaryValueAtBit:v84 numberOfBits:14];
      v84 += 14;
      id v99 = [NSNumber numberWithUnsignedLongLong:v98];
      [v5 setValue:v99 forKey:@"ContractValidityEndDate"];
    }
    id v100 = [v87 objectForKeyedSubscript:@"ContractValidityEndTime"];
    int v101 = [v100 BOOLValue];

    if (v101)
    {
      uint64_t v102 = [v4 readBinaryValueAtBit:v84 numberOfBits:11];
      v84 += 11;
      id v103 = [NSNumber numberWithUnsignedLongLong:v102];
      [v5 setValue:v103 forKey:@"ContractValidityEndTime"];
    }
    id v104 = [v87 objectForKeyedSubscript:@"ContractValidityDuration"];
    int v105 = [v104 BOOLValue];

    if (v105)
    {
      uint64_t v106 = [v4 readBinaryValueAtBit:v84 numberOfBits:8];
      v84 += 8;
      v107 = [NSNumber numberWithUnsignedLongLong:v106];
      [v5 setValue:v107 forKey:@"ContractValidityDuration"];
    }
    v108 = [v87 objectForKeyedSubscript:@"ContractValidityLimitDate"];
    int v109 = [v108 BOOLValue];

    if (v109)
    {
      uint64_t v110 = [v4 readBinaryValueAtBit:v84 numberOfBits:14];
      v84 += 14;
      v111 = [NSNumber numberWithUnsignedLongLong:v110];
      [v5 setValue:v111 forKey:@"ContractValidityLimitDate"];
    }
    uint64_t v112 = [v87 objectForKeyedSubscript:@"ContractValidityZones"];
    int v113 = [v112 BOOLValue];

    if (v113)
    {
      uint64_t v114 = [v4 readBinaryValueAtBit:v84 numberOfBits:8];
      v84 += 8;
      v115 = [NSNumber numberWithUnsignedLongLong:v114];
      [v5 setValue:v115 forKey:@"ContractValidityZones"];
    }
    v116 = [v87 objectForKeyedSubscript:@"ContractValidityJourneys"];
    int v117 = [v116 BOOLValue];

    if (v117)
    {
      uint64_t v118 = [v4 readBinaryValueAtBit:v84 numberOfBits:16];
      uint64_t v119 = [v4 readBinaryValueAtBit:v84 + 1 numberOfBits:5];
      uint64_t v120 = [v4 readBinaryValueAtBit:v84 + 8 numberOfBits:8];
      v121 = [NSNumber numberWithUnsignedLongLong:v119];
      [v190 setValue:v121 forKey:@"ContractCounterStructure"];

      v122 = [NSNumber numberWithUnsignedLongLong:v120];
      [v190 setValue:v122 forKey:@"ContractCounterLastLoadCount"];

      v84 += 16;
      v123 = [NSNumber numberWithUnsignedLongLong:v118];
      [v5 setValue:v123 forKey:@"ContractValidityJourneys"];

      [v5 setObject:v190 forKeyedSubscript:@"ContractValidityJourneysData"];
    }
    v124 = [v87 objectForKeyedSubscript:@"ContractPeriodJourneys"];
    int v125 = [v124 BOOLValue];

    if (v125)
    {
      uint64_t v126 = [v4 readBinaryValueAtBit:v84 numberOfBits:16];
      v84 += 16;
      v127 = [NSNumber numberWithUnsignedLongLong:v126];
      [v5 setValue:v127 forKey:@"ContractPeriodJourneys"];
    }
    uint64_t v40 = v84;
  }
  v128 = [v9 objectForKeyedSubscript:@"ContractJourneyDataBitmap"];
  int v129 = [v128 BOOLValue];

  if (v129)
  {
    uint64_t v130 = [v4 readBinaryValueAtBit:v40 numberOfBits:8];
    uint64_t v131 = v40 + 8;
    v132 = [NSNumber numberWithUnsignedLongLong:v130];
    v133 = [a1 decodeContractJourneyDataBitmap:v132];

    v134 = [NSNumber numberWithUnsignedLongLong:v130];
    [v5 setValue:v134 forKey:@"ContractJourneyDataBitmap"];

    v135 = [v133 objectForKeyedSubscript:@"ContractJourneyOrigin"];
    LODWORD(v132) = [v135 BOOLValue];

    if (v132)
    {
      uint64_t v136 = [v4 readBinaryValueAtBit:v40 + 8 numberOfBits:16];
      uint64_t v131 = v40 + 24;
      v137 = [NSNumber numberWithUnsignedLongLong:v136];
      [v5 setValue:v137 forKey:@"ContractJourneyOrigin"];
    }
    v138 = [v133 objectForKeyedSubscript:@"ContractJourneyDestination"];
    int v139 = [v138 BOOLValue];

    if (v139)
    {
      uint64_t v140 = [v4 readBinaryValueAtBit:v131 numberOfBits:16];
      v131 += 16;
      v141 = [NSNumber numberWithUnsignedLongLong:v140];
      [v5 setValue:v141 forKey:@"ContractJourneyDestination"];
    }
    v142 = [v133 objectForKeyedSubscript:@"ContractJourneyRouteNumbers"];
    int v143 = [v142 BOOLValue];

    if (v143)
    {
      uint64_t v144 = [v4 readBinaryValueAtBit:v131 numberOfBits:16];
      v131 += 16;
      v145 = [NSNumber numberWithUnsignedLongLong:v144];
      [v5 setValue:v145 forKey:@"ContractJourneyRouteNumbers"];
    }
    v146 = [v133 objectForKeyedSubscript:@"ContractJourneyRouteVariants"];
    int v147 = [v146 BOOLValue];

    if (v147)
    {
      uint64_t v148 = [v4 readBinaryValueAtBit:v131 numberOfBits:8];
      v131 += 8;
      v149 = [NSNumber numberWithUnsignedLongLong:v148];
      [v5 setValue:v149 forKey:@"ContractJourneyRouteVariants"];
    }
    v150 = [v133 objectForKeyedSubscript:@"ContractJourneyRun"];
    int v151 = [v150 BOOLValue];

    if (v151)
    {
      uint64_t v152 = [v4 readBinaryValueAtBit:v131 numberOfBits:16];
      v131 += 16;
      v153 = [NSNumber numberWithUnsignedLongLong:v152];
      [v5 setValue:v153 forKey:@"ContractJourneyRun"];
    }
    v154 = [v133 objectForKeyedSubscript:@"ContractJourneyVia"];
    int v155 = [v154 BOOLValue];

    if (v155)
    {
      uint64_t v156 = [v4 readBinaryValueAtBit:v131 numberOfBits:16];
      v131 += 16;
      v157 = [NSNumber numberWithUnsignedLongLong:v156];
      [v5 setValue:v157 forKey:@"ContractJourneyVia"];
    }
    v158 = [v133 objectForKeyedSubscript:@"ContractJourneyVia"];
    int v159 = [v158 BOOLValue];

    if (v159)
    {
      uint64_t v160 = [v4 readBinaryValueAtBit:v131 numberOfBits:16];
      v131 += 16;
      v161 = [NSNumber numberWithUnsignedLongLong:v160];
      [v5 setValue:v161 forKey:@"ContractJourneyDistance"];
    }
    v162 = [v133 objectForKeyedSubscript:@"ContractJourneyInterchanges"];
    int v163 = [v162 BOOLValue];

    if (v163)
    {
      uint64_t v164 = [v4 readBinaryValueAtBit:v131 numberOfBits:8];
      v131 += 8;
      v165 = [NSNumber numberWithUnsignedLongLong:v164];
      [v5 setValue:v165 forKey:@"ContractJourneyInterchanges"];
    }
    uint64_t v40 = v131;
  }
  v166 = [v9 objectForKeyedSubscript:@"ContractSaleDataBitmap"];
  int v167 = [v166 BOOLValue];

  if (v167)
  {
    uint64_t v168 = [v4 readBinaryValueAtBit:v40 numberOfBits:4];
    v169 = [NSNumber numberWithUnsignedLongLong:v168];
    v170 = [a1 decodeContractSaleDataBitmap:v169];

    v171 = [v170 objectForKeyedSubscript:@"ContractSaleDate"];
    int v172 = [v171 BOOLValue];

    uint64_t v173 = 18;
    if (!v172) {
      uint64_t v173 = 4;
    }
    v40 += v173;
    v174 = [v170 objectForKeyedSubscript:@"ContractSaleTime"];
    int v175 = [v174 BOOLValue];

    if (v175) {
      v40 += 11;
    }
    v176 = [v170 objectForKeyedSubscript:@"ContractSaleAgent"];
    int v177 = [v176 BOOLValue];

    if (v177) {
      v40 += 8;
    }
    v178 = [v170 objectForKeyedSubscript:@"ContractSaleDevice"];
    int v179 = [v178 BOOLValue];

    if (v179) {
      v40 += 16;
    }
  }
  v180 = [v9 objectForKeyedSubscript:@"ContractStatus"];
  int v181 = [v180 BOOLValue];

  if (v181)
  {
    uint64_t v182 = [v4 readBinaryValueAtBit:v40 numberOfBits:8];
    v40 += 8;
    v183 = [NSNumber numberWithUnsignedLongLong:v182];
    [v5 setValue:v183 forKey:@"ContractStatus"];
  }
  v184 = [v9 objectForKeyedSubscript:@"ContractLoyaltyPoints"];
  int v185 = [v184 BOOLValue];

  if (v185)
  {
    uint64_t v186 = [v4 readBinaryValueAtBit:v40 numberOfBits:16];
    v187 = [NSNumber numberWithUnsignedLongLong:v186];
    [v5 setValue:v187 forKey:@"ContractLoyaltyPoints"];
  }
  id v188 = v5;

  return v188;
}

+ (id)decodeEventBitMap:(id)a3
{
  v33[23] = *MEMORY[0x1E4F143B8];
  v32[0] = @"EventNetworkId";
  id v3 = NSNumber;
  id v4 = a3;
  uint64_t v31 = [v3 numberWithBool:[v4 isBitSet:1]];
  v33[0] = v31;
  v32[1] = @"EventCode";
  int v30 = [NSNumber numberWithBool:[v4 isBitSet:2]];
  v33[1] = v30;
  v32[2] = @"EventResult";
  uint64_t v29 = [NSNumber numberWithBool:[v4 isBitSet:3]];
  void v33[2] = v29;
  v32[3] = @"EventServiceProvider";
  uint64_t v28 = [NSNumber numberWithBool:[v4 isBitSet:4]];
  v33[3] = v28;
  v32[4] = @"EventNotOkCounter";
  int v27 = [NSNumber numberWithBool:[v4 isBitSet:5]];
  v33[4] = v27;
  v32[5] = @"EventSerialNumber";
  id v26 = [NSNumber numberWithBool:[v4 isBitSet:6]];
  v33[5] = v26;
  v32[6] = @"EventDestination";
  uint64_t v25 = [NSNumber numberWithBool:[v4 isBitSet:7]];
  v33[6] = v25;
  void v32[7] = @"EventLocationId";
  uint64_t v24 = [NSNumber numberWithBool:[v4 isBitSet:8]];
  v33[7] = v24;
  v32[8] = @"EventLocationGate";
  int v23 = [NSNumber numberWithBool:[v4 isBitSet:9]];
  void v33[8] = v23;
  v32[9] = @"EventDevice";
  id v22 = [NSNumber numberWithBool:[v4 isBitSet:10]];
  v33[9] = v22;
  v32[10] = @"EventRouteNumber";
  uint64_t v21 = [NSNumber numberWithBool:[v4 isBitSet:11]];
  v33[10] = v21;
  v32[11] = @"EventRouteVariant";
  uint64_t v20 = [NSNumber numberWithBool:[v4 isBitSet:12]];
  v33[11] = v20;
  v32[12] = @"EventJourneyRun";
  int v19 = [NSNumber numberWithBool:[v4 isBitSet:13]];
  v33[12] = v19;
  v32[13] = @"EventVehicleId";
  unint64_t v18 = [NSNumber numberWithBool:[v4 isBitSet:14]];
  v33[13] = v18;
  v32[14] = @"EventLocationType";
  uint64_t v17 = [NSNumber numberWithBool:[v4 isBitSet:16]];
  v33[14] = v17;
  v32[15] = @"EventJourneyInterchanges";
  unint64_t v5 = [NSNumber numberWithBool:[v4 isBitSet:19]];
  v33[15] = v5;
  v32[16] = @"EventTotalJourneys";
  uint64_t v6 = [NSNumber numberWithBool:[v4 isBitSet:21]];
  v33[16] = v6;
  v32[17] = @"EventJourneyDistance";
  uint64_t v7 = [NSNumber numberWithBool:[v4 isBitSet:22]];
  v33[17] = v7;
  v32[18] = @"EventPriceAmount";
  uint64_t v8 = [NSNumber numberWithBool:[v4 isBitSet:23]];
  v33[18] = v8;
  v32[19] = @"EventPriceUnit";
  uint64_t v9 = [NSNumber numberWithBool:[v4 isBitSet:24]];
  v33[19] = v9;
  v32[20] = @"EventContractPointer";
  uint64_t v10 = [NSNumber numberWithBool:[v4 isBitSet:25]];
  v33[20] = v10;
  v32[21] = @"EventAuthenticator";
  uint64_t v11 = [NSNumber numberWithBool:[v4 isBitSet:26]];
  v33[21] = v11;
  v32[22] = @"EventDataBitmap";
  uint64_t v12 = NSNumber;
  uint64_t v13 = [v4 isBitSet:27];

  uint64_t v14 = [v12 numberWithBool:v13];
  v33[22] = v14;
  int v15 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v33 forKeys:v32 count:23];

  return v15;
}

+ (id)decodeEventEntry:(id)a3
{
  id v4 = a3;
  unint64_t v5 = [MEMORY[0x1E4F1CA60] dictionary];
  uint64_t v6 = [v4 readBinaryValueAtBit:0 numberOfBits:14];
  uint64_t v7 = [NSNumber numberWithUnsignedLongLong:v6];
  [v5 setObject:v7 forKeyedSubscript:@"EventDateStamp"];

  uint64_t v8 = [v4 readBinaryValueAtBit:14 numberOfBits:11];
  uint64_t v9 = [NSNumber numberWithUnsignedLongLong:v8];
  [v5 setObject:v9 forKeyedSubscript:@"EventTimeStamp"];

  uint64_t v10 = [v4 readBinaryValueAtBit:25 numberOfBits:28];
  uint64_t v11 = [NSNumber numberWithUnsignedLongLong:v10];
  uint64_t v12 = [a1 decodeEventBitMap:v11];

  uint64_t v13 = [NSNumber numberWithUnsignedLongLong:v10];
  [v5 setObject:v13 forKeyedSubscript:@"EventBitmap"];

  uint64_t v14 = [v12 objectForKeyedSubscript:@"EventCode"];
  LODWORD(v11) = [v14 BOOLValue];

  if (v11)
  {
    uint64_t v15 = [v4 readBinaryValueAtBit:53 numberOfBits:8];
    uint64_t v16 = [NSNumber numberWithUnsignedLongLong:v15];
    [v5 setObject:v16 forKeyedSubscript:@"EventCode"];

    uint64_t v17 = 61;
  }
  else
  {
    uint64_t v17 = 53;
  }
  unint64_t v18 = [v12 objectForKeyedSubscript:@"EventResult"];
  int v19 = [v18 BOOLValue];

  if (v19)
  {
    uint64_t v20 = [v4 readBinaryValueAtBit:v17 numberOfBits:8];
    v17 += 8;
    uint64_t v21 = [NSNumber numberWithUnsignedLongLong:v20];
    [v5 setObject:v21 forKeyedSubscript:@"EventResult"];
  }
  id v22 = [v12 objectForKeyedSubscript:@"EventServiceProvider"];
  int v23 = [v22 BOOLValue];

  if (v23)
  {
    uint64_t v24 = [v4 readBinaryValueAtBit:v17 numberOfBits:8];
    v17 += 8;
    uint64_t v25 = [NSNumber numberWithUnsignedLongLong:v24];
    [v5 setObject:v25 forKeyedSubscript:@"EventServiceProvider"];
  }
  id v26 = [v12 objectForKeyedSubscript:@"EventNotOkCounter"];
  int v27 = [v26 BOOLValue];

  if (v27)
  {
    uint64_t v28 = [v4 readBinaryValueAtBit:v17 numberOfBits:8];
    v17 += 8;
    uint64_t v29 = [NSNumber numberWithUnsignedLongLong:v28];
    [v5 setObject:v29 forKeyedSubscript:@"EventNotOkCounter"];
  }
  int v30 = [v12 objectForKeyedSubscript:@"EventSerialNumber"];
  int v31 = [v30 BOOLValue];

  if (v31)
  {
    uint64_t v32 = [v4 readBinaryValueAtBit:v17 numberOfBits:24];
    v17 += 24;
    int v33 = [NSNumber numberWithUnsignedLongLong:v32];
    [v5 setObject:v33 forKeyedSubscript:@"EventSerialNumber"];
  }
  uint64_t v34 = [v12 objectForKeyedSubscript:@"EventLocationId"];
  int v35 = [v34 BOOLValue];

  if (v35)
  {
    uint64_t v36 = [v4 readBinaryValueAtBit:v17 numberOfBits:16];
    v17 += 16;
    uint64_t v37 = [NSNumber numberWithUnsignedLongLong:v36];
    [v5 setObject:v37 forKeyedSubscript:@"EventLocationId"];
  }
  uint64_t v38 = [v12 objectForKeyedSubscript:@"EventLocationGate"];
  int v39 = [v38 BOOLValue];

  if (v39)
  {
    uint64_t v40 = [v4 readBinaryValueAtBit:v17 numberOfBits:8];
    v17 += 8;
    uint64_t v41 = [NSNumber numberWithUnsignedLongLong:v40];
    [v5 setObject:v41 forKeyedSubscript:@"EventLocationGate"];
  }
  int v42 = [v12 objectForKeyedSubscript:@"EventDevice"];
  int v43 = [v42 BOOLValue];

  if (v43)
  {
    uint64_t v44 = [v4 readBinaryValueAtBit:v17 numberOfBits:16];
    v17 += 16;
    __int16 v45 = [NSNumber numberWithUnsignedLongLong:v44];
    [v5 setObject:v45 forKeyedSubscript:@"EventDevice"];
  }
  int v46 = [v12 objectForKeyedSubscript:@"EventRouteNumber"];
  int v47 = [v46 BOOLValue];

  if (v47)
  {
    uint64_t v48 = [v4 readBinaryValueAtBit:v17 numberOfBits:16];
    v17 += 16;
    uint64_t v49 = [NSNumber numberWithUnsignedLongLong:v48];
    [v5 setObject:v49 forKeyedSubscript:@"EventRouteNumber"];
  }
  uint64_t v50 = [v12 objectForKeyedSubscript:@"EventJourneyRun"];
  int v51 = [v50 BOOLValue];

  if (v51)
  {
    uint64_t v52 = [v4 readBinaryValueAtBit:v17 numberOfBits:16];
    v17 += 16;
    uint64_t v53 = [NSNumber numberWithUnsignedLongLong:v52];
    [v5 setObject:v53 forKeyedSubscript:@"EventJourneyRun"];
  }
  int v54 = [v12 objectForKeyedSubscript:@"EventVehicleId"];
  int v55 = [v54 BOOLValue];

  if (v55)
  {
    uint64_t v56 = [v4 readBinaryValueAtBit:v17 numberOfBits:16];
    v17 += 16;
    int v57 = [NSNumber numberWithUnsignedLongLong:v56];
    [v5 setObject:v57 forKeyedSubscript:@"EventVehicleId"];
  }
  int v58 = [v12 objectForKeyedSubscript:@"EventContractPointer"];
  int v59 = [v58 BOOLValue];

  if (v59)
  {
    uint64_t v60 = [v4 readBinaryValueAtBit:v17 numberOfBits:5];
    v17 += 5;
    uint64_t v61 = [NSNumber numberWithUnsignedLongLong:v60];
    [v5 setObject:v61 forKeyedSubscript:@"EventContractPointer"];
  }
  int v62 = [v12 objectForKeyedSubscript:@"EventDataBitmap"];
  int v63 = [v62 BOOLValue];

  if (v63)
  {
    uint64_t v64 = [v4 readBinaryValueAtBit:v17 numberOfBits:5];
    id v65 = [NSNumber numberWithUnsignedLongLong:v64];
    [v5 setObject:v65 forKeyedSubscript:@"EventDataBitmap"];

    uint64_t v66 = [v4 readBinaryValueAtBit:v17 + 5 numberOfBits:14];
    uint64_t v67 = [NSNumber numberWithUnsignedLongLong:v66];
    [v5 setObject:v67 forKeyedSubscript:@"EventDataDateFirstStamp"];

    uint64_t v68 = [v4 readBinaryValueAtBit:v17 + 19 numberOfBits:11];
    id v69 = [NSNumber numberWithUnsignedLongLong:v68];
    [v5 setObject:v69 forKeyedSubscript:@"EventDataTimeFirstStamp"];
  }

  return v5;
}

+ (id)decodeContractFFBitMap:(id)a3
{
  v27[17] = *MEMORY[0x1E4F143B8];
  v26[0] = @"ContractNetworkId";
  id v3 = NSNumber;
  id v4 = a3;
  uint64_t v25 = [v3 numberWithBool:[v4 isBitSet:0]];
  v27[0] = v25;
  v26[1] = @"ContractProvider";
  uint64_t v24 = [NSNumber numberWithBool:[v4 isBitSet:1]];
  v27[1] = v24;
  void v26[2] = @"ContractTariff";
  int v23 = [NSNumber numberWithBool:[v4 isBitSet:2]];
  void v27[2] = v23;
  v26[3] = @"ContractSerialNumber";
  id v22 = [NSNumber numberWithBool:[v4 isBitSet:3]];
  v27[3] = v22;
  v26[4] = @"ContractCustomerInfoBitmap";
  uint64_t v21 = [NSNumber numberWithBool:[v4 isBitSet:4]];
  v27[4] = v21;
  v26[5] = @"ContractPassengerInfoBitmap";
  uint64_t v20 = [NSNumber numberWithBool:[v4 isBitSet:5]];
  v27[5] = v20;
  v26[6] = @"ContractPayMethod";
  int v19 = [NSNumber numberWithBool:[v4 isBitSet:8]];
  v27[6] = v19;
  v26[7] = @"ContractServices";
  unint64_t v18 = [NSNumber numberWithBool:[v4 isBitSet:9]];
  v27[7] = v18;
  v26[8] = @"ContractPriceAmount";
  uint64_t v17 = [NSNumber numberWithBool:[v4 isBitSet:10]];
  v27[8] = v17;
  v26[9] = @"ContractPriceUnit";
  unint64_t v5 = [NSNumber numberWithBool:[v4 isBitSet:11]];
  v27[9] = v5;
  v26[10] = @"ContractRestrictionBitmap";
  uint64_t v6 = [NSNumber numberWithBool:[v4 isBitSet:12]];
  v27[10] = v6;
  v26[11] = @"ContractValidityInfoBitmap";
  uint64_t v7 = [NSNumber numberWithBool:[v4 isBitSet:13]];
  v27[11] = v7;
  v26[12] = @"ContractJourneyDataBitmap";
  uint64_t v8 = [NSNumber numberWithBool:[v4 isBitSet:14]];
  v27[12] = v8;
  v26[13] = @"ContractSaleDataBitmap";
  uint64_t v9 = [NSNumber numberWithBool:[v4 isBitSet:15]];
  v27[13] = v9;
  v26[14] = @"ContractStatus";
  uint64_t v10 = [NSNumber numberWithBool:[v4 isBitSet:16]];
  v27[14] = v10;
  v26[15] = @"ContractLoyaltyPoints";
  uint64_t v11 = [NSNumber numberWithBool:[v4 isBitSet:17]];
  v27[15] = v11;
  v26[16] = @"ContractAuthenticator";
  uint64_t v12 = NSNumber;
  uint64_t v13 = [v4 isBitSet:18];

  uint64_t v14 = [v12 numberWithBool:v13];
  v27[16] = v14;
  uint64_t v15 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v27 forKeys:v26 count:17];

  return v15;
}

+ (id)decodeContractValidityBitmap:(id)a3
{
  v19[9] = *MEMORY[0x1E4F143B8];
  v18[0] = @"ContractValidityStartDate";
  id v3 = NSNumber;
  id v4 = a3;
  uint64_t v17 = [v3 numberWithBool:[v4 isBitSet:0]];
  v19[0] = v17;
  v18[1] = @"ContractValidityStartTime";
  unint64_t v5 = [NSNumber numberWithBool:[v4 isBitSet:1]];
  v19[1] = v5;
  v18[2] = @"ContractValidityEndDate";
  uint64_t v6 = [NSNumber numberWithBool:[v4 isBitSet:2]];
  v19[2] = v6;
  v18[3] = @"ContractValidityEndTime";
  uint64_t v7 = [NSNumber numberWithBool:[v4 isBitSet:3]];
  v19[3] = v7;
  v18[4] = @"ContractValidityDuration";
  uint64_t v8 = [NSNumber numberWithBool:[v4 isBitSet:4]];
  v19[4] = v8;
  v18[5] = @"ContractValidityLimitDate";
  uint64_t v9 = [NSNumber numberWithBool:[v4 isBitSet:5]];
  v19[5] = v9;
  v18[6] = @"ContractValidityZones";
  uint64_t v10 = [NSNumber numberWithBool:[v4 isBitSet:6]];
  v19[6] = v10;
  v18[7] = @"ContractValidityJourneys";
  uint64_t v11 = [NSNumber numberWithBool:[v4 isBitSet:7]];
  v19[7] = v11;
  v18[8] = @"ContractPeriodJourneys";
  uint64_t v12 = NSNumber;
  uint64_t v13 = [v4 isBitSet:8];

  uint64_t v14 = [v12 numberWithBool:v13];
  v19[8] = v14;
  uint64_t v15 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v19 forKeys:v18 count:9];

  return v15;
}

+ (id)decodeContractJourneyDataBitmap:(id)a3
{
  v18[8] = *MEMORY[0x1E4F143B8];
  v17[0] = @"ContractJourneyOrigin";
  id v3 = NSNumber;
  id v4 = a3;
  unint64_t v5 = [v3 numberWithBool:[v4 isBitSet:0]];
  v18[0] = v5;
  v17[1] = @"ContractJourneyDestination";
  uint64_t v6 = [NSNumber numberWithBool:[v4 isBitSet:1]];
  v18[1] = v6;
  v17[2] = @"ContractJourneyRouteNumbers";
  uint64_t v7 = [NSNumber numberWithBool:[v4 isBitSet:2]];
  v18[2] = v7;
  v17[3] = @"ContractJourneyRouteVariants";
  uint64_t v8 = [NSNumber numberWithBool:[v4 isBitSet:3]];
  v18[3] = v8;
  v17[4] = @"ContractJourneyRun";
  uint64_t v9 = [NSNumber numberWithBool:[v4 isBitSet:4]];
  v18[4] = v9;
  v17[5] = @"ContractJourneyVia";
  uint64_t v10 = [NSNumber numberWithBool:[v4 isBitSet:5]];
  v18[5] = v10;
  v17[6] = @"ContractJourneyDistance";
  uint64_t v11 = [NSNumber numberWithBool:[v4 isBitSet:6]];
  v18[6] = v11;
  v17[7] = @"ContractJourneyInterchanges";
  uint64_t v12 = NSNumber;
  uint64_t v13 = [v4 isBitSet:7];

  uint64_t v14 = [v12 numberWithBool:v13];
  v18[7] = v14;
  uint64_t v15 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v18 forKeys:v17 count:8];

  return v15;
}

+ (id)decodeContractSaleDataBitmap:(id)a3
{
  v14[4] = *MEMORY[0x1E4F143B8];
  v13[0] = @"ContractSaleDate";
  id v3 = NSNumber;
  id v4 = a3;
  unint64_t v5 = [v3 numberWithBool:[v4 isBitSet:0]];
  v14[0] = v5;
  v13[1] = @"ContractSaleTime";
  uint64_t v6 = [NSNumber numberWithBool:[v4 isBitSet:1]];
  v14[1] = v6;
  v13[2] = @"ContractSaleAgent";
  uint64_t v7 = [NSNumber numberWithBool:[v4 isBitSet:2]];
  v14[2] = v7;
  v13[3] = @"ContractSaleDevice";
  uint64_t v8 = NSNumber;
  uint64_t v9 = [v4 isBitSet:3];

  uint64_t v10 = [v8 numberWithBool:v9];
  v14[3] = v10;
  uint64_t v11 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v14 forKeys:v13 count:4];

  return v11;
}

+ (id)decodeContractRestrictionBitmap:(id)a3
{
  v17[7] = *MEMORY[0x1E4F143B8];
  v16[0] = @"ContractRestrictStart";
  id v3 = NSNumber;
  id v4 = a3;
  unint64_t v5 = [v3 numberWithBool:[v4 isBitSet:0]];
  v17[0] = v5;
  v16[1] = @"ContractRestrictEnd";
  uint64_t v6 = [NSNumber numberWithBool:[v4 isBitSet:1]];
  v17[1] = v6;
  v16[2] = @"ContractRestrictDay";
  uint64_t v7 = [NSNumber numberWithBool:[v4 isBitSet:2]];
  v17[2] = v7;
  v16[3] = @"ContractRestrictTimeCode";
  uint64_t v8 = [NSNumber numberWithBool:[v4 isBitSet:3]];
  v17[3] = v8;
  v16[4] = @"ContractRestrictCode";
  uint64_t v9 = [NSNumber numberWithBool:[v4 isBitSet:4]];
  v17[4] = v9;
  v16[5] = @"ContractRestrictProduct";
  uint64_t v10 = [NSNumber numberWithBool:[v4 isBitSet:5]];
  v17[5] = v10;
  v16[6] = @"ContractRestrictLocation";
  uint64_t v11 = NSNumber;
  uint64_t v12 = [v4 isBitSet:6];

  uint64_t v13 = [v11 numberWithBool:v12];
  v17[6] = v13;
  uint64_t v14 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v17 forKeys:v16 count:7];

  return v14;
}

+ (id)resolveServiceProvider:(unsigned __int8)a3
{
  uint64_t v3 = a3;
  v11[1] = *MEMORY[0x1E4F143B8];
  uint64_t v10 = &unk_1F24E1CC0;
  v11[0] = @"ATLAS";
  id v4 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v11 forKeys:&v10 count:1];
  unint64_t v5 = [NSNumber numberWithUnsignedChar:v3];
  uint64_t v6 = [v4 objectForKeyedSubscript:v5];

  if (v6)
  {
    id v7 = v6;
  }
  else
  {
    [NSString stringWithFormat:@"%d", v3];
    id v7 = (id)objc_claimAutoreleasedReturnValue();
  }
  uint64_t v8 = v7;

  return v8;
}

+ (id)getTransitModality:(id)a3
{
  uint64_t v3 = [a3 unsignedLongValue];
  if (v3 == 89) {
    return @"TransitOther";
  }
  uint64_t v5 = v3 >> 4;
  id result = @"TransitBus";
  switch(v5)
  {
    case 1:
      return result;
    case 2:
      goto LABEL_7;
    case 3:
      id result = @"TransitMetro";
      break;
    case 4:
      id result = @"TransitLightRail";
      break;
    case 5:
      id result = @"TransitTrain";
      break;
    default:
      if (v5 == 14) {
        return @"TransitOther";
      }
LABEL_7:
      id result = @"Transit";
      break;
  }
  return result;
}

+ (id)formatTransitDetailRaw:(id)a3
{
  unsigned __int8 v3 = [a3 unsignedLongValue];
  unint64_t v4 = (v3 & 0xF) - 2;
  if (v4 < 0xA && ((0x233u >> v4) & 1) != 0)
  {
    uint64_t v7 = 0;
    uint64_t v8 = 0;
    uint64_t v6 = 4;
  }
  else
  {
    uint64_t v6 = 1;
    uint64_t v7 = 0;
    uint64_t v8 = 0;
    switch(v3 >> 4)
    {
      case 1:
        uint64_t v7 = 0;
        uint64_t v8 = 2;
        break;
      case 2:
        break;
      case 3:
        uint64_t v7 = 0;
        uint64_t v8 = 1;
        break;
      case 4:
        uint64_t v8 = 3;
        uint64_t v7 = 4;
        break;
      case 5:
        uint64_t v7 = 0;
        uint64_t v8 = 3;
        break;
      default:
        uint64_t v5 = v3 >> 4;
        uint64_t v6 = 1;
        if (v5 == 14) {
          uint64_t v7 = 4;
        }
        else {
          uint64_t v7 = 0;
        }
        if (v5 == 14) {
          uint64_t v8 = 4;
        }
        else {
          uint64_t v8 = 0;
        }
        break;
    }
  }
  uint64_t v9 = [MEMORY[0x1E4F1CA58] dataWithCapacity:3];
  [v9 appendByte:v6];
  [v9 appendByte:v8];
  [v9 appendByte:v7];

  return v9;
}

+ (id)getInternalEnRouteStatus:(id)a3
{
  unint64_t v3 = ([a3 unsignedLongValue] & 0xF) - 1;
  if (v3 > 0xA) {
    return @"Unknown";
  }
  else {
    return (id)*((void *)&off_1E65AE088 + v3);
  }
}

+ (id)getAbsoluteDateComponents:(id)a3 withTime:(id)a4
{
  id v5 = a4;
  if (a3)
  {
    uint64_t v6 = [NSNumber numberWithInt:[a3 intValue] + 1];
    if (v5)
    {
      uint64_t v7 = [NSNumber numberWithInt:[v5 intValue]];
    }
    else
    {
      uint64_t v7 = &unk_1F24E1D98;
    }
    uint64_t v9 = [MEMORY[0x1E4F1C9D8] dateWithYear:1997 month:1 day:[v6 intValue] hour:0 minute:[v7 intValue] second:0];
    uint64_t v10 = [MEMORY[0x1E4F1C9A8] currentCalendar];
    [v9 setCalendar:v10];
    uint64_t v11 = [MEMORY[0x1E4F1CAF0] timeZoneWithAbbreviation:@"UTC"];
    [v9 setTimeZone:v11];

    uint64_t v12 = [v9 date];
    uint64_t v8 = [v10 components:3145852 fromDate:v12];
  }
  else
  {
    uint64_t v8 = 0;
  }

  return v8;
}

+ (id)getAbsoluteDateComponentsWithDefaultMinutes:(id)a3 withTime:(id)a4 withDefaultMinutes:(id)a5
{
  if (!a4) {
    a4 = a5;
  }
  id v5 = +[AtlasDecoder getAbsoluteDateComponents:withTime:](AtlasDecoder, "getAbsoluteDateComponents:withTime:", a3, a4, a5);

  return v5;
}

+ (id)formatCommutePlanIdentifier:(id)a3 withTariffCode:(id)a4 withZoneList:(id)a5
{
  id v7 = a3;
  id v8 = a4;
  id v9 = a5;
  uint64_t v10 = [v7 objectForKeyedSubscript:@"ContractCounterStructure"];
  if (v10)
  {
    uint64_t v11 = [v7 objectForKeyedSubscript:@"ContractCounterLastLoadCount"];
  }
  else
  {
    uint64_t v11 = 0;
  }
  uint64_t v12 = [v10 integerValue];
  uint64_t v13 = NSString;
  uint64_t v14 = [v8 intValue];
  uint64_t v15 = [v9 intValue];
  if (v12 == 3) {
    [v13 stringWithFormat:@"%05d_%02X_%d", v14, v15, [v11 intValue]];
  }
  else {
  uint64_t v16 = [v13 stringWithFormat:@"%05d_%02X_1", v14, v15, v18];
  }

  return v16;
}

+ (id)calculateTransactionSN:(id)a3 withTimeStamp:(id)a4 withEventCode:(id)a5 withSP:(id)a6 withContractPointer:(id)a7 withDifferentiator:(id)a8
{
  id v14 = &unk_1F24E1DB0;
  if (a8) {
    id v14 = a8;
  }
  id v15 = v14;
  id v31 = a8;
  id v16 = a7;
  id v17 = a6;
  id v18 = a5;
  id v19 = a4;
  id v20 = a3;
  +[HashHelper hashHelper]();
  uint64_t v21 = (char *)objc_claimAutoreleasedReturnValue();
  -[HashHelper addNumber:](v21, v20);
  id v22 = (char *)objc_claimAutoreleasedReturnValue();

  -[HashHelper addNumber:](v22, v19);
  int v23 = (char *)objc_claimAutoreleasedReturnValue();

  -[HashHelper addNumber:](v23, v18);
  uint64_t v24 = (char *)objc_claimAutoreleasedReturnValue();

  -[HashHelper addNumber:](v24, v17);
  uint64_t v25 = (char *)objc_claimAutoreleasedReturnValue();

  -[HashHelper addNumber:](v25, v16);
  id v26 = (char *)objc_claimAutoreleasedReturnValue();

  -[HashHelper addNumber:](v26, v15);
  int v27 = (char *)objc_claimAutoreleasedReturnValue();

  uint64_t v28 = -[HashHelper getHash](v27);

  uint64_t v29 = [NSNumber numberWithUnsignedInt:[v28 u32BE:0]];

  return v29;
}

+ (id)calculateCommutePlanUniqueId:(id)a3 withExpiry:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  +[HashHelper hashHelper]();
  id v7 = (char *)objc_claimAutoreleasedReturnValue();
  -[HashHelper addString:](v7, v6);
  id v8 = (char *)objc_claimAutoreleasedReturnValue();

  -[HashHelper addDateComponents:](v8, v5);
  id v9 = (char *)objc_claimAutoreleasedReturnValue();

  uint64_t v10 = -[HashHelper getHash](v9);

  uint64_t v11 = [v10 asHexString];

  return v11;
}

+ (id)commutePlanWithIdAndExpiry:(id)a3 withExpiry:(id)a4 withUniqueId:(id)a5
{
  v23[3] = *MEMORY[0x1E4F143B8];
  if (a5)
  {
    v22[0] = @"CommutePlanIdentifier";
    v22[1] = @"CommutePlanValidityEndDate";
    v23[0] = a3;
    v23[1] = a4;
    void v22[2] = @"CommutePlanUniqueIdentifier";
    void v23[2] = a5;
    id v7 = (void *)MEMORY[0x1E4F1C9E8];
    id v8 = a5;
    id v9 = a4;
    id v10 = a3;
    uint64_t v11 = v23;
    uint64_t v12 = v22;
    uint64_t v13 = v7;
    uint64_t v14 = 3;
  }
  else
  {
    v20[0] = @"CommutePlanIdentifier";
    v20[1] = @"CommutePlanValidityEndDate";
    v21[0] = a3;
    v21[1] = a4;
    id v15 = (void *)MEMORY[0x1E4F1C9E8];
    id v8 = 0;
    id v16 = a4;
    id v17 = a3;
    uint64_t v11 = v21;
    uint64_t v12 = v20;
    uint64_t v13 = v15;
    uint64_t v14 = 2;
  }
  id v18 = [v13 dictionaryWithObjects:v11 forKeys:v12 count:v14];

  return v18;
}

+ (id)amountDictionaryWithAmount:(id)a3 withIdentifier:(id)a4 usingAmountKey:(id)a5 usingCurrencyKey:(id)a6 usingExponentKey:(id)a7 usingIdentifierKey:(id)a8
{
  v29[4] = *MEMORY[0x1E4F143B8];
  uint64_t v13 = (void *)MEMORY[0x1E4F28C28];
  id v14 = a8;
  id v15 = a7;
  id v16 = a6;
  id v17 = a5;
  id v18 = a4;
  id v19 = a3;
  int v20 = [v19 intValue];
  if (v20 >= 0) {
    uint64_t v21 = v20;
  }
  else {
    uint64_t v21 = -v20;
  }
  unsigned int v22 = [v19 intValue];

  int v23 = [v13 decimalNumberWithMantissa:v21 exponent:0 isNegative:v22 >> 31];
  v28[0] = v17;
  v28[1] = v16;
  v29[0] = v23;
  v29[1] = @"XXX";
  v29[2] = &unk_1F24E1D98;
  v28[2] = v15;
  v28[3] = v14;
  uint64_t v24 = [v18 dataUsingEncoding:4];

  uint64_t v25 = [v24 asHexString];
  v29[3] = v25;
  id v26 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v29 forKeys:v28 count:4];

  return v26;
}

+ (id)getUnvalidatableContracts:(id)a3
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  unint64_t v4 = [MEMORY[0x1E4F1CA60] dictionary];
  id v17 = v3;
  id v5 = [v3 objectForKeyedSubscript:@"BestContractList"];
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  uint64_t v6 = [v5 countByEnumeratingWithState:&v18 objects:v24 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v19;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v19 != v8) {
          objc_enumerationMutation(v5);
        }
        id v10 = *(void **)(*((void *)&v18 + 1) + 8 * i);
        uint64_t v11 = ATLLogObject();
        if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 138412290;
          int v23 = v10;
          _os_log_impl(&dword_1CA552000, v11, OS_LOG_TYPE_DEBUG, "contract -> %@", buf, 0xCu);
        }

        uint64_t v12 = [v10 objectForKeyedSubscript:@"BestContractPriority"];
        char v13 = [v12 integerValue];

        if ((v13 & 0xFCu) >= 0xCuLL)
        {
          id v14 = [v10 objectForKeyedSubscript:@"BestContractPriority"];
          id v15 = [v10 objectForKeyedSubscript:@"BestContractPointer"];
          [v4 setObject:v14 forKeyedSubscript:v15];
        }
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v18 objects:v24 count:16];
    }
    while (v7);
  }

  return v4;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_timer, 0);
  objc_storeStrong((id *)&self->_transactionDetailRaw, 0);
  objc_storeStrong((id *)&self->_errorCode, 0);
  objc_storeStrong((id *)&self->_appletAID, 0);
  objc_storeStrong((id *)&self->_serviceProvider, 0);

  objc_storeStrong((id *)&self->_hciArray, 0);
}

@end