@interface NFRoutingConfig
+ (id)accessoryMultiTag;
+ (id)accessoryReaderWithLPCD;
+ (id)accessoryReaderWithPolling:(int)a3 lpcd:(BOOL)a4;
+ (id)embeddedCardEmulationWithHCE:(BOOL)a3 emulationType:(int)a4;
+ (id)embeddedExpressCardEmulation:(int)a3;
+ (id)embeddedWiredMode;
+ (id)embeddedWiredModeWithFD:(unint64_t)a3;
+ (id)embeddedWiredModeWithHCE;
+ (id)expressOnly;
+ (id)expressWithECP:(id)a3;
+ (id)hostCardEmulation;
+ (id)hostCardEmulationVASBroadcastWithFrame:(id)a3 lpcdEnable:(BOOL)a4 fieldDetect:(BOOL)a5 pollDuration:(unsigned int)a6;
+ (id)hostCardEmulationWithFieldDetect:(BOOL)a3;
+ (id)none;
+ (id)readerMode;
+ (id)readerModeWithFD:(unint64_t)a3;
+ (id)readerWithLPCD;
+ (id)readerWithLPCD:(BOOL)a3 fieldDetect:(unint64_t)a4 pollDuration:(unsigned int)a5 ecp:(id)a6;
+ (id)routingOff;
+ (id)routingOffWithFD:(unint64_t)a3;
+ (id)routingOffWithFD:(unint64_t)a3 ecp:(id)a4;
+ (id)secureElementAsReaderMode;
+ (id)wantsLPCD:(BOOL)a3 expressForEmbedded:(BOOL)a4 hostCardEmulation:(BOOL)a5 fieldDetect:(unint64_t)a6 lpcdEcpFrame:(id)a7;
- (BOOL)activeRouting;
- (BOOL)contactlessOnAny;
- (BOOL)fdOn;
- (BOOL)isEqual:(id)a3;
- (BOOL)isEquivalentRouting:(id)a3;
- (BOOL)wantsCardEmulation;
- (BOOL)wantsExpress;
- (BOOL)wantsIsoDepToHost;
- (BOOL)wantsLPCD;
- (BOOL)wantsMultiTag;
- (BOOL)wantsReader;
- (BOOL)wantsSEReader;
- (NSData)lpcdEcpFrame;
- (_NFDriverTagDiscoveryNtf)tagDiscoveryConfig;
- (id)cloneWithFieldDetect:(unint64_t)a3;
- (id)cloneWithHCE:(BOOL)a3;
- (id)cloneWithReaderDisabled;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)initFrom:(id)a3;
- (id)initPollingType:(int)a3 wantsSEReader:(BOOL)a4 wantsExpress:(BOOL)a5 cardEmulationType:(int)a6 hostMode:(unint64_t)a7 embeddedMode:(unint64_t)a8 fieldDetect:(unint64_t)a9 pollingDuration:(unsigned int)a10 lpcdEcpFrame:(id)a11;
- (id)initPollingType:(int)a3 wantsSEReader:(BOOL)a4 wantsExpress:(BOOL)a5 cardEmulationType:(int)a6 hostMode:(unint64_t)a7 embeddedMode:(unint64_t)a8 fieldDetect:(unint64_t)a9 pollingDuration:(unsigned int)a10 lpcdEcpFrame:(id)a11 ecpBroadcast:(BOOL)a12;
- (int)cardEmulationType;
- (int)polling;
- (int)pollingType;
- (unint64_t)embeddedMode;
- (unint64_t)fieldDetectType;
- (unint64_t)hostMode;
- (unsigned)pollingDuration;
- (void)_setMultiTag:(BOOL)a3;
- (void)calculateFieldDetectEnabled:(BOOL)a3;
- (void)setPollingMask:(int)a3 tagConfig:(_NFDriverTagDiscoveryNtf)a4;
@end

@implementation NFRoutingConfig

- (id)initPollingType:(int)a3 wantsSEReader:(BOOL)a4 wantsExpress:(BOOL)a5 cardEmulationType:(int)a6 hostMode:(unint64_t)a7 embeddedMode:(unint64_t)a8 fieldDetect:(unint64_t)a9 pollingDuration:(unsigned int)a10 lpcdEcpFrame:(id)a11
{
  LOBYTE(v13) = 0;
  LODWORD(v12) = a10;
  return [(NFRoutingConfig *)self initPollingType:*(void *)&a3 wantsSEReader:a4 wantsExpress:a5 cardEmulationType:*(void *)&a6 hostMode:a7 embeddedMode:a8 fieldDetect:a9 pollingDuration:v12 lpcdEcpFrame:a11 ecpBroadcast:v13];
}

