@interface AWDWiFiSlowWiFiReport
+ (Class)linkQualSampleType;
+ (Class)usbEventType;
- (AWDSlowWiFiNotification)slowNotice;
- (BOOL)hasSlowNotice;
- (BOOL)hasTimestamp;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSMutableArray)linkQualSamples;
- (NSMutableArray)usbEvents;
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
- (void)dealloc;
- (void)mergeFrom:(id)a3;
- (void)setHasTimestamp:(BOOL)a3;
- (void)setLinkQualSamples:(id)a3;
- (void)setSlowNotice:(id)a3;
- (void)setTimestamp:(unint64_t)a3;
- (void)setUsbEvents:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation AWDWiFiSlowWiFiReport

- (void)dealloc
{
  [(AWDWiFiSlowWiFiReport *)self setSlowNotice:0];
  [(AWDWiFiSlowWiFiReport *)self setLinkQualSamples:0];
  [(AWDWiFiSlowWiFiReport *)self setUsbEvents:0];
  v3.receiver = self;
  v3.super_class = (Class)AWDWiFiSlowWiFiReport;
  [(AWDWiFiSlowWiFiReport *)&v3 dealloc];
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

- (BOOL)hasSlowNotice
{
  return self->_slowNotice != 0;
}

- (void)clearLinkQualSamples
{
}

- (void)addLinkQualSample:(id)a3
{
  linkQualSamples = self->_linkQualSamples;
  if (!linkQualSamples)
  {
    linkQualSamples = (NSMutableArray *)objc_alloc_init(MEMORY[0x263EFF980]);
    self->_linkQualSamples = linkQualSamples;
  }

  [(NSMutableArray *)linkQualSamples addObject:a3];
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
  v3.super_class = (Class)AWDWiFiSlowWiFiReport;
  return (id)[NSString stringWithFormat:@"%@ %@", -[AWDWiFiSlowWiFiReport description](&v3, sel_description), -[AWDWiFiSlowWiFiReport dictionaryRepresentation](self, "dictionaryRepresentation")];
}

- (id)dictionaryRepresentation
{
  uint64_t v28 = *MEMORY[0x263EF8340];
  objc_super v3 = (void *)[MEMORY[0x263EFF9A0] dictionary];
  if (*(unsigned char *)&self->_has) {
    [v3 setObject:[NSNumber numberWithUnsignedLongLong:self->_timestamp] forKey:@"timestamp"];
  }
  slowNotice = self->_slowNotice;
  if (slowNotice) {
    [v3 setObject:[[slowNotice dictionaryRepresentation] forKey:@"slowNotice"];
  }
  if ([(NSMutableArray *)self->_linkQualSamples count])
  {
    v5 = [objc_alloc(MEMORY[0x263EFF980]) initWithCapacity:-[NSMutableArray count](self->_linkQualSamples, "count")];
    long long v22 = 0u;
    long long v23 = 0u;
    long long v24 = 0u;
    long long v25 = 0u;
    linkQualSamples = self->_linkQualSamples;
    uint64_t v7 = [(NSMutableArray *)linkQualSamples countByEnumeratingWithState:&v22 objects:v27 count:16];
    if (v7)
    {
      uint64_t v8 = v7;
      uint64_t v9 = *(void *)v23;
      do
      {
        for (uint64_t i = 0; i != v8; ++i)
        {
          if (*(void *)v23 != v9) {
            objc_enumerationMutation(linkQualSamples);
          }
          [v5 addObject:[*(id *)(*((void *)&v22 + 1) + 8 * i) dictionaryRepresentation]];
        }
        uint64_t v8 = [(NSMutableArray *)linkQualSamples countByEnumeratingWithState:&v22 objects:v27 count:16];
      }
      while (v8);
    }
    [v3 setObject:v5 forKey:@"linkQualSample"];
  }
  if ([(NSMutableArray *)self->_usbEvents count])
  {
    v11 = [objc_alloc(MEMORY[0x263EFF980]) initWithCapacity:-[NSMutableArray count](self->_usbEvents, "count")];
    long long v18 = 0u;
    long long v19 = 0u;
    long long v20 = 0u;
    long long v21 = 0u;
    usbEvents = self->_usbEvents;
    uint64_t v13 = [(NSMutableArray *)usbEvents countByEnumeratingWithState:&v18 objects:v26 count:16];
    if (v13)
    {
      uint64_t v14 = v13;
      uint64_t v15 = *(void *)v19;
      do
      {
        for (uint64_t j = 0; j != v14; ++j)
        {
          if (*(void *)v19 != v15) {
            objc_enumerationMutation(usbEvents);
          }
          [v11 addObject:[*(id *)(*((void *)&v18 + 1) + 8 * j) dictionaryRepresentation]];
        }
        uint64_t v14 = [(NSMutableArray *)usbEvents countByEnumeratingWithState:&v18 objects:v26 count:16];
      }
      while (v14);
    }
    [v3 setObject:v11 forKey:@"usbEvent"];
  }
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return AWDWiFiSlowWiFiReportReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  uint64_t v24 = *MEMORY[0x263EF8340];
  if (*(unsigned char *)&self->_has) {
    PBDataWriterWriteUint64Field();
  }
  if (self->_slowNotice) {
    PBDataWriterWriteSubmessage();
  }
  long long v20 = 0u;
  long long v21 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  linkQualSamples = self->_linkQualSamples;
  uint64_t v5 = [(NSMutableArray *)linkQualSamples countByEnumeratingWithState:&v18 objects:v23 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v19;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v19 != v7) {
          objc_enumerationMutation(linkQualSamples);
        }
        PBDataWriterWriteSubmessage();
      }
      uint64_t v6 = [(NSMutableArray *)linkQualSamples countByEnumeratingWithState:&v18 objects:v23 count:16];
    }
    while (v6);
  }
  long long v16 = 0u;
  long long v17 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  usbEvents = self->_usbEvents;
  uint64_t v10 = [(NSMutableArray *)usbEvents countByEnumeratingWithState:&v14 objects:v22 count:16];
  if (v10)
  {
    uint64_t v11 = v10;
    uint64_t v12 = *(void *)v15;
    do
    {
      for (uint64_t j = 0; j != v11; ++j)
      {
        if (*(void *)v15 != v12) {
          objc_enumerationMutation(usbEvents);
        }
        PBDataWriterWriteSubmessage();
      }
      uint64_t v11 = [(NSMutableArray *)usbEvents countByEnumeratingWithState:&v14 objects:v22 count:16];
    }
    while (v11);
  }
}

