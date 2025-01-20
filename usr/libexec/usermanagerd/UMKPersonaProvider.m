@interface UMKPersonaProvider
- (BOOL)allocatePersonaWithInfo:(id)a3 andPath:(id)a4 error:(id *)a5;
- (BOOL)deallocatePersonaWithID:(unsigned int)a3 error:(id *)a4;
- (id)infoForPersonaWithID:(unsigned int)a3 error:(id *)a4;
- (id)infoForProcessWithPID:(int)a3 error:(id *)a4;
@end

@implementation UMKPersonaProvider

- (BOOL)allocatePersonaWithInfo:(id)a3 andPath:(id)a4 error:(id *)a5
{
  id v7 = a3;
  id v8 = a4;
  if (a5) {
    *a5 = 0;
  }
  memset(v61, 0, 348);
  double v9 = sub_10008513C(v7, (uint64_t)v61);
  if (!LODWORD(v61[0]))
  {
    if (qword_1000E41C0 != -1) {
      dispatch_once(&qword_1000E41C0, &stru_1000D5C98);
    }
    v14 = (id)qword_1000E41B8;
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      uint64_t v50 = 0;
      unsigned int v15 = sub_100055404(0);
      if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
        unsigned int v16 = v15;
      }
      else {
        unsigned int v16 = v15 & 0xFFFFFFFE;
      }
      if (v16)
      {
        LOWORD(v49[0]) = 0;
        LODWORD(v48) = 2;
        v47 = v49;
        v17 = (const char *)_os_log_send_and_compose_impl();
        v18 = (char *)v17;
        if (v17) {
          sub_100055434(v17);
        }
      }
      else
      {
        v18 = 0;
      }
      free(v18);
    }

    if (a5)
    {
      NSErrorDomain v33 = NSPOSIXErrorDomain;
      uint64_t v34 = 22;
LABEL_61:
      +[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", v33, v34, 0, v47, v48);
      BOOL v35 = 0;
      *a5 = (id)objc_claimAutoreleasedReturnValue();
      goto LABEL_82;
    }
LABEL_66:
    BOOL v35 = 0;
    goto LABEL_82;
  }
  if (v8)
  {
    if ((objc_msgSend(v8, "getCString:maxLength:encoding:", &v50, 1024, 4, v9) & 1) == 0)
    {
      if (qword_1000E41C0 != -1) {
        dispatch_once(&qword_1000E41C0, &stru_1000D5C98);
      }
      v23 = (id)qword_1000E41B8;
      if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
      {
        unsigned int v24 = sub_100055404(0);
        if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR)) {
          unsigned int v25 = v24;
        }
        else {
          unsigned int v25 = v24 & 0xFFFFFFFE;
        }
        if (v25)
        {
          LODWORD(v49[0]) = 138543362;
          *(void *)((char *)v49 + 4) = v8;
          v26 = (const char *)_os_log_send_and_compose_impl();
          v27 = (char *)v26;
          if (v26) {
            sub_100055434(v26);
          }
        }
        else
        {
          v27 = 0;
        }
        free(v27);
      }

      if (a5)
      {
        *a5 = +[NSError errorWithDomain:NSPOSIXErrorDomain code:22 userInfo:0];
      }
      goto LABEL_66;
    }
    if (kpersona_palloc())
    {
      int v10 = *__error();
      if (qword_1000E41C0 != -1) {
        dispatch_once(&qword_1000E41C0, &stru_1000D5C98);
      }
      v11 = (id)qword_1000E41B8;
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      {
        v49[0] = 0;
        unsigned int v12 = sub_100055404(0);
        if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
          unsigned int v13 = v12;
        }
        else {
          unsigned int v13 = v12 & 0xFFFFFFFE;
        }
        if (v13)
        {
          LODWORD(v50) = 67110402;
          HIDWORD(v50) = DWORD1(v61[0]);
          __int16 v51 = 1024;
          int v52 = DWORD2(v61[0]);
          __int16 v53 = 2082;
          v54 = (char *)&v61[5] + 8;
          __int16 v55 = 1024;
          int v56 = DWORD2(v61[21]);
          __int16 v57 = 2114;
          id v58 = v8;
          __int16 v59 = 1024;
          int v60 = v10;
          LODWORD(v48) = 46;
          v47 = &v50;
          goto LABEL_33;
        }
        goto LABEL_57;
      }
      goto LABEL_59;
    }
  }
  else if (kpersona_alloc())
  {
    int v10 = *__error();
    if (qword_1000E41C0 != -1) {
      dispatch_once(&qword_1000E41C0, &stru_1000D5C98);
    }
    v11 = (id)qword_1000E41B8;
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      v49[0] = 0;
      unsigned int v19 = sub_100055404(0);
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
        unsigned int v20 = v19;
      }
      else {
        unsigned int v20 = v19 & 0xFFFFFFFE;
      }
      if (v20)
      {
        LODWORD(v50) = 67110146;
        HIDWORD(v50) = DWORD1(v61[0]);
        __int16 v51 = 1024;
        int v52 = DWORD2(v61[0]);
        __int16 v53 = 2082;
        v54 = (char *)&v61[5] + 8;
        __int16 v55 = 1024;
        int v56 = DWORD2(v61[21]);
        __int16 v57 = 1024;
        LODWORD(v58) = v10;
        LODWORD(v48) = 36;
        v47 = &v50;
LABEL_33:
        v21 = (const char *)_os_log_send_and_compose_impl();
        v22 = (char *)v21;
        if (v21) {
          sub_100055434(v21);
        }
        goto LABEL_58;
      }
