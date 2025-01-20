@interface NRRemoteObjectClassC
- (NRRemoteObjectClassC)initWithDelegate:(id)a3 andQueue:(id)a4;
- (id)_getSunriseDate;
- (id)_packProperty:(id)a3 withValue:(id)a4;
- (id)_packPropertyValue:(id)a3;
- (id)_unpackProperties:(id)a3;
- (id)_unpackProperty:(id)a3 name:(id *)a4;
- (id)_unpackPropertyValue:(id)a3;
- (id)packProperties:(id)a3 thisIsAllOfThem:(BOOL)a4;
- (void)addTermsEvent:(id)a3 toIDSBTUUID:(id)a4 withResponseBlock:(id)a5;
- (void)checkTermsEvent:(id)a3 toIDSBTUUID:(id)a4 withResponseBlock:(id)a5;
- (void)idsHandleAddTermsEvent:(id)a3;
- (void)idsHandleCheckTermsEvent:(id)a3;
- (void)idsHandlePropertiesChanged:(id)a3;
- (void)idsHandlePropertyRequest:(id)a3;
- (void)registerProtobufHandlers;
- (void)sendPropertyChanges:(id)a3 isAllProperties:(BOOL)a4 toIDSBTUUID:(id)a5 withSentBlock:(id)a6;
- (void)sendPropertyRequestWithTimeout:(id)a3 toIDSBTUUID:(id)a4 withResponseBlock:(id)a5;
- (void)sendPropertyResponseWithTimeout:(id)a3 withProperties:(id)a4 withRequestIdentifier:(id)a5 withSentBlock:(id)a6;
@end

@implementation NRRemoteObjectClassC

- (NRRemoteObjectClassC)initWithDelegate:(id)a3 andQueue:(id)a4
{
  v5.receiver = self;
  v5.super_class = (Class)NRRemoteObjectClassC;
  return [(NRRemoteObject *)&v5 initWithServiceName:@"com.apple.private.alloy.bluetoothregistryclassc" andClientQueue:a4 andDelegate:a3];
}

- (void)registerProtobufHandlers
{
  [(NRRemoteObject *)self setConnectedProtobufAction:"idsHandlePropertiesChanged:" forIncomingRequestsOfType:2];
  [(NRRemoteObject *)self setConnectedProtobufAction:"idsHandlePropertyRequest:" forIncomingRequestsOfType:4];
  [(NRRemoteObject *)self setConnectedProtobufAction:0 forIncomingResponsesOfType:4];
  [(NRRemoteObject *)self setConnectedProtobufAction:"idsHandleAddTermsEvent:" forIncomingRequestsOfType:7];
  [(NRRemoteObject *)self setConnectedProtobufAction:0 forIncomingResponsesOfType:7];
  [(NRRemoteObject *)self setConnectedProtobufAction:"idsHandleCheckTermsEvent:" forIncomingRequestsOfType:8];

  [(NRRemoteObject *)self setConnectedProtobufAction:0 forIncomingResponsesOfType:8];
}

- (void)idsHandlePropertiesChanged:(id)a3
{
  id v4 = a3;
  objc_super v5 = [NRPBPropertiesChanged alloc];
  v6 = [v4 protobuf];
  v7 = [v6 data];
  v8 = [(NRPBPropertiesChanged *)v5 initWithData:v7];

  v9 = [(NRRemoteObject *)self delegate];
  v10 = sub_1000526F0((uint64_t)v8);
  v11 = [(NRRemoteObjectClassC *)self _unpackProperties:v10];

  v12 = [(NRRemoteObject *)self clientQueue];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000E9794;
  block[3] = &unk_1001681F0;
  id v18 = v9;
  v19 = self;
  id v20 = v11;
  v21 = v8;
  id v22 = v4;
  id v13 = v4;
  v14 = v8;
  id v15 = v11;
  id v16 = v9;
  dispatch_async(v12, block);
}

