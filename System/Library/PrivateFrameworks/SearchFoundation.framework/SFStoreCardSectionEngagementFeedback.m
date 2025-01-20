@interface SFStoreCardSectionEngagementFeedback
+ (BOOL)supportsSecureCoding;
- (SFStoreCardSectionEngagementFeedback)initWithCoder:(id)a3;
- (SFStoreCardSectionEngagementFeedback)initWithProductPageResult:(int64_t)a3;
- (int64_t)productPageResult;
- (void)encodeWithCoder:(id)a3;
- (void)setProductPageResult:(int64_t)a3;
@end

@implementation SFStoreCardSectionEngagementFeedback

- (void)setProductPageResult:(int64_t)a3
{
  self->_productPageResult = a3;
}

- (int64_t)productPageResult
{
  return self->_productPageResult;
}

- (void)encodeWithCoder:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)SFStoreCardSectionEngagementFeedback;
  id v4 = a3;
  [(SFCardSectionEngagementFeedback *)&v5 encodeWithCoder:v4];
  objc_msgSend(v4, "encodeInteger:forKey:", self->_productPageResult, @"_productPageResult", v5.receiver, v5.super_class);
}

- (SFStoreCardSectionEngagementFeedback)initWithCoder:(id)a3
{
  id v4 = a3;
  v7.receiver = self;
  v7.super_class = (Class)SFStoreCardSectionEngagementFeedback;
  objc_super v5 = [(SFCardSectionEngagementFeedback *)&v7 initWithCoder:v4];
  if (v5) {
    v5->_productPageResult = (int)[v4 decodeInt32ForKey:@"_productPageResult"];
  }

  return v5;
}

- (SFStoreCardSectionEngagementFeedback)initWithProductPageResult:(int64_t)a3
{
  v5.receiver = self;
  v5.super_class = (Class)SFStoreCardSectionEngagementFeedback;
  result = [(SFCardSectionEngagementFeedback *)&v5 initWithCardSection:0 destination:0 triggerEvent:2 actionCardType:3];
  if (result) {
    result->_productPageResult = a3;
  }
  return result;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end