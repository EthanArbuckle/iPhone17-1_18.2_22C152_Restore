@interface UMAppleKeyStoreProvider
- (BOOL)addPersonaWithUUID:(id)a3 toSession:(unsigned int)a4 passcode:(id)a5 error:(id *)a6;
- (BOOL)bootstrapVolumeWithMountPoint:(id)a3 user:(unsigned int)a4 error:(id *)a5;
- (BOOL)createIdentityWithUUID:(id)a3 passcode:(id)a4 existingSession:(unsigned int)a5 existingSessionPasscode:(id)a6 error:(id *)a7;
- (BOOL)deleteIdentity:(id)a3 error:(id *)a4;
- (BOOL)deletePersonaWithUUID:(id)a3 fromSession:(unsigned int)a4 error:(id *)a5;
- (BOOL)ignoreIdentityMethods;
- (BOOL)isIdentityLoadedIntoSession:(unsigned int)a3;
- (BOOL)loadIdentity:(id)a3 intoSession:(unsigned int)a4 error:(id *)a5;
- (BOOL)loginIdentity:(id)a3 intoSession:(unsigned int)a4 passcode:(id)a5 error:(id *)a6;
- (BOOL)mapVolume:(id)a3 toSession:(unsigned int)a4 withPersona:(id)a5 error:(id *)a6;
- (BOOL)unloadIdentityFromSession:(unsigned int)a3 error:(id *)a4;
- (BOOL)unlockIdentityInSession:(unsigned int)a3 passcode:(id)a4 error:(id *)a5;
- (BOOL)unmapVolume:(id)a3 error:(id *)a4;
- (id)dataUnwrappingDataWithDeviceClassF:(id)a3 error:(id *)a4;
- (id)dataWrappingDataWithDeviceClassF:(id)a3 error:(id *)a4;
- (void)setIgnoreIdentityMethods:(BOOL)a3;
@end

@implementation UMAppleKeyStoreProvider

- (BOOL)bootstrapVolumeWithMountPoint:(id)a3 user:(unsigned int)a4 error:(id *)a5
{
  id v7 = a3;
  if (a5) {
    *a5 = 0;
  }
  if ([(UMAppleKeyStoreProvider *)self ignoreIdentityMethods])
  {
    if (qword_26B3F3E70 != -1) {
      dispatch_once(&qword_26B3F3E70, &unk_270CA9FA8);
    }
    v8 = (id)qword_26B3F3E60;
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      unsigned int v9 = sub_2608CE99C();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT)) {
        unsigned int v10 = v9;
      }
      else {
        unsigned int v10 = v9 & 0xFFFFFFFE;
      }
      if (v10)
      {
        uint64_t v11 = _os_log_send_and_compose_impl();
        v12 = (void *)v11;
        if (v11) {
          sub_2608CE9C4(v11);
        }
      }
      else
      {
        v12 = 0;
      }
      free(v12);
    }

    char v13 = 1;
  }
  else
  {
    char v13 = AKSVolumeBootstrapFS();
    if ((v13 & 1) == 0)
    {
      if (qword_26B3F3E70 != -1) {
        dispatch_once(&qword_26B3F3E70, &unk_270CA9FA8);
      }
      v14 = (id)qword_26B3F3E60;
      if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      {
        unsigned int v15 = sub_2608CE99C();
        if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
          unsigned int v16 = v15;
        }
        else {
          unsigned int v16 = v15 & 0xFFFFFFFE;
        }
        if (v16)
        {
          uint64_t v17 = _os_log_send_and_compose_impl();
          v18 = (void *)v17;
          if (v17) {
            sub_2608CE9C4(v17);
          }
        }
        else
        {
          v18 = 0;
        }
        free(v18);
      }

      if (a5) {
        *a5 = 0;
      }
      CFRelease(0);
    }
  }

  return v13;
}

