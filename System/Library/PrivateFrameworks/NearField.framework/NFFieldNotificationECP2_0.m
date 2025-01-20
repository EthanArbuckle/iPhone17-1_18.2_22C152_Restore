@interface NFFieldNotificationECP2_0
+ (BOOL)supportsSecureCoding;
- (BOOL)ignoreRFTechOnIsEqual;
- (BOOL)isEqual:(id)a3;
- (BOOL)odaRequired;
- (NFFieldNotificationECP2_0)initWithCoder:(id)a3;
- (NFFieldNotificationECP2_0)initWithDictionary:(id)a3;
- (NFFieldNotificationECP2_0)initWithNotificationType:(unint64_t)a3 rfTechnology:(unsigned int)a4 typeFSystemCode:(unsigned __int16)a5 creationDate:(id)a6 cachedBeforeRFReset:(BOOL)a7 odaRequired:(BOOL)a8 terminalMode:(unsigned int)a9 terminalType:(unint64_t)a10 terminalSubType:(unsigned __int8)a11 tciArray:(id)a12 openLoopSchemeBitfield:(id)a13 homeKitSchemeDataPayload:(id)a14 readerIdentifier:(id)a15 pairingMode:(unsigned int)a16 terminalTypeData:(id)a17 ignoreRFTechOnIsEqual:(BOOL)a18 userInfo:(id)a19;
- (NSArray)tciArray;
- (NSData)homeKitSchemeDataPayload;
- (NSData)openLoopSchemeBitfield;
- (NSData)readerIdentifier;
- (NSData)terminalTypeData;
- (NSMutableDictionary)userInfo;
- (id)_parseCHTerminalTypeData:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (unint64_t)terminalType;
- (unsigned)pairingMode;
- (unsigned)terminalMode;
- (unsigned)terminalSubType;
- (void)_initCategoryWithType:(unint64_t)a3;
- (void)encodeWithCoder:(id)a3;
- (void)setIgnoreRFTechOnIsEqual:(BOOL)a3;
- (void)setUserInfo:(id)a3;
@end

@implementation NFFieldNotificationECP2_0

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  BOOL odaRequired = self->_odaRequired;
  id v5 = a3;
  [v5 encodeBool:odaRequired forKey:@"odaRequired"];
  [v5 encodeInteger:self->_terminalMode forKey:@"terminalMode"];
  [v5 encodeInteger:self->_terminalType forKey:@"terminalType"];
  [v5 encodeInteger:self->_terminalSubType forKey:@"terminalSubType"];
  [v5 encodeObject:self->_tciArray forKey:@"tciArray"];
  [v5 encodeObject:self->_openLoopSchemeBitfield forKey:@"openLoopSchemeBitfield"];
  [v5 encodeObject:self->_homeKitSchemeDataPayload forKey:@"homeKitSchemeDataPayload"];
  [v5 encodeObject:self->_readerIdentifier forKey:@"readerIdentifier"];
  [v5 encodeInteger:self->_pairingMode forKey:@"pairingMode"];
  [v5 encodeBool:self->_ignoreRFTechOnIsEqual forKey:@"ignoreRFTechOnIsEqual"];
  [v5 encodeObject:self->_userInfo forKey:@"userInfo"];
  v6.receiver = self;
  v6.super_class = (Class)NFFieldNotificationECP2_0;
  [(NFFieldNotification *)&v6 encodeWithCoder:v5];
}

- (NFFieldNotificationECP2_0)initWithCoder:(id)a3
{
  id v4 = a3;
  v28.receiver = self;
  v28.super_class = (Class)NFFieldNotificationECP2_0;
  id v5 = [(NFFieldNotification *)&v28 initWithCoder:v4];
  if (v5)
  {
    v5->_BOOL odaRequired = [v4 decodeBoolForKey:@"odaRequired"];
    v5->_terminalMode = [v4 decodeIntegerForKey:@"terminalMode"];
    v5->_terminalType = [v4 decodeIntegerForKey:@"terminalType"];
    v5->_terminalSubType = [v4 decodeIntegerForKey:@"terminalSubType"];
    uint64_t v6 = [MEMORY[0x1E4FBA858] coder:v4 decodeArrayOfClass:objc_opt_class() forKey:@"tciArray"];
    tciArray = v5->_tciArray;
    v5->_tciArray = (NSArray *)v6;

    v8 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CAD0]), "initWithObjects:", objc_opt_class(), 0);
    uint64_t v9 = [v4 decodeObjectOfClasses:v8 forKey:@"openLoopSchemeBitfield"];
    openLoopSchemeBitfield = v5->_openLoopSchemeBitfield;
    v5->_openLoopSchemeBitfield = (NSData *)v9;

    uint64_t v11 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"homeKitSchemeDataPayload"];
    homeKitSchemeDataPayload = v5->_homeKitSchemeDataPayload;
    v5->_homeKitSchemeDataPayload = (NSData *)v11;

    uint64_t v13 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"readerIdentifier"];
    readerIdentifier = v5->_readerIdentifier;
    v5->_readerIdentifier = (NSData *)v13;

    v5->_pairingMode = [v4 decodeIntForKey:@"pairingMode"];
    v5->_ignoreRFTechOnIsEqual = [v4 decodeBoolForKey:@"ignoreRFTechOnIsEqual"];
    id v27 = objc_alloc(MEMORY[0x1E4F1CAD0]);
    uint64_t v26 = objc_opt_class();
    uint64_t v15 = objc_opt_class();
    uint64_t v16 = objc_opt_class();
    uint64_t v17 = objc_opt_class();
    uint64_t v18 = objc_opt_class();
    uint64_t v19 = objc_opt_class();
    uint64_t v20 = objc_opt_class();
    uint64_t v21 = objc_opt_class();
    v22 = objc_msgSend(v27, "initWithObjects:", v26, v15, v16, v17, v18, v19, v20, v21, objc_opt_class(), 0);
    uint64_t v23 = [v4 decodeObjectOfClasses:v22 forKey:@"userInfo"];
    userInfo = v5->_userInfo;
    v5->_userInfo = (NSMutableDictionary *)v23;
  }
  return v5;
}

