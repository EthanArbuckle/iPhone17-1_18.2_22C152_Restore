@interface NFSecureElementWrapper
+ (BOOL)isAuthRandomEntangled;
+ (void)setAuthRandomEntangled;
- (BOOL)hasMultiOS;
- (BOOL)isOperational;
- (BOOL)isProd;
- (BOOL)isSecureElement:(int)a3;
- (BOOL)jcopSupportsEntanglement;
- (BOOL)jcopSupportsPerBootAuthKeys;
- (BOOL)select:(id)a3 error:(id *)a4;
- (BOOL)selectApplet:(id)a3 error:(id *)a4;
- (BOOL)upgradeChecked;
- (NFApplet)activeApplet;
- (NFSecureElementHandleInterface)handle;
- (NFSecureElementWrapper)initWithHandle:(id)a3;
- (NFSecureElementWrapperDelegate)delegate;
- (NSArray)cachedAppletsUnfiltered;
- (NSData)serialNumberAsData;
- (NSData)systemOSSerialNumberAsData;
- (NSNumber)cachedAppletUpdateCounter;
- (NSString)eccCertificate;
- (NSString)eckaCertificate;
- (NSString)rsaCertificate;
- (NSString)serialNumber;
- (NSString)systemOSSerialNumber;
- (id)_crsGetSharingRequest:(id *)a3 signature:(id *)a4;
- (id)_crsSetSharingResult:(id)a3 signature:(id)a4;
- (id)allocateSlot:(unsigned __int8)a3 authorizingUser:(unsigned __int8)a4 authorizingUserToken:(id)a5 outToken:(id *)a6 outWriteCount:(unsigned int *)a7 appletResult:(unsigned __int16 *)a8;
- (id)authorizeUpdate:(BOOL)a3 slotIndex:(unsigned __int8)a4 userToken:(id)a5 outWriteCount:(unsigned int *)a6 appletResult:(unsigned __int16 *)a7;
- (id)checkDeepSleepTimerRunning:(unint64_t *)a3;
- (id)checkPairing;
- (id)checkPerBootAuthKeysAreStillPresent;
- (id)deleteSlot:(unsigned __int8)a3 outWriteCount:(unsigned int *)a4 appletResult:(unsigned __int16 *)a5;
- (id)derive:(unsigned __int8)a3 userHash:(id)a4 outData:(id *)a5 outWriteCount:(unsigned int *)a6 appletResult:(unsigned __int16 *)a7;
- (id)getAuthQueue;
- (id)getData:(id *)a3 updateKUD:(char *)a4 outWriteLimit:(unsigned int *)a5 outWriteCount:(unsigned int *)a6 appletResult:(unsigned __int16 *)a7;
- (id)getData:(unsigned __int8)a3 tag:(unsigned int)a4 data:(id)a5 error:(id *)a6;
- (id)getData:(unsigned int)a3;
- (id)getData:(unsigned int)a3 subtag:(unsigned int)a4;
- (id)getHash:(id *)a3 appletResult:(unsigned __int16 *)a4;
- (id)globalUnmountCOX;
- (id)mountCOXForApplets:(id)a3;
- (id)negotiatePerBootAuthKeys;
- (id)performSharing;
- (id)powerCycleOrReset;
- (id)queryISDCounter:(id *)a3;
- (id)readBinary:(unsigned __int8)a3 offset:(unsigned int)a4 tag:(unsigned int)a5 error:(id *)a6;
- (id)readBinary:(unsigned int)a3;
- (id)recoverSLAM;
- (id)refreshISDCounter;
- (id)resetCounter:(unsigned __int8)a3 userToken:(id)a4 outWriteCount:(unsigned int *)a5 appletResult:(unsigned __int16 *)a6;
- (id)selectByName:(id)a3 error:(id *)a4;
- (id)selectCRSWithError:(id *)a3;
- (id)sendCommandWithClass:(unsigned __int8)a3 instruction:(unsigned __int8)a4 p1:(unsigned __int8)a5 p2:(unsigned __int8)a6 data:(id)a7 error:(id *)a8;
- (id)sendCommandWithClass:(unsigned __int8)a3 instruction:(unsigned __int8)a4 p1:(unsigned __int8)a5 p2:(unsigned __int8)a6 data:(id)a7 expectedLength:(unsigned __int16)a8 toOS:(int64_t)a9 useExtendedLength:(BOOL)a10 error:(id *)a11;
- (id)sendCommandWithClass:(unsigned __int8)a3 instruction:(unsigned __int8)a4 p1:(unsigned __int8)a5 p2:(unsigned __int8)a6 data:(id)a7 expectedLength:(unsigned __int8)a8 toOS:(int64_t)a9 error:(id *)a10;
- (id)sendRepeatingExtendedCommandWithClass:(unsigned __int8)a3 instruction:(unsigned __int8)a4 p1:(unsigned __int8)a5 firstP2:(unsigned __int8)a6 nextP2:(unsigned __int8)a7 expectedLength:(unsigned __int16)a8 toOS:(int64_t)a9 error:(id *)a10;
- (id)transceive:(id)a3 error:(id *)a4;
- (id)transceiveData:(id)a3 toOS:(int64_t)a4 error:(id *)a5;
- (id)upgradeKey:(unsigned __int8)a3 inputData:(id)a4 outWriteCount:(unsigned int *)a5 appletResult:(unsigned __int16 *)a6;
- (unint64_t)_crsGetPersoState:(id *)a3;
- (unint64_t)getPairingVersion;
- (unint64_t)pairedState;
- (unint64_t)supportedTechnologies;
- (void)setActiveApplet:(id)a3;
- (void)setCachedAppletUpdateCounter:(id)a3;
- (void)setCachedAppletsUnfiltered:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setUnpairedState;
- (void)setUpgradeChecked:(BOOL)a3;
- (void)storePairedState;
@end

@implementation NFSecureElementWrapper

