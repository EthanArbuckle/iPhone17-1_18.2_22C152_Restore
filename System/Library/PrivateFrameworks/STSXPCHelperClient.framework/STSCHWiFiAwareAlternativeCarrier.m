@interface STSCHWiFiAwareAlternativeCarrier
+ (BOOL)supportsSecureCoding;
+ (id)connectionHandoverAlternativeCarrierWithBundle:(id)a3;
- (BOOL)isEqual:(id)a3;
- (NSData)serviceIdentifier;
- (STSCHWiFiAwareAlternativeCarrier)initWithCoder:(id)a3;
- (STSCHWiFiAwareAlternativeCarrier)initWithNdefRecordBundle:(id)a3;
- (STSCHWiFiAwareAlternativeCarrier)initWithSecurityInfo:(id)a3 discoveryChannelInfo:(id)a4 powerState:(unint64_t)a5 auxiliaryRecords:(id)a6;
- (STSCHWiFiAwareDiscoveryChannelInfo)discoveryChannelInfo;
- (STSCHWiFiAwareSecurityInfo)securityInfo;
- (id)_createCarrierConfigurationRecord;
- (id)description;
- (void)_initWithCarrierConfiguration:(id)a3;
- (void)encodeWithCoder:(id)a3;
- (void)setDiscoveryChannelInfo:(id)a3;
- (void)setSecurityInfo:(id)a3;
- (void)setServiceIdentifier:(id)a3;
@end

@implementation STSCHWiFiAwareAlternativeCarrier

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)STSCHWiFiAwareAlternativeCarrier;
  id v4 = a3;
  [(STSCHAlternativeCarrier *)&v7 encodeWithCoder:v4];
  objc_msgSend_encodeObject_forKey_(v4, v5, (uint64_t)self->_securityInfo, @"securityInfos", v7.receiver, v7.super_class);
  objc_msgSend_encodeObject_forKey_(v4, v6, (uint64_t)self->_discoveryChannelInfo, @"discoveryChannelInfo");
}

- (STSCHWiFiAwareAlternativeCarrier)initWithCoder:(id)a3
{
  id v4 = a3;
  v19.receiver = self;
  v19.super_class = (Class)STSCHWiFiAwareAlternativeCarrier;
  v5 = [(STSCHAlternativeCarrier *)&v19 initWithCoder:v4];
  if (v5)
  {
    v6 = (void *)MEMORY[0x263EFFA08];
    uint64_t v7 = objc_opt_class();
    uint64_t v8 = objc_opt_class();
    v10 = objc_msgSend_setWithObjects_(v6, v9, v7, v8, 0);
    uint64_t v12 = objc_msgSend_decodeObjectOfClasses_forKey_(v4, v11, (uint64_t)v10, @"securityInfos");
    securityInfo = v5->_securityInfo;
    v5->_securityInfo = (STSCHWiFiAwareSecurityInfo *)v12;

    uint64_t v14 = objc_opt_class();
    uint64_t v16 = objc_msgSend_decodeObjectOfClass_forKey_(v4, v15, v14, @"discoveryChannelInfo");
    discoveryChannelInfo = v5->_discoveryChannelInfo;
    v5->_discoveryChannelInfo = (STSCHWiFiAwareDiscoveryChannelInfo *)v16;
  }
  return v5;
}

