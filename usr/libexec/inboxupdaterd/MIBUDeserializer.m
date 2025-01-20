@interface MIBUDeserializer
- (BOOL)_deserializeError:(id *)a3 withErrorCodeTag:(id)a4 errorDomainTag:(id)a5 errorDescriptionTag:(id)a6;
- (BOOL)_deserializeNextTag:(id *)a3 withData:(id *)a4;
- (BOOL)deserializeOperationError:(id *)a3;
- (BOOL)deserializeResponseError:(id *)a3;
- (MIBUDeserializer)initWithData:(id)a3;
- (NSData)data;
- (NSDictionary)tagValDict;
- (id)_valueForTag:(id)a3 withData:(id)a4;
- (id)deserialize;
- (unint64_t)pos;
- (void)setData:(id)a3;
- (void)setPos:(unint64_t)a3;
- (void)setTagValDict:(id)a3;
@end

@implementation MIBUDeserializer

- (MIBUDeserializer)initWithData:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)MIBUDeserializer;
  v5 = [(MIBUDeserializer *)&v8 init];
  v6 = v5;
  if (v5)
  {
    [(MIBUDeserializer *)v5 setData:v4];
    [(MIBUDeserializer *)v6 setPos:0];
    [(MIBUDeserializer *)v6 setTagValDict:0];
  }

  return v6;
}

- (id)deserialize
{
  v3 = [(MIBUDeserializer *)self tagValDict];

  if (v3)
  {
    id v4 = [(MIBUDeserializer *)self tagValDict];
  }
  else
  {
    v5 = objc_opt_new();
    id v6 = 0;
    id v7 = 0;
    do
    {
      objc_super v8 = v7;
      v9 = v6;
      id v13 = v6;
      id v14 = v7;
      unsigned int v10 = [(MIBUDeserializer *)self _deserializeNextTag:&v14 withData:&v13];
      id v7 = v14;

      id v6 = v13;
      if (!v10)
      {

        id v4 = 0;
        goto LABEL_14;
      }
      if (v6 && v7)
      {
        v11 = [(MIBUDeserializer *)self _valueForTag:v7 withData:v6];
        if (v11) {
          [v5 setObject:v11 forKey:v7];
        }
      }
    }
    while (v7);
    if ([v5 count]) {
      [(MIBUDeserializer *)self setTagValDict:v5];
    }
    id v4 = v5;
LABEL_14:
  }

  return v4;
}

- (BOOL)deserializeResponseError:(id *)a3
{
  return [(MIBUDeserializer *)self _deserializeError:a3 withErrorCodeTag:&off_100060060 errorDomainTag:&off_100060060 errorDescriptionTag:&off_100060078];
}

- (BOOL)deserializeOperationError:(id *)a3
{
  return [(MIBUDeserializer *)self _deserializeError:a3 withErrorCodeTag:&off_100060090 errorDomainTag:&off_1000600A8 errorDescriptionTag:&off_1000600C0];
}

