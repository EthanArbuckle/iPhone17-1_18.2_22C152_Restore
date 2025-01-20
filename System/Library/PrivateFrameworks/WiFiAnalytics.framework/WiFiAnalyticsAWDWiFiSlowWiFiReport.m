@interface WiFiAnalyticsAWDWiFiSlowWiFiReport
+ (Class)linkQualSampleType;
+ (Class)usbEventType;
- (BOOL)hasSlowNotice;
- (BOOL)hasTimestamp;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSMutableArray)linkQualSamples;
- (NSMutableArray)usbEvents;
- (WiFiAnalyticsAWDSlowWiFiNotification)slowNotice;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)linkQualSampleAtIndex:(unint64_t)a3;
- (id)usbEventAtIndex:(unint64_t)a3;
- (unint64_t)hash;
- (unint64_t)linkQualSamplesCount;
- (unint64_t)timestamp;
- (unint64_t)usbEventsCount;
- (void)addLinkQualSample:(id)a3;
- (void)addUsbEvent:(id)a3;
- (void)clearLinkQualSamples;
- (void)clearUsbEvents;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setHasTimestamp:(BOOL)a3;
- (void)setLinkQualSamples:(id)a3;
- (void)setSlowNotice:(id)a3;
- (void)setTimestamp:(unint64_t)a3;
- (void)setUsbEvents:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation WiFiAnalyticsAWDWiFiSlowWiFiReport

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

- (BOOL)hasSlowNotice
{
  return self->_slowNotice != 0;
}

- (void)clearLinkQualSamples
{
}

- (void)addLinkQualSample:(id)a3
{
  id v4 = a3;
  linkQualSamples = self->_linkQualSamples;
  id v8 = v4;
  if (!linkQualSamples)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x263EFF980]);
    v7 = self->_linkQualSamples;
    self->_linkQualSamples = v6;

    id v4 = v8;
    linkQualSamples = self->_linkQualSamples;
  }
  [(NSMutableArray *)linkQualSamples addObject:v4];
}

- (unint64_t)linkQualSamplesCount
{
  return [(NSMutableArray *)self->_linkQualSamples count];
}

- (id)linkQualSampleAtIndex:(unint64_t)a3
{
  return (id)[(NSMutableArray *)self->_linkQualSamples objectAtIndex:a3];
}

