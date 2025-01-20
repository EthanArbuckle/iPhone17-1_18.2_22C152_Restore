@interface WFPBSuspendShortcutEvent
- (BOOL)hasDismissalType;
- (BOOL)hasKey;
- (BOOL)hasPresentationStyle;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSString)dismissalType;
- (NSString)key;
- (NSString)presentationStyle;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (unint64_t)hash;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setDismissalType:(id)a3;
- (void)setKey:(id)a3;
- (void)setPresentationStyle:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation WFPBSuspendShortcutEvent

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_presentationStyle, 0);
  objc_storeStrong((id *)&self->_key, 0);
  objc_storeStrong((id *)&self->_dismissalType, 0);
}

- (void)setDismissalType:(id)a3
{
}

- (NSString)dismissalType
{
  return self->_dismissalType;
}

- (void)setPresentationStyle:(id)a3
{
}

- (NSString)presentationStyle
{
  return self->_presentationStyle;
}

- (void)setKey:(id)a3
{
}

- (void)mergeFrom:(id)a3
{
  v4 = a3;
  if (v4[2]) {
    -[WFPBSuspendShortcutEvent setKey:](self, "setKey:");
  }
  if (v4[3]) {
    -[WFPBSuspendShortcutEvent setPresentationStyle:](self, "setPresentationStyle:");
  }
  if (v4[1]) {
    -[WFPBSuspendShortcutEvent setDismissalType:](self, "setDismissalType:");
  }
}

- (unint64_t)hash
{
  NSUInteger v3 = [(NSString *)self->_key hash];
  NSUInteger v4 = [(NSString *)self->_presentationStyle hash] ^ v3;
  return v4 ^ [(NSString *)self->_dismissalType hash];
}

- (BOOL)isEqual:(id)a3
{
  NSUInteger v4 = a3;
  if ([v4 isMemberOfClass:objc_opt_class()]
    && ((key = self->_key, !((unint64_t)key | v4[2])) || -[NSString isEqual:](key, "isEqual:"))
    && ((presentationStyle = self->_presentationStyle, !((unint64_t)presentationStyle | v4[3]))
     || -[NSString isEqual:](presentationStyle, "isEqual:")))
  {
    dismissalType = self->_dismissalType;
    if ((unint64_t)dismissalType | v4[1]) {
      char v8 = -[NSString isEqual:](dismissalType, "isEqual:");
    }
    else {
      char v8 = 1;
    }
  }
  else
  {
    char v8 = 0;
  }

  return v8;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  uint64_t v6 = [(NSString *)self->_key copyWithZone:a3];
  v7 = (void *)v5[2];
  v5[2] = v6;

  uint64_t v8 = [(NSString *)self->_presentationStyle copyWithZone:a3];
  v9 = (void *)v5[3];
  v5[3] = v8;

  uint64_t v10 = [(NSString *)self->_dismissalType copyWithZone:a3];
  v11 = (void *)v5[1];
  v5[1] = v10;

  return v5;
}

- (void)copyTo:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (self->_key)
  {
    objc_msgSend(v4, "setKey:");
    id v4 = v5;
  }
  if (self->_presentationStyle)
  {
    objc_msgSend(v5, "setPresentationStyle:");
    id v4 = v5;
  }
  if (self->_dismissalType)
  {
    objc_msgSend(v5, "setDismissalType:");
    id v4 = v5;
  }
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (self->_key)
  {
    PBDataWriterWriteStringField();
    id v4 = v5;
  }
  if (self->_presentationStyle)
  {
    PBDataWriterWriteStringField();
    id v4 = v5;
  }
  if (self->_dismissalType)
  {
    PBDataWriterWriteStringField();
    id v4 = v5;
  }
}

- (BOOL)readFrom:(id)a3
{
  return WFPBSuspendShortcutEventReadFrom((uint64_t)self, (uint64_t)a3);
}

- (id)dictionaryRepresentation
{
  NSUInteger v3 = [MEMORY[0x1E4F1CA60] dictionary];
  id v4 = v3;
  key = self->_key;
  if (key) {
    [v3 setObject:key forKey:@"key"];
  }
  presentationStyle = self->_presentationStyle;
  if (presentationStyle) {
    [v4 setObject:presentationStyle forKey:@"presentationStyle"];
  }
  dismissalType = self->_dismissalType;
  if (dismissalType) {
    [v4 setObject:dismissalType forKey:@"dismissalType"];
  }
  return v4;
}

- (id)description
{
  NSUInteger v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)WFPBSuspendShortcutEvent;
  id v4 = [(WFPBSuspendShortcutEvent *)&v8 description];
  id v5 = [(WFPBSuspendShortcutEvent *)self dictionaryRepresentation];
  uint64_t v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (BOOL)hasDismissalType
{
  return self->_dismissalType != 0;
}

- (BOOL)hasPresentationStyle
{
  return self->_presentationStyle != 0;
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
    return (NSString *)@"SuspendShortcutEvent";
  }
}

@end