- (id)initPollingType:(int)a3 wantsSEReader:(BOOL)a4 wantsExpress:(BOOL)a5 cardEmulationType:(int)a6 hostMode:(unint64_t)a7 embeddedMode:(unint64_t)a8 fieldDetect:(unint64_t)a9 pollingDuration:(unsigned int)a10 lpcdEcpFrame:(id)a11 ecpBroadcast:(BOOL)a12
{
  BOOL v16 = a4;
  id v20 = a11;
  v40.receiver = self;
  v40.super_class = (Class)NFRoutingConfig;
  v21 = [(NFRoutingConfig *)&v40 init];
  v22 = v21;
  if (v21)
  {
    v21->_wantsSEReader = v16;
    if (v16) {
      int v23 = 1;
    }
    else {
      int v23 = a3;
    }
    if (a3 == 2) {
      int v23 = 2;
    }
    v21->_hostMode = a7;
    v21->_embeddedMode = a8;
    v21->_pollingType = v23;
    v21->_cardEmulationType = a6;
    if (a6) {
      BOOL v24 = a5;
    }
    else {
      BOOL v24 = 0;
    }
    v21->_wantsExpress = v24;
    v21->_fieldDetectType = a9;
    v21->_pollingDuration = a10;
    v21->_polling = 0;
    v21->_fdOn = 0;
    objc_storeStrong((id *)&v21->_lpcdEcpFrame, a11);
    v22->_tagDiscoveryConfig = 0;
    if ((v22->_pollingType - 1) <= 1)
    {
      if (a12 && [v20 length])
      {
        dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
        uint64_t Logger = NFLogGetLogger();
        if (Logger)
        {
          v26 = (void (*)(uint64_t, const char *, ...))Logger;
          Class = object_getClass(v22);
          BOOL isMetaClass = class_isMetaClass(Class);
          ClassName = object_getClassName(v22);
          Name = sel_getName(a2);
          uint64_t v30 = 45;
          if (isMetaClass) {
            uint64_t v30 = 43;
          }
          v26(6, "%c[%{public}s %{public}s]:%i ECP broadcast", v30, ClassName, Name, 75);
        }
        dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
        v31 = NFSharedLogGetLogger();
        if (os_log_type_enabled(v31, OS_LOG_TYPE_DEFAULT))
        {
          v32 = object_getClass(v22);
          if (class_isMetaClass(v32)) {
            int v33 = 43;
          }
          else {
            int v33 = 45;
          }
          v34 = object_getClassName(v22);
          v35 = sel_getName(a2);
          *(_DWORD *)buf = 67109890;
          int v42 = v33;
          __int16 v43 = 2082;
          v44 = v34;
          __int16 v45 = 2082;
          v46 = v35;
          __int16 v47 = 1024;
          int v48 = 75;
          _os_log_impl((void *)&_mh_execute_header, v31, OS_LOG_TYPE_DEFAULT, "%c[%{public}s %{public}s]:%i ECP broadcast", buf, 0x22u);
        }

        v22->_polling = 16;
      }
      else
      {
        if (v22->_wantsSEReader) {
          int v36 = 15;
        }
        else {
          int v36 = 31;
        }
        v22->_polling = v36;
        v22->_tagDiscoveryConfig = (_NFDriverTagDiscoveryNtf)1791;
      }
    }
    v37 = v22;
  }

  return v22;
}

- (id)initFrom:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)NFRoutingConfig;
  v5 = [(NFRoutingConfig *)&v9 init];
  v6 = v5;
  if (v5)
  {
    v5->_wantsSEReader = *((unsigned char *)v4 + 8);
    v5->_wantsExpress = *((unsigned char *)v4 + 9);
    v5->_pollingType = *((_DWORD *)v4 + 3);
    v5->_cardEmulationType = *((_DWORD *)v4 + 4);
    v5->_hostMode = *((void *)v4 + 4);
    v5->_embeddedMode = *((void *)v4 + 5);
    v5->_fieldDetectType = *((void *)v4 + 6);
    v5->_pollingDuration = *((_DWORD *)v4 + 5);
    v5->_polling = *((_DWORD *)v4 + 6);
    v5->_tagDiscoveryConfig = (_NFDriverTagDiscoveryNtf)*((_DWORD *)v4 + 7);
    v5->_fdOn = *((unsigned char *)v4 + 11);
    objc_storeStrong((id *)&v5->_lpcdEcpFrame, *((id *)v4 + 7));
    v7 = v6;
  }

  return v6;
}

