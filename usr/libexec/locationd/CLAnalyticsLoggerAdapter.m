@interface CLAnalyticsLoggerAdapter
+ (BOOL)isSupported;
+ (id)getSilo;
+ (void)becameFatallyBlocked:(id)a3 index:(unint64_t)a4;
+ (void)performSyncOnSilo:(id)a3 invoker:(id)a4;
- (CLAnalyticsLoggerAdapter)init;
- (id).cxx_construct;
- (void)beginService;
- (void)endService;
- (void)setMeasurements:(id)a3;
- (void)submitEvent:(id)a3;
- (void)submitEvent:(id)a3 withMeasurements:(id)a4;
@end

@implementation CLAnalyticsLoggerAdapter

+ (void)becameFatallyBlocked:(id)a3 index:(unint64_t)a4
{
  unint64_t v5 = a4 + 1;
  if (a4 + 1 < (unint64_t)[a3 count]) {
    [objc_msgSend(a3, "objectAtIndexedSubscript:", v5) becameFatallyBlocked:a3 index:v5];
  }
}

+ (void)performSyncOnSilo:(id)a3 invoker:(id)a4
{
}

+ (id)getSilo
{
  if (qword_102480170 != -1) {
    dispatch_once(&qword_102480170, &stru_1022DE940);
  }
  return (id)qword_102480168;
}

+ (BOOL)isSupported
{
  return 1;
}

- (CLAnalyticsLoggerAdapter)init
{
  if (qword_102419600 != -1) {
    dispatch_once(&qword_102419600, &stru_1022DE9A8);
  }
  v3 = qword_102419608;
  if (os_log_type_enabled((os_log_t)qword_102419608, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "#ca,init", buf, 2u);
  }
  if (sub_10013D1A0(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_102419600 != -1) {
      dispatch_once(&qword_102419600, &stru_1022DE9A8);
    }
    __int16 v7 = 0;
    unint64_t v5 = (char *)_os_log_send_and_compose_impl();
    sub_1004BA5E4("Generic", 1, 0, 2, "-[CLAnalyticsLoggerAdapter init]", "%s\n", v5);
    if (v5 != (char *)buf) {
      free(v5);
    }
  }
  v6.receiver = self;
  v6.super_class = (Class)CLAnalyticsLoggerAdapter;
  return [(CLAnalyticsLoggerAdapter *)&v6 initWithInboundProtocol:&OBJC_PROTOCOL___CLAnalyticsLoggerServiceProtocol outboundProtocol:&OBJC_PROTOCOL___CLAnalyticsLoggerClientProtocol];
}

- (void)beginService
{
  if (qword_102419600 != -1) {
    dispatch_once(&qword_102419600, &stru_1022DE9A8);
  }
  v3 = qword_102419608;
  if (os_log_type_enabled((os_log_t)qword_102419608, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "#ca,beginService", buf, 2u);
  }
  if (sub_10013D1A0(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_102419600 != -1) {
      dispatch_once(&qword_102419600, &stru_1022DE9A8);
    }
    v4 = (char *)_os_log_send_and_compose_impl();
    sub_1004BA5E4("Generic", 1, 0, 2, "-[CLAnalyticsLoggerAdapter beginService]", "%s\n", v4);
    if (v4 != (char *)buf) {
      free(v4);
    }
  }
  [(CLAnalyticsLoggerAdapter *)self universe];
  sub_100B0C9E8();
}

- (void)endService
{
  if (qword_102419600 != -1) {
    dispatch_once(&qword_102419600, &stru_1022DE9A8);
  }
  v2 = qword_102419608;
  if (os_log_type_enabled((os_log_t)qword_102419608, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEFAULT, "#ca,endService", buf, 2u);
  }
  if (sub_10013D1A0(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_102419600 != -1) {
      dispatch_once(&qword_102419600, &stru_1022DE9A8);
    }
    v3 = (char *)_os_log_send_and_compose_impl();
    sub_1004BA5E4("Generic", 1, 0, 2, "-[CLAnalyticsLoggerAdapter endService]", "%s\n", v3);
    if (v3 != (char *)buf) {
      free(v3);
    }
  }
}

