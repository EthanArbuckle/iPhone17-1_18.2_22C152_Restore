@interface AWDWiFiDPSReport
+ (Class)dpsCounterSampleType;
+ (Class)probeResultType;
+ (Class)stallNotificationType;
+ (Class)usbEventType;
- (AWDWiFiDPSEpilogue)dpsEpiloge;
- (AWDWiFiDPSSnapshot)snapshot;
- (BOOL)hasDpsEpiloge;
- (BOOL)hasSnapshot;
- (BOOL)hasTimestamp;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSMutableArray)dpsCounterSamples;
- (NSMutableArray)probeResults;
- (NSMutableArray)stallNotifications;
- (NSMutableArray)usbEvents;
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
- (void)dealloc;
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

@implementation AWDWiFiDPSReport

- (void)dealloc
{
  [(AWDWiFiDPSReport *)self setStallNotifications:0];
  [(AWDWiFiDPSReport *)self setProbeResults:0];
  [(AWDWiFiDPSReport *)self setDpsCounterSamples:0];
  [(AWDWiFiDPSReport *)self setDpsEpiloge:0];
  [(AWDWiFiDPSReport *)self setSnapshot:0];
  [(AWDWiFiDPSReport *)self setUsbEvents:0];
  v3.receiver = self;
  v3.super_class = (Class)AWDWiFiDPSReport;
  [(AWDWiFiDPSReport *)&v3 dealloc];
}

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
  stallNotifications = self->_stallNotifications;
  if (!stallNotifications)
  {
    stallNotifications = (NSMutableArray *)objc_alloc_init(MEMORY[0x263EFF980]);
    self->_stallNotifications = stallNotifications;
  }

  [(NSMutableArray *)stallNotifications addObject:a3];
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
  probeResults = self->_probeResults;
  if (!probeResults)
  {
    probeResults = (NSMutableArray *)objc_alloc_init(MEMORY[0x263EFF980]);
    self->_probeResults = probeResults;
  }

  [(NSMutableArray *)probeResults addObject:a3];
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
  dpsCounterSamples = self->_dpsCounterSamples;
  if (!dpsCounterSamples)
  {
    dpsCounterSamples = (NSMutableArray *)objc_alloc_init(MEMORY[0x263EFF980]);
    self->_dpsCounterSamples = dpsCounterSamples;
  }

  [(NSMutableArray *)dpsCounterSamples addObject:a3];
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
  usbEvents = self->_usbEvents;
  if (!usbEvents)
  {
    usbEvents = (NSMutableArray *)objc_alloc_init(MEMORY[0x263EFF980]);
    self->_usbEvents = usbEvents;
  }

  [(NSMutableArray *)usbEvents addObject:a3];
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
  v3.receiver = self;
  v3.super_class = (Class)AWDWiFiDPSReport;
  return (id)[NSString stringWithFormat:@"%@ %@", -[AWDWiFiDPSReport description](&v3, sel_description), -[AWDWiFiDPSReport dictionaryRepresentation](self, "dictionaryRepresentation")];
}