- (id)allocateSlot:(unsigned __int8)a3 authorizingUser:(unsigned __int8)a4 authorizingUserToken:(id)a5 outToken:(id *)a6 outWriteCount:(unsigned int *)a7 appletResult:(unsigned __int16 *)a8
{
  uint64_t v11 = a4;
  uint64_t v12 = a3;
  id v110 = a5;
  id v15 = [objc_alloc((Class)NSData) initWithBytes:&unk_100283628 length:8];
  id v112 = 0;
  v16 = [(NFSecureElementWrapper *)self selectByName:v15 error:&v112];
  id v17 = v112;

  if (v16)
  {
    if ([v16 status] == 36864)
    {
      id v111 = v17;
      v18 = [(NFSecureElementWrapper *)self sendCommandWithClass:128 instruction:0 p1:v12 p2:v11 data:v110 error:&v111];
      id v19 = v111;

      if (!v18)
      {
        dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
        uint64_t Logger = NFLogGetLogger();
        if (Logger)
        {
          v62 = (void (*)(uint64_t, const char *, ...))Logger;
          Class = object_getClass(self);
          BOOL isMetaClass = class_isMetaClass(Class);
          ClassName = object_getClassName(self);
          Name = sel_getName(a2);
          uint64_t v66 = 45;
          if (isMetaClass) {
            uint64_t v66 = 43;
          }
          v62(3, "%c[%{public}s %{public}s]:%i Nil response", v66, ClassName, Name, 47);
        }
        dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
        v67 = NFSharedLogGetLogger();
        if (os_log_type_enabled(v67, OS_LOG_TYPE_ERROR))
        {
          v68 = object_getClass(self);
          if (class_isMetaClass(v68)) {
            int v69 = 43;
          }
          else {
            int v69 = 45;
          }
          v70 = object_getClassName(self);
          v71 = sel_getName(a2);
          *(_DWORD *)buf = 67109890;
          int v126 = v69;
          __int16 v127 = 2082;
          v128 = v70;
          __int16 v129 = 2082;
          v130 = v71;
          __int16 v131 = 1024;
          int v132 = 47;
          _os_log_impl((void *)&_mh_execute_header, v67, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i Nil response", buf, 0x22u);
        }

        if (v19 && [v19 code])
        {
          id v72 = objc_alloc((Class)NSError);
          v18 = +[NSString stringWithUTF8String:"nfcd"];
          id v73 = [v19 code];
          v117[0] = NSLocalizedDescriptionKey;
          if ((uint64_t)[v19 code] > 70) {
            uint64_t v74 = 71;
          }
          else {
            uint64_t v74 = (uint64_t)[v19 code];
          }
          v49 = +[NSString stringWithUTF8String:off_1003016A0[v74]];
          v118[0] = v49;
          v118[1] = v19;
          v117[1] = NSUnderlyingErrorKey;
          v117[2] = @"Line";
          v118[2] = &off_100319EE8;
          v117[3] = @"Method";
          id v101 = [objc_alloc((Class)NSString) initWithFormat:@"%s", sel_getName(a2)];
          v118[3] = v101;
          v117[4] = NSDebugDescriptionErrorKey;
          id v102 = [objc_alloc((Class)NSString) initWithFormat:@"%s:%d", sel_getName(a2), 48];
          v118[4] = v102;
          v103 = +[NSDictionary dictionaryWithObjects:v118 forKeys:v117 count:5];
          id v60 = [v72 initWithDomain:v18 code:v73 userInfo:v103];
        }
        else
        {
          id v97 = objc_alloc((Class)NSError);
          v18 = +[NSString stringWithUTF8String:"nfcd"];
          v115[0] = NSLocalizedDescriptionKey;
          v49 = +[NSString stringWithUTF8String:"Unknown Error"];
          v116[0] = v49;
          v116[1] = &off_100319EE8;
          v115[1] = @"Line";
          v115[2] = @"Method";
          id v98 = [objc_alloc((Class)NSString) initWithFormat:@"%s", sel_getName(a2)];
          v116[2] = v98;
          v115[3] = NSDebugDescriptionErrorKey;
          id v99 = [objc_alloc((Class)NSString) initWithFormat:@"%s:%d", sel_getName(a2), 48];
          v116[3] = v99;
          v100 = +[NSDictionary dictionaryWithObjects:v116 forKeys:v115 count:4];
          id v60 = [v97 initWithDomain:v18 code:6 userInfo:v100];
        }
        goto LABEL_60;
      }
      *a8 = (unsigned __int16)[v18 status];
      v20 = [v18 response];
      if ((unint64_t)[v20 length] >= 0x14)
      {
        unsigned int v75 = [v18 status];

        if (v75 == 36864)
        {
          id v76 = [v18 response];
          *a7 = *(_DWORD *)[v76 bytes];

          *a7 = bswap32(*a7);
          v49 = [v18 response];
          [v49 subdataWithRange:4, 16];
          id v60 = 0;
          *a6 = (id)objc_claimAutoreleasedReturnValue();
LABEL_60:
          id v17 = v19;
          goto LABEL_61;
        }
      }
      else
      {
      }
      dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
      uint64_t v77 = NFLogGetLogger();
      if (v77)
      {
        v78 = (void (*)(uint64_t, const char *, ...))v77;
        v79 = object_getClass(self);
        BOOL v80 = class_isMetaClass(v79);
        v81 = object_getClassName(self);
        v82 = sel_getName(a2);
        v83 = [v18 response];
        id v109 = [v83 length];
        uint64_t v84 = 45;
        if (v80) {
          uint64_t v84 = 43;
        }
        v78(3, "%c[%{public}s %{public}s]:%i Invalid response length: %lu", v84, v81, v82, 55, v109);
      }
      dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
      v85 = NFSharedLogGetLogger();
      if (os_log_type_enabled(v85, OS_LOG_TYPE_ERROR))
      {
        v86 = object_getClass(self);
        if (class_isMetaClass(v86)) {
          int v87 = 43;
        }
        else {
          int v87 = 45;
        }
        v88 = object_getClassName(self);
        v89 = sel_getName(a2);
        v90 = [v18 response];
        id v91 = [v90 length];
        *(_DWORD *)buf = 67110146;
        int v126 = v87;
        __int16 v127 = 2082;
        v128 = v88;
        __int16 v129 = 2082;
        v130 = v89;
        __int16 v131 = 1024;
        int v132 = 55;
        __int16 v133 = 2048;
        id v134 = v91;
        _os_log_impl((void *)&_mh_execute_header, v85, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i Invalid response length: %lu", buf, 0x2Cu);
      }
      id v92 = objc_alloc((Class)NSError);
      v49 = +[NSString stringWithUTF8String:"nfcd"];
      v113[0] = NSLocalizedDescriptionKey;
      v93 = +[NSString stringWithUTF8String:"Unexpected Result"];
      v114[0] = v93;
      v114[1] = &off_100319F00;
      v113[1] = @"Line";
      v113[2] = @"Method";
      id v94 = [objc_alloc((Class)NSString) initWithFormat:@"%s", sel_getName(a2)];
      v114[2] = v94;
      v113[3] = NSDebugDescriptionErrorKey;
      id v95 = [objc_alloc((Class)NSString) initWithFormat:@"%s:%d", sel_getName(a2), 56];
      v114[3] = v95;
      v96 = +[NSDictionary dictionaryWithObjects:v114 forKeys:v113 count:4];
      id v60 = [v92 initWithDomain:v49 code:13 userInfo:v96];

      goto LABEL_60;
    }
    *a8 = (unsigned __int16)[v16 status];
    dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    uint64_t v34 = NFLogGetLogger();
    if (v34)
    {
      v35 = (void (*)(uint64_t, const char *, ...))v34;
      v36 = object_getClass(self);
      BOOL v37 = class_isMetaClass(v36);
      v38 = object_getClassName(self);
      v39 = sel_getName(a2);
      uint64_t v108 = [v16 status];
      uint64_t v40 = 45;
      if (v37) {
        uint64_t v40 = 43;
      }
      v35(3, "%c[%{public}s %{public}s]:%i Failed to select applet: 0x%04x", v40, v38, v39, 33, v108);
    }
    dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    v41 = NFSharedLogGetLogger();
    if (os_log_type_enabled(v41, OS_LOG_TYPE_ERROR))
    {
      v42 = object_getClass(self);
      if (class_isMetaClass(v42)) {
        int v43 = 43;
      }
      else {
        int v43 = 45;
      }
      v44 = object_getClassName(self);
      v45 = sel_getName(a2);
      unsigned int v46 = [v16 status];
      *(_DWORD *)buf = 67110146;
      int v126 = v43;
      __int16 v127 = 2082;
      v128 = v44;
      __int16 v129 = 2082;
      v130 = v45;
      __int16 v131 = 1024;
      int v132 = 33;
      __int16 v133 = 1024;
      LODWORD(v134) = v46;
      _os_log_impl((void *)&_mh_execute_header, v41, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i Failed to select applet: 0x%04x", buf, 0x28u);
    }

    unsigned int v47 = [v16 status];
    id v48 = objc_alloc((Class)NSError);
    v49 = +[NSString stringWithUTF8String:"nfcd"];
    if (v47 == 26277)
    {
      v121[0] = NSLocalizedDescriptionKey;
      v50 = +[NSString stringWithUTF8String:"Restricted Mode"];
      v122[0] = v50;
      v122[1] = &off_100319EB8;
      v121[1] = @"Line";
      v121[2] = @"Method";
      id v51 = [objc_alloc((Class)NSString) initWithFormat:@"%s", sel_getName(a2)];
      v122[2] = v51;
      v121[3] = NSDebugDescriptionErrorKey;
      id v52 = [objc_alloc((Class)NSString) initWithFormat:@"%s:%d", sel_getName(a2), 35];
      v122[3] = v52;
      v53 = +[NSDictionary dictionaryWithObjects:v122 forKeys:v121 count:4];
      v54 = v48;
      v55 = v49;
      uint64_t v56 = 24;
    }
    else
    {
      v119[0] = NSLocalizedDescriptionKey;
      v50 = +[NSString stringWithUTF8String:"Commmand Error"];
      v120[0] = v50;
      v120[1] = &off_100319ED0;
      v119[1] = @"Line";
      v119[2] = @"Method";
      id v51 = [objc_alloc((Class)NSString) initWithFormat:@"%s", sel_getName(a2)];
      v120[2] = v51;
      v119[3] = NSDebugDescriptionErrorKey;
      id v52 = [objc_alloc((Class)NSString) initWithFormat:@"%s:%d", sel_getName(a2), 37];
      v120[3] = v52;
      v53 = +[NSDictionary dictionaryWithObjects:v120 forKeys:v119 count:4];
      v54 = v48;
      v55 = v49;
      uint64_t v56 = 16;
    }
    id v60 = [v54 initWithDomain:v55 code:v56 userInfo:v53];

    v18 = v16;
  }
  else
  {
    dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    uint64_t v21 = NFLogGetLogger();
    if (v21)
    {
      v22 = (void (*)(uint64_t, const char *, ...))v21;
      v23 = object_getClass(self);
      BOOL v24 = class_isMetaClass(v23);
      v105 = object_getClassName(self);
      v106 = sel_getName(a2);
      uint64_t v25 = 45;
      if (v24) {
        uint64_t v25 = 43;
      }
      v22(3, "%c[%{public}s %{public}s]:%i Failed to select applet: %{public}@", v25, v105, v106, 28, v17);
    }
    dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    v26 = NFSharedLogGetLogger();
    if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
    {
      v27 = object_getClass(self);
      if (class_isMetaClass(v27)) {
        int v28 = 43;
      }
      else {
        int v28 = 45;
      }
      v29 = object_getClassName(self);
      v30 = sel_getName(a2);
      *(_DWORD *)buf = 67110146;
      int v126 = v28;
      __int16 v127 = 2082;
      v128 = v29;
      __int16 v129 = 2082;
      v130 = v30;
      __int16 v131 = 1024;
      int v132 = 28;
      __int16 v133 = 2114;
      id v134 = v17;
      _os_log_impl((void *)&_mh_execute_header, v26, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i Failed to select applet: %{public}@", buf, 0x2Cu);
    }

    id v31 = objc_alloc((Class)NSError);
    v18 = +[NSString stringWithUTF8String:"nfcd"];
    id v32 = [v17 code];
    v123[0] = NSLocalizedDescriptionKey;
    if ((uint64_t)[v17 code] > 70) {
      uint64_t v33 = 71;
    }
    else {
      uint64_t v33 = (uint64_t)[v17 code];
    }
    v49 = +[NSString stringWithUTF8String:off_1003016A0[v33]];
    v124[0] = v49;
    v124[1] = v17;
    v123[1] = NSUnderlyingErrorKey;
    v123[2] = @"Line";
    v124[2] = &off_100319EA0;
    v123[3] = @"Method";
    id v57 = [objc_alloc((Class)NSString) initWithFormat:@"%s", sel_getName(a2)];
    v124[3] = v57;
    v123[4] = NSDebugDescriptionErrorKey;
    id v58 = [objc_alloc((Class)NSString) initWithFormat:@"%s:%d", sel_getName(a2), 29];
    v124[4] = v58;
    v59 = +[NSDictionary dictionaryWithObjects:v124 forKeys:v123 count:5];
    id v60 = [v31 initWithDomain:v18 code:v32 userInfo:v59];
  }
LABEL_61:

  return v60;
}

- (id)derive:(unsigned __int8)a3 userHash:(id)a4 outData:(id *)a5 outWriteCount:(unsigned int *)a6 appletResult:(unsigned __int16 *)a7
{
  uint64_t v10 = a3;
  id v13 = a4;
  v14 = v13;
  if (v13 && [v13 length] != (id)32)
  {
    dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    uint64_t Logger = NFLogGetLogger();
    if (Logger)
    {
      v22 = (void (*)(uint64_t, const char *, ...))Logger;
      Class = object_getClass(self);
      BOOL isMetaClass = class_isMetaClass(Class);
      ClassName = object_getClassName(self);
      Name = sel_getName(a2);
      id v123 = [v14 length];
      uint64_t v27 = 45;
      if (isMetaClass) {
        uint64_t v27 = 43;
      }
      v22(3, "%c[%{public}s %{public}s]:%i Invalid user hash length : %u bytes", v27, ClassName, Name, 77, v123);
    }
    dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    int v28 = NFSharedLogGetLogger();
    if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
    {
      v29 = object_getClass(self);
      if (class_isMetaClass(v29)) {
        int v30 = 43;
      }
      else {
        int v30 = 45;
      }
      id v31 = object_getClassName(self);
      id v32 = sel_getName(a2);
      unsigned int v33 = [v14 length];
      *(_DWORD *)buf = 67110146;
      int v142 = v30;
      __int16 v143 = 2082;
      v144 = v31;
      __int16 v145 = 2082;
      v146 = v32;
      __int16 v147 = 1024;
      int v148 = 77;
      __int16 v149 = 1024;
      LODWORD(v150) = v33;
      _os_log_impl((void *)&_mh_execute_header, v28, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i Invalid user hash length : %u bytes", buf, 0x28u);
    }

    *a7 = 0;
    id v34 = objc_alloc((Class)NSError);
    id v17 = +[NSString stringWithUTF8String:"nfcd"];
    v151[0] = NSLocalizedDescriptionKey;
    v18 = +[NSString stringWithUTF8String:"Invalid Parameter"];
    v152[0] = v18;
    v152[1] = &off_100319F18;
    v151[1] = @"Line";
    v151[2] = @"Method";
    id v35 = [objc_alloc((Class)NSString) initWithFormat:@"%s", sel_getName(a2)];
    v152[2] = v35;
    v151[3] = NSDebugDescriptionErrorKey;
    id v36 = [objc_alloc((Class)NSString) initWithFormat:@"%s:%d", sel_getName(a2), 79];
    v152[3] = v36;
    BOOL v37 = +[NSDictionary dictionaryWithObjects:v152 forKeys:v151 count:4];
    id v38 = [v34 initWithDomain:v17 code:10 userInfo:v37];
  }
  else
  {
    id v15 = [objc_alloc((Class)NSData) initWithBytes:&unk_100283628 length:8];
    id v128 = 0;
    v16 = [(NFSecureElementWrapper *)self selectByName:v15 error:&v128];
    id v17 = v128;

    if (v16)
    {
      if ([v16 status] == 36864)
      {
        id v127 = v17;
        v18 = [(NFSecureElementWrapper *)self sendCommandWithClass:128 instruction:1 p1:v10 p2:0 data:v14 error:&v127];
        id v19 = v127;

        if (v18)
        {
          *a7 = (unsigned __int16)[v18 status];
          v20 = [v18 response];
          if ((unint64_t)[v20 length] < 0x14)
          {

LABEL_58:
            id v126 = v19;
            dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
            uint64_t v94 = NFLogGetLogger();
            if (v94)
            {
              id v95 = (void (*)(uint64_t, const char *, ...))v94;
              v96 = object_getClass(self);
              BOOL v97 = class_isMetaClass(v96);
              id v98 = object_getClassName(self);
              id v99 = sel_getName(a2);
              v100 = [v18 response];
              id v125 = [v100 length];
              uint64_t v101 = 45;
              if (v97) {
                uint64_t v101 = 43;
              }
              v95(3, "%c[%{public}s %{public}s]:%i Invalid response length: %lu", v101, v98, v99, 113, v125);
            }
            dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
            id v102 = NFSharedLogGetLogger();
            if (os_log_type_enabled(v102, OS_LOG_TYPE_ERROR))
            {
              v103 = object_getClass(self);
              if (class_isMetaClass(v103)) {
                int v104 = 43;
              }
              else {
                int v104 = 45;
              }
              v105 = object_getClassName(self);
              v106 = sel_getName(a2);
              v107 = [v18 response];
              id v108 = [v107 length];
              *(_DWORD *)buf = 67110146;
              int v142 = v104;
              __int16 v143 = 2082;
              v144 = v105;
              __int16 v145 = 2082;
              v146 = v106;
              __int16 v147 = 1024;
              int v148 = 113;
              __int16 v149 = 2048;
              id v150 = v108;
              _os_log_impl((void *)&_mh_execute_header, v102, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i Invalid response length: %lu", buf, 0x2Cu);
            }
            id v109 = objc_alloc((Class)NSError);
            id v35 = +[NSString stringWithUTF8String:"nfcd"];
            v129[0] = NSLocalizedDescriptionKey;
            id v110 = +[NSString stringWithUTF8String:"Unexpected Result"];
            v130[0] = v110;
            v130[1] = &off_100319F90;
            v129[1] = @"Line";
            v129[2] = @"Method";
            id v111 = [objc_alloc((Class)NSString) initWithFormat:@"%s", sel_getName(a2)];
            v130[2] = v111;
            v129[3] = NSDebugDescriptionErrorKey;
            id v112 = [objc_alloc((Class)NSString) initWithFormat:@"%s:%d", sel_getName(a2), 114];
            v130[3] = v112;
            v113 = +[NSDictionary dictionaryWithObjects:v130 forKeys:v129 count:4];
            id v38 = [v109 initWithDomain:v35 code:13 userInfo:v113];

            id v17 = v126;
            goto LABEL_72;
          }
          unsigned int v92 = [v18 status];

          if (v92 != 36864) {
            goto LABEL_58;
          }
          id v93 = [v18 response];
          *a6 = *(_DWORD *)[v93 bytes];

          *a6 = bswap32(*a6);
          id v35 = [v18 response];
          [v35 subdataWithRange:4, 16];
          id v38 = 0;
          *a5 = (id)objc_claimAutoreleasedReturnValue();
        }
        else
        {
          uint64_t v77 = v19;
          dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
          uint64_t v78 = NFLogGetLogger();
          if (v78)
          {
            v79 = (void (*)(uint64_t, const char *, ...))v78;
            BOOL v80 = object_getClass(self);
            BOOL v81 = class_isMetaClass(v80);
            v82 = object_getClassName(self);
            v122 = sel_getName(a2);
            uint64_t v83 = 45;
            if (v81) {
              uint64_t v83 = 43;
            }
            v79(3, "%c[%{public}s %{public}s]:%i Nil response", v83, v82, v122, 105);
          }
          dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
          uint64_t v84 = NFSharedLogGetLogger();
          if (os_log_type_enabled(v84, OS_LOG_TYPE_ERROR))
          {
            v85 = object_getClass(self);
            if (class_isMetaClass(v85)) {
              int v86 = 43;
            }
            else {
              int v86 = 45;
            }
            int v87 = object_getClassName(self);
            v88 = sel_getName(a2);
            *(_DWORD *)buf = 67109890;
            int v142 = v86;
            __int16 v143 = 2082;
            v144 = v87;
            __int16 v145 = 2082;
            v146 = v88;
            __int16 v147 = 1024;
            int v148 = 105;
            _os_log_impl((void *)&_mh_execute_header, v84, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i Nil response", buf, 0x22u);
          }

          id v89 = objc_alloc((Class)NSError);
          id v17 = +[NSString stringWithUTF8String:"nfcd"];
          if (!v77)
          {
            v131[0] = NSLocalizedDescriptionKey;
            v18 = +[NSString stringWithUTF8String:"Unknown Error"];
            v132[0] = v18;
            v132[1] = &off_100319F78;
            v131[1] = @"Line";
            v131[2] = @"Method";
            id v35 = [objc_alloc((Class)NSString) initWithFormat:@"%s", sel_getName(a2)];
            v132[2] = v35;
            v131[3] = NSDebugDescriptionErrorKey;
            id v114 = [objc_alloc((Class)NSString) initWithFormat:@"%s:%d", sel_getName(a2), 106];
            v132[3] = v114;
            v115 = +[NSDictionary dictionaryWithObjects:v132 forKeys:v131 count:4];
            id v38 = [v89 initWithDomain:v17 code:6 userInfo:v115];

            goto LABEL_72;
          }
          id v19 = v77;
          id v90 = [v77 code];
          v133[0] = NSLocalizedDescriptionKey;
          if ((uint64_t)[v77 code] > 70) {
            uint64_t v91 = 71;
          }
          else {
            uint64_t v91 = (uint64_t)[v77 code];
          }
          id v35 = +[NSString stringWithUTF8String:off_1003016A0[v91]];
          v134[0] = v35;
          v134[1] = v77;
          v133[1] = NSUnderlyingErrorKey;
          v133[2] = @"Line";
          v134[2] = &off_100319F78;
          v133[3] = @"Method";
          id v116 = [objc_alloc((Class)NSString) initWithFormat:@"%s", sel_getName(a2)];
          v134[3] = v116;
          v133[4] = NSDebugDescriptionErrorKey;
          id v117 = [objc_alloc((Class)NSString) initWithFormat:@"%s:%d", sel_getName(a2), 106];
          v134[4] = v117;
          v118 = +[NSDictionary dictionaryWithObjects:v134 forKeys:v133 count:5];
          id v38 = [v89 initWithDomain:v17 code:v90 userInfo:v118];

          v18 = v17;
        }
        id v17 = v19;
        goto LABEL_72;
      }
      *a7 = (unsigned __int16)[v16 status];
      dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
      uint64_t v52 = NFLogGetLogger();
      if (v52)
      {
        v53 = (void (*)(uint64_t, const char *, ...))v52;
        v54 = object_getClass(self);
        BOOL v55 = class_isMetaClass(v54);
        uint64_t v56 = object_getClassName(self);
        id v57 = sel_getName(a2);
        uint64_t v124 = [v16 status];
        uint64_t v58 = 45;
        if (v55) {
          uint64_t v58 = 43;
        }
        v53(3, "%c[%{public}s %{public}s]:%i Failed to select applet: 0x%04x", v58, v56, v57, 91, v124);
      }
      dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
      v59 = NFSharedLogGetLogger();
      if (os_log_type_enabled(v59, OS_LOG_TYPE_ERROR))
      {
        id v60 = object_getClass(self);
        if (class_isMetaClass(v60)) {
          int v61 = 43;
        }
        else {
          int v61 = 45;
        }
        v62 = object_getClassName(self);
        v63 = sel_getName(a2);
        unsigned int v64 = [v16 status];
        *(_DWORD *)buf = 67110146;
        int v142 = v61;
        __int16 v143 = 2082;
        v144 = v62;
        __int16 v145 = 2082;
        v146 = v63;
        __int16 v147 = 1024;
        int v148 = 91;
        __int16 v149 = 1024;
        LODWORD(v150) = v64;
        _os_log_impl((void *)&_mh_execute_header, v59, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i Failed to select applet: 0x%04x", buf, 0x28u);
      }

      unsigned int v65 = [v16 status];
      id v66 = objc_alloc((Class)NSError);
      id v35 = +[NSString stringWithUTF8String:"nfcd"];
      if (v65 == 26277)
      {
        v137[0] = NSLocalizedDescriptionKey;
        v67 = +[NSString stringWithUTF8String:"Restricted Mode"];
        v138[0] = v67;
        v138[1] = &off_100319F48;
        v137[1] = @"Line";
        v137[2] = @"Method";
        id v68 = [objc_alloc((Class)NSString) initWithFormat:@"%s", sel_getName(a2)];
        v138[2] = v68;
        v137[3] = NSDebugDescriptionErrorKey;
        id v69 = [objc_alloc((Class)NSString) initWithFormat:@"%s:%d", sel_getName(a2), 93];
        v138[3] = v69;
        v70 = +[NSDictionary dictionaryWithObjects:v138 forKeys:v137 count:4];
        v71 = v66;
        id v72 = v35;
        uint64_t v73 = 24;
      }
      else
      {
        v135[0] = NSLocalizedDescriptionKey;
        v67 = +[NSString stringWithUTF8String:"Commmand Error"];
        v136[0] = v67;
        v136[1] = &off_100319F60;
        v135[1] = @"Line";
        v135[2] = @"Method";
        id v68 = [objc_alloc((Class)NSString) initWithFormat:@"%s", sel_getName(a2)];
        v136[2] = v68;
        v135[3] = NSDebugDescriptionErrorKey;
        id v69 = [objc_alloc((Class)NSString) initWithFormat:@"%s:%d", sel_getName(a2), 95];
        v136[3] = v69;
        v70 = +[NSDictionary dictionaryWithObjects:v136 forKeys:v135 count:4];
        v71 = v66;
        id v72 = v35;
        uint64_t v73 = 16;
      }
      id v38 = [v71 initWithDomain:v72 code:v73 userInfo:v70];

      v18 = v16;
    }
    else
    {
      dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
      uint64_t v39 = NFLogGetLogger();
      if (v39)
      {
        uint64_t v40 = (void (*)(uint64_t, const char *, ...))v39;
        v41 = object_getClass(self);
        BOOL v42 = class_isMetaClass(v41);
        v120 = object_getClassName(self);
        v121 = sel_getName(a2);
        uint64_t v43 = 45;
        if (v42) {
          uint64_t v43 = 43;
        }
        v40(3, "%c[%{public}s %{public}s]:%i Failed to select applet: %{public}@", v43, v120, v121, 86, v17);
      }
      dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
      v44 = NFSharedLogGetLogger();
      if (os_log_type_enabled(v44, OS_LOG_TYPE_ERROR))
      {
        v45 = object_getClass(self);
        if (class_isMetaClass(v45)) {
          int v46 = 43;
        }
        else {
          int v46 = 45;
        }
        unsigned int v47 = object_getClassName(self);
        id v48 = sel_getName(a2);
        *(_DWORD *)buf = 67110146;
        int v142 = v46;
        __int16 v143 = 2082;
        v144 = v47;
        __int16 v145 = 2082;
        v146 = v48;
        __int16 v147 = 1024;
        int v148 = 86;
        __int16 v149 = 2114;
        id v150 = v17;
        _os_log_impl((void *)&_mh_execute_header, v44, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i Failed to select applet: %{public}@", buf, 0x2Cu);
      }

      id v49 = objc_alloc((Class)NSError);
      v18 = +[NSString stringWithUTF8String:"nfcd"];
      id v50 = [v17 code];
      v139[0] = NSLocalizedDescriptionKey;
      if ((uint64_t)[v17 code] > 70) {
        uint64_t v51 = 71;
      }
      else {
        uint64_t v51 = (uint64_t)[v17 code];
      }
      id v35 = +[NSString stringWithUTF8String:off_1003016A0[v51]];
      v140[0] = v35;
      v140[1] = v17;
      v139[1] = NSUnderlyingErrorKey;
      v139[2] = @"Line";
      v140[2] = &off_100319F30;
      v139[3] = @"Method";
      id v74 = [objc_alloc((Class)NSString) initWithFormat:@"%s", sel_getName(a2)];
      v140[3] = v74;
      v139[4] = NSDebugDescriptionErrorKey;
      id v75 = [objc_alloc((Class)NSString) initWithFormat:@"%s:%d", sel_getName(a2), 87];
      v140[4] = v75;
      id v76 = +[NSDictionary dictionaryWithObjects:v140 forKeys:v139 count:5];
      id v38 = [v49 initWithDomain:v18 code:v50 userInfo:v76];
    }
  }
LABEL_72:

  return v38;
}

- (id)resetCounter:(unsigned __int8)a3 userToken:(id)a4 outWriteCount:(unsigned int *)a5 appletResult:(unsigned __int16 *)a6
{
  uint64_t v8 = a3;
  id v11 = a4;
  id v12 = [objc_alloc((Class)NSData) initWithBytes:&unk_100283628 length:8];
  id v118 = 0;
  id v13 = [(NFSecureElementWrapper *)self selectByName:v12 error:&v118];
  id v14 = v118;

  if (v13)
  {
    if ([v13 status] == 36864)
    {
      id v117 = v14;
      id v15 = [(NFSecureElementWrapper *)self sendCommandWithClass:128 instruction:2 p1:v8 p2:0 data:v11 error:&v117];
      id v16 = v117;

      if (v15)
      {
        *a6 = (unsigned __int16)[v15 status];
        id v17 = [v15 response];
        id v18 = [v17 length];

        if ((unint64_t)v18 > 3)
        {
          id v100 = [v15 response];
          *a5 = *(_DWORD *)[v100 bytes];

          id v40 = 0;
          *a5 = bswap32(*a5);
          id v14 = v16;
        }
        else
        {
          id v114 = v16;
          id v115 = v11;
          dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
          uint64_t Logger = NFLogGetLogger();
          if (Logger)
          {
            v20 = (void (*)(uint64_t, const char *, ...))Logger;
            Class = object_getClass(self);
            BOOL isMetaClass = class_isMetaClass(Class);
            ClassName = object_getClassName(self);
            Name = sel_getName(a2);
            uint64_t v25 = [v15 response];
            id v112 = [v25 length];
            uint64_t v26 = 45;
            if (isMetaClass) {
              uint64_t v26 = 43;
            }
            v20(3, "%c[%{public}s %{public}s]:%i Invalid response length: %lu", v26, ClassName, Name, 165, v112);
          }
          dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
          uint64_t v27 = NFSharedLogGetLogger();
          if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
          {
            int v28 = object_getClass(self);
            if (class_isMetaClass(v28)) {
              int v29 = 43;
            }
            else {
              int v29 = 45;
            }
            int v30 = object_getClassName(self);
            id v31 = sel_getName(a2);
            id v32 = [v15 response];
            id v33 = [v32 length];
            *(_DWORD *)buf = 67110146;
            int v132 = v29;
            __int16 v133 = 2082;
            id v134 = v30;
            __int16 v135 = 2082;
            v136 = v31;
            __int16 v137 = 1024;
            int v138 = 165;
            __int16 v139 = 2048;
            id v140 = v33;
            _os_log_impl((void *)&_mh_execute_header, v27, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i Invalid response length: %lu", buf, 0x2Cu);
          }
          id v34 = objc_alloc((Class)NSError);
          id v35 = +[NSString stringWithUTF8String:"nfcd"];
          v119[0] = NSLocalizedDescriptionKey;
          id v36 = +[NSString stringWithUTF8String:"Unexpected Result"];
          v120[0] = v36;
          v120[1] = &off_10031A008;
          v119[1] = @"Line";
          v119[2] = @"Method";
          id v37 = [objc_alloc((Class)NSString) initWithFormat:@"%s", sel_getName(a2)];
          v120[2] = v37;
          v119[3] = NSDebugDescriptionErrorKey;
          id v38 = [objc_alloc((Class)NSString) initWithFormat:@"%s:%d", sel_getName(a2), 166];
          v120[3] = v38;
          uint64_t v39 = +[NSDictionary dictionaryWithObjects:v120 forKeys:v119 count:4];
          id v40 = [v34 initWithDomain:v35 code:13 userInfo:v39];

          id v14 = v114;
          id v11 = v115;
        }
        goto LABEL_56;
      }
      uint64_t v83 = v16;
      dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
      uint64_t v84 = NFLogGetLogger();
      if (v84)
      {
        v85 = (void (*)(uint64_t, const char *, ...))v84;
        int v86 = object_getClass(self);
        BOOL v87 = class_isMetaClass(v86);
        v88 = object_getClassName(self);
        id v111 = sel_getName(a2);
        uint64_t v89 = 45;
        if (v87) {
          uint64_t v89 = 43;
        }
        v85(3, "%c[%{public}s %{public}s]:%i Nil response", v89, v88, v111, 157);
      }
      dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
      id v90 = NFSharedLogGetLogger();
      if (os_log_type_enabled(v90, OS_LOG_TYPE_ERROR))
      {
        uint64_t v91 = object_getClass(self);
        if (class_isMetaClass(v91)) {
          int v92 = 43;
        }
        else {
          int v92 = 45;
        }
        id v93 = object_getClassName(self);
        uint64_t v94 = sel_getName(a2);
        *(_DWORD *)buf = 67109890;
        int v132 = v92;
        __int16 v133 = 2082;
        id v134 = v93;
        __int16 v135 = 2082;
        v136 = v94;
        __int16 v137 = 1024;
        int v138 = 157;
        _os_log_impl((void *)&_mh_execute_header, v90, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i Nil response", buf, 0x22u);
      }

      id v95 = objc_alloc((Class)NSError);
      id v14 = +[NSString stringWithUTF8String:"nfcd"];
      if (!v83)
      {
        v121[0] = NSLocalizedDescriptionKey;
        id v15 = +[NSString stringWithUTF8String:"Unknown Error"];
        v122[0] = v15;
        v122[1] = &off_100319FF0;
        v121[1] = @"Line";
        v121[2] = @"Method";
        id v101 = [objc_alloc((Class)NSString) initWithFormat:@"%s", sel_getName(a2)];
        v122[2] = v101;
        v121[3] = NSDebugDescriptionErrorKey;
        id v102 = [objc_alloc((Class)NSString) initWithFormat:@"%s:%d", sel_getName(a2), 158];
        v122[3] = v102;
        v103 = +[NSDictionary dictionaryWithObjects:v122 forKeys:v121 count:4];
        id v40 = [v95 initWithDomain:v14 code:6 userInfo:v103];

        goto LABEL_56;
      }
      v96 = v83;
      id v97 = [v83 code];
      v123[0] = NSLocalizedDescriptionKey;
      id v116 = v11;
      id v98 = v95;
      if ((uint64_t)[v83 code] > 70) {
        uint64_t v99 = 71;
      }
      else {
        uint64_t v99 = (uint64_t)[v83 code];
      }
      v105 = +[NSString stringWithUTF8String:off_1003016A0[v99]];
      v124[0] = v105;
      v124[1] = v83;
      v123[1] = NSUnderlyingErrorKey;
      v123[2] = @"Line";
      v124[2] = &off_100319FF0;
      v123[3] = @"Method";
      id v106 = [objc_alloc((Class)NSString) initWithFormat:@"%s", sel_getName(a2)];
      v124[3] = v106;
      v123[4] = NSDebugDescriptionErrorKey;
      id v107 = [objc_alloc((Class)NSString) initWithFormat:@"%s:%d", sel_getName(a2), 158];
      v124[4] = v107;
      id v108 = +[NSDictionary dictionaryWithObjects:v124 forKeys:v123 count:5];
      id v40 = [v98 initWithDomain:v14 code:v97 userInfo:v108];

      id v15 = v14;
      id v14 = v96;
    }
    else
    {
      id v116 = v11;
      *a6 = (unsigned __int16)[v13 status];
      dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
      uint64_t v56 = NFLogGetLogger();
      if (v56)
      {
        id v57 = (void (*)(uint64_t, const char *, ...))v56;
        uint64_t v58 = object_getClass(self);
        BOOL v59 = class_isMetaClass(v58);
        id v60 = object_getClassName(self);
        int v61 = sel_getName(a2);
        uint64_t v113 = [v13 status];
        uint64_t v62 = 45;
        if (v59) {
          uint64_t v62 = 43;
        }
        v57(3, "%c[%{public}s %{public}s]:%i Failed to select applet: 0x%04x", v62, v60, v61, 143, v113);
      }
      dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
      v63 = NFSharedLogGetLogger();
      if (os_log_type_enabled(v63, OS_LOG_TYPE_ERROR))
      {
        unsigned int v64 = object_getClass(self);
        if (class_isMetaClass(v64)) {
          int v65 = 43;
        }
        else {
          int v65 = 45;
        }
        id v66 = object_getClassName(self);
        v67 = sel_getName(a2);
        unsigned int v68 = [v13 status];
        *(_DWORD *)buf = 67110146;
        int v132 = v65;
        __int16 v133 = 2082;
        id v134 = v66;
        __int16 v135 = 2082;
        v136 = v67;
        __int16 v137 = 1024;
        int v138 = 143;
        __int16 v139 = 1024;
        LODWORD(v140) = v68;
        _os_log_impl((void *)&_mh_execute_header, v63, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i Failed to select applet: 0x%04x", buf, 0x28u);
      }

      unsigned int v69 = [v13 status];
      id v70 = objc_alloc((Class)NSError);
      v71 = +[NSString stringWithUTF8String:"nfcd"];
      if (v69 == 26277)
      {
        v127[0] = NSLocalizedDescriptionKey;
        id v72 = +[NSString stringWithUTF8String:"Restricted Mode"];
        v128[0] = v72;
        v128[1] = &off_100319FC0;
        v127[1] = @"Line";
        v127[2] = @"Method";
        id v73 = [objc_alloc((Class)NSString) initWithFormat:@"%s", sel_getName(a2)];
        v128[2] = v73;
        v127[3] = NSDebugDescriptionErrorKey;
        id v74 = [objc_alloc((Class)NSString) initWithFormat:@"%s:%d", sel_getName(a2), 145];
        v128[3] = v74;
        id v75 = +[NSDictionary dictionaryWithObjects:v128 forKeys:v127 count:4];
        id v76 = v70;
        uint64_t v77 = v71;
        uint64_t v78 = 24;
      }
      else
      {
        v125[0] = NSLocalizedDescriptionKey;
        id v72 = +[NSString stringWithUTF8String:"Commmand Error"];
        v126[0] = v72;
        v126[1] = &off_100319FD8;
        v125[1] = @"Line";
        v125[2] = @"Method";
        id v73 = [objc_alloc((Class)NSString) initWithFormat:@"%s", sel_getName(a2)];
        v126[2] = v73;
        v125[3] = NSDebugDescriptionErrorKey;
        id v74 = [objc_alloc((Class)NSString) initWithFormat:@"%s:%d", sel_getName(a2), 147];
        v126[3] = v74;
        id v75 = +[NSDictionary dictionaryWithObjects:v126 forKeys:v125 count:4];
        id v76 = v70;
        uint64_t v77 = v71;
        uint64_t v78 = 16;
      }
      id v40 = [v76 initWithDomain:v77 code:v78 userInfo:v75];

      id v15 = v13;
    }
    id v11 = v116;
    goto LABEL_56;
  }
  dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
  uint64_t v41 = NFLogGetLogger();
  if (v41)
  {
    BOOL v42 = (void (*)(uint64_t, const char *, ...))v41;
    uint64_t v43 = object_getClass(self);
    BOOL v44 = class_isMetaClass(v43);
    id v109 = object_getClassName(self);
    id v110 = sel_getName(a2);
    uint64_t v45 = 45;
    if (v44) {
      uint64_t v45 = 43;
    }
    v42(3, "%c[%{public}s %{public}s]:%i Failed to select applet: %{public}@", v45, v109, v110, 138, v14);
  }
  dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
  int v46 = NFSharedLogGetLogger();
  if (os_log_type_enabled(v46, OS_LOG_TYPE_ERROR))
  {
    unsigned int v47 = object_getClass(self);
    if (class_isMetaClass(v47)) {
      int v48 = 43;
    }
    else {
      int v48 = 45;
    }
    id v49 = object_getClassName(self);
    id v50 = sel_getName(a2);
    *(_DWORD *)buf = 67110146;
    int v132 = v48;
    __int16 v133 = 2082;
    id v134 = v49;
    __int16 v135 = 2082;
    v136 = v50;
    __int16 v137 = 1024;
    int v138 = 138;
    __int16 v139 = 2114;
    id v140 = v14;
    _os_log_impl((void *)&_mh_execute_header, v46, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i Failed to select applet: %{public}@", buf, 0x2Cu);
  }
  uint64_t v51 = a2;

  id v52 = objc_alloc((Class)NSError);
  id v15 = +[NSString stringWithUTF8String:"nfcd"];
  id v53 = [v14 code];
  v129[0] = NSLocalizedDescriptionKey;
  id v54 = v11;
  if ((uint64_t)[v14 code] > 70) {
    uint64_t v55 = 71;
  }
  else {
    uint64_t v55 = (uint64_t)[v14 code];
  }
  v79 = +[NSString stringWithUTF8String:off_1003016A0[v55]];
  v130[0] = v79;
  v130[1] = v14;
  v129[1] = NSUnderlyingErrorKey;
  v129[2] = @"Line";
  v130[2] = &off_100319FA8;
  v129[3] = @"Method";
  id v80 = [objc_alloc((Class)NSString) initWithFormat:@"%s", sel_getName(v51)];
  v130[3] = v80;
  void v129[4] = NSDebugDescriptionErrorKey;
  id v81 = [objc_alloc((Class)NSString) initWithFormat:@"%s:%d", sel_getName(v51), 139];
  void v130[4] = v81;
  v82 = +[NSDictionary dictionaryWithObjects:v130 forKeys:v129 count:5];
  id v40 = [v52 initWithDomain:v15 code:v53 userInfo:v82];

  id v11 = v54;
LABEL_56:

  return v40;
}

- (id)authorizeUpdate:(BOOL)a3 slotIndex:(unsigned __int8)a4 userToken:(id)a5 outWriteCount:(unsigned int *)a6 appletResult:(unsigned __int16 *)a7
{
  uint64_t v9 = a4;
  BOOL v10 = a3;
  id v112 = a5;
  id v13 = [objc_alloc((Class)NSData) initWithBytes:&unk_100283628 length:8];
  id v114 = 0;
  id v14 = [(NFSecureElementWrapper *)self selectByName:v13 error:&v114];
  id v15 = v114;

  if (v14)
  {
    if ([v14 status] == 36864)
    {
      id v113 = v15;
      id v16 = [(NFSecureElementWrapper *)self sendCommandWithClass:128 instruction:3 p1:v9 p2:v10 data:v112 error:&v113];
      id v17 = v113;

      if (v16)
      {
        *a7 = (unsigned __int16)[v16 status];
        id v18 = [v16 response];
        id v19 = [v18 length];

        if ((unint64_t)v19 > 3)
        {
          id v96 = [v16 response];
          *a6 = *(_DWORD *)[v96 bytes];

          id v41 = 0;
          *a6 = bswap32(*a6);
          id v15 = v17;
        }
        else
        {
          id v111 = v17;
          dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
          uint64_t Logger = NFLogGetLogger();
          if (Logger)
          {
            uint64_t v21 = (void (*)(uint64_t, const char *, ...))Logger;
            Class = object_getClass(self);
            BOOL isMetaClass = class_isMetaClass(Class);
            ClassName = object_getClassName(self);
            Name = sel_getName(a2);
            uint64_t v26 = [v16 response];
            id v109 = [v26 length];
            uint64_t v27 = 45;
            if (isMetaClass) {
              uint64_t v27 = 43;
            }
            v21(3, "%c[%{public}s %{public}s]:%i Invalid response length: %lu", v27, ClassName, Name, 215, v109);
          }
          dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
          int v28 = NFSharedLogGetLogger();
          if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
          {
            int v29 = object_getClass(self);
            if (class_isMetaClass(v29)) {
              int v30 = 43;
            }
            else {
              int v30 = 45;
            }
            id v31 = object_getClassName(self);
            id v32 = sel_getName(a2);
            id v33 = [v16 response];
            id v34 = [v33 length];
            *(_DWORD *)buf = 67110146;
            int v128 = v30;
            __int16 v129 = 2082;
            v130 = v31;
            __int16 v131 = 2082;
            int v132 = v32;
            __int16 v133 = 1024;
            int v134 = 215;
            __int16 v135 = 2048;
            id v136 = v34;
            _os_log_impl((void *)&_mh_execute_header, v28, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i Invalid response length: %lu", buf, 0x2Cu);
          }
          id v35 = objc_alloc((Class)NSError);
          id v36 = +[NSString stringWithUTF8String:"nfcd"];
          v115[0] = NSLocalizedDescriptionKey;
          id v37 = +[NSString stringWithUTF8String:"Unexpected Result"];
          v116[0] = v37;
          v116[1] = &off_10031A080;
          v115[1] = @"Line";
          v115[2] = @"Method";
          id v38 = [objc_alloc((Class)NSString) initWithFormat:@"%s", sel_getName(a2)];
          v116[2] = v38;
          v115[3] = NSDebugDescriptionErrorKey;
          id v39 = [objc_alloc((Class)NSString) initWithFormat:@"%s:%d", sel_getName(a2), 216];
          v116[3] = v39;
          id v40 = +[NSDictionary dictionaryWithObjects:v116 forKeys:v115 count:4];
          id v41 = [v35 initWithDomain:v36 code:13 userInfo:v40];

          id v15 = v111;
        }
      }
      else
      {
        dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
        uint64_t v82 = NFLogGetLogger();
        if (v82)
        {
          uint64_t v83 = (void (*)(uint64_t, const char *, ...))v82;
          uint64_t v84 = object_getClass(self);
          BOOL v85 = class_isMetaClass(v84);
          int v86 = object_getClassName(self);
          id v108 = sel_getName(a2);
          uint64_t v87 = 45;
          if (v85) {
            uint64_t v87 = 43;
          }
          v83(3, "%c[%{public}s %{public}s]:%i Nil response", v87, v86, v108, 207);
        }
        dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
        v88 = NFSharedLogGetLogger();
        if (os_log_type_enabled(v88, OS_LOG_TYPE_ERROR))
        {
          uint64_t v89 = object_getClass(self);
          if (class_isMetaClass(v89)) {
            int v90 = 43;
          }
          else {
            int v90 = 45;
          }
          uint64_t v91 = object_getClassName(self);
          int v92 = sel_getName(a2);
          *(_DWORD *)buf = 67109890;
          int v128 = v90;
          __int16 v129 = 2082;
          v130 = v91;
          __int16 v131 = 2082;
          int v132 = v92;
          __int16 v133 = 1024;
          int v134 = 207;
          _os_log_impl((void *)&_mh_execute_header, v88, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i Nil response", buf, 0x22u);
        }

        id v93 = objc_alloc((Class)NSError);
        id v15 = +[NSString stringWithUTF8String:"nfcd"];
        if (v17)
        {
          id v94 = [v17 code];
          v119[0] = NSLocalizedDescriptionKey;
          if ((uint64_t)[v17 code] > 70) {
            uint64_t v95 = 71;
          }
          else {
            uint64_t v95 = (uint64_t)[v17 code];
          }
          id v100 = +[NSString stringWithUTF8String:off_1003016A0[v95]];
          v120[0] = v100;
          v120[1] = v17;
          v119[1] = NSUnderlyingErrorKey;
          v119[2] = @"Line";
          v120[2] = &off_10031A068;
          v119[3] = @"Method";
          id v101 = [objc_alloc((Class)NSString) initWithFormat:@"%s", sel_getName(a2)];
          v120[3] = v101;
          void v119[4] = NSDebugDescriptionErrorKey;
          id v102 = [objc_alloc((Class)NSString) initWithFormat:@"%s:%d", sel_getName(a2), 208];
          void v120[4] = v102;
          +[NSDictionary dictionaryWithObjects:v120 forKeys:v119 count:5];
          int v104 = v103 = v17;
          id v41 = [v93 initWithDomain:v15 code:v94 userInfo:v104];

          id v16 = v15;
          id v15 = v103;
        }
        else
        {
          v117[0] = NSLocalizedDescriptionKey;
          id v16 = +[NSString stringWithUTF8String:"Unknown Error"];
          v118[0] = v16;
          v118[1] = &off_10031A068;
          v117[1] = @"Line";
          v117[2] = @"Method";
          id v97 = [objc_alloc((Class)NSString) initWithFormat:@"%s", sel_getName(a2)];
          v118[2] = v97;
          v117[3] = NSDebugDescriptionErrorKey;
          id v98 = [objc_alloc((Class)NSString) initWithFormat:@"%s:%d", sel_getName(a2), 208];
          v118[3] = v98;
          uint64_t v99 = +[NSDictionary dictionaryWithObjects:v118 forKeys:v117 count:4];
          id v41 = [v93 initWithDomain:v15 code:6 userInfo:v99];
        }
      }
    }
    else
    {
      *a7 = (unsigned __int16)[v14 status];
      dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
      uint64_t v55 = NFLogGetLogger();
      if (v55)
      {
        uint64_t v56 = (void (*)(uint64_t, const char *, ...))v55;
        id v57 = object_getClass(self);
        BOOL v58 = class_isMetaClass(v57);
        BOOL v59 = object_getClassName(self);
        id v60 = sel_getName(a2);
        uint64_t v110 = [v14 status];
        uint64_t v61 = 45;
        if (v58) {
          uint64_t v61 = 43;
        }
        v56(3, "%c[%{public}s %{public}s]:%i Failed to select applet: 0x%04x", v61, v59, v60, 193, v110);
      }
      dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
      uint64_t v62 = NFSharedLogGetLogger();
      if (os_log_type_enabled(v62, OS_LOG_TYPE_ERROR))
      {
        v63 = object_getClass(self);
        if (class_isMetaClass(v63)) {
          int v64 = 43;
        }
        else {
          int v64 = 45;
        }
        int v65 = object_getClassName(self);
        id v66 = sel_getName(a2);
        unsigned int v67 = [v14 status];
        *(_DWORD *)buf = 67110146;
        int v128 = v64;
        __int16 v129 = 2082;
        v130 = v65;
        __int16 v131 = 2082;
        int v132 = v66;
        __int16 v133 = 1024;
        int v134 = 193;
        __int16 v135 = 1024;
        LODWORD(v136) = v67;
        _os_log_impl((void *)&_mh_execute_header, v62, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i Failed to select applet: 0x%04x", buf, 0x28u);
      }

      unsigned int v68 = [v14 status];
      id v69 = objc_alloc((Class)NSError);
      id v70 = +[NSString stringWithUTF8String:"nfcd"];
      if (v68 == 26277)
      {
        v123[0] = NSLocalizedDescriptionKey;
        v71 = +[NSString stringWithUTF8String:"Restricted Mode"];
        v124[0] = v71;
        v124[1] = &off_10031A038;
        v123[1] = @"Line";
        v123[2] = @"Method";
        id v72 = [objc_alloc((Class)NSString) initWithFormat:@"%s", sel_getName(a2)];
        v124[2] = v72;
        v123[3] = NSDebugDescriptionErrorKey;
        id v73 = [objc_alloc((Class)NSString) initWithFormat:@"%s:%d", sel_getName(a2), 195];
        v124[3] = v73;
        id v74 = +[NSDictionary dictionaryWithObjects:v124 forKeys:v123 count:4];
        id v75 = v69;
        id v76 = v70;
        uint64_t v77 = 24;
      }
      else
      {
        v121[0] = NSLocalizedDescriptionKey;
        v71 = +[NSString stringWithUTF8String:"Commmand Error"];
        v122[0] = v71;
        v122[1] = &off_10031A050;
        v121[1] = @"Line";
        v121[2] = @"Method";
        id v72 = [objc_alloc((Class)NSString) initWithFormat:@"%s", sel_getName(a2)];
        v122[2] = v72;
        v121[3] = NSDebugDescriptionErrorKey;
        id v73 = [objc_alloc((Class)NSString) initWithFormat:@"%s:%d", sel_getName(a2), 197];
        v122[3] = v73;
        id v74 = +[NSDictionary dictionaryWithObjects:v122 forKeys:v121 count:4];
        id v75 = v69;
        id v76 = v70;
        uint64_t v77 = 16;
      }
      id v41 = [v75 initWithDomain:v76 code:v77 userInfo:v74];

      id v16 = v14;
    }
  }
  else
  {
    dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    uint64_t v42 = NFLogGetLogger();
    if (v42)
    {
      uint64_t v43 = (void (*)(uint64_t, const char *, ...))v42;
      BOOL v44 = object_getClass(self);
      BOOL v45 = class_isMetaClass(v44);
      id v106 = object_getClassName(self);
      id v107 = sel_getName(a2);
      uint64_t v46 = 45;
      if (v45) {
        uint64_t v46 = 43;
      }
      v43(3, "%c[%{public}s %{public}s]:%i Failed to select applet: %{public}@", v46, v106, v107, 188, v15);
    }
    dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    unsigned int v47 = NFSharedLogGetLogger();
    if (os_log_type_enabled(v47, OS_LOG_TYPE_ERROR))
    {
      int v48 = object_getClass(self);
      if (class_isMetaClass(v48)) {
        int v49 = 43;
      }
      else {
        int v49 = 45;
      }
      id v50 = object_getClassName(self);
      uint64_t v51 = sel_getName(a2);
      *(_DWORD *)buf = 67110146;
      int v128 = v49;
      __int16 v129 = 2082;
      v130 = v50;
      __int16 v131 = 2082;
      int v132 = v51;
      __int16 v133 = 1024;
      int v134 = 188;
      __int16 v135 = 2114;
      id v136 = v15;
      _os_log_impl((void *)&_mh_execute_header, v47, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i Failed to select applet: %{public}@", buf, 0x2Cu);
    }

    id v52 = objc_alloc((Class)NSError);
    id v16 = +[NSString stringWithUTF8String:"nfcd"];
    id v53 = [v15 code];
    v125[0] = NSLocalizedDescriptionKey;
    if ((uint64_t)[v15 code] > 70) {
      uint64_t v54 = 71;
    }
    else {
      uint64_t v54 = (uint64_t)[v15 code];
    }
    uint64_t v78 = +[NSString stringWithUTF8String:off_1003016A0[v54]];
    v126[0] = v78;
    v126[1] = v15;
    v125[1] = NSUnderlyingErrorKey;
    v125[2] = @"Line";
    v126[2] = &off_10031A020;
    v125[3] = @"Method";
    id v79 = [objc_alloc((Class)NSString) initWithFormat:@"%s", sel_getName(a2)];
    v126[3] = v79;
    void v125[4] = NSDebugDescriptionErrorKey;
    id v80 = [objc_alloc((Class)NSString) initWithFormat:@"%s:%d", sel_getName(a2), 189];
    void v126[4] = v80;
    id v81 = +[NSDictionary dictionaryWithObjects:v126 forKeys:v125 count:5];
    id v41 = [v52 initWithDomain:v16 code:v53 userInfo:v81];
  }

  return v41;
}

- (id)deleteSlot:(unsigned __int8)a3 outWriteCount:(unsigned int *)a4 appletResult:(unsigned __int16 *)a5
{
  uint64_t v7 = a3;
  id v10 = [objc_alloc((Class)NSData) initWithBytes:&unk_100283628 length:8];
  id v110 = 0;
  id v11 = [(NFSecureElementWrapper *)self selectByName:v10 error:&v110];
  id v12 = v110;

  if (v11)
  {
    if ([v11 status] == 36864)
    {
      id v109 = v12;
      id v13 = [(NFSecureElementWrapper *)self sendCommandWithClass:128 instruction:4 p1:v7 p2:0 data:0 error:&v109];
      id v14 = v109;

      if (v13)
      {
        *a5 = (unsigned __int16)[v13 status];
        id v15 = [v13 response];
        id v16 = [v15 length];

        if ((unint64_t)v16 > 3)
        {
          id v93 = [v13 response];
          *a4 = *(_DWORD *)[v93 bytes];

          id v38 = 0;
          *a4 = bswap32(*a4);
          id v12 = v14;
        }
        else
        {
          id v108 = v14;
          dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
          uint64_t Logger = NFLogGetLogger();
          if (Logger)
          {
            id v18 = (void (*)(uint64_t, const char *, ...))Logger;
            Class = object_getClass(self);
            BOOL isMetaClass = class_isMetaClass(Class);
            ClassName = object_getClassName(self);
            Name = sel_getName(a2);
            v23 = [v13 response];
            id v106 = [v23 length];
            uint64_t v24 = 45;
            if (isMetaClass) {
              uint64_t v24 = 43;
            }
            v18(3, "%c[%{public}s %{public}s]:%i Invalid response length: %lu", v24, ClassName, Name, 263, v106);
          }
          dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
          uint64_t v25 = NFSharedLogGetLogger();
          if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
          {
            uint64_t v26 = object_getClass(self);
            if (class_isMetaClass(v26)) {
              int v27 = 43;
            }
            else {
              int v27 = 45;
            }
            int v28 = object_getClassName(self);
            int v29 = sel_getName(a2);
            int v30 = [v13 response];
            id v31 = [v30 length];
            *(_DWORD *)buf = 67110146;
            int v124 = v27;
            __int16 v125 = 2082;
            id v126 = v28;
            __int16 v127 = 2082;
            int v128 = v29;
            __int16 v129 = 1024;
            int v130 = 263;
            __int16 v131 = 2048;
            id v132 = v31;
            _os_log_impl((void *)&_mh_execute_header, v25, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i Invalid response length: %lu", buf, 0x2Cu);
          }
          id v32 = objc_alloc((Class)NSError);
          id v33 = +[NSString stringWithUTF8String:"nfcd"];
          v111[0] = NSLocalizedDescriptionKey;
          id v34 = +[NSString stringWithUTF8String:"Unexpected Result"];
          v112[0] = v34;
          v112[1] = &off_10031A0F8;
          v111[1] = @"Line";
          v111[2] = @"Method";
          id v35 = [objc_alloc((Class)NSString) initWithFormat:@"%s", sel_getName(a2)];
          v112[2] = v35;
          v111[3] = NSDebugDescriptionErrorKey;
          id v36 = [objc_alloc((Class)NSString) initWithFormat:@"%s:%d", sel_getName(a2), 264];
          v112[3] = v36;
          id v37 = +[NSDictionary dictionaryWithObjects:v112 forKeys:v111 count:4];
          id v38 = [v32 initWithDomain:v33 code:13 userInfo:v37];

          id v12 = v108;
        }
      }
      else
      {
        dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
        uint64_t v79 = NFLogGetLogger();
        if (v79)
        {
          id v80 = (void (*)(uint64_t, const char *, ...))v79;
          id v81 = object_getClass(self);
          BOOL v82 = class_isMetaClass(v81);
          uint64_t v83 = object_getClassName(self);
          v105 = sel_getName(a2);
          uint64_t v84 = 45;
          if (v82) {
            uint64_t v84 = 43;
          }
          v80(3, "%c[%{public}s %{public}s]:%i Nil response", v84, v83, v105, 255);
        }
        dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
        BOOL v85 = NFSharedLogGetLogger();
        if (os_log_type_enabled(v85, OS_LOG_TYPE_ERROR))
        {
          int v86 = object_getClass(self);
          if (class_isMetaClass(v86)) {
            int v87 = 43;
          }
          else {
            int v87 = 45;
          }
          v88 = object_getClassName(self);
          uint64_t v89 = sel_getName(a2);
          *(_DWORD *)buf = 67109890;
          int v124 = v87;
          __int16 v125 = 2082;
          id v126 = v88;
          __int16 v127 = 2082;
          int v128 = v89;
          __int16 v129 = 1024;
          int v130 = 255;
          _os_log_impl((void *)&_mh_execute_header, v85, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i Nil response", buf, 0x22u);
        }

        id v90 = objc_alloc((Class)NSError);
        id v12 = +[NSString stringWithUTF8String:"nfcd"];
        if (v14)
        {
          id v91 = [v14 code];
          v115[0] = NSLocalizedDescriptionKey;
          if ((uint64_t)[v14 code] > 70) {
            uint64_t v92 = 71;
          }
          else {
            uint64_t v92 = (uint64_t)[v14 code];
          }
          id v97 = +[NSString stringWithUTF8String:off_1003016A0[v92]];
          v116[0] = v97;
          v116[1] = v14;
          v115[1] = NSUnderlyingErrorKey;
          v115[2] = @"Line";
          v116[2] = &off_10031A0E0;
          v115[3] = @"Method";
          id v98 = [objc_alloc((Class)NSString) initWithFormat:@"%s", sel_getName(a2)];
          v116[3] = v98;
          void v115[4] = NSDebugDescriptionErrorKey;
          id v99 = [objc_alloc((Class)NSString) initWithFormat:@"%s:%d", sel_getName(a2), 256];
          void v116[4] = v99;
          +[NSDictionary dictionaryWithObjects:v116 forKeys:v115 count:5];
          id v101 = v100 = v14;
          id v38 = [v90 initWithDomain:v12 code:v91 userInfo:v101];

          id v13 = v12;
          id v12 = v100;
        }
        else
        {
          v113[0] = NSLocalizedDescriptionKey;
          id v13 = +[NSString stringWithUTF8String:"Unknown Error"];
          v114[0] = v13;
          v114[1] = &off_10031A0E0;
          v113[1] = @"Line";
          v113[2] = @"Method";
          id v94 = [objc_alloc((Class)NSString) initWithFormat:@"%s", sel_getName(a2)];
          v114[2] = v94;
          v113[3] = NSDebugDescriptionErrorKey;
          id v95 = [objc_alloc((Class)NSString) initWithFormat:@"%s:%d", sel_getName(a2), 256];
          v114[3] = v95;
          id v96 = +[NSDictionary dictionaryWithObjects:v114 forKeys:v113 count:4];
          id v38 = [v90 initWithDomain:v12 code:6 userInfo:v96];
        }
      }
    }
    else
    {
      *a5 = (unsigned __int16)[v11 status];
      dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
      uint64_t v52 = NFLogGetLogger();
      if (v52)
      {
        id v53 = (void (*)(uint64_t, const char *, ...))v52;
        uint64_t v54 = object_getClass(self);
        BOOL v55 = class_isMetaClass(v54);
        uint64_t v56 = object_getClassName(self);
        id v57 = sel_getName(a2);
        uint64_t v107 = [v11 status];
        uint64_t v58 = 45;
        if (v55) {
          uint64_t v58 = 43;
        }
        v53(3, "%c[%{public}s %{public}s]:%i Failed to select applet: 0x%04x", v58, v56, v57, 241, v107);
      }
      dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
      BOOL v59 = NFSharedLogGetLogger();
      if (os_log_type_enabled(v59, OS_LOG_TYPE_ERROR))
      {
        id v60 = object_getClass(self);
        if (class_isMetaClass(v60)) {
          int v61 = 43;
        }
        else {
          int v61 = 45;
        }
        uint64_t v62 = object_getClassName(self);
        v63 = sel_getName(a2);
        unsigned int v64 = [v11 status];
        *(_DWORD *)buf = 67110146;
        int v124 = v61;
        __int16 v125 = 2082;
        id v126 = v62;
        __int16 v127 = 2082;
        int v128 = v63;
        __int16 v129 = 1024;
        int v130 = 241;
        __int16 v131 = 1024;
        LODWORD(v132) = v64;
        _os_log_impl((void *)&_mh_execute_header, v59, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i Failed to select applet: 0x%04x", buf, 0x28u);
      }

      unsigned int v65 = [v11 status];
      id v66 = objc_alloc((Class)NSError);
      unsigned int v67 = +[NSString stringWithUTF8String:"nfcd"];
      if (v65 == 26277)
      {
        v119[0] = NSLocalizedDescriptionKey;
        unsigned int v68 = +[NSString stringWithUTF8String:"Restricted Mode"];
        v120[0] = v68;
        v120[1] = &off_10031A0B0;
        v119[1] = @"Line";
        v119[2] = @"Method";
        id v69 = [objc_alloc((Class)NSString) initWithFormat:@"%s", sel_getName(a2)];
        v120[2] = v69;
        v119[3] = NSDebugDescriptionErrorKey;
        id v70 = [objc_alloc((Class)NSString) initWithFormat:@"%s:%d", sel_getName(a2), 243];
        v120[3] = v70;
        v71 = +[NSDictionary dictionaryWithObjects:v120 forKeys:v119 count:4];
        id v72 = v66;
        id v73 = v67;
        uint64_t v74 = 24;
      }
      else
      {
        v117[0] = NSLocalizedDescriptionKey;
        unsigned int v68 = +[NSString stringWithUTF8String:"Commmand Error"];
        v118[0] = v68;
        v118[1] = &off_10031A0C8;
        v117[1] = @"Line";
        v117[2] = @"Method";
        id v69 = [objc_alloc((Class)NSString) initWithFormat:@"%s", sel_getName(a2)];
        v118[2] = v69;
        v117[3] = NSDebugDescriptionErrorKey;
        id v70 = [objc_alloc((Class)NSString) initWithFormat:@"%s:%d", sel_getName(a2), 245];
        v118[3] = v70;
        v71 = +[NSDictionary dictionaryWithObjects:v118 forKeys:v117 count:4];
        id v72 = v66;
        id v73 = v67;
        uint64_t v74 = 16;
      }
      id v38 = [v72 initWithDomain:v73 code:v74 userInfo:v71];

      id v13 = v11;
    }
  }
  else
  {
    dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    uint64_t v39 = NFLogGetLogger();
    if (v39)
    {
      id v40 = (void (*)(uint64_t, const char *, ...))v39;
      id v41 = object_getClass(self);
      BOOL v42 = class_isMetaClass(v41);
      id v103 = object_getClassName(self);
      int v104 = sel_getName(a2);
      uint64_t v43 = 45;
      if (v42) {
        uint64_t v43 = 43;
      }
      v40(3, "%c[%{public}s %{public}s]:%i Failed to select applet: %{public}@", v43, v103, v104, 236, v12);
    }
    dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    BOOL v44 = NFSharedLogGetLogger();
    if (os_log_type_enabled(v44, OS_LOG_TYPE_ERROR))
    {
      BOOL v45 = object_getClass(self);
      if (class_isMetaClass(v45)) {
        int v46 = 43;
      }
      else {
        int v46 = 45;
      }
      unsigned int v47 = object_getClassName(self);
      int v48 = sel_getName(a2);
      *(_DWORD *)buf = 67110146;
      int v124 = v46;
      __int16 v125 = 2082;
      id v126 = v47;
      __int16 v127 = 2082;
      int v128 = v48;
      __int16 v129 = 1024;
      int v130 = 236;
      __int16 v131 = 2114;
      id v132 = v12;
      _os_log_impl((void *)&_mh_execute_header, v44, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i Failed to select applet: %{public}@", buf, 0x2Cu);
    }

    id v49 = objc_alloc((Class)NSError);
    id v13 = +[NSString stringWithUTF8String:"nfcd"];
    id v50 = [v12 code];
    v121[0] = NSLocalizedDescriptionKey;
    if ((uint64_t)[v12 code] > 70) {
      uint64_t v51 = 71;
    }
    else {
      uint64_t v51 = (uint64_t)[v12 code];
    }
    id v75 = +[NSString stringWithUTF8String:off_1003016A0[v51]];
    v122[0] = v75;
    v122[1] = v12;
    v121[1] = NSUnderlyingErrorKey;
    v121[2] = @"Line";
    v122[2] = &off_10031A098;
    v121[3] = @"Method";
    id v76 = [objc_alloc((Class)NSString) initWithFormat:@"%s", sel_getName(a2)];
    v122[3] = v76;
    void v121[4] = NSDebugDescriptionErrorKey;
    id v77 = [objc_alloc((Class)NSString) initWithFormat:@"%s:%d", sel_getName(a2), 237];
    void v122[4] = v77;
    uint64_t v78 = +[NSDictionary dictionaryWithObjects:v122 forKeys:v121 count:5];
    id v38 = [v49 initWithDomain:v13 code:v50 userInfo:v78];
  }

  return v38;
}

- (id)getData:(id *)a3 updateKUD:(char *)a4 outWriteLimit:(unsigned int *)a5 outWriteCount:(unsigned int *)a6 appletResult:(unsigned __int16 *)a7
{
  id v13 = [objc_alloc((Class)NSData) initWithBytes:&unk_100283628 length:8];
  id v120 = 0;
  id v14 = [(NFSecureElementWrapper *)self selectByName:v13 error:&v120];
  id v15 = v120;

  if (v14)
  {
    if ([v14 status] == 36864)
    {
      id v119 = v15;
      id v16 = [(NFSecureElementWrapper *)self sendCommandWithClass:128 instruction:5 p1:0 p2:0 data:0 error:&v119];
      id v117 = v119;

      if (v16)
      {
        *a7 = (unsigned __int16)[v16 status];
        id v17 = [v16 response];
        if ((unint64_t)[v17 length] >= 0x15)
        {
          unsigned int v73 = [v16 status];

          if (v73 == 36864)
          {
            id v74 = [v16 response];
            *a6 = *(_DWORD *)[v74 bytes];

            id v75 = [v16 response];
            *a5 = *((_DWORD *)[v75 bytes] + 1);

            id v76 = [v16 response];
            *a4 = *((unsigned char *)[v76 bytes] + 8);

            id v77 = [v16 response];
            id v78 = [v77 length];

            if ((unint64_t)v78 < 0xA)
            {
              *a3 = +[NSData data];
            }
            else
            {
              uint64_t v79 = [v16 response];
              id v80 = [v16 response];
              [v79 subdataWithRange:9, [v80 length] - 9];
              *a3 = (id)objc_claimAutoreleasedReturnValue();
            }
            id v58 = 0;
            *a6 = bswap32(*a6);
            *a5 = bswap32(*a5);
LABEL_62:
            id v15 = v117;
            goto LABEL_63;
          }
        }
        else
        {
        }
        dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
        uint64_t Logger = NFLogGetLogger();
        if (Logger)
        {
          BOOL v82 = (void (*)(uint64_t, const char *, ...))Logger;
          Class = object_getClass(self);
          BOOL isMetaClass = class_isMetaClass(Class);
          ClassName = object_getClassName(self);
          Name = sel_getName(a2);
          int v87 = [v16 response];
          id v115 = [v87 length];
          uint64_t v116 = [v16 status];
          uint64_t v88 = 45;
          if (isMetaClass) {
            uint64_t v88 = 43;
          }
          v82(3, "%c[%{public}s %{public}s]:%i Invalid response length: %lu or status 0x%x", v88, ClassName, Name, 313, v115, v116);
        }
        dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
        uint64_t v89 = NFSharedLogGetLogger();
        if (os_log_type_enabled(v89, OS_LOG_TYPE_ERROR))
        {
          id v90 = object_getClass(self);
          if (class_isMetaClass(v90)) {
            int v91 = 43;
          }
          else {
            int v91 = 45;
          }
          uint64_t v92 = object_getClassName(self);
          id v93 = sel_getName(a2);
          id v94 = [v16 response];
          id v95 = [v94 length];
          unsigned int v96 = [v16 status];
          *(_DWORD *)buf = 67110402;
          int v124 = v91;
          __int16 v125 = 2082;
          id v126 = v92;
          __int16 v127 = 2082;
          int v128 = v93;
          __int16 v129 = 1024;
          int v130 = 313;
          __int16 v131 = 2048;
          id v132 = v95;
          __int16 v133 = 1024;
          unsigned int v134 = v96;
          _os_log_impl((void *)&_mh_execute_header, v89, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i Invalid response length: %lu or status 0x%x", buf, 0x32u);
        }
        id v97 = objc_alloc((Class)NSError);
        id v98 = +[NSString stringWithUTF8String:"nfcd"];
        v121[0] = NSLocalizedDescriptionKey;
        id v99 = +[NSString stringWithUTF8String:"Unexpected Result"];
        v122[0] = v99;
        v122[1] = &off_10031A170;
        v121[1] = @"Line";
        v121[2] = @"Method";
        id v100 = [[objc_alloc((Class)NSString) initWithFormat:@"%s", sel_getName(a2)];
        v122[2] = v100;
        v121[3] = NSDebugDescriptionErrorKey;
        id v101 = [objc_alloc((Class)NSString) initWithFormat:@"%s:%d", sel_getName(a2), 314];
        v122[3] = v101;
        id v102 = +[NSDictionary dictionaryWithObjects:v122 forKeys:v121 count:4];
        id v58 = [v97 initWithDomain:v98 code:13 userInfo:v102];

        goto LABEL_62;
      }
      dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
      uint64_t v59 = NFLogGetLogger();
      if (v59)
      {
        id v60 = (void (*)(uint64_t, const char *, ...))v59;
        int v61 = object_getClass(self);
        BOOL v62 = class_isMetaClass(v61);
        v63 = object_getClassName(self);
        id v113 = sel_getName(a2);
        uint64_t v64 = 45;
        if (v62) {
          uint64_t v64 = 43;
        }
        v60(3, "%c[%{public}s %{public}s]:%i Nil response", v64, v63, v113, 305);
      }
      dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
      unsigned int v65 = NFSharedLogGetLogger();
      if (os_log_type_enabled(v65, OS_LOG_TYPE_ERROR))
      {
        id v66 = object_getClass(self);
        if (class_isMetaClass(v66)) {
          int v67 = 43;
        }
        else {
          int v67 = 45;
        }
        unsigned int v68 = object_getClassName(self);
        id v69 = sel_getName(a2);
        *(_DWORD *)buf = 67109890;
        int v124 = v67;
        __int16 v125 = 2082;
        id v126 = v68;
        __int16 v127 = 2082;
        int v128 = v69;
        __int16 v129 = 1024;
        int v130 = 305;
        _os_log_impl((void *)&_mh_execute_header, v65, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i Nil response", buf, 0x22u);
      }

      id v70 = objc_alloc((Class)NSError);
      id v15 = +[NSString stringWithUTF8String:"nfcd"];
      if (v117)
      {
        id v71 = [v117 code];
        v137[0] = NSLocalizedDescriptionKey;
        if ((uint64_t)[v117 code] > 70) {
          uint64_t v72 = 71;
        }
        else {
          uint64_t v72 = (uint64_t)[v117 code];
        }
        id v106 = +[NSString stringWithUTF8String:off_1003016A0[v72]];
        v138[0] = v106;
        v138[1] = v117;
        v137[1] = NSUnderlyingErrorKey;
        v137[2] = @"Line";
        v138[2] = &off_10031A158;
        v137[3] = @"Method";
        id v107 = [objc_alloc((Class)NSString) initWithFormat:@"%s", sel_getName(a2)];
        v138[3] = v107;
        void v137[4] = NSDebugDescriptionErrorKey;
        id v108 = [objc_alloc((Class)NSString) initWithFormat:@"%s:%d", sel_getName(a2), 306];
        void v138[4] = v108;
        id v109 = +[NSDictionary dictionaryWithObjects:v138 forKeys:v137 count:5];
        id v58 = [v70 initWithDomain:v15 code:v71 userInfo:v109];

        id v16 = v15;
        id v15 = v117;
      }
      else
      {
        v135[0] = NSLocalizedDescriptionKey;
        id v16 = +[NSString stringWithUTF8String:"Unknown Error"];
        v136[0] = v16;
        v136[1] = &off_10031A158;
        v135[1] = @"Line";
        v135[2] = @"Method";
        id v103 = [objc_alloc((Class)NSString) initWithFormat:@"%s", sel_getName(a2)];
        v136[2] = v103;
        v135[3] = NSDebugDescriptionErrorKey;
        id v104 = [objc_alloc((Class)NSString) initWithFormat:@"%s:%d", sel_getName(a2), 306];
        v136[3] = v104;
        v105 = +[NSDictionary dictionaryWithObjects:v136 forKeys:v135 count:4];
        id v58 = [v70 initWithDomain:v15 code:6 userInfo:v105];
      }
    }
    else
    {
      *a7 = (unsigned __int16)[v14 status];
      dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
      uint64_t v31 = NFLogGetLogger();
      if (v31)
      {
        id v32 = (void (*)(uint64_t, const char *, ...))v31;
        id v33 = object_getClass(self);
        BOOL v34 = class_isMetaClass(v33);
        id v35 = object_getClassName(self);
        id v36 = sel_getName(a2);
        uint64_t v114 = [v14 status];
        uint64_t v37 = 45;
        if (v34) {
          uint64_t v37 = 43;
        }
        v32(3, "%c[%{public}s %{public}s]:%i Failed to select applet: 0x%04x", v37, v35, v36, 291, v114);
      }
      dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
      id v38 = NFSharedLogGetLogger();
      if (os_log_type_enabled(v38, OS_LOG_TYPE_ERROR))
      {
        uint64_t v39 = object_getClass(self);
        if (class_isMetaClass(v39)) {
          int v40 = 43;
        }
        else {
          int v40 = 45;
        }
        id v41 = object_getClassName(self);
        BOOL v42 = sel_getName(a2);
        unsigned int v43 = [v14 status];
        *(_DWORD *)buf = 67110146;
        int v124 = v40;
        __int16 v125 = 2082;
        id v126 = v41;
        __int16 v127 = 2082;
        int v128 = v42;
        __int16 v129 = 1024;
        int v130 = 291;
        __int16 v131 = 1024;
        LODWORD(v132) = v43;
        _os_log_impl((void *)&_mh_execute_header, v38, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i Failed to select applet: 0x%04x", buf, 0x28u);
      }

      unsigned int v44 = [v14 status];
      id v45 = objc_alloc((Class)NSError);
      int v46 = +[NSString stringWithUTF8String:"nfcd"];
      if (v44 == 26277)
      {
        v141[0] = NSLocalizedDescriptionKey;
        unsigned int v47 = +[NSString stringWithUTF8String:"Restricted Mode"];
        v142[0] = v47;
        v142[1] = &off_10031A128;
        v141[1] = @"Line";
        v141[2] = @"Method";
        id v48 = [objc_alloc((Class)NSString) initWithFormat:@"%s", sel_getName(a2)];
        v142[2] = v48;
        v141[3] = NSDebugDescriptionErrorKey;
        id v49 = [objc_alloc((Class)NSString) initWithFormat:@"%s:%d", sel_getName(a2), 293];
        v142[3] = v49;
        id v50 = +[NSDictionary dictionaryWithObjects:v142 forKeys:v141 count:4];
        uint64_t v51 = v45;
        uint64_t v52 = v46;
        uint64_t v53 = 24;
      }
      else
      {
        v139[0] = NSLocalizedDescriptionKey;
        unsigned int v47 = +[NSString stringWithUTF8String:"Commmand Error"];
        v140[0] = v47;
        v140[1] = &off_10031A140;
        v139[1] = @"Line";
        v139[2] = @"Method";
        id v48 = [objc_alloc((Class)NSString) initWithFormat:@"%s", sel_getName(a2)];
        v140[2] = v48;
        v139[3] = NSDebugDescriptionErrorKey;
        id v49 = [objc_alloc((Class)NSString) initWithFormat:@"%s:%d", sel_getName(a2), 295];
        v140[3] = v49;
        id v50 = +[NSDictionary dictionaryWithObjects:v140 forKeys:v139 count:4];
        uint64_t v51 = v45;
        uint64_t v52 = v46;
        uint64_t v53 = 16;
      }
      id v58 = [v51 initWithDomain:v52 code:v53 userInfo:v50];

      id v16 = v14;
    }
  }
  else
  {
    dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    uint64_t v18 = NFLogGetLogger();
    if (v18)
    {
      id v19 = (void (*)(uint64_t, const char *, ...))v18;
      v20 = object_getClass(self);
      BOOL v21 = class_isMetaClass(v20);
      id v111 = object_getClassName(self);
      id v112 = sel_getName(a2);
      uint64_t v22 = 45;
      if (v21) {
        uint64_t v22 = 43;
      }
      v19(3, "%c[%{public}s %{public}s]:%i Failed to select applet: %{public}@", v22, v111, v112, 286, v15);
    }
    dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    v23 = NFSharedLogGetLogger();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
    {
      uint64_t v24 = object_getClass(self);
      if (class_isMetaClass(v24)) {
        int v25 = 43;
      }
      else {
        int v25 = 45;
      }
      uint64_t v26 = object_getClassName(self);
      int v27 = sel_getName(a2);
      *(_DWORD *)buf = 67110146;
      int v124 = v25;
      __int16 v125 = 2082;
      id v126 = v26;
      __int16 v127 = 2082;
      int v128 = v27;
      __int16 v129 = 1024;
      int v130 = 286;
      __int16 v131 = 2114;
      id v132 = v15;
      _os_log_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i Failed to select applet: %{public}@", buf, 0x2Cu);
    }

    id v28 = objc_alloc((Class)NSError);
    id v16 = +[NSString stringWithUTF8String:"nfcd"];
    id v29 = [v15 code];
    v143[0] = NSLocalizedDescriptionKey;
    if ((uint64_t)[v15 code] > 70) {
      uint64_t v30 = 71;
    }
    else {
      uint64_t v30 = (uint64_t)[v15 code];
    }
    uint64_t v54 = +[NSString stringWithUTF8String:off_1003016A0[v30]];
    v144[0] = v54;
    v144[1] = v15;
    v143[1] = NSUnderlyingErrorKey;
    v143[2] = @"Line";
    v144[2] = &off_10031A110;
    v143[3] = @"Method";
    id v55 = [objc_alloc((Class)NSString) initWithFormat:@"%s", sel_getName(a2)];
    v144[3] = v55;
    v143[4] = NSDebugDescriptionErrorKey;
    id v56 = [objc_alloc((Class)NSString) initWithFormat:@"%s:%d", sel_getName(a2), 287];
    v144[4] = v56;
    id v57 = +[NSDictionary dictionaryWithObjects:v144 forKeys:v143 count:5];
    id v58 = [v28 initWithDomain:v16 code:v29 userInfo:v57];
  }
LABEL_63:

  return v58;
}

- (id)getHash:(id *)a3 appletResult:(unsigned __int16 *)a4
{
  id v8 = [objc_alloc((Class)NSData) initWithBytes:&unk_100283628 length:8];
  id v103 = 0;
  uint64_t v9 = [(NFSecureElementWrapper *)self selectByName:v8 error:&v103];
  id v10 = v103;

  if (v9)
  {
    if ([v9 status] == 36864)
    {
      id v102 = v10;
      id v11 = [(NFSecureElementWrapper *)self sendCommandWithClass:128 instruction:6 p1:0 p2:0 data:0 error:&v102];
      id v12 = v102;

      if (v11)
      {
        *a4 = (unsigned __int16)[v11 status];
        id v13 = [v11 response];
        id v14 = [v13 length];

        if ((unint64_t)v14 > 0x1F)
        {
          id v31 = [v11 response];
          [v31 subdataWithRange:0, 32];
          id v36 = 0;
          *a3 = (id)objc_claimAutoreleasedReturnValue();
          id v10 = v12;
        }
        else
        {
          id v101 = v12;
          dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
          uint64_t Logger = NFLogGetLogger();
          if (Logger)
          {
            id v16 = (void (*)(uint64_t, const char *, ...))Logger;
            Class = object_getClass(self);
            BOOL isMetaClass = class_isMetaClass(Class);
            ClassName = object_getClassName(self);
            Name = sel_getName(a2);
            BOOL v21 = [v11 response];
            id v99 = [v21 length];
            uint64_t v22 = 45;
            if (isMetaClass) {
              uint64_t v22 = 43;
            }
            v16(3, "%c[%{public}s %{public}s]:%i Invalid response length: %lu", v22, ClassName, Name, 371, v99);
          }
          dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
          v23 = NFSharedLogGetLogger();
          if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
          {
            uint64_t v24 = object_getClass(self);
            if (class_isMetaClass(v24)) {
              int v25 = 43;
            }
            else {
              int v25 = 45;
            }
            uint64_t v26 = object_getClassName(self);
            int v27 = sel_getName(a2);
            id v28 = [v11 response];
            id v29 = [v28 length];
            *(_DWORD *)buf = 67110146;
            int v117 = v25;
            __int16 v118 = 2082;
            id v119 = v26;
            __int16 v120 = 2082;
            v121 = v27;
            __int16 v122 = 1024;
            int v123 = 371;
            __int16 v124 = 2048;
            id v125 = v29;
            _os_log_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i Invalid response length: %lu", buf, 0x2Cu);
          }
          id v30 = objc_alloc((Class)NSError);
          id v31 = +[NSString stringWithUTF8String:"nfcd"];
          v104[0] = NSLocalizedDescriptionKey;
          id v32 = +[NSString stringWithUTF8String:"Unexpected Result"];
          v105[0] = v32;
          v105[1] = &off_10031A1E8;
          v104[1] = @"Line";
          v104[2] = @"Method";
          id v33 = [objc_alloc((Class)NSString) initWithFormat:@"%s", sel_getName(a2)];
          v105[2] = v33;
          v104[3] = NSDebugDescriptionErrorKey;
          id v34 = [objc_alloc((Class)NSString) initWithFormat:@"%s:%d", sel_getName(a2), 372];
          v105[3] = v34;
          id v35 = +[NSDictionary dictionaryWithObjects:v105 forKeys:v104 count:4];
          id v36 = [v30 initWithDomain:v31 code:13 userInfo:v35];

          id v10 = v101;
        }
      }
      else
      {
        dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
        uint64_t v75 = NFLogGetLogger();
        if (v75)
        {
          id v76 = (void (*)(uint64_t, const char *, ...))v75;
          id v77 = object_getClass(self);
          BOOL v78 = class_isMetaClass(v77);
          uint64_t v79 = object_getClassName(self);
          id v98 = sel_getName(a2);
          uint64_t v80 = 45;
          if (v78) {
            uint64_t v80 = 43;
          }
          v76(3, "%c[%{public}s %{public}s]:%i Nil response", v80, v79, v98, 363);
        }
        dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
        id v81 = NFSharedLogGetLogger();
        if (os_log_type_enabled(v81, OS_LOG_TYPE_ERROR))
        {
          BOOL v82 = object_getClass(self);
          if (class_isMetaClass(v82)) {
            int v83 = 43;
          }
          else {
            int v83 = 45;
          }
          uint64_t v84 = object_getClassName(self);
          BOOL v85 = sel_getName(a2);
          *(_DWORD *)buf = 67109890;
          int v117 = v83;
          __int16 v118 = 2082;
          id v119 = v84;
          __int16 v120 = 2082;
          v121 = v85;
          __int16 v122 = 1024;
          int v123 = 363;
          _os_log_impl((void *)&_mh_execute_header, v81, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i Nil response", buf, 0x22u);
        }

        id v86 = objc_alloc((Class)NSError);
        id v10 = +[NSString stringWithUTF8String:"nfcd"];
        if (v12)
        {
          id v87 = [v12 code];
          v108[0] = NSLocalizedDescriptionKey;
          if ((uint64_t)[v12 code] > 70) {
            uint64_t v88 = 71;
          }
          else {
            uint64_t v88 = (uint64_t)[v12 code];
          }
          id v31 = +[NSString stringWithUTF8String:off_1003016A0[v88]];
          v109[0] = v31;
          v109[1] = v12;
          v108[1] = NSUnderlyingErrorKey;
          v108[2] = @"Line";
          v109[2] = &off_10031A1D0;
          v108[3] = @"Method";
          id v91 = [objc_alloc((Class)NSString) initWithFormat:@"%s", sel_getName(a2)];
          v109[3] = v91;
          v108[4] = NSDebugDescriptionErrorKey;
          id v92 = [objc_alloc((Class)NSString) initWithFormat:@"%s:%d", sel_getName(a2), 364];
          v109[4] = v92;
          +[NSDictionary dictionaryWithObjects:v109 forKeys:v108 count:5];
          id v94 = v93 = v12;
          id v36 = [v86 initWithDomain:v10 code:v87 userInfo:v94];

          id v11 = v10;
          id v10 = v93;
        }
        else
        {
          v106[0] = NSLocalizedDescriptionKey;
          id v11 = +[NSString stringWithUTF8String:"Unknown Error"];
          v107[0] = v11;
          v107[1] = &off_10031A1D0;
          v106[1] = @"Line";
          v106[2] = @"Method";
          id v31 = [objc_alloc((Class)NSString) initWithFormat:@"%s", sel_getName(a2)];
          v107[2] = v31;
          v106[3] = NSDebugDescriptionErrorKey;
          id v89 = [objc_alloc((Class)NSString) initWithFormat:@"%s:%d", sel_getName(a2), 364];
          v107[3] = v89;
          id v90 = +[NSDictionary dictionaryWithObjects:v107 forKeys:v106 count:4];
          id v36 = [v86 initWithDomain:v10 code:6 userInfo:v90];
        }
      }
    }
    else
    {
      *a4 = (unsigned __int16)[v9 status];
      dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
      uint64_t v50 = NFLogGetLogger();
      if (v50)
      {
        uint64_t v51 = (void (*)(uint64_t, const char *, ...))v50;
        uint64_t v52 = object_getClass(self);
        BOOL v53 = class_isMetaClass(v52);
        uint64_t v54 = object_getClassName(self);
        id v55 = sel_getName(a2);
        uint64_t v100 = [v9 status];
        uint64_t v56 = 45;
        if (v53) {
          uint64_t v56 = 43;
        }
        v51(3, "%c[%{public}s %{public}s]:%i Failed to select applet: 0x%04x", v56, v54, v55, 349, v100);
      }
      dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
      id v57 = NFSharedLogGetLogger();
      if (os_log_type_enabled(v57, OS_LOG_TYPE_ERROR))
      {
        id v58 = object_getClass(self);
        if (class_isMetaClass(v58)) {
          int v59 = 43;
        }
        else {
          int v59 = 45;
        }
        id v60 = object_getClassName(self);
        int v61 = sel_getName(a2);
        unsigned int v62 = [v9 status];
        *(_DWORD *)buf = 67110146;
        int v117 = v59;
        __int16 v118 = 2082;
        id v119 = v60;
        __int16 v120 = 2082;
        v121 = v61;
        __int16 v122 = 1024;
        int v123 = 349;
        __int16 v124 = 1024;
        LODWORD(v125) = v62;
        _os_log_impl((void *)&_mh_execute_header, v57, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i Failed to select applet: 0x%04x", buf, 0x28u);
      }

      unsigned int v63 = [v9 status];
      id v64 = objc_alloc((Class)NSError);
      id v31 = +[NSString stringWithUTF8String:"nfcd"];
      if (v63 == 26277)
      {
        v112[0] = NSLocalizedDescriptionKey;
        unsigned int v65 = +[NSString stringWithUTF8String:"Restricted Mode"];
        v113[0] = v65;
        v113[1] = &off_10031A1A0;
        v112[1] = @"Line";
        v112[2] = @"Method";
        id v66 = [objc_alloc((Class)NSString) initWithFormat:@"%s", sel_getName(a2)];
        v113[2] = v66;
        v112[3] = NSDebugDescriptionErrorKey;
        id v67 = [objc_alloc((Class)NSString) initWithFormat:@"%s:%d", sel_getName(a2), 351];
        v113[3] = v67;
        unsigned int v68 = +[NSDictionary dictionaryWithObjects:v113 forKeys:v112 count:4];
        id v69 = v64;
        id v70 = v31;
        uint64_t v71 = 24;
      }
      else
      {
        v110[0] = NSLocalizedDescriptionKey;
        unsigned int v65 = +[NSString stringWithUTF8String:"Commmand Error"];
        v111[0] = v65;
        v111[1] = &off_10031A1B8;
        v110[1] = @"Line";
        v110[2] = @"Method";
        id v66 = [objc_alloc((Class)NSString) initWithFormat:@"%s", sel_getName(a2)];
        v111[2] = v66;
        v110[3] = NSDebugDescriptionErrorKey;
        id v67 = [objc_alloc((Class)NSString) initWithFormat:@"%s:%d", sel_getName(a2), 353];
        v111[3] = v67;
        unsigned int v68 = +[NSDictionary dictionaryWithObjects:v111 forKeys:v110 count:4];
        id v69 = v64;
        id v70 = v31;
        uint64_t v71 = 16;
      }
      id v36 = [v69 initWithDomain:v70 code:v71 userInfo:v68];

      id v11 = v9;
    }
  }
  else
  {
    dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    uint64_t v37 = NFLogGetLogger();
    if (v37)
    {
      id v38 = (void (*)(uint64_t, const char *, ...))v37;
      uint64_t v39 = object_getClass(self);
      BOOL v40 = class_isMetaClass(v39);
      unsigned int v96 = object_getClassName(self);
      id v97 = sel_getName(a2);
      uint64_t v41 = 45;
      if (v40) {
        uint64_t v41 = 43;
      }
      v38(3, "%c[%{public}s %{public}s]:%i Failed to select applet: %{public}@", v41, v96, v97, 344, v10);
    }
    dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    BOOL v42 = NFSharedLogGetLogger();
    if (os_log_type_enabled(v42, OS_LOG_TYPE_ERROR))
    {
      unsigned int v43 = object_getClass(self);
      if (class_isMetaClass(v43)) {
        int v44 = 43;
      }
      else {
        int v44 = 45;
      }
      id v45 = object_getClassName(self);
      int v46 = sel_getName(a2);
      *(_DWORD *)buf = 67110146;
      int v117 = v44;
      __int16 v118 = 2082;
      id v119 = v45;
      __int16 v120 = 2082;
      v121 = v46;
      __int16 v122 = 1024;
      int v123 = 344;
      __int16 v124 = 2114;
      id v125 = v10;
      _os_log_impl((void *)&_mh_execute_header, v42, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i Failed to select applet: %{public}@", buf, 0x2Cu);
    }

    id v47 = objc_alloc((Class)NSError);
    id v11 = +[NSString stringWithUTF8String:"nfcd"];
    id v48 = [v10 code];
    v114[0] = NSLocalizedDescriptionKey;
    if ((uint64_t)[v10 code] > 70) {
      uint64_t v49 = 71;
    }
    else {
      uint64_t v49 = (uint64_t)[v10 code];
    }
    id v31 = +[NSString stringWithUTF8String:off_1003016A0[v49]];
    v115[0] = v31;
    v115[1] = v10;
    v114[1] = NSUnderlyingErrorKey;
    v114[2] = @"Line";
    v115[2] = &off_10031A188;
    v114[3] = @"Method";
    id v72 = [objc_alloc((Class)NSString) initWithFormat:@"%s", sel_getName(a2)];
    v115[3] = v72;
    void v114[4] = NSDebugDescriptionErrorKey;
    id v73 = [objc_alloc((Class)NSString) initWithFormat:@"%s:%d", sel_getName(a2), 345];
    void v115[4] = v73;
    id v74 = +[NSDictionary dictionaryWithObjects:v115 forKeys:v114 count:5];
    id v36 = [v47 initWithDomain:v11 code:v48 userInfo:v74];
  }

  return v36;
}

- (id)upgradeKey:(unsigned __int8)a3 inputData:(id)a4 outWriteCount:(unsigned int *)a5 appletResult:(unsigned __int16 *)a6
{
  uint64_t v8 = a3;
  id v11 = a4;
  id v12 = [objc_alloc((Class)NSData) initWithBytes:&unk_100283628 length:8];
  id v107 = 0;
  id v13 = [(NFSecureElementWrapper *)self selectByName:v12 error:&v107];
  id v14 = v107;

  if (!v13)
  {
    dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    uint64_t Logger = NFLogGetLogger();
    if (Logger)
    {
      BOOL v42 = (void (*)(uint64_t, const char *, ...))Logger;
      Class = object_getClass(self);
      BOOL isMetaClass = class_isMetaClass(Class);
      ClassName = object_getClassName(self);
      Name = sel_getName(a2);
      uint64_t v45 = 45;
      if (isMetaClass) {
        uint64_t v45 = 43;
      }
      v42(3, "%c[%{public}s %{public}s]:%i Failed to select applet: %{public}@", v45, ClassName, Name, 389, v14);
    }
    dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    int v46 = NFSharedLogGetLogger();
    if (os_log_type_enabled(v46, OS_LOG_TYPE_ERROR))
    {
      id v47 = object_getClass(self);
      if (class_isMetaClass(v47)) {
        int v48 = 43;
      }
      else {
        int v48 = 45;
      }
      uint64_t v49 = object_getClassName(self);
      uint64_t v50 = sel_getName(a2);
      *(_DWORD *)buf = 67110146;
      int v119 = v48;
      __int16 v120 = 2082;
      v121 = v49;
      __int16 v122 = 2082;
      int v123 = v50;
      __int16 v124 = 1024;
      int v125 = 389;
      __int16 v126 = 2114;
      id v127 = v14;
      _os_log_impl((void *)&_mh_execute_header, v46, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i Failed to select applet: %{public}@", buf, 0x2Cu);
    }
    uint64_t v51 = a2;

    id v52 = objc_alloc((Class)NSError);
    id v15 = +[NSString stringWithUTF8String:"nfcd"];
    id v53 = [v14 code];
    v116[0] = NSLocalizedDescriptionKey;
    id v54 = v11;
    if ((uint64_t)[v14 code] > 70) {
      uint64_t v55 = 71;
    }
    else {
      uint64_t v55 = (uint64_t)[v14 code];
    }
    uint64_t v79 = +[NSString stringWithUTF8String:off_1003016A0[v55]];
    v117[0] = v79;
    v117[1] = v14;
    v116[1] = NSUnderlyingErrorKey;
    v116[2] = @"Line";
    v117[2] = &off_10031A200;
    v116[3] = @"Method";
    id v80 = [objc_alloc((Class)NSString) initWithFormat:@"%s", sel_getName(v51)];
    v117[3] = v80;
    void v116[4] = NSDebugDescriptionErrorKey;
    id v81 = [objc_alloc((Class)NSString) initWithFormat:@"%s:%d", sel_getName(v51), 390];
    void v117[4] = v81;
    BOOL v82 = +[NSDictionary dictionaryWithObjects:v117 forKeys:v116 count:5];
    int v83 = v52;
    goto LABEL_56;
  }
  if ([v13 status] != 36864)
  {
    id v104 = v11;
    *a6 = (unsigned __int16)[v13 status];
    dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    uint64_t v56 = NFLogGetLogger();
    if (v56)
    {
      id v57 = (void (*)(uint64_t, const char *, ...))v56;
      id v58 = object_getClass(self);
      BOOL v59 = class_isMetaClass(v58);
      id v60 = object_getClassName(self);
      int v61 = sel_getName(a2);
      uint64_t v103 = [v13 status];
      uint64_t v62 = 45;
      if (v59) {
        uint64_t v62 = 43;
      }
      v57(3, "%c[%{public}s %{public}s]:%i Failed to select applet: 0x%04x", v62, v60, v61, 394, v103);
    }
    dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    unsigned int v63 = NFSharedLogGetLogger();
    if (os_log_type_enabled(v63, OS_LOG_TYPE_ERROR))
    {
      id v64 = object_getClass(self);
      if (class_isMetaClass(v64)) {
        int v65 = 43;
      }
      else {
        int v65 = 45;
      }
      id v66 = object_getClassName(self);
      id v67 = sel_getName(a2);
      unsigned int v68 = [v13 status];
      *(_DWORD *)buf = 67110146;
      int v119 = v65;
      __int16 v120 = 2082;
      v121 = v66;
      __int16 v122 = 2082;
      int v123 = v67;
      __int16 v124 = 1024;
      int v125 = 394;
      __int16 v126 = 1024;
      LODWORD(v127) = v68;
      _os_log_impl((void *)&_mh_execute_header, v63, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i Failed to select applet: 0x%04x", buf, 0x28u);
    }

    unsigned int v69 = [v13 status];
    id v70 = objc_alloc((Class)NSError);
    uint64_t v71 = +[NSString stringWithUTF8String:"nfcd"];
    if (v69 == 26277)
    {
      v114[0] = NSLocalizedDescriptionKey;
      id v72 = +[NSString stringWithUTF8String:"Restricted Mode"];
      v115[0] = v72;
      v115[1] = &off_10031A218;
      v114[1] = @"Line";
      v114[2] = @"Method";
      id v73 = [objc_alloc((Class)NSString) initWithFormat:@"%s", sel_getName(a2)];
      v115[2] = v73;
      v114[3] = NSDebugDescriptionErrorKey;
      id v74 = [objc_alloc((Class)NSString) initWithFormat:@"%s:%d", sel_getName(a2), 396];
      v115[3] = v74;
      uint64_t v75 = +[NSDictionary dictionaryWithObjects:v115 forKeys:v114 count:4];
      id v76 = v70;
      id v77 = v71;
      uint64_t v78 = 24;
    }
    else
    {
      v112[0] = NSLocalizedDescriptionKey;
      id v72 = +[NSString stringWithUTF8String:"Commmand Error"];
      v113[0] = v72;
      v113[1] = &off_10031A230;
      v112[1] = @"Line";
      v112[2] = @"Method";
      id v73 = [objc_alloc((Class)NSString) initWithFormat:@"%s", sel_getName(a2)];
      v113[2] = v73;
      v112[3] = NSDebugDescriptionErrorKey;
      id v74 = [objc_alloc((Class)NSString) initWithFormat:@"%s:%d", sel_getName(a2), 398];
      v113[3] = v74;
      uint64_t v75 = +[NSDictionary dictionaryWithObjects:v113 forKeys:v112 count:4];
      id v76 = v70;
      id v77 = v71;
      uint64_t v78 = 16;
    }
    id v40 = [v76 initWithDomain:v77 code:v78 userInfo:v75];

    id v15 = v13;
    goto LABEL_41;
  }
  id v106 = v14;
  id v15 = [(NFSecureElementWrapper *)self sendCommandWithClass:128 instruction:7 p1:v8 p2:0 data:v11 error:&v106];
  id v16 = v106;

  if (!v15)
  {
    dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    uint64_t v84 = NFLogGetLogger();
    if (v84)
    {
      BOOL v85 = (void (*)(uint64_t, const char *, ...))v84;
      id v86 = object_getClass(self);
      BOOL v87 = class_isMetaClass(v86);
      uint64_t v88 = object_getClassName(self);
      id v101 = sel_getName(a2);
      uint64_t v89 = 45;
      if (v87) {
        uint64_t v89 = 43;
      }
      v85(3, "%c[%{public}s %{public}s]:%i Nil response", v89, v88, v101, 408);
    }
    dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    id v90 = NFSharedLogGetLogger();
    if (os_log_type_enabled(v90, OS_LOG_TYPE_ERROR))
    {
      id v91 = object_getClass(self);
      if (class_isMetaClass(v91)) {
        int v92 = 43;
      }
      else {
        int v92 = 45;
      }
      id v93 = object_getClassName(self);
      id v94 = sel_getName(a2);
      *(_DWORD *)buf = 67109890;
      int v119 = v92;
      __int16 v120 = 2082;
      v121 = v93;
      __int16 v122 = 2082;
      int v123 = v94;
      __int16 v124 = 1024;
      int v125 = 408;
      _os_log_impl((void *)&_mh_execute_header, v90, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i Nil response", buf, 0x22u);
    }

    id v105 = objc_alloc((Class)NSError);
    id v15 = +[NSString stringWithUTF8String:"nfcd"];
    id v53 = [v16 code];
    v110[0] = NSLocalizedDescriptionKey;
    uint64_t v95 = (uint64_t)[v16 code];
    id v14 = v16;
    id v54 = v11;
    if (v95 > 70) {
      uint64_t v96 = 71;
    }
    else {
      uint64_t v96 = (uint64_t)[v14 code];
    }
    uint64_t v79 = +[NSString stringWithUTF8String:off_1003016A0[v96]];
    v111[0] = v79;
    v111[1] = v14;
    v110[1] = NSUnderlyingErrorKey;
    v110[2] = @"Line";
    v111[2] = &off_10031A248;
    v110[3] = @"Method";
    id v80 = [objc_alloc((Class)NSString) initWithFormat:@"%s", sel_getName(a2)];
    v111[3] = v80;
    void v110[4] = NSDebugDescriptionErrorKey;
    id v81 = [objc_alloc((Class)NSString) initWithFormat:@"%s:%d", sel_getName(a2), 409];
    void v111[4] = v81;
    BOOL v82 = +[NSDictionary dictionaryWithObjects:v111 forKeys:v110 count:5];
    int v83 = v105;
LABEL_56:
    id v40 = [v83 initWithDomain:v15 code:v53 userInfo:v82];

    id v11 = v54;
    goto LABEL_57;
  }
  *a6 = (unsigned __int16)[v15 status];
  id v17 = [v15 response];
  id v18 = [v17 length];

  if ((unint64_t)v18 <= 3)
  {
    id v104 = v11;
    dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    uint64_t v19 = NFLogGetLogger();
    if (v19)
    {
      v20 = (void (*)(uint64_t, const char *, ...))v19;
      BOOL v21 = object_getClass(self);
      BOOL v22 = class_isMetaClass(v21);
      v23 = object_getClassName(self);
      uint64_t v24 = sel_getName(a2);
      int v25 = [v15 response];
      id v102 = [v25 length];
      uint64_t v26 = 45;
      if (v22) {
        uint64_t v26 = 43;
      }
      v20(3, "%c[%{public}s %{public}s]:%i Invalid response length: %lu", v26, v23, v24, 416, v102);
    }
    dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    int v27 = NFSharedLogGetLogger();
    if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
    {
      id v28 = object_getClass(self);
      if (class_isMetaClass(v28)) {
        int v29 = 43;
      }
      else {
        int v29 = 45;
      }
      id v30 = object_getClassName(self);
      id v31 = sel_getName(a2);
      id v32 = [v15 response];
      id v33 = [v32 length];
      *(_DWORD *)buf = 67110146;
      int v119 = v29;
      __int16 v120 = 2082;
      v121 = v30;
      __int16 v122 = 2082;
      int v123 = v31;
      __int16 v124 = 1024;
      int v125 = 416;
      __int16 v126 = 2048;
      id v127 = v33;
      _os_log_impl((void *)&_mh_execute_header, v27, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i Invalid response length: %lu", buf, 0x2Cu);
    }
    id v34 = objc_alloc((Class)NSError);
    id v35 = +[NSString stringWithUTF8String:"nfcd"];
    v108[0] = NSLocalizedDescriptionKey;
    id v36 = +[NSString stringWithUTF8String:"Unexpected Result"];
    v109[0] = v36;
    v109[1] = &off_10031A260;
    v108[1] = @"Line";
    v108[2] = @"Method";
    id v37 = [objc_alloc((Class)NSString) initWithFormat:@"%s", sel_getName(a2)];
    v109[2] = v37;
    v108[3] = NSDebugDescriptionErrorKey;
    id v38 = [objc_alloc((Class)NSString) initWithFormat:@"%s:%d", sel_getName(a2), 417];
    v109[3] = v38;
    uint64_t v39 = +[NSDictionary dictionaryWithObjects:v109 forKeys:v108 count:4];
    id v40 = [v34 initWithDomain:v35 code:13 userInfo:v39];

    id v14 = v16;
LABEL_41:
    id v11 = v104;
    goto LABEL_57;
  }
  id v97 = [v15 response];
  *a5 = *(_DWORD *)[v97 bytes];

  id v40 = 0;
  *a5 = bswap32(*a5);
  id v14 = v16;
LABEL_57:

  return v40;
}

- (id)recoverSLAM
{
  v3 = self;
  self;
  uint64_t v4 = objc_opt_new();
  v5 = (void *)v4;
  if (v4) {
    objc_storeStrong((id *)(v4 + 8), self);
  }

  v6 = +[SLAMObjC PerformRecovery:v5 logSink:v5];

  return v6;
}

- (NFSecureElementWrapper)initWithHandle:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)NFSecureElementWrapper;
  v6 = [(NFSecureElementWrapper *)&v9 init];
  uint64_t v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_handle, a3);
  }

  return v7;
}

- (id)getAuthQueue
{
  v2 = self;
  objc_sync_enter(v2);
  if (!v2->_authQueue)
  {
    v3 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    uint64_t v4 = dispatch_queue_attr_make_with_qos_class(v3, QOS_CLASS_USER_INTERACTIVE, -1);

    dispatch_queue_t v5 = dispatch_queue_create("com.apple.nfcd.authorization", v4);
    authQueue = v2->_authQueue;
    v2->_authQueue = (OS_dispatch_queue *)v5;

    dispatch_queue_set_specific((dispatch_queue_t)v2->_authQueue, kNFLOG_DISPATCH_SPECIFIC_KEY, 0, 0);
  }
  objc_sync_exit(v2);

  uint64_t v7 = v2->_authQueue;

  return v7;
}

- (BOOL)isProd
{
  v2 = [(NFSecureElementHandleInterface *)self->_handle info];
  BOOL v3 = [v2 signingKeyType] == (id)2;

  return v3;
}

- (BOOL)hasMultiOS
{
  if ([(NFSecureElementHandleInterface *)self->_handle identifier] != 1) {
    return 0;
  }
  BOOL v3 = [(NFSecureElementHandleInterface *)self->_handle info];
  BOOL v4 = [v3 seType] == (id)6;

  return v4;
}

- (BOOL)isOperational
{
  handle = self->_handle;
  if (!handle) {
    return 1;
  }
  BOOL v4 = [(NFSecureElementHandleInterface *)handle info];
  if ([v4 OSMode] == (id)2)
  {
    dispatch_queue_t v5 = [(NFSecureElementHandleInterface *)self->_handle info];
    id v6 = [v5 migrationState];

    if (v6 == (id)1) {
      return 1;
    }
  }
  else
  {
  }
  return 0;
}

- (NSString)serialNumber
{
  v2 = [(NFSecureElementHandleInterface *)self->_handle info];
  BOOL v3 = [v2 serialNumber];

  return (NSString *)v3;
}

- (NSData)serialNumberAsData
{
  v2 = [(NFSecureElementHandleInterface *)self->_handle info];
  BOOL v3 = [v2 serialNumber];
  BOOL v4 = +[NSData NF_dataWithHexString:v3];

  return (NSData *)v4;
}

- (NSString)systemOSSerialNumber
{
  v2 = [(NFSecureElementHandleInterface *)self->_handle info];
  BOOL v3 = [v2 systemOSSerialNumber];

  return (NSString *)v3;
}

- (NSData)systemOSSerialNumberAsData
{
  v2 = [(NFSecureElementHandleInterface *)self->_handle info];
  BOOL v3 = [v2 systemOSSerialNumber];
  BOOL v4 = +[NSData NF_dataWithHexString:v3];

  return (NSData *)v4;
}

- (BOOL)isSecureElement:(int)a3
{
  return [(NFSecureElementHandleInterface *)self->_handle identifier] == a3;
}

- (NSString)rsaCertificate
{
  v2 = [(NFSecureElementHandleInterface *)self->_handle info];
  BOOL v3 = [v2 rsaCertificate];

  return (NSString *)v3;
}

- (NSString)eccCertificate
{
  v2 = [(NFSecureElementHandleInterface *)self->_handle info];
  BOOL v3 = [v2 ecdsaCertificate];

  return (NSString *)v3;
}

- (NSString)eckaCertificate
{
  v2 = [(NFSecureElementHandleInterface *)self->_handle info];
  BOOL v3 = [v2 eckaCertificate];

  return (NSString *)v3;
}

- (id)transceiveData:(id)a3 toOS:(int64_t)a4 error:(id *)a5
{
  return [(NFSecureElementHandleInterface *)self->_handle transceive:a3 toOS:a4 error:a5];
}

- (unint64_t)supportedTechnologies
{
  v2 = [(NFSecureElementHandleInterface *)self->_handle info];
  id v3 = [v2 supportedTechnologies];

  return (unint64_t)v3;
}

- (id)sendCommandWithClass:(unsigned __int8)a3 instruction:(unsigned __int8)a4 p1:(unsigned __int8)a5 p2:(unsigned __int8)a6 data:(id)a7 expectedLength:(unsigned __int16)a8 toOS:(int64_t)a9 useExtendedLength:(BOOL)a10 error:(id *)a11
{
  uint64_t v11 = a8;
  uint64_t v12 = a6;
  uint64_t v13 = a5;
  uint64_t v14 = a4;
  uint64_t v15 = a3;
  id v16 = a7;
  id v17 = +[NFCommandAPDU buildAPDUHeaderWithClass:instruction:p1:p2:len:useExtendedLength:](NFCommandAPDU, "buildAPDUHeaderWithClass:instruction:p1:p2:len:useExtendedLength:", v15, v14, v13, v12, [v16 length], a10);
  if (v17)
  {
    if ([v16 length]) {
      [v17 appendData:v16];
    }
    uint64_t v18 = +[NFCommandAPDU appendExpectedLength:v11 usingExtendedLength:a10 toAPDU:v17];
    if (v18)
    {
      uint64_t v19 = (void *)v18;
      if (a11)
      {
        id v61 = objc_alloc((Class)NSError);
        uint64_t v20 = +[NSString stringWithUTF8String:"nfcd"];
        id v21 = [v19 code];
        v77[0] = NSLocalizedDescriptionKey;
        id v59 = v16;
        if ((uint64_t)[v19 code] > 70) {
          uint64_t v22 = 71;
        }
        else {
          uint64_t v22 = (uint64_t)[v19 code];
        }
        id v25 = +[NSString stringWithUTF8String:off_1003055F8[v22]];
        v78[0] = v25;
        v78[1] = v19;
        v77[1] = NSUnderlyingErrorKey;
        v77[2] = @"Line";
        v78[2] = &off_10031C510;
        v77[3] = @"Method";
        id v45 = [objc_alloc((Class)NSString) initWithFormat:@"%s", sel_getName(a2)];
        v78[3] = v45;
        v77[4] = NSDebugDescriptionErrorKey;
        id v46 = [objc_alloc((Class)NSString) initWithFormat:@"%s:%d", sel_getName(a2), 167];
        v78[4] = v46;
        id v47 = +[NSDictionary dictionaryWithObjects:v78 forKeys:v77 count:5];
        *a11 = [v61 initWithDomain:v20 code:v21 userInfo:v47];
        uint64_t v24 = (void *)v20;

        int v29 = 0;
        id v16 = v59;
        goto LABEL_28;
      }
LABEL_25:
      int v29 = 0;
      goto LABEL_30;
    }
    id v30 = [(NFSecureElementWrapper *)self transceiveData:v17 toOS:a9 error:a11];
    uint64_t v24 = v30;
    if (!v30) {
      goto LABEL_33;
    }
    if ((unint64_t)[v30 length] > 1)
    {
      uint64_t v49 = +[NFResponseAPDU responseWithData:v24];
      if (v49)
      {
        uint64_t v50 = v49;
        if ([v49 status] == 26277)
        {
          uint64_t v51 = [(NFSecureElementWrapper *)self delegate];
          [v51 secureElementReturnedRestrictedMode:self os:a9];
        }
        id v25 = v50;
        uint64_t v19 = 0;
        int v29 = v25;
        goto LABEL_28;
      }
      if (a11)
      {
        id v63 = objc_alloc((Class)NSError);
        id v52 = +[NSString stringWithUTF8String:"nfcd"];
        v65[0] = NSLocalizedDescriptionKey;
        id v53 = +[NSString stringWithUTF8String:"No resources"];
        v66[0] = v53;
        v66[1] = &off_10031C540;
        v65[1] = @"Line";
        v65[2] = @"Method";
        id v54 = v24;
        id v55 = [objc_alloc((Class)NSString) initWithFormat:@"%s", sel_getName(a2)];
        v66[2] = v55;
        v65[3] = NSDebugDescriptionErrorKey;
        id v56 = [objc_alloc((Class)NSString) initWithFormat:@"%s:%d", sel_getName(a2), 184];
        v66[3] = v56;
        id v57 = +[NSDictionary dictionaryWithObjects:v66 forKeys:v65 count:4];
        *a11 = [v63 initWithDomain:v52 code:34 userInfo:v57];

        uint64_t v24 = v54;
      }
      id v25 = 0;
      goto LABEL_10;
    }
    dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    uint64_t Logger = NFLogGetLogger();
    if (Logger)
    {
      id v32 = (void (*)(uint64_t, const char *, ...))Logger;
      Class = object_getClass(self);
      BOOL isMetaClass = class_isMetaClass(Class);
      ClassName = object_getClassName(self);
      Name = sel_getName(a2);
      uint64_t v36 = 45;
      if (isMetaClass) {
        uint64_t v36 = 43;
      }
      v32(3, "%c[%{public}s %{public}s]:%i Not enought byte to create response", v36, ClassName, Name, 177);
    }
    dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    id v37 = NFSharedLogGetLogger();
    if (os_log_type_enabled(v37, OS_LOG_TYPE_ERROR))
    {
      id v38 = object_getClass(self);
      if (class_isMetaClass(v38)) {
        int v39 = 43;
      }
      else {
        int v39 = 45;
      }
      *(_DWORD *)buf = 67109890;
      int v70 = v39;
      __int16 v71 = 2082;
      id v72 = object_getClassName(self);
      __int16 v73 = 2082;
      id v74 = sel_getName(a2);
      __int16 v75 = 1024;
      int v76 = 177;
      _os_log_impl((void *)&_mh_execute_header, v37, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i Not enought byte to create response", buf, 0x22u);
    }

    if (!a11)
    {
LABEL_33:
      uint64_t v19 = 0;
      int v29 = 0;
      goto LABEL_29;
    }
    id v62 = objc_alloc((Class)NSError);
    id v25 = +[NSString stringWithUTF8String:"nfcd"];
    v67[0] = NSLocalizedDescriptionKey;
    id v40 = +[NSString stringWithUTF8String:"Unexpected Result"];
    v68[0] = v40;
    v68[1] = &off_10031C528;
    v67[1] = @"Line";
    v67[2] = @"Method";
    uint64_t v41 = v24;
    id v42 = [objc_alloc((Class)NSString) initWithFormat:@"%s", sel_getName(a2)];
    v68[2] = v42;
    v67[3] = NSDebugDescriptionErrorKey;
    id v43 = [objc_alloc((Class)NSString) initWithFormat:@"%s:%d", sel_getName(a2), 178];
    v68[3] = v43;
    int v44 = +[NSDictionary dictionaryWithObjects:v68 forKeys:v67 count:4];
    *a11 = [v62 initWithDomain:v25 code:13 userInfo:v44];

    uint64_t v24 = v41;
  }
  else
  {
    if (!a11)
    {
      uint64_t v19 = 0;
      goto LABEL_25;
    }
    id v23 = objc_alloc((Class)NSError);
    uint64_t v24 = +[NSString stringWithUTF8String:"nfcd"];
    v79[0] = NSLocalizedDescriptionKey;
    id v25 = +[NSString stringWithUTF8String:"No resources"];
    v80[0] = v25;
    v80[1] = &off_10031C4F8;
    v79[1] = @"Line";
    v79[2] = @"Method";
    id v26 = [objc_alloc((Class)NSString) initWithFormat:@"%s", sel_getName(a2)];
    v80[2] = v26;
    v79[3] = NSDebugDescriptionErrorKey;
    id v27 = [objc_alloc((Class)NSString) initWithFormat:@"%s:%d", sel_getName(a2), 157];
    v80[3] = v27;
    id v28 = +[NSDictionary dictionaryWithObjects:v80 forKeys:v79 count:4];
    *a11 = [v23 initWithDomain:v24 code:34 userInfo:v28];
  }
LABEL_10:
  uint64_t v19 = 0;
  int v29 = 0;
LABEL_28:

LABEL_29:
LABEL_30:

  return v29;
}

- (id)sendCommandWithClass:(unsigned __int8)a3 instruction:(unsigned __int8)a4 p1:(unsigned __int8)a5 p2:(unsigned __int8)a6 data:(id)a7 error:(id *)a8
{
  LOBYTE(v9) = 0;
  return [(NFSecureElementWrapper *)self sendCommandWithClass:a3 instruction:a4 p1:a5 p2:a6 data:a7 expectedLength:0 toOS:0 useExtendedLength:v9 error:a8];
}

- (id)sendCommandWithClass:(unsigned __int8)a3 instruction:(unsigned __int8)a4 p1:(unsigned __int8)a5 p2:(unsigned __int8)a6 data:(id)a7 expectedLength:(unsigned __int8)a8 toOS:(int64_t)a9 error:(id *)a10
{
  LOBYTE(v11) = 0;
  return [(NFSecureElementWrapper *)self sendCommandWithClass:a3 instruction:a4 p1:a5 p2:a6 data:a7 expectedLength:a8 toOS:a9 useExtendedLength:v11 error:a10];
}

- (id)sendRepeatingExtendedCommandWithClass:(unsigned __int8)a3 instruction:(unsigned __int8)a4 p1:(unsigned __int8)a5 firstP2:(unsigned __int8)a6 nextP2:(unsigned __int8)a7 expectedLength:(unsigned __int16)a8 toOS:(int64_t)a9 error:(id *)a10
{
  uint64_t v10 = a8;
  int v11 = a7;
  uint64_t v12 = a6;
  uint64_t v13 = a5;
  uint64_t v14 = a4;
  uint64_t v15 = a3;
  unsigned __int8 v57 = a7;
  id v55 = (id *)objc_opt_new();
  id v17 = +[NFCommandAPDU buildAPDUHeaderWithClass:v15 instruction:v14 p1:v13 p2:v12 len:0 useExtendedLength:1];
  if (v17)
  {
    BOOL v18 = v11 != v12;
    id v19 = +[NFCommandAPDU appendExpectedLength:v10 usingExtendedLength:1 toAPDU:v17];
    uint64_t v20 = v55;
    while (1)
    {
      id v56 = 0;
      id v21 = [(NFSecureElementWrapper *)self transceiveData:v17 toOS:a9 error:&v56];
      id v22 = v56;
      id v23 = +[NFResponseAPDU responseWithData:v21];
      uint64_t v24 = v23;
      if (v22)
      {
        uint64_t v20 = a10;
        if (!a10)
        {
          id v33 = v55;
          goto LABEL_32;
        }
        *a10 = v22;
        id v33 = v55;
        goto LABEL_17;
      }
      if (!v23) {
        break;
      }
      if ([v23 status] == 36864) {
        goto LABEL_30;
      }
      if ([v24 status] != 25360 && objc_msgSend(v24, "status") != 37008)
      {
        dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
        uint64_t Logger = NFLogGetLogger();
        if (Logger)
        {
          id v38 = (void (*)(uint64_t, const char *, ...))Logger;
          Class = object_getClass(self);
          BOOL isMetaClass = class_isMetaClass(Class);
          ClassName = object_getClassName(self);
          Name = sel_getName(a2);
          uint64_t v50 = [v24 status];
          uint64_t v42 = 45;
          if (isMetaClass) {
            uint64_t v42 = 43;
          }
          v38(3, "%c[%{public}s %{public}s]:%i Failed to query, status word is 0x%x", v42, ClassName, Name, 276, v50);
        }
        dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
        id v43 = NFSharedLogGetLogger();
        if (os_log_type_enabled(v43, OS_LOG_TYPE_ERROR))
        {
          int v44 = object_getClass(self);
          if (class_isMetaClass(v44)) {
            int v45 = 43;
          }
          else {
            int v45 = 45;
          }
          id v46 = object_getClassName(self);
          id v47 = sel_getName(a2);
          unsigned int v48 = [v24 status];
          *(_DWORD *)buf = 67110146;
          int v59 = v45;
          __int16 v60 = 2082;
          id v61 = v46;
          __int16 v62 = 2082;
          id v63 = v47;
          __int16 v64 = 1024;
          int v65 = 276;
          __int16 v66 = 1024;
          unsigned int v67 = v48;
          _os_log_impl((void *)&_mh_execute_header, v43, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i Failed to query, status word is 0x%x", buf, 0x28u);
        }

        if (a10) {
          *a10 = 0;
        }
LABEL_30:
        id v33 = [v24 data];
        [v55 appendData:v33];
LABEL_32:
        id v32 = v20;

        uint64_t v20 = v24;
        goto LABEL_33;
      }
      id v25 = [v24 response];
      [v55 appendData:v25];

      if (v18) {
        [v17 replaceBytesInRange:3 withBytes:&v57 length:1];
      }

      BOOL v18 = 0;
    }
    if (a10)
    {
      id v51 = objc_alloc((Class)NSError);
      id v33 = +[NSString stringWithUTF8String:"nfcd"];
      v68[0] = NSLocalizedDescriptionKey;
      id v52 = +[NSString stringWithUTF8String:"Unexpected Result"];
      v69[0] = v52;
      v69[1] = &off_10031C570;
      v68[1] = @"Line";
      v68[2] = @"Method";
      id v34 = [objc_alloc((Class)NSString) initWithFormat:@"%s", sel_getName(a2)];
      v69[2] = v34;
      v68[3] = NSDebugDescriptionErrorKey;
      id v35 = [objc_alloc((Class)NSString) initWithFormat:@"%s:%d", sel_getName(a2), 263];
      v69[3] = v35;
      uint64_t v36 = +[NSDictionary dictionaryWithObjects:v69 forKeys:v68 count:4];
      *a10 = [v51 initWithDomain:v33 code:13 userInfo:v36];

      uint64_t v24 = v55;
LABEL_17:
      uint64_t v20 = 0;
      goto LABEL_32;
    }
    id v22 = 0;
    id v32 = 0;
LABEL_33:

    id v31 = +[NFResponseAPDU responseWithData:v32];
  }
  else
  {
    if (!a10)
    {
      id v31 = 0;
      id v32 = v55;
      goto LABEL_35;
    }
    id v26 = objc_alloc((Class)NSError);
    id v22 = +[NSString stringWithUTF8String:"nfcd"];
    v70[0] = NSLocalizedDescriptionKey;
    id v27 = +[NSString stringWithUTF8String:"No resources"];
    v71[0] = v27;
    v71[1] = &off_10031C558;
    v70[1] = @"Line";
    v70[2] = @"Method";
    id v28 = [objc_alloc((Class)NSString) initWithFormat:@"%s", sel_getName(a2)];
    v71[2] = v28;
    v70[3] = NSDebugDescriptionErrorKey;
    id v29 = [objc_alloc((Class)NSString) initWithFormat:@"%s:%d", sel_getName(a2), 249];
    v71[3] = v29;
    id v30 = +[NSDictionary dictionaryWithObjects:v71 forKeys:v70 count:4];
    *a10 = [v26 initWithDomain:v22 code:34 userInfo:v30];

    id v31 = 0;
    id v32 = v55;
  }

LABEL_35:

  return v31;
}

- (id)getData:(unsigned __int8)a3 tag:(unsigned int)a4 data:(id)a5 error:(id *)a6
{
  return [(NFSecureElementWrapper *)self sendCommandWithClass:a3 instruction:202 p1:BYTE1(a4) p2:a4 data:a5 error:a6];
}

- (id)readBinary:(unsigned __int8)a3 offset:(unsigned int)a4 tag:(unsigned int)a5 error:(id *)a6
{
  uint64_t v8 = a3;
  __int16 v13 = bswap32(a5) >> 16;
  id v10 = [objc_alloc((Class)NSData) initWithBytes:&v13 length:2];
  int v11 = [(NFSecureElementWrapper *)self sendCommandWithClass:v8 instruction:176 p1:(a4 >> 8) & 0x7F p2:a4 data:v10 error:a6];

  return v11;
}

- (id)selectByName:(id)a3 error:(id *)a4
{
  return [(NFSecureElementWrapper *)self sendCommandWithClass:0 instruction:164 p1:4 p2:0 data:a3 error:a4];
}

- (id)getData:(unsigned int)a3
{
  id v6 = [(NFSecureElementWrapper *)self getData:128 tag:*(void *)&a3 data:0 error:0];
  uint64_t v7 = v6;
  if (!v6)
  {
    dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    uint64_t Logger = NFLogGetLogger();
    if (Logger)
    {
      uint64_t v12 = (void (*)(uint64_t, const char *, ...))Logger;
      Class = object_getClass(self);
      BOOL isMetaClass = class_isMetaClass(Class);
      ClassName = object_getClassName(self);
      Name = sel_getName(a2);
      uint64_t v16 = 45;
      if (isMetaClass) {
        uint64_t v16 = 43;
      }
      v12(3, "%c[%{public}s %{public}s]:%i Command failed", v16, ClassName, Name, 337);
    }
    dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    uint64_t v9 = NFSharedLogGetLogger();
    if (!os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      goto LABEL_34;
    }
    id v17 = object_getClass(self);
    if (class_isMetaClass(v17)) {
      int v18 = 43;
    }
    else {
      int v18 = 45;
    }
    *(_DWORD *)buf = 67109890;
    int v46 = v18;
    __int16 v47 = 2082;
    unsigned int v48 = object_getClassName(self);
    __int16 v49 = 2082;
    uint64_t v50 = sel_getName(a2);
    __int16 v51 = 1024;
    int v52 = 337;
    id v19 = "%c[%{public}s %{public}s]:%i Command failed";
    uint64_t v20 = v9;
    uint32_t v21 = 34;
LABEL_23:
    _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_ERROR, v19, buf, v21);
    goto LABEL_34;
  }
  if ([v6 status] != 36864)
  {
    dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    uint64_t v22 = NFLogGetLogger();
    if (v22)
    {
      id v23 = (void (*)(uint64_t, const char *, ...))v22;
      uint64_t v24 = object_getClass(self);
      BOOL v25 = class_isMetaClass(v24);
      id v26 = object_getClassName(self);
      id v27 = sel_getName(a2);
      uint64_t v43 = [v7 status];
      uint64_t v28 = 45;
      if (v25) {
        uint64_t v28 = 43;
      }
      v23(3, "%c[%{public}s %{public}s]:%i Returned error: 0x%04x", v28, v26, v27, 341, v43);
    }
    dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    uint64_t v9 = NFSharedLogGetLogger();
    if (!os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      goto LABEL_34;
    }
    id v29 = object_getClass(self);
    if (class_isMetaClass(v29)) {
      int v30 = 43;
    }
    else {
      int v30 = 45;
    }
    *(_DWORD *)buf = 67110146;
    int v46 = v30;
    __int16 v47 = 2082;
    unsigned int v48 = object_getClassName(self);
    __int16 v49 = 2082;
    uint64_t v50 = sel_getName(a2);
    __int16 v51 = 1024;
    int v52 = 341;
    __int16 v53 = 1024;
    unsigned int v54 = [v7 status];
    id v19 = "%c[%{public}s %{public}s]:%i Returned error: 0x%04x";
    uint64_t v20 = v9;
    uint32_t v21 = 40;
    goto LABEL_23;
  }
  uint64_t v8 = [v7 response];
  uint64_t v9 = +[NFTLV TLVWithData:v8];

  if ([v9 tag] == a3)
  {
    id v10 = [v9 value];
    goto LABEL_35;
  }
  dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
  uint64_t v31 = NFLogGetLogger();
  if (v31)
  {
    id v32 = (void (*)(uint64_t, const char *, ...))v31;
    id v33 = object_getClass(self);
    BOOL v34 = class_isMetaClass(v33);
    id v35 = object_getClassName(self);
    uint64_t v36 = sel_getName(a2);
    id v44 = [v9 tag];
    uint64_t v37 = 45;
    if (v34) {
      uint64_t v37 = 43;
    }
    v32(3, "%c[%{public}s %{public}s]:%i Unexpected tag: 0x%x", v37, v35, v36, 347, v44);
  }
  dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
  id v38 = NFSharedLogGetLogger();
  if (os_log_type_enabled(v38, OS_LOG_TYPE_ERROR))
  {
    int v39 = object_getClass(self);
    if (class_isMetaClass(v39)) {
      int v40 = 43;
    }
    else {
      int v40 = 45;
    }
    *(_DWORD *)buf = 67110146;
    int v46 = v40;
    __int16 v47 = 2082;
    unsigned int v48 = object_getClassName(self);
    __int16 v49 = 2082;
    uint64_t v50 = sel_getName(a2);
    __int16 v51 = 1024;
    int v52 = 347;
    __int16 v53 = 1024;
    unsigned int v54 = [v9 tag];
    _os_log_impl((void *)&_mh_execute_header, v38, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i Unexpected tag: 0x%x", buf, 0x28u);
  }

LABEL_34:
  id v10 = 0;
LABEL_35:

  return v10;
}

- (id)getData:(unsigned int)a3 subtag:(unsigned int)a4
{
  uint64_t v4 = *(void *)&a3;
  __int16 v69 = bswap32(a4) >> 16;
  id v7 = [objc_alloc((Class)NSData) initWithBytes:&v69 length:2];
  uint64_t v8 = [(NFSecureElementWrapper *)self getData:128 tag:v4 data:v7 error:0];

  if (!v8)
  {
    dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    uint64_t Logger = NFLogGetLogger();
    if (Logger)
    {
      uint64_t v15 = (void (*)(uint64_t, const char *, ...))Logger;
      Class = object_getClass(self);
      BOOL isMetaClass = class_isMetaClass(Class);
      ClassName = object_getClassName(self);
      Name = sel_getName(a2);
      uint64_t v19 = 45;
      if (isMetaClass) {
        uint64_t v19 = 43;
      }
      v15(3, "%c[%{public}s %{public}s]:%i Command failed", v19, ClassName, Name, 365);
    }
    dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    id v10 = NFSharedLogGetLogger();
    if (!os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      goto LABEL_25;
    }
    uint64_t v20 = object_getClass(self);
    if (class_isMetaClass(v20)) {
      int v21 = 43;
    }
    else {
      int v21 = 45;
    }
    uint64_t v22 = object_getClassName(self);
    id v23 = sel_getName(a2);
    *(_DWORD *)buf = 67109890;
    int v71 = v21;
    __int16 v72 = 2082;
    __int16 v73 = v22;
    __int16 v74 = 2082;
    __int16 v75 = v23;
    __int16 v76 = 1024;
    int v77 = 365;
    uint64_t v24 = "%c[%{public}s %{public}s]:%i Command failed";
    BOOL v25 = v10;
    uint32_t v26 = 34;
    goto LABEL_24;
  }
  if ([v8 status] != 36864)
  {
    dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    uint64_t v27 = NFLogGetLogger();
    if (v27)
    {
      uint64_t v28 = (void (*)(uint64_t, const char *, ...))v27;
      id v29 = object_getClass(self);
      BOOL v30 = class_isMetaClass(v29);
      uint64_t v31 = object_getClassName(self);
      id v32 = sel_getName(a2);
      uint64_t v66 = [v8 status];
      uint64_t v33 = 45;
      if (v30) {
        uint64_t v33 = 43;
      }
      v28(3, "%c[%{public}s %{public}s]:%i Returned error: 0x%04x", v33, v31, v32, 369, v66);
    }
    dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    id v10 = NFSharedLogGetLogger();
    if (!os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      goto LABEL_25;
    }
    BOOL v34 = object_getClass(self);
    if (class_isMetaClass(v34)) {
      int v35 = 43;
    }
    else {
      int v35 = 45;
    }
    uint64_t v36 = object_getClassName(self);
    uint64_t v37 = sel_getName(a2);
    unsigned int v38 = [v8 status];
    *(_DWORD *)buf = 67110146;
    int v71 = v35;
    __int16 v72 = 2082;
    __int16 v73 = v36;
    __int16 v74 = 2082;
    __int16 v75 = v37;
    __int16 v76 = 1024;
    int v77 = 369;
    __int16 v78 = 1024;
    LODWORD(v79) = v38;
    uint64_t v24 = "%c[%{public}s %{public}s]:%i Returned error: 0x%04x";
    BOOL v25 = v10;
    uint32_t v26 = 40;
LABEL_24:
    _os_log_impl((void *)&_mh_execute_header, v25, OS_LOG_TYPE_ERROR, v24, buf, v26);
LABEL_25:
    __int16 v13 = 0;
    goto LABEL_47;
  }
  uint64_t v9 = [v8 response];
  id v10 = +[NFTLV TLVWithData:v9];

  if ([v10 tag] != v4)
  {
    dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    uint64_t v39 = NFLogGetLogger();
    if (v39)
    {
      int v40 = (void (*)(uint64_t, const char *, ...))v39;
      uint64_t v41 = object_getClass(self);
      BOOL v42 = class_isMetaClass(v41);
      uint64_t v43 = object_getClassName(self);
      id v44 = sel_getName(a2);
      id v67 = [v10 tag];
      uint64_t v45 = 45;
      if (v42) {
        uint64_t v45 = 43;
      }
      v40(3, "%c[%{public}s %{public}s]:%i Unexpected tag: 0x%x", v45, v43, v44, 375, v67);
    }
    dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    int v11 = NFSharedLogGetLogger();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      int v46 = object_getClass(self);
      if (class_isMetaClass(v46)) {
        int v47 = 43;
      }
      else {
        int v47 = 45;
      }
      unsigned int v48 = object_getClassName(self);
      __int16 v49 = sel_getName(a2);
      unsigned int v50 = [v10 tag];
      *(_DWORD *)buf = 67110146;
      int v71 = v47;
      __int16 v72 = 2082;
      __int16 v73 = v48;
      __int16 v74 = 2082;
      __int16 v75 = v49;
      __int16 v76 = 1024;
      int v77 = 375;
      __int16 v78 = 1024;
      LODWORD(v79) = v50;
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i Unexpected tag: 0x%x", buf, 0x28u);
    }
    goto LABEL_45;
  }
  int v11 = [v10 children];
  if ([v11 count] != (id)1)
  {
    dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    uint64_t v51 = NFLogGetLogger();
    if (v51)
    {
      int v52 = (void (*)(uint64_t, const char *, ...))v51;
      __int16 v53 = object_getClass(self);
      BOOL v54 = class_isMetaClass(v53);
      id v55 = object_getClassName(self);
      id v56 = sel_getName(a2);
      id v68 = [v11 count];
      uint64_t v57 = 45;
      if (v54) {
        uint64_t v57 = 43;
      }
      v52(3, "%c[%{public}s %{public}s]:%i Unexpected child count: %ld", v57, v55, v56, 381, v68);
    }
    dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    id v58 = NFSharedLogGetLogger();
    if (os_log_type_enabled(v58, OS_LOG_TYPE_ERROR))
    {
      int v59 = object_getClass(self);
      if (class_isMetaClass(v59)) {
        int v60 = 43;
      }
      else {
        int v60 = 45;
      }
      id v61 = object_getClassName(self);
      __int16 v62 = sel_getName(a2);
      id v63 = [v11 count];
      *(_DWORD *)buf = 67110146;
      int v71 = v60;
      __int16 v72 = 2082;
      __int16 v73 = v61;
      __int16 v74 = 2082;
      __int16 v75 = v62;
      __int16 v76 = 1024;
      int v77 = 381;
      __int16 v78 = 2048;
      id v79 = v63;
      _os_log_impl((void *)&_mh_execute_header, v58, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i Unexpected child count: %ld", buf, 0x2Cu);
    }

LABEL_45:
    __int16 v13 = 0;
    goto LABEL_46;
  }
  uint64_t v12 = [v11 objectAtIndexedSubscript:0];

  __int16 v13 = [v12 value];
  id v10 = v12;
LABEL_46:

LABEL_47:

  return v13;
}

- (BOOL)select:(id)a3 error:(id *)a4
{
  id v7 = -[NFSecureElementWrapper selectByName:error:](self, "selectByName:error:", a3);
  uint64_t v8 = v7;
  if (!v7)
  {
    dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    uint64_t Logger = NFLogGetLogger();
    if (Logger)
    {
      id v10 = (void (*)(uint64_t, const char *, ...))Logger;
      Class = object_getClass(self);
      BOOL isMetaClass = class_isMetaClass(Class);
      ClassName = object_getClassName(self);
      Name = sel_getName(a2);
      uint64_t v14 = 45;
      if (isMetaClass) {
        uint64_t v14 = 43;
      }
      v10(3, "%c[%{public}s %{public}s]:%i Command failed", v14, ClassName, Name, 394);
    }
    dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    uint64_t v15 = NFSharedLogGetLogger();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      uint64_t v16 = object_getClass(self);
      if (class_isMetaClass(v16)) {
        int v17 = 43;
      }
      else {
        int v17 = 45;
      }
      *(_DWORD *)buf = 67109890;
      int v37 = v17;
      __int16 v38 = 2082;
      uint64_t v39 = object_getClassName(self);
      __int16 v40 = 2082;
      uint64_t v41 = sel_getName(a2);
      __int16 v42 = 1024;
      int v43 = 394;
      _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i Command failed", buf, 0x22u);
    }
    goto LABEL_24;
  }
  if ([v7 status] == 36864)
  {
    LOBYTE(a4) = 1;
    goto LABEL_25;
  }
  dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
  uint64_t v18 = NFLogGetLogger();
  if (v18)
  {
    uint64_t v19 = (void (*)(uint64_t, const char *, ...))v18;
    uint64_t v20 = object_getClass(self);
    BOOL v21 = class_isMetaClass(v20);
    uint64_t v22 = object_getClassName(self);
    id v23 = sel_getName(a2);
    uint64_t v33 = [v8 status];
    uint64_t v24 = 45;
    if (v21) {
      uint64_t v24 = 43;
    }
    v19(3, "%c[%{public}s %{public}s]:%i Returned error: 0x%04x", v24, v22, v23, 399, v33);
  }
  dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
  BOOL v25 = NFSharedLogGetLogger();
  if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
  {
    uint32_t v26 = object_getClass(self);
    if (class_isMetaClass(v26)) {
      int v27 = 43;
    }
    else {
      int v27 = 45;
    }
    *(_DWORD *)buf = 67110146;
    int v37 = v27;
    __int16 v38 = 2082;
    uint64_t v39 = object_getClassName(self);
    __int16 v40 = 2082;
    uint64_t v41 = sel_getName(a2);
    __int16 v42 = 1024;
    int v43 = 399;
    __int16 v44 = 1024;
    unsigned int v45 = [v8 status];
    _os_log_impl((void *)&_mh_execute_header, v25, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i Returned error: 0x%04x", buf, 0x28u);
  }

  if (a4)
  {
    id v28 = objc_alloc((Class)NSError);
    uint64_t v15 = +[NSString stringWithUTF8String:"nfcd"];
    NSErrorUserInfoKey v34 = NSLocalizedDescriptionKey;
    id v29 = +[NSString stringWithUTF8String:"Commmand Error"];
    int v35 = v29;
    BOOL v30 = +[NSDictionary dictionaryWithObjects:&v35 forKeys:&v34 count:1];
    *a4 = [v28 initWithDomain:v15 code:16 userInfo:v30];

LABEL_24:
    LOBYTE(a4) = 0;
  }
LABEL_25:

  return (char)a4;
}

- (BOOL)selectApplet:(id)a3 error:(id *)a4
{
  id v6 = [a3 identifierAsData];
  LOBYTE(a4) = [(NFSecureElementWrapper *)self select:v6 error:a4];

  return (char)a4;
}

- (id)selectCRSWithError:(id *)a3
{
  id v6 = NFSharedSignpostLog();
  if (os_signpost_enabled(v6))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v6, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "SELECT_CRS", "begin", buf, 2u);
  }

  id v7 = [objc_alloc((Class)NSData) initWithBytes:&unk_100284150 length:9];
  id v58 = 0;
  uint64_t v8 = [(NFSecureElementWrapper *)self selectByName:v7 error:&v58];
  id v9 = v58;

  if (v8)
  {
    if ([v8 status] == 36864)
    {
      id v10 = NFSharedSignpostLog();
      if (os_signpost_enabled(v10))
      {
        *(_WORD *)buf = 0;
        _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v10, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "SELECT_CRS", "end", buf, 2u);
      }

      id v11 = v8;
    }
    else
    {
      uint64_t v57 = a3;
      dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
      uint64_t Logger = NFLogGetLogger();
      if (Logger)
      {
        int v27 = (void (*)(uint64_t, const char *, ...))Logger;
        Class = object_getClass(self);
        BOOL isMetaClass = class_isMetaClass(Class);
        ClassName = object_getClassName(self);
        Name = sel_getName(a2);
        uint64_t v56 = [v8 status];
        uint64_t v32 = 45;
        if (isMetaClass) {
          uint64_t v32 = 43;
        }
        v27(3, "%c[%{public}s %{public}s]:%i Failed to select CRS: 0x%04x", v32, ClassName, Name, 432, v56);
      }
      dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
      uint64_t v33 = NFSharedLogGetLogger();
      if (os_log_type_enabled(v33, OS_LOG_TYPE_ERROR))
      {
        NSErrorUserInfoKey v34 = object_getClass(self);
        if (class_isMetaClass(v34)) {
          int v35 = 43;
        }
        else {
          int v35 = 45;
        }
        uint64_t v36 = object_getClassName(self);
        int v37 = sel_getName(a2);
        unsigned int v38 = [v8 status];
        *(_DWORD *)buf = 67110146;
        *(_DWORD *)id v68 = v35;
        *(_WORD *)&void v68[4] = 2082;
        *(void *)&v68[6] = v36;
        __int16 v69 = 2082;
        int v70 = v37;
        __int16 v71 = 1024;
        int v72 = 432;
        __int16 v73 = 1024;
        LODWORD(v74) = v38;
        _os_log_impl((void *)&_mh_execute_header, v33, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i Failed to select CRS: 0x%04x", buf, 0x28u);
      }

      id v39 = [objc_alloc((Class)NSString) initWithFormat:@"Received non-9000 response from SE. Response: 0x%04X", [v8 status]];
      v63[0] = @"Applet Identifier";
      id v40 = [objc_alloc((Class)NSData) initWithBytes:&unk_100284150 length:9];
      uint64_t v41 = [v40 NF_asHexString];
      v64[0] = v41;
      v64[1] = @"Other Bug";
      v63[1] = @"Classification";
      v63[2] = @"FailureKey";
      v64[2] = @"ttrTransaction";
      __int16 v42 = +[NSDictionary dictionaryWithObjects:v64 forKeys:v63 count:3];
      sub_100198FF8((uint64_t)NFBugCapture, @"Failed to select CRS", v39, v42);

      LODWORD(v41) = [v8 status];
      id v43 = objc_alloc((Class)NSError);
      __int16 v44 = +[NSString stringWithUTF8String:"nfcd"];
      if (v41 == 26277)
      {
        NSErrorUserInfoKey v61 = NSLocalizedDescriptionKey;
        unsigned int v45 = +[NSString stringWithUTF8String:"Restricted Mode"];
        __int16 v62 = v45;
        int v46 = +[NSDictionary dictionaryWithObjects:&v62 forKeys:&v61 count:1];
        int v47 = v43;
        unsigned int v48 = v44;
        uint64_t v49 = 24;
      }
      else
      {
        NSErrorUserInfoKey v59 = NSLocalizedDescriptionKey;
        unsigned int v45 = +[NSString stringWithUTF8String:"Commmand Error"];
        int v60 = v45;
        int v46 = +[NSDictionary dictionaryWithObjects:&v60 forKeys:&v59 count:1];
        int v47 = v43;
        unsigned int v48 = v44;
        uint64_t v49 = 16;
      }
      id v50 = [v47 initWithDomain:v48 code:v49 userInfo:v46];

      +[NFExceptionsCALogger postAnalyticsSEFailureEvent:7 context:v39 error:v50];
      if (v57) {
        *uint64_t v57 = v50;
      }
      uint64_t v51 = NFSharedSignpostLog();
      if (os_signpost_enabled(v51))
      {
        unsigned int v52 = [v8 status];
        *(_DWORD *)buf = 67109120;
        *(_DWORD *)id v68 = v52;
        _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v51, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "SELECT_CRS", "failed; RPDU status: 0x%04x",
          buf,
          8u);
      }

      id v11 = 0;
      id v9 = v50;
    }
  }
  else
  {
    dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    uint64_t v12 = NFLogGetLogger();
    if (v12)
    {
      __int16 v13 = (void (*)(uint64_t, const char *, ...))v12;
      uint64_t v14 = object_getClass(self);
      BOOL v15 = class_isMetaClass(v14);
      BOOL v54 = object_getClassName(self);
      id v55 = sel_getName(a2);
      uint64_t v16 = 45;
      if (v15) {
        uint64_t v16 = 43;
      }
      v13(3, "%c[%{public}s %{public}s]:%i Failed to select CRS: %{public}@", v16, v54, v55, 419, v9);
    }
    dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    int v17 = NFSharedLogGetLogger();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
    {
      uint64_t v18 = object_getClass(self);
      if (class_isMetaClass(v18)) {
        int v19 = 43;
      }
      else {
        int v19 = 45;
      }
      uint64_t v20 = object_getClassName(self);
      BOOL v21 = sel_getName(a2);
      *(_DWORD *)buf = 67110146;
      *(_DWORD *)id v68 = v19;
      *(_WORD *)&void v68[4] = 2082;
      *(void *)&v68[6] = v20;
      __int16 v69 = 2082;
      int v70 = v21;
      __int16 v71 = 1024;
      int v72 = 419;
      __int16 v73 = 2114;
      id v74 = v9;
      _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i Failed to select CRS: %{public}@", buf, 0x2Cu);
    }

    v65[0] = @"Applet Identifier";
    id v22 = [objc_alloc((Class)NSData) initWithBytes:&unk_100284150 length:9];
    id v23 = [v22 NF_asHexString];
    v66[0] = v23;
    v66[1] = @"Other Bug";
    v65[1] = @"Classification";
    v65[2] = @"FailureKey";
    v66[2] = @"ttrTransaction";
    uint64_t v24 = +[NSDictionary dictionaryWithObjects:v66 forKeys:v65 count:3];
    sub_100198FF8((uint64_t)NFBugCapture, @"Failed to select CRS", @"No response from SE", v24);

    +[NFExceptionsCALogger postAnalyticsSEFailureEvent:7 context:@"No response from SE" error:v9];
    if (a3) {
      *a3 = v9;
    }
    BOOL v25 = NFSharedSignpostLog();
    if (os_signpost_enabled(v25))
    {
      *(_DWORD *)buf = 138412290;
      *(void *)id v68 = v9;
      _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v25, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "SELECT_CRS", "failed: %@", buf, 0xCu);
    }

    id v11 = 0;
  }

  return v11;
}

- (id)readBinary:(unsigned int)a3
{
  dispatch_queue_t v5 = [(NFSecureElementWrapper *)self readBinary:0 offset:0 tag:*(void *)&a3 error:0];
  id v6 = v5;
  if (!v5)
  {
    dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    uint64_t Logger = NFLogGetLogger();
    if (Logger)
    {
      id v9 = (void (*)(uint64_t, const char *, ...))Logger;
      Class = object_getClass(self);
      BOOL isMetaClass = class_isMetaClass(Class);
      ClassName = object_getClassName(self);
      Name = sel_getName(a2);
      uint64_t v13 = 45;
      if (isMetaClass) {
        uint64_t v13 = 43;
      }
      v9(3, "%c[%{public}s %{public}s]:%i Command failed", v13, ClassName, Name, 461);
    }
    dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    uint64_t v14 = NFSharedLogGetLogger();
    if (!os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
      goto LABEL_23;
    }
    BOOL v15 = object_getClass(self);
    if (class_isMetaClass(v15)) {
      int v16 = 43;
    }
    else {
      int v16 = 45;
    }
    *(_DWORD *)buf = 67109890;
    int v33 = v16;
    __int16 v34 = 2082;
    int v35 = object_getClassName(self);
    __int16 v36 = 2082;
    int v37 = sel_getName(a2);
    __int16 v38 = 1024;
    int v39 = 461;
    int v17 = "%c[%{public}s %{public}s]:%i Command failed";
    uint64_t v18 = v14;
    uint32_t v19 = 34;
    goto LABEL_22;
  }
  if ([v5 status] == 36864)
  {
    id v7 = [v6 response];
    goto LABEL_24;
  }
  dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
  uint64_t v20 = NFLogGetLogger();
  if (v20)
  {
    BOOL v21 = (void (*)(uint64_t, const char *, ...))v20;
    id v22 = object_getClass(self);
    BOOL v23 = class_isMetaClass(v22);
    uint64_t v24 = object_getClassName(self);
    BOOL v25 = sel_getName(a2);
    uint64_t v31 = [v6 status];
    uint64_t v26 = 45;
    if (v23) {
      uint64_t v26 = 43;
    }
    v21(3, "%c[%{public}s %{public}s]:%i Returned error: 0x%04x", v26, v24, v25, 465, v31);
  }
  dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
  uint64_t v14 = NFSharedLogGetLogger();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
  {
    int v27 = object_getClass(self);
    if (class_isMetaClass(v27)) {
      int v28 = 43;
    }
    else {
      int v28 = 45;
    }
    *(_DWORD *)buf = 67110146;
    int v33 = v28;
    __int16 v34 = 2082;
    int v35 = object_getClassName(self);
    __int16 v36 = 2082;
    int v37 = sel_getName(a2);
    __int16 v38 = 1024;
    int v39 = 465;
    __int16 v40 = 1024;
    unsigned int v41 = [v6 status];
    int v17 = "%c[%{public}s %{public}s]:%i Returned error: 0x%04x";
    uint64_t v18 = v14;
    uint32_t v19 = 40;
LABEL_22:
    _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_ERROR, v17, buf, v19);
  }
LABEL_23:

  id v7 = 0;
LABEL_24:

  return v7;
}

- (id)queryISDCounter:(id *)a3
{
  id v6 = [objc_alloc((Class)NSData) initWithBytes:&unk_100284159 length:8];
  id v33 = 0;
  unsigned __int8 v7 = [(NFSecureElementWrapper *)self select:v6 error:&v33];
  id v8 = v33;

  if ((v7 & 1) == 0)
  {
    dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    uint64_t Logger = NFLogGetLogger();
    if (Logger)
    {
      uint64_t v18 = (void (*)(uint64_t, const char *, ...))Logger;
      Class = object_getClass(self);
      BOOL isMetaClass = class_isMetaClass(Class);
      ClassName = object_getClassName(self);
      Name = sel_getName(a2);
      uint64_t v22 = 45;
      if (isMetaClass) {
        uint64_t v22 = 43;
      }
      v18(3, "%c[%{public}s %{public}s]:%i Failed to select ISD", v22, ClassName, Name, 477);
    }
    dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    BOOL v23 = NFSharedLogGetLogger();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
    {
      uint64_t v24 = object_getClass(self);
      if (class_isMetaClass(v24)) {
        int v25 = 43;
      }
      else {
        int v25 = 45;
      }
      uint64_t v26 = object_getClassName(self);
      int v27 = sel_getName(a2);
      *(_DWORD *)buf = 67109890;
      int v39 = v25;
      __int16 v40 = 2082;
      unsigned int v41 = v26;
      __int16 v42 = 2082;
      id v43 = v27;
      __int16 v44 = 1024;
      int v45 = 477;
      _os_log_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i Failed to select ISD", buf, 0x22u);
    }

    v36[0] = @"Applet Identifier";
    id v28 = [objc_alloc((Class)NSData) initWithBytes:&unk_100284159 length:8];
    id v29 = [v28 NF_asHexString];
    v37[0] = v29;
    v37[1] = @"Other Bug";
    v36[1] = @"Classification";
    v36[2] = @"FailureKey";
    v37[2] = @"ttrTransaction";
    BOOL v30 = +[NSDictionary dictionaryWithObjects:v37 forKeys:v36 count:3];
    sub_100198FF8((uint64_t)NFBugCapture, @"Failed to select ISD", @"No response from SE", v30);

    +[NFExceptionsCALogger postAnalyticsSEFailureEvent:8 context:@"No response from SE" error:v8];
    if (a3)
    {
      id v10 = 0;
      *a3 = v8;
      goto LABEL_17;
    }
    goto LABEL_16;
  }
  uint64_t v9 = [(NFSecureElementWrapper *)self getData:193];
  id v10 = (void *)v9;
  if (a3 && !v9)
  {
    id v11 = objc_alloc((Class)NSError);
    uint64_t v12 = +[NSString stringWithUTF8String:"nfcd"];
    v34[0] = NSLocalizedDescriptionKey;
    uint64_t v13 = +[NSString stringWithUTF8String:"Decoding Error"];
    v35[0] = v13;
    v35[1] = &off_10031C588;
    v34[1] = @"Line";
    v34[2] = @"Method";
    id v14 = [objc_alloc((Class)NSString) initWithFormat:@"%s", sel_getName(a2)];
    v35[2] = v14;
    v34[3] = NSDebugDescriptionErrorKey;
    id v15 = [objc_alloc((Class)NSString) initWithFormat:@"%s:%d", sel_getName(a2), 495];
    v35[3] = v15;
    int v16 = +[NSDictionary dictionaryWithObjects:v35 forKeys:v34 count:4];
    *a3 = [v11 initWithDomain:v12 code:23 userInfo:v16];

LABEL_16:
    id v10 = 0;
  }
LABEL_17:

  return v10;
}

- (id)refreshISDCounter
{
  return 0;
}

- (id)checkDeepSleepTimerRunning:(unint64_t *)a3
{
  if (!a3)
  {
    id v15 = objc_alloc((Class)NSError);
    int v16 = +[NSString stringWithUTF8String:"nfcd"];
    NSErrorUserInfoKey v246 = NSLocalizedDescriptionKey;
    int v17 = +[NSString stringWithUTF8String:"Invalid Parameter"];
    v247 = v17;
    uint64_t v18 = +[NSDictionary dictionaryWithObjects:&v247 forKeys:&v246 count:1];
    id v14 = [v15 initWithDomain:v16 code:10 userInfo:v18];

    goto LABEL_165;
  }
  uint64_t v4 = self;
  dispatch_queue_t v5 = [(NFSecureElementWrapper *)self handle];
  id v6 = [v5 info];
  id v7 = [v6 seType];

  v241 = v4;
  if (v7 == (id)6)
  {
    if (v4)
    {
      id v19 = [objc_alloc((Class)NSData) initWithBytes:&unk_100284159 length:8];
      id v245 = 0;
      unsigned __int8 v20 = [(NFSecureElementWrapper *)v4 select:v19 error:&v245];
      id v10 = v245;

      if (v20)
      {
        __int16 v244 = 24543;
        BOOL v21 = +[NSData dataWithBytes:&v244 length:2];
        id v243 = v10;
        uint64_t v22 = [(NFSecureElementWrapper *)v4 sendCommandWithClass:0 instruction:202 p1:0 p2:254 data:v21 error:&v243];
        id v23 = v243;

        if ([v22 status] == 26277)
        {
          id v14 = 0;
          *a3 = 87000;
        }
        else
        {
          v237 = v23;
          if ([v22 status] == 36864)
          {
            v233 = v22;
            v235 = a3;
            long long v268 = 0u;
            memset(v267, 0, sizeof(v267));
            __int16 v78 = [v22 data];
            id v79 = +[NFTLV TLVsWithData:v78];

            sel = v79;
            id v80 = [v79 countByEnumeratingWithState:v267 objects:buf count:16];
            if (v80)
            {
              id v81 = v80;
              unint64_t v82 = 0;
              uint64_t v83 = **(void **)&v267[16];
              do
              {
                for (i = 0; i != v81; i = (char *)i + 1)
                {
                  if (**(void **)&v267[16] != v83) {
                    objc_enumerationMutation(sel);
                  }
                  BOOL v85 = *(void **)(*(void *)&v267[8] + 8 * i);
                  if ([v85 tag] == 241
                    && [v85 valueAsUnsignedLong])
                  {
                    dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
                    uint64_t Logger = NFLogGetLogger();
                    if (Logger)
                    {
                      BOOL v87 = (void (*)(uint64_t, const char *, ...))Logger;
                      Class = object_getClass(v4);
                      BOOL isMetaClass = class_isMetaClass(Class);
                      ClassName = object_getClassName(v4);
                      Name = sel_getName("_checkDeepSleepTimerRunningEOS:");
                      id v222 = [v85 tag];
                      id v228 = [v85 valueAsUnsignedLong];
                      uint64_t v92 = 45;
                      if (isMetaClass) {
                        uint64_t v92 = 43;
                      }
                      v216 = ClassName;
                      uint64_t v4 = v241;
                      v87(5, "%c[%{public}s %{public}s]:%i DPD timer running (%u = %u)", v92, v216, Name, 687, v222, v228);
                    }
                    dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
                    id v93 = NFSharedLogGetLogger();
                    if (os_log_type_enabled(v93, OS_LOG_TYPE_DEFAULT))
                    {
                      id v94 = object_getClass(v4);
                      if (class_isMetaClass(v94)) {
                        int v95 = 43;
                      }
                      else {
                        int v95 = 45;
                      }
                      uint64_t v96 = object_getClassName(v4);
                      id v97 = sel_getName("_checkDeepSleepTimerRunningEOS:");
                      unsigned int v98 = [v85 tag];
                      unsigned int v99 = [v85 valueAsUnsignedLong];
                      *(_DWORD *)v259 = 67110402;
                      *(_DWORD *)&v259[4] = v95;
                      *(_WORD *)&v259[8] = 2082;
                      *(void *)&v259[10] = v96;
                      *(_WORD *)&v259[18] = 2082;
                      *(void *)&v259[20] = v97;
                      *(_WORD *)&v259[28] = 1024;
                      *(_DWORD *)&v259[30] = 687;
                      *(_WORD *)&v259[34] = 1024;
                      *(_DWORD *)&v259[36] = v98;
                      uint64_t v4 = v241;
                      *(_WORD *)&v259[40] = 1024;
                      *(_DWORD *)&v259[42] = v99;
                      _os_log_impl((void *)&_mh_execute_header, v93, OS_LOG_TYPE_DEFAULT, "%c[%{public}s %{public}s]:%i DPD timer running (%u = %u)", v259, 0x2Eu);
                    }

                    unsigned int v100 = [v85 valueAsUnsignedLong];
                    if (v82 <= v100) {
                      unint64_t v82 = v100;
                    }
                  }
                }
                id v81 = [sel countByEnumeratingWithState:v267 objects:buf count:16];
              }
              while (v81);
            }
            else
            {
              unint64_t v82 = 0;
            }

            __int16 v244 = 24287;
            v155 = +[NSData dataWithBytes:&v244 length:2];
            id v242 = v237;
            v156 = [(NFSecureElementWrapper *)v4 sendCommandWithClass:0 instruction:202 p1:0 p2:254 data:v155 expectedLength:0 toOS:2 error:&v242];
            id v230 = v242;

            v231 = v156;
            if ([v156 status] == 36864)
            {
              long long v263 = 0u;
              long long v264 = 0u;
              long long v261 = 0u;
              long long v262 = 0u;
              v157 = [v156 data];
              v158 = +[NFTLV TLVsWithData:v157];

              sela = v158;
              id v159 = [v158 countByEnumeratingWithState:&v261 objects:v259 count:16];
              if (v159)
              {
                id v160 = v159;
                uint64_t v161 = *(void *)v262;
                do
                {
                  for (j = 0; j != v160; j = (char *)j + 1)
                  {
                    if (*(void *)v262 != v161) {
                      objc_enumerationMutation(sela);
                    }
                    v163 = *(void **)(*((void *)&v261 + 1) + 8 * (void)j);
                    unsigned int v164 = [v163 tag];
                    BOOL v165 = v164 - 128 > 0x20 || ((1 << (v164 + 0x80)) & 0x100010001) == 0;
                    if (!v165 && [v163 valueAsUnsignedLong])
                    {
                      dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
                      uint64_t v166 = NFLogGetLogger();
                      if (v166)
                      {
                        v167 = (void (*)(uint64_t, const char *, ...))v166;
                        v168 = object_getClass(v4);
                        BOOL v169 = class_isMetaClass(v168);
                        v170 = object_getClassName(v4);
                        v171 = sel_getName("_checkDeepSleepTimerRunningEOS:");
                        id v225 = [v163 tag];
                        id v229 = [v163 valueAsUnsignedLong];
                        v220 = v171;
                        uint64_t v4 = v241;
                        uint64_t v172 = 45;
                        if (v169) {
                          uint64_t v172 = 43;
                        }
                        v167(5, "%c[%{public}s %{public}s]:%i DPD timer running (%u = %u)", v172, v170, v220, 725, v225, v229);
                      }
                      dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
                      v173 = NFSharedLogGetLogger();
                      if (os_log_type_enabled(v173, OS_LOG_TYPE_DEFAULT))
                      {
                        v174 = object_getClass(v4);
                        if (class_isMetaClass(v174)) {
                          int v175 = 43;
                        }
                        else {
                          int v175 = 45;
                        }
                        v176 = object_getClassName(v4);
                        v177 = sel_getName("_checkDeepSleepTimerRunningEOS:");
                        unsigned int v178 = [v163 tag];
                        unsigned int v179 = [v163 valueAsUnsignedLong];
                        *(_DWORD *)v248 = 67110402;
                        *(_DWORD *)&v248[4] = v175;
                        __int16 v249 = 2082;
                        v250 = v176;
                        __int16 v251 = 2082;
                        v252 = v177;
                        __int16 v253 = 1024;
                        int v254 = 725;
                        __int16 v255 = 1024;
                        unsigned int v256 = v178;
                        uint64_t v4 = v241;
                        __int16 v257 = 1024;
                        unsigned int v258 = v179;
                        _os_log_impl((void *)&_mh_execute_header, v173, OS_LOG_TYPE_DEFAULT, "%c[%{public}s %{public}s]:%i DPD timer running (%u = %u)", v248, 0x2Eu);
                      }

                      unsigned int v180 = [v163 valueAsUnsignedLong];
                      if (v82 <= v180) {
                        unint64_t v82 = v180;
                      }
                    }
                  }
                  id v160 = [sela countByEnumeratingWithState:&v261 objects:v259 count:16];
                }
                while (v160);
              }

              id v14 = 0;
              unint64_t *v235 = v82;
              id v23 = v230;
              uint64_t v22 = v231;
            }
            else
            {
              dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
              uint64_t v181 = NFLogGetLogger();
              if (v181)
              {
                v182 = (void (*)(uint64_t, const char *, ...))v181;
                v183 = object_getClass(v4);
                BOOL v184 = class_isMetaClass(v183);
                v185 = object_getClassName(v4);
                v186 = sel_getName("_checkDeepSleepTimerRunningEOS:");
                uint64_t v226 = [v156 status];
                uint64_t v187 = 45;
                if (v184) {
                  uint64_t v187 = 43;
                }
                v182(3, "%c[%{public}s %{public}s]:%i Failed to request AC decrement timer : 0x%X", v187, v185, v186, 706, v226);
              }
              dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
              v188 = NFSharedLogGetLogger();
              if (os_log_type_enabled(v188, OS_LOG_TYPE_ERROR))
              {
                v189 = object_getClass(v4);
                if (class_isMetaClass(v189)) {
                  int v190 = 43;
                }
                else {
                  int v190 = 45;
                }
                v191 = object_getClassName(v4);
                v192 = sel_getName("_checkDeepSleepTimerRunningEOS:");
                unsigned int v193 = [v156 status];
                *(_DWORD *)v259 = 67110146;
                *(_DWORD *)&v259[4] = v190;
                *(_WORD *)&v259[8] = 2082;
                *(void *)&v259[10] = v191;
                *(_WORD *)&v259[18] = 2082;
                *(void *)&v259[20] = v192;
                *(_WORD *)&v259[28] = 1024;
                *(_DWORD *)&v259[30] = 706;
                *(_WORD *)&v259[34] = 1024;
                *(_DWORD *)&v259[36] = v193;
                _os_log_impl((void *)&_mh_execute_header, v188, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i Failed to request AC decrement timer : 0x%X", v259, 0x28u);
              }

              sub_100198FF8((uint64_t)NFBugCapture, @"Failed to request AC decrement timer", @"Failed to request AC decrement timer", &off_1003233E8);
              id v194 = [objc_alloc((Class)NSString) initWithFormat:@"Failed to request AC decrement timer: 0x%X", [v156 status]];
              +[NFExceptionsCALogger postAnalyticsSEFailureEvent:9 context:v194 error:v230];
              id v195 = objc_alloc((Class)NSError);
              v196 = +[NSString stringWithUTF8String:"nfcd"];
              if (v230)
              {
                id v197 = [v230 code];
                *(void *)&long long v261 = NSLocalizedDescriptionKey;
                if ((uint64_t)[v230 code] > 70) {
                  uint64_t v198 = 71;
                }
                else {
                  uint64_t v198 = (uint64_t)[v230 code];
                }
                v207 = +[NSString stringWithUTF8String:off_1003055F8[v198]];
                *(void *)v259 = v207;
                *(void *)&v259[8] = v230;
                *((void *)&v261 + 1) = NSUnderlyingErrorKey;
                *(void *)&long long v262 = @"Line";
                *(void *)&v259[16] = &off_10031C600;
                *((void *)&v262 + 1) = @"Method";
                id v208 = [objc_alloc((Class)NSString) initWithFormat:@"%s", sel_getName("_checkDeepSleepTimerRunningEOS:")];
                *(void *)&v259[24] = v208;
                *(void *)&long long v263 = NSDebugDescriptionErrorKey;
                id v209 = [objc_alloc((Class)NSString) initWithFormat:@"%s:%d", sel_getName("_checkDeepSleepTimerRunningEOS:"), 713];
                *(void *)&v259[32] = v209;
                v210 = +[NSDictionary dictionaryWithObjects:v259 forKeys:&v261 count:5];
                v211 = v195;
                v212 = v196;
                uint64_t v213 = (uint64_t)v197;
              }
              else
              {
                *(void *)&long long v261 = NSLocalizedDescriptionKey;
                v207 = +[NSString stringWithUTF8String:"Unknown Error"];
                *(void *)v259 = v207;
                *(void *)&v259[8] = &off_10031C600;
                *((void *)&v261 + 1) = @"Line";
                *(void *)&long long v262 = @"Method";
                id v208 = [objc_alloc((Class)NSString) initWithFormat:@"%s", sel_getName("_checkDeepSleepTimerRunningEOS:")];
                *(void *)&v259[16] = v208;
                *((void *)&v262 + 1) = NSDebugDescriptionErrorKey;
                id v209 = [objc_alloc((Class)NSString) initWithFormat:@"%s:%d", sel_getName("_checkDeepSleepTimerRunningEOS:"), 713];
                *(void *)&v259[24] = v209;
                v210 = +[NSDictionary dictionaryWithObjects:v259 forKeys:&v261 count:4];
                v211 = v195;
                v212 = v196;
                uint64_t v213 = 6;
              }
              id v14 = [v211 initWithDomain:v212 code:v213 userInfo:v210];

              uint64_t v22 = v231;
              id v23 = v230;
            }
          }
          else
          {
            dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
            uint64_t v131 = NFLogGetLogger();
            if (v131)
            {
              id v132 = (void (*)(uint64_t, const char *, ...))v131;
              __int16 v133 = object_getClass(v4);
              BOOL v134 = class_isMetaClass(v133);
              __int16 v135 = object_getClassName(v4);
              id v136 = sel_getName("_checkDeepSleepTimerRunningEOS:");
              uint64_t v224 = [v22 status];
              uint64_t v137 = 45;
              if (v134) {
                uint64_t v137 = 43;
              }
              v132(3, "%c[%{public}s %{public}s]:%i Failed to request timer running Status: 0x%X", v137, v135, v136, 671, v224);
            }
            dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
            int v138 = NFSharedLogGetLogger();
            if (os_log_type_enabled(v138, OS_LOG_TYPE_ERROR))
            {
              __int16 v139 = object_getClass(v4);
              if (class_isMetaClass(v139)) {
                int v140 = 43;
              }
              else {
                int v140 = 45;
              }
              v141 = object_getClassName(v4);
              int v142 = sel_getName("_checkDeepSleepTimerRunningEOS:");
              unsigned int v143 = [v22 status];
              *(_DWORD *)buf = 67110146;
              *(_DWORD *)&uint8_t buf[4] = v140;
              *(_WORD *)v266 = 2082;
              *(void *)&v266[2] = v141;
              *(_WORD *)&v266[10] = 2082;
              *(void *)&v266[12] = v142;
              *(_WORD *)&v266[20] = 1024;
              *(_DWORD *)&v266[22] = 671;
              *(_WORD *)&v266[26] = 1024;
              *(_DWORD *)&v266[28] = v143;
              _os_log_impl((void *)&_mh_execute_header, v138, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i Failed to request timer running Status: 0x%X", buf, 0x28u);
            }

            sub_100198FF8((uint64_t)NFBugCapture, @"Failed to request timer running status", @"Failed to request timer running status", &off_1003233C0);
            id v144 = [objc_alloc((Class)NSString) initWithFormat:@"Failed to request timer running Status: 0x%X", [v22 status]];
            +[NFExceptionsCALogger postAnalyticsSEFailureEvent:9 context:v144 error:v23];
            id v145 = objc_alloc((Class)NSError);
            v146 = +[NSString stringWithUTF8String:"nfcd"];
            if (v23)
            {
              id v147 = [v23 code];
              *(void *)v259 = NSLocalizedDescriptionKey;
              if ((uint64_t)[v23 code] > 70) {
                uint64_t v148 = 71;
              }
              else {
                uint64_t v148 = (uint64_t)[v23 code];
              }
              id v206 = v23;
              v199 = +[NSString stringWithUTF8String:off_1003055F8[v148]];
              *(void *)buf = v199;
              *(void *)v266 = v206;
              *(void *)&v259[8] = NSUnderlyingErrorKey;
              *(void *)&v259[16] = @"Line";
              *(void *)&v266[8] = &off_10031C5E8;
              *(void *)&v259[24] = @"Method";
              id v200 = [objc_alloc((Class)NSString) initWithFormat:@"%s", sel_getName("_checkDeepSleepTimerRunningEOS:")];
              *(void *)&v266[16] = v200;
              *(void *)&v259[32] = NSDebugDescriptionErrorKey;
              id v201 = [objc_alloc((Class)NSString) initWithFormat:@"%s:%d", sel_getName("_checkDeepSleepTimerRunningEOS:"), 678];
              *(void *)&v266[24] = v201;
              v202 = +[NSDictionary dictionaryWithObjects:buf forKeys:v259 count:5];
              v203 = v145;
              v204 = v146;
              uint64_t v205 = (uint64_t)v147;
            }
            else
            {
              *(void *)v259 = NSLocalizedDescriptionKey;
              v199 = +[NSString stringWithUTF8String:"Unknown Error"];
              *(void *)buf = v199;
              *(void *)v266 = &off_10031C5E8;
              *(void *)&v259[8] = @"Line";
              *(void *)&v259[16] = @"Method";
              id v200 = [objc_alloc((Class)NSString) initWithFormat:@"%s", sel_getName("_checkDeepSleepTimerRunningEOS:")];
              *(void *)&v266[8] = v200;
              *(void *)&v259[24] = NSDebugDescriptionErrorKey;
              id v201 = [objc_alloc((Class)NSString) initWithFormat:@"%s:%d", sel_getName("_checkDeepSleepTimerRunningEOS:"), 678];
              *(void *)&v266[16] = v201;
              v202 = +[NSDictionary dictionaryWithObjects:buf forKeys:v259 count:4];
              v203 = v145;
              v204 = v146;
              uint64_t v205 = 6;
            }
            id v14 = [v203 initWithDomain:v204 code:v205 userInfo:v202];

            id v23 = v237;
          }
        }

        id v10 = v23;
      }
      else
      {
        dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
        uint64_t v39 = NFLogGetLogger();
        if (v39)
        {
          __int16 v40 = (void (*)(uint64_t, const char *, ...))v39;
          unsigned int v41 = object_getClass(v4);
          BOOL v42 = class_isMetaClass(v41);
          id v43 = object_getClassName(v4);
          v219 = sel_getName("_checkDeepSleepTimerRunningEOS:");
          uint64_t v44 = 45;
          if (v42) {
            uint64_t v44 = 43;
          }
          v40(3, "%c[%{public}s %{public}s]:%i Failed to select ISD", v44, v43, v219, 653);
        }
        dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
        int v45 = NFSharedLogGetLogger();
        if (os_log_type_enabled(v45, OS_LOG_TYPE_ERROR))
        {
          int v46 = object_getClass(v4);
          if (class_isMetaClass(v46)) {
            int v47 = 43;
          }
          else {
            int v47 = 45;
          }
          unsigned int v48 = object_getClassName(v4);
          uint64_t v49 = sel_getName("_checkDeepSleepTimerRunningEOS:");
          *(_DWORD *)buf = 67109890;
          *(_DWORD *)&uint8_t buf[4] = v47;
          *(_WORD *)v266 = 2082;
          *(void *)&v266[2] = v48;
          *(_WORD *)&v266[10] = 2082;
          *(void *)&v266[12] = v49;
          *(_WORD *)&v266[20] = 1024;
          *(_DWORD *)&v266[22] = 653;
          _os_log_impl((void *)&_mh_execute_header, v45, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i Failed to select ISD", buf, 0x22u);
        }

        id v50 = objc_alloc((Class)NSError);
        uint64_t v51 = +[NSString stringWithUTF8String:"nfcd"];
        if (v10)
        {
          id v52 = [v10 code];
          *(void *)v259 = NSLocalizedDescriptionKey;
          if ((uint64_t)[v10 code] > 70) {
            uint64_t v53 = 71;
          }
          else {
            uint64_t v53 = (uint64_t)[v10 code];
          }
          id v112 = +[NSString stringWithUTF8String:off_1003055F8[v53]];
          *(void *)buf = v112;
          *(void *)v266 = v10;
          *(void *)&v259[8] = NSUnderlyingErrorKey;
          *(void *)&v259[16] = @"Line";
          *(void *)&v266[8] = &off_10031C5D0;
          *(void *)&v259[24] = @"Method";
          id v113 = [objc_alloc((Class)NSString) initWithFormat:@"%s", sel_getName("_checkDeepSleepTimerRunningEOS:")];
          *(void *)&v266[16] = v113;
          *(void *)&v259[32] = NSDebugDescriptionErrorKey;
          id v114 = [objc_alloc((Class)NSString) initWithFormat:@"%s:%d", sel_getName("_checkDeepSleepTimerRunningEOS:"), 654];
          *(void *)&v266[24] = v114;
          id v115 = +[NSDictionary dictionaryWithObjects:buf forKeys:v259 count:5];
          id v14 = [v50 initWithDomain:v51 code:v52 userInfo:v115];
        }
        else
        {
          *(void *)v259 = NSLocalizedDescriptionKey;
          id v104 = +[NSString stringWithUTF8String:"Unknown Error"];
          *(void *)buf = v104;
          *(void *)v266 = &off_10031C5D0;
          *(void *)&v259[8] = @"Line";
          *(void *)&v259[16] = @"Method";
          id v105 = [objc_alloc((Class)NSString) initWithFormat:@"%s", sel_getName("_checkDeepSleepTimerRunningEOS:")];
          *(void *)&v266[8] = v105;
          *(void *)&v259[24] = NSDebugDescriptionErrorKey;
          id v106 = [objc_alloc((Class)NSString) initWithFormat:@"%s:%d", sel_getName("_checkDeepSleepTimerRunningEOS:"), 654];
          *(void *)&v266[16] = v106;
          id v107 = +[NSDictionary dictionaryWithObjects:buf forKeys:v259 count:4];
          id v14 = [v50 initWithDomain:v51 code:6 userInfo:v107];

          id v10 = v51;
        }
      }
      goto LABEL_164;
    }
  }
  else
  {
    if (v7 != (id)2)
    {
      id v14 = 0;
      *a3 = 0;
      goto LABEL_165;
    }
    if (v4)
    {
      LOWORD(v243) = 20703;
      id v8 = [objc_alloc((Class)NSData) initWithBytes:&unk_100284159 length:8];
      *(void *)v248 = 0;
      unsigned __int8 v9 = [(NFSecureElementWrapper *)v4 select:v8 error:v248];
      id v10 = *(id *)v248;

      if ((v9 & 1) == 0)
      {
        dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
        uint64_t v24 = NFLogGetLogger();
        if (v24)
        {
          int v25 = (void (*)(uint64_t, const char *, ...))v24;
          uint64_t v26 = object_getClass(v4);
          BOOL v27 = class_isMetaClass(v26);
          id v28 = object_getClassName(v4);
          v218 = sel_getName("_checkDeepSleepTimerRunningP73:");
          uint64_t v29 = 45;
          if (v27) {
            uint64_t v29 = 43;
          }
          v25(3, "%c[%{public}s %{public}s]:%i Failed to select ISD", v29, v28, v218, 593);
        }
        dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
        BOOL v30 = NFSharedLogGetLogger();
        if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
        {
          uint64_t v31 = object_getClass(v4);
          if (class_isMetaClass(v31)) {
            int v32 = 43;
          }
          else {
            int v32 = 45;
          }
          id v33 = object_getClassName(v4);
          __int16 v34 = sel_getName("_checkDeepSleepTimerRunningP73:");
          *(_DWORD *)buf = 67109890;
          *(_DWORD *)&uint8_t buf[4] = v32;
          *(_WORD *)v266 = 2082;
          *(void *)&v266[2] = v33;
          *(_WORD *)&v266[10] = 2082;
          *(void *)&v266[12] = v34;
          *(_WORD *)&v266[20] = 1024;
          *(_DWORD *)&v266[22] = 593;
          _os_log_impl((void *)&_mh_execute_header, v30, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i Failed to select ISD", buf, 0x22u);
        }

        id v35 = objc_alloc((Class)NSError);
        uint64_t v36 = +[NSString stringWithUTF8String:"nfcd"];
        if (v10)
        {
          id v37 = [v10 code];
          *(void *)v259 = NSLocalizedDescriptionKey;
          if ((uint64_t)[v10 code] > 70) {
            uint64_t v38 = 71;
          }
          else {
            uint64_t v38 = (uint64_t)[v10 code];
          }
          id v108 = +[NSString stringWithUTF8String:off_1003055F8[v38]];
          *(void *)buf = v108;
          *(void *)v266 = v10;
          *(void *)&v259[8] = NSUnderlyingErrorKey;
          *(void *)&v259[16] = @"Line";
          *(void *)&v266[8] = &off_10031C5A0;
          *(void *)&v259[24] = @"Method";
          id v109 = [objc_alloc((Class)NSString) initWithFormat:@"%s", sel_getName("_checkDeepSleepTimerRunningP73:")];
          *(void *)&v266[16] = v109;
          *(void *)&v259[32] = NSDebugDescriptionErrorKey;
          id v110 = [objc_alloc((Class)NSString) initWithFormat:@"%s:%d", sel_getName("_checkDeepSleepTimerRunningP73:"), 594];
          *(void *)&v266[24] = v110;
          id v111 = +[NSDictionary dictionaryWithObjects:buf forKeys:v259 count:5];
          id v14 = [v35 initWithDomain:v36 code:v37 userInfo:v111];

          uint64_t v12 = (void *)v36;
        }
        else
        {
          *(void *)v259 = NSLocalizedDescriptionKey;
          uint64_t v12 = +[NSString stringWithUTF8String:"Unknown Error"];
          *(void *)buf = v12;
          *(void *)v266 = &off_10031C5A0;
          *(void *)&v259[8] = @"Line";
          *(void *)&v259[16] = @"Method";
          id v101 = [[objc_alloc((Class)NSString) initWithFormat:@"%s", sel_getName("_checkDeepSleepTimerRunningP73:")];
          *(void *)&v266[8] = v101;
          *(void *)&v259[24] = NSDebugDescriptionErrorKey;
          id v102 = [[objc_alloc((Class)NSString) initWithFormat:@"%s:%d", sel_getName("_checkDeepSleepTimerRunningP73:"), 594];
          *(void *)&v266[16] = v102;
          uint64_t v103 = +[NSDictionary dictionaryWithObjects:buf forKeys:v259 count:4];
          id v14 = [v35 initWithDomain:v36 code:6 userInfo:v103];

          id v10 = (id)v36;
        }
        goto LABEL_116;
      }
      id v11 = +[NSData dataWithBytes:&v243 length:2];
      id v245 = v10;
      uint64_t v12 = [(NFSecureElementWrapper *)v4 sendCommandWithClass:0 instruction:202 p1:0 p2:254 data:v11 error:&v245];
      id v13 = v245;

      if ([v12 status] == 26277)
      {
        id v14 = 0;
        *a3 = 87000;
        id v10 = v13;
LABEL_116:

LABEL_164:
        goto LABEL_165;
      }
      if ([v12 status] != 36864)
      {
        dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
        uint64_t v116 = NFLogGetLogger();
        if (v116)
        {
          int v117 = (void (*)(uint64_t, const char *, ...))v116;
          __int16 v118 = object_getClass(v4);
          BOOL v119 = class_isMetaClass(v118);
          id v120 = v13;
          v121 = object_getClassName(v4);
          __int16 v122 = sel_getName("_checkDeepSleepTimerRunningP73:");
          uint64_t v223 = [v12 status];
          v217 = v121;
          uint64_t v123 = 45;
          if (v119) {
            uint64_t v123 = 43;
          }
          id v13 = v120;
          v117(3, "%c[%{public}s %{public}s]:%i Failed to request timer running Status: 0x%X", v123, v217, v122, 610, v223);
        }
        dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
        __int16 v124 = NFSharedLogGetLogger();
        if (os_log_type_enabled(v124, OS_LOG_TYPE_ERROR))
        {
          int v125 = object_getClass(v4);
          if (class_isMetaClass(v125)) {
            int v126 = 43;
          }
          else {
            int v126 = 45;
          }
          id v127 = object_getClassName(v4);
          int v128 = sel_getName("_checkDeepSleepTimerRunningP73:");
          unsigned int v129 = [v12 status];
          *(_DWORD *)buf = 67110146;
          *(_DWORD *)&uint8_t buf[4] = v126;
          *(_WORD *)v266 = 2082;
          *(void *)&v266[2] = v127;
          *(_WORD *)&v266[10] = 2082;
          *(void *)&v266[12] = v128;
          *(_WORD *)&v266[20] = 1024;
          *(_DWORD *)&v266[22] = 610;
          *(_WORD *)&v266[26] = 1024;
          *(_DWORD *)&v266[28] = v129;
          _os_log_impl((void *)&_mh_execute_header, v124, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i Failed to request timer running Status: 0x%X", buf, 0x28u);
        }

        sub_100198FF8((uint64_t)NFBugCapture, @"Failed to request timer running status", @"Failed to request timer running status", &off_100323398);
        id v130 = [objc_alloc((Class)NSString) initWithFormat:@"Failed to request timer running Status: 0x%X", [v12 status]];
        +[NFExceptionsCALogger postAnalyticsSEFailureEvent:9 context:v130 error:v13];
        id v10 = v13;

        id v14 = v10;
        goto LABEL_116;
      }
      v232 = v13;
      *a3 = 0;
      memset(v259, 0, sizeof(v259));
      long long v260 = 0u;
      v236 = v12;
      BOOL v54 = [v12 data];
      id v55 = +[NFTLV TLVsWithData:v54];

      id v56 = [v55 countByEnumeratingWithState:v259 objects:buf count:16];
      if (v56)
      {
        id v57 = v56;
        v234 = a3;
        char v58 = 0;
        SEL v240 = 0;
        uint64_t v59 = **(void **)&v259[16];
        do
        {
          for (k = 0; k != v57; k = (char *)k + 1)
          {
            if (**(void **)&v259[16] != v59) {
              objc_enumerationMutation(v55);
            }
            NSErrorUserInfoKey v61 = *(void **)(*(void *)&v259[8] + 8 * (void)k);
            if ([v61 tag] - 241 <= 1)
            {
              if ([v61 valueAsUnsignedLong])
              {
                dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
                uint64_t v62 = NFLogGetLogger();
                if (v62)
                {
                  id v63 = (void (*)(uint64_t, const char *, ...))v62;
                  __int16 v64 = object_getClass(v4);
                  BOOL v65 = class_isMetaClass(v64);
                  uint64_t v66 = object_getClassName(v4);
                  id v67 = sel_getName("_checkDeepSleepTimerRunningP73:");
                  id v221 = [v61 tag];
                  id v227 = [v61 valueAsUnsignedLong];
                  uint64_t v68 = 45;
                  if (v65) {
                    uint64_t v68 = 43;
                  }
                  v215 = v66;
                  uint64_t v4 = v241;
                  v63(5, "%c[%{public}s %{public}s]:%i DPD timer running (%u = %u)", v68, v215, v67, 634, v221, v227);
                }
                dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
                __int16 v69 = NFSharedLogGetLogger();
                if (os_log_type_enabled(v69, OS_LOG_TYPE_DEFAULT))
                {
                  int v70 = object_getClass(v4);
                  if (class_isMetaClass(v70)) {
                    int v71 = 43;
                  }
                  else {
                    int v71 = 45;
                  }
                  int v72 = object_getClassName(v4);
                  __int16 v73 = sel_getName("_checkDeepSleepTimerRunningP73:");
                  unsigned int v74 = [v61 tag];
                  unsigned int v75 = [v61 valueAsUnsignedLong];
                  *(_DWORD *)v267 = 67110402;
                  *(_DWORD *)&v267[4] = v71;
                  *(_WORD *)&v267[8] = 2082;
                  *(void *)&v267[10] = v72;
                  *(_WORD *)&v267[18] = 2082;
                  *(void *)&v267[20] = v73;
                  uint64_t v4 = v241;
                  *(_WORD *)&v267[28] = 1024;
                  *(_DWORD *)&v267[30] = 634;
                  *(_WORD *)&v267[34] = 1024;
                  *(_DWORD *)&v267[36] = v74;
                  *(_WORD *)&v267[40] = 1024;
                  *(_DWORD *)&v267[42] = v75;
                  _os_log_impl((void *)&_mh_execute_header, v69, OS_LOG_TYPE_DEFAULT, "%c[%{public}s %{public}s]:%i DPD timer running (%u = %u)", v267, 0x2Eu);
                }

                unsigned int v76 = [v61 valueAsUnsignedLong];
                int v77 = v240;
                if ((unint64_t)v240 <= v76) {
                  int v77 = (const char *)v76;
                }
                SEL v240 = v77;
              }
              char v58 = 1;
            }
          }
          id v57 = [v55 countByEnumeratingWithState:v259 objects:buf count:16];
        }
        while (v57);

        if (v58)
        {
          unint64_t *v234 = (unint64_t)v240;
          id v10 = v232;
          id v14 = v10;
LABEL_115:
          uint64_t v12 = v236;
          goto LABEL_116;
        }
      }
      else
      {
      }
      id v149 = objc_alloc((Class)NSError);
      id v150 = +[NSString stringWithUTF8String:"nfcd"];
      *(void *)&long long v261 = NSLocalizedDescriptionKey;
      v151 = +[NSString stringWithUTF8String:"Unexpected Result"];
      *(void *)v267 = v151;
      *(void *)&v267[8] = &off_10031C5B8;
      *((void *)&v261 + 1) = @"Line";
      *(void *)&long long v262 = @"Method";
      id v152 = [objc_alloc((Class)NSString) initWithFormat:@"%s", sel_getName("_checkDeepSleepTimerRunningP73:")];
      *(void *)&v267[16] = v152;
      *((void *)&v262 + 1) = NSDebugDescriptionErrorKey;
      id v153 = [objc_alloc((Class)NSString) initWithFormat:@"%s:%d", sel_getName("_checkDeepSleepTimerRunningP73:"), 643];
      *(void *)&v267[24] = v153;
      v154 = +[NSDictionary dictionaryWithObjects:v267 forKeys:&v261 count:4];
      id v14 = [v149 initWithDomain:v150 code:13 userInfo:v154];

      id v10 = v232;
      goto LABEL_115;
    }
  }
  id v14 = 0;
LABEL_165:

  return v14;
}

- (id)powerCycleOrReset
{
  if (!self) {
    goto LABEL_9;
  }
  id v3 = [(NFSecureElementHandleInterface *)self->_handle info];
  uint64_t v4 = (uint64_t)[v3 deviceType];

  if (v4 > 199)
  {
    if (v4 != 210 && v4 != 200) {
      goto LABEL_9;
    }
LABEL_8:
    dispatch_queue_t v5 = [(NFSecureElementWrapper *)self delegate];
    uint64_t v6 = [v5 softResetSE:self];
    goto LABEL_10;
  }
  if (v4 == 100 || v4 == 115) {
    goto LABEL_8;
  }
LABEL_9:
  dispatch_queue_t v5 = [(NFSecureElementWrapper *)self delegate];
  uint64_t v6 = [v5 powerCycleSE:self];
LABEL_10:
  id v7 = (void *)v6;

  return v7;
}

- (BOOL)jcopSupportsEntanglement
{
  id v3 = [(NFSecureElementHandleInterface *)self->_handle info];
  uint64_t v4 = (uint64_t)[v3 deviceType];

  BOOL v5 = 0;
  if (v4 > 199)
  {
    if (v4 != 210 && v4 != 200) {
      return v5;
    }
LABEL_7:
    unsigned int v6 = 2101;
    goto LABEL_8;
  }
  if (v4 == 100) {
    goto LABEL_7;
  }
  if (v4 == 115)
  {
    unsigned int v6 = 1818;
LABEL_8:
    id v7 = [(NFSecureElementWrapper *)self handle];
    id v8 = [v7 info];
    unsigned __int8 v9 = [v8 sequenceCounter];
    BOOL v5 = [v9 unsignedIntValue] > v6;
  }
  return v5;
}

+ (BOOL)isAuthRandomEntangled
{
  return byte_100347490;
}

+ (void)setAuthRandomEntangled
{
  dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
  uint64_t Logger = NFLogGetLogger();
  if (Logger)
  {
    BOOL v5 = (void (*)(uint64_t, const char *, ...))Logger;
    Class = object_getClass(a1);
    BOOL isMetaClass = class_isMetaClass(Class);
    ClassName = object_getClassName(a1);
    Name = sel_getName(a2);
    uint64_t v9 = 45;
    if (isMetaClass) {
      uint64_t v9 = 43;
    }
    v5(6, "%c[%{public}s %{public}s]:%i ", v9, ClassName, Name, 797);
  }
  dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
  id v10 = NFSharedLogGetLogger();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    id v11 = object_getClass(a1);
    if (class_isMetaClass(v11)) {
      int v12 = 43;
    }
    else {
      int v12 = 45;
    }
    *(_DWORD *)buf = 67109890;
    int v15 = v12;
    __int16 v16 = 2082;
    int v17 = object_getClassName(a1);
    __int16 v18 = 2082;
    id v19 = sel_getName(a2);
    __int16 v20 = 1024;
    int v21 = 797;
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "%c[%{public}s %{public}s]:%i ", buf, 0x22u);
  }

  byte_100347490 = 1;
}

- (BOOL)jcopSupportsPerBootAuthKeys
{
  v2 = [(NFSecureElementHandleInterface *)self->_handle info];
  uint64_t v3 = (uint64_t)[v2 deviceType];

  BOOL result = 0;
  if (v3 > 199)
  {
    if (v3 != 200 && v3 != 210) {
      return 1;
    }
  }
  else if (v3 != 100 && v3 != 115)
  {
    return 1;
  }
  return result;
}

- (id)mountCOXForApplets:(id)a3
{
  id v4 = a3;
  if (sub_1001621F8((BOOL)self))
  {
    id v5 = [objc_alloc((Class)NSData) initWithBytes:&unk_100284159 length:8];
    id v71 = 0;
    unsigned int v6 = [(NFSecureElementWrapper *)self selectByName:v5 error:&v71];
    id v7 = v71;

    if (v6)
    {
      if ([v6 status] == 36864)
      {
        long long v69 = 0u;
        long long v70 = 0u;
        long long v67 = 0u;
        long long v68 = 0u;
        id obj = v4;
        id v64 = [obj countByEnumeratingWithState:&v67 objects:v84 count:16];
        if (v64)
        {
          id v57 = v4;
          uint64_t v63 = *(void *)v68;
          id v8 = obj;
          do
          {
            for (i = 0; i != v64; i = (char *)i + 1)
            {
              if (*(void *)v68 != v63) {
                objc_enumerationMutation(v8);
              }
              id v10 = *(void **)(*((void *)&v67 + 1) + 8 * i);
              id v11 = [v10 identifierAsData];
              if ((unint64_t)[v11 length] >= 5
                && (unint64_t)[v11 length] < 0x11)
              {
                v66[0] = 79;
                v66[1] = [v11 length];
                id v23 = +[NSMutableData dataWithBytes:v66 length:2];
                [v23 appendData:v11];
                id v65 = v7;
                uint64_t v24 = [(NFSecureElementWrapper *)self sendCommandWithClass:128 instruction:240 p1:16 p2:1 data:v23 expectedLength:0 toOS:0 error:&v65];
                id v25 = v65;

                if ([v24 status] != 36864)
                {
                  dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
                  uint64_t Logger = NFLogGetLogger();
                  id v61 = v25;
                  if (Logger)
                  {
                    BOOL v27 = (void (*)(uint64_t, const char *, ...))Logger;
                    Class = object_getClass(self);
                    BOOL isMetaClass = class_isMetaClass(Class);
                    ClassName = object_getClassName(self);
                    Name = sel_getName(a2);
                    uint64_t v31 = [v10 identifier];
                    uint64_t v56 = [v24 status];
                    uint64_t v32 = 45;
                    if (isMetaClass) {
                      uint64_t v32 = 43;
                    }
                    v27(3, "%c[%{public}s %{public}s]:%i COX mount %@ error:0x%02X", v32, ClassName, Name, 867, v31, v56);

                    id v25 = v61;
                  }
                  dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
                  id v33 = NFSharedLogGetLogger();
                  if (os_log_type_enabled(v33, OS_LOG_TYPE_ERROR))
                  {
                    __int16 v34 = object_getClass(self);
                    if (class_isMetaClass(v34)) {
                      int v35 = 43;
                    }
                    else {
                      int v35 = 45;
                    }
                    int v59 = v35;
                    uint64_t v36 = object_getClassName(self);
                    id v37 = sel_getName(a2);
                    uint64_t v38 = [v10 identifier];
                    unsigned int v39 = [v24 status];
                    *(_DWORD *)buf = 67110402;
                    int v73 = v59;
                    __int16 v74 = 2082;
                    unsigned int v75 = v36;
                    __int16 v76 = 2082;
                    int v77 = v37;
                    id v25 = v61;
                    __int16 v78 = 1024;
                    int v79 = 867;
                    __int16 v80 = 2112;
                    id v81 = v38;
                    __int16 v82 = 1024;
                    unsigned int v83 = v39;
                    _os_log_impl((void *)&_mh_execute_header, v33, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i COX mount %@ error:0x%02X", buf, 0x32u);
                  }
                }

                unsigned int v6 = v24;
                id v7 = v25;
                id v8 = obj;
              }
              else
              {
                dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
                uint64_t v12 = NFLogGetLogger();
                if (v12)
                {
                  id v13 = (void (*)(uint64_t, const char *, ...))v12;
                  id v14 = object_getClass(self);
                  BOOL v15 = class_isMetaClass(v14);
                  __int16 v16 = object_getClassName(self);
                  id v55 = sel_getName(a2);
                  uint64_t v17 = 45;
                  if (v15) {
                    uint64_t v17 = 43;
                  }
                  v13(4, "%c[%{public}s %{public}s]:%i Skipping invalid AID due to length", v17, v16, v55, 850);
                }
                dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
                __int16 v18 = NFSharedLogGetLogger();
                if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
                {
                  id v19 = object_getClass(self);
                  if (class_isMetaClass(v19)) {
                    int v20 = 43;
                  }
                  else {
                    int v20 = 45;
                  }
                  int v21 = object_getClassName(self);
                  uint64_t v22 = sel_getName(a2);
                  *(_DWORD *)buf = 67109890;
                  int v73 = v20;
                  __int16 v74 = 2082;
                  unsigned int v75 = v21;
                  __int16 v76 = 2082;
                  int v77 = v22;
                  __int16 v78 = 1024;
                  int v79 = 850;
                  _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i Skipping invalid AID due to length", buf, 0x22u);
                }
              }
            }
            id v64 = [v8 countByEnumeratingWithState:&v67 objects:v84 count:16];
          }
          while (v64);
          id v40 = 0;
          unsigned int v41 = v8;
          id v4 = v57;
        }
        else
        {
          id v40 = 0;
          unsigned int v41 = obj;
        }
      }
      else
      {
        id v46 = objc_alloc((Class)NSError);
        unsigned int v41 = +[NSString stringWithUTF8String:"nfcd"];
        v85[0] = NSLocalizedDescriptionKey;
        int v47 = +[NSString stringWithUTF8String:"Commmand Error"];
        v86[0] = v47;
        v86[1] = &off_10031C630;
        v85[1] = @"Line";
        v85[2] = @"Method";
        id v48 = [objc_alloc((Class)NSString) initWithFormat:@"%s", sel_getName(a2)];
        v86[2] = v48;
        v85[3] = NSDebugDescriptionErrorKey;
        id v49 = [[objc_alloc((Class)NSString) initWithFormat:@"%s:%d", sel_getName(a2), 839];
        v86[3] = v49;
        id v50 = +[NSDictionary dictionaryWithObjects:v86 forKeys:v85 count:4];
        id v40 = [v46 initWithDomain:v41 code:16 userInfo:v50];
      }
    }
    else
    {
      id v42 = objc_alloc((Class)NSError);
      uint64_t v43 = +[NSString stringWithUTF8String:"nfcd"];
      if (v7)
      {
        id v44 = [v7 code];
        v89[0] = NSLocalizedDescriptionKey;
        if ((uint64_t)[v7 code] > 70) {
          uint64_t v45 = 71;
        }
        else {
          uint64_t v45 = (uint64_t)[v7 code];
        }
        unsigned int v41 = +[NSString stringWithUTF8String:off_1003055F8[v45]];
        v90[0] = v41;
        v90[1] = v7;
        v89[1] = NSUnderlyingErrorKey;
        v89[2] = @"Line";
        v90[2] = &off_10031C618;
        v89[3] = @"Method";
        id v51 = [objc_alloc((Class)NSString) initWithFormat:@"%s", sel_getName(a2)];
        v90[3] = v51;
        v89[4] = NSDebugDescriptionErrorKey;
        id v52 = [objc_alloc((Class)NSString) initWithFormat:@"%s:%d", sel_getName(a2), 837];
        v90[4] = v52;
        uint64_t v53 = +[NSDictionary dictionaryWithObjects:v90 forKeys:v89 count:5];
        id v40 = [v42 initWithDomain:v43 code:v44 userInfo:v53];

        unsigned int v6 = (void *)v43;
      }
      else
      {
        NSErrorUserInfoKey v87 = NSLocalizedDescriptionKey;
        unsigned int v6 = +[NSString stringWithUTF8String:"Commmand Error"];
        uint64_t v88 = v6;
        unsigned int v41 = +[NSDictionary dictionaryWithObjects:&v88 forKeys:&v87 count:1];
        id v40 = [v42 initWithDomain:v43 code:16 userInfo:v41];
        id v7 = (id)v43;
      }
    }
  }
  else
  {
    id v40 = 0;
  }

  return v40;
}

- (id)globalUnmountCOX
{
  if (!sub_1001621F8((BOOL)self))
  {
    id v9 = 0;
    goto LABEL_27;
  }
  id v4 = [objc_alloc((Class)NSData) initWithBytes:&unk_100284159 length:8];
  id v40 = 0;
  id v5 = [(NFSecureElementWrapper *)self selectByName:v4 error:&v40];
  id v6 = v40;

  if (!v5)
  {
    id v10 = objc_alloc((Class)NSError);
    id v11 = +[NSString stringWithUTF8String:"nfcd"];
    if (v6)
    {
      id v12 = [v6 code];
      v55[0] = NSLocalizedDescriptionKey;
      if ((uint64_t)[v6 code] > 70) {
        uint64_t v13 = 71;
      }
      else {
        uint64_t v13 = (uint64_t)[v6 code];
      }
      id v33 = +[NSString stringWithUTF8String:off_1003055F8[v13]];
      v56[0] = v33;
      v56[1] = v6;
      v55[1] = NSUnderlyingErrorKey;
      v55[2] = @"Line";
      v56[2] = &off_10031C648;
      v55[3] = @"Method";
      id v34 = [objc_alloc((Class)NSString) initWithFormat:@"%s", sel_getName(a2)];
      v56[3] = v34;
      v55[4] = NSDebugDescriptionErrorKey;
      id v35 = [objc_alloc((Class)NSString) initWithFormat:@"%s:%d", sel_getName(a2), 881];
      v56[4] = v35;
      uint64_t v36 = +[NSDictionary dictionaryWithObjects:v56 forKeys:v55 count:5];
      id v9 = [v10 initWithDomain:v11 code:v12 userInfo:v36];
    }
    else
    {
      NSErrorUserInfoKey v53 = NSLocalizedDescriptionKey;
      uint64_t v31 = +[NSString stringWithUTF8String:"Commmand Error"];
      BOOL v54 = v31;
      uint64_t v32 = +[NSDictionary dictionaryWithObjects:&v54 forKeys:&v53 count:1];
      id v9 = [v10 initWithDomain:v11 code:16 userInfo:v32];

      id v6 = 0;
    }
    id v5 = 0;
    goto LABEL_25;
  }
  if ([v5 status] != 36864)
  {
    id v14 = objc_alloc((Class)NSError);
    id v11 = +[NSString stringWithUTF8String:"nfcd"];
    v51[0] = NSLocalizedDescriptionKey;
    BOOL v15 = +[NSString stringWithUTF8String:"Commmand Error"];
    v52[0] = v15;
    v52[1] = &off_10031C660;
    v51[1] = @"Line";
    v51[2] = @"Method";
    id v16 = [objc_alloc((Class)NSString) initWithFormat:@"%s", sel_getName(a2)];
    v52[2] = v16;
    v51[3] = NSDebugDescriptionErrorKey;
    id v17 = [objc_alloc((Class)NSString) initWithFormat:@"%s:%d", sel_getName(a2), 883];
    v52[3] = v17;
    __int16 v18 = +[NSDictionary dictionaryWithObjects:v52 forKeys:v51 count:4];
    id v9 = [v14 initWithDomain:v11 code:16 userInfo:v18];

LABEL_25:
    id v8 = v6;
    id v7 = v5;
    goto LABEL_26;
  }
  id v39 = v6;
  id v7 = [(NFSecureElementWrapper *)self sendCommandWithClass:128 instruction:240 p1:16 p2:0 data:0 expectedLength:0 toOS:0 error:&v39];
  id v8 = v39;

  if ([v7 status] != 36864)
  {
    dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    uint64_t Logger = NFLogGetLogger();
    if (Logger)
    {
      int v20 = (void (*)(uint64_t, const char *, ...))Logger;
      Class = object_getClass(self);
      BOOL isMetaClass = class_isMetaClass(Class);
      ClassName = object_getClassName(self);
      Name = sel_getName(a2);
      uint64_t v38 = [v7 status];
      uint64_t v25 = 45;
      if (isMetaClass) {
        uint64_t v25 = 43;
      }
      v20(3, "%c[%{public}s %{public}s]:%i COX unmount error:0x%02X", v25, ClassName, Name, 895, v38);
    }
    dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    id v11 = NFSharedLogGetLogger();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      uint64_t v26 = object_getClass(self);
      if (class_isMetaClass(v26)) {
        int v27 = 43;
      }
      else {
        int v27 = 45;
      }
      id v28 = object_getClassName(self);
      uint64_t v29 = sel_getName(a2);
      unsigned int v30 = [v7 status];
      *(_DWORD *)buf = 67110146;
      int v42 = v27;
      __int16 v43 = 2082;
      id v44 = v28;
      __int16 v45 = 2082;
      id v46 = v29;
      __int16 v47 = 1024;
      int v48 = 895;
      __int16 v49 = 1024;
      unsigned int v50 = v30;
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i COX unmount error:0x%02X", buf, 0x28u);
    }
    id v9 = 0;
    id v6 = v8;
    id v5 = v7;
    goto LABEL_25;
  }
  id v9 = 0;
LABEL_26:

LABEL_27:

  return v9;
}

- (BOOL)upgradeChecked
{
  return self->_upgradeChecked;
}

- (void)setUpgradeChecked:(BOOL)a3
{
  self->_upgradeChecked = a3;
}

- (NFSecureElementHandleInterface)handle
{
  return (NFSecureElementHandleInterface *)objc_getProperty(self, a2, 24, 1);
}

- (NFSecureElementWrapperDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (NFSecureElementWrapperDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (NFApplet)activeApplet
{
  return (NFApplet *)objc_getProperty(self, a2, 40, 1);
}

- (void)setActiveApplet:(id)a3
{
}

- (NSArray)cachedAppletsUnfiltered
{
  return self->_cachedAppletsUnfiltered;
}

- (void)setCachedAppletsUnfiltered:(id)a3
{
}

- (NSNumber)cachedAppletUpdateCounter
{
  return self->_cachedAppletUpdateCounter;
}

- (void)setCachedAppletUpdateCounter:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_cachedAppletUpdateCounter, 0);
  objc_storeStrong((id *)&self->_cachedAppletsUnfiltered, 0);
  objc_storeStrong((id *)&self->_activeApplet, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_handle, 0);

  objc_storeStrong((id *)&self->_authQueue, 0);
}

- (unint64_t)pairedState
{
  return qword_1003476B0;
}

- (void)setUnpairedState
{
  qword_1003476B0 = 1;
}

- (void)storePairedState
{
  qword_1003476B0 = 2;
}

- (unint64_t)_crsGetPersoState:(id *)a3
{
  *a3 = 0;
  id v6 = [(NFSecureElementWrapper *)self getData:128 tag:211 data:0 error:a3];
  id v7 = v6;
  if (*a3)
  {
    dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    uint64_t Logger = NFLogGetLogger();
    if (Logger)
    {
      id v9 = (void (*)(uint64_t, const char *, ...))Logger;
      Class = object_getClass(self);
      BOOL isMetaClass = class_isMetaClass(Class);
      ClassName = object_getClassName(self);
      Name = sel_getName(a2);
      uint64_t v14 = 45;
      if (isMetaClass) {
        uint64_t v14 = 43;
      }
      v9(3, "%c[%{public}s %{public}s]:%i Failed to get data: %{public}@", v14, ClassName, Name, 57, *a3);
    }
    dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    BOOL v15 = NFSharedLogGetLogger();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      id v16 = object_getClass(self);
      if (class_isMetaClass(v16)) {
        int v17 = 43;
      }
      else {
        int v17 = 45;
      }
      __int16 v18 = object_getClassName(self);
      id v19 = sel_getName(a2);
      id v20 = *a3;
      *(_DWORD *)buf = 67110146;
      int v118 = v17;
      __int16 v119 = 2082;
      id v120 = v18;
      __int16 v121 = 2082;
      __int16 v122 = v19;
      __int16 v123 = 1024;
      int v124 = 57;
      __int16 v125 = 2114;
      id v126 = v20;
      _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i Failed to get data: %{public}@", buf, 0x2Cu);
    }
    goto LABEL_52;
  }
  if (!v6)
  {
    dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    uint64_t v44 = NFLogGetLogger();
    if (v44)
    {
      __int16 v45 = (void (*)(uint64_t, const char *, ...))v44;
      id v46 = object_getClass(self);
      BOOL v47 = class_isMetaClass(v46);
      int v48 = object_getClassName(self);
      id v102 = sel_getName(a2);
      uint64_t v49 = 45;
      if (v47) {
        uint64_t v49 = 43;
      }
      v45(3, "%c[%{public}s %{public}s]:%i Failed to get data, expecting RAPDU", v49, v48, v102, 61);
    }
    dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    unsigned int v50 = NFSharedLogGetLogger();
    if (os_log_type_enabled(v50, OS_LOG_TYPE_ERROR))
    {
      id v51 = object_getClass(self);
      if (class_isMetaClass(v51)) {
        int v52 = 43;
      }
      else {
        int v52 = 45;
      }
      *(_DWORD *)buf = 67109890;
      int v118 = v52;
      __int16 v119 = 2082;
      id v120 = object_getClassName(self);
      __int16 v121 = 2082;
      __int16 v122 = sel_getName(a2);
      __int16 v123 = 1024;
      int v124 = 61;
      _os_log_impl((void *)&_mh_execute_header, v50, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i Failed to get data, expecting RAPDU", buf, 0x22u);
    }

    id v53 = objc_alloc((Class)NSError);
    BOOL v15 = +[NSString stringWithUTF8String:"nfcd"];
    v115[0] = NSLocalizedDescriptionKey;
    BOOL v54 = +[NSString stringWithUTF8String:"Commmand Error"];
    v116[0] = v54;
    v116[1] = &off_10031FB58;
    v115[1] = @"Line";
    v115[2] = @"Method";
    id v55 = [objc_alloc((Class)NSString) initWithFormat:@"%s", sel_getName(a2)];
    v116[2] = v55;
    v115[3] = NSDebugDescriptionErrorKey;
    id v56 = [objc_alloc((Class)NSString) initWithFormat:@"%s:%d", sel_getName(a2), 62];
    v116[3] = v56;
    id v57 = v116;
    char v58 = v115;
    goto LABEL_50;
  }
  if ([v6 status] != 36864)
  {
    dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    uint64_t v59 = NFLogGetLogger();
    if (v59)
    {
      int v60 = (void (*)(uint64_t, const char *, ...))v59;
      id v61 = object_getClass(self);
      BOOL v62 = class_isMetaClass(v61);
      uint64_t v63 = object_getClassName(self);
      id v64 = sel_getName(a2);
      uint64_t v105 = [v7 status];
      uint64_t v65 = 45;
      if (v62) {
        uint64_t v65 = 43;
      }
      v60(3, "%c[%{public}s %{public}s]:%i Failed to get perso request, expecting 0x9000, got 0x%x", v65, v63, v64, 66, v105);
    }
    dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    uint64_t v66 = NFSharedLogGetLogger();
    if (os_log_type_enabled(v66, OS_LOG_TYPE_ERROR))
    {
      long long v67 = object_getClass(self);
      if (class_isMetaClass(v67)) {
        int v68 = 43;
      }
      else {
        int v68 = 45;
      }
      *(_DWORD *)buf = 67110146;
      int v118 = v68;
      __int16 v119 = 2082;
      id v120 = object_getClassName(self);
      __int16 v121 = 2082;
      __int16 v122 = sel_getName(a2);
      __int16 v123 = 1024;
      int v124 = 66;
      __int16 v125 = 1024;
      LODWORD(v126) = [v7 status];
      _os_log_impl((void *)&_mh_execute_header, v66, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i Failed to get perso request, expecting 0x9000, got 0x%x", buf, 0x28u);
    }

    id v53 = objc_alloc((Class)NSError);
    BOOL v15 = +[NSString stringWithUTF8String:"nfcd"];
    v113[0] = NSLocalizedDescriptionKey;
    BOOL v54 = +[NSString stringWithUTF8String:"Commmand Error"];
    v114[0] = v54;
    v114[1] = &off_10031FB70;
    v113[1] = @"Line";
    v113[2] = @"Method";
    id v55 = [objc_alloc((Class)NSString) initWithFormat:@"%s", sel_getName(a2)];
    v114[2] = v55;
    v113[3] = NSDebugDescriptionErrorKey;
    id v56 = [objc_alloc((Class)NSString) initWithFormat:@"%s:%d", sel_getName(a2), 67];
    v114[3] = v56;
    id v57 = v114;
    char v58 = v113;
LABEL_50:
    long long v69 = +[NSDictionary dictionaryWithObjects:v57 forKeys:v58 count:4];
    long long v70 = v53;
    id v71 = v15;
    uint64_t v72 = 16;
LABEL_51:
    *a3 = [v70 initWithDomain:v71 code:v72 userInfo:v69];

LABEL_52:
    uint64_t v22 = 0;
LABEL_53:
    unint64_t v43 = 3;
    goto LABEL_54;
  }
  int v21 = [v7 response];
  uint64_t v22 = +[NFTLV TLVWithData:v21];

  if (!v22)
  {
    id v74 = objc_alloc((Class)NSError);
    BOOL v15 = +[NSString stringWithUTF8String:"nfcd"];
    v111[0] = NSLocalizedDescriptionKey;
    BOOL v54 = +[NSString stringWithUTF8String:"Unexpected Result"];
    v112[0] = v54;
    v112[1] = &off_10031FB88;
    v111[1] = @"Line";
    v111[2] = @"Method";
    id v55 = [objc_alloc((Class)NSString) initWithFormat:@"%s", sel_getName(a2)];
    v112[2] = v55;
    v111[3] = NSDebugDescriptionErrorKey;
    id v56 = [objc_alloc((Class)NSString) initWithFormat:@"%s:%d", sel_getName(a2), 73];
    v112[3] = v56;
    long long v69 = +[NSDictionary dictionaryWithObjects:v112 forKeys:v111 count:4];
    long long v70 = v74;
    id v71 = v15;
    uint64_t v72 = 13;
    goto LABEL_51;
  }
  if ([v22 tag] != 211)
  {
    dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    uint64_t v75 = NFLogGetLogger();
    if (v75)
    {
      __int16 v76 = (void (*)(uint64_t, const char *, ...))v75;
      int v77 = object_getClass(self);
      BOOL v78 = class_isMetaClass(v77);
      int v79 = object_getClassName(self);
      __int16 v80 = sel_getName(a2);
      id v106 = [v22 tag];
      uint64_t v81 = 45;
      if (v78) {
        uint64_t v81 = 43;
      }
      v76(3, "%c[%{public}s %{public}s]:%i Unexpeted tag 0x%x", v81, v79, v80, 78, v106);
    }
    dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    __int16 v82 = NFSharedLogGetLogger();
    if (os_log_type_enabled(v82, OS_LOG_TYPE_ERROR))
    {
      unsigned int v83 = object_getClass(self);
      if (class_isMetaClass(v83)) {
        int v84 = 43;
      }
      else {
        int v84 = 45;
      }
      *(_DWORD *)buf = 67110146;
      int v118 = v84;
      __int16 v119 = 2082;
      id v120 = object_getClassName(self);
      __int16 v121 = 2082;
      __int16 v122 = sel_getName(a2);
      __int16 v123 = 1024;
      int v124 = 78;
      __int16 v125 = 1024;
      LODWORD(v126) = [v22 tag];
      _os_log_impl((void *)&_mh_execute_header, v82, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i Unexpeted tag 0x%x", buf, 0x28u);
    }

    id v85 = objc_alloc((Class)NSError);
    id v86 = +[NSString stringWithUTF8String:"nfcd"];
    v109[0] = NSLocalizedDescriptionKey;
    NSErrorUserInfoKey v87 = +[NSString stringWithUTF8String:"Unexpected Result"];
    v110[0] = v87;
    v110[1] = &off_10031FBA0;
    v109[1] = @"Line";
    v109[2] = @"Method";
    id v88 = [objc_alloc((Class)NSString) initWithFormat:@"%s", sel_getName(a2)];
    v110[2] = v88;
    v109[3] = NSDebugDescriptionErrorKey;
    id v89 = [objc_alloc((Class)NSString) initWithFormat:@"%s:%d", sel_getName(a2), 79];
    v110[3] = v89;
    id v90 = v110;
    id v91 = v109;
    goto LABEL_77;
  }
  id v23 = [v22 value];
  if (![v23 length])
  {

    goto LABEL_67;
  }
  id v24 = [v22 value];
  id v25 = [v24 bytes];

  if (!v25)
  {
LABEL_67:
    dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    uint64_t v92 = NFLogGetLogger();
    if (v92)
    {
      id v93 = (void (*)(uint64_t, const char *, ...))v92;
      id v94 = object_getClass(self);
      BOOL v95 = class_isMetaClass(v94);
      uint64_t v96 = object_getClassName(self);
      uint64_t v103 = sel_getName(a2);
      uint64_t v97 = 45;
      if (v95) {
        uint64_t v97 = 43;
      }
      v93(3, "%c[%{public}s %{public}s]:%i Unexpeted zero tag length", v97, v96, v103, 83);
    }
    dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    unsigned int v98 = NFSharedLogGetLogger();
    if (os_log_type_enabled(v98, OS_LOG_TYPE_ERROR))
    {
      unsigned int v99 = object_getClass(self);
      if (class_isMetaClass(v99)) {
        int v100 = 43;
      }
      else {
        int v100 = 45;
      }
      *(_DWORD *)buf = 67109890;
      int v118 = v100;
      __int16 v119 = 2082;
      id v120 = object_getClassName(self);
      __int16 v121 = 2082;
      __int16 v122 = sel_getName(a2);
      __int16 v123 = 1024;
      int v124 = 83;
      _os_log_impl((void *)&_mh_execute_header, v98, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i Unexpeted zero tag length", buf, 0x22u);
    }

    id v85 = objc_alloc((Class)NSError);
    id v86 = +[NSString stringWithUTF8String:"nfcd"];
    v107[0] = NSLocalizedDescriptionKey;
    NSErrorUserInfoKey v87 = +[NSString stringWithUTF8String:"Unexpected Result"];
    v108[0] = v87;
    v108[1] = &off_10031FBB8;
    v107[1] = @"Line";
    v107[2] = @"Method";
    id v88 = [objc_alloc((Class)NSString) initWithFormat:@"%s", sel_getName(a2)];
    v108[2] = v88;
    v107[3] = NSDebugDescriptionErrorKey;
    id v89 = [objc_alloc((Class)NSString) initWithFormat:@"%s:%d", sel_getName(a2), 84];
    v108[3] = v89;
    id v90 = v108;
    id v91 = v107;
LABEL_77:
    id v101 = +[NSDictionary dictionaryWithObjects:v90 forKeys:v91 count:4];
    *a3 = [v85 initWithDomain:v86 code:13 userInfo:v101];

    goto LABEL_53;
  }
  dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
  uint64_t v26 = NFLogGetLogger();
  if (v26)
  {
    int v27 = (void (*)(uint64_t, const char *, ...))v26;
    id v28 = object_getClass(self);
    BOOL v29 = class_isMetaClass(v28);
    unsigned int v30 = object_getClassName(self);
    uint64_t v31 = sel_getName(a2);
    id v32 = [v22 value];
    uint64_t v104 = *(unsigned __int8 *)[v32 bytes];
    uint64_t v33 = 45;
    if (v29) {
      uint64_t v33 = 43;
    }
    v27(6, "%c[%{public}s %{public}s]:%i Perso state is %x", v33, v30, v31, 88, v104);
  }
  dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
  id v34 = NFSharedLogGetLogger();
  if (os_log_type_enabled(v34, OS_LOG_TYPE_DEFAULT))
  {
    id v35 = object_getClass(self);
    if (class_isMetaClass(v35)) {
      int v36 = 43;
    }
    else {
      int v36 = 45;
    }
    id v37 = object_getClassName(self);
    uint64_t v38 = sel_getName(a2);
    id v39 = [v22 value];
    int v40 = *(unsigned __int8 *)[v39 bytes];
    *(_DWORD *)buf = 67110146;
    int v118 = v36;
    __int16 v119 = 2082;
    id v120 = v37;
    __int16 v121 = 2082;
    __int16 v122 = v38;
    __int16 v123 = 1024;
    int v124 = 88;
    __int16 v125 = 1024;
    LODWORD(v126) = v40;
    _os_log_impl((void *)&_mh_execute_header, v34, OS_LOG_TYPE_DEFAULT, "%c[%{public}s %{public}s]:%i Perso state is %x", buf, 0x28u);
  }
  id v41 = [v22 value];
  int v42 = *(unsigned __int8 *)[v41 bytes];

  if (v42 == 90)
  {
    unint64_t v43 = 0;
    goto LABEL_54;
  }
  if (v42 == 197)
  {
    unint64_t v43 = 2;
    goto LABEL_54;
  }
  if (v42 != 195) {
    goto LABEL_53;
  }
  unint64_t v43 = 1;
LABEL_54:

  return v43;
}

- (id)_crsGetSharingRequest:(id *)a3 signature:(id *)a4
{
  id v76 = 0;
  id v8 = [(NFSecureElementWrapper *)self sendCommandWithClass:128 instruction:229 p1:0 p2:0 data:0 expectedLength:0 toOS:0 error:&v76];
  id v9 = v76;
  if (!v9)
  {
    if ([v8 status] == 36864)
    {
      id v24 = [v8 response];
      id v25 = [v24 length];

      if ((unint64_t)v25 > 0x41)
      {
        int v68 = [v8 response];
        long long v69 = (char *)[v68 length] - 65;

        long long v70 = [v8 response];
        [v70 subdataWithRange:0, 65];
        *a3 = (id)objc_claimAutoreleasedReturnValue();

        int v21 = [v8 response];
        [v21 subdataWithRange:65, v69];
        id v53 = 0;
        *a4 = (id)objc_claimAutoreleasedReturnValue();
        goto LABEL_39;
      }
      dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
      uint64_t Logger = NFLogGetLogger();
      if (Logger)
      {
        int v27 = (void (*)(uint64_t, const char *, ...))Logger;
        Class = object_getClass(self);
        BOOL isMetaClass = class_isMetaClass(Class);
        ClassName = object_getClassName(self);
        Name = sel_getName(a2);
        id v32 = [v8 response];
        id v74 = [v32 length];
        uint64_t v33 = 45;
        if (isMetaClass) {
          uint64_t v33 = 43;
        }
        v27(6, "%c[%{public}s %{public}s]:%i Invalid length %lu", v33, ClassName, Name, 129, v74);
      }
      dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
      id v34 = NFSharedLogGetLogger();
      if (os_log_type_enabled(v34, OS_LOG_TYPE_DEFAULT))
      {
        id v35 = object_getClass(self);
        if (class_isMetaClass(v35)) {
          int v36 = 43;
        }
        else {
          int v36 = 45;
        }
        id v37 = object_getClassName(self);
        uint64_t v38 = sel_getName(a2);
        id v39 = [v8 response];
        id v40 = [v39 length];
        *(_DWORD *)buf = 67110146;
        int v84 = v36;
        __int16 v85 = 2082;
        id v86 = v37;
        __int16 v87 = 2082;
        id v88 = v38;
        __int16 v89 = 1024;
        int v90 = 129;
        __int16 v91 = 2048;
        id v92 = v40;
        _os_log_impl((void *)&_mh_execute_header, v34, OS_LOG_TYPE_DEFAULT, "%c[%{public}s %{public}s]:%i Invalid length %lu", buf, 0x2Cu);
      }
      id v41 = objc_alloc((Class)NSError);
      int v21 = +[NSString stringWithUTF8String:"nfcd"];
      v77[0] = NSLocalizedDescriptionKey;
      int v42 = +[NSString stringWithUTF8String:"Unexpected Result"];
      v78[0] = v42;
      v78[1] = &off_10031FC00;
      v77[1] = @"Line";
      v77[2] = @"Method";
      id v43 = [objc_alloc((Class)NSString) initWithFormat:@"%s", sel_getName(a2)];
      v78[2] = v43;
      v77[3] = NSDebugDescriptionErrorKey;
      id v44 = [objc_alloc((Class)NSString) initWithFormat:@"%s:%d", sel_getName(a2), 130];
      v78[3] = v44;
      __int16 v45 = +[NSDictionary dictionaryWithObjects:v78 forKeys:v77 count:4];
      id v46 = v41;
      BOOL v47 = v21;
      uint64_t v48 = 13;
    }
    else
    {
      dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
      uint64_t v54 = NFLogGetLogger();
      if (v54)
      {
        id v55 = (void (*)(uint64_t, const char *, ...))v54;
        id v56 = object_getClass(self);
        BOOL v57 = class_isMetaClass(v56);
        char v58 = object_getClassName(self);
        uint64_t v59 = sel_getName(a2);
        uint64_t v75 = [v8 status];
        uint64_t v60 = 45;
        if (v57) {
          uint64_t v60 = 43;
        }
        v55(3, "%c[%{public}s %{public}s]:%i Failed to get sharing request, expecting 0x9000, got 0x%x", v60, v58, v59, 123, v75);
      }
      dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
      id v61 = NFSharedLogGetLogger();
      if (os_log_type_enabled(v61, OS_LOG_TYPE_ERROR))
      {
        BOOL v62 = object_getClass(self);
        if (class_isMetaClass(v62)) {
          int v63 = 43;
        }
        else {
          int v63 = 45;
        }
        id v64 = object_getClassName(self);
        uint64_t v65 = sel_getName(a2);
        unsigned int v66 = [v8 status];
        *(_DWORD *)buf = 67110146;
        int v84 = v63;
        __int16 v85 = 2082;
        id v86 = v64;
        __int16 v87 = 2082;
        id v88 = v65;
        __int16 v89 = 1024;
        int v90 = 123;
        __int16 v91 = 1024;
        LODWORD(v92) = v66;
        _os_log_impl((void *)&_mh_execute_header, v61, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i Failed to get sharing request, expecting 0x9000, got 0x%x", buf, 0x28u);
      }

      id v67 = objc_alloc((Class)NSError);
      int v21 = +[NSString stringWithUTF8String:"nfcd"];
      v79[0] = NSLocalizedDescriptionKey;
      int v42 = +[NSString stringWithUTF8String:"Commmand Error"];
      v80[0] = v42;
      v80[1] = &off_10031FBE8;
      v79[1] = @"Line";
      v79[2] = @"Method";
      id v43 = [objc_alloc((Class)NSString) initWithFormat:@"%s", sel_getName(a2)];
      v80[2] = v43;
      v79[3] = NSDebugDescriptionErrorKey;
      id v44 = [objc_alloc((Class)NSString) initWithFormat:@"%s:%d", sel_getName(a2), 124];
      v80[3] = v44;
      __int16 v45 = +[NSDictionary dictionaryWithObjects:v80 forKeys:v79 count:4];
      id v46 = v67;
      BOOL v47 = v21;
      uint64_t v48 = 16;
    }
    id v53 = [v46 initWithDomain:v47 code:v48 userInfo:v45];

    goto LABEL_39;
  }
  dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
  uint64_t v10 = NFLogGetLogger();
  if (v10)
  {
    id v11 = (void (*)(uint64_t, const char *, ...))v10;
    id v12 = object_getClass(self);
    BOOL v13 = class_isMetaClass(v12);
    uint64_t v72 = object_getClassName(self);
    int v73 = sel_getName(a2);
    uint64_t v14 = 45;
    if (v13) {
      uint64_t v14 = 43;
    }
    v11(3, "%c[%{public}s %{public}s]:%i Failed to get sharing request: %{public}@", v14, v72, v73, 118, v9);
  }
  dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
  BOOL v15 = NFSharedLogGetLogger();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
  {
    id v16 = object_getClass(self);
    if (class_isMetaClass(v16)) {
      int v17 = 43;
    }
    else {
      int v17 = 45;
    }
    __int16 v18 = object_getClassName(self);
    id v19 = sel_getName(a2);
    *(_DWORD *)buf = 67110146;
    int v84 = v17;
    __int16 v85 = 2082;
    id v86 = v18;
    __int16 v87 = 2082;
    id v88 = v19;
    __int16 v89 = 1024;
    int v90 = 118;
    __int16 v91 = 2114;
    id v92 = v9;
    _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i Failed to get sharing request: %{public}@", buf, 0x2Cu);
  }

  id v20 = objc_alloc((Class)NSError);
  int v21 = +[NSString stringWithUTF8String:"nfcd"];
  id v22 = [v9 code];
  v81[0] = NSLocalizedDescriptionKey;
  if ((uint64_t)[v9 code] > 70) {
    uint64_t v23 = 71;
  }
  else {
    uint64_t v23 = (uint64_t)[v9 code];
  }
  uint64_t v49 = +[NSString stringWithUTF8String:off_100307B10[v23]];
  v82[0] = v49;
  v82[1] = v9;
  v81[1] = NSUnderlyingErrorKey;
  v81[2] = @"Line";
  v82[2] = &off_10031FBD0;
  v81[3] = @"Method";
  id v50 = [objc_alloc((Class)NSString) initWithFormat:@"%s", sel_getName(a2)];
  v82[3] = v50;
  v81[4] = NSDebugDescriptionErrorKey;
  id v51 = [objc_alloc((Class)NSString) initWithFormat:@"%s:%d", sel_getName(a2), 119];
  v82[4] = v51;
  int v52 = +[NSDictionary dictionaryWithObjects:v82 forKeys:v81 count:5];
  id v53 = [v20 initWithDomain:v21 code:v22 userInfo:v52];

LABEL_39:

  return v53;
}

- (id)_crsSetSharingResult:(id)a3 signature:(id)a4
{
  id v7 = a4;
  id v8 = a3;
  id v9 = +[NSMutableData data];
  [v9 appendData:v8];

  [v9 appendData:v7];
  id v66 = 0;
  uint64_t v10 = [(NFSecureElementWrapper *)self sendCommandWithClass:128 instruction:230 p1:0 p2:0 data:v9 expectedLength:0 toOS:0 error:&v66];
  id v11 = v66;
  if (v11)
  {
    dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    uint64_t Logger = NFLogGetLogger();
    if (Logger)
    {
      BOOL v13 = (void (*)(uint64_t, const char *, ...))Logger;
      Class = object_getClass(self);
      BOOL isMetaClass = class_isMetaClass(Class);
      ClassName = object_getClassName(self);
      Name = sel_getName(a2);
      uint64_t v16 = 45;
      if (isMetaClass) {
        uint64_t v16 = 43;
      }
      v13(3, "%c[%{public}s %{public}s]:%i Failed to set sharing result: %{public}@", v16, ClassName, Name, 158, v11);
    }
    dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    int v17 = NFSharedLogGetLogger();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
    {
      __int16 v18 = object_getClass(self);
      if (class_isMetaClass(v18)) {
        int v19 = 43;
      }
      else {
        int v19 = 45;
      }
      id v20 = object_getClassName(self);
      int v21 = sel_getName(a2);
      *(_DWORD *)buf = 67110146;
      int v74 = v19;
      __int16 v75 = 2082;
      id v76 = v20;
      __int16 v77 = 2082;
      BOOL v78 = v21;
      __int16 v79 = 1024;
      int v80 = 158;
      __int16 v81 = 2114;
      id v82 = v11;
      _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i Failed to set sharing result: %{public}@", buf, 0x2Cu);
    }

    id v22 = objc_alloc((Class)NSError);
    uint64_t v23 = +[NSString stringWithUTF8String:"nfcd"];
    id v24 = [v11 code];
    v71[0] = NSLocalizedDescriptionKey;
    if ((uint64_t)[v11 code] > 70) {
      uint64_t v25 = 71;
    }
    else {
      uint64_t v25 = (uint64_t)[v11 code];
    }
    int v27 = +[NSString stringWithUTF8String:off_100307B10[v25]];
    v72[0] = v27;
    v72[1] = v11;
    v71[1] = NSUnderlyingErrorKey;
    v71[2] = @"Line";
    v72[2] = &off_10031FC18;
    v71[3] = @"Method";
    id v28 = [objc_alloc((Class)NSString) initWithFormat:@"%s", sel_getName(a2)];
    v72[3] = v28;
    void v71[4] = NSDebugDescriptionErrorKey;
    id v29 = [objc_alloc((Class)NSString) initWithFormat:@"%s:%d", sel_getName(a2), 159];
    v72[4] = v29;
    unsigned int v30 = +[NSDictionary dictionaryWithObjects:v72 forKeys:v71 count:5];
    uint64_t v31 = v22;
    id v32 = v23;
    uint64_t v33 = (uint64_t)v24;
  }
  else
  {
    if (v10)
    {
      if ([v10 status] == 36864)
      {
        id v26 = 0;
        goto LABEL_40;
      }
      dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
      uint64_t v48 = NFLogGetLogger();
      if (v48)
      {
        uint64_t v49 = (void (*)(uint64_t, const char *, ...))v48;
        id v50 = object_getClass(self);
        BOOL v51 = class_isMetaClass(v50);
        int v52 = object_getClassName(self);
        id v53 = sel_getName(a2);
        uint64_t v65 = [v10 status];
        uint64_t v54 = 45;
        if (v51) {
          uint64_t v54 = 43;
        }
        v49(3, "%c[%{public}s %{public}s]:%i Failed to set sharing result, expecting 0x9000, got 0x%x", v54, v52, v53, 166, v65);
      }
      dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
      id v55 = NFSharedLogGetLogger();
      if (os_log_type_enabled(v55, OS_LOG_TYPE_ERROR))
      {
        id v56 = object_getClass(self);
        if (class_isMetaClass(v56)) {
          int v57 = 43;
        }
        else {
          int v57 = 45;
        }
        char v58 = object_getClassName(self);
        uint64_t v59 = sel_getName(a2);
        unsigned int v60 = [v10 status];
        *(_DWORD *)buf = 67110146;
        int v74 = v57;
        __int16 v75 = 2082;
        id v76 = v58;
        __int16 v77 = 2082;
        BOOL v78 = v59;
        __int16 v79 = 1024;
        int v80 = 166;
        __int16 v81 = 1024;
        LODWORD(v82) = v60;
        _os_log_impl((void *)&_mh_execute_header, v55, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i Failed to set sharing result, expecting 0x9000, got 0x%x", buf, 0x28u);
      }

      id v45 = objc_alloc((Class)NSError);
      uint64_t v23 = +[NSString stringWithUTF8String:"nfcd"];
      v67[0] = NSLocalizedDescriptionKey;
      int v27 = +[NSString stringWithUTF8String:"Commmand Error"];
      v68[0] = v27;
      v68[1] = &off_10031FC48;
      v67[1] = @"Line";
      v67[2] = @"Method";
      id v28 = [objc_alloc((Class)NSString) initWithFormat:@"%s", sel_getName(a2)];
      v68[2] = v28;
      v67[3] = NSDebugDescriptionErrorKey;
      id v29 = [objc_alloc((Class)NSString) initWithFormat:@"%s:%d", sel_getName(a2), 167];
      v68[3] = v29;
      id v46 = v68;
      BOOL v47 = v67;
    }
    else
    {
      dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
      uint64_t v34 = NFLogGetLogger();
      if (v34)
      {
        id v35 = (void (*)(uint64_t, const char *, ...))v34;
        int v36 = object_getClass(self);
        BOOL v37 = class_isMetaClass(v36);
        uint64_t v38 = object_getClassName(self);
        id v64 = sel_getName(a2);
        uint64_t v39 = 45;
        if (v37) {
          uint64_t v39 = 43;
        }
        v35(3, "%c[%{public}s %{public}s]:%i Failed to set sharing result, expecting RAPDU", v39, v38, v64, 162);
      }
      dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
      id v40 = NFSharedLogGetLogger();
      if (os_log_type_enabled(v40, OS_LOG_TYPE_ERROR))
      {
        id v41 = object_getClass(self);
        if (class_isMetaClass(v41)) {
          int v42 = 43;
        }
        else {
          int v42 = 45;
        }
        id v43 = object_getClassName(self);
        id v44 = sel_getName(a2);
        *(_DWORD *)buf = 67109890;
        int v74 = v42;
        __int16 v75 = 2082;
        id v76 = v43;
        __int16 v77 = 2082;
        BOOL v78 = v44;
        __int16 v79 = 1024;
        int v80 = 162;
        _os_log_impl((void *)&_mh_execute_header, v40, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i Failed to set sharing result, expecting RAPDU", buf, 0x22u);
      }

      id v45 = objc_alloc((Class)NSError);
      uint64_t v23 = +[NSString stringWithUTF8String:"nfcd"];
      v69[0] = NSLocalizedDescriptionKey;
      int v27 = +[NSString stringWithUTF8String:"Commmand Error"];
      v70[0] = v27;
      v70[1] = &off_10031FC30;
      v69[1] = @"Line";
      v69[2] = @"Method";
      id v28 = [objc_alloc((Class)NSString) initWithFormat:@"%s", sel_getName(a2)];
      v70[2] = v28;
      v69[3] = NSDebugDescriptionErrorKey;
      id v29 = [objc_alloc((Class)NSString) initWithFormat:@"%s:%d", sel_getName(a2), 163];
      v70[3] = v29;
      id v46 = v70;
      BOOL v47 = v69;
    }
    unsigned int v30 = +[NSDictionary dictionaryWithObjects:v46 forKeys:v47 count:4];
    uint64_t v31 = v45;
    id v32 = v23;
    uint64_t v33 = 16;
  }
  id v26 = [v31 initWithDomain:v32 code:v33 userInfo:v30];

LABEL_40:

  return v26;
}

- (id)performSharing
{
  id v31 = 0;
  id v32 = 0;
  id v4 = [(NFSecureElementWrapper *)self _crsGetSharingRequest:&v32 signature:&v31];
  id v5 = v32;
  id v6 = v31;
  id v28 = v6;
  if (v4)
  {
    id v7 = objc_alloc((Class)NSError);
    id v8 = +[NSString stringWithUTF8String:"nfcd"];
    id v9 = [v4 code];
    v37[0] = NSLocalizedDescriptionKey;
    id v10 = v5;
    if ((uint64_t)[v4 code] > 70) {
      uint64_t v11 = 71;
    }
    else {
      uint64_t v11 = (uint64_t)[v4 code];
    }
    int v17 = +[NSString stringWithUTF8String:off_100307B10[v11]];
    v38[0] = v17;
    v38[1] = v4;
    v37[1] = NSUnderlyingErrorKey;
    v37[2] = @"Line";
    v38[2] = &off_10031FC60;
    void v37[3] = @"Method";
    id v18 = [objc_alloc((Class)NSString) initWithFormat:@"%s", sel_getName(a2)];
    v38[3] = v18;
    v37[4] = NSDebugDescriptionErrorKey;
    id v19 = [objc_alloc((Class)NSString) initWithFormat:@"%s:%d", sel_getName(a2), 183];
    v38[4] = v19;
    id v20 = +[NSDictionary dictionaryWithObjects:v38 forKeys:v37 count:5];
    id v21 = [v7 initWithDomain:v8 code:v9 userInfo:v20];
    id v14 = 0;
    id v15 = 0;
  }
  else
  {
    id v12 = v6;
    BOOL v13 = [(NFSecureElementWrapper *)self serialNumberAsData];
    id v29 = 0;
    id v30 = 0;
    id v4 = sub_1002229C4((uint64_t)NFSSEWrapper, v5, v12, v13, &v30, &v29);
    id v14 = v30;
    id v15 = v29;

    if (v4)
    {
      id v27 = objc_alloc((Class)NSError);
      id v8 = +[NSString stringWithUTF8String:"nfcd"];
      id v26 = [v4 code];
      v35[0] = NSLocalizedDescriptionKey;
      id v10 = v5;
      if ((uint64_t)[v4 code] > 70) {
        uint64_t v16 = 71;
      }
      else {
        uint64_t v16 = (uint64_t)[v4 code];
      }
      int v17 = +[NSString stringWithUTF8String:off_100307B10[v16]];
      v36[0] = v17;
      v36[1] = v4;
      v35[1] = NSUnderlyingErrorKey;
      v35[2] = @"Line";
      v36[2] = &off_10031FC78;
      v35[3] = @"Method";
      id v18 = [objc_alloc((Class)NSString) initWithFormat:@"%s", sel_getName(a2)];
      void v36[3] = v18;
      void v35[4] = NSDebugDescriptionErrorKey;
      id v19 = [objc_alloc((Class)NSString) initWithFormat:@"%s:%d", sel_getName(a2), 192];
      v36[4] = v19;
      uint64_t v23 = v36;
      id v24 = v35;
    }
    else
    {
      id v4 = [(NFSecureElementWrapper *)self _crsSetSharingResult:v14 signature:v15];
      if (!v4)
      {
        id v21 = 0;
        goto LABEL_19;
      }
      id v27 = objc_alloc((Class)NSError);
      id v8 = +[NSString stringWithUTF8String:"nfcd"];
      id v26 = [v4 code];
      v33[0] = NSLocalizedDescriptionKey;
      id v10 = v5;
      if ((uint64_t)[v4 code] > 70) {
        uint64_t v22 = 71;
      }
      else {
        uint64_t v22 = (uint64_t)[v4 code];
      }
      int v17 = +[NSString stringWithUTF8String:off_100307B10[v22]];
      v34[0] = v17;
      v34[1] = v4;
      v33[1] = NSUnderlyingErrorKey;
      v33[2] = @"Line";
      v34[2] = &off_10031FC90;
      v33[3] = @"Method";
      id v18 = [objc_alloc((Class)NSString) initWithFormat:@"%s", sel_getName(a2)];
      v34[3] = v18;
      v33[4] = NSDebugDescriptionErrorKey;
      id v19 = [objc_alloc((Class)NSString) initWithFormat:@"%s:%d", sel_getName(a2), 197];
      void v34[4] = v19;
      uint64_t v23 = v34;
      id v24 = v33;
    }
    id v20 = +[NSDictionary dictionaryWithObjects:v23 forKeys:v24 count:5];
    id v21 = [v27 initWithDomain:v8 code:v26 userInfo:v20];
  }

  id v5 = v10;
  id v12 = v28;
LABEL_19:

  return v21;
}

- (id)checkPairing
{
  unsigned int v4 = sub_1001FA3F0(self, 0xFFFFFFFFLL);
  if (v4)
  {
    unsigned int v5 = v4;
    id v6 = objc_alloc((Class)NSError);
    id v7 = +[NSString stringWithUTF8String:"nfcd"];
    uint64_t v8 = v5;
    v16[0] = NSLocalizedDescriptionKey;
    if (v5 >= 0x47) {
      int v9 = 71;
    }
    else {
      int v9 = v5;
    }
    id v10 = +[NSString stringWithUTF8String:off_100307B10[v9]];
    v17[0] = v10;
    v17[1] = &off_10031FCA8;
    v16[1] = @"Line";
    v16[2] = @"Method";
    id v11 = [objc_alloc((Class)NSString) initWithFormat:@"%s", sel_getName(a2)];
    v17[2] = v11;
    v16[3] = NSDebugDescriptionErrorKey;
    id v12 = [objc_alloc((Class)NSString) initWithFormat:@"%s:%d", sel_getName(a2), 216];
    v17[3] = v12;
    BOOL v13 = +[NSDictionary dictionaryWithObjects:v17 forKeys:v16 count:4];
    id v14 = [v6 initWithDomain:v7 code:v8 userInfo:v13];

    [(NFSecureElementWrapper *)self setUnpairedState];
  }
  else
  {
    [(NFSecureElementWrapper *)self storePairedState];
    id v14 = 0;
  }

  return v14;
}

- (id)checkPerBootAuthKeysAreStillPresent
{
  if (![(NFSecureElementWrapper *)self jcopSupportsPerBootAuthKeys])
  {
    dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    uint64_t Logger = NFLogGetLogger();
    if (Logger)
    {
      id v18 = (void (*)(uint64_t, const char *, ...))Logger;
      Class = object_getClass(self);
      BOOL isMetaClass = class_isMetaClass(Class);
      ClassName = object_getClassName(self);
      Name = sel_getName(a2);
      uint64_t v22 = 45;
      if (isMetaClass) {
        uint64_t v22 = 43;
      }
      v18(6, "%c[%{public}s %{public}s]:%i JCOP doesn't support per boot auth keys", v22, ClassName, Name, 228);
    }
    dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    unsigned int v5 = NFSharedLogGetLogger();
    if (!os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_35;
    }
    uint64_t v23 = object_getClass(self);
    if (class_isMetaClass(v23)) {
      int v24 = 43;
    }
    else {
      int v24 = 45;
    }
    *(_DWORD *)buf = 67109890;
    int v64 = v24;
    __int16 v65 = 2082;
    id v66 = object_getClassName(self);
    __int16 v67 = 2082;
    int v68 = sel_getName(a2);
    __int16 v69 = 1024;
    int v70 = 228;
    uint64_t v25 = "%c[%{public}s %{public}s]:%i JCOP doesn't support per boot auth keys";
LABEL_33:
    uint64_t v34 = v5;
    uint32_t v35 = 34;
    goto LABEL_34;
  }
  if (!sub_100222018())
  {
    dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    uint64_t v26 = NFLogGetLogger();
    if (v26)
    {
      id v27 = (void (*)(uint64_t, const char *, ...))v26;
      id v28 = object_getClass(self);
      BOOL v29 = class_isMetaClass(v28);
      id v30 = object_getClassName(self);
      char v58 = sel_getName(a2);
      uint64_t v31 = 45;
      if (v29) {
        uint64_t v31 = 43;
      }
      v27(6, "%c[%{public}s %{public}s]:%i SSE does not support pairing V2", v31, v30, v58, 233);
    }
    dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    unsigned int v5 = NFSharedLogGetLogger();
    if (!os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_35;
    }
    id v32 = object_getClass(self);
    if (class_isMetaClass(v32)) {
      int v33 = 43;
    }
    else {
      int v33 = 45;
    }
    *(_DWORD *)buf = 67109890;
    int v64 = v33;
    __int16 v65 = 2082;
    id v66 = object_getClassName(self);
    __int16 v67 = 2082;
    int v68 = sel_getName(a2);
    __int16 v69 = 1024;
    int v70 = 233;
    uint64_t v25 = "%c[%{public}s %{public}s]:%i SSE does not support pairing V2";
    goto LABEL_33;
  }
  unint64_t v4 = [(NFSecureElementWrapper *)self pairedState];
  if (v4 != 2)
  {
    unint64_t v37 = v4;
    dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    uint64_t v38 = NFLogGetLogger();
    if (v38)
    {
      uint64_t v39 = (void (*)(uint64_t, const char *, ...))v38;
      id v40 = object_getClass(self);
      BOOL v41 = class_isMetaClass(v40);
      id v55 = object_getClassName(self);
      uint64_t v59 = sel_getName(a2);
      uint64_t v42 = 45;
      if (v41) {
        uint64_t v42 = 43;
      }
      v39(6, "%c[%{public}s %{public}s]:%i Pairing state is %lu, not re-negotiating", v42, v55, v59, 239, v37);
    }
    dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    unsigned int v5 = NFSharedLogGetLogger();
    if (!os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_35;
    }
    id v43 = object_getClass(self);
    if (class_isMetaClass(v43)) {
      int v44 = 43;
    }
    else {
      int v44 = 45;
    }
    *(_DWORD *)buf = 67110146;
    int v64 = v44;
    __int16 v65 = 2082;
    id v66 = object_getClassName(self);
    __int16 v67 = 2082;
    int v68 = sel_getName(a2);
    __int16 v69 = 1024;
    int v70 = 239;
    __int16 v71 = 2048;
    unint64_t v72 = v37;
    uint64_t v25 = "%c[%{public}s %{public}s]:%i Pairing state is %lu, not re-negotiating";
    uint64_t v34 = v5;
    uint32_t v35 = 44;
LABEL_34:
    _os_log_impl((void *)&_mh_execute_header, v34, OS_LOG_TYPE_DEFAULT, v25, buf, v35);
LABEL_35:
    id v16 = 0;
    goto LABEL_36;
  }
  unsigned int v5 = [(NFSecureElementWrapper *)self serialNumberAsData];
  int v6 = sub_100222060((uint64_t)NFSSEWrapper, v5);
  dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
  uint64_t v7 = NFLogGetLogger();
  uint64_t v8 = (void (*)(uint64_t, const char *, ...))v7;
  if (v6 == 3)
  {
    if (v7)
    {
      int v9 = object_getClass(self);
      BOOL v10 = class_isMetaClass(v9);
      id v11 = object_getClassName(self);
      id v56 = sel_getName(a2);
      uint64_t v12 = 45;
      if (v10) {
        uint64_t v12 = 43;
      }
      v8(6, "%c[%{public}s %{public}s]:%i sharingState is %hhu", v12, v11, v56, 250, 3);
    }
    dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    BOOL v13 = NFSharedLogGetLogger();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      id v14 = object_getClass(self);
      if (class_isMetaClass(v14)) {
        int v15 = 43;
      }
      else {
        int v15 = 45;
      }
      *(_DWORD *)buf = 67110146;
      int v64 = v15;
      __int16 v65 = 2082;
      id v66 = object_getClassName(self);
      __int16 v67 = 2082;
      int v68 = sel_getName(a2);
      __int16 v69 = 1024;
      int v70 = 250;
      __int16 v71 = 1024;
      LODWORD(v72) = 3;
      _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "%c[%{public}s %{public}s]:%i sharingState is %hhu", buf, 0x28u);
    }
    id v16 = 0;
  }
  else
  {
    if (v7)
    {
      id v45 = object_getClass(self);
      BOOL v46 = class_isMetaClass(v45);
      BOOL v47 = object_getClassName(self);
      unsigned int v60 = sel_getName(a2);
      uint64_t v48 = 45;
      if (v46) {
        uint64_t v48 = 43;
      }
      v8(3, "%c[%{public}s %{public}s]:%i Error : SEP lost it again...", v48, v47, v60, 246);
    }
    dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    uint64_t v49 = NFSharedLogGetLogger();
    if (os_log_type_enabled(v49, OS_LOG_TYPE_ERROR))
    {
      id v50 = object_getClass(self);
      if (class_isMetaClass(v50)) {
        int v51 = 43;
      }
      else {
        int v51 = 45;
      }
      *(_DWORD *)buf = 67109890;
      int v64 = v51;
      __int16 v65 = 2082;
      id v66 = object_getClassName(self);
      __int16 v67 = 2082;
      int v68 = sel_getName(a2);
      __int16 v69 = 1024;
      int v70 = 246;
      _os_log_impl((void *)&_mh_execute_header, v49, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i Error : SEP lost it again...", buf, 0x22u);
    }

    qword_1003476B0 = 0;
    id v52 = objc_alloc((Class)NSError);
    BOOL v13 = +[NSString stringWithUTF8String:"nfcd"];
    NSErrorUserInfoKey v61 = NSLocalizedDescriptionKey;
    id v53 = +[NSString stringWithUTF8String:"Invalid State"];
    BOOL v62 = v53;
    uint64_t v54 = +[NSDictionary dictionaryWithObjects:&v62 forKeys:&v61 count:1];
    id v16 = [v52 initWithDomain:v13 code:12 userInfo:v54];
  }
LABEL_36:

  return v16;
}

- (id)negotiatePerBootAuthKeys
{
  if (qword_1003476B0)
  {
    id v2 = 0;
    goto LABEL_43;
  }
  dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
  uint64_t Logger = NFLogGetLogger();
  if (Logger)
  {
    int v6 = (void (*)(uint64_t, const char *, ...))Logger;
    Class = object_getClass(self);
    BOOL isMetaClass = class_isMetaClass(Class);
    ClassName = object_getClassName(self);
    Name = sel_getName(a2);
    uint64_t v10 = 45;
    if (isMetaClass) {
      uint64_t v10 = 43;
    }
    v6(6, "%c[%{public}s %{public}s]:%i ", v10, ClassName, Name, 266);
  }
  dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
  id v11 = NFSharedLogGetLogger();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v12 = object_getClass(self);
    if (class_isMetaClass(v12)) {
      int v13 = 43;
    }
    else {
      int v13 = 45;
    }
    *(_DWORD *)buf = 67109890;
    *(_DWORD *)id v152 = v13;
    *(_WORD *)&void v152[4] = 2082;
    *(void *)&v152[6] = object_getClassName(self);
    __int16 v153 = 2082;
    v154 = sel_getName(a2);
    __int16 v155 = 1024;
    int v156 = 266;
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "%c[%{public}s %{public}s]:%i ", buf, 0x22u);
  }

  if (![(NFSecureElementWrapper *)self jcopSupportsPerBootAuthKeys]) {
    goto LABEL_27;
  }
  if (!sub_100222018())
  {
    dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    uint64_t v21 = NFLogGetLogger();
    if (v21)
    {
      uint64_t v22 = (void (*)(uint64_t, const char *, ...))v21;
      uint64_t v23 = object_getClass(self);
      BOOL v24 = class_isMetaClass(v23);
      uint64_t v25 = object_getClassName(self);
      id v136 = sel_getName(a2);
      uint64_t v26 = 45;
      if (v24) {
        uint64_t v26 = 43;
      }
      v22(6, "%c[%{public}s %{public}s]:%i V2 pairing not supported on Eos. Forcing entanglement.", v26, v25, v136, 273);
    }
    dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    id v27 = NFSharedLogGetLogger();
    if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
    {
      id v28 = object_getClass(self);
      if (class_isMetaClass(v28)) {
        int v29 = 43;
      }
      else {
        int v29 = 45;
      }
      id v30 = object_getClassName(self);
      uint64_t v31 = sel_getName(a2);
      *(_DWORD *)buf = 67109890;
      *(_DWORD *)id v152 = v29;
      *(_WORD *)&void v152[4] = 2082;
      *(void *)&v152[6] = v30;
      __int16 v153 = 2082;
      v154 = v31;
      __int16 v155 = 1024;
      int v156 = 273;
      _os_log_impl((void *)&_mh_execute_header, v27, OS_LOG_TYPE_DEFAULT, "%c[%{public}s %{public}s]:%i V2 pairing not supported on Eos. Forcing entanglement.", buf, 0x22u);
    }

    +[NFSecureElementWrapper setAuthRandomEntangled];
    goto LABEL_27;
  }
  id v146 = 0;
  id v14 = [(NFSecureElementWrapper *)self selectCRSWithError:&v146];
  id v15 = v146;
  if (v15)
  {
    id v16 = v15;
    id v17 = objc_alloc((Class)NSError);
    id v18 = +[NSString stringWithUTF8String:"nfcd"];
    id v19 = [v16 code];
    v159[0] = NSLocalizedDescriptionKey;
    if ((uint64_t)[v16 code] > 70) {
      uint64_t v20 = 71;
    }
    else {
      uint64_t v20 = (uint64_t)[v16 code];
    }
    int v44 = +[NSString stringWithUTF8String:off_100307B10[v20]];
    v160[0] = v44;
    v160[1] = v16;
    v159[1] = NSUnderlyingErrorKey;
    v159[2] = @"Line";
    v160[2] = &off_10031FCC0;
    v159[3] = @"Method";
    id v45 = [objc_alloc((Class)NSString) initWithFormat:@"%s", sel_getName(a2)];
    v160[3] = v45;
    v159[4] = NSDebugDescriptionErrorKey;
    id v46 = [objc_alloc((Class)NSString) initWithFormat:@"%s:%d", sel_getName(a2), 280];
    v160[4] = v46;
    BOOL v47 = +[NSDictionary dictionaryWithObjects:v160 forKeys:v159 count:5];
    id v2 = [v17 initWithDomain:v18 code:v19 userInfo:v47];

LABEL_41:
LABEL_42:

    goto LABEL_43;
  }
  id v145 = 0;
  unint64_t v32 = [(NFSecureElementWrapper *)self _crsGetPersoState:&v145];
  id v16 = v145;
  dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
  uint64_t v33 = NFLogGetLogger();
  uint64_t v34 = (void (*)(uint64_t, const char *, ...))v33;
  if (v16)
  {
    if (v33)
    {
      uint32_t v35 = object_getClass(self);
      BOOL v36 = class_isMetaClass(v35);
      unint64_t v37 = object_getClassName(self);
      uint64_t v137 = sel_getName(a2);
      uint64_t v38 = 45;
      if (v36) {
        uint64_t v38 = 43;
      }
      v34(6, "%c[%{public}s %{public}s]:%i V2 pairing not supported on Eos. Forcing entanglement.", v38, v37, v137, 286);
    }
    dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    uint64_t v39 = NFSharedLogGetLogger();
    if (os_log_type_enabled(v39, OS_LOG_TYPE_DEFAULT))
    {
      id v40 = object_getClass(self);
      if (class_isMetaClass(v40)) {
        int v41 = 43;
      }
      else {
        int v41 = 45;
      }
      uint64_t v42 = object_getClassName(self);
      id v43 = sel_getName(a2);
      *(_DWORD *)buf = 67109890;
      *(_DWORD *)id v152 = v41;
      *(_WORD *)&void v152[4] = 2082;
      *(void *)&v152[6] = v42;
      __int16 v153 = 2082;
      v154 = v43;
      __int16 v155 = 1024;
      int v156 = 286;
      _os_log_impl((void *)&_mh_execute_header, v39, OS_LOG_TYPE_DEFAULT, "%c[%{public}s %{public}s]:%i V2 pairing not supported on Eos. Forcing entanglement.", buf, 0x22u);
    }

    +[NFSecureElementWrapper setAuthRandomEntangled];
    id v2 = [(NFSecureElementWrapper *)self checkPairing];
    goto LABEL_42;
  }
  if (v33)
  {
    uint64_t v49 = object_getClass(self);
    BOOL v50 = class_isMetaClass(v49);
    uint64_t v131 = object_getClassName(self);
    int v138 = sel_getName(a2);
    uint64_t v51 = 45;
    if (v50) {
      uint64_t v51 = 43;
    }
    v34(6, "%c[%{public}s %{public}s]:%i CRS Perso state is %lu", v51, v131, v138, 290, v32);
  }
  dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
  id v52 = NFSharedLogGetLogger();
  if (os_log_type_enabled(v52, OS_LOG_TYPE_DEFAULT))
  {
    id v53 = object_getClass(self);
    if (class_isMetaClass(v53)) {
      int v54 = 43;
    }
    else {
      int v54 = 45;
    }
    id v55 = object_getClassName(self);
    id v56 = sel_getName(a2);
    *(_DWORD *)buf = 67110146;
    *(_DWORD *)id v152 = v54;
    *(_WORD *)&void v152[4] = 2082;
    *(void *)&v152[6] = v55;
    __int16 v153 = 2082;
    v154 = v56;
    __int16 v155 = 1024;
    int v156 = 290;
    __int16 v157 = 2048;
    unint64_t v158 = v32;
    _os_log_impl((void *)&_mh_execute_header, v52, OS_LOG_TYPE_DEFAULT, "%c[%{public}s %{public}s]:%i CRS Perso state is %lu", buf, 0x2Cu);
  }

  if (v32 - 1 < 2)
  {
    id v16 = [(NFSecureElementWrapper *)self serialNumberAsData];
    uint64_t v62 = sub_100222060((uint64_t)NFSSEWrapper, v16);
    dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    uint64_t v63 = NFLogGetLogger();
    int v64 = (void (*)(uint64_t, const char *, ...))v63;
    if (!v62)
    {
      if (v63)
      {
        uint64_t v96 = object_getClass(self);
        BOOL v97 = class_isMetaClass(v96);
        unsigned int v98 = object_getClassName(self);
        int v142 = sel_getName(a2);
        uint64_t v99 = 45;
        if (v97) {
          uint64_t v99 = 43;
        }
        v64(3, "%c[%{public}s %{public}s]:%i Unknown SSE sharing state", v99, v98, v142, 309);
      }
      dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
      int v100 = NFSharedLogGetLogger();
      if (os_log_type_enabled(v100, OS_LOG_TYPE_ERROR))
      {
        id v101 = object_getClass(self);
        if (class_isMetaClass(v101)) {
          int v102 = 43;
        }
        else {
          int v102 = 45;
        }
        uint64_t v103 = object_getClassName(self);
        uint64_t v104 = sel_getName(a2);
        *(_DWORD *)buf = 67109890;
        *(_DWORD *)id v152 = v102;
        *(_WORD *)&void v152[4] = 2082;
        *(void *)&v152[6] = v103;
        __int16 v153 = 2082;
        v154 = v104;
        __int16 v155 = 1024;
        int v156 = 309;
        _os_log_impl((void *)&_mh_execute_header, v100, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i Unknown SSE sharing state", buf, 0x22u);
      }

      [(NFSecureElementWrapper *)self setUnpairedState];
      id v105 = objc_alloc((Class)NSError);
      id v18 = +[NSString stringWithUTF8String:"nfcd"];
      v147[0] = NSLocalizedDescriptionKey;
      id v106 = +[NSString stringWithUTF8String:"Invalid State"];
      v148[0] = v106;
      v148[1] = &off_10031FCD8;
      v147[1] = @"Line";
      v147[2] = @"Method";
      id v107 = [objc_alloc((Class)NSString) initWithFormat:@"%s", sel_getName(a2)];
      v148[2] = v107;
      v147[3] = NSDebugDescriptionErrorKey;
      id v108 = [objc_alloc((Class)NSString) initWithFormat:@"%s:%d", sel_getName(a2), 311];
      v148[3] = v108;
      id v109 = +[NSDictionary dictionaryWithObjects:v148 forKeys:v147 count:4];
      id v2 = [v105 initWithDomain:v18 code:12 userInfo:v109];

      goto LABEL_41;
    }
    if (v63)
    {
      __int16 v65 = object_getClass(self);
      BOOL v66 = class_isMetaClass(v65);
      id v132 = object_getClassName(self);
      __int16 v139 = sel_getName(a2);
      uint64_t v67 = 45;
      if (v66) {
        uint64_t v67 = 43;
      }
      v64(3, "%c[%{public}s %{public}s]:%i SSE sharing state is %d", v67, v132, v139, 314, v62);
    }
    dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    int v68 = NFSharedLogGetLogger();
    if (os_log_type_enabled(v68, OS_LOG_TYPE_ERROR))
    {
      __int16 v69 = object_getClass(self);
      if (class_isMetaClass(v69)) {
        int v70 = 43;
      }
      else {
        int v70 = 45;
      }
      __int16 v71 = object_getClassName(self);
      unint64_t v72 = sel_getName(a2);
      *(_DWORD *)buf = 67110146;
      *(_DWORD *)id v152 = v70;
      *(_WORD *)&void v152[4] = 2082;
      *(void *)&v152[6] = v71;
      __int16 v153 = 2082;
      v154 = v72;
      __int16 v155 = 1024;
      int v156 = 314;
      __int16 v157 = 1024;
      LODWORD(v158) = v62;
      _os_log_impl((void *)&_mh_execute_header, v68, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i SSE sharing state is %d", buf, 0x28u);
    }

    if (v62 == 1)
    {
      dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
      uint64_t v73 = NFLogGetLogger();
      if (v73)
      {
        int v74 = (void (*)(uint64_t, const char *, ...))v73;
        __int16 v75 = object_getClass(self);
        BOOL v76 = class_isMetaClass(v75);
        __int16 v77 = object_getClassName(self);
        int v140 = sel_getName(a2);
        uint64_t v78 = 45;
        if (v76) {
          uint64_t v78 = 43;
        }
        v74(6, "%c[%{public}s %{public}s]:%i Setting key", v78, v77, v140, 316);
      }
      dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
      __int16 v79 = NFSharedLogGetLogger();
      if (os_log_type_enabled(v79, OS_LOG_TYPE_DEFAULT))
      {
        int v80 = object_getClass(self);
        if (class_isMetaClass(v80)) {
          int v81 = 43;
        }
        else {
          int v81 = 45;
        }
        id v82 = object_getClassName(self);
        unsigned int v83 = sel_getName(a2);
        *(_DWORD *)buf = 67109890;
        *(_DWORD *)id v152 = v81;
        *(_WORD *)&void v152[4] = 2082;
        *(void *)&v152[6] = v82;
        __int16 v153 = 2082;
        v154 = v83;
        __int16 v155 = 1024;
        int v156 = 316;
        _os_log_impl((void *)&_mh_execute_header, v79, OS_LOG_TYPE_DEFAULT, "%c[%{public}s %{public}s]:%i Setting key", buf, 0x22u);
      }

      uint64_t v84 = sub_100222240((uint64_t)NFSSEWrapper, v16);
      if (v84)
      {
        id v2 = (id)v84;
        dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
        uint64_t v85 = NFLogGetLogger();
        if (v85)
        {
          id v86 = (void (*)(uint64_t, const char *, ...))v85;
          __int16 v87 = object_getClass(self);
          BOOL v88 = class_isMetaClass(v87);
          __int16 v133 = object_getClassName(self);
          v141 = sel_getName(a2);
          uint64_t v89 = 45;
          if (v88) {
            uint64_t v89 = 43;
          }
          v86(3, "%c[%{public}s %{public}s]:%i Failed to set SE public key : %{public}@", v89, v133, v141, 320, v2);
        }
        dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
        int v90 = NFSharedLogGetLogger();
        if (!os_log_type_enabled(v90, OS_LOG_TYPE_ERROR)) {
          goto LABEL_124;
        }
        __int16 v91 = object_getClass(self);
        if (class_isMetaClass(v91)) {
          int v92 = 43;
        }
        else {
          int v92 = 45;
        }
        id v93 = object_getClassName(self);
        id v94 = sel_getName(a2);
        *(_DWORD *)buf = 67110146;
        *(_DWORD *)id v152 = v92;
        *(_WORD *)&void v152[4] = 2082;
        *(void *)&v152[6] = v93;
        __int16 v153 = 2082;
        v154 = v94;
        __int16 v155 = 1024;
        int v156 = 320;
        __int16 v157 = 2114;
        unint64_t v158 = (unint64_t)v2;
        BOOL v95 = "%c[%{public}s %{public}s]:%i Failed to set SE public key : %{public}@";
LABEL_123:
        _os_log_impl((void *)&_mh_execute_header, v90, OS_LOG_TYPE_ERROR, v95, buf, 0x2Cu);
LABEL_124:

        [(NFSecureElementWrapper *)self setUnpairedState];
        goto LABEL_42;
      }
      LODWORD(v62) = sub_100222060((uint64_t)NFSSEWrapper, v16);
    }
    if (v62 != 2 && v32 == 2) {
      goto LABEL_125;
    }
    dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    uint64_t v110 = NFLogGetLogger();
    if (v110)
    {
      id v111 = (void (*)(uint64_t, const char *, ...))v110;
      id v112 = object_getClass(self);
      BOOL v113 = class_isMetaClass(v112);
      id v114 = object_getClassName(self);
      unsigned int v143 = sel_getName(a2);
      uint64_t v115 = 45;
      if (v113) {
        uint64_t v115 = 43;
      }
      v111(6, "%c[%{public}s %{public}s]:%i Performing sharing", v115, v114, v143, 329);
    }
    dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    uint64_t v116 = NFSharedLogGetLogger();
    if (os_log_type_enabled(v116, OS_LOG_TYPE_DEFAULT))
    {
      int v117 = object_getClass(self);
      if (class_isMetaClass(v117)) {
        int v118 = 43;
      }
      else {
        int v118 = 45;
      }
      __int16 v119 = object_getClassName(self);
      id v120 = sel_getName(a2);
      *(_DWORD *)buf = 67109890;
      *(_DWORD *)id v152 = v118;
      *(_WORD *)&void v152[4] = 2082;
      *(void *)&v152[6] = v119;
      __int16 v153 = 2082;
      v154 = v120;
      __int16 v155 = 1024;
      int v156 = 329;
      _os_log_impl((void *)&_mh_execute_header, v116, OS_LOG_TYPE_DEFAULT, "%c[%{public}s %{public}s]:%i Performing sharing", buf, 0x22u);
    }

    uint64_t v121 = [(NFSecureElementWrapper *)self performSharing];
    if (!v121)
    {
LABEL_125:
      [(NFSecureElementWrapper *)self storePairedState];
      id v2 = 0;
      goto LABEL_42;
    }
    id v2 = (id)v121;
    dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    uint64_t v122 = NFLogGetLogger();
    if (v122)
    {
      __int16 v123 = (void (*)(uint64_t, const char *, ...))v122;
      int v124 = object_getClass(self);
      BOOL v125 = class_isMetaClass(v124);
      BOOL v134 = object_getClassName(self);
      id v144 = sel_getName(a2);
      uint64_t v126 = 45;
      if (v125) {
        uint64_t v126 = 43;
      }
      v123(3, "%c[%{public}s %{public}s]:%i Perform sharing failed : %{public}@", v126, v134, v144, 332, v2);
    }
    dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    int v90 = NFSharedLogGetLogger();
    if (!os_log_type_enabled(v90, OS_LOG_TYPE_ERROR)) {
      goto LABEL_124;
    }
    id v127 = object_getClass(self);
    if (class_isMetaClass(v127)) {
      int v128 = 43;
    }
    else {
      int v128 = 45;
    }
    unsigned int v129 = object_getClassName(self);
    id v130 = sel_getName(a2);
    *(_DWORD *)buf = 67110146;
    *(_DWORD *)id v152 = v128;
    *(_WORD *)&void v152[4] = 2082;
    *(void *)&v152[6] = v129;
    __int16 v153 = 2082;
    v154 = v130;
    __int16 v155 = 1024;
    int v156 = 332;
    __int16 v157 = 2114;
    unint64_t v158 = (unint64_t)v2;
    BOOL v95 = "%c[%{public}s %{public}s]:%i Perform sharing failed : %{public}@";
    goto LABEL_123;
  }
  if (v32 == 3 || !v32)
  {
LABEL_27:
    id v2 = [(NFSecureElementWrapper *)self checkPairing];
    goto LABEL_43;
  }
  int v57 = NFSharedLogGetLogger();
  if (os_log_type_enabled(v57, OS_LOG_TYPE_FAULT))
  {
    *(_DWORD *)buf = 134217984;
    *(void *)id v152 = v32;
    _os_log_fault_impl((void *)&_mh_execute_header, v57, OS_LOG_TYPE_FAULT, "Unknown crsPersoState %lu", buf, 0xCu);
  }

  id v58 = objc_alloc((Class)NSError);
  uint64_t v59 = +[NSString stringWithUTF8String:"nfcd"];
  NSErrorUserInfoKey v149 = NSLocalizedDescriptionKey;
  unsigned int v60 = +[NSString stringWithUTF8String:"Invalid Parameter"];
  id v150 = v60;
  NSErrorUserInfoKey v61 = +[NSDictionary dictionaryWithObjects:&v150 forKeys:&v149 count:1];
  id v2 = [v58 initWithDomain:v59 code:10 userInfo:v61];

LABEL_43:

  return v2;
}

- (unint64_t)getPairingVersion
{
  id v9 = 0;
  id v3 = [(NFSecureElementWrapper *)self selectCRSWithError:&v9];
  id v4 = v9;
  if (v4)
  {
    unint64_t v5 = 0;
  }
  else
  {
    id v8 = 0;
    unint64_t v6 = [(NFSecureElementWrapper *)self _crsGetPersoState:&v8];
    id v4 = v8;
    if (v6 - 1 >= 2) {
      unint64_t v5 = v6 == 0;
    }
    else {
      unint64_t v5 = 2;
    }
  }

  return v5;
}

- (id)transceive:(id)a3 error:(id *)a4
{
  return [(NFSecureElementWrapper *)self transceiveData:a3 toOS:0 error:a4];
}

@end