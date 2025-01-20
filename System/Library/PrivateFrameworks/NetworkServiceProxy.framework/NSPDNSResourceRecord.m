@interface NSPDNSResourceRecord
+ (id)typeToString:(int64_t)a3;
- (NSString)name;
- (NSString)resourceString;
- (id)copyStateDictionary;
- (id)initFromByteParser:(id)a3;
- (int64_t)recordClass;
- (int64_t)type;
- (unint64_t)dataLength;
- (unint64_t)timeToLive;
@end

@implementation NSPDNSResourceRecord

- (id)initFromByteParser:(id)a3
{
  id v4 = a3;
  char v46 = 1;
  v45.receiver = self;
  v45.super_class = (Class)NSPDNSResourceRecord;
  v5 = [(NSPDNSResourceRecord *)&v45 init];
  if (!v5) {
    goto LABEL_24;
  }
  uint64_t v6 = [v4 parseDomainName];
  name = v5->_name;
  v5->_name = (NSString *)v6;

  if (!v5->_name)
  {
    v12 = nplog_obj();
    if (!os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
      goto LABEL_23;
    }
    *(_WORD *)buf = 0;
    v13 = "Failed to parse RR name";
LABEL_22:
    _os_log_error_impl(&dword_1A0FEE000, v12, OS_LOG_TYPE_ERROR, v13, buf, 2u);
    goto LABEL_23;
  }
  v5->_int64_t type = [v4 parse16Bits:&v46];
  if (!v46)
  {
    v12 = nplog_obj();
    if (!os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
      goto LABEL_23;
    }
    *(_WORD *)buf = 0;
    v13 = "Failed to parse RR type";
    goto LABEL_22;
  }
  v5->_recordClass = [v4 parse16Bits:&v46];
  if (!v46)
  {
    v12 = nplog_obj();
    if (!os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
      goto LABEL_23;
    }
    *(_WORD *)buf = 0;
    v13 = "Failed to parse RR class";
    goto LABEL_22;
  }
  v5->_timeToLive = [v4 parse32Bits:&v46];
  if (!v46)
  {
    v12 = nplog_obj();
    if (!os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
      goto LABEL_23;
    }
    *(_WORD *)buf = 0;
    v13 = "Failed to parse RR TTL";
    goto LABEL_22;
  }
  unint64_t v8 = [v4 parse16Bits:&v46];
  v5->_dataLength = v8;
  if (!v46)
  {
    v12 = nplog_obj();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      v13 = "Failed to parse RR length";
      goto LABEL_22;
    }
LABEL_23:

LABEL_24:
    v14 = 0;
    goto LABEL_25;
  }
  int64_t type = v5->_type;
  switch(type)
  {
    case 1:
      if (v8 != 4) {
        goto LABEL_24;
      }
      uint64_t v10 = [v4 parseAddressWithFamily:2];
      resourceString = v5->_resourceString;
      v5->_resourceString = (NSString *)v10;

      if (v5->_resourceString) {
        goto LABEL_73;
      }
      v12 = nplog_obj();
      if (!os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
        goto LABEL_23;
      }
      *(_WORD *)buf = 0;
      v13 = "Failed to parse RR A address";
      goto LABEL_22;
    case 2:
      uint64_t v18 = [v4 parseDomainName];
      v19 = v5->_resourceString;
      v5->_resourceString = (NSString *)v18;

      if (v5->_resourceString) {
        goto LABEL_73;
      }
      v12 = nplog_obj();
      if (!os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
        goto LABEL_23;
      }
      *(_WORD *)buf = 0;
      v13 = "Failed to parse RR NS";
      goto LABEL_22;
    case 3:
    case 4:
    case 7:
    case 8:
    case 9:
    case 10:
    case 11:
      goto LABEL_74;
    case 5:
      uint64_t v20 = [v4 parseDomainName];
      v21 = v5->_resourceString;
      v5->_resourceString = (NSString *)v20;

      if (v5->_resourceString) {
        goto LABEL_73;
      }
      v12 = nplog_obj();
      if (!os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
        goto LABEL_23;
      }
      *(_WORD *)buf = 0;
      v13 = "Failed to parse RR CNAME";
      goto LABEL_22;
    case 6:
      uint64_t v22 = [v4 parseDomainName];
      if (v22)
      {
        v23 = (void *)v22;
        v24 = [v4 parseDomainName];
        if (!v24)
        {
          v41 = nplog_obj();
          if (os_log_type_enabled(v41, OS_LOG_TYPE_ERROR))
          {
            *(_WORD *)buf = 0;
            _os_log_error_impl(&dword_1A0FEE000, v41, OS_LOG_TYPE_ERROR, "Failed to parse RR SOA responsible name", buf, 2u);
          }

          char v46 = 0;
          goto LABEL_71;
        }
        uint64_t v25 = [v4 parse32Bits:&v46];
        if (v46)
        {
          uint64_t v26 = v25;
          uint64_t v27 = [v4 parse32Bits:&v46];
          if (v46)
          {
            uint64_t v28 = v27;
            uint64_t v29 = [v4 parse32Bits:&v46];
            if (v46)
            {
              uint64_t v30 = v29;
              uint64_t v31 = [v4 parse32Bits:&v46];
              if (v46)
              {
                uint64_t v32 = v31;
                uint64_t v33 = [v4 parse32Bits:&v46];
                if (v46)
                {
                  uint64_t v34 = [[NSString alloc] initWithFormat:@"%@ %@ %u %u %u %u %u", v23, v24, v26, v28, v30, v32, v33];
                  v35 = v5->_resourceString;
                  v5->_resourceString = (NSString *)v34;

LABEL_71:
                  goto LABEL_72;
                }
                v42 = nplog_obj();
                if (os_log_type_enabled(v42, OS_LOG_TYPE_ERROR))
                {
                  *(_WORD *)buf = 0;
                  v43 = "Failed to parse RR SOA minimum TTL";
                  goto LABEL_69;
                }
LABEL_70:

                goto LABEL_71;
              }
              v42 = nplog_obj();
              if (!os_log_type_enabled(v42, OS_LOG_TYPE_ERROR)) {
                goto LABEL_70;
              }
              *(_WORD *)buf = 0;
              v43 = "Failed to parse RR SOA expire interval";
            }
            else
            {
              v42 = nplog_obj();
              if (!os_log_type_enabled(v42, OS_LOG_TYPE_ERROR)) {
                goto LABEL_70;
              }
              *(_WORD *)buf = 0;
              v43 = "Failed to parse RR SOA retry interval";
            }
          }
          else
          {
            v42 = nplog_obj();
            if (!os_log_type_enabled(v42, OS_LOG_TYPE_ERROR)) {
              goto LABEL_70;
            }
            *(_WORD *)buf = 0;
            v43 = "Failed to parse RR SOA refresh interval";
          }
        }
        else
        {
          v42 = nplog_obj();
          if (!os_log_type_enabled(v42, OS_LOG_TYPE_ERROR)) {
            goto LABEL_70;
          }
          *(_WORD *)buf = 0;
          v43 = "Failed to parse RR SOA serial number";
        }
LABEL_69:
        _os_log_error_impl(&dword_1A0FEE000, v42, OS_LOG_TYPE_ERROR, v43, buf, 2u);
        goto LABEL_70;
      }
      v40 = nplog_obj();
      if (os_log_type_enabled(v40, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_error_impl(&dword_1A0FEE000, v40, OS_LOG_TYPE_ERROR, "Failed to parse RR SOA main name", buf, 2u);
      }

      v23 = 0;
      char v46 = 0;
LABEL_72:

LABEL_73:
      if (!v46) {
        goto LABEL_24;
      }
LABEL_74:
      v14 = v5;
      break;
    case 12:
      uint64_t v36 = [v4 parseDomainName];
      v37 = v5->_resourceString;
      v5->_resourceString = (NSString *)v36;

      if (v5->_resourceString) {
        goto LABEL_73;
      }
      v12 = nplog_obj();
      if (!os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
        goto LABEL_23;
      }
      *(_WORD *)buf = 0;
      v13 = "Failed to parse RR PTR";
      goto LABEL_22;
    default:
      if (type == 16)
      {
        uint64_t v38 = objc_msgSend(v4, "parseBytes:");
        if (v38)
        {
          uint64_t v39 = [[NSString alloc] initWithBytes:v38 length:v5->_dataLength encoding:4];
          v23 = v5->_resourceString;
          v5->_resourceString = (NSString *)v39;
          goto LABEL_72;
        }
        v12 = nplog_obj();
        if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
        {
          *(_WORD *)buf = 0;
          v13 = "Failed to parse RR TXT";
          goto LABEL_22;
        }
      }
      else
      {
        if (type != 28) {
          goto LABEL_74;
        }
        if (v8 != 16) {
          goto LABEL_24;
        }
        uint64_t v16 = [v4 parseAddressWithFamily:30];
        v17 = v5->_resourceString;
        v5->_resourceString = (NSString *)v16;

        if (v5->_resourceString) {
          goto LABEL_73;
        }
        v12 = nplog_obj();
        if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
        {
          *(_WORD *)buf = 0;
          v13 = "Failed to parse RR AAAA address";
          goto LABEL_22;
        }
      }
      goto LABEL_23;
  }
LABEL_25:

  return v14;
}

