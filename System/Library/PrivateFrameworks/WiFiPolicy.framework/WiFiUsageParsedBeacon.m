@interface WiFiUsageParsedBeacon
+ (id)config;
+ (id)isValidIE:(unsigned __int8)a3 ofLen:(unsigned __int8)a4 withIsExtended:(BOOL)a5;
+ (void)defaults;
+ (void)initialize;
+ (void)updateConfig;
- (BOOL)colocated6Ghz;
- (BOOL)colocated6GhzIsPSC;
- (BOOL)hasColocatedMLD2G;
- (BOOL)hasColocatedMLD5G;
- (BOOL)hasColocatedMLD6G;
- (BOOL)hasEHT;
- (BOOL)hasHE;
- (BOOL)hasHT;
- (BOOL)hasVHT;
- (BOOL)parseApName:(char *)a3 length:(unint64_t)a4 endOfBuffer:(char *)a5;
- (BOOL)parseBeaconIE:(char *)a3 length:(unint64_t)a4 endOfBuffer:(char *)a5;
- (BOOL)parseDSSS:(char *)a3 length:(unint64_t)a4 endOfBuffer:(char *)a5;
- (BOOL)parseEHTCapa:(char *)a3 length:(unint64_t)a4 endOfBuffer:(char *)a5;
- (BOOL)parseExtendedIE:(unsigned __int8)a3 from:(char *)a4 length:(unint64_t)a5 endOfBuffer:(char *)a6;
- (BOOL)parseHE6GHz:(char *)a3 length:(unint64_t)a4 endOfBuffer:(char *)a5;
- (BOOL)parseHECapa:(char *)a3 length:(unint64_t)a4 endOfBuffer:(char *)a5;
- (BOOL)parseHTCapa:(char *)a3 length:(unint64_t)a4 endOfBuffer:(char *)a5;
- (BOOL)parseHTOp:(char *)a3 length:(unint64_t)a4 endOfBuffer:(char *)a5;
- (BOOL)parseNormalIE:(unsigned __int8)a3 from:(char *)a4 length:(unint64_t)a5 endOfBuffer:(char *)a6;
- (BOOL)parseRNR:(char *)a3 length:(unint64_t)a4 endOfBuffer:(char *)a5;
- (BOOL)parseVHTCapa:(char *)a3 length:(unint64_t)a4 endOfBuffer:(char *)a5;
- (BOOL)parsingSuccessful;
- (NSData)heMACInfo;
- (NSData)hePHYInfo;
- (NSData)htMCSSet;
- (NSMutableDictionary)extendedIEList;
- (NSMutableDictionary)taggedIEList;
- (NSMutableDictionary)vendorIEList;
- (NSNumber)isBeaconAtHeRate;
- (NSString)apName;
- (NSString)bssid;
- (WiFiUsageParsedBeacon)initWithBeaconData:(id)a3 andAdditionalMetadata:(id)a4;
- (id)description;
- (id)dictionaryRepresentation;
- (unsigned)band;
- (unsigned)beaconInterval;
- (unsigned)capabilities;
- (unsigned)channel;
- (unsigned)heRxMCSMap160MHz;
- (unsigned)heRxMCSMap8080MHz;
- (unsigned)heRxMCSMap80MHz;
- (unsigned)heRxNSS;
- (unsigned)heTxMCSMap160MHz;
- (unsigned)heTxMCSMap8080MHz;
- (unsigned)heTxMCSMap80MHz;
- (unsigned)heTxNSS;
- (unsigned)htAMPDUParams;
- (unsigned)htAntennaSelection;
- (unsigned)htExtendedCapabilities;
- (unsigned)htInfo;
- (unsigned)htRxNSS;
- (unsigned)htTxBFCapabilities;
- (unsigned)htTxNSS;
- (unsigned)vhtInfo;
- (unsigned)vhtRxMCSMap;
- (unsigned)vhtRxMaxRate;
- (unsigned)vhtRxNSS;
- (unsigned)vhtTxMCSMap;
- (unsigned)vhtTxMaxRate;
- (unsigned)vhtTxNSS;
- (void)setApName:(id)a3;
- (void)setBand:(unsigned __int8)a3;
- (void)setBeaconInterval:(unsigned __int16)a3;
- (void)setBssid:(id)a3;
- (void)setCapabilities:(unsigned __int16)a3;
- (void)setChannel:(unsigned __int8)a3;
- (void)setColocated6Ghz:(BOOL)a3;
- (void)setColocated6GhzIsPSC:(BOOL)a3;
- (void)setExtendedIEList:(id)a3;
- (void)setHasColocatedMLD2G:(BOOL)a3;
- (void)setHasColocatedMLD5G:(BOOL)a3;
- (void)setHasColocatedMLD6G:(BOOL)a3;
- (void)setHasEHT:(BOOL)a3;
- (void)setHasHE:(BOOL)a3;
- (void)setHasHT:(BOOL)a3;
- (void)setHasVHT:(BOOL)a3;
- (void)setHeMACInfo:(id)a3;
- (void)setHePHYInfo:(id)a3;
- (void)setHeRxMCSMap160MHz:(unsigned __int16)a3;
- (void)setHeRxMCSMap8080MHz:(unsigned __int16)a3;
- (void)setHeRxMCSMap80MHz:(unsigned __int16)a3;
- (void)setHeRxNSS:(unsigned __int8)a3;
- (void)setHeTxMCSMap160MHz:(unsigned __int16)a3;
- (void)setHeTxMCSMap8080MHz:(unsigned __int16)a3;
- (void)setHeTxMCSMap80MHz:(unsigned __int16)a3;
- (void)setHeTxNSS:(unsigned __int8)a3;
- (void)setHtAMPDUParams:(unsigned __int8)a3;
- (void)setHtAntennaSelection:(unsigned __int8)a3;
- (void)setHtExtendedCapabilities:(unsigned __int16)a3;
- (void)setHtInfo:(unsigned __int16)a3;
- (void)setHtRxNSS:(unsigned __int8)a3;
- (void)setHtTxBFCapabilities:(unsigned int)a3;
- (void)setHtTxNSS:(unsigned __int8)a3;
- (void)setIsBeaconAtHeRate:(id)a3;
- (void)setParsingSuccessful:(BOOL)a3;
- (void)setTaggedIEList:(id)a3;
- (void)setVendorIEList:(id)a3;
- (void)setVhtInfo:(unsigned int)a3;
- (void)setVhtRxMCSMap:(unsigned __int16)a3;
- (void)setVhtRxMaxRate:(unsigned __int16)a3;
- (void)setVhtRxNSS:(unsigned __int8)a3;
- (void)setVhtTxMCSMap:(unsigned __int16)a3;
- (void)setVhtTxMaxRate:(unsigned __int16)a3;
- (void)setVhtTxNSS:(unsigned __int8)a3;
@end

@implementation WiFiUsageParsedBeacon

