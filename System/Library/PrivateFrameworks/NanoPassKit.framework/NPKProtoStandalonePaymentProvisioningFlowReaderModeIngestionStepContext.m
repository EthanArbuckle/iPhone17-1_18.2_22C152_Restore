@interface NPKProtoStandalonePaymentProvisioningFlowReaderModeIngestionStepContext
- (BOOL)hasIngestionProgress;
- (BOOL)hasIngestionState;
- (BOOL)hasPhysicalCardImageURL;
- (BOOL)hasSubtitle;
- (BOOL)hasTitle;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSString)physicalCardImageURL;
- (NSString)subtitle;
- (NSString)title;
- (float)ingestionProgress;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)ingestionStateAsString:(int)a3;
- (int)StringAsIngestionState:(id)a3;
- (int)ingestionState;
- (unint64_t)hash;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setHasIngestionProgress:(BOOL)a3;
- (void)setHasIngestionState:(BOOL)a3;
- (void)setIngestionProgress:(float)a3;
- (void)setIngestionState:(int)a3;
- (void)setPhysicalCardImageURL:(id)a3;
- (void)setSubtitle:(id)a3;
- (void)setTitle:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation NPKProtoStandalonePaymentProvisioningFlowReaderModeIngestionStepContext

- (BOOL)hasPhysicalCardImageURL
{
  return self->_physicalCardImageURL != 0;
}

- (BOOL)hasTitle
{
  return self->_title != 0;
}

- (BOOL)hasSubtitle
{
  return self->_subtitle != 0;
}

- (int)ingestionState
{
  if ((*(unsigned char *)&self->_has & 2) != 0) {
    return self->_ingestionState;
  }
  else {
    return 100;
  }
}

- (void)setIngestionState:(int)a3
{
  *(unsigned char *)&self->_has |= 2u;
  self->_ingestionState = a3;
}

- (void)setHasIngestionState:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFD | v3;
}

- (BOOL)hasIngestionState
{
  return (*(unsigned char *)&self->_has >> 1) & 1;
}

- (id)ingestionStateAsString:(int)a3
{
  if (a3 > 129)
  {
    switch(a3)
    {
      case 130:
        v4 = @"ReaderModeIngestionStateTransferring";
        break;
      case 140:
        v4 = @"ReaderModeIngestionStateCardAdded";
        break;
      case 150:
        v4 = @"ReaderModeIngestionStateCommuteCardAdded";
        break;
      default:
LABEL_26:
        objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(void *)&a3);
        v4 = (__CFString *)objc_claimAutoreleasedReturnValue();
        return v4;
    }
  }
  else
  {
    switch(a3)
    {
      case 'd':
        v4 = @"ReaderModeIngestionStateDefault";
        break;
      case 'n':
        v4 = @"ReaderModeIngestionStateCardNotFound";
        break;
      case 'x':
        v4 = @"ReaderModeIngestionStateTransferValue";
        return v4;
      default:
        goto LABEL_26;
    }
  }
  return v4;
}

- (int)StringAsIngestionState:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"ReaderModeIngestionStateDefault"])
  {
    int v4 = 100;
  }
  else if ([v3 isEqualToString:@"ReaderModeIngestionStateCardNotFound"])
  {
    int v4 = 110;
  }
  else if ([v3 isEqualToString:@"ReaderModeIngestionStateTransferValue"])
  {
    int v4 = 120;
  }
  else if ([v3 isEqualToString:@"ReaderModeIngestionStateTransferring"])
  {
    int v4 = 130;
  }
  else if ([v3 isEqualToString:@"ReaderModeIngestionStateCardAdded"])
  {
    int v4 = 140;
  }
  else if ([v3 isEqualToString:@"ReaderModeIngestionStateCommuteCardAdded"])
  {
    int v4 = 150;
  }
  else
  {
    int v4 = 100;
  }

  return v4;
}

- (void)setIngestionProgress:(float)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_ingestionProgress = a3;
}