- (void)copyTo:(id)a3
{
  if (*(unsigned char *)&self->_has)
  {
    *((void *)a3 + 1) = self->_timestamp;
    *((unsigned char *)a3 + 40) |= 1u;
  }
  if (self->_slowNotice) {
    [a3 setSlowNotice:];
  }
  if ([(AWDWiFiSlowWiFiReport *)self linkQualSamplesCount])
  {
    [a3 clearLinkQualSamples];
    unint64_t v5 = [(AWDWiFiSlowWiFiReport *)self linkQualSamplesCount];
    if (v5)
    {
      unint64_t v6 = v5;
      for (uint64_t i = 0; i != v6; ++i)
        [a3 addLinkQualSample:-[AWDWiFiSlowWiFiReport linkQualSampleAtIndex:](self, "linkQualSampleAtIndex:", i)];
    }
  }
  if ([(AWDWiFiSlowWiFiReport *)self usbEventsCount])
  {
    [a3 clearUsbEvents];
    unint64_t v8 = [(AWDWiFiSlowWiFiReport *)self usbEventsCount];
    if (v8)
    {
      unint64_t v9 = v8;
      for (uint64_t j = 0; j != v9; ++j)
        [a3 addUsbEvent:-[AWDWiFiSlowWiFiReport usbEventAtIndex:](self, "usbEventAtIndex:", j)];
    }
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v30 = *MEMORY[0x263EF8340];
  uint64_t v5 = [(id)[(id)objc_opt_class() allocWithZone:a3] init];
  unint64_t v6 = (void *)v5;
  if (*(unsigned char *)&self->_has)
  {
    *(void *)(v5 + 8) = self->_timestamp;
    *(unsigned char *)(v5 + 40) |= 1u;
  }

  v6[3] = [(AWDSlowWiFiNotification *)self->_slowNotice copyWithZone:a3];
  long long v24 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  linkQualSamples = self->_linkQualSamples;
  uint64_t v8 = [(NSMutableArray *)linkQualSamples countByEnumeratingWithState:&v24 objects:v29 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v25;
    do
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v25 != v10) {
          objc_enumerationMutation(linkQualSamples);
        }
        uint64_t v12 = (void *)[*(id *)(*((void *)&v24 + 1) + 8 * i) copyWithZone:a3];
        [v6 addLinkQualSample:v12];
      }
      uint64_t v9 = [(NSMutableArray *)linkQualSamples countByEnumeratingWithState:&v24 objects:v29 count:16];
    }
    while (v9);
  }
  long long v22 = 0u;
  long long v23 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  usbEvents = self->_usbEvents;
  uint64_t v14 = [(NSMutableArray *)usbEvents countByEnumeratingWithState:&v20 objects:v28 count:16];
  if (v14)
  {
    uint64_t v15 = v14;
    uint64_t v16 = *(void *)v21;
    do
    {
      for (uint64_t j = 0; j != v15; ++j)
      {
        if (*(void *)v21 != v16) {
          objc_enumerationMutation(usbEvents);
        }
        long long v18 = (void *)[*(id *)(*((void *)&v20 + 1) + 8 * j) copyWithZone:a3];
        [v6 addUsbEvent:v18];
      }
      uint64_t v15 = [(NSMutableArray *)usbEvents countByEnumeratingWithState:&v20 objects:v28 count:16];
    }
    while (v15);
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
      if ((*((unsigned char *)a3 + 40) & 1) == 0 || self->_timestamp != *((void *)a3 + 1)) {
        goto LABEL_13;
      }
    }
    else if (*((unsigned char *)a3 + 40))
    {
LABEL_13:
      LOBYTE(v5) = 0;
      return v5;
    }
    slowNotice = self->_slowNotice;
    if (!((unint64_t)slowNotice | *((void *)a3 + 3))
      || (int v5 = -[AWDSlowWiFiNotification isEqual:](slowNotice, "isEqual:")) != 0)
    {
      linkQualSamples = self->_linkQualSamples;
      if (!((unint64_t)linkQualSamples | *((void *)a3 + 2))
        || (int v5 = -[NSMutableArray isEqual:](linkQualSamples, "isEqual:")) != 0)
      {
        usbEvents = self->_usbEvents;
        if ((unint64_t)usbEvents | *((void *)a3 + 4))
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
  unint64_t v4 = [(AWDSlowWiFiNotification *)self->_slowNotice hash] ^ v3;
  uint64_t v5 = [(NSMutableArray *)self->_linkQualSamples hash];
  return v4 ^ v5 ^ [(NSMutableArray *)self->_usbEvents hash];
}

- (void)mergeFrom:(id)a3
{
  uint64_t v27 = *MEMORY[0x263EF8340];
  if (*((unsigned char *)a3 + 40))
  {
    self->_timestamp = *((void *)a3 + 1);
    *(unsigned char *)&self->_has |= 1u;
  }
  slowNotice = self->_slowNotice;
  uint64_t v6 = *((void *)a3 + 3);
  if (slowNotice)
  {
    if (v6) {
      -[AWDSlowWiFiNotification mergeFrom:](slowNotice, "mergeFrom:");
    }
  }
  else if (v6)
  {
    -[AWDWiFiSlowWiFiReport setSlowNotice:](self, "setSlowNotice:");
  }
  long long v23 = 0u;
  long long v24 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  uint64_t v7 = (void *)*((void *)a3 + 2);
  uint64_t v8 = [v7 countByEnumeratingWithState:&v21 objects:v26 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v22;
    do
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v22 != v10) {
          objc_enumerationMutation(v7);
        }
        [(AWDWiFiSlowWiFiReport *)self addLinkQualSample:*(void *)(*((void *)&v21 + 1) + 8 * i)];
      }
      uint64_t v9 = [v7 countByEnumeratingWithState:&v21 objects:v26 count:16];
    }
    while (v9);
  }
  long long v19 = 0u;
  long long v20 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  uint64_t v12 = (void *)*((void *)a3 + 4);
  uint64_t v13 = [v12 countByEnumeratingWithState:&v17 objects:v25 count:16];
  if (v13)
  {
    uint64_t v14 = v13;
    uint64_t v15 = *(void *)v18;
    do
    {
      for (uint64_t j = 0; j != v14; ++j)
      {
        if (*(void *)v18 != v15) {
          objc_enumerationMutation(v12);
        }
        [(AWDWiFiSlowWiFiReport *)self addUsbEvent:*(void *)(*((void *)&v17 + 1) + 8 * j)];
      }
      uint64_t v14 = [v12 countByEnumeratingWithState:&v17 objects:v25 count:16];
    }
    while (v14);
  }
}

- (unint64_t)timestamp
{
  return self->_timestamp;
}

- (AWDSlowWiFiNotification)slowNotice
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

@end