- (BOOL)parseBeaconIE:(char *)a3 length:(unint64_t)a4 endOfBuffer:(char *)a5
{
  if (a4 < 3) {
    return 1;
  }
  v6 = a5;
  unint64_t v7 = a4;
  v9 = self;
  unint64_t v10 = 0x1E4F29000uLL;
  v11 = &off_1E69BC000;
  while (1)
  {
    if (a3 + 1 > v6)
    {
      NSLog(&cfstr_SReachedEndOfB.isa, a2, "-[WiFiUsageParsedBeacon parseBeaconIE:length:endOfBuffer:]", v7, a3, 1, a3 + 1, v6);
      return 0;
    }
    v12 = a3 + 2;
    uint64_t v13 = *a3;
    if (a3 + 2 > v6)
    {
      NSLog(&cfstr_SReachedEndOfB_0.isa, a2, "-[WiFiUsageParsedBeacon parseBeaconIE:length:endOfBuffer:]", v13, a3 + 1, 1, a3 + 2, v6);
      return 0;
    }
    uint64_t v14 = a3[1];
    if (&v12[v14] > v6)
    {
      NSLog(&cfstr_SReachedEndOfB_1.isa, a2, "-[WiFiUsageParsedBeacon parseBeaconIE:length:endOfBuffer:]", v13, v14, a3 + 2, v14, &v12[v14], v6);
      return 0;
    }
    uint64_t v69 = MEMORY[0x1D9440170]();
    v15 = *(void **)(v10 + 24);
    [v11[107] prefixForCA];
    v17 = v16 = v11;
    uint64_t v18 = [v15 stringWithFormat:@"%@%u", v17, v13];

    if (v13 != 255) {
      break;
    }
    v68 = (void *)v18;
    uint64_t v31 = a3[2];
    unint64_t v32 = v10;
    unsigned __int8 v33 = v14 - 1;
    v34 = +[WiFiUsageParsedBeacon isValidIE:v31 ofLen:(v14 - 1) withIsExtended:1];
    v35 = v9;
    extendedIEList = v9->_extendedIEList;
    v37 = *(void **)(v32 + 24);
    v38 = [v16[107] prefixForCA];
    v39 = [v37 stringWithFormat:@"%@255_%d_isValid", v38, v31];
    [(NSMutableDictionary *)extendedIEList setValue:v34 forKey:v39];

    v70 = v34;
    if (v34 && ([v34 BOOLValue] & 1) == 0)
    {
      taggedIEList = v35->_taggedIEList;
      v41 = NSString;
      v42 = [v16[107] prefixForCA];
      v43 = [v41 stringWithFormat:@"%@255_%u_isValid", v42, v31];
      v44 = [(NSMutableDictionary *)taggedIEList objectForKeyedSubscript:v43];
      v16 = &off_1E69BC000;
      NSLog(&cfstr_SElementUIsInv.isa, "-[WiFiUsageParsedBeacon parseBeaconIE:length:endOfBuffer:]", v31, v44);
    }
    uint64_t v14 = v33;
    v6 = a5;
    if (!-[WiFiUsageParsedBeacon parseExtendedIE:from:length:endOfBuffer:](v35, "parseExtendedIE:from:length:endOfBuffer:", v31, a3 + 3, v33))
    {
      v22 = v68;
      v62 = (void *)v69;
      goto LABEL_34;
    }
    unint64_t v45 = v7 - 3;
    v46 = self->_extendedIEList;
    v47 = [MEMORY[0x1E4F1C9B8] dataWithBytes:a3 + 3 length:v14];
    v48 = NSString;
    v49 = [v16[107] prefixForCA];
    v50 = v48;
    unint64_t v24 = v45;
    v51 = [v50 stringWithFormat:@"%@255_%d", v49, v31];
    v52 = v46;
    v9 = self;
    [(NSMutableDictionary *)v52 setValue:v47 forKey:v51];

    v11 = &off_1E69BC000;
    uint64_t v53 = 3;
    v22 = v68;
    v54 = (void *)v69;
LABEL_26:

    a3 += v53 + v14;
    unint64_t v7 = v24 - v14;
    unint64_t v10 = 0x1E4F29000;
    if (v7 <= 2) {
      return 1;
    }
  }
  v19 = +[WiFiUsageParsedBeacon isValidIE:v13 ofLen:v14 withIsExtended:0];
  v20 = v9->_taggedIEList;
  v21 = [*(id *)(v10 + 24) stringWithFormat:@"%@_isValid", v18];
  [(NSMutableDictionary *)v20 setValue:v19 forKey:v21];

  v22 = (void *)v18;
  if (v19 && ([v19 BOOLValue] & 1) == 0)
  {
    v23 = [(NSMutableDictionary *)self->_taggedIEList objectForKeyedSubscript:v18];
    NSLog(&cfstr_SElementUIsInv.isa, "-[WiFiUsageParsedBeacon parseBeaconIE:length:endOfBuffer:]", v13, v23);
  }
  v70 = v19;
  unint64_t v24 = v7 - 2;
  v11 = &off_1E69BC000;
  if (v13 == 221)
  {
    unint64_t v65 = v24;
    v67 = (void *)v18;
    __memcpy_chk();
    v25 = NSString;
    uint64_t v26 = +[WiFiUsageAccessPointProfile prefixForCA];
    v27 = (void *)v26;
    if (v14 < 4)
    {
      v30 = [v25 stringWithFormat:@"%@%02X:%02X:%02X%@%@", v26, 0, 0, 0, &stru_1F2B5AC50, &stru_1F2B5AC50];
      v11 = &off_1E69BC000;
      v22 = v67;
      v54 = (void *)v69;
      v6 = a5;
    }
    else
    {
      v63 = v25;
      uint64_t v28 = objc_msgSend(NSString, "stringWithFormat:", @"-%d", 0);
      uint64_t v29 = v28;
      v64 = (void *)v28;
      if (v14 == 4)
      {
        v30 = [v63 stringWithFormat:@"%@%02X:%02X:%02X%@%@", v27, 0, 0, 0, v28, &stru_1F2B5AC50];
      }
      else
      {
        v58 = objc_msgSend(NSString, "stringWithFormat:", @"-%d", 0);
        v30 = [v63 stringWithFormat:@"%@%02X:%02X:%02X%@%@", v27, 0, 0, 0, v29, v58];
      }
      v11 = &off_1E69BC000;
      v22 = v67;
      v54 = (void *)v69;
      v6 = a5;
    }
    vendorIEList = self->_vendorIEList;
    v60 = [MEMORY[0x1E4F1C9B8] dataWithBytes:a3 + 2 length:v14];
    v61 = vendorIEList;
    v9 = self;
    [(NSMutableDictionary *)v61 setValue:v60 forKey:v30];

    uint64_t v53 = 2;
    unint64_t v24 = v65;
    goto LABEL_26;
  }
  v6 = a5;
  if ([(WiFiUsageParsedBeacon *)self parseNormalIE:v13 from:a3 + 2 length:v14 endOfBuffer:a5])
  {
    v55 = self->_taggedIEList;
    v56 = [MEMORY[0x1E4F1C9B8] dataWithBytes:a3 + 2 length:v14];
    v57 = v55;
    v9 = self;
    [(NSMutableDictionary *)v57 setValue:v56 forKey:v22];

    uint64_t v53 = 2;
    v54 = (void *)v69;
    goto LABEL_26;
  }
  v62 = (void *)v69;
LABEL_34:

  return 0;
}

- (WiFiUsageParsedBeacon)initWithBeaconData:(id)a3 andAdditionalMetadata:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v23.receiver = self;
  v23.super_class = (Class)WiFiUsageParsedBeacon;
  v8 = [(WiFiUsageParsedBeacon *)&v23 init];
  if (v8)
  {
    unint64_t v9 = [v6 length];
    id v10 = v6;
    uint64_t v11 = [v10 bytes];
    if (v9 >= 0x25)
    {
      uint64_t v12 = *(unsigned __int16 *)(v11 + 32);
      uint64_t v13 = *(unsigned __int16 *)(v11 + 34);
      uint64_t v14 = v11 + 36;
      v15 = objc_msgSend(NSString, "stringWithFormat:", @"%x:%02x:%02x:%02x:%02x:%02x", *(unsigned __int8 *)(v11 + 16), *(unsigned __int8 *)(v11 + 17), *(unsigned __int8 *)(v11 + 18), *(unsigned __int8 *)(v11 + 19), *(unsigned __int8 *)(v11 + 20), *(unsigned __int8 *)(v11 + 21));
      [(WiFiUsageParsedBeacon *)v8 setBssid:v15];

      [(WiFiUsageParsedBeacon *)v8 setBeaconInterval:v12];
      [(WiFiUsageParsedBeacon *)v8 setCapabilities:v13];
      [(WiFiUsageParsedBeacon *)v8 setChannel:0];
      [(WiFiUsageParsedBeacon *)v8 setBand:0];
      [(WiFiUsageParsedBeacon *)v8 setHasHT:0];
      [(WiFiUsageParsedBeacon *)v8 setHasVHT:0];
      [(WiFiUsageParsedBeacon *)v8 setHasHE:0];
      v16 = [MEMORY[0x1E4F1CA60] dictionary];
      [(WiFiUsageParsedBeacon *)v8 setTaggedIEList:v16];

      v17 = [MEMORY[0x1E4F1CA60] dictionary];
      [(WiFiUsageParsedBeacon *)v8 setVendorIEList:v17];

      uint64_t v18 = [MEMORY[0x1E4F1CA60] dictionary];
      [(WiFiUsageParsedBeacon *)v8 setExtendedIEList:v18];

      [(WiFiUsageParsedBeacon *)v8 setParsingSuccessful:1];
      [(WiFiUsageParsedBeacon *)v8 setColocated6Ghz:0];
      [(WiFiUsageParsedBeacon *)v8 setColocated6GhzIsPSC:0];
      [(WiFiUsageParsedBeacon *)v8 setApName:0];
      v19 = [v7 objectForKey:@"IS_BEACON_AT_HE_RATE"];
      [(WiFiUsageParsedBeacon *)v8 setIsBeaconAtHeRate:v19];

      id v20 = v10;
      -[WiFiUsageParsedBeacon setParsingSuccessful:](v8, "setParsingSuccessful:", -[WiFiUsageParsedBeacon parseBeaconIE:length:endOfBuffer:](v8, "parseBeaconIE:length:endOfBuffer:", v14, v9 - 36, [v20 bytes] + objc_msgSend(v20, "length")));
      if (!v8->_band && v8->_channel)
      {
        if (v8->_channel <= 0x13u) {
          uint64_t v21 = 2;
        }
        else {
          uint64_t v21 = 5;
        }
        [(WiFiUsageParsedBeacon *)v8 setBand:v21];
      }
    }
    else
    {
      NSLog(&cfstr_SInvalidBeacon.isa, "-[WiFiUsageParsedBeacon initWithBeaconData:andAdditionalMetadata:]", v9);

      v8 = 0;
    }
  }

  return v8;
}

