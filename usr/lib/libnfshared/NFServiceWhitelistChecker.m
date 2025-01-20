@interface NFServiceWhitelistChecker
- (BOOL)_BOOLValueOfEntitlement:(id)a3 secTask:(__SecTask *)a4;
- (BOOL)_isAIDStringValid:(id)a3;
- (BOOL)allowBackgroundedSession;
- (BOOL)bgTagReadingAssertion;
- (BOOL)cardModeAccess;
- (BOOL)chAssertion;
- (BOOL)dontResetAssertion;
- (BOOL)eCommerceAccess;
- (BOOL)externalReaderAccessAllow;
- (BOOL)hceAccess;
- (BOOL)ignoreAppStateMonitor;
- (BOOL)internalAccess;
- (BOOL)lpemConfigSessionAccess;
- (BOOL)lpmFactoryTest;
- (BOOL)miniNVWriteAccess;
- (BOOL)nfcCardSessionAccess;
- (BOOL)nfcISO15693ReaderAccess;
- (BOOL)nfcNDEFReaderAccess;
- (BOOL)nfcTagReaderAccess;
- (BOOL)nfcTagReaderPACEPollingAllow;
- (BOOL)nfcVASReaderAccess;
- (BOOL)pollingProfileUpdate;
- (BOOL)purpleTrustAccess;
- (BOOL)radioToggle;
- (BOOL)readerInternalAccess;
- (BOOL)remoteAdminAccess;
- (BOOL)seCredentialManagerAccess;
- (BOOL)seLoggingSessionAccess;
- (BOOL)seSessionAccess;
- (BOOL)seshatAccess;
- (BOOL)singleUserAccess;
- (BOOL)surfSessionAccess;
- (BOOL)useUnfilteredApplets;
- (NFServiceWhitelistChecker)initWithConnection:(id)a3;
- (NFServiceWhitelistChecker)initWithConnection:(id)a3 coreNFCConnection:(BOOL)a4;
- (NSOrderedSet)nfcCardSessionAIDPrefixList;
- (NSOrderedSet)trustedISO7816AidList;
- (NSString)applicationIdentifier;
- (NSString)clientName;
- (NSString)readerPurposeString;
- (double)sessionTimeLimit;
- (id)_arrayValueOfEntitlement:(id)a3 secTask:(__SecTask *)a4;
- (id)_createAccessDictionaryFromICCode:(id)a3 serialNumber:(id)a4 maximumFilterStringLength:(unint64_t)a5;
- (id)_stringFromArray:(id)a3;
- (id)_stringFromISO15693AccessFilterList;
- (id)_stringValueOfEntitlement:(id)a3 secTask:(__SecTask *)a4;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)getAppInfoDictionary;
- (unsigned)validateISO15693TagAccessWithManufacturerCode:(unint64_t)a3;
- (unsigned)validateISO15693TagAccessWithManufacturerCode:(unint64_t)a3 serialNumber:(id)a4;
- (unsigned)validateISO15693TagAcesssWithUID:(id)a3;
- (void)_copyValueOfEntitlement:(id)a3 secTask:(__SecTask *)a4;
- (void)_initCardSessionEntitlementsWithSecTask:(__SecTask *)a3;
- (void)_initCoreNFCEntitlements:(id)a3 secTask:(__SecTask *)a4;
- (void)_initISO15693TagSpecifier:(id)a3;
- (void)_initISO7816PermissibleAIDListWithSecTask:(__SecTask *)a3 infoPlist:(id)a4;
- (void)_initTagSpecifier:(id)a3 maximumFilterStringLength:(unint64_t)a4;
- (void)setApplicationIdentifier:(id)a3;
@end

@implementation NFServiceWhitelistChecker

- (NSString)clientName
{
  return self->_clientName;
}

- (BOOL)internalAccess
{
  return self->_internalAccess;
}