- (BOOL)wantsIsoDepToHost
{
  return self->_hostMode == 2 && self->_embeddedMode != 2;
}

- (BOOL)wantsCardEmulation
{
  return (self->_hostMode == 2 || self->_embeddedMode == 2)
      && [(NFRoutingConfig *)self cardEmulationType] != 0;
}

- (BOOL)wantsReader
{
  return (self->_pollingType - 1) < 2;
}

- (BOOL)wantsLPCD
{
  return self->_pollingType == 2;
}

- (void)_setMultiTag:(BOOL)a3
{
  self->_wantsMultiTag = a3;
}

- (BOOL)isEquivalentRouting:(id)a3
{
  id v4 = (NFRoutingConfig *)a3;
  v5 = v4;
  if (self == v4) {
    goto LABEL_12;
  }
  if (self->_cardEmulationType != v4->_cardEmulationType
    || self->_wantsExpress != v4->_wantsExpress
    || self->_wantsSEReader != v4->_wantsSEReader
    || self->_pollingType != v4->_pollingType
    || self->_hostMode != v4->_hostMode
    || self->_embeddedMode != v4->_embeddedMode
    || self->_pollingDuration != v4->_pollingDuration
    || self->_polling != v4->_polling)
  {
    goto LABEL_14;
  }
  lpcdEcpFrame = self->_lpcdEcpFrame;
  v7 = v5->_lpcdEcpFrame;
  if (!lpcdEcpFrame)
  {
    if (!v7) {
      goto LABEL_12;
    }
LABEL_14:
    BOOL v8 = 0;
    goto LABEL_15;
  }
  if (![(NSData *)lpcdEcpFrame isEqualToData:v7]) {
    goto LABEL_14;
  }
LABEL_12:
  BOOL v8 = 1;
LABEL_15:

  return v8;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (NFRoutingConfig *)a3;
  BOOL v5 = self == v4
    || [(NFRoutingConfig *)v4 isMemberOfClass:objc_opt_class()]
    && [(NFRoutingConfig *)self isEquivalentRouting:v4]
    && self->_fieldDetectType == v4->_fieldDetectType;

  return v5;
}

- (id)cloneWithReaderDisabled
{
  v2 = [(NFRoutingConfig *)self copy];
  v2[3] = 0;
  *((unsigned char *)v2 + 8) = 0;

  return v2;
}

- (id)cloneWithHCE:(BOOL)a3
{
  BOOL v3 = a3;
  id v4 = [(NFRoutingConfig *)self copy];
  if (v3)
  {
    v4[4] |= 3u;
    *((void *)v4 + 4) = 2;
  }
  else
  {
    *((void *)v4 + 4) = 0;
    if (*((void *)v4 + 5) != 2) {
      v4[4] = 0;
    }
  }

  return v4;
}

- (id)cloneWithFieldDetect:(unint64_t)a3
{
  id v4 = [(NFRoutingConfig *)self copy];
  v4[6] = a3;

  return v4;
}

