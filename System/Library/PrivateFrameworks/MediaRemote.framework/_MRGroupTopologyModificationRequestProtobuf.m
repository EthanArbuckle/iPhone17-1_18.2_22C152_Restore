@interface _MRGroupTopologyModificationRequestProtobuf
+ (Class)outputDeviceUIDsType;
- (BOOL)fadeAudio;
- (BOOL)hasDetails;
- (BOOL)hasFadeAudio;
- (BOOL)hasMuteUntilFinished;
- (BOOL)hasPassword;
- (BOOL)hasShouldClearPredictedRoutes;
- (BOOL)hasShouldModifyPredictedRoutes;
- (BOOL)hasShouldNotPauseIfLastDeviceRemoved;
- (BOOL)hasSuppressErrorDialog;
- (BOOL)hasType;
- (BOOL)isEqual:(id)a3;
- (BOOL)muteUntilFinished;
- (BOOL)readFrom:(id)a3;
- (BOOL)shouldClearPredictedRoutes;
- (BOOL)shouldModifyPredictedRoutes;
- (BOOL)shouldNotPauseIfLastDeviceRemoved;
- (BOOL)suppressErrorDialog;
- (NSMutableArray)outputDeviceUIDs;
- (NSString)password;
- (_MRRequestDetailsProtobuf)details;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)outputDeviceUIDsAtIndex:(unint64_t)a3;
- (id)typeAsString:(int)a3;
- (int)StringAsType:(id)a3;
- (int)type;
- (unint64_t)hash;
- (unint64_t)outputDeviceUIDsCount;
- (void)addOutputDeviceUIDs:(id)a3;
- (void)clearOutputDeviceUIDs;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setDetails:(id)a3;
- (void)setFadeAudio:(BOOL)a3;
- (void)setHasFadeAudio:(BOOL)a3;
- (void)setHasMuteUntilFinished:(BOOL)a3;
- (void)setHasShouldClearPredictedRoutes:(BOOL)a3;
- (void)setHasShouldModifyPredictedRoutes:(BOOL)a3;
- (void)setHasShouldNotPauseIfLastDeviceRemoved:(BOOL)a3;
- (void)setHasSuppressErrorDialog:(BOOL)a3;
- (void)setHasType:(BOOL)a3;
- (void)setMuteUntilFinished:(BOOL)a3;
- (void)setOutputDeviceUIDs:(id)a3;
- (void)setPassword:(id)a3;
- (void)setShouldClearPredictedRoutes:(BOOL)a3;
- (void)setShouldModifyPredictedRoutes:(BOOL)a3;
- (void)setShouldNotPauseIfLastDeviceRemoved:(BOOL)a3;
- (void)setSuppressErrorDialog:(BOOL)a3;
- (void)setType:(int)a3;
- (void)writeTo:(id)a3;
@end

@implementation _MRGroupTopologyModificationRequestProtobuf

- (BOOL)hasDetails
{
  return self->_details != 0;
}

- (int)type
{
  if (*(unsigned char *)&self->_has) {
    return self->_type;
  }
  else {
    return 0;
  }
}

- (void)setType:(int)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_type = a3;
}

- (void)setHasType:(BOOL)a3
{
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasType
{
  return *(unsigned char *)&self->_has & 1;
}

- (id)typeAsString:(int)a3
{
  if (a3 >= 4)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(void *)&a3);
    v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v3 = off_1E57D7358[a3];
  }

  return v3;
}

- (int)StringAsType:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"Unknown"])
  {
    int v4 = 0;
  }
  else if ([v3 isEqualToString:@"Add"])
  {
    int v4 = 1;
  }
  else if ([v3 isEqualToString:@"Remove"])
  {
    int v4 = 2;
  }
  else if ([v3 isEqualToString:@"Set"])
  {
    int v4 = 3;
  }
  else
  {
    int v4 = 0;
  }

  return v4;
}

- (void)clearOutputDeviceUIDs
{
}

- (void)addOutputDeviceUIDs:(id)a3
{
  id v4 = a3;
  outputDeviceUIDs = self->_outputDeviceUIDs;
  id v8 = v4;
  if (!outputDeviceUIDs)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    v7 = self->_outputDeviceUIDs;
    self->_outputDeviceUIDs = v6;

    id v4 = v8;
    outputDeviceUIDs = self->_outputDeviceUIDs;
  }
  [(NSMutableArray *)outputDeviceUIDs addObject:v4];
}

