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
  id v8 = a3;
  objc_msgSend_encodeInteger_forKey_(v8, v5, majorVersion, @"majorVersion");
  objc_msgSend_encodeInteger_forKey_(v8, v6, self->_minorVersion, @"minorVersion");
  objc_msgSend_encodeObject_forKey_(v8, v7, (uint64_t)self->_alternativeCarriers, @"alternativeCarriers");
}

- (STSConnectionHandover)initWithCoder:(id)a3
{
  id v4 = a3;
  v20.receiver = self;
  v20.super_class = (Class)STSConnectionHandover;
  v6 = [(STSConnectionHandover *)&v20 init];
  if (v6)
  {
    v6->_unint64_t majorVersion = (int)objc_msgSend_decodeIntForKey_(v4, v5, @"majorVersion");
    v6->_minorVersion = (int)objc_msgSend_decodeIntForKey_(v4, v7, @"minorVersion");
    id v8 = (void *)MEMORY[0x263EFFA08];
    uint64_t v9 = objc_opt_class();
    uint64_t v10 = objc_opt_class();
    uint64_t v11 = objc_opt_class();
    uint64_t v12 = objc_opt_class();
    uint64_t v13 = objc_opt_class();
    v15 = objc_msgSend_setWithObjects_(v8, v14, v9, v10, v11, v12, v13, 0);
    uint64_t v17 = objc_msgSend_decodeObjectOfClasses_forKey_(v4, v16, (uint64_t)v15, @"alternativeCarriers");
    alternativeCarriers = v6->_alternativeCarriers;
    v6->_alternativeCarriers = (NSMutableArray *)v17;
  }
  return v6;
}

- (STSConnectionHandover)init
{
  v6.receiver = self;
  v6.super_class = (Class)STSConnectionHandover;
  v2 = [(STSConnectionHandover *)&v6 init];
  if (v2)
  {
    v3 = (NSMutableArray *)objc_alloc_init(MEMORY[0x263EFF980]);
    alternativeCarriers = v2->_alternativeCarriers;
    v2->_alternativeCarriers = v3;
  }
  return v2;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (STSConnectionHandover *)a3;
  v5 = v4;
  if (v4 == self)
  {
    char isEqualToArray = 1;
  }
  else if (v4 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    objc_super v6 = v5;
    unint64_t majorVersion = self->_majorVersion;
    if (majorVersion == objc_msgSend_majorVersion(v6, v8, v9)
      || (unint64_t minorVersion = self->_minorVersion, minorVersion == objc_msgSend_minorVersion(v6, v10, v11)))
    {
      alternativeCarriers = self->_alternativeCarriers;
      v14 = objc_msgSend_alternativeCarriers(v6, v10, v11);
      char isEqualToArray = objc_msgSend_isEqualToArray_(alternativeCarriers, v15, (uint64_t)v14);
    }
    else
    {
      char isEqualToArray = 0;
    }
  }
  else
  {
    char isEqualToArray = 0;
  }

  return isEqualToArray;
}

- (id)description
{
  return (id)objc_msgSend_stringWithFormat_(NSString, a2, @"majorVersion=%lu, minorVersion=%lu, ac=%@", self->_majorVersion, self->_minorVersion, self->_alternativeCarriers);
}

- (NSArray)alternativeCarriers
{
  return (NSArray *)MEMORY[0x270F9A6D0](MEMORY[0x263EFF8C0], sel_arrayWithArray_, self->_alternativeCarriers);
}

- (void)addAlternativeCarrier:(id)a3
{
  if (a3) {
    objc_msgSend_addObject_(self->_alternativeCarriers, a2, (uint64_t)a3);
  }
}

+ (id)connectionHandoverWithData:(id)a3
{
  uint64_t v4 = objc_msgSend_ndefRecordsWithData_(STSNDEFRecord, a2, (uint64_t)a3);
  id v8 = (void *)v4;
  if (v4)
  {
    sub_2146CEA3C(OS_LOG_TYPE_INFO, 0, (uint64_t)"+[STSConnectionHandover connectionHandoverWithData:]", 154, @"NDEF:%@", v5, v6, v7, v4);
    uint64_t v10 = objc_msgSend__connectionHandoverWithNdefMessage_(a1, v9, (uint64_t)v8);
  }
  else
  {
    sub_2146CEA3C(OS_LOG_TYPE_ERROR, 0, (uint64_t)"+[STSConnectionHandover connectionHandoverWithData:]", 148, @"Not a valid NDEF message", v5, v6, v7, v12);
    uint64_t v10 = 0;
  }

  return v10;
}

