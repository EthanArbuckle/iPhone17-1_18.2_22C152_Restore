@interface _MRClientUpdatesConfigurationProtobuf
+ (Class)subscribedPlayerPathsType;
- (BOOL)artworkUpdates;
- (BOOL)hasArtworkUpdates;
- (BOOL)hasKeyboardUpdates;
- (BOOL)hasNowPlayingUpdates;
- (BOOL)hasOutputDeviceUpdates;
- (BOOL)hasSystemEndpointUpdates;
- (BOOL)hasVolumeUpdates;
- (BOOL)isEqual:(id)a3;
- (BOOL)keyboardUpdates;
- (BOOL)nowPlayingUpdates;
- (BOOL)outputDeviceUpdates;
- (BOOL)readFrom:(id)a3;
- (BOOL)systemEndpointUpdates;
- (BOOL)volumeUpdates;
- (NSMutableArray)subscribedPlayerPaths;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)subscribedPlayerPathsAtIndex:(unint64_t)a3;
- (unint64_t)hash;
- (unint64_t)subscribedPlayerPathsCount;
- (void)addSubscribedPlayerPaths:(id)a3;
- (void)clearSubscribedPlayerPaths;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setArtworkUpdates:(BOOL)a3;
- (void)setHasArtworkUpdates:(BOOL)a3;
- (void)setHasKeyboardUpdates:(BOOL)a3;
- (void)setHasNowPlayingUpdates:(BOOL)a3;
- (void)setHasOutputDeviceUpdates:(BOOL)a3;
- (void)setHasSystemEndpointUpdates:(BOOL)a3;
- (void)setHasVolumeUpdates:(BOOL)a3;
- (void)setKeyboardUpdates:(BOOL)a3;
- (void)setNowPlayingUpdates:(BOOL)a3;
- (void)setOutputDeviceUpdates:(BOOL)a3;
- (void)setSubscribedPlayerPaths:(id)a3;
- (void)setSystemEndpointUpdates:(BOOL)a3;
- (void)setVolumeUpdates:(BOOL)a3;
- (void)writeTo:(id)a3;
@end

@implementation _MRClientUpdatesConfigurationProtobuf

- (void)setNowPlayingUpdates:(BOOL)a3
{
  *(unsigned char *)&self->_has |= 4u;
  self->_nowPlayingUpdates = a3;
}

- (void)setHasNowPlayingUpdates:(BOOL)a3
{
  if (a3) {
    char v3 = 4;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFB | v3;
}

- (BOOL)hasNowPlayingUpdates
{
  return (*(unsigned char *)&self->_has >> 2) & 1;
}

- (void)setArtworkUpdates:(BOOL)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_artworkUpdates = a3;
}

