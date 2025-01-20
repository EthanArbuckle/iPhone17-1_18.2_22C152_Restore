@interface WiFiAnalyticsAWDWiFiDPSReport
+ (Class)dpsCounterSampleType;
+ (Class)probeResultType;
+ (Class)stallNotificationType;
+ (Class)usbEventType;
- (BOOL)hasDpsEpiloge;
- (BOOL)hasSnapshot;
- (BOOL)hasTimestamp;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSMutableArray)dpsCounterSamples;
- (NSMutableArray)probeResults;
- (NSMutableArray)stallNotifications;
- (NSMutableArray)usbEvents;
- (WiFiAnalyticsAWDWiFiDPSEpilogue)dpsEpiloge;
- (WiFiAnalyticsAWDWiFiDPSSnapshot)snapshot;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)dpsCounterSampleAtIndex:(unint64_t)a3;
- (id)probeResultAtIndex:(unint64_t)a3;
- (id)stallNotificationAtIndex:(unint64_t)a3;
- (id)usbEventAtIndex:(unint64_t)a3;
- (unint64_t)dpsCounterSamplesCount;
- (unint64_t)hash;
- (unint64_t)probeResultsCount;
- (unint64_t)stallNotificationsCount;
- (unint64_t)timestamp;
- (unint64_t)usbEventsCount;
- (void)addDpsCounterSample:(id)a3;
- (void)addProbeResult:(id)a3;
- (void)addStallNotification:(id)a3;
- (void)addUsbEvent:(id)a3;
- (void)clearDpsCounterSamples;
- (void)clearProbeResults;
- (void)clearStallNotifications;
- (void)clearUsbEvents;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setDpsCounterSamples:(id)a3;
- (void)setDpsEpiloge:(id)a3;
- (void)setHasTimestamp:(BOOL)a3;
- (void)setProbeResults:(id)a3;
- (void)setSnapshot:(id)a3;
- (void)setStallNotifications:(id)a3;
- (void)setTimestamp:(unint64_t)a3;
- (void)setUsbEvents:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation WiFiAnalyticsAWDWiFiDPSReport

- (void)setTimestamp:(unint64_t)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_timestamp = a3;
}

- (void)setHasTimestamp:(BOOL)a3
{
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasTimestamp
{
  return *(unsigned char *)&self->_has & 1;
}

- (void)clearStallNotifications
{
}

- (void)addStallNotification:(id)a3
{
  id v4 = a3;
  stallNotifications = self->_stallNotifications;
  id v8 = v4;
  if (!stallNotifications)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x263EFF980]);
    v7 = self->_stallNotifications;
    self->_stallNotifications = v6;

    id v4 = v8;
    stallNotifications = self->_stallNotifications;
  }
  [(NSMutableArray *)stallNotifications addObject:v4];
}

- (unint64_t)stallNotificationsCount
{
  return [(NSMutableArray *)self->_stallNotifications count];
}

- (id)stallNotificationAtIndex:(unint64_t)a3
{
  return (id)[(NSMutableArray *)self->_stallNotifications objectAtIndex:a3];
}

+ (Class)stallNotificationType
{
  return (Class)objc_opt_class();
}

- (void)clearProbeResults
{
}

- (void)addProbeResult:(id)a3
{
  id v4 = a3;
  probeResults = self->_probeResults;
  id v8 = v4;
  if (!probeResults)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x263EFF980]);
    v7 = self->_probeResults;
    self->_probeResults = v6;

    id v4 = v8;
    probeResults = self->_probeResults;
  }
  [(NSMutableArray *)probeResults addObject:v4];
}

- (unint64_t)probeResultsCount
{
  return [(NSMutableArray *)self->_probeResults count];
}

- (id)probeResultAtIndex:(unint64_t)a3
{
  return (id)[(NSMutableArray *)self->_probeResults objectAtIndex:a3];
}

+ (Class)probeResultType
{
  return (Class)objc_opt_class();
}