- (id)dictionaryRepresentation
{
  uint64_t v51 = *MEMORY[0x263EF8340];
  objc_super v3 = (void *)[MEMORY[0x263EFF9A0] dictionary];
  if (*(unsigned char *)&self->_has) {
    [v3 setObject:[NSNumber numberWithUnsignedLongLong:self->_timestamp] forKey:@"timestamp"];
  }
  if ([(NSMutableArray *)self->_stallNotifications count])
  {
    v4 = [objc_alloc(MEMORY[0x263EFF980]) initWithCapacity:-[NSMutableArray count](self->_stallNotifications, "count")];
    long long v43 = 0u;
    long long v44 = 0u;
    long long v45 = 0u;
    long long v46 = 0u;
    stallNotifications = self->_stallNotifications;
    uint64_t v6 = [(NSMutableArray *)stallNotifications countByEnumeratingWithState:&v43 objects:v50 count:16];
    if (v6)
    {
      uint64_t v7 = v6;
      uint64_t v8 = *(void *)v44;
      do
      {
        for (uint64_t i = 0; i != v7; ++i)
        {
          if (*(void *)v44 != v8) {
            objc_enumerationMutation(stallNotifications);
          }
          [v4 addObject:[(*(id *)(*((void *)&v43 + 1) + 8 * i)) dictionaryRepresentation]];
        }
        uint64_t v7 = [(NSMutableArray *)stallNotifications countByEnumeratingWithState:&v43 objects:v50 count:16];
      }
      while (v7);
    }
    [v3 setObject:v4 forKey:@"stallNotification"];
  }
  if ([(NSMutableArray *)self->_probeResults count])
  {
    v10 = [objc_alloc(MEMORY[0x263EFF980]) initWithCapacity:-[NSMutableArray count](self->_probeResults, "count")];
    long long v39 = 0u;
    long long v40 = 0u;
    long long v41 = 0u;
    long long v42 = 0u;
    probeResults = self->_probeResults;
    uint64_t v12 = [(NSMutableArray *)probeResults countByEnumeratingWithState:&v39 objects:v49 count:16];
    if (v12)
    {
      uint64_t v13 = v12;
      uint64_t v14 = *(void *)v40;
      do
      {
        for (uint64_t j = 0; j != v13; ++j)
        {
          if (*(void *)v40 != v14) {
            objc_enumerationMutation(probeResults);
          }
          [v10 addObject:[*(id *)(*((void *)&v39 + 1) + 8 * j) dictionaryRepresentation]];
        }
        uint64_t v13 = [(NSMutableArray *)probeResults countByEnumeratingWithState:&v39 objects:v49 count:16];
      }
      while (v13);
    }
    [v3 setObject:v10 forKey:@"probeResult"];
  }
  if ([(NSMutableArray *)self->_dpsCounterSamples count])
  {
    v16 = [objc_alloc(MEMORY[0x263EFF980]) initWithCapacity:-[NSMutableArray count](self->_dpsCounterSamples, "count")];
    long long v35 = 0u;
    long long v36 = 0u;
    long long v37 = 0u;
    long long v38 = 0u;
    dpsCounterSamples = self->_dpsCounterSamples;
    uint64_t v18 = [(NSMutableArray *)dpsCounterSamples countByEnumeratingWithState:&v35 objects:v48 count:16];
    if (v18)
    {
      uint64_t v19 = v18;
      uint64_t v20 = *(void *)v36;
      do
      {
        for (uint64_t k = 0; k != v19; ++k)
        {
          if (*(void *)v36 != v20) {
            objc_enumerationMutation(dpsCounterSamples);
          }
          [v16 addObject:[*(id *)(*((void *)&v35 + 1) + 8 * k) dictionaryRepresentation]];
        }
        uint64_t v19 = [(NSMutableArray *)dpsCounterSamples countByEnumeratingWithState:&v35 objects:v48 count:16];
      }
      while (v19);
    }
    [v3 setObject:v16 forKey:@"dpsCounterSample"];
  }
  dpsEpiloge = self->_dpsEpiloge;
  if (dpsEpiloge) {
    [v3 setObject:-[AWDWiFiDPSEpilogue dictionaryRepresentation](dpsEpiloge, "dictionaryRepresentation") forKey:@"dpsEpiloge"];
  }
  snapshot = self->_snapshot;
  if (snapshot) {
    [v3 setObject:-[AWDWiFiDPSSnapshot dictionaryRepresentation](snapshot, "dictionaryRepresentation") forKey:@"snapshot"];
  }
  if ([(NSMutableArray *)self->_usbEvents count])
  {
    v24 = [objc_alloc(MEMORY[0x263EFF980]) initWithCapacity:-[NSMutableArray count](self->_usbEvents, "count")];
    long long v31 = 0u;
    long long v32 = 0u;
    long long v33 = 0u;
    long long v34 = 0u;
    usbEvents = self->_usbEvents;
    uint64_t v26 = [(NSMutableArray *)usbEvents countByEnumeratingWithState:&v31 objects:v47 count:16];
    if (v26)
    {
      uint64_t v27 = v26;
      uint64_t v28 = *(void *)v32;
      do
      {
        for (uint64_t m = 0; m != v27; ++m)
        {
          if (*(void *)v32 != v28) {
            objc_enumerationMutation(usbEvents);
          }
          [v24 addObject:[(*(id *)(*((void *)&v31 + 1) + 8 * m)) dictionaryRepresentation]];
        }
        uint64_t v27 = [(NSMutableArray *)usbEvents countByEnumeratingWithState:&v31 objects:v47 count:16];
      }
      while (v27);
    }
    [v3 setObject:v24 forKey:@"usbEvent"];
  }
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return AWDWiFiDPSReportReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  uint64_t v44 = *MEMORY[0x263EF8340];
  if (*(unsigned char *)&self->_has) {
    PBDataWriterWriteUint64Field();
  }
  long long v38 = 0u;
  long long v39 = 0u;
  long long v36 = 0u;
  long long v37 = 0u;
  stallNotifications = self->_stallNotifications;
  uint64_t v5 = [(NSMutableArray *)stallNotifications countByEnumeratingWithState:&v36 objects:v43 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v37;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v37 != v7) {
          objc_enumerationMutation(stallNotifications);
        }
        PBDataWriterWriteSubmessage();
      }
      uint64_t v6 = [(NSMutableArray *)stallNotifications countByEnumeratingWithState:&v36 objects:v43 count:16];
    }
    while (v6);
  }
  long long v34 = 0u;
  long long v35 = 0u;
  long long v32 = 0u;
  long long v33 = 0u;
  probeResults = self->_probeResults;
  uint64_t v10 = [(NSMutableArray *)probeResults countByEnumeratingWithState:&v32 objects:v42 count:16];
  if (v10)
  {
    uint64_t v11 = v10;
    uint64_t v12 = *(void *)v33;
    do
    {
      for (uint64_t j = 0; j != v11; ++j)
      {
        if (*(void *)v33 != v12) {
          objc_enumerationMutation(probeResults);
        }
        PBDataWriterWriteSubmessage();
      }
      uint64_t v11 = [(NSMutableArray *)probeResults countByEnumeratingWithState:&v32 objects:v42 count:16];
    }
    while (v11);
  }
  long long v30 = 0u;
  long long v31 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  dpsCounterSamples = self->_dpsCounterSamples;
  uint64_t v15 = [(NSMutableArray *)dpsCounterSamples countByEnumeratingWithState:&v28 objects:v41 count:16];
  if (v15)
  {
    uint64_t v16 = v15;
    uint64_t v17 = *(void *)v29;
    do
    {
      for (uint64_t k = 0; k != v16; ++k)
      {
        if (*(void *)v29 != v17) {
          objc_enumerationMutation(dpsCounterSamples);
        }
        PBDataWriterWriteSubmessage();
      }
      uint64_t v16 = [(NSMutableArray *)dpsCounterSamples countByEnumeratingWithState:&v28 objects:v41 count:16];
    }
    while (v16);
  }
  if (self->_dpsEpiloge) {
    PBDataWriterWriteSubmessage();
  }
  if (self->_snapshot) {
    PBDataWriterWriteSubmessage();
  }
  long long v26 = 0u;
  long long v27 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  usbEvents = self->_usbEvents;
  uint64_t v20 = [(NSMutableArray *)usbEvents countByEnumeratingWithState:&v24 objects:v40 count:16];
  if (v20)
  {
    uint64_t v21 = v20;
    uint64_t v22 = *(void *)v25;
    do
    {
      for (uint64_t m = 0; m != v21; ++m)
      {
        if (*(void *)v25 != v22) {
          objc_enumerationMutation(usbEvents);
        }
        PBDataWriterWriteSubmessage();
      }
      uint64_t v21 = [(NSMutableArray *)usbEvents countByEnumeratingWithState:&v24 objects:v40 count:16];
    }
    while (v21);
  }
}