- (NFServiceWhitelistChecker)initWithConnection:(id)a3 coreNFCConnection:(BOOL)a4
{
  BOOL v4 = a4;
  uint64_t v64 = *MEMORY[0x1E4F143B8];
  v7 = (__CFString *)a3;
  v52.receiver = self;
  v52.super_class = (Class)NFServiceWhitelistChecker;
  v8 = [(NFServiceWhitelistChecker *)&v52 init];
  if (!v8) {
    goto LABEL_37;
  }
  int v9 = [(__CFString *)v7 processIdentifier];
  v8->_clientProcessIdentifier = v9;
  memset(buffer, 0, 255);
  proc_name(v9, buffer, 0xFEu);
  uint64_t v10 = [[NSString alloc] initWithUTF8String:buffer];
  clientName = v8->_clientName;
  v8->_clientName = (NSString *)v10;

  uint64_t v12 = objc_opt_new();
  iso15693TagAccessFilters = v8->_iso15693TagAccessFilters;
  v8->_iso15693TagAccessFilters = (NSMutableArray *)v12;

  uint64_t v14 = objc_opt_new();
  trustedISO7816AidList = v8->_trustedISO7816AidList;
  v8->_trustedISO7816AidList = (NSMutableOrderedSet *)v14;

  CFAllocatorRef v16 = (const __CFAllocator *)*MEMORY[0x1E4F1CF80];
  if (v7) {
    [(__CFString *)v7 auditToken];
  }
  else {
    memset(&token, 0, sizeof(token));
  }
  SecTaskRef v17 = SecTaskCreateWithAuditToken(v16, &token);
  if (v17)
  {
    SecTaskRef v18 = v17;
    v8->_internalAccess = [(NFServiceWhitelistChecker *)v8 _BOOLValueOfEntitlement:@"com.apple.nfcd.hwmanager" secTask:v17];
    v8->_seshatAccess = [(NFServiceWhitelistChecker *)v8 _BOOLValueOfEntitlement:@"com.apple.nfcd.seshat" secTask:v18];
    v8->_miniNVWriteAccess = [(NFServiceWhitelistChecker *)v8 _BOOLValueOfEntitlement:@"com.apple.nfcd.mininv.write" secTask:v18];
    v8->_lpmFactoryTest = [(NFServiceWhitelistChecker *)v8 _BOOLValueOfEntitlement:@"com.apple.nfcd.lpm.factorytest" secTask:v18];
    v8->_remoteAdminAccess = [(NFServiceWhitelistChecker *)v8 _BOOLValueOfEntitlement:@"com.apple.seld.tsmmanager" secTask:v18];
    BOOL v19 = [(NFServiceWhitelistChecker *)v8 _BOOLValueOfEntitlement:@"com.apple.UIKit.vends-view-services" secTask:v18];
    v8->_allowBackgroundedSession = [(NFServiceWhitelistChecker *)v8 _BOOLValueOfEntitlement:@"com.apple.internal.nfc.allow.backgrounded.session" secTask:v18]&& v19;
    v8->_ignoreAppStateMonitor = [(NFServiceWhitelistChecker *)v8 _BOOLValueOfEntitlement:@"com.apple.internal.nfc.ignore.appstate" secTask:v18];
    v8->_singleUserAccess = [(NFServiceWhitelistChecker *)v8 _BOOLValueOfEntitlement:@"com.apple.nfcd.singleUser" secTask:v18];
    v8->_purpleTrustAccess = [(NFServiceWhitelistChecker *)v8 _BOOLValueOfEntitlement:@"com.apple.nfcd.session.trust" secTask:v18];
    v8->_surfSessionAccess = [(NFServiceWhitelistChecker *)v8 _BOOLValueOfEntitlement:@"com.apple.nfcd.session.peerpayment" secTask:v18];
    v8->_eCommerceAccess = [(NFServiceWhitelistChecker *)v8 _BOOLValueOfEntitlement:@"com.apple.nfcd.session.ecommerce" secTask:v18];
    v8->_seSessionAccess = [(NFServiceWhitelistChecker *)v8 _BOOLValueOfEntitlement:@"com.apple.nfcd.session.se" secTask:v18];
    v8->_seLoggingSessionAccess = [(NFServiceWhitelistChecker *)v8 _BOOLValueOfEntitlement:@"com.apple.nfcd.session.selogging" secTask:v18];
    v8->_lpemConfigSessionAccess = [(NFServiceWhitelistChecker *)v8 _BOOLValueOfEntitlement:@"com.apple.nfcd.session.lpemConfig" secTask:v18];
    v8->_readerInternalAccess = [(NFServiceWhitelistChecker *)v8 _BOOLValueOfEntitlement:@"com.apple.nfcd.session.reader.internal" secTask:v18];
    v8->_cardModeAccess = [(NFServiceWhitelistChecker *)v8 _BOOLValueOfEntitlement:@"com.apple.nfcd.session.fieldOperations" secTask:v18];
    v8->_hceAccess = [(NFServiceWhitelistChecker *)v8 _BOOLValueOfEntitlement:@"com.apple.nfcd.hce" secTask:v18];
    v8->_radioToggle = [(NFServiceWhitelistChecker *)v8 _BOOLValueOfEntitlement:@"com.apple.nfcd.radio.powertoggle" secTask:v18];
    v8->_dontResetAssertion = [(NFServiceWhitelistChecker *)v8 _BOOLValueOfEntitlement:@"com.apple.nfcd.assertion.dontreset" secTask:v18];
    v8->_pollingProfileUpdate = [(NFServiceWhitelistChecker *)v8 _BOOLValueOfEntitlement:@"com.apple.nfcd.session.reader.internal.update.polling.profile" secTask:v18];
    v8->_bgTagReadingAssertion = [(NFServiceWhitelistChecker *)v8 _BOOLValueOfEntitlement:@"com.apple.nfcd.assertion.tagreading" secTask:v18];
    v8->_chAssertion = [(NFServiceWhitelistChecker *)v8 _BOOLValueOfEntitlement:@"com.apple.nfcd.assertion.handover" secTask:v18];
    if (v4) {
      [(NFServiceWhitelistChecker *)v8 _initCoreNFCEntitlements:v7 secTask:v18];
    }
    v8->_useUnfilteredApplets = [(NFServiceWhitelistChecker *)v8 _BOOLValueOfEntitlement:@"com.apple.internal.nfc.use.unfiltered.applets" secTask:v18];
    v20 = [(NFServiceWhitelistChecker *)v8 _stringValueOfEntitlement:@"application-identifier" secTask:v18];
    if (v20)
    {
      [(NFServiceWhitelistChecker *)v8 setApplicationIdentifier:v20];
LABEL_36:
      v8->_seCredentialManagerAccess = [(NFServiceWhitelistChecker *)v8 _BOOLValueOfEntitlement:@"com.apple.nfcd.session.credential.manager" secTask:v18];
      CFRelease(v18);

LABEL_37:
      v33 = v8;
      goto LABEL_38;
    }
    v34 = kNFLOG_DISPATCH_SPECIFIC_KEY;
    specific = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    if ((unint64_t)specific < 4)
    {
      v36 = (void (*)(uint64_t, const char *, ...))*(&_NFLogCustomLoggers + (void)specific);
      if (v36)
      {
        Class = object_getClass(v8);
        BOOL isMetaClass = class_isMetaClass(Class);
        ClassName = object_getClassName(v8);
        Name = sel_getName(a2);
        uint64_t v39 = 45;
        if (isMetaClass) {
          uint64_t v39 = 43;
        }
        v36(6, "%c[%{public}s %{public}s]:%i Missing or invalid entitlement %{public}@ to be of type <string>, ignoring", v39, ClassName, Name, 353, @"application-identifier");
        v34 = kNFLOG_DISPATCH_SPECIFIC_KEY;
      }
      v40 = dispatch_get_specific(v34);
      if (NFSharedLogInitialize_onceToken != -1) {
        dispatch_once(&NFSharedLogInitialize_onceToken, &__block_literal_global_3);
      }
      v41 = (id)_NFSharedLogClient[(void)v40];
      if (os_log_type_enabled(v41, OS_LOG_TYPE_DEFAULT))
      {
        v42 = object_getClass(v8);
        if (class_isMetaClass(v42)) {
          int v43 = 43;
        }
        else {
          int v43 = 45;
        }
        v44 = object_getClassName(v8);
        v45 = sel_getName(a2);
        *(_DWORD *)buf = 67110146;
        int v54 = v43;
        __int16 v55 = 2082;
        v56 = v44;
        __int16 v57 = 2082;
        v58 = v45;
        __int16 v59 = 1024;
        int v60 = 353;
        __int16 v61 = 2114;
        v62 = @"application-identifier";
        _os_log_impl(&dword_1CA51A000, v41, OS_LOG_TYPE_DEFAULT, "%c[%{public}s %{public}s]:%i Missing or invalid entitlement %{public}@ to be of type <string>, ignoring", buf, 0x2Cu);
      }

      goto LABEL_36;
    }
LABEL_39:
    __assert_rtn("NFLogGetLogger", "NFSharedLog.c", 216, "category < NFLogCategoryMax");
  }
  v21 = kNFLOG_DISPATCH_SPECIFIC_KEY;
  v22 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
  if ((unint64_t)v22 >= 4) {
    goto LABEL_39;
  }
  v23 = (void (*)(uint64_t, const char *, ...))*(&_NFLogCustomLoggers + (void)v22);
  if (v23)
  {
    v24 = object_getClass(v8);
    BOOL v25 = class_isMetaClass(v24);
    v47 = object_getClassName(v8);
    v49 = sel_getName(a2);
    uint64_t v26 = 45;
    if (v25) {
      uint64_t v26 = 43;
    }
    v23(3, "%c[%{public}s %{public}s]:%i Cannot create SecTaskRef with XPC Connection: %{public}@", v26, v47, v49, 314, v7);
    v21 = kNFLOG_DISPATCH_SPECIFIC_KEY;
  }
  v27 = dispatch_get_specific(v21);
  if (NFSharedLogInitialize_onceToken != -1) {
    dispatch_once(&NFSharedLogInitialize_onceToken, &__block_literal_global_3);
  }
  v28 = (id)_NFSharedLogClient[(void)v27];
  if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
  {
    v29 = object_getClass(v8);
    if (class_isMetaClass(v29)) {
      int v30 = 43;
    }
    else {
      int v30 = 45;
    }
    v31 = object_getClassName(v8);
    v32 = sel_getName(a2);
    *(_DWORD *)buf = 67110146;
    int v54 = v30;
    __int16 v55 = 2082;
    v56 = v31;
    __int16 v57 = 2082;
    v58 = v32;
    __int16 v59 = 1024;
    int v60 = 314;
    __int16 v61 = 2114;
    v62 = v7;
    _os_log_impl(&dword_1CA51A000, v28, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i Cannot create SecTaskRef with XPC Connection: %{public}@", buf, 0x2Cu);
  }

  v33 = 0;
LABEL_38:

  return v33;
}

- (BOOL)_BOOLValueOfEntitlement:(id)a3 secTask:(__SecTask *)a4
{
  CFBooleanRef v4 = [(NFServiceWhitelistChecker *)self _copyValueOfEntitlement:a3 secTask:a4];
  if (!v4) {
    return 0;
  }
  CFBooleanRef v5 = v4;
  CFTypeID v6 = CFGetTypeID(v4);
  BOOL v7 = v6 == CFBooleanGetTypeID() && CFBooleanGetValue(v5) != 0;
  CFRelease(v5);
  return v7;
}

- (void)_copyValueOfEntitlement:(id)a3 secTask:(__SecTask *)a4
{
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  CFErrorRef error = 0;
  CFTypeRef v6 = SecTaskCopyValueForEntitlement(a4, (CFStringRef)a3, &error);
  if (error)
  {
    BOOL v7 = kNFLOG_DISPATCH_SPECIFIC_KEY;
    specific = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    if ((unint64_t)specific >= 4) {
      __assert_rtn("NFLogGetLogger", "NFSharedLog.c", 216, "category < NFLogCategoryMax");
    }
    int v9 = (void (*)(uint64_t, const char *, ...))*(&_NFLogCustomLoggers + (void)specific);
    if (v9)
    {
      Class = object_getClass(self);
      BOOL isMetaClass = class_isMetaClass(Class);
      ClassName = object_getClassName(self);
      Name = sel_getName(a2);
      uint64_t v14 = 45;
      if (isMetaClass) {
        uint64_t v14 = 43;
      }
      v9(3, "%c[%{public}s %{public}s]:%i Failed to get entitlements: %{public}@", v14, ClassName, Name, 65, error);
      BOOL v7 = kNFLOG_DISPATCH_SPECIFIC_KEY;
    }
    v15 = dispatch_get_specific(v7);
    if (NFSharedLogInitialize_onceToken != -1) {
      dispatch_once(&NFSharedLogInitialize_onceToken, &__block_literal_global_3);
    }
    CFAllocatorRef v16 = (id)_NFSharedLogClient[(void)v15];
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    {
      SecTaskRef v17 = object_getClass(self);
      if (class_isMetaClass(v17)) {
        int v18 = 43;
      }
      else {
        int v18 = 45;
      }
      BOOL v19 = object_getClassName(self);
      v20 = sel_getName(a2);
      *(_DWORD *)buf = 67110146;
      int v24 = v18;
      __int16 v25 = 2082;
      uint64_t v26 = v19;
      __int16 v27 = 2082;
      v28 = v20;
      __int16 v29 = 1024;
      int v30 = 65;
      __int16 v31 = 2114;
      CFErrorRef v32 = error;
      _os_log_impl(&dword_1CA51A000, v16, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i Failed to get entitlements: %{public}@", buf, 0x2Cu);
    }

    CFRelease(error);
  }
  return (void *)v6;
}

- (void)setApplicationIdentifier:(id)a3
{
}

- (id)_stringValueOfEntitlement:(id)a3 secTask:(__SecTask *)a4
{
  CFBooleanRef v4 = [(NFServiceWhitelistChecker *)self _copyValueOfEntitlement:a3 secTask:a4];
  CFBooleanRef v5 = v4;
  if (v4)
  {
    CFTypeID v6 = CFGetTypeID(v4);
    if (v6 != CFStringGetTypeID())
    {
      CFRelease(v5);
      CFBooleanRef v5 = 0;
    }
  }

  return v5;
}

- (BOOL)chAssertion
{
  return self->_chAssertion;
}

- (id)_arrayValueOfEntitlement:(id)a3 secTask:(__SecTask *)a4
{
  CFBooleanRef v4 = [(NFServiceWhitelistChecker *)self _copyValueOfEntitlement:a3 secTask:a4];
  CFBooleanRef v5 = v4;
  if (v4)
  {
    CFTypeID v6 = CFGetTypeID(v4);
    if (v6 != CFArrayGetTypeID())
    {
      CFRelease(v5);
      CFBooleanRef v5 = 0;
    }
  }

  return v5;
}

- (id)_createAccessDictionaryFromICCode:(id)a3 serialNumber:(id)a4 maximumFilterStringLength:(unint64_t)a5
{
  v27[2] = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  int v9 = objc_opt_new();
  uint64_t v10 = [MEMORY[0x1E4F28B88] characterSetWithCharactersInString:@"0123456789abcdefABCDEF*"];
  if ((unint64_t)[v7 length] <= 2)
  {
    unsigned int v25 = 0;
    v11 = [MEMORY[0x1E4F28FE8] scannerWithString:v7];
    int v12 = [v11 scanHexInt:&v25];

    if (v12)
    {
      v13 = [MEMORY[0x1E4F28FE8] scannerWithString:v8];
      id v24 = 0;
      [v13 scanCharactersFromSet:v10 intoString:&v24];
      id v14 = v24;

      if ([v14 length] <= a5)
      {
        int v15 = [v14 hasPrefix:@"*"];
        int v16 = [v14 hasSuffix:@"*"];
        int v17 = v16;
        if (!v15 || (v16 & 1) == 0)
        {
          if ((v15 | v16) == 1)
          {
            int v18 = [MEMORY[0x1E4F28B88] characterSetWithCharactersInString:@"*"];
            BOOL v19 = [v14 stringByTrimmingCharactersInSet:v18];

            if (v15)
            {
              uint64_t v20 = [[NSString alloc] initWithFormat:@"*%@", v19];

              BOOL v19 = (void *)v20;
            }
            if (v17)
            {
              id v14 = (id)[[NSString alloc] initWithFormat:@"%@*", v19];
            }
            else
            {
              id v14 = v19;
            }
          }
          v26[0] = @"TagManufacturerCode";
          v21 = [NSNumber numberWithUnsignedInt:v25];
          v26[1] = @"TagSerialNumber";
          v27[0] = v21;
          v27[1] = v14;
          v22 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v27 forKeys:v26 count:2];
          [v9 addEntriesFromDictionary:v22];
        }
      }
    }
  }

  return v9;
}

- (void)_initISO15693TagSpecifier:(id)a3
{
}

- (void)_initTagSpecifier:(id)a3 maximumFilterStringLength:(unint64_t)a4
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v22 = v6;
    long long v23 = 0u;
    long long v24 = 0u;
    long long v25 = 0u;
    long long v26 = 0u;
    id v7 = v6;
    uint64_t v8 = [v7 countByEnumeratingWithState:&v23 objects:v27 count:16];
    if (!v8) {
      goto LABEL_23;
    }
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v24;
    while (1)
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v24 != v10) {
          objc_enumerationMutation(v7);
        }
        int v12 = *(void **)(*((void *)&v23 + 1) + 8 * i);
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          v13 = [v12 NF_stringForKey:@"TagManufacturerCode"];
          id v14 = [v12 NF_stringForKey:@"TagSerialNumber"];
          int v15 = v14;
          if (v13) {
            BOOL v16 = v14 == 0;
          }
          else {
            BOOL v16 = 1;
          }
          if (v16)
          {

            BOOL v19 = 0;
          }
          else
          {
            BOOL v19 = [objc_alloc(MEMORY[0x1E4F1C978]) initWithObjects:v13, v14, 0];

LABEL_18:
            uint64_t v20 = [v19 objectAtIndexedSubscript:0];
            v21 = [v19 objectAtIndexedSubscript:1];
            v13 = [(NFServiceWhitelistChecker *)self _createAccessDictionaryFromICCode:v20 serialNumber:v21 maximumFilterStringLength:a4];

            if ([v13 count]) {
              [(NSMutableArray *)self->_iso15693TagAccessFilters addObject:v13];
            }
          }

          goto LABEL_21;
        }
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {
          BOOL v19 = 0;
          goto LABEL_18;
        }
        int v17 = [MEMORY[0x1E4F28B88] whitespaceAndNewlineCharacterSet];
        int v18 = [v12 stringByTrimmingCharactersInSet:v17];
        BOOL v19 = [v18 componentsSeparatedByString:@":"];

        if ([v19 count] == 2) {
          goto LABEL_18;
        }
