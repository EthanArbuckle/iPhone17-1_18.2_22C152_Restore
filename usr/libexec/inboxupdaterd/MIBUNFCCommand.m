@interface MIBUNFCCommand
- (BOOL)_deserializeConfigureNFC;
- (BOOL)_deserializeHeartbeat;
- (BOOL)_deserializeRetryAfter;
- (BOOL)_deserializeStartDiag;
- (BOOL)_deserializeStartUpdate;
- (BOOL)_deserializeTatsuPayload;
- (BOOL)_initWithAPDU:(id)a3;
- (BOOL)_initWithCommandCode:(int64_t)a3;
- (Class)getResponseClass;
- (MIBUNFCCommand)initWithAPDU:(id)a3;
- (MIBUNFCCommand)initWithCommandCode:(int64_t)a3 andPayload:(id)a4;
- (NSData)apdu;
- (NSData)serializedPayload;
- (NSMutableDictionary)mutablePayload;
- (id)_serializeConfigureNFC;
- (id)_serializeHeartbeat;
- (id)_serializeRetryAfter;
- (id)_serializeStartDiag;
- (id)_serializeStartUpdate;
- (id)_serializeTatsuPayload:(id)a3;
- (int64_t)code;
- (unsigned)cla;
- (unsigned)ins;
- (unsigned)p1;
- (unsigned)p2;
- (void)setMutablePayload:(id)a3;
@end

@implementation MIBUNFCCommand

- (MIBUNFCCommand)initWithCommandCode:(int64_t)a3 andPayload:(id)a4
{
  id v6 = a4;
  v12.receiver = self;
  v12.super_class = (Class)MIBUNFCCommand;
  v7 = [(MIBUNFCCommand *)&v12 init];
  v8 = v7;
  if (v7
    && (v7->_code = a3,
        id v9 = [v6 mutableCopy],
        [(MIBUNFCCommand *)v8 setMutablePayload:v9],
        v9,
        ![(MIBUNFCCommand *)v8 _initWithCommandCode:a3]))
  {
    v10 = 0;
  }
  else
  {
    v10 = v8;
  }

  return v10;
}

- (MIBUNFCCommand)initWithAPDU:(id)a3
{
  id v5 = a3;
  v11.receiver = self;
  v11.super_class = (Class)MIBUNFCCommand;
  id v6 = [(MIBUNFCCommand *)&v11 init];
  v7 = v6;
  if (v6
    && (objc_storeStrong((id *)&v6->_apdu, a3),
        v8 = objc_opt_new(),
        [(MIBUNFCCommand *)v7 setMutablePayload:v8],
        v8,
        ![(MIBUNFCCommand *)v7 _initWithAPDU:v5]))
  {
    id v9 = 0;
  }
  else
  {
    id v9 = v7;
  }

  return v9;
}

- (Class)getResponseClass
{
  objc_opt_class();
  [(MIBUNFCCommand *)self code];
  v3 = objc_opt_class();

  return (Class)v3;
}