- (NFFieldNotificationECP2_0)initWithDictionary:(id)a3
{
  v129[1] = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  v118.receiver = self;
  v118.super_class = (Class)NFFieldNotificationECP2_0;
  uint64_t v6 = [(NFFieldNotification *)&v118 initWithDictionary:v5];
  if (!v6) {
    goto LABEL_101;
  }
  v7 = [v5 objectForKey:@"ECPData"];
  if ((unint64_t)[v7 length] > 4)
  {
    [(NFFieldNotification *)v6 setNotificationType:3];
    id v21 = v7;
    v22 = (unsigned __int8 *)[v21 bytes];
    unsigned int v23 = v22[2];
    uint64_t v24 = v23 & 0xF;
    if ([v21 length] - 5 != v24)
    {
      objc_super v28 = (const void **)MEMORY[0x1E4FBA898];
      dispatch_get_specific((const void *)*MEMORY[0x1E4FBA898]);
      uint64_t Logger = NFLogGetLogger();
      if (Logger)
      {
        v30 = (void (*)(uint64_t, const char *, ...))Logger;
        Class = object_getClass(v6);
        BOOL isMetaClass = class_isMetaClass(Class);
        ClassName = object_getClassName(v6);
        Name = sel_getName(a2);
        uint64_t v34 = 45;
        if (isMetaClass) {
          uint64_t v34 = 43;
        }
        v30(4, "%c[%{public}s %{public}s]:%i Invalid terminal type data length", v34, ClassName, Name, 532);
      }
      dispatch_get_specific(*v28);
      uint64_t v15 = NFSharedLogGetLogger();
      if (!os_log_type_enabled(v15, OS_LOG_TYPE_ERROR)) {
        goto LABEL_26;
      }
      v35 = object_getClass(v6);
      if (class_isMetaClass(v35)) {
        int v36 = 43;
      }
      else {
        int v36 = 45;
      }
      v37 = object_getClassName(v6);
      v38 = sel_getName(a2);
      *(_DWORD *)buf = 67109890;
      int v120 = v36;
      __int16 v121 = 2082;
      v122 = v37;
      __int16 v123 = 2082;
      v124 = v38;
      __int16 v125 = 1024;
      int v126 = 532;
      uint64_t v20 = "%c[%{public}s %{public}s]:%i Invalid terminal type data length";
      goto LABEL_25;
    }
    v6->_BOOL odaRequired = (v23 & 0x40) == 0;
    v6->_unint64_t terminalType = v22[3];
    v6->_terminalMode = (v23 >> 5) & 4;
    v6->_unsigned int terminalSubType = v22[4];
    v6->_pairingMode = 0;
    v25 = [v5 objectForKey:@"IgnoreRFTechOnIsEqual"];
    v6->_ignoreRFTechOnIsEqual = [v25 BOOLValue];

    [(NFFieldNotificationECP2_0 *)v6 _initCategoryWithType:v6->_terminalType];
    unint64_t terminalType = v6->_terminalType;
    if (terminalType == 2)
    {
      if ((v6->_terminalSubType - 8) > 3u) {
        unsigned int v27 = 0;
      }
      else {
        unsigned int v27 = dword_19D6E6450[(char)(v6->_terminalSubType - 8)];
      }
      v6->_pairingMode = v27;
      unint64_t terminalType = v6->_terminalType;
    }
    if (terminalType > 2 || v24 < 3)
    {
      if (!v24) {
        goto LABEL_38;
      }
    }
    else
    {
      v40 = objc_msgSend(v21, "subdataWithRange:", 5, 3);
      v129[0] = v40;
      uint64_t v41 = [MEMORY[0x1E4F1C978] arrayWithObjects:v129 count:1];
      tciArray = v6->_tciArray;
      v6->_tciArray = (NSArray *)v41;

      unint64_t terminalType = v6->_terminalType;
    }
    if (terminalType == 5 && !v6->_terminalSubType)
    {
      v43 = objc_msgSend(v21, "subdataWithRange:", 5, v24);
      v44 = [(NFFieldNotificationECP2_0 *)v6 _parseCHTerminalTypeData:v43];

      if ([v44 count])
      {
        uint64_t v45 = [objc_alloc(MEMORY[0x1E4F1CA60]) initWithDictionary:v44];
        userInfo = v6->_userInfo;
        v6->_userInfo = (NSMutableDictionary *)v45;
      }
    }
LABEL_38:
    openLoopSchemeBitfield = v6->_openLoopSchemeBitfield;
    v6->_openLoopSchemeBitfield = 0;

    homeKitSchemeDataPayload = v6->_homeKitSchemeDataPayload;
    v6->_homeKitSchemeDataPayload = 0;

    unint64_t v49 = v6->_terminalType;
    if (v49 == 1)
    {
      if ([v21 length] == 13)
      {
        uint64_t v50 = objc_msgSend(v21, "subdataWithRange:", 8, 5);
        p_super = &v6->_openLoopSchemeBitfield->super;
        v6->_openLoopSchemeBitfield = (NSData *)v50;
        goto LABEL_99;
      }
      unint64_t v49 = v6->_terminalType;
    }
    if (v49 == 2 && v6->_terminalSubType == 4)
    {
      if ((unint64_t)[v21 length] <= 0xF)
      {
        v52 = (const void **)MEMORY[0x1E4FBA898];
        dispatch_get_specific((const void *)*MEMORY[0x1E4FBA898]);
        uint64_t v53 = NFLogGetLogger();
        if (v53)
        {
          v54 = (void (*)(uint64_t, const char *, ...))v53;
          v55 = object_getClass(v6);
          BOOL v56 = class_isMetaClass(v55);
          v57 = object_getClassName(v6);
          v58 = sel_getName(a2);
          uint64_t v117 = [v21 length];
          uint64_t v59 = 45;
          if (v56) {
            uint64_t v59 = 43;
          }
          v54(4, "%c[%{public}s %{public}s]:%i Invalid data length %lu", v59, v57, v58, 591, v117);
        }
        dispatch_get_specific(*v52);
        p_super = NFSharedLogGetLogger();
        if (!os_log_type_enabled(p_super, OS_LOG_TYPE_ERROR)) {
          goto LABEL_99;
        }
        v60 = object_getClass(v6);
        if (class_isMetaClass(v60)) {
          int v61 = 43;
        }
        else {
          int v61 = 45;
        }
        v62 = object_getClassName(v6);
        v63 = sel_getName(a2);
        uint64_t v64 = [v21 length];
        *(_DWORD *)buf = 67110146;
        int v120 = v61;
        __int16 v121 = 2082;
        v122 = v62;
        __int16 v123 = 2082;
        v124 = v63;
        __int16 v125 = 1024;
        int v126 = 591;
        __int16 v127 = 2048;
        uint64_t v128 = v64;
        v65 = "%c[%{public}s %{public}s]:%i Invalid data length %lu";
        v66 = p_super;
        uint32_t v67 = 44;
        goto LABEL_98;
      }
      uint64_t v82 = objc_msgSend(v21, "subdataWithRange:", 2, 14);
      v83 = v6->_homeKitSchemeDataPayload;
      v6->_homeKitSchemeDataPayload = (NSData *)v82;

      if (v24 == 11)
      {
LABEL_68:
        uint64_t v84 = objc_msgSend(v21, "subdataWithRange:", 8, 8);
        p_super = &v6->_readerIdentifier->super;
        v6->_readerIdentifier = (NSData *)v84;
        goto LABEL_99;
      }
      v100 = (const void **)MEMORY[0x1E4FBA898];
      dispatch_get_specific((const void *)*MEMORY[0x1E4FBA898]);
      uint64_t v101 = NFLogGetLogger();
      if (v101)
      {
        v102 = (void (*)(uint64_t, const char *, ...))v101;
        v103 = object_getClass(v6);
        BOOL v104 = class_isMetaClass(v103);
        v105 = object_getClassName(v6);
        v116 = sel_getName(a2);
        uint64_t v106 = 45;
        if (v104) {
          uint64_t v106 = 43;
        }
        v102(4, "%c[%{public}s %{public}s]:%i Expected reader identifier but ECP frame does not contain it.", v106, v105, v116, 601);
      }
      dispatch_get_specific(*v100);
      p_super = NFSharedLogGetLogger();
      if (!os_log_type_enabled(p_super, OS_LOG_TYPE_ERROR)) {
        goto LABEL_99;
      }
      v107 = object_getClass(v6);
      if (class_isMetaClass(v107)) {
        int v108 = 43;
      }
      else {
        int v108 = 45;
      }
      v109 = object_getClassName(v6);
      v110 = sel_getName(a2);
      *(_DWORD *)buf = 67109890;
      int v120 = v108;
      __int16 v121 = 2082;
      v122 = v109;
      __int16 v123 = 2082;
      v124 = v110;
      __int16 v125 = 1024;
      int v126 = 601;
      v65 = "%c[%{public}s %{public}s]:%i Expected reader identifier but ECP frame does not contain it.";
    }
    else
    {
      uint64_t v68 = objc_opt_new();
      v69 = v6->_openLoopSchemeBitfield;
      v6->_openLoopSchemeBitfield = (NSData *)v68;

      if (v6->_terminalType != 2) {
        goto LABEL_100;
      }
      unsigned int terminalSubType = v6->_terminalSubType;
      if (terminalSubType > 0xB) {
        goto LABEL_100;
      }
      if (((1 << terminalSubType) & 0xCF0) == 0)
      {
        if (terminalSubType != 1 || ![(NSArray *)v6->_tciArray count]) {
          goto LABEL_100;
        }
        v85 = [(NSArray *)v6->_tciArray objectAtIndexedSubscript:0];
        p_super = v85;
        if (v85 && (unint64_t)[v85 length] >= 3)
        {
          p_super = p_super;
          uint64_t v86 = [p_super bytes];
          BOOL v87 = *(_WORD *)v86 == 3841 && *(unsigned __int8 *)(v86 + 2) == 255;
          if (v87)
          {
            v88 = (const void **)MEMORY[0x1E4FBA898];
            dispatch_get_specific((const void *)*MEMORY[0x1E4FBA898]);
            uint64_t v89 = NFLogGetLogger();
            if (v89)
            {
              v90 = (void (*)(uint64_t, const char *, ...))v89;
              v91 = object_getClass(v6);
              BOOL v92 = class_isMetaClass(v91);
              v93 = object_getClassName(v6);
              v115 = sel_getName(a2);
              BOOL v87 = !v92;
              v88 = (const void **)MEMORY[0x1E4FBA898];
              uint64_t v94 = 45;
              if (!v87) {
                uint64_t v94 = 43;
              }
              v90(6, "%c[%{public}s %{public}s]:%i Charger TCI detected", v94, v93, v115, 629);
            }
            dispatch_get_specific(*v88);
            v95 = NFSharedLogGetLogger();
            if (os_log_type_enabled(v95, OS_LOG_TYPE_DEFAULT))
            {
              v96 = object_getClass(v6);
              if (class_isMetaClass(v96)) {
                int v97 = 43;
              }
              else {
                int v97 = 45;
              }
              v98 = object_getClassName(v6);
              v99 = sel_getName(a2);
              *(_DWORD *)buf = 67109890;
              int v120 = v97;
              __int16 v121 = 2082;
              v122 = v98;
              __int16 v123 = 2082;
              v124 = v99;
              __int16 v125 = 1024;
              int v126 = 629;
              _os_log_impl(&dword_19D636000, v95, OS_LOG_TYPE_DEFAULT, "%c[%{public}s %{public}s]:%i Charger TCI detected", buf, 0x22u);
            }

            v6->_unint64_t terminalType = 0;
            v6->_unsigned int terminalSubType = 1;
            [(NFFieldNotification *)v6 setCategory:5];
          }
        }
LABEL_99:

LABEL_100:
LABEL_101:
        v39 = v6;
        goto LABEL_102;
      }
      if (v24 == 11) {
        goto LABEL_68;
      }
      v71 = (const void **)MEMORY[0x1E4FBA898];
      dispatch_get_specific((const void *)*MEMORY[0x1E4FBA898]);
      uint64_t v72 = NFLogGetLogger();
      if (v72)
      {
        v73 = (void (*)(uint64_t, const char *, ...))v72;
        v74 = object_getClass(v6);
        BOOL v75 = class_isMetaClass(v74);
        v76 = object_getClassName(v6);
        v114 = sel_getName(a2);
        uint64_t v77 = 45;
        if (v75) {
          uint64_t v77 = 43;
        }
        v73(4, "%c[%{public}s %{public}s]:%i Expected reader identifier but ECP frame does not contain it.", v77, v76, v114, 621);
      }
      dispatch_get_specific(*v71);
      p_super = NFSharedLogGetLogger();
      if (!os_log_type_enabled(p_super, OS_LOG_TYPE_ERROR)) {
        goto LABEL_99;
      }
      v78 = object_getClass(v6);
      if (class_isMetaClass(v78)) {
        int v79 = 43;
      }
      else {
        int v79 = 45;
      }
      v80 = object_getClassName(v6);
      v81 = sel_getName(a2);
      *(_DWORD *)buf = 67109890;
      int v120 = v79;
      __int16 v121 = 2082;
      v122 = v80;
      __int16 v123 = 2082;
      v124 = v81;
      __int16 v125 = 1024;
      int v126 = 621;
      v65 = "%c[%{public}s %{public}s]:%i Expected reader identifier but ECP frame does not contain it.";
    }
    v66 = p_super;
    uint32_t v67 = 34;
LABEL_98:
    _os_log_impl(&dword_19D636000, v66, OS_LOG_TYPE_ERROR, v65, buf, v67);
    goto LABEL_99;
  }
  v8 = (const void **)MEMORY[0x1E4FBA898];
  dispatch_get_specific((const void *)*MEMORY[0x1E4FBA898]);
  uint64_t v9 = NFLogGetLogger();
  if (v9)
  {
    v10 = (void (*)(uint64_t, const char *, ...))v9;
    uint64_t v11 = object_getClass(v6);
    BOOL v12 = class_isMetaClass(v11);
    uint64_t v13 = object_getClassName(v6);
    v112 = sel_getName(a2);
    uint64_t v14 = 45;
    if (v12) {
      uint64_t v14 = 43;
    }
    v10(4, "%c[%{public}s %{public}s]:%i Frame packet length shorter than expected", v14, v13, v112, 505);
  }
  dispatch_get_specific(*v8);
  uint64_t v15 = NFSharedLogGetLogger();
  if (!os_log_type_enabled(v15, OS_LOG_TYPE_ERROR)) {
    goto LABEL_26;
  }
  uint64_t v16 = object_getClass(v6);
  if (class_isMetaClass(v16)) {
    int v17 = 43;
  }
  else {
    int v17 = 45;
  }
  uint64_t v18 = object_getClassName(v6);
  uint64_t v19 = sel_getName(a2);
  *(_DWORD *)buf = 67109890;
  int v120 = v17;
  __int16 v121 = 2082;
  v122 = v18;
  __int16 v123 = 2082;
  v124 = v19;
  __int16 v125 = 1024;
  int v126 = 505;
  uint64_t v20 = "%c[%{public}s %{public}s]:%i Frame packet length shorter than expected";
LABEL_25:
  _os_log_impl(&dword_19D636000, v15, OS_LOG_TYPE_ERROR, v20, buf, 0x22u);
LABEL_26:

  v39 = 0;
LABEL_102:

  return v39;
}

