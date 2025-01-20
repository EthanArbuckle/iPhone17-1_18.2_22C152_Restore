@interface AUFileParser
+ (id)auTypeString:(unsigned __int8)a3;
+ (id)loadParsersFromFWDirectory:(id)a3 logHandle:(id)a4 productID:(id)a5 equivalentPIDs:(id)a6 errorDomain:(id)a7 STFWFirst:(id)a8 parsers:(id)a9;
- (AUFileParser)initWithFilePath:(id)a3 productID:(id)a4 equivalentPIDs:(id)a5 logHandle:(id)a6 errorDomain:(id)a7 error:(id *)a8;
- (BOOL)personalizationRequired;
- (NSData)payload;
- (NSNumber)headerSignature;
- (NSString)filePath;
- (OS_os_log)logHandle;
- (id)createAFUManifest:(id)a3;
- (id)description;
- (id)getAppleUpdateHeaderField:(unint64_t)a3;
- (id)getFTABDigests;
- (id)getFirmwareType;
- (id)getFirmwareVersion;
- (id)getHardwareRevisionID;
- (id)getPID;
- (void)setFilePath:(id)a3;
@end

@implementation AUFileParser

- (AUFileParser)initWithFilePath:(id)a3 productID:(id)a4 equivalentPIDs:(id)a5 logHandle:(id)a6 errorDomain:(id)a7 error:(id *)a8
{
  id v14 = a3;
  id v15 = a4;
  id v16 = a5;
  id v17 = a6;
  id v18 = a7;
  v74.receiver = self;
  v74.super_class = (Class)AUFileParser;
  v19 = [(AUFileParser *)&v74 init];
  v20 = v19;
  if (v19)
  {
    objc_storeStrong((id *)&v19->_logHandle, a6);
    v21 = +[NSFileManager defaultManager];
    char v73 = 0;
    if (![v21 fileExistsAtPath:v14 isDirectory:&v73] || v73)
    {

      v31 = +[NSString stringWithFormat:@"Invalid AU file %@", v14];
      if (a8)
      {
        id v32 = objc_alloc((Class)NSError);
        NSErrorUserInfoKey v84 = NSLocalizedDescriptionKey;
        v85 = v31;
        v33 = +[NSDictionary dictionaryWithObjects:&v85 forKeys:&v84 count:1];
        *a8 = [v32 initWithDomain:v18 code:47 userInfo:v33];
      }
      goto LABEL_17;
    }
    v22 = [v21 attributesOfItemAtPath:v14 error:0];
    v23 = v22;
    if (!v22)
    {

      v20 = +[NSString stringWithFormat:@"No file attributes for %@", v14];
      if (a8)
      {
        v68 = a8;
        id v34 = objc_alloc((Class)NSError);
        NSErrorUserInfoKey v82 = NSLocalizedDescriptionKey;
        v83 = v20;
        v27 = +[NSDictionary dictionaryWithObjects:&v83 forKeys:&v82 count:1];
        v28 = v34;
        id v29 = v18;
        uint64_t v30 = 47;
        goto LABEL_13;
      }
LABEL_16:

LABEL_17:
      v20 = 0;
      goto LABEL_18;
    }
    v68 = a8;
    v24 = [v22 objectForKeyedSubscript:NSFileSize];
    id v25 = [v24 unsignedLongLongValue];

    if ((unint64_t)v25 <= 0x7F)
    {

      v20 = +[NSString stringWithFormat:@"%@ has invalid size of %llu bytes", v14, v25];
      if (v68)
      {
        id v26 = objc_alloc((Class)NSError);
        NSErrorUserInfoKey v80 = NSLocalizedDescriptionKey;
        v81 = v20;
        v27 = +[NSDictionary dictionaryWithObjects:&v81 forKeys:&v80 count:1];
        v28 = v26;
        id v29 = v18;
        uint64_t v30 = 5;
LABEL_13:
        id *v68 = [v28 initWithDomain:v29 code:v30 userInfo:v27];

        goto LABEL_16;
      }
      goto LABEL_16;
    }
    uint64_t v35 = +[NSString stringWithString:v14];
    filePath = v20->_filePath;
    v20->_filePath = (NSString *)v35;

    uint64_t v37 = +[NSData dataWithContentsOfFile:v20->_filePath options:1 error:v68];
    payload = v20->_payload;
    v20->_payload = (NSData *)v37;

    if (v68 && *v68) {
      goto LABEL_16;
    }
    id v67 = v17;

    v40 = [(AUFileParser *)v20 getPID];
    unsigned int v41 = [v40 intValue];
    unsigned int v42 = [v15 intValue];

    if (v41 == v42) {
      goto LABEL_28;
    }
    long long v71 = 0u;
    long long v72 = 0u;
    long long v69 = 0u;
    long long v70 = 0u;
    id v43 = v16;
    id v44 = [v43 countByEnumeratingWithState:&v69 objects:v79 count:16];
    if (v44)
    {
      id v45 = v44;
      id v64 = v18;
      id v65 = v16;
      id v66 = v15;
      char v46 = 0;
      uint64_t v47 = *(void *)v70;
      do
      {
        for (i = 0; i != v45; i = (char *)i + 1)
        {
          if (*(void *)v70 != v47) {
            objc_enumerationMutation(v43);
          }
          v49 = *(void **)(*((void *)&v69 + 1) + 8 * i);
          v50 = [(AUFileParser *)v20 getPID];
          unsigned int v51 = [v50 intValue];
          LOBYTE(v51) = v51 == [v49 intValue];

          v46 |= v51;
        }
        id v45 = [v43 countByEnumeratingWithState:&v69 objects:v79 count:16];
      }
      while (v45);

      id v16 = v65;
      id v15 = v66;
      id v18 = v64;
      if (v46)
      {
LABEL_28:
        id v52 = v16;
        v53 = [(AUFileParser *)v20 headerSignature];
        unsigned int v54 = [v53 unsignedIntValue];

        if (v54 == 41671)
        {
          id v16 = v52;
          id v17 = v67;
          goto LABEL_18;
        }
        v55 = [(AUFileParser *)v20 headerSignature];
        v21 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"%@ has invalid header signature %u", v14, [v55 unsignedIntValue]);

        if (!v68) {
          goto LABEL_36;
        }
        id v56 = objc_alloc((Class)NSError);
        NSErrorUserInfoKey v75 = NSLocalizedDescriptionKey;
        v76 = v21;
        +[NSDictionary dictionaryWithObjects:&v76 forKeys:&v75 count:1];
        v58 = v57 = v68;
        v59 = v56;
        id v60 = v18;
        uint64_t v61 = 51;
        goto LABEL_35;
      }
    }
    else
    {
    }
    id v52 = v16;
    v62 = [(AUFileParser *)v20 getPID];
    v21 = +[NSString stringWithFormat:@"%@ has incorrect product ID %@ instead of %@ or equivalent PIDs %@", v14, v62, v15, v43];

    if (!v68)
    {
LABEL_36:

      id v16 = v52;
      id v17 = v67;
      goto LABEL_17;
    }
    id v63 = objc_alloc((Class)NSError);
    NSErrorUserInfoKey v77 = NSLocalizedDescriptionKey;
    v78 = v21;
    +[NSDictionary dictionaryWithObjects:&v78 forKeys:&v77 count:1];
    v58 = v57 = v68;
    v59 = v63;
    id v60 = v18;
    uint64_t v61 = 6;
LABEL_35:
    id *v57 = [v59 initWithDomain:v60 code:v61 userInfo:v58];

    goto LABEL_36;
  }