LABEL_21:
      }
      uint64_t v9 = [v7 countByEnumeratingWithState:&v23 objects:v27 count:16];
      if (!v9)
      {
LABEL_23:

        id v6 = v22;
        break;
      }
    }
  }
}

- (BOOL)_isAIDStringValid:(id)a3
{
  uint64_t v57 = *MEMORY[0x1E4F143B8];
  CFBooleanRef v5 = (void *)MEMORY[0x1E4F28B88];
  id v6 = a3;
  id v7 = [v5 characterSetWithCharactersInString:@"0123456789ABCDEF"];
  uint64_t v8 = [v6 uppercaseString];

  if ((unint64_t)[v8 length] <= 9)
  {
    uint64_t v9 = kNFLOG_DISPATCH_SPECIFIC_KEY;
    unint64_t specific = (unint64_t)dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    if (specific < 4)
    {
      v11 = (void (*)(uint64_t, const char *, ...))_NFLogCustomLoggers[specific];
      if (v11)
      {
        Class = object_getClass(self);
        BOOL isMetaClass = class_isMetaClass(Class);
        ClassName = object_getClassName(self);
        Name = sel_getName(a2);
        uint64_t v14 = 45;
        if (isMetaClass) {
          uint64_t v14 = 43;
        }
        v11(5, "%c[%{public}s %{public}s]:%i Identifier string does not meet the minimum required length, %{public}@", v14, ClassName, Name, 195, v8);
        uint64_t v9 = kNFLOG_DISPATCH_SPECIFIC_KEY;
      }
      int v15 = dispatch_get_specific(v9);
      if (NFSharedLogInitialize_onceToken != -1) {
        dispatch_once(&NFSharedLogInitialize_onceToken, &__block_literal_global_3);
      }
      BOOL v16 = (id)_NFSharedLogClient[(void)v15];
      if (!os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT)) {
        goto LABEL_46;
      }
      int v17 = object_getClass(self);
      if (class_isMetaClass(v17)) {
        int v18 = 43;
      }
      else {
        int v18 = 45;
      }
      *(_DWORD *)buf = 67110146;
      int v48 = v18;
      __int16 v49 = 2082;
      v50 = object_getClassName(self);
      __int16 v51 = 2082;
      objc_super v52 = sel_getName(a2);
      __int16 v53 = 1024;
      int v54 = 195;
      __int16 v55 = 2114;
      v56 = v8;
      BOOL v19 = "%c[%{public}s %{public}s]:%i Identifier string does not meet the minimum required length, %{public}@";
LABEL_45:
      _os_log_impl(&dword_1CA51A000, v16, OS_LOG_TYPE_DEFAULT, v19, buf, 0x2Cu);
LABEL_46:

      char v30 = 0;
      goto LABEL_47;
    }
    goto LABEL_49;
  }
  if ((unint64_t)[v8 length] >= 0x21)
  {
    uint64_t v20 = kNFLOG_DISPATCH_SPECIFIC_KEY;
    unint64_t v21 = (unint64_t)dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    if (v21 < 4)
    {
      id v22 = (void (*)(uint64_t, const char *, ...))_NFLogCustomLoggers[v21];
      if (v22)
      {
        long long v23 = object_getClass(self);
        BOOL v24 = class_isMetaClass(v23);
        v42 = object_getClassName(self);
        v45 = sel_getName(a2);
        uint64_t v25 = 45;
        if (v24) {
          uint64_t v25 = 43;
        }
        v22(5, "%c[%{public}s %{public}s]:%i Identifier string exceeds the maximum length, %{public}@", v25, v42, v45, 198, v8);
        uint64_t v20 = kNFLOG_DISPATCH_SPECIFIC_KEY;
      }
      long long v26 = dispatch_get_specific(v20);
      if (NFSharedLogInitialize_onceToken != -1) {
        dispatch_once(&NFSharedLogInitialize_onceToken, &__block_literal_global_3);
      }
      BOOL v16 = (id)_NFSharedLogClient[(void)v26];
      if (!os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT)) {
        goto LABEL_46;
      }
      __int16 v27 = object_getClass(self);
      if (class_isMetaClass(v27)) {
        int v28 = 43;
      }
      else {
        int v28 = 45;
      }
      *(_DWORD *)buf = 67110146;
      int v48 = v28;
      __int16 v49 = 2082;
      v50 = object_getClassName(self);
      __int16 v51 = 2082;
      objc_super v52 = sel_getName(a2);
      __int16 v53 = 1024;
      int v54 = 198;
      __int16 v55 = 2114;
      v56 = v8;
      BOOL v19 = "%c[%{public}s %{public}s]:%i Identifier string exceeds the maximum length, %{public}@";
      goto LABEL_45;
    }
    goto LABEL_49;
  }
  if ([v8 length])
  {
    __int16 v31 = kNFLOG_DISPATCH_SPECIFIC_KEY;
    unint64_t v32 = (unint64_t)dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    if (v32 < 4)
    {
      uint64_t v33 = (void (*)(uint64_t, const char *, ...))_NFLogCustomLoggers[v32];
      if (v33)
      {
        v34 = object_getClass(self);
        BOOL v35 = class_isMetaClass(v34);
        int v43 = object_getClassName(self);
        v46 = sel_getName(a2);
        uint64_t v36 = 45;
        if (v35) {
          uint64_t v36 = 43;
        }
        v33(5, "%c[%{public}s %{public}s]:%i Invalid AID entry: %{public}@", v36, v43, v46, 201, v8);
        __int16 v31 = kNFLOG_DISPATCH_SPECIFIC_KEY;
      }
      v37 = dispatch_get_specific(v31);
      if (NFSharedLogInitialize_onceToken != -1) {
        dispatch_once(&NFSharedLogInitialize_onceToken, &__block_literal_global_3);
      }
      BOOL v16 = (id)_NFSharedLogClient[(void)v37];
      if (!os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT)) {
        goto LABEL_46;
      }
      v38 = object_getClass(self);
      if (class_isMetaClass(v38)) {
        int v39 = 43;
      }
      else {
        int v39 = 45;
      }
      *(_DWORD *)buf = 67110146;
      int v48 = v39;
      __int16 v49 = 2082;
      v50 = object_getClassName(self);
      __int16 v51 = 2082;
      objc_super v52 = sel_getName(a2);
      __int16 v53 = 1024;
      int v54 = 201;
      __int16 v55 = 2114;
      v56 = v8;
      BOOL v19 = "%c[%{public}s %{public}s]:%i Invalid AID entry: %{public}@";
      goto LABEL_45;
    }
