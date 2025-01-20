@interface NSPPrivacyProxyProxyPathWeight
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (unint64_t)hash;
- (unint64_t)proxiesCount;
- (unsigned)proxies;
- (unsigned)proxiesAtIndex:(unint64_t)a3;
- (unsigned)weight;
- (void)addProxies:(unsigned int)a3;
- (void)clearProxies;
- (void)copyTo:(id)a3;
- (void)dealloc;
- (void)mergeFrom:(id)a3;
- (void)setProxies:(unsigned int *)a3 count:(unint64_t)a4;
- (void)setWeight:(unsigned int)a3;
- (void)writeTo:(id)a3;
@end

@implementation NSPPrivacyProxyProxyPathWeight

- (void)dealloc
{
  PBRepeatedUInt32Clear();
  v3.receiver = self;
  v3.super_class = (Class)NSPPrivacyProxyProxyPathWeight;
  [(NSPPrivacyProxyProxyPathWeight *)&v3 dealloc];
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

- (id)description
{
  objc_super v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)NSPPrivacyProxyProxyPathWeight;
  v4 = [(NSPPrivacyProxyProxyPathWeight *)&v8 description];
  v5 = [(NSPPrivacyProxyProxyPathWeight *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  objc_super v3 = [MEMORY[0x1E4F1CA60] dictionary];
  v4 = [NSNumber numberWithUnsignedInt:self->_weight];
  [v3 setObject:v4 forKey:@"weight"];

  v5 = PBRepeatedUInt32NSArray();
  [v3 setObject:v5 forKey:@"proxies"];

  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return NSPPrivacyProxyProxyPathWeightReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v6 = a3;
  PBDataWriterWriteUint32Field();
  p_proxies = &self->_proxies;
  if (p_proxies->count)
  {
    unint64_t v5 = 0;
    do
    {
      PBDataWriterWriteUint32Field();
      ++v5;
    }
    while (v5 < p_proxies->count);
  }
}

- (void)copyTo:(id)a3
{
  uint64_t v7 = a3;
  v7[8] = self->_weight;
  if ([(NSPPrivacyProxyProxyPathWeight *)self proxiesCount])
  {
    [v7 clearProxies];
    unint64_t v4 = [(NSPPrivacyProxyProxyPathWeight *)self proxiesCount];
    if (v4)
    {
      unint64_t v5 = v4;
      for (uint64_t i = 0; i != v5; ++i)
        objc_msgSend(v7, "addProxies:", -[NSPPrivacyProxyProxyPathWeight proxiesAtIndex:](self, "proxiesAtIndex:", i));
    }
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  unint64_t v4 = (_DWORD *)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v4[8] = self->_weight;
  PBRepeatedUInt32Copy();
  return v4;
}

- (BOOL)isEqual:(id)a3
{
  unint64_t v4 = a3;
  if ([v4 isMemberOfClass:objc_opt_class()] && self->_weight == v4[8]) {
    char IsEqual = PBRepeatedUInt32IsEqual();
  }
  else {
    char IsEqual = 0;
  }

  return IsEqual;
}

- (unint64_t)hash
{
  uint64_t v2 = 2654435761 * self->_weight;
  return v2 ^ PBRepeatedUInt32Hash();
}

- (void)mergeFrom:(id)a3
{
  unint64_t v4 = a3;
  self->_weight = v4[8];
  id v8 = v4;
  uint64_t v5 = [v4 proxiesCount];
  if (v5)
  {
    uint64_t v6 = v5;
    for (uint64_t i = 0; i != v6; ++i)
      -[NSPPrivacyProxyProxyPathWeight addProxies:](self, "addProxies:", [v8 proxiesAtIndex:i]);
  }
}

- (unsigned)weight
{
  return self->_weight;
}

- (void)setWeight:(unsigned int)a3
{
  self->_weight = a3;
}

@end