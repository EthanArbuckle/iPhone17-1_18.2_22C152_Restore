@interface NSPPrivacyProxyProxiedContentMap
+ (Class)hostnamesType;
+ (Class)processesType;
+ (Class)urlsType;
- (BOOL)enabled;
- (BOOL)hasIsPrivacyProxy;
- (BOOL)hasMatchExactHostnames;
- (BOOL)hasPercentEnabled;
- (BOOL)hasResolver;
- (BOOL)hasSupportsReverseProxying;
- (BOOL)hasSystemProcessOnly;
- (BOOL)isEqual:(id)a3;
- (BOOL)isPrivacyProxy;
- (BOOL)matchExactHostnames;
- (BOOL)readFrom:(id)a3;
- (BOOL)supportsReverseProxying;
- (BOOL)systemProcessOnly;
- (NSMutableArray)hostnames;
- (NSMutableArray)processes;
- (NSMutableArray)urls;
- (NSString)identifier;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)hostnamesAtIndex:(unint64_t)a3;
- (id)processesAtIndex:(unint64_t)a3;
- (id)urlsAtIndex:(unint64_t)a3;
- (unint64_t)hash;
- (unint64_t)hostnamesCount;
- (unint64_t)processesCount;
- (unint64_t)proxiesCount;
- (unint64_t)urlsCount;
- (unsigned)percentEnabled;
- (unsigned)proxies;
- (unsigned)proxiesAtIndex:(unint64_t)a3;
- (unsigned)resolver;
- (void)addHostnames:(id)a3;
- (void)addProcesses:(id)a3;
- (void)addProxies:(unsigned int)a3;
- (void)addUrls:(id)a3;
- (void)clearHostnames;
- (void)clearProcesses;
- (void)clearProxies;
- (void)clearUrls;
- (void)copyTo:(id)a3;
- (void)dealloc;
- (void)mergeFrom:(id)a3;
- (void)setEnabled:(BOOL)a3;
- (void)setHasIsPrivacyProxy:(BOOL)a3;
- (void)setHasMatchExactHostnames:(BOOL)a3;
- (void)setHasPercentEnabled:(BOOL)a3;
- (void)setHasResolver:(BOOL)a3;
- (void)setHasSupportsReverseProxying:(BOOL)a3;
- (void)setHasSystemProcessOnly:(BOOL)a3;
- (void)setHostnames:(id)a3;
- (void)setIdentifier:(id)a3;
- (void)setIsPrivacyProxy:(BOOL)a3;
- (void)setMatchExactHostnames:(BOOL)a3;
- (void)setPercentEnabled:(unsigned int)a3;
- (void)setProcesses:(id)a3;
- (void)setProxies:(unsigned int *)a3 count:(unint64_t)a4;
- (void)setResolver:(unsigned int)a3;
- (void)setSupportsReverseProxying:(BOOL)a3;
- (void)setSystemProcessOnly:(BOOL)a3;
- (void)setUrls:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation NSPPrivacyProxyProxiedContentMap

- (void)dealloc
{
  PBRepeatedUInt32Clear();
  v3.receiver = self;
  v3.super_class = (Class)NSPPrivacyProxyProxiedContentMap;
  [(NSPPrivacyProxyProxiedContentMap *)&v3 dealloc];
}

- (unint64_t)proxiesCount
{
  return self->_proxies.count;
}

- (unsigned)proxies
{
  return self->_proxies.list;
}

- (void)clearProxies
{
}

- (void)addProxies:(unsigned int)a3
{
}

- (unsigned)proxiesAtIndex:(unint64_t)a3
{
  p_proxies = &self->_proxies;
  unint64_t count = self->_proxies.count;
  if (count <= a3)
  {
    v6 = (void *)MEMORY[0x1E4F1CA00];
    uint64_t v7 = *MEMORY[0x1E4F1C4A8];
    v8 = objc_msgSend(NSString, "stringWithFormat:", @"idx (%lu) is out of range (%lu)", a3, count);
    v9 = [v6 exceptionWithName:v7 reason:v8 userInfo:0];
    [v9 raise];
  }
  return p_proxies->list[a3];
}

- (void)setProxies:(unsigned int *)a3 count:(unint64_t)a4
{
}

- (void)clearHostnames
{
}

- (void)addHostnames:(id)a3
{
  id v4 = a3;
  hostnames = self->_hostnames;
  id v8 = v4;
  if (!hostnames)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    uint64_t v7 = self->_hostnames;
    self->_hostnames = v6;

    id v4 = v8;
    hostnames = self->_hostnames;
  }
  [(NSMutableArray *)hostnames addObject:v4];
}

- (unint64_t)hostnamesCount
{
  return [(NSMutableArray *)self->_hostnames count];
}