LABEL_49:
    __assert_rtn("NFLogGetLogger", "NFSharedLog.c", 216, "category < NFLogCategoryMax");
  }
  if ([v8 length])
  {
    unint64_t v29 = 0;
    do
    {
      char v30 = [v7 characterIsMember:[v8 characterAtIndex:v29]];
      if ((v30 & 1) == 0) {
        break;
      }
      ++v29;
    }
    while (v29 < [v8 length]);
  }
  else
  {
    char v30 = 1;
  }
LABEL_47:

  return v30;
}

- (void)_initCoreNFCEntitlements:(id)a3 secTask:(__SecTask *)a4
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  uint64_t v14 = [(NFServiceWhitelistChecker *)self getAppInfoDictionary];
  CFBooleanRef v5 = [v14 NF_stringForKey:@"NFCReaderUsageDescription"];
  if ([v5 length]) {
    objc_storeStrong((id *)&self->_readerPurposeString, v5);
  }
  v13 = v5;
  id v6 = [(NFServiceWhitelistChecker *)self _arrayValueOfEntitlement:@"com.apple.developer.nfc.readersession.formats" secTask:a4];
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  uint64_t v7 = [v6 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v17;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v17 != v9) {
          objc_enumerationMutation(v6);
        }
        v11 = *(void **)(*((void *)&v16 + 1) + 8 * i);
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          if ([v11 isEqualToString:@"NDEF"])
          {
            self->_ndefReaderAccess = 1;
          }
          else if ([v11 isEqualToString:@"ISO15693"])
          {
            int v12 = [(NFServiceWhitelistChecker *)self _arrayValueOfEntitlement:@"com.apple.developer.nfc.readersession.iso15693.tag-identifiers" secTask:a4];
            [(NFServiceWhitelistChecker *)self _initISO15693TagSpecifier:v12];
            self->_iso15693ReaderAccess = 1;
          }
          else if ([v11 isEqualToString:@"VAS"])
          {
            self->_vasReaderAccess = 1;
          }
          else if ([v11 isEqualToString:@"TAG"])
          {
            *(_WORD *)&self->_ndefReaderAccess = 257;
          }
          else if ([v11 isEqualToString:@"PACE"])
          {
            self->_tagReaderAccess = 1;
            self->_nfcTagReaderPACEPollingAllow = 1;
          }
        }
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v16 objects:v20 count:16];
    }
    while (v8);
  }
  [(NFServiceWhitelistChecker *)self _initISO7816PermissibleAIDListWithSecTask:a4 infoPlist:v14];
  [(NFServiceWhitelistChecker *)self _initCardSessionEntitlementsWithSecTask:a4];
}

