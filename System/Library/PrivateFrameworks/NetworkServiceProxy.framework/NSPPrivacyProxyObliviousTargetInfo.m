@interface NSPPrivacyProxyObliviousTargetInfo
+ (Class)processesType;
- (BOOL)hasProxyIndex;
- (BOOL)hasWeight;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSMutableArray)processes;
- (NSString)proxyURLPath;
- (NSString)targetHost;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)processesAtIndex:(unint64_t)a3;
- (unint64_t)hash;
- (unint64_t)processesCount;
- (unsigned)proxyIndex;
- (unsigned)weight;
- (void)addProcesses:(id)a3;
- (void)clearProcesses;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setHasProxyIndex:(BOOL)a3;
- (void)setHasWeight:(BOOL)a3;
- (void)setProcesses:(id)a3;
- (void)setProxyIndex:(unsigned int)a3;
- (void)setProxyURLPath:(id)a3;
- (void)setTargetHost:(id)a3;
- (void)setWeight:(unsigned int)a3;
- (void)writeTo:(id)a3;
@end

@implementation NSPPrivacyProxyObliviousTargetInfo

- (void)setProxyIndex:(unsigned int)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_proxyIndex = a3;
}

- (void)setHasProxyIndex:(BOOL)a3
{
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasProxyIndex
{
  return *(unsigned char *)&self->_has & 1;
}

- (void)setWeight:(unsigned int)a3
{
  *(unsigned char *)&self->_has |= 2u;
  self->_weight = a3;
}

- (void)setHasWeight:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFD | v3;
}

- (BOOL)hasWeight
{
  return (*(unsigned char *)&self->_has >> 1) & 1;
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
    v7 = self->_processes;
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

- (id)description
{
  char v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)NSPPrivacyProxyObliviousTargetInfo;
  id v4 = [(NSPPrivacyProxyObliviousTargetInfo *)&v8 description];
  v5 = [(NSPPrivacyProxyObliviousTargetInfo *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  char v3 = [MEMORY[0x1E4F1CA60] dictionary];
  id v4 = v3;
  targetHost = self->_targetHost;
  if (targetHost) {
    [v3 setObject:targetHost forKey:@"targetHost"];
  }
  proxyURLPath = self->_proxyURLPath;
  if (proxyURLPath) {
    [v4 setObject:proxyURLPath forKey:@"proxyURLPath"];
  }
  char has = (char)self->_has;
  if (has)
  {
    objc_super v8 = [NSNumber numberWithUnsignedInt:self->_proxyIndex];
    [v4 setObject:v8 forKey:@"proxyIndex"];

    char has = (char)self->_has;
  }
  if ((has & 2) != 0)
  {
    v9 = [NSNumber numberWithUnsignedInt:self->_weight];
    [v4 setObject:v9 forKey:@"weight"];
  }
  processes = self->_processes;
  if (processes) {
    [v4 setObject:processes forKey:@"processes"];
  }
  return v4;
}

- (BOOL)readFrom:(id)a3
{
  return NSPPrivacyProxyObliviousTargetInfoReadFrom(self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (!self->_targetHost) {
    __assert_rtn("-[NSPPrivacyProxyObliviousTargetInfo writeTo:]", "NSPPrivacyProxyObliviousTargetInfo.m", 183, "nil != self->_targetHost");
  }
  v5 = v4;
  PBDataWriterWriteStringField();
  if (!self->_proxyURLPath) {
    __assert_rtn("-[NSPPrivacyProxyObliviousTargetInfo writeTo:]", "NSPPrivacyProxyObliviousTargetInfo.m", 188, "nil != self->_proxyURLPath");
  }
  PBDataWriterWriteStringField();
  char has = (char)self->_has;
  if (has)
  {
    PBDataWriterWriteUint32Field();
    char has = (char)self->_has;
  }
  if ((has & 2) != 0) {
    PBDataWriterWriteUint32Field();
  }
  long long v14 = 0u;
  long long v15 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  v7 = self->_processes;
  uint64_t v8 = [(NSMutableArray *)v7 countByEnumeratingWithState:&v12 objects:v16 count:16];
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
        PBDataWriterWriteStringField();
      }
      uint64_t v9 = [(NSMutableArray *)v7 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v9);
  }
}

- (void)copyTo:(id)a3
{
  id v9 = a3;
  [v9 setTargetHost:self->_targetHost];
  [v9 setProxyURLPath:self->_proxyURLPath];
  char has = (char)self->_has;
  if (has)
  {
    *((_DWORD *)v9 + 4) = self->_proxyIndex;
    *((unsigned char *)v9 + 44) |= 1u;
    char has = (char)self->_has;
  }
  if ((has & 2) != 0)
  {
    *((_DWORD *)v9 + 10) = self->_weight;
    *((unsigned char *)v9 + 44) |= 2u;
  }
  if ([(NSPPrivacyProxyObliviousTargetInfo *)self processesCount])
  {
    [v9 clearProcesses];
    unint64_t v5 = [(NSPPrivacyProxyObliviousTargetInfo *)self processesCount];
    if (v5)
    {
      unint64_t v6 = v5;
      for (uint64_t i = 0; i != v6; ++i)
      {
        uint64_t v8 = [(NSPPrivacyProxyObliviousTargetInfo *)self processesAtIndex:i];
        [v9 addProcesses:v8];
      }
    }
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  uint64_t v6 = [(NSString *)self->_targetHost copyWithZone:a3];
  v7 = *(void **)(v5 + 32);
  *(void *)(v5 + 32) = v6;

  uint64_t v8 = [(NSString *)self->_proxyURLPath copyWithZone:a3];
  id v9 = *(void **)(v5 + 24);
  *(void *)(v5 + 24) = v8;

  char has = (char)self->_has;
  if (has)
  {
    *(_DWORD *)(v5 + 16) = self->_proxyIndex;
    *(unsigned char *)(v5 + 44) |= 1u;
    char has = (char)self->_has;
  }
  if ((has & 2) != 0)
  {
    *(_DWORD *)(v5 + 40) = self->_weight;
    *(unsigned char *)(v5 + 44) |= 2u;
  }
  long long v20 = 0u;
  long long v21 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  v11 = self->_processes;
  uint64_t v12 = [(NSMutableArray *)v11 countByEnumeratingWithState:&v18 objects:v22 count:16];
  if (v12)
  {
    uint64_t v13 = v12;
    uint64_t v14 = *(void *)v19;
    do
    {
      for (uint64_t i = 0; i != v13; ++i)
      {
        if (*(void *)v19 != v14) {
          objc_enumerationMutation(v11);
        }
        v16 = objc_msgSend(*(id *)(*((void *)&v18 + 1) + 8 * i), "copyWithZone:", a3, (void)v18);
        [(id)v5 addProcesses:v16];
      }
      uint64_t v13 = [(NSMutableArray *)v11 countByEnumeratingWithState:&v18 objects:v22 count:16];
    }
    while (v13);
  }

  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_18;
  }
  targetHost = self->_targetHost;
  if ((unint64_t)targetHost | *((void *)v4 + 4))
  {
    if (!-[NSString isEqual:](targetHost, "isEqual:")) {
      goto LABEL_18;
    }
  }
  proxyURLPath = self->_proxyURLPath;
  if ((unint64_t)proxyURLPath | *((void *)v4 + 3))
  {
    if (!-[NSString isEqual:](proxyURLPath, "isEqual:")) {
      goto LABEL_18;
    }
  }
  if (*(unsigned char *)&self->_has)
  {
    if ((*((unsigned char *)v4 + 44) & 1) == 0 || self->_proxyIndex != *((_DWORD *)v4 + 4)) {
      goto LABEL_18;
    }
  }
  else if (*((unsigned char *)v4 + 44))
  {
LABEL_18:
    char v8 = 0;
    goto LABEL_19;
  }
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    if ((*((unsigned char *)v4 + 44) & 2) == 0 || self->_weight != *((_DWORD *)v4 + 10)) {
      goto LABEL_18;
    }
  }
  else if ((*((unsigned char *)v4 + 44) & 2) != 0)
  {
    goto LABEL_18;
  }
  processes = self->_processes;
  if ((unint64_t)processes | *((void *)v4 + 1)) {
    char v8 = -[NSMutableArray isEqual:](processes, "isEqual:");
  }
  else {
    char v8 = 1;
  }
LABEL_19:

  return v8;
}

