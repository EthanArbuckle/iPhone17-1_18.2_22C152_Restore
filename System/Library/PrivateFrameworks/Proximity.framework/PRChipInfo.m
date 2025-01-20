@interface PRChipInfo
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (PRChipInfo)initWithCoder:(id)a3;
- (PRChipInfo)initWithECID:(unint64_t)a3 chipID:(unsigned __int16)a4 boardID:(unsigned __int16)a5 bootMode:(unsigned int)a6 prodMode:(unsigned __int8)a7 secureMode:(unsigned __int8)a8 securityDomain:(unsigned __int8)a9 chipRevision:(unsigned __int16)a10;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (unint64_t)ECID;
- (unsigned)boardID;
- (unsigned)bootMode;
- (unsigned)chipID;
- (unsigned)chipRevision;
- (unsigned)prodMode;
- (unsigned)secureMode;
- (unsigned)securityDomain;
- (void)encodeWithCoder:(id)a3;
@end

@implementation PRChipInfo

- (PRChipInfo)initWithECID:(unint64_t)a3 chipID:(unsigned __int16)a4 boardID:(unsigned __int16)a5 bootMode:(unsigned int)a6 prodMode:(unsigned __int8)a7 secureMode:(unsigned __int8)a8 securityDomain:(unsigned __int8)a9 chipRevision:(unsigned __int16)a10
{
  v17.receiver = self;
  v17.super_class = (Class)PRChipInfo;
  result = [(PRChipInfo *)&v17 init];
  if (result)
  {
    result->_ECID = a3;
    result->_chipID = a4;
    result->_boardID = a5;
    result->_bootMode = a6;
    result->_prodMode = a7;
    result->_secureMode = a8;
    result->_securityDomain = a9;
  }
  return result;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (PRChipInfo)initWithCoder:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [v4 decodeInt64ForKey:@"ECID"];
  unsigned __int16 v6 = [v4 decodeIntForKey:@"chipID"];
  unsigned __int16 v7 = [v4 decodeIntForKey:@"boardID"];
  uint64_t v8 = [v4 decodeInt32ForKey:@"bootMode"];
  unsigned __int8 v9 = [v4 decodeIntForKey:@"prodMode"];
  unsigned __int8 v10 = [v4 decodeIntForKey:@"secureMode"];
  char v11 = [v4 decodeIntForKey:@"securityDomain"];
  WORD1(v14) = [v4 decodeIntForKey:@"chipRevision"];
  LOBYTE(v14) = v11;
  v12 = -[PRChipInfo initWithECID:chipID:boardID:bootMode:prodMode:secureMode:securityDomain:chipRevision:](self, "initWithECID:chipID:boardID:bootMode:prodMode:secureMode:securityDomain:chipRevision:", v5, v6, v7, v8, v9, v10, v14);

  return v12;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  [v4 encodeInt64:self->_ECID forKey:@"ECID"];
  [v4 encodeInt:self->_chipID forKey:@"chipID"];
  [v4 encodeInt:self->_boardID forKey:@"boardID"];
  [v4 encodeInt32:self->_bootMode forKey:@"bootMode"];
  [v4 encodeInt:self->_prodMode forKey:@"prodMode"];
  [v4 encodeInt:self->_secureMode forKey:@"secureMode"];
  [v4 encodeInt:self->_securityDomain forKey:@"securityDomain"];
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = [PRChipInfo alloc];
  WORD1(v6) = self->_chipRevision;
  LOBYTE(v6) = self->_securityDomain;
  return -[PRChipInfo initWithECID:chipID:boardID:bootMode:prodMode:secureMode:securityDomain:chipRevision:](v4, "initWithECID:chipID:boardID:bootMode:prodMode:secureMode:securityDomain:chipRevision:", self->_ECID, self->_chipID, self->_boardID, self->_bootMode, self->_prodMode, self->_secureMode, v6);
}

- (id)description
{
  return (id)[NSString stringWithFormat:@"ECID: %llu, chipID: %d, boardID: %d, bootMode: %d, prodMode: %d, secureMode: %d, securityDomain: %d, chipRevision: 0x%04x", self->_ECID, self->_chipID, self->_boardID, self->_bootMode, self->_prodMode, self->_secureMode, self->_securityDomain, self->_chipRevision];
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v5 = v4;
    uint64_t v6 = [v5 ECID];
    if (v6 == [(PRChipInfo *)self ECID]
      && (int v7 = [v5 chipID], v7 == -[PRChipInfo chipID](self, "chipID"))
      && (int v8 = [v5 boardID], v8 == -[PRChipInfo boardID](self, "boardID"))
      && (int v9 = [v5 bootMode], v9 == -[PRChipInfo bootMode](self, "bootMode"))
      && (int v10 = [v5 prodMode], v10 == -[PRChipInfo prodMode](self, "prodMode"))
      && (int v11 = [v5 secureMode], v11 == -[PRChipInfo secureMode](self, "secureMode"))
      && (int v12 = [v5 securityDomain], v12 == -[PRChipInfo securityDomain](self, "securityDomain")))
    {
      int v13 = [v5 chipRevision];
      BOOL v14 = v13 == [(PRChipInfo *)self chipRevision];
    }
    else
    {
      BOOL v14 = 0;
    }
  }
  else
  {
    BOOL v14 = 0;
  }

  return v14;
}

- (unint64_t)ECID
{
  return self->_ECID;
}

- (unsigned)chipID
{
  return self->_chipID;
}

- (unsigned)boardID
{
  return self->_boardID;
}

- (unsigned)bootMode
{
  return self->_bootMode;
}

- (unsigned)prodMode
{
  return self->_prodMode;
}

- (unsigned)secureMode
{
  return self->_secureMode;
}

- (unsigned)securityDomain
{
  return self->_securityDomain;
}

- (unsigned)chipRevision
{
  return self->_chipRevision;
}

@end