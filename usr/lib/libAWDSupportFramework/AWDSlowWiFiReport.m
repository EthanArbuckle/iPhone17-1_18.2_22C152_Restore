@interface AWDSlowWiFiReport
+ (Class)linkQualSampleType;
- (AWDSlowWiFiNotification)slowNotice;
- (BOOL)hasSlowNotice;
- (BOOL)hasTimestamp;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSMutableArray)linkQualSamples;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)linkQualSampleAtIndex:(unint64_t)a3;
- (unint64_t)hash;
- (unint64_t)linkQualSamplesCount;
- (unint64_t)timestamp;
- (void)addLinkQualSample:(id)a3;
- (void)clearLinkQualSamples;
- (void)copyTo:(id)a3;
- (void)dealloc;
- (void)mergeFrom:(id)a3;
- (void)setHasTimestamp:(BOOL)a3;
- (void)setLinkQualSamples:(id)a3;
- (void)setSlowNotice:(id)a3;
- (void)setTimestamp:(unint64_t)a3;
- (void)writeTo:(id)a3;
@end

@implementation AWDSlowWiFiReport

- (void)dealloc
{
  [(AWDSlowWiFiReport *)self setSlowNotice:0];
  [(AWDSlowWiFiReport *)self setLinkQualSamples:0];
  v3.receiver = self;
  v3.super_class = (Class)AWDSlowWiFiReport;
  [(AWDSlowWiFiReport *)&v3 dealloc];
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

- (id)description
{
  v3.receiver = self;
  v3.super_class = (Class)AWDSlowWiFiReport;
  return (id)[NSString stringWithFormat:@"%@ %@", -[AWDSlowWiFiReport description](&v3, sel_description), -[AWDSlowWiFiReport dictionaryRepresentation](self, "dictionaryRepresentation")];
}

- (id)dictionaryRepresentation
{
  uint64_t v17 = *MEMORY[0x263EF8340];
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
    long long v12 = 0u;
    long long v13 = 0u;
    long long v14 = 0u;
    long long v15 = 0u;
    linkQualSamples = self->_linkQualSamples;
    uint64_t v7 = [(NSMutableArray *)linkQualSamples countByEnumeratingWithState:&v12 objects:v16 count:16];
    if (v7)
    {
      uint64_t v8 = v7;
      uint64_t v9 = *(void *)v13;
      do
      {
        for (uint64_t i = 0; i != v8; ++i)
        {
          if (*(void *)v13 != v9) {
            objc_enumerationMutation(linkQualSamples);
          }
          [v5 addObject:[(*(id *)(*((void *)&v12 + 1) + 8 * i)) dictionaryRepresentation]];
        }
        uint64_t v8 = [(NSMutableArray *)linkQualSamples countByEnumeratingWithState:&v12 objects:v16 count:16];
      }
      while (v8);
    }
    [v3 setObject:v5 forKey:@"linkQualSample"];
  }
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return AWDSlowWiFiReportReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  if (*(unsigned char *)&self->_has) {
    PBDataWriterWriteUint64Field();
  }
  if (self->_slowNotice) {
    PBDataWriterWriteSubmessage();
  }
  long long v11 = 0u;
  long long v12 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  linkQualSamples = self->_linkQualSamples;
  uint64_t v5 = [(NSMutableArray *)linkQualSamples countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v10;
    do
    {
      uint64_t v8 = 0;
      do
      {
        if (*(void *)v10 != v7) {
          objc_enumerationMutation(linkQualSamples);
        }
        PBDataWriterWriteSubmessage();
        ++v8;
      }
      while (v6 != v8);
      uint64_t v6 = [(NSMutableArray *)linkQualSamples countByEnumeratingWithState:&v9 objects:v13 count:16];
    }
    while (v6);
  }
}

- (void)copyTo:(id)a3
{
  if (*(unsigned char *)&self->_has)
  {
    *((void *)a3 + 1) = self->_timestamp;
    *((unsigned char *)a3 + 32) |= 1u;
  }
  if (self->_slowNotice) {
    [a3 setSlowNotice:];
  }
  if ([(AWDSlowWiFiReport *)self linkQualSamplesCount])
  {
    [a3 clearLinkQualSamples];
    unint64_t v5 = [(AWDSlowWiFiReport *)self linkQualSamplesCount];
    if (v5)
    {
      unint64_t v6 = v5;
      for (uint64_t i = 0; i != v6; ++i)
        [a3 addLinkQualSample:-[AWDSlowWiFiReport linkQualSampleAtIndex:](self, "linkQualSampleAtIndex:", i)];
    }
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  uint64_t v5 = [objc_opt_class() allocWithZone:a3];
  unint64_t v6 = (void *)v5;
  if (*(unsigned char *)&self->_has)
  {
    *(void *)(v5 + 8) = self->_timestamp;
    *(unsigned char *)(v5 + 32) |= 1u;
  }

  v6[3] = [(AWDSlowWiFiNotification *)self->_slowNotice copyWithZone:a3];
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  linkQualSamples = self->_linkQualSamples;
  uint64_t v8 = [(NSMutableArray *)linkQualSamples countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v15;
    do
    {
      uint64_t v11 = 0;
      do
      {
        if (*(void *)v15 != v10) {
          objc_enumerationMutation(linkQualSamples);
        }
        long long v12 = (void *)[*(id *)(*((void *)&v14 + 1) + 8 * v11) copyWithZone:a3];
        [v6 addLinkQualSample:v12];

        ++v11;
      }
      while (v9 != v11);
      uint64_t v9 = [(NSMutableArray *)linkQualSamples countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v9);
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
      if ((*((unsigned char *)a3 + 32) & 1) == 0 || self->_timestamp != *((void *)a3 + 1)) {
        goto LABEL_11;
      }
    }
    else if (*((unsigned char *)a3 + 32))
    {
LABEL_11:
      LOBYTE(v5) = 0;
      return v5;
    }
    slowNotice = self->_slowNotice;
    if (!((unint64_t)slowNotice | *((void *)a3 + 3))
      || (int v5 = -[AWDSlowWiFiNotification isEqual:](slowNotice, "isEqual:")) != 0)
    {
      linkQualSamples = self->_linkQualSamples;
      if ((unint64_t)linkQualSamples | *((void *)a3 + 2))
      {
        LOBYTE(v5) = -[NSMutableArray isEqual:](linkQualSamples, "isEqual:");
      }
      else
      {
        LOBYTE(v5) = 1;
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
  return v4 ^ [(NSMutableArray *)self->_linkQualSamples hash];
}

- (void)mergeFrom:(id)a3
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  if (*((unsigned char *)a3 + 32))
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
    -[AWDSlowWiFiReport setSlowNotice:](self, "setSlowNotice:");
  }
  long long v14 = 0u;
  long long v15 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  uint64_t v7 = (void *)*((void *)a3 + 2);
  uint64_t v8 = [v7 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v13;
    do
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v13 != v10) {
          objc_enumerationMutation(v7);
        }
        [(AWDSlowWiFiReport *)self addLinkQualSample:*(void *)(*((void *)&v12 + 1) + 8 * i)];
      }
      uint64_t v9 = [v7 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v9);
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

@end