- (BOOL)_deserializeNextTag:(id *)a3 withData:(id *)a4
{
  unsigned __int8 v43 = 0;
  unsigned int v42 = 0;
  unint64_t v7 = [(MIBUDeserializer *)self pos];
  objc_super v8 = [(MIBUDeserializer *)self data];
  id v9 = [v8 length];

  if ((id)v7 == v9)
  {
LABEL_19:
    v18 = 0;
    v16 = 0;
    v25 = 0;
    goto LABEL_10;
  }
  unint64_t v10 = v7 + 5;
  v11 = [(MIBUDeserializer *)self data];
  id v12 = [v11 length];

  if (v7 + 5 >= (unint64_t)v12)
  {
    if (qword_10006C958 != -1) {
      dispatch_once(&qword_10006C958, &stru_10005A1C8);
    }
    v28 = (void *)qword_10006C950;
    if (os_log_type_enabled((os_log_t)qword_10006C950, OS_LOG_TYPE_DEFAULT))
    {
      v29 = v28;
      v30 = [(MIBUDeserializer *)self data];
      v31 = [(MIBUDeserializer *)self data];
      *(_DWORD *)buf = 138543874;
      *(void *)v45 = v30;
      *(_WORD *)&v45[8] = 2048;
      *(void *)&v45[10] = v7;
      *(_WORD *)&v45[18] = 2048;
      *(void *)&v45[20] = [v31 length];
      _os_log_impl((void *)&_mh_execute_header, v29, OS_LOG_TYPE_DEFAULT, "Warning: Data %{public}@ Terminating deserialization at %lu for data length: %lu", buf, 0x20u);
    }
    goto LABEL_19;
  }
  unint64_t v13 = v7 + 1;
  id v14 = [(MIBUDeserializer *)self data];
  [v14 getBytes:&v43 range:v7];

  v15 = [(MIBUDeserializer *)self data];
  [v15 getBytes:&v42 range:v13];

  v16 = +[NSNumber numberWithUnsignedChar:v43];
  v17 = +[MIBUSerializationUtil maxLengthForTag:v16];
  if (v17)
  {
    v18 = v17;
    unsigned int v19 = v42;
    if (v19 > [v17 unsignedIntValue])
    {
      if (qword_10006C958 != -1) {
        dispatch_once(&qword_10006C958, &stru_10005A208);
      }
      v33 = (void *)qword_10006C950;
      if (os_log_type_enabled((os_log_t)qword_10006C950, OS_LOG_TYPE_ERROR))
      {
        v34 = v33;
        unsigned int v35 = [v16 charValue];
        unsigned int v36 = v42;
        unsigned int v37 = [v18 unsignedIntValue];
        *(_DWORD *)buf = 67109632;
        *(_DWORD *)v45 = v35;
        *(_WORD *)&v45[4] = 1024;
        *(_DWORD *)&v45[6] = v36;
        *(_WORD *)&v45[10] = 1024;
        *(_DWORD *)&v45[12] = v37;
        _os_log_error_impl((void *)&_mh_execute_header, v34, OS_LOG_TYPE_ERROR, "0x%X field len: %u is > expected len: %u", buf, 0x14u);
      }
    }
    else
    {
      unint64_t v20 = v10 + v42;
      v21 = [(MIBUDeserializer *)self data];
      id v22 = [v21 length];

      if (v20 <= (unint64_t)v22)
      {
        if (v42)
        {
          id v23 = [(MIBUDeserializer *)self data];
          v24 = (char *)[v23 bytes];
          v25 = +[NSData dataWithBytesNoCopy:&v24[v10] length:v42 freeWhenDone:0];

          v10 += v42;
        }
        else
        {
          v25 = 0;
        }
        [(MIBUDeserializer *)self setPos:v10];
LABEL_10:
        BOOL v26 = 1;
        if (!a3) {
          goto LABEL_12;
        }
        goto LABEL_11;
      }
      if (qword_10006C958 != -1) {
        dispatch_once(&qword_10006C958, &stru_10005A228);
      }
      v38 = (void *)qword_10006C950;
      if (os_log_type_enabled((os_log_t)qword_10006C950, OS_LOG_TYPE_ERROR))
      {
        unsigned int v39 = v42;
        v40 = v38;
        v41 = [(MIBUDeserializer *)self data];
        *(_DWORD *)buf = 67109634;
        *(_DWORD *)v45 = v39;
        *(_WORD *)&v45[4] = 2048;
        *(void *)&v45[6] = v10;
        *(_WORD *)&v45[14] = 2114;
        *(void *)&v45[16] = v41;
        _os_log_error_impl((void *)&_mh_execute_header, v40, OS_LOG_TYPE_ERROR, "Failed to deserialize %u bytes data at %lu; data %{public}@ too short",
          buf,
          0x1Cu);
      }
    }
  }
  else
  {
    if (qword_10006C958 != -1) {
      dispatch_once(&qword_10006C958, &stru_10005A1E8);
    }
    v32 = (void *)qword_10006C950;
    if (os_log_type_enabled((os_log_t)qword_10006C950, OS_LOG_TYPE_ERROR)) {
      sub_10003F594(v32, v16);
    }
    v18 = 0;
  }
  v25 = 0;
  BOOL v26 = 0;
  if (a3) {
LABEL_11:
  }
    *a3 = v16;
LABEL_12:
  if (a4) {
    *a4 = v25;
  }

  return v26;
}