- (id)dataWrappingDataWithDeviceClassF:(id)a3 error:(id *)a4
{
  uint64_t v28 = *MEMORY[0x263EF8340];
  id v5 = a3;
  v6 = v5;
  if (a4) {
    *a4 = 0;
  }
  if ((unint64_t)[v5 length] < 0x21)
  {
    memset(v27, 0, sizeof(v27));
    id v11 = v6;
    [v11 bytes];
    [v11 length];
    int v12 = aks_wrap_key();
    if (!v12)
    {
      v19 = [MEMORY[0x263EFF8F8] dataWithBytes:v27 length:40];
      goto LABEL_33;
    }
    int v13 = v12;
    if (qword_26B3F3E70 != -1) {
      dispatch_once(&qword_26B3F3E70, &unk_270CA9FA8);
    }
    v14 = (id)qword_26B3F3E60;
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      unsigned int v15 = sub_2608CE99C();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
        unsigned int v16 = v15;
      }
      else {
        unsigned int v16 = v15 & 0xFFFFFFFE;
      }
      if (v16)
      {
        v26[0] = 67109120;
        v26[1] = v13;
        LODWORD(v25) = 8;
        v24 = v26;
        uint64_t v17 = _os_log_send_and_compose_impl();
        v18 = (void *)v17;
        if (v17) {
          sub_2608CE9C4(v17);
        }
      }
      else
      {
        v18 = 0;
      }
      free(v18);
    }

    if (a4)
    {
      v20 = (void *)MEMORY[0x263F087E8];
      uint64_t v21 = *MEMORY[0x263F08350];
      uint64_t v22 = v13;
      goto LABEL_31;
    }
  }
  else
  {
    if (qword_26B3F3E70 != -1) {
      dispatch_once(&qword_26B3F3E70, &unk_270CA9FA8);
    }
    id v7 = (id)qword_26B3F3E60;
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      int v8 = sub_2608CE99C();
      if (!os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
        v8 &= ~1u;
      }
      if (v8)
      {
        unsigned int v9 = v7;
        LODWORD(v27[0]) = 134217984;
        *(void *)((char *)v27 + 4) = [v6 length];
        LODWORD(v25) = 12;
        v24 = v27;
        unsigned int v10 = (void *)_os_log_send_and_compose_impl();

        if (v10) {
          sub_2608CE9C4((uint64_t)v10);
        }
      }
      else
      {
        unsigned int v10 = 0;
      }
      free(v10);
    }

    if (a4)
    {
      v20 = (void *)MEMORY[0x263F087E8];
      uint64_t v21 = *MEMORY[0x263F08438];
      uint64_t v22 = 22;
LABEL_31:
      objc_msgSend(v20, "errorWithDomain:code:userInfo:", v21, v22, 0, v24, v25);
      v19 = 0;
      *a4 = (id)objc_claimAutoreleasedReturnValue();
      goto LABEL_33;
    }
  }
  v19 = 0;
LABEL_33:

  return v19;
}

- (id)dataUnwrappingDataWithDeviceClassF:(id)a3 error:(id *)a4
{
  uint64_t v30 = *MEMORY[0x263EF8340];
  id v5 = a3;
  v6 = v5;
  if (a4) {
    *a4 = 0;
  }
  if ((unint64_t)[v5 length] >= 0x29)
  {
    if (qword_26B3F3E70 != -1) {
      dispatch_once(&qword_26B3F3E70, &unk_270CA9FA8);
    }
    id v7 = (id)qword_26B3F3E60;
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      int v8 = sub_2608CE99C();
      if (!os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
        v8 &= ~1u;
      }
      if (v8)
      {
        unsigned int v9 = v7;
        LODWORD(v29[0]) = 134217984;
        *(void *)((char *)v29 + 4) = [v6 length];
        LODWORD(v27) = 12;
        v26 = v29;
        unsigned int v10 = (void *)_os_log_send_and_compose_impl();

        if (v10) {
          sub_2608CE9C4((uint64_t)v10);
        }
      }
      else
      {
        unsigned int v10 = 0;
      }
      free(v10);
    }

    if (a4)
    {
      uint64_t v22 = (void *)MEMORY[0x263F087E8];
      uint64_t v23 = *MEMORY[0x263F08438];
      uint64_t v24 = 22;
LABEL_41:
      objc_msgSend(v22, "errorWithDomain:code:userInfo:", v23, v24, 0, v26, v27);
      uint64_t v17 = 0;
      *a4 = (id)objc_claimAutoreleasedReturnValue();
      goto LABEL_43;
    }
    goto LABEL_42;
  }
  memset(v29, 0, sizeof(v29));
  id v11 = v6;
  [v11 bytes];
  [v11 length];
  int v12 = aks_unwrap_key();
  if (!v12)
  {
    uint64_t v17 = [MEMORY[0x263EFF8F8] dataWithBytes:v29 length:32];
    goto LABEL_43;
  }
  int v13 = v12;
  if (v12 == -536362989)
  {
    if (qword_26B3F3E70 != -1) {
      dispatch_once(&qword_26B3F3E70, &unk_270CA9FA8);
    }
    v14 = (id)qword_26B3F3E60;
    if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
    {
      unsigned int v15 = sub_2608CE99C();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO)) {
        unsigned int v16 = v15;
      }
      else {
        unsigned int v16 = v15 & 0xFFFFFFFE;
      }
      if (v16)
      {
        LOWORD(v28[0]) = 0;
        LODWORD(v27) = 2;
        v26 = v28;
        goto LABEL_31;
      }
      goto LABEL_37;
    }
  }
  else
  {
    if (qword_26B3F3E70 != -1) {
      dispatch_once(&qword_26B3F3E70, &unk_270CA9FA8);
    }
    v14 = (id)qword_26B3F3E60;
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      unsigned int v18 = sub_2608CE99C();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
        unsigned int v19 = v18;
      }
      else {
        unsigned int v19 = v18 & 0xFFFFFFFE;
      }
      if (v19)
      {
        v28[0] = 67109120;
        v28[1] = v13;
        LODWORD(v27) = 8;
        v26 = v28;
LABEL_31:
        uint64_t v20 = _os_log_send_and_compose_impl();
        uint64_t v21 = (void *)v20;
        if (v20) {
          sub_2608CE9C4(v20);
        }
        goto LABEL_38;
      }