- (BOOL)_initWithCommandCode:(int64_t)a3
{
  id v5 = objc_opt_new();
  self->_cla = 0;
  serializedPayload = self->_serializedPayload;
  self->_serializedPayload = 0;

  p_code = &self->_code;
  switch(self->_code)
  {
    case 1:
      *(_WORD *)&self->_ins = 458;
      self->_p2 = 0;
      goto LABEL_16;
    case 2:
      *(_WORD *)&self->_ins = 474;
      self->_p2 = 1;
      v8 = [(MIBUNFCCommand *)self _serializeStartUpdate];
      goto LABEL_19;
    case 3:
      *(_WORD *)&self->_ins = 458;
      unsigned __int8 v9 = 2;
      goto LABEL_15;
    case 4:
      *(_WORD *)&self->_ins = 1188;
      self->_p2 = 0;
      v10 = [(MIBUNFCCommand *)self mutablePayload];
      objc_super v11 = [v10 objectForKey:@"ApplicationID"];
      objc_super v12 = self->_serializedPayload;
      self->_serializedPayload = v11;

      goto LABEL_20;
    case 6:
      *(_WORD *)&self->_ins = 474;
      self->_p2 = 2;
      v8 = [(MIBUNFCCommand *)self _serializeRetryAfter];
      goto LABEL_19;
    case 7:
      *(_WORD *)&self->_ins = 474;
      self->_p2 = 3;
      v8 = [(MIBUNFCCommand *)self _serializeHeartbeat];
      goto LABEL_19;
    case 8:
      *(_WORD *)&self->_ins = 474;
      unsigned __int8 v9 = 4;
      goto LABEL_15;
    case 9:
      *(_WORD *)&self->_ins = 458;
      unsigned __int8 v9 = 3;
LABEL_15:
      self->_p2 = v9;
LABEL_16:
      v8 = (NSData *)objc_opt_new();
      goto LABEL_19;
    case 0xALL:
      *(_WORD *)&self->_ins = 474;
      self->_p2 = 5;
      v8 = [(MIBUNFCCommand *)self _serializeConfigureNFC];
      goto LABEL_19;
    case 0xBLL:
      *(_WORD *)&self->_ins = 474;
      self->_p2 = 6;
      v8 = [(MIBUNFCCommand *)self _serializeStartDiag];
LABEL_19:
      v10 = self->_serializedPayload;
      self->_serializedPayload = v8;
LABEL_20:

      v16 = self->_serializedPayload;
      if (v16)
      {
        int v24 = *(_DWORD *)&self->_cla;
        if ([(NSData *)v16 length])
        {
          NSUInteger v17 = [(NSData *)self->_serializedPayload length];
          unsigned __int16 v18 = (unsigned __int16)[(NSData *)self->_serializedPayload length];
          if (v17 > 0xFF)
          {
            char v25 = 0;
            char v26 = HIBYTE(v18);
            char v27 = v18;
            v19 = v5;
            uint64_t v20 = 7;
          }
          else
          {
            char v25 = v18;
            v19 = v5;
            uint64_t v20 = 5;
          }
          [v19 appendBytes:&v24 length:v20];
          [v5 appendData:self->_serializedPayload];
        }
        else
        {
          [v5 appendBytes:&v24 length:4];
        }
        objc_storeStrong((id *)&self->_apdu, v5);
        BOOL v15 = 1;
      }
      else
      {
        if (qword_10006C958 != -1) {
          dispatch_once(&qword_10006C958, &stru_10005BBD0);
        }
        v22 = qword_10006C950;
        if (os_log_type_enabled((os_log_t)qword_10006C950, OS_LOG_TYPE_ERROR)) {
          sub_100040E4C(p_code, v22, v23);
        }
LABEL_10:
        BOOL v15 = 0;
      }

      return v15;
    default:
      if (qword_10006C958 != -1) {
        dispatch_once(&qword_10006C958, &stru_10005BBB0);
      }
      v13 = qword_10006C950;
      if (os_log_type_enabled((os_log_t)qword_10006C950, OS_LOG_TYPE_ERROR)) {
        sub_100040DDC(a3, v13, v14);
      }
      goto LABEL_10;
  }
}