LABEL_18:

  return v20;
}

- (id)description
{
  v3 = [(AUFileParser *)self getFirmwareType];
  v4 = +[AUFileParser auTypeString:](AUFileParser, "auTypeString:", [v3 unsignedIntValue]);
  v5 = [(AUFileParser *)self getFirmwareVersion];
  id v6 = [v5 unsignedIntValue];
  v7 = [(AUFileParser *)self getHardwareRevisionID];
  id v8 = [v7 unsignedIntValue];
  v9 = [(AUFileParser *)self getPID];
  v10 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"%@ version 0x%X HW revision ID 0x%X product ID 0x%X", v4, v6, v8, [v9 unsignedIntValue]);

  return v10;
}

- (id)getAppleUpdateHeaderField:(unint64_t)a3
{
  unsigned __int16 v7 = 0;
  v4 = [(AUFileParser *)self payload];
  objc_msgSend(v4, "getBytes:range:", &v7, a3, 2);

  v5 = +[NSNumber numberWithUnsignedShort:v7];
  return v5;
}

- (NSNumber)headerSignature
{
  return (NSNumber *)[(AUFileParser *)self getAppleUpdateHeaderField:0];
}

- (id)getPID
{
  return [(AUFileParser *)self getAppleUpdateHeaderField:16];
}

