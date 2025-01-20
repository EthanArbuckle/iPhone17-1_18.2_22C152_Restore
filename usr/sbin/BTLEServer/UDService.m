@interface UDService
+ (id)UUID;
- (BOOL)consentForUserIndex:(unsigned __int8)a3 withConsentCode:(unsigned __int16)a4;
- (BOOL)deleteCurrentUser;
- (BOOL)registerNewUser;
- (CBCharacteristic)databaseChangeIncrementCharacteristic;
- (CBCharacteristic)registeredUserCharacteristic;
- (CBCharacteristic)udsCharacteristic;
- (CBCharacteristic)userControlPointCharacteristic;
- (CBCharacteristic)userIndexCharacteristic;
- (NSTimer)controlPointTimer;
- (UDService)initWithManager:(id)a3 peripheral:(id)a4 service:(id)a5;
- (id)getDescriptionForResponseValue:(unsigned __int8)a3;
- (void)controlPointTimeout;
- (void)extractControlPointResponse;
- (void)extractDatabaseChangeIncrement;
- (void)extractRegisteredUserData;
- (void)extractUserIndex;
- (void)peripheral:(id)a3 didDiscoverCharacteristicsForService:(id)a4 error:(id)a5;
- (void)peripheral:(id)a3 didUpdateNotificationStateForCharacteristic:(id)a4 error:(id)a5;
- (void)peripheral:(id)a3 didUpdateValueForCharacteristic:(id)a4 error:(id)a5;
- (void)setControlPointTimer:(id)a3;
- (void)setDatabaseChangeIncrementCharacteristic:(id)a3;
- (void)setRegisteredUserCharacteristic:(id)a3;
- (void)setUdsCharacteristic:(id)a3;
- (void)setUserControlPointCharacteristic:(id)a3;
- (void)setUserIndexCharacteristic:(id)a3;
- (void)start;
- (void)stop;
@end

@implementation UDService

+ (id)UUID
{
  return +[CBUUID UUIDWithString:CBUUIDUserDataServiceString];
}

- (UDService)initWithManager:(id)a3 peripheral:(id)a4 service:(id)a5
{
  v8.receiver = self;
  v8.super_class = (Class)UDService;
  v5 = [(ClientService *)&v8 initWithManager:a3 peripheral:a4 service:a5];
  v6 = v5;
  if (v5)
  {
    [(ClientService *)v5 setPriority:6];
    [(ClientService *)v6 setStartTimeout:0.0];
    v6->_isConsentInitiated = 0;
  }
  return v6;
}

- (void)start
{
  v12.receiver = self;
  v12.super_class = (Class)UDService;
  [(ClientService *)&v12 start];
  self->_userIndex = -1;
  self->_consentCode = -1;
  self->_isControlPointOpInProgress = 0;
  self->_currentRequestedOpCode = -1;
  v3 = (NSMutableData *)objc_alloc_init((Class)NSMutableData);
  registeredUserData = self->_registeredUserData;
  self->_registeredUserData = v3;

  v5 = +[CBUUID UUIDWithString:CBUUIDUserControlPointCharacteristicString];
  v13[0] = v5;
  v6 = +[CBUUID UUIDWithString:CBUUIDDatabaseChangeIncrementCharacteristicString];
  v13[1] = v6;
  v7 = +[CBUUID UUIDWithString:CBUUIDUserIndexCharacteristicString];
  v13[2] = v7;
  objc_super v8 = +[CBUUID UUIDWithString:CBUUIDRegisteredUserCharacteristicString];
  v13[3] = v8;
  v9 = +[NSArray arrayWithObjects:v13 count:4];

  v10 = [(ClientService *)self peripheral];
  v11 = [(ClientService *)self service];
  [v10 discoverCharacteristics:v9 forService:v11];

  [(UDService *)self setControlPointTimer:0];
}

- (void)stop
{
  v3 = [(UDService *)self controlPointTimer];
  [v3 invalidate];

  v4.receiver = self;
  v4.super_class = (Class)UDService;
  [(ClientService *)&v4 stop];
}

