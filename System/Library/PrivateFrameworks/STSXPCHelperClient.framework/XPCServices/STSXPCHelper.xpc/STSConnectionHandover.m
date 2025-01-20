@interface STSConnectionHandover
+ (BOOL)supportsSecureCoding;
+ (id)_connectionHandoverWithNdefMessage:(id)a3;
+ (id)_createNdefWithType:(int64_t)a3 alternativeCarriers:(id)a4 errorRecord:(id)a5;
+ (id)connectionHandoverWithData:(id)a3;
+ (id)requestWithAlternativeCarriers:(id)a3;
+ (id)selectWithAlternativeCarriers:(id)a3 error:(id)a4;
- (BOOL)isEqual:(id)a3;
- (NSArray)alternativeCarriers;
- (STSConnectionHandover)init;
- (STSConnectionHandover)initWithCoder:(id)a3;
- (id)description;
- (unint64_t)majorVersion;
- (unint64_t)minorVersion;
- (void)addAlternativeCarrier:(id)a3;
- (void)encodeWithCoder:(id)a3;
@end

@implementation STSConnectionHandover

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  unint64_t majorVersion = self->_majorVersion;
  id v5 = a3;
  [v5 encodeInteger:majorVersion forKey:@"majorVersion"];
  [v5 encodeInteger:self->_minorVersion forKey:@"minorVersion"];
  [v5 encodeObject:self->_alternativeCarriers forKey:@"alternativeCarriers"];
}

- (STSConnectionHandover)initWithCoder:(id)a3
{
  id v4 = a3;
  v14.receiver = self;
  v14.super_class = (Class)STSConnectionHandover;
  id v5 = [(STSConnectionHandover *)&v14 init];
  if (v5)
  {
    v5->_unint64_t majorVersion = (int)[v4 decodeIntForKey:@"majorVersion"];
    v5->_minorVersion = (int)[v4 decodeIntForKey:@"minorVersion"];
    uint64_t v6 = objc_opt_class();
    uint64_t v7 = objc_opt_class();
    uint64_t v8 = objc_opt_class();
    uint64_t v9 = objc_opt_class();
    v10 = +[NSSet setWithObjects:](NSSet, "setWithObjects:", v6, v7, v8, v9, objc_opt_class(), 0);
    uint64_t v11 = [v4 decodeObjectOfClasses:v10 forKey:@"alternativeCarriers"];
    alternativeCarriers = v5->_alternativeCarriers;
    v5->_alternativeCarriers = (NSMutableArray *)v11;
  }
  return v5;
}

- (STSConnectionHandover)init
{
  v6.receiver = self;
  v6.super_class = (Class)STSConnectionHandover;
  v2 = [(STSConnectionHandover *)&v6 init];
  if (v2)
  {
    v3 = (NSMutableArray *)objc_alloc_init((Class)NSMutableArray);
    alternativeCarriers = v2->_alternativeCarriers;
    v2->_alternativeCarriers = v3;
  }
  return v2;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (STSConnectionHandover *)a3;
  id v5 = v4;
  if (v4 == self)
  {
    unsigned __int8 v11 = 1;
  }
  else if (v4 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    objc_super v6 = v5;
    id majorVersion = self->_majorVersion;
    if (majorVersion == (id)[(STSConnectionHandover *)v6 majorVersion]
      || (id minorVersion = self->_minorVersion,
          minorVersion == (id)[(STSConnectionHandover *)v6 minorVersion]))
    {
      alternativeCarriers = self->_alternativeCarriers;
      v10 = [(STSConnectionHandover *)v6 alternativeCarriers];
      unsigned __int8 v11 = [(NSMutableArray *)alternativeCarriers isEqualToArray:v10];
    }
    else
    {
      unsigned __int8 v11 = 0;
    }
  }
  else
  {
    unsigned __int8 v11 = 0;
  }

  return v11;
}

- (id)description
{
  return +[NSString stringWithFormat:@"majorVersion=%lu, minorVersion=%lu, ac=%@", self->_majorVersion, self->_minorVersion, self->_alternativeCarriers];
}

- (NSArray)alternativeCarriers
{
  return +[NSArray arrayWithArray:self->_alternativeCarriers];
}

- (void)addAlternativeCarrier:(id)a3
{
  if (a3) {
    -[NSMutableArray addObject:](self->_alternativeCarriers, "addObject:");
  }
}