- (void)setHasIngestionProgress:(BOOL)a3
{
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasIngestionProgress
{
  return *(unsigned char *)&self->_has & 1;
}

- (id)description
{
  id v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)NPKProtoStandalonePaymentProvisioningFlowReaderModeIngestionStepContext;
  int v4 = [(NPKProtoStandalonePaymentProvisioningFlowReaderModeIngestionStepContext *)&v8 description];
  v5 = [(NPKProtoStandalonePaymentProvisioningFlowReaderModeIngestionStepContext *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  id v3 = [MEMORY[0x263EFF9A0] dictionary];
  v5 = v3;
  physicalCardImageURL = self->_physicalCardImageURL;
  if (physicalCardImageURL) {
    [v3 setObject:physicalCardImageURL forKey:@"physicalCardImageURL"];
  }
  title = self->_title;
  if (title) {
    [v5 setObject:title forKey:@"title"];
  }
  subtitle = self->_subtitle;
  if (subtitle) {
    [v5 setObject:subtitle forKey:@"subtitle"];
  }
  char has = (char)self->_has;
  if ((has & 2) != 0)
  {
    int ingestionState = self->_ingestionState;
    if (ingestionState > 129)
    {
      switch(ingestionState)
      {
        case 130:
          v11 = @"ReaderModeIngestionStateTransferring";
          goto LABEL_22;
        case 140:
          v11 = @"ReaderModeIngestionStateCardAdded";
          goto LABEL_22;
        case 150:
          v11 = @"ReaderModeIngestionStateCommuteCardAdded";
          goto LABEL_22;
      }
    }
    else
    {
      switch(ingestionState)
      {
        case 'd':
          v11 = @"ReaderModeIngestionStateDefault";
          goto LABEL_22;
        case 'n':
          v11 = @"ReaderModeIngestionStateCardNotFound";
          goto LABEL_22;
        case 'x':
          v11 = @"ReaderModeIngestionStateTransferValue";
LABEL_22:
          [v5 setObject:v11 forKey:@"ingestionState"];

          char has = (char)self->_has;
          goto LABEL_23;
      }
    }
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", self->_ingestionState);
    v11 = (__CFString *)objc_claimAutoreleasedReturnValue();
    goto LABEL_22;
  }
LABEL_23:
  if (has)
  {
    *(float *)&double v4 = self->_ingestionProgress;
    v12 = [NSNumber numberWithFloat:v4];
    [v5 setObject:v12 forKey:@"ingestionProgress"];
  }
  return v5;
}

- (BOOL)readFrom:(id)a3
{
  return NPKProtoStandalonePaymentProvisioningFlowReaderModeIngestionStepContextReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  id v6 = v4;
  if (self->_physicalCardImageURL)
  {
    PBDataWriterWriteStringField();
    id v4 = v6;
  }
  if (self->_title)
  {
    PBDataWriterWriteStringField();
    id v4 = v6;
  }
  if (self->_subtitle)
  {
    PBDataWriterWriteStringField();
    id v4 = v6;
  }
  char has = (char)self->_has;
  if ((has & 2) != 0)
  {
    PBDataWriterWriteInt32Field();
    id v4 = v6;
    char has = (char)self->_has;
  }
  if (has)
  {
    PBDataWriterWriteFloatField();
    id v4 = v6;
  }
}

- (void)copyTo:(id)a3
{
  id v4 = a3;
  id v6 = v4;
  if (self->_physicalCardImageURL)
  {
    objc_msgSend(v4, "setPhysicalCardImageURL:");
    id v4 = v6;
  }
  if (self->_title)
  {
    objc_msgSend(v6, "setTitle:");
    id v4 = v6;
  }
  if (self->_subtitle)
  {
    objc_msgSend(v6, "setSubtitle:");
    id v4 = v6;
  }
  char has = (char)self->_has;
  if ((has & 2) != 0)
  {
    *((_DWORD *)v4 + 3) = self->_ingestionState;
    *((unsigned char *)v4 + 40) |= 2u;
    char has = (char)self->_has;
  }
  if (has)
  {
    *((_DWORD *)v4 + 2) = LODWORD(self->_ingestionProgress);
    *((unsigned char *)v4 + 40) |= 1u;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  uint64_t v6 = [(NSString *)self->_physicalCardImageURL copyWithZone:a3];
  v7 = *(void **)(v5 + 16);
  *(void *)(v5 + 16) = v6;

  uint64_t v8 = [(NSString *)self->_title copyWithZone:a3];
  v9 = *(void **)(v5 + 32);
  *(void *)(v5 + 32) = v8;

  uint64_t v10 = [(NSString *)self->_subtitle copyWithZone:a3];
  v11 = *(void **)(v5 + 24);
  *(void *)(v5 + 24) = v10;

  char has = (char)self->_has;
  if ((has & 2) != 0)
  {
    *(_DWORD *)(v5 + 12) = self->_ingestionState;
    *(unsigned char *)(v5 + 40) |= 2u;
    char has = (char)self->_has;
  }
  if (has)
  {
    *(float *)(v5 + 8) = self->_ingestionProgress;
    *(unsigned char *)(v5 + 40) |= 1u;
  }
  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_17;
  }
  physicalCardImageURL = self->_physicalCardImageURL;
  if ((unint64_t)physicalCardImageURL | *((void *)v4 + 2))
  {
    if (!-[NSString isEqual:](physicalCardImageURL, "isEqual:")) {
      goto LABEL_17;
    }
  }
  title = self->_title;
  if ((unint64_t)title | *((void *)v4 + 4))
  {
    if (!-[NSString isEqual:](title, "isEqual:")) {
      goto LABEL_17;
    }
  }
  subtitle = self->_subtitle;
  if ((unint64_t)subtitle | *((void *)v4 + 3))
  {
    if (!-[NSString isEqual:](subtitle, "isEqual:")) {
      goto LABEL_17;
    }
  }
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    if ((*((unsigned char *)v4 + 40) & 2) == 0 || self->_ingestionState != *((_DWORD *)v4 + 3)) {
      goto LABEL_17;
    }
  }
  else if ((*((unsigned char *)v4 + 40) & 2) != 0)
  {
LABEL_17:
    BOOL v8 = 0;
    goto LABEL_18;
  }
  BOOL v8 = (*((unsigned char *)v4 + 40) & 1) == 0;
  if (*(unsigned char *)&self->_has)
  {
    if ((*((unsigned char *)v4 + 40) & 1) == 0 || self->_ingestionProgress != *((float *)v4 + 2)) {
      goto LABEL_17;
    }
    BOOL v8 = 1;
  }
LABEL_18:

  return v8;
}

- (unint64_t)hash
{
  NSUInteger v3 = [(NSString *)self->_physicalCardImageURL hash];
  NSUInteger v4 = [(NSString *)self->_title hash];
  NSUInteger v5 = [(NSString *)self->_subtitle hash];
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    uint64_t v6 = 2654435761 * self->_ingestionState;
    if (*(unsigned char *)&self->_has) {
      goto LABEL_3;
    }
LABEL_8:
    unint64_t v11 = 0;
    return v4 ^ v3 ^ v5 ^ v6 ^ v11;
  }
  uint64_t v6 = 0;
  if ((*(unsigned char *)&self->_has & 1) == 0) {
    goto LABEL_8;
  }
LABEL_3:
  float ingestionProgress = self->_ingestionProgress;
  float v8 = -ingestionProgress;
  if (ingestionProgress >= 0.0) {
    float v8 = self->_ingestionProgress;
  }
  float v9 = floorf(v8 + 0.5);
  float v10 = (float)(v8 - v9) * 1.8447e19;
  unint64_t v11 = 2654435761u * (unint64_t)fmodf(v9, 1.8447e19);
  if (v10 >= 0.0)
  {
    if (v10 > 0.0) {
      v11 += (unint64_t)v10;
    }
  }
  else
  {
    v11 -= (unint64_t)fabsf(v10);
  }
  return v4 ^ v3 ^ v5 ^ v6 ^ v11;
}