- (NFFieldNotificationECP2_0)initWithNotificationType:(unint64_t)a3 rfTechnology:(unsigned int)a4 typeFSystemCode:(unsigned __int16)a5 creationDate:(id)a6 cachedBeforeRFReset:(BOOL)a7 odaRequired:(BOOL)a8 terminalMode:(unsigned int)a9 terminalType:(unint64_t)a10 terminalSubType:(unsigned __int8)a11 tciArray:(id)a12 openLoopSchemeBitfield:(id)a13 homeKitSchemeDataPayload:(id)a14 readerIdentifier:(id)a15 pairingMode:(unsigned int)a16 terminalTypeData:(id)a17 ignoreRFTechOnIsEqual:(BOOL)a18 userInfo:(id)a19
{
  BOOL v31 = a7;
  uint64_t v19 = a5;
  uint64_t v20 = *(void *)&a4;
  id v35 = a12;
  id v34 = a13;
  id v33 = a14;
  id v32 = a15;
  id v23 = a17;
  id v24 = a19;
  v36.receiver = self;
  v36.super_class = (Class)NFFieldNotificationECP2_0;
  v25 = [(NFFieldNotification *)&v36 initWithNotificationType:a3 rfTechnology:v20 typeFSystemCode:v19 creationDate:a6 cachedBeforeRFReset:v31];
  uint64_t v26 = v25;
  if (v25)
  {
    v25->_BOOL odaRequired = a8;
    v25->_terminalMode = a9;
    v25->_unint64_t terminalType = a10;
    v25->_unsigned int terminalSubType = a11;
    objc_storeStrong((id *)&v25->_tciArray, a12);
    objc_storeStrong((id *)&v26->_openLoopSchemeBitfield, a13);
    objc_storeStrong((id *)&v26->_homeKitSchemeDataPayload, a14);
    objc_storeStrong((id *)&v26->_readerIdentifier, a15);
    v26->_pairingMode = a16;
    objc_storeStrong((id *)&v26->_terminalTypeData, a17);
    v26->_ignoreRFTechOnIsEqual = a18;
    objc_storeStrong((id *)&v26->_userInfo, a19);
    [(NFFieldNotificationECP2_0 *)v26 _initCategoryWithType:a10];
    unsigned int v27 = v26;
  }

  return v26;
}

