@interface UMLibInfoProvider
- (id)passwdForUID:(unsigned int)a3 error:(id *)a4;
@end

@implementation UMLibInfoProvider

- (id)passwdForUID:(unsigned int)a3 error:(id *)a4
{
  v26[1] = *MEMORY[0x1E4F143B8];
  if (a4) {
    *a4 = 0;
  }
  *__error() = 0;
  v6 = getpwuid(a3);
  if (v6)
  {
    v7 = sub_190C4D56C((uint64_t)UMPasswd, (uint64_t)v6);
    goto LABEL_34;
  }
  int v8 = *__error();
  if (v8)
  {
    if (qword_1E92A9870 != -1) {
      dispatch_once(&qword_1E92A9870, &unk_1EE0913E0);
    }
    v9 = (id)qword_1E92A98A0;
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      v26[0] = 0;
      unsigned int v10 = sub_190C3E7E8();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
        unsigned int v11 = v10;
      }
      else {
        unsigned int v11 = v10 & 0xFFFFFFFE;
      }
      if (v11)
      {
        LODWORD(v23) = 67109376;
        HIDWORD(v23) = a3;
        __int16 v24 = 1024;
        int v25 = v8;
        int v22 = 14;
        v21 = &v23;
        v12 = (void *)_os_log_send_and_compose_impl();
        if (v12) {
          sub_190C3E7F0();
        }
      }
      else
      {
        v12 = 0;
      }
      free(v12);
    }

    if (a4)
    {
      objc_msgSend_errorWithDomain_code_userInfo_(MEMORY[0x1E4F28C58], v17, *MEMORY[0x1E4F28798], v8, 0, v21, v22, v23);
LABEL_32:
      id v19 = (id)objc_claimAutoreleasedReturnValue();
      v7 = 0;
      *a4 = v19;
      goto LABEL_34;
    }
  }
  else
  {
    if (qword_1E92A9870 != -1) {
      dispatch_once(&qword_1E92A9870, &unk_1EE0913E0);
    }
    v13 = (id)qword_1E92A98A0;
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      uint64_t v23 = 0;
      unsigned int v14 = sub_190C3E7E8();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
        unsigned int v15 = v14;
      }
      else {
        unsigned int v15 = v14 & 0xFFFFFFFE;
      }
      if (v15)
      {
        LODWORD(v26[0]) = 67109120;
        HIDWORD(v26[0]) = a3;
        int v22 = 8;
        v21 = v26;
        v16 = (void *)_os_log_send_and_compose_impl();
        if (v16) {
          sub_190C3E7F0();
        }
      }
      else
      {
        v16 = 0;
      }
      free(v16);
    }

    if (a4)
    {
      objc_msgSend_errorWithDomain_code_userInfo_(MEMORY[0x1E4F28C58], v18, *MEMORY[0x1E4F28798], 2, 0, v21, v22, v23);
      goto LABEL_32;
    }
  }
  v7 = 0;
LABEL_34:
  return v7;
}

@end