- (void)mergeFrom:(id)a3
{
  id v4 = a3;
  id v6 = v4;
  if (*((void *)v4 + 2))
  {
    -[NPKProtoStandalonePaymentProvisioningFlowReaderModeIngestionStepContext setPhysicalCardImageURL:](self, "setPhysicalCardImageURL:");
    id v4 = v6;
  }
  if (*((void *)v4 + 4))
  {
    -[NPKProtoStandalonePaymentProvisioningFlowReaderModeIngestionStepContext setTitle:](self, "setTitle:");
    id v4 = v6;
  }
  if (*((void *)v4 + 3))
  {
    -[NPKProtoStandalonePaymentProvisioningFlowReaderModeIngestionStepContext setSubtitle:](self, "setSubtitle:");
    id v4 = v6;
  }
  char v5 = *((unsigned char *)v4 + 40);
  if ((v5 & 2) != 0)
  {
    self->_int ingestionState = *((_DWORD *)v4 + 3);
    *(unsigned char *)&self->_has |= 2u;
    char v5 = *((unsigned char *)v4 + 40);
  }
  if (v5)
  {
    self->_float ingestionProgress = *((float *)v4 + 2);
    *(unsigned char *)&self->_has |= 1u;
  }
}

- (NSString)physicalCardImageURL
{
  return self->_physicalCardImageURL;
}

- (void)setPhysicalCardImageURL:(id)a3
{
}

- (NSString)title
{
  return self->_title;
}

- (void)setTitle:(id)a3
{
}

- (NSString)subtitle
{
  return self->_subtitle;
}

- (void)setSubtitle:(id)a3
{
}

- (float)ingestionProgress
{
  return self->_ingestionProgress;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_title, 0);
  objc_storeStrong((id *)&self->_subtitle, 0);
  objc_storeStrong((id *)&self->_physicalCardImageURL, 0);
}

@end