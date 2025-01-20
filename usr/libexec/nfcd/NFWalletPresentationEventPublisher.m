@interface NFWalletPresentationEventPublisher
- (NFWalletPresentationEventPublisher)init;
- (unint64_t)walletDomain;
- (void)dealloc;
- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6;
@end

@implementation NFWalletPresentationEventPublisher

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  id v69 = a3;
  id v11 = a4;
  id v12 = a5;
  v13 = v12;
  if (off_100344D20 == a6 || off_100344D18 == a6)
  {
    dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    uint64_t Logger = NFLogGetLogger();
    v16 = "PK";
    if (Logger)
    {
      v17 = (void (*)(uint64_t, const char *, ...))Logger;
      id v68 = v11;
      Class = object_getClass(self);
      if (class_isMetaClass(Class)) {
        uint64_t v19 = 43;
      }
      else {
        uint64_t v19 = 45;
      }
      ClassName = object_getClassName(self);
      v21 = a2;
      Name = sel_getName(a2);
      if (off_100344D20 == a6) {
        v16 = "SESD";
      }
      if (self) {
        sesdDefaults = self->_sesdDefaults;
      }
      else {
        sesdDefaults = 0;
      }
      v24 = sesdDefaults;
      v17(6, "%c[%{public}s %{public}s]:%i %{public}sDoubleClick changed=%{public}@, domain=%{public}lu", v19, ClassName, Name, 179, v16, v13, [(NFWalletPresentationSettingsSESD *)v24 walletDomain]);

      id v11 = v68;
      a2 = v21;
      v16 = "PK";
    }
    dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    v25 = NFSharedLogGetLogger();
    if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
    {
      id v26 = v11;
      v27 = object_getClass(self);
      if (class_isMetaClass(v27)) {
        int v28 = 43;
      }
      else {
        int v28 = 45;
      }
      v29 = object_getClassName(self);
      v30 = a2;
      v31 = sel_getName(a2);
      if (off_100344D20 == a6) {
        v16 = "SESD";
      }
      if (self) {
        v32 = self->_sesdDefaults;
      }
      else {
        v32 = 0;
      }
      *(_DWORD *)buf = 67110658;
      *(_DWORD *)&buf[4] = v28;
      *(_WORD *)v76 = 2082;
      *(void *)&v76[2] = v29;
      *(_WORD *)&v76[10] = 2082;
      *(void *)&v76[12] = v31;
      *(_WORD *)&v76[20] = 1024;
      *(_DWORD *)&v76[22] = 179;
      *(_WORD *)&v76[26] = 2082;
      *(void *)&v76[28] = v16;
      *(_WORD *)&v76[36] = 2114;
      *(void *)&v76[38] = v13;
      __int16 v77 = 2050;
      unint64_t v78 = [(NFWalletPresentationSettingsSESD *)v32 walletDomain];
      _os_log_impl((void *)&_mh_execute_header, v25, OS_LOG_TYPE_DEFAULT, "%c[%{public}s %{public}s]:%i %{public}sDoubleClick changed=%{public}@, domain=%{public}lu", buf, 0x40u);
      a2 = v30;
      id v11 = v26;
    }

    v33 = [v13 objectForKeyedSubscript:NSKeyValueChangeNewKey];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v74[0] = _NSConcreteStackBlock;
      v74[1] = 3221225472;
      v74[2] = sub_100056850;
      v74[3] = &unk_100301C40;
      v74[4] = self;
      v74[5] = a2;
      os_unfair_lock_lock(&self->_updateLock);
      sub_100056850((uint64_t)v74);
      os_unfair_lock_unlock(&self->_updateLock);
    }
    else
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        sub_100001940((os_unfair_lock_s *)self);
      }
      else
      {
        v36 = a2;
        dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
        uint64_t v37 = NFLogGetLogger();
        if (v37)
        {
          v38 = (void (*)(uint64_t, const char *, ...))v37;
          v39 = object_getClass(self);
          BOOL isMetaClass = class_isMetaClass(v39);
          v41 = object_getClassName(self);
          v67 = sel_getName(v36);
          uint64_t v42 = 45;
          if (isMetaClass) {
            uint64_t v42 = 43;
          }
          v38(3, "%c[%{public}s %{public}s]:%i Unexpected state; dropping update", v42, v41, v67, 193);
        }
        dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
        v43 = NFSharedLogGetLogger();
        if (os_log_type_enabled(v43, OS_LOG_TYPE_ERROR))
        {
          v44 = object_getClass(self);
          if (class_isMetaClass(v44)) {
            int v45 = 43;
          }
          else {
            int v45 = 45;
          }
          v46 = object_getClassName(self);
          v47 = sel_getName(v36);
          *(_DWORD *)buf = 67109890;
          *(_DWORD *)&buf[4] = v45;
          *(_WORD *)v76 = 2082;
          *(void *)&v76[2] = v46;
          *(_WORD *)&v76[10] = 2082;
          *(void *)&v76[12] = v47;
          *(_WORD *)&v76[20] = 1024;
          *(_DWORD *)&v76[22] = 193;
          _os_log_impl((void *)&_mh_execute_header, v43, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i Unexpected state; dropping update",
            buf,
            0x22u);
        }
      }
    }
    goto LABEL_43;
  }
  if (off_100344D30 == a6)
  {
    v33 = [v12 objectForKeyedSubscript:NSKeyValueChangeNewKey];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v71[0] = _NSConcreteStackBlock;
      v71[1] = 3221225472;
      v71[2] = sub_1000569FC;
      v71[3] = &unk_100301C90;
      p_updateLock = &self->_updateLock;
      v71[4] = self;
      id v72 = v33;
      SEL v73 = a2;
      id v35 = v33;
      os_unfair_lock_lock(p_updateLock);
      sub_1000569FC((uint64_t)v71);
      os_unfair_lock_unlock(p_updateLock);

      goto LABEL_44;
    }