- (id)getFirmwareType
{
  return [(AUFileParser *)self getAppleUpdateHeaderField:4];
}

- (id)getFirmwareVersion
{
  return [(AUFileParser *)self getAppleUpdateHeaderField:6];
}

- (id)getHardwareRevisionID
{
  v2 = [(AUFileParser *)self getAppleUpdateHeaderField:18];
  if (![v2 intValue])
  {

    v2 = &off_1000269D0;
  }
  return v2;
}

- (BOOL)personalizationRequired
{
  v2 = [(AUFileParser *)self getFirmwareType];
  BOOL v3 = [v2 unsignedIntValue] == 112;

  return v3;
}

- (id)getFTABDigests
{
  id v3 = objc_alloc_init((Class)NSMutableDictionary);
  v4 = [(AUFileParser *)self payload];
  id v5 = [v4 length];

  if ((unint64_t)v5 <= 0xC0)
  {
    id v6 = [(AUFileParser *)self logHandle];
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      sub_100017458((uint64_t)v5, v6);
    }
LABEL_8:

    goto LABEL_9;
  }
  unint64_t v7 = (unint64_t)v5 - 128;
  id v8 = [(AUFileParser *)self payload];
  objc_msgSend(v8, "subdataWithRange:", 128, v7);
  id v9 = objc_claimAutoreleasedReturnValue();
  v10 = (unsigned int *)[v9 bytes];

  unint64_t v11 = v10[10];
  if (v7 < 16 * v11 + 64 || (unint64_t)[&off_100026B28 count] > v11)
  {
    id v6 = [(AUFileParser *)self logHandle];
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      sub_1000174D0(v11, v6);
    }
    goto LABEL_8;
  }
  if ([&off_100026B28 count])
  {
    unint64_t v13 = 0;
    id v14 = v10 + 14;
    while (v7 >= (*v14 + *(v14 - 1)))
    {
      ccdigest();
      id v15 = +[NSData dataWithBytes:v17 length:48];
      id v16 = [&off_100026B28 objectAtIndexedSubscript:v13];
      [v3 setObject:v15 forKeyedSubscript:v16];

      ++v13;
      v14 += 4;
      if (v13 >= (unint64_t)[&off_100026B28 count]) {
        goto LABEL_9;
      }
    }
    id v6 = [(AUFileParser *)self logHandle];
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      sub_100017548(v6);
    }
    goto LABEL_8;
  }
LABEL_9:
  return v3;
}

- (id)createAFUManifest:(id)a3
{
  id v4 = a3;
  id v5 = [(AUFileParser *)self payload];
  objc_msgSend(v5, "getBytes:range:", v11, 0, 20);

  __int16 v12 = 113;
  unsigned int v13 = [v4 length];
  id v6 = v4;
  int v14 = crc32(0, (const Bytef *)[v6 bytes], (uInt)objc_msgSend(v6, "length"));
  unint64_t v7 = +[NSMutableData dataWithLength:124];
  objc_msgSend(v7, "replaceBytesInRange:withBytes:", 0, 20, v11);
  id v8 = v7;
  int v10 = crc32(0, (const Bytef *)[v8 bytes], (uInt)objc_msgSend(v8, "length"));
  [v8 appendBytes:&v10 length:4];
  [v8 appendData:v6];

  return v8;
}

