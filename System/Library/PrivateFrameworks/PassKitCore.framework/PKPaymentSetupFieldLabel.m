@interface PKPaymentSetupFieldLabel
- (BOOL)submissionStringMeetsAllRequirements;
- (NSArray)links;
- (NSString)businessChatButtonTitle;
- (NSString)businessChatIdentifier;
- (NSString)businessChatIntentName;
- (NSString)buttonTitle;
- (NSString)detailBody;
- (NSString)detailSubtitle;
- (NSString)detailTitle;
- (id)copyWithZone:(_NSZone *)a3;
- (id)submissionString;
- (unint64_t)alingment;
- (unint64_t)fieldType;
- (void)_commonUpdate;
- (void)setAlingment:(unint64_t)a3;
- (void)setBusinessChatButtonTitle:(id)a3;
- (void)setBusinessChatIdentifier:(id)a3;
- (void)setBusinessChatIntentName:(id)a3;
- (void)setButtonTitle:(id)a3;
- (void)setDetailBody:(id)a3;
- (void)setDetailSubtitle:(id)a3;
- (void)setDetailTitle:(id)a3;
- (void)setLinks:(id)a3;
- (void)updateWithAttribute:(id)a3;
- (void)updateWithConfiguration:(id)a3;
@end

@implementation PKPaymentSetupFieldLabel

- (void)updateWithAttribute:(id)a3
{
  id v4 = a3;
  v6.receiver = self;
  v6.super_class = (Class)PKPaymentSetupFieldLabel;
  [(PKPaymentSetupField *)&v6 updateWithAttribute:v4];
  [(PKPaymentSetupFieldLabel *)self _commonUpdate];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v5 = [v4 defaultValue];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      [(PKPaymentSetupField *)self setDefaultValue:v5];
    }
  }
}

- (void)updateWithConfiguration:(id)a3
{
  id v4 = a3;
  v16.receiver = self;
  v16.super_class = (Class)PKPaymentSetupFieldLabel;
  [(PKPaymentSetupField *)&v16 updateWithConfiguration:v4];
  uint64_t v5 = [v4 PKStringForKey:@"buttonTitle"];
  if (v5) {
    [(PKPaymentSetupFieldLabel *)self setButtonTitle:v5];
  }
  objc_super v6 = [v4 PKStringForKey:@"detailTitle"];
  if (v6) {
    [(PKPaymentSetupFieldLabel *)self setDetailTitle:v6];
  }
  v7 = [v4 PKStringForKey:@"detailSubtitle"];
  if (v7) {
    [(PKPaymentSetupFieldLabel *)self setDetailSubtitle:v7];
  }
  v8 = [v4 PKStringForKey:@"detailBody"];
  if (v8) {
    [(PKPaymentSetupFieldLabel *)self setDetailBody:v8];
  }
  v9 = [v4 PKStringForKey:@"businessChatIdentifier"];
  if (v9) {
    [(PKPaymentSetupFieldLabel *)self setBusinessChatIdentifier:v9];
  }
  v10 = [v4 PKStringForKey:@"businessChatButtonTitle"];
  if (v10) {
    [(PKPaymentSetupFieldLabel *)self setBusinessChatButtonTitle:v10];
  }
  v11 = [v4 PKStringForKey:@"businessChatIntentName"];
  if (v11) {
    [(PKPaymentSetupFieldLabel *)self setBusinessChatIntentName:v11];
  }
  v15 = (void *)v5;
  v12 = [v4 PKStringForKey:@"alignment"];
  v13 = v12;
  if (v12) {
    [(PKPaymentSetupFieldLabel *)self setAlingment:PKPaymentSetupFieldLabelAlignmentFromString(v12)];
  }
  v14 = [v4 PKArrayContaining:objc_opt_class() forKey:@"links"];
  if (v14) {
    [(PKPaymentSetupFieldLabel *)self setLinks:v14];
  }
  [(PKPaymentSetupFieldLabel *)self _commonUpdate];
}