- (void)calculateFieldDetectEnabled:(BOOL)a3
{
  unint64_t fieldDetectType = self->_fieldDetectType;
  if (!fieldDetectType)
  {
    self->_BOOL fdOn = 0;
    dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    uint64_t Logger = NFLogGetLogger();
    if (Logger)
    {
      v21 = (void (*)(uint64_t, const char *, ...))Logger;
      Class = object_getClass(self);
      BOOL isMetaClass = class_isMetaClass(Class);
      ClassName = object_getClassName(self);
      Name = sel_getName(a2);
      uint64_t v26 = 45;
      if (isMetaClass) {
        uint64_t v26 = 43;
      }
      v21(6, "%c[%{public}s %{public}s]:%i Field detect force disable: %d", v26, ClassName, Name, 268, self->_fdOn);
    }
    dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    uint64_t v13 = NFSharedLogGetLogger();
    if (!os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_32;
    }
    v27 = object_getClass(self);
    if (class_isMetaClass(v27)) {
      int v28 = 43;
    }
    else {
      int v28 = 45;
    }
    v29 = object_getClassName(self);
    uint64_t v30 = sel_getName(a2);
    BOOL fdOn = self->_fdOn;
    *(_DWORD *)buf = 67110146;
    int v45 = v28;
    __int16 v46 = 2082;
    __int16 v47 = v29;
    __int16 v48 = 2082;
    v49 = v30;
    __int16 v50 = 1024;
    int v51 = 268;
    __int16 v52 = 1024;
    BOOL v53 = fdOn;
    v19 = "%c[%{public}s %{public}s]:%i Field detect force disable: %d";
    goto LABEL_31;
  }
  if (fieldDetectType == 2)
  {
    self->_BOOL fdOn = 1;
    dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    uint64_t v32 = NFLogGetLogger();
    if (v32)
    {
      int v33 = (void (*)(uint64_t, const char *, ...))v32;
      v34 = object_getClass(self);
      BOOL v35 = class_isMetaClass(v34);
      int v36 = object_getClassName(self);
      v37 = sel_getName(a2);
      uint64_t v38 = 45;
      if (v35) {
        uint64_t v38 = 43;
      }
      v33(6, "%c[%{public}s %{public}s]:%i Field detect force enable: %d", v38, v36, v37, 263, self->_fdOn);
    }
    dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    uint64_t v13 = NFSharedLogGetLogger();
    if (!os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_32;
    }
    v39 = object_getClass(self);
    if (class_isMetaClass(v39)) {
      int v40 = 43;
    }
    else {
      int v40 = 45;
    }
    v41 = object_getClassName(self);
    int v42 = sel_getName(a2);
    BOOL v43 = self->_fdOn;
    *(_DWORD *)buf = 67110146;
    int v45 = v40;
    __int16 v46 = 2082;
    __int16 v47 = v41;
    __int16 v48 = 2082;
    v49 = v42;
    __int16 v50 = 1024;
    int v51 = 263;
    __int16 v52 = 1024;
    BOOL v53 = v43;
    v19 = "%c[%{public}s %{public}s]:%i Field detect force enable: %d";
    goto LABEL_31;
  }
  if (fieldDetectType != 1) {
    return;
  }
  self->_BOOL fdOn = a3;
  dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
  uint64_t v6 = NFLogGetLogger();
  if (v6)
  {
    v7 = (void (*)(uint64_t, const char *, ...))v6;
    BOOL v8 = object_getClass(self);
    BOOL v9 = class_isMetaClass(v8);
    v10 = object_getClassName(self);
    v11 = sel_getName(a2);
    uint64_t v12 = 45;
    if (v9) {
      uint64_t v12 = 43;
    }
    v7(6, "%c[%{public}s %{public}s]:%i Field Detect allowed: %d", v12, v10, v11, 258, self->_fdOn);
  }
  dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
  uint64_t v13 = NFSharedLogGetLogger();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    v14 = object_getClass(self);
    if (class_isMetaClass(v14)) {
      int v15 = 43;
    }
    else {
      int v15 = 45;
    }
    BOOL v16 = object_getClassName(self);
    v17 = sel_getName(a2);
    BOOL v18 = self->_fdOn;
    *(_DWORD *)buf = 67110146;
    int v45 = v15;
    __int16 v46 = 2082;
    __int16 v47 = v16;
    __int16 v48 = 2082;
    v49 = v17;
    __int16 v50 = 1024;
    int v51 = 258;
    __int16 v52 = 1024;
    BOOL v53 = v18;
    v19 = "%c[%{public}s %{public}s]:%i Field Detect allowed: %d";
LABEL_31:
    _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, v19, buf, 0x28u);
  }
LABEL_32:
}

- (BOOL)contactlessOnAny
{
  return self->_hostMode == 2 || self->_embeddedMode == 2;
}

- (BOOL)activeRouting
{
  return self->_embeddedMode || self->_hostMode != 0;
}

