@interface UserNotificationManager
+ (id)sharedInstance:()basic_string<char;
- (BOOL)setActionForHeader:(UserNotificationManager *)self notificationContent:(SEL)a2 callbackData:(NotificationInfo *)a3;
- (id).cxx_construct;
- (id)init:()basic_string<char;
- (void)setUpNotificationCenter:(id)a3;
- (void)showNotification:(NotificationInfo *)a3 withCallBackData:;
- (void)updateAnalyticsEvent:(const void *)a3 withUserReponse:(BOOL)a4;
- (void)userNotificationCenter:(id)a3 didReceiveNotificationResponse:(id)a4 withCompletionHandler:(id)a5;
@end

@implementation UserNotificationManager

+ (id)sharedInstance:()basic_string<char
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3321888768;
  block[2] = __42__UserNotificationManager_sharedInstance___block_invoke;
  block[3] = &__block_descriptor_56_ea8_32c66_ZTSNSt3__112basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEE_e5_v8__0l;
  if (*((char *)&a3->var0.var0.var0.var1 + 23) < 0)
  {
    std::string::__init_copy_ctor_external((std::string *)&__p, a3->var0.var0.var0.var1.var0, a3->var0.var0.var0.var1.var1);
    if (qword_1EBBDCCE8 == -1)
    {
LABEL_3:
      id v3 = (id)qword_1EBBDCCE0;
      if ((*((char *)&__p.var0.var1 + 23) & 0x80000000) == 0) {
        goto LABEL_4;
      }
      goto LABEL_9;
    }
  }
  else
  {
    __rep __p = a3->var0.var0;
    if (qword_1EBBDCCE8 == -1) {
      goto LABEL_3;
    }
  }
  dispatch_once(&qword_1EBBDCCE8, block);
  id v3 = (id)qword_1EBBDCCE0;
  if ((*((char *)&__p.var0.var1 + 23) & 0x80000000) == 0)
  {
LABEL_4:
    v4 = v3;
    return v4;
  }
LABEL_9:
  operator delete(__p.var0.var1.var0);
  v4 = v3;

  return v4;
}

void __42__UserNotificationManager_sharedInstance___block_invoke(uint64_t a1)
{
  v2 = [UserNotificationManager alloc];
  if (*(char *)(a1 + 55) < 0) {
    std::string::__init_copy_ctor_external(&__p, *(const std::string::value_type **)(a1 + 32), *(void *)(a1 + 40));
  }
  else {
    std::string __p = *(std::string *)(a1 + 32);
  }
  uint64_t v3 = [(UserNotificationManager *)v2 init:&__p];
  v4 = (void *)qword_1EBBDCCE0;
  qword_1EBBDCCE0 = v3;

  if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0) {
    operator delete(__p.__r_.__value_.__l.__data_);
  }
}

- (id)init:()basic_string<char
{
  v10.receiver = self;
  v10.super_class = (Class)UserNotificationManager;
  v4 = [(UserNotificationManager *)&v10 init];
  if (!v4) {
    return v4;
  }
  if (*((char *)&var0->var0.var0.var0.var1 + 23) < 0)
  {
    if (!var0->var0.var0.var0.var1.var1) {
      return v4;
    }
    dispatch_queue_t v9 = dispatch_queue_create(var0->var0.var0.var0.var1.var0, 0);
    fObj = v4->fQueue.fObj.fObj;
    v4->fQueue.fObj.fObj = (dispatch_object_s *)v9;
    if (!fObj) {
      goto LABEL_6;
    }
  }
  else
  {
    if (!*((unsigned char *)&var0->var0.var0.var0.var1 + 23)) {
      return v4;
    }
    dispatch_queue_t v5 = dispatch_queue_create(var0->var0.var0.var0.var0.var0, 0);
    fObj = v4->fQueue.fObj.fObj;
    v4->fQueue.fObj.fObj = (dispatch_object_s *)v5;
    if (!fObj) {
      goto LABEL_6;
    }
  }
  dispatch_release(fObj);
LABEL_6:
  if (*((char *)&var0->var0.var0.var0.var1 + 23) < 0) {
    var0 = (basic_string<char, std::char_traits<char>, std::allocator<char>> *)var0->var0.var0.var0.var1.var0;
  }
  v7 = [NSString stringWithUTF8String:var0];
  [(UserNotificationManager *)v4 setUpNotificationCenter:v7];

  return v4;
}

- (void)setUpNotificationCenter:(id)a3
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (!self->fUserNotificationCenter)
  {
    dispatch_queue_t v5 = [NSString stringWithFormat:@"com.apple.telephony.%@", v4];
    v6 = (UNUserNotificationCenter *)[objc_alloc(MEMORY[0x1E4F44680]) initWithBundleIdentifier:v5];
    fUserNotificationCenter = self->fUserNotificationCenter;
    self->fUserNotificationCenter = v6;

    [(UNUserNotificationCenter *)self->fUserNotificationCenter setDelegate:self];
    [(UNUserNotificationCenter *)self->fUserNotificationCenter setWantsNotificationResponsesDelivered];
    GetABMLogServer(&v10);
    v8 = *((void *)GetGlobalLogger(&v10) + 4);
    dispatch_queue_t v9 = v11;
    if (v11 && !atomic_fetch_add(&v11->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
    {
      ((void (*)(std::__shared_weak_count *))v9->__on_zero_shared)(v9);
      std::__shared_weak_count::__release_weak(v9);
    }
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v13 = v5;
      _os_log_impl(&dword_1C59C6000, v8, OS_LOG_TYPE_DEFAULT, "#I UserNotificationCenter created with bundleID %@", buf, 0xCu);
    }
  }
}