- (id)copyStateDictionary
{
  v3 = [(NSPDNSResourceRecord *)self resourceString];

  if (!v3) {
    return 0;
  }
  id v4 = objc_msgSend(objc_alloc(NSNumber), "initWithUnsignedInteger:", -[NSPDNSResourceRecord timeToLive](self, "timeToLive"));
  id v5 = objc_alloc(MEMORY[0x1E4F1C9E8]);
  uint64_t v6 = [(NSPDNSResourceRecord *)self name];
  v7 = +[NSPDNSResourceRecord typeToString:[(NSPDNSResourceRecord *)self type]];
  unint64_t v8 = [(NSPDNSResourceRecord *)self resourceString];
  v9 = objc_msgSend(v5, "initWithObjectsAndKeys:", v6, @"name", v7, @"type", v8, @"resource", v4, @"ttl", 0);

  return v9;
}

+ (id)typeToString:(int64_t)a3
{
  id result = @"Unknown";
  switch(a3)
  {
    case 1:
      id result = @"A";
      break;
    case 2:
      id result = @"NS";
      break;
    case 3:
    case 4:
    case 7:
    case 8:
    case 9:
    case 10:
      return result;
    case 5:
      id result = @"CNAME";
      break;
    case 6:
      id result = @"SOA";
      break;
    case 11:
      id result = @"SRV";
      break;
    case 12:
      id result = @"PTR";
      break;
    case 13:
      id result = @"INFO";
      break;
    case 14:
      id result = @"MBOX";
      break;
    case 15:
      id result = @"MEXG";
      break;
    case 16:
      id result = @"TXT";
      break;
    default:
      id v4 = @"*";
      if (a3 != 255) {
        id v4 = @"Unknown";
      }
      if (a3 == 28) {
        id result = @"AAAA";
      }
      else {
        id result = v4;
      }
      break;
  }
  return result;
}

- (int64_t)type
{
  return self->_type;
}

- (NSString)name
{
  return (NSString *)objc_getProperty(self, a2, 16, 1);
}

- (int64_t)recordClass
{
  return self->_recordClass;
}

- (unint64_t)timeToLive
{
  return self->_timeToLive;
}

- (unint64_t)dataLength
{
  return self->_dataLength;
}

- (NSString)resourceString
{
  return (NSString *)objc_getProperty(self, a2, 48, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_resourceString, 0);
  objc_storeStrong((id *)&self->_name, 0);
}

@end