- (id)dictionaryRepresentation
{
  uint64_t v104 = *MEMORY[0x1E4F143B8];
  v3 = [MEMORY[0x1E4F1CA60] dictionary];
  v4 = +[WiFiUsagePrivacyFilter reformatMACAddress:self->_bssid];
  [v3 setObject:v4 forKeyedSubscript:@"bssid"];

  v5 = +[WiFiUsagePrivacyFilter sanitizedOUI:self->_bssid];
  [v3 setObject:v5 forKeyedSubscript:@"oui"];

  id v6 = [v3 objectForKeyedSubscript:@"oui"];
  id v7 = [v3 objectForKeyedSubscript:@"bssid"];
  v8 = [v7 substringToIndex:8];
  char v9 = [v6 isEqualToString:v8];

  if ((v9 & 1) == 0)
  {
    id v10 = [NSNumber numberWithBool:1];
    [v3 setObject:v10 forKeyedSubscript:@"oui_was_sanitized"];
  }
  uint64_t v11 = [NSNumber numberWithShort:(__int16)self->_beaconInterval];
  [v3 setObject:v11 forKeyedSubscript:@"BeaconInterval"];

  uint64_t v12 = [NSNumber numberWithShort:(__int16)self->_capabilities];
  [v3 setObject:v12 forKeyedSubscript:@"Capabilities"];

  if (self->_band)
  {
    uint64_t v13 = objc_msgSend(NSNumber, "numberWithShort:");
    [v3 setObject:v13 forKeyedSubscript:@"Band"];
  }
  uint64_t v14 = [NSNumber numberWithBool:self->_hasHT];
  [v3 setObject:v14 forKeyedSubscript:@"isHT"];

  v15 = [NSNumber numberWithBool:self->_hasVHT];
  [v3 setObject:v15 forKeyedSubscript:@"isVHT"];

  v16 = [NSNumber numberWithBool:self->_hasHE];
  [v3 setObject:v16 forKeyedSubscript:@"isHE"];

  v17 = [NSNumber numberWithBool:self->_hasEHT];
  [v3 setObject:v17 forKeyedSubscript:@"isEHT"];

  if (self->_hasHT)
  {
    if (self->_htRxNSS)
    {
      uint64_t v18 = objc_msgSend(NSNumber, "numberWithShort:");
      [v3 setObject:v18 forKeyedSubscript:@"HtRxNSS"];
    }
    if (self->_htTxNSS)
    {
      v19 = objc_msgSend(NSNumber, "numberWithShort:");
      [v3 setObject:v19 forKeyedSubscript:@"HtTxNSS"];
    }
  }
  if (self->_hasVHT)
  {
    if (self->_vhtRxNSS)
    {
      id v20 = objc_msgSend(NSNumber, "numberWithShort:");
      [v3 setObject:v20 forKeyedSubscript:@"VhtRxNSS"];
    }
    if (self->_vhtTxNSS)
    {
      uint64_t v21 = objc_msgSend(NSNumber, "numberWithShort:");
      [v3 setObject:v21 forKeyedSubscript:@"VhtTxNSS"];
    }
  }
  if (self->_hasHE)
  {
    if (self->_heRxNSS)
    {
      v22 = objc_msgSend(NSNumber, "numberWithShort:");
      [v3 setObject:v22 forKeyedSubscript:@"HeRxNSS"];
    }
    if (self->_heTxNSS)
    {
      objc_super v23 = objc_msgSend(NSNumber, "numberWithShort:");
      [v3 setObject:v23 forKeyedSubscript:@"HeTxNSS"];
    }
  }
  unint64_t v24 = [NSNumber numberWithBool:self->_colocated6Ghz];
  [v3 setObject:v24 forKeyedSubscript:@"hasColocated6Ghz"];

  if (self->_colocated6Ghz)
  {
    v25 = [NSNumber numberWithBool:self->_colocated6GhzIsPSC];
    [v3 setObject:v25 forKeyedSubscript:@"colocated6GhzIsPSC"];
  }
  apName = self->_apName;
  if (apName) {
    [v3 setObject:apName forKeyedSubscript:@"apName"];
  }
  v27 = objc_opt_new();
  uint64_t v28 = v27;
  if (self->_hasColocatedMLD6G) {
    [v27 addObject:@"6G"];
  }
  if (self->_hasColocatedMLD5G) {
    [v28 addObject:@"5G"];
  }
  if (self->_hasColocatedMLD2G) {
    [v28 addObject:@"2G"];
  }
  v76 = v28;
  uint64_t v29 = [v28 componentsJoinedByString:@","];
  [v3 setObject:v29 forKeyedSubscript:@"hasColocatedMLOs"];

  [v3 addEntriesFromDictionary:self->_taggedIEList];
  [v3 addEntriesFromDictionary:self->_vendorIEList];
  v77 = v3;
  [v3 addEntriesFromDictionary:self->_extendedIEList];
  v30 = objc_opt_new();
  uint64_t v31 = objc_opt_new();
  long long v95 = 0u;
  long long v96 = 0u;
  long long v97 = 0u;
  long long v98 = 0u;
  v78 = self;
  unint64_t v32 = [(NSMutableDictionary *)self->_taggedIEList allKeys];
  unsigned __int8 v33 = [MEMORY[0x1E4F28F60] predicateWithFormat:@"NOT (SELF ENDSWITH \"_isValid\""];
  v34 = [v32 filteredArrayUsingPredicate:v33];

  uint64_t v35 = [v34 countByEnumeratingWithState:&v95 objects:v103 count:16];
  if (v35)
  {
    uint64_t v36 = v35;
    uint64_t v37 = *(void *)v96;
    do
    {
      for (uint64_t i = 0; i != v36; ++i)
      {
        if (*(void *)v96 != v37) {
          objc_enumerationMutation(v34);
        }
        v39 = *(void **)(*((void *)&v95 + 1) + 8 * i);
        v40 = NSNumber;
        v41 = +[WiFiUsageAccessPointProfile prefixForCA];
        v42 = objc_msgSend(v39, "substringFromIndex:", objc_msgSend(v41, "length"));
        v43 = objc_msgSend(v40, "numberWithInteger:", objc_msgSend(v42, "integerValue"));
        [v31 addObject:v43];
      }
      uint64_t v36 = [v34 countByEnumeratingWithState:&v95 objects:v103 count:16];
    }
    while (v36);
  }

  long long v93 = 0u;
  long long v94 = 0u;
  long long v91 = 0u;
  long long v92 = 0u;
  v44 = objc_msgSend(v31, "sortedArrayUsingSelector:");
  uint64_t v45 = [v44 countByEnumeratingWithState:&v91 objects:v102 count:16];
  if (v45)
  {
    uint64_t v46 = v45;
    uint64_t v47 = *(void *)v92;
    do
    {
      for (uint64_t j = 0; j != v46; ++j)
      {
        if (*(void *)v92 != v47) {
          objc_enumerationMutation(v44);
        }
        [v30 appendFormat:@"%@|", *(void *)(*((void *)&v91 + 1) + 8 * j)];
      }
      uint64_t v46 = [v44 countByEnumeratingWithState:&v91 objects:v102 count:16];
    }
    while (v46);
  }

  [v31 removeAllObjects];
  long long v89 = 0u;
  long long v90 = 0u;
  long long v87 = 0u;
  long long v88 = 0u;
  v49 = [(NSMutableDictionary *)v78->_extendedIEList allKeys];
  v50 = [MEMORY[0x1E4F28F60] predicateWithFormat:@"NOT (SELF ENDSWITH \"_isValid\""];
  v51 = [v49 filteredArrayUsingPredicate:v50];

  uint64_t v52 = [v51 countByEnumeratingWithState:&v87 objects:v101 count:16];
  if (v52)
  {
    uint64_t v53 = v52;
    uint64_t v54 = *(void *)v88;
    do
    {
      for (uint64_t k = 0; k != v53; ++k)
      {
        if (*(void *)v88 != v54) {
          objc_enumerationMutation(v51);
        }
        v56 = *(void **)(*((void *)&v87 + 1) + 8 * k);
        v57 = NSNumber;
        v58 = +[WiFiUsageAccessPointProfile prefixForCA];
        v59 = objc_msgSend(v56, "substringFromIndex:", objc_msgSend(v58, "length") + 4);
        v60 = objc_msgSend(v57, "numberWithInteger:", objc_msgSend(v59, "integerValue"));
        [v31 addObject:v60];
      }
      uint64_t v53 = [v51 countByEnumeratingWithState:&v87 objects:v101 count:16];
    }
    while (v53);
  }

  long long v85 = 0u;
  long long v86 = 0u;
  long long v83 = 0u;
  long long v84 = 0u;
  v61 = [v31 sortedArrayUsingSelector:sel_compare_];
  uint64_t v62 = [v61 countByEnumeratingWithState:&v83 objects:v100 count:16];
  if (v62)
  {
    uint64_t v63 = v62;
    uint64_t v64 = *(void *)v84;
    do
    {
      for (uint64_t m = 0; m != v63; ++m)
      {
        if (*(void *)v84 != v64) {
          objc_enumerationMutation(v61);
        }
        [v30 appendFormat:@"255_%@|", *(void *)(*((void *)&v83 + 1) + 8 * m)];
      }
      uint64_t v63 = [v61 countByEnumeratingWithState:&v83 objects:v100 count:16];
    }
    while (v63);
  }

  long long v81 = 0u;
  long long v82 = 0u;
  long long v79 = 0u;
  long long v80 = 0u;
  v66 = [(NSMutableDictionary *)v78->_vendorIEList allKeys];
  v67 = [v66 sortedArrayUsingSelector:sel_compare_];

  uint64_t v68 = [v67 countByEnumeratingWithState:&v79 objects:v99 count:16];
  if (v68)
  {
    uint64_t v69 = v68;
    uint64_t v70 = *(void *)v80;
    do
    {
      for (uint64_t n = 0; n != v69; ++n)
      {
        if (*(void *)v80 != v70) {
          objc_enumerationMutation(v67);
        }
        v72 = *(void **)(*((void *)&v79 + 1) + 8 * n);
        v73 = +[WiFiUsageAccessPointProfile prefixForCA];
        v74 = objc_msgSend(v72, "substringFromIndex:", objc_msgSend(v73, "length"));
        [v30 appendFormat:@"%@|", v74];
      }
      uint64_t v69 = [v67 countByEnumeratingWithState:&v79 objects:v99 count:16];
    }
    while (v69);
  }

  [v77 setObject:v30 forKeyedSubscript:@"IEs_in_frame"];
  [v77 setValue:0 forKey:@"BeaconInformationElement_221_isValid"];
  [v77 setObject:v78->_isBeaconAtHeRate forKeyedSubscript:@"isBeaconAtHeRate"];

  return v77;
}

