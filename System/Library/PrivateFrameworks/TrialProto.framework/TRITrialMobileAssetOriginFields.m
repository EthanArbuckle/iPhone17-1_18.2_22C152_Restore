@interface TRITrialMobileAssetOriginFields
- (BOOL)hasIsMobileAsset;
- (BOOL)isEqual:(id)a3;
- (BOOL)isMobileAsset;
- (BOOL)readFrom:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (unint64_t)hash;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setHasIsMobileAsset:(BOOL)a3;
- (void)setIsMobileAsset:(BOOL)a3;
- (void)writeTo:(id)a3;
@end

@implementation TRITrialMobileAssetOriginFields

- (void)setIsMobileAsset:(BOOL)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_isMobileAsset = a3;
}

- (void)setHasIsMobileAsset:(BOOL)a3
{
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasIsMobileAsset
{
  return *(unsigned char *)&self->_has & 1;
}

- (id)description
{
  v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)TRITrialMobileAssetOriginFields;
  v4 = [(TRITrialMobileAssetOriginFields *)&v8 description];
  v5 = [(TRITrialMobileAssetOriginFields *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  v3 = [MEMORY[0x1E4F1CA60] dictionary];
  if (*(unsigned char *)&self->_has)
  {
    v4 = [NSNumber numberWithBool:self->_isMobileAsset];
    [v3 setObject:v4 forKey:@"is_mobile_asset"];
  }
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return TRITrialMobileAssetOriginFieldsReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  if (*(unsigned char *)&self->_has) {
    PBDataWriterWriteBOOLField();
  }
}

- (void)copyTo:(id)a3
{
  if (*(unsigned char *)&self->_has)
  {
    *((unsigned char *)a3 + 8) = self->_isMobileAsset;
    *((unsigned char *)a3 + 12) |= 1u;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  id result = (id)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  if (*(unsigned char *)&self->_has)
  {
    *((unsigned char *)result + 8) = self->_isMobileAsset;
    *((unsigned char *)result + 12) |= 1u;
  }
  return result;
}

- (BOOL)isEqual:(id)a3
{
  v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_4;
  }
  BOOL v5 = (v4[12] & 1) == 0;
  if (*(unsigned char *)&self->_has)
  {
    if ((v4[12] & 1) == 0)
    {
LABEL_4:
      BOOL v5 = 0;
      goto LABEL_5;
    }
    if (self->_isMobileAsset)
    {
      if (!v4[8]) {
        goto LABEL_4;
      }
    }
    else if (v4[8])
    {
      goto LABEL_4;
    }
    BOOL v5 = 1;
  }
LABEL_5:

  return v5;
}

- (unint64_t)hash
{
  if (*(unsigned char *)&self->_has) {
    return 2654435761 * self->_isMobileAsset;
  }
  else {
    return 0;
  }
}

- (void)mergeFrom:(id)a3
{
  if (*((unsigned char *)a3 + 12))
  {
    self->_isMobileAsset = *((unsigned char *)a3 + 8);
    *(unsigned char *)&self->_has |= 1u;
  }
}

- (BOOL)isMobileAsset
{
  return self->_isMobileAsset;
}

@end