- (unint64_t)outputDeviceUIDsCount
{
  return [(NSMutableArray *)self->_outputDeviceUIDs count];
}

- (id)outputDeviceUIDsAtIndex:(unint64_t)a3
{
  return (id)[(NSMutableArray *)self->_outputDeviceUIDs objectAtIndex:a3];
}

+ (Class)outputDeviceUIDsType
{
  return (Class)objc_opt_class();
}

- (void)setFadeAudio:(BOOL)a3
{
  *(unsigned char *)&self->_has |= 2u;
  self->_fadeAudio = a3;
}

- (void)setHasFadeAudio:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFD | v3;
}

- (BOOL)hasFadeAudio
{
  return (*(unsigned char *)&self->_has >> 1) & 1;
}

- (BOOL)hasPassword
{
  return self->_password != 0;
}

- (void)setSuppressErrorDialog:(BOOL)a3
{
  *(unsigned char *)&self->_has |= 0x40u;
  self->_suppressErrorDialog = a3;
}

- (void)setHasSuppressErrorDialog:(BOOL)a3
{
  if (a3) {
    char v3 = 64;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xBF | v3;
}

- (BOOL)hasSuppressErrorDialog
{
  return (*(unsigned char *)&self->_has >> 6) & 1;
}

- (void)setShouldNotPauseIfLastDeviceRemoved:(BOOL)a3
{
  *(unsigned char *)&self->_has |= 0x20u;
  self->_shouldNotPauseIfLastDeviceRemoved = a3;
}

- (void)setHasShouldNotPauseIfLastDeviceRemoved:(BOOL)a3
{
  if (a3) {
    char v3 = 32;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xDF | v3;
}

- (BOOL)hasShouldNotPauseIfLastDeviceRemoved
{
  return (*(unsigned char *)&self->_has >> 5) & 1;
}

- (void)setMuteUntilFinished:(BOOL)a3
{
  *(unsigned char *)&self->_has |= 4u;
  self->_muteUntilFinished = a3;
}

- (void)setHasMuteUntilFinished:(BOOL)a3
{
  if (a3) {
    char v3 = 4;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFB | v3;
}

- (BOOL)hasMuteUntilFinished
{
  return (*(unsigned char *)&self->_has >> 2) & 1;
}

- (void)setShouldModifyPredictedRoutes:(BOOL)a3
{
  *(unsigned char *)&self->_has |= 0x10u;
  self->_shouldModifyPredictedRoutes = a3;
}

- (void)setHasShouldModifyPredictedRoutes:(BOOL)a3
{
  if (a3) {
    char v3 = 16;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xEF | v3;
}

- (BOOL)hasShouldModifyPredictedRoutes
{
  return (*(unsigned char *)&self->_has >> 4) & 1;
}

- (void)setShouldClearPredictedRoutes:(BOOL)a3
{
  *(unsigned char *)&self->_has |= 8u;
  self->_shouldClearPredictedRoutes = a3;
}

- (void)setHasShouldClearPredictedRoutes:(BOOL)a3
{
  if (a3) {
    char v3 = 8;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xF7 | v3;
}

- (BOOL)hasShouldClearPredictedRoutes
{
  return (*(unsigned char *)&self->_has >> 3) & 1;
}

- (id)description
{
  char v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)_MRGroupTopologyModificationRequestProtobuf;
  id v4 = [(_MRGroupTopologyModificationRequestProtobuf *)&v8 description];
  v5 = [(_MRGroupTopologyModificationRequestProtobuf *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  char v3 = [MEMORY[0x1E4F1CA60] dictionary];
  details = self->_details;
  if (details)
  {
    v5 = [(_MRRequestDetailsProtobuf *)details dictionaryRepresentation];
    [v3 setObject:v5 forKey:@"details"];
  }
  if (*(unsigned char *)&self->_has)
  {
    uint64_t type = self->_type;
    if (type >= 4)
    {
      objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", self->_type);
      v7 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v7 = off_1E57D7358[type];
    }
    [v3 setObject:v7 forKey:@"type"];
  }
  outputDeviceUIDs = self->_outputDeviceUIDs;
  if (outputDeviceUIDs) {
    [v3 setObject:outputDeviceUIDs forKey:@"outputDeviceUIDs"];
  }
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    v9 = [NSNumber numberWithBool:self->_fadeAudio];
    [v3 setObject:v9 forKey:@"fadeAudio"];
  }
  password = self->_password;
  if (password) {
    [v3 setObject:password forKey:@"password"];
  }
  char has = (char)self->_has;
  if ((has & 0x40) != 0)
  {
    v14 = [NSNumber numberWithBool:self->_suppressErrorDialog];
    [v3 setObject:v14 forKey:@"suppressErrorDialog"];

    char has = (char)self->_has;
    if ((has & 0x20) == 0)
    {
LABEL_16:
      if ((has & 4) == 0) {
        goto LABEL_17;
      }
      goto LABEL_25;
    }
  }
  else if ((*(unsigned char *)&self->_has & 0x20) == 0)
  {
    goto LABEL_16;
  }
  v15 = [NSNumber numberWithBool:self->_shouldNotPauseIfLastDeviceRemoved];
  [v3 setObject:v15 forKey:@"shouldNotPauseIfLastDeviceRemoved"];

  char has = (char)self->_has;
  if ((has & 4) == 0)
  {
LABEL_17:
    if ((has & 0x10) == 0) {
      goto LABEL_18;
    }
    goto LABEL_26;
  }
LABEL_25:
  v16 = [NSNumber numberWithBool:self->_muteUntilFinished];
  [v3 setObject:v16 forKey:@"muteUntilFinished"];

  char has = (char)self->_has;
  if ((has & 0x10) == 0)
  {
LABEL_18:
    if ((has & 8) == 0) {
      goto LABEL_20;
    }
    goto LABEL_19;
  }
LABEL_26:
  v17 = [NSNumber numberWithBool:self->_shouldModifyPredictedRoutes];
  [v3 setObject:v17 forKey:@"shouldModifyPredictedRoutes"];

  if ((*(unsigned char *)&self->_has & 8) != 0)
  {
LABEL_19:
    v12 = [NSNumber numberWithBool:self->_shouldClearPredictedRoutes];
    [v3 setObject:v12 forKey:@"shouldClearPredictedRoutes"];
  }
LABEL_20:

  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return _MRGroupTopologyModificationRequestProtobufReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (self->_details) {
    PBDataWriterWriteSubmessage();
  }
  if (*(unsigned char *)&self->_has) {
    PBDataWriterWriteInt32Field();
  }
  long long v13 = 0u;
  long long v14 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  v5 = self->_outputDeviceUIDs;
  uint64_t v6 = [(NSMutableArray *)v5 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v12;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v12 != v8) {
          objc_enumerationMutation(v5);
        }
        PBDataWriterWriteStringField();
      }
      uint64_t v7 = [(NSMutableArray *)v5 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v7);
  }

  if ((*(unsigned char *)&self->_has & 2) != 0) {
    PBDataWriterWriteBOOLField();
  }
  if (self->_password) {
    PBDataWriterWriteStringField();
  }
  char has = (char)self->_has;
  if ((has & 0x40) != 0)
  {
    PBDataWriterWriteBOOLField();
    char has = (char)self->_has;
    if ((has & 0x20) == 0)
    {
LABEL_18:
      if ((has & 4) == 0) {
        goto LABEL_19;
      }
      goto LABEL_25;
    }
  }
  else if ((*(unsigned char *)&self->_has & 0x20) == 0)
  {
    goto LABEL_18;
  }
  PBDataWriterWriteBOOLField();
  char has = (char)self->_has;
  if ((has & 4) == 0)
  {
LABEL_19:
    if ((has & 0x10) == 0) {
      goto LABEL_20;
    }
LABEL_26:
    PBDataWriterWriteBOOLField();
    if ((*(unsigned char *)&self->_has & 8) == 0) {
      goto LABEL_22;
    }
    goto LABEL_21;
  }
LABEL_25:
  PBDataWriterWriteBOOLField();
  char has = (char)self->_has;
  if ((has & 0x10) != 0) {
    goto LABEL_26;
  }
LABEL_20:
  if ((has & 8) != 0) {
LABEL_21:
  }
    PBDataWriterWriteBOOLField();
LABEL_22:
}

- (void)copyTo:(id)a3
{
  id v4 = a3;
  long long v11 = v4;
  if (self->_details)
  {
    objc_msgSend(v4, "setDetails:");
    id v4 = v11;
  }
  if (*(unsigned char *)&self->_has)
  {
    *((_DWORD *)v4 + 8) = self->_type;
    v4[44] |= 1u;
  }
  if ([(_MRGroupTopologyModificationRequestProtobuf *)self outputDeviceUIDsCount])
  {
    [v11 clearOutputDeviceUIDs];
    unint64_t v5 = [(_MRGroupTopologyModificationRequestProtobuf *)self outputDeviceUIDsCount];
    if (v5)
    {
      unint64_t v6 = v5;
      for (uint64_t i = 0; i != v6; ++i)
      {
        uint64_t v8 = [(_MRGroupTopologyModificationRequestProtobuf *)self outputDeviceUIDsAtIndex:i];
        [v11 addOutputDeviceUIDs:v8];
      }
    }
  }
  v9 = v11;
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    v11[36] = self->_fadeAudio;
    v11[44] |= 2u;
  }
  if (self->_password)
  {
    objc_msgSend(v11, "setPassword:");
    v9 = v11;
  }
  char has = (char)self->_has;
  if ((has & 0x40) != 0)
  {
    v9[41] = self->_suppressErrorDialog;
    v9[44] |= 0x40u;
    char has = (char)self->_has;
    if ((has & 0x20) == 0)
    {
LABEL_15:
      if ((has & 4) == 0) {
        goto LABEL_16;
      }
      goto LABEL_24;
    }
  }
  else if ((*(unsigned char *)&self->_has & 0x20) == 0)
  {
    goto LABEL_15;
  }
  v9[40] = self->_shouldNotPauseIfLastDeviceRemoved;
  v9[44] |= 0x20u;
  char has = (char)self->_has;
  if ((has & 4) == 0)
  {
LABEL_16:
    if ((has & 0x10) == 0) {
      goto LABEL_17;
    }
    goto LABEL_25;
  }
LABEL_24:
  v9[37] = self->_muteUntilFinished;
  v9[44] |= 4u;
  char has = (char)self->_has;
  if ((has & 0x10) == 0)
  {
LABEL_17:
    if ((has & 8) == 0) {
      goto LABEL_19;
    }
    goto LABEL_18;
  }
LABEL_25:
  v9[39] = self->_shouldModifyPredictedRoutes;
  v9[44] |= 0x10u;
  if ((*(unsigned char *)&self->_has & 8) != 0)
  {
LABEL_18:
    v9[38] = self->_shouldClearPredictedRoutes;
    v9[44] |= 8u;
  }
LABEL_19:
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  id v6 = [(_MRRequestDetailsProtobuf *)self->_details copyWithZone:a3];
  uint64_t v7 = *(void **)(v5 + 8);
  *(void *)(v5 + 8) = v6;

  if (*(unsigned char *)&self->_has)
  {
    *(_DWORD *)(v5 + 32) = self->_type;
    *(unsigned char *)(v5 + 44) |= 1u;
  }
  long long v20 = 0u;
  long long v21 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  uint64_t v8 = self->_outputDeviceUIDs;
  uint64_t v9 = [(NSMutableArray *)v8 countByEnumeratingWithState:&v18 objects:v22 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v19;
    do
    {
      for (uint64_t i = 0; i != v10; ++i)
      {
        if (*(void *)v19 != v11) {
          objc_enumerationMutation(v8);
        }
        long long v13 = objc_msgSend(*(id *)(*((void *)&v18 + 1) + 8 * i), "copyWithZone:", a3, (void)v18);
        [(id)v5 addOutputDeviceUIDs:v13];
      }
      uint64_t v10 = [(NSMutableArray *)v8 countByEnumeratingWithState:&v18 objects:v22 count:16];
    }
    while (v10);
  }

  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    *(unsigned char *)(v5 + 36) = self->_fadeAudio;
    *(unsigned char *)(v5 + 44) |= 2u;
  }
  uint64_t v14 = -[NSString copyWithZone:](self->_password, "copyWithZone:", a3, (void)v18);
  v15 = *(void **)(v5 + 24);
  *(void *)(v5 + 24) = v14;

  char has = (char)self->_has;
  if ((has & 0x40) != 0)
  {
    *(unsigned char *)(v5 + 41) = self->_suppressErrorDialog;
    *(unsigned char *)(v5 + 44) |= 0x40u;
    char has = (char)self->_has;
    if ((has & 0x20) == 0)
    {
LABEL_14:
      if ((has & 4) == 0) {
        goto LABEL_15;
      }
      goto LABEL_21;
    }
  }
  else if ((*(unsigned char *)&self->_has & 0x20) == 0)
  {
    goto LABEL_14;
  }
  *(unsigned char *)(v5 + 40) = self->_shouldNotPauseIfLastDeviceRemoved;
  *(unsigned char *)(v5 + 44) |= 0x20u;
  char has = (char)self->_has;
  if ((has & 4) == 0)
  {
LABEL_15:
    if ((has & 0x10) == 0) {
      goto LABEL_16;
    }
LABEL_22:
    *(unsigned char *)(v5 + 39) = self->_shouldModifyPredictedRoutes;
    *(unsigned char *)(v5 + 44) |= 0x10u;
    if ((*(unsigned char *)&self->_has & 8) == 0) {
      return (id)v5;
    }
    goto LABEL_17;
  }
LABEL_21:
  *(unsigned char *)(v5 + 37) = self->_muteUntilFinished;
  *(unsigned char *)(v5 + 44) |= 4u;
  char has = (char)self->_has;
  if ((has & 0x10) != 0) {
    goto LABEL_22;
  }
LABEL_16:
  if ((has & 8) != 0)
  {
LABEL_17:
    *(unsigned char *)(v5 + 38) = self->_shouldClearPredictedRoutes;
    *(unsigned char *)(v5 + 44) |= 8u;
  }
  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_57;
  }
  details = self->_details;
  if ((unint64_t)details | *((void *)v4 + 1))
  {
    if (!-[_MRRequestDetailsProtobuf isEqual:](details, "isEqual:")) {
      goto LABEL_57;
    }
  }
  char has = (char)self->_has;
  if (has)
  {
    if ((*((unsigned char *)v4 + 44) & 1) == 0 || self->_type != *((_DWORD *)v4 + 8)) {
      goto LABEL_57;
    }
  }
  else if (*((unsigned char *)v4 + 44))
  {
    goto LABEL_57;
  }
  outputDeviceUIDs = self->_outputDeviceUIDs;
  if ((unint64_t)outputDeviceUIDs | *((void *)v4 + 2))
  {
    if (!-[NSMutableArray isEqual:](outputDeviceUIDs, "isEqual:")) {
      goto LABEL_57;
    }
    char has = (char)self->_has;
  }
  if ((has & 2) != 0)
  {
    if ((*((unsigned char *)v4 + 44) & 2) == 0) {
      goto LABEL_57;
    }
    if (self->_fadeAudio)
    {
      if (!*((unsigned char *)v4 + 36)) {
        goto LABEL_57;
      }
    }
    else if (*((unsigned char *)v4 + 36))
    {
      goto LABEL_57;
    }
  }
  else if ((*((unsigned char *)v4 + 44) & 2) != 0)
  {
    goto LABEL_57;
  }
  password = self->_password;
  if ((unint64_t)password | *((void *)v4 + 3))
  {
    if (!-[NSString isEqual:](password, "isEqual:")) {
      goto LABEL_57;
    }
    char has = (char)self->_has;
  }
  if ((has & 0x40) != 0)
  {
    if ((*((unsigned char *)v4 + 44) & 0x40) == 0) {
      goto LABEL_57;
    }
    if (self->_suppressErrorDialog)
    {
      if (!*((unsigned char *)v4 + 41)) {
        goto LABEL_57;
      }
    }
    else if (*((unsigned char *)v4 + 41))
    {
      goto LABEL_57;
    }
  }
  else if ((*((unsigned char *)v4 + 44) & 0x40) != 0)
  {
    goto LABEL_57;
  }
  if ((has & 0x20) != 0)
  {
    if ((*((unsigned char *)v4 + 44) & 0x20) == 0) {
      goto LABEL_57;
    }
    if (self->_shouldNotPauseIfLastDeviceRemoved)
    {
      if (!*((unsigned char *)v4 + 40)) {
        goto LABEL_57;
      }
    }
    else if (*((unsigned char *)v4 + 40))
    {
      goto LABEL_57;
    }
  }
  else if ((*((unsigned char *)v4 + 44) & 0x20) != 0)
  {
    goto LABEL_57;
  }
  if ((has & 4) != 0)
  {
    if ((*((unsigned char *)v4 + 44) & 4) == 0) {
      goto LABEL_57;
    }
    if (self->_muteUntilFinished)
    {
      if (!*((unsigned char *)v4 + 37)) {
        goto LABEL_57;
      }
    }
    else if (*((unsigned char *)v4 + 37))
    {
      goto LABEL_57;
    }
  }
  else if ((*((unsigned char *)v4 + 44) & 4) != 0)
  {
    goto LABEL_57;
  }
  if ((has & 0x10) != 0)
  {
    if ((*((unsigned char *)v4 + 44) & 0x10) == 0) {
      goto LABEL_57;
    }
    if (self->_shouldModifyPredictedRoutes)
    {
      if (!*((unsigned char *)v4 + 39)) {
        goto LABEL_57;
      }
    }
    else if (*((unsigned char *)v4 + 39))
    {
      goto LABEL_57;
    }
  }
  else if ((*((unsigned char *)v4 + 44) & 0x10) != 0)
  {
    goto LABEL_57;
  }
  BOOL v9 = (*((unsigned char *)v4 + 44) & 8) == 0;
  if ((has & 8) != 0)
  {
    if ((*((unsigned char *)v4 + 44) & 8) != 0)
    {
      if (self->_shouldClearPredictedRoutes)
      {
        if (!*((unsigned char *)v4 + 38)) {
          goto LABEL_57;
        }
      }
      else if (*((unsigned char *)v4 + 38))
      {
        goto LABEL_57;
      }
      BOOL v9 = 1;
      goto LABEL_58;
    }
LABEL_57:
    BOOL v9 = 0;
  }
LABEL_58:

  return v9;
}