+ (id)_connectionHandoverWithNdefMessage:(id)a3
{
  uint64_t v189 = *MEMORY[0x263EF8340];
  id v3 = a3;
  v167 = objc_msgSend_array(MEMORY[0x263EFF980], v4, v5);
  v159 = objc_msgSend_dictionary(MEMORY[0x263EFF9A0], v6, v7);
  uint64_t v10 = objc_msgSend_dictionary(MEMORY[0x263EFF9A0], v8, v9);
  long long v181 = 0u;
  long long v182 = 0u;
  long long v183 = 0u;
  long long v184 = 0u;
  id v11 = v3;
  uint64_t v13 = objc_msgSend_countByEnumeratingWithState_objects_count_(v11, v12, (uint64_t)&v181, v188, 16);
  if (v13)
  {
    id v16 = (id)v13;
    obuint64_t j = v11;
    unsigned __int8 v160 = 0;
    LOBYTE(v17) = 0;
    v168 = 0;
    BOOL v163 = 0;
    id v18 = *(id *)v182;
    id v154 = *(id *)v182;
    while (1)
    {
      uint64_t v19 = 0;
      id v156 = v16;
      do
      {
        if (*(id *)v182 != v18) {
          objc_enumerationMutation(obj);
        }
        objc_super v20 = *(void **)(*((void *)&v181 + 1) + 8 * v19);
        int isHandoverSelectRecord = objc_msgSend_isHandoverSelectRecord(v20, v14, v15);
        int isHandoverRequestRecord = objc_msgSend_isHandoverRequestRecord(v20, v22, v23);
        uint64_t v165 = v19;
        if ((isHandoverSelectRecord & 1) != 0 || isHandoverRequestRecord)
        {
          if (v163)
          {
            sub_2146CEA3C(OS_LOG_TYPE_ERROR, 0, (uint64_t)"+[STSConnectionHandover _connectionHandoverWithNdefMessage:]", 174, @"Previous Hr/Hs found.  Invalid handover NDEF", v27, v28, v29, v153);
            id v11 = obj;

            goto LABEL_70;
          }
          objc_msgSend_payload(v20, v25, v26);
          id v49 = objc_claimAutoreleasedReturnValue();
          v52 = (unsigned __int8 *)objc_msgSend_bytes(v49, v50, v51);

          v55 = objc_msgSend_payload(v20, v53, v54);
          int v58 = objc_msgSend_length(v55, v56, v57);

          unsigned int v161 = *v52;
          v60 = objc_msgSend_dataWithBytes_length_(MEMORY[0x263EFF8F8], v59, (uint64_t)(v52 + 1), (v58 - 1));
          v62 = objc_msgSend_ndefRecordsWithData_(STSNDEFRecord, v61, (uint64_t)v60);

          uint64_t v65 = objc_msgSend_count(v62, v63, v64);
          BOOL v163 = v65 != 0;
          if (!v65) {
            sub_2146CEA3C(OS_LOG_TYPE_ERROR, 0, (uint64_t)"+[STSConnectionHandover _connectionHandoverWithNdefMessage:]", 193, @"Missing local records in Hr/Hs record", v66, v67, v68, v153);
          }
          long long v179 = 0u;
          long long v180 = 0u;
          long long v177 = 0u;
          long long v178 = 0u;
          id v69 = v62;
          uint64_t v71 = objc_msgSend_countByEnumeratingWithState_objects_count_(v69, v70, (uint64_t)&v177, v187, 16);
          if (v71)
          {
            uint64_t v74 = v71;
            uint64_t v75 = *(void *)v178;
            do
            {
              uint64_t v76 = 0;
              do
              {
                if (*(void *)v178 != v75) {
                  objc_enumerationMutation(v69);
                }
                v77 = *(void **)(*((void *)&v177 + 1) + 8 * v76);
                if (objc_msgSend_typeNameFormat(v77, v72, v73) == 1)
                {
                  if ((objc_msgSend_isCollisionResolutionRecord(v77, v78, v79) & 1) == 0)
                  {
                    if (objc_msgSend_isAlternativeCarrierRecord(v77, v72, v73))
                    {
                      objc_msgSend_addObject_(v167, v80, (uint64_t)v77);
                    }
                    else if ((objc_msgSend_isHandoverSelectErrorRecord(v77, v80, v81) & isHandoverSelectRecord) == 1)
                    {
                      id v86 = v77;

                      v168 = v86;
                    }
                    else
                    {
                      id v87 = [NSString alloc];
                      v90 = objc_msgSend_type(v77, v88, v89);
                      v92 = objc_msgSend_initWithData_encoding_(v87, v91, (uint64_t)v90, 4);

                      sub_2146CEA3C(OS_LOG_TYPE_DEFAULT, 0, (uint64_t)"+[STSConnectionHandover _connectionHandoverWithNdefMessage:]", 211, @"Unsupported type:%@", v93, v94, v95, (uint64_t)v92);
                    }
                  }
                }
                else
                {
                  unsigned int v82 = objc_msgSend_typeNameFormat(v77, v78, v79);
                  sub_2146CEA3C(OS_LOG_TYPE_DEFAULT, 0, (uint64_t)"+[STSConnectionHandover _connectionHandoverWithNdefMessage:]", 200, @"Unsupported record TNF:%d", v83, v84, v85, v82);
                }
                ++v76;
              }
              while (v74 != v76);
              uint64_t v96 = objc_msgSend_countByEnumeratingWithState_objects_count_(v69, v72, (uint64_t)&v177, v187, 16);
              uint64_t v74 = v96;
            }
            while (v96);
          }
          unsigned int v17 = v161 >> 4;
          unsigned __int8 v160 = v161 & 0xF;

          id v18 = v154;
          id v16 = v156;
        }
        else
        {
          if ((objc_msgSend_isWiFiAwareConfigurationRecord(v20, v25, v26) & 1) == 0
            && (objc_msgSend_isBluetoothLEConfigurationRecord(v20, v30, v31) & 1) == 0
            && !objc_msgSend_isNfcConfigurationRecord(v20, v30, v31))
          {
            v97 = objc_msgSend_identifier(v20, v30, v31);

            if (v97)
            {
              v47 = objc_msgSend_identifier(v20, v98, v99);
              objc_msgSend_setObject_forKey_(v10, v100, (uint64_t)v20, v47);
            }
            else
            {
              id v101 = [NSString alloc];
              v104 = objc_msgSend_type(v20, v102, v103);
              v47 = objc_msgSend_initWithData_encoding_(v101, v105, (uint64_t)v104, 4);

              unsigned int v108 = objc_msgSend_typeNameFormat(v20, v106, v107);
              sub_2146CEA3C(OS_LOG_TYPE_DEFAULT, 0, (uint64_t)"+[STSConnectionHandover _connectionHandoverWithNdefMessage:id=nil"], v109, v110, v111, v108);
            }
LABEL_15:

            goto LABEL_37;
          }
          v32 = objc_msgSend_identifier(v20, v30, v31);

          if (v32)
          {
            v38 = objc_msgSend_identifier(v20, v33, v34);
            v40 = objc_msgSend_objectForKey_(v159, v39, (uint64_t)v38);

            if (v40)
            {
              v43 = objc_msgSend_identifier(v20, v41, v42);
              sub_2146CEA3C(OS_LOG_TYPE_INFO, 0, (uint64_t)"+[STSConnectionHandover _connectionHandoverWithNdefMessage:]", 219, @"Carrier config %@ exists", v44, v45, v46, (uint64_t)v43);
            }
            v47 = objc_msgSend_identifier(v20, v41, v42);
            objc_msgSend_setObject_forKey_(v159, v48, (uint64_t)v20, v47);
            goto LABEL_15;
          }
          sub_2146CEA3C(OS_LOG_TYPE_INFO, 0, (uint64_t)"+[STSConnectionHandover _connectionHandoverWithNdefMessage:]", 223, @"Missing ID", v35, v36, v37, v153);
        }
LABEL_37:
        uint64_t v19 = v165 + 1;
      }
      while ((id)(v165 + 1) != v16);
      uint64_t v112 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v14, (uint64_t)&v181, v188, 16);
      id v16 = (id)v112;
      if (!v112)
      {
        id v11 = obj;

        if (!v163) {
          goto LABEL_69;
        }
        v116 = objc_alloc_init(STSConnectionHandover);
        v116->_unint64_t majorVersion = v17;
        v116->_unint64_t minorVersion = v160;
        v157 = v116;
        long long v173 = 0u;
        long long v174 = 0u;
        long long v175 = 0u;
        long long v176 = 0u;
        id v155 = v167;
        uint64_t v164 = objc_msgSend_countByEnumeratingWithState_objects_count_(v155, v117, (uint64_t)&v173, v186, 16);
        if (v164)
        {
          uint64_t v162 = *(void *)v174;
          do
          {
            for (uint64_t i = 0; i != v164; ++i)
            {
              if (*(void *)v174 != v162) {
                objc_enumerationMutation(v155);
              }
              v121 = *(void **)(*((void *)&v173 + 1) + 8 * i);
              v123 = objc_msgSend_getCarrierDataReferenceFromAlternativeCarrierRecord(v121, v118, v119);
              if (v123)
              {
                v166 = objc_msgSend_objectForKeyedSubscript_(v159, v122, (uint64_t)v123);
                v126 = objc_msgSend_array(MEMORY[0x263EFF980], v124, v125);
                v129 = objc_msgSend_getAuxiliaryDataReferencesFromAlternativeCarrierRecord(v121, v127, v128);
                long long v169 = 0u;
                long long v170 = 0u;
                long long v171 = 0u;
                long long v172 = 0u;
                uint64_t v131 = objc_msgSend_countByEnumeratingWithState_objects_count_(v129, v130, (uint64_t)&v169, v185, 16);
                if (v131)
                {
                  uint64_t v133 = v131;
                  uint64_t v134 = *(void *)v170;
                  do
                  {
                    for (uint64_t j = 0; j != v133; ++j)
                    {
                      if (*(void *)v170 != v134) {
                        objc_enumerationMutation(v129);
                      }
                      v137 = objc_msgSend_objectForKeyedSubscript_(v10, v132, *(void *)(*((void *)&v169 + 1) + 8 * j));
                      if (v137) {
                        objc_msgSend_addObject_(v126, v136, (uint64_t)v137);
                      }
                    }
                    uint64_t v133 = objc_msgSend_countByEnumeratingWithState_objects_count_(v129, v132, (uint64_t)&v169, v185, 16);
                  }
                  while (v133);
                }
                v138 = [STSCHNdefRecordBundle alloc];
                v140 = objc_msgSend_initWithAlternativeRecord_configurationRecord_auxiliaryRecords_errorRecord_(v138, v139, (uint64_t)v121, v166, v126, v168);
                char isWiFiAwareConfigurationRecord = objc_msgSend_isWiFiAwareConfigurationRecord(v166, v141, v142);
                v146 = off_264217888;
                if ((isWiFiAwareConfigurationRecord & 1) != 0
                  || (char isBluetoothLEConfigurationRecord = objc_msgSend_isBluetoothLEConfigurationRecord(v166, v144, v145),
                      v146 = off_264217870,
                      (isBluetoothLEConfigurationRecord & 1) != 0)
                  || (int isNfcConfigurationRecord = objc_msgSend_isNfcConfigurationRecord(v166, v144, v148),
                      v146 = off_264217880,
                      isNfcConfigurationRecord))
                {
                  v150 = objc_msgSend_connectionHandoverAlternativeCarrierWithBundle_(*v146, v144, (uint64_t)v140);
                  objc_msgSend_addAlternativeCarrier_(v157, v151, (uint64_t)v150);
                }
              }
            }
            uint64_t v164 = objc_msgSend_countByEnumeratingWithState_objects_count_(v155, v118, (uint64_t)&v173, v186, 16);
          }
          while (v164);
        }

        id v11 = obj;
        goto LABEL_71;
      }
    }
  }

  v168 = 0;