- (void)copyTo:(id)a3
{
  if (*(unsigned char *)&self->_has)
  {
    *((void *)a3 + 1) = self->_timestamp;
    *((unsigned char *)a3 + 64) |= 1u;
  }
  if ([(AWDWiFiDPSReport *)self stallNotificationsCount])
  {
    [a3 clearStallNotifications];
    unint64_t v5 = [(AWDWiFiDPSReport *)self stallNotificationsCount];
    if (v5)
    {
      unint64_t v6 = v5;
      for (uint64_t i = 0; i != v6; ++i)
        [a3 addStallNotification:-[AWDWiFiDPSReport stallNotificationAtIndex:](self, "stallNotificationAtIndex:", i)];
    }
  }
  if ([(AWDWiFiDPSReport *)self probeResultsCount])
  {
    [a3 clearProbeResults];
    unint64_t v8 = [(AWDWiFiDPSReport *)self probeResultsCount];
    if (v8)
    {
      unint64_t v9 = v8;
      for (uint64_t j = 0; j != v9; ++j)
        [a3 addProbeResult:-[AWDWiFiDPSReport probeResultAtIndex:](self, "probeResultAtIndex:", j)];
    }
  }
  if ([(AWDWiFiDPSReport *)self dpsCounterSamplesCount])
  {
    [a3 clearDpsCounterSamples];
    unint64_t v11 = [(AWDWiFiDPSReport *)self dpsCounterSamplesCount];
    if (v11)
    {
      unint64_t v12 = v11;
      for (uint64_t k = 0; k != v12; ++k)
        [a3 addDpsCounterSample:-[AWDWiFiDPSReport dpsCounterSampleAtIndex:](self, "dpsCounterSampleAtIndex:", k)];
    }
  }
  if (self->_dpsEpiloge) {
    [a3 setDpsEpiloge:];
  }
  if (self->_snapshot) {
    [a3 setSnapshot:];
  }
  if ([(AWDWiFiDPSReport *)self usbEventsCount])
  {
    [a3 clearUsbEvents];
    unint64_t v14 = [(AWDWiFiDPSReport *)self usbEventsCount];
    if (v14)
    {
      unint64_t v15 = v14;
      for (uint64_t m = 0; m != v15; ++m)
        [a3 addUsbEvent:-[AWDWiFiDPSReport usbEventAtIndex:](self, "usbEventAtIndex:", m)];
    }
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v52 = *MEMORY[0x263EF8340];
  uint64_t v5 = [objc_opt_class() allocWithZone:a3];
  unint64_t v6 = (id *)v5;
  if (*(unsigned char *)&self->_has)
  {
    *(void *)(v5 + 8) = self->_timestamp;
    *(unsigned char *)(v5 + 64) |= 1u;
  }
  long long v46 = 0u;
  long long v47 = 0u;
  long long v44 = 0u;
  long long v45 = 0u;
  stallNotifications = self->_stallNotifications;
  uint64_t v8 = [(NSMutableArray *)stallNotifications countByEnumeratingWithState:&v44 objects:v51 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v45;
    do
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v45 != v10) {
          objc_enumerationMutation(stallNotifications);
        }
        unint64_t v12 = (void *)[*(id *)(*((void *)&v44 + 1) + 8 * i) copyWithZone:a3];
        [v6 addStallNotification:v12];
      }
      uint64_t v9 = [(NSMutableArray *)stallNotifications countByEnumeratingWithState:&v44 objects:v51 count:16];
    }
    while (v9);
  }
  long long v42 = 0u;
  long long v43 = 0u;
  long long v40 = 0u;
  long long v41 = 0u;
  probeResults = self->_probeResults;
  uint64_t v14 = [(NSMutableArray *)probeResults countByEnumeratingWithState:&v40 objects:v50 count:16];
  if (v14)
  {
    uint64_t v15 = v14;
    uint64_t v16 = *(void *)v41;
    do
    {
      for (uint64_t j = 0; j != v15; ++j)
      {
        if (*(void *)v41 != v16) {
          objc_enumerationMutation(probeResults);
        }
        uint64_t v18 = (void *)[*(id *)(*((void *)&v40 + 1) + 8 * j) copyWithZone:a3];
        [v6 addProbeResult:v18];
      }
      uint64_t v15 = [(NSMutableArray *)probeResults countByEnumeratingWithState:&v40 objects:v50 count:16];
    }
    while (v15);
  }
  long long v38 = 0u;
  long long v39 = 0u;
  long long v36 = 0u;
  long long v37 = 0u;
  dpsCounterSamples = self->_dpsCounterSamples;
  uint64_t v20 = [(NSMutableArray *)dpsCounterSamples countByEnumeratingWithState:&v36 objects:v49 count:16];
  if (v20)
  {
    uint64_t v21 = v20;
    uint64_t v22 = *(void *)v37;
    do
    {
      for (uint64_t k = 0; k != v21; ++k)
      {
        if (*(void *)v37 != v22) {
          objc_enumerationMutation(dpsCounterSamples);
        }
        long long v24 = (void *)[*(id *)(*((void *)&v36 + 1) + 8 * k) copyWithZone:a3];
        [v6 addDpsCounterSample:v24];
      }
      uint64_t v21 = [(NSMutableArray *)dpsCounterSamples countByEnumeratingWithState:&v36 objects:v49 count:16];
    }
    while (v21);
  }

  v6[3] = [(AWDWiFiDPSEpilogue *)self->_dpsEpiloge copyWithZone:a3];
  v6[5] = [(AWDWiFiDPSSnapshot *)self->_snapshot copyWithZone:a3];
  long long v32 = 0u;
  long long v33 = 0u;
  long long v34 = 0u;
  long long v35 = 0u;
  usbEvents = self->_usbEvents;
  uint64_t v26 = [(NSMutableArray *)usbEvents countByEnumeratingWithState:&v32 objects:v48 count:16];
  if (v26)
  {
    uint64_t v27 = v26;
    uint64_t v28 = *(void *)v33;
    do
    {
      for (uint64_t m = 0; m != v27; ++m)
      {
        if (*(void *)v33 != v28) {
          objc_enumerationMutation(usbEvents);
        }
        long long v30 = (void *)[*(id *)(*((void *)&v32 + 1) + 8 * m) copyWithZone:a3];
        [v6 addUsbEvent:v30];
      }
      uint64_t v27 = [(NSMutableArray *)usbEvents countByEnumeratingWithState:&v32 objects:v48 count:16];
    }
    while (v27);
  }
  return v6;
}