- (BOOL)setActionForHeader:(UserNotificationManager *)self notificationContent:(SEL)a2 callbackData:(NotificationInfo *)a3
{
  uint64_t v103 = v4;
  uint64_t v111 = *MEMORY[0x1E4F143B8];
  v7 = v3;
  v104 = v7;
  v102 = self;
  if ((atomic_load_explicit((atomic_uchar *volatile)&qword_1EBBDCCF0, memory_order_acquire) & 1) == 0)
  {
    v7 = (config::hw *)__cxa_guard_acquire(&qword_1EBBDCCF0);
    if (v7)
    {
      _MergedGlobals_1 = TelephonyUtilIsInternalBuild();
      __cxa_guard_release(&qword_1EBBDCCF0);
    }
  }
  if ((atomic_load_explicit((atomic_uchar *volatile)&qword_1EBBDCD00, memory_order_acquire) & 1) == 0)
  {
    v7 = (config::hw *)__cxa_guard_acquire(&qword_1EBBDCD00);
    if (v7)
    {
      if (_MergedGlobals_1) {
        v100 = @"prefs:root=INTERNAL_SETTINGS&path=Baseband%20Manager/Manage%20Logs";
      }
      else {
        v100 = @"prefs:root=CARRIER_SETTINGS&path=Baseband%20Manager/Manage%20Logs";
      }
      qword_1EBBDCCF8 = v100;
      __cxa_guard_release(&qword_1EBBDCD00);
    }
  }
  if ((atomic_load_explicit((atomic_uchar *volatile)&qword_1EBBDCD10, memory_order_acquire) & 1) == 0)
  {
    v7 = (config::hw *)__cxa_guard_acquire(&qword_1EBBDCD10);
    if (v7)
    {
      if (_MergedGlobals_1) {
        v101 = @"prefs:root=INTERNAL_SETTINGS&path=Baseband%20Manager/Logging%20Settings";
      }
      else {
        v101 = @"prefs:root=CARRIER_SETTINGS&path=Baseband%20Manager/Logging%20Settings";
      }
      qword_1EBBDCD08 = v101;
      __cxa_guard_release(&qword_1EBBDCD10);
    }
  }
  if (config::hw::watch(v7)) {
    [MEMORY[0x1E4F44610] iconForApplicationIdentifier:@"com.apple.Preferences"];
  }
  else {
  uint64_t v9 = [MEMORY[0x1E4F44610] iconForSystemImageNamed:@"antenna.radiowaves.left.and.right"];
  }
  [v104 setIcon:v9];

  p_unint64_t var1 = &a3->var0.var0.var1;
  LODWORD(v9) = SHIBYTE(a3->var0.var0.var1.var0[2]);
  unint64_t v10 = HIBYTE(a3->var0.var0.var1.var0[2]);
  unint64_t v11 = v10;
  v12 = &a3->var0.var0.var1;
  if ((v9 & 0x80000000) != 0)
  {
    v12 = (__raw *)a3->var0.var0.var1.var0[0];
    unint64_t v11 = a3->var0.var0.var1.var0[1];
  }
  if (v11 >= 0x14) {
    size_t v13 = 20;
  }
  else {
    size_t v13 = v11;
  }
  if (!memcmp(v12, "Telephony_Dump_Ready", v13) && v11 == 20)
  {
    if (!_MergedGlobals_1) {
      goto LABEL_39;
    }
    uint64_t v9 = [MEMORY[0x1E4F44610] iconForApplicationIdentifier:@"com.apple.TapToRadar"];
    [v104 setIcon:v9];
    goto LABEL_38;
  }
  unint64_t v14 = v10;
  v15 = &a3->var0.var0.var1;
  if ((v9 & 0x80000000) != 0)
  {
    v15 = (__raw *)a3->var0.var0.var1.var0[0];
    unint64_t v14 = a3->var0.var0.var1.var0[1];
  }
  if (v14 >= 0x1D) {
    size_t v16 = 29;
  }
  else {
    size_t v16 = v14;
  }
  if (!memcmp(v15, "Logging_Profile_Not_Installed", v16) && v14 == 29) {
    goto LABEL_37;
  }
  unint64_t v17 = v10;
  v18 = &a3->var0.var0.var1;
  if ((v9 & 0x80000000) != 0)
  {
    v18 = (__raw *)a3->var0.var0.var1.var0[0];
    unint64_t v17 = a3->var0.var0.var1.var0[1];
  }
  size_t v19 = v17 >= 0x1B ? 27 : v17;
  if (!memcmp(v18, "Telephony_Dump_Insufficient", v19) && v17 == 27) {
    goto LABEL_37;
  }
  unint64_t v20 = v10;
  v21 = &a3->var0.var0.var1;
  if ((v9 & 0x80000000) != 0)
  {
    v21 = (__raw *)a3->var0.var0.var1.var0[0];
    unint64_t v20 = a3->var0.var0.var1.var0[1];
  }
  size_t v22 = v20 >= 0x17 ? 23 : v20;
  if (!memcmp(v21, "Cellular_Issue_Detected", v22) && v20 == 23)
  {
LABEL_37:
    uint64_t v9 = [MEMORY[0x1E4F44610] iconForApplicationIdentifier:@"com.apple.Preferences"];
    [v104 setIcon:v9];
LABEL_38:

    LOBYTE(v9) = HIBYTE(a3->var0.var0.var1.var0[2]);
    goto LABEL_39;
  }
  v80 = &a3->var0.var0.var1;
  if ((v9 & 0x80000000) != 0)
  {
    v80 = (__raw *)a3->var0.var0.var1.var0[0];
    unint64_t v10 = a3->var0.var0.var1.var0[1];
  }
  if (v10 >= 0x16) {
    size_t v81 = 22;
  }
  else {
    size_t v81 = v10;
  }
  if (memcmp(v80, "Telephony_Dump_Started", v81) || v10 != 22)
  {
    GetABMLogServer(&v107);
    v82 = *((void *)GetGlobalLogger(&v107) + 4);
    v83 = v108;
    if (v108 && !atomic_fetch_add(&v108->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
    {
      ((void (*)(std::__shared_weak_count *))v83->__on_zero_shared)(v83);
      std::__shared_weak_count::__release_weak(v83);
    }
    if (os_log_type_enabled(v82, OS_LOG_TYPE_ERROR))
    {
      if (SHIBYTE(a3->var0.var0.var1.var0[2]) < 0) {
        p_unint64_t var1 = (__raw *)p_var1->var0[0];
      }
      *(_DWORD *)buf = 136315138;
      v110 = (NotificationInfo *)p_var1;
      _os_log_error_impl(&dword_1C59C6000, v82, OS_LOG_TYPE_ERROR, "Not supported header - %s", buf, 0xCu);
    }
    BOOL v84 = 0;
    goto LABEL_215;
  }
LABEL_39:
  if ((v9 & 0x80) != 0)
  {
    v24 = (__raw *)a3->var0.var0.var1.var0[0];
    unint64_t v23 = a3->var0.var0.var1.var0[1];
  }
  else
  {
    unint64_t v23 = v9;
    v24 = &a3->var0.var0.var1;
  }
  if (v23 >= 0x16) {
    size_t v25 = 22;
  }
  else {
    size_t v25 = v23;
  }
  if (!memcmp(v24, "Telephony_Dump_Started", v25) && v23 == 22
    || ((v9 & 0x80) != 0
      ? (__raw *)(v27 = (__raw *)a3->var0.var0.var1.var0[0], unint64_t v26 = a3->var0.var0.var1.var0[1])
      : (unint64_t v26 = v9, v27 = &a3->var0.var0.var1),
        v26 >= 0x14 ? (size_t v28 = 20) : (size_t v28 = v26),
        !memcmp(v27, "Telephony_Dump_Ready", v28) && v26 == 20))
  {
    v29 = [MEMORY[0x1E4F1CB10] URLWithString:qword_1EBBDCCF8];
    [v104 setDefaultActionURL:v29];
  }
  else
  {
    if ((v9 & 0x80) != 0)
    {
      v58 = (__raw *)a3->var0.var0.var1.var0[0];
      unint64_t v57 = a3->var0.var0.var1.var0[1];
    }
    else
    {
      unint64_t v57 = v9;
      v58 = &a3->var0.var0.var1;
    }
    if (v57 >= 0x1B) {
      size_t v78 = 27;
    }
    else {
      size_t v78 = v57;
    }
    if (!memcmp(v58, "Telephony_Dump_Insufficient", v78) && v57 == 27)
    {
      v29 = [MEMORY[0x1E4F1CB10] URLWithString:qword_1EBBDCD08];
      [v104 setDefaultActionURL:v29];
    }
    else
    {
      if ((v9 & 0x80) != 0)
      {
        p_unint64_t var1 = (__raw *)a3->var0.var0.var1.var0[0];
        unint64_t v79 = a3->var0.var0.var1.var0[1];
      }
      else
      {
        unint64_t v79 = v9;
      }
      if (v79 >= 0x17) {
        size_t v96 = 23;
      }
      else {
        size_t v96 = v79;
      }
      if (!memcmp(p_var1, "Cellular_Issue_Detected", v96) && v79 == 23)
      {
        v29 = [MEMORY[0x1E4F1CB10] URLWithString:@"prefs:root=MOBILE_DATA_SETTINGS_ID&path=CELLULAR_DIAGNOSTICS_ID"];
        [v104 setDefaultActionURL:v29];
      }
      else
      {
        if (*((char *)&a3[1].var0.var0.var0.var0.var1 + 23) < 0)
        {
          var0 = (NotificationInfo *)a3[1].var0.var0.var0.var0.var1.var0;
          unint64_t var1 = a3[1].var0.var0.var0.var0.var1.var1;
        }
        else
        {
          var0 = a3 + 1;
          unint64_t var1 = *((unsigned __int8 *)&a3[1].var0.var0.var0.var0.var1 + 23);
        }
        if (var1 >= 0x21) {
          size_t v99 = 33;
        }
        else {
          size_t v99 = var1;
        }
        if (memcmp(var0, "Install_Logging_Profile_UIAllowed", v99) || var1 != 33) {
          goto LABEL_57;
        }
        v29 = [MEMORY[0x1E4F1CB10] URLWithString:@"prefs:root=General&path=ManagedConfigurationList"];
        [v104 setDefaultActionURL:v29];
      }
    }
  }

LABEL_57:
  p_pair1 = &self->fCallBackMapWithQueue.__tree_.__pair1_;
  left = (__compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<std::string, CallBackData>, void *>>> *)self->fCallBackMapWithQueue.__tree_.__pair1_.__value_.__left_;
  if (!left)
  {
    v42 = &self->fCallBackMapWithQueue.__tree_.__pair1_;
    if (self->fCallBackMapWithQueue.__tree_.__begin_node_ == p_pair1)
    {
      v55 = 0;
      v42 = &self->fCallBackMapWithQueue.__tree_.__pair1_;
      v56 = &self->fCallBackMapWithQueue.__tree_.__pair1_;
      if (!p_pair1->__value_.__left_) {
        goto LABEL_164;
      }
      goto LABEL_208;
    }
LABEL_112:
    v56 = v42;
    do
    {
      v60 = v56;
      v56 = (__compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<std::string, CallBackData>, void *>>> *)v56[2].__value_.__left_;
    }
    while (v56->__value_.__left_ == v60);
    v55 = 0;
    goto LABEL_115;
  }
  char v32 = *((unsigned char *)&a3->var0.var0.var0.var0.var1 + 23);
  if (v32 >= 0) {
    v33 = a3;
  }
  else {
    v33 = (NotificationInfo *)a3->var0.var0.var0.var0.var1.var0;
  }
  if (v32 >= 0) {
    unint64_t v34 = *((unsigned __int8 *)&a3->var0.var0.var0.var0.var1 + 23);
  }
  else {
    unint64_t v34 = a3->var0.var0.var0.var0.var1.var1;
  }
  v35 = &self->fCallBackMapWithQueue.__tree_.__pair1_;
  v36 = (__compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<std::string, CallBackData>, void *>>> *)self->fCallBackMapWithQueue.__tree_.__pair1_.__value_.__left_;
  do
  {
    while (1)
    {
      int left_high = SHIBYTE(v36[6].__value_.__left_);
      v38 = left_high >= 0 ? (char *)&v36[4] : (char *)v36[4].__value_.__left_;
      unint64_t v39 = left_high >= 0 ? HIBYTE(v36[6].__value_.__left_) : (unint64_t)v36[5].__value_.__left_;
      size_t v40 = v34 >= v39 ? v39 : v34;
      int v41 = memcmp(v38, v33, v40);
      if (v41) {
        break;
      }
      if (v39 >= v34) {
        goto LABEL_79;
      }
LABEL_65:
      v36 = (__compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<std::string, CallBackData>, void *>>> *)v36[1].__value_.__left_;
      if (!v36) {
        goto LABEL_80;
      }
    }
    if (v41 < 0) {
      goto LABEL_65;
    }
LABEL_79:
    v35 = v36;
    v36 = (__compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<std::string, CallBackData>, void *>>> *)v36->__value_.__left_;
  }
  while (v36);
LABEL_80:
  v42 = p_pair1;
  if (v35 == p_pair1) {
    goto LABEL_107;
  }
  int v43 = SHIBYTE(v35[6].__value_.__left_);
  if (v43 >= 0) {
    v44 = v35 + 4;
  }
  else {
    v44 = (__compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<std::string, CallBackData>, void *>>> *)v35[4].__value_.__left_;
  }
  if (v43 >= 0) {
    size_t v45 = HIBYTE(v35[6].__value_.__left_);
  }
  else {
    size_t v45 = (size_t)v35[5].__value_.__left_;
  }
  if (v45 >= v34) {
    size_t v46 = v34;
  }
  else {
    size_t v46 = v45;
  }
  int v47 = memcmp(v33, v44, v46);
  if (!v47)
  {
    if (v34 < v45) {
      goto LABEL_106;
    }
LABEL_92:
    v48 = _Block_copy(*(const void **)v103);
    v49 = v35[7].__value_.__left_;
    v35[7].__value_.__left_ = v48;

    v50 = *(void **)(v103 + 8);
    if (v50) {
      dispatch_retain(*(dispatch_object_t *)(v103 + 8));
    }
    v51 = v35[8].__value_.__left_;
    v35[8].__value_.__left_ = v50;
    if (v51) {
      dispatch_release(v51);
    }
    if (&v35[7] != (__compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<std::string, CallBackData>, void *>>> *)v103)
    {
      p_left = &v35[9].__value_.__left_;
      char v53 = *(unsigned char *)(v103 + 39);
      if (SHIBYTE(v35[11].__value_.__left_) < 0)
      {
        if (v53 >= 0) {
          v85 = (void *)(v103 + 16);
        }
        else {
          v85 = *(void **)(v103 + 16);
        }
        if (v53 >= 0) {
          size_t v86 = *(unsigned __int8 *)(v103 + 39);
        }
        else {
          size_t v86 = *(void *)(v103 + 24);
        }
        std::string::__assign_no_alias<false>(p_left, v85, v86);
      }
      else if ((*(unsigned char *)(v103 + 39) & 0x80) != 0)
      {
        std::string::__assign_no_alias<true>(p_left, *(void **)(v103 + 16), *(void *)(v103 + 24));
      }
      else
      {
        long long v54 = *(_OWORD *)(v103 + 16);
        v35[11].__value_.__left_ = *(void **)(v103 + 32);
        *(_OWORD *)p_left = v54;
      }
    }
    goto LABEL_208;
  }
  if ((v47 & 0x80000000) == 0) {
    goto LABEL_92;
  }
LABEL_106:
  v42 = v35;
LABEL_107:
  v55 = v42->__value_.__left_;
  self = v102;
  if (v102->fCallBackMapWithQueue.__tree_.__begin_node_ == v42)
  {
    v56 = v42;
    if (v55) {
      p_pair1 = v42 + 1;
    }
    else {
      p_pair1 = v42;
    }
    if (!p_pair1->__value_.__left_) {
      goto LABEL_164;
    }
    goto LABEL_208;
  }
  if (!v55) {
    goto LABEL_112;
  }
  v59 = (__compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<std::string, CallBackData>, void *>>> *)v42->__value_.__left_;
  do
  {
    v56 = v59;
    v59 = (__compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<std::string, CallBackData>, void *>>> *)v59[1].__value_.__left_;
  }
  while (v59);
LABEL_115:
  int v61 = SHIBYTE(v56[6].__value_.__left_);
  if (v61 >= 0) {
    v62 = v56 + 4;
  }
  else {
    v62 = (__compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<std::string, CallBackData>, void *>>> *)v56[4].__value_.__left_;
  }
  if (v61 >= 0) {
    size_t v63 = HIBYTE(v56[6].__value_.__left_);
  }
  else {
    size_t v63 = (size_t)v56[5].__value_.__left_;
  }
  int v64 = *((char *)&a3->var0.var0.var0.var0.var1 + 23);
  if (v64 >= 0) {
    v65 = a3;
  }
  else {
    v65 = (NotificationInfo *)a3->var0.var0.var0.var0.var1.var0;
  }
  if (v64 >= 0) {
    unint64_t v66 = *((unsigned __int8 *)&a3->var0.var0.var0.var0.var1 + 23);
  }
  else {
    unint64_t v66 = a3->var0.var0.var0.var0.var1.var1;
  }
  if (v66 >= v63) {
    size_t v67 = v63;
  }
  else {
    size_t v67 = v66;
  }
  int v68 = memcmp(v62, v65, v67);
  if (v68)
  {
    self = v102;
    if ((v68 & 0x80000000) == 0)
    {
LABEL_132:
      if (!left)
      {
        v69 = p_pair1;
        goto LABEL_197;
      }
      while (1)
      {
        v69 = left;
        size_t v70 = HIBYTE(left[6].__value_.__left_);
        size_t v71 = (size_t)left[5].__value_.__left_;
        if ((v70 & 0x80u) == 0) {
          v72 = left + 4;
        }
        else {
          v72 = (__compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<std::string, CallBackData>, void *>>> *)left[4].__value_.__left_;
        }
        if ((v70 & 0x80u) == 0) {
          size_t v73 = v70;
        }
        else {
          size_t v73 = v71;
        }
        if (v73 >= v66) {
          size_t v74 = v66;
        }
        else {
          size_t v74 = v73;
        }
        int v75 = memcmp(v65, v72, v74);
        if (v75)
        {
          if ((v75 & 0x80000000) == 0) {
            goto LABEL_148;
          }
        }
        else if (v66 >= v73)
        {
LABEL_148:
          int v76 = memcmp(v72, v65, v74);
          if (v76)
          {
            if ((v76 & 0x80000000) == 0) {
              goto LABEL_208;
            }
          }
          else if (v73 >= v66)
          {
            goto LABEL_208;
          }
          left = (__compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<std::string, CallBackData>, void *>>> *)v69[1].__value_.__left_;
          if (!left)
          {
            p_pair1 = v69 + 1;
            goto LABEL_197;
          }
          continue;
        }
        left = (__compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<std::string, CallBackData>, void *>>> *)v69->__value_.__left_;
        if (!v69->__value_.__left_)
        {
          p_pair1 = v69;
          goto LABEL_197;
        }
      }
    }
  }
  else
  {
    BOOL v77 = v63 >= v66;
    self = v102;
    if (v77) {
      goto LABEL_132;
    }
  }
  if (v55) {
    p_pair1 = v56 + 1;
  }
  else {
    p_pair1 = v42;
  }
  if (!p_pair1->__value_.__left_)
  {
LABEL_164:
    if (v55) {
      v69 = v56;
    }
    else {
      v69 = v42;
    }
    LOBYTE(v64) = *((unsigned char *)&a3->var0.var0.var0.var0.var1 + 23);
LABEL_197:
    v87 = (char *)operator new(0x60uLL);
    v88 = (uint64_t *)v87;
    if ((v64 & 0x80) != 0)
    {
      std::string::__init_copy_ctor_external((std::string *)(v87 + 32), a3->var0.var0.var0.var0.var1.var0, a3->var0.var0.var0.var0.var1.var1);
    }
    else
    {
      *((_OWORD *)v87 + 2) = *(_OWORD *)a3->var0.var0.var0.var0.var0.var0;
      *((void *)v87 + 6) = *((void *)&a3->var0.var0.var0.var0.var1 + 2);
    }
    v89 = _Block_copy(*(const void **)v103);
    v90 = *(NSObject **)(v103 + 8);
    v88[7] = (uint64_t)v89;
    v88[8] = (uint64_t)v90;
    if (v90) {
      dispatch_retain(v90);
    }
    v91 = (std::string *)(v88 + 9);
    if (*(char *)(v103 + 39) < 0)
    {
      std::string::__init_copy_ctor_external(v91, *(const std::string::value_type **)(v103 + 16), *(void *)(v103 + 24));
    }
    else
    {
      *(_OWORD *)&v91->__r_.__value_.__l.__data_ = *(_OWORD *)(v103 + 16);
      v88[11] = *(void *)(v103 + 32);
    }
    uint64_t *v88 = 0;
    v88[1] = 0;
    v88[2] = (uint64_t)v69;
    p_pair1->__value_.__left_ = v88;
    v92 = *(void **)self->fCallBackMapWithQueue.__tree_.__begin_node_;
    if (v92)
    {
      self->fCallBackMapWithQueue.__tree_.__begin_node_ = v92;
      v88 = (uint64_t *)p_pair1->__value_.__left_;
    }
    std::__tree_balance_after_insert[abi:ne180100]<std::__tree_node_base<void *> *>((uint64_t *)self->fCallBackMapWithQueue.__tree_.__pair1_.__value_.__left_, v88);
    ++self->fCallBackMapWithQueue.__tree_.__pair3_.__value_;
  }
LABEL_208:
  GetABMLogServer(&v105);
  v93 = *((void *)GetGlobalLogger(&v105) + 4);
  v94 = v106;
  if (v106 && !atomic_fetch_add(&v106->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
  {
    ((void (*)(std::__shared_weak_count *))v94->__on_zero_shared)(v94);
    std::__shared_weak_count::__release_weak(v94);
    if (os_log_type_enabled(v93, OS_LOG_TYPE_DEFAULT))
    {
LABEL_211:
      if (*((char *)&a3->var0.var0.var0.var0.var1 + 23) < 0) {
        a3 = (NotificationInfo *)a3->var0.var0.var0.var0.var1.var0;
      }
      *(_DWORD *)buf = 136315138;
      v110 = a3;
      _os_log_impl(&dword_1C59C6000, v93, OS_LOG_TYPE_DEFAULT, "#I Add callback for id: %s", buf, 0xCu);
    }
  }
  else if (os_log_type_enabled(v93, OS_LOG_TYPE_DEFAULT))
  {
    goto LABEL_211;
  }
  BOOL v84 = 1;
LABEL_215:

  return v84;
}

- (void)showNotification:(NotificationInfo *)a3 withCallBackData:
{
  uint64_t v4 = v3;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3321888768;
  block[2] = __61__UserNotificationManager_showNotification_withCallBackData___block_invoke;
  block[3] = &unk_1F2107AA0;
  void block[4] = self;
  if (*((char *)&a3->var0.var0.var0.var0.var1 + 23) < 0) {
    std::string::__init_copy_ctor_external((std::string *)&var0, a3->var0.var0.var0.var0.var1.var0, a3->var0.var0.var0.var0.var1.var1);
  }
  else {
    __rep var0 = a3->var0.var0.var0;
  }
  if (SHIBYTE(a3->var0.var0.var1.var0[2]) < 0) {
    std::string::__init_copy_ctor_external((std::string *)&var1, (const std::string::value_type *)a3->var0.var0.var1.var0[0], a3->var0.var0.var1.var0[1]);
  }
  else {
    __raw var1 = a3->var0.var0.var1;
  }
  if (*((char *)&a3[1].var0.var0.var0.var0.var1 + 23) < 0) {
    std::string::__init_copy_ctor_external((std::string *)&v12, a3[1].var0.var0.var0.var0.var1.var0, a3[1].var0.var0.var0.var0.var1.var1);
  }
  else {
    __rep v12 = a3[1].var0.var0.var0;
  }
  v7 = _Block_copy(*(const void **)v4);
  v8 = *(NSObject **)(v4 + 8);
  id v13 = v7;
  dispatch_object_t object = v8;
  if (v8) {
    dispatch_retain(v8);
  }
  if (*(char *)(v4 + 39) < 0) {
    std::string::__init_copy_ctor_external(&__p, *(const std::string::value_type **)(v4 + 16), *(void *)(v4 + 24));
  }
  else {
    std::string __p = *(std::string *)(v4 + 16);
  }
  dispatch_async((dispatch_queue_t)self->fQueue.fObj.fObj, block);
  if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0) {
    operator delete(__p.__r_.__value_.__l.__data_);
  }
  if (object) {
    dispatch_release(object);
  }

  if (*((char *)&v12.var0.var1 + 23) < 0)
  {
    operator delete(v12.var0.var1.var0);
    if ((SHIBYTE(var1.var0[2]) & 0x80000000) == 0)
    {
LABEL_21:
      if ((*((char *)&var0.var0.var1 + 23) & 0x80000000) == 0) {
        return;
      }
LABEL_25:
      operator delete(var0.var0.var1.var0);
      return;
    }
  }
  else if ((SHIBYTE(var1.var0[2]) & 0x80000000) == 0)
  {
    goto LABEL_21;
  }
  operator delete((void *)var1.var0[0]);
  if (*((char *)&var0.var0.var1 + 23) < 0) {
    goto LABEL_25;
  }
}

void __61__UserNotificationManager_showNotification_withCallBackData___block_invoke(uint64_t a1)
{
  uint64_t v47 = *MEMORY[0x1E4F143B8];
  v2 = (void *)MEMORY[0x1C87957E0]();
  id v3 = objc_alloc_init(MEMORY[0x1E4F445B0]);
  uint64_t v4 = *(void **)(a1 + 32);
  dispatch_queue_t v5 = (_OWORD *)(a1 + 40);
  if (*(char *)(a1 + 63) < 0)
  {
    std::string::__init_copy_ctor_external(&v42, *(const std::string::value_type **)(a1 + 40), *(void *)(a1 + 48));
  }
  else
  {
    *(_OWORD *)&v42.__r_.__value_.__l.__data_ = *v5;
    v42.__r_.__value_.__r.__words[2] = *(void *)(a1 + 56);
  }
  v6 = (_OWORD *)(a1 + 64);
  if (*(char *)(a1 + 87) < 0)
  {
    std::string::__init_copy_ctor_external(&v43, *(const std::string::value_type **)(a1 + 64), *(void *)(a1 + 72));
  }
  else
  {
    *(_OWORD *)&v43.__r_.__value_.__l.__data_ = *v6;
    v43.__r_.__value_.__r.__words[2] = *(void *)(a1 + 80);
  }
  v7 = (_OWORD *)(a1 + 88);
  if (*(char *)(a1 + 111) < 0)
  {
    std::string::__init_copy_ctor_external(&v44, *(const std::string::value_type **)(a1 + 88), *(void *)(a1 + 96));
  }
  else
  {
    *(_OWORD *)&v44.__r_.__value_.__l.__data_ = *v7;
    v44.__r_.__value_.__r.__words[2] = *(void *)(a1 + 104);
  }
  v8 = _Block_copy(*(const void **)(a1 + 112));
  uint64_t v9 = *(NSObject **)(a1 + 120);
  id v39 = v8;
  dispatch_object_t object = v9;
  if (v9) {
    dispatch_retain(v9);
  }
  if (*(char *)(a1 + 151) < 0) {
    std::string::__init_copy_ctor_external(&__p, *(const std::string::value_type **)(a1 + 128), *(void *)(a1 + 136));
  }
  else {
    std::string __p = *(std::string *)(a1 + 128);
  }
  char v10 = [v4 setActionForHeader:&v42 notificationContent:v3 callbackData:&v39];
  if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0) {
    operator delete(__p.__r_.__value_.__l.__data_);
  }
  if (object) {
    dispatch_release(object);
  }

  if (SHIBYTE(v44.__r_.__value_.__r.__words[2]) < 0)
  {
    operator delete(v44.__r_.__value_.__l.__data_);
    if ((SHIBYTE(v43.__r_.__value_.__r.__words[2]) & 0x80000000) == 0)
    {
LABEL_21:
      if ((SHIBYTE(v42.__r_.__value_.__r.__words[2]) & 0x80000000) == 0) {
        goto LABEL_22;
      }
      goto LABEL_26;
    }
  }
  else if ((SHIBYTE(v43.__r_.__value_.__r.__words[2]) & 0x80000000) == 0)
  {
    goto LABEL_21;
  }
  operator delete(v43.__r_.__value_.__l.__data_);
  if ((SHIBYTE(v42.__r_.__value_.__r.__words[2]) & 0x80000000) == 0)
  {
LABEL_22:
    if ((v10 & 1) == 0) {
      goto LABEL_61;
    }
    goto LABEL_27;
  }
LABEL_26:
  operator delete(v42.__r_.__value_.__l.__data_);
  if ((v10 & 1) == 0) {
    goto LABEL_61;
  }
LABEL_27:
  unint64_t v11 = [MEMORY[0x1E4F28B50] bundleWithPath:@"/System/Library/UserNotifications/Bundles/com.apple.telephony.BasebandServicesNotification.bundle"];
  uint64_t v12 = a1 + 64;
  if (*(char *)(a1 + 87) < 0) {
    uint64_t v12 = *(void *)v6;
  }
  id v13 = [NSString stringWithUTF8String:v12];
  unint64_t v14 = [v11 localizedStringForKey:v13 value:&stru_1F2112A48 table:@"Localizable"];
  [v3 setHeader:v14];

  unint64_t v15 = *(unsigned __int8 *)(a1 + 87);
  unint64_t v16 = v15;
  unint64_t v17 = (const void *)(a1 + 64);
  if (*(char *)(a1 + 87) < 0)
  {
    unint64_t v17 = *(const void **)(a1 + 64);
    unint64_t v16 = *(void *)(a1 + 72);
  }
  if (v16 >= 0x1B) {
    size_t v18 = 27;
  }
  else {
    size_t v18 = v16;
  }
  if (!memcmp(v17, "Telephony_Dump_Insufficient", v18) && v16 == 27)
  {
    size_t v19 = NSString;
    unint64_t v20 = [MEMORY[0x1E4F28B50] bundleWithPath:@"/System/Library/UserNotifications/Bundles/com.apple.telephony.BasebandServicesNotification.bundle"];
    v21 = [v20 localizedStringForKey:@"Telephony_Dump_Insufficient_Details_%@" value:&stru_1F2112A48 table:@"Localizable"];
    if (*(char *)(a1 + 111) < 0) {
      v7 = *(_OWORD **)v7;
    }
    size_t v22 = [NSString stringWithUTF8String:v7];
    unint64_t v23 = [v19 stringWithFormat:v21, v22];
    [v3 setBody:v23];
LABEL_49:

    goto LABEL_50;
  }
  unint64_t v24 = v15;
  size_t v25 = (const void *)(a1 + 64);
  if ((v15 & 0x80) != 0)
  {
    size_t v25 = *(const void **)(a1 + 64);
    unint64_t v24 = *(void *)(a1 + 72);
  }
  if (v24 >= 0x16) {
    size_t v26 = 22;
  }
  else {
    size_t v26 = v24;
  }
  if (!memcmp(v25, "Telephony_Dump_Started", v26) && v24 == 22)
  {
    v27 = NSString;
    unint64_t v20 = [MEMORY[0x1E4F28B50] bundleWithPath:@"/System/Library/UserNotifications/Bundles/com.apple.telephony.BasebandServicesNotification.bundle"];
    if (*(char *)(a1 + 111) < 0) {
      v7 = *(_OWORD **)v7;
    }
    v21 = [NSString stringWithUTF8String:v7];
    size_t v22 = [v20 localizedStringForKey:v21 value:&stru_1F2112A48 table:@"Localizable"];
    unint64_t v23 = [v27 stringWithFormat:v22];
    [v3 setBody:v23];
    goto LABEL_49;
  }
  if ((v15 & 0x80) != 0)
  {
    v6 = *(_OWORD **)(a1 + 64);
    unint64_t v15 = *(void *)(a1 + 72);
  }
  if (v15 >= 0x17) {
    size_t v36 = 23;
  }
  else {
    size_t v36 = v15;
  }
  if (!memcmp(v6, "Cellular_Issue_Detected", v36) && v15 == 23)
  {
    unint64_t v20 = [MEMORY[0x1E4F28B50] bundleWithPath:@"/System/Library/UserNotifications/Bundles/com.apple.telephony.BasebandServicesNotification.bundle"];
    v21 = [v20 localizedStringForKey:@"Check_Settings_Cellular_Diagnostics" value:&stru_1F2112A48 table:@"Localizable"];
    [v3 setBody:v21];
    goto LABEL_51;
  }
  unint64_t v20 = [MEMORY[0x1E4F28B50] bundleWithPath:@"/System/Library/UserNotifications/Bundles/com.apple.telephony.BasebandServicesNotification.bundle"];
  if (*(char *)(a1 + 111) < 0) {
    v7 = *(_OWORD **)v7;
  }
  v21 = [NSString stringWithUTF8String:v7];
  size_t v22 = [v20 localizedStringForKey:v21 value:&stru_1F2112A48 table:@"Localizable"];
  [v3 setBody:v22];
LABEL_50:

LABEL_51:
  size_t v28 = [MEMORY[0x1E4F44640] defaultSound];
  [v3 setSound:v28];

  [v3 setShouldBackgroundDefaultAction:1];
  [v3 setShouldAuthenticateDefaultAction:1];
  uint64_t v29 = a1 + 40;
  if (*(char *)(a1 + 63) < 0) {
    uint64_t v29 = *(void *)v5;
  }
  v30 = (void *)MEMORY[0x1E4F44628];
  v31 = [NSString stringWithUTF8String:v29];
  char v32 = [v30 requestWithIdentifier:v31 content:v3 trigger:0];

  [*(id *)(*(void *)(a1 + 32) + 8) addNotificationRequest:v32 withCompletionHandler:0];
  GetABMLogServer(&v37);
  v33 = *((void *)GetGlobalLogger(&v37) + 4);
  unint64_t v34 = v38;
  if (v38 && !atomic_fetch_add(&v38->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
  {
    ((void (*)(std::__shared_weak_count *))v34->__on_zero_shared)(v34);
    std::__shared_weak_count::__release_weak(v34);
  }
  if (os_log_type_enabled(v33, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v35 = a1 + 40;
    if (*(char *)(a1 + 63) < 0) {
      uint64_t v35 = *(void *)v5;
    }
    *(_DWORD *)buf = 136315138;
    uint64_t v46 = v35;
    _os_log_impl(&dword_1C59C6000, v33, OS_LOG_TYPE_DEFAULT, "#I Add notification request with id: %s", buf, 0xCu);
  }
  [*(id *)(a1 + 32) updateAnalyticsEvent:a1 + 40 withUserReponse:0];

LABEL_61:
}

- (void)updateAnalyticsEvent:(const void *)a3 withUserReponse:(BOOL)a4
{
  BOOL v4 = a4;
  uint64_t v43 = *MEMORY[0x1E4F143B8];
  xpc_object_t v38 = (xpc_object_t)0xAAAAAAAAAAAAAAAALL;
  xpc_object_t v6 = xpc_dictionary_create(0, 0, 0);
  xpc_object_t v7 = v6;
  if (v6)
  {
    xpc_object_t v38 = v6;
  }
  else
  {
    xpc_object_t v7 = xpc_null_create();
    xpc_object_t v38 = v7;
    if (!v7)
    {
      xpc_object_t v8 = xpc_null_create();
      xpc_object_t v7 = 0;
      goto LABEL_8;
    }
  }
  if (MEMORY[0x1C8795EB0](v7) == MEMORY[0x1E4F14590])
  {
    xpc_retain(v7);
    goto LABEL_9;
  }
  xpc_object_t v8 = xpc_null_create();
LABEL_8:
  xpc_object_t v38 = v8;
LABEL_9:
  xpc_release(v7);
  if (*((char *)a3 + 23) >= 0) {
    uint64_t v9 = (const char *)a3;
  }
  else {
    uint64_t v9 = *(const char **)a3;
  }
  xpc_object_t v10 = xpc_string_create(v9);
  if (!v10) {
    xpc_object_t v10 = xpc_null_create();
  }
  xpc_dictionary_set_value(v38, (const char *)*MEMORY[0x1E4F4CE60], v10);
  xpc_object_t v11 = xpc_null_create();
  xpc_release(v10);
  xpc_release(v11);
  unint64_t v14 = (const char *)*((void *)a3 + 3);
  id v13 = (char *)a3 + 24;
  uint64_t v12 = v14;
  if (v13[23] >= 0) {
    unint64_t v15 = v13;
  }
  else {
    unint64_t v15 = v12;
  }
  xpc_object_t v16 = xpc_string_create(v15);
  if (!v16) {
    xpc_object_t v16 = xpc_null_create();
  }
  xpc_dictionary_set_value(v38, (const char *)*MEMORY[0x1E4F4CE68], v16);
  xpc_object_t v17 = xpc_null_create();
  xpc_release(v16);
  xpc_release(v17);
  if (v4) {
    size_t v18 = "userResponded";
  }
  else {
    size_t v18 = "shown";
  }
  xpc_object_t v19 = xpc_string_create(v18);
  if (!v19) {
    xpc_object_t v19 = xpc_null_create();
  }
  xpc_dictionary_set_value(v38, (const char *)*MEMORY[0x1E4F4CE58], v19);
  xpc_object_t v20 = xpc_null_create();
  xpc_release(v19);
  xpc_release(v20);
  memset(&__dst, 170, sizeof(__dst));
  v21 = (const void *)*MEMORY[0x1E4F4CD48];
  size_t v22 = strlen((const char *)*MEMORY[0x1E4F4CD48]);
  if (v22 >= 0x7FFFFFFFFFFFFFF8) {
    std::string::__throw_length_error[abi:ne180100]();
  }
  std::string::size_type v23 = v22;
  if (v22 >= 0x17)
  {
    uint64_t v25 = (v22 & 0xFFFFFFFFFFFFFFF8) + 8;
    if ((v22 | 7) != 0x17) {
      uint64_t v25 = v22 | 7;
    }
    uint64_t v26 = v25 + 1;
    p_dst = (std::string *)operator new(v25 + 1);
    __dst.__r_.__value_.__l.__size_ = v23;
    __dst.__r_.__value_.__r.__words[2] = v26 | 0x8000000000000000;
    __dst.__r_.__value_.__r.__words[0] = (std::string::size_type)p_dst;
  }
  else
  {
    *((unsigned char *)&__dst.__r_.__value_.__s + 23) = v22;
    p_dst = &__dst;
    if (!v22) {
      goto LABEL_32;
    }
  }
  memmove(p_dst, v21, v23);
LABEL_32:
  p_dst->__r_.__value_.__s.__data_[v23] = 0;
  GetABMLogServer(&v35);
  v27 = *((void *)GetGlobalLogger(&v35) + 4);
  size_t v28 = v36;
  if (v36 && !atomic_fetch_add(&v36->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
  {
    ((void (*)(std::__shared_weak_count *))v28->__on_zero_shared)(v28);
    std::__shared_weak_count::__release_weak(v28);
    if (!os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_41;
    }
  }
  else if (!os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
  {
    goto LABEL_41;
  }
  xpc::object::to_string((uint64_t *)__p, (xpc::object *)&v38);
  if (v34 >= 0) {
    uint64_t v29 = __p;
  }
  else {
    uint64_t v29 = (void **)__p[0];
  }
  *(_DWORD *)buf = 136315394;
  size_t v40 = v21;
  __int16 v41 = 2080;
  std::string v42 = v29;
  _os_log_impl(&dword_1C59C6000, v27, OS_LOG_TYPE_DEFAULT, "#I Submitting CoreAnalytics event[%s] - %s", buf, 0x16u);
  if (v34 < 0) {
    operator delete(__p[0]);
  }
LABEL_41:
  int v30 = SHIBYTE(__dst.__r_.__value_.__r.__words[2]);
  if (SHIBYTE(__dst.__r_.__value_.__r.__words[2]) < 0) {
    std::string::__init_copy_ctor_external(&v32, __dst.__r_.__value_.__l.__data_, __dst.__r_.__value_.__l.__size_);
  }
  else {
    std::string v32 = __dst;
  }
  xpc_object_t object = v38;
  if (v38) {
    xpc_retain(v38);
  }
  else {
    xpc_object_t object = xpc_null_create();
  }
  metric::sendCoreAnalyticsEvent((const void **)&v32.__r_.__value_.__l.__data_, &object);
  xpc_release(object);
  xpc_object_t object = 0;
  if (SHIBYTE(v32.__r_.__value_.__r.__words[2]) < 0)
  {
    operator delete(v32.__r_.__value_.__l.__data_);
    if ((v30 & 0x80000000) == 0) {
      goto LABEL_49;
    }
LABEL_51:
    operator delete(__dst.__r_.__value_.__l.__data_);
    goto LABEL_49;
  }
  if (v30 < 0) {
    goto LABEL_51;
  }
LABEL_49:
  xpc_release(v38);
}

- (void)userNotificationCenter:(id)a3 didReceiveNotificationResponse:(id)a4 withCompletionHandler:(id)a5
{
  id v7 = a4;
  id v8 = a5;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __103__UserNotificationManager_userNotificationCenter_didReceiveNotificationResponse_withCompletionHandler___block_invoke;
  block[3] = &unk_1E651B5B8;
  unint64_t v14 = self;
  id v15 = v8;
  id v13 = v7;
  fObj = self->fQueue.fObj.fObj;
  id v10 = v8;
  id v11 = v7;
  dispatch_async(fObj, block);
}

void __103__UserNotificationManager_userNotificationCenter_didReceiveNotificationResponse_withCompletionHandler___block_invoke(uint64_t a1)
{
  uint64_t v68 = *MEMORY[0x1E4F143B8];
  v2 = (void *)MEMORY[0x1C87957E0]();
  memset(__dst, 170, sizeof(__dst));
  id v3 = [*(id *)(a1 + 32) notification];
  BOOL v4 = [v3 request];
  id v5 = [v4 identifier];
  xpc_object_t v6 = (const char *)[v5 UTF8String];
  size_t v7 = strlen(v6);
  if (v7 >= 0x7FFFFFFFFFFFFFF8) {
    std::string::__throw_length_error[abi:ne180100]();
  }
  size_t v8 = v7;
  if (v7 >= 0x17)
  {
    uint64_t v10 = (v7 & 0xFFFFFFFFFFFFFFF8) + 8;
    if ((v7 | 7) != 0x17) {
      uint64_t v10 = v7 | 7;
    }
    uint64_t v11 = v10 + 1;
    uint64_t v9 = operator new(v10 + 1);
    *(void *)&__dst[8] = v8;
    *(void *)&__dst[16] = v11 | 0x8000000000000000;
    *(void *)std::string __dst = v9;
  }
  else
  {
    __dst[23] = v7;
    uint64_t v9 = __dst;
    if (!v7) {
      goto LABEL_9;
    }
  }
  memmove(v9, v6, v8);
LABEL_9:
  v9[v8] = 0;

  GetABMLogServer(&v59);
  uint64_t v12 = *((void *)GetGlobalLogger(&v59) + 4);
  id v13 = v60;
  if (v60 && !atomic_fetch_add(&v60->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
  {
    ((void (*)(std::__shared_weak_count *))v13->__on_zero_shared)(v13);
    std::__shared_weak_count::__release_weak(v13);
    if (!os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_15;
    }
  }
  else if (!os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    goto LABEL_15;
  }
  unint64_t v14 = __dst;
  if (__dst[23] < 0) {
    unint64_t v14 = *(unsigned char **)__dst;
  }
  LODWORD(buf) = 136315138;
  *(void *)((char *)&buf + 4) = v14;
  _os_log_impl(&dword_1C59C6000, v12, OS_LOG_TYPE_DEFAULT, "#I Received notification response with id: %s", (uint8_t *)&buf, 0xCu);
LABEL_15:
  uint64_t v15 = *(void *)(a1 + 48);
  if (v15) {
    (*(void (**)(void))(v15 + 16))();
  }
  v57[0] = 0;
  v57[1] = 0;
  uint64_t v58 = 0;
  uint64_t v16 = *(void *)(a1 + 40);
  xpc_object_t v19 = *(uint64_t ***)(v16 + 32);
  xpc_object_t v17 = (uint64_t *)(v16 + 32);
  size_t v18 = v19;
  if (v19)
  {
    if (__dst[23] >= 0) {
      xpc_object_t v20 = __dst;
    }
    else {
      xpc_object_t v20 = *(unsigned char **)__dst;
    }
    if (__dst[23] >= 0) {
      size_t v21 = __dst[23];
    }
    else {
      size_t v21 = *(void *)&__dst[8];
    }
    size_t v22 = v17;
    while (1)
    {
      int v23 = *((char *)v18 + 55);
      if (v23 >= 0) {
        unint64_t v24 = (uint64_t *)(v18 + 4);
      }
      else {
        unint64_t v24 = v18[4];
      }
      if (v23 >= 0) {
        size_t v25 = *((unsigned __int8 *)v18 + 55);
      }
      else {
        size_t v25 = (size_t)v18[5];
      }
      if (v21 >= v25) {
        size_t v26 = v25;
      }
      else {
        size_t v26 = v21;
      }
      int v27 = memcmp(v24, v20, v26);
      if (v27)
      {
        if (v27 < 0) {
          goto LABEL_25;
        }
LABEL_39:
        size_t v22 = (uint64_t *)v18;
        size_t v18 = (uint64_t **)*v18;
        if (!v18)
        {
LABEL_40:
          if (v22 == v17) {
            break;
          }
          int v28 = *((char *)v22 + 55);
          if (v28 >= 0) {
            uint64_t v29 = v22 + 4;
          }
          else {
            uint64_t v29 = (const void *)v22[4];
          }
          if (v28 >= 0) {
            size_t v30 = *((unsigned __int8 *)v22 + 55);
          }
          else {
            size_t v30 = v22[5];
          }
          if (v30 >= v21) {
            size_t v31 = v21;
          }
          else {
            size_t v31 = v30;
          }
          int v32 = memcmp(v20, v29, v31);
          if (v32)
          {
            if (v32 < 0) {
              break;
            }
          }
          else if (v21 < v30)
          {
            break;
          }
          *(void *)&v63[16] = 0xAAAAAAAAAAAAAAAALL;
          *(void *)&long long v33 = 0xAAAAAAAAAAAAAAAALL;
          *((void *)&v33 + 1) = 0xAAAAAAAAAAAAAAAALL;
          long long buf = v33;
          *(_OWORD *)size_t v63 = v33;
          *(void *)&long long buf = _Block_copy((const void *)v22[7]);
          char v34 = v22[8];
          *((void *)&buf + 1) = v34;
          if (v34) {
            dispatch_retain(v34);
          }
          uint64_t v35 = (void **)(v22 + 9);
          if (*((char *)v22 + 95) < 0)
          {
            std::string::__init_copy_ctor_external((std::string *)v63, (const std::string::value_type *)v22[9], v22[10]);
          }
          else
          {
            *(_OWORD *)size_t v63 = *(_OWORD *)v35;
            *(void *)&v63[16] = v22[11];
          }
          if ((void)buf)
          {
            if (*((void *)&buf + 1))
            {
              block[0] = MEMORY[0x1E4F143A8];
              block[1] = 3321888768;
              block[2] = __103__UserNotificationManager_userNotificationCenter_didReceiveNotificationResponse_withCompletionHandler___block_invoke_60;
              block[3] = &__block_descriptor_72_ea8_32c18_ZTS12CallBackData_e5_v8__0l;
              id v54 = _Block_copy((const void *)buf);
              dispatch_object_t v55 = (dispatch_object_t)*((void *)&buf + 1);
              if (*((void *)&buf + 1)) {
                dispatch_retain(*((dispatch_object_t *)&buf + 1));
              }
              if ((v63[23] & 0x80000000) != 0) {
                std::string::__init_copy_ctor_external(&__p, *(const std::string::value_type **)v63, *(std::string::size_type *)&v63[8]);
              }
              else {
                std::string __p = *(std::string *)v63;
              }
              dispatch_async(*((dispatch_queue_t *)&buf + 1), block);
              if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0) {
                operator delete(__p.__r_.__value_.__l.__data_);
              }
              if (v55) {
                dispatch_release(v55);
              }
            }
            else
            {
              (*(void (**)(void))(buf + 16))();
            }
          }
          if (SHIBYTE(v58) < 0)
          {
            if (v63[23] >= 0) {
              size_t v36 = v63;
            }
            else {
              size_t v36 = *(unsigned char **)v63;
            }
            if (v63[23] >= 0) {
              size_t v37 = v63[23];
            }
            else {
              size_t v37 = *(void *)&v63[8];
            }
            std::string::__assign_no_alias<false>(v57, v36, v37);
          }
          else if ((v63[23] & 0x80) != 0)
          {
            std::string::__assign_no_alias<true>(v57, *(void **)v63, *(size_t *)&v63[8]);
          }
          else
          {
            *(_OWORD *)unint64_t v57 = *(_OWORD *)v63;
            uint64_t v58 = *(void *)&v63[16];
          }
          xpc_object_t v38 = *(void **)(a1 + 40);
          id v39 = (uint64_t *)v22[1];
          if (v39)
          {
            do
            {
              size_t v40 = v39;
              id v39 = (uint64_t *)*v39;
            }
            while (v39);
          }
          else
          {
            __int16 v41 = v22;
            do
            {
              size_t v40 = (uint64_t *)v41[2];
              BOOL v42 = *v40 == (void)v41;
              __int16 v41 = v40;
            }
            while (!v42);
          }
          if ((uint64_t *)v38[3] == v22) {
            v38[3] = v40;
          }
          uint64_t v43 = (uint64_t *)v38[4];
          --v38[5];
          std::__tree_remove[abi:ne180100]<std::__tree_node_base<void *> *>(v43, v22);
          if (*((char *)v22 + 95) < 0) {
            operator delete(*v35);
          }
          std::string v44 = v22[8];
          if (v44) {
            dispatch_release(v44);
          }

          if (*((char *)v22 + 55) < 0) {
            operator delete((void *)v22[4]);
          }
          operator delete(v22);
          GetABMLogServer(&v51);
          size_t v45 = *((void *)GetGlobalLogger(&v51) + 4);
          uint64_t v46 = v52;
          if (v52 && !atomic_fetch_add(&v52->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
          {
            ((void (*)(std::__shared_weak_count *))v46->__on_zero_shared)(v46);
            std::__shared_weak_count::__release_weak(v46);
            if (!os_log_type_enabled(v45, OS_LOG_TYPE_DEFAULT)) {
              goto LABEL_108;
            }
LABEL_102:
            uint64_t v47 = __dst;
            if (__dst[23] < 0) {
              uint64_t v47 = *(unsigned char **)__dst;
            }
            *(_DWORD *)unint64_t v66 = 136315138;
            size_t v67 = v47;
            _os_log_impl(&dword_1C59C6000, v45, OS_LOG_TYPE_DEFAULT, "#I Remove callback for id: %s", v66, 0xCu);
            if ((v63[23] & 0x80000000) != 0) {
              goto LABEL_105;
            }
LABEL_109:
            v48 = *((void *)&buf + 1);
            if (!*((void *)&buf + 1))
            {
LABEL_111:

              break;
            }
          }
          else
          {
            if (os_log_type_enabled(v45, OS_LOG_TYPE_DEFAULT)) {
              goto LABEL_102;
            }
LABEL_108:
            if ((v63[23] & 0x80000000) == 0) {
              goto LABEL_109;
            }
LABEL_105:
            operator delete(*(void **)v63);
            v48 = *((void *)&buf + 1);
            if (!*((void *)&buf + 1)) {
              goto LABEL_111;
            }
          }
          dispatch_release(v48);
          goto LABEL_111;
        }
      }
      else
      {
        if (v25 >= v21) {
          goto LABEL_39;
        }
LABEL_25:
        size_t v18 = (uint64_t **)v18[1];
        if (!v18) {
          goto LABEL_40;
        }
      }
    }
  }
  uint64_t v65 = 0;
  long long v64 = 0u;
  long long buf = 0u;
  memset(v63, 0, sizeof(v63));
  if ((__dst[23] & 0x80000000) == 0)
  {
    long long buf = *(_OWORD *)__dst;
    *(void *)size_t v63 = *(void *)&__dst[16];
    if ((SHIBYTE(v58) & 0x80000000) == 0)
    {
LABEL_114:
      *(_OWORD *)&v63[8] = *(_OWORD *)v57;
      *(void *)&v63[24] = v58;
      goto LABEL_125;
    }
    goto LABEL_117;
  }
  std::string::__assign_no_alias<true>(&buf, *(void **)__dst, *(size_t *)&__dst[8]);
  if ((v63[31] & 0x80000000) == 0)
  {
    if ((v58 & 0x8000000000000000) == 0) {
      goto LABEL_114;
    }
LABEL_117:
    std::string::__assign_no_alias<true>(&v63[8], v57[0], (size_t)v57[1]);
    goto LABEL_125;
  }
  if (v58 >= 0) {
    v49 = v57;
  }
  else {
    v49 = (void **)v57[0];
  }
  if (v58 >= 0) {
    size_t v50 = HIBYTE(v58);
  }
  else {
    size_t v50 = (size_t)v57[1];
  }
  std::string::__assign_no_alias<false>((void **)&v63[8], v49, v50);
LABEL_125:
  [*(id *)(a1 + 40) updateAnalyticsEvent:&buf withUserReponse:1];
  if (SHIBYTE(v65) < 0)
  {
    operator delete((void *)v64);
    if ((v63[31] & 0x80000000) == 0)
    {
LABEL_127:
      if ((v63[7] & 0x80000000) == 0) {
        goto LABEL_128;
      }
      goto LABEL_133;
    }
  }
  else if ((v63[31] & 0x80000000) == 0)
  {
    goto LABEL_127;
  }
  operator delete(*(void **)&v63[8]);
  if ((v63[7] & 0x80000000) == 0)
  {
LABEL_128:
    if ((SHIBYTE(v58) & 0x80000000) == 0) {
      goto LABEL_129;
    }
LABEL_134:
    operator delete(v57[0]);
    if ((__dst[23] & 0x80000000) == 0) {
      goto LABEL_130;
    }
LABEL_135:
    operator delete(*(void **)__dst);
    goto LABEL_130;
  }
LABEL_133:
  operator delete((void *)buf);
  if (SHIBYTE(v58) < 0) {
    goto LABEL_134;
  }
LABEL_129:
  if ((__dst[23] & 0x80000000) != 0) {
    goto LABEL_135;
  }
LABEL_130:
}

uint64_t __103__UserNotificationManager_userNotificationCenter_didReceiveNotificationResponse_withCompletionHandler___block_invoke_60(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void).cxx_destruct
{
  std::__tree<std::__value_type<std::string,CallBackData>,std::__map_value_compare<std::string,std::__value_type<std::string,CallBackData>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,CallBackData>>>::destroy((char *)self->fCallBackMapWithQueue.__tree_.__pair1_.__value_.__left_);
  fObj = self->fQueue.fObj.fObj;
  if (fObj) {
    dispatch_release(fObj);
  }

  objc_storeStrong((id *)&self->fUserNotificationCenter, 0);
}

- (id).cxx_construct
{
  *((void *)self + 5) = 0;
  *((void *)self + 4) = 0;
  *((void *)self + 2) = 0;
  *((void *)self + 3) = (char *)self + 32;
  return self;
}

@end