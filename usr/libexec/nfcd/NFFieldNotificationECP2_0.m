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
    v5->_terminalType = (unint64_t)[v4 decodeIntegerForKey:@"terminalType"];
    v5->_terminalSubType = [v4 decodeIntegerForKey:@"terminalSubType"];
    uint64_t v6 = +[NFNSCheckedDecoder coder:v4 decodeArrayOfClass:objc_opt_class() forKey:@"tciArray"];
    tciArray = v5->_tciArray;
    v5->_tciArray = (NSArray *)v6;

    id v8 = [objc_alloc((Class)NSSet) initWithObjects:objc_opt_class(), 0];
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
    id v27 = objc_alloc((Class)NSSet);
    uint64_t v26 = objc_opt_class();
    uint64_t v15 = objc_opt_class();
    uint64_t v16 = objc_opt_class();
    uint64_t v17 = objc_opt_class();
    uint64_t v18 = objc_opt_class();
    uint64_t v19 = objc_opt_class();
    uint64_t v20 = objc_opt_class();
    uint64_t v21 = objc_opt_class();
    id v22 = [v27 initWithObjects:v26, v15, v16, v17, v18, v19, v20, v21, objc_opt_class(), 0];
    uint64_t v23 = [v4 decodeObjectOfClasses:v22 forKey:@"userInfo"];
    userInfo = v5->_userInfo;
    v5->_userInfo = (NSMutableDictionary *)v23;
  }
  return v5;
}