+ (id)auTypeString:(unsigned __int8)a3
{
  if ((int)a3 > 111)
  {
    if ((int)a3 > 191)
    {
      switch(a3)
      {
        case 0xC0u:
          id v4 = @"kAUTypeKeyCal";
          break;
        case 0xC1u:
          id v4 = @"kAUTypeMTCal";
          break;
        case 0xC2u:
          id v4 = @"kAUTypeForceCal";
          break;
        case 0xC3u:
          id v4 = @"kAUTypeActCal";
          break;
        case 0xC4u:
          id v4 = @"kAUTypeAccelCal";
          break;
        case 0xC5u:
          id v4 = @"kAUTypeAudioCal";
          break;
        default:
          if (a3 != 223) {
            goto LABEL_81;
          }
          id v4 = @"kAUTypeTest";
          break;
      }
      return v4;
    }
    switch(a3)
    {
      case 0x70u:
        id v4 = @"kAUTypeR1FW";
        return v4;
      case 0xA0u:
        id v4 = @"kAUTypeVibeWaveform";
        return v4;
      case 0xB0u:
        id v4 = @"kAUTypeBootLoader";
        return v4;
    }
LABEL_81:
    id v4 = +[NSString stringWithFormat:@"unknown AUType (0x%02X)", a3];
    return v4;
  }
  if ((int)a3 > 63)
  {
    if ((int)a3 <= 79)
    {
      if (a3 == 64)
      {
        id v4 = @"kAUTypeAudioFW";
        return v4;
      }
      if (a3 == 65)
      {
        id v4 = @"kAUTypeAudioCalFW";
        return v4;
      }
    }
    else
    {
      switch(a3)
      {
        case 'P':
          id v4 = @"kAUTypeChargerFW";
          return v4;
        case 'X':
          id v4 = @"kAUTypePowerFW";
          return v4;
          id v4 = @"kAUTypeAccelAlgs";
          return v4;
      }
    }
    goto LABEL_81;
  }
  if ((int)a3 <= 31)
  {
    if (!a3)
    {
      id v4 = @"kAUTypeUnknown";
      return v4;
    }
    if (a3 == 1)
    {
      id v4 = @"kAUTypeSTFW";
      return v4;
    }
    goto LABEL_81;
  }
  switch(a3)
  {
    case ' ':
      id v4 = @"kAUTypeMTFW";
      break;
    case '0':
      id v4 = @"kAUTypeRadioFW";
      break;
    case '1':
      id v4 = @"kAUTypeRadioDiags";
      return v4;
    default:
      goto LABEL_81;
  }
  return v4;
}

