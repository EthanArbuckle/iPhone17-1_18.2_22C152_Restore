@interface SDActivityDeviceRecord
- ($126081439F6B1623D1821CF14B226F9E)lastActivityAdvertisement;
- (BOOL)deviceTracked;
- (BOOL)disableDuplicateFilterOnce;
- (IDSDevice)idsDevice;
- (NSData)lastAdvertisementData;
- (NSData)lastAdvertisementPayload;
- (NSData)lastRawAdvertisementData;
- (NSDictionary)lastAdvertisementOptions;
- (NSUUID)lastUsedKeyIdentifier;
- (SDActivityDecryptionKey)decryptionKey;
- (SDActivityDeviceRecord)initWithDevice:(id)a3;
- (SFActivityAdvertisement)clientAdvertisement;
- (id)description;
- (unsigned)lastCounter;
- (void)setDeviceTracked:(BOOL)a3;
- (void)setDisableDuplicateFilterOnce:(BOOL)a3;
- (void)setIdsDevice:(id)a3;
- (void)setLastUsedKeyIdentifier:(id)a3;
- (void)updateWithRawAdvertisementData:(id)a3 receivedViaScanning:(BOOL)a4 isReplay:(BOOL)a5 newAdvertisementHandler:(id)a6;
- (void)updateWithRawAdvertisementData:(id)a3 receivedViaScanning:(BOOL)a4 newAdvertisementHandler:(id)a5;
@end

@implementation SDActivityDeviceRecord

