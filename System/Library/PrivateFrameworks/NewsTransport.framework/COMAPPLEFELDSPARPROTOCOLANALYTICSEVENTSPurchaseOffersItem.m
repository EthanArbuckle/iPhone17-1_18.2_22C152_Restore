@interface COMAPPLEFELDSPARPROTOCOLANALYTICSEVENTSPurchaseOffersItem
- (BOOL)hasPurchaseId;
- (BOOL)hasPurchaseType;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSString)purchaseId;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)purchaseTypeAsString:(int)a3;
- (int)StringAsPurchaseType:(id)a3;
- (int)purchaseType;
- (unint64_t)hash;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setHasPurchaseType:(BOOL)a3;
- (void)setPurchaseId:(id)a3;
- (void)setPurchaseType:(int)a3;
- (void)writeTo:(id)a3;
@end

@implementation COMAPPLEFELDSPARPROTOCOLANALYTICSEVENTSPurchaseOffersItem

- (BOOL)hasPurchaseId
{
  return self->_purchaseId != 0;
}

- (int)purchaseType
{
  if (*(unsigned char *)&self->_has) {
    return self->_purchaseType;
  }
  else {
    return 0;
  }
}

- (void)setPurchaseType:(int)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_purchaseType = a3;
}

- (void)setHasPurchaseType:(BOOL)a3
{
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasPurchaseType
{
  return *(unsigned char *)&self->_has & 1;
}

- (id)purchaseTypeAsString:(int)a3
{
  if (a3 >= 4)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(void *)&a3);
    v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v3 = off_26444C290[a3];
  }

  return v3;
}

- (int)StringAsPurchaseType:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"UNKNOWN_PURCHASE_TYPE"])
  {
    int v4 = 0;
  }
  else if ([v3 isEqualToString:@"AL_A_CARTE_PURCHASE_TYPE"])
  {
    int v4 = 1;
  }
  else if ([v3 isEqualToString:@"BUNDLE_PURCHASE_TYPE"])
  {
    int v4 = 2;
  }
  else if ([v3 isEqualToString:@"S_BUNDLE_PURCHASE_TYPE"])
  {
    int v4 = 3;
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
  v8.super_class = (Class)COMAPPLEFELDSPARPROTOCOLANALYTICSEVENTSPurchaseOffersItem;
  int v4 = [(COMAPPLEFELDSPARPROTOCOLANALYTICSEVENTSPurchaseOffersItem *)&v8 description];
  v5 = [(COMAPPLEFELDSPARPROTOCOLANALYTICSEVENTSPurchaseOffersItem *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  id v3 = [MEMORY[0x263EFF9A0] dictionary];
  int v4 = v3;
  purchaseId = self->_purchaseId;
  if (purchaseId) {
    [v3 setObject:purchaseId forKey:@"purchase_id"];
  }
  if (*(unsigned char *)&self->_has)
  {
    uint64_t purchaseType = self->_purchaseType;
    if (purchaseType >= 4)
    {
      objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", self->_purchaseType);
      v7 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v7 = off_26444C290[purchaseType];
    }
    [v4 setObject:v7 forKey:@"purchase_type"];
  }

  return v4;
}

- (BOOL)readFrom:(id)a3
{
  return COMAPPLEFELDSPARPROTOCOLANALYTICSEVENTSPurchaseOffersItemReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (self->_purchaseId)
  {
    PBDataWriterWriteStringField();
    id v4 = v5;
  }
  if (*(unsigned char *)&self->_has)
  {
    PBDataWriterWriteInt32Field();
    id v4 = v5;
  }
}

- (void)copyTo:(id)a3
{
  id v4 = a3;
  if (self->_purchaseId)
  {
    id v5 = v4;
    objc_msgSend(v4, "setPurchaseId:");
    id v4 = v5;
  }
  if (*(unsigned char *)&self->_has)
  {
    *((_DWORD *)v4 + 4) = self->_purchaseType;
    *((unsigned char *)v4 + 20) |= 1u;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  uint64_t v6 = [(NSString *)self->_purchaseId copyWithZone:a3];
  v7 = *(void **)(v5 + 8);
  *(void *)(v5 + 8) = v6;

  if (*(unsigned char *)&self->_has)
  {
    *(_DWORD *)(v5 + 16) = self->_purchaseType;
    *(unsigned char *)(v5 + 20) |= 1u;
  }
  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_8;
  }
  purchaseId = self->_purchaseId;
  if ((unint64_t)purchaseId | *((void *)v4 + 1))
  {
    if (!-[NSString isEqual:](purchaseId, "isEqual:")) {
      goto LABEL_8;
    }
  }
  BOOL v6 = (*((unsigned char *)v4 + 20) & 1) == 0;
  if (*(unsigned char *)&self->_has)
  {
    if ((*((unsigned char *)v4 + 20) & 1) != 0 && self->_purchaseType == *((_DWORD *)v4 + 4))
    {
      BOOL v6 = 1;
      goto LABEL_9;
    }
LABEL_8:
    BOOL v6 = 0;
  }
LABEL_9:

  return v6;
}

- (unint64_t)hash
{
  NSUInteger v3 = [(NSString *)self->_purchaseId hash];
  if (*(unsigned char *)&self->_has) {
    uint64_t v4 = 2654435761 * self->_purchaseType;
  }
  else {
    uint64_t v4 = 0;
  }
  return v4 ^ v3;
}

- (void)mergeFrom:(id)a3
{
  uint64_t v4 = (int *)a3;
  if (*((void *)v4 + 1))
  {
    uint64_t v5 = v4;
    -[COMAPPLEFELDSPARPROTOCOLANALYTICSEVENTSPurchaseOffersItem setPurchaseId:](self, "setPurchaseId:");
    uint64_t v4 = v5;
  }
  if (v4[5])
  {
    self->_uint64_t purchaseType = v4[4];
    *(unsigned char *)&self->_has |= 1u;
  }
}

- (NSString)purchaseId
{
  return self->_purchaseId;
}

- (void)setPurchaseId:(id)a3
{
}

- (void).cxx_destruct
{
}

@end