- (void)setMeasurements:(id)a3
{
  if (qword_102419600 != -1) {
    dispatch_once(&qword_102419600, &stru_1022DE9A8);
  }
  unint64_t v5 = qword_102419608;
  if (os_log_type_enabled((os_log_t)qword_102419608, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "#ca,setMeasurements", buf, 2u);
  }
  if (sub_10013D1A0(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_102419600 != -1) {
      dispatch_once(&qword_102419600, &stru_1022DE9A8);
    }
    LOWORD(v15) = 0;
    v13 = (char *)_os_log_send_and_compose_impl();
    sub_1004BA5E4("Generic", 1, 0, 2, "-[CLAnalyticsLoggerAdapter setMeasurements:]", "%s\n", v13);
    if (v13 != (char *)buf) {
      free(v13);
    }
  }
  if (a3)
  {
    (*((void (**)(int **__return_ptr, id))a3 + 2))(&v15, a3);
    objc_super v6 = v15;
    for (i = v16; v6 != i; v6 += 10)
    {
      uint64_t value = (uint64_t)self->fInstance.__ptr_.__value_;
      sub_100118070((uint64_t)v14, (uint64_t)(v6 + 2));
      LOBYTE(value) = sub_100117AF0(value, v6, (uint64_t)v14);
      sub_100118010((uint64_t)v14);
      if ((value & 1) == 0)
      {
        if (qword_102419600 != -1) {
          dispatch_once(&qword_102419600, &stru_1022DE9A8);
        }
        v9 = qword_102419608;
        if (os_log_type_enabled((os_log_t)qword_102419608, OS_LOG_TYPE_DEBUG))
        {
          int v10 = *v6;
          *(_DWORD *)buf = 67240192;
          *(_DWORD *)&buf[4] = v10;
          _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEBUG, "#ca,ERROR,setMeasurements,measurement,%{public}d,failed", buf, 8u);
        }
        if (sub_10013D1A0(115, 2))
        {
          bzero(buf, 0x65CuLL);
          if (qword_102419600 != -1) {
            dispatch_once(&qword_102419600, &stru_1022DE9A8);
          }
          int v11 = *v6;
          int v18 = 67240192;
          int v19 = v11;
          v12 = (char *)_os_log_send_and_compose_impl();
          sub_1004BA5E4("Generic", 1, 0, 2, "-[CLAnalyticsLoggerAdapter setMeasurements:]", "%s\n", v12);
          if (v12 != (char *)buf) {
            free(v12);
          }
        }
      }
    }
  }
  else
  {
    v15 = 0;
    v16 = 0;
    uint64_t v17 = 0;
  }
  *(void *)buf = &v15;
  sub_100682B1C((void ***)buf);
}