- (unint64_t)hash
{
  unint64_t v3 = [(_MRRequestDetailsProtobuf *)self->_details hash];
  if (*(unsigned char *)&self->_has) {
    uint64_t v4 = 2654435761 * self->_type;
  }
  else {
    uint64_t v4 = 0;
  }
  uint64_t v5 = [(NSMutableArray *)self->_outputDeviceUIDs hash];
  if ((*(unsigned char *)&self->_has & 2) != 0) {
    uint64_t v6 = 2654435761 * self->_fadeAudio;
  }
  else {
    uint64_t v6 = 0;
  }
  NSUInteger v7 = [(NSString *)self->_password hash];
  if ((*(unsigned char *)&self->_has & 0x40) != 0)
  {
    uint64_t v8 = 2654435761 * self->_suppressErrorDialog;
    if ((*(unsigned char *)&self->_has & 0x20) != 0)
    {
LABEL_9:
      uint64_t v9 = 2654435761 * self->_shouldNotPauseIfLastDeviceRemoved;
      if ((*(unsigned char *)&self->_has & 4) != 0) {
        goto LABEL_10;
      }
      goto LABEL_15;
    }
  }
  else
  {
    uint64_t v8 = 0;
    if ((*(unsigned char *)&self->_has & 0x20) != 0) {
      goto LABEL_9;
    }
  }
  uint64_t v9 = 0;
  if ((*(unsigned char *)&self->_has & 4) != 0)
  {
LABEL_10:
    uint64_t v10 = 2654435761 * self->_muteUntilFinished;
    if ((*(unsigned char *)&self->_has & 0x10) != 0) {
      goto LABEL_11;
    }
LABEL_16:
    uint64_t v11 = 0;
    if ((*(unsigned char *)&self->_has & 8) != 0) {
      goto LABEL_12;
    }
LABEL_17:
    uint64_t v12 = 0;
    return v4 ^ v3 ^ v5 ^ v6 ^ v7 ^ v8 ^ v9 ^ v10 ^ v11 ^ v12;
  }
LABEL_15:
  uint64_t v10 = 0;
  if ((*(unsigned char *)&self->_has & 0x10) == 0) {
    goto LABEL_16;
  }
LABEL_11:
  uint64_t v11 = 2654435761 * self->_shouldModifyPredictedRoutes;
  if ((*(unsigned char *)&self->_has & 8) == 0) {
    goto LABEL_17;
  }
LABEL_12:
  uint64_t v12 = 2654435761 * self->_shouldClearPredictedRoutes;
  return v4 ^ v3 ^ v5 ^ v6 ^ v7 ^ v8 ^ v9 ^ v10 ^ v11 ^ v12;
}