- (BOOL)registerNewUser
{
  if (self->_isControlPointOpInProgress
    || ([(UDService *)self userControlPointCharacteristic],
        v5 = objc_claimAutoreleasedReturnValue(),
        v5,
        !v5))
  {
    v3 = (void *)qword_1000CD178;
    BOOL v4 = os_log_type_enabled((os_log_t)qword_1000CD178, OS_LOG_TYPE_ERROR);
    if (v4)
    {
      sub_10006BE80(v3);
      LOBYTE(v4) = 0;
    }
  }
  else
  {
    unsigned __int16 v6 = arc4random_uniform(0x270Fu);
    char v16 = 1;
    unsigned __int16 v17 = v6;
    v7 = +[NSData dataWithBytesNoCopy:&v16 length:3 freeWhenDone:0];
    objc_super v8 = [(ClientService *)self peripheral];
    v9 = [(UDService *)self userControlPointCharacteristic];
    [v8 writeValue:v7 forCharacteristic:v9 type:0];

    self->_consentCode = v6;
    self->_isControlPointOpInProgress = 1;
    self->_currentRequestedOpCode = 1;
    v10 = +[NSTimer scheduledTimerWithTimeInterval:self target:"controlPointTimeout" selector:0 userInfo:0 repeats:30.0];
    [(UDService *)self setControlPointTimer:v10];

    v11 = (void *)qword_1000CD178;
    if (os_log_type_enabled((os_log_t)qword_1000CD178, OS_LOG_TYPE_DEFAULT))
    {
      objc_super v12 = v11;
      v13 = [(ClientService *)self peripheral];
      v14 = [v13 name];
      *(_DWORD *)buf = 141558275;
      uint64_t v19 = 1752392040;
      __int16 v20 = 2113;
      v21 = v14;
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "UDS register new user request sent for peripheral \"%{private, mask.hash}@\"", buf, 0x16u);
    }
    LOBYTE(v4) = 1;
  }
  return v4;
}

- (BOOL)consentForUserIndex:(unsigned __int8)a3 withConsentCode:(unsigned __int16)a4
{
  if (self->_isControlPointOpInProgress
    || ([(UDService *)self userControlPointCharacteristic],
        v9 = objc_claimAutoreleasedReturnValue(),
        v9,
        !v9))
  {
    v5 = (void *)qword_1000CD178;
    BOOL v6 = os_log_type_enabled((os_log_t)qword_1000CD178, OS_LOG_TYPE_ERROR);
    if (v6)
    {
      sub_10006BF28(v5);
      LOBYTE(v6) = 0;
    }
  }
  else
  {
    self->_userIndex = a3;
    self->_consentCode = a4;
    int v19 = 2;
    BYTE1(v19) = self->_userIndex;
    HIWORD(v19) = a4;
    v10 = +[NSData dataWithBytesNoCopy:&v19 length:4 freeWhenDone:0];
    v11 = [(ClientService *)self peripheral];
    objc_super v12 = [(UDService *)self userControlPointCharacteristic];
    [v11 writeValue:v10 forCharacteristic:v12 type:0];

    self->_isControlPointOpInProgress = 1;
    self->_currentRequestedOpCode = 2;
    v13 = +[NSTimer scheduledTimerWithTimeInterval:self target:"controlPointTimeout" selector:0 userInfo:0 repeats:30.0];
    [(UDService *)self setControlPointTimer:v13];

    v14 = (void *)qword_1000CD178;
    if (os_log_type_enabled((os_log_t)qword_1000CD178, OS_LOG_TYPE_DEFAULT))
    {
      v15 = v14;
      char v16 = [(ClientService *)self peripheral];
      unsigned __int16 v17 = [v16 name];
      *(_DWORD *)buf = 141558275;
      uint64_t v21 = 1752392040;
      __int16 v22 = 2113;
      v23 = v17;
      _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "UDS consent request sent for peripheral \"%{private, mask.hash}@\"", buf, 0x16u);
    }
    LOBYTE(v6) = 1;
  }
  return v6;
}

