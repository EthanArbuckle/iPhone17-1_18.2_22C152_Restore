@interface MIBUSerializer
- (BOOL)_serializeError:(id)a3 withErrorCodeTag:(id)a4 errorDomainTag:(id)a5 errorDescriptionTag:(id)a6;
- (BOOL)serialize:(id)a3 withValue:(id)a4;
- (BOOL)serializeOperationError:(id)a3;
- (BOOL)serializeResponseError:(id)a3;
- (MIBUSerializer)init;
- (NSMutableData)data;
- (id)_serializeValue:(id)a3 forTag:(id)a4;
- (void)setData:(id)a3;
@end

@implementation MIBUSerializer

- (MIBUSerializer)init
{
  v5.receiver = self;
  v5.super_class = (Class)MIBUSerializer;
  v2 = [(MIBUSerializer *)&v5 init];
  if (v2)
  {
    v3 = objc_opt_new();
    [(MIBUSerializer *)v2 setData:v3];
  }
  return v2;
}

- (BOOL)serialize:(id)a3 withValue:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v24 = 0;
  v25 = &v24;
  uint64_t v26 = 0x3032000000;
  v27 = sub_1000276EC;
  v28 = sub_1000276FC;
  id v29 = (id)objc_opt_new();
  v22[0] = 0;
  v22[1] = v22;
  v22[2] = 0x3032000000;
  v22[3] = sub_1000276EC;
  v22[4] = sub_1000276FC;
  id v8 = v7;
  id v23 = v8;
  objc_initWeak(&location, self);
  id v9 = [v6 count];
  BOOL v10 = v9 == [v8 count];
  if (v10)
  {
    v14 = _NSConcreteStackBlock;
    uint64_t v15 = 3221225472;
    v16 = sub_10002776C;
    v17 = &unk_10005B930;
    objc_copyWeak(&v20, &location);
    v18 = v22;
    v19 = &v24;
    [v6 enumerateObjectsUsingBlock:&v14];
    objc_destroyWeak(&v20);
    v11 = (void *)v25[5];
    if (!v11 || !objc_msgSend(v11, "length", v14, v15, v16, v17))
    {
      BOOL v10 = 0;
      goto LABEL_7;
    }
    v12 = [(MIBUSerializer *)self data];
    [v12 appendData:v25[5]];
  }
  else
  {
    if (qword_10006C958 != -1) {
      dispatch_once(&qword_10006C958, &stru_10005B8C8);
    }
    v12 = (id)qword_10006C950;
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
      sub_100040748(buf, (uint64_t)[v8 count], (uint64_t)[v6 count], v12);
    }
  }

LABEL_7:
  objc_destroyWeak(&location);
  _Block_object_dispose(v22, 8);

  _Block_object_dispose(&v24, 8);
  return v10;
}

- (BOOL)serializeResponseError:(id)a3
{
  return [(MIBUSerializer *)self _serializeError:a3 withErrorCodeTag:&off_100060420 errorDomainTag:&off_100060438 errorDescriptionTag:&off_100060450];
}

- (BOOL)serializeOperationError:(id)a3
{
  return [(MIBUSerializer *)self _serializeError:a3 withErrorCodeTag:&off_100060468 errorDomainTag:&off_100060480 errorDescriptionTag:&off_100060498];
}

- (id)_serializeValue:(id)a3 forTag:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  v24[4] = 0;
  *(_DWORD *)uint64_t v24 = [v6 charValue];
  id v7 = +[MIBUSerializationUtil typeForTag:v6];
  if (v7)
  {
    id v8 = +[MIBUSerializationUtil maxLengthForTag:v6];
    if (v8)
    {
      switch([v7 unsignedIntValue])
      {
        case 1u:
        case 3u:
        case 4u:
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            id v9 = v5;
            id v10 = [v9 longLongValue];
            goto LABEL_20;
          }
          if (qword_10006C958 != -1) {
            dispatch_once(&qword_10006C958, &stru_10005B950);
          }
          if (os_log_type_enabled((os_log_t)qword_10006C950, OS_LOG_TYPE_ERROR)) {
            goto LABEL_52;
          }
          goto LABEL_10;
        case 2u:
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            id v9 = v5;
            [v9 doubleValue];
            *(void *)buf = v14;
            goto LABEL_21;
          }
          if (qword_10006C958 != -1) {
            dispatch_once(&qword_10006C958, &stru_10005B970);
          }
          if (os_log_type_enabled((os_log_t)qword_10006C950, OS_LOG_TYPE_ERROR)) {
            goto LABEL_52;
          }
          goto LABEL_10;
        case 5u:
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            id v15 = [v5 dataUsingEncoding:4];
            goto LABEL_17;
          }
          if (qword_10006C958 != -1) {
            dispatch_once(&qword_10006C958, &stru_10005B990);
          }
          if (os_log_type_enabled((os_log_t)qword_10006C950, OS_LOG_TYPE_ERROR)) {
            sub_1000409DC();
          }
          goto LABEL_10;
        case 6u:
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) == 0)
          {
            if (qword_10006C958 != -1) {
              dispatch_once(&qword_10006C958, &stru_10005B9B0);
            }
            if (os_log_type_enabled((os_log_t)qword_10006C950, OS_LOG_TYPE_ERROR)) {
              sub_100040A90();
            }
            goto LABEL_10;
          }
          id v15 = v5;