- (void)setHasArtworkUpdates:(BOOL)a3
{
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasArtworkUpdates
{
  return *(unsigned char *)&self->_has & 1;
}

- (void)setVolumeUpdates:(BOOL)a3
{
  *(unsigned char *)&self->_has |= 0x20u;
  self->_volumeUpdates = a3;
}

- (void)setHasVolumeUpdates:(BOOL)a3
{
  if (a3) {
    char v3 = 32;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xDF | v3;
}

- (BOOL)hasVolumeUpdates
{
  return (*(unsigned char *)&self->_has >> 5) & 1;
}

- (void)setKeyboardUpdates:(BOOL)a3
{
  *(unsigned char *)&self->_has |= 2u;
  self->_keyboardUpdates = a3;
}

- (void)setHasKeyboardUpdates:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFD | v3;
}

- (BOOL)hasKeyboardUpdates
{
  return (*(unsigned char *)&self->_has >> 1) & 1;
}

- (void)setOutputDeviceUpdates:(BOOL)a3
{
  *(unsigned char *)&self->_has |= 8u;
  self->_outputDeviceUpdates = a3;
}

- (void)setHasOutputDeviceUpdates:(BOOL)a3
{
  if (a3) {
    char v3 = 8;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xF7 | v3;
}

- (BOOL)hasOutputDeviceUpdates
{
  return (*(unsigned char *)&self->_has >> 3) & 1;
}

- (void)setSystemEndpointUpdates:(BOOL)a3
{
  *(unsigned char *)&self->_has |= 0x10u;
  self->_systemEndpointUpdates = a3;
}

- (void)setHasSystemEndpointUpdates:(BOOL)a3
{
  if (a3) {
    char v3 = 16;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xEF | v3;
}

- (BOOL)hasSystemEndpointUpdates
{
  return (*(unsigned char *)&self->_has >> 4) & 1;
}

- (void)clearSubscribedPlayerPaths
{
}

- (void)addSubscribedPlayerPaths:(id)a3
{
  id v4 = a3;
  subscribedPlayerPaths = self->_subscribedPlayerPaths;
  id v8 = v4;
  if (!subscribedPlayerPaths)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    v7 = self->_subscribedPlayerPaths;
    self->_subscribedPlayerPaths = v6;

    id v4 = v8;
    subscribedPlayerPaths = self->_subscribedPlayerPaths;
  }
  [(NSMutableArray *)subscribedPlayerPaths addObject:v4];
}

- (unint64_t)subscribedPlayerPathsCount
{
  return [(NSMutableArray *)self->_subscribedPlayerPaths count];
}

- (id)subscribedPlayerPathsAtIndex:(unint64_t)a3
{
  return (id)[(NSMutableArray *)self->_subscribedPlayerPaths objectAtIndex:a3];
}

+ (Class)subscribedPlayerPathsType
{
  return (Class)objc_opt_class();
}

- (id)description
{
  char v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)_MRClientUpdatesConfigurationProtobuf;
  id v4 = [(_MRClientUpdatesConfigurationProtobuf *)&v8 description];
  v5 = [(_MRClientUpdatesConfigurationProtobuf *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  char v3 = [MEMORY[0x1E4F1CA60] dictionary];
  char has = (char)self->_has;
  if ((has & 4) != 0)
  {
    v14 = [NSNumber numberWithBool:self->_nowPlayingUpdates];
    [v3 setObject:v14 forKey:@"nowPlayingUpdates"];

    char has = (char)self->_has;
    if ((has & 1) == 0)
    {
LABEL_3:
      if ((has & 0x20) == 0) {
        goto LABEL_4;
      }
      goto LABEL_22;
    }
  }
  else if ((*(unsigned char *)&self->_has & 1) == 0)
  {
    goto LABEL_3;
  }
  v15 = [NSNumber numberWithBool:self->_artworkUpdates];
  [v3 setObject:v15 forKey:@"artworkUpdates"];

  char has = (char)self->_has;
  if ((has & 0x20) == 0)
  {
LABEL_4:
    if ((has & 2) == 0) {
      goto LABEL_5;
    }
    goto LABEL_23;
  }
LABEL_22:
  v16 = [NSNumber numberWithBool:self->_volumeUpdates];
  [v3 setObject:v16 forKey:@"volumeUpdates"];

  char has = (char)self->_has;
  if ((has & 2) == 0)
  {
LABEL_5:
    if ((has & 8) == 0) {
      goto LABEL_6;
    }
    goto LABEL_24;
  }
LABEL_23:
  v17 = [NSNumber numberWithBool:self->_keyboardUpdates];
  [v3 setObject:v17 forKey:@"keyboardUpdates"];

  char has = (char)self->_has;
  if ((has & 8) == 0)
  {
LABEL_6:
    if ((has & 0x10) == 0) {
      goto LABEL_8;
    }
    goto LABEL_7;
  }
LABEL_24:
  v18 = [NSNumber numberWithBool:self->_outputDeviceUpdates];
  [v3 setObject:v18 forKey:@"outputDeviceUpdates"];

  if ((*(unsigned char *)&self->_has & 0x10) != 0)
  {
LABEL_7:
    v5 = [NSNumber numberWithBool:self->_systemEndpointUpdates];
    [v3 setObject:v5 forKey:@"systemEndpointUpdates"];
  }
LABEL_8:
  if ([(NSMutableArray *)self->_subscribedPlayerPaths count])
  {
    v6 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", -[NSMutableArray count](self->_subscribedPlayerPaths, "count"));
    long long v19 = 0u;
    long long v20 = 0u;
    long long v21 = 0u;
    long long v22 = 0u;
    v7 = self->_subscribedPlayerPaths;
    uint64_t v8 = [(NSMutableArray *)v7 countByEnumeratingWithState:&v19 objects:v23 count:16];
    if (v8)
    {
      uint64_t v9 = v8;
      uint64_t v10 = *(void *)v20;
      do
      {
        for (uint64_t i = 0; i != v9; ++i)
        {
          if (*(void *)v20 != v10) {
            objc_enumerationMutation(v7);
          }
          v12 = objc_msgSend(*(id *)(*((void *)&v19 + 1) + 8 * i), "dictionaryRepresentation", (void)v19);
          [v6 addObject:v12];
        }
        uint64_t v9 = [(NSMutableArray *)v7 countByEnumeratingWithState:&v19 objects:v23 count:16];
      }
      while (v9);
    }

    [v3 setObject:v6 forKey:@"subscribedPlayerPaths"];
  }

  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return _MRClientUpdatesConfigurationProtobufReadFrom(self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  char has = (char)self->_has;
  if ((has & 4) != 0)
  {
    PBDataWriterWriteBOOLField();
    char has = (char)self->_has;
    if ((has & 1) == 0)
    {
LABEL_3:
      if ((has & 0x20) == 0) {
        goto LABEL_4;
      }
      goto LABEL_18;
    }
  }
  else if ((*(unsigned char *)&self->_has & 1) == 0)
  {
    goto LABEL_3;
  }
  PBDataWriterWriteBOOLField();
  char has = (char)self->_has;
  if ((has & 0x20) == 0)
  {
LABEL_4:
    if ((has & 2) == 0) {
      goto LABEL_5;
    }
    goto LABEL_19;
  }
LABEL_18:
  PBDataWriterWriteBOOLField();
  char has = (char)self->_has;
  if ((has & 2) == 0)
  {
LABEL_5:
    if ((has & 8) == 0) {
      goto LABEL_6;
    }
    goto LABEL_20;
  }
LABEL_19:
  PBDataWriterWriteBOOLField();
  char has = (char)self->_has;
  if ((has & 8) == 0)
  {
LABEL_6:
    if ((has & 0x10) == 0) {
      goto LABEL_8;
    }
    goto LABEL_7;
  }
LABEL_20:
  PBDataWriterWriteBOOLField();
  if ((*(unsigned char *)&self->_has & 0x10) != 0) {
LABEL_7:
  }
    PBDataWriterWriteBOOLField();
LABEL_8:
  long long v13 = 0u;
  long long v14 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  v6 = self->_subscribedPlayerPaths;
  uint64_t v7 = [(NSMutableArray *)v6 countByEnumeratingWithState:&v11 objects:v15 count:16];
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
        PBDataWriterWriteSubmessage();
      }
      uint64_t v8 = [(NSMutableArray *)v6 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v8);
  }
}

- (void)copyTo:(id)a3
{
  id v4 = a3;
  char has = (char)self->_has;
  if ((has & 4) != 0)
  {
    v4[18] = self->_nowPlayingUpdates;
    v4[24] |= 4u;
    char has = (char)self->_has;
    if ((has & 1) == 0)
    {
LABEL_3:
      if ((has & 0x20) == 0) {
        goto LABEL_4;
      }
      goto LABEL_17;
    }
  }
  else if ((*(unsigned char *)&self->_has & 1) == 0)
  {
    goto LABEL_3;
  }
  v4[16] = self->_artworkUpdates;
  v4[24] |= 1u;
  char has = (char)self->_has;
  if ((has & 0x20) == 0)
  {
LABEL_4:
    if ((has & 2) == 0) {
      goto LABEL_5;
    }
    goto LABEL_18;
  }
LABEL_17:
  v4[21] = self->_volumeUpdates;
  v4[24] |= 0x20u;
  char has = (char)self->_has;
  if ((has & 2) == 0)
  {
LABEL_5:
    if ((has & 8) == 0) {
      goto LABEL_6;
    }
LABEL_19:
    v4[19] = self->_outputDeviceUpdates;
    v4[24] |= 8u;
    if ((*(unsigned char *)&self->_has & 0x10) == 0) {
      goto LABEL_8;
    }
    goto LABEL_7;
  }
LABEL_18:
  v4[17] = self->_keyboardUpdates;
  v4[24] |= 2u;
  char has = (char)self->_has;
  if ((has & 8) != 0) {
    goto LABEL_19;
  }
LABEL_6:
  if ((has & 0x10) != 0)
  {
LABEL_7:
    v4[20] = self->_systemEndpointUpdates;
    v4[24] |= 0x10u;
  }
LABEL_8:
  id v10 = v4;
  if ([(_MRClientUpdatesConfigurationProtobuf *)self subscribedPlayerPathsCount])
  {
    [v10 clearSubscribedPlayerPaths];
    unint64_t v6 = [(_MRClientUpdatesConfigurationProtobuf *)self subscribedPlayerPathsCount];
    if (v6)
    {
      unint64_t v7 = v6;
      for (uint64_t i = 0; i != v7; ++i)
      {
        uint64_t v9 = [(_MRClientUpdatesConfigurationProtobuf *)self subscribedPlayerPathsAtIndex:i];
        [v10 addSubscribedPlayerPaths:v9];
      }
    }
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  v5 = (unsigned char *)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  unint64_t v6 = v5;
  char has = (char)self->_has;
  if ((has & 4) != 0)
  {
    v5[18] = self->_nowPlayingUpdates;
    v5[24] |= 4u;
    char has = (char)self->_has;
    if ((has & 1) == 0)
    {
LABEL_3:
      if ((has & 0x20) == 0) {
        goto LABEL_4;
      }
      goto LABEL_18;
    }
  }
  else if ((*(unsigned char *)&self->_has & 1) == 0)
  {
    goto LABEL_3;
  }
  v5[16] = self->_artworkUpdates;
  v5[24] |= 1u;
  char has = (char)self->_has;
  if ((has & 0x20) == 0)
  {
LABEL_4:
    if ((has & 2) == 0) {
      goto LABEL_5;
    }
    goto LABEL_19;
  }
LABEL_18:
  v5[21] = self->_volumeUpdates;
  v5[24] |= 0x20u;
  char has = (char)self->_has;
  if ((has & 2) == 0)
  {
LABEL_5:
    if ((has & 8) == 0) {
      goto LABEL_6;
    }
    goto LABEL_20;
  }
LABEL_19:
  v5[17] = self->_keyboardUpdates;
  v5[24] |= 2u;
  char has = (char)self->_has;
  if ((has & 8) == 0)
  {
LABEL_6:
    if ((has & 0x10) == 0) {
      goto LABEL_8;
    }
    goto LABEL_7;
  }
LABEL_20:
  v5[19] = self->_outputDeviceUpdates;
  v5[24] |= 8u;
  if ((*(unsigned char *)&self->_has & 0x10) != 0)
  {
LABEL_7:
    v5[20] = self->_systemEndpointUpdates;
    v5[24] |= 0x10u;
  }
LABEL_8:
  long long v17 = 0u;
  long long v18 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  uint64_t v8 = self->_subscribedPlayerPaths;
  uint64_t v9 = [(NSMutableArray *)v8 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v16;
    do
    {
      for (uint64_t i = 0; i != v10; ++i)
      {
        if (*(void *)v16 != v11) {
          objc_enumerationMutation(v8);
        }
        long long v13 = objc_msgSend(*(id *)(*((void *)&v15 + 1) + 8 * i), "copyWithZone:", a3, (void)v15);
        [v6 addSubscribedPlayerPaths:v13];
      }
      uint64_t v10 = [(NSMutableArray *)v8 countByEnumeratingWithState:&v15 objects:v19 count:16];
    }
    while (v10);
  }

  return v6;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_46;
  }
  if ((*(unsigned char *)&self->_has & 4) != 0)
  {
    if ((*((unsigned char *)v4 + 24) & 4) == 0) {
      goto LABEL_46;
    }
    if (self->_nowPlayingUpdates)
    {
      if (!*((unsigned char *)v4 + 18)) {
        goto LABEL_46;
      }
    }
    else if (*((unsigned char *)v4 + 18))
    {
      goto LABEL_46;
    }
  }
  else if ((*((unsigned char *)v4 + 24) & 4) != 0)
  {
    goto LABEL_46;
  }
  if (*(unsigned char *)&self->_has)
  {
    if ((*((unsigned char *)v4 + 24) & 1) == 0) {
      goto LABEL_46;
    }
    if (self->_artworkUpdates)
    {
      if (!*((unsigned char *)v4 + 16)) {
        goto LABEL_46;
      }
    }
    else if (*((unsigned char *)v4 + 16))
    {
      goto LABEL_46;
    }
  }
  else if (*((unsigned char *)v4 + 24))
  {
    goto LABEL_46;
  }
  if ((*(unsigned char *)&self->_has & 0x20) != 0)
  {
    if ((*((unsigned char *)v4 + 24) & 0x20) == 0) {
      goto LABEL_46;
    }
    if (self->_volumeUpdates)
    {
      if (!*((unsigned char *)v4 + 21)) {
        goto LABEL_46;
      }
    }
    else if (*((unsigned char *)v4 + 21))
    {
      goto LABEL_46;
    }
  }
  else if ((*((unsigned char *)v4 + 24) & 0x20) != 0)
  {
    goto LABEL_46;
  }
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    if ((*((unsigned char *)v4 + 24) & 2) == 0) {
      goto LABEL_46;
    }
    if (self->_keyboardUpdates)
    {
      if (!*((unsigned char *)v4 + 17)) {
        goto LABEL_46;
      }
    }
    else if (*((unsigned char *)v4 + 17))
    {
      goto LABEL_46;
    }
  }
  else if ((*((unsigned char *)v4 + 24) & 2) != 0)
  {
    goto LABEL_46;
  }
  if ((*(unsigned char *)&self->_has & 8) != 0)
  {
    if ((*((unsigned char *)v4 + 24) & 8) == 0) {
      goto LABEL_46;
    }
    if (self->_outputDeviceUpdates)
    {
      if (!*((unsigned char *)v4 + 19)) {
        goto LABEL_46;
      }
    }
    else if (*((unsigned char *)v4 + 19))
    {
      goto LABEL_46;
    }
  }
  else if ((*((unsigned char *)v4 + 24) & 8) != 0)
  {
    goto LABEL_46;
  }
  if ((*(unsigned char *)&self->_has & 0x10) == 0)
  {
    if ((*((unsigned char *)v4 + 24) & 0x10) == 0) {
      goto LABEL_52;
    }
LABEL_46:
    char v5 = 0;
    goto LABEL_47;
  }
  if ((*((unsigned char *)v4 + 24) & 0x10) == 0) {
    goto LABEL_46;
  }
  if (!self->_systemEndpointUpdates)
  {
    if (!*((unsigned char *)v4 + 20)) {
      goto LABEL_52;
    }
    goto LABEL_46;
  }
  if (!*((unsigned char *)v4 + 20)) {
    goto LABEL_46;
  }
LABEL_52:
  subscribedPlayerPaths = self->_subscribedPlayerPaths;
  if ((unint64_t)subscribedPlayerPaths | *((void *)v4 + 1)) {
    char v5 = -[NSMutableArray isEqual:](subscribedPlayerPaths, "isEqual:");
  }
  else {
    char v5 = 1;
  }
LABEL_47:

  return v5;
}

- (unint64_t)hash
{
  if ((*(unsigned char *)&self->_has & 4) != 0)
  {
    uint64_t v2 = 2654435761 * self->_nowPlayingUpdates;
    if (*(unsigned char *)&self->_has)
    {
LABEL_3:
      uint64_t v3 = 2654435761 * self->_artworkUpdates;
      if ((*(unsigned char *)&self->_has & 0x20) != 0) {
        goto LABEL_4;
      }
      goto LABEL_10;
    }
  }
  else
  {
    uint64_t v2 = 0;
    if (*(unsigned char *)&self->_has) {
      goto LABEL_3;
    }
  }
  uint64_t v3 = 0;
  if ((*(unsigned char *)&self->_has & 0x20) != 0)
  {
LABEL_4:
    uint64_t v4 = 2654435761 * self->_volumeUpdates;
    if ((*(unsigned char *)&self->_has & 2) != 0) {
      goto LABEL_5;
    }
    goto LABEL_11;
  }
LABEL_10:
  uint64_t v4 = 0;
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
LABEL_5:
    uint64_t v5 = 2654435761 * self->_keyboardUpdates;
    if ((*(unsigned char *)&self->_has & 8) != 0) {
      goto LABEL_6;
    }
LABEL_12:
    uint64_t v6 = 0;
    if ((*(unsigned char *)&self->_has & 0x10) != 0) {
      goto LABEL_7;
    }
LABEL_13:
    uint64_t v7 = 0;
    return v3 ^ v2 ^ v4 ^ v5 ^ v6 ^ v7 ^ [(NSMutableArray *)self->_subscribedPlayerPaths hash];
  }
LABEL_11:
  uint64_t v5 = 0;
  if ((*(unsigned char *)&self->_has & 8) == 0) {
    goto LABEL_12;
  }
LABEL_6:
  uint64_t v6 = 2654435761 * self->_outputDeviceUpdates;
  if ((*(unsigned char *)&self->_has & 0x10) == 0) {
    goto LABEL_13;
  }
LABEL_7:
  uint64_t v7 = 2654435761 * self->_systemEndpointUpdates;
  return v3 ^ v2 ^ v4 ^ v5 ^ v6 ^ v7 ^ [(NSMutableArray *)self->_subscribedPlayerPaths hash];
}

