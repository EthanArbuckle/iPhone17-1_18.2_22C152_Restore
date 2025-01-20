@interface WFPBShowDialogEvent
- (BOOL)hasAutomationType;
- (BOOL)hasDialogType;
- (BOOL)hasDismissalType;
- (BOOL)hasKey;
- (BOOL)hasPresentationStyle;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSString)automationType;
- (NSString)dialogType;
- (NSString)dismissalType;
- (NSString)key;
- (NSString)presentationStyle;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (unint64_t)hash;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setAutomationType:(id)a3;
- (void)setDialogType:(id)a3;
- (void)setDismissalType:(id)a3;
- (void)setKey:(id)a3;
- (void)setPresentationStyle:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation WFPBShowDialogEvent

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_presentationStyle, 0);
  objc_storeStrong((id *)&self->_key, 0);
  objc_storeStrong((id *)&self->_dismissalType, 0);
  objc_storeStrong((id *)&self->_dialogType, 0);
  objc_storeStrong((id *)&self->_automationType, 0);
}

- (void)setAutomationType:(id)a3
{
}

- (NSString)automationType
{
  return self->_automationType;
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

- (void)setDialogType:(id)a3
{
}

- (NSString)dialogType
{
  return self->_dialogType;
}

- (void)setKey:(id)a3
{
}

- (void)mergeFrom:(id)a3
{
  v4 = a3;
  if (v4[4]) {
    -[WFPBShowDialogEvent setKey:](self, "setKey:");
  }
  if (v4[2]) {
    -[WFPBShowDialogEvent setDialogType:](self, "setDialogType:");
  }
  if (v4[5]) {
    -[WFPBShowDialogEvent setPresentationStyle:](self, "setPresentationStyle:");
  }
  if (v4[3]) {
    -[WFPBShowDialogEvent setDismissalType:](self, "setDismissalType:");
  }
  if (v4[1]) {
    -[WFPBShowDialogEvent setAutomationType:](self, "setAutomationType:");
  }
}

- (unint64_t)hash
{
  NSUInteger v3 = [(NSString *)self->_key hash];
  NSUInteger v4 = [(NSString *)self->_dialogType hash] ^ v3;
  NSUInteger v5 = [(NSString *)self->_presentationStyle hash];
  NSUInteger v6 = v4 ^ v5 ^ [(NSString *)self->_dismissalType hash];
  return v6 ^ [(NSString *)self->_automationType hash];
}

- (BOOL)isEqual:(id)a3
{
  NSUInteger v4 = a3;
  if ([v4 isMemberOfClass:objc_opt_class()]
    && ((key = self->_key, !((unint64_t)key | v4[4])) || -[NSString isEqual:](key, "isEqual:"))
    && ((dialogType = self->_dialogType, !((unint64_t)dialogType | v4[2]))
     || -[NSString isEqual:](dialogType, "isEqual:"))
    && ((presentationStyle = self->_presentationStyle, !((unint64_t)presentationStyle | v4[5]))
     || -[NSString isEqual:](presentationStyle, "isEqual:"))
    && ((dismissalType = self->_dismissalType, !((unint64_t)dismissalType | v4[3]))
     || -[NSString isEqual:](dismissalType, "isEqual:")))
  {
    automationType = self->_automationType;
    if ((unint64_t)automationType | v4[1]) {
      char v10 = -[NSString isEqual:](automationType, "isEqual:");
    }
    else {
      char v10 = 1;
    }
  }
  else
  {
    char v10 = 0;
  }

  return v10;
}

- (id)copyWithZone:(_NSZone *)a3
{
  NSUInteger v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  uint64_t v6 = [(NSString *)self->_key copyWithZone:a3];
  v7 = (void *)v5[4];
  v5[4] = v6;

  uint64_t v8 = [(NSString *)self->_dialogType copyWithZone:a3];
  v9 = (void *)v5[2];
  v5[2] = v8;

  uint64_t v10 = [(NSString *)self->_presentationStyle copyWithZone:a3];
  v11 = (void *)v5[5];
  v5[5] = v10;

  uint64_t v12 = [(NSString *)self->_dismissalType copyWithZone:a3];
  v13 = (void *)v5[3];
  v5[3] = v12;

  uint64_t v14 = [(NSString *)self->_automationType copyWithZone:a3];
  v15 = (void *)v5[1];
  v5[1] = v14;

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
  if (self->_dialogType)
  {
    objc_msgSend(v5, "setDialogType:");
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
  if (self->_automationType)
  {
    objc_msgSend(v5, "setAutomationType:");
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
  if (self->_dialogType)
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
  if (self->_automationType)
  {
    PBDataWriterWriteStringField();
    id v4 = v5;
  }
}

- (BOOL)readFrom:(id)a3
{
  return WFPBShowDialogEventReadFrom((uint64_t)self, (uint64_t)a3);
}

- (id)dictionaryRepresentation
{
  NSUInteger v3 = [MEMORY[0x1E4F1CA60] dictionary];
  id v4 = v3;
  key = self->_key;
  if (key) {
    [v3 setObject:key forKey:@"key"];
  }
  dialogType = self->_dialogType;
  if (dialogType) {
    [v4 setObject:dialogType forKey:@"dialogType"];
  }
  presentationStyle = self->_presentationStyle;
  if (presentationStyle) {
    [v4 setObject:presentationStyle forKey:@"presentationStyle"];
  }
  dismissalType = self->_dismissalType;
  if (dismissalType) {
    [v4 setObject:dismissalType forKey:@"dismissalType"];
  }
  automationType = self->_automationType;
  if (automationType) {
    [v4 setObject:automationType forKey:@"automationType"];
  }
  return v4;
}

- (id)description
{
  NSUInteger v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)WFPBShowDialogEvent;
  id v4 = [(WFPBShowDialogEvent *)&v8 description];
  id v5 = [(WFPBShowDialogEvent *)self dictionaryRepresentation];
  uint64_t v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (BOOL)hasAutomationType
{
  return self->_automationType != 0;
}

- (BOOL)hasDismissalType
{
  return self->_dismissalType != 0;
}

- (BOOL)hasPresentationStyle
{
  return self->_presentationStyle != 0;
}

- (BOOL)hasDialogType
{
  return self->_dialogType != 0;
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
    return (NSString *)@"ShowDialogEvent";
  }
}

@end