LABEL_17:
          v12 = v15;
          goto LABEL_22;
        case 7u:
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) == 0)
          {
            if (qword_10006C958 != -1) {
              dispatch_once(&qword_10006C958, &stru_10005B9D0);
            }
            if (os_log_type_enabled((os_log_t)qword_10006C950, OS_LOG_TYPE_ERROR)) {
LABEL_52:
            }
              sub_100040928();
            goto LABEL_10;
          }
          id v9 = v5;
          id v10 = [v9 unsignedLongLongValue];
LABEL_20:
          *(void *)buf = v10;
LABEL_21:
          v12 = +[NSData dataWithBytes:length:](NSData, "dataWithBytes:length:", buf, [v8 unsignedIntValue]);

LABEL_22:
          *(_DWORD *)&v24[1] = [v12 length];
          if ([v8 unsignedIntValue] < *(_DWORD *)&v24[1])
          {
            if (qword_10006C958 != -1) {
              dispatch_once(&qword_10006C958, &stru_10005BA10);
            }
            v16 = (void *)qword_10006C950;
            if (os_log_type_enabled((os_log_t)qword_10006C950, OS_LOG_TYPE_ERROR))
            {
              id v20 = v16;
              unsigned int v21 = [v6 charValue];
              id v22 = [v12 length];
              unsigned int v23 = [v8 unsignedIntValue];
              *(_DWORD *)buf = 67109890;
              *(_DWORD *)&buf[4] = v21;
              __int16 v26 = 2114;
              v27 = v12;
              __int16 v28 = 2048;
              id v29 = v22;
              __int16 v30 = 1024;
              unsigned int v31 = v23;
              _os_log_error_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_ERROR, "Truncating tag 0x%X - %{public}@ with data length %ld to %d", buf, 0x22u);
            }
            id v17 = v12;
            v12 = [NSData dataWithBytes:[v17 bytes] length:[v8 unsignedIntValue]];

            *(_DWORD *)&v24[1] = [v12 length];
          }
          v13 = objc_opt_new();
          [v13 appendBytes:v24 length:1];
          [v13 appendBytes:&v24[1] length:4];
          [v13 appendData:v12];
          break;
        default:
          if (qword_10006C958 != -1) {
            dispatch_once(&qword_10006C958, &stru_10005B9F0);
          }
          v11 = (void *)qword_10006C950;
          if (os_log_type_enabled((os_log_t)qword_10006C950, OS_LOG_TYPE_ERROR)) {
            sub_10004088C(v11, v7);
          }
          goto LABEL_10;
      }
    }
    else
    {
LABEL_10:
      v12 = 0;
      v13 = 0;
    }
  }
  else
  {
    v12 = 0;
    v13 = 0;
    id v8 = 0;
  }
  id v18 = v13;

  return v18;
}

- (BOOL)_serializeError:(id)a3 withErrorCodeTag:(id)a4 errorDomainTag:(id)a5 errorDescriptionTag:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  id v15 = [(MIBUSerializer *)self data];
  id v43 = [v15 copy];

  v16 = [v10 description];
  if (v16)
  {
    CFStringRef v17 = [v10 description];
  }
  else
  {
    CFStringRef v17 = &stru_10005F6F8;
  }

  v42 = (__CFString *)v17;
  if (!v10)
  {
    id v46 = v11;
    BOOL v28 = 1;
    id v29 = +[NSArray arrayWithObjects:&v46 count:1];
    unsigned __int8 v30 = [(MIBUSerializer *)self serialize:v29 withValue:&off_1000612E8];

    id v22 = self;
    if (v30) {
      goto LABEL_9;
    }
    goto LABEL_10;
  }
  id v18 = [v10 domain];

  if (!v18)
  {
    if (qword_10006C958 != -1) {
      dispatch_once(&qword_10006C958, &stru_10005BA30);
    }
    v33 = qword_10006C950;
    if (os_log_type_enabled((os_log_t)qword_10006C950, OS_LOG_TYPE_ERROR)) {
      sub_100040BBC(v33, v34, v35, v36, v37, v38, v39, v40);
    }
    goto LABEL_18;
  }
  v45[0] = v11;
  v45[1] = v12;
  v45[2] = v13;
  v19 = +[NSArray arrayWithObjects:v45 count:3];
  v41 = v14;
  id v20 = +[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", [v10 code]);
  v44[0] = v20;
  unsigned int v21 = [v10 domain];
  v44[1] = v21;
  v44[2] = v17;
  +[NSArray arrayWithObjects:v44 count:3];
  id v22 = self;
  id v23 = v11;
  id v24 = v13;
  __int16 v26 = v25 = v12;
  unsigned __int8 v27 = [(MIBUSerializer *)v22 serialize:v19 withValue:v26];

  id v12 = v25;
  id v13 = v24;
  id v11 = v23;

  uint64_t v14 = v41;
  if ((v27 & 1) == 0)
  {
LABEL_10:
    if (qword_10006C958 != -1) {
      dispatch_once(&qword_10006C958, &stru_10005BA50);
    }
    self = v22;
    v32 = qword_10006C950;
    if (os_log_type_enabled((os_log_t)qword_10006C950, OS_LOG_TYPE_ERROR)) {
      sub_100040B44((uint64_t)v10, v32);
    }
LABEL_18:
    [(MIBUSerializer *)self setData:v43];
    BOOL v28 = 0;
    goto LABEL_9;
  }
  BOOL v28 = 1;
LABEL_9:

  return v28;
}

- (NSMutableData)data
{
  return self->_data;
}

- (void)setData:(id)a3
{
}

- (void).cxx_destruct
{
}

@end