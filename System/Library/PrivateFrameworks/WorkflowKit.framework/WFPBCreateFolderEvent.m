@interface WFPBCreateFolderEvent
- (BOOL)hasFolderSource;
- (BOOL)hasIcon;
- (BOOL)hasKey;
- (BOOL)hasShortcutCount;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSString)folderSource;
- (NSString)key;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (unint64_t)hash;
- (unsigned)icon;
- (unsigned)shortcutCount;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setFolderSource:(id)a3;
- (void)setHasIcon:(BOOL)a3;
- (void)setHasShortcutCount:(BOOL)a3;
- (void)setIcon:(unsigned int)a3;
- (void)setKey:(id)a3;
- (void)setShortcutCount:(unsigned int)a3;
- (void)writeTo:(id)a3;
@end

@implementation WFPBCreateFolderEvent

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_key, 0);
  objc_storeStrong((id *)&self->_folderSource, 0);
}

- (void)setFolderSource:(id)a3
{
}

- (NSString)folderSource
{
  return self->_folderSource;
}

- (unsigned)shortcutCount
{
  return self->_shortcutCount;
}

- (unsigned)icon
{
  return self->_icon;
}

- (void)setKey:(id)a3
{
}

- (void)mergeFrom:(id)a3
{
  v4 = (unsigned int *)a3;
  v6 = v4;
  if (*((void *)v4 + 3))
  {
    -[WFPBCreateFolderEvent setKey:](self, "setKey:");
    v4 = v6;
  }
  char v5 = *((unsigned char *)v4 + 36);
  if (v5)
  {
    self->_icon = v4[4];
    *(unsigned char *)&self->_has |= 1u;
    char v5 = *((unsigned char *)v4 + 36);
  }
  if ((v5 & 2) != 0)
  {
    self->_shortcutCount = v4[8];
    *(unsigned char *)&self->_has |= 2u;
  }
  if (*((void *)v4 + 1))
  {
    -[WFPBCreateFolderEvent setFolderSource:](self, "setFolderSource:");
    v4 = v6;
  }
}

- (unint64_t)hash
{
  NSUInteger v3 = [(NSString *)self->_key hash];
  if (*(unsigned char *)&self->_has)
  {
    uint64_t v4 = 2654435761 * self->_icon;
    if ((*(unsigned char *)&self->_has & 2) != 0) {
      goto LABEL_3;
    }
LABEL_5:
    uint64_t v5 = 0;
    return v4 ^ v3 ^ v5 ^ [(NSString *)self->_folderSource hash];
  }
  uint64_t v4 = 0;
  if ((*(unsigned char *)&self->_has & 2) == 0) {
    goto LABEL_5;
  }
LABEL_3:
  uint64_t v5 = 2654435761 * self->_shortcutCount;
  return v4 ^ v3 ^ v5 ^ [(NSString *)self->_folderSource hash];
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_16;
  }
  key = self->_key;
  if ((unint64_t)key | *((void *)v4 + 3))
  {
    if (!-[NSString isEqual:](key, "isEqual:")) {
      goto LABEL_16;
    }
  }
  if (*(unsigned char *)&self->_has)
  {
    if ((*((unsigned char *)v4 + 36) & 1) == 0 || self->_icon != *((_DWORD *)v4 + 4)) {
      goto LABEL_16;
    }
  }
  else if (*((unsigned char *)v4 + 36))
  {
LABEL_16:
    char v7 = 0;
    goto LABEL_17;
  }
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    if ((*((unsigned char *)v4 + 36) & 2) == 0 || self->_shortcutCount != *((_DWORD *)v4 + 8)) {
      goto LABEL_16;
    }
  }
  else if ((*((unsigned char *)v4 + 36) & 2) != 0)
  {
    goto LABEL_16;
  }
  folderSource = self->_folderSource;
  if ((unint64_t)folderSource | *((void *)v4 + 1)) {
    char v7 = -[NSString isEqual:](folderSource, "isEqual:");
  }
  else {
    char v7 = 1;
  }