- (void)submitEvent:(id)a3
{
  if (a3)
  {
    (*((void (**)(long long *__return_ptr, id, SEL))a3 + 2))(&__s1, a3, a2);
  }
  else
  {
    long long __s1 = 0uLL;
    uint64_t v102 = 0;
  }
  if (qword_102419600 != -1) {
    dispatch_once(&qword_102419600, &stru_1022DE9A8);
  }
  v4 = qword_102419608;
  if (os_log_type_enabled((os_log_t)qword_102419608, OS_LOG_TYPE_DEFAULT))
  {
    p_s1 = &__s1;
    if (v102 < 0) {
      p_s1 = (long long *)__s1;
    }
    *(_DWORD *)buf = 136315138;
    *(void *)&buf[4] = p_s1;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "#ca,submit,event,%s", buf, 0xCu);
  }
  if (sub_10013D1A0(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_102419600 != -1) {
      dispatch_once(&qword_102419600, &stru_1022DE9A8);
    }
    v74 = &__s1;
    if (v102 < 0) {
      v74 = (long long *)__s1;
    }
    *(_DWORD *)v103 = 136315138;
    *(void *)&v103[4] = v74;
    v75 = (char *)_os_log_send_and_compose_impl();
    sub_1004BA5E4("Generic", 1, 0, 2, "-[CLAnalyticsLoggerAdapter submitEvent:]", "%s\n", v75);
    if (v75 != buf) {
      free(v75);
    }
  }
  uint64_t v6 = HIBYTE(v102);
  int v7 = HIBYTE(v102);
  size_t v8 = *((void *)&__s1 + 1);
  if (v102 >= 0) {
    uint64_t v9 = HIBYTE(v102);
  }
  else {
    uint64_t v9 = *((void *)&__s1 + 1);
  }
  uint64_t v10 = *((void *)&xmmword_10248A8B8 + 1);
  if (byte_10248A8CF >= 0) {
    uint64_t v10 = byte_10248A8CF;
  }
  if (v9 == v10)
  {
    if (byte_10248A8CF >= 0) {
      int v11 = &xmmword_10248A8B8;
    }
    else {
      int v11 = (long long *)xmmword_10248A8B8;
    }
    if (v102 < 0)
    {
      v14 = (void *)__s1;
      if (!memcmp((const void *)__s1, v11, *((size_t *)&__s1 + 1))) {
        goto LABEL_82;
      }
    }
    else
    {
      if (!HIBYTE(v102)) {
        goto LABEL_79;
      }
      v12 = &__s1;
      uint64_t v13 = HIBYTE(v102);
      while (*(unsigned __int8 *)v12 == *(unsigned __int8 *)v11)
      {
        v12 = (long long *)((char *)v12 + 1);
        int v11 = (long long *)((char *)v11 + 1);
        if (!--v13)
        {
LABEL_77:
          uint64_t value = self->fInstance.__ptr_.__value_;
          if ((v7 & 0x80) == 0) {
            goto LABEL_80;
          }
          v14 = (void *)__s1;
          goto LABEL_83;
        }
      }
    }
  }
  uint64_t v15 = *((void *)&xmmword_10248A8D0 + 1);
  if (byte_10248A8E7 >= 0) {
    uint64_t v15 = byte_10248A8E7;
  }
  if (v9 == v15)
  {
    if (byte_10248A8E7 >= 0) {
      v16 = &xmmword_10248A8D0;
    }
    else {
      v16 = (long long *)xmmword_10248A8D0;
    }
    if ((v7 & 0x80) != 0)
    {
      v14 = (void *)__s1;
      if (!memcmp((const void *)__s1, v16, v8)) {
        goto LABEL_82;
      }
    }
    else
    {
      if (!v7) {
        goto LABEL_79;
      }
      uint64_t v17 = &__s1;
      uint64_t v18 = v6;
      while (*(unsigned __int8 *)v17 == *(unsigned __int8 *)v16)
      {
        uint64_t v17 = (long long *)((char *)v17 + 1);
        v16 = (long long *)((char *)v16 + 1);
        if (!--v18) {
          goto LABEL_77;
        }
      }
    }
  }
  uint64_t v19 = *((void *)&xmmword_10248A8E8 + 1);
  if (byte_10248A8FF >= 0) {
    uint64_t v19 = byte_10248A8FF;
  }
  if (v9 == v19)
  {
    if (byte_10248A8FF >= 0) {
      v20 = &xmmword_10248A8E8;
    }
    else {
      v20 = (long long *)xmmword_10248A8E8;
    }
    if ((v7 & 0x80) != 0)
    {
      v14 = (void *)__s1;
      if (!memcmp((const void *)__s1, v20, v8)) {
        goto LABEL_82;
      }
    }
    else
    {
      if (!v7) {
        goto LABEL_79;
      }
      v21 = &__s1;
      uint64_t v22 = v6;
      while (*(unsigned __int8 *)v21 == *(unsigned __int8 *)v20)
      {
        v21 = (long long *)((char *)v21 + 1);
        v20 = (long long *)((char *)v20 + 1);
        if (!--v22) {
          goto LABEL_77;
        }
      }
    }
  }
  uint64_t v23 = *((void *)&xmmword_10248A900 + 1);
  if (byte_10248A917 >= 0) {
    uint64_t v23 = byte_10248A917;
  }
  if (v9 != v23) {
    goto LABEL_66;
  }
  if (byte_10248A917 >= 0) {
    v24 = &xmmword_10248A900;
  }
  else {
    v24 = (long long *)xmmword_10248A900;
  }
  if ((v7 & 0x80) != 0)
  {
    v14 = (void *)__s1;
    if (memcmp((const void *)__s1, v24, v8)) {
      goto LABEL_66;
    }
LABEL_82:
    uint64_t value = self->fInstance.__ptr_.__value_;
LABEL_83:
    sub_1000DC48C(__p, v14, v8);
    goto LABEL_84;
  }
  if (!v7) {
    goto LABEL_79;
  }
  v25 = &__s1;
  uint64_t v26 = v6;
  while (*(unsigned __int8 *)v25 == *(unsigned __int8 *)v24)
  {
    v25 = (long long *)((char *)v25 + 1);
    v24 = (long long *)((char *)v24 + 1);
    if (!--v26) {
      goto LABEL_77;
    }
  }