- (id)hostnamesAtIndex:(unint64_t)a3
{
  return (id)[(NSMutableArray *)self->_hostnames objectAtIndex:a3];
}

+ (Class)hostnamesType
{
  return (Class)objc_opt_class();
}

- (void)clearProcesses
{
}

- (void)addProcesses:(id)a3
{
  id v4 = a3;
  processes = self->_processes;
  id v8 = v4;
  if (!processes)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    uint64_t v7 = self->_processes;
    self->_processes = v6;

    id v4 = v8;
    processes = self->_processes;
  }
  [(NSMutableArray *)processes addObject:v4];
}

- (unint64_t)processesCount
{
  return [(NSMutableArray *)self->_processes count];
}

- (id)processesAtIndex:(unint64_t)a3
{
  return (id)[(NSMutableArray *)self->_processes objectAtIndex:a3];
}

+ (Class)processesType
{
  return (Class)objc_opt_class();
}

- (void)setSystemProcessOnly:(BOOL)a3
{
  *(unsigned char *)&self->_has |= 0x20u;
  self->_systemProcessOnly = a3;
}

- (void)setHasSystemProcessOnly:(BOOL)a3
{
  if (a3) {
    char v3 = 32;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xDF | v3;
}

- (BOOL)hasSystemProcessOnly
{
  return (*(unsigned char *)&self->_has >> 5) & 1;
}

- (void)setPercentEnabled:(unsigned int)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_percentEnabled = a3;
}

- (void)setHasPercentEnabled:(BOOL)a3
{
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasPercentEnabled
{
  return *(unsigned char *)&self->_has & 1;
}

- (void)setSupportsReverseProxying:(BOOL)a3
{
  *(unsigned char *)&self->_has |= 0x10u;
  self->_supportsReverseProxying = a3;
}

- (void)setHasSupportsReverseProxying:(BOOL)a3
{
  if (a3) {
    char v3 = 16;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xEF | v3;
}

- (BOOL)hasSupportsReverseProxying
{
  return (*(unsigned char *)&self->_has >> 4) & 1;
}

- (void)clearUrls
{
}

- (void)addUrls:(id)a3
{
  id v4 = a3;
  urls = self->_urls;
  id v8 = v4;
  if (!urls)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    uint64_t v7 = self->_urls;
    self->_urls = v6;

    id v4 = v8;
    urls = self->_urls;
  }
  [(NSMutableArray *)urls addObject:v4];
}

- (unint64_t)urlsCount
{
  return [(NSMutableArray *)self->_urls count];
}

- (id)urlsAtIndex:(unint64_t)a3
{
  return (id)[(NSMutableArray *)self->_urls objectAtIndex:a3];
}

+ (Class)urlsType
{
  return (Class)objc_opt_class();
}

- (void)setResolver:(unsigned int)a3
{
  *(unsigned char *)&self->_has |= 2u;
  self->_resolver = a3;
}

- (void)setHasResolver:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFD | v3;
}

- (BOOL)hasResolver
{
  return (*(unsigned char *)&self->_has >> 1) & 1;
}

- (void)setMatchExactHostnames:(BOOL)a3
{
  *(unsigned char *)&self->_has |= 8u;
  self->_matchExactHostnames = a3;
}