+ (Class)linkQualSampleType
{
  return (Class)objc_opt_class();
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
  v8.super_class = (Class)WiFiAnalyticsAWDWiFiSlowWiFiReport;
  id v4 = [(WiFiAnalyticsAWDWiFiSlowWiFiReport *)&v8 description];
  v5 = [(WiFiAnalyticsAWDWiFiSlowWiFiReport *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  uint64_t v32 = *MEMORY[0x263EF8340];
  v3 = [MEMORY[0x263EFF9A0] dictionary];
  if (*(unsigned char *)&self->_has)
  {
    id v4 = [NSNumber numberWithUnsignedLongLong:self->_timestamp];
    [v3 setObject:v4 forKey:@"timestamp"];
  }
  slowNotice = self->_slowNotice;
  if (slowNotice)
  {
    v6 = [(WiFiAnalyticsAWDSlowWiFiNotification *)slowNotice dictionaryRepresentation];
    [v3 setObject:v6 forKey:@"slowNotice"];
  }
  if ([(NSMutableArray *)self->_linkQualSamples count])
  {
    v7 = objc_msgSend(objc_alloc(MEMORY[0x263EFF980]), "initWithCapacity:", -[NSMutableArray count](self->_linkQualSamples, "count"));
    long long v26 = 0u;
    long long v27 = 0u;
    long long v28 = 0u;
    long long v29 = 0u;
    objc_super v8 = self->_linkQualSamples;
    uint64_t v9 = [(NSMutableArray *)v8 countByEnumeratingWithState:&v26 objects:v31 count:16];
    if (v9)
    {
      uint64_t v10 = v9;
      uint64_t v11 = *(void *)v27;
      do
      {
        for (uint64_t i = 0; i != v10; ++i)
        {
          if (*(void *)v27 != v11) {
            objc_enumerationMutation(v8);
          }
          v13 = [*(id *)(*((void *)&v26 + 1) + 8 * i) dictionaryRepresentation];
          [v7 addObject:v13];
        }
        uint64_t v10 = [(NSMutableArray *)v8 countByEnumeratingWithState:&v26 objects:v31 count:16];
      }
      while (v10);
    }

    [v3 setObject:v7 forKey:@"linkQualSample"];
  }
  if ([(NSMutableArray *)self->_usbEvents count])
  {
    v14 = objc_msgSend(objc_alloc(MEMORY[0x263EFF980]), "initWithCapacity:", -[NSMutableArray count](self->_usbEvents, "count"));
    long long v22 = 0u;
    long long v23 = 0u;
    long long v24 = 0u;
    long long v25 = 0u;
    v15 = self->_usbEvents;
    uint64_t v16 = [(NSMutableArray *)v15 countByEnumeratingWithState:&v22 objects:v30 count:16];
    if (v16)
    {
      uint64_t v17 = v16;
      uint64_t v18 = *(void *)v23;
      do
      {
        for (uint64_t j = 0; j != v17; ++j)
        {
          if (*(void *)v23 != v18) {
            objc_enumerationMutation(v15);
          }
          v20 = objc_msgSend(*(id *)(*((void *)&v22 + 1) + 8 * j), "dictionaryRepresentation", (void)v22);
          [v14 addObject:v20];
        }
        uint64_t v17 = [(NSMutableArray *)v15 countByEnumeratingWithState:&v22 objects:v30 count:16];
      }
      while (v17);
    }

    [v3 setObject:v14 forKey:@"usbEvent"];
  }
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return WiFiAnalyticsAWDWiFiSlowWiFiReportReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  uint64_t v25 = *MEMORY[0x263EF8340];
  id v4 = a3;
  if (*(unsigned char *)&self->_has) {
    PBDataWriterWriteUint64Field();
  }
  if (self->_slowNotice) {
    PBDataWriterWriteSubmessage();
  }
  long long v21 = 0u;
  long long v22 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  v5 = self->_linkQualSamples;
  uint64_t v6 = [(NSMutableArray *)v5 countByEnumeratingWithState:&v19 objects:v24 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v20;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v20 != v8) {
          objc_enumerationMutation(v5);
        }
        PBDataWriterWriteSubmessage();
        ++v9;
      }
      while (v7 != v9);
      uint64_t v7 = [(NSMutableArray *)v5 countByEnumeratingWithState:&v19 objects:v24 count:16];
    }
    while (v7);
  }

  long long v17 = 0u;
  long long v18 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  uint64_t v10 = self->_usbEvents;
  uint64_t v11 = [(NSMutableArray *)v10 countByEnumeratingWithState:&v15 objects:v23 count:16];
  if (v11)
  {
    uint64_t v12 = v11;
    uint64_t v13 = *(void *)v16;
    do
    {
      uint64_t v14 = 0;
      do
      {
        if (*(void *)v16 != v13) {
          objc_enumerationMutation(v10);
        }
        PBDataWriterWriteSubmessage();
        ++v14;
      }
      while (v12 != v14);
      uint64_t v12 = [(NSMutableArray *)v10 countByEnumeratingWithState:&v15 objects:v23 count:16];
    }
    while (v12);
  }
}