- (void)clearDpsCounterSamples
{
}

- (void)addDpsCounterSample:(id)a3
{
  id v4 = a3;
  dpsCounterSamples = self->_dpsCounterSamples;
  id v8 = v4;
  if (!dpsCounterSamples)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x263EFF980]);
    v7 = self->_dpsCounterSamples;
    self->_dpsCounterSamples = v6;

    id v4 = v8;
    dpsCounterSamples = self->_dpsCounterSamples;
  }
  [(NSMutableArray *)dpsCounterSamples addObject:v4];
}

- (unint64_t)dpsCounterSamplesCount
{
  return [(NSMutableArray *)self->_dpsCounterSamples count];
}

- (id)dpsCounterSampleAtIndex:(unint64_t)a3
{
  return (id)[(NSMutableArray *)self->_dpsCounterSamples objectAtIndex:a3];
}

+ (Class)dpsCounterSampleType
{
  return (Class)objc_opt_class();
}

- (BOOL)hasDpsEpiloge
{
  return self->_dpsEpiloge != 0;
}

- (BOOL)hasSnapshot
{
  return self->_snapshot != 0;
}

- (void)clearUsbEvents
{
}

- (void)addUsbEvent:(id)a3
{
  id v4 = a3;
  usbEvents = self->_usbEvents;
  id v8 = v4;
  if (!usbEvents)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x263EFF980]);
    v7 = self->_usbEvents;
    self->_usbEvents = v6;

    id v4 = v8;
    usbEvents = self->_usbEvents;
  }
  [(NSMutableArray *)usbEvents addObject:v4];
}

- (unint64_t)usbEventsCount
{
  return [(NSMutableArray *)self->_usbEvents count];
}

- (id)usbEventAtIndex:(unint64_t)a3
{
  return (id)[(NSMutableArray *)self->_usbEvents objectAtIndex:a3];
}

+ (Class)usbEventType
{
  return (Class)objc_opt_class();
}

