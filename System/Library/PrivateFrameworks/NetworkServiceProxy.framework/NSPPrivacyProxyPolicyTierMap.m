@interface NSPPrivacyProxyPolicyTierMap
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSPPrivacyProxyPolicy)policy;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)tierAsString:(int)a3;
- (int)StringAsTier:(id)a3;
- (int)tier;
- (unint64_t)hash;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setPolicy:(id)a3;
- (void)setTier:(int)a3;
- (void)writeTo:(id)a3;
@end

@implementation NSPPrivacyProxyPolicyTierMap

- (id)tierAsString:(int)a3
{
  if (a3 >= 3)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(void *)&a3);
    v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v3 = off_1E5A3C420[a3];
  }
  return v3;
}

- (int)StringAsTier:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"UNKNOWN"])
  {
    int v4 = 0;
  }
  else if ([v3 isEqualToString:@"FREE"])
  {
    int v4 = 1;
  }
  else if ([v3 isEqualToString:@"SUBSCRIBER"])
  {
    int v4 = 2;
  }
  else
  {
    int v4 = 0;
  }

  return v4;
}

- (id)description
{
  id v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)NSPPrivacyProxyPolicyTierMap;
  int v4 = [(NSPPrivacyProxyPolicyTierMap *)&v8 description];
  v5 = [(NSPPrivacyProxyPolicyTierMap *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  id v3 = [MEMORY[0x1E4F1CA60] dictionary];
  uint64_t tier = self->_tier;
  if (tier >= 3)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", self->_tier);
    v5 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v5 = off_1E5A3C420[tier];
  }
  [v3 setObject:v5 forKey:@"tier"];

  policy = self->_policy;
  if (policy)
  {
    v7 = [(NSPPrivacyProxyPolicy *)policy dictionaryRepresentation];
    [v3 setObject:v7 forKey:@"policy"];
  }
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return NSPPrivacyProxyPolicyTierMapReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  PBDataWriterWriteInt32Field();
  if (!self->_policy) {
    __assert_rtn("-[NSPPrivacyProxyPolicyTierMap writeTo:]", "NSPPrivacyProxyPolicyTierMap.m", 118, "self->_policy != nil");
  }
  PBDataWriterWriteSubmessage();
}

- (void)copyTo:(id)a3
{
  *((_DWORD *)a3 + 4) = self->_tier;
  [a3 setPolicy:self->_policy];
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  *(_DWORD *)(v5 + 16) = self->_tier;
  id v6 = [(NSPPrivacyProxyPolicy *)self->_policy copyWithZone:a3];
  v7 = *(void **)(v5 + 8);
  *(void *)(v5 + 8) = v6;

  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if ([v4 isMemberOfClass:objc_opt_class()] && self->_tier == *((_DWORD *)v4 + 4))
  {
    policy = self->_policy;
    if ((unint64_t)policy | v4[1]) {
      char v6 = -[NSPPrivacyProxyPolicy isEqual:](policy, "isEqual:");
    }
    else {
      char v6 = 1;
    }
  }
  else
  {
    char v6 = 0;
  }

  return v6;
}

- (unint64_t)hash
{
  uint64_t v2 = 2654435761 * self->_tier;
  return [(NSPPrivacyProxyPolicy *)self->_policy hash] ^ v2;
}

- (void)mergeFrom:(id)a3
{
  id v4 = a3;
  self->_uint64_t tier = v4[4];
  policy = self->_policy;
  uint64_t v6 = *((void *)v4 + 1);
  if (policy)
  {
    if (!v6) {
      goto LABEL_7;
    }
    v7 = v4;
    policy = (NSPPrivacyProxyPolicy *)-[NSPPrivacyProxyPolicy mergeFrom:](policy, "mergeFrom:");
  }
  else
  {
    if (!v6) {
      goto LABEL_7;
    }
    v7 = v4;
    policy = (NSPPrivacyProxyPolicy *)-[NSPPrivacyProxyPolicyTierMap setPolicy:](self, "setPolicy:");
  }
  id v4 = v7;
LABEL_7:
  MEMORY[0x1F41817F8](policy, v4);
}

- (int)tier
{
  return self->_tier;
}

- (void)setTier:(int)a3
{
  self->_uint64_t tier = a3;
}

- (NSPPrivacyProxyPolicy)policy
{
  return self->_policy;
}

- (void)setPolicy:(id)a3
{
}

- (void).cxx_destruct
{
}

@end