- (id)_unpackProperties:(id)a3
{
  id v4 = a3;
  objc_super v5 = objc_opt_new();
  if (v4 && [v4 count])
  {
    long long v19 = 0u;
    long long v20 = 0u;
    long long v17 = 0u;
    long long v18 = 0u;
    id v6 = v4;
    id v7 = [v6 countByEnumeratingWithState:&v17 objects:v21 count:16];
    if (v7)
    {
      id v8 = v7;
      uint64_t v9 = *(void *)v18;
      do
      {
        for (i = 0; i != v8; i = (char *)i + 1)
        {
          if (*(void *)v18 != v9) {
            objc_enumerationMutation(v6);
          }
          uint64_t v11 = *(void *)(*((void *)&v17 + 1) + 8 * i);
          id v16 = 0;
          v12 = [(NRRemoteObjectClassC *)self _unpackProperty:v11 name:&v16];
          id v13 = v16;
          if (v13) {
            [v5 setValue:v12 forKey:v13];
          }
        }
        id v8 = [v6 countByEnumeratingWithState:&v17 objects:v21 count:16];
      }
      while (v8);
    }
  }
  id v14 = [v5 copy];

  return v14;
}

- (void)idsHandlePropertyRequest:(id)a3
{
  id v4 = a3;
  objc_super v5 = [(NRRemoteObject *)self delegate];
  id v6 = [(NRRemoteObject *)self clientQueue];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000E9A7C;
  block[3] = &unk_100165868;
  id v10 = v5;
  uint64_t v11 = self;
  id v12 = v4;
  id v7 = v4;
  id v8 = v5;
  dispatch_async(v6, block);
}

- (void)sendPropertyChanges:(id)a3 isAllProperties:(BOOL)a4 toIDSBTUUID:(id)a5 withSentBlock:(id)a6
{
  BOOL v7 = a4;
  id v10 = a5;
  id v11 = a6;
  id v12 = [(NRRemoteObjectClassC *)self packProperties:a3 thisIsAllOfThem:v7];
  if (v12)
  {
    if (v7) {
      CFStringRef v13 = @"all-properties";
    }
    else {
      CFStringRef v13 = 0;
    }
    v20[0] = _NSConcreteStackBlock;
    v20[1] = 3221225472;
    v20[2] = sub_1000E9C78;
    v20[3] = &unk_100165C20;
    id v14 = &v21;
    id v21 = v11;
    id v15 = v11;
    [(NRRemoteObject *)self sendRequest:v12 type:2 withTimeout:0 withResponseTimeout:0 withDescription:@"Property Update" onlyOneFor:v13 priority:300 toIDSBTUUID:v10 didSend:v20 andResponse:0];
  }
  else
  {
    id v16 = [(NRRemoteObject *)self clientQueue];
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_1000E9C98;
    block[3] = &unk_100165D10;
    id v14 = &v19;
    id v19 = v11;
    id v17 = v11;
    dispatch_async(v16, block);
  }
}