- (void)_commonUpdate
{
  [(PKPaymentSetupField *)self _setLocalizedDisplayName:0];
  [(PKPaymentSetupField *)self setLocalizedPlaceholder:0];
  [(PKPaymentSetupField *)self setDisplayFormat:0];
  [(PKPaymentSetupField *)self setSubmissionKey:0];
  [(PKPaymentSetupField *)self setSubmissionDestination:0];
  [(PKPaymentSetupField *)self setRequiresSecureSubmission:0];
}

- (id)submissionString
{
  return 0;
}

- (BOOL)submissionStringMeetsAllRequirements
{
  return 1;
}

- (unint64_t)fieldType
{
  return 3;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v23.receiver = self;
  v23.super_class = (Class)PKPaymentSetupFieldLabel;
  uint64_t v5 = -[PKPaymentSetupField copyWithZone:](&v23, sel_copyWithZone_);
  uint64_t v6 = [(NSString *)self->_buttonTitle copyWithZone:a3];
  v7 = (void *)v5[17];
  v5[17] = v6;

  uint64_t v8 = [(NSString *)self->_detailTitle copyWithZone:a3];
  v9 = (void *)v5[18];
  v5[18] = v8;

  uint64_t v10 = [(NSString *)self->_detailSubtitle copyWithZone:a3];
  v11 = (void *)v5[19];
  v5[19] = v10;

  uint64_t v12 = [(NSString *)self->_detailBody copyWithZone:a3];
  v13 = (void *)v5[20];
  v5[20] = v12;

  uint64_t v14 = [(NSString *)self->_businessChatButtonTitle copyWithZone:a3];
  v15 = (void *)v5[21];
  v5[21] = v14;

  uint64_t v16 = [(NSString *)self->_businessChatIdentifier copyWithZone:a3];
  v17 = (void *)v5[22];
  v5[22] = v16;

  uint64_t v18 = [(NSString *)self->_businessChatIntentName copyWithZone:a3];
  v19 = (void *)v5[23];
  v5[23] = v18;

  v5[24] = self->_alingment;
  uint64_t v20 = [(NSArray *)self->_links copyWithZone:a3];
  v21 = (void *)v5[25];
  v5[25] = v20;

  return v5;
}

- (NSString)buttonTitle
{
  return self->_buttonTitle;
}

- (void)setButtonTitle:(id)a3
{
}

- (NSString)detailTitle
{
  return self->_detailTitle;
}

- (void)setDetailTitle:(id)a3
{
}

- (NSString)detailSubtitle
{
  return self->_detailSubtitle;
}

- (void)setDetailSubtitle:(id)a3
{
}

- (NSString)detailBody
{
  return self->_detailBody;
}

- (void)setDetailBody:(id)a3
{
}

- (NSString)businessChatButtonTitle
{
  return self->_businessChatButtonTitle;
}

- (void)setBusinessChatButtonTitle:(id)a3
{
}

- (NSString)businessChatIdentifier
{
  return self->_businessChatIdentifier;
}

- (void)setBusinessChatIdentifier:(id)a3
{
}

- (NSString)businessChatIntentName
{
  return self->_businessChatIntentName;
}

- (void)setBusinessChatIntentName:(id)a3
{
}

- (unint64_t)alingment
{
  return self->_alingment;
}

- (void)setAlingment:(unint64_t)a3
{
  self->_alingment = a3;
}

- (NSArray)links
{
  return self->_links;
}

- (void)setLinks:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_links, 0);
  objc_storeStrong((id *)&self->_businessChatIntentName, 0);
  objc_storeStrong((id *)&self->_businessChatIdentifier, 0);
  objc_storeStrong((id *)&self->_businessChatButtonTitle, 0);
  objc_storeStrong((id *)&self->_detailBody, 0);
  objc_storeStrong((id *)&self->_detailSubtitle, 0);
  objc_storeStrong((id *)&self->_detailTitle, 0);
  objc_storeStrong((id *)&self->_buttonTitle, 0);
}

@end