- (void)setHasMatchExactHostnames:(BOOL)a3
{
  if (a3) {
    char v3 = 8;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xF7 | v3;
}

- (BOOL)hasMatchExactHostnames
{
  return (*(unsigned char *)&self->_has >> 3) & 1;
}

- (void)setIsPrivacyProxy:(BOOL)a3
{
  *(unsigned char *)&self->_has |= 4u;
  self->_isPrivacyProxy = a3;
}

- (void)setHasIsPrivacyProxy:(BOOL)a3
{
  if (a3) {
    char v3 = 4;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFB | v3;
}

- (BOOL)hasIsPrivacyProxy
{
  return (*(unsigned char *)&self->_has >> 2) & 1;
}

- (id)description
{
  char v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)NSPPrivacyProxyProxiedContentMap;
  id v4 = [(NSPPrivacyProxyProxiedContentMap *)&v8 description];
  v5 = [(NSPPrivacyProxyProxiedContentMap *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  char v3 = [MEMORY[0x1E4F1CA60] dictionary];
  id v4 = [NSNumber numberWithBool:self->_enabled];
  [v3 setObject:v4 forKey:@"enabled"];

  identifier = self->_identifier;
  if (identifier) {
    [v3 setObject:identifier forKey:@"identifier"];
  }
  v6 = PBRepeatedUInt32NSArray();
  [v3 setObject:v6 forKey:@"proxies"];

  hostnames = self->_hostnames;
  if (hostnames) {
    [v3 setObject:hostnames forKey:@"hostnames"];
  }
  processes = self->_processes;
  if (processes) {
    [v3 setObject:processes forKey:@"processes"];
  }
  char has = (char)self->_has;
  if ((has & 0x20) != 0)
  {
    v15 = [NSNumber numberWithBool:self->_systemProcessOnly];
    [v3 setObject:v15 forKey:@"systemProcessOnly"];

    char has = (char)self->_has;
    if ((has & 1) == 0)
    {
LABEL_9:
      if ((has & 0x10) == 0) {
        goto LABEL_11;
      }
      goto LABEL_10;
    }
  }
  else if ((*(unsigned char *)&self->_has & 1) == 0)
  {
    goto LABEL_9;
  }
  v16 = [NSNumber numberWithUnsignedInt:self->_percentEnabled];
  [v3 setObject:v16 forKey:@"percentEnabled"];

  if ((*(unsigned char *)&self->_has & 0x10) != 0)
  {
LABEL_10:
    v10 = [NSNumber numberWithBool:self->_supportsReverseProxying];
    [v3 setObject:v10 forKey:@"supportsReverseProxying"];
  }
LABEL_11:
  urls = self->_urls;
  if (urls) {
    [v3 setObject:urls forKey:@"urls"];
  }
  char v12 = (char)self->_has;
  if ((v12 & 2) != 0)
  {
    v17 = [NSNumber numberWithUnsignedInt:self->_resolver];
    [v3 setObject:v17 forKey:@"resolver"];

    char v12 = (char)self->_has;
    if ((v12 & 8) == 0)
    {
LABEL_15:
      if ((v12 & 4) == 0) {
        goto LABEL_17;
      }
      goto LABEL_16;
    }
  }
  else if ((*(unsigned char *)&self->_has & 8) == 0)
  {
    goto LABEL_15;
  }
  v18 = [NSNumber numberWithBool:self->_matchExactHostnames];
  [v3 setObject:v18 forKey:@"matchExactHostnames"];

  if ((*(unsigned char *)&self->_has & 4) != 0)
  {
LABEL_16:
    v13 = [NSNumber numberWithBool:self->_isPrivacyProxy];
    [v3 setObject:v13 forKey:@"isPrivacyProxy"];
  }
LABEL_17:
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return NSPPrivacyProxyProxiedContentMapReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  uint64_t v38 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  PBDataWriterWriteBOOLField();
  if (!self->_identifier) {
    __assert_rtn("-[NSPPrivacyProxyProxiedContentMap writeTo:]", "NSPPrivacyProxyProxiedContentMap.m", 423, "nil != self->_identifier");
  }
  PBDataWriterWriteStringField();
  if (self->_proxies.count)
  {
    unint64_t v5 = 0;
    do
    {
      PBDataWriterWriteUint32Field();
      ++v5;
    }
    while (v5 < self->_proxies.count);
  }
  long long v33 = 0u;
  long long v34 = 0u;
  long long v31 = 0u;
  long long v32 = 0u;
  v6 = self->_hostnames;
  uint64_t v7 = [(NSMutableArray *)v6 countByEnumeratingWithState:&v31 objects:v37 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v32;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v32 != v9) {
          objc_enumerationMutation(v6);
        }
        PBDataWriterWriteStringField();
      }
      uint64_t v8 = [(NSMutableArray *)v6 countByEnumeratingWithState:&v31 objects:v37 count:16];
    }
    while (v8);
  }

  long long v29 = 0u;
  long long v30 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  v11 = self->_processes;
  uint64_t v12 = [(NSMutableArray *)v11 countByEnumeratingWithState:&v27 objects:v36 count:16];
  if (v12)
  {
    uint64_t v13 = v12;
    uint64_t v14 = *(void *)v28;
    do
    {
      for (uint64_t j = 0; j != v13; ++j)
      {
        if (*(void *)v28 != v14) {
          objc_enumerationMutation(v11);
        }
        PBDataWriterWriteStringField();
      }
      uint64_t v13 = [(NSMutableArray *)v11 countByEnumeratingWithState:&v27 objects:v36 count:16];
    }
    while (v13);
  }

  char has = (char)self->_has;
  if ((has & 0x20) != 0)
  {
    PBDataWriterWriteBOOLField();
    char has = (char)self->_has;
    if ((has & 1) == 0)
    {
LABEL_21:
      if ((has & 0x10) == 0) {
        goto LABEL_23;
      }
      goto LABEL_22;
    }
  }
  else if ((*(unsigned char *)&self->_has & 1) == 0)
  {
    goto LABEL_21;
  }
  PBDataWriterWriteUint32Field();
  if ((*(unsigned char *)&self->_has & 0x10) != 0) {
LABEL_22:
  }
    PBDataWriterWriteBOOLField();
LABEL_23:
  long long v25 = 0u;
  long long v26 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  v17 = self->_urls;
  uint64_t v18 = [(NSMutableArray *)v17 countByEnumeratingWithState:&v23 objects:v35 count:16];
  if (v18)
  {
    uint64_t v19 = v18;
    uint64_t v20 = *(void *)v24;
    do
    {
      for (uint64_t k = 0; k != v19; ++k)
      {
        if (*(void *)v24 != v20) {
          objc_enumerationMutation(v17);
        }
        PBDataWriterWriteStringField();
      }
      uint64_t v19 = [(NSMutableArray *)v17 countByEnumeratingWithState:&v23 objects:v35 count:16];
    }
    while (v19);
  }

  char v22 = (char)self->_has;
  if ((v22 & 2) == 0)
  {
    if ((*(unsigned char *)&self->_has & 8) == 0) {
      goto LABEL_32;
    }
LABEL_39:
    PBDataWriterWriteBOOLField();
    if ((*(unsigned char *)&self->_has & 4) == 0) {
      goto LABEL_34;
    }
    goto LABEL_33;
  }
  PBDataWriterWriteUint32Field();
  char v22 = (char)self->_has;
  if ((v22 & 8) != 0) {
    goto LABEL_39;
  }
LABEL_32:
  if ((v22 & 4) != 0) {
LABEL_33:
  }
    PBDataWriterWriteBOOLField();
LABEL_34:
}