- (void)mergeFrom:(id)a3
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = v4;
  char v6 = *((unsigned char *)v4 + 24);
  if ((v6 & 4) != 0)
  {
    self->_nowPlayingUpdates = *((unsigned char *)v4 + 18);
    *(unsigned char *)&self->_has |= 4u;
    char v6 = *((unsigned char *)v4 + 24);
    if ((v6 & 1) == 0)
    {
LABEL_3:
      if ((v6 & 0x20) == 0) {
        goto LABEL_4;
      }
      goto LABEL_18;
    }
  }
  else if ((*((unsigned char *)v4 + 24) & 1) == 0)
  {
    goto LABEL_3;
  }
  self->_artworkUpdates = *((unsigned char *)v4 + 16);
  *(unsigned char *)&self->_has |= 1u;
  char v6 = *((unsigned char *)v4 + 24);
  if ((v6 & 0x20) == 0)
  {
LABEL_4:
    if ((v6 & 2) == 0) {
      goto LABEL_5;
    }
    goto LABEL_19;
  }
LABEL_18:
  self->_volumeUpdates = *((unsigned char *)v4 + 21);
  *(unsigned char *)&self->_has |= 0x20u;
  char v6 = *((unsigned char *)v4 + 24);
  if ((v6 & 2) == 0)
  {
LABEL_5:
    if ((v6 & 8) == 0) {
      goto LABEL_6;
    }
    goto LABEL_20;
  }