- (BOOL)isEqual:(id)a3
{
  int v5 = [a3 isMemberOfClass:objc_opt_class()];
  if (v5)
  {
    if (*(unsigned char *)&self->_has)
    {
      if ((*((unsigned char *)a3 + 64) & 1) == 0 || self->_timestamp != *((void *)a3 + 1)) {
        goto LABEL_19;
      }
    }
    else if (*((unsigned char *)a3 + 64))
    {
LABEL_19:
      LOBYTE(v5) = 0;
      return v5;
    }
    stallNotifications = self->_stallNotifications;
    if (!((unint64_t)stallNotifications | *((void *)a3 + 6))
      || (int v5 = -[NSMutableArray isEqual:](stallNotifications, "isEqual:")) != 0)
    {
      probeResults = self->_probeResults;
      if (!((unint64_t)probeResults | *((void *)a3 + 4))
        || (int v5 = -[NSMutableArray isEqual:](probeResults, "isEqual:")) != 0)
      {
        dpsCounterSamples = self->_dpsCounterSamples;
        if (!((unint64_t)dpsCounterSamples | *((void *)a3 + 2))
          || (int v5 = -[NSMutableArray isEqual:](dpsCounterSamples, "isEqual:")) != 0)
        {
          dpsEpiloge = self->_dpsEpiloge;
          if (!((unint64_t)dpsEpiloge | *((void *)a3 + 3))
            || (int v5 = -[AWDWiFiDPSEpilogue isEqual:](dpsEpiloge, "isEqual:")) != 0)
          {
            snapshot = self->_snapshot;
            if (!((unint64_t)snapshot | *((void *)a3 + 5))
              || (int v5 = -[AWDWiFiDPSSnapshot isEqual:](snapshot, "isEqual:")) != 0)
            {
              usbEvents = self->_usbEvents;
              if ((unint64_t)usbEvents | *((void *)a3 + 7))
              {
                LOBYTE(v5) = -[NSMutableArray isEqual:](usbEvents, "isEqual:");
              }
              else
              {
                LOBYTE(v5) = 1;
              }
            }
          }
        }
      }
    }
  }
  return v5;
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
  unint64_t v7 = [(AWDWiFiDPSEpilogue *)self->_dpsEpiloge hash];
  unint64_t v8 = v7 ^ [(AWDWiFiDPSSnapshot *)self->_snapshot hash];
  return v6 ^ v8 ^ [(NSMutableArray *)self->_usbEvents hash];
}