- (BOOL)deleteCurrentUser
{
  if (self->_isControlPointOpInProgress
    || ([(UDService *)self userControlPointCharacteristic],
        v5 = objc_claimAutoreleasedReturnValue(),
        v5,
        !v5))
  {
    v3 = (void *)qword_1000CD178;
    BOOL v4 = os_log_type_enabled((os_log_t)qword_1000CD178, OS_LOG_TYPE_ERROR);
    if (v4)
    {
      sub_10006BFD0(v3);
      LOBYTE(v4) = 0;
    }
  }
  else
  {
    char v15 = 3;
    BOOL v6 = +[NSData dataWithBytesNoCopy:&v15 length:1 freeWhenDone:0];
    v7 = [(ClientService *)self peripheral];
    objc_super v8 = [(UDService *)self userControlPointCharacteristic];
    [v7 writeValue:v6 forCharacteristic:v8 type:0];

    self->_isControlPointOpInProgress = 1;
    self->_currentRequestedOpCode = 3;
    v9 = +[NSTimer scheduledTimerWithTimeInterval:self target:"controlPointTimeout" selector:0 userInfo:0 repeats:30.0];
    [(UDService *)self setControlPointTimer:v9];

    v10 = (void *)qword_1000CD178;
    if (os_log_type_enabled((os_log_t)qword_1000CD178, OS_LOG_TYPE_DEFAULT))
    {
      v11 = v10;
      objc_super v12 = [(ClientService *)self peripheral];
      v13 = [v12 name];
      *(_DWORD *)buf = 141558275;
      uint64_t v17 = 1752392040;
      __int16 v18 = 2113;
      int v19 = v13;
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "UDS delete user data request sent for peripheral \"%{private, mask.hash}@\"", buf, 0x16u);
    }
    LOBYTE(v4) = 1;
  }
  return v4;
}

- (void)controlPointTimeout
{
  if (self->_isControlPointOpInProgress)
  {
    v3 = (void *)qword_1000CD178;
    if (os_log_type_enabled((os_log_t)qword_1000CD178, OS_LOG_TYPE_ERROR)) {
      sub_10006C078(v3);
    }
    if (self->_currentRequestedOpCode - 1 <= 1)
    {
      BOOL v4 = +[NSNotificationCenter defaultCenter];
      v5 = [(ClientService *)self peripheral];
      [v4 postNotificationName:@"UserDataServiceConsentDidFailNotification" object:v5 userInfo:0];
    }
  }
}

- (void)peripheral:(id)a3 didDiscoverCharacteristicsForService:(id)a4 error:(id)a5
{
  id v33 = a3;
  id v8 = a4;
  id v9 = a5;
  if (v9)
  {
    if (os_log_type_enabled((os_log_t)qword_1000CD178, OS_LOG_TYPE_ERROR)) {
      sub_10006C13C();
    }
  }
  else
  {
    id v32 = v8;
    long long v40 = 0u;
    long long v41 = 0u;
    long long v38 = 0u;
    long long v39 = 0u;
    v10 = [v8 characteristics];
    id v11 = [v10 countByEnumeratingWithState:&v38 objects:v42 count:16];
    if (v11)
    {
      id v12 = v11;
      uint64_t v13 = *(void *)v39;
      uint64_t v37 = CBUUIDDatabaseChangeIncrementCharacteristicString;
      uint64_t v35 = CBUUIDUserControlPointCharacteristicString;
      uint64_t v36 = CBUUIDUserIndexCharacteristicString;
      uint64_t v34 = CBUUIDRegisteredUserCharacteristicString;
      do
      {
        for (i = 0; i != v12; i = (char *)i + 1)
        {
          if (*(void *)v39 != v13) {
            objc_enumerationMutation(v10);
          }
          char v15 = *(void **)(*((void *)&v38 + 1) + 8 * i);
          char v16 = [(UDService *)self databaseChangeIncrementCharacteristic];
          if (v16)
          {
          }
          else
          {
            uint64_t v17 = [v15 UUID];
            __int16 v18 = +[CBUUID UUIDWithString:v37];
            unsigned int v19 = [v17 isEqual:v18];

            if (v19) {
              [(UDService *)self setDatabaseChangeIncrementCharacteristic:v15];
            }
          }
          __int16 v20 = [(UDService *)self userIndexCharacteristic];
          if (v20)
          {
          }
          else
          {
            uint64_t v21 = [v15 UUID];
            __int16 v22 = +[CBUUID UUIDWithString:v36];
            unsigned int v23 = [v21 isEqual:v22];

            if (v23) {
              [(UDService *)self setUserIndexCharacteristic:v15];
            }
          }
          v24 = [(UDService *)self userControlPointCharacteristic];
          if (v24)
          {
          }
          else
          {
            v25 = [v15 UUID];
            v26 = +[CBUUID UUIDWithString:v35];
            unsigned int v27 = [v25 isEqual:v26];

            if (v27)
            {
              [(UDService *)self setUserControlPointCharacteristic:v15];
              if (([v15 properties] & 0x20) != 0) {
                [v33 setNotifyValue:1 forCharacteristic:v15];
              }
            }
          }
          v28 = [(UDService *)self registeredUserCharacteristic];
          if (v28)
          {
          }
          else
          {
            v29 = [v15 UUID];
            v30 = +[CBUUID UUIDWithString:v34];
            unsigned int v31 = [v29 isEqual:v30];

            if (v31)
            {
              [(UDService *)self setRegisteredUserCharacteristic:v15];
              if (([v15 properties] & 0x20) != 0) {
                [v33 setNotifyValue:1 forCharacteristic:v15];
              }
            }
          }
        }
        id v12 = [v10 countByEnumeratingWithState:&v38 objects:v42 count:16];
      }
      while (v12);
    }

    id v9 = 0;
    id v8 = v32;
  }
}