LABEL_37:
      uint64_t v21 = 0;
LABEL_38:
      free(v21);
    }
  }

  if (a4)
  {
    uint64_t v22 = (void *)MEMORY[0x263F087E8];
    uint64_t v23 = *MEMORY[0x263F08350];
    uint64_t v24 = v13;
    goto LABEL_41;
  }
LABEL_42:
  uint64_t v17 = 0;
LABEL_43:

  return v17;
}

- (BOOL)createIdentityWithUUID:(id)a3 passcode:(id)a4 existingSession:(unsigned int)a5 existingSessionPasscode:(id)a6 error:(id *)a7
{
  id v11 = a3;
  if (a7) {
    *a7 = 0;
  }
  id v12 = a6;
  id v13 = a4;
  CFUUIDRef v14 = sub_2608CA844(v11);
  sub_2608C7D1C(self, v13);

  sub_2608C7D1C(self, v12);
  char v15 = AKSIdentityCreate();
  if (v15)
  {
    if (qword_26B3F3E70 != -1) {
      dispatch_once(&qword_26B3F3E70, &unk_270CA9FA8);
    }
    unsigned int v16 = (id)qword_26B3F3E60;
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      unsigned int v17 = sub_2608CE99C();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT)) {
        unsigned int v18 = v17;
      }
      else {
        unsigned int v18 = v17 & 0xFFFFFFFE;
      }
      if (v18)
      {
        uint64_t v19 = _os_log_send_and_compose_impl();
        uint64_t v20 = (void *)v19;
        if (v19) {
          sub_2608CE9C4(v19);
        }
      }
      else
      {
        uint64_t v20 = 0;
      }
      free(v20);
    }
  }
  else
  {
    if (qword_26B3F3E70 != -1) {
      dispatch_once(&qword_26B3F3E70, &unk_270CA9FA8);
    }
    uint64_t v21 = (id)qword_26B3F3E60;
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
    {
      unsigned int v22 = sub_2608CE99C();
      if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR)) {
        unsigned int v23 = v22;
      }
      else {
        unsigned int v23 = v22 & 0xFFFFFFFE;
      }
      if (v23)
      {
        uint64_t v24 = _os_log_send_and_compose_impl();
        uint64_t v25 = (void *)v24;
        if (v24) {
          sub_2608CE9C4(v24);
        }
      }
      else
      {
        uint64_t v25 = 0;
      }
      free(v25);
    }

    if (a7) {
      *a7 = 0;
    }
    else {
      CFRelease(0);
    }
  }
  CFRelease(v14);

  return v15;
}