LABEL_69:
  sub_2146CEA3C(OS_LOG_TYPE_INFO, 0, (uint64_t)"+[STSConnectionHandover _connectionHandoverWithNdefMessage:]", 234, @"No Hr record found", v113, v114, v115, v153);
LABEL_70:
  v157 = 0;
LABEL_71:

  return v157;
}

+ (id)requestWithAlternativeCarriers:(id)a3
{
  return (id)MEMORY[0x270F9A6D0](a1, sel__createNdefWithType_alternativeCarriers_errorRecord_, 0);
}

+ (id)selectWithAlternativeCarriers:(id)a3 error:(id)a4
{
  return (id)MEMORY[0x270F9A6D0](a1, sel__createNdefWithType_alternativeCarriers_errorRecord_, 1);
}

+ (id)_createNdefWithType:(int64_t)a3 alternativeCarriers:(id)a4 errorRecord:(id)a5
{
  uint64_t v69 = *MEMORY[0x263EF8340];
  id v7 = a4;
  id v61 = a5;
  if (a3) {
    objc_msgSend_dataWithBytes_length_(MEMORY[0x263EFF8F8], v8, (uint64_t)"Hs", 2);
  }
  else {
  v60 = objc_msgSend_dataWithBytes_length_(MEMORY[0x263EFF8F8], v8, (uint64_t)"Hr", 2);
  }
  char v67 = 21;
  id v11 = objc_msgSend_data(MEMORY[0x263EFF990], v9, v10);
  objc_msgSend_appendBytes_length_(v11, v12, (uint64_t)&v67, 1);
  uint64_t v15 = objc_msgSend_array(MEMORY[0x263EFF980], v13, v14);
  id v18 = objc_msgSend_array(MEMORY[0x263EFF980], v16, v17);
  if (!a3)
  {
    arc4random_buf(__buf, 2uLL);
    uint64_t v19 = [STSNDEFRecord alloc];
    v21 = objc_msgSend_dataWithBytes_length_(MEMORY[0x263EFF8F8], v20, (uint64_t)"cr", 2);
    uint64_t v23 = objc_msgSend_dataWithBytes_length_(MEMORY[0x263EFF8F8], v22, (uint64_t)__buf, 2);
    v25 = objc_msgSend_initWithFormat_type_identifier_payload_(v19, v24, 209, v21, 0, v23);

    objc_msgSend_addObject_(v15, v26, (uint64_t)v25);
  }
  long long v64 = 0u;
  long long v65 = 0u;
  long long v62 = 0u;
  long long v63 = 0u;
  id v27 = v7;
  uint64_t v29 = objc_msgSend_countByEnumeratingWithState_objects_count_(v27, v28, (uint64_t)&v62, v68, 16);
  if (v29)
  {
    uint64_t v32 = v29;
    uint64_t v33 = *(void *)v63;
    do
    {
      for (uint64_t i = 0; i != v32; ++i)
      {
        if (*(void *)v63 != v33) {
          objc_enumerationMutation(v27);
        }
        uint64_t v35 = objc_msgSend_createNdefRecordBundle(*(void **)(*((void *)&v62 + 1) + 8 * i), v30, v31);
        v38 = objc_msgSend_alternativeRecord(v35, v36, v37);
        objc_msgSend_addObject_(v15, v39, (uint64_t)v38);

        uint64_t v42 = objc_msgSend_configurationRecord(v35, v40, v41);
        objc_msgSend_addObject_(v18, v43, (uint64_t)v42);

        uint64_t v46 = objc_msgSend_auxiliaryRecords(v35, v44, v45);
        objc_msgSend_addObjectsFromArray_(v18, v47, (uint64_t)v46);
      }
      uint64_t v32 = objc_msgSend_countByEnumeratingWithState_objects_count_(v27, v30, (uint64_t)&v62, v68, 16);
    }
    while (v32);
  }

  if (a3 == 1 && v61) {
    objc_msgSend_addObject_(v15, v48, (uint64_t)v61);
  }
  id v49 = objc_msgSend_dataWithSTSNDEFRecords_(MEMORY[0x263EFF8F8], v48, (uint64_t)v15);
  objc_msgSend_appendData_(v11, v50, (uint64_t)v49);

  uint64_t v51 = [STSNDEFRecord alloc];
  v53 = objc_msgSend_initWithFormat_type_identifier_payload_(v51, v52, 1, v60, 0, v11);
  uint64_t v54 = objc_opt_new();
  objc_msgSend_addObject_(v54, v55, (uint64_t)v53);
  objc_msgSend_addObjectsFromArray_(v54, v56, (uint64_t)v18);
  int v58 = objc_msgSend_dataWithSTSNDEFRecords_(MEMORY[0x263EFF8F8], v57, (uint64_t)v54);

  return v58;
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