LABEL_43:

    goto LABEL_44;
  }
  if (off_100344D28 == a6)
  {
    dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    uint64_t v48 = NFLogGetLogger();
    if (v48)
    {
      v49 = (void (*)(uint64_t, const char *, ...))v48;
      v50 = object_getClass(self);
      if (class_isMetaClass(v50)) {
        uint64_t v51 = 43;
      }
      else {
        uint64_t v51 = 45;
      }
      v52 = object_getClassName(self);
      v53 = sel_getName(a2);
      if (self) {
        BOOL presenterAvailable = self->_presenterAvailable;
      }
      else {
        BOOL presenterAvailable = 0;
      }
      v49(6, "%c[%{public}s %{public}s]:%i walletDomain updated, change=%{public}@, presenterAvailable=%{public}d", v51, v52, v53, 220, v13, presenterAvailable);
    }
    dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    v55 = NFSharedLogGetLogger();
    if (os_log_type_enabled(v55, OS_LOG_TYPE_DEFAULT))
    {
      v56 = object_getClass(self);
      if (class_isMetaClass(v56)) {
        int v57 = 43;
      }
      else {
        int v57 = 45;
      }
      v58 = object_getClassName(self);
      v59 = sel_getName(a2);
      if (self) {
        BOOL v60 = self->_presenterAvailable;
      }
      else {
        BOOL v60 = 0;
      }
      *(_DWORD *)buf = 67110402;
      *(_DWORD *)&buf[4] = v57;
      *(_WORD *)v76 = 2082;
      *(void *)&v76[2] = v58;
      *(_WORD *)&v76[10] = 2082;
      *(void *)&v76[12] = v59;
      *(_WORD *)&v76[20] = 1024;
      *(_DWORD *)&v76[22] = 220;
      *(_WORD *)&v76[26] = 2114;
      *(void *)&v76[28] = v13;
      *(_WORD *)&v76[36] = 1026;
      *(_DWORD *)&v76[38] = v60;
      _os_log_impl((void *)&_mh_execute_header, v55, OS_LOG_TYPE_DEFAULT, "%c[%{public}s %{public}s]:%i walletDomain updated, change=%{public}@, presenterAvailable=%{public}d", buf, 0x32u);
    }

    v61 = [v13 objectForKeyedSubscript:NSKeyValueChangeNewKey];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      unsigned int v62 = [v61 unsignedIntValue];
      if (self)
      {
        unsigned int v63 = v62;
        *(void *)buf = _NSConcreteStackBlock;
        *(void *)v76 = 3221225472;
        *(void *)&v76[8] = sub_10000B9A4;
        *(void *)&v76[16] = &unk_100301C40;
        *(void *)&v76[24] = self;
        *(void *)&v76[32] = v62;
        os_unfair_lock_lock(&self->_updateLock);
        (*(void (**)(uint8_t *))&v76[8])(buf);
        os_unfair_lock_unlock(&self->_updateLock);
        if (v63 > 5) {
          uint64_t v64 = 0;
        }
        else {
          uint64_t v64 = qword_1002836B8[v63];
        }
        CFStringRef v79 = @"currentNFCDefault";
        v65 = +[NSNumber numberWithUnsignedInteger:v64];
        v80 = v65;
        v66 = +[NSDictionary dictionaryWithObjects:&v80 forKeys:&v79 count:1];
        +[NFGeneralStatisticsCALogger updateAnalyticsGeneralTransactionStatistics:v66];
      }
      sub_100001940((os_unfair_lock_s *)self);
    }
  }
  else
  {
    v70.receiver = self;
    v70.super_class = (Class)NFWalletPresentationEventPublisher;
    [(NFWalletPresentationEventPublisher *)&v70 observeValueForKeyPath:v69 ofObject:v11 change:v12 context:a6];
  }
LABEL_44:
}

