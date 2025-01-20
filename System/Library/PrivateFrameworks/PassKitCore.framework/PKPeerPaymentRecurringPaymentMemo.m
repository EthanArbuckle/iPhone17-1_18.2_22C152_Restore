@interface PKPeerPaymentRecurringPaymentMemo
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (NSString)emoji;
- (NSString)text;
- (PKPeerPaymentRecurringPaymentMemo)initWithCoder:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (int64_t)color;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
- (void)setColor:(int64_t)a3;
- (void)setEmoji:(id)a3;
- (void)setText:(id)a3;
@end

@implementation PKPeerPaymentRecurringPaymentMemo

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (PKPeerPaymentRecurringPaymentMemo)initWithCoder:(id)a3
{
  id v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)PKPeerPaymentRecurringPaymentMemo;
  v5 = [(PKPeerPaymentRecurringPaymentMemo *)&v11 init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"text"];
    text = v5->_text;
    v5->_text = (NSString *)v6;

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"emoji"];
    emoji = v5->_emoji;
    v5->_emoji = (NSString *)v8;

    v5->_color = [v4 decodeIntegerForKey:@"color"];
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  text = self->_text;
  id v5 = a3;
  [v5 encodeObject:text forKey:@"text"];
  [v5 encodeObject:self->_emoji forKey:@"emoji"];
  [v5 encodeInteger:self->_color forKey:@"color"];
}

- (unint64_t)hash
{
  v3 = [MEMORY[0x1E4F1CA48] array];
  [v3 safelyAddObject:self->_text];
  [v3 safelyAddObject:self->_emoji];
  uint64_t v4 = PKCombinedHash(17, v3);
  unint64_t v5 = self->_color - v4 + 32 * v4;

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  uint64_t v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0) {
    goto LABEL_12;
  }
  emoji = self->_emoji;
  uint64_t v6 = (NSString *)v4[2];
  if (emoji && v6)
  {
    if ((-[NSString isEqual:](emoji, "isEqual:") & 1) == 0) {
      goto LABEL_12;
    }
  }
  else if (emoji != v6)
  {
    goto LABEL_12;
  }
  text = self->_text;
  uint64_t v8 = (NSString *)v4[1];
  if (!text || !v8)
  {
    if (text == v8) {
      goto LABEL_10;
    }
LABEL_12:
    BOOL v9 = 0;
    goto LABEL_13;
  }
  if ((-[NSString isEqual:](text, "isEqual:") & 1) == 0) {
    goto LABEL_12;
  }
LABEL_10:
  BOOL v9 = self->_color == v4[3];
LABEL_13:

  return v9;
}

- (id)description
{
  v3 = [MEMORY[0x1E4F28E78] stringWithFormat:@"<%@: %p; ", objc_opt_class(), self];
  [v3 appendFormat:@"text: '%@'; ", self->_text];
  [v3 appendFormat:@"emoji: '%@'; ", self->_emoji];
  uint64_t v4 = PKSemanticColorToString(self->_color);
  [v3 appendFormat:@"color: '%@'; ", v4];

  [v3 appendFormat:@">"];
  return v3;
}

- (id)copyWithZone:(_NSZone *)a3
{
  unint64_t v5 = [+[PKPeerPaymentRecurringPaymentMemo allocWithZone:](PKPeerPaymentRecurringPaymentMemo, "allocWithZone:") init];
  uint64_t v6 = [(NSString *)self->_emoji copyWithZone:a3];
  emoji = v5->_emoji;
  v5->_emoji = (NSString *)v6;

  v5->_color = self->_color;
  uint64_t v8 = [(NSString *)self->_text copyWithZone:a3];
  text = v5->_text;
  v5->_text = (NSString *)v8;

  return v5;
}

- (NSString)text
{
  return self->_text;
}

- (void)setText:(id)a3
{
}

- (NSString)emoji
{
  return self->_emoji;
}

- (void)setEmoji:(id)a3
{
}

- (int64_t)color
{
  return self->_color;
}

- (void)setColor:(int64_t)a3
{
  self->_color = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_emoji, 0);
  objc_storeStrong((id *)&self->_text, 0);
}

@end