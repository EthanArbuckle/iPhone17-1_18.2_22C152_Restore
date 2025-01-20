@interface UMDVolumeHelper
- (BOOL)createVolumeWithSession:(id)a3 size:(int64_t)a4 userName:(id)a5 error:(int *)a6 forPersona:(BOOL)a7 userDataVolume:(BOOL)a8;
- (BOOL)deleteVolumeWithSession:(id)a3 error:(int *)a4;
- (BOOL)isVolumeMountedWithSession:(id)a3 fsid:(fsid *)a4;
- (BOOL)mountVolumeWithSession:(id)a3 mountPath:(id)a4 error:(int *)a5 forPersona:(BOOL)a6;
- (BOOL)splitUserVolumeEnabled;
- (BOOL)unmountVolumeWithSession:(id)a3 mountPath:(id)a4 error:(int *)a5;
- (BOOL)unmountVolumeWithSession:(id)a3 mountPath:(id)a4 error:(int *)a5 force:(BOOL)a6;
- (UMDSideEffects)se;
- (void)createVolumeMountsDir:(id)a3;
@end

@implementation UMDVolumeHelper

- (void)createVolumeMountsDir:(id)a3
{
  id v4 = a3;
  v5 = [(UMDVolumeHelper *)self se];
  v6 = sub_100018F6C((uint64_t)v5);
  unsigned int v7 = [v6 fileExistsAtPath:v4 isDirectory:0];

  if (v7)
  {
    if (qword_1000E41D0 != -1) {
      dispatch_once(&qword_1000E41D0, &stru_1000D5CB8);
    }
    v8 = (id)qword_1000E41C8;
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      unsigned int v9 = sub_100055404(0);
      if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO)) {
        unsigned int v10 = v9;
      }
      else {
        unsigned int v10 = v9 & 0xFFFFFFFE;
      }
      if (v10)
      {
LABEL_35:
        v23 = (const char *)_os_log_send_and_compose_impl();
        v24 = (char *)v23;
        if (v23) {
          sub_100055434(v23);
        }
        goto LABEL_38;
      }
LABEL_37:
      v24 = 0;
LABEL_38:
      free(v24);
    }
  }
  else
  {
    v11 = [(UMDVolumeHelper *)self se];
    v12 = sub_100018F6C((uint64_t)v11);
    int v13 = [v12 makePath:v4 mode:511 error:0];

    if (v13)
    {
      v14 = [(UMDVolumeHelper *)self se];
      v15 = sub_100018F6C((uint64_t)v14);
      unsigned __int8 v16 = [v15 chmodPath:v4 withMode:511 error:0];

      if (v16)
      {
        if (qword_1000E41D0 != -1) {
          dispatch_once(&qword_1000E41D0, &stru_1000D5CB8);
        }
        v8 = (id)qword_1000E41C8;
        if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
        {
          unsigned int v17 = sub_100055404(0);
          if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT)) {
            unsigned int v18 = v17;
          }
          else {
            unsigned int v18 = v17 & 0xFFFFFFFE;
          }
          if (v18) {
            goto LABEL_35;
          }
          goto LABEL_37;
        }
      }
      else
      {
        if (qword_1000E41D0 != -1) {
          dispatch_once(&qword_1000E41D0, &stru_1000D5CB8);
        }
        v8 = (id)qword_1000E41C8;
        if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
        {
          unsigned int v21 = sub_100055404(0);
          if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
            unsigned int v22 = v21;
          }
          else {
            unsigned int v22 = v21 & 0xFFFFFFFE;
          }
          if (v22) {
            goto LABEL_35;
          }
          goto LABEL_37;
        }
      }
    }
    else
    {
      if (qword_1000E41D0 != -1) {
        dispatch_once(&qword_1000E41D0, &stru_1000D5CB8);
      }
      v8 = (id)qword_1000E41C8;
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      {
        unsigned int v19 = sub_100055404(0);
        if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
          unsigned int v20 = v19;
        }
        else {
          unsigned int v20 = v19 & 0xFFFFFFFE;
        }
        if (v20) {
          goto LABEL_35;
        }
        goto LABEL_37;
      }
    }
  }
}