- (id)description
{
  v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)WiFiAnalyticsAWDWiFiDPSReport;
  id v4 = [(WiFiAnalyticsAWDWiFiDPSReport *)&v8 description];
  v5 = [(WiFiAnalyticsAWDWiFiDPSReport *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  uint64_t v58 = *MEMORY[0x263EF8340];
  v3 = [MEMORY[0x263EFF9A0] dictionary];
  if (*(unsigned char *)&self->_has)
  {
    id v4 = [NSNumber numberWithUnsignedLongLong:self->_timestamp];
    [v3 setObject:v4 forKey:@"timestamp"];
  }
  if ([(NSMutableArray *)self->_stallNotifications count])
  {
    v5 = objc_msgSend(objc_alloc(MEMORY[0x263EFF980]), "initWithCapacity:", -[NSMutableArray count](self->_stallNotifications, "count"));
    long long v50 = 0u;
    long long v51 = 0u;
    long long v52 = 0u;
    long long v53 = 0u;
    v6 = self->_stallNotifications;
    uint64_t v7 = [(NSMutableArray *)v6 countByEnumeratingWithState:&v50 objects:v57 count:16];
    if (v7)
    {
      uint64_t v8 = v7;
      uint64_t v9 = *(void *)v51;
      do
      {
        for (uint64_t i = 0; i != v8; ++i)
        {
          if (*(void *)v51 != v9) {
            objc_enumerationMutation(v6);
          }
          v11 = [*(id *)(*((void *)&v50 + 1) + 8 * i) dictionaryRepresentation];
          [v5 addObject:v11];
        }
        uint64_t v8 = [(NSMutableArray *)v6 countByEnumeratingWithState:&v50 objects:v57 count:16];
      }
      while (v8);
    }

    [v3 setObject:v5 forKey:@"stallNotification"];
  }
  if ([(NSMutableArray *)self->_probeResults count])
  {
    v12 = objc_msgSend(objc_alloc(MEMORY[0x263EFF980]), "initWithCapacity:", -[NSMutableArray count](self->_probeResults, "count"));
    long long v46 = 0u;
    long long v47 = 0u;
    long long v48 = 0u;
    long long v49 = 0u;
    v13 = self->_probeResults;
    uint64_t v14 = [(NSMutableArray *)v13 countByEnumeratingWithState:&v46 objects:v56 count:16];
    if (v14)
    {
      uint64_t v15 = v14;
      uint64_t v16 = *(void *)v47;
      do
      {
        for (uint64_t j = 0; j != v15; ++j)
        {
          if (*(void *)v47 != v16) {
            objc_enumerationMutation(v13);
          }
          v18 = [*(id *)(*((void *)&v46 + 1) + 8 * j) dictionaryRepresentation];
          [v12 addObject:v18];
        }
        uint64_t v15 = [(NSMutableArray *)v13 countByEnumeratingWithState:&v46 objects:v56 count:16];
      }
      while (v15);
    }

    [v3 setObject:v12 forKey:@"probeResult"];
  }
  if ([(NSMutableArray *)self->_dpsCounterSamples count])
  {
    v19 = objc_msgSend(objc_alloc(MEMORY[0x263EFF980]), "initWithCapacity:", -[NSMutableArray count](self->_dpsCounterSamples, "count"));
    long long v42 = 0u;
    long long v43 = 0u;
    long long v44 = 0u;
    long long v45 = 0u;
    v20 = self->_dpsCounterSamples;
    uint64_t v21 = [(NSMutableArray *)v20 countByEnumeratingWithState:&v42 objects:v55 count:16];
    if (v21)
    {
      uint64_t v22 = v21;
      uint64_t v23 = *(void *)v43;
      do
      {
        for (uint64_t k = 0; k != v22; ++k)
        {
          if (*(void *)v43 != v23) {
            objc_enumerationMutation(v20);
          }
          v25 = [*(id *)(*((void *)&v42 + 1) + 8 * k) dictionaryRepresentation];
          [v19 addObject:v25];
        }
        uint64_t v22 = [(NSMutableArray *)v20 countByEnumeratingWithState:&v42 objects:v55 count:16];
      }
      while (v22);
    }

    [v3 setObject:v19 forKey:@"dpsCounterSample"];
  }
  dpsEpiloge = self->_dpsEpiloge;
  if (dpsEpiloge)
  {
    v27 = [(WiFiAnalyticsAWDWiFiDPSEpilogue *)dpsEpiloge dictionaryRepresentation];
    [v3 setObject:v27 forKey:@"dpsEpiloge"];
  }
  snapshot = self->_snapshot;
  if (snapshot)
  {
    v29 = [(WiFiAnalyticsAWDWiFiDPSSnapshot *)snapshot dictionaryRepresentation];
    [v3 setObject:v29 forKey:@"snapshot"];
  }
  if ([(NSMutableArray *)self->_usbEvents count])
  {
    v30 = objc_msgSend(objc_alloc(MEMORY[0x263EFF980]), "initWithCapacity:", -[NSMutableArray count](self->_usbEvents, "count"));
    long long v38 = 0u;
    long long v39 = 0u;
    long long v40 = 0u;
    long long v41 = 0u;
    v31 = self->_usbEvents;
    uint64_t v32 = [(NSMutableArray *)v31 countByEnumeratingWithState:&v38 objects:v54 count:16];
    if (v32)
    {
      uint64_t v33 = v32;
      uint64_t v34 = *(void *)v39;
      do
      {
        for (uint64_t m = 0; m != v33; ++m)
        {
          if (*(void *)v39 != v34) {
            objc_enumerationMutation(v31);
          }
          v36 = objc_msgSend(*(id *)(*((void *)&v38 + 1) + 8 * m), "dictionaryRepresentation", (void)v38);
          [v30 addObject:v36];
        }
        uint64_t v33 = [(NSMutableArray *)v31 countByEnumeratingWithState:&v38 objects:v54 count:16];
      }
      while (v33);
    }

    [v3 setObject:v30 forKey:@"usbEvent"];
  }
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return WiFiAnalyticsAWDWiFiDPSReportReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  uint64_t v45 = *MEMORY[0x263EF8340];
  id v4 = a3;
  if (*(unsigned char *)&self->_has) {
    PBDataWriterWriteUint64Field();
  }
  long long v39 = 0u;
  long long v40 = 0u;
  long long v37 = 0u;
  long long v38 = 0u;
  v5 = self->_stallNotifications;
  uint64_t v6 = [(NSMutableArray *)v5 countByEnumeratingWithState:&v37 objects:v44 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v38;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v38 != v8) {
          objc_enumerationMutation(v5);
        }
        PBDataWriterWriteSubmessage();
        ++v9;
      }
      while (v7 != v9);
      uint64_t v7 = [(NSMutableArray *)v5 countByEnumeratingWithState:&v37 objects:v44 count:16];
    }
    while (v7);
  }

  long long v35 = 0u;
  long long v36 = 0u;
  long long v33 = 0u;
  long long v34 = 0u;
  v10 = self->_probeResults;
  uint64_t v11 = [(NSMutableArray *)v10 countByEnumeratingWithState:&v33 objects:v43 count:16];
  if (v11)
  {
    uint64_t v12 = v11;
    uint64_t v13 = *(void *)v34;
    do
    {
      uint64_t v14 = 0;
      do
      {
        if (*(void *)v34 != v13) {
          objc_enumerationMutation(v10);
        }
        PBDataWriterWriteSubmessage();
        ++v14;
      }
      while (v12 != v14);
      uint64_t v12 = [(NSMutableArray *)v10 countByEnumeratingWithState:&v33 objects:v43 count:16];
    }
    while (v12);
  }

  long long v31 = 0u;
  long long v32 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  uint64_t v15 = self->_dpsCounterSamples;
  uint64_t v16 = [(NSMutableArray *)v15 countByEnumeratingWithState:&v29 objects:v42 count:16];
  if (v16)
  {
    uint64_t v17 = v16;
    uint64_t v18 = *(void *)v30;
    do
    {
      uint64_t v19 = 0;
      do
      {
        if (*(void *)v30 != v18) {
          objc_enumerationMutation(v15);
        }
        PBDataWriterWriteSubmessage();
        ++v19;
      }
      while (v17 != v19);
      uint64_t v17 = [(NSMutableArray *)v15 countByEnumeratingWithState:&v29 objects:v42 count:16];
    }
    while (v17);
  }

  if (self->_dpsEpiloge) {
    PBDataWriterWriteSubmessage();
  }
  if (self->_snapshot) {
    PBDataWriterWriteSubmessage();
  }
  long long v27 = 0u;
  long long v28 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  v20 = self->_usbEvents;
  uint64_t v21 = [(NSMutableArray *)v20 countByEnumeratingWithState:&v25 objects:v41 count:16];
  if (v21)
  {
    uint64_t v22 = v21;
    uint64_t v23 = *(void *)v26;
    do
    {
      uint64_t v24 = 0;
      do
      {
        if (*(void *)v26 != v23) {
          objc_enumerationMutation(v20);
        }
        PBDataWriterWriteSubmessage();
        ++v24;
      }
      while (v22 != v24);
      uint64_t v22 = [(NSMutableArray *)v20 countByEnumeratingWithState:&v25 objects:v41 count:16];
    }
    while (v22);
  }
}