- (NFFieldNotificationECP2_0)initWithDictionary:(id)a3
{
  id v5 = a3;
  v112.receiver = self;
  v112.super_class = (Class)NFFieldNotificationECP2_0;
  uint64_t v6 = [(NFFieldNotification *)&v112 initWithDictionary:v5];
  if (!v6) {
    goto LABEL_101;
  }
  v7 = [v5 objectForKey:@"ECPData"];
  if ((unint64_t)[v7 length] > 4)
  {
    [(NFFieldNotification *)v6 setNotificationType:3];
    id v20 = v7;
    uint64_t v21 = (unsigned __int8 *)[v20 bytes];
    unsigned int v22 = v21[2];
    uint64_t v23 = (unsigned char *)(v22 & 0xF);
    if ((char *)[v20 length] - 5 != v23)
    {
      dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
      uint64_t Logger = NFLogGetLogger();
      if (Logger)
      {
        objc_super v28 = (void (*)(uint64_t, const char *, ...))Logger;
        Class = object_getClass(v6);
        BOOL isMetaClass = class_isMetaClass(Class);
        ClassName = object_getClassName(v6);
        Name = sel_getName(a2);
        uint64_t v32 = 45;
        if (isMetaClass) {
          uint64_t v32 = 43;
        }
        v28(4, "%c[%{public}s %{public}s]:%i Invalid terminal type data length", v32, ClassName, Name, 532);
      }
      dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
      v14 = NFSharedLogGetLogger();
      if (!os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
        goto LABEL_26;
      }
      v33 = object_getClass(v6);
      if (class_isMetaClass(v33)) {
        int v34 = 43;
      }
      else {
        int v34 = 45;
      }
      v35 = object_getClassName(v6);
      v36 = sel_getName(a2);
      *(_DWORD *)buf = 67109890;
      int v114 = v34;
      __int16 v115 = 2082;
      v116 = v35;
      __int16 v117 = 2082;
      v118 = v36;
      __int16 v119 = 1024;
      int v120 = 532;
      uint64_t v19 = "%c[%{public}s %{public}s]:%i Invalid terminal type data length";
      goto LABEL_25;
    }
    v6->_BOOL odaRequired = (v22 & 0x40) == 0;
    v6->_unint64_t terminalType = v21[3];
    v6->_terminalMode = (v22 >> 5) & 4;
    v6->_unsigned int terminalSubType = v21[4];
    v6->_pairingMode = 0;
    v24 = [v5 objectForKey:@"IgnoreRFTechOnIsEqual"];
    v6->_ignoreRFTechOnIsEqual = [v24 BOOLValue];

    [(NFFieldNotificationECP2_0 *)v6 _initCategoryWithType:v6->_terminalType];
    unint64_t terminalType = v6->_terminalType;
    if (terminalType == 2)
    {
      if ((v6->_terminalSubType - 8) > 3u) {
        unsigned int v26 = 0;
      }
      else {
        unsigned int v26 = dword_100284670[(char)(v6->_terminalSubType - 8)];
      }
      v6->_pairingMode = v26;
      unint64_t terminalType = v6->_terminalType;
    }
    if (terminalType > 2 || v23 < 3)
    {
      if (!v23) {
        goto LABEL_38;
      }
    }
    else
    {
      v38 = [v20 subdataWithRange:NSMakeRange(5, 3)];
      v123 = v38;
      uint64_t v39 = +[NSArray arrayWithObjects:&v123 count:1];
      tciArray = v6->_tciArray;
      v6->_tciArray = (NSArray *)v39;

      unint64_t terminalType = v6->_terminalType;
    }
    if (terminalType == 5 && !v6->_terminalSubType)
    {
      v41 = [v20 subdataWithRange:5, v23];
      v42 = [(NFFieldNotificationECP2_0 *)v6 _parseCHTerminalTypeData:v41];

      if ([v42 count])
      {
        v43 = (NSMutableDictionary *)[objc_alloc((Class)NSMutableDictionary) initWithDictionary:v42];
        userInfo = v6->_userInfo;
        v6->_userInfo = v43;
      }
    }
LABEL_38:
    openLoopSchemeBitfield = v6->_openLoopSchemeBitfield;
    v6->_openLoopSchemeBitfield = 0;

    homeKitSchemeDataPayload = v6->_homeKitSchemeDataPayload;
    v6->_homeKitSchemeDataPayload = 0;

    unint64_t v47 = v6->_terminalType;
    if (v47 == 1)
    {
      if ([v20 length] == (id)13)
      {
        uint64_t v48 = [v20 subdataWithRange:8, 5];
        p_super = &v6->_openLoopSchemeBitfield->super;
        v6->_openLoopSchemeBitfield = (NSData *)v48;
        goto LABEL_99;
      }
      unint64_t v47 = v6->_terminalType;
    }
    if (v47 == 2 && v6->_terminalSubType == 4)
    {
      if ((unint64_t)[v20 length] <= 0xF)
      {
        dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
        uint64_t v50 = NFLogGetLogger();
        if (v50)
        {
          v51 = (void (*)(uint64_t, const char *, ...))v50;
          v52 = object_getClass(v6);
          BOOL v53 = class_isMetaClass(v52);
          v54 = object_getClassName(v6);
          v55 = sel_getName(a2);
          id v111 = [v20 length];
          uint64_t v56 = 45;
          if (v53) {
            uint64_t v56 = 43;
          }
          v51(4, "%c[%{public}s %{public}s]:%i Invalid data length %lu", v56, v54, v55, 591, v111);
        }
        dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
        p_super = NFSharedLogGetLogger();
        if (!os_log_type_enabled(p_super, OS_LOG_TYPE_ERROR)) {
          goto LABEL_99;
        }
        v57 = object_getClass(v6);
        if (class_isMetaClass(v57)) {
          int v58 = 43;
        }
        else {
          int v58 = 45;
        }
        v59 = object_getClassName(v6);
        v60 = sel_getName(a2);
        id v61 = [v20 length];
        *(_DWORD *)buf = 67110146;
        int v114 = v58;
        __int16 v115 = 2082;
        v116 = v59;
        __int16 v117 = 2082;
        v118 = v60;
        __int16 v119 = 1024;
        int v120 = 591;
        __int16 v121 = 2048;
        id v122 = v61;
        v62 = "%c[%{public}s %{public}s]:%i Invalid data length %lu";
        v63 = p_super;
        uint32_t v64 = 44;
        goto LABEL_98;
      }
      uint64_t v78 = [v20 subdataWithRange:2, 14];
      v79 = v6->_homeKitSchemeDataPayload;
      v6->_homeKitSchemeDataPayload = (NSData *)v78;

      if (v23 == 11)
      {
LABEL_68:
        uint64_t v80 = [v20 subdataWithRange:8, 8];
        p_super = &v6->_readerIdentifier->super;
        v6->_readerIdentifier = (NSData *)v80;
        goto LABEL_99;
      }
      dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
      uint64_t v95 = NFLogGetLogger();
      if (v95)
      {
        v96 = (void (*)(uint64_t, const char *, ...))v95;
        v97 = object_getClass(v6);
        BOOL v98 = class_isMetaClass(v97);
        v99 = object_getClassName(v6);
        v110 = sel_getName(a2);
        uint64_t v100 = 45;
        if (v98) {
          uint64_t v100 = 43;
        }
        v96(4, "%c[%{public}s %{public}s]:%i Expected reader identifier but ECP frame does not contain it.", v100, v99, v110, 601);
      }
      dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
      p_super = NFSharedLogGetLogger();
      if (!os_log_type_enabled(p_super, OS_LOG_TYPE_ERROR)) {
        goto LABEL_99;
      }
      v101 = object_getClass(v6);
      if (class_isMetaClass(v101)) {
        int v102 = 43;
      }
      else {
        int v102 = 45;
      }
      v103 = object_getClassName(v6);
      v104 = sel_getName(a2);
      *(_DWORD *)buf = 67109890;
      int v114 = v102;
      __int16 v115 = 2082;
      v116 = v103;
      __int16 v117 = 2082;
      v118 = v104;
      __int16 v119 = 1024;
      int v120 = 601;
      v62 = "%c[%{public}s %{public}s]:%i Expected reader identifier but ECP frame does not contain it.";
    }
    else
    {
      uint64_t v65 = objc_opt_new();
      v66 = v6->_openLoopSchemeBitfield;
      v6->_openLoopSchemeBitfield = (NSData *)v65;

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
        v81 = [(NSArray *)v6->_tciArray objectAtIndexedSubscript:0];
        p_super = v81;
        if (v81 && (unint64_t)[v81 length] >= 3)
        {
          p_super = p_super;
          v82 = (unsigned __int8 *)[p_super bytes];
          if (*(_WORD *)v82 == 3841 && v82[2] == 255)
          {
            dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
            uint64_t v84 = NFLogGetLogger();
            if (v84)
            {
              v85 = (void (*)(uint64_t, const char *, ...))v84;
              v86 = object_getClass(v6);
              BOOL v87 = class_isMetaClass(v86);
              v88 = object_getClassName(v6);
              v109 = sel_getName(a2);
              uint64_t v89 = 45;
              if (v87) {
                uint64_t v89 = 43;
              }
              v85(6, "%c[%{public}s %{public}s]:%i Charger TCI detected", v89, v88, v109, 629);
            }
            dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
            v90 = NFSharedLogGetLogger();
            if (os_log_type_enabled(v90, OS_LOG_TYPE_DEFAULT))
            {
              v91 = object_getClass(v6);
              if (class_isMetaClass(v91)) {
                int v92 = 43;
              }
              else {
                int v92 = 45;
              }
              v93 = object_getClassName(v6);
              v94 = sel_getName(a2);
              *(_DWORD *)buf = 67109890;
              int v114 = v92;
              __int16 v115 = 2082;
              v116 = v93;
              __int16 v117 = 2082;
              v118 = v94;
              __int16 v119 = 1024;
              int v120 = 629;
              _os_log_impl((void *)&_mh_execute_header, v90, OS_LOG_TYPE_DEFAULT, "%c[%{public}s %{public}s]:%i Charger TCI detected", buf, 0x22u);
            }

            v6->_unint64_t terminalType = 0;
            v6->_unsigned int terminalSubType = 1;
            [(NFFieldNotification *)v6 setCategory:5];
          }
        }
LABEL_99:

LABEL_100:
LABEL_101:
        v37 = v6;
        goto LABEL_102;
      }
      if (v23 == 11) {
        goto LABEL_68;
      }
      dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
      uint64_t v68 = NFLogGetLogger();
      if (v68)
      {
        v69 = (void (*)(uint64_t, const char *, ...))v68;
        v70 = object_getClass(v6);
        BOOL v71 = class_isMetaClass(v70);
        v72 = object_getClassName(v6);
        v108 = sel_getName(a2);
        uint64_t v73 = 45;
        if (v71) {
          uint64_t v73 = 43;
        }
        v69(4, "%c[%{public}s %{public}s]:%i Expected reader identifier but ECP frame does not contain it.", v73, v72, v108, 621);
      }
      dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
      p_super = NFSharedLogGetLogger();
      if (!os_log_type_enabled(p_super, OS_LOG_TYPE_ERROR)) {
        goto LABEL_99;
      }
      v74 = object_getClass(v6);
      if (class_isMetaClass(v74)) {
        int v75 = 43;
      }
      else {
        int v75 = 45;
      }
      v76 = object_getClassName(v6);
      v77 = sel_getName(a2);
      *(_DWORD *)buf = 67109890;
      int v114 = v75;
      __int16 v115 = 2082;
      v116 = v76;
      __int16 v117 = 2082;
      v118 = v77;
      __int16 v119 = 1024;
      int v120 = 621;
      v62 = "%c[%{public}s %{public}s]:%i Expected reader identifier but ECP frame does not contain it.";
    }
    v63 = p_super;
    uint32_t v64 = 34;
LABEL_98:
    _os_log_impl((void *)&_mh_execute_header, v63, OS_LOG_TYPE_ERROR, v62, buf, v64);
    goto LABEL_99;
  }
  dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
  uint64_t v8 = NFLogGetLogger();
  if (v8)
  {
    uint64_t v9 = (void (*)(uint64_t, const char *, ...))v8;
    v10 = object_getClass(v6);
    BOOL v11 = class_isMetaClass(v10);
    v12 = object_getClassName(v6);
    v106 = sel_getName(a2);
    uint64_t v13 = 45;
    if (v11) {
      uint64_t v13 = 43;
    }
    v9(4, "%c[%{public}s %{public}s]:%i Frame packet length shorter than expected", v13, v12, v106, 505);
  }
  dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
  v14 = NFSharedLogGetLogger();
  if (!os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
    goto LABEL_26;
  }
  uint64_t v15 = object_getClass(v6);
  if (class_isMetaClass(v15)) {
    int v16 = 43;
  }
  else {
    int v16 = 45;
  }
  uint64_t v17 = object_getClassName(v6);
  uint64_t v18 = sel_getName(a2);
  *(_DWORD *)buf = 67109890;
  int v114 = v16;
  __int16 v115 = 2082;
  v116 = v17;
  __int16 v117 = 2082;
  v118 = v18;
  __int16 v119 = 1024;
  int v120 = 505;
  uint64_t v19 = "%c[%{public}s %{public}s]:%i Frame packet length shorter than expected";
