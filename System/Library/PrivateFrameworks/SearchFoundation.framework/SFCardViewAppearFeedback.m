@interface SFCardViewAppearFeedback
+ (BOOL)supportsSecureCoding;
- (NSString)fbr;
- (SFCard)card;
- (SFCardViewAppearFeedback)initWithCard:(id)a3;
- (SFCardViewAppearFeedback)initWithCoder:(id)a3;
- (unsigned)level;
- (void)encodeWithCoder:(id)a3;
- (void)setCard:(id)a3;
- (void)setFbr:(id)a3;
- (void)setLevel:(unsigned int)a3;
@end

@implementation SFCardViewAppearFeedback

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_fbr, 0);
  objc_storeStrong((id *)&self->_card, 0);
}

- (void)setFbr:(id)a3
{
}

- (NSString)fbr
{
  return self->_fbr;
}

- (void)setLevel:(unsigned int)a3
{
  self->_level = a3;
}

- (unsigned)level
{
  return self->_level;
}

- (void)setCard:(id)a3
{
}

- (SFCard)card
{
  return self->_card;
}

- (void)encodeWithCoder:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)SFCardViewAppearFeedback;
  id v4 = a3;
  [(SFFeedback *)&v5 encodeWithCoder:v4];
  objc_msgSend(v4, "encodeObject:forKey:", self->_card, @"_card", v5.receiver, v5.super_class);
  [v4 encodeInt32:self->_level forKey:@"_level"];
  [v4 encodeObject:self->_fbr forKey:@"_fbr"];
}

- (SFCardViewAppearFeedback)initWithCoder:(id)a3
{
  id v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)SFCardViewAppearFeedback;
  objc_super v5 = [(SFFeedback *)&v11 initWithCoder:v4];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_card"];
    card = v5->_card;
    v5->_card = (SFCard *)v6;

    v5->_level = [v4 decodeInt32ForKey:@"_level"];
    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_fbr"];
    fbr = v5->_fbr;
    v5->_fbr = (NSString *)v8;
  }
  return v5;
}

- (SFCardViewAppearFeedback)initWithCard:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)SFCardViewAppearFeedback;
  uint64_t v6 = [(SFFeedback *)&v9 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_card, a3);
    v7->super._queryId = [v5 queryId];
  }

  return v7;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end