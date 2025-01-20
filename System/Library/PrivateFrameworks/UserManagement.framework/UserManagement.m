void sub_190C39F34(uint64_t a1)
{
}

void sub_190C39F3C(uint64_t a1)
{
}

void sub_190C39F44(uint64_t a1)
{
}

void sub_190C39F4C(uint64_t a1)
{
}

void sub_190C39F54(uint64_t a1)
{
}

uint64_t sub_190C39F5C(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

uint64_t sub_190C39F6C(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

uint64_t sub_190C39F7C(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

uint64_t sub_190C39F8C(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

uint64_t sub_190C39F9C(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void sub_190C39FC4()
{
  uint64_t v0 = objc_opt_new();
  v1 = (void *)qword_1EB219798;
  qword_1EB219798 = v0;

  if (qword_1EB219798) {
    *(void *)(qword_1EB219798 + 8) = 2;
  }
}

void sub_190C3A008()
{
  uint64_t v0 = objc_opt_new();
  v1 = (void *)qword_1EB2197B8;
  qword_1EB2197B8 = v0;

  v3 = dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_USER_INITIATED, 0);
  dispatch_queue_t v2 = dispatch_queue_create("UMQueueServer", v3);
  sub_190C3C51C(qword_1EB2197B8, v2);
}

uint64_t sub_190C3A094()
{
  qword_1EB2197F0 = objc_opt_new();
  return MEMORY[0x1F41817F8]();
}

void sub_190C3A2C4(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  if (WeakRetained)
  {
    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  }
  else
  {
    uint64_t v2 = sub_190C3B928();
    v9 = (void *)v2;
    uint64_t v10 = *(void *)(a1 + 32);
    if (v10) {
      uint64_t v10 = *(void *)(v10 + 8);
    }
    sub_190C49FC4(v2, @"Object was released before block was called in queue: %@", v3, v4, v5, v6, v7, v8, v10);
  }
}

void sub_190C3A360(uint64_t a1)
{
  uint64_t v2 = *(void **)(a1 + 32);
  id v6 = 0;
  char v3 = sub_190C3ABE4((uint64_t)UMMobileKeyBag, v2, &v6);
  id v4 = v6;
  id v5 = v6;
  if ((v3 & 1) == 0) {
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), v4);
  }
}

uint64_t sub_190C3A468()
{
  self;
  self;
  if (byte_1EB2197E8 && (byte_1E92A9931 & 1) == 0)
  {
    v21[0] = 0;
    v21[1] = v21;
    v21[2] = 0x3032000000;
    v21[3] = sub_190C39F5C;
    v21[4] = sub_190C39F34;
    id v22 = 0;
    uint64_t v17 = 0;
    v18 = &v17;
    uint64_t v19 = 0x2020000000;
    char v20 = 0;
    uint64_t v0 = sub_190C4D8F4();
    v1 = sub_190C54624(v0);

    v16[0] = MEMORY[0x1E4F143A8];
    v16[1] = 3221225472;
    v16[2] = sub_190C43EEC;
    v16[3] = &unk_1E56C6100;
    v16[4] = v21;
    char v3 = objc_msgSend_synchronousRemoteObjectProxyWithErrorHandler_(v1, v2, (uint64_t)v16);
    v15[0] = MEMORY[0x1E4F143A8];
    v15[1] = 3221225472;
    v15[2] = sub_190C43F8C;
    v15[3] = &unk_1E56C61E0;
    v15[4] = v21;
    v15[5] = &v17;
    objc_msgSend_isLoginSessionwithReply_(v3, v4, (uint64_t)v15);

    byte_1E92A9930 = *((unsigned char *)v18 + 24);
    byte_1E92A9931 = 1;
    v11 = sub_190C3C3A4();
    if (byte_1E92A9930) {
      v12 = "TRUE";
    }
    else {
      v12 = "FALSE";
    }
    v13 = sub_190C3B80C((uint64_t)UMLogMessage, @"isLoginSession:%s", v5, v6, v7, v8, v9, v10, (uint64_t)v12);
    sub_190C3B464((uint64_t)v11, v13);

    _Block_object_dispose(&v17, 8);
    _Block_object_dispose(v21, 8);
  }
  return byte_1E92A9930;
}

void sub_190C3A690(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  va_start(va, a13);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v13 - 112), 8);
  _Unwind_Resume(a1);
}

void sub_190C3A81C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

UMUserPersona *sub_190C3A85C()
{
  self;
  uint64_t v0 = objc_alloc_init(UMUserPersona);
  return v0;
}

uint64_t sub_190C3AB20()
{
  return byte_1EB2197E8;
}

id sub_190C3AB40()
{
  uint64_t v0 = self;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = sub_190C3A008;
  block[3] = &unk_1E56C5FF8;
  block[4] = v0;
  if (qword_1EB2197C0 != -1) {
    dispatch_once(&qword_1EB2197C0, block);
  }
  v1 = (void *)qword_1EB2197B8;
  return v1;
}

uint64_t sub_190C3ABE4(uint64_t a1, void *a2, void *a3)
{
  id v4 = a2;
  self;
  if (a3) {
    *a3 = 0;
  }
  if (!v4)
  {
    v73 = sub_190C3B928();
    v80 = sub_190C3B80C((uint64_t)UMLogMessage, @"dropping voucher due to nil personaUniqueString", v74, v75, v76, v77, v78, v79, v117);
    sub_190C3B464((uint64_t)v73, v80);

LABEL_14:
    id v81 = 0;
LABEL_19:
    uint64_t v108 = 1;
    goto LABEL_20;
  }
  if (qword_1E92A98D0 && sub_190C3BD40())
  {
    uint64_t v5 = sub_190C3C3A4();
    sub_190C3B80C((uint64_t)UMLogMessage, @"Persona generation has changed; dropping cached vouchers.",
      v6,
      v7,
      v8,
      v9,
      v10,
      v11,
    v12 = v117);
    sub_190C3B464((uint64_t)v5, v12);

    objc_msgSend_removeAllObjects((void *)qword_1E92A98D0, v13, v14);
  }
  v15 = sub_190C3B928();
  id v22 = sub_190C3B80C((uint64_t)UMLogMessage, @"Adopting Voucher for accountID:%@", v16, v17, v18, v19, v20, v21, (uint64_t)v4);
  sub_190C3B464((uint64_t)v15, v22);

  if (qword_1E92A98D0)
  {
    v25 = objc_msgSend_allKeys((void *)qword_1E92A98D0, v23, v24);
    if (v25
      && (sub_190C3B928(),
          v26 = objc_claimAutoreleasedReturnValue(),
          sub_190C3B80C((uint64_t)UMLogMessage, @"AllKeys is:%@", v27, v28, v29, v30, v31, v32, (uint64_t)v4), v33 = objc_claimAutoreleasedReturnValue(), sub_190C3B464((uint64_t)v26, v33), v33, v26, (objc_msgSend_containsObject_(v25, v34, (uint64_t)v4) & 1) != 0))
    {
      v36 = objc_msgSend_objectForKey_((void *)qword_1E92A98D0, v35, (uint64_t)v4);
      v37 = sub_190C3B928();
      v44 = sub_190C3B80C((uint64_t)UMLogMessage, @"has Cache key and its value is:%@", v38, v39, v40, v41, v42, v43, (uint64_t)v36);
      sub_190C3B464((uint64_t)v37, v44);

      if (v36)
      {
        v45 = sub_190C3B928();
        v52 = sub_190C3B80C((uint64_t)UMLogMessage, @"Found Cached Copy of voucher for Account:%@", v46, v47, v48, v49, v50, v51, (uint64_t)v4);
        sub_190C3B464((uint64_t)v45, v52);

        objc_msgSend_contextAdopt(v36, v53, v54);
        v55 = sub_190C3C3A4();
        v62 = sub_190C3B80C((uint64_t)UMLogMessage, @"Adopted cached Voucher for accountID:%@", v56, v57, v58, v59, v60, v61, (uint64_t)v4);
        sub_190C3B464((uint64_t)v55, v62);

        objc_msgSend_removeObjectForKey_((void *)qword_1E92A98D0, v63, (uint64_t)v4);
        v65 = objc_alloc_init(UMUserPersonaContext);
        if (v65)
        {
          objc_msgSend_setObject_forKey_((void *)qword_1E92A98D0, v64, (uint64_t)v65, v4);
          v66 = sub_190C3B928();
          sub_190C3B80C((uint64_t)UMLogMessage, @"Cached personaVocuherDictionary is :%@", v67, v68, v69, v70, v71, v72, qword_1E92A98D0);
        }
        else
        {
          v66 = sub_190C3B928();
          sub_190C3B80C((uint64_t)UMLogMessage, @"could not generate a cached Copy after adoption for Account:%@", v110, v111, v112, v113, v114, v115, (uint64_t)v4);
        v116 = };
        sub_190C3B464((uint64_t)v66, v116);

        goto LABEL_14;
      }
    }
    else
    {
      v82 = sub_190C3B928();
      v89 = sub_190C3B80C((uint64_t)UMLogMessage, @"has NO Cache key", v83, v84, v85, v86, v87, v88, v118);
      sub_190C3B464((uint64_t)v82, v89);
    }
  }
  v90 = sub_190C3B928();
  v97 = sub_190C3B80C((uint64_t)UMLogMessage, @"No Cached Copy of voucher for Account:%@, generating one from usermanagerd", v91, v92, v93, v94, v95, v96, (uint64_t)v4);
  sub_190C3B464((uint64_t)v90, v97);

  int v98 = mach_voucher_persona_self();
  objc_msgSend_errorWithDomain_code_userInfo_(MEMORY[0x1E4F28C58], v99, *MEMORY[0x1E4F285A8], v98, 0);
  id v81 = (id)objc_claimAutoreleasedReturnValue();
  v100 = sub_190C3C3A4();
  v107 = sub_190C3B80C((uint64_t)UMLogMessage, @"Failed to get existing mach voucher Port with error:%@", v101, v102, v103, v104, v105, v106, (uint64_t)v81);
  sub_190C3B464((uint64_t)v100, v107);

  if (!v81) {
    goto LABEL_19;
  }
  if (a3)
  {
    id v81 = v81;
    uint64_t v108 = 0;
    *a3 = v81;
  }
  else
  {
    uint64_t v108 = 0;
  }
LABEL_20:

  return v108;
}

void sub_190C3B464(uint64_t a1, void *a2)
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  if (a1)
  {
    unint64_t v2 = *(void *)(a1 + 8);
    if (v2 >= 5) {
      os_log_type_t v3 = OS_LOG_TYPE_DEFAULT;
    }
    else {
      os_log_type_t v3 = (0x1110020100uLL >> (8 * v2));
    }
    id v4 = a2;
    uint64_t v5 = sub_190C3B62C(v4);
    uint64_t v6 = sub_190C3B7D8(v4);

    if (v5)
    {
      BOOL v7 = os_log_type_enabled(MEMORY[0x1E4F14500], v3);
      if (v6)
      {
        if (v7)
        {
          int v12 = 67240707;
          uid_t v13 = getuid();
          __int16 v14 = 2114;
          v15 = v5;
          __int16 v16 = 2113;
          uint64_t v17 = v6;
          os_log_type_t v8 = v3;
          uint64_t v9 = MEMORY[0x1E4F14500];
          uint64_t v10 = "(%{public}d) %{public}@; %{private}@";
          uint32_t v11 = 28;
LABEL_15:
          _os_log_impl(&dword_190C38000, v9, v8, v10, (uint8_t *)&v12, v11);
        }
LABEL_16:

        return;
      }
      if (!v7) {
        goto LABEL_16;
      }
      int v12 = 67240450;
      uid_t v13 = getuid();
      __int16 v14 = 2114;
      v15 = v5;
      os_log_type_t v8 = v3;
      uint64_t v9 = MEMORY[0x1E4F14500];
      uint64_t v10 = "(%{public}d) %{public}@";
    }
    else
    {
      if (!v6 || !os_log_type_enabled(MEMORY[0x1E4F14500], v3)) {
        goto LABEL_16;
      }
      int v12 = 67240451;
      uid_t v13 = getuid();
      __int16 v14 = 2113;
      v15 = v6;
      uint64_t v9 = MEMORY[0x1E4F14500];
      uint64_t v10 = "(%{public}d) %{private}@";
      os_log_type_t v8 = v3;
    }
    uint32_t v11 = 18;
    goto LABEL_15;
  }
}

void **sub_190C3B62C(void **a1)
{
  if (a1)
  {
    sub_190C3B660((uint64_t)a1, a1[1]);
    a1 = (void **)objc_claimAutoreleasedReturnValue();
    uint64_t v1 = vars8;
  }
  return a1;
}

id sub_190C3B660(uint64_t a1, void *a2)
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  uint64_t v6 = v3;
  BOOL v7 = 0;
  if (a1 && v3)
  {
    if (objc_msgSend_count(v3, v4, v5))
    {
      BOOL v7 = objc_opt_new();
      long long v17 = 0u;
      long long v18 = 0u;
      long long v19 = 0u;
      long long v20 = 0u;
      id v8 = v6;
      uint64_t v10 = objc_msgSend_countByEnumeratingWithState_objects_count_(v8, v9, (uint64_t)&v17, v21, 16);
      if (v10)
      {
        uint64_t v12 = v10;
        uint64_t v13 = *(void *)v18;
        __int16 v14 = &stru_1EE0936C0;
        do
        {
          for (uint64_t i = 0; i != v12; ++i)
          {
            if (*(void *)v18 != v13) {
              objc_enumerationMutation(v8);
            }
            objc_msgSend_appendFormat_(v7, v11, @"%@%@", v14, *(void *)(*((void *)&v17 + 1) + 8 * i), (void)v17);
            __int16 v14 = @", ";
          }
          uint64_t v12 = objc_msgSend_countByEnumeratingWithState_objects_count_(v8, v11, (uint64_t)&v17, v21, 16);
          __int16 v14 = @", ";
        }
        while (v12);
      }
    }
    else
    {
      BOOL v7 = 0;
    }
  }

  return v7;
}

void **sub_190C3B7D8(void **a1)
{
  if (a1)
  {
    sub_190C3B660((uint64_t)a1, a1[2]);
    a1 = (void **)objc_claimAutoreleasedReturnValue();
    uint64_t v1 = vars8;
  }
  return a1;
}

void **sub_190C3B80C(uint64_t a1, void *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  id v9 = a2;
  self;
  uint64_t v10 = (void **)objc_opt_new();
  id v11 = [NSString alloc];
  uint64_t v13 = objc_msgSend_initWithFormat_arguments_(v11, v12, (uint64_t)v9, &a9);

  if (v13)
  {
    if (v10) {
      objc_msgSend_addObject_(v10[1], v14, (uint64_t)v13);
    }
    else {
      objc_msgSend_addObject_(0, v14, (uint64_t)v13);
    }
  }

  return v10;
}

id sub_190C3B928()
{
  uint64_t v0 = self;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = sub_190C39FC4;
  block[3] = &unk_1E56C5FF8;
  block[4] = v0;
  if (qword_1EB2197A0 != -1) {
    dispatch_once(&qword_1EB2197A0, block);
  }
  uint64_t v1 = (void *)qword_1EB219798;
  return v1;
}

__CFDictionary *UMUserTypeDeviceMode(uint64_t a1, CFErrorRef *a2)
{
  id v3 = sub_190C3C490();
  uint32_t v25 = 0;
  uint64_t v4 = sub_190C3C448(&v25);
  if (v4)
  {
    uint64_t v5 = sub_190C3C3A4();
    uint64_t v12 = sub_190C3B80C((uint64_t)UMLogMessage, @"Failed to get multiuser_config flags from kernel with error:%d", v6, v7, v8, v9, v10, v11, v4);
    sub_190C3B464((uint64_t)v5, v12);

    long long v19 = sub_190C3C3A4();
    if (v4 == 2) {
      long long v20 = @"FAILED to UMUserTypeDeviceMode, EPERM";
    }
    else {
      long long v20 = @"FAILED to UMUserTypeDeviceMode, EINVAL";
    }
    if (v4 == 2) {
      CFIndex v21 = 1;
    }
    else {
      CFIndex v21 = 22;
    }
    uint64_t v22 = sub_190C3B80C((uint64_t)UMLogMessage, v20, v13, v14, v15, v16, v17, v18, v24);
    sub_190C3B464((uint64_t)v19, v22);
  }
  else
  {
    if ((v25 & 0x80000000) != 0)
    {
      CFDictionarySetValue(v3, kUMDeviceModeKey, kUMDeviceModeSharedIPad);
      CFDictionarySetValue(v3, kUMUserTypeKey, kUMUserTypeEphemeral);
      return v3;
    }
    CFIndex v21 = 0;
  }
  CFDictionarySetValue(v3, kUMDeviceModeKey, kUMDeviceModeSingleUser);
  CFDictionarySetValue(v3, kUMUserTypeKey, kUMUserTypePermanent);
  if (a2 && v4) {
    *a2 = CFErrorCreate(0, (CFErrorDomain)*MEMORY[0x1E4F1D160], v21, 0);
  }
  return v3;
}

void sub_190C3BBDC(uint64_t a1, void *a2, void *a3)
{
  if (a1) {
    sub_190C3BBEC(a1, a2, a3, 1);
  }
}

void sub_190C3BBEC(uint64_t a1, void *a2, void *a3, int a4)
{
  id v7 = a3;
  if (a1)
  {
    objc_initWeak(&location, a2);
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = sub_190C3A2C4;
    v10[3] = &unk_1E56C6020;
    objc_copyWeak(&v12, &location);
    v10[4] = a1;
    id v11 = v7;
    uint64_t v8 = (void *)MEMORY[0x192FD5500](v10);
    uint64_t v9 = *(NSObject **)(a1 + 8);
    if (a4) {
      dispatch_sync(v9, v8);
    }
    else {
      dispatch_async(v9, v8);
    }

    objc_destroyWeak(&v12);
    objc_destroyWeak(&location);
  }
}

uint64_t sub_190C3BD40()
{
  self;
  uint64_t v0 = sub_190C3C34C();
  id v12 = 0;
  uint64_t v1 = sub_190C3BE3C((uint64_t)v0, &v12);
  id v2 = v12;

  if (v2)
  {
    id v3 = sub_190C49DF4();
    sub_190C49FC4((uint64_t)v3, @"Failed to fetch test if generation has changed: failed to fetch new generation value: %@", v4, v5, v6, v7, v8, v9, (uint64_t)v2);

LABEL_6:
    uint64_t v10 = 1;
    goto LABEL_7;
  }
  if (v1 != qword_1E92A9858)
  {
    qword_1E92A9858 = v1;
    goto LABEL_6;
  }
  uint64_t v10 = 0;
LABEL_7:

  return v10;
}

uint64_t sub_190C3BE3C(uint64_t a1, void *a2)
{
  if (!a1) {
    return 0;
  }
  if (a2) {
    *a2 = 0;
  }
  os_unfair_lock_lock((os_unfair_lock_t)(a1 + 8));
  if (sub_190C3BEC0(a1)) {
    sub_190C3C980(a1);
  }
  uint64_t v4 = *(void *)(a1 + 56);
  if (!v4)
  {
    sub_190C3CC5C(a1, a2);
    uint64_t v4 = *(void *)(a1 + 56);
  }
  os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 8));
  return v4;
}

uint64_t sub_190C3BEC0(uint64_t a1)
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  if (a1)
  {
    if (*(_DWORD *)(a1 + 12) != -1) {
      goto LABEL_4;
    }
    id v2 = *(id *)(a1 + 40);
    uint64_t v5 = objc_msgSend_libNotify(v2, v3, v4);
    id v6 = *(id *)(a1 + 24);
    *(_DWORD *)(a1 + 12) = objc_msgSend_registerCheck_(v5, v7, (uint64_t)v6);

    if (*(_DWORD *)(a1 + 12) != -1)
    {
LABEL_4:
      id v8 = *(id *)(a1 + 40);
      id v11 = objc_msgSend_libNotify(v8, v9, v10);
      uint64_t v12 = *(unsigned int *)(a1 + 12);
      id v22 = 0;
      uint64_t HasPostedForToken_error = objc_msgSend_notificationHasPostedForToken_error_(v11, v13, v12, &v22);
      id v15 = v22;

      if ((HasPostedForToken_error & 1) == 0)
      {
        if (v15)
        {
          uint64_t v16 = *(id *)(a1 + 32);
          if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
          {
            int v17 = sub_190C3E7E8();
            if (!os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT)) {
              v17 &= ~1u;
            }
            if (v17)
            {
              uint64_t v18 = *(void *)(a1 + 16);
              int v23 = 138543362;
              uint64_t v24 = v18;
              long long v19 = v16;
              long long v20 = (void *)_os_log_send_and_compose_impl();

              if (v20) {
                sub_190C3E7F0();
              }
            }
            else
            {
              long long v20 = 0;
            }
            free(v20);
          }

          *(void *)(a1 + 56) = 0;
          goto LABEL_18;
        }
        if (!*(void *)(a1 + 56)) {
LABEL_18:
        }
          uint64_t HasPostedForToken_error = 1;
      }

      return HasPostedForToken_error;
    }
  }
  return 0;
}

id sub_190C3C34C()
{
  self;
  if (qword_1E92A98A8 != -1) {
    dispatch_once(&qword_1E92A98A8, &unk_1EE0918E0);
  }
  uint64_t v0 = (void *)qword_1E92A9878;
  return v0;
}

id sub_190C3C3A4()
{
  uint64_t v0 = self;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = sub_190C49CC0;
  block[3] = &unk_1E56C5FF8;
  block[4] = v0;
  if (qword_1EB2197E0 != -1) {
    dispatch_once(&qword_1EB2197E0, block);
  }
  uint64_t v1 = (void *)qword_1EB2197D8;
  return v1;
}

uint64_t sub_190C3C448(uint32_t *a1)
{
  uint32_t multiuser_flags = 0;
  host_t v2 = MEMORY[0x192FD5220]();
  uint64_t result = host_get_multiuser_config_flags(v2, &multiuser_flags);
  if (a1)
  {
    if (!result) {
      *a1 = multiuser_flags;
    }
  }
  return result;
}

CFMutableDictionaryRef sub_190C3C490()
{
  CFMutableDictionaryRef result = CFDictionaryCreateMutable((CFAllocatorRef)*MEMORY[0x1E4F1CF80], 0, MEMORY[0x1E4F1D530], MEMORY[0x1E4F1D540]);
  if (!result)
  {
    syslog(7, "Out of Memory!!! Dying!...so...cold....");
    exit(-1);
  }
  return result;
}

void sub_190C3C51C(uint64_t a1, void *a2)
{
  if (a1) {
    objc_storeStrong((id *)(a1 + 8), a2);
  }
}

id sub_190C3C52C()
{
  uint64_t v0 = self;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = sub_190C3C5D0;
  block[3] = &unk_1E56C5FF8;
  block[4] = v0;
  if (qword_1E92A98E0 != -1) {
    dispatch_once(&qword_1E92A98E0, block);
  }
  uint64_t v1 = (void *)qword_1E92A98D8;
  return v1;
}

void sub_190C3C5D0()
{
  uint64_t v0 = objc_opt_new();
  uint64_t v1 = (void *)qword_1E92A98D8;
  qword_1E92A98D8 = v0;

  id v3 = dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_USER_INITIATED, 0);
  dispatch_queue_t v2 = dispatch_queue_create("UMQueueClient", v3);
  sub_190C3C51C(qword_1E92A98D8, v2);
}

id sub_190C3C65C()
{
  uint64_t v0 = self;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = sub_190C3C700;
  block[3] = &unk_1E56C5FF8;
  block[4] = v0;
  if (qword_1E92A9818 != -1) {
    dispatch_once(&qword_1E92A9818, block);
  }
  uint64_t v1 = (void *)qword_1E92A9820;
  return v1;
}

void sub_190C3C700()
{
  uint64_t v0 = objc_opt_new();
  uint64_t v1 = (void *)qword_1E92A9820;
  qword_1E92A9820 = v0;

  id v3 = dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_USER_INITIATED, 0);
  dispatch_queue_t v2 = dispatch_queue_create("UMQueueUserList", v3);
  sub_190C3C51C(qword_1E92A9820, v2);
}

void sub_190C3C78C(uint64_t a1, void *a2, void *a3)
{
  if (a1) {
    sub_190C3BBEC(a1, a2, a3, 0);
  }
}

uint64_t sub_190C3C79C(uint64_t result)
{
  if (result) {
    return *(void *)(result + 8);
  }
  return result;
}

id *sub_190C3C7B4(uint64_t a1, void *a2, void *a3, void *a4, void *a5, void *a6)
{
  id v10 = a6;
  id v11 = a5;
  id v12 = a4;
  id v13 = a3;
  id v14 = a2;
  self;
  id v15 = sub_190C3C874((id *)[UMGenerationCache alloc], v14, v13, v12, v11, v10);

  return v15;
}

id *sub_190C3C874(id *a1, void *a2, void *a3, void *a4, void *a5, void *a6)
{
  id v12 = a2;
  id v13 = a3;
  id v14 = a4;
  id v15 = a5;
  id v16 = a6;
  if (a1)
  {
    v21.receiver = a1;
    v21.super_class = (Class)UMGenerationCache;
    int v17 = (id *)objc_msgSendSuper2(&v21, sel_init);
    a1 = v17;
    if (v17)
    {
      objc_storeStrong(v17 + 5, a5);
      objc_storeStrong(a1 + 2, a2);
      objc_storeStrong(a1 + 3, a3);
      a1[4] = v14;
      uint64_t v18 = MEMORY[0x192FD5500](v16);
      id v19 = a1[6];
      a1[6] = (id)v18;

      a1[7] = 0;
      a1[1] = (id)0xFFFFFFFF00000000;
    }
  }

  return a1;
}

void sub_190C3C980(uint64_t a1)
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  if (a1)
  {
    id v2 = *(id *)(a1 + 40);
    uint64_t v5 = objc_msgSend_libNotify(v2, v3, v4);
    uint64_t v6 = *(unsigned int *)(a1 + 12);
    id v20 = 0;
    uint64_t v8 = objc_msgSend_stateForToken_error_(v5, v7, v6, &v20);
    id v9 = v20;
    *(void *)(a1 + 56) = v8;

    if (*(void *)(a1 + 56))
    {
      if (qword_1E92A98B8 != -1) {
        dispatch_once(&qword_1E92A98B8, &unk_1EE091340);
      }
      id v10 = (id)qword_1E92A9880;
      if (!os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG)) {
        goto LABEL_25;
      }
      int v11 = sub_190C3E7E8();
      if (!os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG)) {
        v11 &= ~1u;
      }
      if (v11)
      {
        uint64_t v12 = *(void *)(a1 + 16);
        uint64_t v13 = *(void *)(a1 + 56);
        int v21 = 138543618;
        uint64_t v22 = v12;
        __int16 v23 = 2048;
        uint64_t v24 = v13;
        id v14 = v10;
        goto LABEL_21;
      }
LABEL_23:
      id v19 = 0;
LABEL_24:
      free(v19);
      goto LABEL_25;
    }
    id v10 = *(id *)(a1 + 32);
    BOOL v15 = os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT);
    if (v9)
    {
      if (v15)
      {
        int v16 = sub_190C3E7E8();
        if (!os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT)) {
          v16 &= ~1u;
        }
        if (!v16) {
          goto LABEL_23;
        }
LABEL_20:
        uint64_t v18 = *(void *)(a1 + 16);
        int v21 = 138543362;
        uint64_t v22 = v18;
        id v14 = v10;
LABEL_21:
        id v19 = (void *)_os_log_send_and_compose_impl();

        if (v19) {
          sub_190C3E7F0();
        }
        goto LABEL_24;
      }
    }
    else if (v15)
    {
      int v17 = sub_190C3E7E8();
      if (!os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT)) {
        v17 &= ~1u;
      }
      if (!v17) {
        goto LABEL_23;
      }
      goto LABEL_20;
    }
LABEL_25:
  }
}

BOOL sub_190C3CC48(BOOL result)
{
  if (result) {
    return *(void *)(result + 56) == 0;
  }
  return result;
}

void sub_190C3CC5C(uint64_t a1, void *a2)
{
  if (a1)
  {
    if (a2) {
      *a2 = 0;
    }
    uint64_t v4 = *(void **)(a1 + 48);
    uint64_t v5 = (uint64_t (*)(void))v4[2];
    uint64_t v6 = v4;
    uint64_t v7 = v5();
    id v8 = 0;
    *(void *)(a1 + 56) = v7;

    if (*(void *)(a1 + 56))
    {
      if (qword_1E92A98B8 != -1) {
        dispatch_once(&qword_1E92A98B8, &unk_1EE091340);
      }
      id v9 = (id)qword_1E92A9880;
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
      {
        int v10 = sub_190C3E7E8();
        if (!os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG)) {
          v10 &= ~1u;
        }
        if (v10)
        {
          int v11 = v9;
          uint64_t v12 = (void *)_os_log_send_and_compose_impl();

          if (v12) {
            sub_190C3E7F0();
          }
        }
        else
        {
          uint64_t v12 = 0;
        }
        free(v12);
      }
    }
    else
    {
      uint64_t v13 = *(id *)(a1 + 32);
      if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      {
        int v14 = sub_190C3E7E8();
        if (!os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
          v14 &= ~1u;
        }
        if (v14)
        {
          BOOL v15 = v13;
          int v16 = (void *)_os_log_send_and_compose_impl();

          if (v16) {
            sub_190C3E7F0();
          }
        }
        else
        {
          int v16 = 0;
        }
        free(v16);
      }

      if (a2) {
        *a2 = v8;
      }
    }
  }
}

uint64_t sub_190C3CEF8(uint64_t result)
{
  if (result) {
    return *(void *)(result + 56);
  }
  return result;
}

uint64_t sub_190C3CF04(uint64_t result)
{
  if (result) {
    return *(unsigned int *)(result + 12);
  }
  return result;
}

uint64_t sub_190C3CF10(uint64_t result)
{
  if (result) {
    return *(void *)(result + 40);
  }
  return result;
}

uint64_t sub_190C3CF1C(uint64_t result)
{
  if (result) {
    return *(void *)(result + 24);
  }
  return result;
}

uint64_t sub_190C3CF28(uint64_t result, int a2)
{
  if (result) {
    *(_DWORD *)(result + 12) = a2;
  }
  return result;
}

uint64_t sub_190C3CF34(uint64_t result)
{
  if (result) {
    return *(void *)(result + 32);
  }
  return result;
}

uint64_t sub_190C3CF40(uint64_t result)
{
  if (result) {
    return *(void *)(result + 16);
  }
  return result;
}

uint64_t sub_190C3CF4C(uint64_t result, uint64_t a2)
{
  if (result) {
    *(void *)(result + 56) = a2;
  }
  return result;
}

uint64_t sub_190C3CF58(uint64_t result)
{
  if (result) {
    return *(void *)(result + 48);
  }
  return result;
}

uint64_t sub_190C3CF64(uint64_t result)
{
  if (result) {
    return *(unsigned int *)(result + 8);
  }
  return result;
}

uint64_t sub_190C3CF70(uint64_t result, int a2)
{
  if (result) {
    *(_DWORD *)(result + 8) = a2;
  }
  return result;
}

uint64_t sub_190C3CFD8()
{
  qword_1E92A9880 = (uint64_t)os_log_create(off_1E92A8E80, "persona");
  return MEMORY[0x1F41817F8]();
}

id sub_190C3D020(uint64_t a1, unint64_t a2)
{
  uint64_t v3 = self;
  return sub_190C3D05C(v3, a2, 0);
}

id sub_190C3D05C(uint64_t a1, unint64_t a2, void *a3)
{
  v12[1] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v6 = self;
  if (a2 > 9) {
    uint64_t v7 = @"An error occurred";
  }
  else {
    uint64_t v7 = off_1E56C6080[a2];
  }
  uint64_t v11 = *MEMORY[0x1E4F28568];
  v12[0] = v7;
  id v8 = objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x1E4F1C9E8], v5, (uint64_t)v12, &v11, 1);
  id v9 = sub_190C3D23C(v6, a2, v8, v4);

  return v9;
}

id sub_190C3D158(uint64_t a1, unint64_t a2, void *a3)
{
  v11[1] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v6 = self;
  if (v4)
  {
    uint64_t v10 = *MEMORY[0x1E4F28A50];
    v11[0] = v4;
    uint64_t v7 = objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x1E4F1C9E8], v5, (uint64_t)v11, &v10, 1);
  }
  else
  {
    uint64_t v7 = 0;
  }
  id v8 = sub_190C3D05C(v6, a2, v7);

  return v8;
}

id sub_190C3D23C(uint64_t a1, uint64_t a2, void *a3, void *a4)
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  self;
  if (v7) {
    uint64_t v10 = objc_msgSend_mutableCopy(v7, v8, v9);
  }
  else {
    uint64_t v10 = objc_opt_new();
  }
  uint64_t v11 = (void *)v10;
  long long v27 = 0u;
  long long v28 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  id v12 = v6;
  uint64_t v14 = objc_msgSend_countByEnumeratingWithState_objects_count_(v12, v13, (uint64_t)&v25, v29, 16);
  if (v14)
  {
    uint64_t v16 = v14;
    uint64_t v17 = *(void *)v26;
    do
    {
      for (uint64_t i = 0; i != v16; ++i)
      {
        if (*(void *)v26 != v17) {
          objc_enumerationMutation(v12);
        }
        uint64_t v19 = *(void *)(*((void *)&v25 + 1) + 8 * i);
        id v20 = objc_msgSend_objectForKeyedSubscript_(v12, v15, v19, (void)v25);
        objc_msgSend_setObject_forKeyedSubscript_(v11, v21, (uint64_t)v20, v19);
      }
      uint64_t v16 = objc_msgSend_countByEnumeratingWithState_objects_count_(v12, v15, (uint64_t)&v25, v29, 16);
    }
    while (v16);
  }

  __int16 v23 = objc_msgSend_errorWithDomain_code_userInfo_(MEMORY[0x1E4F28C58], v22, @"UMUserManagerErrorDomain", a2, v11);

  return v23;
}

BOOL UMUserSessionSetSecureBackupBlob(uint64_t a1, void *a2, void *a3)
{
  uint64_t v5 = sub_190C4D8F4();
  id v10 = 0;
  BOOL v6 = sub_190C57D48(v5, a2, &v10);
  id v7 = v10;

  if (a3)
  {
    if (!v6 && v7 != 0) {
      *a3 = v7;
    }
  }

  return v6;
}

BOOL UMUserSessionRetrieveSecureBackupBlob(uint64_t a1, void *a2, void *a3)
{
  uint64_t v5 = sub_190C4D8F4();
  id v11 = 0;
  BOOL v6 = sub_190C58038(v5, &v11);
  id v7 = v11;

  if (a2 && (id v8 = v6) != 0 || a3 && (!v6 ? (v9 = v7 == 0) : (v9 = 1), id v8 = v7, a2 = a3, !v9)) {
    *a2 = v8;
  }

  return v6 != 0;
}

BOOL UMUserSessionDeleteSecureBackupBlob(uint64_t a1, void *a2)
{
  uint64_t v3 = sub_190C4D8F4();
  id v8 = 0;
  BOOL v4 = sub_190C58364(v3, &v8);
  id v5 = v8;

  if (a2)
  {
    if (!v4 && v5 != 0) {
      *a2 = v5;
    }
  }

  return v4;
}

BOOL UMUserSessionIsLoginWindow(uint64_t a1, void *a2)
{
  uint64_t v3 = sub_190C4D8F4();
  id v8 = 0;
  BOOL v4 = sub_190C58C50((uint64_t)v3, &v8);
  id v5 = v8;

  if (a2)
  {
    if (!v4 && v5 != 0) {
      *a2 = v5;
    }
  }

  return v4;
}

void *UMUserSessionConfigureLoginWindow(const __CFDictionary *a1, void *a2)
{
  if (a1 && CFDictionaryContainsKey(a1, kUMUserSessionTotalUsers)) {
    uint64_t v4 = sub_190C3DCE8(a1, kUMUserSessionTotalUsers);
  }
  else {
    uint64_t v4 = 0xFFFFFFFFLL;
  }
  id v5 = sub_190C4D8F4();
  id v10 = 0;
  BOOL v6 = sub_190C5863C(v5, v4, &v10);
  id v7 = v10;

  if (v6)
  {
    id v8 = v6;
  }
  else if (a2 && v7)
  {
    *a2 = v7;
  }

  return v6;
}

BOOL UMUserSessionSwitchToLoginWindow(uint64_t a1, void *a2)
{
  uint64_t v3 = sub_190C4D8F4();
  id v8 = 0;
  BOOL v4 = sub_190C58978(v3, &v8);
  id v5 = v8;

  if (a2)
  {
    if (!v4 && v5 != 0) {
      *a2 = v5;
    }
  }

  return v4;
}

uint64_t UMForegroundUserSessionID(void *a1)
{
  id v2 = sub_190C4D8F4();
  id v6 = 0;
  uint64_t v3 = sub_190C58CE4((uint64_t)v2, &v6);
  id v4 = v6;

  if (a1 && v4) {
    *a1 = v4;
  }

  return v3;
}

void *UMUserSessionLoadWithPasscode(void *a1, void *a2, void *a3)
{
  id v6 = sub_190C4D8F4();
  id v11 = 0;
  id v7 = sub_190C5907C((uint64_t)v6, a1, a2, &v11);
  id v8 = v11;

  if (v7)
  {
    id v9 = v7;
  }
  else if (a3 && v8)
  {
    *a3 = v8;
  }

  return v7;
}

uint64_t UMCurrentSyncBubbleSessionID(void *a1)
{
  id v2 = sub_190C4D8F4();
  id v6 = 0;
  uint64_t v3 = sub_190C59144(v2, &v6);
  id v4 = v6;

  if (a1 && v4) {
    *a1 = v4;
  }

  return v3;
}

void *UMUserSessionListSyncMachServices(void *a1, void *a2)
{
  id v4 = sub_190C4D8F4();
  id v9 = 0;
  id v5 = sub_190C59420(v4, a1, &v9);
  id v6 = v9;

  if (v5)
  {
    id v7 = v5;
  }
  else if (a2 && v6)
  {
    *a2 = v6;
  }
  if (a2 && v6) {
    *a2 = v6;
  }

  return v5;
}

BOOL UMUserSessionIsLoginSession(uint64_t a1, void *a2)
{
  uint64_t v3 = sub_190C4D8F4();
  id v7 = 0;
  BOOL v4 = sub_190C597C4(v3, &v7);
  id v5 = v7;

  if (v5) {
    *a2 = v5;
  }

  return v4;
}

void *UMUserSessionForegroundSession(uint64_t a1, void *a2)
{
  uint64_t v3 = sub_190C4D8F4();
  id v8 = 0;
  BOOL v4 = sub_190C58CF8(v3, &v8);
  id v5 = v8;

  if (v4)
  {
    id v6 = v4;
  }
  else if (a2 && v5)
  {
    *a2 = v5;
  }

  return v4;
}

void *UMUserSessionAttributes(void *a1, void *a2)
{
  BOOL v4 = sub_190C4D8F4();
  id v9 = 0;
  id v5 = sub_190C59A98(v4, a1, &v9);
  id v6 = v9;

  if (a2 && v6) {
    *a2 = v6;
  }
  if (v5) {
    id v7 = v5;
  }

  return v5;
}

BOOL UMUserSessionSwitchWithBlob(void *a1, void *a2, void *a3)
{
  id v6 = sub_190C4D8F4();
  id v10 = 0;
  BOOL v7 = sub_190C59E38(v6, a1, a2, &v10);
  id v8 = v10;

  if (a3 && !v7) {
    *a3 = v8;
  }

  return v7;
}

uint64_t UMUserSessionDataMigrationSetup(void *a1, void *a2, void *a3)
{
  id v6 = sub_190C4D8F4();
  id v11 = 0;
  uint64_t v7 = sub_190C5A1AC((uint64_t)v6, a1, a2, &v11);
  id v8 = v11;

  if (a3)
  {
    if (v7) {
      BOOL v9 = 1;
    }
    else {
      BOOL v9 = v8 == 0;
    }
    if (!v9) {
      *a3 = v8;
    }
  }

  return v7;
}

const void *sub_190C3DC70(const __CFDictionary *a1, const void *a2)
{
  CFMutableDictionaryRef result = CFDictionaryGetValue(a1, a2);
  if (result)
  {
    uint64_t v3 = result;
    CFTypeID v4 = CFGetTypeID(result);
    if (v4 == CFDataGetTypeID()) {
      return v3;
    }
    else {
      return 0;
    }
  }
  return result;
}

const void *sub_190C3DCAC(const __CFDictionary *a1, const void *a2)
{
  CFMutableDictionaryRef result = CFDictionaryGetValue(a1, a2);
  if (result)
  {
    uint64_t v3 = result;
    CFTypeID v4 = CFGetTypeID(result);
    if (v4 == CFArrayGetTypeID()) {
      return v3;
    }
    else {
      return 0;
    }
  }
  return result;
}

uint64_t sub_190C3DCE8(const __CFDictionary *a1, const void *a2)
{
  uint64_t v2 = 0xFFFFFFFFLL;
  unsigned int valuePtr = -1;
  CFNumberRef Value = (const __CFNumber *)CFDictionaryGetValue(a1, a2);
  if (Value)
  {
    CFNumberRef v4 = Value;
    CFTypeID v5 = CFGetTypeID(Value);
    if (v5 == CFNumberGetTypeID())
    {
      CFNumberGetValue(v4, kCFNumberIntType, &valuePtr);
      return valuePtr;
    }
    else
    {
      return 0xFFFFFFFFLL;
    }
  }
  return v2;
}

uint64_t sub_190C3DD54(const __CFDictionary *a1, const void *a2)
{
  uint64_t v2 = -1;
  uint64_t valuePtr = -1;
  CFNumberRef Value = (const __CFNumber *)CFDictionaryGetValue(a1, a2);
  if (Value)
  {
    CFNumberRef v4 = Value;
    CFTypeID v5 = CFGetTypeID(Value);
    if (v5 == CFNumberGetTypeID())
    {
      CFNumberGetValue(v4, kCFNumberLongLongType, &valuePtr);
      return valuePtr;
    }
    else
    {
      return -1;
    }
  }
  return v2;
}

uint64_t sub_190C3DDC0(const __CFDictionary *a1, const void *a2)
{
  uint64_t v2 = -1;
  uint64_t valuePtr = -1;
  CFNumberRef Value = (const __CFNumber *)CFDictionaryGetValue(a1, a2);
  if (Value)
  {
    CFNumberRef v4 = Value;
    CFTypeID v5 = CFGetTypeID(Value);
    if (v5 == CFNumberGetTypeID())
    {
      CFNumberGetValue(v4, kCFNumberSInt64Type, &valuePtr);
      return valuePtr;
    }
    else
    {
      return -1;
    }
  }
  return v2;
}

CFBooleanRef sub_190C3DE2C(const __CFDictionary *a1, const void *a2)
{
  CFBooleanRef result = (const __CFBoolean *)CFDictionaryGetValue(a1, a2);
  if (result)
  {
    CFBooleanRef v3 = result;
    CFTypeID v4 = CFGetTypeID(result);
    if (v4 == CFBooleanGetTypeID()) {
      return (const __CFBoolean *)(CFBooleanGetValue(v3) != 0);
    }
    else {
      return 0;
    }
  }
  return result;
}

const void *sub_190C3DE80(const __CFDictionary *a1, const void *a2)
{
  CFNumberRef Value = CFDictionaryGetValue(a1, a2);
  if (!Value) {
    return 0;
  }
  CFBooleanRef v3 = Value;
  CFTypeID v4 = CFGetTypeID(Value);
  if (v4 != CFStringGetTypeID()) {
    return 0;
  }
  return v3;
}

BOOL sub_190C3DEC4(const __CFDictionary *a1, const void *a2, char *a3, int a4)
{
  CFStringRef v6 = (const __CFString *)sub_190C3DE80(a1, a2);
  return v6 && CFStringGetCString(v6, a3, a4, 0x8000100u);
}

CFTypeRef sub_190C3DF14(const __CFDictionary *a1, const void *a2)
{
  CFNumberRef Value = CFDictionaryGetValue(a1, a2);
  if (!Value) {
    return 0;
  }
  CFBooleanRef v3 = Value;
  CFTypeID v4 = CFGetTypeID(Value);
  if (v4 != CFDictionaryGetTypeID()) {
    return 0;
  }
  return CFRetain(v3);
}

CFTypeRef sub_190C3DF74(const void *a1)
{
  uint64_t v2 = CFWriteStreamCreateWithAllocatedBuffers((CFAllocatorRef)*MEMORY[0x1E4F1CF80], (CFAllocatorRef)*MEMORY[0x1E4F1CF80]);
  if (!v2) {
    return 0;
  }
  CFBooleanRef v3 = v2;
  if (CFWriteStreamOpen(v2))
  {
    if (CFPropertyListWrite(a1, v3, kCFPropertyListBinaryFormat_v1_0, 0, 0) < 1) {
      CFTypeRef v4 = 0;
    }
    else {
      CFTypeRef v4 = CFWriteStreamCopyProperty(v3, (CFStreamPropertyKey)*MEMORY[0x1E4F1D440]);
    }
    CFWriteStreamClose(v3);
  }
  else
  {
    CFTypeRef v4 = 0;
  }
  CFRelease(v3);
  return v4;
}

CFPropertyListRef sub_190C3E01C(UInt8 *bytes, CFIndex length)
{
  CFPropertyListFormat format = kCFPropertyListBinaryFormat_v1_0;
  CFAllocatorRef v2 = (const __CFAllocator *)*MEMORY[0x1E4F1CF80];
  CFBooleanRef v3 = CFReadStreamCreateWithBytesNoCopy((CFAllocatorRef)*MEMORY[0x1E4F1CF80], bytes, length, (CFAllocatorRef)*MEMORY[0x1E4F1CFA0]);
  if (v3)
  {
    CFTypeRef v4 = v3;
    if (CFReadStreamOpen(v3))
    {
      CFPropertyListRef v5 = CFPropertyListCreateWithStream(v2, v4, 0, 2uLL, &format, 0);
      if (!v5) {
        syslog(7, "Could not create object from stream");
      }
      CFReadStreamClose(v4);
    }
    else
    {
      syslog(7, "Could not open the stream");
      CFPropertyListRef v5 = 0;
    }
    CFRelease(v4);
  }
  else
  {
    syslog(7, "Could not create stream for serialized data");
    return 0;
  }
  return v5;
}

const void *sub_190C3E0FC(UInt8 *bytes, CFIndex length)
{
  CFAllocatorRef v2 = 0;
  CFPropertyListFormat format = kCFPropertyListBinaryFormat_v1_0;
  if (bytes && length)
  {
    CFAllocatorRef v4 = (const __CFAllocator *)*MEMORY[0x1E4F1CF80];
    CFPropertyListRef v5 = CFReadStreamCreateWithBytesNoCopy((CFAllocatorRef)*MEMORY[0x1E4F1CF80], bytes, length, (CFAllocatorRef)*MEMORY[0x1E4F1CFA0]);
    if (!v5)
    {
      syslog(7, "Could not create stream from serialized data");
      return 0;
    }
    CFStringRef v6 = v5;
    if (CFReadStreamOpen(v5))
    {
      CFPropertyListRef v7 = CFPropertyListCreateWithStream(v4, v6, length, 2uLL, &format, 0);
      CFAllocatorRef v2 = v7;
      if (!v7)
      {
        syslog(7, "Could not create dictionary from stream");
        goto LABEL_9;
      }
      CFTypeID v8 = CFGetTypeID(v7);
      if (v8 == CFDictionaryGetTypeID())
      {
LABEL_9:
        CFReadStreamClose(v6);
        CFRelease(v6);
        return v2;
      }
      CFRelease(v2);
    }
    else
    {
      syslog(7, "Could not open the stream");
    }
    CFAllocatorRef v2 = 0;
    goto LABEL_9;
  }
  return v2;
}

const void *sub_190C3E214(const char *a1)
{
  memset(&v13, 0, sizeof(v13));
  int v2 = open(a1, 0);
  if (v2 == -1)
  {
    CFTypeID v8 = __error();
    BOOL v9 = strerror(*v8);
    syslog(7, "Could not open %s: %s", a1, v9);
    CFAllocatorRef v4 = 0;
    CFStringRef v6 = 0;
    goto LABEL_7;
  }
  int v3 = v2;
  if (fstat(v2, &v13))
  {
    id v10 = __error();
    id v11 = strerror(*v10);
    syslog(7, "Could not fstat %s: %s", a1, v11);
    CFStringRef v6 = 0;
    CFAllocatorRef v4 = 0;
    goto LABEL_6;
  }
  CFAllocatorRef v4 = malloc_type_malloc(LODWORD(v13.st_size), 0x772E5F62uLL);
  if (!v4)
  {
    syslog(7, "Could not allocate buffer");
LABEL_12:
    CFStringRef v6 = 0;
    goto LABEL_6;
  }
  ssize_t v5 = read(v3, v4, v13.st_size);
  if (v5 != v13.st_size)
  {
    id v12 = __error();
    strerror(*v12);
    syslog(7, "Could not read %s: %s");
    goto LABEL_12;
  }
  CFStringRef v6 = sub_190C3E0FC((UInt8 *)v4, v5);
LABEL_6:
  close(v3);
LABEL_7:
  free(v4);
  return v6;
}

CFMutableDictionaryRef sub_190C3E360(CFDictionaryRef theDict)
{
  CFMutableDictionaryRef result = CFDictionaryCreateMutableCopy((CFAllocatorRef)*MEMORY[0x1E4F1CF80], 0, theDict);
  if (!result)
  {
    syslog(7, "Out of Memory!!! Dying!...so...cold....");
    exit(-1);
  }
  return result;
}

CFMutableArrayRef sub_190C3E3A8()
{
  CFMutableArrayRef result = CFArrayCreateMutable((CFAllocatorRef)*MEMORY[0x1E4F1CF80], 0, MEMORY[0x1E4F1D510]);
  if (!result)
  {
    syslog(7, "Out of Memory!!! Dying!...so...cold....");
    exit(-1);
  }
  return result;
}

CFStringRef sub_190C3E3F4(char *cStr)
{
  CFStringRef result = CFStringCreateWithCString((CFAllocatorRef)*MEMORY[0x1E4F1CF80], cStr, 0x8000100u);
  if (!result)
  {
    syslog(7, "Out of Memory!!! Dying!...so...cold....");
    exit(-1);
  }
  return result;
}

uint64_t sub_190C3E440(mach_port_name_t name)
{
  mach_port_type_t ptype = 0;
  if (mach_port_type(*MEMORY[0x1E4F14960], name, &ptype)) {
    return 0;
  }
  else {
    return ptype;
  }
}

void sub_190C3E484(mach_port_name_t name)
{
  kern_return_t v2;
  mach_port_type_t v3;
  BOOL v4;
  mach_port_type_t ptype;

  mach_port_type_t ptype = 0;
  int v2 = mach_port_type(*MEMORY[0x1E4F14960], name, &ptype);
  int v3 = ptype;
  if (v2) {
    CFAllocatorRef v4 = 1;
  }
  else {
    CFAllocatorRef v4 = ptype == 0;
  }
  if (v4)
  {
    syslog(7, "Port:%d has NORIGHTS");
    return;
  }
  if ((ptype & 0x10000) != 0)
  {
    syslog(7, "Port:%d has SENDRIGHT", name);
    if ((v3 & 0x20000) == 0)
    {
LABEL_9:
      if ((v3 & 0x40000) == 0) {
        goto LABEL_10;
      }
LABEL_14:
      syslog(7, "Port:%d has SENDONCERIGHT", name);
      if ((v3 & 0x100000) == 0) {
        return;
      }
      goto LABEL_15;
    }
  }
  else if ((ptype & 0x20000) == 0)
  {
    goto LABEL_9;
  }
  syslog(7, "Port:%d has RECEIVERIGHT", name);
  if ((v3 & 0x40000) != 0) {
    goto LABEL_14;
  }
LABEL_10:
  if ((v3 & 0x100000) != 0) {
LABEL_15:
  }
    syslog(7, "Port:%d has DEADNAME");
}

uint64_t sub_190C3E560()
{
  uint64_t v3 = *MEMORY[0x1E4F143B8];
  size_t __len = 1023;
  bzero(__big, 0x400uLL);
  if (sysctlbyname("kern.bootargs", __big, &__len, 0, 0) || strnstr(__big, "um-migration-debug=0", __len)) {
    return 0;
  }
  if (strnstr(__big, "um-migration-debug=1", __len)) {
    return 1;
  }
  if (strnstr(__big, "um-migration-debug=2", __len)) {
    return 2;
  }
  if (strnstr(__big, "um-migration-debug=3", __len)) {
    return 3;
  }
  if (strnstr(__big, "um-migration-debug=4", __len)) {
    return 4;
  }
  if (strnstr(__big, "um-migration-debug=5", __len)) {
    return 5;
  }
  if (strnstr(__big, "um-migration-debug=100", __len)) {
    return 100;
  }
  if (strnstr(__big, "um-migration-debug=101", __len)) {
    return 101;
  }
  return 0;
}

void sub_190C3E6E4(uint64_t a1, void *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  id v9 = a2;
  self;
  id v10 = [NSString alloc];
  uint64_t v12 = objc_msgSend_initWithFormat_arguments_(v10, v11, (uint64_t)v9, &a9);
  stat v13 = sub_190C49EDC();
  sub_190C49FC4((uint64_t)v13, @"%@", v14, v15, v16, v17, v18, v19, v12);

  abort();
}

void sub_190C3E75C(uint64_t a1, void *a2, void *a3)
{
  id v14 = a2;
  id v4 = a3;
  uint64_t v7 = self;
  if (v14 && objc_msgSend_code(v14, v5, v6) == 1) {
    sub_190C3E6E4(v7, @"You do not have the correct entitlements for operation: %@", v8, v9, v10, v11, v12, v13, (uint64_t)v4);
  }
}

uint64_t sub_190C3E7E8()
{
  return 1;
}

void sub_190C3E7F0()
{
}

void sub_190C3EA8C(uint64_t a1, const char *a2, uint64_t a3)
{
  objc_msgSend_sharedManager(UMUserManager, a2, a3);
  id v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend_userListDidUpdate(v5, v3, v4);
}

uint64_t sub_190C3EAD4(uint64_t a1, uint64_t a2, void *a3, uint64_t a4, uint64_t a5, void *a6)
{
  id v10 = a3;
  self;
  uint64_t v31 = 0;
  uint64_t v32 = &v31;
  uint64_t v33 = 0x2020000000;
  char v34 = 0;
  uint64_t v25 = 0;
  long long v26 = &v25;
  uint64_t v27 = 0x3032000000;
  long long v28 = sub_190C39F5C;
  uint64_t v29 = sub_190C39F34;
  id v30 = 0;
  uint64_t v11 = [UMPersonaMachPort alloc];
  uint64_t v13 = objc_msgSend_initWithMachPort_options_(v11, v12, a2, 1);
  id v14 = sub_190C4D8F4();
  uint64_t v15 = sub_190C54624(v14);

  v24[0] = MEMORY[0x1E4F143A8];
  v24[1] = 3221225472;
  v24[2] = sub_190C3ED18;
  v24[3] = &unk_1E56C6100;
  v24[4] = &v25;
  uint64_t v17 = objc_msgSend_synchronousRemoteObjectProxyWithErrorHandler_(v15, v16, (uint64_t)v24);
  uint64_t v18 = getpid();
  v23[0] = MEMORY[0x1E4F143A8];
  v23[1] = 3221225472;
  v23[2] = sub_190C3EDB8;
  v23[3] = &unk_1E56C6128;
  v23[4] = &v25;
  v23[5] = &v31;
  v23[6] = a5;
  objc_msgSend_replacePersonaMachPortVoucher_withAccountID_generationSet_forPid_withReply_(v17, v19, (uint64_t)v13, v10, a4, v18, v23);

  if (a6)
  {
    id v20 = (void *)v26[5];
    if (v20) {
      *a6 = v20;
    }
  }
  uint64_t v21 = *((unsigned __int8 *)v32 + 24);

  _Block_object_dispose(&v25, 8);
  _Block_object_dispose(&v31, 8);

  return v21;
}

void sub_190C3ECF0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  va_start(va, a13);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v13 - 112), 8);
  _Unwind_Resume(a1);
}

void sub_190C3ED18(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = sub_190C3C3A4();
  uint64_t v11 = sub_190C3B80C((uint64_t)UMLogMessage, @"got error from remote proxy: %@", v5, v6, v7, v8, v9, v10, (uint64_t)v3);
  sub_190C3B464((uint64_t)v4, v11);

  uint64_t v12 = *(void *)(*(void *)(a1 + 32) + 8);
  uint64_t v13 = *(void **)(v12 + 40);
  *(void *)(v12 + 40) = v3;
}

void sub_190C3EDB8(uint64_t a1, void *a2, void *a3)
{
  id v25 = a2;
  id v7 = a3;
  if (v7)
  {
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40), a3);
    goto LABEL_8;
  }
  if (v25)
  {
    if (*(void *)(a1 + 48))
    {
      **(_DWORD **)(a1 + 48) = objc_msgSend_machPort(v25, v5, v6);
      *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 1;
      goto LABEL_8;
    }
  }
  else
  {
    uint64_t v8 = sub_190C3B928();
    uint64_t v15 = sub_190C3B80C((uint64_t)UMLogMessage, @"no targetPort received from replacePersonaPortVoucher", v9, v10, v11, v12, v13, v14, v24);
    sub_190C3B464((uint64_t)v8, v15);
  }
  uint64_t v16 = sub_190C3B928();
  __int16 v23 = sub_190C3B80C((uint64_t)UMLogMessage, @"INVALID CALLBACK from replacePersonaPortVoucher with null targetPortPtr", v17, v18, v19, v20, v21, v22, v24);
  sub_190C3B464((uint64_t)v16, v23);

LABEL_8:
}

id sub_190C3EEE8(void *a1, void *a2)
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  uint64_t v6 = v3;
  if (a1)
  {
    if (v3)
    {
      a1 = objc_msgSend_length(v3, v4, v5);
      if (!a1) {
        goto LABEL_8;
      }
      if (pipe(v25) != -1)
      {
        int v7 = v25[1];
        id v8 = v6;
        uint64_t v11 = (const void *)objc_msgSend_bytes(v8, v9, v10);
        write(v7, v11, (size_t)a1);
        close(v25[1]);
        id v12 = objc_alloc(MEMORY[0x1E4F28CB0]);
        a1 = objc_msgSend_initWithFileDescriptor_closeOnDealloc_(v12, v13, v25[0], 1);
        goto LABEL_8;
      }
      int v14 = *__error();
      uint64_t v15 = sub_190C3C3A4();
      uint64_t v16 = strerror(v14);
      __int16 v23 = sub_190C3B80C((uint64_t)UMLogMessage, @"failed to get fds(1) with error:%s", v17, v18, v19, v20, v21, v22, (uint64_t)v16);
      sub_190C3B464((uint64_t)v15, v23);
    }
    a1 = 0;
  }
LABEL_8:

  return a1;
}

uint64_t sub_190C3F034()
{
  uint64_t v0 = self;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = sub_190C3F0C8;
  block[3] = &unk_1E56C5FF8;
  block[4] = v0;
  if (qword_1E92A9860 != -1) {
    dispatch_once(&qword_1E92A9860, block);
  }
  return byte_1E92A9849;
}

uint64_t sub_190C3F0C8()
{
  uint64_t result = getuid();
  if (result < 0x1F6)
  {
    BOOL v3 = 0;
  }
  else
  {
    int v1 = result;
    uint64_t v2 = self;
    uint64_t result = sub_190C4599C(v2, 0);
    BOOL v3 = result != v1;
  }
  byte_1E92A9849 = v3;
  return result;
}

uint64_t sub_190C3F120()
{
  uint64_t v0 = self;
  return sub_190C4599C(v0, 0);
}

uint64_t sub_190C3F14C()
{
  if (qword_1E92A98F8 != -1) {
    dispatch_once(&qword_1E92A98F8, &unk_1EE091360);
  }
  return byte_1E92A98F0;
}

void sub_190C3F194()
{
  uint64_t v0 = (const void *)MGCopyAnswer();
  if (v0)
  {
    int v1 = v0;
    byte_1E92A98F0 = CFEqual(v0, @"Internal") != 0;
    CFRelease(v1);
  }
}

uint64_t sub_190C3F204()
{
  return byte_1E92A98E8;
}

uint64_t sub_190C3F224()
{
  uint64_t v0 = self;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = sub_190C3F2B8;
  block[3] = &unk_1E56C5FF8;
  block[4] = v0;
  if (qword_1E92A9900 != -1) {
    dispatch_once(&qword_1E92A9900, block);
  }
  return qword_1E92A8F48;
}

void sub_190C3F2B8(uint64_t a1)
{
  int v1 = sub_190C3F33C(*(void *)(a1 + 32), 502, 0);
  if (v1)
  {
    id v7 = v1;
    BOOL v3 = objc_msgSend_objectForKeyedSubscript_(v1, v2, kUMUserSessionTotalUsers);
    uint64_t v6 = v3;
    if (v3) {
      qword_1E92A8F48 = objc_msgSend_unsignedIntegerValue(v3, v4, v5);
    }

    int v1 = v7;
  }
}

id sub_190C3F33C(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v5 = self;
  uint64_t v6 = sub_190C444F0();
  id v8 = objc_msgSend_numberWithUnsignedInt_(MEMORY[0x1E4F28ED0], v7, a2);
  objc_msgSend_setObject_forKeyedSubscript_(v6, v9, (uint64_t)v8, kUMUserSessionIDKey);

  uint64_t v29 = 0;
  id v30 = &v29;
  uint64_t v31 = 0x3032000000;
  uint64_t v32 = sub_190C39F5C;
  uint64_t v33 = sub_190C39F34;
  id v34 = 0;
  uint64_t v23 = 0;
  uint64_t v24 = &v23;
  uint64_t v25 = 0x3032000000;
  uint64_t v26 = sub_190C39F5C;
  uint64_t v27 = sub_190C39F34;
  id v28 = 0;
  if (v6)
  {
    uint64_t v11 = sub_190C4D8F4();
    id v12 = sub_190C54624(v11);

    v22[0] = MEMORY[0x1E4F143A8];
    v22[1] = 3221225472;
    v22[2] = sub_190C45E10;
    v22[3] = &unk_1E56C6100;
    v22[4] = &v29;
    int v14 = objc_msgSend_synchronousRemoteObjectProxyWithErrorHandler_(v12, v13, (uint64_t)v22);
    v21[0] = MEMORY[0x1E4F143A8];
    v21[1] = 3221225472;
    v21[2] = sub_190C45EB0;
    v21[3] = &unk_1E56C6230;
    v21[4] = &v29;
    void v21[5] = &v23;
    objc_msgSend_getUserSessionAttributes_reply_(v14, v15, (uint64_t)v6, v21);

    uint64_t v16 = (void *)v24[5];
    if (!v16)
    {
      sub_190C44434(v5, (void *)v30[5], a3);
      uint64_t v16 = (void *)v24[5];
    }
    id v17 = v16;
  }
  else
  {
    uint64_t v18 = objc_msgSend_errorWithDomain_code_userInfo_(MEMORY[0x1E4F28C58], v10, *MEMORY[0x1E4F28798], 22, 0);
    uint64_t v19 = (void *)v30[5];
    v30[5] = v18;

    id v17 = 0;
    if (a3) {
      *a3 = (id) v30[5];
    }
  }
  _Block_object_dispose(&v23, 8);

  _Block_object_dispose(&v29, 8);
  return v17;
}

void sub_190C3F5E8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  va_start(va, a13);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v13 - 128), 8);
  _Unwind_Resume(a1);
}

uint64_t sub_190C3F610()
{
  uint64_t v0 = self;
  self;
  if (byte_1EB2197E8)
  {
    int v1 = sub_190C3F33C(v0, 502, 0);
    BOOL v3 = v1;
    if (v1)
    {
      uint64_t v4 = objc_msgSend_objectForKeyedSubscript_(v1, v2, kUMUserSessionEachUserSize);
      id v7 = v4;
      if (v4) {
        qword_1E92A9908 = objc_msgSend_unsignedLongLongValue(v4, v5, v6);
      }
    }
  }
  return qword_1E92A9908;
}

uint64_t sub_190C3F6A4()
{
  uint64_t v0 = self;
  self;
  if (byte_1EB2197E8)
  {
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = sub_190C3F754;
    block[3] = &unk_1E56C5FF8;
    block[4] = v0;
    if (qword_1E92A9918 != -1) {
      dispatch_once(&qword_1E92A9918, block);
    }
  }
  return dword_1E92A9910;
}

void sub_190C3F754(uint64_t a1)
{
  int v1 = sub_190C3F33C(*(void *)(a1 + 32), 502, 0);
  if (v1)
  {
    id v7 = v1;
    BOOL v3 = objc_msgSend_objectForKeyedSubscript_(v1, v2, kUMUserSessionPreviousLoggedinIDKey);
    uint64_t v6 = v3;
    if (v3) {
      dword_1E92A9910 = objc_msgSend_unsignedIntValue(v3, v4, v5);
    }

    int v1 = v7;
  }
}

id sub_190C3F7D8()
{
  self;
  uint64_t v0 = self;
  uint64_t v1 = sub_190C4599C(v0, 0);
  os_unfair_lock_lock((os_unfair_lock_t)&unk_1E92A98B0);
  if (!qword_1EB219780 || objc_msgSend_uid((void *)qword_1EB219780, v2, v3) != v1)
  {
    uint64_t v4 = sub_190C5C790((uint64_t)UMUser, v1);
    uint64_t v5 = (void *)qword_1EB219780;
    qword_1EB219780 = v4;
  }
  id v6 = (id)qword_1EB219780;
  os_unfair_lock_unlock((os_unfair_lock_t)&unk_1E92A98B0);
  return v6;
}

id sub_190C3F878()
{
  uint64_t v0 = self;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = sub_190C3F91C;
  block[3] = &unk_1E56C5FF8;
  block[4] = v0;
  if (qword_1E92A9928 != -1) {
    dispatch_once(&qword_1E92A9928, block);
  }
  uint64_t v1 = (void *)qword_1E92A9920;
  return v1;
}

void sub_190C3F91C()
{
  self;
  if (byte_1EB2197E8)
  {
    uint64_t v0 = sub_190C5C790((uint64_t)UMUser, 502);
  }
  else
  {
    uint64_t v0 = objc_opt_new();
    uint64_t v1 = getuid();
    objc_msgSend_setUid_(v0, v2, v1);
    uint64_t v3 = getgid();
    objc_msgSend_setGid_(v0, v4, v3);
    objc_msgSend_setGivenName_(v0, v5, @"login");
    objc_msgSend_setFamilyName_(v0, v6, @"login");
  }
  id v7 = (void *)qword_1E92A9920;
  qword_1E92A9920 = (uint64_t)v0;
}

void sub_190C3FC34(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  va_start(va, a13);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v13 - 112), 8);
  _Unwind_Resume(a1);
}

void sub_190C3FC5C(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = sub_190C3C3A4();
  uint64_t v11 = sub_190C3B80C((uint64_t)UMLogMessage, @"got error from remote proxy: %@", v5, v6, v7, v8, v9, v10, (uint64_t)v3);
  sub_190C3B464((uint64_t)v4, v11);

  uint64_t v12 = *(void *)(*(void *)(a1 + 32) + 8);
  uint64_t v13 = *(void **)(v12 + 40);
  *(void *)(v12 + 40) = v3;
}

void sub_190C3FCFC(uint64_t a1, void *a2, void *a3)
{
  id v15 = a2;
  id v6 = a3;
  if (v15) {
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40), a2);
  }
  if (v6)
  {
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), a3);
    uint64_t v7 = sub_190C3C3A4();
    int v14 = sub_190C3B80C((uint64_t)UMLogMessage, @"got error from remote userSessionLRUInfoWithReply: %@", v8, v9, v10, v11, v12, v13, (uint64_t)v6);
    sub_190C3B464((uint64_t)v7, v14);
  }
}

id sub_190C3FDD8(uint64_t a1, int a2)
{
  uint64_t v63 = *MEMORY[0x1E4F143B8];
  self;
  uint64_t v56 = 0;
  uint64_t v57 = &v56;
  uint64_t v58 = 0x3032000000;
  uint64_t v59 = sub_190C39F5C;
  uint64_t v60 = sub_190C39F34;
  id v61 = 0;
  uint64_t v50 = 0;
  uint64_t v51 = &v50;
  uint64_t v52 = 0x3032000000;
  v53 = sub_190C39F5C;
  uint64_t v54 = sub_190C39F34;
  id v55 = 0;
  id v3 = sub_190C4D8F4();
  uint64_t v4 = sub_190C54624(v3);

  v49[0] = MEMORY[0x1E4F143A8];
  v49[1] = 3221225472;
  v49[2] = sub_190C401C8;
  v49[3] = &unk_1E56C6100;
  v49[4] = &v56;
  id v6 = objc_msgSend_synchronousRemoteObjectProxyWithErrorHandler_(v4, v5, (uint64_t)v49);
  v48[0] = MEMORY[0x1E4F143A8];
  v48[1] = 3221225472;
  v48[2] = sub_190C40268;
  v48[3] = &unk_1E56C6150;
  v48[4] = &v50;
  v48[5] = &v56;
  objc_msgSend_listAllUserSessionIDsWithAReply_(v6, v7, (uint64_t)v48);

  int v14 = (void *)v51[5];
  if (v14)
  {
    id v17 = v14;
    if (a2)
    {
      uint64_t v18 = objc_msgSend_predicateWithBlock_(MEMORY[0x1E4F28F60], v15, (uint64_t)&unk_1EE0918A0);
      uint64_t v20 = objc_msgSend_filteredArrayUsingPredicate_(v17, v19, (uint64_t)v18);

      id v17 = (id)v20;
    }
    uint64_t v21 = (void *)MEMORY[0x1E4F1CA48];
    uint64_t v22 = objc_msgSend_count(v17, v15, v16);
    uint64_t v24 = objc_msgSend_arrayWithCapacity_(v21, v23, v22);
    long long v46 = 0u;
    long long v47 = 0u;
    long long v44 = 0u;
    long long v45 = 0u;
    id v25 = v17;
    uint64_t v29 = objc_msgSend_countByEnumeratingWithState_objects_count_(v25, v26, (uint64_t)&v44, v62, 16);
    if (v29)
    {
      uint64_t v30 = *(void *)v45;
      do
      {
        for (uint64_t i = 0; i != v29; ++i)
        {
          if (*(void *)v45 != v30) {
            objc_enumerationMutation(v25);
          }
          uint64_t v32 = objc_msgSend_intValue(*(void **)(*((void *)&v44 + 1) + 8 * i), v27, v28);
          uint64_t v33 = sub_190C5C790((uint64_t)UMUser, v32);
          objc_msgSend_addObject_(v24, v34, (uint64_t)v33);
        }
        uint64_t v29 = objc_msgSend_countByEnumeratingWithState_objects_count_(v25, v27, (uint64_t)&v44, v62, 16);
      }
      while (v29);
    }
    v35 = v25;
    goto LABEL_14;
  }
  if (v57[5])
  {
    v35 = sub_190C3B80C((uint64_t)UMLogMessage, @"Could not get user UIDs", v8, v9, v10, v11, v12, v13, v43);
    sub_190C4CE30((uint64_t)v35, @"error: %@", v36, v37, v38, v39, v40, v41, v57[5]);
    sub_190C3C3A4();
    id v25 = (id)objc_claimAutoreleasedReturnValue();
    sub_190C3B464((uint64_t)v25, v35);
    uint64_t v24 = (void *)MEMORY[0x1E4F1CBF0];
LABEL_14:

    goto LABEL_15;
  }
  uint64_t v24 = (void *)MEMORY[0x1E4F1CBF0];
LABEL_15:

  _Block_object_dispose(&v50, 8);
  _Block_object_dispose(&v56, 8);

  return v24;
}

void sub_190C40184(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,char a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,char a36)
{
}

void sub_190C401C8(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = sub_190C3C3A4();
  uint64_t v11 = sub_190C3B80C((uint64_t)UMLogMessage, @"got error from remote proxy: %@", v5, v6, v7, v8, v9, v10, (uint64_t)v3);
  sub_190C3B464((uint64_t)v4, v11);

  uint64_t v12 = *(void *)(*(void *)(a1 + 32) + 8);
  uint64_t v13 = *(void **)(v12 + 40);
  *(void *)(v12 + 40) = v3;
}

void sub_190C40268(uint64_t a1, void *a2, void *a3)
{
  id v15 = a2;
  id v6 = a3;
  if (v15) {
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40), a2);
  }
  if (v6)
  {
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), a3);
    uint64_t v7 = sub_190C3C3A4();
    int v14 = sub_190C3B80C((uint64_t)UMLogMessage, @"got error from remote listAllUserSessionIDsWithAReply: %@", v8, v9, v10, v11, v12, v13, (uint64_t)v6);
    sub_190C3B464((uint64_t)v7, v14);
  }
}

BOOL sub_190C40344(uint64_t a1, void *a2, uint64_t a3)
{
  return objc_msgSend_unsignedIntValue(a2, (const char *)a2, a3) != 502;
}

void sub_190C40368()
{
  if (qword_1E92A98C0 != -1) {
    dispatch_once(&qword_1E92A98C0, &unk_1EE0915A0);
  }
  id v0 = (id)qword_1E92A9888;
  sub_190C4A1D0();
  id v3 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v1 = sub_190C3C7B4((uint64_t)UMGenerationCache, @"persona", @"com.apple.mobile.usermanagerd.personageneration_changed", v0, v3, &unk_1EE091900);
  uint64_t v2 = (void *)qword_1E92A9878;
  qword_1E92A9878 = v1;
}

uint64_t sub_190C4042C(uint64_t a1, void *a2)
{
  id v3 = sub_190C4D8F4();
  uint64_t v4 = sub_190C54F44(v3, a2);

  return v4;
}

id sub_190C40474()
{
  self;
  self;
  if (byte_1EB2197E8)
  {
    uint64_t v38 = 0;
    uint64_t v39 = &v38;
    uint64_t v40 = 0x3032000000;
    uint64_t v41 = sub_190C39F5C;
    uint64_t v42 = sub_190C39F34;
    id v43 = 0;
    uint64_t v32 = 0;
    uint64_t v33 = &v32;
    uint64_t v34 = 0x3032000000;
    v35 = sub_190C39F5C;
    uint64_t v36 = sub_190C39F34;
    id v37 = 0;
    id v0 = sub_190C4D8F4();
    uint64_t v1 = sub_190C54624(v0);

    v31[0] = MEMORY[0x1E4F143A8];
    v31[1] = 3221225472;
    v31[2] = sub_190C40734;
    v31[3] = &unk_1E56C6100;
    v31[4] = &v32;
    id v3 = objc_msgSend_synchronousRemoteObjectProxyWithErrorHandler_(v1, v2, (uint64_t)v31);
    v30[0] = MEMORY[0x1E4F143A8];
    v30[1] = 3221225472;
    v30[2] = sub_190C407D4;
    v30[3] = &unk_1E56C61B8;
    v30[4] = &v32;
    v30[5] = &v38;
    objc_msgSend_retrieveUserSessionBlobwithReply_(v3, v4, (uint64_t)v30);

    uint64_t v5 = (void *)v39[5];
    if (v5)
    {
      id v6 = sub_190C5B640((uint64_t)UMUserSwitchContext, v5);
    }
    else
    {
      uint64_t v7 = (void *)v33[5];
      if (v7)
      {
        sub_190C3E75C((uint64_t)UMAbort, v7, @"get user switch context");
        int v14 = sub_190C3B80C((uint64_t)UMLogMessage, @"Error retrieving context", v8, v9, v10, v11, v12, v13, v29);
        sub_190C4CE30((uint64_t)v14, @"error: %@", v15, v16, v17, v18, v19, v20, v33[5]);
        uint64_t v21 = sub_190C3C3A4();
        sub_190C3B464((uint64_t)v21, v14);
      }
      else
      {
        int v14 = sub_190C3C3A4();
        sub_190C49FC4((uint64_t)v14, @"Could not retrieve context, but we have no error", v22, v23, v24, v25, v26, v27, v29);
      }

      id v6 = 0;
    }

    _Block_object_dispose(&v32, 8);
    _Block_object_dispose(&v38, 8);
  }
  else
  {
    id v6 = 0;
  }
  return v6;
}

void sub_190C4070C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  va_start(va, a13);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v13 - 96), 8);
  _Unwind_Resume(a1);
}

void sub_190C40734(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = sub_190C3C3A4();
  uint64_t v11 = sub_190C3B80C((uint64_t)UMLogMessage, @"got error from remote proxy: %@", v5, v6, v7, v8, v9, v10, (uint64_t)v3);
  sub_190C3B464((uint64_t)v4, v11);

  uint64_t v12 = *(void *)(*(void *)(a1 + 32) + 8);
  uint64_t v13 = *(void **)(v12 + 40);
  *(void *)(v12 + 40) = v3;
}

void sub_190C407D4(uint64_t a1, void *a2, void *a3)
{
  id v16 = a2;
  id v5 = a3;
  if (v5)
  {
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40), a3);
    uint64_t v6 = sub_190C3C3A4();
    uint64_t v13 = sub_190C3B80C((uint64_t)UMLogMessage, @"got error from remote retrieveUserSessionBlobwithReply: %@", v7, v8, v9, v10, v11, v12, (uint64_t)v5);
    sub_190C3B464((uint64_t)v6, v13);
  }
  else
  {
    uint64_t v14 = *(void *)(*(void *)(a1 + 40) + 8);
    id v15 = v16;
    uint64_t v6 = *(void **)(v14 + 40);
    *(void *)(v14 + 40) = v15;
  }
}

void sub_190C408AC()
{
  self;
  self;
  if (byte_1EB2197E8)
  {
    uint64_t v27 = 0;
    uint64_t v28 = &v27;
    uint64_t v29 = 0x3032000000;
    uint64_t v30 = sub_190C39F5C;
    uint64_t v31 = sub_190C39F34;
    id v32 = 0;
    uint64_t v23 = 0;
    uint64_t v24 = &v23;
    uint64_t v25 = 0x2020000000;
    char v26 = 0;
    id v0 = sub_190C4D8F4();
    uint64_t v1 = sub_190C54624(v0);

    v22[0] = MEMORY[0x1E4F143A8];
    v22[1] = 3221225472;
    v22[2] = sub_190C40AEC;
    v22[3] = &unk_1E56C6100;
    v22[4] = &v27;
    id v3 = objc_msgSend_synchronousRemoteObjectProxyWithErrorHandler_(v1, v2, (uint64_t)v22);
    v21[0] = MEMORY[0x1E4F143A8];
    v21[1] = 3221225472;
    v21[2] = sub_190C40B8C;
    v21[3] = &unk_1E56C61E0;
    v21[4] = &v27;
    void v21[5] = &v23;
    objc_msgSend_deleteUserSessionBlobwithReply_(v3, v4, (uint64_t)v21);

    if (!*((unsigned char *)v24 + 24))
    {
      id v5 = (void *)v28[5];
      if (v5)
      {
        sub_190C3E75C((uint64_t)UMAbort, v5, @"delete user switch context");
        uint64_t v12 = sub_190C3B80C((uint64_t)UMLogMessage, @"Error deleting context", v6, v7, v8, v9, v10, v11, v20);
        sub_190C4CE30((uint64_t)v12, @"error: %@", v13, v14, v15, v16, v17, v18, v28[5]);
        uint64_t v19 = sub_190C3C3A4();
        sub_190C3B464((uint64_t)v19, v12);
      }
    }

    _Block_object_dispose(&v23, 8);
    _Block_object_dispose(&v27, 8);
  }
}

void sub_190C40AC4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  va_start(va, a13);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v13 - 96), 8);
  _Unwind_Resume(a1);
}

void sub_190C40AEC(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = sub_190C3C3A4();
  uint64_t v11 = sub_190C3B80C((uint64_t)UMLogMessage, @"got error from remote proxy: %@", v5, v6, v7, v8, v9, v10, (uint64_t)v3);
  sub_190C3B464((uint64_t)v4, v11);

  uint64_t v12 = *(void *)(*(void *)(a1 + 32) + 8);
  uint64_t v13 = *(void **)(v12 + 40);
  *(void *)(v12 + 40) = v3;
}

void sub_190C40B8C(uint64_t a1, void *a2)
{
  id v4 = a2;
  if (v4)
  {
    uint64_t v13 = (uint64_t)v4;
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40), a2);
    uint64_t v5 = sub_190C3C3A4();
    uint64_t v12 = sub_190C3B80C((uint64_t)UMLogMessage, @"got error from remote deleteUserSessionBlobwithReply: %@", v6, v7, v8, v9, v10, v11, v13);
    sub_190C3B464((uint64_t)v5, v12);

    id v4 = (id)v13;
  }
  else
  {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 1;
  }
}

id sub_190C40C4C(uint64_t a1, void *a2, void *a3)
{
  v53[1] = *MEMORY[0x1E4F143B8];
  id v4 = a2;
  id v5 = a3;
  uint64_t v6 = self;
  self;
  if (!byte_1EB2197E8)
  {
    sub_190C410F8(v6, v4, v5);
    uint64_t v11 = sub_190C411F8(v6, v4);
    id v44 = 0;
    uint64_t v13 = sub_190C41930(v6, v11, v5, &v44);
    id v14 = v44;
    uint64_t v15 = v14;
    uint64_t v12 = 0;
    if (v13 || !v14) {
      goto LABEL_21;
    }
    sub_190C3E75C((uint64_t)UMAbort, v14, @"load user");
    uint64_t v18 = objc_msgSend_code(v15, v16, v17);
    uint64_t v48 = *MEMORY[0x1E4F28A50];
    uint64_t v49 = v15;
    uint64_t v20 = objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x1E4F1C9E8], v19, (uint64_t)&v49, &v48, 1);
    uint64_t v23 = objc_msgSend_mutableCopy(v20, v21, v22);

    if (v18 == -15) {
      goto LABEL_16;
    }
    if (v18 != 73)
    {
      if (v18 != -14) {
        goto LABEL_19;
      }
      goto LABEL_18;
    }
LABEL_17:
    unint64_t v36 = 9;
    goto LABEL_20;
  }
  if (sub_190C41038(v6, v4) > 0.0)
  {
    uint64_t v50 = @"UMErrorPasscodeBackOffInterval";
    uint64_t v9 = objc_msgSend_numberWithDouble_(MEMORY[0x1E4F28ED0], v7, v8);
    uint64_t v51 = v9;
    uint64_t v11 = objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x1E4F1C9E8], v10, (uint64_t)&v51, &v50, 1);

    uint64_t v12 = sub_190C3D05C((uint64_t)UMError, 6uLL, v11);
    goto LABEL_22;
  }
  sub_190C410F8(v6, v4, v5);
  uint64_t v11 = sub_190C411F8(v6, v4);
  id v47 = 0;
  uint64_t v13 = sub_190C41930(v6, v11, v5, &v47);
  id v24 = v47;
  uint64_t v15 = v24;
  uint64_t v12 = 0;
  if (!v13 && v24)
  {
    sub_190C3E75C((uint64_t)UMAbort, v24, @"load user");
    uint64_t v27 = objc_msgSend_code(v15, v25, v26);
    uint64_t v52 = *MEMORY[0x1E4F28A50];
    v53[0] = v15;
    uint64_t v29 = objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x1E4F1C9E8], v28, (uint64_t)v53, &v52, 1);
    uint64_t v23 = objc_msgSend_mutableCopy(v29, v30, v31);

    if (v27 != 73)
    {
      if (v27 != -14)
      {
        if (v27 == -15)
        {
          uint64_t v34 = objc_msgSend_sharedManager(UMUserManager, v32, v33);
          v45[0] = MEMORY[0x1E4F143A8];
          v45[1] = 3221225472;
          v45[2] = sub_190C41BCC;
          v45[3] = &unk_1E56C6208;
          id v46 = v4;
          objc_msgSend_disableUser_completionHandler_(v34, v35, (uint64_t)v46, v45);

LABEL_16:
          unint64_t v36 = 4;
LABEL_20:
          uint64_t v12 = sub_190C3D05C((uint64_t)UMError, v36, v23);

          goto LABEL_21;
        }
LABEL_19:
        unint64_t v36 = 3;
        goto LABEL_20;
      }
LABEL_18:
      id v37 = (void *)MEMORY[0x1E4F28ED0];
      double v38 = sub_190C41038(v6, v4);
      uint64_t v41 = objc_msgSend_numberWithDouble_(v37, v39, v40, v38);
      objc_msgSend_setObject_forKeyedSubscript_(v23, v42, (uint64_t)v41, @"UMErrorPasscodeBackOffInterval");

      unint64_t v36 = 6;
      goto LABEL_20;
    }
    goto LABEL_17;
  }
LABEL_21:

LABEL_22:
  return v12;
}

double sub_190C41038(uint64_t a1, void *a2)
{
  id v2 = a2;
  uint64_t v3 = self;
  uint64_t v6 = objc_msgSend_sharedManager(UMUserManager, v4, v5);
  int v8 = objc_msgSend_userExists_(v6, v7, (uint64_t)v2);

  double v9 = -1.0;
  if (v8)
  {
    uint64_t v10 = sub_190C4390C(v3, v2);
    UserLockStateInfo = (void *)MKBUserSessionGetUserLockStateInfo();
    uint64_t v13 = objc_msgSend_objectForKeyedSubscript_(UserLockStateInfo, v12, *MEMORY[0x1E4F78118]);
    objc_msgSend_doubleValue(v13, v14, v15);
    double v9 = v16;
  }
  return v9;
}

void sub_190C410F8(uint64_t a1, void *a2, void *a3)
{
  id v21 = a2;
  id v4 = a3;
  self;
  if (v4)
  {
    id v5 = [NSString alloc];
    uint64_t v7 = objc_msgSend_initWithData_encoding_(v5, v6, (uint64_t)v4, 4);
    uint64_t v10 = objc_msgSend_decimalDigitCharacterSet(MEMORY[0x1E4F28B88], v8, v9);
    uint64_t v12 = objc_msgSend_stringByTrimmingCharactersInSet_(v7, v11, (uint64_t)v10);
    uint64_t v15 = objc_msgSend_length(v12, v13, v14);

    if (!v15)
    {
      if (objc_msgSend_length(v7, v16, v17) == 4)
      {
        objc_msgSend_setPasscodeType_(v21, v18, 0);
      }
      else if (objc_msgSend_length(v7, v18, v19) == 6)
      {
        objc_msgSend_setPasscodeType_(v21, v20, 1);
      }
    }
  }
}

id sub_190C411F8(uint64_t a1, void *a2)
{
  id v2 = a2;
  self;
  uint64_t v3 = sub_190C444F0();
  uint64_t v6 = objc_msgSend_alternateDSID(v2, v4, v5);

  if (v6)
  {
    uint64_t v9 = objc_msgSend_alternateDSID(v2, v7, v8);
    objc_msgSend_setObject_forKeyedSubscript_(v3, v10, (uint64_t)v9, kUMUserSessionAlternateDSIDKey);
  }
  uint64_t v11 = objc_msgSend_username(v2, v7, v8);

  if (v11)
  {
    uint64_t v14 = objc_msgSend_username(v2, v12, v13);
    objc_msgSend_setObject_forKeyedSubscript_(v3, v15, (uint64_t)v14, kUMUserSessionNameKey);
  }
  double v16 = objc_msgSend_givenName(v2, v12, v13);

  if (v16)
  {
    uint64_t v19 = objc_msgSend_givenName(v2, v17, v18);
    objc_msgSend_setObject_forKeyedSubscript_(v3, v20, (uint64_t)v19, kUMUserSessionFirstNameKey);
  }
  id v21 = objc_msgSend_familyName(v2, v17, v18);

  if (v21)
  {
    id v24 = objc_msgSend_familyName(v2, v22, v23);
    objc_msgSend_setObject_forKeyedSubscript_(v3, v25, (uint64_t)v24, kUMUserSessionLastNameKey);
  }
  uint64_t v26 = objc_msgSend_displayName(v2, v22, v23);

  if (v26)
  {
    uint64_t v29 = objc_msgSend_displayName(v2, v27, v28);
    objc_msgSend_setObject_forKeyedSubscript_(v3, v30, (uint64_t)v29, kUMUserSessionDisplayNameKey);
  }
  uint64_t v31 = objc_msgSend_photoURL(v2, v27, v28);

  if (v31)
  {
    uint64_t v34 = objc_msgSend_photoURL(v2, v32, v33);
    id v37 = objc_msgSend_absoluteString(v34, v35, v36);
    objc_msgSend_setObject_forKeyedSubscript_(v3, v38, (uint64_t)v37, kUMUserSessionFileInfoKey);
  }
  uint64_t v39 = objc_msgSend_userAuxiliaryString(v2, v32, v33);

  if (v39)
  {
    uint64_t v42 = objc_msgSend_userAuxiliaryString(v2, v40, v41);
    objc_msgSend_setObject_forKeyedSubscript_(v3, v43, (uint64_t)v42, kUMUserSessionLanguageKey);
  }
  id v44 = objc_msgSend_lastRemoteAuthDate(v2, v40, v41);

  if (v44)
  {
    id v47 = objc_msgSend_lastRemoteAuthDate(v2, v45, v46);
    objc_msgSend_setObject_forKeyedSubscript_(v3, v48, (uint64_t)v47, kUMUserSessionCloudLoginTimeStampKey);
  }
  uint64_t v49 = (void *)MEMORY[0x1E4F28ED0];
  uint64_t isAuditor = objc_msgSend_isAuditor(v2, v45, v46);
  uint64_t v52 = objc_msgSend_numberWithBool_(v49, v51, isAuditor);
  objc_msgSend_setObject_forKeyedSubscript_(v3, v53, (uint64_t)v52, kUMUserSessionAuditorKey);

  uint64_t v54 = (void *)MEMORY[0x1E4F28ED0];
  uint64_t isDisabled = objc_msgSend_isDisabled(v2, v55, v56);
  uint64_t v59 = objc_msgSend_numberWithBool_(v54, v58, isDisabled);
  objc_msgSend_setObject_forKeyedSubscript_(v3, v60, (uint64_t)v59, kUMUserSessionDisabledKey);

  id v61 = (void *)MEMORY[0x1E4F28ED0];
  uint64_t isTransientUser = objc_msgSend_isTransientUser(v2, v62, v63);
  v66 = objc_msgSend_numberWithBool_(v61, v65, isTransientUser);
  objc_msgSend_setObject_forKeyedSubscript_(v3, v67, (uint64_t)v66, kUMUserSessionisTransientKey);

  uint64_t v68 = (void *)MEMORY[0x1E4F28ED0];
  uint64_t isPrimaryUser = objc_msgSend_isPrimaryUser(v2, v69, v70);
  v73 = objc_msgSend_numberWithBool_(v68, v72, isPrimaryUser);
  objc_msgSend_setObject_forKeyedSubscript_(v3, v74, (uint64_t)v73, kUMUserSessionisPrimaryKey);

  uint64_t v75 = (void *)MEMORY[0x1E4F28ED0];
  uint64_t isAdminUser = objc_msgSend_isAdminUser(v2, v76, v77);
  v80 = objc_msgSend_numberWithBool_(v75, v79, isAdminUser);
  objc_msgSend_setObject_forKeyedSubscript_(v3, v81, (uint64_t)v80, kUMUserSessionisAdminKey);

  v82 = (void *)MEMORY[0x1E4F28ED0];
  uint64_t v85 = objc_msgSend_passcodeLockGracePeriod(v2, v83, v84);
  uint64_t v87 = objc_msgSend_numberWithUnsignedInteger_(v82, v86, v85);
  objc_msgSend_setObject_forKeyedSubscript_(v3, v88, (uint64_t)v87, kUMUserSessionRequiresPasscodeKey);

  v89 = objc_opt_new();
  v90 = (void *)MEMORY[0x1E4F28ED0];
  uint64_t v93 = objc_msgSend_passcodeType(v2, v91, v92);
  uint64_t v95 = objc_msgSend_numberWithUnsignedInteger_(v90, v94, v93);
  objc_msgSend_setObject_forKeyedSubscript_(v89, v96, (uint64_t)v95, @"passcodeType");

  v99 = objc_msgSend_languages(v2, v97, v98);
  objc_msgSend_setObject_forKeyedSubscript_(v89, v100, (uint64_t)v99, @"languages");

  uint64_t v101 = (void *)MEMORY[0x1E4F28ED0];
  uint64_t hasManagedCredentials = objc_msgSend_hasManagedCredentials(v2, v102, v103);
  uint64_t v106 = objc_msgSend_numberWithBool_(v101, v105, hasManagedCredentials);
  objc_msgSend_setObject_forKeyedSubscript_(v89, v107, (uint64_t)v106, @"hasManagedCredentials");

  uint64_t v110 = objc_msgSend_errorCausingLogout(v2, v108, v109);

  if (v110)
  {
    uint64_t v113 = (void *)MEMORY[0x1E4F28DB0];
    uint64_t v114 = objc_msgSend_errorCausingLogout(v2, v111, v112);
    id v169 = 0;
    v116 = objc_msgSend_archivedDataWithRootObject_requiringSecureCoding_error_(v113, v115, (uint64_t)v114, 1, &v169);
    id v117 = v169;

    objc_msgSend_setObject_forKeyedSubscript_(v89, v118, (uint64_t)v116, @"errorCausingLogout");
    v125 = sub_190C3C3A4();
    if (v116)
    {
      v126 = @"Successful archive of logout error\n";
    }
    else
    {
      uint64_t v166 = (uint64_t)v117;
      v126 = @"Failed to archive the logout error with an error:%@ \n";
    }
    v127 = sub_190C3B80C((uint64_t)UMLogMessage, v126, v119, v120, v121, v122, v123, v124, v166);
    sub_190C3B464((uint64_t)v125, v127);
  }
  else
  {
    id v117 = 0;
  }
  v128 = objc_msgSend_debugErrorCausingLogout(v2, v111, v112);

  if (v128)
  {
    v131 = (void *)MEMORY[0x1E4F28DB0];
    v132 = objc_msgSend_debugErrorCausingLogout(v2, v129, v130);
    id v168 = v117;
    v134 = objc_msgSend_archivedDataWithRootObject_requiringSecureCoding_error_(v131, v133, (uint64_t)v132, 1, &v168);
    id v135 = v168;

    objc_msgSend_setObject_forKeyedSubscript_(v89, v136, (uint64_t)v134, @"debugErrorCausingLogout");
    v143 = sub_190C3C3A4();
    if (v134)
    {
      v144 = @"Successful archive of debug logout error\n";
    }
    else
    {
      uint64_t v166 = (uint64_t)v135;
      v144 = @"Failed to archive the debug logout error with an error:%@ \n";
    }
    v145 = sub_190C3B80C((uint64_t)UMLogMessage, v144, v137, v138, v139, v140, v141, v142, v166);
    sub_190C3B464((uint64_t)v143, v145);
  }
  else
  {
    id v135 = v117;
  }
  id v167 = 0;
  v146 = objc_msgSend_dataWithPropertyList_format_options_error_(MEMORY[0x1E4F28F98], v129, (uint64_t)v89, 200, 0, &v167);
  if (v146)
  {
    uint64_t v147 = kUMUserSessionOpaqueDataKey;
    id v148 = v167;
    objc_msgSend_setObject_forKeyedSubscript_(v3, v149, (uint64_t)v146, v147);
  }
  else
  {
    id v150 = v167;
    sub_190C3B80C((uint64_t)UMLogMessage, @"Could not save user's opaque data", v151, v152, v153, v154, v155, v156, v166);
    id v148 = (id)objc_claimAutoreleasedReturnValue();
    sub_190C4CE30((uint64_t)v148, @"error: %@", v157, v158, v159, v160, v161, v162, (uint64_t)v150);

    v163 = sub_190C3C3A4();
    sub_190C3B464((uint64_t)v163, v148);
  }
  id v164 = v3;

  return v164;
}

id sub_190C41930(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v6 = a2;
  id v7 = a3;
  uint64_t v8 = self;
  uint64_t v32 = 0;
  uint64_t v33 = &v32;
  uint64_t v34 = 0x3032000000;
  v35 = sub_190C39F5C;
  uint64_t v36 = sub_190C39F34;
  id v37 = 0;
  uint64_t v26 = 0;
  uint64_t v27 = &v26;
  uint64_t v28 = 0x3032000000;
  uint64_t v29 = sub_190C39F5C;
  uint64_t v30 = sub_190C39F34;
  id v31 = 0;
  if (v7 && (uint64_t v11 = v8, objc_msgSend_length(v7, v9, v10)))
  {
    uint64_t v12 = sub_190C41C74(v11, v7);
    uint64_t v15 = objc_msgSend_length(v7, v13, v14);
  }
  else
  {
    uint64_t v12 = 0;
    uint64_t v15 = 0;
  }
  double v16 = sub_190C4D8F4();
  uint64_t v17 = sub_190C54624(v16);

  v25[0] = MEMORY[0x1E4F143A8];
  v25[1] = 3221225472;
  int v25[2] = sub_190C41DA4;
  v25[3] = &unk_1E56C6100;
  v25[4] = &v26;
  uint64_t v19 = objc_msgSend_synchronousRemoteObjectProxyWithErrorHandler_(v17, v18, (uint64_t)v25);
  v24[0] = MEMORY[0x1E4F143A8];
  v24[1] = 3221225472;
  v24[2] = sub_190C41E44;
  v24[3] = &unk_1E56C6230;
  v24[4] = &v32;
  void v24[5] = &v26;
  objc_msgSend_loadUserSession_withSecret_oldSize_reply_(v19, v20, (uint64_t)v6, v12, v15, v24);

  if (a4)
  {
    id v21 = (void *)v27[5];
    if (v21) {
      *a4 = v21;
    }
  }
  id v22 = (id)v33[5];

  _Block_object_dispose(&v26, 8);
  _Block_object_dispose(&v32, 8);

  return v22;
}

void sub_190C41BA4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,char a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,char a27)
{
}

void sub_190C41BCC(uint64_t a1, void *a2)
{
  if (a2)
  {
    id v2 = *(void **)(a1 + 32);
    id v3 = a2;
    sub_190C4CFC8((uint64_t)UMLogMessage, v2, @"Could not disable user", v4, v5, v6, v7, v8, v16);
    id v17 = (id)objc_claimAutoreleasedReturnValue();
    sub_190C4CE30((uint64_t)v17, @"error: %@", v9, v10, v11, v12, v13, v14, (uint64_t)v3);

    uint64_t v15 = sub_190C3C3A4();
    sub_190C3B464((uint64_t)v15, v17);
  }
}

id sub_190C41C74(uint64_t a1, void *a2)
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v2 = a2;
  self;
  if (v2)
  {
    uint64_t v5 = objc_msgSend_length(v2, v3, v4);
    if (!v5) {
      goto LABEL_7;
    }
    if (pipe(v23) != -1)
    {
      int v6 = v23[1];
      id v7 = v2;
      uint64_t v10 = (const void *)objc_msgSend_bytes(v7, v8, v9);
      write(v6, v10, (size_t)v5);
      close(v23[1]);
      id v11 = objc_alloc(MEMORY[0x1E4F28CB0]);
      uint64_t v5 = objc_msgSend_initWithFileDescriptor_closeOnDealloc_(v11, v12, v23[0], 1);
      goto LABEL_7;
    }
    int v13 = *__error();
    uint64_t v14 = sub_190C3C3A4();
    uint64_t v15 = strerror(v13);
    sub_190C4A024((uint64_t)v14, @"failed to get fds(1) with error:%s", v16, v17, v18, v19, v20, v21, (uint64_t)v15);
  }
  uint64_t v5 = 0;
LABEL_7:

  return v5;
}

void sub_190C41DA4(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = sub_190C3C3A4();
  id v11 = sub_190C3B80C((uint64_t)UMLogMessage, @"got error from remote proxy: %@", v5, v6, v7, v8, v9, v10, (uint64_t)v3);
  sub_190C3B464((uint64_t)v4, v11);

  uint64_t v12 = *(void *)(*(void *)(a1 + 32) + 8);
  int v13 = *(void **)(v12 + 40);
  *(void *)(v12 + 40) = v3;
}

void sub_190C41E44(uint64_t a1, void *a2, void *a3)
{
  id v7 = a2;
  id v6 = a3;
  if (v7) {
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40), a2);
  }
  if (v6) {
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), a3);
  }
}

uint64_t sub_190C41ED8(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v6 = a2;
  id v7 = a3;
  uint64_t v8 = self;
  uint64_t v30 = 0;
  id v31 = &v30;
  uint64_t v32 = 0x3032000000;
  uint64_t v33 = sub_190C39F5C;
  uint64_t v34 = sub_190C39F34;
  id v35 = 0;
  uint64_t v26 = 0;
  uint64_t v27 = &v26;
  uint64_t v28 = 0x2020000000;
  char v29 = 0;
  if (v7 && (uint64_t v11 = v8, objc_msgSend_length(v7, v9, v10)))
  {
    uint64_t v12 = sub_190C41C74(v11, v7);
    uint64_t v15 = objc_msgSend_length(v7, v13, v14);
  }
  else
  {
    uint64_t v12 = 0;
    uint64_t v15 = 0;
  }
  uint64_t v16 = sub_190C4D8F4();
  uint64_t v17 = sub_190C54624(v16);

  v25[0] = MEMORY[0x1E4F143A8];
  v25[1] = 3221225472;
  int v25[2] = sub_190C42138;
  v25[3] = &unk_1E56C6100;
  v25[4] = &v30;
  uint64_t v19 = objc_msgSend_synchronousRemoteObjectProxyWithErrorHandler_(v17, v18, (uint64_t)v25);
  v24[0] = MEMORY[0x1E4F143A8];
  v24[1] = 3221225472;
  v24[2] = sub_190C421D8;
  v24[3] = &unk_1E56C61E0;
  v24[4] = &v30;
  void v24[5] = &v26;
  objc_msgSend_dataMigrationSetup_withSecret_oldSize_reply_(v19, v20, (uint64_t)v6, v12, v15, v24);

  if (a4)
  {
    uint64_t v21 = (void *)v31[5];
    if (v21) {
      *a4 = v21;
    }
  }
  uint64_t v22 = *((unsigned __int8 *)v27 + 24);

  _Block_object_dispose(&v26, 8);
  _Block_object_dispose(&v30, 8);

  return v22;
}

void sub_190C42110(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  va_start(va1, a13);
  va_start(va, a13);
  uint64_t v14 = va_arg(va1, void);
  uint64_t v16 = va_arg(va1, void);
  uint64_t v17 = va_arg(va1, void);
  uint64_t v18 = va_arg(va1, void);
  _Block_object_dispose(va, 8);
  _Block_object_dispose(va1, 8);
  _Unwind_Resume(a1);
}

void sub_190C42138(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = sub_190C3C3A4();
  uint64_t v11 = sub_190C3B80C((uint64_t)UMLogMessage, @"got error from remote proxy: %@", v5, v6, v7, v8, v9, v10, (uint64_t)v3);
  sub_190C3B464((uint64_t)v4, v11);

  uint64_t v12 = *(void *)(*(void *)(a1 + 32) + 8);
  int v13 = *(void **)(v12 + 40);
  *(void *)(v12 + 40) = v3;
}

void sub_190C421D8(uint64_t a1, void *a2)
{
  id v4 = a2;
  if (v4)
  {
    id v5 = v4;
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40), a2);
    id v4 = v5;
  }
  else
  {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 1;
  }
}

uint64_t sub_190C4224C(uint64_t a1, void *a2)
{
  self;
  uint64_t v17 = 0;
  uint64_t v18 = &v17;
  uint64_t v19 = 0x3032000000;
  uint64_t v20 = sub_190C39F5C;
  uint64_t v21 = sub_190C39F34;
  id v22 = 0;
  uint64_t v13 = 0;
  uint64_t v14 = &v13;
  uint64_t v15 = 0x2020000000;
  char v16 = 0;
  id v3 = sub_190C4D8F4();
  id v4 = sub_190C54624(v3);

  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  void v12[2] = sub_190C4241C;
  v12[3] = &unk_1E56C6100;
  v12[4] = &v17;
  uint64_t v6 = objc_msgSend_synchronousRemoteObjectProxyWithErrorHandler_(v4, v5, (uint64_t)v12);
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  void v11[2] = sub_190C424BC;
  v11[3] = &unk_1E56C61E0;
  v11[4] = &v17;
  v11[5] = &v13;
  objc_msgSend_migrateSharedAndPrimaryUserVolumeWithReply_(v6, v7, (uint64_t)v11);

  if (a2)
  {
    uint64_t v8 = (void *)v18[5];
    if (v8) {
      *a2 = v8;
    }
  }
  uint64_t v9 = *((unsigned __int8 *)v14 + 24);

  _Block_object_dispose(&v13, 8);
  _Block_object_dispose(&v17, 8);

  return v9;
}

void sub_190C423F8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  va_start(va, a13);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v13 - 96), 8);
  _Unwind_Resume(a1);
}

void sub_190C4241C(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = sub_190C3C3A4();
  uint64_t v11 = sub_190C3B80C((uint64_t)UMLogMessage, @"got error from remote proxy: %@", v5, v6, v7, v8, v9, v10, (uint64_t)v3);
  sub_190C3B464((uint64_t)v4, v11);

  uint64_t v12 = *(void *)(*(void *)(a1 + 32) + 8);
  uint64_t v13 = *(void **)(v12 + 40);
  *(void *)(v12 + 40) = v3;
}

void sub_190C424BC(uint64_t a1, void *a2)
{
  id v4 = a2;
  if (v4)
  {
    id v5 = v4;
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40), a2);
    id v4 = v5;
  }
  else
  {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 1;
  }
}

uint64_t sub_190C42530(uint64_t a1, void *a2, void *a3)
{
  id v4 = a2;
  self;
  uint64_t v19 = 0;
  uint64_t v20 = &v19;
  uint64_t v21 = 0x3032000000;
  id v22 = sub_190C39F5C;
  uint64_t v23 = sub_190C39F34;
  id v24 = 0;
  uint64_t v15 = 0;
  char v16 = &v15;
  uint64_t v17 = 0x2020000000;
  char v18 = 0;
  id v5 = sub_190C4D8F4();
  uint64_t v6 = sub_190C54624(v5);

  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = sub_190C42720;
  v14[3] = &unk_1E56C6100;
  v14[4] = &v19;
  uint64_t v8 = objc_msgSend_synchronousRemoteObjectProxyWithErrorHandler_(v6, v7, (uint64_t)v14);
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = sub_190C427C0;
  v13[3] = &unk_1E56C61E0;
  v13[4] = &v19;
  v13[5] = &v15;
  objc_msgSend_migrateGuestUserVolume_withReply_(v8, v9, (uint64_t)v4, v13);

  if (a3)
  {
    uint64_t v10 = (void *)v20[5];
    if (v10) {
      *a3 = v10;
    }
  }
  uint64_t v11 = *((unsigned __int8 *)v16 + 24);

  _Block_object_dispose(&v15, 8);
  _Block_object_dispose(&v19, 8);

  return v11;
}

void sub_190C426FC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  va_start(va, a13);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v13 - 112), 8);
  _Unwind_Resume(a1);
}

void sub_190C42720(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = sub_190C3C3A4();
  uint64_t v11 = sub_190C3B80C((uint64_t)UMLogMessage, @"got error from remote proxy: %@", v5, v6, v7, v8, v9, v10, (uint64_t)v3);
  sub_190C3B464((uint64_t)v4, v11);

  uint64_t v12 = *(void *)(*(void *)(a1 + 32) + 8);
  uint64_t v13 = *(void **)(v12 + 40);
  *(void *)(v12 + 40) = v3;
}

void sub_190C427C0(uint64_t a1, void *a2)
{
  id v4 = a2;
  if (v4)
  {
    id v5 = v4;
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40), a2);
    id v4 = v5;
  }
  else
  {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 1;
  }
}

id sub_190C42834(uint64_t a1, void *a2)
{
  id v2 = a2;
  uint64_t v3 = self;
  id v5 = sub_190C411F8(v3, v2);
  uint64_t v23 = 0;
  id v24 = &v23;
  uint64_t v25 = 0x2020000000;
  char v26 = 0;
  uint64_t v17 = 0;
  char v18 = &v17;
  uint64_t v19 = 0x3032000000;
  uint64_t v20 = sub_190C39F5C;
  uint64_t v21 = sub_190C39F34;
  id v22 = 0;
  if (v5)
  {
    uint64_t v6 = sub_190C4D8F4();
    uint64_t v7 = sub_190C54624(v6);

    v16[0] = MEMORY[0x1E4F143A8];
    v16[1] = 3221225472;
    v16[2] = sub_190C42AB4;
    v16[3] = &unk_1E56C6100;
    v16[4] = &v17;
    uint64_t v9 = objc_msgSend_synchronousRemoteObjectProxyWithErrorHandler_(v7, v8, (uint64_t)v16);
    v15[0] = MEMORY[0x1E4F143A8];
    v15[1] = 3221225472;
    v15[2] = sub_190C42B54;
    v15[3] = &unk_1E56C61E0;
    v15[4] = &v17;
    v15[5] = &v23;
    objc_msgSend_removeUserSession_reply_(v9, v10, (uint64_t)v5, v15);

    if (*((unsigned char *)v24 + 24) || (uint64_t v13 = (void *)v18[5]) == 0)
    {
      uint64_t v11 = 0;
    }
    else
    {
      sub_190C3E75C((uint64_t)UMAbort, v13, @"delete user");
      uint64_t v11 = sub_190C3D158((uint64_t)UMError, 8uLL, (void *)v18[5]);
    }
    id v12 = v11;
  }
  else
  {
    objc_msgSend_errorWithDomain_code_userInfo_(MEMORY[0x1E4F28C58], v4, *MEMORY[0x1E4F28798], 22, 0);
    id v12 = (id)objc_claimAutoreleasedReturnValue();
  }
  _Block_object_dispose(&v17, 8);

  _Block_object_dispose(&v23, 8);
  return v12;
}

void sub_190C42A8C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  va_start(va, a13);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v13 - 96), 8);
  _Unwind_Resume(a1);
}

void sub_190C42AB4(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = sub_190C3C3A4();
  uint64_t v11 = sub_190C3B80C((uint64_t)UMLogMessage, @"got error from remote proxy: %@", v5, v6, v7, v8, v9, v10, (uint64_t)v3);
  sub_190C3B464((uint64_t)v4, v11);

  uint64_t v12 = *(void *)(*(void *)(a1 + 32) + 8);
  uint64_t v13 = *(void **)(v12 + 40);
  *(void *)(v12 + 40) = v3;
}

void sub_190C42B54(uint64_t a1, void *a2)
{
  id v4 = a2;
  if (v4)
  {
    uint64_t v14 = (uint64_t)v4;
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40), a2);
    uint64_t v5 = sub_190C3C3A4();
    uint64_t v12 = sub_190C3B80C((uint64_t)UMLogMessage, @"got error from remote removeUserSession: %@", v6, v7, v8, v9, v10, v11, v14);
    sub_190C3B464((uint64_t)v5, v12);

    id v4 = (id)v14;
    char v13 = 0;
  }
  else
  {
    char v13 = 1;
  }
  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = v13;
}

id sub_190C42C20(uint64_t a1, void *a2)
{
  id v2 = a2;
  uint64_t v3 = self;
  id v4 = objc_opt_new();
  sub_190C42C94(v3, v2, v4);

  return v4;
}

void sub_190C42C94(uint64_t a1, void *a2, void *a3)
{
  id v4 = a2;
  id v5 = a3;
  self;
  if (v4)
  {
    id v6 = v5;
    uint64_t v8 = objc_msgSend_objectForKeyedSubscript_(v4, v7, kUMUserSessionIDKey);
    uint64_t v11 = objc_msgSend_unsignedIntValue(v8, v9, v10);
    objc_msgSend_setUid_(v6, v12, v11);

    uint64_t v14 = objc_msgSend_objectForKeyedSubscript_(v4, v13, kUMUserSessionGroupIDKey);
    uint64_t v17 = objc_msgSend_unsignedIntValue(v14, v15, v16);
    objc_msgSend_setGid_(v6, v18, v17);

    uint64_t v20 = objc_msgSend_objectForKeyedSubscript_(v4, v19, kUMUserSessionAlternateDSIDKey);

    id v22 = (uint64_t *)&kUMUserSessionUUIDKey;
    if (v20) {
      id v22 = (uint64_t *)&kUMUserSessionAlternateDSIDKey;
    }
    uint64_t v23 = objc_msgSend_objectForKeyedSubscript_(v4, v21, *v22);
    objc_msgSend_setAlternateDSID_(v6, v24, (uint64_t)v23);

    uint64_t v27 = objc_msgSend_objectForKeyedSubscript_(v4, v25, kUMUserSessionHomeDirKey);
    if (v27)
    {
      uint64_t v28 = objc_msgSend_URLWithString_(MEMORY[0x1E4F1CB10], v26, (uint64_t)v27);
      objc_msgSend_setHomeDirectoryURL_(v6, v29, (uint64_t)v28);
    }
    uint64_t v30 = objc_msgSend_objectForKeyedSubscript_(v4, v26, kUMUserSessionNameKey);
    objc_msgSend_setUsername_(v6, v31, (uint64_t)v30);

    uint64_t v33 = objc_msgSend_objectForKeyedSubscript_(v4, v32, kUMUserSessionFirstNameKey);
    objc_msgSend_setGivenName_(v6, v34, (uint64_t)v33);

    uint64_t v36 = objc_msgSend_objectForKeyedSubscript_(v4, v35, kUMUserSessionLastNameKey);
    objc_msgSend_setFamilyName_(v6, v37, (uint64_t)v36);

    uint64_t v39 = objc_msgSend_objectForKeyedSubscript_(v4, v38, kUMUserSessionDisplayNameKey);
    objc_msgSend_setDisplayName_(v6, v40, (uint64_t)v39);

    id v43 = objc_msgSend_objectForKeyedSubscript_(v4, v41, kUMUserSessionFileInfoKey);
    if (v43)
    {
      id v44 = objc_msgSend_URLWithString_(MEMORY[0x1E4F1CB10], v42, (uint64_t)v43);
      objc_msgSend_setPhotoURL_(v6, v45, (uint64_t)v44);
    }
    uint64_t v46 = objc_msgSend_objectForKeyedSubscript_(v4, v42, kUMUserSessionLanguageKey);
    objc_msgSend_setUserAuxiliaryString_(v6, v47, (uint64_t)v46);

    uint64_t v49 = objc_msgSend_objectForKeyedSubscript_(v4, v48, kUMUserSessionCreateTimeStampKey);
    objc_msgSend_setCreationDate_(v6, v50, (uint64_t)v49);

    uint64_t v52 = objc_msgSend_objectForKeyedSubscript_(v4, v51, kUMUserSessionLoginTimeStampKey);
    objc_msgSend_setLastLoginDate_(v6, v53, (uint64_t)v52);

    id v55 = objc_msgSend_objectForKeyedSubscript_(v4, v54, kUMUserSessionCloudLoginTimeStampKey);
    objc_msgSend_setLastRemoteAuthDate_(v6, v56, (uint64_t)v55);

    uint64_t v58 = objc_msgSend_objectForKeyedSubscript_(v4, v57, kUMUserSessionLoginUserKey);
    uint64_t v61 = objc_msgSend_BOOLValue(v58, v59, v60);
    objc_msgSend_setIsLoginUser_(v6, v62, v61);

    v64 = objc_msgSend_objectForKeyedSubscript_(v4, v63, kUMUserSessionAuditorKey);
    uint64_t v67 = objc_msgSend_BOOLValue(v64, v65, v66);
    objc_msgSend_setIsAuditor_(v6, v68, v67);

    uint64_t v70 = objc_msgSend_objectForKeyedSubscript_(v4, v69, kUMUserSessionDisabledKey);
    uint64_t v73 = objc_msgSend_BOOLValue(v70, v71, v72);
    objc_msgSend_setIsDisabled_(v6, v74, v73);

    uint64_t v76 = objc_msgSend_objectForKeyedSubscript_(v4, v75, kUMUserSessionisTransientKey);
    uint64_t v79 = objc_msgSend_BOOLValue(v76, v77, v78);
    objc_msgSend_setIsTransientUser_(v6, v80, v79);

    v82 = objc_msgSend_objectForKeyedSubscript_(v4, v81, kUMUserSessionisPrimaryKey);
    uint64_t v85 = objc_msgSend_BOOLValue(v82, v83, v84);
    objc_msgSend_setIsPrimaryUser_(v6, v86, v85);

    uint64_t v88 = objc_msgSend_objectForKeyedSubscript_(v4, v87, kUMUserSessionisAdminKey);
    uint64_t v91 = objc_msgSend_BOOLValue(v88, v89, v90);
    objc_msgSend_setIsAdminUser_(v6, v92, v91);

    uint64_t v94 = objc_msgSend_objectForKeyedSubscript_(v4, v93, kUMUserSessionRequiresPasscodeKey);
    uint64_t v97 = objc_msgSend_unsignedLongValue(v94, v95, v96);
    objc_msgSend_setPasscodeLockGracePeriod_(v6, v98, v97);

    v100 = objc_msgSend_objectForKeyedSubscript_(v4, v99, kUMUserSessionQuotaLimitKey);
    uint64_t v103 = objc_msgSend_unsignedLongLongValue(v100, v101, v102);
    objc_msgSend_setDataQuota_(v6, v104, v103);

    uint64_t v106 = objc_msgSend_objectForKeyedSubscript_(v4, v105, kUMUserSessionQuotaUsedKey);
    uint64_t v109 = objc_msgSend_unsignedLongLongValue(v106, v107, v108);
    objc_msgSend_setDataUsed_(v6, v110, v109);

    uint64_t v112 = objc_msgSend_objectForKeyedSubscript_(v4, v111, kUMUserSessionDirtyKey);
    uint64_t v115 = objc_msgSend_BOOLValue(v112, v113, v114);
    objc_msgSend_setHasDataToSync_(v6, v116, v115);

    uint64_t v118 = objc_msgSend_objectForKeyedSubscript_(v4, v117, kUMUserSessionFirstLoginStartTimeKey);
    objc_msgSend_setFirstLoginStartDate_(v6, v119, (uint64_t)v118);

    uint64_t v121 = objc_msgSend_objectForKeyedSubscript_(v4, v120, kUMUserSessionFirstLoginEndTimeKey);
    objc_msgSend_setFirstLoginEndDate_(v6, v122, (uint64_t)v121);

    uint64_t v124 = objc_msgSend_objectForKeyedSubscript_(v4, v123, kUMUserSessionCachedLoginStartTimeKey);
    objc_msgSend_setLastCachedLoginStartDate_(v6, v125, (uint64_t)v124);

    v127 = objc_msgSend_objectForKeyedSubscript_(v4, v126, kUMUserSessionCachedLoginEndTimeKey);
    objc_msgSend_setLastCachedLoginEndDate_(v6, v128, (uint64_t)v127);

    uint64_t v130 = objc_msgSend_objectForKeyedSubscript_(v4, v129, kUMUserSessionLogoutStartTimeKey);
    objc_msgSend_setLastLogoutStartDate_(v6, v131, (uint64_t)v130);

    v133 = objc_msgSend_objectForKeyedSubscript_(v4, v132, kUMUserSessionLogoutEndTimeKey);
    objc_msgSend_setLastLogoutEndDate_(v6, v134, (uint64_t)v133);

    uint64_t v137 = objc_msgSend_objectForKeyedSubscript_(v4, v135, kUMUserSessionOpaqueDataKey);
    if (!v137) {
      goto LABEL_32;
    }
    uint64_t v209 = 0;
    id v208 = 0;
    uint64_t v138 = objc_msgSend_propertyListWithData_options_format_error_(MEMORY[0x1E4F28F98], v136, (uint64_t)v137, 0, &v209, &v208);
    id v139 = v208;
    uint64_t v140 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v141 = objc_opt_class();
    uint64_t v195 = 0;
    v143 = objc_msgSend_setWithObjects_(v140, v142, v141);
    if (v138)
    {
      if (v209 != 200) {
        goto LABEL_31;
      }
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0) {
        goto LABEL_31;
      }
      uint64_t v204 = (uint64_t)v143;
      v145 = objc_msgSend_objectForKeyedSubscript_(v138, v144, @"passcodeType");
      id v148 = v145;
      if (v145)
      {
        uint64_t v149 = objc_msgSend_unsignedLongValue(v145, v146, v147);
        objc_msgSend_setPasscodeType_(v6, v150, v149);
      }
      v203 = v148;
      uint64_t v151 = objc_msgSend_objectForKeyedSubscript_(v138, v146, @"languages");
      objc_msgSend_setLanguages_(v6, v152, (uint64_t)v151);

      uint64_t v154 = objc_msgSend_objectForKeyedSubscript_(v138, v153, @"hasManagedCredentials");
      uint64_t v157 = v154;
      if (v154)
      {
        uint64_t v158 = objc_msgSend_BOOLValue(v154, v155, v156);
        objc_msgSend_setHasManagedCredentials_(v6, v159, v158);
      }
      v202 = v157;
      uint64_t v160 = objc_msgSend_objectForKeyedSubscript_(v138, v155, @"errorCausingLogout");
      v201 = (void *)v160;
      v205 = v27;
      if (v160)
      {
        id v199 = v139;
        id v207 = 0;
        uint64_t v162 = objc_msgSend_unarchivedObjectOfClasses_fromData_error_(MEMORY[0x1E4F28DC0], v161, v204, v160, &v207);
        id v163 = v207;
        objc_msgSend_setErrorCausingLogout_(v6, v164, (uint64_t)v162);
        v171 = sub_190C3C3A4();
        if (v162)
        {
          v172 = @"Successful Unarchive of logout error\n";
        }
        else
        {
          uint64_t v195 = (uint64_t)v163;
          v172 = @"Failed to Unarchive logout error with error:%@ \n";
        }
        v182 = sub_190C3B80C((uint64_t)UMLogMessage, v172, v165, v166, v167, v168, v169, v170, v195);
        sub_190C3B464((uint64_t)v171, v182);

        id v139 = v199;
        v181 = v163;
      }
      else
      {
        v181 = 0;
      }
      v184 = objc_msgSend_objectForKeyedSubscript_(v138, v161, @"debugErrorCausingLogout");
      if (v184)
      {
        id v197 = v5;
        id v173 = v139;
        id v206 = v181;
        v200 = v184;
        uint64_t v185 = objc_msgSend_unarchivedObjectOfClasses_fromData_error_(MEMORY[0x1E4F28DC0], v183, v204, v184, &v206);
        id v174 = v206;

        objc_msgSend_setDebugErrorCausingLogout_(v6, v186, v185);
        v196 = sub_190C3C3A4();
        v198 = (void *)v185;
        if (v185)
        {
          v193 = @"Successful Unarchive of debug logout error \n";
        }
        else
        {
          uint64_t v195 = (uint64_t)v174;
          v193 = @"Failed to Unarchive debug logout error with error:%@ \n";
        }
        v194 = sub_190C3B80C((uint64_t)UMLogMessage, v193, v187, v188, v189, v190, v191, v192, v195);
        id v5 = v197;
        sub_190C3B464((uint64_t)v196, v194);

        v143 = (void *)v204;
        v184 = v200;
      }
      else
      {
        id v173 = v139;
        id v174 = v181;
        v143 = (void *)v204;
      }
    }
    else
    {
      v205 = v27;
      id v173 = v139;
      sub_190C3C3A4();
      id v174 = (id)objc_claimAutoreleasedReturnValue();
      sub_190C49FC4((uint64_t)v174, @"Could not properly get user's opaque data", v175, v176, v177, v178, v179, v180, 0);
    }

    id v139 = v173;
    uint64_t v27 = v205;
LABEL_31:

LABEL_32:
  }
}

BOOL sub_190C43614(uint64_t a1, void *a2, void *a3)
{
  id v4 = a2;
  uint64_t v5 = self;
  self;
  if (byte_1EB2197E8 && !objc_msgSend_uid(v4, v6, v7))
  {
    BOOL v10 = 0;
  }
  else
  {
    uint64_t v8 = objc_msgSend_uid(v4, v6, v7);
    uint64_t v9 = sub_190C3F33C(v5, v8, a3);
    BOOL v10 = v9 != 0;
    if (v9) {
      sub_190C42C94(v5, v9, v4);
    }
  }
  return v10;
}

id sub_190C436C0(uint64_t a1, void *a2, void *a3)
{
  id v4 = a2;
  uint64_t v5 = self;
  uint64_t v23 = 0;
  id v24 = &v23;
  uint64_t v25 = 0x3032000000;
  char v26 = sub_190C39F5C;
  uint64_t v27 = sub_190C39F34;
  id v28 = 0;
  uint64_t v17 = 0;
  char v18 = &v17;
  uint64_t v19 = 0x3032000000;
  uint64_t v20 = sub_190C39F5C;
  uint64_t v21 = sub_190C39F34;
  id v22 = 0;
  id v6 = sub_190C4390C(v5, v4);
  uint64_t v7 = sub_190C4D8F4();
  uint64_t v8 = sub_190C54624(v7);

  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = sub_190C439F0;
  v16[3] = &unk_1E56C6100;
  v16[4] = &v17;
  BOOL v10 = objc_msgSend_synchronousRemoteObjectProxyWithErrorHandler_(v8, v9, (uint64_t)v16);
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = sub_190C43A90;
  v15[3] = &unk_1E56C61B8;
  v15[4] = &v17;
  v15[5] = &v23;
  objc_msgSend_userKeybagOpaqueData_KeybagBlobwithReply_(v10, v11, (uint64_t)v6, v15);

  if (a3)
  {
    uint64_t v12 = (void *)v18[5];
    if (v12) {
      *a3 = v12;
    }
  }
  id v13 = (id)v24[5];

  _Block_object_dispose(&v17, 8);
  _Block_object_dispose(&v23, 8);

  return v13;
}

void sub_190C438E4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  va_start(va, a13);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v13 - 128), 8);
  _Unwind_Resume(a1);
}

id sub_190C4390C(uint64_t a1, void *a2)
{
  v13[1] = *MEMORY[0x1E4F143B8];
  id v2 = a2;
  self;
  uint64_t v12 = kUMUserSessionIDKey;
  uint64_t v3 = (void *)MEMORY[0x1E4F28ED0];
  uint64_t v6 = objc_msgSend_uid(v2, v4, v5);

  uint64_t v8 = objc_msgSend_numberWithUnsignedInt_(v3, v7, v6);
  v13[0] = v8;
  BOOL v10 = objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x1E4F1C9E8], v9, (uint64_t)v13, &v12, 1);

  return v10;
}

void sub_190C439F0(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = sub_190C3C3A4();
  uint64_t v11 = sub_190C3B80C((uint64_t)UMLogMessage, @"got error from remote proxy: %@", v5, v6, v7, v8, v9, v10, (uint64_t)v3);
  sub_190C3B464((uint64_t)v4, v11);

  uint64_t v12 = *(void *)(*(void *)(a1 + 32) + 8);
  uint64_t v13 = *(void **)(v12 + 40);
  *(void *)(v12 + 40) = v3;
}

void sub_190C43A90(uint64_t a1, void *a2, void *a3)
{
  id v16 = a2;
  id v5 = a3;
  if (v5)
  {
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40), a3);
    uint64_t v6 = sub_190C3C3A4();
    uint64_t v13 = sub_190C3B80C((uint64_t)UMLogMessage, @"got error from remote KeybagOpaqueDataForUser: %@", v7, v8, v9, v10, v11, v12, (uint64_t)v5);
    sub_190C3B464((uint64_t)v6, v13);
  }
  else
  {
    uint64_t v14 = *(void *)(*(void *)(a1 + 40) + 8);
    id v15 = v16;
    uint64_t v6 = *(void **)(v14 + 40);
    *(void *)(v14 + 40) = v15;
  }
}

uint64_t sub_190C43B68(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v6 = a2;
  id v7 = a3;
  uint64_t v8 = self;
  uint64_t v24 = 0;
  uint64_t v25 = &v24;
  uint64_t v26 = 0x3032000000;
  uint64_t v27 = sub_190C39F5C;
  id v28 = sub_190C39F34;
  id v29 = 0;
  uint64_t v20 = 0;
  uint64_t v21 = &v20;
  uint64_t v22 = 0x2020000000;
  char v23 = 0;
  uint64_t v9 = sub_190C4390C(v8, v6);
  uint64_t v10 = sub_190C4D8F4();
  uint64_t v11 = sub_190C54624(v10);

  v19[0] = MEMORY[0x1E4F143A8];
  v19[1] = 3221225472;
  v19[2] = sub_190C43D8C;
  v19[3] = &unk_1E56C6100;
  v19[4] = &v24;
  uint64_t v13 = objc_msgSend_synchronousRemoteObjectProxyWithErrorHandler_(v11, v12, (uint64_t)v19);
  v18[0] = MEMORY[0x1E4F143A8];
  v18[1] = 3221225472;
  v18[2] = sub_190C43E2C;
  v18[3] = &unk_1E56C61E0;
  v18[4] = &v24;
  v18[5] = &v20;
  objc_msgSend_setUserKeybagOpaqueData_keybagBlob_withReply_(v13, v14, (uint64_t)v9, v7, v18);

  if (a4)
  {
    id v15 = (void *)v25[5];
    if (v15) {
      *a4 = v15;
    }
  }
  uint64_t v16 = *((unsigned __int8 *)v21 + 24);

  _Block_object_dispose(&v20, 8);
  _Block_object_dispose(&v24, 8);

  return v16;
}

void sub_190C43D64(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  va_start(va1, a13);
  va_start(va, a13);
  uint64_t v14 = va_arg(va1, void);
  uint64_t v16 = va_arg(va1, void);
  uint64_t v17 = va_arg(va1, void);
  uint64_t v18 = va_arg(va1, void);
  _Block_object_dispose(va, 8);
  _Block_object_dispose(va1, 8);
  _Unwind_Resume(a1);
}

void sub_190C43D8C(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = sub_190C3C3A4();
  uint64_t v11 = sub_190C3B80C((uint64_t)UMLogMessage, @"got error from remote proxy: %@", v5, v6, v7, v8, v9, v10, (uint64_t)v3);
  sub_190C3B464((uint64_t)v4, v11);

  uint64_t v12 = *(void *)(*(void *)(a1 + 32) + 8);
  uint64_t v13 = *(void **)(v12 + 40);
  *(void *)(v12 + 40) = v3;
}

void sub_190C43E2C(uint64_t a1, void *a2)
{
  id v4 = a2;
  if (v4)
  {
    uint64_t v13 = (uint64_t)v4;
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40), a2);
    uint64_t v5 = sub_190C3C3A4();
    uint64_t v12 = sub_190C3B80C((uint64_t)UMLogMessage, @"got error from remote setUserKeybagOpaqueData: %@", v6, v7, v8, v9, v10, v11, v13);
    sub_190C3B464((uint64_t)v5, v12);

    id v4 = (id)v13;
  }
  else
  {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 1;
  }
}

void sub_190C43EEC(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = sub_190C3C3A4();
  uint64_t v11 = sub_190C3B80C((uint64_t)UMLogMessage, @"got error from remote proxy: %@", v5, v6, v7, v8, v9, v10, (uint64_t)v3);
  sub_190C3B464((uint64_t)v4, v11);

  uint64_t v12 = *(void *)(*(void *)(a1 + 32) + 8);
  uint64_t v13 = *(void **)(v12 + 40);
  *(void *)(v12 + 40) = v3;
}

void sub_190C43F8C(uint64_t a1, void *a2)
{
  id v4 = a2;
  if (v4)
  {
    id v5 = v4;
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40), a2);
    id v4 = v5;
  }
  else
  {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 1;
  }
}

uint64_t sub_190C44000()
{
  uint64_t result = self;
  byte_1E92A9931 = 0;
  return result;
}

BOOL sub_190C44020(uint64_t a1, void *a2, void *a3)
{
  id v4 = a2;
  uint64_t v5 = self;
  uint64_t v6 = sub_190C3B928();
  uint64_t v12 = sub_190C4CFC8((uint64_t)UMLogMessage, v4, @"Commit changes", v7, v8, v9, v10, v11, v24);
  sub_190C3B464((uint64_t)v6, v12);

  uint64_t v13 = sub_190C411F8(v5, v4);
  if (objc_msgSend_count(v13, v14, v15))
  {
    uint64_t v33 = 0;
    uint64_t v34 = &v33;
    uint64_t v35 = 0x3032000000;
    uint64_t v36 = sub_190C39F5C;
    id v37 = sub_190C39F34;
    id v38 = 0;
    uint64_t v27 = 0;
    id v28 = &v27;
    uint64_t v29 = 0x3032000000;
    uint64_t v30 = sub_190C39F5C;
    id v31 = sub_190C39F34;
    id v32 = 0;
    uint64_t v16 = sub_190C4D8F4();
    uint64_t v17 = sub_190C54624(v16);

    v26[0] = MEMORY[0x1E4F143A8];
    v26[1] = 3221225472;
    v26[2] = sub_190C442B8;
    v26[3] = &unk_1E56C6100;
    v26[4] = &v33;
    uint64_t v19 = objc_msgSend_synchronousRemoteObjectProxyWithErrorHandler_(v17, v18, (uint64_t)v26);
    v25[0] = MEMORY[0x1E4F143A8];
    v25[1] = 3221225472;
    int v25[2] = sub_190C44358;
    v25[3] = &unk_1E56C6230;
    v25[4] = &v27;
    void v25[5] = &v33;
    objc_msgSend_setUserSessionAttributes_reply_(v19, v20, (uint64_t)v13, v25);

    uint64_t v21 = v28[5];
    BOOL v22 = v21 != 0;
    if (!v21) {
      sub_190C44434(v5, (void *)v34[5], a3);
    }

    _Block_object_dispose(&v27, 8);
    _Block_object_dispose(&v33, 8);
  }
  else
  {
    BOOL v22 = 0;
  }

  return v22;
}

void sub_190C44294(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  va_start(va, a13);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v13 - 128), 8);
  _Unwind_Resume(a1);
}

void sub_190C442B8(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = sub_190C3C3A4();
  uint64_t v11 = sub_190C3B80C((uint64_t)UMLogMessage, @"got error from remote proxy: %@", v5, v6, v7, v8, v9, v10, (uint64_t)v3);
  sub_190C3B464((uint64_t)v4, v11);

  uint64_t v12 = *(void *)(*(void *)(a1 + 32) + 8);
  uint64_t v13 = *(void **)(v12 + 40);
  *(void *)(v12 + 40) = v3;
}

void sub_190C44358(uint64_t a1, void *a2, void *a3)
{
  id v15 = a2;
  id v6 = a3;
  if (v15) {
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40), a2);
  }
  if (v6)
  {
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), a3);
    uint64_t v7 = sub_190C3C3A4();
    uint64_t v14 = sub_190C3B80C((uint64_t)UMLogMessage, @"got error from remote setUserSessionAttributes: %@", v8, v9, v10, v11, v12, v13, (uint64_t)v6);
    sub_190C3B464((uint64_t)v7, v14);
  }
}

uint64_t sub_190C44434(uint64_t a1, void *a2, void *a3)
{
  id v16 = a2;
  id v4 = self;
  if (v16)
  {
    id v4 = (id)objc_msgSend_code(v16, v5, (uint64_t)v16);
    if (v4 == (id)1)
    {
      id v6 = sub_190C3C3A4();
      sub_190C49FC4((uint64_t)v6, @"Error: this process is not entitled to access user properties", v7, v8, v9, v10, v11, v12, v15);

      unint64_t v13 = 7;
    }
    else
    {
      unint64_t v13 = 8;
    }
    if (a3)
    {
      sub_190C3D158((uint64_t)UMError, v13, v16);
      id v4 = (id)objc_claimAutoreleasedReturnValue();
      *a3 = v4;
    }
  }
  return MEMORY[0x1F4181820](v4);
}

id sub_190C444F0()
{
  v7[1] = *MEMORY[0x1E4F143B8];
  self;
  uint64_t v6 = kUMUserSessionTypeKey;
  v7[0] = kUMUserSessionManagedDevice;
  uint64_t v1 = objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x1E4F1C9E8], v0, (uint64_t)v7, &v6, 1);
  id v4 = objc_msgSend_mutableCopy(v1, v2, v3);

  return v4;
}

id sub_190C445A4(uint64_t a1, void *a2)
{
  id v2 = a2;
  self;
  id v4 = objc_msgSend_objectForKeyedSubscript_(v2, v3, kUMUserSwitchTaskNameKey);
  uint64_t v6 = objc_msgSend_objectForKeyedSubscript_(v2, v5, kUMUserSwitchTaskReasonKey);
  uint64_t v8 = objc_msgSend_objectForKeyedSubscript_(v2, v7, kUMUserSwitchTaskBundleIDKey);
  uint64_t v10 = objc_msgSend_taskWithName_reason_forBundleID_(UMTask, v9, (uint64_t)v4, v6, v8);
  uint64_t v12 = objc_msgSend_objectForKeyedSubscript_(v2, v11, kUMUserSwitchTaskPIDKey);
  uint64_t v15 = objc_msgSend_intValue(v12, v13, v14);
  objc_msgSend_setPid_(v10, v16, v15);
  uint64_t v18 = objc_msgSend_objectForKeyedSubscript_(v2, v17, kUMUserSwitchTaskUUIDKey);

  if (v18)
  {
    sub_190C4D428(MEMORY[0x1E4F29128], v18);
    uint64_t v19 = (char *)objc_claimAutoreleasedReturnValue();
    sub_190C5E0AC(v10, v19);
  }
  return v10;
}

id sub_190C44700(uint64_t a1, void *a2)
{
  id v2 = a2;
  self;
  uint64_t v3 = objc_opt_new();
  uint64_t v6 = objc_msgSend_name(v2, v4, v5);

  if (v6)
  {
    uint64_t v9 = objc_msgSend_name(v2, v7, v8);
    objc_msgSend_setObject_forKeyedSubscript_(v3, v10, (uint64_t)v9, kUMUserSwitchTaskNameKey);
  }
  uint64_t v11 = objc_msgSend_reason(v2, v7, v8);

  if (v11)
  {
    uint64_t v14 = objc_msgSend_reason(v2, v12, v13);
    objc_msgSend_setObject_forKeyedSubscript_(v3, v15, (uint64_t)v14, kUMUserSwitchTaskReasonKey);
  }
  id v16 = objc_msgSend_bundleID(v2, v12, v13);

  if (v16)
  {
    uint64_t v19 = objc_msgSend_bundleID(v2, v17, v18);
    objc_msgSend_setObject_forKeyedSubscript_(v3, v20, (uint64_t)v19, kUMUserSwitchTaskBundleIDKey);
  }
  uint64_t v21 = (void *)MEMORY[0x1E4F28ED0];
  uint64_t v22 = objc_msgSend_pid(v2, v17, v18);
  uint64_t v24 = objc_msgSend_numberWithInt_(v21, v23, v22);
  objc_msgSend_setObject_forKeyedSubscript_(v3, v25, (uint64_t)v24, kUMUserSwitchTaskPIDKey);

  uint64_t v26 = sub_190C3CF10((uint64_t)v2);

  if (v26)
  {
    uint64_t v27 = sub_190C3CF10((uint64_t)v2);
    uint64_t v30 = objc_msgSend_UUIDString(v27, v28, v29);
    objc_msgSend_setObject_forKeyedSubscript_(v3, v31, (uint64_t)v30, kUMUserSwitchTaskUUIDKey);
  }
  return v3;
}

uint64_t sub_190C44A48(uint64_t a1, void *a2)
{
  return objc_msgSend_isEqualToUser_(a2, (const char *)a2, *(void *)(a1 + 32)) ^ 1;
}

void sub_190C44DB4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,char a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,char a36)
{
}

void sub_190C44DF8(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = sub_190C3C3A4();
  uint64_t v11 = sub_190C3B80C((uint64_t)UMLogMessage, @"got error from remote proxy: %@", v5, v6, v7, v8, v9, v10, (uint64_t)v3);
  sub_190C3B464((uint64_t)v4, v11);

  uint64_t v12 = *(void *)(*(void *)(a1 + 32) + 8);
  uint64_t v13 = *(void **)(v12 + 40);
  *(void *)(v12 + 40) = v3;
}

void sub_190C44E98(uint64_t a1, void *a2, void *a3)
{
  id v15 = a2;
  id v6 = a3;
  if (v15) {
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40), a2);
  }
  if (v6)
  {
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), a3);
    uint64_t v7 = sub_190C3C3A4();
    uint64_t v14 = sub_190C3B80C((uint64_t)UMLogMessage, @"got error from remote listSyncBubbleUserswithReply: %@", v8, v9, v10, v11, v12, v13, (uint64_t)v6);
    sub_190C3B464((uint64_t)v7, v14);
  }
}

void sub_190C451BC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  va_start(va, a13);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v13 - 112), 8);
  _Unwind_Resume(a1);
}

void sub_190C451E0(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = sub_190C3C3A4();
  uint64_t v11 = sub_190C3B80C((uint64_t)UMLogMessage, @"got error from remote proxy: %@", v5, v6, v7, v8, v9, v10, (uint64_t)v3);
  sub_190C3B464((uint64_t)v4, v11);

  uint64_t v12 = *(void *)(*(void *)(a1 + 32) + 8);
  uint64_t v13 = *(void **)(v12 + 40);
  *(void *)(v12 + 40) = v3;
}

void sub_190C45280(uint64_t a1, void *a2, void *a3)
{
  id v15 = a2;
  id v6 = a3;
  if (v15) {
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40), a2);
  }
  if (v6)
  {
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), a3);
    uint64_t v7 = sub_190C3C3A4();
    uint64_t v14 = sub_190C3B80C((uint64_t)UMLogMessage, @"got error from remote listSyncServiceSourcesForUserSession: %@", v8, v9, v10, v11, v12, v13, (uint64_t)v6);
    sub_190C3B464((uint64_t)v7, v14);
  }
}

BOOL sub_190C45364(uint64_t a1, int a2, void *a3, void *a4)
{
  id v6 = a3;
  self;
  uint64_t v30 = 0;
  id v31 = &v30;
  uint64_t v32 = 0x3032000000;
  uint64_t v33 = sub_190C39F5C;
  uint64_t v34 = sub_190C39F34;
  id v35 = 0;
  uint64_t v26 = 0;
  uint64_t v27 = &v26;
  uint64_t v28 = 0x2020000000;
  char v29 = 0;
  uint64_t v7 = sub_190C4D8F4();
  uint64_t v8 = sub_190C54624(v7);

  if (a2)
  {
    v25[0] = MEMORY[0x1E4F143A8];
    v25[1] = 3221225472;
    int v25[2] = sub_190C45B50;
    v25[3] = &unk_1E56C6100;
    v25[4] = &v30;
    uint64_t v10 = objc_msgSend_synchronousRemoteObjectProxyWithErrorHandler_(v8, v9, (uint64_t)v25);
    uint64_t v13 = objc_msgSend_uid(v6, v11, v12);
    v24[0] = MEMORY[0x1E4F143A8];
    v24[1] = 3221225472;
    v24[2] = sub_190C45BF0;
    v24[3] = &unk_1E56C61E0;
    v24[4] = &v30;
    void v24[5] = &v26;
    objc_msgSend_startUserSyncBubble_withReply_(v10, v14, v13, v24);
  }
  else
  {
    v23[0] = MEMORY[0x1E4F143A8];
    v23[1] = 3221225472;
    int v23[2] = sub_190C45CB0;
    v23[3] = &unk_1E56C6100;
    v23[4] = &v30;
    uint64_t v10 = objc_msgSend_synchronousRemoteObjectProxyWithErrorHandler_(v8, v9, (uint64_t)v23);
    uint64_t v17 = objc_msgSend_uid(v6, v15, v16);
    v22[0] = MEMORY[0x1E4F143A8];
    v22[1] = 3221225472;
    v22[2] = sub_190C45D50;
    v22[3] = &unk_1E56C61E0;
    v22[4] = &v30;
    void v22[5] = &v26;
    objc_msgSend_stoptUserSyncBubble_withReply_(v10, v18, v17, v22);
  }

  int v19 = *((unsigned __int8 *)v27 + 24);
  if (!*((unsigned char *)v27 + 24))
  {
    id v20 = (id)v31[5];
    if (!a4) {
      goto LABEL_7;
    }
    goto LABEL_6;
  }
  id v20 = 0;
  if (a4) {
LABEL_6:
  }
    *a4 = v20;
LABEL_7:

  _Block_object_dispose(&v26, 8);
  _Block_object_dispose(&v30, 8);

  return v19 != 0;
}

void sub_190C45630(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 144), 8);
  _Block_object_dispose((const void *)(v1 - 112), 8);
  _Unwind_Resume(a1);
}

void sub_190C45818(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  va_start(va, a13);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v13 - 96), 8);
  _Unwind_Resume(a1);
}

void sub_190C4583C(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = sub_190C3C3A4();
  uint64_t v11 = sub_190C3B80C((uint64_t)UMLogMessage, @"got error from remote proxy: %@", v5, v6, v7, v8, v9, v10, (uint64_t)v3);
  sub_190C3B464((uint64_t)v4, v11);

  uint64_t v12 = *(void *)(*(void *)(a1 + 32) + 8);
  uint64_t v13 = *(void **)(v12 + 40);
  *(void *)(v12 + 40) = v3;
}

void sub_190C458DC(uint64_t a1, void *a2)
{
  id v4 = a2;
  if (v4)
  {
    uint64_t v13 = (uint64_t)v4;
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40), a2);
    uint64_t v5 = sub_190C3C3A4();
    uint64_t v12 = sub_190C3B80C((uint64_t)UMLogMessage, @"got error from remote clearSyncBubbleUserswithReply: %@", v6, v7, v8, v9, v10, v11, v13);
    sub_190C3B464((uint64_t)v5, v12);

    id v4 = (id)v13;
  }
  else
  {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 1;
  }
}

uint64_t sub_190C4599C(uint64_t a1, void *a2)
{
  self;
  uint32_t v43 = 0;
  uint64_t v3 = sub_190C3C448(&v43);
  if (v3)
  {
    uint64_t v5 = v3;
    uint64_t v6 = sub_190C3C3A4();
    uint64_t v13 = sub_190C3B80C((uint64_t)UMLogMessage, @"Failed to get multiuser_config flags from kernel with error:%d", v7, v8, v9, v10, v11, v12, v5);
    sub_190C3B464((uint64_t)v6, v13);

    id v20 = sub_190C3C3A4();
    if (v5 == 2) {
      uint64_t v21 = @"FAILED to MKBUserTypeDeviceMode, EPERM";
    }
    else {
      uint64_t v21 = @"FAILED to MKBUserTypeDeviceMode, EINVAL";
    }
    if (v5 == 2) {
      uint64_t v22 = 1;
    }
    else {
      uint64_t v22 = 22;
    }
    char v23 = sub_190C3B80C((uint64_t)UMLogMessage, v21, v14, v15, v16, v17, v18, v19, v42);
    sub_190C3B464((uint64_t)v20, v23);
  }
  else
  {
    uint64_t v24 = v43 & 0x3FFFFFFF;
    if ((v43 & 0x80000000) != 0 || v24 > 0x1F4)
    {
      dword_1EB219778 = v43 & 0x3FFFFFFF;
      return v24;
    }
    uint64_t v22 = 2;
  }
  dword_1EB219778 = -1;
  uint64_t v25 = objc_msgSend_errorWithDomain_code_userInfo_(MEMORY[0x1E4F28C58], v4, *MEMORY[0x1E4F28798], v22, 0);
  uint64_t v32 = sub_190C3B80C((uint64_t)UMLogMessage, @"Could not get the foreground UID", v26, v27, v28, v29, v30, v31, v41);
  sub_190C4CE30((uint64_t)v32, @"error: %@", v33, v34, v35, v36, v37, v38, (uint64_t)v25);
  uint64_t v39 = sub_190C3C3A4();
  sub_190C3B464((uint64_t)v39, v32);

  if (a2) {
    *a2 = v25;
  }

  uint64_t v24 = dword_1EB219778;
  return v24;
}

void sub_190C45B50(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = sub_190C3C3A4();
  uint64_t v11 = sub_190C3B80C((uint64_t)UMLogMessage, @"got error from remote proxy: %@", v5, v6, v7, v8, v9, v10, (uint64_t)v3);
  sub_190C3B464((uint64_t)v4, v11);

  uint64_t v12 = *(void *)(*(void *)(a1 + 32) + 8);
  uint64_t v13 = *(void **)(v12 + 40);
  *(void *)(v12 + 40) = v3;
}

void sub_190C45BF0(uint64_t a1, void *a2)
{
  id v4 = a2;
  if (v4)
  {
    uint64_t v13 = (uint64_t)v4;
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40), a2);
    uint64_t v5 = sub_190C3C3A4();
    uint64_t v12 = sub_190C3B80C((uint64_t)UMLogMessage, @"got error from remote startUserSyncBubble: %@", v6, v7, v8, v9, v10, v11, v13);
    sub_190C3B464((uint64_t)v5, v12);

    id v4 = (id)v13;
  }
  else
  {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 1;
  }
}

void sub_190C45CB0(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = sub_190C3C3A4();
  uint64_t v11 = sub_190C3B80C((uint64_t)UMLogMessage, @"got error from remote proxy: %@", v5, v6, v7, v8, v9, v10, (uint64_t)v3);
  sub_190C3B464((uint64_t)v4, v11);

  uint64_t v12 = *(void *)(*(void *)(a1 + 32) + 8);
  uint64_t v13 = *(void **)(v12 + 40);
  *(void *)(v12 + 40) = v3;
}

void sub_190C45D50(uint64_t a1, void *a2)
{
  id v4 = a2;
  if (v4)
  {
    uint64_t v13 = (uint64_t)v4;
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40), a2);
    uint64_t v5 = sub_190C3C3A4();
    uint64_t v12 = sub_190C3B80C((uint64_t)UMLogMessage, @"got error from remote stoptUserSyncBubble: %@", v6, v7, v8, v9, v10, v11, v13);
    sub_190C3B464((uint64_t)v5, v12);

    id v4 = (id)v13;
  }
  else
  {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 1;
  }
}

void sub_190C45E10(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = sub_190C3C3A4();
  uint64_t v11 = sub_190C3B80C((uint64_t)UMLogMessage, @"got error from remote proxy: %@", v5, v6, v7, v8, v9, v10, (uint64_t)v3);
  sub_190C3B464((uint64_t)v4, v11);

  uint64_t v12 = *(void *)(*(void *)(a1 + 32) + 8);
  uint64_t v13 = *(void **)(v12 + 40);
  *(void *)(v12 + 40) = v3;
}

void sub_190C45EB0(uint64_t a1, void *a2, void *a3)
{
  id v16 = a2;
  id v5 = a3;
  if (v5)
  {
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40), a3);
    uint64_t v6 = sub_190C3C3A4();
    uint64_t v13 = sub_190C3B80C((uint64_t)UMLogMessage, @"got error from remote getUserSessionAttributes: %@", v7, v8, v9, v10, v11, v12, (uint64_t)v5);
    sub_190C3B464((uint64_t)v6, v13);
  }
  else
  {
    uint64_t v14 = *(void *)(*(void *)(a1 + 40) + 8);
    id v15 = v16;
    uint64_t v6 = *(void **)(v14 + 40);
    *(void *)(v14 + 40) = v15;
  }
}

uint64_t sub_190C45F88()
{
  qword_1E92A9888 = (uint64_t)os_log_create(off_1E92A8E80, "persona");
  return MEMORY[0x1F41817F8]();
}

void sub_190C46080(uint64_t a1, const char *a2, uint64_t a3)
{
  id v3 = objc_msgSend_currentUser(*(void **)(a1 + 32), a2, a3);
  id v10 = 0;
  BOOL v4 = sub_190C5C824(v3, &v10);
  id v5 = v10;
  uint64_t v8 = v5;
  if (v4 || !v5)
  {
  }
  else
  {
    uint64_t v9 = objc_msgSend_code(v5, v6, v7);

    if (v9 == 7) {
      byte_1E92A9938 = 1;
    }
  }
}

void sub_190C46128(void *a1)
{
  if (a1)
  {
    id v2 = sub_190C3C65C();
    v21[0] = MEMORY[0x1E4F143A8];
    v21[1] = 3221225472;
    v21[2] = sub_190C46228;
    v21[3] = &unk_1E56C62A8;
    v21[4] = a1;
    sub_190C3C78C((uint64_t)v2, a1, v21);

    id v5 = objc_msgSend_sharedManager(UMUserManager, v3, v4);
    uint64_t v8 = objc_msgSend_currentUser(v5, v6, v7);

    uint64_t v9 = sub_190C3C3A4();
    uint64_t v12 = objc_msgSend_uid(v8, v10, v11);
    sub_190C49FC4((uint64_t)v9, @"CurrentUser with UID:%d set to refetch attributes", v13, v14, v15, v16, v17, v18, v12);

    objc_msgSend_refetchUser(v8, v19, v20);
  }
}

void sub_190C46228(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  id v2 = *(void **)(v1 + 8);
  *(void *)(v1 + 8) = 0;
}

id *sub_190C462B4(id *WeakRetained)
{
  if (WeakRetained)
  {
    id WeakRetained = (id *)objc_loadWeakRetained(WeakRetained + 3);
    uint64_t v1 = vars8;
  }
  return WeakRetained;
}

void sub_190C463EC(void **a1, void *a2)
{
  id v3 = a2;
  v20[0] = MEMORY[0x1E4F143A8];
  v20[1] = 3221225472;
  v20[2] = sub_190C46564;
  v20[3] = &unk_1E56C62D0;
  id v21 = a1[7];
  uint64_t v4 = (void (**)(void, void))MEMORY[0x192FD5500](v20);
  id v5 = sub_190C3C3A4();
  uint64_t v11 = sub_190C4CFC8((uint64_t)UMLogMessage, a1[4], @"Load user", v6, v7, v8, v9, v10, v19);
  sub_190C3B464((uint64_t)v5, v11);

  if (objc_msgSend_isSharedIPad(v3, v12, v13)
    && !objc_msgSend_isLoginSession(a1[5], v14, v15))
  {
    unint64_t v17 = 0;
    goto LABEL_7;
  }
  if (!objc_msgSend_userExists_(v3, v14, (uint64_t)a1[4]))
  {
    unint64_t v17 = 2;
LABEL_7:
    uint64_t v16 = sub_190C3D020((uint64_t)UMError, v17);
    goto LABEL_8;
  }
  uint64_t v16 = sub_190C40C4C((uint64_t)UMMobileKeyBag, a1[4], a1[6]);
LABEL_8:
  uint64_t v18 = (void *)v16;
  v4[2](v4, v16);
}

uint64_t sub_190C46564(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

void sub_190C46684(void **a1, void *a2)
{
  id v3 = a2;
  v21[0] = MEMORY[0x1E4F143A8];
  v21[1] = 3221225472;
  v21[2] = sub_190C46850;
  v21[3] = &unk_1E56C62D0;
  id v22 = a1[7];
  uint64_t v4 = (void (**)(void, void))MEMORY[0x192FD5500](v21);
  id v5 = sub_190C3C3A4();
  uint64_t v11 = sub_190C4CFC8((uint64_t)UMLogMessage, a1[4], @"Create user", v6, v7, v8, v9, v10, v20);
  sub_190C3B464((uint64_t)v5, v11);

  if (objc_msgSend_isSharedIPad(v3, v12, v13)) {
    int isLoginSession = objc_msgSend_isLoginSession(a1[5], v14, v15);
  }
  else {
    int isLoginSession = 1;
  }
  if (objc_msgSend_isSharedIPad(v3, v14, v15) && sub_190C3F14C())
  {
    if (((_os_feature_enabled_impl() | isLoginSession) & 1) == 0)
    {
LABEL_7:
      unint64_t v18 = 0;
LABEL_11:
      uint64_t v19 = sub_190C3D020((uint64_t)UMError, v18);
      goto LABEL_12;
    }
  }
  else if (!isLoginSession)
  {
    goto LABEL_7;
  }
  if (objc_msgSend_userExists_(v3, v17, (uint64_t)a1[4]))
  {
    unint64_t v18 = 1;
    goto LABEL_11;
  }
  uint64_t v19 = sub_190C40C4C((uint64_t)UMMobileKeyBag, a1[4], a1[6]);
  if (!v19) {
    sub_190C46128(v3);
  }
LABEL_12:
  ((void (**)(void, void *))v4)[2](v4, v19);
}

uint64_t sub_190C46850(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

void sub_190C46948(void **a1, void *a2)
{
  id v3 = a2;
  v27[0] = MEMORY[0x1E4F143A8];
  v27[1] = 3221225472;
  v27[2] = sub_190C46AF4;
  v27[3] = &unk_1E56C62D0;
  id v28 = a1[6];
  uint64_t v4 = (void (**)(void, void))MEMORY[0x192FD5500](v27);
  id v5 = sub_190C3C3A4();
  uint64_t v11 = sub_190C4CFC8((uint64_t)UMLogMessage, a1[4], @"Delete user", v6, v7, v8, v9, v10, v26);
  sub_190C3B464((uint64_t)v5, v11);

  if (objc_msgSend_uid(a1[4], v12, v13) == 501
    || (objc_msgSend_currentUser(a1[5], v14, v15),
        uint64_t v16 = objc_claimAutoreleasedReturnValue(),
        int v19 = objc_msgSend_uid(v16, v17, v18),
        int v22 = objc_msgSend_uid(a1[4], v20, v21),
        v16,
        v19 == v22))
  {
    unint64_t v24 = 0;
LABEL_4:
    uint64_t v25 = sub_190C3D020((uint64_t)UMError, v24);
    goto LABEL_5;
  }
  if (!objc_msgSend_userExists_(v3, v23, (uint64_t)a1[4]))
  {
    unint64_t v24 = 2;
    goto LABEL_4;
  }
  uint64_t v25 = sub_190C42834((uint64_t)UMMobileKeyBag, a1[4]);
  if (!v25) {
    sub_190C46128(v3);
  }
LABEL_5:
  ((void (**)(void, void *))v4)[2](v4, v25);
}

uint64_t sub_190C46AF4(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

void sub_190C46BE8(uint64_t a1, void *a2)
{
  id v3 = a2;
  v27[0] = MEMORY[0x1E4F143A8];
  v27[1] = 3221225472;
  v27[2] = sub_190C46D94;
  v27[3] = &unk_1E56C62D0;
  id v28 = *(id *)(a1 + 40);
  uint64_t v4 = (void (**)(void, void))MEMORY[0x192FD5500](v27);
  id v5 = sub_190C3C3A4();
  uint64_t v11 = sub_190C4CFC8((uint64_t)UMLogMessage, *(void **)(a1 + 32), @"Disable user", v6, v7, v8, v9, v10, v26);
  sub_190C3B464((uint64_t)v5, v11);

  if (!objc_msgSend_isSharedIPad(v3, v12, v13))
  {
    unint64_t v24 = 0;
LABEL_6:
    uint64_t v25 = sub_190C3D020((uint64_t)UMError, v24);
    ((void (**)(void, void *))v4)[2](v4, v25);

    goto LABEL_7;
  }
  if (!objc_msgSend_userExists_(v3, v14, *(void *)(a1 + 32)))
  {
    unint64_t v24 = 2;
    goto LABEL_6;
  }
  id v15 = *(id *)(a1 + 32);
  objc_msgSend_setIsDisabled_(v15, v16, 1);
  int v19 = objc_msgSend_dateWithTimeIntervalSinceNow_(MEMORY[0x1E4F1C9C8], v17, v18, -604800.0);
  objc_msgSend_setLastRemoteAuthDate_(v15, v20, (uint64_t)v19);

  objc_msgSend_commitChanges(v15, v21, v22);
  objc_msgSend_switchToLoginUserWithCompletionHandler_(v3, v23, (uint64_t)v4);
LABEL_7:
}

uint64_t sub_190C46D94(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

id *sub_190C46E30(id *result, void *a2)
{
  if (result) {
    return (id *)objc_storeWeak(result + 3, a2);
  }
  return result;
}

uint64_t sub_190C4705C(uint64_t a1, void *a2)
{
  a2;
  uint64_t v3 = *(void *)(a1 + 32);
  if (v3) {
    *(unsigned char *)(v3 + 16) = 0;
  }
  uint64_t v4 = *(void *)(a1 + 40);
  if (v4) {
    (*(void (**)(void))(v4 + 16))();
  }
  return MEMORY[0x1F41817F8]();
}

uint64_t sub_190C470C4(uint64_t result, char a2)
{
  if (result) {
    *(unsigned char *)(result + 16) = a2;
  }
  return result;
}

BOOL sub_190C470D0(BOOL result)
{
  if (result) {
    return *(unsigned char *)(result + 16) != 0;
  }
  return result;
}

uint64_t sub_190C47254(uint64_t a1, void *a2)
{
  a2;
  uint64_t v3 = *(void *)(a1 + 32);
  if (v3) {
    *(unsigned char *)(v3 + 16) = 0;
  }
  uint64_t v4 = *(void *)(a1 + 40);
  if (v4) {
    (*(void (**)(void))(v4 + 16))();
  }
  return MEMORY[0x1F41817F8]();
}

uint64_t sub_190C476A4(uint64_t a1, void *a2)
{
  a2;
  uint64_t v3 = *(void *)(a1 + 32);
  if (v3) {
    *(unsigned char *)(v3 + 16) = 0;
  }
  uint64_t v4 = *(void *)(a1 + 40);
  if (v4) {
    (*(void (**)(void))(v4 + 16))();
  }
  return MEMORY[0x1F41817F8]();
}

id *sub_190C491BC(id *WeakRetained)
{
  if (WeakRetained)
  {
    id WeakRetained = (id *)objc_loadWeakRetained(WeakRetained + 4);
    uint64_t v1 = vars8;
  }
  return WeakRetained;
}

id *sub_190C491EC(id *result, void *a2)
{
  if (result) {
    return (id *)objc_storeWeak(result + 4, a2);
  }
  return result;
}

void sub_190C49354(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_190C4936C(uint64_t a1, void *a2)
{
  uint64_t v6 = a2;
  uint64_t v3 = (void *)v6[1];
  if (!v3)
  {
    uint64_t v4 = sub_190C3FDD8((uint64_t)UMMobileKeyBag, 1);
    id v5 = (void *)v6[1];
    v6[1] = v4;

    uint64_t v3 = (void *)v6[1];
  }
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40), v3);
}

void sub_190C49504(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_190C4951C(uint64_t a1, void *a2)
{
  uint64_t v6 = a2;
  uint64_t v3 = (void *)v6[1];
  if (!v3)
  {
    uint64_t v4 = sub_190C3FDD8((uint64_t)UMMobileKeyBag, 0);
    id v5 = (void *)v6[1];
    v6[1] = v4;

    uint64_t v3 = (void *)v6[1];
  }
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40), v3);
}

uint64_t sub_190C49B38(uint64_t a1, void *a2)
{
  a2;
  uint64_t v3 = *(void *)(a1 + 32);
  if (v3) {
    *(unsigned char *)(v3 + 16) = 0;
  }
  uint64_t v4 = *(void *)(a1 + 40);
  if (v4) {
    (*(void (**)(void))(v4 + 16))();
  }
  return MEMORY[0x1F41817F8]();
}

void sub_190C49CC0()
{
  uint64_t v0 = objc_opt_new();
  uint64_t v1 = (void *)qword_1EB2197D8;
  qword_1EB2197D8 = v0;

  if (qword_1EB2197D8) {
    *(void *)(qword_1EB2197D8 + 8) = 0;
  }
}

uint64_t sub_190C49D00(uint64_t result, uint64_t a2)
{
  if (result) {
    *(void *)(result + 8) = a2;
  }
  return result;
}

id sub_190C49D0C()
{
  uint64_t v0 = self;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = sub_190C49DB0;
  block[3] = &unk_1E56C5FF8;
  block[4] = v0;
  if (qword_1E92A9950 != -1) {
    dispatch_once(&qword_1E92A9950, block);
  }
  uint64_t v1 = (void *)qword_1E92A9948;
  return v1;
}

void sub_190C49DB0()
{
  uint64_t v0 = objc_opt_new();
  uint64_t v1 = (void *)qword_1E92A9948;
  qword_1E92A9948 = v0;

  if (qword_1E92A9948) {
    *(void *)(qword_1E92A9948 + 8) = 1;
  }
}

id sub_190C49DF4()
{
  uint64_t v0 = self;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = sub_190C49E98;
  block[3] = &unk_1E56C5FF8;
  block[4] = v0;
  if (qword_1EB219790 != -1) {
    dispatch_once(&qword_1EB219790, block);
  }
  uint64_t v1 = (void *)qword_1EB219788;
  return v1;
}

void sub_190C49E98()
{
  uint64_t v0 = objc_opt_new();
  uint64_t v1 = (void *)qword_1EB219788;
  qword_1EB219788 = v0;

  if (qword_1EB219788) {
    *(void *)(qword_1EB219788 + 8) = 3;
  }
}

id sub_190C49EDC()
{
  uint64_t v0 = self;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = sub_190C49F80;
  block[3] = &unk_1E56C5FF8;
  block[4] = v0;
  if (qword_1E92A9960 != -1) {
    dispatch_once(&qword_1E92A9960, block);
  }
  uint64_t v1 = (void *)qword_1E92A9958;
  return v1;
}

void sub_190C49F80()
{
  uint64_t v0 = objc_opt_new();
  uint64_t v1 = (void *)qword_1E92A9958;
  qword_1E92A9958 = v0;

  if (qword_1E92A9958) {
    *(void *)(qword_1E92A9958 + 8) = 4;
  }
}

void sub_190C49FC4(uint64_t a1, void *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  if (a1)
  {
    uint64_t v10 = sub_190C4CC80((uint64_t)UMLogMessage, a2, (uint64_t)&a9);
    sub_190C3B464(a1, v10);
  }
}

void sub_190C4A024(uint64_t a1, void *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  if (a1)
  {
    uint64_t v10 = sub_190C4CD98((uint64_t)UMLogMessage, a2, (uint64_t)&a9);
    sub_190C3B464(a1, v10);
  }
}

id sub_190C4A084()
{
  self;
  if (qword_1EB2197A8 != -1) {
    dispatch_once(&qword_1EB2197A8, &unk_1EE091380);
  }
  uint64_t v0 = (void *)qword_1EB2197B0;
  return v0;
}

void sub_190C4A0DC()
{
  uint64_t v0 = objc_alloc_init(UMSideEffects);
  uint64_t v1 = (void *)qword_1EB2197B0;
  qword_1EB2197B0 = (uint64_t)v0;

  id v2 = objc_alloc_init(UMLibInfoProvider);
  objc_msgSend_setLibInfo_((void *)qword_1EB2197B0, v3, (uint64_t)v2);

  id v5 = objc_alloc_init(UMLibNotifyProvider);
  objc_msgSend_setLibNotify_((void *)qword_1EB2197B0, v4, (uint64_t)v5);
}

id sub_190C4A1D0()
{
  return sub_190C4A084();
}

uint64_t sub_190C4A1DC(void *a1, void *a2)
{
  id v3 = a2;
  id v5 = v3;
  if (a1)
  {
    if (v3)
    {
      uint64_t v6 = objc_msgSend_valueForEntitlement_(a1, v4, (uint64_t)v3);
      if (v6 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)) {
        uint64_t v9 = objc_msgSend_BOOLValue(v6, v7, v8);
      }
      else {
        uint64_t v9 = 0;
      }
    }
    else
    {
      uint64_t v9 = 1;
    }
  }
  else
  {
    uint64_t v9 = 0;
  }

  return v9;
}

void sub_190C4AAE4(void *a1, void *a2)
{
  if (a1)
  {
    id v3 = a2;
    uint64_t v6 = objc_msgSend_personaLayoutPathURL(v3, v4, v5);
    objc_msgSend_setPersonaLayoutPathURL_(a1, v7, (uint64_t)v6);

    uint64_t v10 = objc_msgSend_userPersonaUniqueString(v3, v8, v9);
    objc_msgSend_setUserPersonaUniqueString_(a1, v11, (uint64_t)v10);

    uint64_t v14 = objc_msgSend_userPersonaType(v3, v12, v13);
    objc_msgSend_setUserPersonaType_(a1, v15, v14);
    uint64_t v18 = objc_msgSend_userPersona_id(v3, v16, v17);
    objc_msgSend_setUserPersona_id_(a1, v19, v18);
    uint64_t isEnterprisePersona = objc_msgSend_isEnterprisePersona(v3, v20, v21);
    objc_msgSend_setIsEnterprisePersona_(a1, v23, isEnterprisePersona);
    uint64_t isPersonalPersona = objc_msgSend_isPersonalPersona(v3, v24, v25);
    objc_msgSend_setIsPersonalPersona_(a1, v27, isPersonalPersona);
    uint64_t isUniversalPersona = objc_msgSend_isUniversalPersona(v3, v28, v29);
    objc_msgSend_setIsUniversalPersona_(a1, v31, isUniversalPersona);
    uint64_t isSystemPersona = objc_msgSend_isSystemPersona(v3, v32, v33);
    objc_msgSend_setIsSystemPersona_(a1, v35, isSystemPersona);
    uint64_t isDefaultPersona = objc_msgSend_isDefaultPersona(v3, v36, v37);
    objc_msgSend_setIsDefaultPersona_(a1, v39, isDefaultPersona);
    uint64_t isGuestPersona = objc_msgSend_isGuestPersona(v3, v40, v41);
    objc_msgSend_setIsGuestPersona_(a1, v43, isGuestPersona);
    uint64_t isDataSeparatedPersona = objc_msgSend_isDataSeparatedPersona(v3, v44, v45);
    objc_msgSend_setIsDataSeparatedPersona_(a1, v47, isDataSeparatedPersona);
    uint64_t v50 = objc_msgSend_userPersonaBundleIDList(v3, v48, v49);
    objc_msgSend_setUserPersonaBundleIDList_(a1, v51, (uint64_t)v50);

    uint64_t v54 = objc_msgSend_creationDate(v3, v52, v53);
    objc_msgSend_setCreationDate_(a1, v55, (uint64_t)v54);

    uint64_t v58 = objc_msgSend_lastLoginDate(v3, v56, v57);
    objc_msgSend_setLastLoginDate_(a1, v59, (uint64_t)v58);

    v62 = objc_msgSend_lastDisableDate(v3, v60, v61);
    objc_msgSend_setLastDisableDate_(a1, v63, (uint64_t)v62);

    objc_msgSend_lastEnableDate(v3, v64, v65);
    id v67 = (id)objc_claimAutoreleasedReturnValue();

    objc_msgSend_setLastEnableDate_(a1, v66, (uint64_t)v67);
  }
}

uint64_t sub_190C4BBF8()
{
  qword_1E92A9898 = (uint64_t)os_log_create(off_1E92A8E80, "sideeffect");
  return MEMORY[0x1F41817F8]();
}

id sub_190C4BC40(void *a1)
{
  if (a1)
  {
    uint64_t v1 = sub_190C4D428(MEMORY[0x1E4F29128], a1);
    uint64_t v4 = objc_msgSend_UUIDString(v1, v2, v3);
  }
  else
  {
    uint64_t v4 = 0;
  }
  return v4;
}

uint64_t sub_190C4BCA4(void *a1, const char *a2)
{
  if (!a1) {
    return 0;
  }
  id v2 = objc_msgSend_objectForKey_(a1, a2, (uint64_t)a2);
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v5 = objc_msgSend_BOOLValue(v2, v3, v4);
    int v6 = 0;
  }
  else
  {
    uint64_t v5 = 0;
    int v6 = 2;
  }
  *__error() = v6;

  return v5;
}

uint64_t sub_190C4BD2C(void *a1, const char *a2, uint64_t a3)
{
  if (!a1) {
    return 0;
  }
  uint64_t v4 = objc_msgSend_objectForKey_(a1, a2, (uint64_t)a2);
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    a3 = objc_msgSend_intValue(v4, v5, v6);
    int v7 = 0;
  }
  else
  {
    int v7 = 2;
  }
  *__error() = v7;

  return a3;
}

uint64_t sub_190C4BDB4(void *a1, const char *a2, uint64_t a3)
{
  if (!a1) {
    return 0;
  }
  uint64_t v4 = objc_msgSend_objectForKey_(a1, a2, (uint64_t)a2);
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    a3 = objc_msgSend_unsignedIntValue(v4, v5, v6);
    int v7 = 0;
  }
  else
  {
    int v7 = 2;
  }
  *__error() = v7;

  return a3;
}

uint64_t sub_190C4BE3C(void *a1, const char *a2, uint64_t a3)
{
  if (!a1) {
    return 0;
  }
  uint64_t v4 = objc_msgSend_objectForKey_(a1, a2, (uint64_t)a2);
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    a3 = objc_msgSend_longLongValue(v4, v5, v6);
    int v7 = 0;
  }
  else
  {
    int v7 = 2;
  }
  *__error() = v7;

  return a3;
}

uint64_t sub_190C4BEC4(void *a1, const char *a2, uint64_t a3)
{
  if (!a1) {
    return 0;
  }
  uint64_t v4 = objc_msgSend_objectForKey_(a1, a2, (uint64_t)a2);
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    a3 = objc_msgSend_unsignedLongLongValue(v4, v5, v6);
    int v7 = 0;
  }
  else
  {
    int v7 = 2;
  }
  *__error() = v7;

  return a3;
}

id sub_190C4BF4C(void *a1, const char *a2)
{
  if (a1)
  {
    id v2 = objc_msgSend_objectForKey_(a1, a2, (uint64_t)a2);
    objc_opt_class();
    char isKindOfClass = objc_opt_isKindOfClass();
    uint64_t v4 = __error();
    if (isKindOfClass)
    {
      *uint64_t v4 = 0;
      id v5 = v2;
    }
    else
    {
      id v5 = 0;
      *uint64_t v4 = 2;
    }
  }
  else
  {
    id v5 = 0;
  }
  return v5;
}

id sub_190C4BFDC(void *a1, const char *a2)
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  if (a1)
  {
    id v2 = objc_msgSend_objectForKey_(a1, a2, (uint64_t)a2);
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      long long v13 = 0u;
      long long v14 = 0u;
      long long v15 = 0u;
      long long v16 = 0u;
      id v3 = v2;
      uint64_t v5 = objc_msgSend_countByEnumeratingWithState_objects_count_(v3, v4, (uint64_t)&v13, v17, 16);
      if (v5)
      {
        uint64_t v6 = v5;
        uint64_t v7 = *(void *)v14;
        while (2)
        {
          for (uint64_t i = 0; i != v6; ++i)
          {
            if (*(void *)v14 != v7) {
              objc_enumerationMutation(v3);
            }
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) == 0)
            {
              *__error() = 2;

              uint64_t v11 = 0;
              goto LABEL_14;
            }
          }
          uint64_t v6 = objc_msgSend_countByEnumeratingWithState_objects_count_(v3, v9, (uint64_t)&v13, v17, 16);
          if (v6) {
            continue;
          }
          break;
        }
      }

      uint64_t v11 = objc_msgSend_setWithArray_(MEMORY[0x1E4F1CAD0], v10, (uint64_t)v3, v13);
      *__error() = 0;
LABEL_14:
    }
    else
    {
      uint64_t v11 = 0;
      *__error() = 2;
    }
  }
  else
  {
    uint64_t v11 = 0;
  }
  return v11;
}

id sub_190C4C188(void *a1, const char *a2)
{
  if (a1)
  {
    id v2 = objc_msgSend_objectForKey_(a1, a2, (uint64_t)a2);
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v3 = sub_190C4D428(MEMORY[0x1E4F29128], v2);
      int v4 = 2 * (v3 == 0);
    }
    else
    {
      id v3 = 0;
      int v4 = 2;
    }
    *__error() = v4;
  }
  else
  {
    id v3 = 0;
  }
  return v3;
}

id sub_190C4C234(void *a1, const char *a2)
{
  if (a1)
  {
    id v2 = objc_msgSend_objectForKey_(a1, a2, (uint64_t)a2);
    objc_opt_class();
    char isKindOfClass = objc_opt_isKindOfClass();
    int v4 = __error();
    if (isKindOfClass)
    {
      *int v4 = 0;
      id v5 = v2;
    }
    else
    {
      id v5 = 0;
      *int v4 = 2;
    }
  }
  else
  {
    id v5 = 0;
  }
  return v5;
}

id sub_190C4C2C4(void *a1, const char *a2)
{
  if (a1)
  {
    id v2 = objc_msgSend_objectForKey_(a1, a2, (uint64_t)a2);
    objc_opt_class();
    char isKindOfClass = objc_opt_isKindOfClass();
    int v4 = __error();
    if (isKindOfClass)
    {
      *int v4 = 0;
      id v5 = v2;
    }
    else
    {
      id v5 = 0;
      *int v4 = 2;
    }
  }
  else
  {
    id v5 = 0;
  }
  return v5;
}

id sub_190C4C354(uint64_t a1, const char *a2)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  if (a1)
  {
    id v9 = 0;
    id v2 = objc_msgSend_dataWithPropertyList_format_options_error_(MEMORY[0x1E4F28F98], a2, a1, 200, 0, &v9);
    id v3 = v9;
    if (!v2)
    {
      if (qword_1E92A9970 != -1) {
        dispatch_once(&qword_1E92A9970, &unk_1EE0913C0);
      }
      int v4 = (id)qword_1E92A9968;
      if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
      {
        unsigned int v5 = sub_190C3E7E8();
        if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
          unsigned int v6 = v5;
        }
        else {
          unsigned int v6 = v5 & 0xFFFFFFFE;
        }
        if (v6)
        {
          int v10 = 138543362;
          id v11 = v3;
          uint64_t v7 = (void *)_os_log_send_and_compose_impl();
          if (v7) {
            sub_190C3E7F0();
          }
        }
        else
        {
          uint64_t v7 = 0;
        }
        free(v7);
      }
    }
  }
  else
  {
    id v2 = 0;
  }
  return v2;
}

id sub_190C4C4E4(uint64_t a1, const char *a2)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  if (a1)
  {
    id v9 = 0;
    id v2 = objc_msgSend_dataWithPropertyList_format_options_error_(MEMORY[0x1E4F28F98], a2, a1, 200, 0, &v9);
    id v3 = v9;
    if (!v2)
    {
      if (qword_1E92A9970 != -1) {
        dispatch_once(&qword_1E92A9970, &unk_1EE0913C0);
      }
      int v4 = (id)qword_1E92A9968;
      if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
      {
        unsigned int v5 = sub_190C3E7E8();
        if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
          unsigned int v6 = v5;
        }
        else {
          unsigned int v6 = v5 & 0xFFFFFFFE;
        }
        if (v6)
        {
          int v10 = 138412290;
          id v11 = v3;
          uint64_t v7 = (void *)_os_log_send_and_compose_impl();
          if (v7) {
            sub_190C3E7F0();
          }
        }
        else
        {
          uint64_t v7 = 0;
        }
        free(v7);
      }
    }
  }
  else
  {
    id v2 = 0;
  }
  return v2;
}

id sub_190C4C674(uint64_t a1, const char *a2)
{
  v15[3] = *MEMORY[0x1E4F143B8];
  if (a1)
  {
    id v14 = 0;
    id v2 = objc_msgSend_propertyListWithData_options_format_error_(MEMORY[0x1E4F28F98], a2, a1, 0, 0, &v14);
    id v3 = v14;
    if (v2)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        if (qword_1E92A9970 != -1) {
          dispatch_once(&qword_1E92A9970, &unk_1EE0913C0);
        }
        int v4 = (id)qword_1E92A9968;
        if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
        {
          v15[0] = 0;
          unsigned int v5 = sub_190C3E7E8();
          if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
            unsigned int v6 = v5;
          }
          else {
            unsigned int v6 = v5 & 0xFFFFFFFE;
          }
          if (v6)
          {
            uint64_t v7 = (void *)_os_log_send_and_compose_impl();
            if (v7) {
              sub_190C3E7F0();
            }
          }
          else
          {
            uint64_t v7 = 0;
          }
          free(v7);
        }

        id v12 = 0;
        goto LABEL_29;
      }
    }
    else
    {
      if (qword_1E92A9970 != -1) {
        dispatch_once(&qword_1E92A9970, &unk_1EE0913C0);
      }
      uint64_t v8 = (id)qword_1E92A9968;
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      {
        unsigned int v9 = sub_190C3E7E8();
        if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
          unsigned int v10 = v9;
        }
        else {
          unsigned int v10 = v9 & 0xFFFFFFFE;
        }
        if (v10)
        {
          LODWORD(v15[0]) = 138543362;
          *(void *)((char *)v15 + 4) = v3;
          id v11 = (void *)_os_log_send_and_compose_impl();
          if (v11) {
            sub_190C3E7F0();
          }
        }
        else
        {
          id v11 = 0;
        }
        free(v11);
      }
    }
    id v12 = v2;
LABEL_29:

    goto LABEL_30;
  }
  id v12 = 0;
LABEL_30:
  return v12;
}

id sub_190C4C904(uint64_t a1, const char *a2)
{
  v15[3] = *MEMORY[0x1E4F143B8];
  if (a1)
  {
    id v14 = 0;
    id v2 = objc_msgSend_propertyListWithData_options_format_error_(MEMORY[0x1E4F28F98], a2, a1, 0, 0, &v14);
    id v3 = v14;
    if (v2)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        if (qword_1E92A9970 != -1) {
          dispatch_once(&qword_1E92A9970, &unk_1EE0913C0);
        }
        int v4 = (id)qword_1E92A9968;
        if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
        {
          v15[0] = 0;
          unsigned int v5 = sub_190C3E7E8();
          if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
            unsigned int v6 = v5;
          }
          else {
            unsigned int v6 = v5 & 0xFFFFFFFE;
          }
          if (v6)
          {
            uint64_t v7 = (void *)_os_log_send_and_compose_impl();
            if (v7) {
              sub_190C3E7F0();
            }
          }
          else
          {
            uint64_t v7 = 0;
          }
          free(v7);
        }

        id v12 = 0;
        goto LABEL_29;
      }
    }
    else
    {
      if (qword_1E92A9970 != -1) {
        dispatch_once(&qword_1E92A9970, &unk_1EE0913C0);
      }
      uint64_t v8 = (id)qword_1E92A9968;
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      {
        unsigned int v9 = sub_190C3E7E8();
        if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
          unsigned int v10 = v9;
        }
        else {
          unsigned int v10 = v9 & 0xFFFFFFFE;
        }
        if (v10)
        {
          LODWORD(v15[0]) = 138543362;
          *(void *)((char *)v15 + 4) = v3;
          id v11 = (void *)_os_log_send_and_compose_impl();
          if (v11) {
            sub_190C3E7F0();
          }
        }
        else
        {
          id v11 = 0;
        }
        free(v11);
      }
    }
    id v12 = v2;
LABEL_29:

    goto LABEL_30;
  }
  id v12 = 0;
LABEL_30:
  return v12;
}

uint64_t sub_190C4CB94()
{
  qword_1E92A9968 = (uint64_t)os_log_create(off_1E92A8E80, "default");
  return MEMORY[0x1F41817F8]();
}

void **sub_190C4CBDC(uint64_t a1, void *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  id v9 = a2;
  self;
  unsigned int v10 = (void **)objc_opt_new();
  id v11 = [NSString alloc];
  long long v13 = objc_msgSend_initWithFormat_arguments_(v11, v12, (uint64_t)v9, &a9);

  if (v13)
  {
    if (v10) {
      objc_msgSend_addObject_(v10[2], v14, (uint64_t)v13);
    }
    else {
      objc_msgSend_addObject_(0, v14, (uint64_t)v13);
    }
  }

  return v10;
}

id sub_190C4CC80(uint64_t a1, void *a2, uint64_t a3)
{
  id v4 = a2;
  self;
  unsigned int v5 = objc_opt_new();
  id v6 = [NSString alloc];
  uint64_t v8 = objc_msgSend_initWithFormat_arguments_(v6, v7, (uint64_t)v4, a3);

  sub_190C4CD18((uint64_t)v5, @"%@", v9, v10, v11, v12, v13, v14, (uint64_t)v8);
  return v5;
}

void sub_190C4CD18(uint64_t a1, void *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  if (a1)
  {
    uint64_t v10 = (objc_class *)NSString;
    id v11 = a2;
    id v12 = [v10 alloc];
    uint64_t v14 = objc_msgSend_initWithFormat_arguments_(v12, v13, (uint64_t)v11, &a9);

    if (v14) {
      objc_msgSend_addObject_(*(void **)(a1 + 8), v15, (uint64_t)v14);
    }
  }
}

id sub_190C4CD98(uint64_t a1, void *a2, uint64_t a3)
{
  id v4 = a2;
  self;
  unsigned int v5 = objc_opt_new();
  id v6 = [NSString alloc];
  uint64_t v8 = objc_msgSend_initWithFormat_arguments_(v6, v7, (uint64_t)v4, a3);

  sub_190C4CE30((uint64_t)v5, @"%@", v9, v10, v11, v12, v13, v14, (uint64_t)v8);
  return v5;
}

void sub_190C4CE30(uint64_t a1, void *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  if (a1)
  {
    uint64_t v10 = (objc_class *)NSString;
    id v11 = a2;
    id v12 = [v10 alloc];
    uint64_t v14 = objc_msgSend_initWithFormat_arguments_(v12, v13, (uint64_t)v11, &a9);

    if (v14) {
      objc_msgSend_addObject_(*(void **)(a1 + 16), v15, (uint64_t)v14);
    }
  }
}

void sub_190C4CEB0(uint64_t a1, void *a2, void *a3)
{
  id v4 = a3;
  id v5 = a2;
  self;
  uint64_t v8 = objc_msgSend_uid(v5, v6, v7);
  sub_190C4CD18((uint64_t)v4, @"uid: %d", v9, v10, v11, v12, v13, v14, v8);
  objc_msgSend_username(v5, v15, v16);
  id v23 = (id)objc_claimAutoreleasedReturnValue();

  sub_190C4CE30((uint64_t)v4, @"username: %@", v17, v18, v19, v20, v21, v22, (uint64_t)v23);
}

id sub_190C4CF5C(uint64_t a1, void *a2)
{
  id v2 = a2;
  uint64_t v3 = self;
  id v4 = objc_opt_new();
  sub_190C4CEB0(v3, v2, v4);

  return v4;
}

void **sub_190C4CFC8(uint64_t a1, void *a2, void *a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  id v10 = a2;
  id v11 = a3;
  uint64_t v12 = self;
  uint64_t v13 = (void **)objc_opt_new();
  id v14 = [NSString alloc];
  uint64_t v16 = objc_msgSend_initWithFormat_arguments_(v14, v15, (uint64_t)v11, &a9);

  if (v16)
  {
    if (v13) {
      objc_msgSend_addObject_(v13[1], v17, (uint64_t)v16);
    }
    else {
      objc_msgSend_addObject_(0, v17, (uint64_t)v16);
    }
  }
  sub_190C4CEB0(v12, v10, v13);

  return v13;
}

void **sub_190C4D098(uint64_t a1, void *a2, void *a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  id v10 = a2;
  id v11 = a3;
  uint64_t v12 = self;
  uint64_t v13 = (void **)objc_opt_new();
  id v14 = [NSString alloc];
  uint64_t v16 = objc_msgSend_initWithFormat_arguments_(v14, v15, (uint64_t)v11, &a9);

  if (v16)
  {
    if (v13) {
      objc_msgSend_addObject_(v13[2], v17, (uint64_t)v16);
    }
    else {
      objc_msgSend_addObject_(0, v17, (uint64_t)v16);
    }
  }
  sub_190C4CEB0(v12, v10, v13);

  return v13;
}

void sub_190C4D168(uint64_t a1, void *a2, void *a3)
{
  id v4 = a3;
  id v18 = a2;
  self;
  id v5 = sub_190C3CF10((uint64_t)v18);
  sub_190C4CD18((uint64_t)v4, @"uuid: %@", v6, v7, v8, v9, v10, v11, (uint64_t)v5);

  sub_190C4CE30((uint64_t)v4, @"task: %@", v12, v13, v14, v15, v16, v17, (uint64_t)v18);
}

id sub_190C4D20C(uint64_t a1, void *a2)
{
  id v2 = a2;
  uint64_t v3 = self;
  id v4 = objc_opt_new();
  sub_190C4D168(v3, v2, v4);

  return v4;
}

void **sub_190C4D278(uint64_t a1, void *a2, void *a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  id v10 = a2;
  id v11 = a3;
  uint64_t v12 = self;
  uint64_t v13 = (void **)objc_opt_new();
  id v14 = [NSString alloc];
  uint64_t v16 = objc_msgSend_initWithFormat_arguments_(v14, v15, (uint64_t)v11, &a9);

  if (v16)
  {
    if (v13) {
      objc_msgSend_addObject_(v13[1], v17, (uint64_t)v16);
    }
    else {
      objc_msgSend_addObject_(0, v17, (uint64_t)v16);
    }
  }
  sub_190C4D168(v12, v10, v13);

  return v13;
}

void **sub_190C4D348(uint64_t a1, void *a2, void *a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  id v10 = a2;
  id v11 = a3;
  uint64_t v12 = self;
  uint64_t v13 = (void **)objc_opt_new();
  id v14 = [NSString alloc];
  uint64_t v16 = objc_msgSend_initWithFormat_arguments_(v14, v15, (uint64_t)v11, &a9);

  if (v16)
  {
    if (v13) {
      objc_msgSend_addObject_(v13[2], v17, (uint64_t)v16);
    }
    else {
      objc_msgSend_addObject_(0, v17, (uint64_t)v16);
    }
  }
  sub_190C4D168(v12, v10, v13);

  return v13;
}

void sub_190C4D418(uint64_t a1, void *a2)
{
  if (a1) {
    objc_storeStrong((id *)(a1 + 16), a2);
  }
}

id sub_190C4D428(uint64_t a1, void *a2)
{
  id v2 = a2;
  self;
  id v3 = objc_alloc(MEMORY[0x1E4F29128]);
  id v5 = objc_msgSend_initWithUUIDString_(v3, v4, (uint64_t)v2);

  return v5;
}

id sub_190C4D488(uint64_t a1, const __CFUUID *a2)
{
  self;
  if (a2)
  {
    id v3 = (__CFString *)CFUUIDCreateString((CFAllocatorRef)*MEMORY[0x1E4F1CF80], a2);
    if (!v3) {
      sub_190C5EB60();
    }
    id v4 = v3;
    id v5 = sub_190C4D428(MEMORY[0x1E4F29128], v3);
    CFRelease(v4);
  }
  else
  {
    id v5 = 0;
  }
  return v5;
}

CFUUIDRef sub_190C4D50C(void *a1, const char *a2, uint64_t a3)
{
  if (!a1) {
    return 0;
  }
  CFAllocatorRef v3 = (const __CFAllocator *)*MEMORY[0x1E4F1CF80];
  objc_msgSend_UUIDString(a1, a2, a3);
  id v4 = (__CFString *)objc_claimAutoreleasedReturnValue();
  CFUUIDRef v5 = CFUUIDCreateFromString(v3, v4);

  if (!v5) {
    sub_190C5EB60();
  }
  return v5;
}

UMPasswd *sub_190C4D56C(uint64_t a1, uint64_t a2)
{
  self;
  CFAllocatorRef v3 = objc_alloc_init(UMPasswd);
  sub_190C3CF70((uint64_t)v3, *(_DWORD *)(a2 + 20));
  return v3;
}

uint64_t sub_190C4D88C()
{
  qword_1E92A98A0 = (uint64_t)os_log_create(off_1E92A8E80, "sideeffect");
  return MEMORY[0x1F41817F8]();
}

id sub_190C4D8F4()
{
  uint64_t v0 = self;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = sub_190C4D998;
  block[3] = &unk_1E56C5FF8;
  block[4] = v0;
  if (qword_1EB2197D0 != -1) {
    dispatch_once(&qword_1EB2197D0, block);
  }
  uint64_t v1 = (void *)qword_1EB2197C8;
  return v1;
}

uint64_t sub_190C4D998()
{
  qword_1EB2197C8 = objc_opt_new();
  return MEMORY[0x1F41817F8]();
}

void sub_190C4DA84(uint64_t a1)
{
  if (a1 && !*(void *)(a1 + 224))
  {
    id v2 = objc_alloc(MEMORY[0x1E4F29268]);
    id v4 = (id)objc_msgSend_initWithMachServiceName_options_(v2, v3, @"com.apple.mobile.keybagd.UserManager.xpc", 0);
    sub_190C50424((id *)a1, v4, 1);
  }
}

void sub_190C4DB0C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  if (a1)
  {
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));

    if (!WeakRetained)
    {
      sub_190C3E6E4((uint64_t)UMAbort, @"You must have a stakeholder registered", v10, v11, v12, v13, v14, v15, a9);
    }
  }
}

void sub_190C4DB6C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  if (a1)
  {
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
    if (!WeakRetained || (uint64_t v17 = *(void *)(a1 + 40), WeakRetained, v17 != 3))
    {
      sub_190C3E6E4((uint64_t)UMAbort, @"You must have a sync stakeholder registered", v11, v12, v13, v14, v15, v16, a9);
    }
  }
}

void sub_190C4DCBC(uint64_t a1, void *a2)
{
  self = a2;
  if (self)
  {
    self[5] = 1;
    objc_setProperty_nonatomic_copy(self, v3, *(id *)(a1 + 40), 128);
  }
  sub_190C4DD48((uint64_t)self, *(void **)(a1 + 32));
}

uint64_t sub_190C4DD28(uint64_t result, uint64_t a2)
{
  if (result) {
    *(void *)(result + 40) = a2;
  }
  return result;
}

void sub_190C4DD34(void *a1, char *newValue)
{
  if (a1) {
    objc_setProperty_nonatomic_copy(a1, newValue, newValue, 128);
  }
}

void sub_190C4DD48(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (a1)
  {
    id obj = v3;
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));

    if (WeakRetained) {
      sub_190C3E6E4((uint64_t)UMAbort, @"There is already a registered stakeholder", v5, v6, v7, v8, v9, v10, v11);
    }
    objc_storeWeak((id *)(a1 + 32), obj);
    sub_190C4F1CC(a1, 2, 0);
    id v3 = obj;
  }
}

void sub_190C4DE9C(uint64_t a1, uint64_t a2)
{
  if (a2) {
    *(void *)(a2 + 40) = 2;
  }
  sub_190C4DD48(a2, *(void **)(a1 + 32));
}

void sub_190C4DF98(uint64_t a1, void *a2)
{
  uint64_t v27 = a2;
  if (sub_190C3F034())
  {
    uint64_t v9 = sub_190C3B80C((uint64_t)UMLogMessage, @"Setting up a listener for mach service", v3, v4, v5, v6, v7, v8, v26);
    sub_190C4CE30((uint64_t)v9, @"name: %@", v10, v11, v12, v13, v14, v15, *(void *)(a1 + 32));
    uint64_t v16 = sub_190C3B928();
    sub_190C3B464((uint64_t)v16, v9);

    id v17 = objc_alloc(MEMORY[0x1E4F29290]);
    uint64_t v19 = objc_msgSend_initWithMachServiceName_(v17, v18, *(void *)(a1 + 32));
    sub_190C4E0C0((uint64_t)v27, v19);

    uint64_t v21 = *(void *)(a1 + 40);
    if (v27)
    {
      objc_msgSend_setDelegate_(v27[30], v20, v21);
      objc_msgSend_resume(v27[30], v22, v23);
    }
    else
    {
      objc_msgSend_setDelegate_(0, v20, v21);
      objc_msgSend_resume(0, v24, v25);
    }
  }
  if (v27) {
    v27[5] = (void *)3;
  }
  sub_190C4E0DC((uint64_t)v27, *(void **)(a1 + 32));
  sub_190C4DD48((uint64_t)v27, *(void **)(a1 + 48));
}

void sub_190C4E0C0(uint64_t a1, void *a2)
{
  if (a1) {
    objc_storeStrong((id *)(a1 + 240), a2);
  }
}

uint64_t sub_190C4E0D0(uint64_t result)
{
  if (result) {
    return *(void *)(result + 240);
  }
  return result;
}

void sub_190C4E0DC(uint64_t a1, void *a2)
{
  if (a1) {
    objc_storeStrong((id *)(a1 + 48), a2);
  }
}

void sub_190C4E1D8(uint64_t a1, void *a2)
{
  uint64_t v33 = a2;
  uint64_t v3 = sub_190C3B928();
  sub_190C49FC4((uint64_t)v3, @"Unregister stakeholder", v4, v5, v6, v7, v8, v9, v31);

  sub_190C4DB0C((uint64_t)v33, v10, v11, v12, v13, v14, v15, v16, v32);
  if (v33)
  {
    id WeakRetained = objc_loadWeakRetained(v33 + 4);
    char isEqual = objc_msgSend_isEqual_(WeakRetained, v19, *(void *)(a1 + 32));
  }
  else
  {
    id WeakRetained = 0;
    char isEqual = objc_msgSend_isEqual_(0, v17, *(void *)(a1 + 32));
  }
  char v21 = isEqual;

  if ((v21 & 1) == 0) {
    sub_190C3E6E4((uint64_t)UMAbort, @"%@ is not the current stakeholder", v22, v23, v24, v25, v26, v27, *(void *)(a1 + 32));
  }
  if (v33)
  {
    v33[7] = *(id *)(a1 + 48);
    sub_190C4E310((uint64_t)v33, *(void **)(a1 + 40));
    sub_190C4F1CC((uint64_t)v33, 3, 0);
    if (v33[5] == (id)3) {
      objc_msgSend_invalidate(v33[30], v28, v29);
    }
    objc_storeWeak(v33 + 4, 0);
    uint64_t v30 = v33;
    v33[5] = 0;
    *((unsigned char *)v33 + 9) = 0;
  }
  else
  {
    sub_190C4E310(0, *(void **)(a1 + 40));
    uint64_t v30 = 0;
  }
}

void sub_190C4E310(uint64_t a1, void *a2)
{
  if (a1) {
    objc_storeStrong((id *)(a1 + 64), a2);
  }
}

void sub_190C4E320(uint64_t a1, uint64_t a2)
{
  if (a1) {
    sub_190C4F1CC(a1, a2, 0);
  }
}

uint64_t sub_190C4E330(uint64_t result, char a2)
{
  if (result) {
    *(unsigned char *)(result + 9) = a2;
  }
  return result;
}

void sub_190C4E404(uint64_t a1, void *a2)
{
  if (a2)
  {
    id v2 = *(void **)(a1 + 32);
    id v4 = a2;
    objc_setProperty_nonatomic_copy(v4, v3, v2, 136);
    sub_190C4F1CC((uint64_t)v4, 1, 0);
  }
}

void sub_190C4E46C(void *a1, char *newValue)
{
  if (a1) {
    objc_setProperty_nonatomic_copy(a1, newValue, newValue, 136);
  }
}

void sub_190C4E53C(uint64_t a1, void *a2)
{
  if (a2)
  {
    id v2 = *(void **)(a1 + 32);
    id v4 = a2;
    objc_setProperty_nonatomic_copy(v4, v3, v2, 160);
    sub_190C4F1CC((uint64_t)v4, 12, 0);
  }
}

void sub_190C4E5A4(void *a1, char *newValue)
{
  if (a1) {
    objc_setProperty_nonatomic_copy(a1, newValue, newValue, 160);
  }
}

void sub_190C4E718(uint64_t a1, void *a2)
{
  self = a2;
  id v4 = sub_190C5C314(*(uint64_t **)(a1 + 32), v3);
  uint64_t v5 = sub_190C411F8((uint64_t)UMMobileKeyBag, *(void **)(a1 + 40));
  sub_190C4E7EC((uint64_t)self, v5);

  sub_190C4E7FC((uint64_t)self, *(void **)(a1 + 48));
  sub_190C4E80C((uint64_t)self, v4);
  sub_190C4E81C((uint64_t)self, *(void **)(a1 + 56));
  if (self)
  {
    objc_setProperty_nonatomic_copy(self, v6, *(id *)(a1 + 64), 136);
    sub_190C4F1CC((uint64_t)self, 0, 0);
  }
}

void sub_190C4E7EC(uint64_t a1, void *a2)
{
  if (a1) {
    objc_storeStrong((id *)(a1 + 72), a2);
  }
}

void sub_190C4E7FC(uint64_t a1, void *a2)
{
  if (a1) {
    objc_storeStrong((id *)(a1 + 80), a2);
  }
}

void sub_190C4E80C(uint64_t a1, void *a2)
{
  if (a1) {
    objc_storeStrong((id *)(a1 + 88), a2);
  }
}

void sub_190C4E81C(uint64_t a1, void *a2)
{
  if (a1) {
    objc_storeStrong((id *)(a1 + 96), a2);
  }
}

void sub_190C4E980(uint64_t a1, void *a2)
{
  self = a2;
  id v4 = sub_190C5C314(*(uint64_t **)(a1 + 32), v3);
  uint64_t v5 = sub_190C411F8((uint64_t)UMMobileKeyBag, *(void **)(a1 + 40));
  sub_190C4E7EC((uint64_t)self, v5);

  sub_190C4E7FC((uint64_t)self, *(void **)(a1 + 48));
  sub_190C4E80C((uint64_t)self, v4);
  sub_190C4E81C((uint64_t)self, *(void **)(a1 + 56));
  if (self)
  {
    objc_setProperty_nonatomic_copy(self, v6, *(id *)(a1 + 64), 152);
    sub_190C4F1CC((uint64_t)self, 13, 0);
  }
}

void sub_190C4EA54(void *a1, char *newValue)
{
  if (a1) {
    objc_setProperty_nonatomic_copy(a1, newValue, newValue, 152);
  }
}

void sub_190C4EB24(uint64_t a1, void *a2)
{
  if (a2)
  {
    id v2 = *(void **)(a1 + 32);
    id v4 = a2;
    objc_setProperty_nonatomic_copy(v4, v3, v2, 168);
    sub_190C4F1CC((uint64_t)v4, 14, 0);
  }
}

void sub_190C4EB8C(void *a1, char *newValue)
{
  if (a1) {
    objc_setProperty_nonatomic_copy(a1, newValue, newValue, 168);
  }
}

void sub_190C4EC5C(uint64_t a1, void *a2)
{
  if (a2)
  {
    id v2 = *(void **)(a1 + 32);
    id v4 = a2;
    objc_setProperty_nonatomic_copy(v4, v3, v2, 144);
    sub_190C4F1CC((uint64_t)v4, 10, 0);
  }
}

void sub_190C4ECC4(void *a1, char *newValue)
{
  if (a1) {
    objc_setProperty_nonatomic_copy(a1, newValue, newValue, 144);
  }
}

void sub_190C4ED38(uint64_t a1, void *a2)
{
  if (a2)
  {
    id v3 = a2;
    objc_setProperty_nonatomic_copy(v3, v2, 0, 144);
    sub_190C4F1CC((uint64_t)v3, 11, 0);
  }
}

void sub_190C4EE50(uint64_t a1, void *a2)
{
  if (a2)
  {
    SEL v2 = *(void **)(a1 + 32);
    id v4 = a2;
    objc_setProperty_nonatomic_copy(v4, v3, v2, 208);
    sub_190C4F1CC((uint64_t)v4, 8, 0);
  }
}

void sub_190C4EEB8(void *a1, char *newValue)
{
  if (a1) {
    objc_setProperty_nonatomic_copy(a1, newValue, newValue, 208);
  }
}

void sub_190C4EF2C(uint64_t a1, void *a2)
{
  if (a2)
  {
    id v3 = a2;
    objc_setProperty_nonatomic_copy(v3, v2, 0, 208);
    sub_190C4F1CC((uint64_t)v3, 9, 0);
  }
}

void sub_190C4EF88(void *a1, void *a2)
{
  id v3 = a2;
  if (a1)
  {
    id v4 = sub_190C3AB40();
    v5[0] = MEMORY[0x1E4F143A8];
    v5[1] = 3221225472;
    v5[2] = sub_190C4F044;
    v5[3] = &unk_1E56C63E8;
    id v6 = v3;
    sub_190C3C78C((uint64_t)v4, a1, v5);
  }
}

void sub_190C4F044(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v45 = v3;
  if (v3) {
    id v4 = (void *)v3[24];
  }
  else {
    id v4 = 0;
  }
  id v5 = v4;
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();
  uint64_t v7 = sub_190C3B928();
  uint64_t v14 = (void *)v7;
  if (isKindOfClass)
  {
    sub_190C49FC4(v7, @"Add user sync task", v8, v9, v10, v11, v12, v13, v41);

    sub_190C4DB6C((uint64_t)v45, v15, v16, v17, v18, v19, v20, v21, v42);
    if (v45) {
      uint64_t v22 = (void *)v45[25];
    }
    else {
      uint64_t v22 = 0;
    }
    id v23 = v22;

    uint64_t v24 = 6;
    id v5 = v23;
    objc_msgSend_addObject_(v23, v25, *(void *)(a1 + 32));
  }
  else
  {
    sub_190C49FC4(v7, @"Add user switch blocking task", v8, v9, v10, v11, v12, v13, v41);

    sub_190C4DB0C((uint64_t)v45, v26, v27, v28, v29, v30, v31, v32, v44);
    uint64_t v24 = 4;
    objc_msgSend_addObject_(v5, v33, *(void *)(a1 + 32));
  }
  if (v45 && *((unsigned char *)v45 + 9))
  {
    uint64_t v34 = sub_190C3B928();
    sub_190C49FC4((uint64_t)v34, @"Already registered stakeholder, so telling server to add task", v35, v36, v37, v38, v39, v40, v43);

    sub_190C4F1CC((uint64_t)v45, v24, *(void **)(a1 + 32));
  }
}

uint64_t sub_190C4F1A0(uint64_t result)
{
  if (result) {
    return *(void *)(result + 192);
  }
  return result;
}

uint64_t sub_190C4F1AC(uint64_t result)
{
  if (result) {
    return *(void *)(result + 200);
  }
  return result;
}

BOOL sub_190C4F1B8(BOOL result)
{
  if (result) {
    return *(unsigned char *)(result + 9) != 0;
  }
  return result;
}

void sub_190C4F1CC(uint64_t a1, uint64_t a2, void *a3)
{
  id v5 = a3;
  if (!a1) {
    goto LABEL_53;
  }
  if ((sub_190C3AB20() & 1) == 0 && a2 && a2 != 15)
  {
    id v23 = sub_190C3C3A4();
    uint64_t v24 = @"_sendXPCMessageToServerOfType not applicable, bailing as its not multiUser";
    goto LABEL_17;
  }
  if (sub_190C3F034())
  {
    id v6 = sub_190C3C3A4();
    uint64_t v13 = sub_190C3B80C((uint64_t)UMLogMessage, @"RD: _sendXPCMessageToServerOfType in sync bubble", v7, v8, v9, v10, v11, v12, v228);
    sub_190C3B464((uint64_t)v6, v13);
  }
  else
  {
    sub_190C4DA84(a1);
  }
  if (!*(void *)(a1 + 224))
  {
    id v23 = sub_190C3C3A4();
    uint64_t v24 = @"no xpc connection to send message to server";
LABEL_17:
    uint64_t v25 = sub_190C3B80C((uint64_t)UMLogMessage, v24, v17, v18, v19, v20, v21, v22, v228);
    sub_190C3B464((uint64_t)v23, v25);

    goto LABEL_53;
  }
  if (qword_1E92A9980 != -1) {
    dispatch_once(&qword_1E92A9980, &unk_1EE0918C0);
  }
  unsigned int v232 = dword_1E92A9978;
  objc_initWeak(location, (id)a1);
  v253[0] = MEMORY[0x1E4F143A8];
  v253[1] = 3221225472;
  v253[2] = sub_190C50AD0;
  v253[3] = &unk_1E56C6518;
  objc_copyWeak(&v254, location);
  v236 = (void *)MEMORY[0x192FD5500](v253);
  v251[0] = MEMORY[0x1E4F143A8];
  v251[1] = 3221225472;
  v251[2] = sub_190C50BBC;
  v251[3] = &unk_1E56C6518;
  objc_copyWeak(&v252, location);
  v235 = (void *)MEMORY[0x192FD5500](v251);
  v249[0] = MEMORY[0x1E4F143A8];
  v249[1] = 3221225472;
  v249[2] = sub_190C50C9C;
  v249[3] = &unk_1E56C6518;
  objc_copyWeak(&v250, location);
  v234 = (void *)MEMORY[0x192FD5500](v249);
  v247[0] = MEMORY[0x1E4F143A8];
  v247[1] = 3221225472;
  v247[2] = sub_190C50D88;
  v247[3] = &unk_1E56C6518;
  objc_copyWeak(&v248, location);
  v233 = (void *)MEMORY[0x192FD5500](v247);
  v245[0] = MEMORY[0x1E4F143A8];
  v245[1] = 3221225472;
  v245[2] = sub_190C50E74;
  v245[3] = &unk_1E56C6540;
  objc_copyWeak(&v246, location);
  uint64_t v14 = (void *)MEMORY[0x192FD5500](v245);
  switch(a2)
  {
    case 0:
      id v230 = v14;
      uint64_t v37 = sub_190C3C3A4();
      sub_190C49FC4((uint64_t)v37, @"Tell server switch to user", v38, v39, v40, v41, v42, v43, v228);

      id v44 = *(id *)(a1 + 224);
      uint64_t v46 = objc_msgSend_remoteObjectProxyWithErrorHandler_(v44, v45, (uint64_t)&unk_1EE091480);
      id v47 = *(id *)(a1 + 72);
      id v48 = *(id *)(a1 + 80);
      id v49 = *(id *)(a1 + 88);
      id v50 = *(id *)(a1 + 96);
      objc_msgSend_switchToUser_passcodeData_context_preferences_pid_completionHandler_(v46, v51, (uint64_t)v47, v48, v49, v50, v232, v236);
      goto LABEL_35;
    case 1:
      uint64_t v52 = v14;
      uint64_t v53 = sub_190C3C3A4();
      sub_190C49FC4((uint64_t)v53, @"Tell server switch to login screen", v54, v55, v56, v57, v58, v59, v228);

      id v60 = *(id *)(a1 + 224);
      v62 = objc_msgSend_remoteObjectProxyWithErrorHandler_(v60, v61, (uint64_t)&unk_1EE0914C0);
      objc_msgSend_switchToLoginUserWithPID_completionHandler_(v62, v63, v232, v236);
      goto LABEL_37;
    case 2:
      id v231 = v14;
      v243[0] = MEMORY[0x1E4F143A8];
      v243[1] = 3221225472;
      v243[2] = sub_190C5127C;
      v243[3] = &unk_1E56C6518;
      objc_copyWeak(&v244, location);
      v64 = (void *)MEMORY[0x192FD5500](v243);
      uint64_t v65 = *(void *)(a1 + 40);
      switch(v65)
      {
        case 1:
          v210 = sub_190C3C3A4();
          sub_190C49FC4((uint64_t)v210, @"Tell server register user switch stakeholder", v211, v212, v213, v214, v215, v216, v228);

          id v66 = *(id *)(a1 + 224);
          uint64_t v73 = objc_msgSend_remoteObjectProxyWithErrorHandler_(v66, v217, (uint64_t)&unk_1EE091540);
          objc_msgSend_registerUserSwitchStakeholderForPID_completionHandler_(v73, v218, v232, v64);
          break;
        case 2:
          v219 = sub_190C3C3A4();
          sub_190C49FC4((uint64_t)v219, @"Tell server register critical user switch stakeholder", v220, v221, v222, v223, v224, v225, v228);

          id v66 = *(id *)(a1 + 224);
          uint64_t v73 = objc_msgSend_remoteObjectProxyWithErrorHandler_(v66, v226, (uint64_t)&unk_1EE091560);
          objc_msgSend_registerCriticalUserSwitchStakeholderForPID_completionHandler_(v73, v227, v232, v64);
          break;
        case 3:
          id v66 = *(id *)(a1 + 48);
          uint64_t v73 = sub_190C3B80C((uint64_t)UMLogMessage, @"Tell server register user sync stakeholder with mach service", v67, v68, v69, v70, v71, v72, v228);
          sub_190C4CE30((uint64_t)v73, @"name: %@", v74, v75, v76, v77, v78, v79, (uint64_t)v66);
          v80 = sub_190C3C3A4();
          sub_190C3B464((uint64_t)v80, v73);

          id v81 = *(id *)(a1 + 224);
          uint64_t v83 = objc_msgSend_remoteObjectProxyWithErrorHandler_(v81, v82, (uint64_t)&unk_1EE091580);
          objc_msgSend_registerUserSyncStakeholderForPID_machServiceName_completionHandler_(v83, v84, v232, v66, v64);

          break;
        default:
          goto LABEL_50;
      }

LABEL_50:
      objc_destroyWeak(&v244);
LABEL_51:
      uint64_t v14 = v231;
LABEL_52:

      objc_destroyWeak(&v246);
      objc_destroyWeak(&v248);

      objc_destroyWeak(&v250);
      objc_destroyWeak(&v252);

      objc_destroyWeak(&v254);
      objc_destroyWeak(location);
      break;
    case 3:
      unint64_t v85 = *(void *)(a1 + 56);
      id v231 = v14;
      if (v85 >= 3) {
        uint64_t v86 = 0;
      }
      else {
        uint64_t v86 = off_1E56C6760[v85];
      }
      id v197 = sub_190C3C3A4();
      sub_190C49FC4((uint64_t)v197, @"Tell server unregister stakeholder, status: %@", v198, v199, v200, v201, v202, v203, (uint64_t)v86);

      id v204 = *(id *)(a1 + 224);
      id v206 = objc_msgSend_remoteObjectProxyWithErrorHandler_(v204, v205, (uint64_t)&unk_1EE0915C0);
      uint64_t v207 = *(void *)(a1 + 56);
      id v208 = *(id *)(a1 + 64);
      objc_msgSend_unregisterStakeholderForPID_status_reason_completionHandler_(v206, v209, v232, v207, v208, &unk_1EE0915E0);

      goto LABEL_51;
    case 4:
    case 5:
    case 6:
    case 7:
      id v230 = v14;
      id v15 = v5;
      v229 = sub_190C44700((uint64_t)UMMobileKeyBag, v15);
      if ((a2 | 2) == 6 && *(unsigned char *)(a1 + 8))
      {
        ++*(void *)(a1 + 216);
        v241[0] = MEMORY[0x1E4F143A8];
        v241[1] = 3221225472;
        v241[2] = sub_190C51A3C;
        v241[3] = &unk_1E56C6518;
        objc_copyWeak(&v242, location);
        uint64_t v16 = (void *)MEMORY[0x192FD5500](v241);
        objc_destroyWeak(&v242);
      }
      else
      {
        uint64_t v16 = &unk_1EE091600;
      }
      switch(a2)
      {
        case 4:
          uint64_t v26 = sub_190C3C3A4();
          uint64_t v32 = sub_190C4D278((uint64_t)UMLogMessage, v15, @"Tell server add user switch blocking task", v27, v28, v29, v30, v31, v228);
          sub_190C3B464((uint64_t)v26, v32);

          id v33 = *(id *)(a1 + 224);
          uint64_t v35 = objc_msgSend_remoteObjectProxyWithErrorHandler_(v33, v34, (uint64_t)&unk_1EE091660);
          objc_msgSend_addUserSwitchBlockingTask_forPID_completionHandler_(v35, v36, (uint64_t)v229, v232, v16);
          goto LABEL_42;
        case 5:
          uint64_t v170 = sub_190C3C3A4();
          uint64_t v176 = sub_190C4D278((uint64_t)UMLogMessage, v15, @"Tell server remove user switch blocking task", v171, v172, v173, v174, v175, v228);
          sub_190C3B464((uint64_t)v170, v176);

          id v33 = *(id *)(a1 + 224);
          uint64_t v35 = objc_msgSend_remoteObjectProxyWithErrorHandler_(v33, v177, (uint64_t)&unk_1EE091680);
          objc_msgSend_removeUserSwitchBlockingTask_forPID_completionHandler_(v35, v178, (uint64_t)v229, v232, v16);
          goto LABEL_42;
        case 6:
          uint64_t v179 = sub_190C3C3A4();
          uint64_t v185 = sub_190C4D278((uint64_t)UMLogMessage, v15, @"Tell server add user sync task", v180, v181, v182, v183, v184, v228);
          sub_190C3B464((uint64_t)v179, v185);

          id v33 = *(id *)(a1 + 224);
          uint64_t v35 = objc_msgSend_remoteObjectProxyWithErrorHandler_(v33, v186, (uint64_t)&unk_1EE0916A0);
          objc_msgSend_addUserSyncTask_forPID_completionHandler_(v35, v187, (uint64_t)v229, v232, v16);
          goto LABEL_42;
        case 7:
          uint64_t v188 = sub_190C3C3A4();
          v194 = sub_190C4D278((uint64_t)UMLogMessage, v15, @"Tell server remove user sync task", v189, v190, v191, v192, v193, v228);
          sub_190C3B464((uint64_t)v188, v194);

          id v33 = *(id *)(a1 + 224);
          uint64_t v35 = objc_msgSend_remoteObjectProxyWithErrorHandler_(v33, v195, (uint64_t)&unk_1EE0916C0);
          objc_msgSend_removeUserSyncTask_forPID_completionHandler_(v35, v196, (uint64_t)v229, v232, v16);
LABEL_42:

          break;
        default:
          break;
      }

      goto LABEL_44;
    case 8:
      id v230 = v14;
      uint64_t v87 = sub_190C3C3A4();
      sub_190C49FC4((uint64_t)v87, @"Tell server terminate sync", v88, v89, v90, v91, v92, v93, v228);

      id v94 = *(id *)(a1 + 224);
      uint64_t v96 = objc_msgSend_remoteObjectProxyWithErrorHandler_(v94, v95, (uint64_t)&unk_1EE0916E0);
      v239[0] = MEMORY[0x1E4F143A8];
      v239[1] = 3221225472;
      v239[2] = sub_190C51E54;
      v239[3] = &unk_1E56C6518;
      objc_copyWeak(&v240, location);
      objc_msgSend_terminateSyncBubbleForPID_completionHandler_(v96, v97, v232, v239);

      objc_destroyWeak(&v240);
      goto LABEL_44;
    case 9:
      uint64_t v52 = v14;
      uint64_t v98 = sub_190C3C3A4();
      sub_190C49FC4((uint64_t)v98, @"Tell server resume sync", v99, v100, v101, v102, v103, v104, v228);

      id v60 = *(id *)(a1 + 224);
      v62 = objc_msgSend_remoteObjectProxyWithErrorHandler_(v60, v105, (uint64_t)&unk_1EE091720);
      objc_msgSend_resumeSyncBubbleForPID_completionHandler_(v62, v106, v232, &unk_1EE091740);
      goto LABEL_37;
    case 10:
      id v230 = v14;
      v107 = sub_190C3C3A4();
      sub_190C49FC4((uint64_t)v107, @"Tell server suspend quotas", v108, v109, v110, v111, v112, v113, v228);

      id v114 = *(id *)(a1 + 144);
      id v115 = *(id *)(a1 + 224);
      id v117 = objc_msgSend_remoteObjectProxyWithErrorHandler_(v115, v116, (uint64_t)&unk_1EE091760);
      v237[0] = MEMORY[0x1E4F143A8];
      v237[1] = 3221225472;
      v237[2] = sub_190C520A4;
      v237[3] = &unk_1E56C62D0;
      id v118 = v114;
      id v238 = v118;
      objc_msgSend_suspendUserQuotaForPID_completionHandler_(v117, v119, v232, v237);

      goto LABEL_44;
    case 11:
      uint64_t v52 = v14;
      uint64_t v120 = sub_190C3C3A4();
      sub_190C49FC4((uint64_t)v120, @"Tell server resume quotas", v121, v122, v123, v124, v125, v126, v228);

      id v60 = *(id *)(a1 + 224);
      v62 = objc_msgSend_remoteObjectProxyWithErrorHandler_(v60, v127, (uint64_t)&unk_1EE091780);
      objc_msgSend_reengageUserQuotaForPID_completionHandler_(v62, v128, v232, &unk_1EE0917A0);
      goto LABEL_37;
    case 12:
      uint64_t v52 = v14;
      v129 = sub_190C3C3A4();
      sub_190C49FC4((uint64_t)v129, @"Tell server Logout to LoginSession Screen", v130, v131, v132, v133, v134, v135, v228);

      id v60 = *(id *)(a1 + 224);
      v62 = objc_msgSend_remoteObjectProxyWithErrorHandler_(v60, v136, (uint64_t)&unk_1EE091500);
      objc_msgSend_logoutToLoginSessionWithPID_completionHandler_(v62, v137, v232, v234);
      goto LABEL_37;
    case 13:
      id v230 = v14;
      uint64_t v138 = sub_190C3C3A4();
      sub_190C49FC4((uint64_t)v138, @"Tell server switch to direct switch to User", v139, v140, v141, v142, v143, v144, v228);

      id v44 = *(id *)(a1 + 224);
      uint64_t v46 = objc_msgSend_remoteObjectProxyWithErrorHandler_(v44, v145, (uint64_t)&unk_1EE0914A0);
      id v47 = *(id *)(a1 + 72);
      id v48 = *(id *)(a1 + 80);
      id v49 = *(id *)(a1 + 88);
      id v50 = *(id *)(a1 + 96);
      objc_msgSend_directSwitchToUser_passcodeData_context_preferences_pid_completionHandler_(v46, v146, (uint64_t)v47, v48, v49, v50, v232, v235);
LABEL_35:

LABEL_44:
      uint64_t v14 = v230;
      goto LABEL_52;
    case 14:
      uint64_t v52 = v14;
      uint64_t v147 = sub_190C3C3A4();
      sub_190C49FC4((uint64_t)v147, @"Tell server switch to checkinLoginUI", v148, v149, v150, v151, v152, v153, v228);

      id v60 = *(id *)(a1 + 224);
      v62 = objc_msgSend_remoteObjectProxyWithErrorHandler_(v60, v154, (uint64_t)&unk_1EE0914E0);
      uint64_t v155 = getpid();
      objc_msgSend_loginUICheckinForPID_completionHandler_(v62, v156, v155, v233);
LABEL_37:

      uint64_t v14 = v52;
      goto LABEL_52;
    case 15:
      uint64_t v157 = v14;
      uint64_t v158 = sub_190C3C3A4();
      sub_190C49FC4((uint64_t)v158, @"Tell server to Provision Device", v159, v160, v161, v162, v163, v164, v228);

      id v165 = *(id *)(a1 + 224);
      uint64_t v167 = objc_msgSend_remoteObjectProxyWithErrorHandler_(v165, v166, (uint64_t)&unk_1EE0917C0);
      id v168 = *(id *)(a1 + 112);
      objc_msgSend_provisionDevice_forPid_completionHandler_(v167, v169, (uint64_t)v168, v232, v157);

      uint64_t v14 = v157;
      goto LABEL_52;
    default:
      goto LABEL_52;
  }
LABEL_53:
}

void sub_190C4FFF8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, id *a13, uint64_t a14, id *location)
{
  objc_destroyWeak(v17);
  objc_destroyWeak(v18);
  objc_destroyWeak(v16);
  objc_destroyWeak(v15);
  objc_destroyWeak(location);
  objc_destroyWeak(a13);
  objc_destroyWeak((id *)(v19 - 112));
  _Unwind_Resume(a1);
}

void sub_190C500B4(void *a1, void *a2)
{
  id v3 = a2;
  if (a1)
  {
    id v4 = sub_190C3AB40();
    v5[0] = MEMORY[0x1E4F143A8];
    v5[1] = 3221225472;
    v5[2] = sub_190C50170;
    v5[3] = &unk_1E56C63E8;
    id v6 = v3;
    sub_190C3C78C((uint64_t)v4, a1, v5);
  }
}

void sub_190C50170(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v45 = v3;
  if (v3) {
    id v4 = (void *)v3[24];
  }
  else {
    id v4 = 0;
  }
  id v5 = v4;
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();
  uint64_t v7 = sub_190C3B928();
  uint64_t v14 = (void *)v7;
  if (isKindOfClass)
  {
    sub_190C49FC4(v7, @"Remove user sync task", v8, v9, v10, v11, v12, v13, v41);

    sub_190C4DB6C((uint64_t)v45, v15, v16, v17, v18, v19, v20, v21, v42);
    if (v45) {
      uint64_t v22 = (void *)v45[25];
    }
    else {
      uint64_t v22 = 0;
    }
    id v23 = v22;

    uint64_t v24 = 7;
    id v5 = v23;
    objc_msgSend_removeObject_(v23, v25, *(void *)(a1 + 32));
  }
  else
  {
    sub_190C49FC4(v7, @"Remove user switch blocking task", v8, v9, v10, v11, v12, v13, v41);

    sub_190C4DB0C((uint64_t)v45, v26, v27, v28, v29, v30, v31, v32, v44);
    uint64_t v24 = 5;
    objc_msgSend_removeObject_(v5, v33, *(void *)(a1 + 32));
  }
  if (v45 && *((unsigned char *)v45 + 9))
  {
    uint64_t v34 = sub_190C3B928();
    sub_190C49FC4((uint64_t)v34, @"Already registered stakeholder, so telling server to remove task", v35, v36, v37, v38, v39, v40, v43);

    sub_190C4F1CC((uint64_t)v45, v24, *(void **)(a1 + 32));
  }
}

uint64_t sub_190C5031C(uint64_t result)
{
  if (result) {
    return *(void *)(result + 224);
  }
  return result;
}

void sub_190C50328(uint64_t a1, void *a2)
{
  id v2 = a2;
  sub_190C3B80C((uint64_t)UMLogMessage, @"Failed to notify usermanagerd that login is complete: ", v3, v4, v5, v6, v7, v8, v16);
  id v17 = (id)objc_claimAutoreleasedReturnValue();
  sub_190C4CE30((uint64_t)v17, @"%@", v9, v10, v11, v12, v13, v14, (uint64_t)v2);

  uint64_t v15 = sub_190C3C3A4();
  sub_190C3B464((uint64_t)v15, v17);
}

uint64_t sub_190C503B8(uint64_t result)
{
  if (result)
  {
    if (qword_1E92A9980 != -1) {
      dispatch_once(&qword_1E92A9980, &unk_1EE0918C0);
    }
    return dword_1E92A9978;
  }
  return result;
}

uint64_t sub_190C50404()
{
  uint64_t result = getpid();
  dword_1E92A9978 = result;
  return result;
}

void sub_190C50424(id *a1, void *a2, int a3)
{
  id v7 = a2;
  if (a1 && !a1[28])
  {
    uint64_t v8 = objc_msgSend_interfaceWithProtocol_(MEMORY[0x1E4F29280], v6, (uint64_t)&unk_1EE0A0610);
    objc_msgSend_setRemoteObjectInterface_(v7, v9, (uint64_t)v8);

    uint64_t v11 = objc_msgSend_interfaceWithProtocol_(MEMORY[0x1E4F29280], v10, (uint64_t)&unk_1EE09DEB0);
    objc_msgSend_setExportedInterface_(v7, v12, (uint64_t)v11);

    objc_msgSend_setExportedObject_(v7, v13, (uint64_t)a1);
    objc_initWeak(&location, a1);
    v23[0] = MEMORY[0x1E4F143A8];
    v23[1] = 3221225472;
    int v23[2] = sub_190C506AC;
    v23[3] = &unk_1E56C64F0;
    objc_copyWeak(&v24, &location);
    objc_msgSend_setInterruptionHandler_(v7, v14, (uint64_t)v23);
    v21[0] = MEMORY[0x1E4F143A8];
    v21[1] = 3221225472;
    v21[2] = sub_190C509D8;
    v21[3] = &unk_1E56C64F0;
    objc_copyWeak(&v22, &location);
    objc_msgSend_setInvalidationHandler_(v7, v15, (uint64_t)v21);
    if (a3 && xpc_user_sessions_enabled())
    {
      xpc_user_sessions_get_foreground_uid();
      uint64_t v20 = objc_msgSend__xpcConnection(v7, v18, v19);
      xpc_connection_set_target_user_session_uid();
    }
    objc_msgSend_resume(v7, v16, v17);
    objc_storeStrong(a1 + 28, a2);
    objc_destroyWeak(&v22);
    objc_destroyWeak(&v24);
    objc_destroyWeak(&location);
  }
}

void sub_190C50678(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,id location)
{
  objc_destroyWeak(v23);
  objc_destroyWeak(v22);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_190C506AC(uint64_t a1)
{
  id v2 = sub_190C3C3A4();
  sub_190C49FC4((uint64_t)v2, @"XPC connection interrupted", v3, v4, v5, v6, v7, v8, v10);

  sub_190C3AB40();
  id v11 = (id)objc_claimAutoreleasedReturnValue();
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  sub_190C3C78C((uint64_t)v11, WeakRetained, &unk_1EE091440);
}

void sub_190C50744(uint64_t a1, void *a2)
{
  id v2 = a2;
  if (v2)
  {
    unsigned int v3 = v2[4];
    if (v3 > 4) {
      goto LABEL_5;
    }
    v2[4] = v3 + 1;
  }
  uint64_t v4 = v2;
  sub_190C507B0((uint64_t)v2);
  id v2 = v4;
LABEL_5:
}

uint64_t sub_190C50798(uint64_t result)
{
  if (result) {
    return *(unsigned int *)(result + 16);
  }
  return result;
}

uint64_t sub_190C507A4(uint64_t result, int a2)
{
  if (result) {
    *(_DWORD *)(result + 16) = a2;
  }
  return result;
}

void sub_190C507B0(uint64_t a1)
{
  if (a1)
  {
    id v2 = sub_190C3C3A4();
    sub_190C49FC4((uint64_t)v2, @"Resend XPC messages", v3, v4, v5, v6, v7, v8, v61);

    *(unsigned char *)(a1 + 9) = 0;
    *(unsigned char *)(a1 + 11) = 0;
    if (*(void *)(a1 + 144))
    {
      uint64_t v9 = sub_190C3B928();
      sub_190C49FC4((uint64_t)v9, @"Quota suspension requested", v10, v11, v12, v13, v14, v15, v62);

      sub_190C4F1CC(a1, 10, 0);
    }
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));

    if (WeakRetained)
    {
      uint64_t v17 = sub_190C3B928();
      sub_190C49FC4((uint64_t)v17, @"We have a stakeholder, so re-register", v18, v19, v20, v21, v22, v23, v62);

      sub_190C4F1CC(a1, 2, 0);
    }
    if (*(void *)(a1 + 208)) {
      sub_190C4F1CC(a1, 8, 0);
    }
    if (*(void *)(a1 + 136))
    {
      uint64_t v24 = *(void *)(a1 + 72);
      uint64_t v25 = sub_190C3B928();
      uint64_t v32 = (void *)v25;
      BOOL v33 = v24 == 0;
      BOOL v34 = v24 == 0;
      if (v33) {
        uint64_t v35 = @"Switch to login user initiated";
      }
      else {
        uint64_t v35 = @"Switch to user initiated";
      }
      sub_190C49FC4(v25, v35, v26, v27, v28, v29, v30, v31, v62);

      sub_190C4F1CC(a1, v34, 0);
    }
    if (*(void *)(a1 + 120) && *(void *)(a1 + 112))
    {
      uint64_t v36 = sub_190C3B928();
      sub_190C49FC4((uint64_t)v36, @"Provision of Device Reinitiated", v37, v38, v39, v40, v41, v42, v62);

      sub_190C4F1CC(a1, 15, 0);
    }
    if (*(void *)(a1 + 160))
    {
      uint64_t v43 = sub_190C3B928();
      sub_190C49FC4((uint64_t)v43, @"logout to Login Session initiated", v44, v45, v46, v47, v48, v49, v62);

      sub_190C4F1CC(a1, 12, 0);
    }
    if (*(void *)(a1 + 152))
    {
      uint64_t v50 = *(void *)(a1 + 72);
      uint64_t v51 = sub_190C3B928();
      uint64_t v58 = (void *)v51;
      if (v50) {
        uint64_t v59 = @"Switch to Direct user initiated";
      }
      else {
        uint64_t v59 = @"Switch to login user initiated";
      }
      if (v50) {
        uint64_t v60 = 13;
      }
      else {
        uint64_t v60 = 1;
      }
      sub_190C49FC4(v51, v59, v52, v53, v54, v55, v56, v57, v62);

      sub_190C4F1CC(a1, v60, 0);
    }
  }
}

void sub_190C509D8(uint64_t a1)
{
  id v2 = sub_190C3C3A4();
  sub_190C49FC4((uint64_t)v2, @"XPC connection invalidated", v3, v4, v5, v6, v7, v8, v10);

  sub_190C3AB40();
  id v11 = (id)objc_claimAutoreleasedReturnValue();
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  sub_190C3C78C((uint64_t)v11, WeakRetained, &unk_1EE091460);
}

void sub_190C50A70(uint64_t a1, const char *a2, uint64_t a3)
{
}

void sub_190C50A78(uint64_t a1, const char *a2, uint64_t a3)
{
  if (a1)
  {
    objc_msgSend_invalidate(*(void **)(a1 + 224), a2, a3);
    uint64_t v4 = *(void **)(a1 + 224);
    *(void *)(a1 + 224) = 0;
  }
}

void sub_190C50AC0(uint64_t a1, void *a2)
{
  if (a1) {
    objc_storeStrong((id *)(a1 + 224), a2);
  }
}

void sub_190C50AD0(uint64_t a1, void *a2)
{
  id v11 = a2;
  sub_190C3E75C((uint64_t)UMAbort, v11, @"switch user");
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  uint64_t v4 = WeakRetained;
  if (WeakRetained) {
    uint64_t v5 = (void *)*((void *)WeakRetained + 17);
  }
  else {
    uint64_t v5 = 0;
  }
  uint64_t v6 = v5;

  if (v6)
  {
    if (v11)
    {
      if (objc_msgSend_code(v11, v7, v8) == 16) {
        unint64_t v9 = 5;
      }
      else {
        unint64_t v9 = 8;
      }
      uint64_t v10 = sub_190C3D158((uint64_t)UMError, v9, v11);
    }
    else
    {
      uint64_t v10 = 0;
    }
    v6[2](v6, v10);
  }
}

uint64_t sub_190C50BB0(uint64_t result)
{
  if (result) {
    return *(void *)(result + 136);
  }
  return result;
}

void sub_190C50BBC(uint64_t a1, void *a2)
{
  id v11 = a2;
  sub_190C3E75C((uint64_t)UMAbort, v11, @"Direct switch user");
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  uint64_t v4 = WeakRetained;
  if (WeakRetained) {
    uint64_t v5 = (void *)*((void *)WeakRetained + 17);
  }
  else {
    uint64_t v5 = 0;
  }
  uint64_t v6 = v5;

  if (v6)
  {
    if (v11)
    {
      if (objc_msgSend_code(v11, v7, v8) == 16) {
        unint64_t v9 = 5;
      }
      else {
        unint64_t v9 = 8;
      }
      uint64_t v10 = sub_190C3D158((uint64_t)UMError, v9, v11);
    }
    else
    {
      uint64_t v10 = 0;
    }
    v6[2](v6, v10);
  }
}

void sub_190C50C9C(uint64_t a1, void *a2)
{
  id v11 = a2;
  sub_190C3E75C((uint64_t)UMAbort, v11, @"Logout to Login Session");
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  uint64_t v4 = WeakRetained;
  if (WeakRetained) {
    uint64_t v5 = (void *)*((void *)WeakRetained + 20);
  }
  else {
    uint64_t v5 = 0;
  }
  uint64_t v6 = v5;

  if (v6)
  {
    if (v11)
    {
      if (objc_msgSend_code(v11, v7, v8) == 16) {
        unint64_t v9 = 5;
      }
      else {
        unint64_t v9 = 8;
      }
      uint64_t v10 = sub_190C3D158((uint64_t)UMError, v9, v11);
    }
    else
    {
      uint64_t v10 = 0;
    }
    v6[2](v6, v10);
  }
}

uint64_t sub_190C50D7C(uint64_t result)
{
  if (result) {
    return *(void *)(result + 160);
  }
  return result;
}

void sub_190C50D88(uint64_t a1, void *a2)
{
  id v11 = a2;
  sub_190C3E75C((uint64_t)UMAbort, v11, @"LoginUI Checkin");
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  uint64_t v4 = WeakRetained;
  if (WeakRetained) {
    uint64_t v5 = (void *)*((void *)WeakRetained + 21);
  }
  else {
    uint64_t v5 = 0;
  }
  uint64_t v6 = v5;

  if (v6)
  {
    if (v11)
    {
      if (objc_msgSend_code(v11, v7, v8) == 16) {
        unint64_t v9 = 5;
      }
      else {
        unint64_t v9 = 8;
      }
      uint64_t v10 = sub_190C3D158((uint64_t)UMError, v9, v11);
    }
    else
    {
      uint64_t v10 = 0;
    }
    v6[2](v6, v10);
  }
}

uint64_t sub_190C50E68(uint64_t result)
{
  if (result) {
    return *(void *)(result + 168);
  }
  return result;
}

void sub_190C50E74(uint64_t a1, void *a2, void *a3)
{
  id v14 = a2;
  id v5 = a3;
  sub_190C3E75C((uint64_t)UMAbort, v5, @"Provisioning of the Device");
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  uint64_t v7 = WeakRetained;
  if (WeakRetained) {
    uint64_t v8 = (void *)*((void *)WeakRetained + 15);
  }
  else {
    uint64_t v8 = 0;
  }
  unint64_t v9 = v8;

  if (v9)
  {
    if (v5)
    {
      if (objc_msgSend_code(v5, v10, v11) == 16) {
        unint64_t v12 = 5;
      }
      else {
        unint64_t v12 = 8;
      }
      uint64_t v13 = sub_190C3D158((uint64_t)UMError, v12, v5);
    }
    else
    {
      uint64_t v13 = 0;
    }
    v9[2](v9, v14, v13);
  }
}

uint64_t sub_190C50F70(uint64_t result)
{
  if (result) {
    return *(void *)(result + 120);
  }
  return result;
}

void sub_190C50F7C(uint64_t a1, void *a2)
{
  id v2 = a2;
  sub_190C3B80C((uint64_t)UMLogMessage, @"Failed to switch to user: ", v3, v4, v5, v6, v7, v8, v16);
  id v17 = (id)objc_claimAutoreleasedReturnValue();
  sub_190C4CE30((uint64_t)v17, @"%@", v9, v10, v11, v12, v13, v14, (uint64_t)v2);

  uint64_t v15 = sub_190C3C3A4();
  sub_190C3B464((uint64_t)v15, v17);
}

uint64_t sub_190C5100C(uint64_t result)
{
  if (result) {
    return *(void *)(result + 72);
  }
  return result;
}

uint64_t sub_190C51018(uint64_t result)
{
  if (result) {
    return *(void *)(result + 80);
  }
  return result;
}

uint64_t sub_190C51024(uint64_t result)
{
  if (result) {
    return *(void *)(result + 88);
  }
  return result;
}

uint64_t sub_190C51030(uint64_t result)
{
  if (result) {
    return *(void *)(result + 96);
  }
  return result;
}

void sub_190C5103C(uint64_t a1, void *a2)
{
  id v2 = a2;
  sub_190C3B80C((uint64_t)UMLogMessage, @"Failed to direct switch to user: ", v3, v4, v5, v6, v7, v8, v16);
  id v17 = (id)objc_claimAutoreleasedReturnValue();
  sub_190C4CE30((uint64_t)v17, @"%@", v9, v10, v11, v12, v13, v14, (uint64_t)v2);

  uint64_t v15 = sub_190C3C3A4();
  sub_190C3B464((uint64_t)v15, v17);
}

void sub_190C510CC(uint64_t a1, void *a2)
{
  id v2 = a2;
  sub_190C3B80C((uint64_t)UMLogMessage, @"Failed to switch to login user: ", v3, v4, v5, v6, v7, v8, v16);
  id v17 = (id)objc_claimAutoreleasedReturnValue();
  sub_190C4CE30((uint64_t)v17, @"%@", v9, v10, v11, v12, v13, v14, (uint64_t)v2);

  uint64_t v15 = sub_190C3C3A4();
  sub_190C3B464((uint64_t)v15, v17);
}

void sub_190C5115C(uint64_t a1, void *a2)
{
  id v2 = a2;
  sub_190C3B80C((uint64_t)UMLogMessage, @"Failed to checkin with LoginUI: ", v3, v4, v5, v6, v7, v8, v16);
  id v17 = (id)objc_claimAutoreleasedReturnValue();
  sub_190C4CE30((uint64_t)v17, @"%@", v9, v10, v11, v12, v13, v14, (uint64_t)v2);

  uint64_t v15 = sub_190C3C3A4();
  sub_190C3B464((uint64_t)v15, v17);
}

void sub_190C511EC(uint64_t a1, void *a2)
{
  id v2 = a2;
  sub_190C3B80C((uint64_t)UMLogMessage, @"Failed to logout to login session: ", v3, v4, v5, v6, v7, v8, v16);
  id v17 = (id)objc_claimAutoreleasedReturnValue();
  sub_190C4CE30((uint64_t)v17, @"%@", v9, v10, v11, v12, v13, v14, (uint64_t)v2);

  uint64_t v15 = sub_190C3C3A4();
  sub_190C3B464((uint64_t)v15, v17);
}

void sub_190C5127C(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (!v3)
  {
    uint64_t v4 = sub_190C3AB40();
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
    sub_190C3C78C((uint64_t)v4, WeakRetained, &unk_1EE091520);
  }
  uint64_t v6 = sub_190C3C52C();
  id v7 = objc_loadWeakRetained((id *)(a1 + 32));
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = sub_190C51680;
  v9[3] = &unk_1E56C63E8;
  id v10 = v3;
  id v8 = v3;
  sub_190C3C78C((uint64_t)v6, v7, v9);
}

void sub_190C5138C(uint64_t a1, void *a2)
{
  uint64_t v65 = *MEMORY[0x1E4F143B8];
  id v2 = a2;
  id v3 = sub_190C49D0C();
  sub_190C49FC4((uint64_t)v3, @"Registered stakeholder successfully", v4, v5, v6, v7, v8, v9, v55);

  if (v2)
  {
    v2[9] = 1;
    id v10 = sub_190C49D0C();
    sub_190C49FC4((uint64_t)v10, @"Will send tasks", v11, v12, v13, v14, v15, v16, v55);

    long long v61 = 0u;
    long long v62 = 0u;
    long long v59 = 0u;
    long long v60 = 0u;
    id v17 = (void *)*((void *)v2 + 24);
  }
  else
  {
    uint64_t v48 = sub_190C49D0C();
    sub_190C49FC4((uint64_t)v48, @"Will send tasks", v49, v50, v51, v52, v53, v54, v55);

    id v17 = 0;
    long long v61 = 0u;
    long long v62 = 0u;
    long long v59 = 0u;
    long long v60 = 0u;
  }
  id v18 = v17;
  uint64_t v20 = objc_msgSend_countByEnumeratingWithState_objects_count_(v18, v19, (uint64_t)&v59, v64, 16);
  if (v20)
  {
    uint64_t v21 = v20;
    uint64_t v22 = *(void *)v60;
    do
    {
      for (uint64_t i = 0; i != v21; ++i)
      {
        if (*(void *)v60 != v22) {
          objc_enumerationMutation(v18);
        }
        sub_190C4F1CC((uint64_t)v2, 4, *(void **)(*((void *)&v59 + 1) + 8 * i));
      }
      uint64_t v21 = objc_msgSend_countByEnumeratingWithState_objects_count_(v18, v24, (uint64_t)&v59, v64, 16);
    }
    while (v21);
  }

  long long v57 = 0u;
  long long v58 = 0u;
  long long v55 = 0u;
  long long v56 = 0u;
  if (v2) {
    uint64_t v25 = (void *)*((void *)v2 + 25);
  }
  else {
    uint64_t v25 = 0;
  }
  id v26 = v25;
  uint64_t v28 = objc_msgSend_countByEnumeratingWithState_objects_count_(v26, v27, (uint64_t)&v55, v63, 16);
  if (v28)
  {
    uint64_t v29 = v28;
    uint64_t v30 = *(void *)v56;
    do
    {
      for (uint64_t j = 0; j != v29; ++j)
      {
        if (*(void *)v56 != v30) {
          objc_enumerationMutation(v26);
        }
        sub_190C4F1CC((uint64_t)v2, 6, *(void **)(*((void *)&v55 + 1) + 8 * j));
      }
      uint64_t v29 = objc_msgSend_countByEnumeratingWithState_objects_count_(v26, v32, (uint64_t)&v55, v63, 16);
    }
    while (v29);
  }

  BOOL v33 = sub_190C49D0C();
  sub_190C49FC4((uint64_t)v33, @"Did send tasks", v34, v35, v36, v37, v38, v39, v55);

  if (v2)
  {
    v2[11] = 1;
    if (*((void *)v2 + 22))
    {
      uint64_t v40 = sub_190C3C3A4();
      sub_190C49FC4((uint64_t)v40, @"Calling stored upload content completion handler", v41, v42, v43, v44, v45, v46, v55);

      (*(void (**)(void))(*((void *)v2 + 22) + 16))();
      objc_setProperty_nonatomic_copy(v2, v47, 0, 176);
    }
  }
}

uint64_t sub_190C51654(uint64_t result, char a2)
{
  if (result) {
    *(unsigned char *)(result + 11) = a2;
  }
  return result;
}

uint64_t sub_190C51660(uint64_t result)
{
  if (result) {
    return *(void *)(result + 176);
  }
  return result;
}

void sub_190C5166C(void *a1, char *newValue)
{
  if (a1) {
    objc_setProperty_nonatomic_copy(a1, newValue, newValue, 176);
  }
}

void sub_190C51680(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = *(void **)(a1 + 32);
  uint64_t v25 = v3;
  if (v4)
  {
    sub_190C3E75C((uint64_t)UMAbort, v4, @"register stakeholder");
    uint64_t v11 = sub_190C3B80C((uint64_t)UMLogMessage, @"Error registering stakeholder", v5, v6, v7, v8, v9, v10, v24);
    sub_190C4CE30((uint64_t)v11, @"error: %@", v12, v13, v14, v15, v16, v17, *(void *)(a1 + 32));
    id v18 = sub_190C3C3A4();
    sub_190C3B464((uint64_t)v18, v11);

    if (objc_msgSend_code(*(void **)(a1 + 32), v19, v20) == 16) {
      unint64_t v21 = 5;
    }
    else {
      unint64_t v21 = 8;
    }
    uint64_t v22 = sub_190C3D158((uint64_t)UMError, v21, *(void **)(a1 + 32));

    id v3 = v25;
    if (!v25) {
      goto LABEL_10;
    }
  }
  else
  {
    uint64_t v22 = 0;
    if (!v3) {
      goto LABEL_10;
    }
  }
  if (v3[16])
  {
    uint64_t v23 = v25;
    if (v25) {
      uint64_t v23 = (void *)v25[16];
    }
    ((void (*)(void *, void *))v23[2])(v23, v22);
  }
LABEL_10:
}

uint64_t sub_190C517B0(uint64_t result)
{
  if (result) {
    return *(void *)(result + 128);
  }
  return result;
}

void sub_190C517BC(uint64_t a1, void *a2)
{
  id v2 = a2;
  sub_190C3B80C((uint64_t)UMLogMessage, @"Failed to register user switch stakeholder: ", v3, v4, v5, v6, v7, v8, v16);
  id v17 = (id)objc_claimAutoreleasedReturnValue();
  sub_190C4CE30((uint64_t)v17, @"%@", v9, v10, v11, v12, v13, v14, (uint64_t)v2);

  uint64_t v15 = sub_190C3C3A4();
  sub_190C3B464((uint64_t)v15, v17);
}

void sub_190C5184C(uint64_t a1, void *a2)
{
  id v2 = a2;
  sub_190C3B80C((uint64_t)UMLogMessage, @"Failed to register user switch critical stakeholder: ", v3, v4, v5, v6, v7, v8, v16);
  id v17 = (id)objc_claimAutoreleasedReturnValue();
  sub_190C4CE30((uint64_t)v17, @"%@", v9, v10, v11, v12, v13, v14, (uint64_t)v2);

  uint64_t v15 = sub_190C3C3A4();
  sub_190C3B464((uint64_t)v15, v17);
}

void sub_190C518DC(uint64_t a1, void *a2)
{
  id v2 = a2;
  sub_190C3B80C((uint64_t)UMLogMessage, @"Failed to register user sync stakeholder mach service: ", v3, v4, v5, v6, v7, v8, v16);
  id v17 = (id)objc_claimAutoreleasedReturnValue();
  sub_190C4CE30((uint64_t)v17, @"%@", v9, v10, v11, v12, v13, v14, (uint64_t)v2);

  uint64_t v15 = sub_190C3C3A4();
  sub_190C3B464((uint64_t)v15, v17);
}

void sub_190C5196C(uint64_t a1, void *a2)
{
  id v2 = a2;
  sub_190C3B80C((uint64_t)UMLogMessage, @"Failed to unregister stakeholder: ", v3, v4, v5, v6, v7, v8, v16);
  id v17 = (id)objc_claimAutoreleasedReturnValue();
  sub_190C4CE30((uint64_t)v17, @"%@", v9, v10, v11, v12, v13, v14, (uint64_t)v2);

  uint64_t v15 = sub_190C3C3A4();
  sub_190C3B464((uint64_t)v15, v17);
}

uint64_t sub_190C519FC(uint64_t result)
{
  if (result) {
    return *(void *)(result + 64);
  }
  return result;
}

BOOL sub_190C51A10(BOOL result)
{
  if (result) {
    return *(unsigned char *)(result + 8) != 0;
  }
  return result;
}

uint64_t sub_190C51A24(uint64_t result)
{
  if (result) {
    return *(void *)(result + 216);
  }
  return result;
}

uint64_t sub_190C51A30(uint64_t result, uint64_t a2)
{
  if (result) {
    *(void *)(result + 216) = a2;
  }
  return result;
}

void sub_190C51A3C(uint64_t a1)
{
  sub_190C3AB40();
  id v3 = (id)objc_claimAutoreleasedReturnValue();
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  sub_190C3C78C((uint64_t)v3, WeakRetained, &unk_1EE091640);
}

void sub_190C51AB0(uint64_t a1, void *a2)
{
  id v20 = a2;
  id v2 = sub_190C3B928();
  sub_190C49FC4((uint64_t)v2, @"Server received added task", v3, v4, v5, v6, v7, v8, v18);

  uint64_t v9 = v20;
  if (v20)
  {
    uint64_t v10 = *((void *)v20 + 27) - 1;
    *((void *)v20 + 27) = v10;
    if (!v10)
    {
      if (*((void *)v20 + 23))
      {
        uint64_t v11 = sub_190C3B928();
        sub_190C49FC4((uint64_t)v11, @"Calling stored will switch completion handler", v12, v13, v14, v15, v16, v17, v19);

        (*(void (**)(void))(*((void *)v20 + 23) + 16))();
        uint64_t v9 = v20;
      }
    }
  }
}

uint64_t sub_190C51B78(uint64_t result)
{
  if (result) {
    return *(void *)(result + 184);
  }
  return result;
}

void sub_190C51B84(uint64_t a1, void *a2)
{
  id v2 = a2;
  sub_190C3B80C((uint64_t)UMLogMessage, @"Failed to add user switch blocking task: ", v3, v4, v5, v6, v7, v8, v16);
  id v17 = (id)objc_claimAutoreleasedReturnValue();
  sub_190C4CE30((uint64_t)v17, @"%@", v9, v10, v11, v12, v13, v14, (uint64_t)v2);

  uint64_t v15 = sub_190C3C3A4();
  sub_190C3B464((uint64_t)v15, v17);
}

void sub_190C51C14(uint64_t a1, void *a2)
{
  id v2 = a2;
  sub_190C3B80C((uint64_t)UMLogMessage, @"Failed to remove user switch blocking task: ", v3, v4, v5, v6, v7, v8, v16);
  id v17 = (id)objc_claimAutoreleasedReturnValue();
  sub_190C4CE30((uint64_t)v17, @"%@", v9, v10, v11, v12, v13, v14, (uint64_t)v2);

  uint64_t v15 = sub_190C3C3A4();
  sub_190C3B464((uint64_t)v15, v17);
}

void sub_190C51CA4(uint64_t a1, void *a2)
{
  id v2 = a2;
  sub_190C3B80C((uint64_t)UMLogMessage, @"Failed to add user sync task: ", v3, v4, v5, v6, v7, v8, v16);
  id v17 = (id)objc_claimAutoreleasedReturnValue();
  sub_190C4CE30((uint64_t)v17, @"%@", v9, v10, v11, v12, v13, v14, (uint64_t)v2);

  uint64_t v15 = sub_190C3C3A4();
  sub_190C3B464((uint64_t)v15, v17);
}

void sub_190C51D34(uint64_t a1, void *a2)
{
  id v2 = a2;
  sub_190C3B80C((uint64_t)UMLogMessage, @"Failed to add user sync task: ", v3, v4, v5, v6, v7, v8, v16);
  id v17 = (id)objc_claimAutoreleasedReturnValue();
  sub_190C4CE30((uint64_t)v17, @"%@", v9, v10, v11, v12, v13, v14, (uint64_t)v2);

  uint64_t v15 = sub_190C3C3A4();
  sub_190C3B464((uint64_t)v15, v17);
}

void sub_190C51DC4(uint64_t a1, void *a2)
{
  id v2 = a2;
  sub_190C3B80C((uint64_t)UMLogMessage, @"Failed to terminate sync: ", v3, v4, v5, v6, v7, v8, v16);
  id v17 = (id)objc_claimAutoreleasedReturnValue();
  sub_190C4CE30((uint64_t)v17, @"%@", v9, v10, v11, v12, v13, v14, (uint64_t)v2);

  uint64_t v15 = sub_190C3C3A4();
  sub_190C3B464((uint64_t)v15, v17);
}

void sub_190C51E54(uint64_t a1, void *a2)
{
  sub_190C3E75C((uint64_t)UMAbort, a2, @"terminate sync");
  sub_190C3C52C();
  id v4 = (id)objc_claimAutoreleasedReturnValue();
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  sub_190C3C78C((uint64_t)v4, WeakRetained, &unk_1EE091700);
}

void sub_190C51EDC(uint64_t a1, void *a2)
{
  id v2 = a2;
  if (v2 && v2[26])
  {
    self = v2;
    (*(void (**)(void))(v2[26] + 16))();
    objc_setProperty_nonatomic_copy(self, v3, 0, 208);
    id v2 = self;
  }
}

uint64_t sub_190C51F68(uint64_t result)
{
  if (result) {
    return *(void *)(result + 208);
  }
  return result;
}

void sub_190C51F74(uint64_t a1, void *a2)
{
  id v2 = a2;
  sub_190C3B80C((uint64_t)UMLogMessage, @"Failed to resume sync: ", v3, v4, v5, v6, v7, v8, v16);
  id v17 = (id)objc_claimAutoreleasedReturnValue();
  sub_190C4CE30((uint64_t)v17, @"%@", v9, v10, v11, v12, v13, v14, (uint64_t)v2);

  uint64_t v15 = sub_190C3C3A4();
  sub_190C3B464((uint64_t)v15, v17);
}

uint64_t sub_190C52008(uint64_t result)
{
  if (result) {
    return *(void *)(result + 144);
  }
  return result;
}

void sub_190C52014(uint64_t a1, void *a2)
{
  id v2 = a2;
  sub_190C3B80C((uint64_t)UMLogMessage, @"Failed to suspend quotas: ", v3, v4, v5, v6, v7, v8, v16);
  id v17 = (id)objc_claimAutoreleasedReturnValue();
  sub_190C4CE30((uint64_t)v17, @"%@", v9, v10, v11, v12, v13, v14, (uint64_t)v2);

  uint64_t v15 = sub_190C3C3A4();
  sub_190C3B464((uint64_t)v15, v17);
}

void sub_190C520A4(uint64_t a1, void *a2)
{
  id v4 = a2;
  sub_190C3E75C((uint64_t)UMAbort, v4, @"suspend quota");
  uint64_t v3 = *(void *)(a1 + 32);
  if (v3) {
    (*(void (**)(uint64_t, id))(v3 + 16))(v3, v4);
  }
}

void sub_190C52118(uint64_t a1, void *a2)
{
  id v2 = a2;
  sub_190C3B80C((uint64_t)UMLogMessage, @"Failed to resume quotas: ", v3, v4, v5, v6, v7, v8, v16);
  id v17 = (id)objc_claimAutoreleasedReturnValue();
  sub_190C4CE30((uint64_t)v17, @"%@", v9, v10, v11, v12, v13, v14, (uint64_t)v2);

  uint64_t v15 = sub_190C3C3A4();
  sub_190C3B464((uint64_t)v15, v17);
}

void sub_190C521A8(uint64_t a1, void *a2)
{
}

void sub_190C521BC(uint64_t a1, void *a2)
{
  id v2 = a2;
  sub_190C3B80C((uint64_t)UMLogMessage, @"Failed to add user switch blocking task: ", v3, v4, v5, v6, v7, v8, v16);
  id v17 = (id)objc_claimAutoreleasedReturnValue();
  sub_190C4CE30((uint64_t)v17, @"%@", v9, v10, v11, v12, v13, v14, (uint64_t)v2);

  uint64_t v15 = sub_190C3C3A4();
  sub_190C3B464((uint64_t)v15, v17);
}

uint64_t sub_190C5224C(uint64_t result)
{
  if (result) {
    return *(void *)(result + 112);
  }
  return result;
}

uint64_t sub_190C52258(uint64_t result)
{
  if (result) {
    return *(void *)(result + 152);
  }
  return result;
}

void sub_190C52264(uint64_t a1, void *a2)
{
  id v10 = a2;
  if (a1)
  {
    uint64_t v3 = sub_190C3AB40();
    sub_190C3C78C((uint64_t)v3, (void *)a1, &unk_1EE0917E0);

    uint64_t v4 = *(void *)(a1 + 40);
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
    uint64_t v8 = WeakRetained;
    if (v4 == 2) {
      objc_msgSend_willSwitchToUser_(WeakRetained, v6, (uint64_t)v10);
    }
    else {
      objc_msgSend_willSwitchUser(WeakRetained, v6, v7);
    }

    uint64_t v9 = sub_190C3AB40();
    sub_190C3C78C((uint64_t)v9, (void *)a1, &unk_1EE091800);

    *(unsigned char *)(a1 + 10) = 1;
  }
}

void sub_190C52334(uint64_t a1, uint64_t a2)
{
  if (a2) {
    *(unsigned char *)(a2 + 8) = 1;
  }
}

uint64_t sub_190C52344(uint64_t result, char a2)
{
  if (result) {
    *(unsigned char *)(result + 8) = a2;
  }
  return result;
}

void sub_190C52350(uint64_t a1, uint64_t a2)
{
  if (a2) {
    *(unsigned char *)(a2 + 8) = 0;
  }
}

uint64_t sub_190C5235C(uint64_t result, char a2)
{
  if (result) {
    *(unsigned char *)(result + 10) = a2;
  }
  return result;
}

uint64_t sub_190C52368(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = (uint64_t)v3;
  if (a1)
  {
    if (!*(unsigned char *)(a1 + 10))
    {
      uint64_t v16 = (uint64_t)v3;
      sub_190C52264(a1, v3);
      uint64_t v4 = v16;
    }
    if (*(void *)(a1 + 40) == 2)
    {
      uint64_t v17 = v4;
      uint64_t v5 = sub_190C3C3A4();
      sub_190C49FC4((uint64_t)v5, @"readyToSwitchToUser", v6, v7, v8, v9, v10, v11, v15);

      id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
      objc_msgSend_readyToSwitchToUser_(WeakRetained, v13, v17);

      uint64_t v4 = v17;
    }
  }
  return MEMORY[0x1F41817F8](v3, v4);
}

BOOL sub_190C52414(BOOL result)
{
  if (result) {
    return *(unsigned char *)(result + 10) != 0;
  }
  return result;
}

uint64_t sub_190C52428(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = (uint64_t)v3;
  if (a1)
  {
    if (!*(unsigned char *)(a1 + 10))
    {
      uint64_t v16 = (uint64_t)v3;
      sub_190C52264(a1, v3);
      uint64_t v4 = v16;
    }
    if (*(void *)(a1 + 40) == 2)
    {
      uint64_t v17 = v4;
      uint64_t v5 = sub_190C3C3A4();
      sub_190C49FC4((uint64_t)v5, @"readyToSwitchToLoginSession", v6, v7, v8, v9, v10, v11, v15);

      id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
      objc_msgSend_readyToSwitchToLoginSession_(WeakRetained, v13, v17);

      uint64_t v4 = v17;
    }
  }
  return MEMORY[0x1F41817F8](v3, v4);
}

void sub_190C525B4(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = sub_190C3C3A4();
  sub_190C49FC4((uint64_t)v4, @"Will switch user", v5, v6, v7, v8, v9, v10, v15);

  uint64_t v11 = *(void **)(a1 + 32);
  if (v11)
  {
    uint64_t v12 = sub_190C42C20((uint64_t)UMMobileKeyBag, v11);
  }
  else
  {
    uint64_t v12 = 0;
  }
  sub_190C52264((uint64_t)v3, v12);
  uint64_t v13 = sub_190C3AB40();
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = sub_190C526D0;
  v16[3] = &unk_1E56C6460;
  uint64_t v14 = *(void **)(a1 + 40);
  id v17 = *(id *)(a1 + 48);
  sub_190C3C78C((uint64_t)v13, v14, v16);
}

void sub_190C526D0(uint64_t a1, void *a2)
{
  id v3 = a2;
  self = v3;
  if (v3 && *((void *)v3 + 27))
  {
    uint64_t v4 = sub_190C3B928();
    sub_190C49FC4((uint64_t)v4, @"Waiting on sending added tasks, storing will switch completion handler", v5, v6, v7, v8, v9, v10, v19);

    objc_setProperty_nonatomic_copy(self, v11, *(id *)(a1 + 32), 184);
  }
  else
  {
    uint64_t v12 = sub_190C3B928();
    sub_190C49FC4((uint64_t)v12, @"Not waiting on sending any added tasks, calling will switch completion handler", v13, v14, v15, v16, v17, v18, v19);

    (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  }
}

void sub_190C5278C(void *a1, char *newValue)
{
  if (a1) {
    objc_setProperty_nonatomic_copy(a1, newValue, newValue, 184);
  }
}

void sub_190C52880(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = sub_190C3C3A4();
  sub_190C49FC4((uint64_t)v4, @"Ready to switch user", v5, v6, v7, v8, v9, v10, v15);

  SEL v11 = *(void **)(a1 + 32);
  if (v11)
  {
    uint64_t v12 = sub_190C42C20((uint64_t)UMMobileKeyBag, v11);
  }
  else
  {
    uint64_t v12 = 0;
  }
  sub_190C52368((uint64_t)v3, v12);
  uint64_t v13 = sub_190C3AB40();
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = sub_190C5299C;
  v16[3] = &unk_1E56C6460;
  uint64_t v14 = *(void **)(a1 + 40);
  id v17 = *(id *)(a1 + 48);
  sub_190C3C78C((uint64_t)v13, v14, v16);
}

uint64_t sub_190C5299C(uint64_t a1)
{
  id v2 = sub_190C3B928();
  sub_190C49FC4((uint64_t)v2, @"Calling ready to switch user completion handler", v3, v4, v5, v6, v7, v8, v11);

  uint64_t v9 = *(uint64_t (**)(void))(*(void *)(a1 + 32) + 16);
  return v9();
}

void sub_190C52AD8(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = sub_190C3C3A4();
  sub_190C49FC4((uint64_t)v4, @"Ready to readyToSwitchToLoginSession And Restart Self", v5, v6, v7, v8, v9, v10, v19);

  uint64_t v11 = *(void **)(a1 + 32);
  if (v11)
  {
    sub_190C42C20((uint64_t)UMMobileKeyBag, v11);
    id v21 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v21 = 0;
  }
  uint64_t v12 = sub_190C3C3A4();
  sub_190C49FC4((uint64_t)v12, @"Calling readyToSwitchToLoginSession completion handler", v13, v14, v15, v16, v17, v18, v20);

  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  sub_190C52428((uint64_t)v3, v21);
}

void sub_190C52C80(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = sub_190C3B928();
  sub_190C49FC4((uint64_t)v4, @"User switch task list did update", v5, v6, v7, v8, v9, v10, v16[0]);

  objc_initWeak(&location, v3);
  uint64_t v11 = *(void **)(a1 + 32);
  if (v11) {
    uint64_t v11 = (void *)v11[28];
  }
  uint64_t v12 = v11;
  uint64_t v14 = objc_msgSend_remoteObjectProxyWithErrorHandler_(v12, v13, (uint64_t)&unk_1EE091820);
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = (uint64_t)sub_190C52E40;
  v16[3] = (uint64_t)&unk_1E56C65B8;
  objc_copyWeak(&v17, &location);
  objc_msgSend_fetchUserSwitchBlockingTaskListWithCompletionHandler_(v14, v15, (uint64_t)v16);

  objc_destroyWeak(&v17);
  objc_destroyWeak(&location);
}

void sub_190C52D8C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_190C52DB0(uint64_t a1, void *a2)
{
  id v2 = a2;
  sub_190C3B80C((uint64_t)UMLogMessage, @"Failed to fetch user switch blocking task list: ", v3, v4, v5, v6, v7, v8, v16);
  id v17 = (id)objc_claimAutoreleasedReturnValue();
  sub_190C4CE30((uint64_t)v17, @"%@", v9, v10, v11, v12, v13, v14, (uint64_t)v2);

  uint64_t v15 = sub_190C3C3A4();
  sub_190C3B464((uint64_t)v15, v17);
}

void sub_190C52E40(uint64_t a1, void *a2)
{
  uint64_t v25 = a1;
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  id v2 = a2;
  uint64_t v3 = objc_opt_new();
  long long v28 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  long long v31 = 0u;
  id v4 = v2;
  uint64_t v6 = objc_msgSend_countByEnumeratingWithState_objects_count_(v4, v5, (uint64_t)&v28, v32, 16);
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v29;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v29 != v8) {
          objc_enumerationMutation(v4);
        }
        uint64_t v10 = sub_190C445A4((uint64_t)UMMobileKeyBag, *(void **)(*((void *)&v28 + 1) + 8 * v9));
        uint64_t v13 = objc_msgSend_bundleID(v10, v11, v12);
        uint64_t v15 = objc_msgSend_objectForKeyedSubscript_(v3, v14, (uint64_t)v13);

        if (!v15)
        {
          id v17 = objc_opt_new();
          objc_msgSend_setObject_forKeyedSubscript_(v3, v18, (uint64_t)v17, v13);
        }
        uint64_t v19 = objc_msgSend_objectForKeyedSubscript_(v3, v16, (uint64_t)v13, v25);
        objc_msgSend_addObject_(v19, v20, (uint64_t)v10);

        ++v9;
      }
      while (v7 != v9);
      uint64_t v7 = objc_msgSend_countByEnumeratingWithState_objects_count_(v4, v21, (uint64_t)&v28, v32, 16);
    }
    while (v7);
  }

  uint64_t v22 = sub_190C3C52C();
  id WeakRetained = objc_loadWeakRetained((id *)(v25 + 32));
  v26[0] = MEMORY[0x1E4F143A8];
  v26[1] = 3221225472;
  v26[2] = sub_190C53074;
  v26[3] = &unk_1E56C63E8;
  id v27 = v3;
  id v24 = v3;
  sub_190C3C78C((uint64_t)v22, WeakRetained, v26);
}

void sub_190C53074(uint64_t a1, uint64_t a2)
{
  if (a2) {
    id WeakRetained = objc_loadWeakRetained((id *)(a2 + 32));
  }
  else {
    id WeakRetained = 0;
  }
  id v4 = WeakRetained;
  objc_msgSend_userSwitchBlockingTasksDidUpdate_(WeakRetained, (const char *)a2, *(void *)(a1 + 32));
}

void sub_190C531E4(uint64_t a1, void *a2)
{
  uint64_t v3 = a2;
  id v4 = sub_190C3C3A4();
  sub_190C49FC4((uint64_t)v4, @"Upload content", v5, v6, v7, v8, v9, v10, v25[0]);

  if (v3)
  {
    id WeakRetained = objc_loadWeakRetained(v3 + 4);
    if (WeakRetained)
    {
      id v12 = v3[5];

      if (v12 == (id)3)
      {
        if (*((unsigned char *)v3 + 12))
        {
          uint64_t v13 = sub_190C3C3A4();
          sub_190C49FC4((uint64_t)v13, @"Already called upload content, resending tasks", v14, v15, v16, v17, v18, v19, v25[0]);

          uint64_t v20 = sub_190C3AB40();
          sub_190C3C78C((uint64_t)v20, v3, &unk_1EE091840);
        }
        else
        {
          uint64_t v20 = objc_loadWeakRetained(v3 + 4);
          objc_msgSend_uploadContent(v20, v21, v22);
        }
      }
    }
    *((unsigned char *)v3 + 12) = 1;
  }
  uint64_t v23 = sub_190C3AB40();
  v25[0] = MEMORY[0x1E4F143A8];
  v25[1] = 3221225472;
  int v25[2] = (uint64_t)sub_190C53394;
  v25[3] = (uint64_t)&unk_1E56C6590;
  id v26 = v3;
  id v27 = *(id *)(a1 + 32);
  id v24 = v3;
  sub_190C3C78C((uint64_t)v23, v24, v25);
}

BOOL sub_190C5336C(BOOL result)
{
  if (result) {
    return *(unsigned char *)(result + 12) != 0;
  }
  return result;
}

void sub_190C53380(uint64_t a1, uint64_t a2)
{
}

uint64_t sub_190C53388(uint64_t result, char a2)
{
  if (result) {
    *(unsigned char *)(result + 12) = a2;
  }
  return result;
}

void sub_190C53394(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  if (v2 && *(unsigned char *)(v2 + 11))
  {
    uint64_t v3 = sub_190C3B928();
    sub_190C49FC4((uint64_t)v3, @"Already sent tasks, calling upload content completion handler", v4, v5, v6, v7, v8, v9, v21);

    uint64_t v10 = *(void (**)(void))(*(void *)(a1 + 40) + 16);
    v10();
  }
  else
  {
    uint64_t v11 = sub_190C3B928();
    sub_190C49FC4((uint64_t)v11, @"Have not sent tasks, storing upload content completion handler", v12, v13, v14, v15, v16, v17, v21);

    uint64_t v19 = *(void **)(a1 + 32);
    if (v19)
    {
      uint64_t v20 = *(void **)(a1 + 40);
      objc_setProperty_nonatomic_copy(v19, v18, v20, 176);
    }
  }
}

BOOL sub_190C53460(BOOL result)
{
  if (result) {
    return *(unsigned char *)(result + 11) != 0;
  }
  return result;
}

void sub_190C534D4(uint64_t a1, void *a2)
{
  id v11 = a2;
  uint64_t v2 = sub_190C3C3A4();
  sub_190C49FC4((uint64_t)v2, @"Bubble did pop", v3, v4, v5, v6, v7, v8, v10);

  uint64_t v9 = v11;
  if (v11 && *((void *)v11 + 26))
  {
    (*(void (**)(void))(*((void *)v11 + 26) + 16))();
    uint64_t v9 = v11;
  }
}

void sub_190C53568(uint64_t a1)
{
  if (a1)
  {
    uint64_t v1 = (id *)(a1 + 248);
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 248));

    uint64_t v3 = sub_190C3C3A4();
    id v13 = (id)v3;
    if (WeakRetained)
    {
      sub_190C49FC4(v3, @"calling stakeholder for  personaListDidUpdate", v4, v5, v6, v7, v8, v9, v12);

      id v13 = objc_loadWeakRetained(v1);
      objc_msgSend_personaListDidUpdate(v13, v10, v11);
    }
    else
    {
      sub_190C49FC4(v3, @"NO stakeholder for  personaListDidUpdate", v4, v5, v6, v7, v8, v9, v12);
    }
  }
}

id *sub_190C53608(id *WeakRetained)
{
  if (WeakRetained)
  {
    id WeakRetained = (id *)objc_loadWeakRetained(WeakRetained + 31);
    uint64_t v1 = vars8;
  }
  return WeakRetained;
}

void sub_190C536F4(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = sub_190C3C3A4();
  sub_190C49FC4((uint64_t)v4, @"persona List Did Update", v5, v6, v7, v8, v9, v10, v13);

  sub_190C53568((uint64_t)v3);
  uint64_t v11 = sub_190C3AB40();
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = sub_190C537E0;
  v14[3] = &unk_1E56C6460;
  uint64_t v12 = *(void **)(a1 + 32);
  id v15 = *(id *)(a1 + 40);
  sub_190C3C78C((uint64_t)v11, v12, v14);
}

uint64_t sub_190C537E0(uint64_t a1)
{
  uint64_t v2 = sub_190C3B928();
  sub_190C49FC4((uint64_t)v2, @"Calling personaListDidUpdate completion handler", v3, v4, v5, v6, v7, v8, v11);

  uint64_t v9 = *(uint64_t (**)(void))(*(void *)(a1 + 32) + 16);
  return v9();
}

void sub_190C538FC(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = sub_190C3C3A4();
  sub_190C49FC4((uint64_t)v4, @"persona List Did Update Callback", v5, v6, v7, v8, v9, v10, v13);

  sub_190C53568((uint64_t)v3);
  uint64_t v11 = sub_190C3AB40();
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = sub_190C539E8;
  v14[3] = &unk_1E56C6460;
  uint64_t v12 = *(void **)(a1 + 32);
  id v15 = *(id *)(a1 + 40);
  sub_190C3C78C((uint64_t)v11, v12, v14);
}

uint64_t sub_190C539E8(uint64_t a1)
{
  uint64_t v2 = sub_190C3B928();
  sub_190C49FC4((uint64_t)v2, @"persona Update callback completion handler", v3, v4, v5, v6, v7, v8, v11);

  uint64_t v9 = *(uint64_t (**)(void))(*(void *)(a1 + 32) + 16);
  return v9();
}

void sub_190C53B64(uint64_t a1, void *a2)
{
  uint64_t v11 = a2;
  uint64_t v3 = sub_190C3B928();
  sub_190C49FC4((uint64_t)v3, @"Set up server with connection", v4, v5, v6, v7, v8, v9, v10);

  sub_190C50424(v11, *(void **)(a1 + 32), 0);
  sub_190C507B0((uint64_t)v11);
}

void sub_190C53BE8(uint64_t a1, void *a2, void *a3, uint64_t a4, void *a5)
{
  id v9 = a5;
  if (a1)
  {
    id v10 = a3;
    id v11 = a2;
    sub_190C4DA84(a1);
    uint64_t v12 = *(void **)(a1 + 224);
    v19[0] = MEMORY[0x1E4F143A8];
    v19[1] = 3221225472;
    v19[2] = sub_190C53D00;
    v19[3] = &unk_1E56C62D0;
    id v13 = v9;
    id v20 = v13;
    id v14 = v12;
    uint64_t v16 = objc_msgSend_remoteObjectProxyWithErrorHandler_(v14, v15, (uint64_t)v19);
    uint64_t v17 = getpid();
    objc_msgSend_createPersona_passcodeData_passcodeDataType_forPid_completionHandler_(v16, v18, (uint64_t)v11, v10, a4, v17, v13);
  }
}

void sub_190C53D00(uint64_t a1, void *a2)
{
  id v3 = a2;
  sub_190C3B80C((uint64_t)UMLogMessage, @"Failed creating persona: ", v4, v5, v6, v7, v8, v9, v17);
  id v18 = (id)objc_claimAutoreleasedReturnValue();
  sub_190C4CE30((uint64_t)v18, @"%@", v10, v11, v12, v13, v14, v15, (uint64_t)v3);
  uint64_t v16 = sub_190C3C3A4();
  sub_190C3B464((uint64_t)v16, v18);

  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

void sub_190C53DB4(uint64_t a1, void *a2, uint64_t a3, void *a4)
{
  id v6 = a4;
  if (a1)
  {
    id v7 = a2;
    sub_190C4DA84(a1);
    uint64_t v8 = *(void **)(a1 + 224);
    v15[0] = MEMORY[0x1E4F143A8];
    v15[1] = 3221225472;
    v15[2] = sub_190C53EA8;
    v15[3] = &unk_1E56C62D0;
    id v9 = v6;
    id v16 = v9;
    id v10 = v8;
    uint64_t v12 = objc_msgSend_remoteObjectProxyWithErrorHandler_(v10, v11, (uint64_t)v15);
    uint64_t v13 = getpid();
    objc_msgSend_deletePersona_forPid_completionHandler_(v12, v14, (uint64_t)v7, v13, v9);
  }
}

void sub_190C53EA8(uint64_t a1, void *a2)
{
  id v3 = a2;
  sub_190C3B80C((uint64_t)UMLogMessage, @"Failed to delete persona: ", v4, v5, v6, v7, v8, v9, v17);
  id v18 = (id)objc_claimAutoreleasedReturnValue();
  sub_190C4CE30((uint64_t)v18, @"%@", v10, v11, v12, v13, v14, v15, (uint64_t)v3);
  id v16 = sub_190C3C3A4();
  sub_190C3B464((uint64_t)v16, v18);

  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

void sub_190C53F58(uint64_t a1, void *a2, void *a3)
{
  id v5 = a3;
  if (a1)
  {
    id v6 = a2;
    sub_190C4DA84(a1);
    uint64_t v7 = *(void **)(a1 + 224);
    v14[0] = MEMORY[0x1E4F143A8];
    v14[1] = 3221225472;
    v14[2] = sub_190C5404C;
    v14[3] = &unk_1E56C62D0;
    id v8 = v5;
    id v15 = v8;
    id v9 = v7;
    uint64_t v11 = objc_msgSend_remoteObjectProxyWithErrorHandler_(v9, v10, (uint64_t)v14);
    uint64_t v12 = getpid();
    objc_msgSend_disablePersona_forPid_completionHandler_(v11, v13, (uint64_t)v6, v12, v8);
  }
}

void sub_190C5404C(uint64_t a1, void *a2)
{
  id v3 = a2;
  sub_190C3B80C((uint64_t)UMLogMessage, @"Failed to disable persona: ", v4, v5, v6, v7, v8, v9, v17);
  id v18 = (id)objc_claimAutoreleasedReturnValue();
  sub_190C4CE30((uint64_t)v18, @"%@", v10, v11, v12, v13, v14, v15, (uint64_t)v3);
  id v16 = sub_190C3C3A4();
  sub_190C3B464((uint64_t)v16, v18);

  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

void sub_190C540FC(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (a1)
  {
    sub_190C4DA84(a1);
    uint64_t v4 = *(void **)(a1 + 224);
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    void v11[2] = sub_190C541D4;
    v11[3] = &unk_1E56C62D0;
    id v5 = v3;
    id v12 = v5;
    id v6 = v4;
    uint64_t v8 = objc_msgSend_remoteObjectProxyWithErrorHandler_(v6, v7, (uint64_t)v11);
    uint64_t v9 = getpid();
    objc_msgSend_fetchPersonaListforPid_withCompletionHandler_(v8, v10, v9, v5);
  }
}

void sub_190C541D4(uint64_t a1, void *a2)
{
  id v3 = a2;
  sub_190C3B80C((uint64_t)UMLogMessage, @"Failed to fetch persona list: ", v4, v5, v6, v7, v8, v9, v17);
  id v18 = (id)objc_claimAutoreleasedReturnValue();
  sub_190C4CE30((uint64_t)v18, @"%@", v10, v11, v12, v13, v14, v15, (uint64_t)v3);
  id v16 = sub_190C3C3A4();
  sub_190C3B464((uint64_t)v16, v18);

  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

void sub_190C54288(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (a1)
  {
    sub_190C4DA84(a1);
    uint64_t v4 = *(void **)(a1 + 224);
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    void v11[2] = sub_190C54360;
    v11[3] = &unk_1E56C62D0;
    id v5 = v3;
    id v12 = v5;
    id v6 = v4;
    uint64_t v8 = objc_msgSend_remoteObjectProxyWithErrorHandler_(v6, v7, (uint64_t)v11);
    uint64_t v9 = getpid();
    objc_msgSend_fetchAllUsersPersonaListforPid_withCompletionHandler_(v8, v10, v9, v5);
  }
}

void sub_190C54360(uint64_t a1, void *a2)
{
  id v3 = a2;
  sub_190C3B80C((uint64_t)UMLogMessage, @"Failed to persona list for all users: ", v4, v5, v6, v7, v8, v9, v17);
  id v18 = (id)objc_claimAutoreleasedReturnValue();
  sub_190C4CE30((uint64_t)v18, @"%@", v10, v11, v12, v13, v14, v15, (uint64_t)v3);
  id v16 = sub_190C3C3A4();
  sub_190C3B464((uint64_t)v16, v18);

  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

id sub_190C54414(void *a1, void *a2)
{
  if (a1)
  {
    uint64_t v19 = 0;
    id v20 = &v19;
    uint64_t v21 = 0x3032000000;
    uint64_t v22 = sub_190C39F7C;
    uint64_t v23 = sub_190C39F44;
    id v24 = 0;
    uint64_t v13 = 0;
    uint64_t v14 = &v13;
    uint64_t v15 = 0x3032000000;
    id v16 = sub_190C39F7C;
    uint64_t v17 = sub_190C39F44;
    id v18 = 0;
    if (a2) {
      *a2 = 0;
    }
    id v3 = sub_190C54624(a1);
    v12[0] = MEMORY[0x1E4F143A8];
    v12[1] = 3221225472;
    void v12[2] = sub_190C54860;
    v12[3] = &unk_1E56C6100;
    v12[4] = &v19;
    uint64_t v5 = objc_msgSend_synchronousRemoteObjectProxyWithErrorHandler_(v3, v4, (uint64_t)v12);
    uint64_t v6 = getpid();
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    void v11[2] = sub_190C54900;
    v11[3] = &unk_1E56C6150;
    void v11[4] = &v19;
    v11[5] = &v13;
    objc_msgSend_fetchPersonaListforPid_withCompletionHandler_(v5, v7, v6, v11);

    if (a2)
    {
      uint64_t v8 = (void *)v20[5];
      if (v8) {
        *a2 = v8;
      }
    }
    id v9 = (id)v14[5];

    _Block_object_dispose(&v13, 8);
    _Block_object_dispose(&v19, 8);
  }
  else
  {
    id v9 = 0;
  }
  return v9;
}

void sub_190C54600(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  va_start(va, a13);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v13 - 96), 8);
  _Unwind_Resume(a1);
}

id sub_190C54624(void *a1)
{
  if (a1)
  {
    uint64_t v1 = a1;
    objc_sync_enter(v1);
    if (v1[29])
    {
LABEL_7:
      id v29 = v1[29];
      objc_sync_exit(v1);

      goto LABEL_8;
    }
    id v2 = objc_alloc(MEMORY[0x1E4F29268]);
    uint64_t v4 = objc_msgSend_initWithMachServiceName_options_(v2, v3, @"com.apple.mobile.usermanagerd.xpc", 0);
    id v5 = v1[29];
    v1[29] = (id)v4;

    if (v1[29])
    {
      uint64_t v7 = objc_msgSend_interfaceWithProtocol_(MEMORY[0x1E4F29280], v6, (uint64_t)&unk_1EE0A0670);
      id v8 = v1[29];
      objc_msgSend_setRemoteObjectInterface_(v8, v9, (uint64_t)v7);

      id v10 = v1[29];
      objc_msgSend_setInterruptionHandler_(v10, v11, (uint64_t)&unk_1EE091280);

      id v12 = v1[29];
      objc_msgSend_setInvalidationHandler_(v12, v13, (uint64_t)&unk_1EE0912A0);

      if (xpc_user_sessions_enabled())
      {
        xpc_user_sessions_get_foreground_uid();
        id v14 = v1[29];
        uint64_t v17 = objc_msgSend__xpcConnection(v14, v15, v16);
        xpc_connection_set_target_user_session_uid();
      }
      id v18 = sub_190C3C3A4();
      uint64_t v25 = sub_190C3B80C((uint64_t)UMLogMessage, @"SYNC CONNECTION SETUP", v19, v20, v21, v22, v23, v24, v31);
      sub_190C3B464((uint64_t)v18, v25);

      id v26 = v1[29];
      objc_msgSend_resume(v26, v27, v28);

      goto LABEL_7;
    }
    objc_sync_exit(v1);
  }
  id v29 = 0;
LABEL_8:
  return v29;
}

void sub_190C54848(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_190C54860(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = sub_190C3C3A4();
  uint64_t v11 = sub_190C3B80C((uint64_t)UMLogMessage, @"Failed to fetch persona list: got error from remote proxy: %@", v5, v6, v7, v8, v9, v10, (uint64_t)v3);
  sub_190C3B464((uint64_t)v4, v11);

  uint64_t v12 = *(void *)(*(void *)(a1 + 32) + 8);
  uint64_t v13 = *(void **)(v12 + 40);
  *(void *)(v12 + 40) = v3;
}

void sub_190C54900(uint64_t a1, void *a2, void *a3)
{
  id v25 = a2;
  id v5 = a3;
  if (v5)
  {
    uint64_t v6 = sub_190C3C3A4();
    uint64_t v13 = sub_190C3B80C((uint64_t)UMLogMessage, @"Failed to fetch persona list: %@", v7, v8, v9, v10, v11, v12, *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 40));
    sub_190C3B464((uint64_t)v6, v13);

    id v14 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v15 = *MEMORY[0x1E4F28798];
    uint64_t v18 = objc_msgSend_code(v5, v16, v17);
    uint64_t v20 = objc_msgSend_errorWithDomain_code_userInfo_(v14, v19, v15, v18, 0);
    uint64_t v21 = *(void *)(*(void *)(a1 + 32) + 8);
    uint64_t v22 = *(void **)(v21 + 40);
    *(void *)(v21 + 40) = v20;
  }
  else
  {
    uint64_t v23 = *(void *)(*(void *)(a1 + 40) + 8);
    id v24 = v25;
    uint64_t v22 = *(void **)(v23 + 40);
    *(void *)(v23 + 40) = v24;
  }
}

void sub_190C54A18(uint64_t a1, void *a2, void *a3)
{
  id v5 = a3;
  if (a1)
  {
    id v6 = a2;
    sub_190C4DA84(a1);
    uint64_t v7 = *(void **)(a1 + 224);
    v14[0] = MEMORY[0x1E4F143A8];
    v14[1] = 3221225472;
    v14[2] = sub_190C54B0C;
    v14[3] = &unk_1E56C62D0;
    id v8 = v5;
    id v15 = v8;
    id v9 = v7;
    uint64_t v11 = objc_msgSend_remoteObjectProxyWithErrorHandler_(v9, v10, (uint64_t)v14);
    uint64_t v12 = getpid();
    objc_msgSend_fetchPersona_forPid_completionHandler_(v11, v13, (uint64_t)v6, v12, v8);
  }
}

void sub_190C54B0C(uint64_t a1, void *a2)
{
  id v3 = a2;
  sub_190C3B80C((uint64_t)UMLogMessage, @"Failed to fetch persona: ", v4, v5, v6, v7, v8, v9, v17);
  id v18 = (id)objc_claimAutoreleasedReturnValue();
  sub_190C4CE30((uint64_t)v18, @"%@", v10, v11, v12, v13, v14, v15, (uint64_t)v3);
  uint64_t v16 = sub_190C3C3A4();
  sub_190C3B464((uint64_t)v16, v18);

  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

id sub_190C54BC0(void *a1, void *a2, void *a3)
{
  id v5 = a2;
  if (a1)
  {
    uint64_t v22 = 0;
    uint64_t v23 = &v22;
    uint64_t v24 = 0x3032000000;
    id v25 = sub_190C39F7C;
    id v26 = sub_190C39F44;
    id v27 = 0;
    uint64_t v16 = 0;
    uint64_t v17 = &v16;
    uint64_t v18 = 0x3032000000;
    uint64_t v19 = sub_190C39F7C;
    uint64_t v20 = sub_190C39F44;
    id v21 = 0;
    if (a3) {
      *a3 = 0;
    }
    uint64_t v6 = sub_190C54624(a1);
    v15[0] = MEMORY[0x1E4F143A8];
    v15[1] = 3221225472;
    v15[2] = sub_190C54DF0;
    v15[3] = &unk_1E56C6100;
    void v15[4] = &v22;
    uint64_t v8 = objc_msgSend_synchronousRemoteObjectProxyWithErrorHandler_(v6, v7, (uint64_t)v15);
    uint64_t v9 = getpid();
    v14[0] = MEMORY[0x1E4F143A8];
    v14[1] = 3221225472;
    v14[2] = sub_190C54E90;
    v14[3] = &unk_1E56C6230;
    void v14[4] = &v22;
    void v14[5] = &v16;
    objc_msgSend_fetchPersona_forPid_completionHandler_(v8, v10, (uint64_t)v5, v9, v14);

    if (a3)
    {
      uint64_t v11 = (void *)v23[5];
      if (v11) {
        *a3 = v11;
      }
    }
    id v12 = (id)v17[5];

    _Block_object_dispose(&v16, 8);
    _Block_object_dispose(&v22, 8);
  }
  else
  {
    id v12 = 0;
  }

  return v12;
}

void sub_190C54DCC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  va_start(va, a13);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v13 - 112), 8);
  _Unwind_Resume(a1);
}

void sub_190C54DF0(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = sub_190C3C3A4();
  uint64_t v11 = sub_190C3B80C((uint64_t)UMLogMessage, @"Failed to fetch persona: got error from remote proxy: %@", v5, v6, v7, v8, v9, v10, (uint64_t)v3);
  sub_190C3B464((uint64_t)v4, v11);

  uint64_t v12 = *(void *)(*(void *)(a1 + 32) + 8);
  uint64_t v13 = *(void **)(v12 + 40);
  *(void *)(v12 + 40) = v3;
}

void sub_190C54E90(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v17 = v5;
  if (a3)
  {
    uint64_t v8 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v9 = *MEMORY[0x1E4F28798];
    uint64_t v10 = objc_msgSend_code(a3, v6, v7);
    uint64_t v12 = objc_msgSend_errorWithDomain_code_userInfo_(v8, v11, v9, v10, 0);
    uint64_t v13 = *(void *)(*(void *)(a1 + 32) + 8);
    uint64_t v14 = *(void **)(v13 + 40);
    *(void *)(v13 + 40) = v12;
  }
  else
  {
    uint64_t v15 = *(void *)(*(void *)(a1 + 40) + 8);
    id v16 = v5;
    uint64_t v14 = *(void **)(v15 + 40);
    *(void *)(v15 + 40) = v16;
  }
}

uint64_t sub_190C54F44(void *a1, void *a2)
{
  if (!a1) {
    return 0;
  }
  uint64_t v16 = 0;
  id v17 = &v16;
  uint64_t v18 = 0x3032000000;
  uint64_t v19 = sub_190C39F7C;
  uint64_t v20 = sub_190C39F44;
  id v21 = 0;
  uint64_t v12 = 0;
  uint64_t v13 = &v12;
  uint64_t v14 = 0x2020000000;
  uint64_t v15 = 0;
  if (a2) {
    *a2 = 0;
  }
  id v3 = sub_190C54624(a1);
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  void v11[2] = sub_190C55108;
  v11[3] = &unk_1E56C6100;
  void v11[4] = &v16;
  id v5 = objc_msgSend_synchronousRemoteObjectProxyWithErrorHandler_(v3, v4, (uint64_t)v11);
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = sub_190C5525C;
  v10[3] = &unk_1E56C65E0;
  v10[4] = &v16;
  void v10[5] = &v12;
  objc_msgSend_fetchPersonaGenerationNumberWithCompletionHandler_(v5, v6, (uint64_t)v10);

  if (a2)
  {
    uint64_t v7 = (void *)v17[5];
    if (v7) {
      *a2 = v7;
    }
  }
  uint64_t v8 = v13[3];

  _Block_object_dispose(&v12, 8);
  _Block_object_dispose(&v16, 8);

  return v8;
}

void sub_190C550E4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  va_start(va, a13);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v13 - 96), 8);
  _Unwind_Resume(a1);
}

void sub_190C55108(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (qword_1E92A98C8 != -1) {
    dispatch_once(&qword_1E92A98C8, &unk_1EE091320);
  }
  uint64_t v4 = (id)qword_1E92A9890;
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
  {
    unsigned int v5 = sub_190C3E7E8();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      unsigned int v6 = v5;
    }
    else {
      unsigned int v6 = v5 & 0xFFFFFFFE;
    }
    if (v6)
    {
      uint64_t v7 = (void *)_os_log_send_and_compose_impl();
      if (v7) {
        sub_190C3E7F0();
      }
    }
    else
    {
      uint64_t v7 = 0;
    }
    free(v7);
  }

  uint64_t v8 = *(void *)(*(void *)(a1 + 32) + 8);
  uint64_t v9 = *(void **)(v8 + 40);
  *(void *)(v8 + 40) = v3;
}

void sub_190C5525C(uint64_t a1, uint64_t a2, void *a3)
{
  id v6 = a3;
  if (v6)
  {
    id v7 = v6;
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40), a3);
    id v6 = v7;
  }
  else
  {
    *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = a2;
  }
}

void sub_190C552D8(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (a1)
  {
    sub_190C4DA84(a1);
    uint64_t v4 = *(void **)(a1 + 224);
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    void v11[2] = sub_190C553B0;
    v11[3] = &unk_1E56C62D0;
    id v5 = v3;
    id v12 = v5;
    id v6 = v4;
    uint64_t v8 = objc_msgSend_remoteObjectProxyWithErrorHandler_(v6, v7, (uint64_t)v11);
    uint64_t v9 = getpid();
    objc_msgSend_fetchAsidMapforPid_withCompletionHandler_(v8, v10, v9, v5);
  }
}

void sub_190C553B0(uint64_t a1, void *a2)
{
  id v3 = a2;
  sub_190C3B80C((uint64_t)UMLogMessage, @"Failed to fetch ASID map: ", v4, v5, v6, v7, v8, v9, v17);
  id v18 = (id)objc_claimAutoreleasedReturnValue();
  sub_190C4CE30((uint64_t)v18, @"%@", v10, v11, v12, v13, v14, v15, (uint64_t)v3);
  uint64_t v16 = sub_190C3C3A4();
  sub_190C3B464((uint64_t)v16, v18);

  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

void sub_190C55464(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7 = a4;
  if (a1)
  {
    id v8 = a3;
    id v9 = a2;
    sub_190C4DA84(a1);
    uint64_t v10 = *(void **)(a1 + 224);
    v17[0] = MEMORY[0x1E4F143A8];
    v17[1] = 3221225472;
    v17[2] = sub_190C5556C;
    v17[3] = &unk_1E56C62D0;
    id v11 = v7;
    id v18 = v11;
    id v12 = v10;
    uint64_t v14 = objc_msgSend_remoteObjectProxyWithErrorHandler_(v12, v13, (uint64_t)v17);
    uint64_t v15 = getpid();
    objc_msgSend_setSinglePersonaBundlesIdentifiers_forPersona_forPid_completionHandler_(v14, v16, (uint64_t)v9, v8, v15, v11);
  }
}

void sub_190C5556C(uint64_t a1, void *a2)
{
  id v3 = a2;
  sub_190C3B80C((uint64_t)UMLogMessage, @"Failed to set bundle identifiers: ", v4, v5, v6, v7, v8, v9, v17);
  id v18 = (id)objc_claimAutoreleasedReturnValue();
  sub_190C4CE30((uint64_t)v18, @"%@", v10, v11, v12, v13, v14, v15, (uint64_t)v3);
  uint64_t v16 = sub_190C3C3A4();
  sub_190C3B464((uint64_t)v16, v18);

  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

BOOL sub_190C5561C(void *a1, void *a2, void *a3, void *a4)
{
  v32[1] = *MEMORY[0x1E4F143B8];
  id v7 = a2;
  id v8 = a3;
  uint64_t v10 = v8;
  if (a1)
  {
    uint64_t v25 = 0;
    id v26 = &v25;
    uint64_t v27 = 0x3032000000;
    uint64_t v28 = sub_190C39F7C;
    id v29 = sub_190C39F44;
    id v30 = 0;
    uint64_t v21 = 0;
    uint64_t v22 = &v21;
    uint64_t v23 = 0x2020000000;
    char v24 = 0;
    if (a4) {
      *a4 = 0;
    }
    uint64_t v31 = kUMUserPersonaUniqueStringKey;
    v32[0] = v8;
    uint64_t v11 = objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x1E4F1C9E8], v9, (uint64_t)v32, &v31, 1);
    uint64_t v12 = sub_190C54624(a1);
    v20[0] = MEMORY[0x1E4F143A8];
    v20[1] = 3221225472;
    v20[2] = sub_190C55898;
    v20[3] = &unk_1E56C6100;
    void v20[4] = &v25;
    uint64_t v14 = objc_msgSend_synchronousRemoteObjectProxyWithErrorHandler_(v12, v13, (uint64_t)v20);
    v19[0] = MEMORY[0x1E4F143A8];
    v19[1] = 3221225472;
    v19[2] = sub_190C55938;
    v19[3] = &unk_1E56C61E0;
    void v19[4] = &v25;
    void v19[5] = &v21;
    objc_msgSend_setBundlesIdentifiers_forPersona_completionHandler_(v14, v15, (uint64_t)v7, v11, v19);

    if (a4)
    {
      uint64_t v16 = (void *)v26[5];
      if (v16) {
        *a4 = v16;
      }
    }
    BOOL v17 = *((unsigned char *)v22 + 24) != 0;

    _Block_object_dispose(&v21, 8);
    _Block_object_dispose(&v25, 8);
  }
  else
  {
    BOOL v17 = 0;
  }

  return v17;
}

void sub_190C55868(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, ...)
{
  va_start(va1, a12);
  va_start(va, a12);
  uint64_t v13 = va_arg(va1, void);
  uint64_t v15 = va_arg(va1, void);
  uint64_t v16 = va_arg(va1, void);
  uint64_t v17 = va_arg(va1, void);
  _Block_object_dispose(va, 8);
  _Block_object_dispose(va1, 8);
  _Unwind_Resume(a1);
}

void sub_190C55898(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = sub_190C3C3A4();
  uint64_t v11 = sub_190C3B80C((uint64_t)UMLogMessage, @"Failed to set synchronous bundleIds: got error from remote proxy: %@", v5, v6, v7, v8, v9, v10, (uint64_t)v3);
  sub_190C3B464((uint64_t)v4, v11);

  uint64_t v12 = *(void *)(*(void *)(a1 + 32) + 8);
  uint64_t v13 = *(void **)(v12 + 40);
  *(void *)(v12 + 40) = v3;
}

uint64_t sub_190C55938(uint64_t result, void *a2)
{
  uint64_t v2 = result;
  if (a2)
  {
    id v3 = a2;
    uint64_t v4 = sub_190C3C3A4();
    uint64_t v11 = sub_190C3B80C((uint64_t)UMLogMessage, @"Failed to set synchronous bundleIds: %@", v5, v6, v7, v8, v9, v10, *(void *)(*(void *)(*(void *)(v2 + 32) + 8) + 40));
    sub_190C3B464((uint64_t)v4, v11);

    uint64_t v12 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v13 = *MEMORY[0x1E4F28798];
    uint64_t v16 = objc_msgSend_code(v3, v14, v15);

    *(void *)(*(void *)(*(void *)(v2 + 32) + 8) + 40) = objc_msgSend_errorWithDomain_code_userInfo_(v12, v17, v13, v16, 0);
    return MEMORY[0x1F41817F8]();
  }
  else
  {
    *(unsigned char *)(*(void *)(*(void *)(result + 40) + 8) + 24) = 1;
  }
  return result;
}

void sub_190C55A58(uint64_t a1, void *a2, void *a3)
{
  id v5 = a3;
  if (a1)
  {
    id v6 = a2;
    sub_190C4DA84(a1);
    uint64_t v7 = *(void **)(a1 + 224);
    v14[0] = MEMORY[0x1E4F143A8];
    v14[1] = 3221225472;
    v14[2] = sub_190C55B4C;
    v14[3] = &unk_1E56C62D0;
    id v8 = v5;
    id v15 = v8;
    id v9 = v7;
    uint64_t v11 = objc_msgSend_remoteObjectProxyWithErrorHandler_(v9, v10, (uint64_t)v14);
    uint64_t v12 = getpid();
    objc_msgSend_fetchBundleIdentifiersForPersona_forPid_completionHandler_(v11, v13, (uint64_t)v6, v12, v8);
  }
}

void sub_190C55B4C(uint64_t a1, void *a2)
{
  id v3 = a2;
  sub_190C3B80C((uint64_t)UMLogMessage, @"Failed to fetch bundle identifiers: ", v4, v5, v6, v7, v8, v9, v17);
  id v18 = (id)objc_claimAutoreleasedReturnValue();
  sub_190C4CE30((uint64_t)v18, @"%@", v10, v11, v12, v13, v14, v15, (uint64_t)v3);
  uint64_t v16 = sub_190C3C3A4();
  sub_190C3B464((uint64_t)v16, v18);

  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

void sub_190C55C00(uint64_t a1, void *a2, void *a3)
{
  id v5 = a3;
  if (a1)
  {
    id v6 = a2;
    sub_190C4DA84(a1);
    uint64_t v7 = *(void **)(a1 + 224);
    v14[0] = MEMORY[0x1E4F143A8];
    v14[1] = 3221225472;
    v14[2] = sub_190C55CF4;
    v14[3] = &unk_1E56C62D0;
    id v8 = v5;
    id v15 = v8;
    id v9 = v7;
    uint64_t v11 = objc_msgSend_remoteObjectProxyWithErrorHandler_(v9, v10, (uint64_t)v14);
    uint64_t v12 = getpid();
    objc_msgSend_setMultiPersonaBundlesIdentifiers_forPid_WithcompletionHandler_(v11, v13, (uint64_t)v6, v12, v8);
  }
}

void sub_190C55CF4(uint64_t a1, void *a2)
{
  id v3 = a2;
  sub_190C3B80C((uint64_t)UMLogMessage, @"Failed to set multi-persona bundle identifiers: ", v4, v5, v6, v7, v8, v9, v17);
  id v18 = (id)objc_claimAutoreleasedReturnValue();
  sub_190C4CE30((uint64_t)v18, @"%@", v10, v11, v12, v13, v14, v15, (uint64_t)v3);
  uint64_t v16 = sub_190C3C3A4();
  sub_190C3B464((uint64_t)v16, v18);

  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

void sub_190C55DA4(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (a1)
  {
    sub_190C4DA84(a1);
    uint64_t v4 = *(void **)(a1 + 224);
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    void v11[2] = sub_190C55E7C;
    v11[3] = &unk_1E56C62D0;
    id v5 = v3;
    id v12 = v5;
    id v6 = v4;
    uint64_t v8 = objc_msgSend_remoteObjectProxyWithErrorHandler_(v6, v7, (uint64_t)v11);
    uint64_t v9 = getpid();
    objc_msgSend_fetchMultiPersonaBundleIdentifiersforPid_withCompletionHandler_(v8, v10, v9, v5);
  }
}

void sub_190C55E7C(uint64_t a1, void *a2)
{
  id v3 = a2;
  sub_190C3B80C((uint64_t)UMLogMessage, @"Failed to fetch multi-persona bundle identifiers: ", v4, v5, v6, v7, v8, v9, v17);
  id v18 = (id)objc_claimAutoreleasedReturnValue();
  sub_190C4CE30((uint64_t)v18, @"%@", v10, v11, v12, v13, v14, v15, (uint64_t)v3);
  uint64_t v16 = sub_190C3C3A4();
  sub_190C3B464((uint64_t)v16, v18);

  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

id sub_190C55F30(void *a1, void *a2, void *a3)
{
  v31[1] = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  uint64_t v7 = v5;
  if (a1)
  {
    uint64_t v24 = 0;
    uint64_t v25 = &v24;
    uint64_t v26 = 0x3032000000;
    uint64_t v27 = sub_190C39F7C;
    uint64_t v28 = sub_190C39F44;
    id v29 = 0;
    uint64_t v18 = 0;
    uint64_t v19 = &v18;
    uint64_t v20 = 0x3032000000;
    uint64_t v21 = sub_190C39F7C;
    uint64_t v22 = sub_190C39F44;
    id v23 = 0;
    if (a3) {
      *a3 = 0;
    }
    id v30 = kUMUserPersonaUniqueStringKey;
    v31[0] = v5;
    uint64_t v8 = objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x1E4F1C9E8], v6, (uint64_t)v31, &v30, 1);
    uint64_t v9 = sub_190C54624(a1);
    v17[0] = MEMORY[0x1E4F143A8];
    v17[1] = 3221225472;
    v17[2] = sub_190C561CC;
    v17[3] = &unk_1E56C6100;
    void v17[4] = &v24;
    uint64_t v11 = objc_msgSend_synchronousRemoteObjectProxyWithErrorHandler_(v9, v10, (uint64_t)v17);
    v16[0] = MEMORY[0x1E4F143A8];
    v16[1] = 3221225472;
    v16[2] = sub_190C5626C;
    v16[3] = &unk_1E56C6150;
    uint64_t v16[4] = &v24;
    void v16[5] = &v18;
    objc_msgSend_bundleIdentifiersForPersona_completionHandler_(v11, v12, (uint64_t)v8, v16);

    if (a3)
    {
      uint64_t v13 = (void *)v25[5];
      if (v13) {
        *a3 = v13;
      }
    }
    id v14 = (id)v19[5];

    _Block_object_dispose(&v18, 8);
    _Block_object_dispose(&v24, 8);
  }
  else
  {
    id v14 = 0;
  }

  return v14;
}

void sub_190C5619C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, char a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,char a26)
{
}

void sub_190C561CC(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = sub_190C3C3A4();
  uint64_t v11 = sub_190C3B80C((uint64_t)UMLogMessage, @"Failed to fetch synchronous bundleIDs: got error from remote proxy: %@", v5, v6, v7, v8, v9, v10, (uint64_t)v3);
  sub_190C3B464((uint64_t)v4, v11);

  uint64_t v12 = *(void *)(*(void *)(a1 + 32) + 8);
  uint64_t v13 = *(void **)(v12 + 40);
  *(void *)(v12 + 40) = v3;
}

void sub_190C5626C(uint64_t a1, void *a2, void *a3)
{
  id v25 = a2;
  id v5 = a3;
  if (v5)
  {
    uint64_t v6 = sub_190C3C3A4();
    uint64_t v13 = sub_190C3B80C((uint64_t)UMLogMessage, @"Failed to fetch synchronous bundleIDs: %@", v7, v8, v9, v10, v11, v12, *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 40));
    sub_190C3B464((uint64_t)v6, v13);

    id v14 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v15 = *MEMORY[0x1E4F28798];
    uint64_t v18 = objc_msgSend_code(v5, v16, v17);
    uint64_t v20 = objc_msgSend_errorWithDomain_code_userInfo_(v14, v19, v15, v18, 0);
    uint64_t v21 = *(void *)(*(void *)(a1 + 32) + 8);
    uint64_t v22 = *(void **)(v21 + 40);
    *(void *)(v21 + 40) = v20;
  }
  else
  {
    uint64_t v23 = *(void *)(*(void *)(a1 + 40) + 8);
    id v24 = v25;
    uint64_t v22 = *(void **)(v23 + 40);
    *(void *)(v23 + 40) = v24;
  }
}

id sub_190C56384(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (a1)
  {
    uint64_t v24 = 0;
    id v25 = &v24;
    uint64_t v26 = 0x3032000000;
    uint64_t v27 = sub_190C39F7C;
    uint64_t v28 = sub_190C39F44;
    id v29 = 0;
    sub_190C4DA84(a1);
    v23[0] = MEMORY[0x1E4F143A8];
    v23[1] = 3221225472;
    int v23[2] = sub_190C565A4;
    v23[3] = &unk_1E56C6100;
    void v23[4] = &v24;
    uint64_t v4 = (void *)MEMORY[0x192FD5500](v23);
    id v5 = sub_190C3C3A4();
    uint64_t v12 = sub_190C3B80C((uint64_t)UMLogMessage, @"Registering machservice:%@ with UserManager", v6, v7, v8, v9, v10, v11, (uint64_t)v3);
    sub_190C3B464((uint64_t)v5, v12);

    id v13 = *(id *)(a1 + 224);
    v21[0] = MEMORY[0x1E4F143A8];
    v21[1] = 3221225472;
    v21[2] = sub_190C56678;
    v21[3] = &unk_1E56C62D0;
    id v14 = v4;
    id v22 = v14;
    uint64_t v16 = objc_msgSend_synchronousRemoteObjectProxyWithErrorHandler_(v13, v15, (uint64_t)v21);
    uint64_t v17 = getpid();
    objc_msgSend_registerUserPersonaObserverForPID_withMachServiceName_completionHandler_(v16, v18, v17, v3, v14);

    id v19 = (id)v25[5];
    _Block_object_dispose(&v24, 8);
  }
  else
  {
    id v19 = 0;
  }

  return v19;
}

void sub_190C56588(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  va_start(va, a13);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_190C565A4(uint64_t a1, void *a2, uint64_t a3)
{
  if (a2)
  {
    uint64_t v4 = objc_msgSend_copy(a2, (const char *)a2, a3);
    uint64_t v5 = *(void *)(*(void *)(a1 + 32) + 8);
    uint64_t v6 = *(void **)(v5 + 40);
    *(void *)(v5 + 40) = v4;

    sub_190C3C3A4();
    id v21 = (id)objc_claimAutoreleasedReturnValue();
    sub_190C3B80C((uint64_t)UMLogMessage, @"registerUserPersonaObserverForPID returned with error:%@", v7, v8, v9, v10, v11, v12, *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 40));
  }
  else
  {
    sub_190C3B928();
    id v21 = (id)objc_claimAutoreleasedReturnValue();
    sub_190C3B80C((uint64_t)UMLogMessage, @"registerUserPersonaObserverForPID Successful", v13, v14, v15, v16, v17, v18, v20);
  id v19 = };
  sub_190C3B464((uint64_t)v21, v19);
}

uint64_t sub_190C56678(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void sub_190C56688(uint64_t a1)
{
  if (a1)
  {
    uint64_t v2 = sub_190C3B928();
    uint64_t v9 = sub_190C3B80C((uint64_t)UMLogMessage, @"launchPersonaCallback", v3, v4, v5, v6, v7, v8, v22);
    sub_190C3B464((uint64_t)v2, v9);

    uint64_t v10 = (id *)(a1 + 248);
    id WeakRetained = objc_loadWeakRetained(v10);

    if (WeakRetained)
    {
      uint64_t v12 = sub_190C3B928();
      id v19 = sub_190C3B80C((uint64_t)UMLogMessage, @"calling personaStakeholder", v13, v14, v15, v16, v17, v18, v23);
      sub_190C3B464((uint64_t)v12, v19);

      id v24 = objc_loadWeakRetained(v10);
      objc_msgSend_personaListDidUpdate(v24, v20, v21);
    }
  }
}

id sub_190C56798(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = v6;
  if (a1)
  {
    id v8 = v6;
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 248));

    if (WeakRetained) {
      sub_190C3E6E4((uint64_t)UMAbort, @"There is already a registered stakeholder", v10, v11, v12, v13, v14, v15, v91);
    }
    if (v8) {
      goto LABEL_5;
    }
    uint64_t v34 = sub_190C56B50();
    if (v34)
    {
      uint64_t v36 = v34;
      uint64_t v37 = objc_msgSend_stringWithCString_encoding_(NSString, v35, (uint64_t)v34, 4);
      uint64_t v38 = sub_190C3B928();
      sub_190C3B80C((uint64_t)UMLogMessage, @" bundlename:%@; Cstring:%s",
        v39,
        v40,
        v41,
        v42,
        v43,
        v44,
      uint64_t v45 = (uint64_t)v37);
      sub_190C3B464((uint64_t)v38, v45);

      free(v36);
      if (v37)
      {
        uint64_t v46 = sub_190C3C3A4();
        uint64_t v53 = sub_190C3B80C((uint64_t)UMLogMessage, @"computing bundlename:%@", v47, v48, v49, v50, v51, v52, (uint64_t)v37);
        sub_190C3B464((uint64_t)v46, v53);

        id v8 = (id)objc_msgSend_mutableCopy(v37, v54, v55);
        objc_msgSend_appendString_(v8, v56, @".personaobserver");
        long long v57 = sub_190C3B928();
        v64 = sub_190C3B80C((uint64_t)UMLogMessage, @"computed machservice for callback:%@", v58, v59, v60, v61, v62, v63, (uint64_t)v8);
        sub_190C3B464((uint64_t)v57, v64);

        if (v8)
        {
LABEL_5:
          uint64_t v16 = sub_190C3C3A4();
          uint64_t v23 = sub_190C3B80C((uint64_t)UMLogMessage, @"Setting up XPC listner for %@", v17, v18, v19, v20, v21, v22, (uint64_t)v8);
          sub_190C3B464((uint64_t)v16, v23);

          sub_190C56CC0();
          id v24 = (id *)objc_claimAutoreleasedReturnValue();
          id v25 = sub_190C56DF8(v24, v8, &unk_1EE091260);

          if (!v25)
          {
            uint64_t v26 = sub_190C3B928();
            uint64_t v33 = sub_190C3B80C((uint64_t)UMLogMessage, @"Successful Setting up XPC listner, registering with UMServer", v27, v28, v29, v30, v31, v32, v92);
            sub_190C3B464((uint64_t)v26, v33);

            id v25 = sub_190C56384(a1, v8);
            if (!v25) {
              objc_storeWeak((id *)(a1 + 248), v5);
            }
          }
          goto LABEL_15;
        }
LABEL_14:
        id v81 = sub_190C3C3A4();
        uint64_t v88 = sub_190C3B80C((uint64_t)UMLogMessage, @"Unable to compute machservice name", v82, v83, v84, v85, v86, v87, v94);
        sub_190C3B464((uint64_t)v81, v88);

        id v25 = objc_msgSend_errorWithDomain_code_userInfo_(MEMORY[0x1E4F28C58], v89, *MEMORY[0x1E4F28798], 22, 0);
        id v8 = 0;
LABEL_15:

        goto LABEL_16;
      }
    }
    else
    {
      uint64_t v65 = sub_190C3C3A4();
      uint64_t v72 = sub_190C3B80C((uint64_t)UMLogMessage, @"Unable to find bundleCstring", v66, v67, v68, v69, v70, v71, v91);
      sub_190C3B464((uint64_t)v65, v72);
    }
    uint64_t v73 = sub_190C3C3A4();
    v80 = sub_190C3B80C((uint64_t)UMLogMessage, @"Unable to find bundlename", v74, v75, v76, v77, v78, v79, v93);
    sub_190C3B464((uint64_t)v73, v80);

    goto LABEL_14;
  }
  id v25 = 0;
LABEL_16:

  return v25;
}

char *sub_190C56B50()
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  memset(v7, 0, sizeof(v7));
  task_info_outCnt[0] = 8;
  if (task_info(*MEMORY[0x1E4F14960], 0xFu, (task_info_t)v7, task_info_outCnt))
  {
    if (os_log_type_enabled(0, OS_LOG_TYPE_ERROR)) {
      sub_190C5EB7C();
    }
    return 0;
  }
  getpid();
  *(void *)task_info_outCnt = 0;
  int v2 = csops_audittoken();
  uint64_t v3 = bswap32(task_info_outCnt[1]);
  task_info_outCnt[0] = bswap32(task_info_outCnt[0]);
  task_info_outCnt[1] = v3;
  if ((v2 & 0x80000000) == 0)
  {
    if (!v2) {
      return strndup(v9, v3 - 8);
    }
    return 0;
  }
  if (*__error() != 34) {
    return 0;
  }
  uint64_t v4 = malloc_type_malloc(task_info_outCnt[1], 0xC61E0774uLL);
  int v5 = csops_audittoken();
  uint64_t v6 = bswap32(*((_DWORD *)v4 + 1));
  *(_DWORD *)uint64_t v4 = bswap32(*(_DWORD *)v4);
  *((_DWORD *)v4 + 1) = v6;
  if (v5) {
    uint64_t v0 = 0;
  }
  else {
    uint64_t v0 = strndup((const char *)v4 + 8, v6 - 8);
  }
  free(v4);
  return v0;
}

id sub_190C56CC0()
{
  uint64_t v0 = self;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = sub_190C5A3E8;
  block[3] = &unk_1E56C5FF8;
  block[4] = v0;
  if (qword_1E92A9828 != -1) {
    dispatch_once(&qword_1E92A9828, block);
  }
  uint64_t v1 = (void *)qword_1E92A9830;
  return v1;
}

void sub_190C56D64()
{
  uint64_t v0 = sub_190C3C3A4();
  uint64_t v7 = sub_190C3B80C((uint64_t)UMLogMessage, @"Persona Observer machservice Callback", v1, v2, v3, v4, v5, v6, v8);
  sub_190C3B464((uint64_t)v0, v7);

  sub_190C4D8F4();
  id v9 = (id)objc_claimAutoreleasedReturnValue();
  sub_190C56688((uint64_t)v9);
}

id sub_190C56DF8(id *a1, void *a2, void *a3)
{
  id v6 = a2;
  id v13 = a3;
  if (a1)
  {
    if (v6)
    {
      objc_storeStrong(a1 + 1, a2);
      uint64_t v20 = sub_190C3B80C((uint64_t)UMLogMessage, @"registering personalistener", v14, v15, v16, v17, v18, v19, v42);
      uint64_t v21 = sub_190C3B928();
      sub_190C3B464((uint64_t)v21, v20);

      objc_setProperty_nonatomic_copy(a1, v22, v13, 32);
      id v23 = objc_alloc(MEMORY[0x1E4F29290]);
      uint64_t v25 = objc_msgSend_initWithMachServiceName_(v23, v24, (uint64_t)v6);
      id v26 = a1[3];
      a1[3] = (id)v25;

      objc_msgSend_setDelegate_(a1[3], v27, (uint64_t)a1);
      objc_msgSend_resume(a1[3], v28, v29);
      uint64_t v36 = sub_190C3B80C((uint64_t)UMLogMessage, @"Completed registration of personalistener", v30, v31, v32, v33, v34, v35, v43);

      uint64_t v37 = sub_190C3C3A4();
      sub_190C3B464((uint64_t)v37, v36);

      uint64_t v38 = 0;
    }
    else
    {
      uint64_t v36 = sub_190C3B80C((uint64_t)UMLogMessage, @"nil machserviceName, registration failed", v7, v8, v9, v10, v11, v12, v42);
      uint64_t v39 = sub_190C3C3A4();
      sub_190C3B464((uint64_t)v39, v36);

      uint64_t v38 = objc_msgSend_errorWithDomain_code_userInfo_(MEMORY[0x1E4F28C58], v40, *MEMORY[0x1E4F28798], 22, 0);
    }
  }
  else
  {
    uint64_t v38 = 0;
  }

  return v38;
}

id *sub_190C56FA8(id *result, void *a2)
{
  if (result) {
    return (id *)objc_storeWeak(result + 31, a2);
  }
  return result;
}

void sub_190C56FB8(void *a1, void *a2, void *a3)
{
  if (a1) {
    sub_190C56FCC(a1, a2, 0, a3);
  }
}

void sub_190C56FCC(void *a1, void *a2, void *a3, void *a4)
{
  id v7 = a2;
  id v8 = a3;
  id v9 = a4;
  if (a1)
  {
    uint64_t v10 = sub_190C3AB40();
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    void v11[2] = sub_190C570D0;
    v11[3] = &unk_1E56C6608;
    id v14 = v9;
    id v12 = v7;
    id v13 = v8;
    sub_190C3C78C((uint64_t)v10, a1, v11);
  }
}

void sub_190C570D0(void **a1, void *a2)
{
  id v3 = a2;
  self = v3;
  if (v3)
  {
    objc_setProperty_nonatomic_copy(v3, v4, a1[6], 256);
    id v3 = self;
  }
  uint64_t v5 = sub_190C56798((uint64_t)v3, a1[4], a1[5]);
  id v12 = sub_190C3C3A4();
  if (v5) {
    sub_190C3B80C((uint64_t)UMLogMessage, @"Failed to registerPersonaListUpdateObserver:%@", v6, v7, v8, v9, v10, v11, (uint64_t)v5);
  }
  else {
  id v13 = sub_190C3B80C((uint64_t)UMLogMessage, @"Successful registration of registerPersonaListUpdateObserver", v6, v7, v8, v9, v10, v11, v14);
  }
  sub_190C3B464((uint64_t)v12, v13);

  (*((void (**)(void))a1[6] + 2))();
}

void sub_190C571B4(void *a1, char *newValue)
{
  if (a1) {
    objc_setProperty_nonatomic_copy(a1, newValue, newValue, 256);
  }
}

void sub_190C571C8(void *a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  if (a1)
  {
    uint64_t v7 = sub_190C3AB40();
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = sub_190C572A4;
    v8[3] = &unk_1E56C6590;
    id v9 = v5;
    id v10 = v6;
    sub_190C3C78C((uint64_t)v7, a1, v8);
  }
}

void sub_190C572A4(uint64_t a1, void *a2)
{
  self = a2;
  sub_190C57318((uint64_t)self, *(void **)(a1 + 32));
  if (self)
  {
    objc_setProperty_nonatomic_copy(self, v3, *(id *)(a1 + 40), 120);
    sub_190C4F1CC((uint64_t)self, 15, 0);
  }
}

void sub_190C57318(uint64_t a1, void *a2)
{
  if (a1) {
    objc_storeStrong((id *)(a1 + 112), a2);
  }
}

void sub_190C57328(void *a1, char *newValue)
{
  if (a1) {
    objc_setProperty_nonatomic_copy(a1, newValue, newValue, 120);
  }
}

void sub_190C5733C(void *a1)
{
  if (a1)
  {
    id obj = a1;
    objc_sync_enter(obj);
    id v1 = obj[29];
    objc_msgSend_invalidate(v1, v2, v3);

    id v4 = obj[29];
    obj[29] = 0;

    id v5 = sub_190C3C3A4();
    id v12 = sub_190C3B80C((uint64_t)UMLogMessage, @"SYNC CONNECTION TEARDOWN", v6, v7, v8, v9, v10, v11, v13);
    sub_190C3B464((uint64_t)v5, v12);

    objc_sync_exit(obj);
  }
}

void sub_190C57408(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id obj)
{
}

uint64_t sub_190C5741C(uint64_t result)
{
  if (result) {
    return *(void *)(result + 232);
  }
  return result;
}

void sub_190C57428(uint64_t a1, void *a2)
{
  if (a1) {
    objc_storeStrong((id *)(a1 + 232), a2);
  }
}

void sub_190C57438()
{
  sub_190C49DF4();
  id v8 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v6 = sub_190C3B80C((uint64_t)UMLogMessage, @"Interruption handler invoked", v0, v1, v2, v3, v4, v5, v7);
  sub_190C3B464((uint64_t)v8, v6);
}

void sub_190C574B0()
{
  uint64_t v0 = sub_190C49DF4();
  uint64_t v7 = sub_190C3B80C((uint64_t)UMLogMessage, @"Invalidation handler invoked, clearing connection", v1, v2, v3, v4, v5, v6, v8);
  sub_190C3B464((uint64_t)v0, v7);

  sub_190C4D8F4();
  id v9 = (id)objc_claimAutoreleasedReturnValue();
  sub_190C5733C(v9);
}

uint64_t sub_190C57544(void *a1, void *a2, uint64_t a3)
{
  id v5 = a2;
  if (a1)
  {
    uint64_t v18 = 0;
    uint64_t v19 = &v18;
    uint64_t v20 = 0x2020000000;
    int v21 = 5;
    uint64_t v6 = sub_190C54624(a1);
    v15[0] = MEMORY[0x1E4F143A8];
    v15[1] = 3221225472;
    v15[2] = sub_190C576D0;
    v15[3] = &unk_1E56C6630;
    id v7 = v5;
    id v16 = v7;
    uint64_t v17 = &v18;
    id v9 = objc_msgSend_synchronousRemoteObjectProxyWithErrorHandler_(v6, v8, (uint64_t)v15);
    uint64_t v10 = getpid();
    v14[0] = MEMORY[0x1E4F143A8];
    v14[1] = 3221225472;
    v14[2] = sub_190C57774;
    v14[3] = &unk_1E56C6100;
    void v14[4] = &v18;
    objc_msgSend_personaLoginWithPid_WithUserODuuid_withUid_completionHandler_(v9, v11, v10, v7, a3, v14);

    uint64_t v12 = *((unsigned int *)v19 + 6);
    _Block_object_dispose(&v18, 8);
  }
  else
  {
    uint64_t v12 = 0;
  }

  return v12;
}

void sub_190C576B8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  va_start(va, a13);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_190C576D0(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = sub_190C3C3A4();
  uint64_t v11 = sub_190C3B80C((uint64_t)UMLogMessage, @"Failed to perform persona login for user %@: got error from remote proxy: %@", v5, v6, v7, v8, v9, v10, *(void *)(a1 + 32));
  sub_190C3B464((uint64_t)v4, v11);

  LODWORD(v4) = objc_msgSend_code(v3, v12, v13);
  *(_DWORD *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = v4;
}

uint64_t sub_190C57774(uint64_t a1, void *a2, uint64_t a3)
{
  if (a2) {
    uint64_t result = objc_msgSend_code(a2, (const char *)a2, a3);
  }
  else {
    uint64_t result = 0;
  }
  *(_DWORD *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  return result;
}

uint64_t sub_190C577B4(void *a1, void *a2, uint64_t a3)
{
  id v5 = a2;
  if (a1)
  {
    uint64_t v18 = 0;
    uint64_t v19 = &v18;
    uint64_t v20 = 0x2020000000;
    int v21 = 5;
    uint64_t v6 = sub_190C54624(a1);
    v15[0] = MEMORY[0x1E4F143A8];
    v15[1] = 3221225472;
    v15[2] = sub_190C57940;
    v15[3] = &unk_1E56C6630;
    id v7 = v5;
    id v16 = v7;
    uint64_t v17 = &v18;
    uint64_t v9 = objc_msgSend_synchronousRemoteObjectProxyWithErrorHandler_(v6, v8, (uint64_t)v15);
    uint64_t v10 = getpid();
    v14[0] = MEMORY[0x1E4F143A8];
    v14[1] = 3221225472;
    v14[2] = sub_190C579E4;
    v14[3] = &unk_1E56C6100;
    void v14[4] = &v18;
    objc_msgSend_personaLogoutWithPid_WithUserODuuid_withUid_completionHandler_(v9, v11, v10, v7, a3, v14);

    uint64_t v12 = *((unsigned int *)v19 + 6);
    _Block_object_dispose(&v18, 8);
  }
  else
  {
    uint64_t v12 = 0;
  }

  return v12;
}

void sub_190C57928(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  va_start(va, a13);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_190C57940(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = sub_190C3C3A4();
  uint64_t v11 = sub_190C3B80C((uint64_t)UMLogMessage, @"Failed to perform persona logout for user %@: got error from remote proxy: %@", v5, v6, v7, v8, v9, v10, *(void *)(a1 + 32));
  sub_190C3B464((uint64_t)v4, v11);

  LODWORD(v4) = objc_msgSend_code(v3, v12, v13);
  *(_DWORD *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = v4;
}

uint64_t sub_190C579E4(uint64_t a1, void *a2, uint64_t a3)
{
  if (a2) {
    uint64_t result = objc_msgSend_code(a2, (const char *)a2, a3);
  }
  else {
    uint64_t result = 0;
  }
  *(_DWORD *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  return result;
}

id sub_190C57A24(void *a1, void *a2)
{
  id v3 = a2;
  if (a1)
  {
    uint64_t v16 = 0;
    uint64_t v17 = &v16;
    uint64_t v18 = 0x3032000000;
    uint64_t v19 = sub_190C39F7C;
    uint64_t v20 = sub_190C39F44;
    id v21 = 0;
    uint64_t v4 = sub_190C54624(a1);
    v14[0] = MEMORY[0x1E4F143A8];
    v14[1] = 3221225472;
    v14[2] = sub_190C57BE4;
    v14[3] = &unk_1E56C6208;
    id v5 = v3;
    id v15 = v5;
    uint64_t v7 = objc_msgSend_synchronousRemoteObjectProxyWithErrorHandler_(v4, v6, (uint64_t)v14);
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    void v11[2] = sub_190C57C80;
    v11[3] = &unk_1E56C6658;
    id v12 = v5;
    uint64_t v13 = &v16;
    objc_msgSend_grantSandboxExtensionForPersonaWithUniqueString_completionHandler_(v7, v8, (uint64_t)v12, v11);

    id v9 = (id)v17[5];
    _Block_object_dispose(&v16, 8);
  }
  else
  {
    id v9 = 0;
  }

  return v9;
}

void sub_190C57BCC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  va_start(va, a13);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_190C57BE4(uint64_t a1, void *a2)
{
  id v3 = a2;
  sub_190C49DF4();
  id v11 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v10 = sub_190C3B80C((uint64_t)UMLogMessage, @"Failed to grant sandbox extension for persona %@: got error from remote proxy: %@", v4, v5, v6, v7, v8, v9, *(void *)(a1 + 32));

  sub_190C3B464((uint64_t)v11, v10);
}

void sub_190C57C80(uint64_t a1, void *a2, void *a3)
{
  id v16 = a2;
  id v5 = a3;
  if (v16)
  {
    uint64_t v6 = *(void *)(*(void *)(a1 + 40) + 8);
    id v7 = v16;
    uint64_t v8 = *(void **)(v6 + 40);
    *(void *)(v6 + 40) = v7;
  }
  else
  {
    uint64_t v8 = sub_190C49DF4();
    id v15 = sub_190C3B80C((uint64_t)UMLogMessage, @"Failed to grant sandbox extension for persona %@: %@", v9, v10, v11, v12, v13, v14, *(void *)(a1 + 32));
    sub_190C3B464((uint64_t)v8, v15);
  }
}

BOOL sub_190C57D48(void *a1, void *a2, void *a3)
{
  id v5 = a2;
  if (a1)
  {
    uint64_t v21 = 0;
    SEL v22 = &v21;
    uint64_t v23 = 0x2020000000;
    char v24 = 0;
    uint64_t v15 = 0;
    id v16 = &v15;
    uint64_t v17 = 0x3032000000;
    uint64_t v18 = sub_190C39F7C;
    uint64_t v19 = sub_190C39F44;
    id v20 = 0;
    uint64_t v6 = sub_190C54624(a1);
    v14[0] = MEMORY[0x1E4F143A8];
    v14[1] = 3221225472;
    v14[2] = sub_190C57F24;
    v14[3] = &unk_1E56C6100;
    void v14[4] = &v15;
    uint64_t v8 = objc_msgSend_synchronousRemoteObjectProxyWithErrorHandler_(v6, v7, (uint64_t)v14);
    v13[0] = MEMORY[0x1E4F143A8];
    v13[1] = 3221225472;
    void v13[2] = sub_190C57FC4;
    v13[3] = &unk_1E56C61E0;
    v13[4] = &v15;
    v13[5] = &v21;
    objc_msgSend_setUserSessionSecureBackupBlob_withReply_(v8, v9, (uint64_t)v5, v13);

    if (a3)
    {
      uint64_t v10 = (void *)v16[5];
      if (v10) {
        *a3 = v10;
      }
    }
    BOOL v11 = *((unsigned char *)v22 + 24) != 0;

    _Block_object_dispose(&v15, 8);
    _Block_object_dispose(&v21, 8);
  }
  else
  {
    BOOL v11 = 0;
  }

  return v11;
}

void sub_190C57F00(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  va_start(va, a13);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v13 - 80), 8);
  _Unwind_Resume(a1);
}

void sub_190C57F24(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = sub_190C3C3A4();
  BOOL v11 = sub_190C3B80C((uint64_t)UMLogMessage, @"Failed to setSecureBackup blob, got error from remote proxy: %@", v5, v6, v7, v8, v9, v10, (uint64_t)v3);
  sub_190C3B464((uint64_t)v4, v11);

  uint64_t v12 = *(void *)(*(void *)(a1 + 32) + 8);
  uint64_t v13 = *(void **)(v12 + 40);
  *(void *)(v12 + 40) = v3;
}

void sub_190C57FC4(uint64_t a1, void *a2)
{
  id v4 = a2;
  if (v4)
  {
    id v5 = v4;
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40), a2);
    id v4 = v5;
  }
  else
  {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 1;
  }
}

id sub_190C58038(void *a1, void *a2)
{
  if (a1)
  {
    uint64_t v18 = 0;
    uint64_t v19 = &v18;
    uint64_t v20 = 0x3032000000;
    uint64_t v21 = sub_190C39F7C;
    SEL v22 = sub_190C39F44;
    id v23 = 0;
    uint64_t v12 = 0;
    uint64_t v13 = &v12;
    uint64_t v14 = 0x3032000000;
    uint64_t v15 = sub_190C39F7C;
    id v16 = sub_190C39F44;
    id v17 = 0;
    id v3 = sub_190C54624(a1);
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    void v11[2] = sub_190C58230;
    v11[3] = &unk_1E56C6100;
    void v11[4] = &v12;
    id v5 = objc_msgSend_synchronousRemoteObjectProxyWithErrorHandler_(v3, v4, (uint64_t)v11);
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = sub_190C582D0;
    v10[3] = &unk_1E56C61B8;
    v10[4] = &v18;
    void v10[5] = &v12;
    objc_msgSend_retrieveUserSessionSecureBackupBlobwithReply_(v5, v6, (uint64_t)v10);

    if (a2)
    {
      uint64_t v7 = (void *)v13[5];
      if (v7) {
        *a2 = v7;
      }
    }
    id v8 = (id)v19[5];

    _Block_object_dispose(&v12, 8);
    _Block_object_dispose(&v18, 8);
  }
  else
  {
    id v8 = 0;
  }
  return v8;
}

void sub_190C5820C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  va_start(va, a13);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v13 - 96), 8);
  _Unwind_Resume(a1);
}

void sub_190C58230(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = sub_190C3C3A4();
  BOOL v11 = sub_190C3B80C((uint64_t)UMLogMessage, @" Failed to retrieve Secure BackupBlob, got error from remote proxy: %@", v5, v6, v7, v8, v9, v10, (uint64_t)v3);
  sub_190C3B464((uint64_t)v4, v11);

  uint64_t v12 = *(void *)(*(void *)(a1 + 32) + 8);
  uint64_t v13 = *(void **)(v12 + 40);
  *(void *)(v12 + 40) = v3;
}

void sub_190C582D0(uint64_t a1, void *a2, void *a3)
{
  id v7 = a2;
  id v6 = a3;
  if (v7) {
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40), a2);
  }
  if (v6) {
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), a3);
  }
}

BOOL sub_190C58364(void *a1, void *a2)
{
  if (!a1) {
    return 0;
  }
  uint64_t v18 = 0;
  uint64_t v19 = &v18;
  uint64_t v20 = 0x2020000000;
  char v21 = 0;
  uint64_t v12 = 0;
  uint64_t v13 = &v12;
  uint64_t v14 = 0x3032000000;
  uint64_t v15 = sub_190C39F7C;
  id v16 = sub_190C39F44;
  id v17 = 0;
  id v3 = sub_190C54624(a1);
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  void v11[2] = sub_190C58528;
  v11[3] = &unk_1E56C6100;
  void v11[4] = &v12;
  uint64_t v5 = objc_msgSend_synchronousRemoteObjectProxyWithErrorHandler_(v3, v4, (uint64_t)v11);
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = sub_190C585C8;
  v10[3] = &unk_1E56C61E0;
  v10[4] = &v12;
  void v10[5] = &v18;
  objc_msgSend_deleteUserSessionSecureBlobwithReply_(v5, v6, (uint64_t)v10);

  if (a2)
  {
    id v7 = (void *)v13[5];
    if (v7) {
      *a2 = v7;
    }
  }
  BOOL v8 = *((unsigned char *)v19 + 24) != 0;

  _Block_object_dispose(&v12, 8);
  _Block_object_dispose(&v18, 8);
  return v8;
}

void sub_190C58504(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  va_start(va, a13);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v13 - 80), 8);
  _Unwind_Resume(a1);
}

void sub_190C58528(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = sub_190C3C3A4();
  BOOL v11 = sub_190C3B80C((uint64_t)UMLogMessage, @"Failed to delete Secure BackupBlob, got error from remote proxy: %@", v5, v6, v7, v8, v9, v10, (uint64_t)v3);
  sub_190C3B464((uint64_t)v4, v11);

  uint64_t v12 = *(void *)(*(void *)(a1 + 32) + 8);
  uint64_t v13 = *(void **)(v12 + 40);
  *(void *)(v12 + 40) = v3;
}

void sub_190C585C8(uint64_t a1, void *a2)
{
  id v4 = a2;
  if (v4)
  {
    id v5 = v4;
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40), a2);
    id v4 = v5;
  }
  else
  {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 1;
  }
}

id sub_190C5863C(void *a1, uint64_t a2, void *a3)
{
  if (a1)
  {
    uint64_t v20 = 0;
    char v21 = &v20;
    uint64_t v22 = 0x3032000000;
    id v23 = sub_190C39F7C;
    char v24 = sub_190C39F44;
    id v25 = 0;
    uint64_t v14 = 0;
    uint64_t v15 = &v14;
    uint64_t v16 = 0x3032000000;
    id v17 = sub_190C39F7C;
    uint64_t v18 = sub_190C39F44;
    id v19 = 0;
    id v5 = sub_190C54624(a1);
    v13[0] = MEMORY[0x1E4F143A8];
    v13[1] = 3221225472;
    void v13[2] = sub_190C58844;
    v13[3] = &unk_1E56C6100;
    v13[4] = &v20;
    uint64_t v7 = objc_msgSend_synchronousRemoteObjectProxyWithErrorHandler_(v5, v6, (uint64_t)v13);
    v12[0] = MEMORY[0x1E4F143A8];
    v12[1] = 3221225472;
    void v12[2] = sub_190C588E4;
    v12[3] = &unk_1E56C6230;
    v12[4] = &v14;
    void v12[5] = &v20;
    objc_msgSend_configureLoginUIWithUserSessionCount_reply_(v7, v8, a2, v12);

    if (a3)
    {
      uint64_t v9 = (void *)v21[5];
      if (v9) {
        *a3 = v9;
      }
    }
    id v10 = (id)v15[5];

    _Block_object_dispose(&v14, 8);
    _Block_object_dispose(&v20, 8);
  }
  else
  {
    id v10 = 0;
  }
  return v10;
}

void sub_190C58820(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  va_start(va, a13);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v13 - 112), 8);
  _Unwind_Resume(a1);
}

void sub_190C58844(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = sub_190C3C3A4();
  BOOL v11 = sub_190C3B80C((uint64_t)UMLogMessage, @"Failed to configure LoginWindow, got error from remote proxy: %@", v5, v6, v7, v8, v9, v10, (uint64_t)v3);
  sub_190C3B464((uint64_t)v4, v11);

  uint64_t v12 = *(void *)(*(void *)(a1 + 32) + 8);
  uint64_t v13 = *(void **)(v12 + 40);
  *(void *)(v12 + 40) = v3;
}

void sub_190C588E4(uint64_t a1, void *a2, void *a3)
{
  id v7 = a2;
  id v6 = a3;
  if (v7) {
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40), a2);
  }
  if (v6) {
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), a3);
  }
}

BOOL sub_190C58978(void *a1, void *a2)
{
  if (!a1) {
    return 0;
  }
  uint64_t v18 = 0;
  id v19 = &v18;
  uint64_t v20 = 0x2020000000;
  char v21 = 0;
  uint64_t v12 = 0;
  uint64_t v13 = &v12;
  uint64_t v14 = 0x3032000000;
  uint64_t v15 = sub_190C39F7C;
  uint64_t v16 = sub_190C39F44;
  id v17 = 0;
  id v3 = sub_190C54624(a1);
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  void v11[2] = sub_190C58B3C;
  v11[3] = &unk_1E56C6100;
  void v11[4] = &v12;
  uint64_t v5 = objc_msgSend_synchronousRemoteObjectProxyWithErrorHandler_(v3, v4, (uint64_t)v11);
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = sub_190C58BDC;
  v10[3] = &unk_1E56C61E0;
  v10[4] = &v12;
  void v10[5] = &v18;
  objc_msgSend_switchToLoginUIUserSessionWithReply_(v5, v6, (uint64_t)v10);

  if (a2)
  {
    id v7 = (void *)v13[5];
    if (v7) {
      *a2 = v7;
    }
  }
  BOOL v8 = *((unsigned char *)v19 + 24) != 0;

  _Block_object_dispose(&v12, 8);
  _Block_object_dispose(&v18, 8);
  return v8;
}

void sub_190C58B18(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  va_start(va, a13);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v13 - 80), 8);
  _Unwind_Resume(a1);
}

void sub_190C58B3C(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = sub_190C3C3A4();
  BOOL v11 = sub_190C3B80C((uint64_t)UMLogMessage, @"Failed to switch to Loginwindow, got error from remote proxy: %@", v5, v6, v7, v8, v9, v10, (uint64_t)v3);
  sub_190C3B464((uint64_t)v4, v11);

  uint64_t v12 = *(void *)(*(void *)(a1 + 32) + 8);
  uint64_t v13 = *(void **)(v12 + 40);
  *(void *)(v12 + 40) = v3;
}

void sub_190C58BDC(uint64_t a1, void *a2)
{
  id v4 = a2;
  if (v4)
  {
    id v5 = v4;
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40), a2);
    id v4 = v5;
  }
  else
  {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 1;
  }
}

BOOL sub_190C58C50(uint64_t a1, void *a2)
{
  if (!a1) {
    return 0;
  }
  id v8 = 0;
  int v3 = sub_190C4599C((uint64_t)UMMobileKeyBag, &v8);
  id v4 = v8;
  id v5 = v4;
  if (v4)
  {
    BOOL v6 = 0;
    if (a2) {
      *a2 = v4;
    }
  }
  else
  {
    BOOL v6 = v3 == 502;
  }

  return v6;
}

uint64_t sub_190C58CE4(uint64_t result, void *a2)
{
  if (result) {
    return sub_190C4599C((uint64_t)UMMobileKeyBag, a2);
  }
  return result;
}

id sub_190C58CF8(void *a1, void *a2)
{
  if (a1)
  {
    uint64_t v17 = 0;
    uint64_t v18 = &v17;
    uint64_t v19 = 0x3032000000;
    uint64_t v20 = sub_190C39F7C;
    char v21 = sub_190C39F44;
    id v22 = 0;
    uint64_t v11 = 0;
    uint64_t v12 = &v11;
    uint64_t v13 = 0x3032000000;
    uint64_t v14 = sub_190C39F7C;
    uint64_t v15 = sub_190C39F44;
    id v16 = 0;
    int v3 = sub_190C54624(a1);
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = sub_190C58EEC;
    v10[3] = &unk_1E56C6100;
    v10[4] = &v17;
    id v5 = objc_msgSend_synchronousRemoteObjectProxyWithErrorHandler_(v3, v4, (uint64_t)v10);
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = sub_190C58F8C;
    v9[3] = &unk_1E56C6230;
    void v9[4] = &v11;
    v9[5] = &v17;
    objc_msgSend_foregroundUserSessionAttributesWithReply_(v5, v6, (uint64_t)v9);

    if (a2) {
      *a2 = (id) v18[5];
    }
    id v7 = (id)v12[5];

    _Block_object_dispose(&v11, 8);
    _Block_object_dispose(&v17, 8);
  }
  else
  {
    id v7 = 0;
  }
  return v7;
}

void sub_190C58EC8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  va_start(va, a13);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v13 - 96), 8);
  _Unwind_Resume(a1);
}

void sub_190C58EEC(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = sub_190C3C3A4();
  uint64_t v11 = sub_190C3B80C((uint64_t)UMLogMessage, @"Failed Foreground usersession attributes, got error from remote proxy: %@", v5, v6, v7, v8, v9, v10, (uint64_t)v3);
  sub_190C3B464((uint64_t)v4, v11);

  uint64_t v12 = *(void *)(*(void *)(a1 + 32) + 8);
  uint64_t v13 = *(void **)(v12 + 40);
  *(void *)(v12 + 40) = v3;
}

void sub_190C58F8C(uint64_t a1, void *a2, void *a3)
{
  id v18 = a2;
  id v6 = a3;
  if (v18) {
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40), a2);
  }
  if (v6)
  {
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), a3);
    uint64_t v7 = sub_190C3C3A4();
    uint64_t v10 = objc_msgSend_code(*(void **)(*(void *)(*(void *)(a1 + 40) + 8) + 40), v8, v9);
    uint64_t v17 = sub_190C3B80C((uint64_t)UMLogMessage, @"got error from remote foregroundUserSessionAttributesWithReply: %ld", v11, v12, v13, v14, v15, v16, v10);
    sub_190C3B464((uint64_t)v7, v17);
  }
}

id sub_190C5907C(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7 = a2;
  id v9 = a3;
  if (a1)
  {
    if (v7)
    {
      uint64_t v10 = sub_190C41930((uint64_t)UMMobileKeyBag, v7, v9, a4);
      goto LABEL_8;
    }
    uint64_t v11 = objc_msgSend_errorWithDomain_code_userInfo_(MEMORY[0x1E4F28C58], v8, *MEMORY[0x1E4F28798], 22, 0);
    uint64_t v12 = v11;
    if (a4) {
      *a4 = v11;
    }
  }
  uint64_t v10 = 0;
LABEL_8:

  return v10;
}

uint64_t sub_190C59144(void *a1, void *a2)
{
  if (!a1) {
    return 0;
  }
  uint64_t v18 = 0;
  uint64_t v19 = &v18;
  uint64_t v20 = 0x2020000000;
  int v21 = -1;
  uint64_t v12 = 0;
  uint64_t v13 = &v12;
  uint64_t v14 = 0x3032000000;
  uint64_t v15 = sub_190C39F7C;
  uint64_t v16 = sub_190C39F44;
  id v17 = 0;
  id v3 = sub_190C54624(a1);
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  void v11[2] = sub_190C59304;
  v11[3] = &unk_1E56C6100;
  void v11[4] = &v12;
  uint64_t v5 = objc_msgSend_synchronousRemoteObjectProxyWithErrorHandler_(v3, v4, (uint64_t)v11);
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = sub_190C593A4;
  v10[3] = &unk_1E56C6680;
  v10[4] = &v12;
  void v10[5] = &v18;
  objc_msgSend_currentSyncBubbleIDwithReply_(v5, v6, (uint64_t)v10);

  if (a2)
  {
    id v7 = (void *)v13[5];
    if (v7) {
      *a2 = v7;
    }
  }
  uint64_t v8 = *((unsigned int *)v19 + 6);

  _Block_object_dispose(&v12, 8);
  _Block_object_dispose(&v18, 8);
  return v8;
}

void sub_190C592E0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  va_start(va, a13);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v13 - 80), 8);
  _Unwind_Resume(a1);
}

void sub_190C59304(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = sub_190C3C3A4();
  uint64_t v11 = sub_190C3B80C((uint64_t)UMLogMessage, @"Failed Current SyncBubble ID, got error from remote proxy: %@", v5, v6, v7, v8, v9, v10, (uint64_t)v3);
  sub_190C3B464((uint64_t)v4, v11);

  uint64_t v12 = *(void *)(*(void *)(a1 + 32) + 8);
  uint64_t v13 = *(void **)(v12 + 40);
  *(void *)(v12 + 40) = v3;
}

void sub_190C593A4(uint64_t a1, int a2, void *a3)
{
  id v6 = a3;
  if (v6)
  {
    id v7 = v6;
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40), a3);
    id v6 = v7;
  }
  else
  {
    *(_DWORD *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = a2;
  }
}

id sub_190C59420(void *a1, void *a2, void *a3)
{
  id v5 = a2;
  if (a1)
  {
    uint64_t v20 = 0;
    int v21 = &v20;
    uint64_t v22 = 0x3032000000;
    id v23 = sub_190C39F7C;
    char v24 = sub_190C39F44;
    id v25 = 0;
    uint64_t v14 = 0;
    uint64_t v15 = &v14;
    uint64_t v16 = 0x3032000000;
    id v17 = sub_190C39F7C;
    uint64_t v18 = sub_190C39F44;
    id v19 = 0;
    id v6 = sub_190C54624(a1);
    v13[0] = MEMORY[0x1E4F143A8];
    v13[1] = 3221225472;
    void v13[2] = sub_190C59634;
    v13[3] = &unk_1E56C6100;
    v13[4] = &v20;
    uint64_t v8 = objc_msgSend_synchronousRemoteObjectProxyWithErrorHandler_(v6, v7, (uint64_t)v13);
    v12[0] = MEMORY[0x1E4F143A8];
    v12[1] = 3221225472;
    void v12[2] = sub_190C596D4;
    v12[3] = &unk_1E56C6150;
    v12[4] = &v14;
    void v12[5] = &v20;
    objc_msgSend_listSyncServiceSourcesForUserSession_withReply_(v8, v9, (uint64_t)v5, v12);

    if (a3) {
      *a3 = (id) v21[5];
    }
    id v10 = (id)v15[5];

    _Block_object_dispose(&v14, 8);
    _Block_object_dispose(&v20, 8);
  }
  else
  {
    id v10 = 0;
  }

  return v10;
}

void sub_190C59610(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  va_start(va, a13);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v13 - 112), 8);
  _Unwind_Resume(a1);
}

void sub_190C59634(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = sub_190C3C3A4();
  uint64_t v11 = sub_190C3B80C((uint64_t)UMLogMessage, @"Failed list syncservices for usersession, got error from remote proxy: %@", v5, v6, v7, v8, v9, v10, (uint64_t)v3);
  sub_190C3B464((uint64_t)v4, v11);

  uint64_t v12 = *(void *)(*(void *)(a1 + 32) + 8);
  uint64_t v13 = *(void **)(v12 + 40);
  *(void *)(v12 + 40) = v3;
}

void sub_190C596D4(uint64_t a1, void *a2, void *a3)
{
  id v18 = a2;
  id v6 = a3;
  if (v18) {
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40), a2);
  }
  if (v6)
  {
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), a3);
    uint64_t v7 = sub_190C3C3A4();
    uint64_t v10 = objc_msgSend_code(*(void **)(*(void *)(*(void *)(a1 + 40) + 8) + 40), v8, v9);
    id v17 = sub_190C3B80C((uint64_t)UMLogMessage, @"got error from remote listSyncServiceSourcesForUserSession: %ld", v11, v12, v13, v14, v15, v16, v10);
    sub_190C3B464((uint64_t)v7, v17);
  }
}

BOOL sub_190C597C4(void *a1, void *a2)
{
  if (!a1) {
    return 0;
  }
  uint64_t v17 = 0;
  id v18 = &v17;
  uint64_t v19 = 0x2020000000;
  char v20 = 0;
  uint64_t v11 = 0;
  uint64_t v12 = &v11;
  uint64_t v13 = 0x3032000000;
  uint64_t v14 = sub_190C39F7C;
  uint64_t v15 = sub_190C39F44;
  id v16 = 0;
  id v3 = sub_190C54624(a1);
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = sub_190C59984;
  v10[3] = &unk_1E56C6100;
  v10[4] = &v11;
  uint64_t v5 = objc_msgSend_synchronousRemoteObjectProxyWithErrorHandler_(v3, v4, (uint64_t)v10);
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = sub_190C59A24;
  v9[3] = &unk_1E56C61E0;
  void v9[4] = &v11;
  v9[5] = &v17;
  objc_msgSend_isLoginSessionwithReply_(v5, v6, (uint64_t)v9);

  if (a2) {
    *a2 = (id) v12[5];
  }
  BOOL v7 = *((unsigned char *)v18 + 24) != 0;

  _Block_object_dispose(&v11, 8);
  _Block_object_dispose(&v17, 8);
  return v7;
}

void sub_190C59960(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  va_start(va, a13);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v13 - 80), 8);
  _Unwind_Resume(a1);
}

void sub_190C59984(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = sub_190C3C3A4();
  uint64_t v11 = sub_190C3B80C((uint64_t)UMLogMessage, @"Failed isLoginSession,got error from remote proxy: %@", v5, v6, v7, v8, v9, v10, (uint64_t)v3);
  sub_190C3B464((uint64_t)v4, v11);

  uint64_t v12 = *(void *)(*(void *)(a1 + 32) + 8);
  uint64_t v13 = *(void **)(v12 + 40);
  *(void *)(v12 + 40) = v3;
}

void sub_190C59A24(uint64_t a1, void *a2)
{
  id v4 = a2;
  if (v4)
  {
    id v5 = v4;
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40), a2);
    id v4 = v5;
  }
  else
  {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 1;
  }
}

id sub_190C59A98(void *a1, void *a2, void *a3)
{
  id v5 = a2;
  if (a1)
  {
    uint64_t v20 = 0;
    int v21 = &v20;
    uint64_t v22 = 0x3032000000;
    id v23 = sub_190C39F7C;
    char v24 = sub_190C39F44;
    id v25 = 0;
    uint64_t v14 = 0;
    uint64_t v15 = &v14;
    uint64_t v16 = 0x3032000000;
    uint64_t v17 = sub_190C39F7C;
    id v18 = sub_190C39F44;
    id v19 = 0;
    uint64_t v6 = sub_190C54624(a1);
    v13[0] = MEMORY[0x1E4F143A8];
    v13[1] = 3221225472;
    void v13[2] = sub_190C59CAC;
    v13[3] = &unk_1E56C6100;
    v13[4] = &v20;
    uint64_t v8 = objc_msgSend_synchronousRemoteObjectProxyWithErrorHandler_(v6, v7, (uint64_t)v13);
    v12[0] = MEMORY[0x1E4F143A8];
    v12[1] = 3221225472;
    void v12[2] = sub_190C59D4C;
    v12[3] = &unk_1E56C6230;
    v12[4] = &v20;
    void v12[5] = &v14;
    objc_msgSend_getUserSessionAttributes_reply_(v8, v9, (uint64_t)v5, v12);

    if (a3) {
      *a3 = (id) v21[5];
    }
    id v10 = (id)v15[5];

    _Block_object_dispose(&v14, 8);
    _Block_object_dispose(&v20, 8);
  }
  else
  {
    id v10 = 0;
  }

  return v10;
}

void sub_190C59C88(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  va_start(va, a13);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v13 - 112), 8);
  _Unwind_Resume(a1);
}

void sub_190C59CAC(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = sub_190C3C3A4();
  uint64_t v11 = sub_190C3B80C((uint64_t)UMLogMessage, @"Failed Usersession attributes  info, got error from remote proxy: %@", v5, v6, v7, v8, v9, v10, (uint64_t)v3);
  sub_190C3B464((uint64_t)v4, v11);

  uint64_t v12 = *(void *)(*(void *)(a1 + 32) + 8);
  uint64_t v13 = *(void **)(v12 + 40);
  *(void *)(v12 + 40) = v3;
}

void sub_190C59D4C(uint64_t a1, void *a2, void *a3)
{
  id v19 = a2;
  id v5 = a3;
  if (v5)
  {
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40), a3);
    uint64_t v6 = sub_190C3C3A4();
    uint64_t v9 = objc_msgSend_code(*(void **)(*(void *)(*(void *)(a1 + 32) + 8) + 40), v7, v8);
    uint64_t v16 = sub_190C3B80C((uint64_t)UMLogMessage, @"getUserSessionAttributes error: %ld", v10, v11, v12, v13, v14, v15, v9);
    sub_190C3B464((uint64_t)v6, v16);
  }
  else
  {
    uint64_t v17 = *(void *)(*(void *)(a1 + 40) + 8);
    id v18 = v19;
    uint64_t v6 = *(void **)(v17 + 40);
    *(void *)(v17 + 40) = v18;
  }
}

BOOL sub_190C59E38(void *a1, void *a2, void *a3, void *a4)
{
  id v7 = a2;
  id v9 = a3;
  if (a1)
  {
    uint64_t v26 = 0;
    uint64_t v27 = &v26;
    uint64_t v28 = 0x2020000000;
    char v29 = 0;
    uint64_t v20 = 0;
    int v21 = &v20;
    uint64_t v22 = 0x3032000000;
    id v23 = sub_190C39F7C;
    char v24 = sub_190C39F44;
    id v25 = 0;
    if (v7)
    {
      uint64_t v10 = sub_190C54624(a1);
      v19[0] = MEMORY[0x1E4F143A8];
      v19[1] = 3221225472;
      v19[2] = sub_190C5A094;
      v19[3] = &unk_1E56C6100;
      void v19[4] = &v20;
      uint64_t v12 = objc_msgSend_synchronousRemoteObjectProxyWithErrorHandler_(v10, v11, (uint64_t)v19);
      v18[0] = MEMORY[0x1E4F143A8];
      v18[1] = 3221225472;
      v18[2] = sub_190C5A134;
      v18[3] = &unk_1E56C61E0;
      v18[4] = &v20;
      v18[5] = &v26;
      objc_msgSend_switchToUserSession_withOpaqueData_reply_(v12, v13, (uint64_t)v7, v9, v18);

      if (a4) {
        *a4 = (id) v21[5];
      }
      BOOL v14 = *((unsigned char *)v27 + 24) != 0;
    }
    else
    {
      uint64_t v15 = objc_msgSend_errorWithDomain_code_userInfo_(MEMORY[0x1E4F28C58], v8, *MEMORY[0x1E4F28798], 22, 0);
      uint64_t v16 = (void *)v21[5];
      void v21[5] = v15;

      BOOL v14 = 0;
      if (a4) {
        *a4 = (id) v21[5];
      }
    }
    _Block_object_dispose(&v20, 8);

    _Block_object_dispose(&v26, 8);
  }
  else
  {
    BOOL v14 = 0;
  }

  return v14;
}

void sub_190C5A06C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  va_start(va, a13);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v13 - 112), 8);
  _Unwind_Resume(a1);
}

void sub_190C5A094(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = sub_190C3C3A4();
  uint64_t v11 = sub_190C3B80C((uint64_t)UMLogMessage, @"Failed to Switch Usersession, got error from remote proxy: %@", v5, v6, v7, v8, v9, v10, (uint64_t)v3);
  sub_190C3B464((uint64_t)v4, v11);

  uint64_t v12 = *(void *)(*(void *)(a1 + 32) + 8);
  uint64_t v13 = *(void **)(v12 + 40);
  *(void *)(v12 + 40) = v3;
}

void sub_190C5A134(uint64_t a1, void *a2)
{
  id v4 = a2;
  if (v4)
  {
    id v6 = v4;
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40), a2);
    id v4 = v6;
    char v5 = 0;
  }
  else
  {
    char v5 = 1;
  }
  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = v5;
}

uint64_t sub_190C5A1AC(uint64_t result, void *a2, void *a3, void *a4)
{
  if (result) {
    return sub_190C41ED8((uint64_t)UMMobileKeyBag, a2, a3, a4);
  }
  return result;
}

void sub_190C5A1C0(uint64_t a1, void *a2)
{
  if (a1) {
    objc_storeStrong((id *)(a1 + 24), a2);
  }
}

uint64_t sub_190C5A1D0(uint64_t result)
{
  if (result) {
    return *(void *)(result + 104);
  }
  return result;
}

void sub_190C5A1DC(uint64_t a1, void *a2)
{
  if (a1) {
    objc_storeStrong((id *)(a1 + 104), a2);
  }
}

void sub_190C5A1EC(uint64_t a1, void *a2)
{
  if (a1) {
    objc_storeStrong((id *)(a1 + 192), a2);
  }
}

void sub_190C5A1FC(uint64_t a1, void *a2)
{
  if (a1) {
    objc_storeStrong((id *)(a1 + 200), a2);
  }
}

uint64_t sub_190C5A20C(uint64_t result)
{
  if (result) {
    return *(void *)(result + 256);
  }
  return result;
}

id *sub_190C5A218(id *WeakRetained)
{
  if (WeakRetained)
  {
    id WeakRetained = (id *)objc_loadWeakRetained(WeakRetained + 33);
    uint64_t v1 = vars8;
  }
  return WeakRetained;
}

id *sub_190C5A248(id *result, void *a2)
{
  if (result) {
    return (id *)objc_storeWeak(result + 33, a2);
  }
  return result;
}

BOOL sub_190C5A258(BOOL result)
{
  if (result) {
    return *(unsigned char *)(result + 13) != 0;
  }
  return result;
}

uint64_t sub_190C5A26C(uint64_t result, char a2)
{
  if (result) {
    *(unsigned char *)(result + 13) = a2;
  }
  return result;
}

uint64_t sub_190C5A3E8()
{
  qword_1E92A9830 = objc_opt_new();
  return MEMORY[0x1F41817F8]();
}

void sub_190C5A488(void *a1, char *newValue)
{
  if (a1) {
    objc_setProperty_nonatomic_copy(a1, newValue, newValue, 32);
  }
}

uint64_t sub_190C5A558(uint64_t a1)
{
  uint64_t v2 = sub_190C3C3A4();
  sub_190C49FC4((uint64_t)v2, @"willSwitchToUser on UMPersonaCallbackListener ", v3, v4, v5, v6, v7, v8, v11);

  uint64_t v9 = *(uint64_t (**)(void))(*(void *)(a1 + 32) + 16);
  return v9();
}

uint64_t sub_190C5A674(uint64_t a1)
{
  uint64_t v2 = sub_190C3C3A4();
  sub_190C49FC4((uint64_t)v2, @"readyToSwitchToUser on UMPersonaCallbackListener ", v3, v4, v5, v6, v7, v8, v11);

  uint64_t v9 = *(uint64_t (**)(void))(*(void *)(a1 + 32) + 16);
  return v9();
}

uint64_t sub_190C5A790(uint64_t a1)
{
  uint64_t v2 = sub_190C3C3A4();
  sub_190C49FC4((uint64_t)v2, @"readyToSwitchToLoginSession on UMPersonaCallbackListener ", v3, v4, v5, v6, v7, v8, v11);

  uint64_t v9 = *(uint64_t (**)(void))(*(void *)(a1 + 32) + 16);
  return v9();
}

void sub_190C5A850()
{
  sub_190C3C3A4();
  id v7 = (id)objc_claimAutoreleasedReturnValue();
  sub_190C49FC4((uint64_t)v7, @"userSwitchTaskListDidUpdate on UMPersonaCallbackListener ", v0, v1, v2, v3, v4, v5, v6);
}

void sub_190C5A900()
{
  sub_190C3C3A4();
  id v7 = (id)objc_claimAutoreleasedReturnValue();
  sub_190C49FC4((uint64_t)v7, @"deviceLoginSessionStateDidUpdate on UMPersonaCallbackListener ", v0, v1, v2, v3, v4, v5, v6);
}

uint64_t sub_190C5AA0C(uint64_t a1)
{
  uint64_t v2 = sub_190C3C3A4();
  sub_190C49FC4((uint64_t)v2, @"Upload content on UMPersonaCallbackListener ", v3, v4, v5, v6, v7, v8, v11);

  uint64_t v9 = *(uint64_t (**)(void))(*(void *)(a1 + 32) + 16);
  return v9();
}

void sub_190C5AACC()
{
  sub_190C3C3A4();
  id v7 = (id)objc_claimAutoreleasedReturnValue();
  sub_190C49FC4((uint64_t)v7, @"bubbleDidPop on UMPersonaCallbackListener ", v0, v1, v2, v3, v4, v5, v6);
}

uint64_t sub_190C5ABD8(uint64_t a1)
{
  uint64_t v2 = sub_190C3C3A4();
  sub_190C49FC4((uint64_t)v2, @"personaListDidUpdateCompletionHandler on UMPersonaCallbackListener ", v3, v4, v5, v6, v7, v8, v11);

  uint64_t v9 = *(uint64_t (**)(void))(*(void *)(a1 + 32) + 16);
  return v9();
}

void sub_190C5ACF4(uint64_t a1, void *a2)
{
  uint64_t v3 = a2;
  uint64_t v4 = sub_190C3B928();
  sub_190C49FC4((uint64_t)v4, @"persona Update callback", v5, v6, v7, v8, v9, v10, v22);

  if (v3 && v3[4])
  {
    (*(void (**)(void))(v3[4] + 16))();
    uint64_t v11 = sub_190C3C3A4();
    id v18 = (void *)v11;
    id v19 = @"personaUpdateCallbackHandler:DONE";
  }
  else
  {
    uint64_t v11 = sub_190C3C3A4();
    id v18 = (void *)v11;
    id v19 = @"NO personaUpdateCallbackHandler";
  }
  sub_190C49FC4(v11, v19, v12, v13, v14, v15, v16, v17, v23);

  uint64_t v20 = sub_190C3AB40();
  v24[0] = MEMORY[0x1E4F143A8];
  v24[1] = 3221225472;
  v24[2] = sub_190C5AE40;
  v24[3] = &unk_1E56C6460;
  int v21 = *(void **)(a1 + 32);
  id v25 = *(id *)(a1 + 40);
  sub_190C3C78C((uint64_t)v20, v21, v24);
}

uint64_t sub_190C5AE40(uint64_t a1)
{
  uint64_t v2 = sub_190C3B928();
  sub_190C49FC4((uint64_t)v2, @"Calling personaUpdateCallbackHandler completion handler", v3, v4, v5, v6, v7, v8, v11);

  uint64_t v9 = *(uint64_t (**)(void))(*(void *)(a1 + 32) + 16);
  return v9();
}

void sub_190C5AF84(uint64_t a1, void *a2)
{
  uint64_t v10 = a2;
  uint64_t v3 = sub_190C3B928();
  sub_190C49FC4((uint64_t)v3, @"<%p> Set up server with connection", v4, v5, v6, v7, v8, v9, *(void *)(a1 + 32));

  sub_190C5B004(v10, *(void **)(a1 + 32));
}

void sub_190C5B004(id *a1, void *a2)
{
  id v3 = a2;
  if (a1)
  {
    id v4 = a1[2];
    objc_sync_enter(v4);
    id v5 = a1[2];
    objc_msgSend_addObject_(v5, v6, (uint64_t)v3);

    objc_sync_exit(v4);
    uint64_t v8 = objc_msgSend_interfaceWithProtocol_(MEMORY[0x1E4F29280], v7, (uint64_t)&unk_1EE0A0610);
    objc_msgSend_setRemoteObjectInterface_(v3, v9, (uint64_t)v8);

    uint64_t v11 = objc_msgSend_interfaceWithProtocol_(MEMORY[0x1E4F29280], v10, (uint64_t)&unk_1EE09DEB0);
    objc_msgSend_setExportedInterface_(v3, v12, (uint64_t)v11);

    objc_msgSend_setExportedObject_(v3, v13, (uint64_t)a1);
    objc_initWeak(&location, a1);
    objc_initWeak(&from, v3);
    v21[0] = MEMORY[0x1E4F143A8];
    v21[1] = 3221225472;
    v21[2] = sub_190C5B240;
    v21[3] = &unk_1E56C64F0;
    objc_copyWeak(&v22, &from);
    objc_msgSend_setInterruptionHandler_(v3, v14, (uint64_t)v21);
    v18[0] = MEMORY[0x1E4F143A8];
    v18[1] = 3221225472;
    v18[2] = sub_190C5B2B4;
    v18[3] = &unk_1E56C6740;
    objc_copyWeak(&v19, &from);
    objc_copyWeak(&v20, &location);
    objc_msgSend_setInvalidationHandler_(v3, v15, (uint64_t)v18);
    objc_msgSend_resume(v3, v16, v17);
    objc_destroyWeak(&v20);
    objc_destroyWeak(&v19);
    objc_destroyWeak(&v22);
    objc_destroyWeak(&from);
    objc_destroyWeak(&location);
  }
}

void sub_190C5B1F0(_Unwind_Exception *a1)
{
  objc_destroyWeak(v3);
  objc_destroyWeak(v2);
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v4 - 64));
  objc_destroyWeak((id *)(v4 - 56));
  _Unwind_Resume(a1);
}

void sub_190C5B240(uint64_t a1)
{
  sub_190C3C3A4();
  id v9 = (id)objc_claimAutoreleasedReturnValue();
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  sub_190C49FC4((uint64_t)v9, @"<%p> XPC connection interrupted", v3, v4, v5, v6, v7, v8, (uint64_t)WeakRetained);
}

void sub_190C5B2B4(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  uint64_t v3 = sub_190C3C3A4();
  sub_190C49FC4((uint64_t)v3, @"<%p> XPC connection invalidated", v4, v5, v6, v7, v8, v9, (uint64_t)WeakRetained);

  uint64_t v10 = sub_190C3AB40();
  id v11 = objc_loadWeakRetained((id *)(a1 + 40));
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  void v13[2] = sub_190C5B3AC;
  v13[3] = &unk_1E56C6718;
  id v14 = WeakRetained;
  id v12 = WeakRetained;
  sub_190C3C78C((uint64_t)v10, v11, v13);
}

void sub_190C5B3AC(uint64_t a1, uint64_t a2)
{
}

void sub_190C5B3BC(uint64_t a1, void *a2)
{
  id v6 = a2;
  if (a1)
  {
    id v3 = *(id *)(a1 + 16);
    objc_sync_enter(v3);
    id v4 = *(id *)(a1 + 16);
    objc_msgSend_removeObject_(v4, v5, (uint64_t)v6);

    objc_sync_exit(v3);
  }
}

void sub_190C5B438(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

uint64_t sub_190C5B4A8()
{
  os_log_t v0 = os_log_create(off_1E92A8E80, "persona");
  uint64_t v1 = qword_1E92A9890;
  qword_1E92A9890 = (uint64_t)v0;
  return MEMORY[0x1F41817F8](v0, v1);
}

id sub_190C5B640(uint64_t a1, void *a2)
{
  id v2 = a2;
  uint64_t v46 = self;
  id v3 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v4 = objc_opt_class();
  uint64_t v5 = objc_opt_class();
  objc_opt_class();
  objc_opt_class();
  uint64_t v45 = v5;
  uint64_t v7 = objc_msgSend_setWithObjects_(v3, v6, v4);
  id v47 = 0;
  uint64_t v9 = objc_msgSend_unarchivedObjectOfClasses_fromData_error_(MEMORY[0x1E4F28DC0], v8, (uint64_t)v7, v2, &v47);

  id v10 = v47;
  uint64_t v17 = sub_190C3C3A4();
  if (v9)
  {
    id v18 = @"SUCCESSFUL unarchive of switch context \n";
  }
  else
  {
    uint64_t v45 = (uint64_t)v10;
    id v18 = @"Failed to unarchive the switch context with an error:%@ \n";
  }
  id v19 = sub_190C3B80C((uint64_t)UMLogMessage, v18, v11, v12, v13, v14, v15, v16, v45);
  sub_190C3B464((uint64_t)v17, v19);

  int v21 = objc_msgSend_objectForKeyedSubscript_(v9, v20, @"setupData");
  uint64_t v23 = objc_msgSend_objectForKeyedSubscript_(v9, v22, @"shortLivedToken");
  id v25 = objc_msgSend_objectForKeyedSubscript_(v9, v24, @"secondaryActionRequired");
  uint64_t v27 = objc_msgSend_objectForKeyedSubscript_(v9, v26, @"environmentsByServices");
  if (sub_190C3F14C())
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      uint64_t v30 = sub_190C3C3A4();
      uint64_t v33 = objc_msgSend_description(v27, v31, v32);
      uint64_t v40 = sub_190C3B80C((uint64_t)UMLogMessage, @"Switching to the following environments: \n%@", v34, v35, v36, v37, v38, v39, (uint64_t)v33);
      sub_190C3B464((uint64_t)v30, v40);

      sub_190C5B8C8((uint64_t)v46, v27);
    }
  }
  uint64_t v41 = objc_msgSend_BOOLValue(v25, v28, v29);
  uint64_t v43 = objc_msgSend_contextWithSetupData_shortLivedToken_secondaryActionRequired_(v46, v42, (uint64_t)v21, v23, v41);

  return v43;
}

void sub_190C5B8C8(uint64_t a1, void *a2)
{
  uint64_t v157 = *MEMORY[0x1E4F143B8];
  id v2 = a2;
  self;
  uint64_t v138 = 0;
  uint64_t v139 = &v138;
  uint64_t v140 = 0x2050000000;
  id v3 = (void *)qword_1E92A9988;
  uint64_t v141 = (uint64_t (*)(uint64_t, uint64_t))qword_1E92A9988;
  if (!qword_1E92A9988)
  {
    uint64_t v144 = MEMORY[0x1E4F143A8];
    uint64_t v145 = 3221225472;
    uint64_t v146 = (uint64_t)sub_190C5C5D8;
    uint64_t v147 = (uint64_t (*)(uint64_t, uint64_t))&unk_1E56C67D0;
    uint64_t v148 = (void (*)(uint64_t))&v138;
    sub_190C5C5D8((uint64_t)&v144);
    id v3 = (void *)v139[3];
  }
  uint64_t v4 = v3;
  _Block_object_dispose(&v138, 8);
  id v110 = objc_alloc_init(v4);
  long long v152 = 0u;
  long long v153 = 0u;
  long long v150 = 0u;
  long long v151 = 0u;
  id obj = v2;
  uint64_t v106 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v5, (uint64_t)&v150, v156, 16);
  if (v106)
  {
    uint64_t v105 = *(void *)v151;
    do
    {
      uint64_t v6 = 0;
      do
      {
        if (*(void *)v151 != v105)
        {
          uint64_t v7 = v6;
          objc_enumerationMutation(obj);
          uint64_t v6 = v7;
        }
        uint64_t v108 = v6;
        id v8 = *(id *)(*((void *)&v150 + 1) + 8 * v6);
        id v10 = objc_msgSend_objectForKeyedSubscript_(obj, v9, (uint64_t)v8);
        uint64_t v11 = sub_190C3C3A4();
        id v18 = sub_190C3B80C((uint64_t)UMLogMessage, @"About to switch to:\n\tService name: '%@'\n\tEnvironment name: '%@'\n\n", v12, v13, v14, v15, v16, v17, (uint64_t)v8);
        sub_190C3B464((uint64_t)v11, v18);

        uint64_t v144 = 0;
        uint64_t v145 = (uint64_t)&v144;
        uint64_t v146 = 0x3032000000;
        uint64_t v147 = sub_190C39F8C;
        uint64_t v148 = sub_190C39F4C;
        id v149 = 0;
        uint64_t v138 = 0;
        uint64_t v139 = &v138;
        uint64_t v140 = 0x3032000000;
        uint64_t v141 = sub_190C39F8C;
        uint64_t v142 = sub_190C39F4C;
        id v143 = 0;
        dispatch_semaphore_t v19 = dispatch_semaphore_create(0);
        v134[0] = MEMORY[0x1E4F143A8];
        v134[1] = 3221225472;
        v134[2] = sub_190C5C44C;
        v134[3] = &unk_1E56C6780;
        v136 = &v144;
        uint64_t v137 = &v138;
        id v20 = v19;
        uint64_t v135 = v20;
        objc_msgSend_servicesWithForcePoll_completion_(v110, v21, 0, v134);
        uint64_t v109 = v20;
        dispatch_semaphore_wait(v20, 0xFFFFFFFFFFFFFFFFLL);
        long long v132 = 0u;
        long long v133 = 0u;
        long long v130 = 0u;
        long long v131 = 0u;
        id v22 = *(id *)(v145 + 40);
        uint64_t v26 = objc_msgSend_countByEnumeratingWithState_objects_count_(v22, v23, (uint64_t)&v130, v155, 16);
        if (v26)
        {
          uint64_t v27 = *(void *)v131;
LABEL_10:
          uint64_t v28 = 0;
          while (1)
          {
            if (*(void *)v131 != v27) {
              objc_enumerationMutation(v22);
            }
            uint64_t v29 = *(void **)(*((void *)&v130 + 1) + 8 * v28);
            uint64_t v30 = objc_msgSend_identifier(v29, v24, v25);
            if (!objc_msgSend_caseInsensitiveCompare_(v30, v31, (uint64_t)v8)) {
              break;
            }
            uint64_t v34 = objc_msgSend_name(v29, v32, v33);
            BOOL v36 = objc_msgSend_caseInsensitiveCompare_(v34, v35, (uint64_t)v8) == 0;

            if (v36) {
              goto LABEL_19;
            }
            if (v26 == ++v28)
            {
              uint64_t v26 = objc_msgSend_countByEnumeratingWithState_objects_count_(v22, v24, (uint64_t)&v130, v155, 16);
              if (v26) {
                goto LABEL_10;
              }
              goto LABEL_17;
            }
          }

LABEL_19:
          id v37 = v29;

          if (v37) {
            goto LABEL_21;
          }
        }
        else
        {
LABEL_17:
        }
        uint64_t v40 = sub_190C3C3A4();
        id v47 = sub_190C3B80C((uint64_t)UMLogMessage, @"Service '%@' not found.\n\n", v41, v42, v43, v44, v45, v46, (uint64_t)v8);
        sub_190C3B464((uint64_t)v40, v47);

        id v37 = 0;
LABEL_21:
        long long v128 = 0u;
        long long v129 = 0u;
        long long v126 = 0u;
        long long v127 = 0u;
        uint64_t v48 = objc_msgSend_environments(v37, v38, v39);
        uint64_t v52 = objc_msgSend_countByEnumeratingWithState_objects_count_(v48, v49, (uint64_t)&v126, v154, 16);
        uint64_t v111 = v37;
        if (v52)
        {
          uint64_t v53 = *(void *)v127;
          while (2)
          {
            for (uint64_t i = 0; i != v52; ++i)
            {
              if (*(void *)v127 != v53) {
                objc_enumerationMutation(v48);
              }
              uint64_t v55 = *(void **)(*((void *)&v126 + 1) + 8 * i);
              long long v56 = objc_msgSend_identifier(v55, v50, v51);
              if (!objc_msgSend_caseInsensitiveCompare_(v56, v57, (uint64_t)v10))
              {

LABEL_33:
                id v63 = v55;
                goto LABEL_34;
              }
              uint64_t v60 = objc_msgSend_name(v55, v58, v59);
              BOOL v62 = objc_msgSend_caseInsensitiveCompare_(v60, v61, (uint64_t)v10) == 0;

              if (v62) {
                goto LABEL_33;
              }
            }
            uint64_t v52 = objc_msgSend_countByEnumeratingWithState_objects_count_(v48, v50, (uint64_t)&v126, v154, 16);
            id v63 = 0;
            if (v52) {
              continue;
            }
            break;
          }
        }
        else
        {
          id v63 = 0;
        }
LABEL_34:

        if ((objc_msgSend_isEqualToString_(v10, v64, @"prod") & 1) == 0)
        {
          if (v63) {
            goto LABEL_38;
          }
          sub_190C3C3A4();
          id v63 = (id)objc_claimAutoreleasedReturnValue();
          uint64_t v71 = sub_190C3B80C((uint64_t)UMLogMessage, @"Environment '%@' not found for service '%@'.\n\n", v65, v66, v67, v68, v69, v70, (uint64_t)v10);
          sub_190C3B464((uint64_t)v63, v71);
        }
        id v63 = 0;
LABEL_38:
        uint64_t v122 = 0;
        uint64_t v123 = &v122;
        uint64_t v124 = 0x2020000000;
        char v125 = 0;
        uint64_t v116 = 0;
        id v117 = &v116;
        uint64_t v118 = 0x3032000000;
        uint64_t v119 = sub_190C39F8C;
        uint64_t v120 = sub_190C39F4C;
        id v121 = 0;
        dispatch_semaphore_t v72 = dispatch_semaphore_create(0);

        v112[0] = MEMORY[0x1E4F143A8];
        v112[1] = 3221225472;
        v112[2] = sub_190C5C4E8;
        v112[3] = &unk_1E56C67A8;
        id v114 = &v122;
        id v115 = &v116;
        uint64_t v73 = v72;
        uint64_t v113 = v73;
        objc_msgSend_switchToEnvironment_service_completion_(v110, v74, (uint64_t)v63, v111, v112);
        dispatch_semaphore_wait(v73, 0xFFFFFFFFFFFFFFFFLL);
        objc_msgSend_identifier(v63, v75, v76);
        uint64_t v77 = (__CFString *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_name(v63, v78, v79);
        v80 = (__CFString *)objc_claimAutoreleasedReturnValue();
        id v81 = v80;
        if (!v77)
        {

          uint64_t v77 = @"prod";
          id v81 = @"Production";
        }
        if (*((unsigned char *)v123 + 24))
        {
          uint64_t v82 = sub_190C3C3A4();
          uint64_t v85 = objc_msgSend_identifier(v111, v83, v84);
          uint64_t v88 = objc_msgSend_name(v111, v86, v87);
          uint64_t v95 = sub_190C3B80C((uint64_t)UMLogMessage, @"Success: Switched to '%@' (%@) environment for service '%@' (%@)\n", v89, v90, v91, v92, v93, v94, (uint64_t)v77);
          sub_190C3B464((uint64_t)v82, v95);
        }
        else
        {
          uint64_t v82 = sub_190C3C3A4();
          uint64_t v85 = objc_msgSend_description((void *)v117[5], v96, v97);
          uint64_t v88 = sub_190C3B80C((uint64_t)UMLogMessage, @"Failed to switch to environment '%@': %@\n", v98, v99, v100, v101, v102, v103, (uint64_t)v81);
          sub_190C3B464((uint64_t)v82, v88);
        }

        _Block_object_dispose(&v116, 8);
        _Block_object_dispose(&v122, 8);

        _Block_object_dispose(&v138, 8);
        _Block_object_dispose(&v144, 8);

        uint64_t v6 = v108 + 1;
      }
      while (v108 + 1 != v106);
      uint64_t v106 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v104, (uint64_t)&v150, v156, 16);
    }
    while (v106);
  }
}

void sub_190C5C154(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,uint64_t a44,uint64_t a45,uint64_t a46,uint64_t a47,uint64_t a48,uint64_t a49,uint64_t a50,uint64_t a51,uint64_t a52,uint64_t a53,uint64_t a54,uint64_t a55,uint64_t a56,uint64_t a57,uint64_t a58,uint64_t a59,uint64_t a60,uint64_t a61,uint64_t a62,uint64_t a63)
{
  _Block_object_dispose(&a69, 8);
  _Unwind_Resume(a1);
}

uint64_t *sub_190C5C1D4(uint64_t *a1, const char *a2)
{
  id v2 = a1;
  if (a1)
  {
    id v3 = objc_msgSend_dictionaryWithCapacity_(MEMORY[0x1E4F1CA60], a2, 3);
    uint64_t v6 = objc_msgSend_setupData(v2, v4, v5);

    if (v6)
    {
      uint64_t v9 = objc_msgSend_setupData(v2, v7, v8);
      objc_msgSend_setObject_forKeyedSubscript_(v3, v10, (uint64_t)v9, @"setupData");
    }
    uint64_t v11 = objc_msgSend_shortLivedToken(v2, v7, v8);

    if (v11)
    {
      uint64_t v14 = objc_msgSend_shortLivedToken(v2, v12, v13);
      objc_msgSend_setObject_forKeyedSubscript_(v3, v15, (uint64_t)v14, @"shortLivedToken");
    }
    uint64_t v16 = (void *)MEMORY[0x1E4F28ED0];
    uint64_t v17 = objc_msgSend_secondaryActionRequired(v2, v12, v13);
    dispatch_semaphore_t v19 = objc_msgSend_numberWithBool_(v16, v18, v17);
    objc_msgSend_setObject_forKeyedSubscript_(v3, v20, (uint64_t)v19, @"secondaryActionRequired");

    if (v2[4]) {
      objc_msgSend_setObject_forKeyedSubscript_(v3, v21, v2[4], @"environmentsByServices");
    }
    id v2 = (uint64_t *)objc_msgSend_copy(v3, v21, v22);
  }
  return v2;
}

id sub_190C5C314(uint64_t *a1, const char *a2)
{
  if (a1)
  {
    id v2 = (void *)MEMORY[0x1E4F28DB0];
    id v3 = sub_190C5C1D4(a1, a2);
    id v18 = 0;
    uint64_t v5 = objc_msgSend_archivedDataWithRootObject_requiringSecureCoding_error_(v2, v4, (uint64_t)v3, 1, &v18);
    id v6 = v18;

    uint64_t v13 = sub_190C3C3A4();
    if (v5)
    {
      uint64_t v14 = @"SUCCESSFUL archive of switch context\n";
    }
    else
    {
      uint64_t v17 = (uint64_t)v6;
      uint64_t v14 = @"Failed to archive the switch context with an error:%@ \n";
    }
    uint64_t v15 = sub_190C3B80C((uint64_t)UMLogMessage, v14, v7, v8, v9, v10, v11, v12, v17);
    sub_190C3B464((uint64_t)v13, v15);
  }
  else
  {
    uint64_t v5 = 0;
  }
  return v5;
}

void sub_190C5C44C(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = *(void *)(*(void *)(a1 + 40) + 8);
  uint64_t v8 = *(void **)(v7 + 40);
  *(void *)(v7 + 40) = v5;
  id v12 = v5;

  uint64_t v9 = *(void *)(*(void *)(a1 + 48) + 8);
  uint64_t v10 = *(void **)(v9 + 40);
  *(void *)(v9 + 40) = v6;
  id v11 = v6;

  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

void sub_190C5C4E8(uint64_t a1, char a2, id obj)
{
  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = a2;
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40), obj);
  id v5 = obj;
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

Class sub_190C5C5D8(uint64_t a1)
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  v3[0] = 0;
  if (!qword_1E92A9990)
  {
    v3[1] = (void *)MEMORY[0x1E4F143A8];
    v3[2] = (void *)3221225472;
    v3[3] = sub_190C5C71C;
    v3[4] = &unk_1E56C5FF8;
    v3[5] = v3;
    long long v4 = xmmword_1E56C67F0;
    uint64_t v5 = 0;
    qword_1E92A9990 = _sl_dlopen();
    if (!qword_1E92A9990)
    {
      abort_report_np();
LABEL_8:
      sub_190C5EBC0();
    }
    if (v3[0]) {
      free(v3[0]);
    }
  }
  Class result = objc_getClass("SWSwitchController");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  if (!*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24)) {
    goto LABEL_8;
  }
  qword_1E92A9988 = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

uint64_t sub_190C5C71C()
{
  uint64_t result = _sl_dlopen();
  qword_1E92A9990 = result;
  return result;
}

id sub_190C5C790(uint64_t a1, uint64_t a2)
{
  self;
  id v3 = objc_opt_new();
  objc_msgSend_setUid_(v3, v4, a2);
  return v3;
}

BOOL sub_190C5C824(void *a1, void *a2)
{
  if (!a1) {
    return 0;
  }
  id v3 = a1;
  objc_sync_enter(v3);
  if (byte_1E92A9850)
  {
    long long v4 = sub_190C3C3A4();
    sub_190C49FC4((uint64_t)v4, @"Error: this process is not entitled to access user properties", v5, v6, v7, v8, v9, v10, v18);

    id v12 = sub_190C3D020((uint64_t)UMError, 7uLL);
LABEL_10:
    BOOL v13 = 0;
    goto LABEL_11;
  }
  id v19 = 0;
  BOOL v13 = sub_190C43614((uint64_t)UMMobileKeyBag, v3, &v19);
  id v14 = v19;
  id v12 = v14;
  if (v14) {
    char v16 = v13;
  }
  else {
    char v16 = 1;
  }
  if ((v16 & 1) == 0)
  {
    if (objc_msgSend_code(v14, v11, v15) != 7) {
      goto LABEL_10;
    }
    BOOL v13 = 0;
    byte_1E92A9850 = 1;
  }
LABEL_11:
  if (a2) {
    *a2 = v12;
  }
  objc_msgSend_setShouldFetchAttributes_(v3, v11, 0);

  objc_sync_exit(v3);
  return v13;
}

void sub_190C5C948(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_190C5C95C(void *a1)
{
  if (a1)
  {
    id obj = a1;
    objc_sync_enter(obj);
    if (objc_msgSend_shouldFetchAttributes(obj, v1, v2)) {
      sub_190C5C824(obj, 0);
    }
    objc_sync_exit(obj);
  }
}

void sub_190C5C9D4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id obj)
{
}

void sub_190C5D01C(void *a1@<X0>, const char *a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X8>)
{
  *(_OWORD *)(a4 + 32) = 0u;
  *(_OWORD *)(a4 + 48) = 0u;
  *(_OWORD *)a4 = 0u;
  *(_OWORD *)(a4 + 16) = 0u;
  if (a1)
  {
    int v5 = objc_msgSend_uid(a1, a2, a3);
    char v29 = 0;
    if (quotactl("/private/var", 458752, v5, &v29))
    {
      uint64_t v12 = *__error();
      BOOL v13 = @"Error getting quota status";
LABEL_4:
      id v14 = sub_190C3B80C((uint64_t)UMLogMessage, v13, v6, v7, v8, v9, v10, v11, v28);
      sub_190C4CE30((uint64_t)v14, @"error num: %d", v15, v16, v17, v18, v19, v20, v12);
      int v21 = sub_190C3C3A4();
      sub_190C3B464((uint64_t)v21, v14);

LABEL_5:
      return;
    }
    if (!v29)
    {
      id v14 = sub_190C3C3A4();
      sub_190C49FC4((uint64_t)v14, @"Quotas are off", v22, v23, v24, v25, v26, v27, v28);
      goto LABEL_5;
    }
    if (quotactl("/private/var", 196608, v5, (caddr_t)a4))
    {
      uint64_t v12 = *__error();
      BOOL v13 = @"Error getting quota";
      goto LABEL_4;
    }
  }
}

uint64_t sub_190C5D53C(uint64_t result, void *a2)
{
  if (result)
  {
    uint64_t v2 = (void *)result;
    id v3 = a2;
    uint64_t v6 = objc_msgSend_uid(v3, v4, v5);
    objc_msgSend_setUid_(v2, v7, v6);
    uint64_t v10 = objc_msgSend_gid(v3, v8, v9);
    objc_msgSend_setGid_(v2, v11, v10);
    id v14 = objc_msgSend_alternateDSID(v3, v12, v13);
    objc_msgSend_setAlternateDSID_(v2, v15, (uint64_t)v14);

    uint64_t v18 = objc_msgSend_homeDirectoryURL(v3, v16, v17);
    objc_msgSend_setHomeDirectoryURL_(v2, v19, (uint64_t)v18);

    uint64_t v22 = objc_msgSend_username(v3, v20, v21);
    objc_msgSend_setUsername_(v2, v23, (uint64_t)v22);

    uint64_t v26 = objc_msgSend_givenName(v3, v24, v25);
    objc_msgSend_setGivenName_(v2, v27, (uint64_t)v26);

    uint64_t v30 = objc_msgSend_familyName(v3, v28, v29);
    objc_msgSend_setFamilyName_(v2, v31, (uint64_t)v30);

    uint64_t v34 = objc_msgSend_displayName(v3, v32, v33);
    objc_msgSend_setDisplayName_(v2, v35, (uint64_t)v34);

    uint64_t v38 = objc_msgSend_photoURL(v3, v36, v37);
    objc_msgSend_setPhotoURL_(v2, v39, (uint64_t)v38);

    uint64_t v42 = objc_msgSend_userAuxiliaryString(v3, v40, v41);
    objc_msgSend_setUserAuxiliaryString_(v2, v43, (uint64_t)v42);

    uint64_t v46 = objc_msgSend__photo(v3, v44, v45);
    objc_msgSend_set_photo_(v2, v47, (uint64_t)v46);

    uint64_t v50 = objc_msgSend_creationDate(v3, v48, v49);
    objc_msgSend_setCreationDate_(v2, v51, (uint64_t)v50);

    uint64_t v54 = objc_msgSend_lastLoginDate(v3, v52, v53);
    objc_msgSend_setLastLoginDate_(v2, v55, (uint64_t)v54);

    uint64_t v58 = objc_msgSend_lastRemoteAuthDate(v3, v56, v57);
    objc_msgSend_setLastRemoteAuthDate_(v2, v59, (uint64_t)v58);

    uint64_t v62 = objc_msgSend_passcodeType(v3, v60, v61);
    objc_msgSend_setPasscodeType_(v2, v63, v62);
    uint64_t isAuditor = objc_msgSend_isAuditor(v3, v64, v65);
    objc_msgSend_setIsAuditor_(v2, v67, isAuditor);
    uint64_t isLoginUser = objc_msgSend_isLoginUser(v3, v68, v69);
    objc_msgSend_setIsLoginUser_(v2, v71, isLoginUser);
    uint64_t isDisabled = objc_msgSend_isDisabled(v3, v72, v73);
    objc_msgSend_setIsDisabled_(v2, v75, isDisabled);
    uint64_t isTransientUser = objc_msgSend_isTransientUser(v3, v76, v77);
    objc_msgSend_setIsTransientUser_(v2, v79, isTransientUser);
    uint64_t isPrimaryUser = objc_msgSend_isPrimaryUser(v3, v80, v81);
    objc_msgSend_setIsPrimaryUser_(v2, v83, isPrimaryUser);
    uint64_t isAdminUser = objc_msgSend_isAdminUser(v3, v84, v85);
    objc_msgSend_setIsAdminUser_(v2, v87, isAdminUser);
    uint64_t v90 = objc_msgSend_passcodeLockGracePeriod(v3, v88, v89);
    objc_msgSend_setPasscodeLockGracePeriod_(v2, v91, v90);
    uint64_t v94 = objc_msgSend_languages(v3, v92, v93);
    objc_msgSend_setLanguages_(v2, v95, (uint64_t)v94);

    uint64_t hasManagedCredentials = objc_msgSend_hasManagedCredentials(v3, v96, v97);
    objc_msgSend_setHasManagedCredentials_(v2, v99, hasManagedCredentials);
    uint64_t v102 = objc_msgSend_dataQuota(v3, v100, v101);
    objc_msgSend_setDataQuota_(v2, v103, v102);
    uint64_t v106 = objc_msgSend_dataUsed(v3, v104, v105);
    objc_msgSend_setDataUsed_(v2, v107, v106);
    uint64_t hasDataToSync = objc_msgSend_hasDataToSync(v3, v108, v109);
    objc_msgSend_setHasDataToSync_(v2, v111, hasDataToSync);
    id v114 = objc_msgSend_errorCausingLogout(v3, v112, v113);
    objc_msgSend_setErrorCausingLogout_(v2, v115, (uint64_t)v114);

    uint64_t v118 = objc_msgSend_debugErrorCausingLogout(v3, v116, v117);

    objc_msgSend_setDebugErrorCausingLogout_(v2, v119, (uint64_t)v118);
    return objc_msgSend_setShouldFetchAttributes_(v2, v120, 0);
  }
  return result;
}

void sub_190C5D958(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

uint64_t sub_190C5DF00()
{
  uint64_t result = getpid();
  dword_1E92A9840 = result;
  return result;
}

void sub_190C5E0AC(void *a1, char *newValue)
{
  if (a1) {
    objc_setProperty_nonatomic_copy(a1, newValue, newValue, 40);
  }
}

uint64_t sub_190C5E74C(uint64_t result, void *a2)
{
  if (result)
  {
    uint64_t v2 = (void *)result;
    id v3 = a2;
    uint64_t v6 = objc_msgSend_uid(v3, v4, v5);
    objc_msgSend_setUid_(v2, v7, v6);
    uint64_t v10 = objc_msgSend_gid(v3, v8, v9);
    objc_msgSend_setGid_(v2, v11, v10);
    uint64_t isEnterprisePersona = objc_msgSend_isEnterprisePersona(v3, v12, v13);
    objc_msgSend_setIsEnterprisePersona_(v2, v15, isEnterprisePersona);
    uint64_t isPersonalPersona = objc_msgSend_isPersonalPersona(v3, v16, v17);
    objc_msgSend_setIsPersonalPersona_(v2, v19, isPersonalPersona);
    uint64_t isSystemPersona = objc_msgSend_isSystemPersona(v3, v20, v21);
    objc_msgSend_setIsSystemPersona_(v2, v23, isSystemPersona);
    uint64_t isDefaultPersona = objc_msgSend_isDefaultPersona(v3, v24, v25);
    objc_msgSend_setIsDefaultPersona_(v2, v27, isDefaultPersona);
    uint64_t isGuestPersona = objc_msgSend_isGuestPersona(v3, v28, v29);
    objc_msgSend_setIsGuestPersona_(v2, v31, isGuestPersona);
    uint64_t isDataSeparatedPersona = objc_msgSend_isDataSeparatedPersona(v3, v32, v33);
    objc_msgSend_setIsDataSeparatedPersona_(v2, v35, isDataSeparatedPersona);
    uint64_t isDisabled = objc_msgSend_isDisabled(v3, v36, v37);
    objc_msgSend_setIsDisabled_(v2, v39, isDisabled);
    uint64_t v42 = objc_msgSend_userPersonaUniqueString(v3, v40, v41);
    objc_msgSend_setUserPersonaUniqueString_(v2, v43, (uint64_t)v42);

    uint64_t v46 = objc_msgSend_userPersonaNickName(v3, v44, v45);
    objc_msgSend_setUserPersonaNickName_(v2, v47, (uint64_t)v46);

    uint64_t v50 = objc_msgSend_userPersonaType(v3, v48, v49);
    return objc_msgSend_setUserPersonaType_(v2, v51, v50);
  }
  return result;
}

void sub_190C5EB60()
{
}

void sub_190C5EB7C()
{
  *(_WORD *)os_log_t v0 = 0;
  _os_log_error_impl(&dword_190C38000, 0, OS_LOG_TYPE_ERROR, "Failed to fetch our own audit token", v0, 2u);
}

void sub_190C5EBC0()
{
  CFAllocatorRef v0 = (const __CFAllocator *)abort_report_np();
  CFArrayCreateMutable(v0, v1, v2);
}

CFMutableArrayRef CFArrayCreateMutable(CFAllocatorRef allocator, CFIndex capacity, const CFArrayCallBacks *callBacks)
{
  return (CFMutableArrayRef)MEMORY[0x1F40D7190](allocator, capacity, callBacks);
}

CFTypeID CFArrayGetTypeID(void)
{
  return MEMORY[0x1F40D71D8]();
}

CFTypeID CFBooleanGetTypeID(void)
{
  return MEMORY[0x1F40D7420]();
}

Boolean CFBooleanGetValue(CFBooleanRef BOOLean)
{
  return MEMORY[0x1F40D7430](BOOLean);
}

CFTypeID CFDataGetTypeID(void)
{
  return MEMORY[0x1F40D7860]();
}

Boolean CFDictionaryContainsKey(CFDictionaryRef theDict, const void *key)
{
  return MEMORY[0x1F40D7968](theDict, key);
}

CFMutableDictionaryRef CFDictionaryCreateMutable(CFAllocatorRef allocator, CFIndex capacity, const CFDictionaryKeyCallBacks *keyCallBacks, const CFDictionaryValueCallBacks *valueCallBacks)
{
  return (CFMutableDictionaryRef)MEMORY[0x1F40D7998](allocator, capacity, keyCallBacks, valueCallBacks);
}

CFMutableDictionaryRef CFDictionaryCreateMutableCopy(CFAllocatorRef allocator, CFIndex capacity, CFDictionaryRef theDict)
{
  return (CFMutableDictionaryRef)MEMORY[0x1F40D79A8](allocator, capacity, theDict);
}

CFTypeID CFDictionaryGetTypeID(void)
{
  return MEMORY[0x1F40D7A00]();
}

const void *__cdecl CFDictionaryGetValue(CFDictionaryRef theDict, const void *key)
{
  return (const void *)MEMORY[0x1F40D7A10](theDict, key);
}

void CFDictionarySetValue(CFMutableDictionaryRef theDict, const void *key, const void *value)
{
}

Boolean CFEqual(CFTypeRef cf1, CFTypeRef cf2)
{
  return MEMORY[0x1F40D7A68](cf1, cf2);
}

CFErrorRef CFErrorCreate(CFAllocatorRef allocator, CFErrorDomain domain, CFIndex code, CFDictionaryRef userInfo)
{
  return (CFErrorRef)MEMORY[0x1F40D7A98](allocator, domain, code, userInfo);
}

CFTypeID CFGetTypeID(CFTypeRef cf)
{
  return MEMORY[0x1F40D7B80](cf);
}

void CFNotificationCenterAddObserver(CFNotificationCenterRef center, const void *observer, CFNotificationCallback callBack, CFStringRef name, const void *object, CFNotificationSuspensionBehavior suspensionBehavior)
{
}

CFNotificationCenterRef CFNotificationCenterGetDarwinNotifyCenter(void)
{
  return (CFNotificationCenterRef)MEMORY[0x1F40D7D08]();
}

CFTypeID CFNumberGetTypeID(void)
{
  return MEMORY[0x1F40D7E10]();
}

Boolean CFNumberGetValue(CFNumberRef number, CFNumberType theType, void *valuePtr)
{
  return MEMORY[0x1F40D7E20](number, theType, valuePtr);
}

CFPropertyListRef CFPropertyListCreateWithStream(CFAllocatorRef allocator, CFReadStreamRef stream, CFIndex streamLength, CFOptionFlags options, CFPropertyListFormat *format, CFErrorRef *error)
{
  return (CFPropertyListRef)MEMORY[0x1F40D7F58](allocator, stream, streamLength, options, format, error);
}

CFIndex CFPropertyListWrite(CFPropertyListRef propertyList, CFWriteStreamRef stream, CFPropertyListFormat format, CFOptionFlags options, CFErrorRef *error)
{
  return MEMORY[0x1F40D7F70](propertyList, stream, format, options, error);
}

void CFReadStreamClose(CFReadStreamRef stream)
{
}

CFReadStreamRef CFReadStreamCreateWithBytesNoCopy(CFAllocatorRef alloc, const UInt8 *bytes, CFIndex length, CFAllocatorRef bytesDeallocator)
{
  return (CFReadStreamRef)MEMORY[0x1F40D7FB0](alloc, bytes, length, bytesDeallocator);
}

Boolean CFReadStreamOpen(CFReadStreamRef stream)
{
  return MEMORY[0x1F40D7FF8](stream);
}

void CFRelease(CFTypeRef cf)
{
}

CFTypeRef CFRetain(CFTypeRef cf)
{
  return (CFTypeRef)MEMORY[0x1F40D8048](cf);
}

CFStringRef CFStringCreateWithCString(CFAllocatorRef alloc, const char *cStr, CFStringEncoding encoding)
{
  return (CFStringRef)MEMORY[0x1F40D8448](alloc, cStr, *(void *)&encoding);
}

Boolean CFStringGetCString(CFStringRef theString, char *buffer, CFIndex bufferSize, CFStringEncoding encoding)
{
  return MEMORY[0x1F40D8510](theString, buffer, bufferSize, *(void *)&encoding);
}

CFTypeID CFStringGetTypeID(void)
{
  return MEMORY[0x1F40D85F0]();
}

CFUUIDRef CFUUIDCreateFromString(CFAllocatorRef alloc, CFStringRef uuidStr)
{
  return (CFUUIDRef)MEMORY[0x1F40D8998](alloc, uuidStr);
}

CFStringRef CFUUIDCreateString(CFAllocatorRef alloc, CFUUIDRef uuid)
{
  return (CFStringRef)MEMORY[0x1F40D89B0](alloc, uuid);
}

void CFWriteStreamClose(CFWriteStreamRef stream)
{
}

CFTypeRef CFWriteStreamCopyProperty(CFWriteStreamRef stream, CFStreamPropertyKey propertyName)
{
  return (CFTypeRef)MEMORY[0x1F40D8A90](stream, propertyName);
}

CFWriteStreamRef CFWriteStreamCreateWithAllocatedBuffers(CFAllocatorRef alloc, CFAllocatorRef bufferAllocator)
{
  return (CFWriteStreamRef)MEMORY[0x1F40D8AA0](alloc, bufferAllocator);
}

Boolean CFWriteStreamOpen(CFWriteStreamRef stream)
{
  return MEMORY[0x1F40D8AD0](stream);
}

uint64_t MGCopyAnswer()
{
  return MEMORY[0x1F417CDE0]();
}

uint64_t MKBUserSessionGetUserLockStateInfo()
{
  return MEMORY[0x1F412FA08]();
}

void _Block_object_dispose(const void *a1, const int a2)
{
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
}

int *__error(void)
{
  return (int *)MEMORY[0x1F40C9B88]();
}

uint64_t _os_assert_log()
{
  return MEMORY[0x1F40C9F90]();
}

uint64_t _os_crash()
{
  return MEMORY[0x1F40C9FA0]();
}

uint64_t _os_feature_enabled_impl()
{
  return MEMORY[0x1F40C9FB0]();
}

void _os_log_error_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

uint64_t _os_log_send_and_compose_impl()
{
  return MEMORY[0x1F40C9FF8]();
}

uint64_t _sl_dlopen()
{
  return MEMORY[0x1F415B160]();
}

void abort(void)
{
}

uint64_t abort_report_np()
{
  return MEMORY[0x1F40CA1E8]();
}

void bzero(void *a1, size_t a2)
{
}

int close(int a1)
{
  return MEMORY[0x1F40CB3F8](*(void *)&a1);
}

uint64_t csops_audittoken()
{
  return MEMORY[0x1F40CB8D0]();
}

void dispatch_async(dispatch_queue_t queue, dispatch_block_t block)
{
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
}

dispatch_queue_attr_t dispatch_queue_attr_make_with_qos_class(dispatch_queue_attr_t attr, dispatch_qos_class_t qos_class, int relative_priority)
{
  return (dispatch_queue_attr_t)MEMORY[0x1F40CBBB8](attr, *(void *)&qos_class, *(void *)&relative_priority);
}

dispatch_queue_t dispatch_queue_create(const char *label, dispatch_queue_attr_t attr)
{
  return (dispatch_queue_t)MEMORY[0x1F40CBBC0](label, attr);
}

dispatch_semaphore_t dispatch_semaphore_create(intptr_t value)
{
  return (dispatch_semaphore_t)MEMORY[0x1F40CBC30](value);
}

intptr_t dispatch_semaphore_signal(dispatch_semaphore_t dsema)
{
  return MEMORY[0x1F40CBC40](dsema);
}

intptr_t dispatch_semaphore_wait(dispatch_semaphore_t dsema, dispatch_time_t timeout)
{
  return MEMORY[0x1F40CBC50](dsema, timeout);
}

void dispatch_sync(dispatch_queue_t queue, dispatch_block_t block)
{
}

void exit(int a1)
{
}

void free(void *a1)
{
}

int fstat(int a1, stat *a2)
{
  return MEMORY[0x1F40CC2B8](*(void *)&a1, a2);
}

gid_t getgid(void)
{
  return MEMORY[0x1F40CC3D0]();
}

pid_t getpid(void)
{
  return MEMORY[0x1F40CC4A0]();
}

passwd *__cdecl getpwuid(uid_t a1)
{
  return (passwd *)MEMORY[0x1F40CC4E8](*(void *)&a1);
}

uid_t getuid(void)
{
  return MEMORY[0x1F40CC570]();
}

kern_return_t host_get_multiuser_config_flags(host_t host, uint32_t *multiuser_flags)
{
  return MEMORY[0x1F40CC600](*(void *)&host, multiuser_flags);
}

uint64_t kpersona_getpath()
{
  return MEMORY[0x1F40CC738]();
}

uint64_t kpersona_info()
{
  return MEMORY[0x1F40CC740]();
}

mach_port_t mach_host_self(void)
{
  return MEMORY[0x1F40CC950]();
}

kern_return_t mach_port_deallocate(ipc_space_t task, mach_port_name_t name)
{
  return MEMORY[0x1F40CC9B8](*(void *)&task, *(void *)&name);
}

kern_return_t mach_port_type(ipc_space_t task, mach_port_name_t name, mach_port_type_t *ptype)
{
  return MEMORY[0x1F40CCA40](*(void *)&task, *(void *)&name, ptype);
}

uint64_t mach_voucher_persona_self()
{
  return MEMORY[0x1F40CCAC8]();
}

void *__cdecl malloc_type_malloc(size_t size, malloc_type_id_t type_id)
{
  return (void *)MEMORY[0x1F40CCB98](size, type_id);
}

uint32_t notify_check(int token, int *check)
{
  return MEMORY[0x1F40CD038](*(void *)&token, check);
}

uint32_t notify_get_state(int token, uint64_t *state64)
{
  return MEMORY[0x1F40CD040](*(void *)&token, state64);
}

uint32_t notify_post(const char *name)
{
  return MEMORY[0x1F40CD050](name);
}

uint32_t notify_register_check(const char *name, int *out_token)
{
  return MEMORY[0x1F40CD058](name, out_token);
}

uint64_t notify_register_plain()
{
  return MEMORY[0x1F40CD078]();
}

uint32_t notify_set_state(int token, uint64_t state64)
{
  return MEMORY[0x1F40CD088](*(void *)&token, state64);
}

id objc_alloc(Class a1)
{
  return (id)MEMORY[0x1F4181638](a1);
}

uint64_t objc_alloc_init()
{
  return MEMORY[0x1F4181648]();
}

id objc_autorelease(id a1)
{
  return (id)MEMORY[0x1F4181660](a1);
}

id objc_autoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x1F4181678](a1);
}

uint64_t objc_claimAutoreleasedReturnValue()
{
  return MEMORY[0x1F4181688]();
}

void objc_copyWeak(id *to, id *from)
{
}

void objc_destroyWeak(id *location)
{
}

void objc_enumerationMutation(id obj)
{
}

Class objc_getClass(const char *name)
{
  return (Class)MEMORY[0x1F4181728](name);
}

id objc_initWeak(id *location, id val)
{
  return (id)MEMORY[0x1F4181758](location, val);
}

id objc_loadWeakRetained(id *location)
{
  return (id)MEMORY[0x1F4181780](location);
}

id objc_msgSendSuper2(objc_super *a1, SEL a2, ...)
{
  return (id)MEMORY[0x1F41817A8](a1, a2);
}

uint64_t objc_opt_class()
{
  return MEMORY[0x1F41817B0]();
}

uint64_t objc_opt_isKindOfClass()
{
  return MEMORY[0x1F41817B8]();
}

uint64_t objc_opt_new()
{
  return MEMORY[0x1F41817C0]();
}

uint64_t objc_opt_respondsToSelector()
{
  return MEMORY[0x1F41817C8]();
}

uint64_t self
{
  return MEMORY[0x1F41817D0]();
}

void objc_release(id a1)
{
}

id objc_retain(id a1)
{
  return (id)MEMORY[0x1F41818B0](a1);
}

id objc_retainAutorelease(id a1)
{
  return (id)MEMORY[0x1F41818B8](a1);
}

id objc_retainAutoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x1F41818C0](a1);
}

id objc_retainBlock(id a1)
{
  return (id)MEMORY[0x1F41818D0](a1);
}

void objc_setProperty_nonatomic_copy(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
}

void objc_storeStrong(id *location, id obj)
{
}

id objc_storeWeak(id *location, id obj)
{
  return (id)MEMORY[0x1F4181A18](location, obj);
}

int objc_sync_enter(id obj)
{
  return MEMORY[0x1F4181A28](obj);
}

int objc_sync_exit(id obj)
{
  return MEMORY[0x1F4181A30](obj);
}

int open(const char *a1, int a2, ...)
{
  return MEMORY[0x1F40CD0E0](a1, *(void *)&a2);
}

os_log_t os_log_create(const char *subsystem, const char *category)
{
  return (os_log_t)MEMORY[0x1F40CD360](subsystem, category);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x1F40CD3B8](oslog, type);
}

void os_unfair_lock_lock(os_unfair_lock_t lock)
{
}

void os_unfair_lock_unlock(os_unfair_lock_t lock)
{
}

int pipe(int a1[2])
{
  return MEMORY[0x1F40CD760](a1);
}

int quotactl(const char *a1, int a2, int a3, caddr_t a4)
{
  return MEMORY[0x1F40CDBF8](a1, *(void *)&a2, *(void *)&a3, a4);
}

ssize_t read(int a1, void *a2, size_t a3)
{
  return MEMORY[0x1F40CDC50](*(void *)&a1, a2, a3);
}

char *__cdecl realpath_DARWIN_EXTSN(const char *a1, char *a2)
{
  return (char *)MEMORY[0x1F40CDC98](a1, a2);
}

char *__cdecl strerror(int __errnum)
{
  return (char *)MEMORY[0x1F40CE188](*(void *)&__errnum);
}

char *__cdecl strndup(const char *__s1, size_t __n)
{
  return (char *)MEMORY[0x1F40CE200](__s1, __n);
}

char *__cdecl strnstr(const char *__big, const char *__little, size_t __len)
{
  return (char *)MEMORY[0x1F40CE210](__big, __little, __len);
}

int sysctlbyname(const char *a1, void *a2, size_t *a3, void *a4, size_t a5)
{
  return MEMORY[0x1F40CE3D0](a1, a2, a3, a4, a5);
}

void syslog(int a1, const char *a2, ...)
{
}

kern_return_t task_info(task_name_t target_task, task_flavor_t flavor, task_info_t task_info_out, mach_msg_type_number_t *task_info_outCnt)
{
  return MEMORY[0x1F40CE470](*(void *)&target_task, *(void *)&flavor, task_info_out, task_info_outCnt);
}

uint64_t voucher_adopt()
{
  return MEMORY[0x1F40CE708]();
}

uint64_t voucher_copy()
{
  return MEMORY[0x1F40CE710]();
}

uint64_t voucher_copy_with_persona_mach_voucher()
{
  return MEMORY[0x1F40CE718]();
}

uint64_t voucher_get_current_persona()
{
  return MEMORY[0x1F40CE728]();
}

ssize_t write(int __fd, const void *__buf, size_t __nbyte)
{
  return MEMORY[0x1F40CE928](*(void *)&__fd, __buf, __nbyte);
}

uint64_t xpc_connection_set_target_user_session_uid()
{
  return MEMORY[0x1F40CECF0]();
}

uint64_t xpc_mach_send_copy_right()
{
  return MEMORY[0x1F40CF1C0]();
}

uint64_t xpc_mach_send_create()
{
  return MEMORY[0x1F40CF1C8]();
}

uint64_t xpc_strerror()
{
  return MEMORY[0x1F40CF288]();
}

uint64_t xpc_user_sessions_enabled()
{
  return MEMORY[0x1F40CF340]();
}

uint64_t xpc_user_sessions_get_foreground_uid()
{
  return MEMORY[0x1F40CF348]();
}