- (void)copyTo:(id)a3
{
  id v4 = a3;
  if (*(unsigned char *)&self->_has)
  {
    v4[1] = self->_timestamp;
    *((unsigned char *)v4 + 40) |= 1u;
  }
  id v13 = v4;
  if (self->_slowNotice) {
    objc_msgSend(v4, "setSlowNotice:");
  }
  if ([(WiFiAnalyticsAWDWiFiSlowWiFiReport *)self linkQualSamplesCount])
  {
    [v13 clearLinkQualSamples];
    unint64_t v5 = [(WiFiAnalyticsAWDWiFiSlowWiFiReport *)self linkQualSamplesCount];
    if (v5)
    {
      unint64_t v6 = v5;
      for (uint64_t i = 0; i != v6; ++i)
      {
        uint64_t v8 = [(WiFiAnalyticsAWDWiFiSlowWiFiReport *)self linkQualSampleAtIndex:i];
        [v13 addLinkQualSample:v8];
      }
    }
  }
  if ([(WiFiAnalyticsAWDWiFiSlowWiFiReport *)self usbEventsCount])
  {
    [v13 clearUsbEvents];
    unint64_t v9 = [(WiFiAnalyticsAWDWiFiSlowWiFiReport *)self usbEventsCount];
    if (v9)
    {
      unint64_t v10 = v9;
      for (uint64_t j = 0; j != v10; ++j)
      {
        uint64_t v12 = [(WiFiAnalyticsAWDWiFiSlowWiFiReport *)self usbEventAtIndex:j];
        [v13 addUsbEvent:v12];
      }
    }
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v32 = *MEMORY[0x263EF8340];
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  unint64_t v6 = (void *)v5;
  if (*(unsigned char *)&self->_has)
  {
    *(void *)(v5 + 8) = self->_timestamp;
    *(unsigned char *)(v5 + 40) |= 1u;
  }
  id v7 = [(WiFiAnalyticsAWDSlowWiFiNotification *)self->_slowNotice copyWithZone:a3];
  uint64_t v8 = (void *)v6[3];
  v6[3] = v7;

  long long v28 = 0u;
  long long v29 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  unint64_t v9 = self->_linkQualSamples;
  uint64_t v10 = [(NSMutableArray *)v9 countByEnumeratingWithState:&v26 objects:v31 count:16];
  if (v10)
  {
    uint64_t v11 = v10;
    uint64_t v12 = *(void *)v27;
    do
    {
      uint64_t v13 = 0;
      do
      {
        if (*(void *)v27 != v12) {
          objc_enumerationMutation(v9);
        }
        uint64_t v14 = (void *)[*(id *)(*((void *)&v26 + 1) + 8 * v13) copyWithZone:a3];
        [v6 addLinkQualSample:v14];

        ++v13;
      }
      while (v11 != v13);
      uint64_t v11 = [(NSMutableArray *)v9 countByEnumeratingWithState:&v26 objects:v31 count:16];
    }
    while (v11);
  }

  long long v24 = 0u;
  long long v25 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  long long v15 = self->_usbEvents;
  uint64_t v16 = [(NSMutableArray *)v15 countByEnumeratingWithState:&v22 objects:v30 count:16];
  if (v16)
  {
    uint64_t v17 = v16;
    uint64_t v18 = *(void *)v23;
    do
    {
      uint64_t v19 = 0;
      do
      {
        if (*(void *)v23 != v18) {
          objc_enumerationMutation(v15);
        }
        long long v20 = objc_msgSend(*(id *)(*((void *)&v22 + 1) + 8 * v19), "copyWithZone:", a3, (void)v22);
        [v6 addUsbEvent:v20];

        ++v19;
      }
      while (v17 != v19);
      uint64_t v17 = [(NSMutableArray *)v15 countByEnumeratingWithState:&v22 objects:v30 count:16];
    }
    while (v17);
  }

  return v6;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_13;
  }
  if (*(unsigned char *)&self->_has)
  {
    if ((*((unsigned char *)v4 + 40) & 1) == 0 || self->_timestamp != *((void *)v4 + 1)) {
      goto LABEL_13;
    }
  }
  else if (*((unsigned char *)v4 + 40))
  {
LABEL_13:
    char v8 = 0;
    goto LABEL_14;
  }
  slowNotice = self->_slowNotice;
  if ((unint64_t)slowNotice | *((void *)v4 + 3)
    && !-[WiFiAnalyticsAWDSlowWiFiNotification isEqual:](slowNotice, "isEqual:"))
  {
    goto LABEL_13;
  }
  linkQualSamples = self->_linkQualSamples;
  if ((unint64_t)linkQualSamples | *((void *)v4 + 2))
  {
    if (!-[NSMutableArray isEqual:](linkQualSamples, "isEqual:")) {
      goto LABEL_13;
    }
  }
  usbEvents = self->_usbEvents;
  if ((unint64_t)usbEvents | *((void *)v4 + 4)) {
    char v8 = -[NSMutableArray isEqual:](usbEvents, "isEqual:");
  }
  else {
    char v8 = 1;
  }
LABEL_14:

  return v8;
}