- (void)mergeFrom:(id)a3
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  details = self->_details;
  uint64_t v6 = *((void *)v4 + 1);
  if (details)
  {
    if (v6) {
      -[_MRRequestDetailsProtobuf mergeFrom:](details, "mergeFrom:");
    }
  }
  else if (v6)
  {
    -[_MRGroupTopologyModificationRequestProtobuf setDetails:](self, "setDetails:");
  }
  if (*((unsigned char *)v4 + 44))
  {
    self->_uint64_t type = *((_DWORD *)v4 + 8);
    *(unsigned char *)&self->_has |= 1u;
  }
  long long v15 = 0u;
  long long v16 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  id v7 = *((id *)v4 + 2);
  uint64_t v8 = [v7 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v14;
    do
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v14 != v10) {
          objc_enumerationMutation(v7);
        }
        -[_MRGroupTopologyModificationRequestProtobuf addOutputDeviceUIDs:](self, "addOutputDeviceUIDs:", *(void *)(*((void *)&v13 + 1) + 8 * i), (void)v13);
      }
      uint64_t v9 = [v7 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v9);
  }

  if ((*((unsigned char *)v4 + 44) & 2) != 0)
  {
    self->_fadeAudio = *((unsigned char *)v4 + 36);
    *(unsigned char *)&self->_has |= 2u;
  }
  if (*((void *)v4 + 3)) {
    -[_MRGroupTopologyModificationRequestProtobuf setPassword:](self, "setPassword:");
  }
  char v12 = *((unsigned char *)v4 + 44);
  if ((v12 & 0x40) != 0)
  {
    self->_suppressErrorDialog = *((unsigned char *)v4 + 41);
    *(unsigned char *)&self->_has |= 0x40u;
    char v12 = *((unsigned char *)v4 + 44);
    if ((v12 & 0x20) == 0)
    {
LABEL_21:
      if ((v12 & 4) == 0) {
        goto LABEL_22;
      }
      goto LABEL_28;
    }
  }
  else if ((*((unsigned char *)v4 + 44) & 0x20) == 0)
  {
    goto LABEL_21;
  }
  self->_shouldNotPauseIfLastDeviceRemoved = *((unsigned char *)v4 + 40);
  *(unsigned char *)&self->_has |= 0x20u;
  char v12 = *((unsigned char *)v4 + 44);
  if ((v12 & 4) == 0)
  {
LABEL_22:
    if ((v12 & 0x10) == 0) {
      goto LABEL_23;
    }
LABEL_29:
    self->_shouldModifyPredictedRoutes = *((unsigned char *)v4 + 39);
    *(unsigned char *)&self->_has |= 0x10u;
    if ((*((unsigned char *)v4 + 44) & 8) == 0) {
      goto LABEL_25;
    }
    goto LABEL_24;
  }