- (void)copyTo:(id)a3
{
  id v4 = a3;
  if (*(unsigned char *)&self->_has)
  {
    v4[1] = self->_timestamp;
    *((unsigned char *)v4 + 64) |= 1u;
  }
  id v21 = v4;
  if ([(WiFiAnalyticsAWDWiFiDPSReport *)self stallNotificationsCount])
  {
    [v21 clearStallNotifications];
    unint64_t v5 = [(WiFiAnalyticsAWDWiFiDPSReport *)self stallNotificationsCount];
    if (v5)
    {
      unint64_t v6 = v5;
      for (uint64_t i = 0; i != v6; ++i)
      {
        uint64_t v8 = [(WiFiAnalyticsAWDWiFiDPSReport *)self stallNotificationAtIndex:i];
        [v21 addStallNotification:v8];
      }
    }
  }
  if ([(WiFiAnalyticsAWDWiFiDPSReport *)self probeResultsCount])
  {
    [v21 clearProbeResults];
    unint64_t v9 = [(WiFiAnalyticsAWDWiFiDPSReport *)self probeResultsCount];
    if (v9)
    {
      unint64_t v10 = v9;
      for (uint64_t j = 0; j != v10; ++j)
      {
        uint64_t v12 = [(WiFiAnalyticsAWDWiFiDPSReport *)self probeResultAtIndex:j];
        [v21 addProbeResult:v12];
      }
    }
  }
  if ([(WiFiAnalyticsAWDWiFiDPSReport *)self dpsCounterSamplesCount])
  {
    [v21 clearDpsCounterSamples];
    unint64_t v13 = [(WiFiAnalyticsAWDWiFiDPSReport *)self dpsCounterSamplesCount];
    if (v13)
    {
      unint64_t v14 = v13;
      for (uint64_t k = 0; k != v14; ++k)
      {
        uint64_t v16 = [(WiFiAnalyticsAWDWiFiDPSReport *)self dpsCounterSampleAtIndex:k];
        [v21 addDpsCounterSample:v16];
      }
    }
  }
  if (self->_dpsEpiloge) {
    objc_msgSend(v21, "setDpsEpiloge:");
  }
  if (self->_snapshot) {
    objc_msgSend(v21, "setSnapshot:");
  }
  if ([(WiFiAnalyticsAWDWiFiDPSReport *)self usbEventsCount])
  {
    [v21 clearUsbEvents];
    unint64_t v17 = [(WiFiAnalyticsAWDWiFiDPSReport *)self usbEventsCount];
    if (v17)
    {
      unint64_t v18 = v17;
      for (uint64_t m = 0; m != v18; ++m)
      {
        v20 = [(WiFiAnalyticsAWDWiFiDPSReport *)self usbEventAtIndex:m];
        [v21 addUsbEvent:v20];
      }
    }
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v56 = *MEMORY[0x263EF8340];
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  unint64_t v6 = (void *)v5;
  if (*(unsigned char *)&self->_has)
  {
    *(void *)(v5 + 8) = self->_timestamp;
    *(unsigned char *)(v5 + 64) |= 1u;
  }
  long long v50 = 0u;
  long long v51 = 0u;
  long long v48 = 0u;
  long long v49 = 0u;
  uint64_t v7 = self->_stallNotifications;
  uint64_t v8 = [(NSMutableArray *)v7 countByEnumeratingWithState:&v48 objects:v55 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v49;
    do
    {
      uint64_t v11 = 0;
      do
      {
        if (*(void *)v49 != v10) {
          objc_enumerationMutation(v7);
        }
        uint64_t v12 = (void *)[*(id *)(*((void *)&v48 + 1) + 8 * v11) copyWithZone:a3];
        [v6 addStallNotification:v12];

        ++v11;
      }
      while (v9 != v11);
      uint64_t v9 = [(NSMutableArray *)v7 countByEnumeratingWithState:&v48 objects:v55 count:16];
    }
    while (v9);
  }

  long long v46 = 0u;
  long long v47 = 0u;
  long long v44 = 0u;
  long long v45 = 0u;
  unint64_t v13 = self->_probeResults;
  uint64_t v14 = [(NSMutableArray *)v13 countByEnumeratingWithState:&v44 objects:v54 count:16];
  if (v14)
  {
    uint64_t v15 = v14;
    uint64_t v16 = *(void *)v45;
    do
    {
      uint64_t v17 = 0;
      do
      {
        if (*(void *)v45 != v16) {
          objc_enumerationMutation(v13);
        }
        unint64_t v18 = (void *)[*(id *)(*((void *)&v44 + 1) + 8 * v17) copyWithZone:a3];
        [v6 addProbeResult:v18];

        ++v17;
      }
      while (v15 != v17);
      uint64_t v15 = [(NSMutableArray *)v13 countByEnumeratingWithState:&v44 objects:v54 count:16];
    }
    while (v15);
  }

  long long v42 = 0u;
  long long v43 = 0u;
  long long v40 = 0u;
  long long v41 = 0u;
  uint64_t v19 = self->_dpsCounterSamples;
  uint64_t v20 = [(NSMutableArray *)v19 countByEnumeratingWithState:&v40 objects:v53 count:16];
  if (v20)
  {
    uint64_t v21 = v20;
    uint64_t v22 = *(void *)v41;
    do
    {
      uint64_t v23 = 0;
      do
      {
        if (*(void *)v41 != v22) {
          objc_enumerationMutation(v19);
        }
        uint64_t v24 = (void *)[*(id *)(*((void *)&v40 + 1) + 8 * v23) copyWithZone:a3];
        [v6 addDpsCounterSample:v24];

        ++v23;
      }
      while (v21 != v23);
      uint64_t v21 = [(NSMutableArray *)v19 countByEnumeratingWithState:&v40 objects:v53 count:16];
    }
    while (v21);
  }

  id v25 = [(WiFiAnalyticsAWDWiFiDPSEpilogue *)self->_dpsEpiloge copyWithZone:a3];
  long long v26 = (void *)v6[3];
  v6[3] = v25;

  id v27 = [(WiFiAnalyticsAWDWiFiDPSSnapshot *)self->_snapshot copyWithZone:a3];
  long long v28 = (void *)v6[5];
  v6[5] = v27;

  long long v38 = 0u;
  long long v39 = 0u;
  long long v36 = 0u;
  long long v37 = 0u;
  long long v29 = self->_usbEvents;
  uint64_t v30 = [(NSMutableArray *)v29 countByEnumeratingWithState:&v36 objects:v52 count:16];
  if (v30)
  {
    uint64_t v31 = v30;
    uint64_t v32 = *(void *)v37;
    do
    {
      uint64_t v33 = 0;
      do
      {
        if (*(void *)v37 != v32) {
          objc_enumerationMutation(v29);
        }
        long long v34 = objc_msgSend(*(id *)(*((void *)&v36 + 1) + 8 * v33), "copyWithZone:", a3, (void)v36);
        [v6 addUsbEvent:v34];

        ++v33;
      }
      while (v31 != v33);
      uint64_t v31 = [(NSMutableArray *)v29 countByEnumeratingWithState:&v36 objects:v52 count:16];
    }
    while (v31);
  }

  return v6;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_19;
  }
  if (*(unsigned char *)&self->_has)
  {
    if ((*((unsigned char *)v4 + 64) & 1) == 0 || self->_timestamp != *((void *)v4 + 1)) {
      goto LABEL_19;
    }
  }
  else if (*((unsigned char *)v4 + 64))
  {
LABEL_19:
    char v11 = 0;
    goto LABEL_20;
  }
  stallNotifications = self->_stallNotifications;
  if ((unint64_t)stallNotifications | *((void *)v4 + 6)
    && !-[NSMutableArray isEqual:](stallNotifications, "isEqual:"))
  {
    goto LABEL_19;
  }
  probeResults = self->_probeResults;
  if ((unint64_t)probeResults | *((void *)v4 + 4))
  {
    if (!-[NSMutableArray isEqual:](probeResults, "isEqual:")) {
      goto LABEL_19;
    }
  }
  dpsCounterSamples = self->_dpsCounterSamples;
  if ((unint64_t)dpsCounterSamples | *((void *)v4 + 2))
  {
    if (!-[NSMutableArray isEqual:](dpsCounterSamples, "isEqual:")) {
      goto LABEL_19;
    }
  }
  dpsEpiloge = self->_dpsEpiloge;
  if ((unint64_t)dpsEpiloge | *((void *)v4 + 3))
  {
    if (!-[WiFiAnalyticsAWDWiFiDPSEpilogue isEqual:](dpsEpiloge, "isEqual:")) {
      goto LABEL_19;
    }
  }
  snapshot = self->_snapshot;
  if ((unint64_t)snapshot | *((void *)v4 + 5))
  {
    if (!-[WiFiAnalyticsAWDWiFiDPSSnapshot isEqual:](snapshot, "isEqual:")) {
      goto LABEL_19;
    }
  }
  usbEvents = self->_usbEvents;
  if ((unint64_t)usbEvents | *((void *)v4 + 7)) {
    char v11 = -[NSMutableArray isEqual:](usbEvents, "isEqual:");
  }
  else {
    char v11 = 1;
  }
LABEL_20:

  return v11;
}