+ (id)loadParsersFromFWDirectory:(id)a3 logHandle:(id)a4 productID:(id)a5 equivalentPIDs:(id)a6 errorDomain:(id)a7 STFWFirst:(id)a8 parsers:(id)a9
{
  id v63 = a3;
  int v14 = a4;
  id v65 = a5;
  id v64 = a6;
  id v66 = a7;
  id v70 = a8;
  id v69 = a9;
  oslog = v14;
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG)) {
    sub_10001758C((uint64_t)v63, v14);
  }
  uint64_t v106 = 0;
  v107 = (id *)&v106;
  uint64_t v108 = 0x3032000000;
  v109 = sub_10000D750;
  v110 = sub_10000D760;
  id v111 = 0;
  v105[0] = _NSConcreteStackBlock;
  v105[1] = 3221225472;
  v105[2] = sub_10000D768;
  v105[3] = &unk_100024710;
  v105[4] = &v106;
  v62 = objc_retainBlock(v105);
  id v15 = +[NSFileManager defaultManager];
  NSURLResourceKey v16 = NSURLIsDirectoryKey;
  v121[0] = NSURLNameKey;
  v121[1] = NSURLIsDirectoryKey;
  id v17 = +[NSArray arrayWithObjects:v121 count:2];
  id v18 = [v15 enumeratorAtURL:v63 includingPropertiesForKeys:v17 options:4 errorHandler:v62];

  id v19 = objc_alloc_init((Class)NSMutableDictionary);
  id v73 = objc_alloc_init((Class)NSMutableArray);
  long long v103 = 0u;
  long long v104 = 0u;
  long long v101 = 0u;
  long long v102 = 0u;
  id obj = v18;
  id v20 = [obj countByEnumeratingWithState:&v101 objects:v120 count:16];
  if (v20)
  {
    uint64_t v21 = *(void *)v102;
    while (2)
    {
      v22 = 0;
      id v75 = v20;
      do
      {
        if (*(void *)v102 != v21) {
          objc_enumerationMutation(obj);
        }
        v23 = *(void **)(*((void *)&v101 + 1) + 8 * (void)v22);
        id v99 = 0;
        id v100 = 0;
        v24 = v107;
        [v23 getResourceValue:&v100 forKey:v16 error:&v99];
        id v25 = v100;
        objc_storeStrong(v24 + 5, v99);
        if (v107[5]) {
          goto LABEL_25;
        }
        if (([v25 BOOLValue] & 1) == 0)
        {
          id v97 = 0;
          id v98 = 0;
          id v26 = v107;
          [v23 getResourceValue:&v98 forKey:NSURLNameKey error:&v97];
          id v27 = v98;
          objc_storeStrong(v26 + 5, v97);
          if (v107[5]) {
            goto LABEL_24;
          }
          uint64_t v28 = v21;
          id v29 = v16;
          if (os_log_type_enabled(oslog, OS_LOG_TYPE_DEBUG))
          {
            *(_DWORD *)buf = 138412290;
            id v119 = v27;
            _os_log_debug_impl((void *)&_mh_execute_header, oslog, OS_LOG_TYPE_DEBUG, "loading firmware file %@", buf, 0xCu);
          }
          uint64_t v30 = [AUFileParser alloc];
          v31 = [v23 path];
          id v32 = v107 + 5;
          id v96 = v107[5];
          v33 = [(AUFileParser *)v30 initWithFilePath:v31 productID:v65 equivalentPIDs:v64 logHandle:oslog errorDomain:v66 error:&v96];
          objc_storeStrong(v32, v96);
          NSURLResourceKey v16 = v29;
          uint64_t v21 = v28;
          id v20 = v75;

          if (v107[5])
          {

LABEL_24:
LABEL_25:

            goto LABEL_26;
          }
          id v34 = [(AUFileParser *)v33 getHardwareRevisionID];
          if ([v34 isEqualToNumber:&off_1000269D0])
          {
            [v73 addObject:v33];
          }
          else
          {
            id v35 = [v19 objectForKeyedSubscript:v34];
            if (!v35)
            {
              id v35 = objc_alloc_init((Class)NSMutableArray);
              [v19 setObject:v35 forKeyedSubscript:v34];
            }
            [v35 addObject:v33];
          }
        }

        v22 = (char *)v22 + 1;
      }
      while (v20 != v22);
      id v20 = [obj countByEnumeratingWithState:&v101 objects:v120 count:16];
      if (v20) {
        continue;
      }
      break;
    }
  }