- (BOOL)unmountVolumeWithSession:(id)a3 mountPath:(id)a4 error:(int *)a5
{
  id v8 = a3;
  id v9 = a4;
  int v29 = 0;
  if (a5) {
    *a5 = 0;
  }
  id v10 = v9;
  v11 = v10;
  if (!v10)
  {
    v11 = sub_10008A8B8(v8, @"MKBUserSessionHomeDir");
  }
  if ([(UMDVolumeHelper *)self unmountVolumeWithSession:v8 mountPath:v10 error:&v29 force:0])
  {
    goto LABEL_18;
  }
  if (qword_1000E41D0 != -1) {
    dispatch_once(&qword_1000E41D0, &stru_1000D5CB8);
  }
  v12 = (id)qword_1000E41C8;
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
      int v30 = 138412546;
      v31 = v11;
      __int16 v32 = 1024;
      int v33 = v29;
      v15 = (const char *)_os_log_send_and_compose_impl();
      unsigned __int8 v16 = (char *)v15;
      if (v15) {
        sub_100055434(v15);
      }
    }
    else
    {
      unsigned __int8 v16 = 0;
    }
    free(v16);
  }

  if ([(UMDVolumeHelper *)self unmountVolumeWithSession:v8 mountPath:v10 error:&v29 force:1])
  {
LABEL_18:
    if (qword_1000E41D0 != -1) {
      dispatch_once(&qword_1000E41D0, &stru_1000D5CB8);
    }
    unsigned int v17 = (id)qword_1000E41C8;
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
    {
      unsigned int v18 = sub_100055404(0);
      if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT)) {
        unsigned int v19 = v18;
      }
      else {
        unsigned int v19 = v18 & 0xFFFFFFFE;
      }
      if (v19)
      {
        int v30 = 138412290;
        v31 = v11;
        unsigned int v20 = (const char *)_os_log_send_and_compose_impl();
        unsigned int v21 = (char *)v20;
        if (v20) {
          sub_100055434(v20);
        }
      }
      else
      {
        unsigned int v21 = 0;
      }
      free(v21);
    }

    BOOL v27 = 1;
  }
  else
  {
    if (qword_1000E41D0 != -1) {
      dispatch_once(&qword_1000E41D0, &stru_1000D5CB8);
    }
    unsigned int v22 = (id)qword_1000E41C8;
    if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
    {
      unsigned int v23 = sub_100055404(0);
      if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT)) {
        unsigned int v24 = v23;
      }
      else {
        unsigned int v24 = v23 & 0xFFFFFFFE;
      }
      if (v24)
      {
        int v30 = 138412546;
        v31 = v11;
        __int16 v32 = 1024;
        int v33 = v29;
        v25 = (const char *)_os_log_send_and_compose_impl();
        v26 = (char *)v25;
        if (v25) {
          sub_100055434(v25);
        }
      }
      else
      {
        v26 = 0;
      }
      free(v26);
    }

    BOOL v27 = 0;
    if (a5) {
      *a5 = v29;
    }
  }

  return v27;
}

- (BOOL)createVolumeWithSession:(id)a3 size:(int64_t)a4 userName:(id)a5 error:(int *)a6 forPersona:(BOOL)a7 userDataVolume:(BOOL)a8
{
  id v9 = a3;
  id v10 = a5;
  BOOL result = _os_crash();
  __break(1u);
  return result;
}

- (BOOL)deleteVolumeWithSession:(id)a3 error:(int *)a4
{
  id v4 = a3;
  BOOL result = _os_crash();
  __break(1u);
  return result;
}

- (BOOL)mountVolumeWithSession:(id)a3 mountPath:(id)a4 error:(int *)a5 forPersona:(BOOL)a6
{
  id v7 = a3;
  id v8 = a4;
  BOOL result = _os_crash();
  __break(1u);
  return result;
}

- (BOOL)unmountVolumeWithSession:(id)a3 mountPath:(id)a4 error:(int *)a5 force:(BOOL)a6
{
  id v7 = a3;
  id v8 = a4;
  BOOL result = _os_crash();
  __break(1u);
  return result;
}

- (BOOL)isVolumeMountedWithSession:(id)a3 fsid:(fsid *)a4
{
  id v4 = a3;
  BOOL result = _os_crash();
  __break(1u);
  return result;
}

- (UMDSideEffects)se
{
  return self->_se;
}

- (BOOL)splitUserVolumeEnabled
{
  return self->_splitUserVolumeEnabled;
}

- (void).cxx_destruct
{
}

@end