- (unint64_t)hash
{
  if (*(unsigned char *)&self->_has) {
    unint64_t v3 = 2654435761u * self->_timestamp;
  }
  else {
    unint64_t v3 = 0;
  }
  uint64_t v4 = [(NSMutableArray *)self->_stallNotifications hash] ^ v3;
  uint64_t v5 = [(NSMutableArray *)self->_probeResults hash];
  uint64_t v6 = v4 ^ v5 ^ [(NSMutableArray *)self->_dpsCounterSamples hash];
  unint64_t v7 = [(WiFiAnalyticsAWDWiFiDPSEpilogue *)self->_dpsEpiloge hash];
  unint64_t v8 = v7 ^ [(WiFiAnalyticsAWDWiFiDPSSnapshot *)self->_snapshot hash];
  return v6 ^ v8 ^ [(NSMutableArray *)self->_usbEvents hash];
}

- (void)mergeFrom:(id)a3
{
  uint64_t v50 = *MEMORY[0x263EF8340];
  id v4 = a3;
  uint64_t v5 = (id *)v4;
  if (*((unsigned char *)v4 + 64))
  {
    self->_timestamp = *((void *)v4 + 1);
    *(unsigned char *)&self->_has |= 1u;
  }
  long long v44 = 0u;
  long long v45 = 0u;
  long long v42 = 0u;
  long long v43 = 0u;
  id v6 = *((id *)v4 + 6);
  uint64_t v7 = [v6 countByEnumeratingWithState:&v42 objects:v49 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v43;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v43 != v9) {
          objc_enumerationMutation(v6);
        }
        [(WiFiAnalyticsAWDWiFiDPSReport *)self addStallNotification:*(void *)(*((void *)&v42 + 1) + 8 * i)];
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v42 objects:v49 count:16];
    }
    while (v8);
  }

  long long v40 = 0u;
  long long v41 = 0u;
  long long v38 = 0u;
  long long v39 = 0u;
  id v11 = v5[4];
  uint64_t v12 = [v11 countByEnumeratingWithState:&v38 objects:v48 count:16];
  if (v12)
  {
    uint64_t v13 = v12;
    uint64_t v14 = *(void *)v39;
    do
    {
      for (uint64_t j = 0; j != v13; ++j)
      {
        if (*(void *)v39 != v14) {
          objc_enumerationMutation(v11);
        }
        [(WiFiAnalyticsAWDWiFiDPSReport *)self addProbeResult:*(void *)(*((void *)&v38 + 1) + 8 * j)];
      }
      uint64_t v13 = [v11 countByEnumeratingWithState:&v38 objects:v48 count:16];
    }
    while (v13);
  }

  long long v36 = 0u;
  long long v37 = 0u;
  long long v34 = 0u;
  long long v35 = 0u;
  id v16 = v5[2];
  uint64_t v17 = [v16 countByEnumeratingWithState:&v34 objects:v47 count:16];
  if (v17)
  {
    uint64_t v18 = v17;
    uint64_t v19 = *(void *)v35;
    do
    {
      for (uint64_t k = 0; k != v18; ++k)
      {
        if (*(void *)v35 != v19) {
          objc_enumerationMutation(v16);
        }
        [(WiFiAnalyticsAWDWiFiDPSReport *)self addDpsCounterSample:*(void *)(*((void *)&v34 + 1) + 8 * k)];
      }
      uint64_t v18 = [v16 countByEnumeratingWithState:&v34 objects:v47 count:16];
    }
    while (v18);
  }

  dpsEpiloge = self->_dpsEpiloge;
  id v22 = v5[3];
  if (dpsEpiloge)
  {
    if (v22) {
      -[WiFiAnalyticsAWDWiFiDPSEpilogue mergeFrom:](dpsEpiloge, "mergeFrom:");
    }
  }
  else if (v22)
  {
    -[WiFiAnalyticsAWDWiFiDPSReport setDpsEpiloge:](self, "setDpsEpiloge:");
  }
  snapshot = self->_snapshot;
  id v24 = v5[5];
  if (snapshot)
  {
    if (v24) {
      -[WiFiAnalyticsAWDWiFiDPSSnapshot mergeFrom:](snapshot, "mergeFrom:");
    }
  }
  else if (v24)
  {
    -[WiFiAnalyticsAWDWiFiDPSReport setSnapshot:](self, "setSnapshot:");
  }
  long long v32 = 0u;
  long long v33 = 0u;
  long long v30 = 0u;
  long long v31 = 0u;
  id v25 = v5[7];
  uint64_t v26 = [v25 countByEnumeratingWithState:&v30 objects:v46 count:16];
  if (v26)
  {
    uint64_t v27 = v26;
    uint64_t v28 = *(void *)v31;
    do
    {
      for (uint64_t m = 0; m != v27; ++m)
      {
        if (*(void *)v31 != v28) {
          objc_enumerationMutation(v25);
        }
        -[WiFiAnalyticsAWDWiFiDPSReport addUsbEvent:](self, "addUsbEvent:", *(void *)(*((void *)&v30 + 1) + 8 * m), (void)v30);
      }
      uint64_t v27 = [v25 countByEnumeratingWithState:&v30 objects:v46 count:16];
    }
    while (v27);
  }
}