- (void)mergeFrom:(id)a3
{
  uint64_t v49 = *MEMORY[0x263EF8340];
  if (*((unsigned char *)a3 + 64))
  {
    self->_timestamp = *((void *)a3 + 1);
    *(unsigned char *)&self->_has |= 1u;
  }
  long long v43 = 0u;
  long long v44 = 0u;
  long long v41 = 0u;
  long long v42 = 0u;
  uint64_t v5 = (void *)*((void *)a3 + 6);
  uint64_t v6 = [v5 countByEnumeratingWithState:&v41 objects:v48 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v42;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v42 != v8) {
          objc_enumerationMutation(v5);
        }
        [(AWDWiFiDPSReport *)self addStallNotification:*(void *)(*((void *)&v41 + 1) + 8 * i)];
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v41 objects:v48 count:16];
    }
    while (v7);
  }
  long long v39 = 0u;
  long long v40 = 0u;
  long long v37 = 0u;
  long long v38 = 0u;
  uint64_t v10 = (void *)*((void *)a3 + 4);
  uint64_t v11 = [v10 countByEnumeratingWithState:&v37 objects:v47 count:16];
  if (v11)
  {
    uint64_t v12 = v11;
    uint64_t v13 = *(void *)v38;
    do
    {
      for (uint64_t j = 0; j != v12; ++j)
      {
        if (*(void *)v38 != v13) {
          objc_enumerationMutation(v10);
        }
        [(AWDWiFiDPSReport *)self addProbeResult:*(void *)(*((void *)&v37 + 1) + 8 * j)];
      }
      uint64_t v12 = [v10 countByEnumeratingWithState:&v37 objects:v47 count:16];
    }
    while (v12);
  }
  long long v35 = 0u;
  long long v36 = 0u;
  long long v33 = 0u;
  long long v34 = 0u;
  uint64_t v15 = (void *)*((void *)a3 + 2);
  uint64_t v16 = [v15 countByEnumeratingWithState:&v33 objects:v46 count:16];
  if (v16)
  {
    uint64_t v17 = v16;
    uint64_t v18 = *(void *)v34;
    do
    {
      for (uint64_t k = 0; k != v17; ++k)
      {
        if (*(void *)v34 != v18) {
          objc_enumerationMutation(v15);
        }
        [(AWDWiFiDPSReport *)self addDpsCounterSample:*(void *)(*((void *)&v33 + 1) + 8 * k)];
      }
      uint64_t v17 = [v15 countByEnumeratingWithState:&v33 objects:v46 count:16];
    }
    while (v17);
  }
  dpsEpiloge = self->_dpsEpiloge;
  uint64_t v21 = *((void *)a3 + 3);
  if (dpsEpiloge)
  {
    if (v21) {
      -[AWDWiFiDPSEpilogue mergeFrom:](dpsEpiloge, "mergeFrom:");
    }
  }
  else if (v21)
  {
    -[AWDWiFiDPSReport setDpsEpiloge:](self, "setDpsEpiloge:");
  }
  snapshot = self->_snapshot;
  uint64_t v23 = *((void *)a3 + 5);
  if (snapshot)
  {
    if (v23) {
      -[AWDWiFiDPSSnapshot mergeFrom:](snapshot, "mergeFrom:");
    }
  }
  else if (v23)
  {
    -[AWDWiFiDPSReport setSnapshot:](self, "setSnapshot:");
  }
  long long v31 = 0u;
  long long v32 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  long long v24 = (void *)*((void *)a3 + 7);
  uint64_t v25 = [v24 countByEnumeratingWithState:&v29 objects:v45 count:16];
  if (v25)
  {
    uint64_t v26 = v25;
    uint64_t v27 = *(void *)v30;
    do
    {
      for (uint64_t m = 0; m != v26; ++m)
      {
        if (*(void *)v30 != v27) {
          objc_enumerationMutation(v24);
        }
        [(AWDWiFiDPSReport *)self addUsbEvent:*(void *)(*((void *)&v29 + 1) + 8 * m)];
      }
      uint64_t v26 = [v24 countByEnumeratingWithState:&v29 objects:v45 count:16];
    }
    while (v26);
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

- (AWDWiFiDPSEpilogue)dpsEpiloge
{
  return self->_dpsEpiloge;
}

- (void)setDpsEpiloge:(id)a3
{
}

- (AWDWiFiDPSSnapshot)snapshot
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

@end