+ (id)connectionHandoverWithData:(id)a3
{
  uint64_t v4 = +[STSNDEFRecord ndefRecordsWithData:a3];
  uint64_t v8 = (void *)v4;
  if (v4)
  {
    sub_100026000(OS_LOG_TYPE_INFO, 0, (uint64_t)"+[STSConnectionHandover connectionHandoverWithData:]", 154, @"NDEF:%@", v5, v6, v7, v4);
    uint64_t v9 = [a1 _connectionHandoverWithNdefMessage:v8];
  }
  else
  {
    sub_100026000(OS_LOG_TYPE_ERROR, 0, (uint64_t)"+[STSConnectionHandover connectionHandoverWithData:]", 148, @"Not a valid NDEF message", v5, v6, v7, v11);
    uint64_t v9 = 0;
  }

  return v9;
}

+ (id)_connectionHandoverWithNdefMessage:(id)a3
{
  id v3 = a3;
  v100 = +[NSMutableArray array];
  v92 = +[NSMutableDictionary dictionary];
  uint64_t v4 = +[NSMutableDictionary dictionary];
  long long v114 = 0u;
  long long v115 = 0u;
  long long v116 = 0u;
  long long v117 = 0u;
  id v5 = v3;
  id v6 = [v5 countByEnumeratingWithState:&v114 objects:v121 count:16];
  if (v6)
  {
    id v7 = v6;
    id obj = v5;
    unsigned __int8 v93 = 0;
    LOBYTE(v8) = 0;
    v101 = 0;
    BOOL v96 = 0;
    id v9 = *(id *)v115;
    id v87 = *(id *)v115;
    while (1)
    {
      uint64_t v10 = 0;
      id v89 = v7;
      do
      {
        if (*(id *)v115 != v9) {
          objc_enumerationMutation(obj);
        }
        uint64_t v11 = *(void **)(*((void *)&v114 + 1) + 8 * v10);
        unsigned int v12 = [v11 isHandoverSelectRecord];
        unsigned int v13 = [v11 isHandoverRequestRecord];
        uint64_t v98 = v10;
        if ((v12 & 1) != 0 || v13)
        {
          if (v96)
          {
            sub_100026000(OS_LOG_TYPE_ERROR, 0, (uint64_t)"+[STSConnectionHandover _connectionHandoverWithNdefMessage:]", 174, @"Previous Hr/Hs found.  Invalid handover NDEF", v14, v15, v16, v86);
            id v5 = obj;

            goto LABEL_71;
          }
          id v29 = [v11 payload];
          v30 = (unsigned __int8 *)[v29 bytes];

          v31 = [v11 payload];
          unsigned int v32 = [v31 length];

          unsigned int v94 = *v30;
          v33 = +[NSData dataWithBytes:v30 + 1 length:v32 - 1];
          v34 = +[STSNDEFRecord ndefRecordsWithData:v33];

          id v35 = [v34 count];
          BOOL v96 = v35 != 0;
          if (!v35) {
            sub_100026000(OS_LOG_TYPE_ERROR, 0, (uint64_t)"+[STSConnectionHandover _connectionHandoverWithNdefMessage:]", 193, @"Missing local records in Hr/Hs record", v36, v37, v38, v86);
          }
          long long v112 = 0u;
          long long v113 = 0u;
          long long v110 = 0u;
          long long v111 = 0u;
          id v39 = v34;
          id v40 = [v39 countByEnumeratingWithState:&v110 objects:v120 count:16];
          if (v40)
          {
            id v41 = v40;
            uint64_t v42 = *(void *)v111;
            do
            {
              v43 = 0;
              do
              {
                if (*(void *)v111 != v42) {
                  objc_enumerationMutation(v39);
                }
                v44 = *(void **)(*((void *)&v110 + 1) + 8 * (void)v43);
                if ([v44 typeNameFormat] == 1)
                {
                  if (([v44 isCollisionResolutionRecord] & 1) == 0)
                  {
                    if ([v44 isAlternativeCarrierRecord])
                    {
                      [v100 addObject:v44];
                    }
                    else if (([v44 isHandoverSelectErrorRecord] & v12) == 1)
                    {
                      id v49 = v44;

                      v101 = v49;
                    }
                    else
                    {
                      id v50 = objc_alloc((Class)NSString);
                      v51 = [v44 type];
                      id v52 = [v50 initWithData:v51 encoding:4];

                      sub_100026000(OS_LOG_TYPE_DEFAULT, 0, (uint64_t)"+[STSConnectionHandover _connectionHandoverWithNdefMessage:]", 211, @"Unsupported type:%@", v53, v54, v55, (uint64_t)v52);
                    }
                  }
                }
                else
                {
                  unsigned int v45 = [v44 typeNameFormat];
                  sub_100026000(OS_LOG_TYPE_DEFAULT, 0, (uint64_t)"+[STSConnectionHandover _connectionHandoverWithNdefMessage:]", 200, @"Unsupported record TNF:%d", v46, v47, v48, v45);
                }
                v43 = (char *)v43 + 1;
              }
              while (v41 != v43);
              id v56 = [v39 countByEnumeratingWithState:&v110 objects:v120 count:16];
              id v41 = v56;
            }
            while (v56);
          }
          unsigned int v8 = v94 >> 4;
          unsigned __int8 v93 = v94 & 0xF;

          id v9 = v87;
          id v7 = v89;
        }
        else
        {
          if (([v11 isWiFiAwareConfigurationRecord] & 1) == 0
            && ([v11 isBluetoothLEConfigurationRecord] & 1) == 0
            && ![v11 isNfcConfigurationRecord])
          {
            v57 = [v11 identifier];

            if (v57)
            {
              id v27 = [v11 identifier];
              v28 = v4;
              goto LABEL_15;
            }
            id v58 = objc_alloc((Class)NSString);
            v59 = [v11 type];
            id v27 = [v58 initWithData:v59 encoding:4];

            unsigned int v60 = [v11 typeNameFormat];
            sub_100026000(OS_LOG_TYPE_DEFAULT, 0, (uint64_t)"+[STSConnectionHandover _connectionHandoverWithNdefMessage:id=nil"], v61, v62, v63, v60);
LABEL_16:

            goto LABEL_38;
          }
          v17 = [v11 identifier];

          if (v17)
          {
            v21 = [v11 identifier];
            v22 = [v92 objectForKey:v21];

            if (v22)
            {
              v23 = [v11 identifier];
              sub_100026000(OS_LOG_TYPE_INFO, 0, (uint64_t)"+[STSConnectionHandover _connectionHandoverWithNdefMessage:]", 219, @"Carrier config %@ exists", v24, v25, v26, (uint64_t)v23);
            }
            id v27 = [v11 identifier];
            v28 = v92;
LABEL_15:
            [v28 setObject:v11 forKey:v27];
            goto LABEL_16;
          }
          sub_100026000(OS_LOG_TYPE_INFO, 0, (uint64_t)"+[STSConnectionHandover _connectionHandoverWithNdefMessage:]", 223, @"Missing ID", v18, v19, v20, v86);
        }
LABEL_38:
        uint64_t v10 = v98 + 1;
      }
      while ((id)(v98 + 1) != v7);
      id v64 = [obj countByEnumeratingWithState:&v114 objects:v121 count:16];
      id v7 = v64;
      if (!v64)
      {
        id v5 = obj;

        if (!v96) {
          goto LABEL_70;
        }
        v68 = objc_alloc_init(STSConnectionHandover);
        v68->_id majorVersion = v8;
        v68->_id minorVersion = v93;
        v90 = v68;
        long long v106 = 0u;
        long long v107 = 0u;
        long long v108 = 0u;
        long long v109 = 0u;
        id v88 = v100;
        id v97 = [v88 countByEnumeratingWithState:&v106 objects:v119 count:16];
        if (v97)
        {
          uint64_t v95 = *(void *)v107;
          do
          {
            for (i = 0; i != v97; i = (char *)i + 1)
            {
              if (*(void *)v107 != v95) {
                objc_enumerationMutation(v88);
              }
              v70 = *(void **)(*((void *)&v106 + 1) + 8 * i);
              v71 = [v70 getCarrierDataReferenceFromAlternativeCarrierRecord];
              if (v71)
              {
                v99 = [v92 objectForKeyedSubscript:v71];
                v72 = +[NSMutableArray array];
                v73 = [v70 getAuxiliaryDataReferencesFromAlternativeCarrierRecord];
                long long v102 = 0u;
                long long v103 = 0u;
                long long v104 = 0u;
                long long v105 = 0u;
                id v74 = [v73 countByEnumeratingWithState:&v102 objects:v118 count:16];
                if (v74)
                {
                  id v75 = v74;
                  uint64_t v76 = *(void *)v103;
                  do
                  {
                    for (j = 0; j != v75; j = (char *)j + 1)
                    {
                      if (*(void *)v103 != v76) {
                        objc_enumerationMutation(v73);
                      }
                      v78 = [v4 objectForKeyedSubscript:*(void *)(*((void *)&v102 + 1) + 8 * (void)j)];
                      if (v78) {
                        [v72 addObject:v78];
                      }
                    }
                    id v75 = [v73 countByEnumeratingWithState:&v102 objects:v118 count:16];
                  }
                  while (v75);
                }
                v79 = [[STSCHNdefRecordBundle alloc] initWithAlternativeRecord:v70 configurationRecord:v99 auxiliaryRecords:v72 errorRecord:v101];
                unsigned __int8 v80 = [v99 isWiFiAwareConfigurationRecord];
                v81 = &off_100054728;
                if ((v80 & 1) != 0
                  || (unsigned __int8 v82 = [v99 isBluetoothLEConfigurationRecord],
                      v81 = off_100054718,
                      (v82 & 1) != 0)
                  || (unsigned int v83 = [v99 isNfcConfigurationRecord], v81 = off_100054720, v83))
                {
                  v84 = [(__objc2_class *)*v81 connectionHandoverAlternativeCarrierWithBundle:v79];
                  [(STSConnectionHandover *)v90 addAlternativeCarrier:v84];
                }
              }
            }
            id v97 = [v88 countByEnumeratingWithState:&v106 objects:v119 count:16];
          }
          while (v97);
        }

        id v5 = obj;
        goto LABEL_72;
      }
    }
  }

  v101 = 0;