LABEL_19:
  self->_keyboardUpdates = *((unsigned char *)v4 + 17);
  *(unsigned char *)&self->_has |= 2u;
  char v6 = *((unsigned char *)v4 + 24);
  if ((v6 & 8) == 0)
  {
LABEL_6:
    if ((v6 & 0x10) == 0) {
      goto LABEL_8;
    }
    goto LABEL_7;
  }
LABEL_20:
  self->_outputDeviceUpdates = *((unsigned char *)v4 + 19);
  *(unsigned char *)&self->_has |= 8u;
  if ((*((unsigned char *)v4 + 24) & 0x10) != 0)
  {
LABEL_7:
    self->_systemEndpointUpdates = *((unsigned char *)v4 + 20);
    *(unsigned char *)&self->_has |= 0x10u;
  }
LABEL_8:
  long long v14 = 0u;
  long long v15 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  id v7 = *((id *)v4 + 1);
  uint64_t v8 = [v7 countByEnumeratingWithState:&v12 objects:v16 count:16];
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
        -[_MRClientUpdatesConfigurationProtobuf addSubscribedPlayerPaths:](self, "addSubscribedPlayerPaths:", *(void *)(*((void *)&v12 + 1) + 8 * i), (void)v12);
      }
      uint64_t v9 = [v7 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v9);
  }
}

- (BOOL)nowPlayingUpdates
{
  return self->_nowPlayingUpdates;
}

- (BOOL)artworkUpdates
{
  return self->_artworkUpdates;
}

- (BOOL)volumeUpdates
{
  return self->_volumeUpdates;
}

- (BOOL)keyboardUpdates
{
  return self->_keyboardUpdates;
}

- (BOOL)outputDeviceUpdates
{
  return self->_outputDeviceUpdates;
}

- (BOOL)systemEndpointUpdates
{
  return self->_systemEndpointUpdates;
}

- (NSMutableArray)subscribedPlayerPaths
{
  return self->_subscribedPlayerPaths;
}

- (void)setSubscribedPlayerPaths:(id)a3
{
}

- (void).cxx_destruct
{
}

@end