LABEL_25:
  _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_ERROR, v19, buf, 0x22u);
LABEL_26:

  v37 = 0;
LABEL_102:

  return v37;
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
  unsigned int v26 = v25;
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
    id v27 = v26;
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
      id v4 = objc_alloc((Class)NSString);
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
      CFStringRef v11 = @"<%s: tech=[%@], oda=%d, terminalMode=%lu, terminalType=%lu, terminalSubType=%d, date=%@, cached=%d>";
      goto LABEL_23;
    case 1uLL:
      id v72 = objc_alloc((Class)NSString);
      v69 = object_getClassName(self);
      unsigned int v12 = [(NFFieldNotification *)self typeFSystemCode];
      BOOL v13 = self->_odaRequired;
      unint64_t v14 = self->_terminalMode;
      unint64_t v15 = self->_terminalType;
      int v16 = (NSArray *)self->_terminalSubType;
      tciArray = self->_tciArray;
      openLoopSchemeBitfield = self->_openLoopSchemeBitfield;
      v10 = [(NFFieldNotification *)self _creationDateString];
      unint64_t v67 = (unint64_t)v10;
      uint64_t v68 = [(NFFieldNotification *)self cachedBeforeRFReset];
      v63 = tciArray;
      uint64_t v65 = openLoopSchemeBitfield;
      unint64_t v59 = v15;
      id v61 = v16;
      BOOL v55 = v13;
      unint64_t v57 = v14;
      v51 = v3;
      uint64_t v53 = v12;
      CFStringRef v19 = @"<%s: tech=[%@] sc=0x%X, oda=%d, terminalMode=%lu, terminalType=%lu, terminalSubType=%d, tcis=%@, openLoop=%@, date=%@, cached=%d>";
      uint64_t v50 = v69;
      goto LABEL_27;
    case 2uLL:
      if (self->_terminalSubType == 4)
      {
        id v72 = objc_alloc((Class)NSString);
        uint64_t v20 = object_getClassName(self);
        unsigned int v21 = [(NFFieldNotification *)self typeFSystemCode];
        BOOL v22 = self->_odaRequired;
        unint64_t v23 = self->_terminalMode;
        unint64_t v24 = self->_terminalType;
        v25 = (NSArray *)self->_terminalSubType;
        homeKitSchemeDataPayload = self->_homeKitSchemeDataPayload;
        v10 = [(NFFieldNotification *)self _creationDateString];
        uint64_t v65 = (NSData *)v10;
        unint64_t v67 = [(NFFieldNotification *)self cachedBeforeRFReset];
        id v61 = v25;
        v63 = homeKitSchemeDataPayload;
        unint64_t v57 = v23;
        unint64_t v59 = v24;
        uint64_t v53 = v21;
        BOOL v55 = v22;
        CFStringRef v19 = @"<%s: tech=%@ sc=0x%X, oda=%d, terminalMode=%lu, terminalType=%lu, terminalSubType=%d, homeKitPayload=%@, date=%@, cached=%d>";
      }
      else
      {
        uint64_t pairingMode = (int)self->_pairingMode;
        if (pairingMode > 2) {
          CFStringRef v36 = &stru_100309C40;
        }
        else {
          CFStringRef v36 = *(&off_1003087C8 + pairingMode);
        }
        CFStringRef v71 = v36;
        id v72 = objc_alloc((Class)NSString);
        uint64_t v20 = object_getClassName(self);
        BOOL v43 = self->_odaRequired;
        uint64_t v44 = self->_terminalMode;
        unint64_t v45 = self->_terminalType;
        unint64_t v46 = self->_terminalSubType;
        unint64_t v47 = self->_tciArray;
        readerIdentifier = self->_readerIdentifier;
        v10 = [(NFFieldNotification *)self _creationDateString];
        unint64_t v67 = (unint64_t)v10;
        uint64_t v68 = [(NFFieldNotification *)self cachedBeforeRFReset];
        v63 = (void *)v71;
        uint64_t v65 = readerIdentifier;
        unint64_t v59 = v46;
        id v61 = v47;
        BOOL v55 = v44;
        unint64_t v57 = v45;
        uint64_t v53 = v43;
        CFStringRef v19 = @"<%s: tech=[%@], oda=%d, terminalMode=%lu, terminalType=%lu, terminalSubType=%d, tcis=%@, pairingMode=%@ readerIdentifier=%@, date=%@, cached=%d>";
      }
      uint64_t v50 = v20;
      v51 = v3;
