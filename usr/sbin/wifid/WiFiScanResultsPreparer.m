@interface WiFiScanResultsPreparer
+ (BOOL)wifiNetworkShouldBeProminentlyDisplayed:(__WiFiNetwork *)a3;
- (BOOL)disableProminentFiltering;
- (NSArray)blacklistedSSIDs;
- (NSArray)preparedScanResults;
- (WiFiAvailabilityEngine)engine;
- (WiFiScanResultsPreparer)initWithManager:(__WiFiDeviceManager *)a3 availabilityEngine:(id)a4 scanResults:(id)a5;
- (WiFiScanResultsPreparer)initWithManager:(__WiFiDeviceManager *)a3 availabilityEngine:(id)a4 scanResults:(id)a5 disableProminentFiltering:(BOOL)a6;
- (WiFiScanResultsPreparer)initWithManager:(__WiFiDeviceManager *)a3 availabilityEngine:(id)a4 scanResults:(id)a5 disableProminentFiltering:(BOOL)a6 blacklistedSSIDs:(id)a7;
- (__WiFiDeviceManager)manager;
- (id)topRecommendableNetwork;
- (unint64_t)prominentScanResultsCount;
- (void)_prepareScanResults:(id)a3;
- (void)dealloc;
- (void)setBlacklistedSSIDs:(id)a3;
- (void)setDisableProminentFiltering:(BOOL)a3;
- (void)setEngine:(id)a3;
- (void)setManager:(__WiFiDeviceManager *)a3;
- (void)setPreparedScanResults:(id)a3;
- (void)setProminentScanResultsCount:(unint64_t)a3;
@end

@implementation WiFiScanResultsPreparer

- (WiFiScanResultsPreparer)initWithManager:(__WiFiDeviceManager *)a3 availabilityEngine:(id)a4 scanResults:(id)a5 disableProminentFiltering:(BOOL)a6
{
  return [(WiFiScanResultsPreparer *)self initWithManager:a3 availabilityEngine:a4 scanResults:a5 disableProminentFiltering:a6 blacklistedSSIDs:0];
}

- (WiFiScanResultsPreparer)initWithManager:(__WiFiDeviceManager *)a3 availabilityEngine:(id)a4 scanResults:(id)a5
{
  return [(WiFiScanResultsPreparer *)self initWithManager:a3 availabilityEngine:a4 scanResults:a5 disableProminentFiltering:0];
}

- (WiFiScanResultsPreparer)initWithManager:(__WiFiDeviceManager *)a3 availabilityEngine:(id)a4 scanResults:(id)a5 disableProminentFiltering:(BOOL)a6 blacklistedSSIDs:(id)a7
{
  v15.receiver = self;
  v15.super_class = (Class)WiFiScanResultsPreparer;
  v12 = [(WiFiScanResultsPreparer *)&v15 init];
  v13 = v12;
  if (!a3 || !v12)
  {
    if (!v12) {
      return v13;
    }
LABEL_7:
    CFRelease(v13);
    return 0;
  }
  v12->_manager = a3;
  CFRetain(a3);
  if (!a4) {
    goto LABEL_7;
  }
  v13->_engine = (WiFiAvailabilityEngine *)a4;
  v13->_disableProminentFiltering = a6;
  v13->_blacklistedSSIDs = (NSArray *)a7;
  [(WiFiScanResultsPreparer *)v13 _prepareScanResults:a5];
  return v13;
}

- (void)dealloc
{
  manager = self->_manager;
  if (manager)
  {
    CFRelease(manager);
    self->_manager = 0;
  }

  v4.receiver = self;
  v4.super_class = (Class)WiFiScanResultsPreparer;
  [(WiFiScanResultsPreparer *)&v4 dealloc];
}

