@interface SFCardSectionFeedback
+ (BOOL)supportsSecureCoding;
- (NSString)cardSectionId;
- (NSString)resultId;
- (SFCardSection)cardSection;
- (SFCardSectionFeedback)initWithCardSection:(id)a3;
- (SFCardSectionFeedback)initWithCoder:(id)a3;
- (void)encodeWithCoder:(id)a3;
- (void)setCardSection:(id)a3;
- (void)setCardSectionId:(id)a3;
- (void)setResultId:(id)a3;
@end

@implementation SFCardSectionFeedback

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_resultId, 0);
  objc_storeStrong((id *)&self->_cardSectionId, 0);
  objc_storeStrong((id *)&self->_cardSection, 0);
}

- (void)setResultId:(id)a3
{
}

- (NSString)resultId
{
  return self->_resultId;
}

- (void)setCardSectionId:(id)a3
{
}

- (NSString)cardSectionId
{
  return self->_cardSectionId;
}

- (void)setCardSection:(id)a3
{
}

- (SFCardSection)cardSection
{
  return self->_cardSection;
}

- (void)encodeWithCoder:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)SFCardSectionFeedback;
  id v4 = a3;
  [(SFFeedback *)&v5 encodeWithCoder:v4];
  objc_msgSend(v4, "encodeObject:forKey:", self->_cardSection, @"card_section", v5.receiver, v5.super_class);
  [v4 encodeObject:self->_cardSectionId forKey:@"card_section_id"];
  [v4 encodeObject:self->_resultId forKey:@"result_id"];
}

- (SFCardSectionFeedback)initWithCoder:(id)a3
{
  id v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)SFCardSectionFeedback;
  objc_super v5 = [(SFFeedback *)&v13 initWithCoder:v4];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"card_section"];
    cardSection = v5->_cardSection;
    v5->_cardSection = (SFCardSection *)v6;

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"card_section_id"];
    cardSectionId = v5->_cardSectionId;
    v5->_cardSectionId = (NSString *)v8;

    uint64_t v10 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"result_id"];
    resultId = v5->_resultId;
    v5->_resultId = (NSString *)v10;
  }
  return v5;
}

- (SFCardSectionFeedback)initWithCardSection:(id)a3
{
  id v5 = a3;
  v13.receiver = self;
  v13.super_class = (Class)SFCardSectionFeedback;
  uint64_t v6 = [(SFFeedback *)&v13 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_cardSection, a3);
    uint64_t v8 = [v5 cardSectionId];
    cardSectionId = v7->_cardSectionId;
    v7->_cardSectionId = (NSString *)v8;

    uint64_t v10 = [v5 resultIdentifier];
    resultId = v7->_resultId;
    v7->_resultId = (NSString *)v10;
  }
  return v7;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end