LABEL_28:
  self->_muteUntilFinished = *((unsigned char *)v4 + 37);
  *(unsigned char *)&self->_has |= 4u;
  char v12 = *((unsigned char *)v4 + 44);
  if ((v12 & 0x10) != 0) {
    goto LABEL_29;
  }
LABEL_23:
  if ((v12 & 8) != 0)
  {
LABEL_24:
    self->_shouldClearPredictedRoutes = *((unsigned char *)v4 + 38);
    *(unsigned char *)&self->_has |= 8u;
  }
LABEL_25:
}

- (_MRRequestDetailsProtobuf)details
{
  return self->_details;
}

- (void)setDetails:(id)a3
{
}

- (NSMutableArray)outputDeviceUIDs
{
  return self->_outputDeviceUIDs;
}

- (void)setOutputDeviceUIDs:(id)a3
{
}

- (BOOL)fadeAudio
{
  return self->_fadeAudio;
}

- (NSString)password
{
  return self->_password;
}

- (void)setPassword:(id)a3
{
}

- (BOOL)suppressErrorDialog
{
  return self->_suppressErrorDialog;
}

- (BOOL)shouldNotPauseIfLastDeviceRemoved
{
  return self->_shouldNotPauseIfLastDeviceRemoved;
}

- (BOOL)muteUntilFinished
{
  return self->_muteUntilFinished;
}

- (BOOL)shouldModifyPredictedRoutes
{
  return self->_shouldModifyPredictedRoutes;
}

- (BOOL)shouldClearPredictedRoutes
{
  return self->_shouldClearPredictedRoutes;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_password, 0);
  objc_storeStrong((id *)&self->_outputDeviceUIDs, 0);

  objc_storeStrong((id *)&self->_details, 0);
}

@end