- (BOOL)deleteIdentity:(id)a3 error:(id *)a4
{
  id v5 = a3;
  v6 = v5;
  if (a4) {
    *a4 = 0;
  }
  CFUUIDRef v7 = sub_2608CA844(v5);
  char v8 = AKSIdentityDelete();
  if (v8)
  {
    if (qword_26B3F3E70 != -1) {
      dispatch_once(&qword_26B3F3E70, &unk_270CA9FA8);
    }
    unsigned int v9 = (id)qword_26B3F3E60;
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      unsigned int v10 = sub_2608CE99C();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT)) {
        unsigned int v11 = v10;
      }
      else {
        unsigned int v11 = v10 & 0xFFFFFFFE;
      }
      if (v11)
      {
        uint64_t v12 = _os_log_send_and_compose_impl();
        id v13 = (void *)v12;
        if (v12) {
          sub_2608CE9C4(v12);
        }
      }
      else
      {
        id v13 = 0;
      }
      free(v13);
    }
  }
  else
  {
    if (qword_26B3F3E70 != -1) {
      dispatch_once(&qword_26B3F3E70, &unk_270CA9FA8);
    }
    CFUUIDRef v14 = (id)qword_26B3F3E60;
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      unsigned int v15 = sub_2608CE99C();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
        unsigned int v16 = v15;
      }
      else {
        unsigned int v16 = v15 & 0xFFFFFFFE;
      }
      if (v16)
      {
        uint64_t v17 = _os_log_send_and_compose_impl();
        unsigned int v18 = (void *)v17;
        if (v17) {
          sub_2608CE9C4(v17);
        }
      }
      else
      {
        unsigned int v18 = 0;
      }
      free(v18);
    }

    if (a4) {
      *a4 = 0;
    }
    else {
      CFRelease(0);
    }
  }
  CFRelease(v7);

  return v8;
}

- (BOOL)isIdentityLoadedIntoSession:(unsigned int)a3
{
  int system = aks_get_system();
  int v4 = system;
  if (system)
  {
    if (system == -536870160)
    {
      if (qword_26B3F3E70 != -1) {
        dispatch_once(&qword_26B3F3E70, &unk_270CA9FA8);
      }
      id v5 = (id)qword_26B3F3E60;
      if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
      {
        unsigned int v6 = sub_2608CE99C();
        if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
          unsigned int v7 = v6;
        }
        else {
          unsigned int v7 = v6 & 0xFFFFFFFE;
        }
        if (v7)
        {
LABEL_26:
          uint64_t v12 = _os_log_send_and_compose_impl();
          id v13 = (void *)v12;
          if (v12) {
            sub_2608CE9C4(v12);
          }
          goto LABEL_29;
        }
LABEL_28:
        id v13 = 0;
LABEL_29:
        free(v13);
      }
    }
    else
    {
      if (qword_26B3F3E70 != -1) {
        dispatch_once(&qword_26B3F3E70, &unk_270CA9FA8);
      }
      id v5 = (id)qword_26B3F3E60;
      if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      {
        unsigned int v10 = sub_2608CE99C();
        if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
          unsigned int v11 = v10;
        }
        else {
          unsigned int v11 = v10 & 0xFFFFFFFE;
        }
        if (v11) {
          goto LABEL_26;
        }
        goto LABEL_28;
      }
    }
  }
  else
  {
    if (qword_26B3F3E70 != -1) {
      dispatch_once(&qword_26B3F3E70, &unk_270CA9FA8);
    }
    id v5 = (id)qword_26B3F3E60;
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
    {
      unsigned int v8 = sub_2608CE99C();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
        unsigned int v9 = v8;
      }
      else {
        unsigned int v9 = v8 & 0xFFFFFFFE;
      }
      if (v9) {
        goto LABEL_26;
      }
      goto LABEL_28;
    }
  }

  return v4 == 0;
}