- (id)description
{
  uint64_t v68 = *MEMORY[0x1E4F143B8];
  v5 = (void *)MEMORY[0x1E4F28E78];
  if (self->_parsingSuccessful) {
    id v6 = @"successful";
  }
  else {
    id v6 = @"FAILED";
  }
  id v7 = +[WiFiUsagePrivacyFilter sanitizedOUI:self->_bssid];
  v8 = [v5 stringWithFormat:@"Beacon parsing %@.\noui: %@\nBeaconInterval:%d\nCapabilities:0x%02X\nBand:%u\tChannel:%u", v6, v7, self->_beaconInterval, self->_capabilities, self->_band, self->_channel];

  if (self->_colocated6Ghz)
  {
    if (self->_colocated6GhzIsPSC) {
      char v9 = @"YES";
    }
    else {
      char v9 = @"NO";
    }
    [v8 appendFormat:@"hasColocated6Ghz: YES onPSCchan:%@", v9];
  }
  if (self->_apName) {
    [v8 appendFormat:@"\napName:%@", self->_apName];
  }
  if (self->_hasHT)
  {
    if (self->_htInfo) {
      objc_msgSend(v8, "appendFormat:", @"\nHtInfo:0x%02X", self->_htInfo);
    }
    if (self->_htAMPDUParams) {
      objc_msgSend(v8, "appendFormat:", @" HtAMPDUParams:0x%02X", self->_htAMPDUParams);
    }
    if (self->_htExtendedCapabilities) {
      objc_msgSend(v8, "appendFormat:", @" HtExtendedCapabilities:0x%02X", self->_htExtendedCapabilities);
    }
    if (self->_htTxBFCapabilities) {
      objc_msgSend(v8, "appendFormat:", @" HtTxBFCapabilities:0x%02X", self->_htTxBFCapabilities);
    }
    if (self->_htAntennaSelection) {
      objc_msgSend(v8, "appendFormat:", @" HtAntennaSelection:0x%02X", self->_htAntennaSelection);
    }
    if (self->_htRxNSS) {
      objc_msgSend(v8, "appendFormat:", @" HtRxNSS:%d", self->_htRxNSS);
    }
    if (self->_htTxNSS) {
      objc_msgSend(v8, "appendFormat:", @" HtTxNSS:%d", self->_htTxNSS);
    }
  }
  if (self->_hasVHT)
  {
    if (self->_vhtInfo) {
      objc_msgSend(v8, "appendFormat:", @"\nVhtInfo:0x%02X", self->_vhtInfo);
    }
    if (self->_vhtRxMCSMap) {
      objc_msgSend(v8, "appendFormat:", @" VhtRxMCSMap:0x%02X", self->_vhtRxMCSMap);
    }
    if (self->_vhtRxMaxRate) {
      objc_msgSend(v8, "appendFormat:", @" VhtRxMaxRate:0x%02X", self->_vhtRxMaxRate);
    }
    if (self->_vhtTxMCSMap) {
      objc_msgSend(v8, "appendFormat:", @" VhtTxMCSMap:0x%02X", self->_vhtTxMCSMap);
    }
    if (self->_vhtTxMaxRate) {
      objc_msgSend(v8, "appendFormat:", @" VhtTxMaxRate:0x%02X", self->_vhtTxMaxRate);
    }
    if (self->_vhtRxNSS) {
      objc_msgSend(v8, "appendFormat:", @" VhtRxNSS:%d", self->_vhtRxNSS);
    }
    if (self->_vhtTxNSS) {
      objc_msgSend(v8, "appendFormat:", @" VhtTxNSS:%d", self->_vhtTxNSS);
    }
  }
  if (self->_hasHE)
  {
    if (self->_heMACInfo) {
      [v8 appendFormat:@"\nHE MAC Info:%@", self->_heMACInfo];
    }
    if (self->_hePHYInfo) {
      [v8 appendFormat:@" HE PHY Info:%@", self->_hePHYInfo];
    }
    if (self->_heRxNSS) {
      objc_msgSend(v8, "appendFormat:", @" HeRxNSS:%d", self->_heRxNSS);
    }
    if (self->_heTxNSS) {
      objc_msgSend(v8, "appendFormat:", @" HeTxNSS:%d", self->_heTxNSS);
    }
  }
  id v51 = v8;
  long long v63 = 0u;
  long long v64 = 0u;
  long long v61 = 0u;
  long long v62 = 0u;
  id v10 = [(NSMutableDictionary *)self->_taggedIEList allKeys];
  [MEMORY[0x1E4F28F60] predicateWithFormat:@"NOT (SELF ENDSWITH \"_isValid\""];
  uint64_t v11 = v52 = self;
  uint64_t v12 = [v10 filteredArrayUsingPredicate:v11];

  uint64_t v13 = v52;
  obuint64_t j = v12;
  uint64_t v49 = [v12 countByEnumeratingWithState:&v61 objects:v67 count:16];
  if (v49)
  {
    uint64_t v47 = *(void *)v62;
    do
    {
      for (uint64_t i = 0; i != v49; ++i)
      {
        if (*(void *)v62 != v47) {
          objc_enumerationMutation(obj);
        }
        uint64_t v15 = *(void *)(*((void *)&v61 + 1) + 8 * i);
        v16 = [(NSMutableDictionary *)v13->_taggedIEList objectForKeyedSubscript:v15];
        taggedIEList = v13->_taggedIEList;
        uint64_t v18 = [NSString stringWithFormat:@"%@_isValid", v15];
        v19 = [(NSMutableDictionary *)taggedIEList objectForKeyedSubscript:v18];
        if (!v19
          || (id v20 = v13->_taggedIEList,
              [NSString stringWithFormat:@"%@_isValid", v15],
              id v2 = (id)objc_claimAutoreleasedReturnValue(),
              [(NSMutableDictionary *)v20 objectForKeyedSubscript:v2],
              v3 = objc_claimAutoreleasedReturnValue(),
              uint64_t v21 = @" (invalid!) :",
              [v3 BOOLValue]))
        {
          uint64_t v21 = &stru_1F2B5AC50;
        }
        id v22 = v16;
        objc_super v23 = +[WiFiUsagePrivacyFilter toHEXString:length:](WiFiUsagePrivacyFilter, "toHEXString:length:", [v22 bytes], objc_msgSend(v22, "length"));
        [v51 appendFormat:@"\n\"%@\"%@:(%@)", v15, v21, v23];

        if (v19)
        {
        }
        uint64_t v13 = v52;
      }
      uint64_t v49 = [obj countByEnumeratingWithState:&v61 objects:v67 count:16];
    }
    while (v49);
  }

  long long v59 = 0u;
  long long v60 = 0u;
  long long v57 = 0u;
  long long v58 = 0u;
  unint64_t v24 = [(NSMutableDictionary *)v13->_vendorIEList allKeys];
  uint64_t v25 = [v24 countByEnumeratingWithState:&v57 objects:v66 count:16];
  if (v25)
  {
    uint64_t v26 = v25;
    uint64_t v27 = *(void *)v58;
    do
    {
      for (uint64_t j = 0; j != v26; ++j)
      {
        if (*(void *)v58 != v27) {
          objc_enumerationMutation(v24);
        }
        uint64_t v29 = *(void *)(*((void *)&v57 + 1) + 8 * j);
        id v2 = [(NSMutableDictionary *)v52->_vendorIEList objectForKeyedSubscript:v29];
        v3 = (void *)[v2 bytes];
        v30 = +[WiFiUsagePrivacyFilter toHEXString:length:](WiFiUsagePrivacyFilter, "toHEXString:length:", v3, [v2 length]);
        [v51 appendFormat:@"\n\"%@\":(%@)", v29, v30];
      }
      uint64_t v26 = [v24 countByEnumeratingWithState:&v57 objects:v66 count:16];
    }
    while (v26);
  }

  long long v55 = 0u;
  long long v56 = 0u;
  long long v53 = 0u;
  long long v54 = 0u;
  uint64_t v31 = v52;
  unint64_t v32 = [(NSMutableDictionary *)v52->_extendedIEList allKeys];
  unsigned __int8 v33 = [MEMORY[0x1E4F28F60] predicateWithFormat:@"NOT (SELF ENDSWITH \"_isValid\""];
  v34 = [v32 filteredArrayUsingPredicate:v33];

  uint64_t v50 = [v34 countByEnumeratingWithState:&v53 objects:v65 count:16];
  if (v50)
  {
    uint64_t v48 = *(void *)v54;
    do
    {
      for (uint64_t k = 0; k != v50; ++k)
      {
        if (*(void *)v54 != v48) {
          objc_enumerationMutation(v34);
        }
        uint64_t v36 = *(void *)(*((void *)&v53 + 1) + 8 * k);
        uint64_t v37 = [(NSMutableDictionary *)v31->_extendedIEList objectForKeyedSubscript:v36];
        v38 = v31->_taggedIEList;
        v39 = [NSString stringWithFormat:@"%@_isValid", v36];
        v40 = [(NSMutableDictionary *)v38 objectForKeyedSubscript:v39];
        if (!v40
          || (v41 = v31->_taggedIEList,
              [NSString stringWithFormat:@"%@_isValid", v36],
              id v2 = (id)objc_claimAutoreleasedReturnValue(),
              [(NSMutableDictionary *)v41 objectForKeyedSubscript:v2],
              v3 = objc_claimAutoreleasedReturnValue(),
              v42 = @" (invalid!) :",
              [v3 BOOLValue]))
        {
          v42 = &stru_1F2B5AC50;
        }
        id v43 = v37;
        v44 = +[WiFiUsagePrivacyFilter toHEXString:length:](WiFiUsagePrivacyFilter, "toHEXString:length:", [v43 bytes], objc_msgSend(v43, "length"));
        [v51 appendFormat:@"\n\"%@\"%@:(%@)", v36, v42, v44];

        if (v40)
        {
        }
        uint64_t v31 = v52;
      }
      uint64_t v50 = [v34 countByEnumeratingWithState:&v53 objects:v65 count:16];
    }
    while (v50);
  }

  return v51;
}