- (void)peripheral:(id)a3 didUpdateValueForCharacteristic:(id)a4 error:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if (v10)
  {
    if (os_log_type_enabled((os_log_t)qword_1000CD178, OS_LOG_TYPE_ERROR)) {
      sub_10006C1E4();
    }
  }
  else
  {
    id v11 = [(UDService *)self databaseChangeIncrementCharacteristic];

    if (v11 == v9)
    {
      [(UDService *)self extractDatabaseChangeIncrement];
    }
    else
    {
      id v12 = [(UDService *)self userIndexCharacteristic];

      if (v12 == v9)
      {
        [(UDService *)self extractUserIndex];
      }
      else
      {
        id v13 = [(UDService *)self userControlPointCharacteristic];

        if (v13 == v9)
        {
          [(UDService *)self extractControlPointResponse];
        }
        else
        {
          id v14 = [(UDService *)self registeredUserCharacteristic];

          if (v14 == v9) {
            [(UDService *)self extractRegisteredUserData];
          }
        }
      }
    }
  }
}

- (void)peripheral:(id)a3 didUpdateNotificationStateForCharacteristic:(id)a4 error:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if (v10)
  {
    if (os_log_type_enabled((os_log_t)qword_1000CD178, OS_LOG_TYPE_ERROR)) {
      sub_10006C28C();
    }
  }
  else
  {
    id v11 = [(UDService *)self userControlPointCharacteristic];
    if (v11 == v9)
    {
      BOOL isConsentInitiated = self->_isConsentInitiated;

      if (!isConsentInitiated)
      {
        id v13 = (void *)qword_1000CD178;
        if (os_log_type_enabled((os_log_t)qword_1000CD178, OS_LOG_TYPE_DEFAULT))
        {
          id v14 = v13;
          char v15 = [(ClientService *)self peripheral];
          char v16 = [v15 name];
          int userIndex = self->_userIndex;
          *(_DWORD *)buf = 138412546;
          uint64_t v31 = (uint64_t)v16;
          __int16 v32 = 1024;
          LODWORD(v33) = userIndex;
          _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "UDS didUpdateNotificationStateForCharacteristic for peripheral \"%@\": %u%%", buf, 0x12u);
        }
        self->_BOOL isConsentInitiated = 1;
        __int16 v18 = [(ClientService *)self peripheral];
        unsigned int v19 = [v18 customProperty:@"UserDataServiceUserIndex"];

        __int16 v20 = [(ClientService *)self peripheral];
        uint64_t v21 = [v20 customProperty:@"UserDataServiceConsentCode"];

        if (v19 && v21)
        {
          id v22 = objc_alloc_init((Class)NSNumberFormatter);
          [v22 setNumberStyle:1];
          unsigned int v23 = [v22 numberFromString:v19];
          v24 = [v22 numberFromString:v21];
          v25 = v24;
          if (v23 && v24)
          {
            -[UDService consentForUserIndex:withConsentCode:](self, "consentForUserIndex:withConsentCode:", [v23 unsignedIntValue], (unsigned __int16)[v24 unsignedIntValue]);
          }
          else
          {
            v26 = (void *)qword_1000CD178;
            if (os_log_type_enabled((os_log_t)qword_1000CD178, OS_LOG_TYPE_ERROR))
            {
              unsigned int v27 = v26;
              v29 = [(ClientService *)self peripheral];
              v28 = [v29 name];
              *(_DWORD *)buf = 141558787;
              uint64_t v31 = 1752392040;
              __int16 v32 = 2113;
              id v33 = v28;
              __int16 v34 = 2112;
              uint64_t v35 = v19;
              __int16 v36 = 2112;
              uint64_t v37 = v21;
              _os_log_error_impl((void *)&_mh_execute_header, v27, OS_LOG_TYPE_ERROR, "UDS consent procedure failed for peripheral \"%{private, mask.hash}@\" due to failed convert %@ or %@ to number", buf, 0x2Au);
            }
          }
        }
        else
        {
          [(UDService *)self registerNewUser];
        }
      }
    }
    else
    {
    }
    [(ClientService *)self notifyDidStart];
  }
}

