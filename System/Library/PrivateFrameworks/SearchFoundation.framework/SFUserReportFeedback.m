@interface SFUserReportFeedback
+ (BOOL)supportsSecureCoding;
- (NSArray)sections;
- (NSString)uploadedDataIdentifier;
- (SFCardSection)cardSection;
- (SFPunchout)userSelection;
- (SFSearchResult)result;
- (SFUserReportFeedback)initWithCoder:(id)a3;
- (SFUserReportFeedback)initWithSelection:(id)a3 result:(id)a4 cardSection:(id)a5;
- (SFUserReportFeedback)initWithSelection:(id)a3 result:(id)a4 cardSection:(id)a5 resultSections:(id)a6 uploadedDataIdentifier:(id)a7 userReportRequestType:(int)a8;
- (id)copyWithZone:(_NSZone *)a3;
- (int)reportType;
- (void)encodeWithCoder:(id)a3;
- (void)setCardSection:(id)a3;
- (void)setReportType:(int)a3;
- (void)setResult:(id)a3;
- (void)setSections:(id)a3;
- (void)setUploadedDataIdentifier:(id)a3;
- (void)setUserSelection:(id)a3;
@end

@implementation SFUserReportFeedback

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_uploadedDataIdentifier, 0);
  objc_storeStrong((id *)&self->_sections, 0);
  objc_storeStrong((id *)&self->_userSelection, 0);
  objc_storeStrong((id *)&self->_cardSection, 0);
  objc_storeStrong((id *)&self->_result, 0);
}

- (void)setReportType:(int)a3
{
  self->_reportType = a3;
}

- (int)reportType
{
  return self->_reportType;
}

- (void)setUploadedDataIdentifier:(id)a3
{
}

- (NSString)uploadedDataIdentifier
{
  return self->_uploadedDataIdentifier;
}

- (void)setSections:(id)a3
{
}

- (NSArray)sections
{
  return self->_sections;
}

- (void)setUserSelection:(id)a3
{
}

- (SFPunchout)userSelection
{
  return self->_userSelection;
}

- (void)setCardSection:(id)a3
{
}

- (SFCardSection)cardSection
{
  return self->_cardSection;
}

- (void)setResult:(id)a3
{
}

- (SFSearchResult)result
{
  return self->_result;
}

- (void)encodeWithCoder:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)SFUserReportFeedback;
  id v4 = a3;
  [(SFFeedback *)&v5 encodeWithCoder:v4];
  objc_msgSend(v4, "encodeObject:forKey:", self->_userSelection, @"_userSelection", v5.receiver, v5.super_class);
  [v4 encodeObject:self->_result forKey:@"_result"];
  [v4 encodeObject:self->_cardSection forKey:@"_cardSection"];
}

- (SFUserReportFeedback)initWithCoder:(id)a3
{
  id v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)SFUserReportFeedback;
  objc_super v5 = [(SFFeedback *)&v13 initWithCoder:v4];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_userSelection"];
    userSelection = v5->_userSelection;
    v5->_userSelection = (SFPunchout *)v6;

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_result"];
    v9 = v5->_result;
    v5->_result = (SFSearchResult *)v8;

    uint64_t v10 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_cardSection"];
    cardSection = v5->_cardSection;
    v5->_cardSection = (SFCardSection *)v10;
  }
  return v5;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v21.receiver = self;
  v21.super_class = (Class)SFUserReportFeedback;
  id v4 = [(SFFeedback *)&v21 copyWithZone:a3];
  objc_super v5 = [(SFUserReportFeedback *)self result];
  uint64_t v6 = [v5 copy];
  v7 = (void *)v4[4];
  v4[4] = v6;

  uint64_t v8 = [(SFUserReportFeedback *)self userSelection];
  uint64_t v9 = [v8 copy];
  uint64_t v10 = (void *)v4[6];
  v4[6] = v9;

  v11 = [(SFUserReportFeedback *)self cardSection];
  uint64_t v12 = [v11 copy];
  objc_super v13 = (void *)v4[5];
  v4[5] = v12;

  v14 = [(SFUserReportFeedback *)self sections];
  uint64_t v15 = [v14 copy];
  v16 = (void *)v4[7];
  v4[7] = v15;

  v17 = [(SFUserReportFeedback *)self uploadedDataIdentifier];
  uint64_t v18 = [v17 copy];
  v19 = (void *)v4[8];
  v4[8] = v18;

  *((_DWORD *)v4 + 6) = [(SFUserReportFeedback *)self reportType];
  return v4;
}

- (SFUserReportFeedback)initWithSelection:(id)a3 result:(id)a4 cardSection:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v15.receiver = self;
  v15.super_class = (Class)SFUserReportFeedback;
  uint64_t v12 = [(SFFeedback *)&v15 init];
  objc_super v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_result, a4);
    objc_storeStrong((id *)&v13->_userSelection, a3);
    objc_storeStrong((id *)&v13->_cardSection, a5);
  }

  return v13;
}

- (SFUserReportFeedback)initWithSelection:(id)a3 result:(id)a4 cardSection:(id)a5 resultSections:(id)a6 uploadedDataIdentifier:(id)a7 userReportRequestType:(int)a8
{
  id v15 = a6;
  id v16 = a7;
  v17 = [(SFUserReportFeedback *)self initWithSelection:a3 result:a4 cardSection:a5];
  uint64_t v18 = v17;
  if (v17)
  {
    objc_storeStrong((id *)&v17->_sections, a6);
    objc_storeStrong((id *)&v18->_uploadedDataIdentifier, a7);
    v18->_reportType = a8;
  }

  return v18;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end