@interface DIResizeParams
+ (BOOL)supportsSecureCoding;
- (BOOL)resizeWithError:(id *)a3;
- (DIResizeParams)initWithCoder:(id)a3;
- (DIResizeParams)initWithExistingParams:(id)a3 size:(unint64_t)a4 error:(id *)a5;
- (DIResizeParams)initWithURL:(id)a3 size:(unint64_t)a4 error:(id *)a5;
- (unint64_t)size;
- (void)encodeWithCoder:(id)a3;
- (void)setSize:(unint64_t)a3;
@end

@implementation DIResizeParams

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (DIResizeParams)initWithURL:(id)a3 size:(unint64_t)a4 error:(id *)a5
{
  v7.receiver = self;
  v7.super_class = (Class)DIResizeParams;
  result = [(DIBaseParams *)&v7 initWithURL:a3 error:a5];
  if (result) {
    result->_size = a4;
  }
  return result;
}

- (DIResizeParams)initWithExistingParams:(id)a3 size:(unint64_t)a4 error:(id *)a5
{
  id v8 = a3;
  v9 = [v8 inputURL];
  v18.receiver = self;
  v18.super_class = (Class)DIResizeParams;
  v10 = [(DIBaseParams *)&v18 initWithURL:v9 error:a5];

  if (!v10) {
    goto LABEL_3;
  }
  v10->_size = a4;
  v11 = [v8 diskImageParamsXPC];
  [(DIBaseParams *)v10 setDiskImageParamsXPC:v11];

  v12 = [(DIBaseParams *)v10 shadowChain];
  v13 = [v8 shadowChain];
  v14 = [v13 nodes];
  unsigned __int8 v15 = [v12 addShadowNodes:v14 error:a5];

  if ((v15 & 1) == 0) {
    v16 = 0;
  }
  else {
LABEL_3:
  }
    v16 = v10;

  return v16;
}