- (void)_initCategoryWithType:(unint64_t)a3
{
  if (a3 - 1 >= 5) {
    unint64_t v3 = 0;
  }
  else {
    unint64_t v3 = a3 + 3;
  }
  [(NFFieldNotification *)self setCategory:v3];
}

- (id)description
{
  unint64_t v3 = objc_opt_new();
  if ([(NFFieldNotification *)self rfTechnology]) {
    [v3 appendString:@"A,"];
  }
  if (([(NFFieldNotification *)self rfTechnology] & 2) != 0) {
    [v3 appendString:@"B,"];
  }
  if (([(NFFieldNotification *)self rfTechnology] & 4) != 0) {
    [v3 appendString:@"F,"];
  }
  if (([(NFFieldNotification *)self rfTechnology] & 0x10) != 0) {
    [v3 appendString:@"V,"];
  }
  if (([(NFFieldNotification *)self rfTechnology] & 8) != 0) {
    [v3 appendString:@"ECP,"];
  }
  if (![v3 length]) {
    [v3 appendString:@"None"];
  }
  switch(self->_terminalType)
  {
    case 0uLL:
      id v4 = [NSString alloc];
      ClassName = object_getClassName(self);
      BOOL odaRequired = self->_odaRequired;
      uint64_t terminalMode = self->_terminalMode;
      unint64_t terminalType = self->_terminalType;
      uint64_t terminalSubType = self->_terminalSubType;
      v10 = [(NFFieldNotification *)self _creationDateString];
      v60 = v10;
      unint64_t v62 = [(NFFieldNotification *)self cachedBeforeRFReset];
      unint64_t v56 = terminalType;
      uint64_t v58 = terminalSubType;
      BOOL v52 = odaRequired;
      uint64_t v54 = terminalMode;
      uint64_t v11 = @"<%s: tech=[%@], oda=%d, terminalMode=%lu, terminalType=%lu, terminalSubType=%d, date=%@, cached=%d>";
      goto LABEL_23;
    case 1uLL:
      id v72 = [NSString alloc];
      v69 = object_getClassName(self);
      unsigned int v12 = [(NFFieldNotification *)self typeFSystemCode];
      BOOL v13 = self->_odaRequired;
      unint64_t v14 = self->_terminalMode;
      unint64_t v15 = self->_terminalType;
      uint64_t v16 = (NSArray *)self->_terminalSubType;
      tciArray = self->_tciArray;
      openLoopSchemeBitfield = self->_openLoopSchemeBitfield;
      v10 = [(NFFieldNotification *)self _creationDateString];
      unint64_t v67 = (unint64_t)v10;
      uint64_t v68 = [(NFFieldNotification *)self cachedBeforeRFReset];
      v63 = tciArray;
      v65 = openLoopSchemeBitfield;
      unint64_t v59 = v15;
      int v61 = v16;
      BOOL v55 = v13;
      unint64_t v57 = v14;
      v51 = v3;
      uint64_t v53 = v12;
      uint64_t v19 = @"<%s: tech=[%@] sc=0x%X, oda=%d, terminalMode=%lu, terminalType=%lu, terminalSubType=%d, tcis=%@, openLoop=%@, date=%@, cached=%d>";
      uint64_t v50 = v69;
      goto LABEL_27;
    case 2uLL:
      if (self->_terminalSubType == 4)
      {
        id v72 = [NSString alloc];
        uint64_t v20 = object_getClassName(self);
        unsigned int v21 = [(NFFieldNotification *)self typeFSystemCode];
        BOOL v22 = self->_odaRequired;
        unint64_t v23 = self->_terminalMode;
        unint64_t v24 = self->_terminalType;
        v25 = (NSArray *)self->_terminalSubType;
        homeKitSchemeDataPayload = self->_homeKitSchemeDataPayload;
        v10 = [(NFFieldNotification *)self _creationDateString];
        v65 = (NSData *)v10;
        unint64_t v67 = [(NFFieldNotification *)self cachedBeforeRFReset];
        int v61 = v25;
        v63 = homeKitSchemeDataPayload;
        unint64_t v57 = v23;
        unint64_t v59 = v24;
        uint64_t v53 = v21;
        BOOL v55 = v22;
        uint64_t v19 = @"<%s: tech=%@ sc=0x%X, oda=%d, terminalMode=%lu, terminalType=%lu, terminalSubType=%d, homeKitPayload=%@, date=%@, cached=%d>";
      }
      else
      {
        uint64_t pairingMode = (int)self->_pairingMode;
        if (pairingMode > 2) {
          objc_super v36 = &stru_1EEF24A78;
        }
        else {
          objc_super v36 = off_1E595E590[pairingMode];
        }
        v71 = v36;
        id v72 = [NSString alloc];
        uint64_t v20 = object_getClassName(self);
        BOOL v43 = self->_odaRequired;
        uint64_t v44 = self->_terminalMode;
        unint64_t v45 = self->_terminalType;
        unint64_t v46 = self->_terminalSubType;
        v47 = self->_tciArray;
        readerIdentifier = self->_readerIdentifier;
        v10 = [(NFFieldNotification *)self _creationDateString];
        unint64_t v67 = (unint64_t)v10;
        uint64_t v68 = [(NFFieldNotification *)self cachedBeforeRFReset];
        v63 = v71;
        v65 = readerIdentifier;
        unint64_t v59 = v46;
        int v61 = v47;
        BOOL v55 = v44;
        unint64_t v57 = v45;
        uint64_t v53 = v43;
        uint64_t v19 = @"<%s: tech=[%@], oda=%d, terminalMode=%lu, terminalType=%lu, terminalSubType=%d, tcis=%@, pairingMode=%@ readerIdentifier=%@, date=%@, cached=%d>";
      }
      uint64_t v50 = v20;
      v51 = v3;
LABEL_27:
      uint64_t v42 = objc_msgSend(v72, "initWithFormat:", v19, v50, v51, v53, v55, v57, v59, v61, v63, v65, v67, v68);
      goto LABEL_28;
    case 5uLL:
      if (self->_terminalSubType) {
        goto LABEL_19;
      }
      id v4 = [NSString alloc];
      ClassName = object_getClassName(self);
      BOOL v37 = self->_odaRequired;
      uint64_t v38 = self->_terminalMode;
      unint64_t v39 = self->_terminalType;
      uint64_t v40 = self->_terminalSubType;
      userInfo = self->_userInfo;
      v10 = [(NFFieldNotification *)self _creationDateString];
      unint64_t v62 = (unint64_t)v10;
      uint64_t v64 = [(NFFieldNotification *)self cachedBeforeRFReset];
      uint64_t v58 = v40;
      v60 = userInfo;
      uint64_t v54 = v38;
      unint64_t v56 = v39;
      BOOL v52 = v37;
      uint64_t v11 = @"<%s: tech=[%@], oda=%d, terminalMode=%lu, terminalType=%lu, terminalSubType=%d, userInfo=%@, date=%@, cached=%d>";
LABEL_23:
      uint64_t v42 = objc_msgSend(v4, "initWithFormat:", v11, ClassName, v3, v52, v54, v56, v58, v60, v62, v64, v66, v68);
LABEL_28:
      id v34 = (void *)v42;
      break;
    default:
LABEL_19:
      id v73 = [NSString alloc];
      v70 = object_getClassName(self);
      unsigned int v27 = [(NFFieldNotification *)self typeFSystemCode];
      BOOL v28 = self->_odaRequired;
      uint64_t v29 = self->_terminalMode;
      unint64_t v30 = self->_terminalType;
      uint64_t v31 = self->_terminalSubType;
      v10 = [(NSData *)self->_terminalTypeData debugDescription];
      id v32 = self->_readerIdentifier;
      id v33 = [(NFFieldNotification *)self _creationDateString];
      id v34 = (void *)[v73 initWithFormat:@"<%s: tech=[%@] sc=0x%X, oda=%d, terminalMode=%lu, terminalType=%lu, terminalSubType=%d, terminalTypeData=%@, readerIdentifier=%@, date=%@, cached=%d>", v70, v3, v27, v28, v29, v30, v31, v10, v32, v33, -[NFFieldNotification cachedBeforeRFReset](self, "cachedBeforeRFReset")];

      break;
  }

  return v34;
}