LABEL_57:
      v22 = 0;
LABEL_58:
      free(v22);
    }
LABEL_59:

    if (a5)
    {
      NSErrorDomain v33 = NSPOSIXErrorDomain;
      uint64_t v34 = v10;
      goto LABEL_61;
    }
    goto LABEL_66;
  }
  if (sub_100058F38((uint64_t)v7))
  {
    if (qword_1000E41C0 != -1) {
      dispatch_once(&qword_1000E41C0, &stru_1000D5C98);
    }
    v28 = (id)qword_1000E41B8;
    if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
    {
      v49[0] = 0;
      int v29 = sub_100055404(0);
      if (!os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT)) {
        v29 &= ~1u;
      }
      if (v29)
      {
        v30 = v28;
        int v31 = sub_100058F38((uint64_t)v7);
        LODWORD(v50) = 67109376;
        HIDWORD(v50) = v31;
        __int16 v51 = 1024;
        int v52 = 0;
        v32 = (char *)_os_log_send_and_compose_impl();

        if (v32) {
          sub_100055434(v32);
        }
      }
      else
      {
        v32 = 0;
      }
      free(v32);
    }

    sub_100058F44((uint64_t)v7, 0);
  }
  if (qword_1000E41C0 != -1) {
    dispatch_once(&qword_1000E41C0, &stru_1000D5C98);
  }
  v36 = (id)qword_1000E41B8;
  if (os_log_type_enabled(v36, OS_LOG_TYPE_DEFAULT))
  {
    v49[0] = 0;
    unsigned int v37 = sub_100055404(0);
    if (os_log_type_enabled(v36, OS_LOG_TYPE_DEFAULT)) {
      unsigned int v38 = v37;
    }
    else {
      unsigned int v38 = v37 & 0xFFFFFFFE;
    }
    if (v38)
    {
      v39 = v36;
      int v40 = sub_100058F38((uint64_t)v7);
      int v41 = sub_100066BCC((uint64_t)v7);
      sub_1000778D8(v7, v42);
      v43 = (char *)objc_claimAutoreleasedReturnValue();
      int v44 = sub_100066D48((uint64_t)v7);
      LODWORD(v50) = 67109890;
      HIDWORD(v50) = v40;
      __int16 v51 = 1024;
      int v52 = v41;
      __int16 v53 = 2114;
      v54 = v43;
      __int16 v55 = 1024;
      int v56 = v44;
      v45 = (char *)_os_log_send_and_compose_impl();

      if (v45) {
        sub_100055434(v45);
      }
    }
    else
    {
      v45 = 0;
    }
    free(v45);
  }

  BOOL v35 = 1;
