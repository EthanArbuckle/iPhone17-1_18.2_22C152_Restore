@interface CRRIK
- (BOOL)create;
- (BOOL)createWithKeyBlob:(id)a3;
- (BOOL)verify:(id)a3 signature:(id)a4;
- (CRRIK)init;
- (CRRIK)initWithKeyBlob:(id)a3;
- (aks_ref_key_s)rk;
- (id)attestationBlob;
- (id)keyBlob;
- (id)pubKeyBlob;
- (id)sign:(id)a3;
- (void)dealloc;
- (void)purge;
- (void)setRk:(aks_ref_key_s *)a3;
@end

@implementation CRRIK

- (CRRIK)init
{
  v6.receiver = self;
  v6.super_class = (Class)CRRIK;
  v2 = [(CRRIK *)&v6 init];
  v3 = v2;
  if (v2 && ![(CRRIK *)v2 create]) {
    v4 = 0;
  }
  else {
    v4 = v3;
  }

  return v4;
}

- (CRRIK)initWithKeyBlob:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)CRRIK;
  v5 = [(CRRIK *)&v9 init];
  objc_super v6 = v5;
  if (v5 && ![(CRRIK *)v5 createWithKeyBlob:v4]) {
    v7 = 0;
  }
  else {
    v7 = v6;
  }

  return v7;
}

- (id)keyBlob
{
  v3 = [(CRRIK *)self rk];
  if (v3)
  {
    uint64_t v6 = 0;
    uint64_t v4 = sub_100013E9C((uint64_t *)[(CRRIK *)self rk], &v6);
    v3 = 0;
    if (v4)
    {
      if (v6)
      {
        +[NSData dataWithBytes:length:](NSData, "dataWithBytes:length:");
        v3 = (aks_ref_key_s *)objc_claimAutoreleasedReturnValue();
      }
    }
  }

  return v3;
}

- (id)pubKeyBlob
{
  v3 = [(CRRIK *)self rk];
  if (v3)
  {
    uint64_t v6 = 0;
    uint64_t v4 = sub_100013CC4([(CRRIK *)self rk], &v6);
    v3 = 0;
    if (v4)
    {
      if (v6)
      {
        +[NSData dataWithBytes:length:](NSData, "dataWithBytes:length:");
        v3 = (aks_ref_key_s *)objc_claimAutoreleasedReturnValue();
      }
    }
  }

  return v3;
}

- (id)attestationBlob
{
  if (![(CRRIK *)self rk])
  {
    v5 = 0;
    goto LABEL_12;
  }
  uint64_t v8 = 0;
  objc_super v9 = 0;
  if (!sub_100013EA8((uint64_t *)[(CRRIK *)self rk], 0, 0, (uint64_t)&v9, (uint64_t)&v8)
    && v9
    && v8)
  {
    uint64_t v3 = +[NSData dataWithBytes:length:](NSData, "dataWithBytes:length:");
    uint64_t v4 = v9;
    v5 = (void *)v3;
    if (!v9) {
      goto LABEL_12;
    }
LABEL_11:
    free(v4);
    v5 = (void *)v3;
    goto LABEL_12;
  }
  uint64_t v6 = handleForCategory();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
    sub_10003D8A0();
  }

  uint64_t v3 = 0;
  v5 = 0;
  uint64_t v4 = v9;
  if (v9) {
    goto LABEL_11;
  }
LABEL_12:

  return v5;
}

- (id)sign:(id)a3
{
  id v4 = a3;
  v5 = [(CRRIK *)self rk];
  if (v4 && v5)
  {
    uint64_t v6 = [(CRRIK *)self rk];
    id v7 = v4;
    id v8 = [v7 bytes];
    [v7 length];
    sub_1000138D0((uint64_t *)v6, 0, 0, (uint64_t)v8);
    objc_super v9 = handleForCategory();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      sub_10003D908();
    }
  }

  return 0;
}

