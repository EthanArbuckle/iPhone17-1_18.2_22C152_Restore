@interface SFMapCardSectionEngagementFeedback
+ (BOOL)supportsSecureCoding;
- (NSData)modifiedPlacemarkData;
- (SFMapCardSectionEngagementFeedback)initWithCoder:(id)a3;
- (void)encodeWithCoder:(id)a3;
- (void)setModifiedPlacemarkData:(id)a3;
@end

@implementation SFMapCardSectionEngagementFeedback

- (void).cxx_destruct
{
}

- (void)setModifiedPlacemarkData:(id)a3
{
}

- (NSData)modifiedPlacemarkData
{
  return self->_modifiedPlacemarkData;
}

- (void)encodeWithCoder:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)SFMapCardSectionEngagementFeedback;
  id v4 = a3;
  [(SFCardSectionEngagementFeedback *)&v7 encodeWithCoder:v4];
  modifiedPlacemarkData = self->_modifiedPlacemarkData;
  v6 = NSStringFromSelector(sel_modifiedPlacemarkData);
  objc_msgSend(v4, "encodeObject:forKey:", modifiedPlacemarkData, v6, v7.receiver, v7.super_class);
}

- (SFMapCardSectionEngagementFeedback)initWithCoder:(id)a3
{
  id v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)SFMapCardSectionEngagementFeedback;
  v5 = [(SFCardSectionEngagementFeedback *)&v11 initWithCoder:v4];
  if (v5)
  {
    uint64_t v6 = objc_opt_class();
    objc_super v7 = NSStringFromSelector(sel_modifiedPlacemarkData);
    uint64_t v8 = [v4 decodeObjectOfClass:v6 forKey:v7];
    modifiedPlacemarkData = v5->_modifiedPlacemarkData;
    v5->_modifiedPlacemarkData = (NSData *)v8;
  }
  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end