- (unint64_t)hash
{
  if (*(unsigned char *)&self->_has) {
    unint64_t v3 = 2654435761u * self->_timestamp;
  }
  else {
    unint64_t v3 = 0;
  }
  unint64_t v4 = [(WiFiAnalyticsAWDSlowWiFiNotification *)self->_slowNotice hash] ^ v3;
  uint64_t v5 = [(NSMutableArray *)self->_linkQualSamples hash];
  return v4 ^ v5 ^ [(NSMutableArray *)self->_usbEvents hash];
}

- (void)mergeFrom:(id)a3
{
  uint64_t v28 = *MEMORY[0x263EF8340];
  unint64_t v4 = a3;
  id v5 = v4;
  if (v4[5])
  {
    self->_timestamp = v4[1];
    *(unsigned char *)&self->_has |= 1u;
  }
  slowNotice = self->_slowNotice;
  uint64_t v7 = *((void *)v5 + 3);
  if (slowNotice)
  {
    if (v7) {
      -[WiFiAnalyticsAWDSlowWiFiNotification mergeFrom:](slowNotice, "mergeFrom:");
    }
  }
  else if (v7)
  {
    -[WiFiAnalyticsAWDWiFiSlowWiFiReport setSlowNotice:](self, "setSlowNotice:");
  }
  long long v24 = 0u;
  long long v25 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  id v8 = *((id *)v5 + 2);
  uint64_t v9 = [v8 countByEnumeratingWithState:&v22 objects:v27 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v23;
    do
    {
      for (uint64_t i = 0; i != v10; ++i)
      {
        if (*(void *)v23 != v11) {
          objc_enumerationMutation(v8);
        }
        [(WiFiAnalyticsAWDWiFiSlowWiFiReport *)self addLinkQualSample:*(void *)(*((void *)&v22 + 1) + 8 * i)];
      }
      uint64_t v10 = [v8 countByEnumeratingWithState:&v22 objects:v27 count:16];
    }
    while (v10);
  }

  long long v20 = 0u;
  long long v21 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  id v13 = *((id *)v5 + 4);
  uint64_t v14 = [v13 countByEnumeratingWithState:&v18 objects:v26 count:16];
  if (v14)
  {
    uint64_t v15 = v14;
    uint64_t v16 = *(void *)v19;
    do
    {
      for (uint64_t j = 0; j != v15; ++j)
      {
        if (*(void *)v19 != v16) {
          objc_enumerationMutation(v13);
        }
        -[WiFiAnalyticsAWDWiFiSlowWiFiReport addUsbEvent:](self, "addUsbEvent:", *(void *)(*((void *)&v18 + 1) + 8 * j), (void)v18);
      }
      uint64_t v15 = [v13 countByEnumeratingWithState:&v18 objects:v26 count:16];
    }
    while (v15);
  }
}

- (unint64_t)timestamp
{
  return self->_timestamp;
}

- (WiFiAnalyticsAWDSlowWiFiNotification)slowNotice
{
  return self->_slowNotice;
}

- (void)setSlowNotice:(id)a3
{
}

- (NSMutableArray)linkQualSamples
{
  return self->_linkQualSamples;
}

- (void)setLinkQualSamples:(id)a3
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
  objc_storeStrong((id *)&self->_slowNotice, 0);
  objc_storeStrong((id *)&self->_linkQualSamples, 0);
}

@end