+ (id)isValidIE:(unsigned __int8)a3 ofLen:(unsigned __int8)a4 withIsExtended:(BOOL)a5
{
  unsigned int v5 = a4;
  if (a5) {
    id v6 = (void *)_extendedElementsLenLimits;
  }
  else {
    id v6 = (void *)_elementsLenLimits;
  }
  id v7 = objc_msgSend(NSString, "stringWithFormat:", @"%u", a3);
  v8 = [v6 objectForKeyedSubscript:v7];

  if (v8)
  {
    char v9 = [v8 objectForKeyedSubscript:@"maxLen"];
    if (v9)
    {
      id v10 = [v8 objectForKeyedSubscript:@"maxLen"];
      objc_opt_class();
      char isKindOfClass = objc_opt_isKindOfClass();

      if (isKindOfClass)
      {
        uint64_t v12 = NSNumber;
        uint64_t v13 = [v8 objectForKeyedSubscript:@"maxLen"];
        char v9 = objc_msgSend(v12, "numberWithBool:", objc_msgSend(v13, "unsignedIntegerValue") >= (unint64_t)v5);
      }
      else
      {
        char v9 = 0;
      }
    }
    uint64_t v14 = [v8 objectForKeyedSubscript:@"minLen"];
    if (v14)
    {
      uint64_t v15 = (void *)v14;
      v16 = [v8 objectForKeyedSubscript:@"minLen"];
      objc_opt_class();
      char v17 = objc_opt_isKindOfClass();

      if (v17)
      {
        uint64_t v18 = NSNumber;
        v19 = [v8 objectForKeyedSubscript:@"minLen"];
        uint64_t v20 = objc_msgSend(v18, "numberWithBool:", objc_msgSend(v19, "unsignedIntegerValue") <= (unint64_t)v5);

        char v9 = (void *)v20;
      }
    }
    uint64_t v21 = [v8 objectForKeyedSubscript:@"fixedLen"];
    if (v21)
    {
      id v22 = (void *)v21;
      objc_super v23 = [v8 objectForKeyedSubscript:@"fixedLen"];
      objc_opt_class();
      char v24 = objc_opt_isKindOfClass();

      if (v24)
      {
        uint64_t v25 = NSNumber;
        uint64_t v26 = [v8 objectForKeyedSubscript:@"fixedLen"];
        uint64_t v27 = objc_msgSend(v25, "numberWithBool:", objc_msgSend(v26, "unsignedIntegerValue") == v5);

        char v9 = (void *)v27;
      }
    }
  }
  else
  {
    char v9 = 0;
  }

  return v9;
}

- (BOOL)parseNormalIE:(unsigned __int8)a3 from:(char *)a4 length:(unint64_t)a5 endOfBuffer:(char *)a6
{
  if (!a5 || &a4[a5] > a6)
  {
    NSLog(&cfstr_SReachedEndOfB_2.isa, a2, "-[WiFiUsageParsedBeacon parseNormalIE:from:length:endOfBuffer:]", a3);
    goto LABEL_10;
  }
  if ((int)a3 > 132)
  {
    if (a3 == 133)
    {
      if ([(WiFiUsageParsedBeacon *)self parseApName:a4 length:a5 endOfBuffer:a6]) {
        goto LABEL_23;
      }
      goto LABEL_10;
    }
    if (a3 != 191)
    {
      if (a3 != 201
        || [(WiFiUsageParsedBeacon *)self parseRNR:a4 length:a5 endOfBuffer:a6])
      {
        goto LABEL_23;
      }
      goto LABEL_10;
    }
    if (![(WiFiUsageParsedBeacon *)self parseVHTCapa:a4 length:a5 endOfBuffer:a6])goto LABEL_10; {
LABEL_23:
    }
    LOBYTE(v6) = 1;
    return v6;
  }
  if (a3 == 3)
  {
    if (![(WiFiUsageParsedBeacon *)self parseDSSS:a4 length:a5 endOfBuffer:a6]) {
      goto LABEL_10;
    }
    goto LABEL_23;
  }
  if (a3 == 45)
  {
    if ([(WiFiUsageParsedBeacon *)self parseHTCapa:a4 length:a5 endOfBuffer:a6]) {
      goto LABEL_23;
    }
LABEL_10:
    LOBYTE(v6) = 0;
    return v6;
  }
  if (a3 != 61) {
    goto LABEL_23;
  }
  BOOL v6 = [(WiFiUsageParsedBeacon *)self parseHTOp:a4 length:a5 endOfBuffer:a6];
  if (v6) {
    goto LABEL_23;
  }
  return v6;
}

- (BOOL)parseExtendedIE:(unsigned __int8)a3 from:(char *)a4 length:(unint64_t)a5 endOfBuffer:(char *)a6
{
  if (a5 && &a4[a5] <= a6)
  {
    if (a3 == 108)
    {
      BOOL v6 = [(WiFiUsageParsedBeacon *)self parseEHTCapa:a4 length:a5 endOfBuffer:a6];
      if (!v6) {
        return v6;
      }
      goto LABEL_13;
    }
    if (a3 == 59)
    {
      if ([(WiFiUsageParsedBeacon *)self parseHE6GHz:a4 length:a5 endOfBuffer:a6])
      {
LABEL_13:
        LOBYTE(v6) = 1;
        return v6;
      }
    }
    else if (a3 != 35 {
           || [(WiFiUsageParsedBeacon *)self parseHECapa:a4 length:a5 endOfBuffer:a6])
    }
    {
      goto LABEL_13;
    }
  }
  else
  {
    NSLog(&cfstr_SReachedEndOfB_3.isa, a2, "-[WiFiUsageParsedBeacon parseExtendedIE:from:length:endOfBuffer:]", a3);
  }
  LOBYTE(v6) = 0;
  return v6;
}