LABEL_66:
  uint64_t v27 = *((void *)&xmmword_10248A918 + 1);
  if (byte_10248A92F >= 0) {
    uint64_t v27 = byte_10248A92F;
  }
  if (v9 != v27) {
    goto LABEL_86;
  }
  if (byte_10248A92F >= 0) {
    v28 = &xmmword_10248A918;
  }
  else {
    v28 = (long long *)xmmword_10248A918;
  }
  if ((v7 & 0x80) != 0)
  {
    v14 = (void *)__s1;
    if (memcmp((const void *)__s1, v28, v8)) {
      goto LABEL_86;
    }
    goto LABEL_82;
  }
  if (!v7)
  {
LABEL_79:
    uint64_t value = self->fInstance.__ptr_.__value_;
LABEL_80:
    *(_OWORD *)__p = __s1;
    uint64_t v100 = v102;
LABEL_84:
    sub_100B0E16C((uint64_t)value, (unsigned __int8 *)__p);
    if (SHIBYTE(v100) < 0) {
      operator delete(__p[0]);
    }
    goto LABEL_86;
  }
  v29 = &__s1;
  while (*(unsigned __int8 *)v29 == *(unsigned __int8 *)v28)
  {
    v29 = (long long *)((char *)v29 + 1);
    v28 = (long long *)((char *)v28 + 1);
    if (!--v6) {
      goto LABEL_77;
    }
  }
LABEL_86:
  uint64_t v31 = HIBYTE(v102);
  char v32 = HIBYTE(v102);
  if (v102 >= 0) {
    uint64_t v33 = HIBYTE(v102);
  }
  else {
    uint64_t v33 = *((void *)&__s1 + 1);
  }
  uint64_t v34 = qword_10248A938;
  if (byte_10248A947 >= 0) {
    uint64_t v34 = byte_10248A947;
  }
  if (v33 != v34) {
    goto LABEL_104;
  }
  if (byte_10248A947 >= 0) {
    v35 = &qword_10248A930;
  }
  else {
    v35 = (uint64_t *)qword_10248A930;
  }
  if (SHIBYTE(v102) < 0)
  {
    if (memcmp((const void *)__s1, v35, *((size_t *)&__s1 + 1)))
    {
      p_fInstance = (uint64_t *)&self->fInstance;
      v37 = self->fInstance.__ptr_.__value_;
      goto LABEL_106;
    }
    goto LABEL_103;
  }
  if (!HIBYTE(v102))
  {
LABEL_103:
    sub_100B100C8((uint64_t)self->fInstance.__ptr_.__value_);
    char v32 = HIBYTE(v102);
    goto LABEL_104;
  }
  v36 = &__s1;
  while (*(unsigned __int8 *)v36 == *(unsigned __int8 *)v35)
  {
    v36 = (long long *)((char *)v36 + 1);
    v35 = (uint64_t *)((char *)v35 + 1);
    if (!--v31) {
      goto LABEL_103;
    }
  }
LABEL_104:
  p_fInstance = (uint64_t *)&self->fInstance;
  v37 = self->fInstance.__ptr_.__value_;
  if ((v32 & 0x80) == 0)
  {
    *(_OWORD *)__dst = __s1;
    uint64_t v96 = v102;
    goto LABEL_107;
  }
LABEL_106:
  sub_1000DC48C(__dst, (void *)__s1, *((unint64_t *)&__s1 + 1));