- (void)_initISO7816PermissibleAIDListWithSecTask:(__SecTask *)a3 infoPlist:(id)a4
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  CFBooleanRef v5 = [(NFServiceWhitelistChecker *)self _arrayValueOfEntitlement:@"com.apple.developer.nfc.readersession.iso7816.select-identifiers.trusted" secTask:a3];
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  uint64_t v6 = [v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v13;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v13 != v8) {
          objc_enumerationMutation(v5);
        }
        uint64_t v10 = *(void *)(*((void *)&v12 + 1) + 8 * v9);
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0
          && [(NFServiceWhitelistChecker *)self _isAIDStringValid:v10])
        {
          v11 = [MEMORY[0x1E4F1C9B8] NF_dataWithHexString:v10];
          if ([v11 length] && (unint64_t)objc_msgSend(v11, "length") <= 0x10) {
            [(NSMutableOrderedSet *)self->_trustedISO7816AidList addObject:v11];
          }
        }
        ++v9;
      }
      while (v7 != v9);
      uint64_t v7 = [v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v7);
  }
}

- (void)_initCardSessionEntitlementsWithSecTask:(__SecTask *)a3
{
  uint64_t v45 = *MEMORY[0x1E4F143B8];
  self->_nfcCardSessionAccess = [(NFServiceWhitelistChecker *)self _BOOLValueOfEntitlement:@"com.apple.developer.nfc.hce" secTask:a3];
  uint64_t v6 = (NSMutableOrderedSet *)objc_opt_new();
  nfcCardSessionAIDPrefixList = self->_nfcCardSessionAIDPrefixList;
  self->_nfcCardSessionAIDPrefixList = v6;

  uint64_t v8 = [(NFServiceWhitelistChecker *)self _arrayValueOfEntitlement:@"com.apple.developer.nfc.hce.iso7816.select-identifier-prefixes" secTask:a3];
  long long v30 = 0u;
  long long v31 = 0u;
  long long v32 = 0u;
  long long v33 = 0u;
  uint64_t v9 = [v8 countByEnumeratingWithState:&v30 objects:v44 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v31;
    do
    {
      for (uint64_t i = 0; i != v10; ++i)
      {
        if (*(void *)v31 != v11) {
          objc_enumerationMutation(v8);
        }
        uint64_t v13 = *(void *)(*((void *)&v30 + 1) + 8 * i);
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0
          && [(NFServiceWhitelistChecker *)self _isAIDStringValid:v13])
        {
          long long v14 = [MEMORY[0x1E4F1C9B8] NF_dataWithHexString:v13];
          if ([v14 length] && (unint64_t)objc_msgSend(v14, "length") <= 0x10) {
            [(NSMutableOrderedSet *)self->_nfcCardSessionAIDPrefixList addObject:v14];
          }
        }
      }
      uint64_t v10 = [v8 countByEnumeratingWithState:&v30 objects:v44 count:16];
    }
    while (v10);
  }
  if (self->_nfcCardSessionAccess && [(NSMutableOrderedSet *)self->_nfcCardSessionAIDPrefixList count])
  {
    long long v15 = kNFLOG_DISPATCH_SPECIFIC_KEY;
    unint64_t specific = (unint64_t)dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    if (specific >= 4) {
      __assert_rtn("NFLogGetLogger", "NFSharedLog.c", 216, "category < NFLogCategoryMax");
    }
    uint64_t v17 = (void (*)(uint64_t, const char *, ...))_NFLogCustomLoggers[specific];
    if (v17)
    {
      Class = object_getClass(self);
      BOOL isMetaClass = class_isMetaClass(Class);
      ClassName = object_getClassName(self);
      Name = sel_getName(a2);
      uint64_t v22 = 45;
      if (isMetaClass) {
        uint64_t v22 = 43;
      }
      v17(5, "%c[%{public}s %{public}s]:%i com.apple.developer.nfc.hce.iso7816.select-identifier-prefixes={public}%@", v22, ClassName, Name, 290, self->_nfcCardSessionAIDPrefixList);
      long long v15 = kNFLOG_DISPATCH_SPECIFIC_KEY;
    }
    long long v23 = dispatch_get_specific(v15);
    if (NFSharedLogInitialize_onceToken != -1) {
      dispatch_once(&NFSharedLogInitialize_onceToken, &__block_literal_global_3);
    }
    BOOL v24 = (id)_NFSharedLogClient[(void)v23];
    if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v25 = object_getClass(self);
      if (class_isMetaClass(v25)) {
        int v26 = 43;
      }
      else {
        int v26 = 45;
      }
      __int16 v27 = object_getClassName(self);
      int v28 = sel_getName(a2);
      unint64_t v29 = self->_nfcCardSessionAIDPrefixList;
      *(_DWORD *)buf = 67110146;
      int v35 = v26;
      __int16 v36 = 2082;
      v37 = v27;
      __int16 v38 = 2082;
      int v39 = v28;
      __int16 v40 = 1024;
      int v41 = 290;
      __int16 v42 = 2112;
      int v43 = v29;
      _os_log_impl(&dword_1CA51A000, v24, OS_LOG_TYPE_DEFAULT, "%c[%{public}s %{public}s]:%i com.apple.developer.nfc.hce.iso7816.select-identifier-prefixes={public}%@", buf, 0x2Cu);
    }
  }
}

