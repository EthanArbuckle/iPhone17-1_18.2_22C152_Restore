@interface CSDMessagingCallModel
- (BOOL)hasSupportsAddCall;
- (BOOL)hasSupportsDTMF;
- (BOOL)hasSupportsGrouping;
- (BOOL)hasSupportsHolding;
- (BOOL)hasSupportsSendingToVoicemail;
- (BOOL)hasSupportsUnambiguousMultiPartyState;
- (BOOL)hasSupportsUngrouping;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (BOOL)supportsAddCall;
- (BOOL)supportsDTMF;
- (BOOL)supportsGrouping;
- (BOOL)supportsHolding;
- (BOOL)supportsSendingToVoicemail;
- (BOOL)supportsUnambiguousMultiPartyState;
- (BOOL)supportsUngrouping;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (unint64_t)hash;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setHasSupportsAddCall:(BOOL)a3;
- (void)setHasSupportsDTMF:(BOOL)a3;
- (void)setHasSupportsGrouping:(BOOL)a3;
- (void)setHasSupportsHolding:(BOOL)a3;
- (void)setHasSupportsSendingToVoicemail:(BOOL)a3;
- (void)setHasSupportsUnambiguousMultiPartyState:(BOOL)a3;
- (void)setHasSupportsUngrouping:(BOOL)a3;
- (void)setSupportsAddCall:(BOOL)a3;
- (void)setSupportsDTMF:(BOOL)a3;
- (void)setSupportsGrouping:(BOOL)a3;
- (void)setSupportsHolding:(BOOL)a3;
- (void)setSupportsSendingToVoicemail:(BOOL)a3;
- (void)setSupportsUnambiguousMultiPartyState:(BOOL)a3;
- (void)setSupportsUngrouping:(BOOL)a3;
- (void)writeTo:(id)a3;
@end

@implementation CSDMessagingCallModel

- (void)setSupportsHolding:(BOOL)a3
{
  *(unsigned char *)&self->_has |= 8u;
  self->_supportsHolding = a3;
}

