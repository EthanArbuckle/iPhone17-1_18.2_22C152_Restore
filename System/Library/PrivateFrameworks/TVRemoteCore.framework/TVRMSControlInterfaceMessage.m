@interface TVRMSControlInterfaceMessage
- (BOOL)hasSupportsDirectionalControl;
- (BOOL)hasSupportsSpeakerSelection;
- (BOOL)hasSupportsVolumeControl;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (BOOL)supportsDirectionalControl;
- (BOOL)supportsSpeakerSelection;
- (BOOL)supportsVolumeControl;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (unint64_t)hash;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setHasSupportsDirectionalControl:(BOOL)a3;
- (void)setHasSupportsSpeakerSelection:(BOOL)a3;
- (void)setHasSupportsVolumeControl:(BOOL)a3;
- (void)setSupportsDirectionalControl:(BOOL)a3;
- (void)setSupportsSpeakerSelection:(BOOL)a3;
- (void)setSupportsVolumeControl:(BOOL)a3;
- (void)writeTo:(id)a3;
@end

@implementation TVRMSControlInterfaceMessage

- (void)setSupportsSpeakerSelection:(BOOL)a3
{
  *(unsigned char *)&self->_has |= 2u;
  self->_supportsSpeakerSelection = a3;
}

- (void)setHasSupportsSpeakerSelection:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFD | v3;
}

- (BOOL)hasSupportsSpeakerSelection
{
  return (*(unsigned char *)&self->_has >> 1) & 1;
}

- (void)setSupportsVolumeControl:(BOOL)a3
{
  *(unsigned char *)&self->_has |= 4u;
  self->_supportsVolumeControl = a3;
}

- (void)setHasSupportsVolumeControl:(BOOL)a3
{
  if (a3) {
    char v3 = 4;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFB | v3;
}

- (BOOL)hasSupportsVolumeControl
{
  return (*(unsigned char *)&self->_has >> 2) & 1;
}

- (void)setSupportsDirectionalControl:(BOOL)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_supportsDirectionalControl = a3;
}

- (void)setHasSupportsDirectionalControl:(BOOL)a3
{
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasSupportsDirectionalControl
{
  return *(unsigned char *)&self->_has & 1;
}

- (id)description
{
  char v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)TVRMSControlInterfaceMessage;
  v4 = [(TVRMSControlInterfaceMessage *)&v8 description];
  v5 = [(TVRMSControlInterfaceMessage *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  char v3 = [MEMORY[0x263EFF9A0] dictionary];
  char has = (char)self->_has;
  if ((has & 2) != 0)
  {
    v7 = [NSNumber numberWithBool:self->_supportsSpeakerSelection];
    [v3 setObject:v7 forKey:@"supportsSpeakerSelection"];

    char has = (char)self->_has;
    if ((has & 4) == 0)
    {
LABEL_3:
      if ((has & 1) == 0) {
        goto LABEL_5;
      }
      goto LABEL_4;
    }
  }
  else if ((*(unsigned char *)&self->_has & 4) == 0)
  {
    goto LABEL_3;
  }
  objc_super v8 = [NSNumber numberWithBool:self->_supportsVolumeControl];
  [v3 setObject:v8 forKey:@"supportsVolumeControl"];

  if (*(unsigned char *)&self->_has)
  {
LABEL_4:
    v5 = [NSNumber numberWithBool:self->_supportsDirectionalControl];
    [v3 setObject:v5 forKey:@"supportsDirectionalControl"];
  }
LABEL_5:

  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return TVRMSControlInterfaceMessageReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  char has = (char)self->_has;
  id v6 = v4;
  if ((has & 2) != 0)
  {
    PBDataWriterWriteBOOLField();
    id v4 = v6;
    char has = (char)self->_has;
    if ((has & 4) == 0)
    {
LABEL_3:
      if ((has & 1) == 0) {
        goto LABEL_5;
      }
      goto LABEL_4;
    }
  }
  else if ((*(unsigned char *)&self->_has & 4) == 0)
  {
    goto LABEL_3;
  }
  PBDataWriterWriteBOOLField();
  id v4 = v6;
  if (*(unsigned char *)&self->_has)
  {
LABEL_4:
    PBDataWriterWriteBOOLField();
    id v4 = v6;
  }
LABEL_5:
}

- (void)copyTo:(id)a3
{
  id v4 = a3;
  char has = (char)self->_has;
  if ((has & 2) != 0)
  {
    v4[9] = self->_supportsSpeakerSelection;
    v4[12] |= 2u;
    char has = (char)self->_has;
    if ((has & 4) == 0)
    {
LABEL_3:
      if ((has & 1) == 0) {
        goto LABEL_5;
      }
      goto LABEL_4;
    }
  }
  else if ((*(unsigned char *)&self->_has & 4) == 0)
  {
    goto LABEL_3;
  }
  v4[10] = self->_supportsVolumeControl;
  v4[12] |= 4u;
  if (*(unsigned char *)&self->_has)
  {
LABEL_4:
    v4[8] = self->_supportsDirectionalControl;
    v4[12] |= 1u;
  }
LABEL_5:
}

- (id)copyWithZone:(_NSZone *)a3
{
  id result = (id)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  char has = (char)self->_has;
  if ((has & 2) != 0)
  {
    *((unsigned char *)result + 9) = self->_supportsSpeakerSelection;
    *((unsigned char *)result + 12) |= 2u;
    char has = (char)self->_has;
    if ((has & 4) == 0)
    {
LABEL_3:
      if ((has & 1) == 0) {
        return result;
      }
      goto LABEL_4;
    }
  }
  else if ((*(unsigned char *)&self->_has & 4) == 0)
  {
    goto LABEL_3;
  }
  *((unsigned char *)result + 10) = self->_supportsVolumeControl;
  *((unsigned char *)result + 12) |= 4u;
  if ((*(unsigned char *)&self->_has & 1) == 0) {
    return result;
  }
LABEL_4:
  *((unsigned char *)result + 8) = self->_supportsDirectionalControl;
  *((unsigned char *)result + 12) |= 1u;
  return result;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (unsigned __int8 *)a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_16;
  }
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    if ((v4[12] & 2) == 0 || self->_supportsSpeakerSelection != v4[9]) {
      goto LABEL_16;
    }
  }
  else if ((v4[12] & 2) != 0)
  {
LABEL_16:
    BOOL v5 = 0;
    goto LABEL_17;
  }
  if ((*(unsigned char *)&self->_has & 4) != 0)
  {
    if ((v4[12] & 4) == 0 || self->_supportsVolumeControl != v4[10]) {
      goto LABEL_16;
    }
  }
  else if ((v4[12] & 4) != 0)
  {
    goto LABEL_16;
  }
  BOOL v5 = (v4[12] & 1) == 0;
  if (*(unsigned char *)&self->_has)
  {
    if ((v4[12] & 1) == 0 || self->_supportsDirectionalControl != v4[8]) {
      goto LABEL_16;
    }
    BOOL v5 = 1;
  }
LABEL_17:

  return v5;
}

