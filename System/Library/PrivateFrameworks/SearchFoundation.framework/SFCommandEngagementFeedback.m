@interface SFCommandEngagementFeedback
+ (BOOL)supportsSecureCoding;
- (SFButtonItem)button;
- (SFCardSection)cardSection;
- (SFCommand)command;
- (SFCommandEngagementFeedback)initWithCoder:(id)a3;
- (SFCommandEngagementFeedback)initWithCommand:(id)a3 cardSection:(id)a4;
- (SFCommandEngagementFeedback)initWithCommand:(id)a3 cardSection:(id)a4 result:(id)a5 button:(id)a6;
- (SFPhotosAttributes)photosAttributes;
- (SFResultSection)resultSection;
- (SFSearchResult)result;
- (id)copyWithZone:(_NSZone *)a3;
- (unint64_t)triggerEvent;
- (void)encodeWithCoder:(id)a3;
- (void)setButton:(id)a3;
- (void)setCardSection:(id)a3;
- (void)setCommand:(id)a3;
- (void)setPhotosAttributes:(id)a3;
- (void)setResult:(id)a3;
- (void)setResultSection:(id)a3;
- (void)setTriggerEvent:(unint64_t)a3;
@end

@implementation SFCommandEngagementFeedback

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_photosAttributes, 0);
  objc_storeStrong((id *)&self->_resultSection, 0);
  objc_storeStrong((id *)&self->_button, 0);
  objc_storeStrong((id *)&self->_cardSection, 0);
  objc_storeStrong((id *)&self->_command, 0);
  objc_storeStrong((id *)&self->_result, 0);
}

- (void)setPhotosAttributes:(id)a3
{
}

- (SFPhotosAttributes)photosAttributes
{
  return self->_photosAttributes;
}

- (void)setResultSection:(id)a3
{
}

- (SFResultSection)resultSection
{
  return self->_resultSection;
}

- (void)setButton:(id)a3
{
}

- (SFButtonItem)button
{
  return self->_button;
}

- (void)setCardSection:(id)a3
{
}

- (SFCardSection)cardSection
{
  return self->_cardSection;
}

- (void)setCommand:(id)a3
{
}

- (SFCommand)command
{
  return self->_command;
}

- (void)setTriggerEvent:(unint64_t)a3
{
  self->_triggerEvent = a3;
}

- (unint64_t)triggerEvent
{
  return self->_triggerEvent;
}

- (void)setResult:(id)a3
{
}

- (SFSearchResult)result
{
  return self->_result;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v24.receiver = self;
  v24.super_class = (Class)SFCommandEngagementFeedback;
  v4 = [(SFFeedback *)&v24 copyWithZone:a3];
  v5 = [(SFCommandEngagementFeedback *)self command];
  uint64_t v6 = [v5 copy];
  v7 = (void *)v4[5];
  v4[5] = v6;

  v8 = [(SFCommandEngagementFeedback *)self cardSection];
  uint64_t v9 = [v8 copy];
  v10 = (void *)v4[6];
  v4[6] = v9;

  v11 = [(SFCommandEngagementFeedback *)self result];
  uint64_t v12 = [v11 copy];
  v13 = (void *)v4[3];
  v4[3] = v12;

  v14 = [(SFCommandEngagementFeedback *)self button];
  uint64_t v15 = [v14 copy];
  v16 = (void *)v4[7];
  v4[7] = v15;

  v4[4] = [(SFCommandEngagementFeedback *)self triggerEvent];
  v17 = [(SFCommandEngagementFeedback *)self resultSection];
  uint64_t v18 = [v17 copy];
  v19 = (void *)v4[8];
  v4[8] = v18;

  v20 = [(SFCommandEngagementFeedback *)self photosAttributes];
  uint64_t v21 = [v20 copy];
  v22 = (void *)v4[9];
  v4[9] = v21;

  return v4;
}

- (void)encodeWithCoder:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)SFCommandEngagementFeedback;
  id v4 = a3;
  [(SFFeedback *)&v5 encodeWithCoder:v4];
  objc_msgSend(v4, "encodeObject:forKey:", self->_result, @"_result", v5.receiver, v5.super_class);
  [v4 encodeObject:self->_cardSection forKey:@"_cardSection"];
  [v4 encodeObject:self->_button forKey:@"_button"];
  [v4 encodeObject:self->_command forKey:@"_command"];
  [v4 encodeInteger:self->_triggerEvent forKey:@"_triggerEvent"];
  [v4 encodeObject:self->_resultSection forKey:@"_resultSection"];
  [v4 encodeObject:self->_photosAttributes forKey:@"_photosAttributes"];
}

- (SFCommandEngagementFeedback)initWithCoder:(id)a3
{
  id v4 = a3;
  v20.receiver = self;
  v20.super_class = (Class)SFCommandEngagementFeedback;
  objc_super v5 = [(SFFeedback *)&v20 initWithCoder:v4];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_result"];
    v7 = v5->_result;
    v5->_result = (SFSearchResult *)v6;

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_cardSection"];
    cardSection = v5->_cardSection;
    v5->_cardSection = (SFCardSection *)v8;

    uint64_t v10 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_button"];
    button = v5->_button;
    v5->_button = (SFButtonItem *)v10;

    uint64_t v12 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_command"];
    command = v5->_command;
    v5->_command = (SFCommand *)v12;

    v5->_triggerEvent = [v4 decodeIntegerForKey:@"_triggerEvent"];
    uint64_t v14 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_resultSection"];
    resultSection = v5->_resultSection;
    v5->_resultSection = (SFResultSection *)v14;

    uint64_t v16 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_photosAttributes"];
    photosAttributes = v5->_photosAttributes;
    v5->_photosAttributes = (SFPhotosAttributes *)v16;

    uint64_t v18 = v5;
  }

  return v5;
}

- (SFCommandEngagementFeedback)initWithCommand:(id)a3 cardSection:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)SFCommandEngagementFeedback;
  uint64_t v9 = [(SFFeedback *)&v12 init];
  uint64_t v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_command, a3);
    objc_storeStrong((id *)&v10->_cardSection, a4);
  }

  return v10;
}

- (SFCommandEngagementFeedback)initWithCommand:(id)a3 cardSection:(id)a4 result:(id)a5 button:(id)a6
{
  id v10 = a5;
  id v11 = a6;
  objc_super v12 = [(SFCommandEngagementFeedback *)self initWithCommand:a3 cardSection:a4];
  v13 = v12;
  if (v12)
  {
    [(SFCommandEngagementFeedback *)v12 setResult:v10];
    [(SFCommandEngagementFeedback *)v13 setButton:v11];
    uint64_t v14 = v13;
  }

  return v13;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end