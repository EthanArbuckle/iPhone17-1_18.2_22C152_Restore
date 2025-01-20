@interface WFREPBAlert
+ (Class)buttonsType;
- (BOOL)hasMessage;
- (BOOL)hasPreferredStyle;
- (BOOL)hasTitle;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSMutableArray)buttons;
- (NSString)message;
- (NSString)title;
- (id)buttonsAtIndex:(unint64_t)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)preferredStyleAsString:(int)a3;
- (int)StringAsPreferredStyle:(id)a3;
- (int)preferredStyle;
- (unint64_t)buttonsCount;
- (unint64_t)hash;
- (void)addButtons:(id)a3;
- (void)clearButtons;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setButtons:(id)a3;
- (void)setHasPreferredStyle:(BOOL)a3;
- (void)setMessage:(id)a3;
- (void)setPreferredStyle:(int)a3;
- (void)setTitle:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation WFREPBAlert

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_title, 0);
  objc_storeStrong((id *)&self->_message, 0);
  objc_storeStrong((id *)&self->_buttons, 0);
}

- (void)setButtons:(id)a3
{
}

- (NSMutableArray)buttons
{
  return self->_buttons;
}

- (void)setMessage:(id)a3
{
}

- (NSString)message
{
  return self->_message;
}

- (void)setTitle:(id)a3
{
}

- (NSString)title
{
  return self->_title;
}

- (void)mergeFrom:(id)a3
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (*((void *)v4 + 4)) {
    -[WFREPBAlert setTitle:](self, "setTitle:");
  }
  if (*((void *)v4 + 2)) {
    -[WFREPBAlert setMessage:](self, "setMessage:");
  }
  long long v12 = 0u;
  long long v13 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  id v5 = *((id *)v4 + 1);
  uint64_t v6 = [v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v11;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v11 != v8) {
          objc_enumerationMutation(v5);
        }
        -[WFREPBAlert addButtons:](self, "addButtons:", *(void *)(*((void *)&v10 + 1) + 8 * i), (void)v10);
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v7);
  }

  if (*((unsigned char *)v4 + 40))
  {
    self->_preferredStyle = *((_DWORD *)v4 + 6);
    *(unsigned char *)&self->_has |= 1u;
  }
}

- (unint64_t)hash
{
  NSUInteger v3 = [(NSString *)self->_title hash];
  NSUInteger v4 = [(NSString *)self->_message hash];
  uint64_t v5 = [(NSMutableArray *)self->_buttons hash];
  if (*(unsigned char *)&self->_has) {
    uint64_t v6 = 2654435761 * self->_preferredStyle;
  }
  else {
    uint64_t v6 = 0;
  }
  return v4 ^ v3 ^ v5 ^ v6;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_12;
  }
  title = self->_title;
  if ((unint64_t)title | *((void *)v4 + 4))
  {
    if (!-[NSString isEqual:](title, "isEqual:")) {
      goto LABEL_12;
    }
  }
  message = self->_message;
  if ((unint64_t)message | *((void *)v4 + 2))
  {
    if (!-[NSString isEqual:](message, "isEqual:")) {
      goto LABEL_12;
    }
  }
  buttons = self->_buttons;
  if ((unint64_t)buttons | *((void *)v4 + 1))
  {
    if (!-[NSMutableArray isEqual:](buttons, "isEqual:")) {
      goto LABEL_12;
    }
  }
  BOOL v8 = (*((unsigned char *)v4 + 40) & 1) == 0;
  if (*(unsigned char *)&self->_has)
  {
    if ((*((unsigned char *)v4 + 40) & 1) != 0 && self->_preferredStyle == *((_DWORD *)v4 + 6))
    {
      BOOL v8 = 1;
      goto LABEL_13;
    }
LABEL_12:
    BOOL v8 = 0;
  }
LABEL_13:

  return v8;
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  uint64_t v6 = [(NSString *)self->_title copyWithZone:a3];
  uint64_t v7 = *(void **)(v5 + 32);
  *(void *)(v5 + 32) = v6;

  uint64_t v8 = [(NSString *)self->_message copyWithZone:a3];
  v9 = *(void **)(v5 + 16);
  *(void *)(v5 + 16) = v8;

  long long v19 = 0u;
  long long v20 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v10 = self->_buttons;
  uint64_t v11 = [(NSMutableArray *)v10 countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (v11)
  {
    uint64_t v12 = v11;
    uint64_t v13 = *(void *)v18;
    do
    {
      uint64_t v14 = 0;
      do
      {
        if (*(void *)v18 != v13) {
          objc_enumerationMutation(v10);
        }
        uint64_t v15 = objc_msgSend(*(id *)(*((void *)&v17 + 1) + 8 * v14), "copyWithZone:", a3, (void)v17);
        [(id)v5 addButtons:v15];

        ++v14;
      }
      while (v12 != v14);
      uint64_t v12 = [(NSMutableArray *)v10 countByEnumeratingWithState:&v17 objects:v21 count:16];
    }
    while (v12);
  }

  if (*(unsigned char *)&self->_has)
  {
    *(_DWORD *)(v5 + 24) = self->_preferredStyle;
    *(unsigned char *)(v5 + 40) |= 1u;
  }
  return (id)v5;
}