- (NFWalletPresentationEventPublisher)init
{
  v29.receiver = self;
  v29.super_class = (Class)NFWalletPresentationEventPublisher;
  v3 = [(NFWalletPresentationEventPublisher *)&v29 init];
  if (v3)
  {
    uint64_t v4 = +[NFWalletPresentationSettingsPassKit defaultSetting];
    passkitDefaults = v3->_passkitDefaults;
    v3->_passkitDefaults = (NFWalletPresentationSettingsPassKit *)v4;

    v6 = v3->_passkitDefaults;
    uint64_t v7 = +[NFWalletPresentationSettingsSESD defaultSetting];
    sesdDefaults = v3->_sesdDefaults;
    v3->_sesdDefaults = (NFWalletPresentationSettingsSESD *)v7;

    v9 = v3->_sesdDefaults;
    if (v6) {
      BOOL v10 = v9 == 0;
    }
    else {
      BOOL v10 = 1;
    }
    if (v10)
    {
      id v11 = NFSharedLogGetLogger();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_FAULT))
      {
        *(_DWORD *)buf = 67240448;
        BOOL v31 = v6 == 0;
        __int16 v32 = 1026;
        LODWORD(v33) = v9 == 0;
        _os_log_fault_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_FAULT, "default is nil: PassKit=%{public}d, SESD=%{public}d", buf, 0xEu);
      }
    }
    id v12 = (NSUserDefaults *)[objc_alloc((Class)NSUserDefaults) initWithSuiteName:@"com.apple.stockholm.wallet.presentation"];
    publishDefaults = v3->_publishDefaults;
    v3->_publishDefaults = v12;

    v14 = [(NSUserDefaults *)v3->_publishDefaults objectForKey:@"walletDoubleButtonPressedConsumerAvailable"];

    if (!v14)
    {
      dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
      uint64_t Logger = NFLogGetLogger();
      if (Logger)
      {
        v16 = (void (*)(uint64_t, const char *, ...))Logger;
        Class = object_getClass(v3);
        BOOL isMetaClass = class_isMetaClass(Class);
        ClassName = object_getClassName(v3);
        Name = sel_getName(a2);
        uint64_t v20 = 45;
        if (isMetaClass) {
          uint64_t v20 = 43;
        }
        v16(5, "%c[%{public}s %{public}s]:%i Init default", v20, ClassName, Name, 88);
      }
      dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
      v21 = NFSharedLogGetLogger();
      if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
      {
        v22 = object_getClass(v3);
        if (class_isMetaClass(v22)) {
          int v23 = 43;
        }
        else {
          int v23 = 45;
        }
        v24 = object_getClassName(v3);
        v25 = sel_getName(a2);
        *(_DWORD *)buf = 67109890;
        BOOL v31 = v23;
        __int16 v32 = 2082;
        v33 = v24;
        __int16 v34 = 2082;
        id v35 = v25;
        __int16 v36 = 1024;
        int v37 = 88;
        _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_DEFAULT, "%c[%{public}s %{public}s]:%i Init default", buf, 0x22u);
      }

      [(NSUserDefaults *)v3->_publishDefaults setBool:0 forKey:@"walletDoubleButtonPressedConsumerAvailable"];
    }
    v3->_updateLock._os_unfair_lock_opaque = 0;
    [(NFWalletPresentationSettingsPassKit *)v3->_passkitDefaults addObserver:v3 forKeyPath:@"isEligibleForDoubleClick" options:5 context:off_100344D18];
    [(NFWalletPresentationSettingsSESD *)v3->_sesdDefaults addObserver:v3 forKeyPath:@"isEligibleForDoubleClick" options:5 context:off_100344D20];
    [(NFWalletPresentationSettingsSESD *)v3->_sesdDefaults addObserver:v3 forKeyPath:@"walletDomain" options:5 context:off_100344D28];
    id v26 = v3;
  }

  return v3;
}

- (void)dealloc
{
  [(NFWalletPresentationSettingsPassKit *)self->_passkitDefaults removeObserver:self forKeyPath:@"isEligibleForDoubleClick"];
  [(NFWalletPresentationSettingsSESD *)self->_sesdDefaults removeObserver:self forKeyPath:@"isEligibleForDoubleClick"];
  [(NFWalletPresentationSettingsSESD *)self->_sesdDefaults removeObserver:self forKeyPath:@"walletDomain"];
  v3.receiver = self;
  v3.super_class = (Class)NFWalletPresentationEventPublisher;
  [(NFWalletPresentationEventPublisher *)&v3 dealloc];
}

- (unint64_t)walletDomain
{
  uint64_t v11 = 0;
  id v12 = &v11;
  uint64_t v13 = 0x2020000000;
  uint64_t v14 = 0;
  p_updateLock = &self->_updateLock;
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  uint64_t v7 = sub_100056E04;
  v8 = &unk_100301EB8;
  v9 = self;
  BOOL v10 = &v11;
  objc_super v3 = v6;
  os_unfair_lock_lock(p_updateLock);
  v7((uint64_t)v3);
  os_unfair_lock_unlock(p_updateLock);

  unint64_t v4 = v12[3];
  _Block_object_dispose(&v11, 8);
  return v4;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_publishDefaults, 0);
  objc_storeStrong((id *)&self->_sesdDefaults, 0);
  objc_storeStrong((id *)&self->_passkitDefaults, 0);

  objc_storeStrong((id *)&self->_uiService, 0);
}

@end