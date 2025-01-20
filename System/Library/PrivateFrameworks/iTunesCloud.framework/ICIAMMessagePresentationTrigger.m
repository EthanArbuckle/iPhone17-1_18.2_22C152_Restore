@interface ICIAMMessagePresentationTrigger
- (BOOL)hasBundleIdentifier;
- (BOOL)hasKind;
- (BOOL)hasTriggerName;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSString)bundleIdentifier;
- (NSString)triggerName;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)kindAsString:(int)a3;
- (int)StringAsKind:(id)a3;
- (int)kind;
- (unint64_t)hash;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setBundleIdentifier:(id)a3;
- (void)setHasKind:(BOOL)a3;
- (void)setKind:(int)a3;
- (void)setTriggerName:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation ICIAMMessagePresentationTrigger

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_triggerName, 0);

  objc_storeStrong((id *)&self->_bundleIdentifier, 0);
}

- (void)setBundleIdentifier:(id)a3
{
}

- (NSString)bundleIdentifier
{
  return self->_bundleIdentifier;
}

- (void)setTriggerName:(id)a3
{
}

- (NSString)triggerName
{
  return self->_triggerName;
}

- (void)mergeFrom:(id)a3
{
  v4 = (int *)a3;
  v5 = v4;
  if (*((void *)v4 + 3))
  {
    -[ICIAMMessagePresentationTrigger setTriggerName:](self, "setTriggerName:");
    v4 = v5;
  }
  if (v4[8])
  {
    self->_kind = v4[4];
    *(unsigned char *)&self->_has |= 1u;
  }
  if (*((void *)v4 + 1))
  {
    -[ICIAMMessagePresentationTrigger setBundleIdentifier:](self, "setBundleIdentifier:");
    v4 = v5;
  }
}

- (unint64_t)hash
{
  NSUInteger v3 = [(NSString *)self->_triggerName hash];
  if (*(unsigned char *)&self->_has) {
    uint64_t v4 = 2654435761 * self->_kind;
  }
  else {
    uint64_t v4 = 0;
  }
  return v4 ^ v3 ^ [(NSString *)self->_bundleIdentifier hash];
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_11;
  }
  triggerName = self->_triggerName;
  if ((unint64_t)triggerName | *((void *)v4 + 3))
  {
    if (!-[NSString isEqual:](triggerName, "isEqual:")) {
      goto LABEL_11;
    }
  }
  if (*(unsigned char *)&self->_has)
  {
    if ((*((unsigned char *)v4 + 32) & 1) == 0 || self->_kind != *((_DWORD *)v4 + 4)) {
      goto LABEL_11;
    }
  }
  else if (*((unsigned char *)v4 + 32))
  {
LABEL_11:
    char v7 = 0;
    goto LABEL_12;
  }
  bundleIdentifier = self->_bundleIdentifier;
  if ((unint64_t)bundleIdentifier | *((void *)v4 + 1)) {
    char v7 = -[NSString isEqual:](bundleIdentifier, "isEqual:");
  }
  else {
    char v7 = 1;
  }
LABEL_12:

  return v7;
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  uint64_t v6 = [(NSString *)self->_triggerName copyWithZone:a3];
  char v7 = *(void **)(v5 + 24);
  *(void *)(v5 + 24) = v6;

  if (*(unsigned char *)&self->_has)
  {
    *(_DWORD *)(v5 + 16) = self->_kind;
    *(unsigned char *)(v5 + 32) |= 1u;
  }
  uint64_t v8 = [(NSString *)self->_bundleIdentifier copyWithZone:a3];
  v9 = *(void **)(v5 + 8);
  *(void *)(v5 + 8) = v8;

  return (id)v5;
}

- (void)copyTo:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (self->_triggerName)
  {
    objc_msgSend(v4, "setTriggerName:");
    id v4 = v5;
  }
  if (*(unsigned char *)&self->_has)
  {
    *((_DWORD *)v4 + 4) = self->_kind;
    *((unsigned char *)v4 + 32) |= 1u;
  }
  if (self->_bundleIdentifier)
  {
    objc_msgSend(v5, "setBundleIdentifier:");
    id v4 = v5;
  }
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (self->_triggerName)
  {
    PBDataWriterWriteStringField();
    id v4 = v5;
  }
  if (*(unsigned char *)&self->_has)
  {
    PBDataWriterWriteInt32Field();
    id v4 = v5;
  }
  if (self->_bundleIdentifier)
  {
    PBDataWriterWriteStringField();
    id v4 = v5;
  }
}

- (BOOL)readFrom:(id)a3
{
  return ICIAMMessagePresentationTriggerReadFrom((uint64_t)self, (uint64_t)a3);
}

- (id)dictionaryRepresentation
{
  NSUInteger v3 = [MEMORY[0x1E4F1CA60] dictionary];
  id v4 = v3;
  triggerName = self->_triggerName;
  if (triggerName) {
    [v3 setObject:triggerName forKey:@"triggerName"];
  }
  if (*(unsigned char *)&self->_has)
  {
    int kind = self->_kind;
    if (kind)
    {
      if (kind == 1)
      {
        char v7 = @"ContextProperty";
      }
      else
      {
        objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", self->_kind);
        char v7 = (__CFString *)objc_claimAutoreleasedReturnValue();
      }
    }
    else
    {
      char v7 = @"Event";
    }
    [v4 setObject:v7 forKey:@"kind"];
  }
  bundleIdentifier = self->_bundleIdentifier;
  if (bundleIdentifier) {
    [v4 setObject:bundleIdentifier forKey:@"bundleIdentifier"];
  }

  return v4;
}

- (id)description
{
  NSUInteger v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)ICIAMMessagePresentationTrigger;
  id v4 = [(ICIAMMessagePresentationTrigger *)&v8 description];
  id v5 = [(ICIAMMessagePresentationTrigger *)self dictionaryRepresentation];
  uint64_t v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (BOOL)hasBundleIdentifier
{
  return self->_bundleIdentifier != 0;
}

- (int)StringAsKind:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"Event"]) {
    int v4 = 0;
  }
  else {
    int v4 = [v3 isEqualToString:@"ContextProperty"];
  }

  return v4;
}

- (id)kindAsString:(int)a3
{
  if (a3)
  {
    if (a3 == 1)
    {
      int v4 = @"ContextProperty";
    }
    else
    {
      objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(void *)&a3);
      int v4 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
  }
  else
  {
    int v4 = @"Event";
  }
  return v4;
}

- (BOOL)hasKind
{
  return *(unsigned char *)&self->_has & 1;
}

- (void)setHasKind:(BOOL)a3
{
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (void)setKind:(int)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_int kind = a3;
}

- (int)kind
{
  if (*(unsigned char *)&self->_has) {
    return self->_kind;
  }
  else {
    return 0;
  }
}

- (BOOL)hasTriggerName
{
  return self->_triggerName != 0;
}

@end