LABEL_17:

  return v7;
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  uint64_t v6 = [(NSString *)self->_key copyWithZone:a3];
  char v7 = *(void **)(v5 + 24);
  *(void *)(v5 + 24) = v6;

  char has = (char)self->_has;
  if (has)
  {
    *(_DWORD *)(v5 + 16) = self->_icon;
    *(unsigned char *)(v5 + 36) |= 1u;
    char has = (char)self->_has;
  }
  if ((has & 2) != 0)
  {
    *(_DWORD *)(v5 + 32) = self->_shortcutCount;
    *(unsigned char *)(v5 + 36) |= 2u;
  }
  uint64_t v9 = [(NSString *)self->_folderSource copyWithZone:a3];
  v10 = *(void **)(v5 + 8);
  *(void *)(v5 + 8) = v9;

  return (id)v5;
}

- (void)copyTo:(id)a3
{
  id v4 = a3;
  id v6 = v4;
  if (self->_key)
  {
    objc_msgSend(v4, "setKey:");
    id v4 = v6;
  }
  char has = (char)self->_has;
  if (has)
  {
    *((_DWORD *)v4 + 4) = self->_icon;
    *((unsigned char *)v4 + 36) |= 1u;
    char has = (char)self->_has;
  }
  if ((has & 2) != 0)
  {
    *((_DWORD *)v4 + 8) = self->_shortcutCount;
    *((unsigned char *)v4 + 36) |= 2u;
  }
  if (self->_folderSource)
  {
    objc_msgSend(v6, "setFolderSource:");
    id v4 = v6;
  }
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  id v6 = v4;
  if (self->_key)
  {
    PBDataWriterWriteStringField();
    id v4 = v6;
  }
  char has = (char)self->_has;
  if (has)
  {
    PBDataWriterWriteUint32Field();
    id v4 = v6;
    char has = (char)self->_has;
  }
  if ((has & 2) != 0)
  {
    PBDataWriterWriteUint32Field();
    id v4 = v6;
  }
  if (self->_folderSource)
  {
    PBDataWriterWriteStringField();
    id v4 = v6;
  }
}

- (BOOL)readFrom:(id)a3
{
  return WFPBCreateFolderEventReadFrom((uint64_t)self, (uint64_t)a3);
}

- (id)dictionaryRepresentation
{
  NSUInteger v3 = [MEMORY[0x1E4F1CA60] dictionary];
  id v4 = v3;
  key = self->_key;
  if (key) {
    [v3 setObject:key forKey:@"key"];
  }
  char has = (char)self->_has;
  if (has)
  {
    char v7 = [NSNumber numberWithUnsignedInt:self->_icon];
    [v4 setObject:v7 forKey:@"icon"];

    char has = (char)self->_has;
  }
  if ((has & 2) != 0)
  {
    v8 = [NSNumber numberWithUnsignedInt:self->_shortcutCount];
    [v4 setObject:v8 forKey:@"shortcutCount"];
  }
  folderSource = self->_folderSource;
  if (folderSource) {
    [v4 setObject:folderSource forKey:@"folderSource"];
  }
  return v4;
}

- (id)description
{
  NSUInteger v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)WFPBCreateFolderEvent;
  id v4 = [(WFPBCreateFolderEvent *)&v8 description];
  uint64_t v5 = [(WFPBCreateFolderEvent *)self dictionaryRepresentation];
  id v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (BOOL)hasFolderSource
{
  return self->_folderSource != 0;
}

- (BOOL)hasShortcutCount
{
  return (*(unsigned char *)&self->_has >> 1) & 1;
}

- (void)setHasShortcutCount:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xFD | v3;
}

- (void)setShortcutCount:(unsigned int)a3
{
  *(unsigned char *)&self->_has |= 2u;
  self->_shortcutCount = a3;
}

- (BOOL)hasIcon
{
  return *(unsigned char *)&self->_has & 1;
}

- (void)setHasIcon:(BOOL)a3
{
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (void)setIcon:(unsigned int)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_icon = a3;
}

- (BOOL)hasKey
{
  return self->_key != 0;
}

- (NSString)key
{
  if (self->_key) {
    return self->_key;
  }
  else {
    return (NSString *)@"CreateFolderEvent";
  }
}

@end