- (void)copyTo:(id)a3
{
  id v4 = a3;
  v4[80] = self->_enabled;
  id v22 = v4;
  [v4 setIdentifier:self->_identifier];
  if ([(NSPPrivacyProxyProxiedContentMap *)self proxiesCount])
  {
    [v22 clearProxies];
    unint64_t v5 = [(NSPPrivacyProxyProxiedContentMap *)self proxiesCount];
    if (v5)
    {
      unint64_t v6 = v5;
      for (uint64_t i = 0; i != v6; ++i)
        objc_msgSend(v22, "addProxies:", -[NSPPrivacyProxyProxiedContentMap proxiesAtIndex:](self, "proxiesAtIndex:", i));
    }
  }
  if ([(NSPPrivacyProxyProxiedContentMap *)self hostnamesCount])
  {
    [v22 clearHostnames];
    unint64_t v8 = [(NSPPrivacyProxyProxiedContentMap *)self hostnamesCount];
    if (v8)
    {
      unint64_t v9 = v8;
      for (uint64_t j = 0; j != v9; ++j)
      {
        v11 = [(NSPPrivacyProxyProxiedContentMap *)self hostnamesAtIndex:j];
        [v22 addHostnames:v11];
      }
    }
  }
  if ([(NSPPrivacyProxyProxiedContentMap *)self processesCount])
  {
    [v22 clearProcesses];
    unint64_t v12 = [(NSPPrivacyProxyProxiedContentMap *)self processesCount];
    if (v12)
    {
      unint64_t v13 = v12;
      for (uint64_t k = 0; k != v13; ++k)
      {
        v15 = [(NSPPrivacyProxyProxiedContentMap *)self processesAtIndex:k];
        [v22 addProcesses:v15];
      }
    }
  }
  char has = (char)self->_has;
  if ((has & 0x20) == 0)
  {
    if ((*(unsigned char *)&self->_has & 1) == 0) {
      goto LABEL_15;
    }
LABEL_29:
    *((_DWORD *)v22 + 12) = self->_percentEnabled;
    *((unsigned char *)v22 + 88) |= 1u;
    if ((*(unsigned char *)&self->_has & 0x10) == 0) {
      goto LABEL_17;
    }
    goto LABEL_16;
  }
  *((unsigned char *)v22 + 84) = self->_systemProcessOnly;
  *((unsigned char *)v22 + 88) |= 0x20u;
  char has = (char)self->_has;
  if (has) {
    goto LABEL_29;
  }
LABEL_15:
  if ((has & 0x10) != 0)
  {
LABEL_16:
    *((unsigned char *)v22 + 83) = self->_supportsReverseProxying;
    *((unsigned char *)v22 + 88) |= 0x10u;
  }
LABEL_17:
  if ([(NSPPrivacyProxyProxiedContentMap *)self urlsCount])
  {
    [v22 clearUrls];
    unint64_t v17 = [(NSPPrivacyProxyProxiedContentMap *)self urlsCount];
    if (v17)
    {
      unint64_t v18 = v17;
      for (uint64_t m = 0; m != v18; ++m)
      {
        uint64_t v20 = [(NSPPrivacyProxyProxiedContentMap *)self urlsAtIndex:m];
        [v22 addUrls:v20];
      }
    }
  }
  char v21 = (char)self->_has;
  if ((v21 & 2) != 0)
  {
    *((_DWORD *)v22 + 16) = self->_resolver;
    *((unsigned char *)v22 + 88) |= 2u;
    char v21 = (char)self->_has;
    if ((v21 & 8) == 0)
    {
LABEL_23:
      if ((v21 & 4) == 0) {
        goto LABEL_25;
      }
      goto LABEL_24;
    }
  }
  else if ((*(unsigned char *)&self->_has & 8) == 0)
  {
    goto LABEL_23;
  }
  *((unsigned char *)v22 + 82) = self->_matchExactHostnames;
  *((unsigned char *)v22 + 88) |= 8u;
  if ((*(unsigned char *)&self->_has & 4) != 0)
  {
LABEL_24:
    *((unsigned char *)v22 + 81) = self->_isPrivacyProxy;
    *((unsigned char *)v22 + 88) |= 4u;
  }
LABEL_25:
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v44 = *MEMORY[0x1E4F143B8];
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  *(unsigned char *)(v5 + 80) = self->_enabled;
  uint64_t v6 = [(NSString *)self->_identifier copyWithZone:a3];
  uint64_t v7 = *(void **)(v5 + 40);
  *(void *)(v5 + 40) = v6;

  PBRepeatedUInt32Copy();
  long long v39 = 0u;
  long long v40 = 0u;
  long long v37 = 0u;
  long long v38 = 0u;
  unint64_t v8 = self->_hostnames;
  uint64_t v9 = [(NSMutableArray *)v8 countByEnumeratingWithState:&v37 objects:v43 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v38;
    do
    {
      for (uint64_t i = 0; i != v10; ++i)
      {
        if (*(void *)v38 != v11) {
          objc_enumerationMutation(v8);
        }
        unint64_t v13 = (void *)[*(id *)(*((void *)&v37 + 1) + 8 * i) copyWithZone:a3];
        [(id)v5 addHostnames:v13];
      }
      uint64_t v10 = [(NSMutableArray *)v8 countByEnumeratingWithState:&v37 objects:v43 count:16];
    }
    while (v10);
  }

  long long v35 = 0u;
  long long v36 = 0u;
  long long v33 = 0u;
  long long v34 = 0u;
  uint64_t v14 = self->_processes;
  uint64_t v15 = [(NSMutableArray *)v14 countByEnumeratingWithState:&v33 objects:v42 count:16];
  if (v15)
  {
    uint64_t v16 = v15;
    uint64_t v17 = *(void *)v34;
    do
    {
      for (uint64_t j = 0; j != v16; ++j)
      {
        if (*(void *)v34 != v17) {
          objc_enumerationMutation(v14);
        }
        uint64_t v19 = (void *)[*(id *)(*((void *)&v33 + 1) + 8 * j) copyWithZone:a3];
        [(id)v5 addProcesses:v19];
      }
      uint64_t v16 = [(NSMutableArray *)v14 countByEnumeratingWithState:&v33 objects:v42 count:16];
    }
    while (v16);
  }

  char has = (char)self->_has;
  if ((has & 0x20) != 0)
  {
    *(unsigned char *)(v5 + 84) = self->_systemProcessOnly;
    *(unsigned char *)(v5 + 88) |= 0x20u;
    char has = (char)self->_has;
    if ((has & 1) == 0)
    {
LABEL_17:
      if ((has & 0x10) == 0) {
        goto LABEL_19;
      }
      goto LABEL_18;
    }
  }
  else if ((*(unsigned char *)&self->_has & 1) == 0)
  {
    goto LABEL_17;
  }
  *(_DWORD *)(v5 + 48) = self->_percentEnabled;
  *(unsigned char *)(v5 + 88) |= 1u;
  if ((*(unsigned char *)&self->_has & 0x10) != 0)
  {
LABEL_18:
    *(unsigned char *)(v5 + 83) = self->_supportsReverseProxying;
    *(unsigned char *)(v5 + 88) |= 0x10u;
  }
LABEL_19:
  long long v31 = 0u;
  long long v32 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  char v21 = self->_urls;
  uint64_t v22 = [(NSMutableArray *)v21 countByEnumeratingWithState:&v29 objects:v41 count:16];
  if (v22)
  {
    uint64_t v23 = v22;
    uint64_t v24 = *(void *)v30;
    do
    {
      for (uint64_t k = 0; k != v23; ++k)
      {
        if (*(void *)v30 != v24) {
          objc_enumerationMutation(v21);
        }
        long long v26 = objc_msgSend(*(id *)(*((void *)&v29 + 1) + 8 * k), "copyWithZone:", a3, (void)v29);
        [(id)v5 addUrls:v26];
      }
      uint64_t v23 = [(NSMutableArray *)v21 countByEnumeratingWithState:&v29 objects:v41 count:16];
    }
    while (v23);
  }

  char v27 = (char)self->_has;
  if ((v27 & 2) == 0)
  {
    if ((*(unsigned char *)&self->_has & 8) == 0) {
      goto LABEL_28;
    }
LABEL_35:
    *(unsigned char *)(v5 + 82) = self->_matchExactHostnames;
    *(unsigned char *)(v5 + 88) |= 8u;
    if ((*(unsigned char *)&self->_has & 4) == 0) {
      return (id)v5;
    }
    goto LABEL_29;
  }
  *(_DWORD *)(v5 + 64) = self->_resolver;
  *(unsigned char *)(v5 + 88) |= 2u;
  char v27 = (char)self->_has;
  if ((v27 & 8) != 0) {
    goto LABEL_35;
  }
LABEL_28:
  if ((v27 & 4) != 0)
  {
LABEL_29:
    *(unsigned char *)(v5 + 81) = self->_isPrivacyProxy;
    *(unsigned char *)(v5 + 88) |= 4u;
  }
  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_52;
  }
  if (self->_enabled)
  {
    if (!*((unsigned char *)v4 + 80)) {
      goto LABEL_52;
    }
  }
  else if (*((unsigned char *)v4 + 80))
  {
    goto LABEL_52;
  }
  identifier = self->_identifier;
  if ((unint64_t)identifier | *((void *)v4 + 5) && !-[NSString isEqual:](identifier, "isEqual:")) {
    goto LABEL_52;
  }
  if (!PBRepeatedUInt32IsEqual()) {
    goto LABEL_52;
  }
  hostnames = self->_hostnames;
  if ((unint64_t)hostnames | *((void *)v4 + 4))
  {
    if (!-[NSMutableArray isEqual:](hostnames, "isEqual:")) {
      goto LABEL_52;
    }
  }
  processes = self->_processes;
  if ((unint64_t)processes | *((void *)v4 + 7))
  {
    if (!-[NSMutableArray isEqual:](processes, "isEqual:")) {
      goto LABEL_52;
    }
  }
  char has = (char)self->_has;
  char v9 = *((unsigned char *)v4 + 88);
  if ((has & 0x20) != 0)
  {
    if ((*((unsigned char *)v4 + 88) & 0x20) == 0) {
      goto LABEL_52;
    }
    if (self->_systemProcessOnly)
    {
      if (!*((unsigned char *)v4 + 84)) {
        goto LABEL_52;
      }
    }
    else if (*((unsigned char *)v4 + 84))
    {
      goto LABEL_52;
    }
  }
  else if ((*((unsigned char *)v4 + 88) & 0x20) != 0)
  {
    goto LABEL_52;
  }
  if (*(unsigned char *)&self->_has)
  {
    if ((*((unsigned char *)v4 + 88) & 1) == 0 || self->_percentEnabled != *((_DWORD *)v4 + 12)) {
      goto LABEL_52;
    }
  }
  else if (*((unsigned char *)v4 + 88))
  {
    goto LABEL_52;
  }
  if ((*(unsigned char *)&self->_has & 0x10) != 0)
  {
    if ((*((unsigned char *)v4 + 88) & 0x10) == 0) {
      goto LABEL_52;
    }
    if (self->_supportsReverseProxying)
    {
      if (!*((unsigned char *)v4 + 83)) {
        goto LABEL_52;
      }
    }
    else if (*((unsigned char *)v4 + 83))
    {
      goto LABEL_52;
    }
  }
  else if ((*((unsigned char *)v4 + 88) & 0x10) != 0)
  {
    goto LABEL_52;
  }
  urls = self->_urls;
  if ((unint64_t)urls | *((void *)v4 + 9))
  {
    if (!-[NSMutableArray isEqual:](urls, "isEqual:")) {
      goto LABEL_52;
    }
    char has = (char)self->_has;
    char v9 = *((unsigned char *)v4 + 88);
  }
  if ((has & 2) != 0)
  {
    if ((v9 & 2) == 0 || self->_resolver != *((_DWORD *)v4 + 16)) {
      goto LABEL_52;
    }
  }
  else if ((v9 & 2) != 0)
  {
    goto LABEL_52;
  }
  if ((has & 8) != 0)
  {
    if ((v9 & 8) == 0) {
      goto LABEL_52;
    }
    if (self->_matchExactHostnames)
    {
      if (!*((unsigned char *)v4 + 82)) {
        goto LABEL_52;
      }
    }
    else if (*((unsigned char *)v4 + 82))
    {
      goto LABEL_52;
    }
  }
  else if ((v9 & 8) != 0)
  {
    goto LABEL_52;
  }
  BOOL v11 = (v9 & 4) == 0;
  if ((has & 4) != 0)
  {
    if ((v9 & 4) != 0)
    {
      if (self->_isPrivacyProxy)
      {
        if (!*((unsigned char *)v4 + 81)) {
          goto LABEL_52;
        }
      }
      else if (*((unsigned char *)v4 + 81))
      {
        goto LABEL_52;
      }
      BOOL v11 = 1;
      goto LABEL_53;
    }
LABEL_52:
    BOOL v11 = 0;
  }
