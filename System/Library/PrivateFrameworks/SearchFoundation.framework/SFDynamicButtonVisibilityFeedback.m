@interface SFDynamicButtonVisibilityFeedback
+ (BOOL)supportsSecureCoding;
- (NSArray)buttons;
- (SFCardSection)cardSection;
- (SFDynamicButtonVisibilityFeedback)initWithCardSection:(id)a3 buttons:(id)a4;
- (SFDynamicButtonVisibilityFeedback)initWithCoder:(id)a3;
- (void)encodeWithCoder:(id)a3;
- (void)setButtons:(id)a3;
- (void)setCardSection:(id)a3;
@end

@implementation SFDynamicButtonVisibilityFeedback

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_cardSection, 0);
  objc_storeStrong((id *)&self->_buttons, 0);
}

- (void)setCardSection:(id)a3
{
}

- (SFCardSection)cardSection
{
  return self->_cardSection;
}

- (void)setButtons:(id)a3
{
}

- (NSArray)buttons
{
  return self->_buttons;
}

- (void)encodeWithCoder:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)SFDynamicButtonVisibilityFeedback;
  id v4 = a3;
  [(SFFeedback *)&v5 encodeWithCoder:v4];
  objc_msgSend(v4, "encodeObject:forKey:", self->_buttons, @"_buttons", v5.receiver, v5.super_class);
  [v4 encodeObject:self->_cardSection forKey:@"_cardSection"];
}

- (SFDynamicButtonVisibilityFeedback)initWithCoder:(id)a3
{
  id v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)SFDynamicButtonVisibilityFeedback;
  objc_super v5 = [(SFFeedback *)&v12 initWithCoder:v4];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectForKey:@"_buttons"];
    buttons = v5->_buttons;
    v5->_buttons = (NSArray *)v6;

    uint64_t v8 = [v4 decodeObjectForKey:@"_cardSection"];
    cardSection = v5->_cardSection;
    v5->_cardSection = (SFCardSection *)v8;

    v10 = v5;
  }

  return v5;
}

- (SFDynamicButtonVisibilityFeedback)initWithCardSection:(id)a3 buttons:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v15.receiver = self;
  v15.super_class = (Class)SFDynamicButtonVisibilityFeedback;
  uint64_t v8 = [(SFFeedback *)&v15 init];
  if (v8)
  {
    uint64_t v9 = [v7 copy];
    buttons = v8->_buttons;
    v8->_buttons = (NSArray *)v9;

    uint64_t v11 = [v6 copy];
    cardSection = v8->_cardSection;
    v8->_cardSection = (SFCardSection *)v11;

    v13 = v8;
  }

  return v8;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end