- (BOOL)parseHTCapa:(char *)a3 length:(unint64_t)a4 endOfBuffer:(char *)a5
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  if (a4) {
    BOOL v5 = a3 + 26 > a5;
  }
  else {
    BOOL v5 = 1;
  }
  BOOL v6 = !v5;
  if (v5)
  {
    NSLog(&cfstr_SReachedEndOfB_2.isa, a2, "-[WiFiUsageParsedBeacon parseHTCapa:length:endOfBuffer:]", 45);
  }
  else
  {
    *(_OWORD *)uint64_t v12 = *(_OWORD *)a3;
    *(_OWORD *)&v12[10] = *(_OWORD *)(a3 + 10);
    [(WiFiUsageParsedBeacon *)self setHasHT:1];
    [(WiFiUsageParsedBeacon *)self setHtInfo:*(unsigned __int16 *)v12];
    [(WiFiUsageParsedBeacon *)self setHtAMPDUParams:v12[2]];
    [(WiFiUsageParsedBeacon *)self setHtExtendedCapabilities:*(unsigned __int16 *)&v12[19]];
    [(WiFiUsageParsedBeacon *)self setHtAntennaSelection:v12[25]];
    [(WiFiUsageParsedBeacon *)self setHtTxBFCapabilities:*(unsigned int *)&v12[21]];
    uint64_t v8 = 0;
    unsigned __int8 v9 = 0;
    do
    {
      if (v12[v8 + 3]) {
        unsigned __int8 v9 = v8 + 1;
      }
      ++v8;
    }
    while (v8 != 4);
    if ((~v12[15] & 3) != 0) {
      unsigned __int8 v10 = v9;
    }
    else {
      unsigned __int8 v10 = (v12[15] >> 2) & 3;
    }
    [(WiFiUsageParsedBeacon *)self setHtRxNSS:v9];
    [(WiFiUsageParsedBeacon *)self setHtTxNSS:v10];
  }
  return v6;
}

- (BOOL)parseVHTCapa:(char *)a3 length:(unint64_t)a4 endOfBuffer:(char *)a5
{
  if (a4) {
    BOOL v5 = a3 + 12 > a5;
  }
  else {
    BOOL v5 = 1;
  }
  BOOL v6 = !v5;
  if (v5)
  {
    NSLog(&cfstr_SReachedEndOfB_2.isa, a2, "-[WiFiUsageParsedBeacon parseVHTCapa:length:endOfBuffer:]", 191);
  }
  else
  {
    uint64_t v8 = *(unsigned int *)a3;
    uint64_t v9 = *((unsigned __int16 *)a3 + 2);
    uint64_t v10 = *((unsigned __int16 *)a3 + 3);
    uint64_t v11 = *((unsigned __int16 *)a3 + 4);
    uint64_t v12 = *((unsigned __int16 *)a3 + 5);
    [(WiFiUsageParsedBeacon *)self setHasVHT:1];
    [(WiFiUsageParsedBeacon *)self setVhtInfo:v8];
    [(WiFiUsageParsedBeacon *)self setVhtRxMCSMap:v9];
    [(WiFiUsageParsedBeacon *)self setVhtTxMCSMap:v11];
    [(WiFiUsageParsedBeacon *)self setVhtRxMaxRate:v10];
    [(WiFiUsageParsedBeacon *)self setVhtTxMaxRate:v12];
    char v13 = 0;
    int v14 = 0;
    unsigned __int8 v15 = 0;
    do
    {
      if ((~(v9 >> v13) & 3) != 0) {
        unsigned __int8 v15 = v14 + 1;
      }
      ++v14;
      v13 += 2;
    }
    while (v14 != 8);
    char v16 = 0;
    int v17 = 0;
    unsigned __int8 v18 = 0;
    do
    {
      if ((~(v11 >> v16) & 3) != 0) {
        unsigned __int8 v18 = v17 + 1;
      }
      ++v17;
      v16 += 2;
    }
    while (v17 != 8);
    [(WiFiUsageParsedBeacon *)self setVhtRxNSS:v15];
    [(WiFiUsageParsedBeacon *)self setVhtTxNSS:v18];
  }
  return v6;
}

- (BOOL)parseHECapa:(char *)a3 length:(unint64_t)a4 endOfBuffer:(char *)a5
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  if (!a4 || (id v7 = (unsigned __int16 *)(a3 + 21), a3 + 21 > a5))
  {
    NSLog(&cfstr_SReachedEndOfB_4.isa, a2, a3, "-[WiFiUsageParsedBeacon parseHECapa:length:endOfBuffer:]", 35);
    return 0;
  }
  *(_OWORD *)uint64_t v26 = *(_OWORD *)a3;
  *(void *)&v26[13] = *(void *)(a3 + 13);
  [(WiFiUsageParsedBeacon *)self setHasHE:1];
  uint64_t v11 = [MEMORY[0x1E4F1C9B8] dataWithBytes:v26 length:6];
  [(WiFiUsageParsedBeacon *)self setHeMACInfo:v11];

  uint64_t v12 = [MEMORY[0x1E4F1C9B8] dataWithBytes:&v26[6] length:11];
  [(WiFiUsageParsedBeacon *)self setHePHYInfo:v12];

  [(WiFiUsageParsedBeacon *)self setHeRxMCSMap80MHz:*(unsigned __int16 *)&v26[17]];
  [(WiFiUsageParsedBeacon *)self setHeTxMCSMap80MHz:*(unsigned __int16 *)&v26[19]];
  char v13 = 0;
  int v14 = 0;
  unsigned __int8 v15 = 0;
  char v16 = v26[6];
  do
  {
    if ((~(*(unsigned __int16 *)&v26[17] >> v13) & 3) != 0) {
      unsigned __int8 v15 = v14 + 1;
    }
    ++v14;
    v13 += 2;
  }
  while (v14 != 8);
  char v17 = 0;
  int v18 = 0;
  unsigned __int8 v19 = 0;
  do
  {
    if ((~(*(unsigned __int16 *)&v26[19] >> v17) & 3) != 0) {
      unsigned __int8 v19 = v18 + 1;
    }
    ++v18;
    v17 += 2;
  }
  while (v18 != 8);
  unint64_t v20 = a4 - 21;
  [(WiFiUsageParsedBeacon *)self setHeRxNSS:v15];
  [(WiFiUsageParsedBeacon *)self setHeTxNSS:v19];
  if ((v16 & 4) == 0)
  {
    if ((v16 & 8) == 0) {
      return 1;
    }
    goto LABEL_23;
  }
  if (a4 == 21 || a3 + 23 > a5)
  {
    NSLog(&cfstr_SReachedEndOfB_5.isa, v21, v22, "-[WiFiUsageParsedBeacon parseHECapa:length:endOfBuffer:]", 35);
    return 0;
  }
  if (a4 == 23 || (objc_super v23 = a3 + 25, a3 + 25 > a5))
  {
    NSLog(&cfstr_SReachedEndOfB_6.isa, v21, v22, "-[WiFiUsageParsedBeacon parseHECapa:length:endOfBuffer:]", 35);
    return 0;
  }
  uint64_t v24 = *(unsigned __int16 *)(a3 + 23);
  unint64_t v20 = a4 - 25;
  [(WiFiUsageParsedBeacon *)self setHeRxMCSMap160MHz:*v7];
  [(WiFiUsageParsedBeacon *)self setHeTxMCSMap160MHz:v24];
  id v7 = (unsigned __int16 *)v23;
  if ((v16 & 8) != 0)
  {
LABEL_23:
    if (!v20 || v7 + 1 > (unsigned __int16 *)a5)
    {
      NSLog(&cfstr_SReachedEndOfB_7.isa, v21, v22, "-[WiFiUsageParsedBeacon parseHECapa:length:endOfBuffer:]", 35);
      return 0;
    }
    if (v20 == 2 || v7 + 2 > (unsigned __int16 *)a5)
    {
      NSLog(&cfstr_SReachedEndOfB_8.isa, v21, v22, "-[WiFiUsageParsedBeacon parseHECapa:length:endOfBuffer:]", 35);
      return 0;
    }
    uint64_t v25 = v7[1];
    [(WiFiUsageParsedBeacon *)self setHeRxMCSMap8080MHz:*v7];
    [(WiFiUsageParsedBeacon *)self setHeTxMCSMap8080MHz:v25];
  }
  return 1;
}