- (unint64_t)hash
{
  if ((*(unsigned char *)&self->_has & 2) == 0)
  {
    uint64_t v2 = 0;
    if ((*(unsigned char *)&self->_has & 4) != 0) {
      goto LABEL_3;
    }
LABEL_6:
    uint64_t v3 = 0;
    if (*(unsigned char *)&self->_has) {
      goto LABEL_4;
    }
LABEL_7:
    uint64_t v4 = 0;
    return v3 ^ v2 ^ v4;
  }
  uint64_t v2 = 2654435761 * self->_supportsSpeakerSelection;
  if ((*(unsigned char *)&self->_has & 4) == 0) {
    goto LABEL_6;
  }
LABEL_3:
  uint64_t v3 = 2654435761 * self->_supportsVolumeControl;
  if ((*(unsigned char *)&self->_has & 1) == 0) {
    goto LABEL_7;
  }
LABEL_4:
  uint64_t v4 = 2654435761 * self->_supportsDirectionalControl;
  return v3 ^ v2 ^ v4;
}

- (void)mergeFrom:(id)a3
{
  uint64_t v4 = (BOOL *)a3;
  BOOL v5 = v4[12];
  if ((v5 & 2) != 0)
  {
    self->_supportsSpeakerSelection = v4[9];
    *(unsigned char *)&self->_has |= 2u;
    BOOL v5 = v4[12];
    if ((v5 & 4) == 0)
    {
LABEL_3:
      if (!v5) {
        goto LABEL_5;
      }
      goto LABEL_4;
    }
  }
  else if ((v4[12] & 4) == 0)
  {
    goto LABEL_3;
  }
  self->_supportsVolumeControl = v4[10];
  *(unsigned char *)&self->_has |= 4u;
  if (v4[12])
  {
LABEL_4:
    self->_supportsDirectionalControl = v4[8];
    *(unsigned char *)&self->_has |= 1u;
  }
LABEL_5:
}

- (BOOL)supportsSpeakerSelection
{
  return self->_supportsSpeakerSelection;
}

- (BOOL)supportsVolumeControl
{
  return self->_supportsVolumeControl;
}

- (BOOL)supportsDirectionalControl
{
  return self->_supportsDirectionalControl;
}

@end