- (void)copyTo:(id)a3
{
  id v8 = a3;
  if (self->_title) {
    objc_msgSend(v8, "setTitle:");
  }
  if (self->_message) {
    objc_msgSend(v8, "setMessage:");
  }
  if ([(WFREPBAlert *)self buttonsCount])
  {
    [v8 clearButtons];
    unint64_t v4 = [(WFREPBAlert *)self buttonsCount];
    if (v4)
    {
      unint64_t v5 = v4;
      for (uint64_t i = 0; i != v5; ++i)
      {
        uint64_t v7 = [(WFREPBAlert *)self buttonsAtIndex:i];
        [v8 addButtons:v7];
      }
    }
  }
  if (*(unsigned char *)&self->_has)
  {
    *((_DWORD *)v8 + 6) = self->_preferredStyle;
    *((unsigned char *)v8 + 40) |= 1u;
  }
}

- (void)writeTo:(id)a3
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (self->_title) {
    PBDataWriterWriteStringField();
  }
  if (self->_message) {
    PBDataWriterWriteStringField();
  }
  long long v12 = 0u;
  long long v13 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  unint64_t v5 = self->_buttons;
  uint64_t v6 = [(NSMutableArray *)v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v11;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v11 != v8) {
          objc_enumerationMutation(v5);
        }
        PBDataWriterWriteSubmessage();
        ++v9;
      }
      while (v7 != v9);
      uint64_t v7 = [(NSMutableArray *)v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v7);
  }

  if (*(unsigned char *)&self->_has) {
    PBDataWriterWriteInt32Field();
  }
}

- (BOOL)readFrom:(id)a3
{
  return WFREPBAlertReadFrom((uint64_t)self, (uint64_t)a3);
}

- (id)dictionaryRepresentation
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  NSUInteger v3 = [MEMORY[0x1E4F1CA60] dictionary];
  id v4 = v3;
  title = self->_title;
  if (title) {
    [v3 setObject:title forKey:@"title"];
  }
  message = self->_message;
  if (message) {
    [v4 setObject:message forKey:@"message"];
  }
  if ([(NSMutableArray *)self->_buttons count])
  {
    uint64_t v7 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", -[NSMutableArray count](self->_buttons, "count"));
    long long v17 = 0u;
    long long v18 = 0u;
    long long v19 = 0u;
    long long v20 = 0u;
    uint64_t v8 = self->_buttons;
    uint64_t v9 = [(NSMutableArray *)v8 countByEnumeratingWithState:&v17 objects:v21 count:16];
    if (v9)
    {
      uint64_t v10 = v9;
      uint64_t v11 = *(void *)v18;
      do
      {
        for (uint64_t i = 0; i != v10; ++i)
        {
          if (*(void *)v18 != v11) {
            objc_enumerationMutation(v8);
          }
          long long v13 = [*(id *)(*((void *)&v17 + 1) + 8 * i) dictionaryRepresentation];
          [v7 addObject:v13];
        }
        uint64_t v10 = [(NSMutableArray *)v8 countByEnumeratingWithState:&v17 objects:v21 count:16];
      }
      while (v10);
    }

    [v4 setObject:v7 forKey:@"buttons"];
  }
  if (*(unsigned char *)&self->_has)
  {
    int preferredStyle = self->_preferredStyle;
    if (preferredStyle == 1)
    {
      uint64_t v15 = @"Alert";
    }
    else if (preferredStyle == 2)
    {
      uint64_t v15 = @"Sheet";
    }
    else
    {
      objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", self->_preferredStyle);
      uint64_t v15 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    [v4 setObject:v15 forKey:@"preferredStyle"];
  }
  return v4;
}

- (id)description
{
  NSUInteger v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)WFREPBAlert;
  id v4 = [(WFREPBAlert *)&v8 description];
  unint64_t v5 = [(WFREPBAlert *)self dictionaryRepresentation];
  uint64_t v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (int)StringAsPreferredStyle:(id)a3
{
  id v3 = a3;
  int v4 = 1;
  if (([v3 isEqualToString:@"Alert"] & 1) == 0)
  {
    if ([v3 isEqualToString:@"Sheet"]) {
      int v4 = 2;
    }
    else {
      int v4 = 1;
    }
  }

  return v4;
}

- (id)preferredStyleAsString:(int)a3
{
  if (a3 == 1)
  {
    int v4 = @"Alert";
  }
  else if (a3 == 2)
  {
    int v4 = @"Sheet";
  }
  else
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(void *)&a3);
    int v4 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  return v4;
}

- (BOOL)hasPreferredStyle
{
  return *(unsigned char *)&self->_has & 1;
}

- (void)setHasPreferredStyle:(BOOL)a3
{
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (void)setPreferredStyle:(int)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_int preferredStyle = a3;
}

- (int)preferredStyle
{
  if (*(unsigned char *)&self->_has) {
    return self->_preferredStyle;
  }
  else {
    return 1;
  }
}

- (id)buttonsAtIndex:(unint64_t)a3
{
  return (id)[(NSMutableArray *)self->_buttons objectAtIndex:a3];
}

- (unint64_t)buttonsCount
{
  return [(NSMutableArray *)self->_buttons count];
}

- (void)addButtons:(id)a3
{
  id v4 = a3;
  buttons = self->_buttons;
  id v8 = v4;
  if (!buttons)
  {
    uint64_t v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    uint64_t v7 = self->_buttons;
    self->_buttons = v6;

    id v4 = v8;
    buttons = self->_buttons;
  }
  [(NSMutableArray *)buttons addObject:v4];
}

- (void)clearButtons
{
}

- (BOOL)hasMessage
{
  return self->_message != 0;
}

- (BOOL)hasTitle
{
  return self->_title != 0;
}

+ (Class)buttonsType
{
  return (Class)objc_opt_class();
}

@end