LABEL_82:

  return v35;
}

- (BOOL)deallocatePersonaWithID:(unsigned int)a3 error:(id *)a4
{
  if (a4) {
    *a4 = 0;
  }
  int v5 = kpersona_dealloc();
  if (v5)
  {
    int v6 = *__error();
    if (qword_1000E41C0 != -1) {
      dispatch_once(&qword_1000E41C0, &stru_1000D5C98);
    }
    id v7 = (id)qword_1000E41B8;
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      unsigned int v8 = sub_100055404(0);
      if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
        unsigned int v9 = v8;
      }
      else {
        unsigned int v9 = v8 & 0xFFFFFFFE;
      }
      if (v9)
      {
        int v10 = (const char *)_os_log_send_and_compose_impl();
        v11 = (char *)v10;
        if (v10) {
          sub_100055434(v10);
        }
      }
      else
      {
        v11 = 0;
      }
      free(v11);
    }

    if (a4)
    {
      *a4 = +[NSError errorWithDomain:NSPOSIXErrorDomain code:v6 userInfo:0];
    }
  }
  else
  {
    if (qword_1000E41C0 != -1) {
      dispatch_once(&qword_1000E41C0, &stru_1000D5C98);
    }
    unsigned int v12 = (id)qword_1000E41B8;
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      unsigned int v13 = sub_100055404(0);
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT)) {
        unsigned int v14 = v13;
      }
      else {
        unsigned int v14 = v13 & 0xFFFFFFFE;
      }
      if (v14)
      {
        unsigned int v15 = (const char *)_os_log_send_and_compose_impl();
        unsigned int v16 = (char *)v15;
        if (v15) {
          sub_100055434(v15);
        }
      }
      else
      {
        unsigned int v16 = 0;
      }
      free(v16);
    }
  }
  return v5 == 0;
}

- (id)infoForPersonaWithID:(unsigned int)a3 error:(id *)a4
{
  if (a4) {
    *a4 = 0;
  }
  memset(&__src[1], 0, 344);
  __src[0] = 2;
  if (kpersona_info())
  {
    int v6 = *__error();
    if (v6 == 3)
    {
      if (qword_1000E41C0 != -1) {
        dispatch_once(&qword_1000E41C0, &stru_1000D5C98);
      }
      id v7 = (id)qword_1000E41B8;
      if (!os_log_type_enabled(v7, OS_LOG_TYPE_INFO)) {
        goto LABEL_44;
      }
      uint64_t v33 = 0;
      unsigned int v8 = sub_100055404(0);
      if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO)) {
        unsigned int v9 = v8;
      }
      else {
        unsigned int v9 = v8 & 0xFFFFFFFE;
      }
      if (v9)
      {
        LODWORD(__dst[0]) = 67109632;
        HIDWORD(__dst[0]) = a3;
        LOWORD(__dst[1]) = 1024;
        *(_DWORD *)((char *)&__dst[1] + 2) = a3;
        HIWORD(__dst[1]) = 1024;
        LODWORD(__dst[2]) = 3;
        goto LABEL_31;
      }
    }
    else
    {
      if (qword_1000E41C0 != -1) {
        dispatch_once(&qword_1000E41C0, &stru_1000D5C98);
      }
      id v7 = (id)qword_1000E41B8;
      if (!os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
        goto LABEL_44;
      }
      uint64_t v33 = 0;
      unsigned int v21 = sub_100055404(0);
      if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
        unsigned int v22 = v21;
      }
      else {
        unsigned int v22 = v21 & 0xFFFFFFFE;
      }
      if (v22)
      {
        LODWORD(__dst[0]) = 67109632;
        HIDWORD(__dst[0]) = a3;
        LOWORD(__dst[1]) = 1024;
        *(_DWORD *)((char *)&__dst[1] + 2) = a3;
        HIWORD(__dst[1]) = 1024;
        LODWORD(__dst[2]) = v6;
LABEL_31:
        v23 = (const char *)_os_log_send_and_compose_impl();
        unsigned int v24 = (char *)v23;
        if (v23) {
          sub_100055434(v23);
        }
        goto LABEL_43;
      }
    }
    unsigned int v24 = 0;