- (BOOL)isEqual:(id)a3
{
  uint64_t v69 = *MEMORY[0x1E4F143B8];
  id v5 = (NFFieldNotificationECP2_0 *)a3;
  if (v5 == self)
  {
    BOOL v19 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      uint64_t v6 = v5;
      BOOL v7 = [(NFFieldNotificationECP2_0 *)v6 odaRequired];
      if (v7 != [(NFFieldNotificationECP2_0 *)self odaRequired]) {
        goto LABEL_47;
      }
      uint64_t v8 = [(NFFieldNotificationECP2_0 *)v6 terminalType];
      if (v8 != [(NFFieldNotificationECP2_0 *)self terminalType]) {
        goto LABEL_47;
      }
      int v9 = [(NFFieldNotificationECP2_0 *)v6 terminalSubType];
      if (v9 != [(NFFieldNotificationECP2_0 *)self terminalSubType]) {
        goto LABEL_47;
      }
      unsigned int v10 = [(NFFieldNotificationECP2_0 *)v6 terminalMode];
      if (v10 != [(NFFieldNotificationECP2_0 *)self terminalMode]) {
        goto LABEL_47;
      }
      uint64_t v11 = [(NFFieldNotificationECP2_0 *)v6 tciArray];
      uint64_t v12 = [v11 count];
      BOOL v13 = [(NFFieldNotificationECP2_0 *)self tciArray];
      uint64_t v14 = [v13 count];

      if (v12 != v14) {
        goto LABEL_47;
      }
      unint64_t v15 = [(NFFieldNotificationECP2_0 *)v6 tciArray];
      if ([v15 count])
      {
        uint64_t v16 = [(NFFieldNotificationECP2_0 *)v6 tciArray];
        int v17 = [(NFFieldNotificationECP2_0 *)self tciArray];
        int v18 = [v16 isEqualToArray:v17];

        if (!v18) {
          goto LABEL_47;
        }
      }
      else
      {
      }
      uint64_t v20 = [(NFFieldNotificationECP2_0 *)v6 openLoopSchemeBitfield];
      uint64_t v21 = [v20 length];
      BOOL v22 = [(NFFieldNotificationECP2_0 *)self openLoopSchemeBitfield];
      uint64_t v23 = [v22 length];

      if (v21 != v23) {
        goto LABEL_47;
      }
      uint64_t v24 = [(NFFieldNotificationECP2_0 *)v6 openLoopSchemeBitfield];
      if (v24)
      {
        v25 = (void *)v24;
        uint64_t v26 = [(NFFieldNotificationECP2_0 *)v6 openLoopSchemeBitfield];
        unsigned int v27 = [(NFFieldNotificationECP2_0 *)self openLoopSchemeBitfield];
        int v28 = [v26 isEqualToData:v27];

        if (!v28) {
          goto LABEL_47;
        }
      }
      uint64_t v29 = [(NFFieldNotificationECP2_0 *)v6 readerIdentifier];
      unint64_t v30 = (void *)[v29 length];
      uint64_t v31 = [(NFFieldNotificationECP2_0 *)self readerIdentifier];
      uint64_t v32 = [v31 length];

      if (v30 != (void *)v32) {
        goto LABEL_47;
      }
      id v33 = [(NFFieldNotificationECP2_0 *)v6 readerIdentifier];
      if ([v33 length])
      {
        unint64_t v30 = [(NFFieldNotificationECP2_0 *)v6 readerIdentifier];
        id v34 = [(NFFieldNotificationECP2_0 *)self readerIdentifier];
        int v35 = [v30 isEqualToData:v34];

        if (!v35) {
          goto LABEL_47;
        }
      }
      else
      {
      }
      unsigned int v36 = [(NFFieldNotificationECP2_0 *)v6 pairingMode];
      if (v36 != [(NFFieldNotificationECP2_0 *)self pairingMode])
      {
LABEL_47:
        BOOL v19 = 0;
LABEL_48:

        goto LABEL_49;
      }
      if ([(NFFieldNotificationECP2_0 *)self terminalType] != 5
        || [(NFFieldNotificationECP2_0 *)self terminalSubType])
      {
LABEL_25:
        if ([(NFFieldNotificationECP2_0 *)self ignoreRFTechOnIsEqual])
        {
          v60.receiver = self;
          v60.super_class = (Class)NFFieldNotificationECP2_0;
          unsigned __int8 v37 = [(NFFieldNotification *)&v60 isEqualWithoutRFTech:v6];
        }
        else
        {
          v59.receiver = self;
          v59.super_class = (Class)NFFieldNotificationECP2_0;
          unsigned __int8 v37 = [(NFFieldNotification *)&v59 isEqual:v6];
        }
        BOOL v19 = v37;
        goto LABEL_48;
      }
      uint64_t v38 = [(NFFieldNotificationECP2_0 *)self userInfo];
      uint64_t v39 = [v38 count];
      if (v39
        || ([(NFFieldNotificationECP2_0 *)v6 userInfo],
            unint64_t v30 = objc_claimAutoreleasedReturnValue(),
            ![v30 count]))
      {
        uint64_t v40 = [(NFFieldNotificationECP2_0 *)self userInfo];
        if ([v40 count])
        {
          uint64_t v41 = [(NFFieldNotificationECP2_0 *)v6 userInfo];
          uint64_t v42 = [v41 count];

          if (!v39) {
          if (!v42)
          }
            goto LABEL_47;
        }
        else
        {

          if (!v39) {
        }
          }
        BOOL v43 = [(NFFieldNotificationECP2_0 *)v6 userInfo];
        uint64_t v38 = [v43 objectForKey:@"CHCfgBytes"];

        uint64_t v44 = [(NFFieldNotificationECP2_0 *)self userInfo];
        unint64_t v30 = [v44 objectForKey:@"CHCfgBytes"];

        if ((v38 || !v30) && (!v38 || v30))
        {
          int v45 = [v38 unsignedShortValue];
          if (v45 != [v30 unsignedShortValue])
          {
            unsigned __int8 v46 = [v38 unsignedShortValue];
            if ((([v30 unsignedShortValue] ^ v46) & 3) != 0) {
              goto LABEL_46;
            }
            v48 = (const void **)MEMORY[0x1E4FBA898];
            dispatch_get_specific((const void *)*MEMORY[0x1E4FBA898]);
            uint64_t Logger = NFLogGetLogger();
            if (Logger)
            {
              uint64_t v50 = (void (*)(uint64_t, const char *, ...))Logger;
              Class = object_getClass(self);
              BOOL isMetaClass = class_isMetaClass(Class);
              ClassName = object_getClassName(self);
              Name = sel_getName(a2);
              uint64_t v54 = 45;
              if (isMetaClass) {
                uint64_t v54 = 43;
              }
              v50(4, "%c[%{public}s %{public}s]:%i Contains undefined RFU bits but existing feature definition matches", v54, ClassName, Name, 869);
            }
            dispatch_get_specific(*v48);
            BOOL v55 = NFSharedLogGetLogger();
            if (os_log_type_enabled(v55, OS_LOG_TYPE_ERROR))
            {
              unint64_t v56 = object_getClass(self);
              if (class_isMetaClass(v56)) {
                int v57 = 43;
              }
              else {
                int v57 = 45;
              }
              *(_DWORD *)buf = 67109890;
              int v62 = v57;
              __int16 v63 = 2082;
              uint64_t v64 = object_getClassName(self);
              __int16 v65 = 2082;
              uint64_t v66 = sel_getName(a2);
              __int16 v67 = 1024;
              int v68 = 869;
              _os_log_impl(&dword_19D636000, v55, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i Contains undefined RFU bits but existing feature definition matches", buf, 0x22u);
            }
          }
          goto LABEL_25;
        }
      }
LABEL_46:

      goto LABEL_47;
    }
    BOOL v19 = 0;
  }
LABEL_49:

  return v19;
}

