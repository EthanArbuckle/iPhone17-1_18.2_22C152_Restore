@interface NFNdefTagAgent
- (NFNdefTagAgent)init;
- (id)handleAPDU:(id)a3;
- (id)handleSelect:(id)a3;
- (void)handleDeselect;
@end

@implementation NFNdefTagAgent

- (NFNdefTagAgent)init
{
  v6.receiver = self;
  v6.super_class = (Class)NFNdefTagAgent;
  v2 = [(NFNdefTagAgent *)&v6 init];
  if (v2)
  {
    id v3 = objc_alloc_init((Class)NSMutableDictionary);
    v4 = (void *)*((void *)v2 + 2);
    *((void *)v2 + 2) = v3;

    *((_WORD *)v2 + 12) = -28672;
    *(_DWORD *)(v2 + 30) = 0x2000;
  }
  return (NFNdefTagAgent *)v2;
}

- (id)handleSelect:(id)a3
{
  id v5 = a3;
  objc_super v6 = +[NSData NF_dataWithHexString:@"D2760000850101"];
  v7 = [v5 payload];

  LODWORD(v5) = [v6 isEqualToData:v7];
  if (v5)
  {
    *(_WORD *)&self->_isSelected = 1;
    self->_tagWritten = 0;
    *(_WORD *)buf = 144;
    self->_lastStatus = 144;
    id v8 = [objc_alloc((Class)NSData) initWithBytes:buf length:2];
    v9 = +[NFResponseAPDU responseWithData:v8];
  }
  else
  {
    dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    uint64_t Logger = NFLogGetLogger();
    if (Logger)
    {
      v11 = (void (*)(uint64_t, const char *, ...))Logger;
      Class = object_getClass(self);
      BOOL isMetaClass = class_isMetaClass(Class);
      ClassName = object_getClassName(self);
      Name = sel_getName(a2);
      uint64_t v15 = 45;
      if (isMetaClass) {
        uint64_t v15 = 43;
      }
      v11(3, "%c[%{public}s %{public}s]:%i unhandled AID", v15, ClassName, Name, 91);
    }
    dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    v16 = NFSharedLogGetLogger();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    {
      v17 = object_getClass(self);
      if (class_isMetaClass(v17)) {
        int v18 = 43;
      }
      else {
        int v18 = 45;
      }
      *(_DWORD *)buf = 67109890;
      int v22 = v18;
      __int16 v23 = 2082;
      v24 = object_getClassName(self);
      __int16 v25 = 2082;
      v26 = sel_getName(a2);
      __int16 v27 = 1024;
      int v28 = 91;
      _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i unhandled AID", buf, 0x22u);
    }

    v9 = 0;
  }

  return v9;
}