- (id)_packPropertyValue:(id)a3
{
  id v4 = a3;
  id v5 = objc_alloc_init((Class)NRPBPropertyValue);
  if (!v4 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {

    id v5 = 0;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v6 = v4;
    id v7 = objc_alloc_init((Class)NRPBNumber);
    id v8 = v6;
    if (!strcmp((const char *)[v8 objCType], "i"))
    {
      id v25 = [v8 intValue];
      v26 = v7;
      goto LABEL_26;
    }
    id v9 = v8;
    if (!strcmp((const char *)[v9 objCType], "I"))
    {
      id v28 = [v9 unsignedIntValue];
      v29 = v7;
LABEL_30:
      [v29 setInt32Value:v28];
LABEL_81:
      [v7 setIsUnsigned:1];
      goto LABEL_82;
    }
    id v10 = v9;
    if (!strcmp((const char *)[v10 objCType], "q"))
    {
      [v7 setInt64Value:[v10 longLongValue]];
      goto LABEL_82;
    }
    id v11 = v10;
    if (!strcmp((const char *)[v11 objCType], "Q"))
    {
      [v7 setInt64Value:[v11 unsignedLongLongValue]];
      goto LABEL_81;
    }
    id v12 = v11;
    if (!strcmp((const char *)[v12 objCType], "s"))
    {
      [v7 setInt32Value:[v12 shortValue]];
      v40 = v7;
      uint64_t v41 = 1;
    }
    else
    {
      id v13 = v12;
      if (!strcmp((const char *)[v13 objCType], "S"))
      {
        [v7 setInt32Value:[v13 unsignedShortValue]];
        v42 = v7;
        uint64_t v43 = 1;
        goto LABEL_80;
      }
      id v14 = v13;
      if (strcmp((const char *)[v14 objCType], "c"))
      {
        id v15 = v14;
        if (strcmp((const char *)[v15 objCType], "C"))
        {
          id v16 = v15;
          if (strcmp((const char *)[v16 objCType], "q"))
          {
            id v17 = v16;
            if (strcmp((const char *)[v17 objCType], "Q"))
            {
              id v18 = v17;
              if (!strcmp((const char *)[v18 objCType], "B"))
              {
                [v7 setBoolValue:[v18 BOOLValue]];
              }
              else
              {
                id v19 = v18;
                if (strcmp((const char *)[v19 objCType], "f"))
                {
                  id v20 = v19;
                  if (!strcmp((const char *)[v20 objCType], "d"))
                  {
                    [v20 doubleValue];
                    [v7 setDoubleValue:];
                    goto LABEL_82;
                  }
LABEL_84:

                  goto LABEL_85;
                }
                [v19 floatValue];
                [v7 setFloatValue:];
              }
LABEL_82:
              if (v7)
              {
                [v5 setNumberValue:v7];
                goto LABEL_84;
              }
LABEL_85:

              goto LABEL_86;
            }
            id v28 = [v17 unsignedIntegerValue];
            v29 = v7;
            goto LABEL_30;
          }
          id v25 = [v16 integerValue];
          v26 = v7;
LABEL_26:
          [v26 setInt32Value:v25];
          goto LABEL_82;
        }
        [v7 setInt32Value:[v15 unsignedCharValue]];
        v42 = v7;
        uint64_t v43 = 0;
LABEL_80:
        [v42 setIsShortOrChar:v43];
        goto LABEL_81;
      }
      [v7 setInt32Value:[v14 charValue]];
      v40 = v7;
      uint64_t v41 = 0;
    }
    [v40 setIsShortOrChar:v41];
    goto LABEL_82;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v21 = v4;
    id v7 = objc_alloc_init((Class)NRPBSize);
    id v8 = v21;
    if (!strcmp((const char *)[v8 objCType], "{CGSize=dd}"))
    {
      [v8 sizeValue];
      *(float *)&double v22 = v22;
      [v7 setWidth:v22];
      [v8 sizeValue];
      *(float *)&double v24 = v23;
      [v7 setHeight:v24];
      if (!v7) {
        goto LABEL_85;
      }
      [v5 setSizeValue:v7];
    }
    goto LABEL_84;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    [v5 setStringValue:v4];
    goto LABEL_86;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v86[0] = 0;
    v86[1] = 0;
    [v4 getUUIDBytes:v86];
    v27 = +[NSData dataWithBytes:v86 length:16];
    [v5 setUUIDValue:v27];

    goto LABEL_86;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    [v5 setDataValue:v4];
    goto LABEL_86;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v30 = v4;
    id v31 = v4;
    id v32 = objc_alloc_init((Class)NSMutableArray);
    [v5 setArrayValues:v32];

    long long v81 = 0u;
    long long v82 = 0u;
    long long v79 = 0u;
    long long v80 = 0u;
    id v33 = v31;
    id v34 = [v33 countByEnumeratingWithState:&v79 objects:v85 count:16];
    if (v34)
    {
      id v35 = v34;
      uint64_t v36 = *(void *)v80;
      do
      {
        for (i = 0; i != v35; i = (char *)i + 1)
        {
          if (*(void *)v80 != v36) {
            objc_enumerationMutation(v33);
          }
          v38 = [(NRRemoteObjectClassC *)self _packPropertyValue:*(void *)(*((void *)&v79 + 1) + 8 * i)];
          if (v38)
          {
            v39 = [v5 arrayValues];
            [v39 addObject:v38];
          }
        }
        id v35 = [v33 countByEnumeratingWithState:&v79 objects:v85 count:16];
      }
      while (v35);
    }

LABEL_59:
    v52 = [v5 arrayValues];
    id v53 = [v52 count];

    if (!v53) {
      [v5 setArrayValues:0];
    }

    id v4 = v30;
    goto LABEL_86;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v30 = v4;
    id v44 = v4;
    id v45 = objc_alloc_init((Class)NSMutableArray);
    [v5 setArrayValues:v45];

    long long v77 = 0u;
    long long v78 = 0u;
    long long v75 = 0u;
    long long v76 = 0u;
    id v33 = v44;
    id v46 = [v33 countByEnumeratingWithState:&v75 objects:v84 count:16];
    if (v46)
    {
      id v47 = v46;
      uint64_t v48 = *(void *)v76;
      do
      {
        for (j = 0; j != v47; j = (char *)j + 1)
        {
          if (*(void *)v76 != v48) {
            objc_enumerationMutation(v33);
          }
          v50 = [(NRRemoteObjectClassC *)self _packPropertyValue:*(void *)(*((void *)&v75 + 1) + 8 * (void)j)];
          if (v50)
          {
            v51 = [v5 arrayValues];
            [v51 addObject:v50];
          }
        }
        id v47 = [v33 countByEnumeratingWithState:&v75 objects:v84 count:16];
      }
      while (v47);
    }

    [v5 setIsSet:1];
    goto LABEL_59;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v69 = v4;
    id v54 = v4;
    id v55 = objc_alloc_init((Class)NSMutableArray);
    [v5 setArrayValues:v55];

    long long v73 = 0u;
    long long v74 = 0u;
    long long v71 = 0u;
    long long v72 = 0u;
    id obj = [v54 allKeys];
    id v56 = [obj countByEnumeratingWithState:&v71 objects:v83 count:16];
    if (v56)
    {
      id v57 = v56;
      uint64_t v58 = *(void *)v72;
      do
      {
        for (k = 0; k != v57; k = (char *)k + 1)
        {
          if (*(void *)v72 != v58) {
            objc_enumerationMutation(obj);
          }
          uint64_t v60 = *(void *)(*((void *)&v71 + 1) + 8 * (void)k);
          v61 = [v54 objectForKeyedSubscript:v60, v69];
          v62 = [(NRRemoteObjectClassC *)self _packPropertyValue:v60];
          if (v62)
          {
            v63 = [(NRRemoteObjectClassC *)self _packPropertyValue:v61];
            v64 = v63;
            if (v63)
            {
              [v63 setDictionaryKey:v62];
              v65 = [v5 arrayValues];
              [v65 addObject:v64];
            }
          }
        }
        id v57 = [obj countByEnumeratingWithState:&v71 objects:v83 count:16];
      }
      while (v57);
    }

    v66 = [v5 arrayValues];
    id v67 = [v66 count];

    if (!v67) {
      [v5 setArrayValues:0];
    }

    id v4 = v69;
  }
  else
  {

    id v5 = 0;
  }
LABEL_86:

  return v5;
}

- (id)_packProperty:(id)a3 withValue:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = objc_alloc_init((Class)NRPBProperty);
  [v8 setName:v7];

  id v9 = [(NRRemoteObjectClassC *)self _packPropertyValue:v6];

  [v8 setValue:v9];

  return v8;
}

