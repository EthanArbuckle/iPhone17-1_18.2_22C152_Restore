@interface SFCardViewDisappearFeedback
+ (BOOL)supportsSecureCoding;
- (SFCard)card;
- (SFCardViewDisappearFeedback)initWithCard:(id)a3 event:(unint64_t)a4;
- (SFCardViewDisappearFeedback)initWithCoder:(id)a3;
- (SFCardViewDisappearFeedback)initWithEvent:(unint64_t)a3;
- (unint64_t)cardDisappearEvent;
- (void)encodeWithCoder:(id)a3;
- (void)setCardDisappearEvent:(unint64_t)a3;
@end

@implementation SFCardViewDisappearFeedback

- (void).cxx_destruct
{
}

- (void)setCardDisappearEvent:(unint64_t)a3
{
  self->_cardDisappearEvent = a3;
}

- (unint64_t)cardDisappearEvent
{
  return self->_cardDisappearEvent;
}

- (SFCard)card
{
  return self->_card;
}

- (void)encodeWithCoder:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)SFCardViewDisappearFeedback;
  id v4 = a3;
  [(SFFeedback *)&v5 encodeWithCoder:v4];
  objc_msgSend(v4, "encodeObject:forKey:", self->_card, @"_card", v5.receiver, v5.super_class);
  [v4 encodeInteger:self->_cardDisappearEvent forKey:@"_cardDisappearEvent"];
}

- (SFCardViewDisappearFeedback)initWithCoder:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)SFCardViewDisappearFeedback;
  objc_super v5 = [(SFFeedback *)&v9 initWithCoder:v4];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_card"];
    card = v5->_card;
    v5->_card = (SFCard *)v6;

    v5->_cardDisappearEvent = [v4 decodeIntegerForKey:@"_cardDisappearEvent"];
  }

  return v5;
}

- (SFCardViewDisappearFeedback)initWithEvent:(unint64_t)a3
{
  v5.receiver = self;
  v5.super_class = (Class)SFCardViewDisappearFeedback;
  result = [(SFFeedback *)&v5 init];
  if (result) {
    result->_cardDisappearEvent = a3;
  }
  return result;
}

- (SFCardViewDisappearFeedback)initWithCard:(id)a3 event:(unint64_t)a4
{
  id v7 = a3;
  v8 = [(SFCardViewDisappearFeedback *)self initWithEvent:a4];
  objc_super v9 = v8;
  if (v8) {
    objc_storeStrong((id *)&v8->_card, a3);
  }

  return v9;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end