- (void)_initWithCarrierConfiguration:(id)a3
{
  id v68 = a3;
  if ((objc_msgSend_isWiFiAwareConfigurationRecord(v68, v4, v5) & 1) == 0)
  {
    sub_2146CE940(OS_LOG_TYPE_INFO, 0, (uint64_t)"-[STSCHWiFiAwareAlternativeCarrier _initWithCarrierConfiguration:]", 313, self, @"Not WiFi Aware Carrier Configuration record", v8, v9, v62);
    goto LABEL_47;
  }
  objc_msgSend_payload(v68, v6, v7);
  id v10 = objc_claimAutoreleasedReturnValue();
  v13 = (unsigned __int8 *)objc_msgSend_bytes(v10, v11, v12);

  uint64_t v16 = objc_msgSend_payload(v68, v14, v15);
  uint64_t v19 = objc_msgSend_length(v16, v17, v18);

  v22 = objc_msgSend_array(MEMORY[0x263EFF980], v20, v21);
  v28 = objc_msgSend_array(MEMORY[0x263EFF980], v23, v24);
  if (v19 < 1)
  {
    v49 = 0;
    v29 = 0;
    v48 = 0;
    goto LABEL_39;
  }
  v63 = self;
  v29 = 0;
  unsigned int v64 = -1;
  unsigned int v65 = -1;
  unint64_t v30 = 0x263EFF000uLL;
  unsigned int v66 = -1;
  do
  {
    uint64_t v31 = *v13;
    int v32 = v13[1];
    v33 = v13 + 2;
    switch(v32)
    {
      case 3:
        if (v31 >= 2)
        {
          uint64_t v41 = objc_msgSend_dataWithBytes_length_(*(void **)(v30 + 2296), v25, (uint64_t)(v13 + 2), (v31 - 1));

          v29 = (void *)v41;
        }
        break;
      case 2:
        v42 = objc_alloc_init(STSDiffieHellmanParameter);
        objc_msgSend_setPublicKeyGroup_(v42, v43, __rev16(*((unsigned __int16 *)v13 + 1)));
        if (v31 >= 4)
        {
          v45 = objc_msgSend_dataWithBytes_length_(*(void **)(v30 + 2296), v44, (uint64_t)(v13 + 4), (v31 - 3));
          objc_msgSend_setPublicKey_(v42, v46, (uint64_t)v45);
        }
        objc_msgSend_addObject_(v28, v44, (uint64_t)v42);

        break;
      case 1:
        if (v31 >= 2)
        {
          v67 = v29;
          v34 = v28;
          unint64_t v35 = v30;
          uint64_t v36 = (v31 - 1);
          v37 = v33;
          do
          {
            unsigned int v38 = *v37++;
            v39 = objc_msgSend_numberWithUnsignedChar_(NSNumber, v25, v38);
            objc_msgSend_addObject_(v22, v40, (uint64_t)v39);

            --v36;
          }
          while (v36);
          unint64_t v30 = v35;
          v28 = v34;
          v29 = v67;
        }
        break;
      default:
        if (v32 == 4 && v31 == 2)
        {
          unsigned int v66 = *v33;
        }
        else if (v32 == 5 && v31 == 3)
        {
          unsigned int v64 = v13[2];
          unsigned int v65 = v13[3];
        }
        else if (v32 != 221)
        {
          sub_2146CE940(OS_LOG_TYPE_DEFAULT, 0, (uint64_t)"-[STSCHWiFiAwareAlternativeCarrier _initWithCarrierConfiguration:]", 359, v63, @"Unknown tag:%d", v26, v27, v13[1]);
        }
        break;
    }
    v13 = &v33[v31 - 1];
    uint64_t v19 = v19 - 2 - (v31 - 1);
  }
  while (v19 > 0);
  if ((v66 & 0x80000000) != 0)
  {
    v48 = 0;
  }
  else
  {
    v48 = objc_msgSend_numberWithInt_(NSNumber, v25, v66);
  }
  if ((v64 & 0x80000000) != 0)
  {
    v49 = 0;
  }
  else
  {
    v49 = objc_msgSend_numberWithInt_(NSNumber, v25, v64);
  }
  self = v63;
  if ((v65 & 0x80000000) != 0)
  {
LABEL_39:
    v50 = 0;
    if (v48) {
      goto LABEL_44;
    }
    goto LABEL_40;
  }
  v50 = objc_msgSend_numberWithInt_(NSNumber, v25, v65);
  if (v48) {
    goto LABEL_44;
  }
LABEL_40:
  if (v49 || v50)
  {
LABEL_44:
    v54 = [STSCHWiFiAwareDiscoveryChannelInfo alloc];
    v56 = (STSCHWiFiAwareDiscoveryChannelInfo *)objc_msgSend_initWithSupportedBands_operatingClass_channelNumber_(v54, v55, (uint64_t)v48, v49, v50);
    discoveryChannelInfo = self->_discoveryChannelInfo;
    self->_discoveryChannelInfo = v56;

    if (!v29) {
      goto LABEL_45;
    }
    goto LABEL_43;
  }
  if (!v29)
  {
LABEL_45:
    v53 = 0;
    goto LABEL_46;
  }
LABEL_43:
  id v51 = [NSString alloc];
  v53 = objc_msgSend_initWithData_encoding_(v51, v52, (uint64_t)v29, 4);
LABEL_46:
  v58 = [STSCHWiFiAwareSecurityInfo alloc];
  v60 = (STSCHWiFiAwareSecurityInfo *)objc_msgSend_initWithCipherSuites_dhInfo_passphrase_(v58, v59, (uint64_t)v22, v28, v53);
  securityInfo = self->_securityInfo;
  self->_securityInfo = v60;

LABEL_47:
}