- (id)_getSunriseDate
{
  if (qword_1001A14C8 != -1) {
    dispatch_once(&qword_1001A14C8, &stru_100169D48);
  }
  v2 = (void *)qword_1001A14C0;

  return v2;
}

- (id)packProperties:(id)a3 thisIsAllOfThem:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  if ([v6 count] || v4)
  {
    id v7 = objc_alloc_init(NRPBPropertiesChanged);
    sub_1000526DC((uint64_t)v7, v4);
    id v8 = +[NSDate date];
    id v9 = [(NRRemoteObjectClassC *)self _getSunriseDate];
    id v10 = [v8 laterDate:v9];

    if (v10)
    {
      id v11 = +[NSDate date];
      [v11 timeIntervalSinceReferenceDate];
      sub_100051C7C((uint64_t)v7, v12);
    }
    id v13 = objc_alloc_init((Class)NSMutableArray);
    sub_100052704((uint64_t)v7, v13);

    long long v26 = 0u;
    long long v27 = 0u;
    long long v24 = 0u;
    long long v25 = 0u;
    id v14 = v6;
    id v15 = [v14 countByEnumeratingWithState:&v24 objects:v28 count:16];
    if (v15)
    {
      id v16 = v15;
      uint64_t v17 = *(void *)v25;
      do
      {
        for (i = 0; i != v16; i = (char *)i + 1)
        {
          if (*(void *)v25 != v17) {
            objc_enumerationMutation(v14);
          }
          uint64_t v19 = *(void *)(*((void *)&v24 + 1) + 8 * i);
          id v20 = [v14 objectForKeyedSubscript:v19, v24];
          id v21 = [(NRRemoteObjectClassC *)self _packProperty:v19 withValue:v20];
          double v22 = sub_1000526F0((uint64_t)v7);
          [v22 addObject:v21];
        }
        id v16 = [v14 countByEnumeratingWithState:&v24 objects:v28 count:16];
      }
      while (v16);
    }
  }
  else
  {
    id v7 = 0;
  }

  return v7;
}