- (NFServiceWhitelistChecker)initWithConnection:(id)a3
{
  return [(NFServiceWhitelistChecker *)self initWithConnection:a3 coreNFCConnection:0];
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5 = [objc_opt_class() allocWithZone:a3];
  if (v5)
  {
    uint64_t v6 = [(NSString *)self->_clientName copyWithZone:a3];
    uint64_t v7 = *(void **)(v5 + 32);
    *(void *)(v5 + 32) = v6;

    *(unsigned char *)(v5 + 65) = self->_internalAccess;
    *(unsigned char *)(v5 + 60) = self->_iso15693ReaderAccess;
    *(unsigned char *)(v5 + 66) = self->_seshatAccess;
    *(unsigned char *)(v5 + 67) = self->_miniNVWriteAccess;
    *(unsigned char *)(v5 + 68) = self->_lpmFactoryTest;
    *(unsigned char *)(v5 + 69) = self->_remoteAdminAccess;
    uint64_t v8 = [(NSMutableArray *)self->_iso15693TagAccessFilters copyWithZone:a3];
    uint64_t v9 = *(void **)(v5 + 8);
    *(void *)(v5 + 8) = v8;

    *(unsigned char *)(v5 + 62) = self->_ndefReaderAccess;
    uint64_t v10 = [(NSString *)self->_readerPurposeString copyWithZone:a3];
    uint64_t v11 = *(void **)(v5 + 40);
    *(void *)(v5 + 40) = v10;

    *(unsigned char *)(v5 + 70) = self->_allowBackgroundedSession;
    *(unsigned char *)(v5 + 71) = self->_ignoreAppStateMonitor;
    *(unsigned char *)(v5 + 61) = self->_vasReaderAccess;
    uint64_t v12 = [(NSString *)self->_applicationIdentifier copyWithZone:a3];
    uint64_t v13 = *(void **)(v5 + 48);
    *(void *)(v5 + 48) = v12;

    uint64_t v14 = [(NSMutableOrderedSet *)self->_trustedISO7816AidList copyWithZone:a3];
    long long v15 = *(void **)(v5 + 16);
    *(void *)(v5 + 16) = v14;

    *(unsigned char *)(v5 + 63) = self->_tagReaderAccess;
    *(_DWORD *)(v5 + 56) = self->_clientProcessIdentifier;
    *(unsigned char *)(v5 + 86) = self->_dontResetAssertion;
    *(unsigned char *)(v5 + 74) = self->_singleUserAccess;
    *(unsigned char *)(v5 + 75) = self->_purpleTrustAccess;
    *(unsigned char *)(v5 + 76) = self->_surfSessionAccess;
    *(unsigned char *)(v5 + 77) = self->_eCommerceAccess;
    *(unsigned char *)(v5 + 78) = self->_seSessionAccess;
    *(unsigned char *)(v5 + 79) = self->_seLoggingSessionAccess;
    *(unsigned char *)(v5 + 80) = self->_lpemConfigSessionAccess;
    *(unsigned char *)(v5 + 81) = self->_readerInternalAccess;
    *(unsigned char *)(v5 + 82) = self->_cardModeAccess;
    *(unsigned char *)(v5 + 83) = self->_hceAccess;
    *(unsigned char *)(v5 + 84) = self->_radioToggle;
    *(unsigned char *)(v5 + 85) = self->_pollingProfileUpdate;
    *(unsigned char *)(v5 + 73) = self->_useUnfilteredApplets;
    *(unsigned char *)(v5 + 72) = self->_nfcTagReaderPACEPollingAllow;
    *(unsigned char *)(v5 + 87) = self->_bgTagReadingAssertion;
    *(unsigned char *)(v5 + 88) = self->_chAssertion;
    *(unsigned char *)(v5 + 89) = self->_seCredentialManagerAccess;
    *(unsigned char *)(v5 + 64) = self->_nfcCardSessionAccess;
    uint64_t v16 = [(NSMutableOrderedSet *)self->_nfcCardSessionAIDPrefixList copyWithZone:a3];
    uint64_t v17 = *(void **)(v5 + 24);
    *(void *)(v5 + 24) = v16;
  }
  return (id)v5;
}

- (unsigned)validateISO15693TagAcesssWithUID:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [v4 bytes];
  if ([v4 length] == 8 && *(unsigned __int8 *)(v5 + 7) == 224)
  {
    if ([(NSMutableArray *)self->_iso15693TagAccessFilters count])
    {
      uint64_t v6 = (void *)[objc_alloc(MEMORY[0x1E4F1CA58]) initWithCapacity:6];
      uint64_t v7 = *(unsigned __int8 *)(v5 + 6);
      for (uint64_t i = 5; i != -1; --i)
        [v6 appendBytes:v5 + i length:1];
      unsigned int v9 = [(NFServiceWhitelistChecker *)self validateISO15693TagAccessWithManufacturerCode:v7 serialNumber:v6];
    }
    else
    {
      unsigned int v9 = 27;
    }
  }
  else
  {
    unsigned int v9 = 10;
  }

  return v9;
}

- (unsigned)validateISO15693TagAccessWithManufacturerCode:(unint64_t)a3 serialNumber:(id)a4
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  uint64_t v6 = [a4 NF_asHexString];
  if ([v6 length])
  {
    long long v25 = 0u;
    long long v26 = 0u;
    long long v23 = 0u;
    long long v24 = 0u;
    obj = self->_iso15693TagAccessFilters;
    uint64_t v7 = [(NSMutableArray *)obj countByEnumeratingWithState:&v23 objects:v27 count:16];
    if (v7)
    {
      uint64_t v8 = v7;
      uint64_t v9 = *(void *)v24;
LABEL_4:
      uint64_t v10 = 0;
      while (1)
      {
        if (*(void *)v24 != v9) {
          objc_enumerationMutation(obj);
        }
        uint64_t v11 = *(void **)(*((void *)&v23 + 1) + 8 * v10);
        uint64_t v12 = [v11 objectForKeyedSubscript:@"TagManufacturerCode"];
        uint64_t v13 = [v12 unsignedIntegerValue];

        if (v13 != a3) {
          goto LABEL_19;
        }
        uint64_t v14 = [v11 NF_stringForKey:@"TagSerialNumber"];
        if ([v14 hasPrefix:@"*"])
        {
          long long v15 = [v14 substringWithRange:1, [v14 length] - 1];
          unint64_t v16 = [v15 length];
          if (v16 <= [v6 length])
          {
            uint64_t v17 = [v6 substringFromIndex:[v6 length] - [v15 length]];
            uint64_t v18 = [v17 caseInsensitiveCompare:v15];

            goto LABEL_17;
          }
        }
        else
        {
          if (![v14 hasSuffix:@"*"])
          {
            if (![v6 caseInsensitiveCompare:v14]) {
              goto LABEL_23;
            }
            goto LABEL_18;
          }
          long long v15 = [v14 substringToIndex:[v14 length] - 1];
          unint64_t v19 = [v15 length];
          if (v19 <= [v6 length])
          {
            uint64_t v18 = [v6 compare:v15 options:1 range:[v15 length]];
LABEL_17:

            if (!v18)
            {
LABEL_23:

              unsigned int v20 = 0;
              goto LABEL_24;
            }
            goto LABEL_18;
          }
        }

LABEL_18:
LABEL_19:
        if (v8 == ++v10)
        {
          uint64_t v8 = [(NSMutableArray *)obj countByEnumeratingWithState:&v23 objects:v27 count:16];
          if (v8) {
            goto LABEL_4;
          }
          break;
        }
      }
    }
    unsigned int v20 = 32;
LABEL_24:
  }
  else
  {
    unsigned int v20 = 10;
  }

  return v20;
}