LABEL_43:
    free(v24);
LABEL_44:

    if (a4)
    {
      +[NSError errorWithDomain:NSPOSIXErrorDomain code:v6 userInfo:0];
      int v10 = 0;
      *a4 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      int v10 = 0;
    }
    goto LABEL_55;
  }
  memcpy(__dst, __src, 0x15CuLL);
  int v10 = sub_100084EAC((uint64_t)UMKPersonaInfo, __dst);
  if (v10)
  {
    if (qword_1000E41C0 != -1) {
      dispatch_once(&qword_1000E41C0, &stru_1000D5C98);
    }
    v11 = (id)qword_1000E41B8;
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
    {
      uint64_t v33 = 0;
      unsigned int v12 = sub_100055404(0);
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG)) {
        unsigned int v13 = v12;
      }
      else {
        unsigned int v13 = v12 & 0xFFFFFFFE;
      }
      if (v13)
      {
        unsigned int v14 = v11;
        int v15 = sub_100058F38((uint64_t)v10);
        int v16 = sub_100066BCC((uint64_t)v10);
        v18 = sub_1000778D8(v10, v17);
        int v19 = sub_100066D48((uint64_t)v10);
        LODWORD(__dst[0]) = 67109890;
        HIDWORD(__dst[0]) = v15;
        LOWORD(__dst[1]) = 1024;
        *(_DWORD *)((char *)&__dst[1] + 2) = v16;
        HIWORD(__dst[1]) = 2114;
        __dst[2] = v18;
        LOWORD(__dst[3]) = 1024;
        *(_DWORD *)((char *)&__dst[3] + 2) = v19;
        unsigned int v20 = (char *)_os_log_send_and_compose_impl();

        if (v20) {
          sub_100055434(v20);
        }
      }
      else
      {
        unsigned int v20 = 0;
      }
      free(v20);
    }

    id v30 = v10;
  }
  else
  {
    if (qword_1000E41C0 != -1) {
      dispatch_once(&qword_1000E41C0, &stru_1000D5C98);
    }
    unsigned int v25 = (id)qword_1000E41B8;
    if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
    {
      __dst[0] = 0;
      unsigned int v26 = sub_100055404(0);
      if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR)) {
        unsigned int v27 = v26;
      }
      else {
        unsigned int v27 = v26 & 0xFFFFFFFE;
      }
      if (v27)
      {
        LODWORD(v33) = 67109120;
        HIDWORD(v33) = a3;
        v28 = (const char *)_os_log_send_and_compose_impl();
        int v29 = (char *)v28;
        if (v28) {
          sub_100055434(v28);
        }
      }
      else
      {
        int v29 = 0;
      }
      free(v29);
    }

    if (a4)
    {
      *a4 = +[NSError errorWithDomain:NSPOSIXErrorDomain code:34 userInfo:0];
    }
  }

LABEL_55:

  return v10;
}