- (BOOL)_initWithAPDU:(id)a3
{
  id v4 = a3;
  self->_code = 0;
  serializedPayload = self->_serializedPayload;
  self->_serializedPayload = 0;

  if ((unint64_t)[v4 length] <= 3)
  {
    if (qword_10006C958 != -1) {
      dispatch_once(&qword_10006C958, &stru_10005BBF0);
    }
    char v26 = (void *)qword_10006C950;
    if (os_log_type_enabled((os_log_t)qword_10006C950, OS_LOG_TYPE_ERROR)) {
      sub_100040EC0(v26, v4);
    }
    goto LABEL_82;
  }
  id v6 = v4;
  v7 = (unsigned __int8 *)[v6 bytes];
  int v8 = *v7;
  if (*v7)
  {
    if (qword_10006C958 != -1) {
      dispatch_once(&qword_10006C958, &stru_10005BC10);
    }
    char v27 = qword_10006C950;
    if (os_log_type_enabled((os_log_t)qword_10006C950, OS_LOG_TYPE_ERROR)) {
      sub_1000411C4(v8, v27);
    }
    goto LABEL_82;
  }
  unsigned __int8 v9 = v7;
  int v10 = v7[1];
  int v11 = v7[2];
  int v12 = v7[3];
  if ([v6 length] == (id)4)
  {
LABEL_6:
    BOOL v15 = (NSData *)objc_opt_new();
    goto LABEL_13;
  }
  id v13 = [v6 length];
  unsigned int v14 = v9[4];
  if (v13 == (id)5)
  {
    if (v9[4])
    {
      if (qword_10006C958 != -1) {
        dispatch_once(&qword_10006C958, &stru_10005BC30);
      }
      if (os_log_type_enabled((os_log_t)qword_10006C950, OS_LOG_TYPE_ERROR)) {
        sub_100041050();
      }
      goto LABEL_82;
    }
    goto LABEL_6;
  }
  if (v9[4])
  {
    uint64_t v16 = 5;
  }
  else
  {
    if ((unint64_t)[v6 length] <= 6)
    {
      if (qword_10006C958 != -1) {
        dispatch_once(&qword_10006C958, &stru_10005BC50);
      }
      v29 = (void *)qword_10006C950;
      if (os_log_type_enabled((os_log_t)qword_10006C950, OS_LOG_TYPE_ERROR)) {
        sub_100041084(v29, v6);
      }
      goto LABEL_82;
    }
    unsigned int v14 = bswap32(*(unsigned __int16 *)(v9 + 5)) >> 16;
    uint64_t v16 = 7;
  }
  uint64_t v17 = v14;
  if (v16 + (unint64_t)v14 > (unint64_t)[v6 length])
  {
    if (qword_10006C958 != -1) {
      dispatch_once(&qword_10006C958, &stru_10005BC70);
    }
    v28 = (void *)qword_10006C950;
    if (os_log_type_enabled((os_log_t)qword_10006C950, OS_LOG_TYPE_ERROR)) {
      sub_100041110(v17, v28, v6);
    }
    goto LABEL_82;
  }
  +[NSData dataWithBytesNoCopy:length:freeWhenDone:](NSData, "dataWithBytesNoCopy:length:freeWhenDone:", (char *)[v6 bytes] + v16, v17, 0);
  BOOL v15 = (NSData *)objc_claimAutoreleasedReturnValue();
LABEL_13:
  unsigned __int16 v18 = self->_serializedPayload;
  self->_serializedPayload = v15;

  BOOL v19 = 1;
  if (v10 > 201)
  {
    if (v10 == 202)
    {
      if (v11 == 1 && !v12)
      {
        BOOL v19 = 1;
        self->_code = 1;
        goto LABEL_59;
      }
      if (v11 == 1 && v12 == 2)
      {
        int64_t v24 = 3;
      }
      else
      {
        BOOL v19 = 1;
        if (v11 != 1 || v12 != 3) {
          goto LABEL_59;
        }
        int64_t v24 = 9;
      }
    }
    else
    {
      if (v10 != 218) {
        goto LABEL_59;
      }
      if (v11 == 1 && v12 == 1)
      {
        self->_code = 2;
        if ([(MIBUNFCCommand *)self _deserializeStartUpdate]) {
          goto LABEL_58;
        }
        if (qword_10006C958 != -1) {
          dispatch_once(&qword_10006C958, &stru_10005BC90);
        }
        if (os_log_type_enabled((os_log_t)qword_10006C950, OS_LOG_TYPE_ERROR)) {
          sub_100040F4C();
        }
        goto LABEL_82;
      }
      if (v11 == 1 && v12 == 2)
      {
        self->_code = 6;
        if ([(MIBUNFCCommand *)self _deserializeRetryAfter]) {
          goto LABEL_58;
        }
        if (qword_10006C958 != -1) {
          dispatch_once(&qword_10006C958, &stru_10005BCB0);
        }
        if (os_log_type_enabled((os_log_t)qword_10006C950, OS_LOG_TYPE_ERROR)) {
          sub_100040F80();
        }
        goto LABEL_82;
      }
      if (v11 == 1 && v12 == 3)
      {
        self->_code = 7;
        if ([(MIBUNFCCommand *)self _deserializeHeartbeat]) {
          goto LABEL_58;
        }
        if (qword_10006C958 != -1) {
          dispatch_once(&qword_10006C958, &stru_10005BCD0);
        }
        if (os_log_type_enabled((os_log_t)qword_10006C950, OS_LOG_TYPE_ERROR)) {
          sub_100040FB4();
        }
        goto LABEL_82;
      }
      if (v11 != 1 || v12 != 4)
      {
        if (v11 == 1 && v12 == 5)
        {
          self->_code = 10;
          if ([(MIBUNFCCommand *)self _deserializeConfigureNFC]) {
            goto LABEL_58;
          }
          if (qword_10006C958 != -1) {
            dispatch_once(&qword_10006C958, &stru_10005BCF0);
          }
          if (os_log_type_enabled((os_log_t)qword_10006C950, OS_LOG_TYPE_ERROR)) {
            sub_100040FE8();
          }
        }
        else
        {
          BOOL v19 = 1;
          if (v11 != 1 || v12 != 6) {
            goto LABEL_59;
          }
          self->_code = 11;
          if ([(MIBUNFCCommand *)self _deserializeStartDiag]) {
            goto LABEL_58;
          }
          if (qword_10006C958 != -1) {
            dispatch_once(&qword_10006C958, &stru_10005BD10);
          }
          if (os_log_type_enabled((os_log_t)qword_10006C950, OS_LOG_TYPE_ERROR)) {
            sub_10004101C();
          }
        }
LABEL_82:
        BOOL v19 = 0;
        goto LABEL_59;
      }
      int64_t v24 = 8;
    }
    self->_code = v24;
    goto LABEL_58;
  }
  if (v10 == 164)
  {
    BOOL v19 = 1;
    if (v11 == 4 && !v12)
    {
      self->_code = 4;
      uint64_t v20 = [(MIBUNFCCommand *)self mutablePayload];
      v21 = v20;
      v22 = self->_serializedPayload;
      CFStringRef v23 = @"ApplicationID";
      goto LABEL_30;
    }
  }
  else if (v10 == 194)
  {
    if (!(v11 | v12))
    {
      self->_code = 5;
      uint64_t v20 = [(MIBUNFCCommand *)self mutablePayload];
      v21 = v20;
      v22 = self->_serializedPayload;
      CFStringRef v23 = @"EvelopedAPDU";
LABEL_30:
      [v20 setObject:v22 forKey:v23];
    }
LABEL_58:
    BOOL v19 = 1;
  }
LABEL_59:

  return v19;
}