- (unsigned)validateISO15693TagAccessWithManufacturerCode:(unint64_t)a3
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v4 = self->_iso15693TagAccessFilters;
  uint64_t v5 = [(NSMutableArray *)v4 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v14;
    while (2)
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v14 != v7) {
          objc_enumerationMutation(v4);
        }
        uint64_t v9 = [*(id *)(*((void *)&v13 + 1) + 8 * i) objectForKeyedSubscript:@"TagManufacturerCode" v13];
        uint64_t v10 = [v9 unsignedIntegerValue];

        if (v10 == a3)
        {
          unsigned int v11 = 0;
          goto LABEL_11;
        }
      }
      uint64_t v6 = [(NSMutableArray *)v4 countByEnumeratingWithState:&v13 objects:v17 count:16];
      if (v6) {
        continue;
      }
      break;
    }
  }
  unsigned int v11 = 32;
LABEL_11:

  return v11;
}

- (id)getAppInfoDictionary
{
  uint64_t v2 = MEMORY[0x1F4188790](self, a2);
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  bzero(buffer, 0x1000uLL);
  int v3 = proc_pidpath(*(_DWORD *)(v2 + 56), buffer, 0x1000u);
  if (v3 < 1) {
    goto LABEL_8;
  }
  id v4 = (void *)[[NSString alloc] initWithBytes:buffer length:v3 encoding:4];
  uint64_t v5 = [MEMORY[0x1E4F1CB10] fileURLWithPath:v4 isDirectory:0];
  CFURLRef v6 = [v5 URLByDeletingLastPathComponent];
  if (!v5 || (uint64_t v7 = CFBundleCopyInfoDictionaryForURL((CFURLRef)v5)) == 0)
  {
    if (v6) {
      uint64_t v7 = CFBundleCopyInfoDictionaryInDirectory(v6);
    }
    else {
      uint64_t v7 = 0;
    }
  }

  if (!v7) {
LABEL_8:
  }
    uint64_t v7 = objc_opt_new();

  return v7;
}

- (double)sessionTimeLimit
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  if (self->_iso15693ReaderAccess
    || self->_ndefReaderAccess
    || self->_vasReaderAccess
    || self->_tagReaderAccess
    || self->_nfcCardSessionAccess)
  {
    return 60.0;
  }
  double v3 = 0.0;
  if (!self->_internalAccess) {
    return v3;
  }
  CFURLRef v6 = [MEMORY[0x1E4F1CB18] standardUserDefaults];
  int v7 = [v6 BOOLForKey:@"BurnoutTimerDisable"];

  if (!v7) {
    return 60.0;
  }
  uint64_t v8 = kNFLOG_DISPATCH_SPECIFIC_KEY;
  unint64_t specific = (unint64_t)dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
  if (specific >= 4) {
    __assert_rtn("NFLogGetLogger", "NFSharedLog.c", 216, "category < NFLogCategoryMax");
  }
  uint64_t v10 = (void (*)(uint64_t, const char *, ...))_NFLogCustomLoggers[specific];
  if (v10)
  {
    Class = object_getClass(self);
    BOOL isMetaClass = class_isMetaClass(Class);
    ClassName = object_getClassName(self);
    Name = sel_getName(a2);
    uint64_t v14 = 45;
    if (isMetaClass) {
      uint64_t v14 = 43;
    }
    v10(6, "%c[%{public}s %{public}s]:%i Disabled", v14, ClassName, Name, 514);
    uint64_t v8 = kNFLOG_DISPATCH_SPECIFIC_KEY;
  }
  long long v15 = dispatch_get_specific(v8);
  if (NFSharedLogInitialize_onceToken != -1) {
    dispatch_once(&NFSharedLogInitialize_onceToken, &__block_literal_global_3);
  }
  long long v16 = (id)_NFSharedLogClient[(void)v15];
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v17 = object_getClass(self);
    if (class_isMetaClass(v17)) {
      int v18 = 43;
    }
    else {
      int v18 = 45;
    }
    *(_DWORD *)buf = 67109890;
    int v21 = v18;
    __int16 v22 = 2082;
    long long v23 = object_getClassName(self);
    __int16 v24 = 2082;
    long long v25 = sel_getName(a2);
    __int16 v26 = 1024;
    int v27 = 514;
    _os_log_impl(&dword_1CA51A000, v16, OS_LOG_TYPE_DEFAULT, "%c[%{public}s %{public}s]:%i Disabled", buf, 0x22u);
  }

  return v3;
}

- (BOOL)nfcISO15693ReaderAccess
{
  return self->_iso15693ReaderAccess && [(NSMutableArray *)self->_iso15693TagAccessFilters count] != 0;
}

- (BOOL)nfcVASReaderAccess
{
  return self->_vasReaderAccess;
}

- (BOOL)nfcNDEFReaderAccess
{
  return self->_ndefReaderAccess;
}

- (BOOL)externalReaderAccessAllow
{
  if ([(NFServiceWhitelistChecker *)self nfcNDEFReaderAccess]
    || [(NFServiceWhitelistChecker *)self nfcISO15693ReaderAccess]
    || [(NFServiceWhitelistChecker *)self nfcTagReaderAccess]
    || (BOOL v3 = [(NFServiceWhitelistChecker *)self nfcVASReaderAccess]))
  {
    LOBYTE(v3) = 1;
  }
  return v3;
}

- (BOOL)nfcTagReaderAccess
{
  return self->_tagReaderAccess;
}

- (NSOrderedSet)trustedISO7816AidList
{
  return (NSOrderedSet *)self->_trustedISO7816AidList;
}

- (id)_stringFromArray:(id)a3
{
  id v3 = a3;
  id v4 = (void *)[objc_alloc(MEMORY[0x1E4F28E78]) initWithString:@"["];
  if ([v3 count])
  {
    uint64_t v5 = 0;
    while (1)
    {
      if (v5) {
        [v4 appendString:@", "];
      }
      CFURLRef v6 = [v3 objectAtIndexedSubscript:v5];
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        break;
      }
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        int v7 = [v3 objectAtIndexedSubscript:v5];
        [v4 appendFormat:@"%@", v7];
        goto LABEL_9;
      }
LABEL_10:

      if ([v3 count] <= (unint64_t)++v5) {
        goto LABEL_11;
      }
    }
    int v7 = [v6 NF_asHexString];
    [v4 appendString:v7];
LABEL_9:

    goto LABEL_10;
  }
LABEL_11:
  [v4 appendString:@"]"];

  return v4;
}