- (id)_unpackPropertyValue:(id)a3
{
  id v4 = a3;
  id v5 = [v4 numberValue];

  if (v5)
  {
    id v6 = [v4 numberValue];
    unsigned int v7 = [v6 hasInt32Value];

    id v8 = [v4 numberValue];
    id v9 = v8;
    if (v7)
    {
      unsigned int v10 = [v8 hasIsShortOrChar];

      id v11 = [v4 numberValue];
      double v12 = v11;
      if (v10)
      {
        unsigned int v13 = [v11 isShortOrChar];

        id v14 = [v4 numberValue];
        unsigned int v15 = [v14 isUnsigned];

        id v16 = [v4 numberValue];
        unsigned __int16 v17 = (unsigned __int16)[v16 int32Value];
        if (v13)
        {
          if (v15) {
            +[NSNumber numberWithUnsignedShort:v17];
          }
          else {
            +[NSNumber numberWithShort:(__int16)v17];
          }
        }
        else if (v15)
        {
          +[NSNumber numberWithUnsignedChar:v17];
        }
        else
        {
          +[NSNumber numberWithChar:(char)v17];
        }
      }
      else
      {
        unsigned int v30 = [v11 isUnsigned];

        id v16 = [v4 numberValue];
        id v31 = [v16 int32Value];
        if (v30) {
          +[NSNumber numberWithUnsignedInt:v31];
        }
        else {
          +[NSNumber numberWithInt:v31];
        }
      }
      uint64_t v33 = LABEL_20:;
      goto LABEL_31;
    }
    unsigned int v25 = [v8 hasInt64Value];

    long long v26 = [v4 numberValue];
    long long v27 = v26;
    if (v25)
    {
      unsigned int v28 = [v26 isUnsigned];

      id v16 = [v4 numberValue];
      id v29 = [v16 int64Value];
      if (v28) {
        +[NSNumber numberWithUnsignedLongLong:v29];
      }
      else {
        +[NSNumber numberWithLongLong:v29];
      }
      goto LABEL_20;
    }
    unsigned int v32 = [v26 hasFloatValue];

    if (v32)
    {
      id v16 = [v4 numberValue];
      [v16 floatValue];
      uint64_t v33 = +[NSNumber numberWithFloat:](NSNumber, "numberWithFloat:");
LABEL_31:
      id v24 = (id)v33;

      goto LABEL_32;
    }
    uint64_t v36 = [v4 numberValue];
    unsigned int v37 = [v36 hasDoubleValue];

    if (v37)
    {
      id v16 = [v4 numberValue];
      [v16 doubleValue];
      uint64_t v33 = +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:");
      goto LABEL_31;
    }
    v40 = [v4 numberValue];
    unsigned int v41 = [v40 hasBoolValue];

    if (v41)
    {
      id v16 = [v4 numberValue];
      uint64_t v33 = +[NSNumber numberWithBool:](NSNumber, "numberWithBool:", [v16 BOOLValue]);
      goto LABEL_31;
    }
    goto LABEL_54;
  }
  id v18 = [v4 sizeValue];

  if (v18)
  {
    uint64_t v19 = [v4 sizeValue];
    [v19 width];
    double v21 = v20;
    double v22 = [v4 sizeValue];
    [v22 height];
    +[NSValue valueWithSize:](NSValue, "valueWithSize:", v21, v23);
    id v24 = (id)objc_claimAutoreleasedReturnValue();

    goto LABEL_32;
  }
  id v34 = [v4 stringValue];

  if (v34)
  {
    id v35 = [v4 stringValue];
LABEL_37:
    id v24 = v35;
    goto LABEL_32;
  }
  v38 = [v4 uUIDValue];

  if (v38)
  {
    v87[0] = 0;
    v87[1] = 0;
    v39 = [v4 uUIDValue];
    [v39 getBytes:v87 length:16];

    id v35 = [objc_alloc((Class)NSUUID) initWithUUIDBytes:v87];
    goto LABEL_37;
  }
  uint64_t v43 = [v4 dataValue];

  if (v43)
  {
    id v35 = [v4 dataValue];
    goto LABEL_37;
  }
  uint64_t v44 = [v4 arrayValues];
  if (!v44)
  {
LABEL_54:
    id v24 = 0;
    goto LABEL_32;
  }
  id v45 = (void *)v44;
  id v46 = [v4 arrayValues];
  id v24 = [v46 count];

  if (!v24) {
    goto LABEL_32;
  }
  id v47 = [v4 arrayValues];
  uint64_t v48 = [v47 firstObject];

  v49 = [v48 dictionaryKey];

  if (!v49)
  {
    if ([v4 isSet])
    {
      id v50 = objc_alloc_init((Class)NSMutableSet);
      long long v72 = 0u;
      long long v73 = 0u;
      long long v74 = 0u;
      long long v75 = 0u;
      uint64_t v60 = [v4 arrayValues];
      id v61 = [v60 countByEnumeratingWithState:&v72 objects:v84 count:16];
      if (v61)
      {
        id v62 = v61;
        uint64_t v63 = *(void *)v73;
        do
        {
          for (i = 0; i != v62; i = (char *)i + 1)
          {
            if (*(void *)v73 != v63) {
              objc_enumerationMutation(v60);
            }
            v65 = [(NRRemoteObjectClassC *)self _unpackPropertyValue:*(void *)(*((void *)&v72 + 1) + 8 * i)];
            if (v65) {
              [v50 addObject:v65];
            }
          }
          id v62 = [v60 countByEnumeratingWithState:&v72 objects:v84 count:16];
        }
        while (v62);
      }
    }
    else
    {
      id v50 = objc_alloc_init((Class)NSMutableArray);
      long long v76 = 0u;
      long long v77 = 0u;
      long long v78 = 0u;
      long long v79 = 0u;
      uint64_t v60 = [v4 arrayValues];
      id v66 = [v60 countByEnumeratingWithState:&v76 objects:v85 count:16];
      if (v66)
      {
        id v67 = v66;
        uint64_t v68 = *(void *)v77;
        do
        {
          for (j = 0; j != v67; j = (char *)j + 1)
          {
            if (*(void *)v77 != v68) {
              objc_enumerationMutation(v60);
            }
            v70 = [(NRRemoteObjectClassC *)self _unpackPropertyValue:*(void *)(*((void *)&v76 + 1) + 8 * (void)j)];
            if (v70) {
              [v50 addObject:v70];
            }
          }
          id v67 = [v60 countByEnumeratingWithState:&v76 objects:v85 count:16];
        }
        while (v67);
      }
    }

    if (![v50 count])
    {
      id v24 = 0;
      goto LABEL_78;
    }
    goto LABEL_77;
  }
  long long v71 = v48;
  id v50 = objc_alloc_init((Class)NSMutableDictionary);
  long long v80 = 0u;
  long long v81 = 0u;
  long long v82 = 0u;
  long long v83 = 0u;
  v51 = [v4 arrayValues];
  id v52 = [v51 countByEnumeratingWithState:&v80 objects:v86 count:16];
  if (v52)
  {
    id v53 = v52;
    uint64_t v54 = *(void *)v81;
    do
    {
      for (k = 0; k != v53; k = (char *)k + 1)
      {
        if (*(void *)v81 != v54) {
          objc_enumerationMutation(v51);
        }
        id v56 = *(void **)(*((void *)&v80 + 1) + 8 * (void)k);
        id v57 = [v56 dictionaryKey];
        uint64_t v58 = [(NRRemoteObjectClassC *)self _unpackPropertyValue:v57];

        v59 = [(NRRemoteObjectClassC *)self _unpackPropertyValue:v56];
        if (v58)
        {
          if (v59) {
            [v50 setObject:v59 forKey:v58];
          }
          else {
            [v50 removeObjectForKey:v58];
          }
        }
      }
      id v53 = [v51 countByEnumeratingWithState:&v80 objects:v86 count:16];
    }
    while (v53);
  }

  if ([v50 count])
  {
    uint64_t v48 = v71;
LABEL_77:
    id v24 = [v50 copy];
    goto LABEL_78;
  }
  id v24 = 0;
  uint64_t v48 = v71;
LABEL_78:

LABEL_32:

  return v24;
}