- (DIResizeParams)initWithCoder:(id)a3
{
  id v4 = a3;
  v7.receiver = self;
  v7.super_class = (Class)DIResizeParams;
  v5 = [(DIBaseParams *)&v7 initWithCoder:v4];
  if (v5) {
    v5->_size = (unint64_t)[v4 decodeInt64ForKey:@"size"];
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  v5.receiver = self;
  v5.super_class = (Class)DIResizeParams;
  [(DIBaseParams *)&v5 encodeWithCoder:v4];
  [v4 encodeInt64:-[DIResizeParams size](self, "size") forKey:@"size"];
}

- (BOOL)resizeWithError:(id *)a3
{
  if ([(DIBaseParams *)self openExistingImageWithFlags:2 error:a3])
  {
    int v5 = *__error();
    if (sub_1000D29A0())
    {
      uint64_t v37 = 0;
      v6 = sub_1000D2920();
      os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT);
      *(_DWORD *)buf = 68158210;
      *(_DWORD *)&buf[4] = 34;
      __int16 v39 = 2080;
      v40 = "-[DIResizeParams resizeWithError:]";
      __int16 v41 = 2114;
      v42 = self;
      objc_super v7 = (char *)_os_log_send_and_compose_impl();

      if (v7)
      {
        fprintf(__stderrp, "%s\n", v7);
        free(v7);
      }
    }
    else
    {
      v9 = sub_1000D2920();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 68158210;
        *(_DWORD *)&buf[4] = 34;
        __int16 v39 = 2080;
        v40 = "-[DIResizeParams resizeWithError:]";
        __int16 v41 = 2114;
        v42 = self;
        _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "%.*s: entry: %{public}@", buf, 0x1Cu);
      }
    }
    *__error() = v5;
    v10 = objc_alloc_init(DIClient2Controller_XPCHandler);
    if (![(DIClient2Controller_XPCHandler *)v10 connectWithError:a3]
      || ![(DIBaseParams *)self prepareImageWithXpcHandler:v10 fileMode:1 error:a3])
    {
      BOOL v8 = 0;
LABEL_14:

      return v8;
    }
    uint64_t v37 = 0;
    v11 = [(DIBaseParams *)self diskImageParamsXPC];
    v12 = [(DIBaseParams *)self shadowChain];
    id v13 = [v12 shouldValidate];
    if (v11)
    {
      [v11 createDiskImageWithCache:0 shadowValidation:v13];
      uint64_t v14 = *(void *)buf;
    }
    else
    {
      uint64_t v14 = 0;
    }
    uint64_t v37 = v14;
    *(void *)buf = 0;

    if ((*(uint64_t (**)(uint64_t))(*(void *)v37 + 40))(v37))
    {
      unint64_t v16 = [(DIResizeParams *)self size];
      unint64_t v17 = (*(uint64_t (**)(uint64_t))(*(void *)v37 + 24))(v37);
      uint64_t v18 = (*(uint64_t (**)(uint64_t))(*(void *)v37 + 32))(v37);
      unint64_t v19 = (v16 + v17 - 1) / v17 * v17;
      if ((*(uint64_t (**)(uint64_t))(*(void *)v37 + 24))(v37) * v18 == v19)
      {
        int v20 = *__error();
        if (sub_1000D29A0())
        {
          v21 = sub_1000D2920();
          os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT);
          *(_DWORD *)buf = 68157954;
          *(_DWORD *)&buf[4] = 34;
          __int16 v39 = 2080;
          v40 = "-[DIResizeParams resizeWithError:]";
          v22 = (char *)_os_log_send_and_compose_impl();

          if (v22)
          {
            fprintf(__stderrp, "%s\n", v22);
            free(v22);
          }
        }
        else
        {
          v26 = sub_1000D2920();
          if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 68157954;
            *(_DWORD *)&buf[4] = 34;
            __int16 v39 = 2080;
            v40 = "-[DIResizeParams resizeWithError:]";
            _os_log_impl((void *)&_mh_execute_header, v26, OS_LOG_TYPE_DEFAULT, "%.*s: New disk image size is the same as previous", buf, 0x12u);
          }
        }
        *__error() = v20;
        BOOL v8 = 1;
        goto LABEL_30;
      }
      v24 = [(DIBaseParams *)self diskImageParamsXPC];
      id v25 = [v24 setSizeWithDiskImage:&v37 newSize:v19];

      if (!v25)
      {
        uint64_t v28 = (*(uint64_t (**)(uint64_t))(*(void *)v37 + 32))(v37);
        [(DIResizeParams *)self setSize:(*(uint64_t (**)(uint64_t))(*(void *)v37 + 24))(v37) * v28];
        int v29 = *__error();
        if (sub_1000D29A0())
        {
          v30 = sub_1000D2920();
          os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT);
          unint64_t v31 = [(DIResizeParams *)self size];
          *(_DWORD *)buf = 68158210;
          *(_DWORD *)&buf[4] = 34;
          __int16 v39 = 2080;
          v40 = "-[DIResizeParams resizeWithError:]";
          __int16 v41 = 2048;
          v42 = (DIResizeParams *)v31;
          v32 = (char *)_os_log_send_and_compose_impl();

          if (v32)
          {
            fprintf(__stderrp, "%s\n", v32);
            free(v32);
          }
        }
        else
        {
          v33 = sub_1000D2920();
          if (os_log_type_enabled(v33, OS_LOG_TYPE_DEFAULT))
          {
            unint64_t v34 = [(DIResizeParams *)self size];
            *(_DWORD *)buf = 68158210;
            *(_DWORD *)&buf[4] = 34;
            __int16 v39 = 2080;
            v40 = "-[DIResizeParams resizeWithError:]";
            __int16 v41 = 2048;
            v42 = (DIResizeParams *)v34;
            _os_log_impl((void *)&_mh_execute_header, v33, OS_LOG_TYPE_DEFAULT, "%.*s: Disk image resized to %llu bytes", buf, 0x1Cu);
          }
        }
        *__error() = v29;
        v35 = (void *)(*(uint64_t (**)(uint64_t))(*(void *)v37 + 136))(v37);
        uint64_t v36 = sub_100011BD0(v35);
        if (v36) {
          BOOL v8 = +[DIError failWithPOSIXCode:v36 error:a3];
        }
        else {
          BOOL v8 = 1;
        }
        if (v35) {
          (*(void (**)(void *))(*v35 + 40))(v35);
        }
        goto LABEL_30;
      }
      unsigned __int8 v23 = +[DIError failWithPOSIXCode:v25 verboseInfo:@"Failed to resize the image" error:a3];
    }
    else
    {
      unsigned __int8 v23 = +[DIError failWithPOSIXCode:45 verboseInfo:@"Image doesn't support resizing" error:a3];
    }
    BOOL v8 = v23;
LABEL_30:
    uint64_t v27 = v37;
    uint64_t v37 = 0;
    if (v27) {
      (*(void (**)(uint64_t))(*(void *)v27 + 16))(v27);
    }
    goto LABEL_14;
  }
  return 0;
}

- (unint64_t)size
{
  return self->_size;
}

- (void)setSize:(unint64_t)a3
{
  self->_size = a3;
}

@end