LABEL_27:
      id v42 = [v72 initWithFormat:v19, v50, v51, v53, v55, v57, v59, v61, v63, v65, v67, v68];
      goto LABEL_28;
    case 5uLL:
      if (self->_terminalSubType) {
        goto LABEL_19;
      }
      id v4 = objc_alloc((Class)NSString);
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
      CFStringRef v11 = @"<%s: tech=[%@], oda=%d, terminalMode=%lu, terminalType=%lu, terminalSubType=%d, userInfo=%@, date=%@, cached=%d>";
LABEL_23:
      id v42 = [v4 initWithFormat:v11, ClassName, v3, v52, v54, v56, v58, v60, v62, v64, v66, v68];
LABEL_28:
      id v34 = v42;
      break;
    default:
LABEL_19:
      id v73 = objc_alloc((Class)NSString);
      v70 = object_getClassName(self);
      unsigned int v27 = [(NFFieldNotification *)self typeFSystemCode];
      BOOL v28 = self->_odaRequired;
      uint64_t v29 = self->_terminalMode;
      unint64_t v30 = self->_terminalType;
      uint64_t v31 = self->_terminalSubType;
      v10 = [(NSData *)self->_terminalTypeData debugDescription];
      id v32 = self->_readerIdentifier;
      id v33 = [(NFFieldNotification *)self _creationDateString];
      id v34 = [v73 initWithFormat:@"<%s: tech=[%@] sc=0x%X, oda=%d, terminalMode=%lu, terminalType=%lu, terminalSubType=%d, terminalTypeData=%@, readerIdentifier=%@, date=%@, cached=%d>", v70, v3, v27, v28, v29, v30, v31, v10, v32, v33, -[NFFieldNotification cachedBeforeRFReset](self, "cachedBeforeRFReset")];

      break;
  }

  return v34;
}