- (void)extractDatabaseChangeIncrement
{
  v3 = [(UDService *)self databaseChangeIncrementCharacteristic];
  BOOL v4 = [v3 value];
  v5 = +[DataInputStream inputStreamWithData:v4];

  BOOL v6 = (void *)qword_1000CD178;
  if (os_log_type_enabled((os_log_t)qword_1000CD178, OS_LOG_TYPE_DEFAULT))
  {
    v7 = v6;
    id v8 = [(ClientService *)self peripheral];
    id v9 = [v8 name];
    int userIndex = self->_userIndex;
    int v11 = 138412546;
    id v12 = v9;
    __int16 v13 = 1024;
    int v14 = userIndex;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "UDS database change incremented for peripheral \"%@\": %u%%", (uint8_t *)&v11, 0x12u);
  }
}

- (void)extractUserIndex
{
  v3 = [(UDService *)self userIndexCharacteristic];
  BOOL v4 = [v3 value];
  v5 = +[DataInputStream inputStreamWithData:v4];

  p_int userIndex = &self->_userIndex;
  if ([v5 readUint8:&self->_userIndex])
  {
    v7 = (void *)qword_1000CD178;
    if (os_log_type_enabled((os_log_t)qword_1000CD178, OS_LOG_TYPE_DEFAULT))
    {
      id v8 = v7;
      id v9 = [(ClientService *)self peripheral];
      id v10 = [v9 name];
      int v11 = *p_userIndex;
      int v12 = 138412546;
      __int16 v13 = v10;
      __int16 v14 = 1024;
      int v15 = v11;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "User index for peripheral \"%@\": %u%%", (uint8_t *)&v12, 0x12u);
    }
  }
}