- (id)_valueForTag:(id)a3 withData:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  unint64_t v7 = +[MIBUSerializationUtil typeForTag:v6];
  objc_super v8 = +[MIBUSerializationUtil maxLengthForTag:v6];

  if (v7) {
    BOOL v9 = v8 == 0;
  }
  else {
    BOOL v9 = 1;
  }
  if (!v9)
  {
    switch([v7 unsignedIntValue])
    {
      case 1u:
      case 3u:
      case 4u:
        unsigned int v10 = [v8 unsignedIntValue];
        if (!v5 || (unsigned int v11 = v10, ![v5 length]))
        {
          if (qword_10006C958 != -1) {
            dispatch_once(&qword_10006C958, &stru_10005A248);
          }
          unint64_t v20 = qword_10006C950;
          if (!os_log_type_enabled((os_log_t)qword_10006C950, OS_LOG_TYPE_ERROR)) {
            break;
          }
          goto LABEL_35;
        }
        if (v11 - 9 <= 0xFFFFFFF7)
        {
          if (qword_10006C958 != -1) {
            dispatch_once(&qword_10006C958, &stru_10005A268);
          }
          if (!os_log_type_enabled((os_log_t)qword_10006C950, OS_LOG_TYPE_ERROR)) {
            break;
          }
          goto LABEL_59;
        }
        if ([v5 length] == (id)v11)
        {
          double v34 = 0.0;
          [v5 getBytes:&v34 range:v11];
          id v12 = +[NSNumber numberWithLongLong:*(void *)&v34];
          goto LABEL_28;
        }
        if (qword_10006C958 != -1) {
          dispatch_once(&qword_10006C958, &stru_10005A288);
        }
        if (!os_log_type_enabled((os_log_t)qword_10006C950, OS_LOG_TYPE_ERROR)) {
          break;
        }
        goto LABEL_67;
      case 2u:
        unsigned int v15 = [v8 unsignedIntValue];
        if (!v5 || (unsigned int v16 = v15, ![v5 length]))
        {
          if (qword_10006C958 != -1) {
            dispatch_once(&qword_10006C958, &stru_10005A2A8);
          }
          unint64_t v20 = qword_10006C950;
          if (os_log_type_enabled((os_log_t)qword_10006C950, OS_LOG_TYPE_ERROR)) {
LABEL_35:
          }
            sub_10003F6AC((uint64_t)v5, v20, v21, v22, v23, v24, v25, v26);
          break;
        }
        if (v16 - 9 <= 0xFFFFFFF7)
        {
          if (qword_10006C958 != -1) {
            dispatch_once(&qword_10006C958, &stru_10005A2C8);
          }
          if (!os_log_type_enabled((os_log_t)qword_10006C950, OS_LOG_TYPE_ERROR)) {
            break;
          }
          goto LABEL_59;
        }
        if ([v5 length] == (id)v16)
        {
          double v34 = 0.0;
          [v5 getBytes:&v34 range:v16];
          id v12 = +[NSNumber numberWithDouble:v34];
          goto LABEL_28;
        }
        if (qword_10006C958 != -1) {
          dispatch_once(&qword_10006C958, &stru_10005A2E8);
        }
        if (!os_log_type_enabled((os_log_t)qword_10006C950, OS_LOG_TYPE_ERROR)) {
          break;
        }
        goto LABEL_67;
      case 5u:
        id v12 = [objc_alloc((Class)NSString) initWithData:v5 encoding:4];
        goto LABEL_28;
      case 6u:
        id v12 = v5;
        goto LABEL_28;
      case 7u:
        unsigned int v17 = [v8 unsignedIntValue];
        if (!v5 || (unsigned int v18 = v17, ![v5 length]))
        {
          if (qword_10006C958 != -1) {
            dispatch_once(&qword_10006C958, &stru_10005A308);
          }
          v27 = qword_10006C950;
          if (os_log_type_enabled((os_log_t)qword_10006C950, OS_LOG_TYPE_ERROR)) {
            sub_10003F7E8((uint64_t)v5, v27, v28, v29, v30, v31, v32, v33);
          }
          break;
        }
        if (v18 - 9 <= 0xFFFFFFF7)
        {
          if (qword_10006C958 != -1) {
            dispatch_once(&qword_10006C958, &stru_10005A328);
          }
          if (os_log_type_enabled((os_log_t)qword_10006C950, OS_LOG_TYPE_ERROR)) {
LABEL_59:
          }
            sub_10003F718();
        }
        else
        {
          if ([v5 length] == (id)v18)
          {
            double v34 = 0.0;
            [v5 getBytes:&v34 range:v18];
            id v12 = +[NSNumber numberWithUnsignedLongLong:*(void *)&v34];
LABEL_28:
            id v14 = v12;
            goto LABEL_29;
          }
          if (qword_10006C958 != -1) {
            dispatch_once(&qword_10006C958, &stru_10005A348);
          }
          if (os_log_type_enabled((os_log_t)qword_10006C950, OS_LOG_TYPE_ERROR)) {
LABEL_67:
          }
            sub_10003F780();
        }
        break;
      default:
        if (qword_10006C958 != -1) {
          dispatch_once(&qword_10006C958, &stru_10005A368);
        }
        unint64_t v13 = (void *)qword_10006C950;
        if (os_log_type_enabled((os_log_t)qword_10006C950, OS_LOG_TYPE_ERROR)) {
          sub_10003F620(v13, v7);
        }
        break;
    }
  }
  id v14 = 0;