- (STSCHWiFiAwareAlternativeCarrier)initWithSecurityInfo:(id)a3 discoveryChannelInfo:(id)a4 powerState:(unint64_t)a5 auxiliaryRecords:(id)a6
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a6;
  v24.receiver = self;
  v24.super_class = (Class)STSCHWiFiAwareAlternativeCarrier;
  uint64_t v14 = [(STSCHWiFiAwareAlternativeCarrier *)&v24 init];
  uint64_t v15 = v14;
  if (v14)
  {
    objc_storeStrong((id *)&v14->_securityInfo, a3);
    objc_storeStrong((id *)&v15->_discoveryChannelInfo, a4);
    objc_msgSend_setType_(v15, v16, 1);
    if (a5 >= 3) {
      objc_msgSend_setPowerState_(v15, v17, 3);
    }
    else {
      objc_msgSend_setPowerState_(v15, v17, a5);
    }
    objc_msgSend_setAuxiliaryRecords_(v15, v18, (uint64_t)v13);
    uint64_t v21 = objc_msgSend__createCarrierConfigurationRecord(v15, v19, v20);
    objc_msgSend_setCarrierRecord_(v15, v22, (uint64_t)v21);
  }
  return v15;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)STSCHWiFiAwareAlternativeCarrier;
  if ([(STSCHAlternativeCarrier *)&v13 isEqual:v4])
  {
    v6 = v4;
    securityInfo = self->_securityInfo;
    uint64_t v8 = v6[5];
    if (securityInfo)
    {
      if (!v8 || (objc_msgSend_isEqual_(securityInfo, v5, v8) & 1) == 0) {
        goto LABEL_13;
      }
    }
    else if (v8)
    {
      goto LABEL_13;
    }
    discoveryChannelInfo = self->_discoveryChannelInfo;
    uint64_t v11 = v6[6];
    if (discoveryChannelInfo)
    {
      if (v11 && (objc_msgSend_isEqual_(discoveryChannelInfo, v5, v11) & 1) != 0) {
        goto LABEL_11;
      }
    }
    else if (!v11)
    {
LABEL_11:
      BOOL v9 = 1;
LABEL_14:

      goto LABEL_15;
    }
LABEL_13:
    BOOL v9 = 0;
    goto LABEL_14;
  }
  BOOL v9 = 0;
LABEL_15:

  return v9;
}

- (id)description
{
  id v4 = NSString;
  uint64_t v5 = objc_msgSend_powerState(self, a2, v2);
  uint64_t v8 = objc_msgSend_description(self->_securityInfo, v6, v7);
  uint64_t v11 = objc_msgSend_description(self->_discoveryChannelInfo, v9, v10);
  uint64_t v14 = objc_msgSend_auxiliaryRecords(self, v12, v13);
  v17 = objc_msgSend_description(v14, v15, v16);
  uint64_t v19 = objc_msgSend_stringWithFormat_(v4, v18, @"{ type=wifi,powerState=%lu,securityInfo={%@},discoveryInfo={%@},aux=%@ }", v5, v8, v11, v17);

  return v19;
}

- (STSCHWiFiAwareAlternativeCarrier)initWithNdefRecordBundle:(id)a3
{
  id v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)STSCHWiFiAwareAlternativeCarrier;
  uint64_t v7 = [(STSCHAlternativeCarrier *)&v11 initWithNdefRecordBundle:v4];
  if (v7)
  {
    uint64_t v8 = objc_msgSend_configurationRecord(v4, v5, v6);
    objc_msgSend__initWithCarrierConfiguration_(v7, v9, (uint64_t)v8);
  }
  return v7;
}

+ (id)connectionHandoverAlternativeCarrierWithBundle:(id)a3
{
  id v4 = a3;
  uint64_t v7 = objc_msgSend_configurationRecord(v4, v5, v6);
  int isWiFiAwareConfigurationRecord = objc_msgSend_isWiFiAwareConfigurationRecord(v7, v8, v9);

  if (isWiFiAwareConfigurationRecord)
  {
    id v11 = objc_alloc((Class)a1);
    uint64_t v13 = objc_msgSend_initWithNdefRecordBundle_(v11, v12, (uint64_t)v4);
  }
  else
  {
    uint64_t v13 = 0;
  }

  return v13;
}

- (id)_createCarrierConfigurationRecord
{
  v3 = objc_msgSend_dataWithBytes_length_(MEMORY[0x263EFF8F8], a2, (uint64_t)"application/vnd.wfa.nanapplication/vnd.bluetooth.le.oob", 23);
  uint64_t v5 = objc_msgSend_dataUsingEncoding_(@"W", v4, 4);
  uint64_t v8 = objc_msgSend_data(MEMORY[0x263EFF990], v6, v7);
  id v11 = objc_msgSend_asData(self->_securityInfo, v9, v10);
  objc_msgSend_appendData_(v8, v12, (uint64_t)v11);

  uint64_t v15 = objc_msgSend_discoveryChannelInfo(self, v13, v14);
  uint64_t v18 = objc_msgSend_asData(v15, v16, v17);
  objc_msgSend_appendData_(v8, v19, (uint64_t)v18);

  uint64_t v20 = [STSNDEFRecord alloc];
  v22 = objc_msgSend_initWithFormat_type_identifier_payload_(v20, v21, 2, v3, v5, v8);

  return v22;
}

- (STSCHWiFiAwareSecurityInfo)securityInfo
{
  return self->_securityInfo;
}

- (void)setSecurityInfo:(id)a3
{
}

- (STSCHWiFiAwareDiscoveryChannelInfo)discoveryChannelInfo
{
  return self->_discoveryChannelInfo;
}

- (void)setDiscoveryChannelInfo:(id)a3
{
}

- (NSData)serviceIdentifier
{
  return self->_serviceIdentifier;
}

- (void)setServiceIdentifier:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_serviceIdentifier, 0);
  objc_storeStrong((id *)&self->_discoveryChannelInfo, 0);

  objc_storeStrong((id *)&self->_securityInfo, 0);
}

@end