- (id)description
{
  unint64_t fieldDetectType = self->_fieldDetectType;
  id v4 = off_100301F28[[(NFRoutingConfig *)self cardEmulationType]];
  BOOL wantsExpress = self->_wantsExpress;
  uint64_t pollingType = self->_pollingType;
  unint64_t hostMode = self->_hostMode;
  unint64_t embeddedMode = self->_embeddedMode;
  uint64_t pollingDuration = self->_pollingDuration;
  unsigned int v10 = [(NFRoutingConfig *)self wantsIsoDepToHost];
  lpcdEcpFrame = self->_lpcdEcpFrame;
  if (!lpcdEcpFrame) {
    lpcdEcpFrame = (NSData *)&stru_100309C40;
  }
  uint64_t v12 = "yes";
  if (self->_wantsSEReader) {
    uint64_t v13 = "yes";
  }
  else {
    uint64_t v13 = "no";
  }
  if (v10) {
    v14 = "yes";
  }
  else {
    v14 = "no";
  }
  if (pollingType == 2) {
    int v15 = "yes";
  }
  else {
    int v15 = "no";
  }
  if (!wantsExpress) {
    uint64_t v12 = "no";
  }
  return +[NSString stringWithFormat:@"fieldDetect=%lu cardType=%s express=%s lpcd=%s pollingType=%lu duration=%d host=%lu embedded=%lu isoDepToHostEnable=%s wantsESEReader=%s lpcdEcpFrame=%@", fieldDetectType, v4, v12, v15, pollingType, pollingDuration, hostMode, embeddedMode, v14, v13, lpcdEcpFrame];
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = +[NFRoutingConfig allocWithZone:a3];

  return [(NFRoutingConfig *)v4 initFrom:self];
}

+ (id)secureElementAsReaderMode
{
  LODWORD(v4) = 0;
  id v2 = [[NFRoutingConfig alloc] initPollingType:1 wantsSEReader:1 wantsExpress:0 cardEmulationType:0 hostMode:0 embeddedMode:1 fieldDetect:0 pollingDuration:v4 lpcdEcpFrame:0];

  return v2;
}

+ (id)hostCardEmulation
{
  LODWORD(v4) = 0;
  id v2 = [[NFRoutingConfig alloc] initPollingType:0 wantsSEReader:0 wantsExpress:0 cardEmulationType:3 hostMode:2 embeddedMode:0 fieldDetect:2 pollingDuration:v4 lpcdEcpFrame:0];

  return v2;
}

+ (id)hostCardEmulationWithFieldDetect:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v4 = [NFRoutingConfig alloc];
  uint64_t v5 = 2;
  if (!v3) {
    uint64_t v5 = 0;
  }
  LODWORD(v8) = 0;
  id v6 = [(NFRoutingConfig *)v4 initPollingType:0 wantsSEReader:0 wantsExpress:0 cardEmulationType:3 hostMode:2 embeddedMode:0 fieldDetect:v5 pollingDuration:v8 lpcdEcpFrame:0];

  return v6;
}

+ (id)hostCardEmulationVASBroadcastWithFrame:(id)a3 lpcdEnable:(BOOL)a4 fieldDetect:(BOOL)a5 pollDuration:(unsigned int)a6
{
  BOOL v7 = a5;
  BOOL v8 = a4;
  id v9 = a3;
  unsigned int v10 = [NFRoutingConfig alloc];
  if (v8) {
    uint64_t v11 = 2;
  }
  else {
    uint64_t v11 = 1;
  }
  uint64_t v12 = 2;
  if (!v7) {
    uint64_t v12 = 0;
  }
  LOBYTE(v16) = 1;
  LODWORD(v15) = a6;
  id v13 = [(NFRoutingConfig *)v10 initPollingType:v11 wantsSEReader:0 wantsExpress:0 cardEmulationType:3 hostMode:2 embeddedMode:0 fieldDetect:v12 pollingDuration:v15 lpcdEcpFrame:v9 ecpBroadcast:v16];

  return v13;
}

+ (id)embeddedWiredMode
{
  return +[NFRoutingConfig embeddedWiredModeWithFD:3];
}

+ (id)embeddedWiredModeWithFD:(unint64_t)a3
{
  LODWORD(v5) = 0;
  id v3 = [[NFRoutingConfig alloc] initPollingType:0 wantsSEReader:0 wantsExpress:0 cardEmulationType:0 hostMode:0 embeddedMode:1 fieldDetect:a3 pollingDuration:v5 lpcdEcpFrame:0];

  return v3;
}

+ (id)embeddedWiredModeWithHCE
{
  LODWORD(v4) = 0;
  id v2 = [[NFRoutingConfig alloc] initPollingType:0 wantsSEReader:0 wantsExpress:0 cardEmulationType:3 hostMode:2 embeddedMode:1 fieldDetect:2 pollingDuration:v4 lpcdEcpFrame:0];

  return v2;
}