LABEL_107:
  sub_100B103DC((uint64_t)v37, (unsigned __int8 *)__dst, &v97);
  if (SHIBYTE(v96) < 0) {
    operator delete(__dst[0]);
  }
  id v38 = (id)objc_opt_new();
  uint64_t v39 = v97;
  for (i = v98; v39 != i; uint64_t v39 = v44 + 32)
  {
    sub_100B10854(*p_fInstance, *(_DWORD *)v39, (uint64_t)buf);
    if (SBYTE3(v109) >= 0) {
      v41 = buf;
    }
    else {
      v41 = *(unsigned char **)buf;
    }
    v42 = +[NSString stringWithUTF8String:v41];
    if (SBYTE3(v109) < 0) {
      operator delete(*(void **)buf);
    }
    uint64_t v43 = *(unsigned int *)(v39 + 32);
    if (v43 == -1) {
      sub_1003217E4();
    }
    *(void *)v103 = buf;
    uint64_t v44 = v39 + 8;
    [v38 setObject:((uint64_t (*)(unsigned char *, uint64_t))off_1022DEA08[v43])(v103, v44) forKeyedSubscript:v42];
  }
  id v45 = objc_alloc_init((Class)NSMutableString);
  long long v93 = 0u;
  long long v94 = 0u;
  long long v91 = 0u;
  long long v92 = 0u;
  id v46 = [v38 countByEnumeratingWithState:&v91 objects:v106 count:16];
  int v47 = 1;
  if (v46)
  {
    CFStringRef v48 = @",\"%@\":\"%@\"";
    v49 = CKSyncEngine_ptr;
    uint64_t v83 = *(void *)v92;
    do
    {
      v50 = 0;
      id v82 = v46;
      do
      {
        if (*(void *)v92 != v83) {
          objc_enumerationMutation(v38);
        }
        id v51 = [v49[358] stringWithFormat:v48, *(void *)(*((void *)&v91 + 1) + 8 * (void)v50), [v38 objectForKeyedSubscript:*(void *)(*((void *)&v91 + 1) + 8 * (void)v50)]];
        v52 = (char *)[v45 length];
        if (&v52[(void)[v51 length]] > (char *)0x383)
        {
          if (qword_102419600 != -1) {
            dispatch_once(&qword_102419600, &stru_1022DE9A8);
          }
          v53 = qword_102419608;
          if (os_log_type_enabled((os_log_t)qword_102419608, OS_LOG_TYPE_DEFAULT))
          {
            v54 = v49;
            id v55 = v38;
            CFStringRef v56 = v48;
            int v57 = SHIBYTE(v102);
            v58 = (long long *)__s1;
            id v59 = [v45 UTF8String];
            *(_DWORD *)buf = 67109634;
            v60 = &__s1;
            if (v57 < 0) {
              v60 = v58;
            }
            *(_DWORD *)&buf[4] = v47;
            *(_WORD *)&uint8_t buf[8] = 2080;
            *(void *)&buf[10] = v60;
            __int16 v108 = 2080;
            id v109 = v59;
            _os_log_impl((void *)&_mh_execute_header, v53, OS_LOG_TYPE_DEFAULT, "#careport Part,%d,event,%s,measurements%s", buf, 0x1Cu);
            CFStringRef v48 = v56;
            id v38 = v55;
            v49 = v54;
            id v46 = v82;
          }
          if (sub_10013D1A0(115, 2))
          {
            bzero(buf, 0x65CuLL);
            if (qword_102419600 != -1) {
              dispatch_once(&qword_102419600, &stru_1022DE9A8);
            }
            int v61 = SHIBYTE(v102);
            v62 = (long long *)__s1;
            id v63 = [v45 UTF8String];
            *(_DWORD *)v103 = 67109634;
            v64 = &__s1;
            if (v61 < 0) {
              v64 = v62;
            }
            *(_DWORD *)&v103[4] = v47;
            *(_WORD *)&v103[8] = 2080;
            *(void *)&v103[10] = v64;
            __int16 v104 = 2080;
            id v105 = v63;
            v65 = (char *)_os_log_send_and_compose_impl();
            sub_1004BA5E4("Generic", 1, 0, 2, "-[CLAnalyticsLoggerAdapter submitEvent:]", "%s\n", v65);
            CFStringRef v48 = @",\"%@\":\"%@\"";
            if (v65 != buf) {
              free(v65);
            }
          }
          id v45 = [v51 mutableCopy];
          ++v47;
        }
        else
        {
          [v45 appendString:v51];
        }
        v50 = (char *)v50 + 1;
      }
      while (v46 != v50);
      id v66 = [v38 countByEnumeratingWithState:&v91 objects:v106 count:16];
      id v46 = v66;
    }
    while (v66);
  }
  if (qword_102419600 != -1) {
    dispatch_once(&qword_102419600, &stru_1022DE9A8);
  }
  v67 = qword_102419608;
  if (os_log_type_enabled((os_log_t)qword_102419608, OS_LOG_TYPE_DEFAULT))
  {
    int v68 = SHIBYTE(v102);
    v69 = (long long *)__s1;
    id v70 = [v45 UTF8String];
    v71 = &__s1;
    if (v68 < 0) {
      v71 = v69;
    }
    *(_DWORD *)buf = 67109634;
    *(_DWORD *)&buf[4] = v47;
    *(_WORD *)&uint8_t buf[8] = 2080;
    *(void *)&buf[10] = v71;
    __int16 v108 = 2080;
    id v109 = v70;
    _os_log_impl((void *)&_mh_execute_header, v67, OS_LOG_TYPE_DEFAULT, "#careport Part,%d,event,%s,measurements%s", buf, 0x1Cu);
  }
  if (sub_10013D1A0(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_102419600 != -1) {
      dispatch_once(&qword_102419600, &stru_1022DE9A8);
    }
    int v76 = SHIBYTE(v102);
    v77 = (long long *)__s1;
    id v78 = [v45 UTF8String];
    v79 = &__s1;
    if (v76 < 0) {
      v79 = v77;
    }
    *(_DWORD *)v103 = 67109634;
    *(_DWORD *)&v103[4] = v47;
    *(_WORD *)&v103[8] = 2080;
    *(void *)&v103[10] = v79;
    __int16 v104 = 2080;
    id v105 = v78;
    v80 = (char *)_os_log_send_and_compose_impl();
    sub_1004BA5E4("Generic", 1, 0, 2, "-[CLAnalyticsLoggerAdapter submitEvent:]", "%s\n", v80);
    if (v80 != buf) {
      free(v80);
    }
  }
  if (v102 >= 0) {
    v72 = &__s1;
  }
  else {
    v72 = (long long *)__s1;
  }
  +[NSString stringWithUTF8String:v72];
  v86 = _NSConcreteStackBlock;
  uint64_t v87 = 3221225472;
  v88 = sub_100B10A3C;
  v89 = &unk_1022D45F0;
  id v90 = v38;
  AnalyticsSendEventLazy();
  v73 = (void *)*p_fInstance;
  if (SHIBYTE(v102) < 0)
  {
    sub_1000DC48C(v84, (void *)__s1, *((unint64_t *)&__s1 + 1));
  }
  else
  {
    *(_OWORD *)v84 = __s1;
    uint64_t v85 = v102;
  }
  sub_100B10A44(v73, (unsigned __int8 *)v84);
  if (SHIBYTE(v85) < 0) {
    operator delete(v84[0]);
  }
  *(void *)buf = &v97;
  sub_100682B1C((void ***)buf);
  if (SHIBYTE(v102) < 0) {
    operator delete((void *)__s1);
  }
}

- (void)submitEvent:(id)a3 withMeasurements:(id)a4
{
  [(CLAnalyticsLoggerAdapter *)self setMeasurements:a4];

  [(CLAnalyticsLoggerAdapter *)self submitEvent:a3];
}

- (void).cxx_destruct
{
  uint64_t value = self->fInstance.__ptr_.__value_;
  self->fInstance.__ptr_.__value_ = 0;
  if (value) {
    (*(void (**)(void))(*(void *)value + 8))();
  }
}

- (id).cxx_construct
{
  *((void *)self + 1) = 0;
  return self;
}

@end