- (unint64_t)timestamp
{
  return self->_timestamp;
}

- (NSMutableArray)stallNotifications
{
  return self->_stallNotifications;
}

- (void)setStallNotifications:(id)a3
{
}

- (NSMutableArray)probeResults
{
  return self->_probeResults;
}

- (void)setProbeResults:(id)a3
{
}

- (NSMutableArray)dpsCounterSamples
{
  return self->_dpsCounterSamples;
}

- (void)setDpsCounterSamples:(id)a3
{
}

- (WiFiAnalyticsAWDWiFiDPSEpilogue)dpsEpiloge
{
  return self->_dpsEpiloge;
}

- (void)setDpsEpiloge:(id)a3
{
}

- (WiFiAnalyticsAWDWiFiDPSSnapshot)snapshot
{
  return self->_snapshot;
}

- (void)setSnapshot:(id)a3
{
}

- (NSMutableArray)usbEvents
{
  return self->_usbEvents;
}

- (void)setUsbEvents:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_usbEvents, 0);
  objc_storeStrong((id *)&self->_stallNotifications, 0);
  objc_storeStrong((id *)&self->_snapshot, 0);
  objc_storeStrong((id *)&self->_probeResults, 0);
  objc_storeStrong((id *)&self->_dpsEpiloge, 0);
  objc_storeStrong((id *)&self->_dpsCounterSamples, 0);
}

@end