- (id)_unpackProperty:(id)a3 name:(id *)a4
{
  id v6 = a3;
  *a4 = [v6 name];
  unsigned int v7 = [v6 value];

  id v8 = [(NRRemoteObjectClassC *)self _unpackPropertyValue:v7];

  return v8;
}

- (void)sendPropertyRequestWithTimeout:(id)a3 toIDSBTUUID:(id)a4 withResponseBlock:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = objc_alloc_init(NRPBPropertyRequest);
  objc_initWeak(&location, self);
  v17[0] = _NSConcreteStackBlock;
  v17[1] = 3221225472;
  v17[2] = sub_1000EB358;
  v17[3] = &unk_100165C20;
  id v12 = v10;
  id v18 = v12;
  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472;
  v14[2] = sub_1000EB378;
  v14[3] = &unk_100169D70;
  objc_copyWeak(&v16, &location);
  id v13 = v12;
  id v15 = v13;
  [(NRRemoteObject *)self sendRequest:v11 type:4 withTimeout:v8 withResponseTimeout:v8 withDescription:@"Property request" onlyOneFor:0 priority:300 toIDSBTUUID:v9 didSend:v17 andResponse:v14];

  objc_destroyWeak(&v16);
  objc_destroyWeak(&location);
}

- (void)sendPropertyResponseWithTimeout:(id)a3 withProperties:(id)a4 withRequestIdentifier:(id)a5 withSentBlock:(id)a6
{
  id v10 = a6;
  id v11 = a5;
  id v12 = a3;
  id v13 = [(NRRemoteObjectClassC *)self packProperties:a4 thisIsAllOfThem:1];
  id v14 = objc_alloc_init(NRPBPropertyResponse);
  id v15 = sub_1000526F0((uint64_t)v13);
  sub_10009F994((uint64_t)v14, v15);

  v17[0] = _NSConcreteStackBlock;
  v17[1] = 3221225472;
  v17[2] = sub_1000EB5D4;
  v17[3] = &unk_100165C20;
  id v18 = v10;
  id v16 = v10;
  [(NRRemoteObject *)self sendResponse:v14 type:4 withRequest:v11 withTimeout:v12 withDescription:@"property response" onlyOneFor:0 priority:300 didSend:v17];
}