- (id)infoForProcessWithPID:(int)a3 error:(id *)a4
{
  if (a4) {
    *a4 = 0;
  }
  memset(&__src[1], 0, 344);
  __src[0] = 2;
  if (kpersona_pidinfo())
  {
    int v6 = *__error();
    if (qword_1000E41C0 != -1) {
      dispatch_once(&qword_1000E41C0, &stru_1000D5C98);
    }
    id v7 = (id)qword_1000E41B8;
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      uint64_t v31 = 0;
      unsigned int v8 = sub_100055404(0);
      if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
        unsigned int v9 = v8;
      }
      else {
        unsigned int v9 = v8 & 0xFFFFFFFE;
      }
      if (v9)
      {
        LODWORD(__dst[0]) = 67109376;
        HIDWORD(__dst[0]) = a3;
        LOWORD(__dst[1]) = 1024;
        *(_DWORD *)((char *)&__dst[1] + 2) = v6;
        int v10 = (const char *)_os_log_send_and_compose_impl();
        v11 = (char *)v10;
        if (v10) {
          sub_100055434(v10);
        }
      }
      else
      {
        v11 = 0;
      }
      free(v11);
    }

    if (a4)
    {
      +[NSError errorWithDomain:NSPOSIXErrorDomain code:v6 userInfo:0];
      unsigned int v12 = 0;
      *a4 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      unsigned int v12 = 0;
    }
  }
  else
  {
    memcpy(__dst, __src, 0x15CuLL);
    unsigned int v12 = sub_100084EAC((uint64_t)UMKPersonaInfo, __dst);
    if (v12)
    {
      if (qword_1000E41C0 != -1) {
        dispatch_once(&qword_1000E41C0, &stru_1000D5C98);
      }
      unsigned int v13 = (id)qword_1000E41B8;
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
      {
        uint64_t v31 = 0;
        unsigned int v14 = sub_100055404(0);
        if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG)) {
          unsigned int v15 = v14;
        }
        else {
          unsigned int v15 = v14 & 0xFFFFFFFE;
        }
        if (v15)
        {
          int v16 = v13;
          int v17 = sub_100058F38((uint64_t)v12);
          int v18 = sub_100066BCC((uint64_t)v12);
          unsigned int v20 = sub_1000778D8(v12, v19);
          int v21 = sub_100066D48((uint64_t)v12);
          LODWORD(__dst[0]) = 67110146;
          HIDWORD(__dst[0]) = a3;
          LOWORD(__dst[1]) = 1024;
          *(_DWORD *)((char *)&__dst[1] + 2) = v17;
          HIWORD(__dst[1]) = 1024;
          LODWORD(__dst[2]) = v18;
          WORD2(__dst[2]) = 2114;
          *(void *)((char *)&__dst[2] + 6) = v20;
          HIWORD(__dst[3]) = 1024;
          LODWORD(__dst[4]) = v21;
          unsigned int v22 = (char *)_os_log_send_and_compose_impl();

          if (v22) {
            sub_100055434(v22);
          }
        }
        else
        {
          unsigned int v22 = 0;
        }
        free(v22);
      }

      id v28 = v12;
    }
    else
    {
      if (qword_1000E41C0 != -1) {
        dispatch_once(&qword_1000E41C0, &stru_1000D5C98);
      }
      v23 = (id)qword_1000E41B8;
      if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
      {
        __dst[0] = 0;
        unsigned int v24 = sub_100055404(0);
        if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR)) {
          unsigned int v25 = v24;
        }
        else {
          unsigned int v25 = v24 & 0xFFFFFFFE;
        }
        if (v25)
        {
          LODWORD(v31) = 67109120;
          HIDWORD(v31) = a3;
          unsigned int v26 = (const char *)_os_log_send_and_compose_impl();
          unsigned int v27 = (char *)v26;
          if (v26) {
            sub_100055434(v26);
          }
        }
        else
        {
          unsigned int v27 = 0;
        }
        free(v27);
      }

      if (a4)
      {
        *a4 = +[NSError errorWithDomain:NSPOSIXErrorDomain code:34 userInfo:0];
      }
    }
  }

  return v12;
}

@end