- (void)_prepareScanResults:(id)a3
{
  v6 = (void *)os_transaction_create();
  if (a3 && [a3 count])
  {
    v31 = v6;
    v32 = v5;
    id v7 = [a3 mutableCopy];
    if (qword_10027DD68) {
      [objc_msgSend((id)qword_10027DD68, "WFLog:message:", 3, "%s: Find recommendations for %lu networks (disableProminentFiltering: %d)", "-[WiFiScanResultsPreparer _prepareScanResults:]", objc_msgSend(v7, "count"), -[WiFiScanResultsPreparer disableProminentFiltering](self, "disableProminentFiltering"));
    }
    long long v46 = 0u;
    long long v47 = 0u;
    long long v44 = 0u;
    long long v45 = 0u;
    id v9 = [v7 countByEnumeratingWithState:&v44 objects:v49 count:16];
    if (v9)
    {
      id v10 = v9;
      uint64_t v11 = *(void *)v45;
      id v34 = v7;
      v35 = self;
      uint64_t v33 = *(void *)v45;
      do
      {
        uint64_t v12 = 0;
        id v36 = v10;
        do
        {
          if (*(void *)v45 != v11) {
            objc_enumerationMutation(v7);
          }
          uint64_t v37 = v12;
          v13 = *(const void **)(*((void *)&v44 + 1) + 8 * v12);
          if (v13)
          {
            if (sub_100105200([(WiFiScanResultsPreparer *)self manager], v13)) {
              sub_10001C6A4((uint64_t)v13, @"WiFiNetworkAttributeIsKnown", kCFBooleanTrue);
            }
            if (!sub_10001EA5C(v13))
            {
              v14 = [[WiFiScanObserverNetwork alloc] initWithWiFiNetworkRef:v13];
              if (v14)
              {
                v38 = v14;
                id v15 = [(WiFiAvailabilityEngine *)[(WiFiScanResultsPreparer *)self engine] findRecommendationForScannedNetwork:v14];
                if (v15)
                {
                  v16 = v15;
                  if (qword_10027DD68) {
                    [(id)qword_10027DD68 WFLog:3, "%s: recommendation for %@ (network %@)", "-[WiFiScanResultsPreparer _prepareScanResults:]", [v16 scannedNetwork], [v16 network]);
                  }
                  if ([v16 unwantedNetworkName])
                  {
                    if (qword_10027DD68) {
                      [(id)qword_10027DD68 WFLog:3, "%s: %@ contains unwantedNetworkName", "-[WiFiScanResultsPreparer _prepareScanResults:]", -[WiFiScanObserverNetwork SSID](v38, "SSID") message];
                    }
                  }
                  if (objc_msgSend(objc_msgSend(v16, "network"), "attributes"))
                  {
                    long long v42 = 0u;
                    long long v43 = 0u;
                    long long v40 = 0u;
                    long long v41 = 0u;
                    id v19 = [objc_msgSend(v16, "network") attributes];
                    id v20 = [v19 countByEnumeratingWithState:&v40 objects:v48 count:16];
                    if (v20)
                    {
                      id v21 = v20;
                      uint64_t v22 = *(void *)v41;
                      v39 = v13;
LABEL_25:
                      uint64_t v23 = 0;
                      while (2)
                      {
                        if (*(void *)v41 != v22) {
                          objc_enumerationMutation(v19);
                        }
                        switch([*(id *)(*((void *)&v40 + 1) + 8 * v23) intValue])
                        {
                          case 1u:
                            uint64_t v24 = (uint64_t)v13;
                            v25 = @"WiFiNetworkAttributeIsPotentiallyCaptive";
                            goto LABEL_39;
                          case 2u:
                            uint64_t v24 = (uint64_t)v13;
                            v25 = @"WiFiNetworkAttributeIsSuspicious";
                            goto LABEL_39;
                          case 4u:
                            uint64_t v24 = (uint64_t)v13;
                            v25 = @"WiFiNetworkAttributeIsTCPGood";
                            goto LABEL_39;
                          case 5u:
                            uint64_t v24 = (uint64_t)v13;
                            v25 = @"WiFiNetworkAttributeIsPotentiallyMoving";
                            goto LABEL_39;
                          case 6u:
                            if ([v16 unwantedNetworkName])
                            {
                              if (qword_10027DD68) {
                                [(id)qword_10027DD68 WFLog:3, "%s: %@ contains unwantedNetworkName, discarding public flag", "-[WiFiScanResultsPreparer _prepareScanResults:]", -[WiFiScanObserverNetwork SSID](v38, "SSID") message];
                              }
                              v13 = v39;
                            }
                            else
                            {
                              uint64_t v24 = (uint64_t)v13;
                              v25 = @"WiFiNetworkAttributeIsPublic";
LABEL_39:
                              sub_10001C6A4(v24, v25, kCFBooleanTrue);
                            }
LABEL_40:
                            if (v21 != (id)++v23) {
                              continue;
                            }
                            id v21 = [v19 countByEnumeratingWithState:&v40 objects:v48 count:16];
                            if (!v21) {
                              goto LABEL_42;
                            }
                            goto LABEL_25;
                          case 7u:
                            uint64_t v24 = (uint64_t)v13;
                            v25 = @"WiFiNetworkAttributeIsLowQuality";
                            goto LABEL_39;
                          default:
                            goto LABEL_40;
                        }
                      }
                    }
                  }
LABEL_42:
                  self = v35;
                  if (objc_msgSend(objc_msgSend(v16, "network"), "type") == (id)1
                    || objc_msgSend(objc_msgSend(v16, "network"), "type") == (id)2
                    || objc_msgSend(objc_msgSend(v16, "network"), "type") == (id)3)
                  {
                    if (qword_10027DD68) {
                      [(id)qword_10027DD68 WFLog:3, "%s: %@ contains a network type (%lu) that is not recommendable", "-[WiFiScanResultsPreparer _prepareScanResults:]", -[WiFiScanObserverNetwork SSID](v38, "SSID"), [objc_msgSend(objc_msgSend(v16, "network"), "type") message];
                    }
                    sub_10001C6A4((uint64_t)v13, @"WiFiNetworkAttributeIsNotRecommendable", kCFBooleanTrue);
                  }
                  id v28 = [objc_msgSend(v16, "network") popularityScore];
                  if (v28)
                  {
                    v29 = v28;
                    sub_10001A610((uint64_t)v13, @"WiFiNetworkAttributePopularityScore", (uint64_t)[v28 score]);
                    if ((unint64_t)[v29 score] <= 0x3E7) {
                      v30 = @"WiFiNetworkAttributeLowPopularity";
                    }
                    else {
                      v30 = @"WiFiNetworkAttributeHighPopularity";
                    }
                    sub_10001C6A4((uint64_t)v13, v30, kCFBooleanTrue);
                  }
                  sub_10001A610((uint64_t)v13, @"WiFiNetworkAttributeSource", (uint64_t)[objc_msgSend(objc_msgSend(v16, "network"), "source")]);
                  uint64_t v11 = v33;
                  id v7 = v34;
LABEL_54:
                  if ([(WiFiScanResultsPreparer *)self disableProminentFiltering]
                    || +[WiFiScanResultsPreparer wifiNetworkShouldBeProminentlyDisplayed:v13])
                  {
                    sub_10001C6A4((uint64_t)v13, @"WiFiNetworkAttributeProminentDisplay", kCFBooleanTrue);
                    [(WiFiScanResultsPreparer *)self setProminentScanResultsCount:(char *)[(WiFiScanResultsPreparer *)self prominentScanResultsCount]+ 1];
                  }
                }
                else if (!sub_10001EA5C(v13))
                {
                  goto LABEL_54;
                }

                id v10 = v36;
              }
            }
          }
          uint64_t v12 = v37 + 1;
        }
        while ((id)(v37 + 1) != v10);
        id v10 = [v7 countByEnumeratingWithState:&v44 objects:v49 count:16];
      }
      while (v10);
    }
    [(WiFiScanResultsPreparer *)self setPreparedScanResults:v7];
    v6 = v31;
    v5 = v32;
  }
  else
  {
    id v7 = 0;
  }

  if (v6) {
}
  }

+ (BOOL)wifiNetworkShouldBeProminentlyDisplayed:(__WiFiNetwork *)a3
{
  if (sub_10001E404((uint64_t)a3, @"WiFiNetworkAttributeIsKnown")
    || sub_10001E404((uint64_t)a3, @"WiFiNetworkAttributeIsPublic"))
  {
    goto LABEL_9;
  }
  if (sub_10001E404((uint64_t)a3, @"WiFiNetworkAttributeLowPopularity")
    || sub_10001E404((uint64_t)a3, @"WiFiNetworkAttributeIsSuspicious"))
  {
    goto LABEL_12;
  }
  if (sub_10001E404((uint64_t)a3, @"WiFiNetworkAttributeHighQuality"))
  {
LABEL_9:
    LOBYTE(v4) = 1;
    return (char)v4;
  }
  if (sub_1000CEC18((uint64_t)a3) == 1)
  {
LABEL_12:
    LOBYTE(v4) = 0;
    return (char)v4;
  }
  LODWORD(v4) = sub_1000C8A5C((uint64_t)a3);
  if (v4)
  {
    if ((v4 & 1) == 0) {
      goto LABEL_9;
    }
    objc_super v4 = sub_10001E404((uint64_t)a3, @"WiFiNetworkAttributeLowPopularity");
    if (v4) {
      goto LABEL_9;
    }
  }
  return (char)v4;
}

- (id)topRecommendableNetwork
{
  if (![(WiFiScanResultsPreparer *)self prominentScanResultsCount]) {
    return 0;
  }
  long long v45 = 0u;
  long long v46 = 0u;
  long long v43 = 0u;
  long long v44 = 0u;
  v3 = [(WiFiScanResultsPreparer *)self preparedScanResults];
  id v4 = [(NSArray *)v3 countByEnumeratingWithState:&v43 objects:v48 count:16];
  if (!v4) {
    goto LABEL_58;
  }
  id v5 = v4;
  id v36 = self;
  CFNumberRef v37 = 0;
  v38 = 0;
  uint64_t v6 = *(void *)v44;
  do
  {
    id v7 = 0;
    do
    {
      if (*(void *)v44 != v6) {
        objc_enumerationMutation(v3);
      }
      v8 = *(const void **)(*((void *)&v43 + 1) + 8 * (void)v7);
      if (v8)
      {
        if (!sub_1000C8A5C(*(void *)(*((void *)&v43 + 1) + 8 * (void)v7))
          && (int)sub_1000C6FC0((uint64_t)v8, @"RSSI") >= -75
          && !sub_1000CDBF4((uint64_t)v8))
        {
          if (sub_10001E404((uint64_t)v8, @"WiFiNetworkAttributeProminentDisplay"))
          {
            if (!sub_10001E404((uint64_t)v8, @"WiFiNetworkAttributeIsKnown")
              && !sub_10001E404((uint64_t)v8, @"WiFiNetworkAttributeIsNotRecommendable"))
            {
              CFNumberRef v9 = sub_1000C6FC0((uint64_t)v8, @"WiFiNetworkAttributeSource");
              if (v9)
              {
                CFNumberRef v10 = v9;
                uint64_t v11 = sub_10001A43C(v8);
                if (v11
                  && (uint64_t v12 = v11,
                      [(NSArray *)[(WiFiScanResultsPreparer *)v36 blacklistedSSIDs] containsObject:v11]))
                {
                  if (qword_10027DD68) {
                    [(id)qword_10027DD68 WFLog:3, "%s: skipping %@ as it's blacklisted from recommendation", "-[WiFiScanResultsPreparer topRecommendableNetwork]", v12 message];
                  }
                }
                else if (v10 == (const __CFNumber *)1)
                {
                  if (!v38) {
                    goto LABEL_37;
                  }
                  if (sub_1000C6FC0((uint64_t)v8, @"WiFiNetworkAttributeSource") != (const __CFNumber *)1) {
                    goto LABEL_37;
                  }
                  CFNumberRef v14 = sub_1000C6FC0((uint64_t)v38, @"RSSI");
                  if ((uint64_t)v14 <= (uint64_t)sub_1000C6FC0((uint64_t)v8, @"RSSI")) {
                    goto LABEL_37;
                  }
                }
                else
                {
                  CFNumberRef v15 = sub_1000C6FC0((uint64_t)v8, @"WiFiNetworkAttributePopularityScore");
                  if ((uint64_t)v15 >= (uint64_t)v37)
                  {
                    if ((CFNumberRef v16 = v15, !v38)
                      || !v37
                      || v15 != v37
                      || (sub_1000C8A5C((uint64_t)v38)
                       || sub_1000C8A5C((uint64_t)v8)
                       || (CFNumberRef v35 = sub_1000C6FC0((uint64_t)v38, @"RSSI"),
                           (uint64_t)v35 <= (uint64_t)sub_1000C6FC0((uint64_t)v8, @"RSSI")))
                      && (sub_1000C8A5C((uint64_t)v38) || !sub_1000C8A5C((uint64_t)v8)))
                    {
                      CFNumberRef v37 = v16;
LABEL_37:
                      v38 = v8;
                    }
                  }
                }
              }
            }
          }
        }
      }
      id v7 = (char *)v7 + 1;
    }
    while (v5 != v7);
    id v17 = [(NSArray *)v3 countByEnumeratingWithState:&v43 objects:v48 count:16];
    id v5 = v17;
  }
  while (v17);
  if (!v38)
  {
LABEL_58:
    id v28 = (void *)qword_10027DD68;
    if (!qword_10027DD68)
    {
LABEL_61:
      return 0;
    }
    v29 = "%s: no prominent network found";
LABEL_60:
    [v28 WFLog:3 message:v29 -[WiFiScanResultsPreparer topRecommendableNetwork] v33 v34];
    goto LABEL_61;
  }
  if (sub_1000C6FC0((uint64_t)v38, @"WiFiNetworkAttributeSource") != (const __CFNumber *)2) {
    goto LABEL_45;
  }
  if (sub_1000C8A5C((uint64_t)v38))
  {
    uint64_t v32 = qword_10027DD68;
    if (!qword_10027DD68) {
      goto LABEL_61;
    }
    uint64_t v33 = sub_10001A43C(v38);
    CFNumberRef v34 = v37;
    v29 = "%s: prominent network (%@) is not open (score %ld)";
    goto LABEL_79;
  }
  if (!v37)
  {
    uint64_t v32 = qword_10027DD68;
    if (!qword_10027DD68) {
      goto LABEL_61;
    }
    uint64_t v33 = sub_10001A43C(v38);
    CFNumberRef v34 = 0;
    v29 = "%s: prominent network (%@) has no popularity score (score %ld)";
LABEL_79:
    id v28 = (void *)v32;
    goto LABEL_60;
  }
LABEL_45:
  if (qword_10027DD68) {
    [(id)qword_10027DD68 WFLog:3, "%s: found prominent open network (%@) with highest popularity score %ld", "-[WiFiScanResultsPreparer topRecommendableNetwork]", sub_10001A43C(v38), v37 message];
  }
  id v19 = [[WiFiScanObserverNetwork alloc] initWithWiFiNetworkRef:v38];
  if (!v19) {
    return 0;
  }
  id v20 = v19;
  id v21 = [(WiFiAvailabilityEngine *)[(WiFiScanResultsPreparer *)v36 engine] findRecommendationsForScannedNetwork:v19];
  if ((unint64_t)[v21 count] < 2)
  {
    id v26 = [v21 anyObject];
    if (v26) {
      goto LABEL_66;
    }
  }
  else
  {
    long long v41 = 0u;
    long long v42 = 0u;
    long long v39 = 0u;
    long long v40 = 0u;
    id v22 = [v21 countByEnumeratingWithState:&v39 objects:v47 count:16];
    if (!v22)
    {
LABEL_70:
      if (qword_10027DD68) {
        [(id)qword_10027DD68 WFLog:3, "%s: found matches (%lu) in availability engine but SSIDs didn't match with %@", "-[WiFiScanResultsPreparer topRecommendableNetwork]", [v21 count], -[WiFiScanObserverNetwork SSID](v20, "SSID") message];
      }
      goto LABEL_72;
    }
    id v23 = v22;
    uint64_t v24 = *(void *)v40;
LABEL_51:
    uint64_t v25 = 0;
    while (1)
    {
      if (*(void *)v40 != v24) {
        objc_enumerationMutation(v21);
      }
      id v26 = *(id *)(*((void *)&v39 + 1) + 8 * v25);
      if ([v26 SSID] == [v20 SSID])break; {
      if (v23 == (id)++v25)
      }
      {
        id v23 = [v21 countByEnumeratingWithState:&v39 objects:v47 count:16];
        if (v23) {
          goto LABEL_51;
        }
        goto LABEL_70;
      }
    }
    if (!v26) {
      goto LABEL_70;
    }
LABEL_66:
    if (objc_msgSend(objc_msgSend(v26, "network"), "source") == (id)2
      && [v26 unwantedNetworkName])
    {
      if (qword_10027DD68) {
        [(id)qword_10027DD68 WFLog:3, "%s: recommendation (%@) found but network name (%@) is considered unwanted", "-[WiFiScanResultsPreparer topRecommendableNetwork]", v26, [v26 SSID];
      }
LABEL_72:
      id v26 = 0;
    }
  }

  return v26;
}

- (__WiFiDeviceManager)manager
{
  return self->_manager;
}

- (void)setManager:(__WiFiDeviceManager *)a3
{
  self->_manager = a3;
}

- (NSArray)preparedScanResults
{
  return self->_preparedScanResults;
}

- (void)setPreparedScanResults:(id)a3
{
}

- (unint64_t)prominentScanResultsCount
{
  return self->_prominentScanResultsCount;
}

- (void)setProminentScanResultsCount:(unint64_t)a3
{
  self->_prominentScanResultsCount = a3;
}

- (NSArray)blacklistedSSIDs
{
  return self->_blacklistedSSIDs;
}

- (void)setBlacklistedSSIDs:(id)a3
{
}

- (WiFiAvailabilityEngine)engine
{
  return self->_engine;
}

- (void)setEngine:(id)a3
{
}

- (BOOL)disableProminentFiltering
{
  return self->_disableProminentFiltering;
}

- (void)setDisableProminentFiltering:(BOOL)a3
{
  self->_disableProminentFiltering = a3;
}

@end