- (BOOL)loadIdentity:(id)a3 intoSession:(unsigned int)a4 error:(id *)a5
{
  id v6 = a3;
  unsigned int v7 = v6;
  if (a5) {
    *a5 = 0;
  }
  CFUUIDRef v8 = sub_2608CA844(v6);
  char v9 = AKSIdentityLoad();
  if (v9)
  {
    if (qword_26B3F3E70 != -1) {
      dispatch_once(&qword_26B3F3E70, &unk_270CA9FA8);
    }
    unsigned int v10 = (id)qword_26B3F3E60;
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      unsigned int v11 = sub_2608CE99C();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT)) {
        unsigned int v12 = v11;
      }
      else {
        unsigned int v12 = v11 & 0xFFFFFFFE;
      }
      if (v12)
      {
        uint64_t v13 = _os_log_send_and_compose_impl();
        CFUUIDRef v14 = (void *)v13;
        if (v13) {
          sub_2608CE9C4(v13);
        }
      }
      else
      {
        CFUUIDRef v14 = 0;
      }
      free(v14);
    }
  }
  else
  {
    if (qword_26B3F3E70 != -1) {
      dispatch_once(&qword_26B3F3E70, &unk_270CA9FA8);
    }
    unsigned int v15 = (id)qword_26B3F3E60;
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      unsigned int v16 = sub_2608CE99C();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR)) {
        unsigned int v17 = v16;
      }
      else {
        unsigned int v17 = v16 & 0xFFFFFFFE;
      }
      if (v17)
      {
        uint64_t v18 = _os_log_send_and_compose_impl();
        uint64_t v19 = (void *)v18;
        if (v18) {
          sub_2608CE9C4(v18);
        }
      }
      else
      {
        uint64_t v19 = 0;
      }
      free(v19);
    }

    if (a5) {
      *a5 = 0;
    }
    else {
      CFRelease(0);
    }
  }
  CFRelease(v8);

  return v9;
}

- (BOOL)unloadIdentityFromSession:(unsigned int)a3 error:(id *)a4
{
  if (a4) {
    *a4 = 0;
  }
  char v5 = AKSIdentityUnload();
  if (v5)
  {
    if (qword_26B3F3E70 != -1) {
      dispatch_once(&qword_26B3F3E70, &unk_270CA9FA8);
    }
    id v6 = (id)qword_26B3F3E60;
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      unsigned int v7 = sub_2608CE99C();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT)) {
        unsigned int v8 = v7;
      }
      else {
        unsigned int v8 = v7 & 0xFFFFFFFE;
      }
      if (v8)
      {
        uint64_t v9 = _os_log_send_and_compose_impl();
        unsigned int v10 = (void *)v9;
        if (v9) {
          sub_2608CE9C4(v9);
        }
      }
      else
      {
        unsigned int v10 = 0;
      }
      free(v10);
    }
  }
  else
  {
    if (qword_26B3F3E70 != -1) {
      dispatch_once(&qword_26B3F3E70, &unk_270CA9FA8);
    }
    unsigned int v11 = (id)qword_26B3F3E60;
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      unsigned int v12 = sub_2608CE99C();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
        unsigned int v13 = v12;
      }
      else {
        unsigned int v13 = v12 & 0xFFFFFFFE;
      }
      if (v13)
      {
        uint64_t v14 = _os_log_send_and_compose_impl();
        unsigned int v15 = (void *)v14;
        if (v14) {
          sub_2608CE9C4(v14);
        }
      }
      else
      {
        unsigned int v15 = 0;
      }
      free(v15);
    }

    if (a4) {
      *a4 = 0;
    }
    else {
      CFRelease(0);
    }
  }
  return v5;
}

- (BOOL)unlockIdentityInSession:(unsigned int)a3 passcode:(id)a4 error:(id *)a5
{
  if (a5) {
    *a5 = 0;
  }
  sub_2608C7D1C(self, a4);
  id v6 = objc_claimAutoreleasedReturnValue();
  [v6 bytes];
  [v6 length];
  int v7 = aks_unlock_device();
  if (v7)
  {
    if (qword_26B3F3E70 != -1) {
      dispatch_once(&qword_26B3F3E70, &unk_270CA9FA8);
    }
    unsigned int v8 = (id)qword_26B3F3E60;
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      unsigned int v9 = sub_2608CE99C();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
        unsigned int v10 = v9;
      }
      else {
        unsigned int v10 = v9 & 0xFFFFFFFE;
      }
      if (v10)
      {
        uint64_t v11 = _os_log_send_and_compose_impl();
        unsigned int v12 = (void *)v11;
        if (v11) {
          sub_2608CE9C4(v11);
        }
      }
      else
      {
        unsigned int v12 = 0;
      }
      free(v12);
    }

    if (a5)
    {
      *a5 = [MEMORY[0x263F087E8] errorWithDomain:*MEMORY[0x263F08410] code:v7 userInfo:0];
    }
  }
  else
  {
    if (qword_26B3F3E70 != -1) {
      dispatch_once(&qword_26B3F3E70, &unk_270CA9FA8);
    }
    unsigned int v13 = (id)qword_26B3F3E60;
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      unsigned int v14 = sub_2608CE99C();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT)) {
        unsigned int v15 = v14;
      }
      else {
        unsigned int v15 = v14 & 0xFFFFFFFE;
      }
      if (v15)
      {
        uint64_t v16 = _os_log_send_and_compose_impl();
        unsigned int v17 = (void *)v16;
        if (v16) {
          sub_2608CE9C4(v16);
        }
      }
      else
      {
        unsigned int v17 = 0;
      }
      free(v17);
    }
  }
  return v7 == 0;
}