+ (id)embeddedCardEmulationWithHCE:(BOOL)a3 emulationType:(int)a4
{
  uint64_t v4 = *(void *)&a4;
  if (a4)
  {
    uint64_t v6 = 2;
  }
  else
  {
    uint64_t v12 = +[NSAssertionHandler currentHandler];
    [v12 handleFailureInMethod:a2 object:a1 file:@"NFRoutingConfig.m" lineNumber:404 description:@"Expects card type to *not* be NFCardTypeNone"];

    uint64_t v6 = 0;
  }
  if ((v4 & 3) != 0 && a3) {
    uint64_t v7 = 2;
  }
  else {
    uint64_t v7 = 0;
  }
  LODWORD(v13) = 0;
  id v8 = [[NFRoutingConfig alloc] initPollingType:0 wantsSEReader:0 wantsExpress:0 cardEmulationType:v4 hostMode:v7 embeddedMode:v6 fieldDetect:2 pollingDuration:v13 lpcdEcpFrame:0];

  return v8;
}

+ (id)routingOff
{
  return +[NFRoutingConfig routingOffWithFD:3 ecp:0];
}

+ (id)routingOffWithFD:(unint64_t)a3
{
  return +[NFRoutingConfig routingOffWithFD:a3 ecp:0];
}

+ (id)routingOffWithFD:(unint64_t)a3 ecp:(id)a4
{
  id v5 = a4;
  LODWORD(v8) = 0;
  id v6 = [[NFRoutingConfig alloc] initPollingType:0 wantsSEReader:0 wantsExpress:0 cardEmulationType:0 hostMode:0 embeddedMode:0 fieldDetect:a3 pollingDuration:v8 lpcdEcpFrame:v5];

  return v6;
}

+ (id)none
{
  return +[NFRoutingConfig routingOffWithFD:0];
}

+ (id)wantsLPCD:(BOOL)a3 expressForEmbedded:(BOOL)a4 hostCardEmulation:(BOOL)a5 fieldDetect:(unint64_t)a6 lpcdEcpFrame:(id)a7
{
  BOOL v7 = a4;
  if (a5) {
    unsigned int v8 = 3;
  }
  else {
    unsigned int v8 = 0;
  }
  if (a5) {
    uint64_t v9 = 2;
  }
  else {
    uint64_t v9 = 0;
  }
  if (a4) {
    uint64_t v10 = 2;
  }
  else {
    uint64_t v10 = 0;
  }
  if (a4) {
    uint64_t v11 = 7;
  }
  else {
    uint64_t v11 = v8;
  }
  if (a4 || a5) {
    unint64_t v12 = 2;
  }
  else {
    unint64_t v12 = a6;
  }
  if (a3) {
    uint64_t v13 = 2;
  }
  else {
    uint64_t v13 = 0;
  }
  id v14 = a7;
  LODWORD(v17) = 0;
  id v15 = [[NFRoutingConfig alloc] initPollingType:v13 wantsSEReader:0 wantsExpress:v7 cardEmulationType:v11 hostMode:v9 embeddedMode:v10 fieldDetect:v12 pollingDuration:v17 lpcdEcpFrame:v14];

  return v15;
}

+ (id)expressOnly
{
  return +[NFRoutingConfig expressWithECP:0];
}

+ (id)expressWithECP:(id)a3
{
  id v3 = a3;
  LODWORD(v6) = 0;
  id v4 = [[NFRoutingConfig alloc] initPollingType:0 wantsSEReader:0 wantsExpress:1 cardEmulationType:7 hostMode:0 embeddedMode:2 fieldDetect:2 pollingDuration:v6 lpcdEcpFrame:v3];

  return v4;
}

+ (id)embeddedExpressCardEmulation:(int)a3
{
  uint64_t v3 = *(void *)&a3;
  if (!a3)
  {
    unsigned int v8 = +[NSAssertionHandler currentHandler];
    [v8 handleFailureInMethod:a2 object:a1 file:@"NFRoutingConfig.m" lineNumber:516 description:@"Expects card type to *not* be NFCardTypeNone"];
  }
  LODWORD(v9) = 0;
  id v4 = [[NFRoutingConfig alloc] initPollingType:0 wantsSEReader:0 wantsExpress:1 cardEmulationType:v3 hostMode:0 embeddedMode:2 fieldDetect:2 pollingDuration:v9 lpcdEcpFrame:0];

  return v4;
}