- (BOOL)verify:(id)a3 signature:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [(CRRIK *)self rk];
  BOOL v9 = 0;
  if (v7 && v6 && v8)
  {
    v10 = [(CRRIK *)self rk];
    id v11 = v6;
    id v12 = [v11 bytes];
    id v13 = [v11 length];
    id v14 = v7;
    if (sub_100013A54(v10, 0, 0, (uint64_t)v12, (uint64_t)v13, (uint64_t)[v14 bytes], (uint64_t)objc_msgSend(v14, "length")))
    {
      v15 = handleForCategory();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR)) {
        sub_10003D9A8();
      }

      BOOL v9 = 0;
    }
    else
    {
      BOOL v9 = 1;
    }
  }

  return v9;
}

- (void)dealloc
{
  [(CRRIK *)self purge];
  v3.receiver = self;
  v3.super_class = (Class)CRRIK;
  [(CRRIK *)&v3 dealloc];
}

- (BOOL)create
{
  uint64_t v29 = 1;
  v30 = 0;
  v27 = 0;
  v28 = 0;
  uint64_t v26 = 0;
  objc_super v3 = (void *)MGCopyAnswer();
  if (!v3 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    id v8 = handleForCategory();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      sub_10003DA10(v8, v9, v10, v11, v12, v13, v14, v15);
    }
    goto LABEL_12;
  }
  if ([v3 BOOLValue]) {
    unsigned int v4 = 5;
  }
  else {
    unsigned int v4 = 4;
  }
  v5 = (void **)sub_100012E2C(0);
  v28 = v5;
  if (!v5)
  {
    id v8 = handleForCategory();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      sub_10003DA48(v8, v18, v19, v20, v21, v22, v23, v24);
    }
LABEL_12:

    BOOL v16 = 0;
    goto LABEL_13;
  }
  id v6 = v5;
  if (sub_1000130A0(v5, 9, &v29))
  {
    id v7 = handleForCategory();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      sub_10003DB50();
    }
  }
  else if (sub_100013118(v6, &v27, (size_t *)&v26))
  {
    id v7 = handleForCategory();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      sub_10003DAE8();
    }
  }
  else
  {
    if (!sub_100013180(-1, 13, v4, (uint64_t)v27, v26, (void ***)&v30))
    {
      self->_rk = v30;
      v30 = 0;
      id v7 = handleForCategory();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)v25 = 0;
        _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "RIK created successfully", v25, 2u);
      }
      BOOL v16 = 1;
      goto LABEL_27;
    }
    id v7 = handleForCategory();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      sub_10003DA80();
    }
  }
  BOOL v16 = 0;
LABEL_27:

  sub_10001311C(&v28);
LABEL_13:
  if (v27) {
    free(v27);
  }
  if (v30) {
    sub_1000133B0((uint64_t *)&v30);
  }

  return v16;
}

- (BOOL)createWithKeyBlob:(id)a3
{
  id v4 = a3;
  v5 = v4;
  uint64_t v12 = 0;
  if (v4)
  {
    id v6 = v4;
    int v7 = sub_100013464(-1, [v6 bytes], (size_t)[v6 length], (uint64_t *)&v12);
    BOOL v8 = v7 == 0;
    if (v7)
    {
      uint64_t v9 = handleForCategory();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
        sub_10003DBB8();
      }
    }
    else
    {
      self->_rk = v12;
      uint64_t v12 = 0;
      uint64_t v9 = handleForCategory();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)uint64_t v11 = 0;
        _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "RIK created successfully", v11, 2u);
      }
    }

    if (v12) {
      sub_1000133B0((uint64_t *)&v12);
    }
  }
  else
  {
    BOOL v8 = 0;
  }

  return v8;
}

- (void)purge
{
  if ([(CRRIK *)self rk])
  {
    sub_1000133B0((uint64_t *)&self->_rk);
    [(CRRIK *)self setRk:0];
  }
}

- (aks_ref_key_s)rk
{
  return self->_rk;
}

- (void)setRk:(aks_ref_key_s *)a3
{
  self->_rk = a3;
}

@end