- (void)setHasSupportsHolding:(BOOL)a3
{
  if (a3) {
    char v3 = 8;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xF7 | v3;
}

- (BOOL)hasSupportsHolding
{
  return (*(unsigned char *)&self->_has >> 3) & 1;
}

- (void)setSupportsGrouping:(BOOL)a3
{
  *(unsigned char *)&self->_has |= 4u;
  self->_supportsGrouping = a3;
}

- (void)setHasSupportsGrouping:(BOOL)a3
{
  if (a3) {
    char v3 = 4;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFB | v3;
}

- (BOOL)hasSupportsGrouping
{
  return (*(unsigned char *)&self->_has >> 2) & 1;
}

- (void)setSupportsUngrouping:(BOOL)a3
{
  *(unsigned char *)&self->_has |= 0x40u;
  self->_supportsUngrouping = a3;
}

- (void)setHasSupportsUngrouping:(BOOL)a3
{
  if (a3) {
    char v3 = 64;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xBF | v3;
}

- (BOOL)hasSupportsUngrouping
{
  return (*(unsigned char *)&self->_has >> 6) & 1;
}

- (void)setSupportsDTMF:(BOOL)a3
{
  *(unsigned char *)&self->_has |= 2u;
  self->_supportsDTMF = a3;
}

- (void)setHasSupportsDTMF:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFD | v3;
}

- (BOOL)hasSupportsDTMF
{
  return (*(unsigned char *)&self->_has >> 1) & 1;
}

- (void)setSupportsUnambiguousMultiPartyState:(BOOL)a3
{
  *(unsigned char *)&self->_has |= 0x20u;
  self->_supportsUnambiguousMultiPartyState = a3;
}

- (void)setHasSupportsUnambiguousMultiPartyState:(BOOL)a3
{
  if (a3) {
    char v3 = 32;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xDF | v3;
}

- (BOOL)hasSupportsUnambiguousMultiPartyState
{
  return (*(unsigned char *)&self->_has >> 5) & 1;
}

- (void)setSupportsAddCall:(BOOL)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_supportsAddCall = a3;
}

- (void)setHasSupportsAddCall:(BOOL)a3
{
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasSupportsAddCall
{
  return *(unsigned char *)&self->_has & 1;
}

- (void)setSupportsSendingToVoicemail:(BOOL)a3
{
  *(unsigned char *)&self->_has |= 0x10u;
  self->_supportsSendingToVoicemail = a3;
}

- (void)setHasSupportsSendingToVoicemail:(BOOL)a3
{
  if (a3) {
    char v3 = 16;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xEF | v3;
}

- (BOOL)hasSupportsSendingToVoicemail
{
  return (*(unsigned char *)&self->_has >> 4) & 1;
}

- (id)description
{
  v7.receiver = self;
  v7.super_class = (Class)CSDMessagingCallModel;
  char v3 = [(CSDMessagingCallModel *)&v7 description];
  v4 = [(CSDMessagingCallModel *)self dictionaryRepresentation];
  v5 = +[NSString stringWithFormat:@"%@ %@", v3, v4];

  return v5;
}

- (id)dictionaryRepresentation
{
  char v3 = +[NSMutableDictionary dictionary];
  char has = (char)self->_has;
  if ((has & 8) != 0)
  {
    objc_super v7 = +[NSNumber numberWithBool:self->_supportsHolding];
    [v3 setObject:v7 forKey:@"supportsHolding"];

    char has = (char)self->_has;
    if ((has & 4) == 0)
    {
LABEL_3:
      if ((has & 0x40) == 0) {
        goto LABEL_4;
      }
      goto LABEL_14;
    }
  }
  else if ((*(unsigned char *)&self->_has & 4) == 0)
  {
    goto LABEL_3;
  }
  v8 = +[NSNumber numberWithBool:self->_supportsGrouping];
  [v3 setObject:v8 forKey:@"supportsGrouping"];

  char has = (char)self->_has;
  if ((has & 0x40) == 0)
  {
LABEL_4:
    if ((has & 2) == 0) {
      goto LABEL_5;
    }
    goto LABEL_15;
  }
LABEL_14:
  v9 = +[NSNumber numberWithBool:self->_supportsUngrouping];
  [v3 setObject:v9 forKey:@"supportsUngrouping"];

  char has = (char)self->_has;
  if ((has & 2) == 0)
  {
LABEL_5:
    if ((has & 0x20) == 0) {
      goto LABEL_6;
    }
    goto LABEL_16;
  }
LABEL_15:
  v10 = +[NSNumber numberWithBool:self->_supportsDTMF];
  [v3 setObject:v10 forKey:@"supportsDTMF"];

  char has = (char)self->_has;
  if ((has & 0x20) == 0)
  {
LABEL_6:
    if ((has & 1) == 0) {
      goto LABEL_7;
    }
    goto LABEL_17;
  }
LABEL_16:
  v11 = +[NSNumber numberWithBool:self->_supportsUnambiguousMultiPartyState];
  [v3 setObject:v11 forKey:@"supportsUnambiguousMultiPartyState"];

  char has = (char)self->_has;
  if ((has & 1) == 0)
  {
LABEL_7:
    if ((has & 0x10) == 0) {
      goto LABEL_9;
    }
    goto LABEL_8;
  }
LABEL_17:
  v12 = +[NSNumber numberWithBool:self->_supportsAddCall];
  [v3 setObject:v12 forKey:@"supportsAddCall"];

  if ((*(unsigned char *)&self->_has & 0x10) != 0)
  {
LABEL_8:
    v5 = +[NSNumber numberWithBool:self->_supportsSendingToVoicemail];
    [v3 setObject:v5 forKey:@"supportsSendingToVoicemail"];
  }
LABEL_9:

  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return sub_10004EE30((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v5 = a3;
  char has = (char)self->_has;
  if ((has & 8) != 0)
  {
    PBDataWriterWriteBOOLField();
    char has = (char)self->_has;
    if ((has & 4) == 0)
    {
LABEL_3:
      if ((has & 0x40) == 0) {
        goto LABEL_4;
      }
      goto LABEL_14;
    }
  }
  else if ((*(unsigned char *)&self->_has & 4) == 0)
  {
    goto LABEL_3;
  }
  PBDataWriterWriteBOOLField();
  char has = (char)self->_has;
  if ((has & 0x40) == 0)
  {
LABEL_4:
    if ((has & 2) == 0) {
      goto LABEL_5;
    }
    goto LABEL_15;
  }
LABEL_14:
  PBDataWriterWriteBOOLField();
  char has = (char)self->_has;
  if ((has & 2) == 0)
  {
LABEL_5:
    if ((has & 0x20) == 0) {
      goto LABEL_6;
    }
    goto LABEL_16;
  }
LABEL_15:
  PBDataWriterWriteBOOLField();
  char has = (char)self->_has;
  if ((has & 0x20) == 0)
  {
LABEL_6:
    if ((has & 1) == 0) {
      goto LABEL_7;
    }
    goto LABEL_17;
  }
LABEL_16:
  PBDataWriterWriteBOOLField();
  char has = (char)self->_has;
  if ((has & 1) == 0)
  {
LABEL_7:
    if ((has & 0x10) == 0) {
      goto LABEL_9;
    }
    goto LABEL_8;
  }
LABEL_17:
  PBDataWriterWriteBOOLField();
  if ((*(unsigned char *)&self->_has & 0x10) != 0) {
LABEL_8:
  }
    PBDataWriterWriteBOOLField();
LABEL_9:
}

- (void)copyTo:(id)a3
{
  v4 = a3;
  char has = (char)self->_has;
  if ((has & 8) != 0)
  {
    v4[11] = self->_supportsHolding;
    v4[16] |= 8u;
    char has = (char)self->_has;
    if ((has & 4) == 0)
    {
LABEL_3:
      if ((has & 0x40) == 0) {
        goto LABEL_4;
      }
      goto LABEL_14;
    }
  }
  else if ((*(unsigned char *)&self->_has & 4) == 0)
  {
    goto LABEL_3;
  }
  v4[10] = self->_supportsGrouping;
  v4[16] |= 4u;
  char has = (char)self->_has;
  if ((has & 0x40) == 0)
  {
LABEL_4:
    if ((has & 2) == 0) {
      goto LABEL_5;
    }
    goto LABEL_15;
  }
LABEL_14:
  v4[14] = self->_supportsUngrouping;
  v4[16] |= 0x40u;
  char has = (char)self->_has;
  if ((has & 2) == 0)
  {
LABEL_5:
    if ((has & 0x20) == 0) {
      goto LABEL_6;
    }
    goto LABEL_16;
  }
LABEL_15:
  v4[9] = self->_supportsDTMF;
  v4[16] |= 2u;
  char has = (char)self->_has;
  if ((has & 0x20) == 0)
  {
LABEL_6:
    if ((has & 1) == 0) {
      goto LABEL_7;
    }
    goto LABEL_17;
  }
LABEL_16:
  v4[13] = self->_supportsUnambiguousMultiPartyState;
  v4[16] |= 0x20u;
  char has = (char)self->_has;
  if ((has & 1) == 0)
  {
LABEL_7:
    if ((has & 0x10) == 0) {
      goto LABEL_9;
    }
    goto LABEL_8;
  }
LABEL_17:
  v4[8] = self->_supportsAddCall;
  v4[16] |= 1u;
  if ((*(unsigned char *)&self->_has & 0x10) != 0)
  {
LABEL_8:
    v4[12] = self->_supportsSendingToVoicemail;
    v4[16] |= 0x10u;
  }
LABEL_9:
}

- (id)copyWithZone:(_NSZone *)a3
{
  id result = objc_msgSend(objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  char has = (char)self->_has;
  if ((has & 8) != 0)
  {
    *((unsigned char *)result + 11) = self->_supportsHolding;
    *((unsigned char *)result + 16) |= 8u;
    char has = (char)self->_has;
    if ((has & 4) == 0)
    {
LABEL_3:
      if ((has & 0x40) == 0) {
        goto LABEL_4;
      }
      goto LABEL_12;
    }
  }
  else if ((*(unsigned char *)&self->_has & 4) == 0)
  {
    goto LABEL_3;
  }
  *((unsigned char *)result + 10) = self->_supportsGrouping;
  *((unsigned char *)result + 16) |= 4u;
  char has = (char)self->_has;
  if ((has & 0x40) == 0)
  {
LABEL_4:
    if ((has & 2) == 0) {
      goto LABEL_5;
    }
    goto LABEL_13;
  }
LABEL_12:
  *((unsigned char *)result + 14) = self->_supportsUngrouping;
  *((unsigned char *)result + 16) |= 0x40u;
  char has = (char)self->_has;
  if ((has & 2) == 0)
  {
LABEL_5:
    if ((has & 0x20) == 0) {
      goto LABEL_6;
    }
    goto LABEL_14;
  }
LABEL_13:
  *((unsigned char *)result + 9) = self->_supportsDTMF;
  *((unsigned char *)result + 16) |= 2u;
  char has = (char)self->_has;
  if ((has & 0x20) == 0)
  {
LABEL_6:
    if ((has & 1) == 0) {
      goto LABEL_7;
    }
    goto LABEL_15;
  }
LABEL_14:
  *((unsigned char *)result + 13) = self->_supportsUnambiguousMultiPartyState;
  *((unsigned char *)result + 16) |= 0x20u;
  char has = (char)self->_has;
  if ((has & 1) == 0)
  {
LABEL_7:
    if ((has & 0x10) == 0) {
      return result;
    }
    goto LABEL_8;
  }
LABEL_15:
  *((unsigned char *)result + 8) = self->_supportsAddCall;
  *((unsigned char *)result + 16) |= 1u;
  if ((*(unsigned char *)&self->_has & 0x10) == 0) {
    return result;
  }
LABEL_8:
  *((unsigned char *)result + 12) = self->_supportsSendingToVoicemail;
  *((unsigned char *)result + 16) |= 0x10u;
  return result;
}

- (BOOL)isEqual:(id)a3
{
  v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_52;
  }
  if ((*(unsigned char *)&self->_has & 8) != 0)
  {
    if ((v4[16] & 8) == 0) {
      goto LABEL_52;
    }
    if (self->_supportsHolding)
    {
      if (!v4[11]) {
        goto LABEL_52;
      }
    }
    else if (v4[11])
    {
      goto LABEL_52;
    }
  }
  else if ((v4[16] & 8) != 0)
  {
    goto LABEL_52;
  }
  if ((*(unsigned char *)&self->_has & 4) != 0)
  {
    if ((v4[16] & 4) == 0) {
      goto LABEL_52;
    }
    if (self->_supportsGrouping)
    {
      if (!v4[10]) {
        goto LABEL_52;
      }
    }
    else if (v4[10])
    {
      goto LABEL_52;
    }
  }
  else if ((v4[16] & 4) != 0)
  {
    goto LABEL_52;
  }
  if ((*(unsigned char *)&self->_has & 0x40) != 0)
  {
    if ((v4[16] & 0x40) == 0) {
      goto LABEL_52;
    }
    if (self->_supportsUngrouping)
    {
      if (!v4[14]) {
        goto LABEL_52;
      }
    }
    else if (v4[14])
    {
      goto LABEL_52;
    }
  }
  else if ((v4[16] & 0x40) != 0)
  {
    goto LABEL_52;
  }
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    if ((v4[16] & 2) == 0) {
      goto LABEL_52;
    }
    if (self->_supportsDTMF)
    {
      if (!v4[9]) {
        goto LABEL_52;
      }
    }
    else if (v4[9])
    {
      goto LABEL_52;
    }
  }
  else if ((v4[16] & 2) != 0)
  {
    goto LABEL_52;
  }
  if ((*(unsigned char *)&self->_has & 0x20) != 0)
  {
    if ((v4[16] & 0x20) == 0) {
      goto LABEL_52;
    }
    if (self->_supportsUnambiguousMultiPartyState)
    {
      if (!v4[13]) {
        goto LABEL_52;
      }
    }
    else if (v4[13])
    {
      goto LABEL_52;
    }
  }
  else if ((v4[16] & 0x20) != 0)
  {
    goto LABEL_52;
  }
  if (*(unsigned char *)&self->_has)
  {
    if ((v4[16] & 1) == 0) {
      goto LABEL_52;
    }
    if (self->_supportsAddCall)
    {
      if (!v4[8]) {
        goto LABEL_52;
      }
    }
    else if (v4[8])
    {
      goto LABEL_52;
    }
  }
  else if (v4[16])
  {
    goto LABEL_52;
  }
  BOOL v5 = (v4[16] & 0x10) == 0;
  if ((*(unsigned char *)&self->_has & 0x10) != 0)
  {
    if ((v4[16] & 0x10) != 0)
    {
      if (self->_supportsSendingToVoicemail)
      {
        if (!v4[12]) {
          goto LABEL_52;
        }
      }
      else if (v4[12])
      {
        goto LABEL_52;
      }
      BOOL v5 = 1;
      goto LABEL_53;
    }
LABEL_52:
    BOOL v5 = 0;
  }
LABEL_53:

  return v5;
}

- (unint64_t)hash
{
  if ((*(unsigned char *)&self->_has & 8) != 0)
  {
    uint64_t v2 = 2654435761 * self->_supportsHolding;
    if ((*(unsigned char *)&self->_has & 4) != 0)
    {
LABEL_3:
      uint64_t v3 = 2654435761 * self->_supportsGrouping;
      if ((*(unsigned char *)&self->_has & 0x40) != 0) {
        goto LABEL_4;
      }
      goto LABEL_11;
    }
  }
  else
  {
    uint64_t v2 = 0;
    if ((*(unsigned char *)&self->_has & 4) != 0) {
      goto LABEL_3;
    }
  }
  uint64_t v3 = 0;
  if ((*(unsigned char *)&self->_has & 0x40) != 0)
  {
LABEL_4:
    uint64_t v4 = 2654435761 * self->_supportsUngrouping;
    if ((*(unsigned char *)&self->_has & 2) != 0) {
      goto LABEL_5;
    }
    goto LABEL_12;
  }
LABEL_11:
  uint64_t v4 = 0;
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
LABEL_5:
    uint64_t v5 = 2654435761 * self->_supportsDTMF;
    if ((*(unsigned char *)&self->_has & 0x20) != 0) {
      goto LABEL_6;
    }
    goto LABEL_13;
  }
LABEL_12:
  uint64_t v5 = 0;
  if ((*(unsigned char *)&self->_has & 0x20) != 0)
  {
LABEL_6:
    uint64_t v6 = 2654435761 * self->_supportsUnambiguousMultiPartyState;
    if (*(unsigned char *)&self->_has) {
      goto LABEL_7;
    }
LABEL_14:
    uint64_t v7 = 0;
    if ((*(unsigned char *)&self->_has & 0x10) != 0) {
      goto LABEL_8;
    }
LABEL_15:
    uint64_t v8 = 0;
    return v3 ^ v2 ^ v4 ^ v5 ^ v6 ^ v7 ^ v8;
  }
LABEL_13:
  uint64_t v6 = 0;
  if ((*(unsigned char *)&self->_has & 1) == 0) {
    goto LABEL_14;
  }
LABEL_7:
  uint64_t v7 = 2654435761 * self->_supportsAddCall;
  if ((*(unsigned char *)&self->_has & 0x10) == 0) {
    goto LABEL_15;
  }
LABEL_8:
  uint64_t v8 = 2654435761 * self->_supportsSendingToVoicemail;
  return v3 ^ v2 ^ v4 ^ v5 ^ v6 ^ v7 ^ v8;
}

- (void)mergeFrom:(id)a3
{
  uint64_t v4 = (BOOL *)a3;
  BOOL v5 = v4[16];
  if ((v5 & 8) != 0)
  {
    self->_supportsHolding = v4[11];
    *(unsigned char *)&self->_has |= 8u;
    BOOL v5 = v4[16];
    if ((v5 & 4) == 0)
    {
LABEL_3:
      if ((v5 & 0x40) == 0) {
        goto LABEL_4;
      }
      goto LABEL_14;
    }
  }
  else if ((v4[16] & 4) == 0)
  {
    goto LABEL_3;
  }
  self->_supportsGrouping = v4[10];
  *(unsigned char *)&self->_has |= 4u;
  BOOL v5 = v4[16];
  if ((v5 & 0x40) == 0)
  {
LABEL_4:
    if ((v5 & 2) == 0) {
      goto LABEL_5;
    }
    goto LABEL_15;
  }
LABEL_14:
  self->_supportsUngrouping = v4[14];
  *(unsigned char *)&self->_has |= 0x40u;
  BOOL v5 = v4[16];
  if ((v5 & 2) == 0)
  {
LABEL_5:
    if ((v5 & 0x20) == 0) {
      goto LABEL_6;
    }
    goto LABEL_16;
  }
LABEL_15:
  self->_supportsDTMF = v4[9];
  *(unsigned char *)&self->_has |= 2u;
  BOOL v5 = v4[16];
  if ((v5 & 0x20) == 0)
  {
LABEL_6:
    if (!v5) {
      goto LABEL_7;
    }
    goto LABEL_17;
  }
LABEL_16:
  self->_supportsUnambiguousMultiPartyState = v4[13];
  *(unsigned char *)&self->_has |= 0x20u;
  BOOL v5 = v4[16];
  if (!v5)
  {
LABEL_7:
    if ((v5 & 0x10) == 0) {
      goto LABEL_9;
    }
    goto LABEL_8;
  }
LABEL_17:
  self->_supportsAddCall = v4[8];
  *(unsigned char *)&self->_has |= 1u;
  if ((v4[16] & 0x10) != 0)
  {
LABEL_8:
    self->_supportsSendingToVoicemail = v4[12];
    *(unsigned char *)&self->_has |= 0x10u;
  }
LABEL_9:
}

- (BOOL)supportsHolding
{
  return self->_supportsHolding;
}

- (BOOL)supportsGrouping
{
  return self->_supportsGrouping;
}

- (BOOL)supportsUngrouping
{
  return self->_supportsUngrouping;
}

- (BOOL)supportsDTMF
{
  return self->_supportsDTMF;
}

- (BOOL)supportsUnambiguousMultiPartyState
{
  return self->_supportsUnambiguousMultiPartyState;
}

- (BOOL)supportsAddCall
{
  return self->_supportsAddCall;
}

- (BOOL)supportsSendingToVoicemail
{
  return self->_supportsSendingToVoicemail;
}

@end