- (id)_serializeStartUpdate
{
  if (qword_10006C958 != -1) {
    dispatch_once(&qword_10006C958, &stru_10005BD30);
  }
  v3 = qword_10006C950;
  if (os_log_type_enabled((os_log_t)qword_10006C950, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v7 = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Serializing startUpdate command", v7, 2u);
  }
  id v4 = [(MIBUNFCCommand *)self payload];
  id v5 = [(MIBUNFCCommand *)self _serializeTatsuPayload:v4];

  return v5;
}

- (id)_serializeRetryAfter
{
  v3 = objc_opt_new();
  id v4 = [(MIBUNFCCommand *)self payload];
  id v5 = [v4 objectForKey:@"RetryAfter"];

  if (v5)
  {
    id v13 = v5;
    id v6 = +[NSArray arrayWithObjects:&v13 count:1];
    unsigned __int8 v7 = [v3 serialize:&off_100061318 withValue:v6];

    if (v7)
    {
      int v8 = [v3 serializedData];
      goto LABEL_4;
    }
    if (qword_10006C958 != -1) {
      dispatch_once(&qword_10006C958, &stru_10005BD70);
    }
    if (os_log_type_enabled((os_log_t)qword_10006C950, OS_LOG_TYPE_ERROR)) {
      sub_1000412B8();
    }
  }
  else
  {
    if (qword_10006C958 != -1) {
      dispatch_once(&qword_10006C958, &stru_10005BD50);
    }
    int v10 = qword_10006C950;
    if (os_log_type_enabled((os_log_t)qword_10006C950, OS_LOG_TYPE_ERROR)) {
      sub_10004123C(v10, v11, v12);
    }
  }
  int v8 = 0;
LABEL_4:

  return v8;
}

- (id)_serializeHeartbeat
{
  v3 = objc_opt_new();
  id v4 = [(MIBUNFCCommand *)self payload];
  id v5 = [v4 objectForKey:@"HeartbeatPeriod"];

  if (v5)
  {
    id v6 = [(MIBUNFCCommand *)self payload];
    unsigned __int8 v7 = [v6 objectForKey:@"HeartbeatTimeout"];

    unsigned __int16 v18 = v5;
    int v8 = +[NSArray arrayWithObjects:&v18 count:1];
    unsigned __int8 v9 = [v3 serialize:&off_100061330 withValue:v8];

    if (v9)
    {
      uint64_t v17 = v7;
      int v10 = +[NSArray arrayWithObjects:&v17 count:1];
      unsigned __int8 v11 = [v3 serialize:&off_100061348 withValue:v10];

      if (v11)
      {
        uint64_t v12 = [v3 serializedData];

        goto LABEL_5;
      }
      if (qword_10006C958 != -1) {
        dispatch_once(&qword_10006C958, &stru_10005BDD0);
      }
      if (os_log_type_enabled((os_log_t)qword_10006C950, OS_LOG_TYPE_ERROR)) {
        sub_1000413A8();
      }
    }
    else
    {
      if (qword_10006C958 != -1) {
        dispatch_once(&qword_10006C958, &stru_10005BDB0);
      }
      if (os_log_type_enabled((os_log_t)qword_10006C950, OS_LOG_TYPE_ERROR)) {
        sub_10004141C();
      }
    }
  }
  else
  {
    if (qword_10006C958 != -1) {
      dispatch_once(&qword_10006C958, &stru_10005BD90);
    }
    unsigned int v14 = qword_10006C950;
    if (os_log_type_enabled((os_log_t)qword_10006C950, OS_LOG_TYPE_ERROR)) {
      sub_10004132C(v14, v15, v16);
    }
  }
  uint64_t v12 = 0;
LABEL_5:

  return v12;
}

- (id)_serializeConfigureNFC
{
  v3 = objc_opt_new();
  id v4 = [(MIBUNFCCommand *)self payload];
  id v5 = [v4 objectForKey:@"NFCInactivityTimeout"];

  if (v5)
  {
    id v13 = v5;
    id v6 = +[NSArray arrayWithObjects:&v13 count:1];
    unsigned __int8 v7 = [v3 serialize:&off_100061360 withValue:v6];

    if (v7)
    {
      int v8 = [v3 serializedData];
      goto LABEL_4;
    }
    if (qword_10006C958 != -1) {
      dispatch_once(&qword_10006C958, &stru_10005BE10);
    }
    if (os_log_type_enabled((os_log_t)qword_10006C950, OS_LOG_TYPE_ERROR)) {
      sub_10004150C();
    }
  }
  else
  {
    if (qword_10006C958 != -1) {
      dispatch_once(&qword_10006C958, &stru_10005BDF0);
    }
    int v10 = qword_10006C950;
    if (os_log_type_enabled((os_log_t)qword_10006C950, OS_LOG_TYPE_ERROR)) {
      sub_100041490(v10, v11, v12);
    }
  }
  int v8 = 0;
LABEL_4:

  return v8;
}

- (id)_serializeStartDiag
{
  if (qword_10006C958 != -1) {
    dispatch_once(&qword_10006C958, &stru_10005BE30);
  }
  v3 = qword_10006C950;
  if (os_log_type_enabled((os_log_t)qword_10006C950, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)unsigned __int8 v7 = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Serializing startDiag command", v7, 2u);
  }
  id v4 = [(MIBUNFCCommand *)self payload];
  id v5 = [(MIBUNFCCommand *)self _serializeTatsuPayload:v4];

  return v5;
}

- (id)_serializeTatsuPayload:(id)a3
{
  id v3 = a3;
  id v4 = objc_opt_new();
  id v5 = [v3 objectForKey:@"TatsuTicket"];
  id v6 = [v3 objectForKey:@"TimeStamp"];

  if (v6)
  {
    if (v5)
    {
      uint64_t v20 = v5;
      unsigned __int8 v7 = +[NSArray arrayWithObjects:&v20 count:1];
      unsigned __int8 v8 = [v4 serialize:&off_100061378 withValue:v7];

      if (v8)
      {
        BOOL v19 = v6;
        unsigned __int8 v9 = +[NSArray arrayWithObjects:&v19 count:1];
        unsigned __int8 v10 = [v4 serialize:&off_100061390 withValue:v9];

        if (v10)
        {
          uint64_t v11 = [v4 serializedData];
          goto LABEL_6;
        }
        if (qword_10006C958 != -1) {
          dispatch_once(&qword_10006C958, &stru_10005BEB0);
        }
        if (os_log_type_enabled((os_log_t)qword_10006C950, OS_LOG_TYPE_ERROR)) {
          sub_100041678();
        }
      }
      else
      {
        if (qword_10006C958 != -1) {
          dispatch_once(&qword_10006C958, &stru_10005BE90);
        }
        if (os_log_type_enabled((os_log_t)qword_10006C950, OS_LOG_TYPE_ERROR)) {
          sub_1000416EC();
        }
      }
    }
    else
    {
      if (qword_10006C958 != -1) {
        dispatch_once(&qword_10006C958, &stru_10005BE70);
      }
      uint64_t v16 = qword_10006C950;
      if (os_log_type_enabled((os_log_t)qword_10006C950, OS_LOG_TYPE_ERROR)) {
        sub_1000415FC(v16, v17, v18);
      }
    }
  }
  else
  {
    if (qword_10006C958 != -1) {
      dispatch_once(&qword_10006C958, &stru_10005BE50);
    }
    id v13 = qword_10006C950;
    if (os_log_type_enabled((os_log_t)qword_10006C950, OS_LOG_TYPE_ERROR)) {
      sub_100041580(v13, v14, v15);
    }
  }
  uint64_t v11 = 0;
LABEL_6:

  return v11;
}

- (BOOL)_deserializeStartUpdate
{
  if (qword_10006C958 != -1) {
    dispatch_once(&qword_10006C958, &stru_10005BED0);
  }
  id v3 = qword_10006C950;
  if (os_log_type_enabled((os_log_t)qword_10006C950, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v5 = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Deserialize startUpdate command", v5, 2u);
  }
  return [(MIBUNFCCommand *)self _deserializeTatsuPayload];
}

- (BOOL)_deserializeRetryAfter
{
  id v3 = [[MIBUDeserializer alloc] initWithData:self->_serializedPayload];
  id v4 = [(MIBUDeserializer *)v3 deserialize];

  if (!v4)
  {
    if (qword_10006C958 != -1) {
      dispatch_once(&qword_10006C958, &stru_10005BEF0);
    }
    if (os_log_type_enabled((os_log_t)qword_10006C950, OS_LOG_TYPE_ERROR)) {
      sub_100040F80();
    }
    goto LABEL_20;
  }
  id v5 = [v4 objectForKey:&off_1000604E0];
  if (!v5)
  {
    if (qword_10006C958 != -1) {
      dispatch_once(&qword_10006C958, &stru_10005BF10);
    }
    if (os_log_type_enabled((os_log_t)qword_10006C950, OS_LOG_TYPE_ERROR)) {
      sub_100041760();
    }
    goto LABEL_20;
  }
  id v6 = v5;
  [v5 doubleValue];
  if (v7 <= 0.0 || ([v6 doubleValue], v8 >= 300.0))
  {
    if (qword_10006C958 != -1) {
      dispatch_once(&qword_10006C958, &stru_10005BF30);
    }
    uint64_t v12 = (void *)qword_10006C950;
    if (os_log_type_enabled((os_log_t)qword_10006C950, OS_LOG_TYPE_ERROR)) {
      sub_100041794(v12);
    }

LABEL_20:
    BOOL v10 = 0;
    goto LABEL_6;
  }
  unsigned __int8 v9 = [(MIBUNFCCommand *)self mutablePayload];
  [v9 setObject:v6 forKey:@"RetryAfter"];

  BOOL v10 = 1;
LABEL_6:

  return v10;
}

- (BOOL)_deserializeHeartbeat
{
  id v3 = [[MIBUDeserializer alloc] initWithData:self->_serializedPayload];
  id v4 = [(MIBUDeserializer *)v3 deserialize];

  if (!v4)
  {
    if (qword_10006C958 != -1) {
      dispatch_once(&qword_10006C958, &stru_10005BF50);
    }
    if (os_log_type_enabled((os_log_t)qword_10006C950, OS_LOG_TYPE_ERROR)) {
      sub_100040FB4();
    }
    goto LABEL_32;
  }
  id v5 = [v4 objectForKey:&off_1000604F8];
  if (!v5)
  {
    if (qword_10006C958 != -1) {
      dispatch_once(&qword_10006C958, &stru_10005BF70);
    }
    if (os_log_type_enabled((os_log_t)qword_10006C950, OS_LOG_TYPE_ERROR)) {
      sub_100041814();
    }
    goto LABEL_32;
  }
  id v6 = v5;
  [v5 doubleValue];
  if (v7 < 0.0 || ([v6 doubleValue], v8 >= 300.0))
  {
    if (qword_10006C958 != -1) {
      dispatch_once(&qword_10006C958, &stru_10005BF90);
    }
    uint64_t v17 = (void *)qword_10006C950;
    if (os_log_type_enabled((os_log_t)qword_10006C950, OS_LOG_TYPE_ERROR)) {
      sub_100041848(v17);
    }
    goto LABEL_31;
  }
  unsigned __int8 v9 = [v4 objectForKey:&off_100060510];
  if (!v9)
  {
    if (qword_10006C958 != -1) {
      dispatch_once(&qword_10006C958, &stru_10005BFB0);
    }
    if (os_log_type_enabled((os_log_t)qword_10006C950, OS_LOG_TYPE_ERROR)) {
      sub_1000418C8();
    }
    goto LABEL_31;
  }
  BOOL v10 = v9;
  [v9 doubleValue];
  if (v11 < 0.0 || ([v6 doubleValue], v12 >= 300.0))
  {
    if (qword_10006C958 != -1) {
      dispatch_once(&qword_10006C958, &stru_10005BFD0);
    }
    uint64_t v18 = (void *)qword_10006C950;
    if (os_log_type_enabled((os_log_t)qword_10006C950, OS_LOG_TYPE_ERROR)) {
      sub_1000418FC(v18);
    }

LABEL_31:
LABEL_32:
    BOOL v15 = 0;
    goto LABEL_9;
  }
  id v13 = [(MIBUNFCCommand *)self mutablePayload];
  [v13 setObject:v6 forKey:@"HeartbeatPeriod"];

  uint64_t v14 = [(MIBUNFCCommand *)self mutablePayload];
  [v14 setObject:v10 forKey:@"HeartbeatTimeout"];

  BOOL v15 = 1;
LABEL_9:

  return v15;
}

- (BOOL)_deserializeConfigureNFC
{
  id v3 = [[MIBUDeserializer alloc] initWithData:self->_serializedPayload];
  id v4 = [(MIBUDeserializer *)v3 deserialize];

  if (!v4)
  {
    if (qword_10006C958 != -1) {
      dispatch_once(&qword_10006C958, &stru_10005BFF0);
    }
    if (os_log_type_enabled((os_log_t)qword_10006C950, OS_LOG_TYPE_ERROR)) {
      sub_10004197C();
    }
    goto LABEL_19;
  }
  id v5 = [v4 objectForKey:&off_100060528];
  if (!v5)
  {
    if (qword_10006C958 != -1) {
      dispatch_once(&qword_10006C958, &stru_10005C010);
    }
    if (os_log_type_enabled((os_log_t)qword_10006C950, OS_LOG_TYPE_ERROR)) {
      sub_1000419B0();
    }
    goto LABEL_19;
  }
  id v6 = v5;
  [v5 doubleValue];
  if (v7 < 0.0)
  {
    if (qword_10006C958 != -1) {
      dispatch_once(&qword_10006C958, &stru_10005C030);
    }
    double v11 = (void *)qword_10006C950;
    if (os_log_type_enabled((os_log_t)qword_10006C950, OS_LOG_TYPE_ERROR)) {
      sub_1000419E4(v11);
    }

LABEL_19:
    BOOL v9 = 0;
    goto LABEL_5;
  }
  double v8 = [(MIBUNFCCommand *)self mutablePayload];
  [v8 setObject:v6 forKey:@"NFCInactivityTimeout"];

  BOOL v9 = 1;
LABEL_5:

  return v9;
}

- (BOOL)_deserializeStartDiag
{
  if (qword_10006C958 != -1) {
    dispatch_once(&qword_10006C958, &stru_10005C050);
  }
  id v3 = qword_10006C950;
  if (os_log_type_enabled((os_log_t)qword_10006C950, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v5 = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Deserialize startDiag command", v5, 2u);
  }
  return [(MIBUNFCCommand *)self _deserializeTatsuPayload];
}

- (BOOL)_deserializeTatsuPayload
{
  id v3 = [[MIBUDeserializer alloc] initWithData:self->_serializedPayload];
  id v4 = [(MIBUDeserializer *)v3 deserialize];

  if (!v4)
  {
    if (qword_10006C958 != -1) {
      dispatch_once(&qword_10006C958, &stru_10005C070);
    }
    if (os_log_type_enabled((os_log_t)qword_10006C950, OS_LOG_TYPE_ERROR)) {
      sub_100041A64();
    }
    goto LABEL_19;
  }
  uint64_t v5 = [v4 objectForKey:&off_100060540];
  if (!v5)
  {
    if (qword_10006C958 != -1) {
      dispatch_once(&qword_10006C958, &stru_10005C090);
    }
    if (os_log_type_enabled((os_log_t)qword_10006C950, OS_LOG_TYPE_ERROR)) {
      sub_100041A98();
    }
    goto LABEL_19;
  }
  id v6 = (void *)v5;
  uint64_t v7 = [v4 objectForKey:&off_100060558];
  if (!v7)
  {
    if (qword_10006C958 != -1) {
      dispatch_once(&qword_10006C958, &stru_10005C0B0);
    }
    if (os_log_type_enabled((os_log_t)qword_10006C950, OS_LOG_TYPE_ERROR)) {
      sub_100041ACC();
    }

LABEL_19:
    BOOL v11 = 0;
    goto LABEL_5;
  }
  double v8 = (void *)v7;
  BOOL v9 = [(MIBUNFCCommand *)self mutablePayload];
  [v9 setObject:v6 forKey:@"TatsuTicket"];

  BOOL v10 = [(MIBUNFCCommand *)self mutablePayload];
  [v10 setObject:v8 forKey:@"TimeStamp"];

  BOOL v11 = 1;
LABEL_5:

  return v11;
}

- (int64_t)code
{
  return self->_code;
}

- (NSData)apdu
{
  return self->_apdu;
}

- (unsigned)cla
{
  return self->_cla;
}

- (unsigned)ins
{
  return self->_ins;
}

- (unsigned)p1
{
  return self->_p1;
}

- (unsigned)p2
{
  return self->_p2;
}

- (NSData)serializedPayload
{
  return self->_serializedPayload;
}

- (NSMutableDictionary)mutablePayload
{
  return self->_mutablePayload;
}

- (void)setMutablePayload:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_mutablePayload, 0);
  objc_storeStrong((id *)&self->_serializedPayload, 0);

  objc_storeStrong((id *)&self->_apdu, 0);
}

@end