LABEL_53:

  return v11;
}

- (unint64_t)hash
{
  BOOL enabled = self->_enabled;
  NSUInteger v3 = [(NSString *)self->_identifier hash];
  uint64_t v4 = PBRepeatedUInt32Hash();
  uint64_t v5 = [(NSMutableArray *)self->_hostnames hash];
  uint64_t v6 = [(NSMutableArray *)self->_processes hash];
  if ((*(unsigned char *)&self->_has & 0x20) == 0)
  {
    uint64_t v7 = 0;
    if (*(unsigned char *)&self->_has) {
      goto LABEL_3;
    }
LABEL_6:
    uint64_t v8 = 0;
    if ((*(unsigned char *)&self->_has & 0x10) != 0) {
      goto LABEL_4;
    }
    goto LABEL_7;
  }
  uint64_t v7 = 2654435761 * self->_systemProcessOnly;
  if ((*(unsigned char *)&self->_has & 1) == 0) {
    goto LABEL_6;
  }
LABEL_3:
  uint64_t v8 = 2654435761 * self->_percentEnabled;
  if ((*(unsigned char *)&self->_has & 0x10) != 0)
  {
LABEL_4:
    uint64_t v9 = 2654435761 * self->_supportsReverseProxying;
    goto LABEL_8;
  }
LABEL_7:
  uint64_t v9 = 0;
LABEL_8:
  uint64_t v10 = [(NSMutableArray *)self->_urls hash];
  if ((*(unsigned char *)&self->_has & 2) == 0)
  {
    uint64_t v11 = 0;
    if ((*(unsigned char *)&self->_has & 8) != 0) {
      goto LABEL_10;
    }
LABEL_13:
    uint64_t v12 = 0;
    if ((*(unsigned char *)&self->_has & 4) != 0) {
      goto LABEL_11;
    }
LABEL_14:
    uint64_t v13 = 0;
    return v3 ^ v4 ^ v5 ^ v6 ^ (2654435761 * enabled) ^ v7 ^ v8 ^ v9 ^ v10 ^ v11 ^ v12 ^ v13;
  }
  uint64_t v11 = 2654435761 * self->_resolver;
  if ((*(unsigned char *)&self->_has & 8) == 0) {
    goto LABEL_13;
  }
LABEL_10:
  uint64_t v12 = 2654435761 * self->_matchExactHostnames;
  if ((*(unsigned char *)&self->_has & 4) == 0) {
    goto LABEL_14;
  }
LABEL_11:
  uint64_t v13 = 2654435761 * self->_isPrivacyProxy;
  return v3 ^ v4 ^ v5 ^ v6 ^ (2654435761 * enabled) ^ v7 ^ v8 ^ v9 ^ v10 ^ v11 ^ v12 ^ v13;
}