- (BOOL)loginIdentity:(id)a3 intoSession:(unsigned int)a4 passcode:(id)a5 error:(id *)a6
{
  id v9 = a3;
  if (a6) {
    *a6 = 0;
  }
  id v10 = a5;
  CFUUIDRef v11 = sub_2608CA844(v9);
  sub_2608C7D1C(self, v10);

  char v12 = AKSIdentityLogin();
  if (v12)
  {
    if (qword_26B3F3E70 != -1) {
      dispatch_once(&qword_26B3F3E70, &unk_270CA9FA8);
    }
    unsigned int v13 = (id)qword_26B3F3E60;
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      unsigned int v14 = sub_2608CE99C();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT)) {
        unsigned int v15 = v14;
      }
      else {
        unsigned int v15 = v14 & 0xFFFFFFFE;
      }
      if (v15)
      {
        uint64_t v16 = _os_log_send_and_compose_impl();
        unsigned int v17 = (void *)v16;
        if (v16) {
          sub_2608CE9C4(v16);
        }
      }
      else
      {
        unsigned int v17 = 0;
      }
      free(v17);
    }
  }
  else
  {
    if (qword_26B3F3E70 != -1) {
      dispatch_once(&qword_26B3F3E70, &unk_270CA9FA8);
    }
    uint64_t v18 = (id)qword_26B3F3E60;
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
    {
      unsigned int v19 = sub_2608CE99C();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR)) {
        unsigned int v20 = v19;
      }
      else {
        unsigned int v20 = v19 & 0xFFFFFFFE;
      }
      if (v20)
      {
        uint64_t v21 = _os_log_send_and_compose_impl();
        unsigned int v22 = (void *)v21;
        if (v21) {
          sub_2608CE9C4(v21);
        }
      }
      else
      {
        unsigned int v22 = 0;
      }
      free(v22);
    }

    if (a6) {
      *a6 = 0;
    }
    else {
      CFRelease(0);
    }
  }
  CFRelease(v11);

  return v12;
}

- (BOOL)addPersonaWithUUID:(id)a3 toSession:(unsigned int)a4 passcode:(id)a5 error:(id *)a6
{
  id v9 = a3;
  if (a6) {
    *a6 = 0;
  }
  id v10 = a5;
  CFUUIDRef v11 = sub_2608CA844(v9);
  sub_2608C7D1C(self, v10);

  char v12 = AKSIdentityAddPersona();
  if (v12)
  {
    if (qword_26B3F3E70 != -1) {
      dispatch_once(&qword_26B3F3E70, &unk_270CA9FA8);
    }
    unsigned int v13 = (id)qword_26B3F3E60;
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      unsigned int v14 = sub_2608CE99C();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT)) {
        unsigned int v15 = v14;
      }
      else {
        unsigned int v15 = v14 & 0xFFFFFFFE;
      }
      if (v15)
      {
        uint64_t v16 = _os_log_send_and_compose_impl();
        unsigned int v17 = (void *)v16;
        if (v16) {
          sub_2608CE9C4(v16);
        }
      }
      else
      {
        unsigned int v17 = 0;
      }
      free(v17);
    }
  }
  else
  {
    if (qword_26B3F3E70 != -1) {
      dispatch_once(&qword_26B3F3E70, &unk_270CA9FA8);
    }
    uint64_t v18 = (id)qword_26B3F3E60;
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
    {
      unsigned int v19 = sub_2608CE99C();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR)) {
        unsigned int v20 = v19;
      }
      else {
        unsigned int v20 = v19 & 0xFFFFFFFE;
      }
      if (v20)
      {
        uint64_t v21 = _os_log_send_and_compose_impl();
        unsigned int v22 = (void *)v21;
        if (v21) {
          sub_2608CE9C4(v21);
        }
      }
      else
      {
        unsigned int v22 = 0;
      }
      free(v22);
    }

    if (a6) {
      *a6 = 0;
    }
    else {
      CFRelease(0);
    }
  }
  CFRelease(v11);

  return v12;
}