- (id)handleAPDU:(id)a3
{
  id v5 = a3;
  self->_lastStatus = -28672;
  id v6 = v5;
  if (![v6 clss]
    && [v6 instruction] == 164
    && ![v6 p1]
    && [v6 p2] == 12)
  {

    v7 = [v6 payload];
    [v7 NF_asHexString];
    id v8 = (id)objc_claimAutoreleasedReturnValue();

    if (([v8 isEqualToString:@"E103"] & 1) != 0
      || [v8 isEqualToString:@"E104"])
    {
      objc_storeStrong((id *)&self->_selectedFile, v8);
      unsigned int v9 = 36864;
    }
    else
    {
      dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
      uint64_t Logger = NFLogGetLogger();
      if (Logger)
      {
        v91 = (void (*)(uint64_t, const char *, ...))Logger;
        Class = object_getClass(self);
        BOOL isMetaClass = class_isMetaClass(Class);
        ClassName = object_getClassName(self);
        Name = sel_getName("_handleSelectCommand:");
        uint64_t v95 = 45;
        if (isMetaClass) {
          uint64_t v95 = 43;
        }
        v91(4, "%c[%{public}s %{public}s]:%i Unsupported file id requested", v95, ClassName, Name, 144);
      }
      dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
      v96 = NFSharedLogGetLogger();
      if (os_log_type_enabled(v96, OS_LOG_TYPE_ERROR))
      {
        v97 = object_getClass(self);
        if (class_isMetaClass(v97)) {
          int v98 = 43;
        }
        else {
          int v98 = 45;
        }
        *(_DWORD *)buf = 67109890;
        int v107 = v98;
        __int16 v108 = 2082;
        v109 = object_getClassName(self);
        __int16 v110 = 2082;
        v111 = sel_getName("_handleSelectCommand:");
        __int16 v112 = 1024;
        int v113 = 144;
        _os_log_impl((void *)&_mh_execute_header, v96, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i Unsupported file id requested", buf, 0x22u);
      }

      unsigned int v9 = 27266;
    }
    self->_lastStatus = v9;
    *(_WORD *)buf = __rev16(v9);
    id v99 = [objc_alloc((Class)NSData) initWithBytes:buf length:2];
    v34 = +[NFResponseAPDU responseWithData:v99];

    goto LABEL_79;
  }

  id v10 = v6;
  if (![v10 clss] && objc_msgSend(v10, "instruction") == 176)
  {

    id v8 = v10;
    __int16 v105 = -28672;
    unsigned int v11 = [v8 p1];
    unsigned int v12 = [v8 p2];
    unsigned __int16 v13 = (unsigned __int16)[v8 lengthExpected];
    if (self->_selectedFile)
    {
      unsigned __int16 v14 = v13;
      uint64_t v15 = -[NSMutableDictionary objectForKeyedSubscript:](self->_files, "objectForKeyedSubscript:");
      v16 = objc_opt_new();
      if (v15)
      {
        uint64_t v17 = v12 | (v11 << 8);
        if ((unint64_t)[v15 length] > v17
          && (unint64_t)[v15 length] < v17 + v14)
        {
          unsigned __int16 v14 = (unsigned __int16)[v15 length] - v17;
        }
        if (v14)
        {
          int v18 = [v15 subdataWithRange:v17, v14];
          [v16 appendData:v18];

          if ([(NSString *)self->_selectedFile isEqualToString:@"E104"])
          {
            self->_tagRead = 1;
            if (v14 + v17 >= self->_ndefPayloadSize) {
              [(NFNdefTagAgentDelegate *)self->_delegate handleNdefTagRead];
            }
          }
        }
        unsigned int v19 = 36864;
LABEL_46:
        self->_lastStatus = v19;
        __int16 v105 = __rev16(v19);
        [v16 appendBytes:&v105 length:2];
        v34 = +[NFResponseAPDU responseWithData:v16];

        goto LABEL_79;
      }
    }
    else
    {
      v16 = objc_opt_new();
    }
    dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    uint64_t v35 = NFLogGetLogger();
    if (v35)
    {
      v36 = (void (*)(uint64_t, const char *, ...))v35;
      v37 = object_getClass(self);
      BOOL v38 = class_isMetaClass(v37);
      v39 = object_getClassName(self);
      v102 = sel_getName("_handleReadBinaryCommand:");
      uint64_t v40 = 45;
      if (v38) {
        uint64_t v40 = 43;
      }
      v36(3, "%c[%{public}s %{public}s]:%i no file selected", v40, v39, v102, 176);
    }
    dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    v41 = NFSharedLogGetLogger();
    if (os_log_type_enabled(v41, OS_LOG_TYPE_ERROR))
    {
      v42 = object_getClass(self);
      if (class_isMetaClass(v42)) {
        int v43 = 43;
      }
      else {
        int v43 = 45;
      }
      *(_DWORD *)buf = 67109890;
      int v107 = v43;
      __int16 v108 = 2082;
      v109 = object_getClassName(self);
      __int16 v110 = 2082;
      v111 = sel_getName("_handleReadBinaryCommand:");
      __int16 v112 = 1024;
      int v113 = 176;
      _os_log_impl((void *)&_mh_execute_header, v41, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i no file selected", buf, 0x22u);
    }

    uint64_t v15 = 0;
    unsigned int v19 = 27266;
    goto LABEL_46;
  }

  id v20 = v10;
  if (![v20 clss] && objc_msgSend(v20, "instruction") == 214)
  {

    id v8 = v20;
    __int16 v105 = -28672;
    unsigned int v21 = [v8 p1];
    unsigned int v22 = [v8 p2];
    selectedFile = self->_selectedFile;
    if (selectedFile)
    {
      unsigned int v24 = [(NSString *)selectedFile isEqualToString:@"E104"];
      if (v24)
      {
        unsigned int v25 = 36864;
      }
      else
      {
        unsigned int v25 = 27266;
        __int16 v105 = 27266;
      }
      v45 = [(NSMutableDictionary *)self->_files objectForKeyedSubscript:self->_selectedFile];
      v44 = objc_opt_new();
      if (!v24) {
        goto LABEL_78;
      }
    }
    else
    {
      v44 = objc_opt_new();
      v45 = 0;
      unsigned int v25 = 36864;
    }
    uint64_t v46 = v22 | (v21 << 8);
    if ([v8 payloadLength] + v46 > self->_maxTagSize)
    {
      dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
      uint64_t v47 = NFLogGetLogger();
      if (v47)
      {
        v48 = (void (*)(uint64_t, const char *, ...))v47;
        v49 = object_getClass(self);
        BOOL v50 = class_isMetaClass(v49);
        v51 = object_getClassName(self);
        v52 = sel_getName("_handleUpdateBinaryCommand:");
        uint64_t v53 = 45;
        if (v50) {
          uint64_t v53 = 43;
        }
        v48(3, "%c[%{public}s %{public}s]:%i Payload exceeds max tag size: %d", v53, v51, v52, 233, self->_maxTagSize);
      }
      dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
      v54 = NFSharedLogGetLogger();
      if (os_log_type_enabled(v54, OS_LOG_TYPE_ERROR))
      {
        v55 = object_getClass(self);
        if (class_isMetaClass(v55)) {
          int v56 = 43;
        }
        else {
          int v56 = 45;
        }
        v57 = object_getClassName(self);
        v58 = sel_getName("_handleUpdateBinaryCommand:");
        int maxTagSize = self->_maxTagSize;
        *(_DWORD *)buf = 67110146;
        int v107 = v56;
        __int16 v108 = 2082;
        v109 = v57;
        __int16 v110 = 2082;
        v111 = v58;
        __int16 v112 = 1024;
        int v113 = 233;
        __int16 v114 = 1024;
        LODWORD(v115[0]) = maxTagSize;
        _os_log_impl((void *)&_mh_execute_header, v54, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i Payload exceeds max tag size: %d", buf, 0x28u);
      }
LABEL_77:

      unsigned int v25 = 27264;
LABEL_78:
      self->_lastStatus = v25;
      __int16 v105 = __rev16(v25);
      [v44 appendBytes:&v105 length:2];
      v34 = +[NFResponseAPDU responseWithData:v44];

      goto LABEL_79;
    }
    id v60 = [v45 length];
    unsigned int v61 = [v8 payloadLength];
    v104 = v45;
    if ((unint64_t)v60 >= v46)
    {
      unint64_t v63 = v61 + v46;
      id v64 = [v45 length];
      id v65 = objc_alloc((Class)NSMutableData);
      v66 = v65;
      if ((unint64_t)v64 <= v63)
      {
        v71 = [v45 subdataWithRange:0, v46];
        id v62 = [v66 initWithData:v71];

        id v68 = [v8 payload];
        [v62 appendData:v68];
        goto LABEL_66;
      }
      id v62 = [v65 initWithData:v45];
    }
    else
    {
      id v62 = [objc_alloc((Class)NSMutableData) initWithLength:(unsigned __int16)(v46 + v61)];
      [v62 replaceBytesInRange:0, [v45 length], [v45 bytes]];
    }
    uint64_t v67 = [v8 payloadLength];
    id v68 = [v8 payload];
    id v69 = [v68 bytes];
    uint64_t v70 = v67;
    v45 = v104;
    [v62 replaceBytesInRange:v46 withBytes:v70 length:v69];
LABEL_66:

    [(NSMutableDictionary *)self->_files setObject:v62 forKey:@"E104"];
    id v72 = objc_alloc((Class)NSData);
    v54 = v62;
    id v73 = [v72 initWithBytes:-[NSObject bytes](v54, "bytes") length:2];
    uint64_t v74 = __rev16(*(unsigned __int16 *)[v73 bytes]);
    if (v74 <= self->_maxTagSize)
    {
      self->_ndefPayloadSize = v74;

      if (v25 == 36864) {
        self->_tagWritten = 1;
      }
      goto LABEL_78;
    }
    dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    uint64_t v75 = NFLogGetLogger();
    if (v75)
    {
      v76 = (void (*)(uint64_t, const char *, ...))v75;
      v77 = object_getClass(self);
      BOOL v78 = class_isMetaClass(v77);
      v79 = object_getClassName(self);
      v80 = sel_getName("_handleUpdateBinaryCommand:");
      BOOL v81 = !v78;
      v45 = v104;
      uint64_t v82 = 45;
      if (!v81) {
        uint64_t v82 = 43;
      }
      v76(3, "%c[%{public}s %{public}s]:%i Payload length %d exceeds max tag size: %d", v82, v79, v80, 276, v74, self->_maxTagSize);
    }
    dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    v83 = NFSharedLogGetLogger();
    if (os_log_type_enabled(v83, OS_LOG_TYPE_ERROR))
    {
      v84 = object_getClass(self);
      if (class_isMetaClass(v84)) {
        int v85 = 43;
      }
      else {
        int v85 = 45;
      }
      v86 = object_getClassName(self);
      v87 = sel_getName("_handleUpdateBinaryCommand:");
      int v88 = self->_maxTagSize;
      *(_DWORD *)buf = 67110402;
      int v107 = v85;
      v45 = v104;
      __int16 v108 = 2082;
      v109 = v86;
      __int16 v110 = 2082;
      v111 = v87;
      __int16 v112 = 1024;
      int v113 = 276;
      __int16 v114 = 1024;
      LODWORD(v115[0]) = v74;
      WORD2(v115[0]) = 1024;
      *(_DWORD *)((char *)v115 + 6) = v88;
      _os_log_impl((void *)&_mh_execute_header, v83, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i Payload length %d exceeds max tag size: %d", buf, 0x2Eu);
    }

    self->_ndefPayloadSize = 0;
    goto LABEL_77;
  }

  dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
  uint64_t v26 = NFLogGetLogger();
  if (v26)
  {
    __int16 v27 = (void (*)(uint64_t, const char *, ...))v26;
    int v28 = object_getClass(self);
    BOOL v29 = class_isMetaClass(v28);
    v100 = object_getClassName(self);
    v101 = sel_getName(a2);
    uint64_t v30 = 45;
    if (v29) {
      uint64_t v30 = 43;
    }
    v27(3, "%c[%{public}s %{public}s]:%i Unhandled command: %{public}@", v30, v100, v101, 109, v20);
  }
  dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
  v31 = NFSharedLogGetLogger();
  if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR))
  {
    v32 = object_getClass(self);
    if (class_isMetaClass(v32)) {
      int v33 = 43;
    }
    else {
      int v33 = 45;
    }
    *(_DWORD *)buf = 67110146;
    int v107 = v33;
    __int16 v108 = 2082;
    v109 = object_getClassName(self);
    __int16 v110 = 2082;
    v111 = sel_getName(a2);
    __int16 v112 = 1024;
    int v113 = 109;
    __int16 v114 = 2114;
    v115[0] = v20;
    _os_log_impl((void *)&_mh_execute_header, v31, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i Unhandled command: %{public}@", buf, 0x2Cu);
  }

  *(_WORD *)buf = -32406;
  id v8 = [objc_alloc((Class)NSData) initWithBytes:buf length:2];
  v34 = +[NFResponseAPDU responseWithData:v8];
LABEL_79:

  return v34;
}

- (void)handleDeselect
{
  self->_isSelected = 0;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_files, 0);

  objc_storeStrong((id *)&self->_selectedFile, 0);
}

@end