- (void)extractRegisteredUserData
{
  v3 = [(UDService *)self registeredUserCharacteristic];
  BOOL v4 = [v3 value];
  v5 = +[DataInputStream inputStreamWithData:v4];

  unsigned __int8 v31 = 0;
  BOOL v6 = [(UDService *)self registeredUserCharacteristic];
  v7 = [v6 value];
  unsigned int v8 = [v7 length];

  if ([v5 readUint8:&v31])
  {
    unsigned int v9 = v31;
    id v10 = (void *)qword_1000CD178;
    if (os_log_type_enabled((os_log_t)qword_1000CD178, OS_LOG_TYPE_DEFAULT))
    {
      int v11 = v10;
      int v12 = [(ClientService *)self peripheral];
      uint64_t v13 = [v12 name];
      __int16 v14 = (void *)v13;
      int v15 = "Y";
      *(_DWORD *)buf = 141559299;
      uint64_t v33 = 1752392040;
      __int16 v34 = 2113;
      if (v9) {
        char v16 = "Y";
      }
      else {
        char v16 = "N";
      }
      uint64_t v35 = v13;
      if ((v9 & 2) == 0) {
        int v15 = "N";
      }
      __int16 v36 = 1024;
      int v37 = v31;
      __int16 v38 = 2080;
      long long v39 = v16;
      __int16 v40 = 2080;
      long long v41 = v15;
      __int16 v42 = 1024;
      unsigned int v43 = v9 >> 2;
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "Registered user data for peripheral \"%{private, mask.hash}@\": header %u, firstSeg %s, lastSeg %s, segNum %u", buf, 0x36u);
    }
    if (v9)
    {
      unsigned __int8 v30 = 0;
      unsigned __int8 v29 = -1;
      if ([v5 readUint8:&v30])
      {
        __int16 v18 = (void *)qword_1000CD178;
        if (os_log_type_enabled((os_log_t)qword_1000CD178, OS_LOG_TYPE_DEFAULT))
        {
          unsigned int v19 = v18;
          __int16 v20 = [(ClientService *)self peripheral];
          uint64_t v21 = [v20 name];
          *(_DWORD *)buf = 141558531;
          uint64_t v33 = 1752392040;
          __int16 v34 = 2113;
          uint64_t v35 = (uint64_t)v21;
          __int16 v36 = 1024;
          int v37 = v30;
          _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_DEFAULT, "Stored Health Observation for peripheral \"%{private, mask.hash}@\": flags %u", buf, 0x1Cu);
        }
      }
      if ([v5 readUint8:&v29])
      {
        self->_int userIndex = v29;
        id v22 = (void *)qword_1000CD178;
        if (os_log_type_enabled((os_log_t)qword_1000CD178, OS_LOG_TYPE_DEFAULT))
        {
          unsigned int v23 = v22;
          v24 = [(ClientService *)self peripheral];
          v25 = [v24 name];
          int userIndex = self->_userIndex;
          *(_DWORD *)buf = 138412546;
          uint64_t v33 = (uint64_t)v25;
          __int16 v34 = 1024;
          LODWORD(v35) = userIndex;
          _os_log_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_DEFAULT, "User index for peripheral \"%@\": %u%%", buf, 0x12u);
        }
      }
      [(NSMutableData *)self->_registeredUserData setLength:0];
      uint64_t v17 = v8 - 3;
    }
    else
    {
      uint64_t v17 = v8 - 1;
    }
    [v5 readNumBytes:v17 toData:self->_registeredUserData];
    if ((v9 & 2) != 0)
    {
      unsigned int v27 = (NSString *)[objc_alloc((Class)NSString) initWithData:self->_registeredUserData encoding:4];
      registeredUserName = self->_registeredUserName;
      self->_registeredUserName = v27;

      [(NSMutableData *)self->_registeredUserData setLength:0];
    }
  }
}

- (id)getDescriptionForResponseValue:(unsigned __int8)a3
{
  if ((a3 - 1) < 5) {
    return *(&off_1000B1120 + (char)(a3 - 1));
  }
  BOOL v4 = (void *)qword_1000CD178;
  if (os_log_type_enabled((os_log_t)qword_1000CD178, OS_LOG_TYPE_ERROR)) {
    sub_10006C334(v4);
  }
  return @"Invalid Response";
}

