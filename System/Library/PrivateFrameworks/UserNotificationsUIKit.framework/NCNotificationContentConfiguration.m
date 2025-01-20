@interface NCNotificationContentConfiguration
- (BOOL)isDateHidden;
- (BOOL)isEqual:(id)a3;
- (BOOL)isHighlighted;
- (BOOL)isRevealed;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (unint64_t)hash;
- (unint64_t)summarizationType;
- (void)setDateHidden:(BOOL)a3;
- (void)setHighlighted:(BOOL)a3;
- (void)setRevealed:(BOOL)a3;
- (void)setSummarizationType:(unint64_t)a3;
@end

@implementation NCNotificationContentConfiguration

- (BOOL)isEqual:(id)a3
{
  v4 = (NCNotificationContentConfiguration *)a3;
  if (self == v4)
  {
    LOBYTE(v10) = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v5 = v4;
      BOOL v6 = [(NCNotificationContentConfiguration *)self isRevealed];
      if (v6 == [(NCNotificationContentConfiguration *)v5 isRevealed]
        && (BOOL v7 = [(NCNotificationContentConfiguration *)self isHighlighted],
            v7 == [(NCNotificationContentConfiguration *)v5 isHighlighted])
        && (unint64_t v8 = [(NCNotificationContentConfiguration *)self summarizationType],
            v8 == [(NCNotificationContentConfiguration *)v5 summarizationType]))
      {
        BOOL v9 = [(NCNotificationContentConfiguration *)self isDateHidden];
        BOOL v10 = v9 ^ [(NCNotificationContentConfiguration *)v5 isDateHidden] ^ 1;
      }
      else
      {
        LOBYTE(v10) = 0;
      }
    }
    else
    {
      LOBYTE(v10) = 0;
    }
  }

  return v10;
}

- (unint64_t)hash
{
  v14[3] = *MEMORY[0x1E4F143B8];
  v3 = objc_msgSend(NSNumber, "numberWithBool:", -[NCNotificationContentConfiguration isRevealed](self, "isRevealed"));
  v14[0] = v3;
  v4 = objc_msgSend(NSNumber, "numberWithBool:", -[NCNotificationContentConfiguration isHighlighted](self, "isHighlighted"));
  v14[1] = v4;
  v5 = objc_msgSend(NSNumber, "numberWithBool:", -[NCNotificationContentConfiguration isDateHidden](self, "isDateHidden"));
  v14[2] = v5;
  BOOL v6 = [MEMORY[0x1E4F1C978] arrayWithObjects:v14 count:3];

  uint64_t v10 = 0;
  v11 = &v10;
  uint64_t v12 = 0x2020000000;
  unint64_t v13 = 0;
  unint64_t v13 = [(NCNotificationContentConfiguration *)self summarizationType];
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __42__NCNotificationContentConfiguration_hash__block_invoke;
  v9[3] = &unk_1E6A94720;
  v9[4] = &v10;
  [v6 enumerateObjectsUsingBlock:v9];
  unint64_t v7 = v11[3];
  _Block_object_dispose(&v10, 8);

  return v7;
}

uint64_t __42__NCNotificationContentConfiguration_hash__block_invoke(uint64_t result, uint64_t a2, char a3)
{
  uint64_t v3 = 1 << (a3 + 1);
  if (!a2) {
    uint64_t v3 = 0;
  }
  *(void *)(*(void *)(*(void *)(result + 32) + 8) + 24) ^= v3;
  return result;
}

- (id)description
{
  uint64_t v3 = NSString;
  v4 = objc_msgSend(NSNumber, "numberWithBool:", -[NCNotificationContentConfiguration isRevealed](self, "isRevealed"));
  v5 = objc_msgSend(NSNumber, "numberWithBool:", -[NCNotificationContentConfiguration isHighlighted](self, "isHighlighted"));
  BOOL v6 = objc_msgSend(NSNumber, "numberWithBool:", -[NCNotificationContentConfiguration isDateHidden](self, "isDateHidden"));
  unint64_t v7 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", -[NCNotificationContentConfiguration summarizationType](self, "summarizationType"));
  unint64_t v8 = [v3 stringWithFormat:@"NCNotificationContentConfiguration(isRevealed: %@ isHighlighted: %@ isDateHidden: %@ summarizationType: %@)", v4, v5, v6, v7];

  return v8;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = objc_alloc_init((Class)objc_opt_class());
  if (v4)
  {
    objc_msgSend(v4, "setRevealed:", -[NCNotificationContentConfiguration isRevealed](self, "isRevealed"));
    objc_msgSend(v4, "setHighlighted:", -[NCNotificationContentConfiguration isHighlighted](self, "isHighlighted"));
    objc_msgSend(v4, "setDateHidden:", -[NCNotificationContentConfiguration isDateHidden](self, "isDateHidden"));
    objc_msgSend(v4, "setSummarizationType:", -[NCNotificationContentConfiguration summarizationType](self, "summarizationType"));
  }
  return v4;
}

- (unint64_t)summarizationType
{
  return self->_summarizationType;
}

- (void)setSummarizationType:(unint64_t)a3
{
  self->_summarizationType = a3;
}

- (BOOL)isRevealed
{
  return self->_revealed;
}

- (void)setRevealed:(BOOL)a3
{
  self->_revealed = a3;
}

- (BOOL)isHighlighted
{
  return self->_highlighted;
}

- (void)setHighlighted:(BOOL)a3
{
  self->_highlighted = a3;
}

- (BOOL)isDateHidden
{
  return self->_dateHidden;
}

- (void)setDateHidden:(BOOL)a3
{
  self->_dateHidden = a3;
}

@end