- (id)_stringFromISO15693AccessFilterList
{
  id v3 = (void *)[objc_alloc(MEMORY[0x1E4F28E78]) initWithString:@"["];
  if ([(NSMutableArray *)self->_iso15693TagAccessFilters count])
  {
    unint64_t v4 = 0;
    do
    {
      if (v4) {
        [v3 appendString:@", "];
      }
      uint64_t v5 = [(NSMutableArray *)self->_iso15693TagAccessFilters objectAtIndexedSubscript:v4];
      CFURLRef v6 = [v5 objectForKeyedSubscript:@"TagManufacturerCode"];
      int v7 = [(NSMutableArray *)self->_iso15693TagAccessFilters objectAtIndexedSubscript:v4];
      uint64_t v8 = [v7 objectForKeyedSubscript:@"TagSerialNumber"];
      [v3 appendFormat:@"{%@=%@, %@=%@}", @"TagManufacturerCode", v6, @"TagSerialNumber", v8];

      ++v4;
    }
    while ([(NSMutableArray *)self->_iso15693TagAccessFilters count] > v4);
  }
  [v3 appendString:@"]"];

  return v3;
}

- (id)description
{
  id v3 = objc_opt_new();
  unint64_t v4 = (void *)[[NSString alloc] initWithFormat:@"Application Identifier: %@", self->_applicationIdentifier];
  [v3 addObject:v4];

  id v5 = [NSString alloc];
  if (self->_ndefReaderAccess) {
    CFURLRef v6 = @"Y";
  }
  else {
    CFURLRef v6 = @"N";
  }
  int v7 = (void *)[v5 initWithFormat:@"NDEF: %@", v6];
  [v3 addObject:v7];

  uint64_t v8 = [[NSString alloc] initWithFormat:@"PollingProfileUpdate: %d", self->_pollingProfileUpdate];
  [v3 addObject:v8];

  if ([(NSMutableArray *)self->_iso15693TagAccessFilters count])
  {
    id v9 = [NSString alloc];
    uint64_t v10 = [(NFServiceWhitelistChecker *)self _stringFromISO15693AccessFilterList];
    unsigned int v11 = (void *)[v9 initWithFormat:@"Legacy ISO15693 filter List=%@", v10];
    [v3 addObject:v11];
  }
  if ([(NSMutableOrderedSet *)self->_trustedISO7816AidList count])
  {
    id v12 = [NSString alloc];
    long long v13 = [(NSMutableOrderedSet *)self->_trustedISO7816AidList array];
    uint64_t v14 = [(NFServiceWhitelistChecker *)self _stringFromArray:v13];
    long long v15 = (void *)[v12 initWithFormat:@"ISO7816 Set=%@", v14];
    [v3 addObject:v15];
  }
  id v16 = [NSString alloc];
  if (self->_vasReaderAccess) {
    uint64_t v17 = @"Y";
  }
  else {
    uint64_t v17 = @"N";
  }
  int v18 = (void *)[v16 initWithFormat:@"VAS: %@", v17];
  [v3 addObject:v18];

  id v19 = [NSString alloc];
  if (self->_tagReaderAccess) {
    unsigned int v20 = @"Y";
  }
  else {
    unsigned int v20 = @"N";
  }
  int v21 = (void *)[v19 initWithFormat:@"TAG: %@", v20];
  [v3 addObject:v21];

  id v22 = [NSString alloc];
  if (self->_nfcTagReaderPACEPollingAllow) {
    long long v23 = @"Y";
  }
  else {
    long long v23 = @"N";
  }
  __int16 v24 = (void *)[v22 initWithFormat:@"PACEPoll: %@", v23];
  [v3 addObject:v24];

  id v25 = [NSString alloc];
  if (self->_nfcCardSessionAccess) {
    __int16 v26 = @"Y";
  }
  else {
    __int16 v26 = @"N";
  }
  int v27 = (void *)[v25 initWithFormat:@"CardSession: %@", v26];
  [v3 addObject:v27];

  id v28 = [NSString alloc];
  unint64_t v29 = [(NSMutableOrderedSet *)self->_nfcCardSessionAIDPrefixList array];
  long long v30 = [(NFServiceWhitelistChecker *)self _stringFromArray:v29];
  long long v31 = (void *)[v28 initWithFormat:@"CardSessionAIDPrefixList: %@", v30];
  [v3 addObject:v31];

  long long v32 = [v3 description];

  return v32;
}

- (BOOL)nfcCardSessionAccess
{
  return self->_nfcCardSessionAccess;
}

- (NSOrderedSet)nfcCardSessionAIDPrefixList
{
  return (NSOrderedSet *)self->_nfcCardSessionAIDPrefixList;
}

- (NSString)readerPurposeString
{
  return self->_readerPurposeString;
}

- (NSString)applicationIdentifier
{
  return self->_applicationIdentifier;
}

- (BOOL)seshatAccess
{
  return self->_seshatAccess;
}

- (BOOL)miniNVWriteAccess
{
  return self->_miniNVWriteAccess;
}

- (BOOL)lpmFactoryTest
{
  return self->_lpmFactoryTest;
}

- (BOOL)remoteAdminAccess
{
  return self->_remoteAdminAccess;
}

- (BOOL)allowBackgroundedSession
{
  return self->_allowBackgroundedSession;
}

- (BOOL)ignoreAppStateMonitor
{
  return self->_ignoreAppStateMonitor;
}

- (BOOL)nfcTagReaderPACEPollingAllow
{
  return self->_nfcTagReaderPACEPollingAllow;
}

- (BOOL)useUnfilteredApplets
{
  return self->_useUnfilteredApplets;
}

- (BOOL)singleUserAccess
{
  return self->_singleUserAccess;
}

- (BOOL)purpleTrustAccess
{
  return self->_purpleTrustAccess;
}

- (BOOL)surfSessionAccess
{
  return self->_surfSessionAccess;
}

- (BOOL)eCommerceAccess
{
  return self->_eCommerceAccess;
}

- (BOOL)seSessionAccess
{
  return self->_seSessionAccess;
}

- (BOOL)seLoggingSessionAccess
{
  return self->_seLoggingSessionAccess;
}

- (BOOL)lpemConfigSessionAccess
{
  return self->_lpemConfigSessionAccess;
}

- (BOOL)readerInternalAccess
{
  return self->_readerInternalAccess;
}

- (BOOL)cardModeAccess
{
  return self->_cardModeAccess;
}

- (BOOL)hceAccess
{
  return self->_hceAccess;
}

- (BOOL)radioToggle
{
  return self->_radioToggle;
}

- (BOOL)pollingProfileUpdate
{
  return self->_pollingProfileUpdate;
}

- (BOOL)dontResetAssertion
{
  return self->_dontResetAssertion;
}

- (BOOL)bgTagReadingAssertion
{
  return self->_bgTagReadingAssertion;
}

- (BOOL)seCredentialManagerAccess
{
  return self->_seCredentialManagerAccess;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_applicationIdentifier, 0);
  objc_storeStrong((id *)&self->_readerPurposeString, 0);
  objc_storeStrong((id *)&self->_clientName, 0);
  objc_storeStrong((id *)&self->_nfcCardSessionAIDPrefixList, 0);
  objc_storeStrong((id *)&self->_trustedISO7816AidList, 0);

  objc_storeStrong((id *)&self->_iso15693TagAccessFilters, 0);
}

@end