- (BOOL)parseEHTCapa:(char *)a3 length:(unint64_t)a4 endOfBuffer:(char *)a5
{
  return 1;
}

- (BOOL)parseRNR:(char *)a3 length:(unint64_t)a4 endOfBuffer:(char *)a5
{
  BOOL v5 = a3 + 4;
  if (a3 + 4 < a5)
  {
    id v7 = a3;
    uint64_t v8 = &a3[a4];
    do
    {
      if (v8 <= v5) {
        break;
      }
      char v9 = a4;
      if (a4 < 4uLL) {
        break;
      }
      unint64_t v10 = *(unsigned __int16 *)v7;
      unint64_t v11 = v10 >> 8;
      BOOL v13 = (v10 & 3) == 1 && v11 == 3;
      int v15 = (v10 & 3) == 0 && v11 == 16 || v13;
      if (v10 >= 0x100)
      {
        int v16 = 0;
        int v17 = v10 & 0xFB00;
        if (v10 <= 0xCFF) {
          unsigned __int8 v18 = 0;
        }
        else {
          unsigned __int8 v18 = 11;
        }
        if (v17 == 2048 || v17 == 512) {
          unsigned __int8 v18 = BYTE1(v10) - 1;
        }
        unint64_t v20 = (unint64_t)&v5[v11];
        if (&v5[v11] <= v8 && v20 <= (unint64_t)a5)
        {
          LOBYTE(v21) = 0;
          unsigned int v22 = ((v10 >> 4) + 1) * v11;
          do
          {
            unsigned int v21 = (v21 + v11);
            unint64_t v23 = v20 + v21;
          }
          while (v21 < v22 && v23 <= (unint64_t)v8 && v23 <= (unint64_t)a5);
          int v16 = (v5[v18] >> 6) & 1;
        }
        unsigned int v26 = v7[2];
        if (v16 && v26 >= 0x83 && v26 < 0x88)
        {
          int v32 = v15;
          uint64_t v27 = v7[3];
          [(WiFiUsageParsedBeacon *)self setColocated6Ghz:1];
          uint64_t v28 = [MEMORY[0x1E4F1CAD0] setWithArray:&unk_1F2B952C0];
          uint64_t v29 = [NSNumber numberWithShort:v27];
          int v30 = [v28 containsObject:v29];

          if (v30) {
            [(WiFiUsageParsedBeacon *)self setColocated6GhzIsPSC:1];
          }

          int v15 = v32;
        }
        if ((v15 & v16) == 1)
        {
          if ((v26 - 81) > 3u)
          {
            if ((v26 - 115) > 0xFu)
            {
              if ((v26 + 125) <= 4u) {
                [(WiFiUsageParsedBeacon *)self setHasColocatedMLD6G:1];
              }
            }
            else
            {
              [(WiFiUsageParsedBeacon *)self setHasColocatedMLD5G:1];
            }
          }
          else
          {
            [(WiFiUsageParsedBeacon *)self setHasColocatedMLD2G:1];
          }
        }
      }
      v7 += (v11 + 4);
      LOBYTE(a4) = v9 - (v11 + 4);
      BOOL v5 = v7 + 4;
    }
    while (v7 + 4 < a5);
  }
  return 1;
}

- (BOOL)parseApName:(char *)a3 length:(unint64_t)a4 endOfBuffer:(char *)a5
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  if (a4 > 0x1D)
  {
    *(_OWORD *)unint64_t v11 = *(_OWORD *)a3;
    *(_OWORD *)&v11[14] = *(_OWORD *)(a3 + 14);
    id v6 = [NSString alloc];
    size_t v7 = strnlen((const char *)((unint64_t)v11 | 0xA), 0x10uLL);
    if (v7 >= 0x10) {
      uint64_t v8 = 16;
    }
    else {
      uint64_t v8 = v7;
    }
    char v9 = (void *)[v6 initWithBytes:(unint64_t)v11 | 0xA length:v8 encoding:1];
    [(WiFiUsageParsedBeacon *)self setApName:v9];
  }
  else
  {
    NSLog(&cfstr_SIeDTooShortLu.isa, a2, a3, "-[WiFiUsageParsedBeacon parseApName:length:endOfBuffer:]", 133, a4, 30);
  }
  return 1;
}

- (BOOL)parseDSSS:(char *)a3 length:(unint64_t)a4 endOfBuffer:(char *)a5
{
  if (a4) {
    BOOL v5 = a3 + 1 > a5;
  }
  else {
    BOOL v5 = 1;
  }
  BOOL v6 = !v5;
  if (v5) {
    NSLog(&cfstr_SReachedEndOfB_2.isa, a2, "-[WiFiUsageParsedBeacon parseDSSS:length:endOfBuffer:]", 3);
  }
  else {
    [(WiFiUsageParsedBeacon *)self setChannel:*a3];
  }
  return v6;
}

- (BOOL)parseHTOp:(char *)a3 length:(unint64_t)a4 endOfBuffer:(char *)a5
{
  if (a4) {
    BOOL v5 = a3 + 8 > a5;
  }
  else {
    BOOL v5 = 1;
  }
  BOOL v6 = !v5;
  if (v5)
  {
    NSLog(&cfstr_SReachedEndOfB_2.isa, a2, "-[WiFiUsageParsedBeacon parseHTOp:length:endOfBuffer:]", 61);
  }
  else
  {
    uint64_t channel = self->_channel;
    if (self->_channel)
    {
      if (channel != *a3)
      {
        NSLog(&cfstr_SFoundPrimaryC.isa, a2, "-[WiFiUsageParsedBeacon parseHTOp:length:endOfBuffer:]", *a3, channel);
        uint64_t channel = *a3;
      }
    }
    else
    {
      uint64_t channel = *a3;
    }
    [(WiFiUsageParsedBeacon *)self setChannel:channel];
  }
  return v6;
}

- (BOOL)parseHE6GHz:(char *)a3 length:(unint64_t)a4 endOfBuffer:(char *)a5
{
  if (a4) {
    BOOL v5 = a3 + 5 > a5;
  }
  else {
    BOOL v5 = 1;
  }
  BOOL v6 = !v5;
  if (v5)
  {
    NSLog(&cfstr_SReachedEndOfB_2.isa, a2, "-[WiFiUsageParsedBeacon parseHE6GHz:length:endOfBuffer:]", 59);
  }
  else
  {
    uint64_t channel = self->_channel;
    if (self->_channel)
    {
      if (channel != *a3)
      {
        NSLog(&cfstr_SFoundPrimaryC_0.isa, a2, "-[WiFiUsageParsedBeacon parseHE6GHz:length:endOfBuffer:]", *a3, channel);
        uint64_t channel = *a3;
      }
    }
    else
    {
      uint64_t channel = *a3;
    }
    [(WiFiUsageParsedBeacon *)self setChannel:channel];
    [(WiFiUsageParsedBeacon *)self setBand:6];
  }
  return v6;
}

+ (void)defaults
{
  id v2 = (void *)_elementsLenLimits;
  _elementsLenLimits = 0;

  v3 = (void *)_extendedElementsLenLimits;
  _extendedElementsLenLimits = 0;
}

+ (void)initialize
{
  [a1 defaults];

  [a1 updateConfig];
}

+ (void)updateConfig
{
  v3 = @"elements";
  uint64_t v4 = +[WiFiUsageBeaconParsingConfiguration getConfigForKey:@"elements"];
  obuint64_t j = (id)v4;
  if (!v4) {
    goto LABEL_6;
  }
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();
  uint64_t v4 = (uint64_t)obj;
  if ((isKindOfClass & 1) == 0) {
    goto LABEL_6;
  }
  BOOL v6 = (void *)_elementsLenLimits;
  _elementsLenLimits = (uint64_t)obj;
  id v7 = obj;

  v3 = @"extendedElements";
  obuint64_t j = +[WiFiUsageBeaconParsingConfiguration getConfigForKey:@"extendedElements"];

  uint64_t v4 = (uint64_t)obj;
  if (!obj) {
    goto LABEL_6;
  }
  objc_opt_class();
  char v8 = objc_opt_isKindOfClass();
  uint64_t v4 = (uint64_t)obj;
  if (v8)
  {
    objc_storeStrong((id *)&_extendedElementsLenLimits, obj);
  }
  else
  {
LABEL_6:
    NSLog(&cfstr_SImpossibleToP.isa, "+[WiFiUsageParsedBeacon updateConfig]", v3, v4);
    [a1 defaults];
  }
}

+ (id)config
{
  return (id)[NSString stringWithFormat:@"elements len limits: %@ extendedElements len limits: %@", _elementsLenLimits, _extendedElementsLenLimits];
}

- (unsigned)beaconInterval
{
  return self->_beaconInterval;
}

- (void)setBeaconInterval:(unsigned __int16)a3
{
  self->_beaconInterval = a3;
}

- (unsigned)capabilities
{
  return self->_capabilities;
}