- (void)setPollingMask:(int)a3 tagConfig:(_NFDriverTagDiscoveryNtf)a4
{
  if (!*(_DWORD *)&a4)
  {
    unsigned int v8 = +[NSAssertionHandler currentHandler];
    [v8 handleFailureInMethod:a2 object:self file:@"NFRoutingConfig.m" lineNumber:534 description:@"Tag Discovery cannot be empty"];

    if (a3) {
      goto LABEL_3;
    }
LABEL_5:
    uint64_t v9 = +[NSAssertionHandler currentHandler];
    [v9 handleFailureInMethod:a2 object:self file:@"NFRoutingConfig.m" lineNumber:535 description:@"Polling mask invalid"];

    goto LABEL_3;
  }
  if (!a3) {
    goto LABEL_5;
  }
LABEL_3:
  self->_polling = a3;
  self->_tagDiscoveryConfig = a4;
}

+ (id)readerMode
{
  return +[NFRoutingConfig readerWithLPCD:0 fieldDetect:3 pollDuration:0 ecp:0];
}

+ (id)readerModeWithFD:(unint64_t)a3
{
  return +[NFRoutingConfig readerWithLPCD:0 fieldDetect:a3 pollDuration:0 ecp:0];
}

+ (id)readerWithLPCD
{
  return +[NFRoutingConfig readerWithLPCD:1 fieldDetect:1 pollDuration:0 ecp:0];
}

+ (id)readerWithLPCD:(BOOL)a3 fieldDetect:(unint64_t)a4 pollDuration:(unsigned int)a5 ecp:(id)a6
{
  BOOL v8 = a3;
  id v9 = a6;
  uint64_t v10 = [NFRoutingConfig alloc];
  if (v8) {
    uint64_t v11 = 2;
  }
  else {
    uint64_t v11 = 1;
  }
  LODWORD(v14) = a5;
  id v12 = [(NFRoutingConfig *)v10 initPollingType:v11 wantsSEReader:0 wantsExpress:0 cardEmulationType:0 hostMode:0 embeddedMode:0 fieldDetect:a4 pollingDuration:v14 lpcdEcpFrame:v9];

  return v12;
}

+ (id)accessoryMultiTag
{
  LODWORD(v4) = 0;
  id v2 = [[NFRoutingConfig alloc] initPollingType:3 wantsSEReader:0 wantsExpress:0 cardEmulationType:0 hostMode:0 embeddedMode:0 fieldDetect:2 pollingDuration:v4 lpcdEcpFrame:0];
  [v2 _setMultiTag:1];

  return v2;
}

+ (id)accessoryReaderWithLPCD
{
  id v2 = +[NFRoutingConfig readerWithLPCD];
  [v2 setPollingMask:239 tagConfig:16127];

  return v2;
}

+ (id)accessoryReaderWithPolling:(int)a3 lpcd:(BOOL)a4
{
  uint64_t v4 = *(void *)&a3;
  id v5 = +[NFRoutingConfig readerWithLPCD:a4 fieldDetect:1 pollDuration:0 ecp:0];
  [v5 setPollingMask:v4 tagConfig:16127];

  return v5;
}

- (int)pollingType
{
  return self->_pollingType;
}

- (unint64_t)hostMode
{
  return self->_hostMode;
}

- (unint64_t)embeddedMode
{
  return self->_embeddedMode;
}

- (BOOL)wantsSEReader
{
  return self->_wantsSEReader;
}

- (BOOL)wantsExpress
{
  return self->_wantsExpress;
}

- (int)cardEmulationType
{
  return self->_cardEmulationType;
}

- (unint64_t)fieldDetectType
{
  return self->_fieldDetectType;
}

- (unsigned)pollingDuration
{
  return self->_pollingDuration;
}

- (int)polling
{
  return self->_polling;
}

- (_NFDriverTagDiscoveryNtf)tagDiscoveryConfig
{
  return self->_tagDiscoveryConfig;
}

- (BOOL)wantsMultiTag
{
  return self->_wantsMultiTag;
}

- (BOOL)fdOn
{
  return self->_fdOn;
}

- (NSData)lpcdEcpFrame
{
  return self->_lpcdEcpFrame;
}

- (void).cxx_destruct
{
}

@end