- (void)mergeFrom:(id)a3
{
  uint64_t v40 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  self->_BOOL enabled = *((unsigned char *)v4 + 80);
  if (*((void *)v4 + 5)) {
    -[NSPPrivacyProxyProxiedContentMap setIdentifier:](self, "setIdentifier:");
  }
  uint64_t v5 = [v4 proxiesCount];
  if (v5)
  {
    uint64_t v6 = v5;
    for (uint64_t i = 0; i != v6; ++i)
      -[NSPPrivacyProxyProxiedContentMap addProxies:](self, "addProxies:", [v4 proxiesAtIndex:i]);
  }
  long long v35 = 0u;
  long long v36 = 0u;
  long long v33 = 0u;
  long long v34 = 0u;
  id v8 = *((id *)v4 + 4);
  uint64_t v9 = [v8 countByEnumeratingWithState:&v33 objects:v39 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v34;
    do
    {
      for (uint64_t j = 0; j != v10; ++j)
      {
        if (*(void *)v34 != v11) {
          objc_enumerationMutation(v8);
        }
        [(NSPPrivacyProxyProxiedContentMap *)self addHostnames:*(void *)(*((void *)&v33 + 1) + 8 * j)];
      }
      uint64_t v10 = [v8 countByEnumeratingWithState:&v33 objects:v39 count:16];
    }
    while (v10);
  }

  long long v31 = 0u;
  long long v32 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  id v13 = *((id *)v4 + 7);
  uint64_t v14 = [v13 countByEnumeratingWithState:&v29 objects:v38 count:16];
  if (v14)
  {
    uint64_t v15 = v14;
    uint64_t v16 = *(void *)v30;
    do
    {
      for (uint64_t k = 0; k != v15; ++k)
      {
        if (*(void *)v30 != v16) {
          objc_enumerationMutation(v13);
        }
        [(NSPPrivacyProxyProxiedContentMap *)self addProcesses:*(void *)(*((void *)&v29 + 1) + 8 * k)];
      }
      uint64_t v15 = [v13 countByEnumeratingWithState:&v29 objects:v38 count:16];
    }
    while (v15);
  }

  char v18 = *((unsigned char *)v4 + 88);
  if ((v18 & 0x20) != 0)
  {
    self->_systemProcessOnly = *((unsigned char *)v4 + 84);
    *(unsigned char *)&self->_has |= 0x20u;
    char v18 = *((unsigned char *)v4 + 88);
    if ((v18 & 1) == 0)
    {
LABEL_22:
      if ((v18 & 0x10) == 0) {
        goto LABEL_24;
      }
      goto LABEL_23;
    }
  }
  else if ((*((unsigned char *)v4 + 88) & 1) == 0)
  {
    goto LABEL_22;
  }
  self->_percentEnabled = *((_DWORD *)v4 + 12);
  *(unsigned char *)&self->_has |= 1u;
  if ((*((unsigned char *)v4 + 88) & 0x10) != 0)
  {
LABEL_23:
    self->_supportsReverseProxying = *((unsigned char *)v4 + 83);
    *(unsigned char *)&self->_has |= 0x10u;
  }
LABEL_24:
  long long v27 = 0u;
  long long v28 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  id v19 = *((id *)v4 + 9);
  uint64_t v20 = [v19 countByEnumeratingWithState:&v25 objects:v37 count:16];
  if (v20)
  {
    uint64_t v21 = v20;
    uint64_t v22 = *(void *)v26;
    do
    {
      for (uint64_t m = 0; m != v21; ++m)
      {
        if (*(void *)v26 != v22) {
          objc_enumerationMutation(v19);
        }
        -[NSPPrivacyProxyProxiedContentMap addUrls:](self, "addUrls:", *(void *)(*((void *)&v25 + 1) + 8 * m), (void)v25);
      }
      uint64_t v21 = [v19 countByEnumeratingWithState:&v25 objects:v37 count:16];
    }
    while (v21);
  }

  char v24 = *((unsigned char *)v4 + 88);
  if ((v24 & 2) == 0)
  {
    if ((*((unsigned char *)v4 + 88) & 8) == 0) {
      goto LABEL_33;
    }
LABEL_40:
    self->_matchExactHostnames = *((unsigned char *)v4 + 82);
    *(unsigned char *)&self->_has |= 8u;
    if ((*((unsigned char *)v4 + 88) & 4) == 0) {
      goto LABEL_35;
    }
    goto LABEL_34;
  }
  self->_resolver = *((_DWORD *)v4 + 16);
  *(unsigned char *)&self->_has |= 2u;
  char v24 = *((unsigned char *)v4 + 88);
  if ((v24 & 8) != 0) {
    goto LABEL_40;
  }
LABEL_33:
  if ((v24 & 4) != 0)
  {
LABEL_34:
    self->_isPrivacyProxy = *((unsigned char *)v4 + 81);
    *(unsigned char *)&self->_has |= 4u;
  }
LABEL_35:
}

- (BOOL)enabled
{
  return self->_enabled;
}

- (void)setEnabled:(BOOL)a3
{
  self->_BOOL enabled = a3;
}

- (NSString)identifier
{
  return self->_identifier;
}

- (void)setIdentifier:(id)a3
{
}

- (NSMutableArray)hostnames
{
  return self->_hostnames;
}

- (void)setHostnames:(id)a3
{
}

- (NSMutableArray)processes
{
  return self->_processes;
}

- (void)setProcesses:(id)a3
{
}

- (BOOL)systemProcessOnly
{
  return self->_systemProcessOnly;
}

- (unsigned)percentEnabled
{
  return self->_percentEnabled;
}

- (BOOL)supportsReverseProxying
{
  return self->_supportsReverseProxying;
}

- (NSMutableArray)urls
{
  return self->_urls;
}

- (void)setUrls:(id)a3
{
}

- (unsigned)resolver
{
  return self->_resolver;
}

- (BOOL)matchExactHostnames
{
  return self->_matchExactHostnames;
}

- (BOOL)isPrivacyProxy
{
  return self->_isPrivacyProxy;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_urls, 0);
  objc_storeStrong((id *)&self->_processes, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_storeStrong((id *)&self->_hostnames, 0);
}

@end