LABEL_26:

  if ([v73 count])
  {
    id v36 = objc_alloc_init((Class)NSMutableArray);
    [v19 setObject:v36 forKeyedSubscript:&off_1000269D0];
  }
  long long v94 = 0u;
  long long v95 = 0u;
  long long v92 = 0u;
  long long v93 = 0u;
  id v74 = v73;
  id v37 = [v74 countByEnumeratingWithState:&v92 objects:v117 count:16];
  if (v37)
  {
    uint64_t v38 = *(void *)v93;
    do
    {
      for (i = 0; i != v37; i = (char *)i + 1)
      {
        if (*(void *)v93 != v38) {
          objc_enumerationMutation(v74);
        }
        uint64_t v40 = *(void *)(*((void *)&v92 + 1) + 8 * i);
        long long v88 = 0u;
        long long v89 = 0u;
        long long v90 = 0u;
        long long v91 = 0u;
        id v41 = v19;
        id v42 = [v41 countByEnumeratingWithState:&v88 objects:v116 count:16];
        if (v42)
        {
          uint64_t v43 = *(void *)v89;
          do
          {
            for (j = 0; j != v42; j = (char *)j + 1)
            {
              if (*(void *)v89 != v43) {
                objc_enumerationMutation(v41);
              }
              id v45 = [v41 objectForKeyedSubscript:*(void *)(*((void *)&v88 + 1) + 8 * (void)j)];
              [v45 addObject:v40];
            }
            id v42 = [v41 countByEnumeratingWithState:&v88 objects:v116 count:16];
          }
          while (v42);
        }
      }
      id v37 = [v74 countByEnumeratingWithState:&v92 objects:v117 count:16];
    }
    while (v37);
  }

  long long v86 = 0u;
  long long v87 = 0u;
  long long v84 = 0u;
  long long v85 = 0u;
  id v76 = v19;
  id v46 = [v76 countByEnumeratingWithState:&v84 objects:v115 count:16];
  if (v46)
  {
    uint64_t v68 = *(void *)v85;
    do
    {
      id v71 = v46;
      for (k = 0; k != v71; k = (char *)k + 1)
      {
        if (*(void *)v85 != v68) {
          objc_enumerationMutation(v76);
        }
        uint64_t v48 = *(void *)(*((void *)&v84 + 1) + 8 * (void)k);
        v49 = [v76 objectForKeyedSubscript:v48];
        v82[0] = _NSConcreteStackBlock;
        v82[1] = 3221225472;
        v82[2] = sub_10000D794;
        v82[3] = &unk_100024738;
        id v83 = v70;
        [v49 sortUsingComparator:v82];
        uint64_t v77 = v48;
        v50 = +[NSMutableString stringWithFormat:@"Devices that report HW Revision ID %@ will receive FW files in the following order:", v48];
        long long v80 = 0u;
        long long v81 = 0u;
        long long v78 = 0u;
        long long v79 = 0u;
        id v51 = v49;
        id v52 = [v51 countByEnumeratingWithState:&v78 objects:v114 count:16];
        if (v52)
        {
          uint64_t v53 = *(void *)v79;
          do
          {
            for (m = 0; m != v52; m = (char *)m + 1)
            {
              if (*(void *)v79 != v53) {
                objc_enumerationMutation(v51);
              }
              v55 = [*(id *)(*((void *)&v78 + 1) + 8 * (void)m) getFirmwareType];
              id v56 = +[AUFileParser auTypeString:](AUFileParser, "auTypeString:", [v55 unsignedIntValue]);
              [v50 appendFormat:@" %@", v56];
            }
            id v52 = [v51 countByEnumeratingWithState:&v78 objects:v114 count:16];
          }
          while (v52);
        }

        if (os_log_type_enabled(oslog, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 138412290;
          id v119 = v50;
          _os_log_debug_impl((void *)&_mh_execute_header, oslog, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
        }
        [v69 setObject:v51 forKeyedSubscript:v77];
      }
      id v46 = [v76 countByEnumeratingWithState:&v84 objects:v115 count:16];
    }
    while (v46);
  }

  id v57 = v107[5];
  if (v57) {
    goto LABEL_61;
  }
  if ([v69 count])
  {
    id v57 = v107[5];
LABEL_61:
    id v58 = v57;
    goto LABEL_62;
  }
  id v60 = objc_alloc((Class)NSError);
  NSErrorUserInfoKey v112 = NSLocalizedDescriptionKey;
  CFStringRef v113 = @"No assets found";
  uint64_t v61 = +[NSDictionary dictionaryWithObjects:&v113 forKeys:&v112 count:1];
  id v58 = [v60 initWithDomain:v66 code:3 userInfo:v61];

LABEL_62:
  _Block_object_dispose(&v106, 8);

  return v58;
}

- (NSString)filePath
{
  return self->_filePath;
}

- (void)setFilePath:(id)a3
{
}

- (NSData)payload
{
  return self->_payload;
}

- (OS_os_log)logHandle
{
  return self->_logHandle;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_logHandle, 0);
  objc_storeStrong((id *)&self->_payload, 0);
  objc_storeStrong((id *)&self->_filePath, 0);
}

@end