- (id)_parseCHTerminalTypeData:(id)a3
{
  uint64_t v93 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  uint64_t v6 = (unsigned __int8 *)[v5 bytes];
  if ((unint64_t)[v5 length] <= 2)
  {
    BOOL v7 = (const void **)MEMORY[0x1E4FBA898];
    dispatch_get_specific((const void *)*MEMORY[0x1E4FBA898]);
    uint64_t Logger = NFLogGetLogger();
    if (Logger)
    {
      int v9 = (void (*)(uint64_t, const char *, ...))Logger;
      Class = object_getClass(self);
      BOOL isMetaClass = class_isMetaClass(Class);
      ClassName = object_getClassName(self);
      Name = sel_getName(a2);
      uint64_t v13 = 45;
      if (isMetaClass) {
        uint64_t v13 = 43;
      }
      v9(6, "%c[%{public}s %{public}s]:%i Missing minimum required length", v13, ClassName, Name, 889);
    }
    dispatch_get_specific(*v7);
    uint64_t v14 = NFSharedLogGetLogger();
    if (!os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_32;
    }
    unint64_t v15 = object_getClass(self);
    if (class_isMetaClass(v15)) {
      int v16 = 43;
    }
    else {
      int v16 = 45;
    }
    *(_DWORD *)buf = 67109890;
    int v84 = v16;
    __int16 v85 = 2082;
    uint64_t v86 = object_getClassName(self);
    __int16 v87 = 2082;
    v88 = sel_getName(a2);
    __int16 v89 = 1024;
    int v90 = 889;
    int v17 = "%c[%{public}s %{public}s]:%i Missing minimum required length";
LABEL_31:
    _os_log_impl(&dword_19D636000, v14, OS_LOG_TYPE_DEFAULT, v17, buf, 0x22u);
LABEL_32:
    uint64_t v40 = 0;
    goto LABEL_69;
  }
  uint64_t v18 = *v6;
  if (!*v6)
  {
    uint64_t v31 = (const void **)MEMORY[0x1E4FBA898];
    dispatch_get_specific((const void *)*MEMORY[0x1E4FBA898]);
    uint64_t v32 = NFLogGetLogger();
    if (v32)
    {
      id v33 = (void (*)(uint64_t, const char *, ...))v32;
      id v34 = object_getClass(self);
      BOOL v35 = class_isMetaClass(v34);
      unsigned int v36 = object_getClassName(self);
      int v79 = sel_getName(a2);
      uint64_t v37 = 45;
      if (v35) {
        uint64_t v37 = 43;
      }
      v33(6, "%c[%{public}s %{public}s]:%i Minimal version not met", v37, v36, v79, 897);
    }
    dispatch_get_specific(*v31);
    uint64_t v14 = NFSharedLogGetLogger();
    if (!os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_32;
    }
    uint64_t v38 = object_getClass(self);
    if (class_isMetaClass(v38)) {
      int v39 = 43;
    }
    else {
      int v39 = 45;
    }
    *(_DWORD *)buf = 67109890;
    int v84 = v39;
    __int16 v85 = 2082;
    uint64_t v86 = object_getClassName(self);
    __int16 v87 = 2082;
    v88 = sel_getName(a2);
    __int16 v89 = 1024;
    int v90 = 897;
    int v17 = "%c[%{public}s %{public}s]:%i Minimal version not met";
    goto LABEL_31;
  }
  uint64_t v14 = objc_opt_new();
  BOOL v19 = (void *)[objc_alloc(NSNumber) initWithUnsignedChar:v18];
  [v14 setObject:v19 forKeyedSubscript:@"CHVersion"];

  uint64_t v20 = (void *)[objc_alloc(NSNumber) initWithUnsignedShort:bswap32(*(unsigned __int16 *)(v6 + 1)) >> 16];
  [v14 setObject:v20 forKeyedSubscript:@"CHCfgBytes"];

  if ((unint64_t)[v5 length] > 8)
  {
    if ((unint64_t)[v5 length] >= 0xA)
    {
      uint64_t v41 = (const void **)MEMORY[0x1E4FBA898];
      dispatch_get_specific((const void *)*MEMORY[0x1E4FBA898]);
      uint64_t v42 = NFLogGetLogger();
      if (v42)
      {
        BOOL v43 = (void (*)(uint64_t, const char *, ...))v42;
        uint64_t v44 = object_getClass(self);
        BOOL v45 = class_isMetaClass(v44);
        unsigned __int8 v46 = object_getClassName(self);
        v80 = sel_getName(a2);
        uint64_t v47 = 45;
        if (v45) {
          uint64_t v47 = 43;
        }
        v43(4, "%c[%{public}s %{public}s]:%i Truncates excess to expected data length", v47, v46, v80, 913);
      }
      dispatch_get_specific(*v41);
      v48 = NFSharedLogGetLogger();
      if (os_log_type_enabled(v48, OS_LOG_TYPE_ERROR))
      {
        unint64_t v49 = object_getClass(self);
        if (class_isMetaClass(v49)) {
          int v50 = 43;
        }
        else {
          int v50 = 45;
        }
        *(_DWORD *)buf = 67109890;
        int v84 = v50;
        __int16 v85 = 2082;
        uint64_t v86 = object_getClassName(self);
        __int16 v87 = 2082;
        v88 = sel_getName(a2);
        __int16 v89 = 1024;
        int v90 = 913;
        _os_log_impl(&dword_19D636000, v48, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i Truncates excess to expected data length", buf, 0x22u);
      }
    }
    uint64_t v51 = [objc_alloc(MEMORY[0x1E4F1C9B8]) initWithBytes:v6 + 3 length:6];
    if (v51)
    {
      int v28 = v51;
      if (v18 != 1)
      {
        BOOL v52 = (const void **)MEMORY[0x1E4FBA898];
        dispatch_get_specific((const void *)*MEMORY[0x1E4FBA898]);
        uint64_t v53 = NFLogGetLogger();
        if (v53)
        {
          uint64_t v54 = (void (*)(uint64_t, const char *, ...))v53;
          BOOL v55 = object_getClass(self);
          BOOL v56 = class_isMetaClass(v55);
          v76 = object_getClassName(self);
          v81 = sel_getName(a2);
          uint64_t v57 = 45;
          if (v56) {
            uint64_t v57 = 43;
          }
          v54(4, "%c[%{public}s %{public}s]:%i Assume random in detected version %{public}d", v57, v76, v81, 925, v18);
        }
        dispatch_get_specific(*v52);
        uint64_t v58 = NFSharedLogGetLogger();
        if (os_log_type_enabled(v58, OS_LOG_TYPE_ERROR))
        {
          objc_super v59 = object_getClass(self);
          if (class_isMetaClass(v59)) {
            int v60 = 43;
          }
          else {
            int v60 = 45;
          }
          int v61 = object_getClassName(self);
          int v62 = sel_getName(a2);
          *(_DWORD *)buf = 67110146;
          int v84 = v60;
          __int16 v85 = 2082;
          uint64_t v86 = v61;
          __int16 v87 = 2082;
          v88 = v62;
          __int16 v89 = 1024;
          int v90 = 925;
          __int16 v91 = 1026;
          int v92 = v18;
          _os_log_impl(&dword_19D636000, v58, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i Assume random in detected version %{public}d", buf, 0x28u);
        }
      }
      [v14 setObject:v28 forKeyedSubscript:@"CHRemoteRandom"];
      uint64_t v40 = v14;
      goto LABEL_68;
    }
    __int16 v63 = (const void **)MEMORY[0x1E4FBA898];
    dispatch_get_specific((const void *)*MEMORY[0x1E4FBA898]);
    uint64_t v64 = NFLogGetLogger();
    if (v64)
    {
      __int16 v65 = (void (*)(uint64_t, const char *, ...))v64;
      uint64_t v66 = object_getClass(self);
      BOOL v67 = class_isMetaClass(v66);
      int v68 = object_getClassName(self);
      uint64_t v82 = sel_getName(a2);
      uint64_t v69 = 45;
      if (v67) {
        uint64_t v69 = 43;
      }
      v65(3, "%c[%{public}s %{public}s]:%i out of resource", v69, v68, v82, 918);
    }
    dispatch_get_specific(*v63);
    v70 = NFSharedLogGetLogger();
    if (os_log_type_enabled(v70, OS_LOG_TYPE_ERROR))
    {
      v71 = object_getClass(self);
      if (class_isMetaClass(v71)) {
        int v72 = 43;
      }
      else {
        int v72 = 45;
      }
      id v73 = object_getClassName(self);
      v74 = sel_getName(a2);
      *(_DWORD *)buf = 67109890;
      int v84 = v72;
      __int16 v85 = 2082;
      uint64_t v86 = v73;
      __int16 v87 = 2082;
      v88 = v74;
      __int16 v89 = 1024;
      int v90 = 918;
      _os_log_impl(&dword_19D636000, v70, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i out of resource", buf, 0x22u);
    }

    int v28 = 0;
  }
  else
  {
    uint64_t v21 = (const void **)MEMORY[0x1E4FBA898];
    dispatch_get_specific((const void *)*MEMORY[0x1E4FBA898]);
    uint64_t v22 = NFLogGetLogger();
    if (v22)
    {
      uint64_t v23 = (void (*)(uint64_t, const char *, ...))v22;
      uint64_t v24 = object_getClass(self);
      BOOL v25 = class_isMetaClass(v24);
      uint64_t v26 = object_getClassName(self);
      v78 = sel_getName(a2);
      uint64_t v27 = 45;
      if (v25) {
        uint64_t v27 = 43;
      }
      v23(6, "%c[%{public}s %{public}s]:%i Missing random", v27, v26, v78, 907);
    }
    dispatch_get_specific(*v21);
    int v28 = NFSharedLogGetLogger();
    if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v29 = object_getClass(self);
      if (class_isMetaClass(v29)) {
        int v30 = 43;
      }
      else {
        int v30 = 45;
      }
      *(_DWORD *)buf = 67109890;
      int v84 = v30;
      __int16 v85 = 2082;
      uint64_t v86 = object_getClassName(self);
      __int16 v87 = 2082;
      v88 = sel_getName(a2);
      __int16 v89 = 1024;
      int v90 = 907;
      _os_log_impl(&dword_19D636000, v28, OS_LOG_TYPE_DEFAULT, "%c[%{public}s %{public}s]:%i Missing random", buf, 0x22u);
    }
  }
  uint64_t v40 = 0;
LABEL_68:

LABEL_69:
  return v40;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = [NFFieldNotificationECP2_0 alloc];
  unint64_t v5 = [(NFFieldNotification *)self notificationType];
  uint64_t v6 = [(NFFieldNotification *)self rfTechnology];
  uint64_t v7 = [(NFFieldNotification *)self typeFSystemCode];
  uint64_t v8 = [(NFFieldNotification *)self creationDate];
  BOOL v9 = [(NFFieldNotification *)self cachedBeforeRFReset];
  LOBYTE(v15) = self->_ignoreRFTechOnIsEqual;
  LODWORD(v14) = self->_pairingMode;
  LOBYTE(v13) = self->_terminalSubType;
  LODWORD(v12) = self->_terminalMode;
  unsigned int v10 = -[NFFieldNotificationECP2_0 initWithNotificationType:rfTechnology:typeFSystemCode:creationDate:cachedBeforeRFReset:odaRequired:terminalMode:terminalType:terminalSubType:tciArray:openLoopSchemeBitfield:homeKitSchemeDataPayload:readerIdentifier:pairingMode:terminalTypeData:ignoreRFTechOnIsEqual:userInfo:](v4, "initWithNotificationType:rfTechnology:typeFSystemCode:creationDate:cachedBeforeRFReset:odaRequired:terminalMode:terminalType:terminalSubType:tciArray:openLoopSchemeBitfield:homeKitSchemeDataPayload:readerIdentifier:pairingMode:terminalTypeData:ignoreRFTechOnIsEqual:userInfo:", v5, v6, v7, v8, v9, self->_odaRequired, v12, self->_terminalType, v13, self->_tciArray, self->_openLoopSchemeBitfield, self->_homeKitSchemeDataPayload, self->_readerIdentifier, v14, self->_terminalTypeData,
          v15,
          self->_userInfo);

  return v10;
}

- (BOOL)odaRequired
{
  return self->_odaRequired;
}

- (unsigned)terminalMode
{
  return self->_terminalMode;
}

- (unint64_t)terminalType
{
  return self->_terminalType;
}

- (unsigned)terminalSubType
{
  return self->_terminalSubType;
}

- (NSArray)tciArray
{
  return (NSArray *)objc_getProperty(self, a2, 64, 1);
}

- (NSData)openLoopSchemeBitfield
{
  return (NSData *)objc_getProperty(self, a2, 72, 1);
}

- (NSData)homeKitSchemeDataPayload
{
  return (NSData *)objc_getProperty(self, a2, 80, 1);
}

- (NSData)readerIdentifier
{
  return self->_readerIdentifier;
}

- (unsigned)pairingMode
{
  return self->_pairingMode;
}

- (NSData)terminalTypeData
{
  return (NSData *)objc_getProperty(self, a2, 96, 1);
}

- (BOOL)ignoreRFTechOnIsEqual
{
  return self->_ignoreRFTechOnIsEqual;
}

- (void)setIgnoreRFTechOnIsEqual:(BOOL)a3
{
  self->_ignoreRFTechOnIsEqual = a3;
}

- (NSMutableDictionary)userInfo
{
  return self->_userInfo;
}

- (void)setUserInfo:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_userInfo, 0);
  objc_storeStrong((id *)&self->_terminalTypeData, 0);
  objc_storeStrong((id *)&self->_readerIdentifier, 0);
  objc_storeStrong((id *)&self->_homeKitSchemeDataPayload, 0);
  objc_storeStrong((id *)&self->_openLoopSchemeBitfield, 0);
  objc_storeStrong((id *)&self->_tciArray, 0);
}

@end