- (void)extractControlPointResponse
{
  if (!self->_isControlPointOpInProgress)
  {
    v3 = (void *)qword_1000CD178;
    if (os_log_type_enabled((os_log_t)qword_1000CD178, OS_LOG_TYPE_ERROR)) {
      sub_10006C73C(v3);
    }
  }
  BOOL v4 = [(UDService *)self controlPointTimer];
  [v4 invalidate];

  [(UDService *)self setControlPointTimer:0];
  __int16 v41 = 0;
  unsigned __int8 v40 = 0;
  v5 = [(UDService *)self userControlPointCharacteristic];
  BOOL v6 = [v5 value];
  v7 = +[DataInputStream inputStreamWithData:v6 byteOrder:1];

  if (([v7 readUint8:(char *)&v41 + 1] & 1) == 0)
  {
    unsigned int v8 = (void *)qword_1000CD178;
    if (os_log_type_enabled((os_log_t)qword_1000CD178, OS_LOG_TYPE_ERROR)) {
      sub_10006C694(v8);
    }
  }
  if (HIBYTE(v41) == 32)
  {
    if (([v7 readUint8:&v41] & 1) == 0)
    {
      unsigned int v9 = (void *)qword_1000CD178;
      if (os_log_type_enabled((os_log_t)qword_1000CD178, OS_LOG_TYPE_ERROR)) {
        sub_10006C540(v9);
      }
    }
    if (v41 == self->_currentRequestedOpCode)
    {
      self->_isControlPointOpInProgress = 0;
      self->_int currentRequestedOpCode = -1;
      if (([v7 readUint8:&v40] & 1) == 0)
      {
        id v10 = (void *)qword_1000CD178;
        if (os_log_type_enabled((os_log_t)qword_1000CD178, OS_LOG_TYPE_ERROR)) {
          sub_10006C498(v10);
        }
      }
      if (v40 == 1)
      {
        switch((char)v41)
        {
          case 1:
            p_int userIndex = &self->_userIndex;
            if ([v7 readUint8:&self->_userIndex])
            {
              uint64_t v21 = [(ClientService *)self peripheral];
              id v22 = +[NSString stringWithFormat:@"%d", *p_userIndex];
              [v21 setCustomProperty:@"UserDataServiceUserIndex" value:v22];

              unsigned int v23 = [(ClientService *)self peripheral];
              v24 = +[NSString stringWithFormat:@"%d", self->_consentCode];
              [v23 setCustomProperty:@"UserDataServiceConsentCode" value:v24];
            }
            v25 = qword_1000CD178;
            if (os_log_type_enabled((os_log_t)qword_1000CD178, OS_LOG_TYPE_DEFAULT))
            {
              int v26 = *p_userIndex;
              *(_DWORD *)buf = 67109120;
              LODWORD(v43) = v26;
              _os_log_impl((void *)&_mh_execute_header, v25, OS_LOG_TYPE_DEFAULT, "UDS register new user completed successfully, index =%d", buf, 8u);
            }
            goto LABEL_34;
          case 2:
            unsigned int v27 = qword_1000CD178;
            if (os_log_type_enabled((os_log_t)qword_1000CD178, OS_LOG_TYPE_DEFAULT))
            {
              int userIndex = self->_userIndex;
              *(_DWORD *)buf = 67109120;
              LODWORD(v43) = userIndex;
              _os_log_impl((void *)&_mh_execute_header, v27, OS_LOG_TYPE_DEFAULT, "UDS consent completed successfully, index =%d", buf, 8u);
            }
            unsigned __int8 v29 = [(ClientService *)self peripheral];
            unsigned __int8 v30 = [(UDService *)self databaseChangeIncrementCharacteristic];
            [v29 readValueForCharacteristic:v30];

            unsigned __int8 v31 = [(ClientService *)self peripheral];
            __int16 v32 = [(UDService *)self userIndexCharacteristic];
            [v31 readValueForCharacteristic:v32];

LABEL_34:
            uint64_t v17 = +[NSNotificationCenter defaultCenter];
            __int16 v18 = [(ClientService *)self peripheral];
            CFStringRef v19 = @"UserDataServiceConsentDidSucceedNotification";
            goto LABEL_35;
          case 3:
            uint64_t v33 = qword_1000CD178;
            if (os_log_type_enabled((os_log_t)qword_1000CD178, OS_LOG_TYPE_DEFAULT))
            {
              int v34 = self->_userIndex;
              *(_DWORD *)buf = 67109120;
              LODWORD(v43) = v34;
              _os_log_impl((void *)&_mh_execute_header, v33, OS_LOG_TYPE_DEFAULT, "UDS user data deleted successfully, index =%d", buf, 8u);
            }
            goto LABEL_36;
          case 4:
          case 5:
            if (os_log_type_enabled((os_log_t)qword_1000CD178, OS_LOG_TYPE_ERROR)) {
              sub_10006C3EC();
            }
            goto LABEL_36;
          default:
            goto LABEL_36;
        }
      }
      char v16 = (void *)qword_1000CD178;
      if (os_log_type_enabled((os_log_t)qword_1000CD178, OS_LOG_TYPE_ERROR))
      {
        uint64_t v35 = v16;
        __int16 v36 = [(ClientService *)self peripheral];
        int v37 = [v36 name];
        int v38 = v41;
        long long v39 = [(UDService *)self getDescriptionForResponseValue:v40];
        *(_DWORD *)buf = 141558787;
        uint64_t v43 = 1752392040;
        __int16 v44 = 2113;
        v45 = v37;
        __int16 v46 = 1024;
        int v47 = v38;
        __int16 v48 = 2112;
        v49 = v39;
        _os_log_error_impl((void *)&_mh_execute_header, v35, OS_LOG_TYPE_ERROR, "UDS CP response for peripheral \"%{private, mask.hash}@\": requestedOpCode %u, response %@", buf, 0x26u);
      }
      if (v41 - 1 <= 1)
      {
        uint64_t v17 = +[NSNotificationCenter defaultCenter];
        __int16 v18 = [(ClientService *)self peripheral];
        CFStringRef v19 = @"UserDataServiceConsentDidFailNotification";
LABEL_35:
        [v17 postNotificationName:v19 object:v18 userInfo:0];
      }
    }
    else
    {
      int v11 = (void *)qword_1000CD178;
      if (os_log_type_enabled((os_log_t)qword_1000CD178, OS_LOG_TYPE_ERROR))
      {
        int v12 = v11;
        uint64_t v13 = [(ClientService *)self peripheral];
        __int16 v14 = [v13 name];
        int currentRequestedOpCode = self->_currentRequestedOpCode;
        *(_DWORD *)buf = 141558787;
        uint64_t v43 = 1752392040;
        __int16 v44 = 2113;
        v45 = v14;
        __int16 v46 = 1024;
        int v47 = v41;
        __int16 v48 = 1024;
        LODWORD(v49) = currentRequestedOpCode;
        _os_log_error_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_ERROR, "UDS CP response for peripheral \"%{private, mask.hash}@\": invalid requestedOpCode %u, expectedOpCode %u", buf, 0x22u);
      }
    }
  }
  else if (os_log_type_enabled((os_log_t)qword_1000CD178, OS_LOG_TYPE_ERROR))
  {
    sub_10006C5E8();
  }
