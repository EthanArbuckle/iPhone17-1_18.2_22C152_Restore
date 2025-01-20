@interface MIBUStatusResponse
- (BOOL)_deserialize:(id)a3;
- (BOOL)_serializeBatteryDetailsWithSerializer:(id)a3;
- (BOOL)_serializeDict:(id)a3 fromKeyToTagMapping:(id)a4 withSerializer:(id)a5;
- (BOOL)_serializeOperationDetailsWithSerializer:(id)a3;
- (BOOL)_serializeThermalDetailsWithSerializer:(id)a3;
- (MIBUDeviceStatus)status;
- (MIBUStatusResponse)init;
- (NSString)buildVersion;
- (NSString)osVersion;
- (NSString)serialNumber;
- (id)_deserializeBatteryDetailsFromDict:(id)a3;
- (id)_deserializeFromTagDict:(id)a3 withKeyToTagMapping:(id)a4;
- (id)_deserializeOperationDetailsFromDict:(id)a3;
- (id)_deserializeThermalDetailsFromDict:(id)a3;
- (id)_reverseDict:(id)a3;
- (id)serialize;
- (void)setBuildVersion:(id)a3;
- (void)setOsVersion:(id)a3;
- (void)setSerialNumber:(id)a3;
- (void)setStatus:(id)a3;
@end

@implementation MIBUStatusResponse

- (MIBUStatusResponse)init
{
  v5.receiver = self;
  v5.super_class = (Class)MIBUStatusResponse;
  v2 = [(MIBUNFCResponse *)&v5 init];
  v3 = v2;
  if (v2)
  {
    [(MIBUStatusResponse *)v2 setSerialNumber:0];
    [(MIBUStatusResponse *)v3 setOsVersion:0];
    [(MIBUStatusResponse *)v3 setBuildVersion:0];
    [(MIBUStatusResponse *)v3 setStatus:0];
  }
  return v3;
}