LABEL_29:

  return v14;
}

- (BOOL)_deserializeError:(id *)a3 withErrorCodeTag:(id)a4 errorDomainTag:(id)a5 errorDescriptionTag:(id)a6
{
  id v10 = a4;
  id v11 = a5;
  id v12 = a6;
  unint64_t v13 = objc_opt_new();
  id v14 = [(MIBUDeserializer *)self tagValDict];

  if (!v14)
  {
    if (qword_10006C958 != -1) {
      dispatch_once(&qword_10006C958, &stru_10005A388);
    }
    uint64_t v24 = qword_10006C950;
    if (os_log_type_enabled((os_log_t)qword_10006C950, OS_LOG_TYPE_ERROR)) {
      sub_10003F854(v24, v25, v26, v27, v28, v29, v30, v31);
    }
LABEL_18:
    unint64_t v20 = 0;
    unsigned int v18 = 0;
    unsigned int v16 = 0;
    BOOL v22 = 0;
    uint64_t v21 = 0;
    if (!a3) {
      goto LABEL_9;
    }
    goto LABEL_8;
  }
  unsigned int v15 = [(MIBUDeserializer *)self tagValDict];
  unsigned int v16 = [v15 objectForKey:v10];

  if (!v16)
  {
    if (qword_10006C958 != -1) {
      dispatch_once(&qword_10006C958, &stru_10005A3A8);
    }
    uint64_t v32 = qword_10006C950;
    if (os_log_type_enabled((os_log_t)qword_10006C950, OS_LOG_TYPE_ERROR)) {
      sub_10003F88C(v32, v33, v34, v35, v36, v37, v38, v39);
    }
    goto LABEL_18;
  }
  if ([v16 longValue])
  {
    unsigned int v17 = [(MIBUDeserializer *)self tagValDict];
    unsigned int v18 = [v17 objectForKey:v11];

    unsigned int v19 = [(MIBUDeserializer *)self tagValDict];
    unint64_t v20 = [v19 objectForKey:v12];

    if (v20) {
      [v13 setObject:v20 forKeyedSubscript:NSLocalizedDescriptionKey];
    }
    uint64_t v21 = +[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", v18, [v16 longValue], v13);
  }
  else
  {
    unint64_t v20 = 0;
    unsigned int v18 = 0;
    uint64_t v21 = 0;
  }
  BOOL v22 = 1;
  if (a3) {
LABEL_8:
  }
    *a3 = v21;
LABEL_9:

  return v22;
}

- (NSData)data
{
  return self->_data;
}

- (void)setData:(id)a3
{
}

- (unint64_t)pos
{
  return self->_pos;
}

- (void)setPos:(unint64_t)a3
{
  self->_pos = a3;
}

- (NSDictionary)tagValDict
{
  return self->_tagValDict;
}

- (void)setTagValDict:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_tagValDict, 0);

  objc_storeStrong((id *)&self->_data, 0);
}

@end