LABEL_36:
}

- (CBCharacteristic)udsCharacteristic
{
  return self->_udsCharacteristic;
}

- (void)setUdsCharacteristic:(id)a3
{
}

- (CBCharacteristic)databaseChangeIncrementCharacteristic
{
  return self->_databaseChangeIncrementCharacteristic;
}

- (void)setDatabaseChangeIncrementCharacteristic:(id)a3
{
}

- (CBCharacteristic)userIndexCharacteristic
{
  return self->_userIndexCharacteristic;
}

- (void)setUserIndexCharacteristic:(id)a3
{
}

- (CBCharacteristic)userControlPointCharacteristic
{
  return self->_userControlPointCharacteristic;
}

- (void)setUserControlPointCharacteristic:(id)a3
{
}

- (CBCharacteristic)registeredUserCharacteristic
{
  return self->_registeredUserCharacteristic;
}

- (void)setRegisteredUserCharacteristic:(id)a3
{
}

- (NSTimer)controlPointTimer
{
  return self->_controlPointTimer;
}

- (void)setControlPointTimer:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_controlPointTimer, 0);
  objc_storeStrong((id *)&self->_registeredUserCharacteristic, 0);
  objc_storeStrong((id *)&self->_userControlPointCharacteristic, 0);
  objc_storeStrong((id *)&self->_userIndexCharacteristic, 0);
  objc_storeStrong((id *)&self->_databaseChangeIncrementCharacteristic, 0);
  objc_storeStrong((id *)&self->_udsCharacteristic, 0);
  objc_storeStrong((id *)&self->_registeredUserData, 0);

  objc_storeStrong((id *)&self->_registeredUserName, 0);
}

@end