- (BOOL)deletePersonaWithUUID:(id)a3 fromSession:(unsigned int)a4 error:(id *)a5
{
  id v6 = a3;
  int v7 = v6;
  if (a5) {
    *a5 = 0;
  }
  CFUUIDRef v8 = sub_2608CA844(v6);
  char v9 = AKSIdentityDeletePersona();
  if (v9)
  {
    if (qword_26B3F3E70 != -1) {
      dispatch_once(&qword_26B3F3E70, &unk_270CA9FA8);
    }
    id v10 = (id)qword_26B3F3E60;
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      unsigned int v11 = sub_2608CE99C();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT)) {
        unsigned int v12 = v11;
      }
      else {
        unsigned int v12 = v11 & 0xFFFFFFFE;
      }
      if (v12)
      {
        uint64_t v13 = _os_log_send_and_compose_impl();
        unsigned int v14 = (void *)v13;
        if (v13) {
          sub_2608CE9C4(v13);
        }
      }
      else
      {
        unsigned int v14 = 0;
      }
      free(v14);
    }
  }
  else
  {
    if (qword_26B3F3E70 != -1) {
      dispatch_once(&qword_26B3F3E70, &unk_270CA9FA8);
    }
    unsigned int v15 = (id)qword_26B3F3E60;
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      unsigned int v16 = sub_2608CE99C();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR)) {
        unsigned int v17 = v16;
      }
      else {
        unsigned int v17 = v16 & 0xFFFFFFFE;
      }
      if (v17)
      {
        uint64_t v18 = _os_log_send_and_compose_impl();
        unsigned int v19 = (void *)v18;
        if (v18) {
          sub_2608CE9C4(v18);
        }
      }
      else
      {
        unsigned int v19 = 0;
      }
      free(v19);
    }

    if (a5) {
      *a5 = 0;
    }
    else {
      CFRelease(0);
    }
  }
  CFRelease(v8);

  return v9;
}

- (BOOL)mapVolume:(id)a3 toSession:(unsigned int)a4 withPersona:(id)a5 error:(id *)a6
{
  id v9 = a3;
  id v10 = a5;
  if (a6) {
    *a6 = 0;
  }
  if ([(UMAppleKeyStoreProvider *)self ignoreIdentityMethods])
  {
    if (qword_26B3F3E70 != -1) {
      dispatch_once(&qword_26B3F3E70, &unk_270CA9FA8);
    }
    unsigned int v11 = (id)qword_26B3F3E60;
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      unsigned int v12 = sub_2608CE99C();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT)) {
        unsigned int v13 = v12;
      }
      else {
        unsigned int v13 = v12 & 0xFFFFFFFE;
      }
      if (v13)
      {
        uint64_t v14 = _os_log_send_and_compose_impl();
        unsigned int v15 = (void *)v14;
        if (v14) {
          sub_2608CE9C4(v14);
        }
      }
      else
      {
        unsigned int v15 = 0;
      }
      free(v15);
    }

    char v17 = 1;
    goto LABEL_44;
  }
  CFUUIDRef v16 = sub_2608CA844(v10);
  char v17 = AKSVolumeMap();
  if ((v17 & 1) == 0)
  {
    if (qword_26B3F3E70 != -1) {
      dispatch_once(&qword_26B3F3E70, &unk_270CA9FA8);
    }
    unsigned int v23 = (id)qword_26B3F3E60;
    if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
    {
      unsigned int v24 = sub_2608CE99C();
      if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR)) {
        unsigned int v25 = v24;
      }
      else {
        unsigned int v25 = v24 & 0xFFFFFFFE;
      }
      if (v25)
      {
        uint64_t v26 = _os_log_send_and_compose_impl();
        uint64_t v27 = (void *)v26;
        if (v26) {
          sub_2608CE9C4(v26);
        }
      }
      else
      {
        uint64_t v27 = 0;
      }
      free(v27);
    }

    if (a6)
    {
      *a6 = 0;
      if (!v10) {
        goto LABEL_44;
      }
    }
    else
    {
      CFRelease(0);
      if (!v10) {
        goto LABEL_44;
      }
    }