- (void)setCapabilities:(unsigned __int16)a3
{
  self->_capabilities = a3;
}

- (unsigned)htRxNSS
{
  return self->_htRxNSS;
}

- (void)setHtRxNSS:(unsigned __int8)a3
{
  self->_htRxNSS = a3;
}

- (unsigned)htTxNSS
{
  return self->_htTxNSS;
}

- (void)setHtTxNSS:(unsigned __int8)a3
{
  self->_htTxNSS = a3;
}

- (unsigned)vhtRxNSS
{
  return self->_vhtRxNSS;
}

- (void)setVhtRxNSS:(unsigned __int8)a3
{
  self->_vhtRxNSS = a3;
}

- (unsigned)vhtTxNSS
{
  return self->_vhtTxNSS;
}

- (void)setVhtTxNSS:(unsigned __int8)a3
{
  self->_vhtTxNSS = a3;
}

- (unsigned)heRxNSS
{
  return self->_heRxNSS;
}

- (void)setHeRxNSS:(unsigned __int8)a3
{
  self->_heRxNSS = a3;
}

- (unsigned)heTxNSS
{
  return self->_heTxNSS;
}

- (void)setHeTxNSS:(unsigned __int8)a3
{
  self->_heTxNSS = a3;
}

- (BOOL)colocated6Ghz
{
  return self->_colocated6Ghz;
}

- (void)setColocated6Ghz:(BOOL)a3
{
  self->_colocated6Ghz = a3;
}

- (NSString)apName
{
  return self->_apName;
}

- (void)setApName:(id)a3
{
}

- (NSMutableDictionary)taggedIEList
{
  return self->_taggedIEList;
}

- (void)setTaggedIEList:(id)a3
{
}

- (NSMutableDictionary)vendorIEList
{
  return self->_vendorIEList;
}

- (void)setVendorIEList:(id)a3
{
}

- (NSMutableDictionary)extendedIEList
{
  return self->_extendedIEList;
}

- (void)setExtendedIEList:(id)a3
{
}

- (BOOL)parsingSuccessful
{
  return self->_parsingSuccessful;
}

- (void)setParsingSuccessful:(BOOL)a3
{
  self->_parsingSuccessful = a3;
}

- (NSNumber)isBeaconAtHeRate
{
  return self->_isBeaconAtHeRate;
}

- (void)setIsBeaconAtHeRate:(id)a3
{
  self->_isBeaconAtHeRate = (NSNumber *)a3;
}

- (NSString)bssid
{
  return self->_bssid;
}

- (void)setBssid:(id)a3
{
}

- (unsigned)channel
{
  return self->_channel;
}

- (void)setChannel:(unsigned __int8)a3
{
  self->_uint64_t channel = a3;
}

- (unsigned)band
{
  return self->_band;
}

- (void)setBand:(unsigned __int8)a3
{
  self->_band = a3;
}

- (unsigned)htInfo
{
  return self->_htInfo;
}

- (void)setHtInfo:(unsigned __int16)a3
{
  self->_htInfo = a3;
}

- (unsigned)htAMPDUParams
{
  return self->_htAMPDUParams;
}

- (void)setHtAMPDUParams:(unsigned __int8)a3
{
  self->_htAMPDUParams = a3;
}

- (unsigned)htExtendedCapabilities
{
  return self->_htExtendedCapabilities;
}

- (void)setHtExtendedCapabilities:(unsigned __int16)a3
{
  self->_htExtendedCapabilities = a3;
}

- (unsigned)htTxBFCapabilities
{
  return self->_htTxBFCapabilities;
}

- (void)setHtTxBFCapabilities:(unsigned int)a3
{
  self->_htTxBFCapabilities = a3;
}

- (unsigned)htAntennaSelection
{
  return self->_htAntennaSelection;
}

- (void)setHtAntennaSelection:(unsigned __int8)a3
{
  self->_htAntennaSelectiouint64_t n = a3;
}

- (NSData)htMCSSet
{
  return self->_htMCSSet;
}

- (unsigned)vhtInfo
{
  return self->_vhtInfo;
}

- (void)setVhtInfo:(unsigned int)a3
{
  self->_vhtInfo = a3;
}

- (unsigned)vhtRxMCSMap
{
  return self->_vhtRxMCSMap;
}

- (void)setVhtRxMCSMap:(unsigned __int16)a3
{
  self->_vhtRxMCSMap = a3;
}

- (unsigned)vhtRxMaxRate
{
  return self->_vhtRxMaxRate;
}

- (void)setVhtRxMaxRate:(unsigned __int16)a3
{
  self->_vhtRxMaxRate = a3;
}

- (unsigned)vhtTxMCSMap
{
  return self->_vhtTxMCSMap;
}

- (void)setVhtTxMCSMap:(unsigned __int16)a3
{
  self->_vhtTxMCSMap = a3;
}

- (unsigned)vhtTxMaxRate
{
  return self->_vhtTxMaxRate;
}

- (void)setVhtTxMaxRate:(unsigned __int16)a3
{
  self->_vhtTxMaxRate = a3;
}

- (NSData)heMACInfo
{
  return self->_heMACInfo;
}

- (void)setHeMACInfo:(id)a3
{
}

- (NSData)hePHYInfo
{
  return self->_hePHYInfo;
}

- (void)setHePHYInfo:(id)a3
{
}

- (unsigned)heRxMCSMap80MHz
{
  return self->_heRxMCSMap80MHz;
}

- (void)setHeRxMCSMap80MHz:(unsigned __int16)a3
{
  self->_heRxMCSMap80MHz = a3;
}

- (unsigned)heTxMCSMap80MHz
{
  return self->_heTxMCSMap80MHz;
}

- (void)setHeTxMCSMap80MHz:(unsigned __int16)a3
{
  self->_heTxMCSMap80MHz = a3;
}

- (unsigned)heRxMCSMap160MHz
{
  return self->_heRxMCSMap160MHz;
}

- (void)setHeRxMCSMap160MHz:(unsigned __int16)a3
{
  self->_heRxMCSMap160MHz = a3;
}

- (unsigned)heTxMCSMap160MHz
{
  return self->_heTxMCSMap160MHz;
}

- (void)setHeTxMCSMap160MHz:(unsigned __int16)a3
{
  self->_heTxMCSMap160MHz = a3;
}

- (unsigned)heRxMCSMap8080MHz
{
  return self->_heRxMCSMap8080MHz;
}

- (void)setHeRxMCSMap8080MHz:(unsigned __int16)a3
{
  self->_heRxMCSMap8080MHz = a3;
}

- (unsigned)heTxMCSMap8080MHz
{
  return self->_heTxMCSMap8080MHz;
}

- (void)setHeTxMCSMap8080MHz:(unsigned __int16)a3
{
  self->_heTxMCSMap8080MHz = a3;
}

- (BOOL)colocated6GhzIsPSC
{
  return self->_colocated6GhzIsPSC;
}

- (void)setColocated6GhzIsPSC:(BOOL)a3
{
  self->_colocated6GhzIsPSC = a3;
}

- (BOOL)hasHT
{
  return self->_hasHT;
}

- (void)setHasHT:(BOOL)a3
{
  self->_hasHT = a3;
}

- (BOOL)hasVHT
{
  return self->_hasVHT;
}

- (void)setHasVHT:(BOOL)a3
{
  self->_hasVHT = a3;
}

- (BOOL)hasHE
{
  return self->_hasHE;
}

- (void)setHasHE:(BOOL)a3
{
  self->_hasHE = a3;
}

- (BOOL)hasEHT
{
  return self->_hasEHT;
}

- (void)setHasEHT:(BOOL)a3
{
  self->_hasEHT = a3;
}

- (BOOL)hasColocatedMLD2G
{
  return self->_hasColocatedMLD2G;
}

- (void)setHasColocatedMLD2G:(BOOL)a3
{
  self->_hasColocatedMLD2G = a3;
}

- (BOOL)hasColocatedMLD5G
{
  return self->_hasColocatedMLD5G;
}

- (void)setHasColocatedMLD5G:(BOOL)a3
{
  self->_hasColocatedMLD5G = a3;
}

- (BOOL)hasColocatedMLD6G
{
  return self->_hasColocatedMLD6G;
}

- (void)setHasColocatedMLD6G:(BOOL)a3
{
  self->_hasColocatedMLD6G = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_hePHYInfo, 0);
  objc_storeStrong((id *)&self->_heMACInfo, 0);
  objc_storeStrong((id *)&self->_htMCSSet, 0);
  objc_storeStrong((id *)&self->_bssid, 0);
  objc_storeStrong((id *)&self->_extendedIEList, 0);
  objc_storeStrong((id *)&self->_vendorIEList, 0);
  objc_storeStrong((id *)&self->_taggedIEList, 0);

  objc_storeStrong((id *)&self->_apName, 0);
}

@end