- (void)addTermsEvent:(id)a3 toIDSBTUUID:(id)a4 withResponseBlock:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  id v11 = objc_alloc_init(NRPBAddTermsEventRequest);
  sub_1000B1DC0((uint64_t)v11, v10);
  id v12 = sub_1000B1ECC((uint64_t)v11);
  [v12 setWritable:1];

  id v13 = [v10 termsText];

  id v14 = sub_1000B1ECC((uint64_t)v11);
  [v14 setTermsText:v13];

  id v15 = sub_1000B1ECC((uint64_t)v11);
  [v15 setWritable:0];

  v19[0] = _NSConcreteStackBlock;
  v19[1] = 3221225472;
  v19[2] = sub_1000EB7C4;
  v19[3] = &unk_100165C20;
  id v20 = v8;
  v17[0] = _NSConcreteStackBlock;
  v17[1] = 3221225472;
  v17[2] = sub_1000EB7DC;
  v17[3] = &unk_100167DE8;
  id v18 = v20;
  id v16 = v20;
  [(NRRemoteObject *)self sendRequest:v11 type:7 withTimeout:&off_100177560 withResponseTimeout:&off_100177570 withDescription:@"addTermsEvent" onlyOneFor:0 priority:300 toIDSBTUUID:v9 didSend:v19 andResponse:v17];
}