- (unint64_t)hash
{
  NSUInteger v3 = [(NSString *)self->_targetHost hash];
  NSUInteger v4 = [(NSString *)self->_proxyURLPath hash];
  if (*(unsigned char *)&self->_has)
  {
    uint64_t v5 = 2654435761 * self->_proxyIndex;
    if ((*(unsigned char *)&self->_has & 2) != 0) {
      goto LABEL_3;
    }
LABEL_5:
    uint64_t v6 = 0;
    return v4 ^ v3 ^ v5 ^ v6 ^ [(NSMutableArray *)self->_processes hash];
  }
  uint64_t v5 = 0;
  if ((*(unsigned char *)&self->_has & 2) == 0) {
    goto LABEL_5;
  }
LABEL_3:
  uint64_t v6 = 2654435761 * self->_weight;
  return v4 ^ v3 ^ v5 ^ v6 ^ [(NSMutableArray *)self->_processes hash];
}

- (void)mergeFrom:(id)a3
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (*((void *)v4 + 4)) {
    -[NSPPrivacyProxyObliviousTargetInfo setTargetHost:](self, "setTargetHost:");
  }
  if (*((void *)v4 + 3)) {
    -[NSPPrivacyProxyObliviousTargetInfo setProxyURLPath:](self, "setProxyURLPath:");
  }
  char v5 = *((unsigned char *)v4 + 44);
  if (v5)
  {
    self->_proxyIndex = *((_DWORD *)v4 + 4);
    *(unsigned char *)&self->_has |= 1u;
    char v5 = *((unsigned char *)v4 + 44);
  }
  if ((v5 & 2) != 0)
  {
    self->_weight = *((_DWORD *)v4 + 10);
    *(unsigned char *)&self->_has |= 2u;
  }
  long long v13 = 0u;
  long long v14 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  id v6 = *((id *)v4 + 1);
  uint64_t v7 = [v6 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v12;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v12 != v9) {
          objc_enumerationMutation(v6);
        }
        -[NSPPrivacyProxyObliviousTargetInfo addProcesses:](self, "addProcesses:", *(void *)(*((void *)&v11 + 1) + 8 * i), (void)v11);
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v8);
  }
}

- (NSString)targetHost
{
  return self->_targetHost;
}

- (void)setTargetHost:(id)a3
{
}

- (NSString)proxyURLPath
{
  return self->_proxyURLPath;
}

- (void)setProxyURLPath:(id)a3
{
}

- (unsigned)proxyIndex
{
  return self->_proxyIndex;
}

- (unsigned)weight
{
  return self->_weight;
}

- (NSMutableArray)processes
{
  return self->_processes;
}

- (void)setProcesses:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_targetHost, 0);
  objc_storeStrong((id *)&self->_proxyURLPath, 0);
  objc_storeStrong((id *)&self->_processes, 0);
}

@end