@interface SFVisibleSectionHeaderFeedback
+ (BOOL)supportsSecureCoding;
- (SFResultSection)section;
- (SFVisibleSectionHeaderFeedback)initWithCoder:(id)a3;
- (SFVisibleSectionHeaderFeedback)initWithSection:(id)a3 headerType:(unint64_t)a4;
- (unint64_t)headerType;
- (void)encodeWithCoder:(id)a3;
- (void)setHeaderType:(unint64_t)a3;
- (void)setSection:(id)a3;
@end

@implementation SFVisibleSectionHeaderFeedback

- (void).cxx_destruct
{
}

- (void)setHeaderType:(unint64_t)a3
{
  self->_headerType = a3;
}

- (unint64_t)headerType
{
  return self->_headerType;
}

- (void)setSection:(id)a3
{
}

- (SFResultSection)section
{
  return self->_section;
}

- (void)encodeWithCoder:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)SFVisibleSectionHeaderFeedback;
  id v4 = a3;
  [(SFFeedback *)&v5 encodeWithCoder:v4];
  objc_msgSend(v4, "encodeObject:forKey:", self->_section, @"_section", v5.receiver, v5.super_class);
  [v4 encodeInteger:self->_headerType forKey:@"_headerType"];
}

- (SFVisibleSectionHeaderFeedback)initWithCoder:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)SFVisibleSectionHeaderFeedback;
  objc_super v5 = [(SFFeedback *)&v9 initWithCoder:v4];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_section"];
    section = v5->_section;
    v5->_section = (SFResultSection *)v6;

    v5->_headerType = [v4 decodeIntegerForKey:@"_headerType"];
  }

  return v5;
}

- (SFVisibleSectionHeaderFeedback)initWithSection:(id)a3 headerType:(unint64_t)a4
{
  id v6 = a3;
  v13.receiver = self;
  v13.super_class = (Class)SFVisibleSectionHeaderFeedback;
  v7 = [(SFFeedback *)&v13 init];
  if (v7)
  {
    uint64_t v8 = [v6 copy];
    section = v7->_section;
    v7->_section = (SFResultSection *)v8;

    v7->_headerType = a4;
    v10 = [(SFResultSection *)v7->_section results];
    v11 = [v10 firstObject];
    v7->super._queryId = [v11 queryId];
  }
  return v7;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end