- (id)serialize
{
  v3 = objc_opt_new();
  v4 = [(MIBUStatusResponse *)self status];

  if (v4 && ![(MIBUNFCResponse *)self rejected])
  {
    v24 = [(MIBUStatusResponse *)self status];
    v23 = +[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", [v24 state]);
    v25[0] = v23;
    v22 = [(MIBUStatusResponse *)self serialNumber];
    v25[1] = v22;
    objc_super v5 = [(MIBUStatusResponse *)self osVersion];
    v25[2] = v5;
    v6 = [(MIBUStatusResponse *)self buildVersion];
    v25[3] = v6;
    v7 = [(MIBUStatusResponse *)self status];
    v8 = +[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", [v7 operation]);
    v25[4] = v8;
    v9 = [(MIBUStatusResponse *)self status];
    v10 = [v9 batteryLevel];
    v25[5] = v10;
    v11 = +[NSArray arrayWithObjects:v25 count:6];
    unsigned __int8 v12 = [v3 serialize:&off_100061438 withValue:v11];

    if (v12)
    {
      v13 = [(MIBUNFCResponse *)self error];
      unsigned __int8 v14 = [v3 serializeResponseError:v13];

      if (v14)
      {
        v15 = [(MIBUStatusResponse *)self status];
        v16 = [v15 operationError];
        unsigned __int8 v17 = [v3 serializeOperationError:v16];

        if (v17)
        {
          if ([(MIBUStatusResponse *)self _serializeOperationDetailsWithSerializer:v3]&& [(MIBUStatusResponse *)self _serializeThermalDetailsWithSerializer:v3]&& [(MIBUStatusResponse *)self _serializeBatteryDetailsWithSerializer:v3])
          {
            v18 = [v3 serializedData];
            goto LABEL_10;
          }
        }
        else
        {
          if (qword_10006C958 != -1) {
            dispatch_once(&qword_10006C958, &stru_10005C970);
          }
          v21 = (void *)qword_10006C950;
          if (os_log_type_enabled((os_log_t)qword_10006C950, OS_LOG_TYPE_ERROR)) {
            sub_1000420EC(v21, self);
          }
        }
      }
      else
      {
        if (qword_10006C958 != -1) {
          dispatch_once(&qword_10006C958, &stru_10005C950);
        }
        v20 = (void *)qword_10006C950;
        if (os_log_type_enabled((os_log_t)qword_10006C950, OS_LOG_TYPE_ERROR)) {
          sub_10004219C(v20, self);
        }
      }
    }
    else
    {
      if (qword_10006C958 != -1) {
        dispatch_once(&qword_10006C958, &stru_10005C930);
      }
      if (os_log_type_enabled((os_log_t)qword_10006C950, OS_LOG_TYPE_ERROR)) {
        sub_100042234();
      }
    }
  }
  v18 = 0;
LABEL_10:

  return v18;
}

- (BOOL)_deserialize:(id)a3
{
  id v4 = a3;
  objc_super v5 = [[MIBUDeserializer alloc] initWithData:v4];

  v6 = [(MIBUDeserializer *)v5 deserialize];
  if (!v6)
  {
    if (qword_10006C958 != -1) {
      dispatch_once(&qword_10006C958, &stru_10005C990);
    }
    if (os_log_type_enabled((os_log_t)qword_10006C950, OS_LOG_TYPE_ERROR)) {
      sub_100042268();
    }
    v27 = 0;
    unsigned __int8 v12 = 0;
    v15 = 0;
    unsigned __int8 v14 = 0;
    v38 = 0;
    id v39 = 0;
    goto LABEL_24;
  }
  id v41 = 0;
  unsigned __int8 v7 = [(MIBUDeserializer *)v5 deserializeResponseError:&v41];
  id v39 = v41;
  if ((v7 & 1) == 0)
  {
    if (qword_10006C958 != -1) {
      dispatch_once(&qword_10006C958, &stru_10005C9B0);
    }
    if (os_log_type_enabled((os_log_t)qword_10006C950, OS_LOG_TYPE_ERROR)) {
      sub_100041DE8();
    }
    goto LABEL_23;
  }
  uint64_t v8 = [v6 objectForKey:&off_100060D50];
  if (!v8)
  {
    if (qword_10006C958 != -1) {
      dispatch_once(&qword_10006C958, &stru_10005C9D0);
    }
    if (os_log_type_enabled((os_log_t)qword_10006C950, OS_LOG_TYPE_ERROR)) {
      sub_10004229C();
    }
LABEL_23:
    v27 = 0;
    unsigned __int8 v12 = 0;
    v15 = 0;
    unsigned __int8 v14 = 0;
    v38 = 0;
LABEL_24:
    v11 = 0;
    v9 = 0;
LABEL_30:
    BOOL v34 = 0;
    goto LABEL_9;
  }
  v9 = (void *)v8;
  uint64_t v10 = [v6 objectForKey:&off_100060DB0];
  if (!v10)
  {
    if (qword_10006C958 != -1) {
      dispatch_once(&qword_10006C958, &stru_10005C9F0);
    }
    if (os_log_type_enabled((os_log_t)qword_10006C950, OS_LOG_TYPE_ERROR)) {
      sub_1000422D0();
    }
    v27 = 0;
    unsigned __int8 v12 = 0;
    v15 = 0;
    unsigned __int8 v14 = 0;
    v38 = 0;
    v11 = 0;
    goto LABEL_30;
  }
  v11 = (void *)v10;
  unsigned __int8 v12 = [v6 objectForKey:&off_100060D68];
  uint64_t v13 = [v6 objectForKey:&off_100060D80];
  if (v13)
  {
    unsigned __int8 v14 = (void *)v13;
    v15 = [v6 objectForKey:&off_100060D98];
    uint64_t v16 = [v6 objectForKey:&off_100060DC8];
    if (v16)
    {
      v37 = (void *)v16;
      id v40 = 0;
      unsigned __int8 v17 = [(MIBUDeserializer *)v5 deserializeOperationError:&v40];
      id v18 = v40;
      v38 = v18;
      if (v17)
      {
        id v19 = v18;
        v20 = objc_alloc_init(MIBUDeviceStatus);
        [(MIBUStatusResponse *)self setStatus:v20];

        [(MIBUStatusResponse *)self setSerialNumber:v12];
        [(MIBUStatusResponse *)self setOsVersion:v14];
        [(MIBUStatusResponse *)self setBuildVersion:v15];
        uint64_t v21 = (int)[v9 shortValue];
        [(MIBUStatusResponse *)self status];
        v22 = v36 = v12;
        [v22 setState:v21];

        uint64_t v23 = (int)[v11 shortValue];
        v24 = [(MIBUStatusResponse *)self status];
        [v24 setOperation:v23];

        v25 = [(MIBUStatusResponse *)self status];
        [v25 setOperationError:v19];

        v26 = [(MIBUStatusResponse *)self status];
        v27 = v37;
        [v26 setBatteryLevel:v37];

        v28 = [(MIBUStatusResponse *)self _deserializeThermalDetailsFromDict:v6];
        v29 = [(MIBUStatusResponse *)self status];
        [v29 setThermalDetails:v28];

        v30 = [(MIBUStatusResponse *)self _deserializeBatteryDetailsFromDict:v6];
        v31 = [(MIBUStatusResponse *)self status];
        [v31 setBatteryDetails:v30];

        v32 = [(MIBUStatusResponse *)self _deserializeOperationDetailsFromDict:v6];
        v33 = [(MIBUStatusResponse *)self status];
        [v33 setOperationDetails:v32];

        unsigned __int8 v12 = v36;
        BOOL v34 = 1;
      }
      else
      {
        if (qword_10006C958 != -1) {
          dispatch_once(&qword_10006C958, &stru_10005CA50);
        }
        if (os_log_type_enabled((os_log_t)qword_10006C950, OS_LOG_TYPE_ERROR)) {
          sub_10004236C();
        }
        BOOL v34 = 0;
        v27 = v37;
      }
    }
    else
    {
      if (qword_10006C958 != -1) {
        dispatch_once(&qword_10006C958, &stru_10005CA30);
      }
      if (os_log_type_enabled((os_log_t)qword_10006C950, OS_LOG_TYPE_ERROR)) {
        sub_100042338();
      }
      v27 = 0;
      v38 = 0;
      BOOL v34 = 0;
    }
  }
  else
  {
    if (qword_10006C958 != -1) {
      dispatch_once(&qword_10006C958, &stru_10005CA10);
    }
    if (os_log_type_enabled((os_log_t)qword_10006C950, OS_LOG_TYPE_ERROR)) {
      sub_100042304();
    }
    v27 = 0;
    v15 = 0;
    v38 = 0;
    BOOL v34 = 0;
    unsigned __int8 v14 = 0;
  }
LABEL_9:
  [(MIBUNFCResponse *)self setError:v39];

  return v34;
}

- (id)_reverseDict:(id)a3
{
  id v3 = a3;
  id v4 = objc_opt_new();
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v5 = v3;
  id v6 = [v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v14;
    do
    {
      for (i = 0; i != v7; i = (char *)i + 1)
      {
        if (*(void *)v14 != v8) {
          objc_enumerationMutation(v5);
        }
        uint64_t v10 = *(void *)(*((void *)&v13 + 1) + 8 * i);
        v11 = [v5 objectForKey:v10];
        [v4 setObject:v10 forKey:v11];
      }
      id v7 = [v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v7);
  }

  return v4;
}

- (BOOL)_serializeDict:(id)a3 fromKeyToTagMapping:(id)a4 withSerializer:(id)a5
{
  id v7 = a3;
  id v8 = a4;
  id v23 = a5;
  long long v24 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  id v9 = v7;
  id v10 = [v9 countByEnumeratingWithState:&v24 objects:v30 count:16];
  if (v10)
  {
    id v11 = v10;
    uint64_t v12 = *(void *)v25;
    while (2)
    {
      for (i = 0; i != v11; i = (char *)i + 1)
      {
        if (*(void *)v25 != v12) {
          objc_enumerationMutation(v9);
        }
        uint64_t v14 = *(void *)(*((void *)&v24 + 1) + 8 * i);
        long long v15 = [v9 objectForKey:v14];
        uint64_t v16 = [v8 objectForKey:v14];
        unsigned __int8 v17 = (void *)v16;
        if (v16)
        {
          uint64_t v29 = v16;
          id v18 = +[NSArray arrayWithObjects:&v29 count:1];
          v28 = v15;
          id v19 = +[NSArray arrayWithObjects:&v28 count:1];
          unsigned __int8 v20 = [v23 serialize:v18 withValue:v19];

          if ((v20 & 1) == 0)
          {

            BOOL v21 = 0;
            goto LABEL_11;
          }
        }
      }
      id v11 = [v9 countByEnumeratingWithState:&v24 objects:v30 count:16];
      if (v11) {
        continue;
      }
      break;
    }
  }
  BOOL v21 = 1;
LABEL_11:

  return v21;
}

- (id)_deserializeFromTagDict:(id)a3 withKeyToTagMapping:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = objc_opt_new();
  id v9 = [(MIBUStatusResponse *)self _reverseDict:v7];
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  id v10 = [v9 countByEnumeratingWithState:&v18 objects:v22 count:16];
  if (v10)
  {
    id v11 = v10;
    uint64_t v12 = *(void *)v19;
    do
    {
      for (i = 0; i != v11; i = (char *)i + 1)
      {
        if (*(void *)v19 != v12) {
          objc_enumerationMutation(v9);
        }
        uint64_t v14 = *(void *)(*((void *)&v18 + 1) + 8 * i);
        long long v15 = [v6 objectForKey:v14];
        if (v15)
        {
          uint64_t v16 = [v9 objectForKey:v14];
          [v8 setObject:v15 forKey:v16];
        }
      }
      id v11 = [v9 countByEnumeratingWithState:&v18 objects:v22 count:16];
    }
    while (v11);
  }

  return v8;
}

- (BOOL)_serializeOperationDetailsWithSerializer:(id)a3
{
  id v4 = a3;
  id v5 = [(MIBUStatusResponse *)self status];
  id v6 = [v5 operationDetails];
  v9[0] = @"Progress";
  v9[1] = @"TimeRemaining";
  v10[0] = &off_100060DE0;
  v10[1] = &off_100060DF8;
  v9[2] = @"TargetOSVersion";
  v9[3] = @"TargetBuildVersion";
  v10[2] = &off_100060E10;
  v10[3] = &off_100060E28;
  v9[4] = @"SoftwareUpdatePhase";
  v9[5] = @"TargetSUBundleSize";
  v10[4] = &off_100060E40;
  v10[5] = &off_100060E58;
  id v7 = +[NSDictionary dictionaryWithObjects:v10 forKeys:v9 count:6];
  LOBYTE(self) = [(MIBUStatusResponse *)self _serializeDict:v6 fromKeyToTagMapping:v7 withSerializer:v4];

  return (char)self;
}

- (id)_deserializeOperationDetailsFromDict:(id)a3
{
  v8[0] = @"Progress";
  v8[1] = @"TimeRemaining";
  v9[0] = &off_100060DE0;
  v9[1] = &off_100060DF8;
  v8[2] = @"TargetOSVersion";
  v8[3] = @"TargetBuildVersion";
  v9[2] = &off_100060E10;
  v9[3] = &off_100060E28;
  v8[4] = @"SoftwareUpdatePhase";
  v8[5] = @"TargetSUBundleSize";
  v9[4] = &off_100060E40;
  v9[5] = &off_100060E58;
  id v4 = a3;
  id v5 = +[NSDictionary dictionaryWithObjects:v9 forKeys:v8 count:6];
  id v6 = [(MIBUStatusResponse *)self _deserializeFromTagDict:v4 withKeyToTagMapping:v5];

  return v6;
}

- (BOOL)_serializeThermalDetailsWithSerializer:(id)a3
{
  id v4 = a3;
  id v5 = [(MIBUStatusResponse *)self status];
  id v6 = [v5 thermalDetails];
  v9[0] = @"TSRM/TVRM";
  v9[1] = @"TSRR/TVRR";
  v10[0] = &off_100060E70;
  v10[1] = &off_100060E88;
  v9[2] = @"TVRQ";
  v9[3] = @"TSBE/TVBE";
  v10[2] = &off_100060EA0;
  v10[3] = &off_100060EB8;
  v9[4] = @"TSBQ/TVBQ";
  v9[5] = @"TSBR/TVBR";
  v10[4] = &off_100060ED0;
  v10[5] = &off_100060EE8;
  void v9[6] = @"TSLR/TVRH";
  v9[7] = @"TG0V";
  void v10[6] = &off_100060F00;
  v10[7] = &off_100060F18;
  v9[8] = @"ThermalPressure";
  v10[8] = &off_100060F30;
  id v7 = +[NSDictionary dictionaryWithObjects:v10 forKeys:v9 count:9];
  LOBYTE(self) = [(MIBUStatusResponse *)self _serializeDict:v6 fromKeyToTagMapping:v7 withSerializer:v4];

  return (char)self;
}

- (id)_deserializeThermalDetailsFromDict:(id)a3
{
  id v4 = a3;
  id v5 = objc_opt_new();
  v26[0] = @"TSRM/TVRM";
  v26[1] = @"TSRR/TVRR";
  v27[0] = &off_100060E70;
  v27[1] = &off_100060E88;
  v26[2] = @"TVRQ";
  v26[3] = @"TSBE/TVBE";
  v27[2] = &off_100060EA0;
  v27[3] = &off_100060EB8;
  v26[4] = @"TSBQ/TVBQ";
  v26[5] = @"TSBR/TVBR";
  v27[4] = &off_100060ED0;
  v27[5] = &off_100060EE8;
  v26[6] = @"TSLR/TVRH";
  v26[7] = @"TG0V";
  v27[6] = &off_100060F00;
  v27[7] = &off_100060F18;
  v26[8] = @"ThermalPressure";
  v27[8] = &off_100060F30;
  id v6 = +[NSDictionary dictionaryWithObjects:v27 forKeys:v26 count:9];
  id v7 = [(MIBUStatusResponse *)self _deserializeFromTagDict:v4 withKeyToTagMapping:v6];

  long long v23 = 0u;
  long long v24 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  id v8 = v7;
  id v9 = [v8 countByEnumeratingWithState:&v21 objects:v25 count:16];
  if (v9)
  {
    id v10 = v9;
    uint64_t v11 = *(void *)v22;
    do
    {
      for (i = 0; i != v10; i = (char *)i + 1)
      {
        if (*(void *)v22 != v11) {
          objc_enumerationMutation(v8);
        }
        long long v13 = *(void **)(*((void *)&v21 + 1) + 8 * i);
        uint64_t v14 = [v8 objectForKey:v13];
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          int v20 = 0;
          id v15 = v14;
          if ([v13 isEqualToString:@"TG0V"])
          {
            uint64_t v19 = 0;
            [v15 getBytes:&v19 length:8];
            double v16 = (double)v19 * 0.0000152587891;
            *(float *)&double v16 = v16;
            int v20 = LODWORD(v16);
          }
          else
          {
            [v15 getBytes:&v20 length:4];
            LODWORD(v16) = v20;
          }
          unsigned __int8 v17 = +[NSNumber numberWithFloat:v16];
          [v5 setObject:v17 forKey:v13];
        }
        else
        {
          [v5 setObject:v14 forKey:v13];
        }
      }
      id v10 = [v8 countByEnumeratingWithState:&v21 objects:v25 count:16];
    }
    while (v10);
  }

  return v5;
}

- (BOOL)_serializeBatteryDetailsWithSerializer:(id)a3
{
  id v4 = a3;
  id v5 = [(MIBUStatusResponse *)self status];
  id v6 = [v5 batteryDetails];
  v9[0] = @"WARP";
  v9[1] = @"WAVR";
  v10[0] = &off_100060F48;
  v10[1] = &off_100060F60;
  id v7 = +[NSDictionary dictionaryWithObjects:v10 forKeys:v9 count:2];
  LOBYTE(self) = [(MIBUStatusResponse *)self _serializeDict:v6 fromKeyToTagMapping:v7 withSerializer:v4];

  return (char)self;
}

- (id)_deserializeBatteryDetailsFromDict:(id)a3
{
  id v4 = a3;
  id v5 = objc_opt_new();
  v24[0] = @"WARP";
  v24[1] = @"WAVR";
  v25[0] = &off_100060F48;
  v25[1] = &off_100060F60;
  id v6 = +[NSDictionary dictionaryWithObjects:v25 forKeys:v24 count:2];
  unsigned __int8 v17 = v4;
  id v7 = [(MIBUStatusResponse *)self _deserializeFromTagDict:v4 withKeyToTagMapping:v6];

  long long v21 = 0u;
  long long v22 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  id v8 = v7;
  id v9 = [v8 countByEnumeratingWithState:&v19 objects:v23 count:16];
  if (v9)
  {
    id v10 = v9;
    uint64_t v11 = *(void *)v20;
    do
    {
      for (i = 0; i != v10; i = (char *)i + 1)
      {
        if (*(void *)v20 != v11) {
          objc_enumerationMutation(v8);
        }
        uint64_t v13 = *(void *)(*((void *)&v19 + 1) + 8 * i);
        uint64_t v14 = [v8 objectForKey:v13];
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          __int16 v18 = 0;
          [v14 getBytes:&v18 length:2];
          id v15 = +[NSNumber numberWithShort:v18];
          [v5 setObject:v15 forKey:v13];
        }
        else
        {
          [v5 setObject:v14 forKey:v13];
        }
      }
      id v10 = [v8 countByEnumeratingWithState:&v19 objects:v23 count:16];
    }
    while (v10);
  }

  return v5;
}

- (NSString)serialNumber
{
  return self->_serialNumber;
}

- (void)setSerialNumber:(id)a3
{
}

- (NSString)osVersion
{
  return self->_osVersion;
}

- (void)setOsVersion:(id)a3
{
}

- (NSString)buildVersion
{
  return self->_buildVersion;
}

- (void)setBuildVersion:(id)a3
{
}

- (MIBUDeviceStatus)status
{
  return self->_status;
}

- (void)setStatus:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_status, 0);
  objc_storeStrong((id *)&self->_buildVersion, 0);
  objc_storeStrong((id *)&self->_osVersion, 0);

  objc_storeStrong((id *)&self->_serialNumber, 0);
}

@end