LABEL_70:
  sub_100026000(OS_LOG_TYPE_INFO, 0, (uint64_t)"+[STSConnectionHandover _connectionHandoverWithNdefMessage:]", 234, @"No Hr record found", v65, v66, v67, v86);
LABEL_71:
  v90 = 0;
LABEL_72:

  return v90;
}

+ (id)requestWithAlternativeCarriers:(id)a3
{
  return [a1 _createNdefWithType:0 alternativeCarriers:a3 errorRecord:0];
}

+ (id)selectWithAlternativeCarriers:(id)a3 error:(id)a4
{
  return [a1 _createNdefWithType:1 alternativeCarriers:a3 errorRecord:a4];
}

+ (id)_createNdefWithType:(int64_t)a3 alternativeCarriers:(id)a4 errorRecord:(id)a5
{
  id v7 = a4;
  id v31 = a5;
  if (a3) {
    unsigned int v8 = "Hs";
  }
  else {
    unsigned int v8 = "Hr";
  }
  v30 = +[NSData dataWithBytes:v8 length:2];
  char v37 = 21;
  id v9 = +[NSMutableData data];
  [v9 appendBytes:&v37 length:1];
  uint64_t v10 = +[NSMutableArray array];
  uint64_t v11 = +[NSMutableArray array];
  if (!a3)
  {
    arc4random_buf(__buf, 2uLL);
    unsigned int v12 = [STSNDEFRecord alloc];
    unsigned int v13 = +[NSData dataWithBytes:"cr" length:2];
    uint64_t v14 = +[NSData dataWithBytes:__buf length:2];
    uint64_t v15 = [(STSNDEFRecord *)v12 initWithFormat:209 type:v13 identifier:0 payload:v14];

    [v10 addObject:v15];
  }
  long long v34 = 0u;
  long long v35 = 0u;
  long long v32 = 0u;
  long long v33 = 0u;
  id v16 = v7;
  id v17 = [v16 countByEnumeratingWithState:&v32 objects:v38 count:16];
  if (v17)
  {
    id v18 = v17;
    uint64_t v19 = *(void *)v33;
    do
    {
      for (i = 0; i != v18; i = (char *)i + 1)
      {
        if (*(void *)v33 != v19) {
          objc_enumerationMutation(v16);
        }
        v21 = [*(id *)(*((void *)&v32 + 1) + 8 * i) createNdefRecordBundle];
        v22 = [v21 alternativeRecord];
        [v10 addObject:v22];

        v23 = [v21 configurationRecord];
        [v11 addObject:v23];

        uint64_t v24 = [v21 auxiliaryRecords];
        [v11 addObjectsFromArray:v24];
      }
      id v18 = [v16 countByEnumeratingWithState:&v32 objects:v38 count:16];
    }
    while (v18);
  }

  if (a3 == 1 && v31) {
    [v10 addObject:v31];
  }
  uint64_t v25 = +[NSData dataWithSTSNDEFRecords:v10];
  [v9 appendData:v25];

  uint64_t v26 = [[STSNDEFRecord alloc] initWithFormat:1 type:v30 identifier:0 payload:v9];
  id v27 = objc_opt_new();
  [v27 addObject:v26];
  [v27 addObjectsFromArray:v11];
  v28 = +[NSData dataWithSTSNDEFRecords:v27];

  return v28;
}

- (unint64_t)majorVersion
{
  return self->_majorVersion;
}

- (unint64_t)minorVersion
{
  return self->_minorVersion;
}

- (void).cxx_destruct
{
}

@end