- (SDActivityDeviceRecord)initWithDevice:(id)a3
{
  id v5 = a3;
  if (v5)
  {
    v10.receiver = self;
    v10.super_class = (Class)SDActivityDeviceRecord;
    v6 = [(SDActivityDeviceRecord *)&v10 init];
    v7 = v6;
    if (v6) {
      objc_storeStrong((id *)&v6->_idsDevice, a3);
    }
    self = v7;
    v8 = self;
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (id)description
{
  v3 = (objc_class *)objc_opt_class();
  v4 = NSStringFromClass(v3);
  id v5 = [(IDSDevice *)self->_idsDevice uniqueIDOverride];
  v6 = [(SDActivityDeviceRecord *)self decryptionKey];
  CFStringRef v7 = @"YES";
  if (!v6) {
    CFStringRef v7 = @"NO";
  }
  v8 = +[NSString stringWithFormat:@"<%@: %p, deviceUniqueID:%@, hasKey:%@, lastReceivedAdvertisementDate:%@>", v4, self, v5, v7, self->_lastReceivedAdvertisementDate];

  return v8;
}

- (void)updateWithRawAdvertisementData:(id)a3 receivedViaScanning:(BOOL)a4 newAdvertisementHandler:(id)a5
{
}

- (void)updateWithRawAdvertisementData:(id)a3 receivedViaScanning:(BOOL)a4 isReplay:(BOOL)a5 newAdvertisementHandler:(id)a6
{
  BOOL v7 = a5;
  id v10 = a3;
  v11 = (void (**)(id, void *, void))a6;
  if (![(NSData *)self->_lastRawAdvertisementData isEqual:v10]
    || self->_disableDuplicateFilterOnce
    || v7)
  {
    uint64_t v65 = sub_1000C9A58(v10);
    int v66 = v12;
    __int16 v67 = v13;
    if (!a4)
    {
      v31 = (NSData *)[v10 copy];
      lastRawAdvertisementData = self->_lastRawAdvertisementData;
      self->_lastRawAdvertisementData = v31;

      v33 = (NSDate *)objc_opt_new();
      lastReceivedAdvertisementDate = self->_lastReceivedAdvertisementDate;
      self->_lastReceivedAdvertisementDate = v33;

      v35 = +[NSData dataWithBytes:&v65 length:14];
      lastAdvertisementData = self->_lastAdvertisementData;
      self->_lastAdvertisementData = v35;

      v15 = [(SDActivityDeviceRecord *)self clientAdvertisement];
      v11[2](v11, v15, 0);
LABEL_23:

      goto LABEL_24;
    }
    v14 = handoff_log();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
    {
      v51 = SFHexStringForData();
      uint64_t v52 = [(IDSDevice *)self->_idsDevice uniqueIDOverride];
      v53 = (void *)v52;
      CFStringRef v54 = @"NO";
      BOOL disableDuplicateFilterOnce = self->_disableDuplicateFilterOnce;
      *(_DWORD *)buf = 138413058;
      *(void *)v71 = v51;
      if (v7) {
        CFStringRef v56 = @"YES";
      }
      else {
        CFStringRef v56 = @"NO";
      }
      *(_WORD *)&v71[8] = 2112;
      if (disableDuplicateFilterOnce) {
        CFStringRef v54 = @"YES";
      }
      *(void *)v72 = v52;
      *(_WORD *)&v72[8] = 2112;
      *(void *)v73 = v56;
      *(_WORD *)&v73[8] = 2112;
      CFStringRef v74 = v54;
      _os_log_debug_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEBUG, "Received a new rawAdvertisementData %@ from %@ (isReplay:%@, disabledDuplicateFilter:%@)", buf, 0x2Au);
    }
    v15 = [(SDActivityDeviceRecord *)self decryptionKey];
    unsigned int v16 = sub_1000C9AF8(v65);
    if (v15)
    {
      if (self->_disableDuplicateFilterOnce && v16 == [(SDActivityDeviceRecord *)self lastCounter]
        || v16 > [(SDActivityDeviceRecord *)self lastCounter])
      {
        self->_BOOL disableDuplicateFilterOnce = 0;
        v17 = (NSData *)[v10 copy];
        v18 = self->_lastRawAdvertisementData;
        self->_lastRawAdvertisementData = v17;

        uint64_t v57 = +[NSData dataWithBytes:(char *)&v65 + 4 length:10];
        v19 = [(SDActivityDeviceRecord *)self decryptionKey];
        unsigned __int8 v20 = [v19 getResultWhileDecryptingBytesInPlace:(char *)&v65 + 4 andCounter:(char *)&v65 + 1 withTag:BYTE3(v65) version:v65];

        if (v20)
        {
          v21 = (NSDate *)objc_opt_new();
          v22 = self->_lastReceivedAdvertisementDate;
          self->_lastReceivedAdvertisementDate = v21;

          v23 = +[NSData dataWithBytes:&v65 length:14];
          v24 = self->_lastAdvertisementData;
          self->_lastAdvertisementData = v23;

          v25 = handoff_log();
          v26 = (void *)v57;
          if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
          {
            v27 = SFHexStringForData();
            v28 = SFHexStringForData();
            unsigned int v29 = [(SDActivityDeviceRecord *)self lastCounter];
            *(_DWORD *)buf = 138412802;
            *(void *)v71 = v27;
            *(_WORD *)&v71[8] = 2112;
            *(void *)v72 = v28;
            *(_WORD *)&v72[8] = 1024;
            *(_DWORD *)v73 = v29;
            _os_log_impl((void *)&_mh_execute_header, v25, OS_LOG_TYPE_DEFAULT, "Successfully decrypted advertisement (sharing flags + advertisementPayload): %@ => %@, counter: %u", buf, 0x1Cu);
          }
          v30 = [(SDActivityDeviceRecord *)self clientAdvertisement];
          v11[2](v11, v30, 0);
          goto LABEL_22;
        }
        p_super = handoff_log();
        BOOL v49 = os_log_type_enabled(p_super, OS_LOG_TYPE_ERROR);
        if (v7)
        {
          if (v49) {
            sub_100031E70((uint64_t)self);
          }

          NSErrorUserInfoKey v68 = NSLocalizedDescriptionKey;
          CFStringRef v69 = @"Failed to decrypt advertisement";
          v30 = +[NSDictionary dictionaryWithObjects:&v69 forKeys:&v68 count:1];
          v50 = +[NSError errorWithDomain:NSPOSIXErrorDomain code:94 userInfo:v30];
          ((void (**)(id, void *, void *))v11)[2](v11, 0, v50);

          goto LABEL_21;
        }
        if (v49) {
          sub_100031F18((uint64_t)self);
        }
LABEL_20:

        v45 = +[SDActivityPayloadManager sharedPayloadManager];
        v46 = [(IDSDevice *)self->_idsDevice uniqueIDOverride];
        v47 = [(SDActivityDeviceRecord *)self decryptionKey];
        v48 = [v47 keyIdentifier];
        v58[0] = _NSConcreteStackBlock;
        v58[1] = 3221225472;
        v58[2] = sub_100031748;
        v58[3] = &unk_1008CA720;
        id v59 = v15;
        v60 = self;
        id v61 = v10;
        BOOL v64 = a4;
        v62 = v11;
        __int16 v63 = v16;
        [v45 sendEncryptionKeyRequestToDeviceIdentifier:v46 previousKeyIdentifier:v48 completionHandler:v58];

        v30 = v59;
LABEL_21:
        v26 = (void *)v57;
LABEL_22:

        goto LABEL_23;
      }
      v37 = handoff_log();
      if (os_log_type_enabled(v37, OS_LOG_TYPE_DEFAULT))
      {
        unsigned int v40 = [(SDActivityDeviceRecord *)self lastCounter];
        v41 = [(IDSDevice *)self->_idsDevice uniqueIDOverride];
        v42 = SFHexStringForData();
        *(_DWORD *)buf = 67109890;
        *(_DWORD *)v71 = v16;
        *(_WORD *)&v71[4] = 1024;
        *(_DWORD *)&v71[6] = v40;
        *(_WORD *)v72 = 2112;
        *(void *)&v72[2] = v41;
        *(_WORD *)v73 = 2112;
        *(void *)&v73[2] = v42;
        _os_log_impl((void *)&_mh_execute_header, v37, OS_LOG_TYPE_DEFAULT, "New counter %d is not greater than previous %d from %@ with rawAdvertisementData %@. Requesting new key", buf, 0x22u);
      }
    }
    else
    {
      v37 = handoff_log();
      if (os_log_type_enabled(v37, OS_LOG_TYPE_DEFAULT))
      {
        v38 = [(IDSDevice *)self->_idsDevice uniqueID];
        v39 = SFHexStringForData();
        *(_DWORD *)buf = 138412546;
        *(void *)v71 = v38;
        *(_WORD *)&v71[8] = 2112;
        *(void *)v72 = v39;
        _os_log_impl((void *)&_mh_execute_header, v37, OS_LOG_TYPE_DEFAULT, "No current key to decrypt advertisement from %@ with rawAdvertisementData %@. Requesting key", buf, 0x16u);
      }
    }

    self->_BOOL disableDuplicateFilterOnce = 0;
    v43 = (NSData *)[v10 copy];
    uint64_t v57 = 0;
    p_super = &self->_lastRawAdvertisementData->super;
    self->_lastRawAdvertisementData = v43;
    goto LABEL_20;
  }
LABEL_24:
}

- (SDActivityDecryptionKey)decryptionKey
{
  v3 = +[SDActivityEncryptionManager sharedEncryptionManager];
  v4 = [(IDSDevice *)self->_idsDevice uniqueIDOverride];
  id v5 = [v3 decryptionKeyForDeviceIdentifier:v4];

  lastUsedKeyIdentifier = self->_lastUsedKeyIdentifier;
  BOOL v7 = [v5 keyIdentifier];
  LOBYTE(lastUsedKeyIdentifier) = [(NSUUID *)lastUsedKeyIdentifier isEqual:v7];

  if ((lastUsedKeyIdentifier & 1) == 0)
  {
    v8 = [v5 keyIdentifier];
    v9 = self->_lastUsedKeyIdentifier;
    self->_lastUsedKeyIdentifier = v8;

    lastAdvertisementData = self->_lastAdvertisementData;
    self->_lastAdvertisementData = 0;
  }

  return (SDActivityDecryptionKey *)v5;
}

- ($126081439F6B1623D1821CF14B226F9E)lastActivityAdvertisement
{
  lastAdvertisementData = self->_lastAdvertisementData;
  if (!lastAdvertisementData) {
    lastAdvertisementData = self->_lastRawAdvertisementData;
  }
  uint64_t v4 = sub_1000C9A58(lastAdvertisementData);
  uint64_t v6 = v5 & 0xFFFFFFFFFFFFLL;
  result.var8 = v6;
  result.var9 = BYTE1(v6);
  result.var10 = BYTE2(v6);
  result.var11 = BYTE3(v6);
  result.var12 = BYTE4(v6);
  result.var13 = BYTE5(v6);
  result.var0 = v4;
  result.var1 = BYTE1(v4);
  result.var2 = BYTE2(v4);
  result.var3 = BYTE3(v4);
  result.var4 = BYTE4(v4);
  result.var5 = BYTE5(v4);
  result.var6 = BYTE6(v4);
  result.var7 = HIBYTE(v4);
  return result;
}

- (unsigned)lastCounter
{
  if (self->_lastAdvertisementData)
  {
    unsigned int v3 = [(SDActivityDeviceRecord *)self lastActivityAdvertisement];
    return sub_1000C9AF8(v3);
  }
  else
  {
    uint64_t v5 = [(SDActivityDeviceRecord *)self decryptionKey];

    if (v5)
    {
      uint64_t v6 = [(SDActivityDeviceRecord *)self decryptionKey];
      LOWORD(v5) = (unsigned __int16)[v6 lastUsedCounter] - 1;
    }
    return (unsigned __int16)v5;
  }
}

- (NSData)lastAdvertisementPayload
{
  if (self->_lastAdvertisementData)
  {
    id v2 = [(SDActivityDeviceRecord *)self lastActivityAdvertisement];
    uint64_t v4 = sub_1000C9B00((uint64_t)v2, v3 & 0xFFFFFFFFFFFFLL);
  }
  else
  {
    uint64_t v4 = 0;
  }

  return (NSData *)v4;
}

- (NSDictionary)lastAdvertisementOptions
{
  if (self->_lastAdvertisementData)
  {
    id v3 = [(SDActivityDeviceRecord *)self lastActivityAdvertisement];
    uint64_t v5 = sub_1000C9B78((unint64_t)v3, v4 & 0xFFFFFFFFFFFFLL, (int)[(IDSDevice *)self->_idsDevice isDefaultPairedDevice]);
  }
  else
  {
    uint64_t v5 = 0;
  }

  return (NSDictionary *)v5;
}

- (SFActivityAdvertisement)clientAdvertisement
{
  id v3 = sub_1000C9CC4(self->_idsDevice);
  id v4 = objc_alloc((Class)SFActivityAdvertisement);
  uint64_t v5 = [(SDActivityDeviceRecord *)self lastActivityAdvertisement];
  uint64_t v6 = [(SDActivityDeviceRecord *)self lastAdvertisementPayload];
  BOOL v7 = [(SDActivityDeviceRecord *)self lastAdvertisementOptions];
  id v8 = [v4 initWithAdvertisementVersion:v5 advertisementPayload:v6 options:v7 device:v3];

  return (SFActivityAdvertisement *)v8;
}

- (IDSDevice)idsDevice
{
  return self->_idsDevice;
}

- (void)setIdsDevice:(id)a3
{
}

- (BOOL)deviceTracked
{
  return self->_deviceTracked;
}

- (void)setDeviceTracked:(BOOL)a3
{
  self->_deviceTracked = a3;
}

- (BOOL)disableDuplicateFilterOnce
{
  return self->_disableDuplicateFilterOnce;
}

- (void)setDisableDuplicateFilterOnce:(BOOL)a3
{
  self->_BOOL disableDuplicateFilterOnce = a3;
}

- (NSData)lastRawAdvertisementData
{
  return self->_lastRawAdvertisementData;
}

- (NSUUID)lastUsedKeyIdentifier
{
  return self->_lastUsedKeyIdentifier;
}

- (void)setLastUsedKeyIdentifier:(id)a3
{
}

- (NSData)lastAdvertisementData
{
  return self->_lastAdvertisementData;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lastAdvertisementData, 0);
  objc_storeStrong((id *)&self->_lastUsedKeyIdentifier, 0);
  objc_storeStrong((id *)&self->_lastRawAdvertisementData, 0);
  objc_storeStrong((id *)&self->_idsDevice, 0);

  objc_storeStrong((id *)&self->_lastReceivedAdvertisementDate, 0);
}

@end