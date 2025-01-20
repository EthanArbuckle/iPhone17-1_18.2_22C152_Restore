@interface NSPDNSPacket
- (BOOL)isAuthoritativeAnswer;
- (BOOL)isRecursionAvailable;
- (BOOL)isRecursionDesired;
- (BOOL)isTruncated;
- (NSArray)additionalRecords;
- (NSArray)answers;
- (NSArray)authorities;
- (NSArray)queries;
- (NSData)data;
- (NSDate)timestamp;
- (NSString)responseCodeString;
- (id)initFromData:(id)a3;
- (int64_t)identifier;
- (int64_t)messageType;
- (int64_t)opCode;
- (int64_t)responseCode;
@end

@implementation NSPDNSPacket

- (id)initFromData:(id)a3
{
  uint64_t v62 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  char v59 = 1;
  v58.receiver = self;
  v58.super_class = (Class)NSPDNSPacket;
  v6 = [(NSPDNSPacket *)&v58 init];
  if (!v6)
  {
    v18 = 0;
    v26 = 0;
    v30 = 0;
    v34 = 0;
    v9 = 0;
    goto LABEL_31;
  }
  v7 = (NSDate *)objc_alloc_init(MEMORY[0x1E4F1C9C8]);
  timestamp = v6->_timestamp;
  v6->_timestamp = v7;

  objc_storeStrong((id *)&v6->_data, a3);
  v9 = [[NSPByteParser alloc] initWithData:v5];
  v6->_identifier = [(NSPByteParser *)v9 parse16Bits:&v59];
  if (!v59)
  {
    p_super = nplog_obj();
    if (!os_log_type_enabled(p_super, OS_LOG_TYPE_ERROR)) {
      goto LABEL_45;
    }
    *(_WORD *)buf = 0;
    v36 = "Failed to parse DNS packet identifier";
LABEL_44:
    _os_log_error_impl(&dword_1A0FEE000, p_super, OS_LOG_TYPE_ERROR, v36, buf, 2u);
    goto LABEL_45;
  }
  unsigned int v10 = [(NSPByteParser *)v9 parse16Bits:&v59];
  if (!v59)
  {
    p_super = nplog_obj();
    if (!os_log_type_enabled(p_super, OS_LOG_TYPE_ERROR)) {
      goto LABEL_45;
    }
    *(_WORD *)buf = 0;
    v36 = "Failed to parse DNS packet flags";
    goto LABEL_44;
  }
  v6->_messageType = v10 >> 15;
  v6->_opCode = (v10 >> 11) & 0xF;
  v6->_isAuthoritativeAnswer = (v10 & 0x400) != 0;
  v6->_isTruncated = (v10 & 0x200) != 0;
  v6->_isRecursionDesired = BYTE1(v10) & 1;
  v6->_isRecursionAvailable = (v10 & 0x80) != 0;
  v6->_responseCode = v10 & 0xF;
  unsigned int v11 = [(NSPByteParser *)v9 parse16Bits:&v59];
  if (!v59)
  {
    p_super = nplog_obj();
    if (!os_log_type_enabled(p_super, OS_LOG_TYPE_ERROR)) {
      goto LABEL_45;
    }
    *(_WORD *)buf = 0;
    v36 = "Failed to parse DNS packet query count";
    goto LABEL_44;
  }
  unsigned int v12 = v11;
  unsigned int v13 = [(NSPByteParser *)v9 parse16Bits:&v59];
  if (!v59)
  {
    p_super = nplog_obj();
    if (!os_log_type_enabled(p_super, OS_LOG_TYPE_ERROR)) {
      goto LABEL_45;
    }
    *(_WORD *)buf = 0;
    v36 = "Failed to parse DNS packet answer count";
    goto LABEL_44;
  }
  unsigned int v14 = v13;
  unsigned int v15 = [(NSPByteParser *)v9 parse16Bits:&v59];
  if (!v59)
  {
    p_super = nplog_obj();
    if (!os_log_type_enabled(p_super, OS_LOG_TYPE_ERROR)) {
      goto LABEL_45;
    }
    *(_WORD *)buf = 0;
    v36 = "Failed to parse DNS packet authority count";
    goto LABEL_44;
  }
  unsigned int v16 = v15;
  unsigned int v17 = [(NSPByteParser *)v9 parse16Bits:&v59];
  if (!v59)
  {
    p_super = nplog_obj();
    if (os_log_type_enabled(p_super, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      v36 = "Failed to parse DNS packet additional record count";
      goto LABEL_44;
    }
LABEL_45:
    v34 = 0;
    v30 = 0;
    v26 = 0;
    v18 = 0;
    goto LABEL_46;
  }
  unsigned int v56 = v17;
  unsigned int v57 = v16;
  v18 = 0;
  if (!v12)
  {
LABEL_17:
    v26 = 0;
    if (v14)
    {
      int v27 = 0;
      while (1)
      {
        id v28 = [[NSPDNSResourceRecord alloc] initFromByteParser:v9];
        if (!v28) {
          break;
        }
        v29 = v28;
        if (!v26) {
          v26 = (void *)[objc_alloc(MEMORY[0x1E4F1CA48]) initWithCapacity:v14];
        }
        [v26 addObject:v29];

        if (++v27 >= v14) {
          goto LABEL_23;
        }
      }
      v38 = nplog_obj();
      if (os_log_type_enabled(v38, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 67109120;
        int v61 = v27;
        _os_log_error_impl(&dword_1A0FEE000, v38, OS_LOG_TYPE_ERROR, "Failed to parse answer %u", buf, 8u);
      }

      v30 = 0;
    }
    else
    {
LABEL_23:
      if (!v57)
      {
        v30 = 0;
LABEL_58:
        if (!v56)
        {
          v34 = 0;
LABEL_74:
          uint64_t v47 = [objc_alloc(MEMORY[0x1E4F1C978]) initWithArray:v18];
          queries = v6->_queries;
          v6->_queries = (NSArray *)v47;

          uint64_t v49 = [objc_alloc(MEMORY[0x1E4F1C978]) initWithArray:v26];
          answers = v6->_answers;
          v6->_answers = (NSArray *)v49;

          uint64_t v51 = [objc_alloc(MEMORY[0x1E4F1C978]) initWithArray:v30];
          authorities = v6->_authorities;
          v6->_authorities = (NSArray *)v51;

          uint64_t v53 = [objc_alloc(MEMORY[0x1E4F1C978]) initWithArray:v34];
          p_super = &v6->_additionalRecords->super;
          v6->_additionalRecords = (NSArray *)v53;
          goto LABEL_46;
        }
        v34 = 0;
        int v43 = 0;
        while (1)
        {
          id v44 = [[NSPDNSResourceRecord alloc] initFromByteParser:v9];
          if (!v44) {
            break;
          }
          v45 = v44;
          if (!v34) {
            v34 = (void *)[objc_alloc(MEMORY[0x1E4F1CA48]) initWithCapacity:v56];
          }
          [v34 addObject:v45];

          if (++v43 >= v56) {
            goto LABEL_74;
          }
        }
        v54 = nplog_obj();
        if (os_log_type_enabled(v54, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 67109120;
          int v61 = v43;
          _os_log_error_impl(&dword_1A0FEE000, v54, OS_LOG_TYPE_ERROR, "Failed to parse additional record %u", buf, 8u);
        }

        goto LABEL_31;
      }
      v30 = 0;
      int v31 = 0;
      while (1)
      {
        id v32 = [[NSPDNSResourceRecord alloc] initFromByteParser:v9];
        if (!v32) {
          break;
        }
        v33 = v32;
        if (!v30) {
          v30 = (void *)[objc_alloc(MEMORY[0x1E4F1CA48]) initWithCapacity:v57];
        }
        [v30 addObject:v33];

        if (++v31 >= v57) {
          goto LABEL_58;
        }
      }
      v46 = nplog_obj();
      if (os_log_type_enabled(v46, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 67109120;
        int v61 = v31;
        _os_log_error_impl(&dword_1A0FEE000, v46, OS_LOG_TYPE_ERROR, "Failed to parse authority %u", buf, 8u);
      }
    }
    v34 = 0;
LABEL_31:
    v35 = 0;
    char v59 = 0;
    goto LABEL_49;
  }
  int v19 = 0;
  uint64_t v55 = v12;
  while (1)
  {
    p_super = [(NSPByteParser *)v9 parseDomainName];
    if (!p_super)
    {
      v39 = nplog_obj();
      if (!os_log_type_enabled(v39, OS_LOG_TYPE_ERROR)) {
        goto LABEL_68;
      }
      *(_DWORD *)buf = 67109120;
      int v61 = v19;
      v40 = "Failed to parse DNS packet query %u name";
      goto LABEL_81;
    }
    unsigned int v21 = [(NSPByteParser *)v9 parse16Bits:&v59];
    if (!v59)
    {
      v41 = nplog_obj();
      if (!os_log_type_enabled(v41, OS_LOG_TYPE_ERROR))
      {
LABEL_66:

        v34 = 0;
        v30 = 0;
        v26 = 0;
        goto LABEL_46;
      }
      *(_DWORD *)buf = 67109120;
      int v61 = v19;
      v42 = "Failed to parse DNS packet query %u type";
LABEL_79:
      _os_log_error_impl(&dword_1A0FEE000, v41, OS_LOG_TYPE_ERROR, v42, buf, 8u);
      goto LABEL_66;
    }
    unsigned int v22 = v21;
    unsigned int v23 = [(NSPByteParser *)v9 parse16Bits:&v59];
    if (!v59)
    {
      v41 = nplog_obj();
      if (!os_log_type_enabled(v41, OS_LOG_TYPE_ERROR)) {
        goto LABEL_66;
      }
      *(_DWORD *)buf = 67109120;
      int v61 = v19;
      v42 = "Failed to parse DNS packet query %u class";
      goto LABEL_79;
    }
    v24 = [[NSPDNSQuery alloc] initWithName:p_super recordType:v22 recordClass:v23];
    if (!v24) {
      break;
    }
    v25 = v24;
    if (!v18) {
      v18 = (void *)[objc_alloc(MEMORY[0x1E4F1CA48]) initWithCapacity:v55];
    }
    [v18 addObject:v25];

    if (++v19 >= v12) {
      goto LABEL_17;
    }
  }
  v39 = nplog_obj();
  if (!os_log_type_enabled(v39, OS_LOG_TYPE_ERROR)) {
    goto LABEL_68;
  }
  *(_DWORD *)buf = 67109120;
  int v61 = v19;
  v40 = "Failed to allocate a query object for query %u";
LABEL_81:
  _os_log_error_impl(&dword_1A0FEE000, v39, OS_LOG_TYPE_ERROR, v40, buf, 8u);
LABEL_68:

  v34 = 0;
  v30 = 0;
  v26 = 0;
  char v59 = 0;
LABEL_46:

  if (v59) {
    v35 = v6;
  }
  else {
    v35 = 0;
  }
LABEL_49:

  return v35;
}

- (NSString)responseCodeString
{
  unint64_t v2 = [(NSPDNSPacket *)self responseCode];
  if (v2 > 6) {
    return (NSString *)@"unknown";
  }
  else {
    return &off_1E5A3B678[v2]->isa;
  }
}

- (int64_t)identifier
{
  return self->_identifier;
}

- (NSDate)timestamp
{
  return (NSDate *)objc_getProperty(self, a2, 24, 1);
}

- (int64_t)messageType
{
  return self->_messageType;
}

- (int64_t)opCode
{
  return self->_opCode;
}

- (BOOL)isAuthoritativeAnswer
{
  return self->_isAuthoritativeAnswer;
}

- (BOOL)isTruncated
{
  return self->_isTruncated;
}

- (BOOL)isRecursionDesired
{
  return self->_isRecursionDesired;
}

- (BOOL)isRecursionAvailable
{
  return self->_isRecursionAvailable;
}

- (int64_t)responseCode
{
  return self->_responseCode;
}

- (NSArray)queries
{
  return (NSArray *)objc_getProperty(self, a2, 56, 1);
}

- (NSArray)answers
{
  return (NSArray *)objc_getProperty(self, a2, 64, 1);
}

- (NSArray)authorities
{
  return (NSArray *)objc_getProperty(self, a2, 72, 1);
}

- (NSArray)additionalRecords
{
  return (NSArray *)objc_getProperty(self, a2, 80, 1);
}

- (NSData)data
{
  return (NSData *)objc_getProperty(self, a2, 88, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_data, 0);
  objc_storeStrong((id *)&self->_additionalRecords, 0);
  objc_storeStrong((id *)&self->_authorities, 0);
  objc_storeStrong((id *)&self->_answers, 0);
  objc_storeStrong((id *)&self->_queries, 0);
  objc_storeStrong((id *)&self->_timestamp, 0);
}

@end