LABEL_43:
    CFRelease(v16);
    goto LABEL_44;
  }
  if (qword_26B3F3E70 != -1) {
    dispatch_once(&qword_26B3F3E70, &unk_270CA9FA8);
  }
  uint64_t v18 = (id)qword_26B3F3E60;
  if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
  {
    unsigned int v19 = sub_2608CE99C();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT)) {
      unsigned int v20 = v19;
    }
    else {
      unsigned int v20 = v19 & 0xFFFFFFFE;
    }
    if (v20)
    {
      uint64_t v21 = _os_log_send_and_compose_impl();
      unsigned int v22 = (void *)v21;
      if (v21) {
        sub_2608CE9C4(v21);
      }
    }
    else
    {
      unsigned int v22 = 0;
    }
    free(v22);
  }

  if (v10) {
    goto LABEL_43;
  }
LABEL_44:

  return v17;
}

- (BOOL)unmapVolume:(id)a3 error:(id *)a4
{
  id v6 = a3;
  if (a4) {
    *a4 = 0;
  }
  if ([(UMAppleKeyStoreProvider *)self ignoreIdentityMethods])
  {
    if (qword_26B3F3E70 != -1) {
      dispatch_once(&qword_26B3F3E70, &unk_270CA9FA8);
    }
    int v7 = (id)qword_26B3F3E60;
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      unsigned int v8 = sub_2608CE99C();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT)) {
        unsigned int v9 = v8;
      }
      else {
        unsigned int v9 = v8 & 0xFFFFFFFE;
      }
      if (v9)
      {
        uint64_t v10 = _os_log_send_and_compose_impl();
        unsigned int v11 = (void *)v10;
        if (v10) {
          sub_2608CE9C4(v10);
        }
      }
      else
      {
        unsigned int v11 = 0;
      }
      free(v11);
    }

    char v12 = 1;
  }
  else
  {
    char v12 = AKSVolumeUnmap();
    if (v12)
    {
      if (qword_26B3F3E70 != -1) {
        dispatch_once(&qword_26B3F3E70, &unk_270CA9FA8);
      }
      unsigned int v13 = (id)qword_26B3F3E60;
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
      {
        unsigned int v14 = sub_2608CE99C();
        if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT)) {
          unsigned int v15 = v14;
        }
        else {
          unsigned int v15 = v14 & 0xFFFFFFFE;
        }
        if (v15)
        {
          uint64_t v16 = _os_log_send_and_compose_impl();
          char v17 = (void *)v16;
          if (v16) {
            sub_2608CE9C4(v16);
          }
        }
        else
        {
          char v17 = 0;
        }
        free(v17);
      }
    }
    else
    {
      if (qword_26B3F3E70 != -1) {
        dispatch_once(&qword_26B3F3E70, &unk_270CA9FA8);
      }
      uint64_t v18 = (id)qword_26B3F3E60;
      if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
      {
        unsigned int v19 = sub_2608CE99C();
        if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR)) {
          unsigned int v20 = v19;
        }
        else {
          unsigned int v20 = v19 & 0xFFFFFFFE;
        }
        if (v20)
        {
          uint64_t v21 = _os_log_send_and_compose_impl();
          unsigned int v22 = (void *)v21;
          if (v21) {
            sub_2608CE9C4(v21);
          }
        }
        else
        {
          unsigned int v22 = 0;
        }
        free(v22);
      }

      if (a4) {
        *a4 = 0;
      }
      else {
        CFRelease(0);
      }
    }
  }

  return v12;
}

- (BOOL)ignoreIdentityMethods
{
  return self->_ignoreIdentityMethods;
}

- (void)setIgnoreIdentityMethods:(BOOL)a3
{
  self->_ignoreIdentityMethods = a3;
}

@end