- (BOOL)isEqual:(id)a3
{
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
      unsigned int v7 = [(NFFieldNotificationECP2_0 *)v6 odaRequired];
      if (v7 != [(NFFieldNotificationECP2_0 *)self odaRequired]) {
        goto LABEL_47;
      }
      id v8 = [(NFFieldNotificationECP2_0 *)v6 terminalType];
      if (v8 != (id)[(NFFieldNotificationECP2_0 *)self terminalType]) {
        goto LABEL_47;
      }
      unsigned int v9 = [(NFFieldNotificationECP2_0 *)v6 terminalSubType];
      if (v9 != [(NFFieldNotificationECP2_0 *)self terminalSubType]) {
        goto LABEL_47;
      }
      unsigned int v10 = [(NFFieldNotificationECP2_0 *)v6 terminalMode];
      if (v10 != [(NFFieldNotificationECP2_0 *)self terminalMode]) {
        goto LABEL_47;
      }
      CFStringRef v11 = [(NFFieldNotificationECP2_0 *)v6 tciArray];
      id v12 = [v11 count];
      BOOL v13 = [(NFFieldNotificationECP2_0 *)self tciArray];
      id v14 = [v13 count];

      if (v12 != v14) {
        goto LABEL_47;
      }
      unint64_t v15 = [(NFFieldNotificationECP2_0 *)v6 tciArray];
      if ([v15 count])
      {
        int v16 = [(NFFieldNotificationECP2_0 *)v6 tciArray];
        uint64_t v17 = [(NFFieldNotificationECP2_0 *)self tciArray];
        unsigned int v18 = [v16 isEqualToArray:v17];

        if (!v18) {
          goto LABEL_47;
        }
      }
      else
      {
      }
      uint64_t v20 = [(NFFieldNotificationECP2_0 *)v6 openLoopSchemeBitfield];
      id v21 = [v20 length];
      BOOL v22 = [(NFFieldNotificationECP2_0 *)self openLoopSchemeBitfield];
      id v23 = [v22 length];

      if (v21 != v23) {
        goto LABEL_47;
      }
      uint64_t v24 = [(NFFieldNotificationECP2_0 *)v6 openLoopSchemeBitfield];
      if (v24)
      {
        v25 = (void *)v24;
        unsigned int v26 = [(NFFieldNotificationECP2_0 *)v6 openLoopSchemeBitfield];
        unsigned int v27 = [(NFFieldNotificationECP2_0 *)self openLoopSchemeBitfield];
        unsigned int v28 = [v26 isEqualToData:v27];

        if (!v28) {
          goto LABEL_47;
        }
      }
      uint64_t v29 = [(NFFieldNotificationECP2_0 *)v6 readerIdentifier];
      id v30 = [v29 length];
      uint64_t v31 = [(NFFieldNotificationECP2_0 *)self readerIdentifier];
      id v32 = [v31 length];

      if (v30 != v32) {
        goto LABEL_47;
      }
      id v33 = [(NFFieldNotificationECP2_0 *)v6 readerIdentifier];
      if ([v33 length])
      {
        id v30 = [(NFFieldNotificationECP2_0 *)v6 readerIdentifier];
        id v34 = [(NFFieldNotificationECP2_0 *)self readerIdentifier];
        unsigned int v35 = [v30 isEqualToData:v34];

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
      if ((id)[(NFFieldNotificationECP2_0 *)self terminalType] != (id)5
        || [(NFFieldNotificationECP2_0 *)self terminalSubType])
      {
LABEL_25:
        if ([(NFFieldNotificationECP2_0 *)self ignoreRFTechOnIsEqual])
        {
          v59.receiver = self;
          v59.super_class = (Class)NFFieldNotificationECP2_0;
          unsigned __int8 v37 = [(NFFieldNotification *)&v59 isEqualWithoutRFTech:v6];
        }
        else
        {
          v58.receiver = self;
          v58.super_class = (Class)NFFieldNotificationECP2_0;
          unsigned __int8 v37 = [(NFFieldNotification *)&v58 isEqual:v6];
        }
        BOOL v19 = v37;
        goto LABEL_48;
      }
      uint64_t v38 = [(NFFieldNotificationECP2_0 *)self userInfo];
      id v39 = [v38 count];
      if (v39
        || ([(NFFieldNotificationECP2_0 *)v6 userInfo],
            id v30 = (id)objc_claimAutoreleasedReturnValue(),
            ![v30 count]))
      {
        uint64_t v40 = [(NFFieldNotificationECP2_0 *)self userInfo];
        if ([v40 count])
        {
          v41 = [(NFFieldNotificationECP2_0 *)v6 userInfo];
          id v42 = [v41 count];

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
        id v30 = [v44 objectForKey:@"CHCfgBytes"];

        if ((v38 || !v30) && (!v38 || v30))
        {
          unsigned int v45 = [v38 unsignedShortValue];
          if (v45 != [v30 unsignedShortValue])
          {
            unsigned __int8 v46 = [v38 unsignedShortValue];
            if ((([v30 unsignedShortValue] ^ v46) & 3) != 0) {
              goto LABEL_46;
            }
            dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
            uint64_t Logger = NFLogGetLogger();
            if (Logger)
            {
              v49 = (void (*)(uint64_t, const char *, ...))Logger;
              Class = object_getClass(self);
              BOOL isMetaClass = class_isMetaClass(Class);
              ClassName = object_getClassName(self);
              Name = sel_getName(a2);
              uint64_t v53 = 45;
              if (isMetaClass) {
                uint64_t v53 = 43;
              }
              v49(4, "%c[%{public}s %{public}s]:%i Contains undefined RFU bits but existing feature definition matches", v53, ClassName, Name, 869);
            }
            dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
            uint64_t v54 = NFSharedLogGetLogger();
            if (os_log_type_enabled(v54, OS_LOG_TYPE_ERROR))
            {
              BOOL v55 = object_getClass(self);
              if (class_isMetaClass(v55)) {
                int v56 = 43;
              }
              else {
                int v56 = 45;
              }
              *(_DWORD *)buf = 67109890;
              int v61 = v56;
              __int16 v62 = 2082;
              v63 = object_getClassName(self);
              __int16 v64 = 2082;
              uint64_t v65 = sel_getName(a2);
              __int16 v66 = 1024;
              int v67 = 869;
              _os_log_impl((void *)&_mh_execute_header, v54, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i Contains undefined RFU bits but existing feature definition matches", buf, 0x22u);
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
  id v5 = a3;
  uint64_t v6 = (unsigned __int8 *)[v5 bytes];
  if ((unint64_t)[v5 length] <= 2)
  {
    dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    uint64_t Logger = NFLogGetLogger();
    if (Logger)
    {
      id v8 = (void (*)(uint64_t, const char *, ...))Logger;
      Class = object_getClass(self);
      BOOL isMetaClass = class_isMetaClass(Class);
      ClassName = object_getClassName(self);
      Name = sel_getName(a2);
      uint64_t v12 = 45;
      if (isMetaClass) {
        uint64_t v12 = 43;
      }
      v8(6, "%c[%{public}s %{public}s]:%i Missing minimum required length", v12, ClassName, Name, 889);
    }
    dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    BOOL v13 = NFSharedLogGetLogger();
    if (!os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_32;
    }
    id v14 = object_getClass(self);
    if (class_isMetaClass(v14)) {
      int v15 = 43;
    }
    else {
      int v15 = 45;
    }
    *(_DWORD *)buf = 67109890;
    int v78 = v15;
    __int16 v79 = 2082;
    uint64_t v80 = object_getClassName(self);
    __int16 v81 = 2082;
    v82 = sel_getName(a2);
    __int16 v83 = 1024;
    int v84 = 889;
    int v16 = "%c[%{public}s %{public}s]:%i Missing minimum required length";
LABEL_31:
    _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, v16, buf, 0x22u);
LABEL_32:
    unsigned __int8 v37 = 0;
    goto LABEL_69;
  }
  uint64_t v17 = *v6;
  if (!*v6)
  {
    dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    uint64_t v29 = NFLogGetLogger();
    if (v29)
    {
      id v30 = (void (*)(uint64_t, const char *, ...))v29;
      uint64_t v31 = object_getClass(self);
      BOOL v32 = class_isMetaClass(v31);
      id v33 = object_getClassName(self);
      id v73 = sel_getName(a2);
      uint64_t v34 = 45;
      if (v32) {
        uint64_t v34 = 43;
      }
      v30(6, "%c[%{public}s %{public}s]:%i Minimal version not met", v34, v33, v73, 897);
    }
    dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    BOOL v13 = NFSharedLogGetLogger();
    if (!os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_32;
    }
    unsigned int v35 = object_getClass(self);
    if (class_isMetaClass(v35)) {
      int v36 = 43;
    }
    else {
      int v36 = 45;
    }
    *(_DWORD *)buf = 67109890;
    int v78 = v36;
    __int16 v79 = 2082;
    uint64_t v80 = object_getClassName(self);
    __int16 v81 = 2082;
    v82 = sel_getName(a2);
    __int16 v83 = 1024;
    int v84 = 897;
    int v16 = "%c[%{public}s %{public}s]:%i Minimal version not met";
    goto LABEL_31;
  }
  BOOL v13 = objc_opt_new();
  id v18 = [objc_alloc((Class)NSNumber) initWithUnsignedChar:v17];
  [v13 setObject:v18 forKeyedSubscript:@"CHVersion"];

  id v19 = [objc_alloc((Class)NSNumber) initWithUnsignedShort:bswap32(*(unsigned __int16 *)(v6 + 1)) >> 16];
  [v13 setObject:v19 forKeyedSubscript:@"CHCfgBytes"];

  if ((unint64_t)[v5 length] > 8)
  {
    if ((unint64_t)[v5 length] >= 0xA)
    {
      dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
      uint64_t v38 = NFLogGetLogger();
      if (v38)
      {
        id v39 = (void (*)(uint64_t, const char *, ...))v38;
        uint64_t v40 = object_getClass(self);
        BOOL v41 = class_isMetaClass(v40);
        id v42 = object_getClassName(self);
        v74 = sel_getName(a2);
        uint64_t v43 = 45;
        if (v41) {
          uint64_t v43 = 43;
        }
        v39(4, "%c[%{public}s %{public}s]:%i Truncates excess to expected data length", v43, v42, v74, 913);
      }
      dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
      uint64_t v44 = NFSharedLogGetLogger();
      if (os_log_type_enabled(v44, OS_LOG_TYPE_ERROR))
      {
        unsigned int v45 = object_getClass(self);
        if (class_isMetaClass(v45)) {
          int v46 = 43;
        }
        else {
          int v46 = 45;
        }
        *(_DWORD *)buf = 67109890;
        int v78 = v46;
        __int16 v79 = 2082;
        uint64_t v80 = object_getClassName(self);
        __int16 v81 = 2082;
        v82 = sel_getName(a2);
        __int16 v83 = 1024;
        int v84 = 913;
        _os_log_impl((void *)&_mh_execute_header, v44, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i Truncates excess to expected data length", buf, 0x22u);
      }
    }
    unint64_t v47 = [objc_alloc((Class)NSData) initWithBytes:v6 + 3 length:6];
    if (v47)
    {
      unsigned int v26 = v47;
      if (v17 != 1)
      {
        dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
        uint64_t v48 = NFLogGetLogger();
        if (v48)
        {
          v49 = (void (*)(uint64_t, const char *, ...))v48;
          uint64_t v50 = object_getClass(self);
          BOOL v51 = class_isMetaClass(v50);
          v70 = object_getClassName(self);
          int v75 = sel_getName(a2);
          uint64_t v52 = 45;
          if (v51) {
            uint64_t v52 = 43;
          }
          v49(4, "%c[%{public}s %{public}s]:%i Assume random in detected version %{public}d", v52, v70, v75, 925, v17);
        }
        dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
        uint64_t v53 = NFSharedLogGetLogger();
        if (os_log_type_enabled(v53, OS_LOG_TYPE_ERROR))
        {
          uint64_t v54 = object_getClass(self);
          if (class_isMetaClass(v54)) {
            int v55 = 43;
          }
          else {
            int v55 = 45;
          }
          int v56 = object_getClassName(self);
          unint64_t v57 = sel_getName(a2);
          *(_DWORD *)buf = 67110146;
          int v78 = v55;
          __int16 v79 = 2082;
          uint64_t v80 = v56;
          __int16 v81 = 2082;
          v82 = v57;
          __int16 v83 = 1024;
          int v84 = 925;
          __int16 v85 = 1026;
          int v86 = v17;
          _os_log_impl((void *)&_mh_execute_header, v53, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i Assume random in detected version %{public}d", buf, 0x28u);
        }
      }
      [v13 setObject:v26 forKeyedSubscript:@"CHRemoteRandom"];
      unsigned __int8 v37 = v13;
      goto LABEL_68;
    }
    dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    uint64_t v58 = NFLogGetLogger();
    if (v58)
    {
      objc_super v59 = (void (*)(uint64_t, const char *, ...))v58;
      v60 = object_getClass(self);
      BOOL v61 = class_isMetaClass(v60);
      __int16 v62 = object_getClassName(self);
      v76 = sel_getName(a2);
      uint64_t v63 = 45;
      if (v61) {
        uint64_t v63 = 43;
      }
      v59(3, "%c[%{public}s %{public}s]:%i out of resource", v63, v62, v76, 918);
    }
    dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    __int16 v64 = NFSharedLogGetLogger();
    if (os_log_type_enabled(v64, OS_LOG_TYPE_ERROR))
    {
      uint64_t v65 = object_getClass(self);
      if (class_isMetaClass(v65)) {
        int v66 = 43;
      }
      else {
        int v66 = 45;
      }
      int v67 = object_getClassName(self);
      uint64_t v68 = sel_getName(a2);
      *(_DWORD *)buf = 67109890;
      int v78 = v66;
      __int16 v79 = 2082;
      uint64_t v80 = v67;
      __int16 v81 = 2082;
      v82 = v68;
      __int16 v83 = 1024;
      int v84 = 918;
      _os_log_impl((void *)&_mh_execute_header, v64, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i out of resource", buf, 0x22u);
    }

    unsigned int v26 = 0;
  }
  else
  {
    dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    uint64_t v20 = NFLogGetLogger();
    if (v20)
    {
      id v21 = (void (*)(uint64_t, const char *, ...))v20;
      BOOL v22 = object_getClass(self);
      BOOL v23 = class_isMetaClass(v22);
      uint64_t v24 = object_getClassName(self);
      id v72 = sel_getName(a2);
      uint64_t v25 = 45;
      if (v23) {
        uint64_t v25 = 43;
      }
      v21(6, "%c[%{public}s %{public}s]:%i Missing random", v25, v24, v72, 907);
    }
    dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    unsigned int v26 = NFSharedLogGetLogger();
    if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
    {
      unsigned int v27 = object_getClass(self);
      if (class_isMetaClass(v27)) {
        int v28 = 43;
      }
      else {
        int v28 = 45;
      }
      *(_DWORD *)buf = 67109890;
      int v78 = v28;
      __int16 v79 = 2082;
      uint64_t v80 = object_getClassName(self);
      __int16 v81 = 2082;
      v82 = sel_getName(a2);
      __int16 v83 = 1024;
      int v84 = 907;
      _os_log_impl((void *)&_mh_execute_header, v26, OS_LOG_TYPE_DEFAULT, "%c[%{public}s %{public}s]:%i Missing random", buf, 0x22u);
    }
  }
  unsigned __int8 v37 = 0;
LABEL_68:

LABEL_69:

  return v37;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = [NFFieldNotificationECP2_0 alloc];
  unint64_t v5 = [(NFFieldNotification *)self notificationType];
  uint64_t v6 = [(NFFieldNotification *)self rfTechnology];
  uint64_t v7 = [(NFFieldNotification *)self typeFSystemCode];
  id v8 = [(NFFieldNotification *)self creationDate];
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