- (void)checkTermsEvent:(id)a3 toIDSBTUUID:(id)a4 withResponseBlock:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  id v11 = objc_alloc_init(NRPBCheckTermsEventRequest);
  sub_100020450((uint64_t)v11, v10);

  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472;
  v15[2] = sub_1000EBACC;
  v15[3] = &unk_100165C20;
  id v16 = v8;
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = sub_1000EBAEC;
  v13[3] = &unk_100167DE8;
  id v14 = v16;
  id v12 = v16;
  [(NRRemoteObject *)self sendRequest:v11 type:8 withTimeout:&off_100177560 withResponseTimeout:&off_100177570 withDescription:@"checkTermsEvent" onlyOneFor:0 priority:300 toIDSBTUUID:v9 didSend:v15 andResponse:v13];
}

- (void)idsHandleAddTermsEvent:(id)a3
{
  id v4 = a3;
  id v5 = [(NRRemoteObject *)self delegate];
  id v6 = [NRPBAddTermsEventRequest alloc];
  unsigned int v7 = [v4 protobuf];
  id v8 = [v7 data];
  id v9 = [(NRPBAddTermsEventRequest *)v6 initWithData:v8];

  if (v9)
  {
    id v10 = sub_1000B1ECC((uint64_t)v9);

    if (v10)
    {
      id v11 = [(NRRemoteObject *)self clientQueue];
      v12[0] = _NSConcreteStackBlock;
      v12[1] = 3221225472;
      v12[2] = sub_1000EBDDC;
      v12[3] = &unk_100165668;
      id v13 = v9;
      id v14 = v5;
      id v15 = self;
      id v16 = v4;
      dispatch_async(v11, v12);
    }
  }
}

- (void)idsHandleCheckTermsEvent:(id)a3
{
  id v4 = a3;
  id v5 = [(NRRemoteObject *)self delegate];
  id v6 = [NRPBCheckTermsEventRequest alloc];
  unsigned int v7 = [v4 protobuf];
  id v8 = [v7 data];
  id v9 = [(NRPBCheckTermsEventRequest *)v6 initWithData:v8];

  if (v9)
  {
    id v10 = sub_10002055C((uint64_t)v9);

    if (v10)
    {
      id v11 = [(NRRemoteObject *)self clientQueue];
      v12[0] = _NSConcreteStackBlock;
      v12[1] = 3221225472;
      v12[2] = sub_1000EC150;
      v12[3] = &unk_100165668;
      id v13 = v5;
      id v14 = self;
      id v15 = v9;
      id v16 = v4;
      dispatch_async(v11, v12);
    }
  }
}

@end