@interface PKApplyFooterContentLink
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (NSString)analyticsIdentifier;
- (NSString)linkText;
- (NSString)termsIdentifier;
- (NSURL)linkURL;
- (PKApplyFooterContentLink)initWithCoder:(id)a3;
- (PKApplyFooterContentLink)initWithDictionary:(id)a3;
- (_NSRange)linkRange;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
- (void)setAnalyticsIdentifier:(id)a3;
- (void)setLinkRange:(_NSRange)a3;
- (void)setLinkText:(id)a3;
- (void)setLinkURL:(id)a3;
- (void)setTermsIdentifier:(id)a3;
@end

@implementation PKApplyFooterContentLink

- (PKApplyFooterContentLink)initWithDictionary:(id)a3
{
  id v4 = a3;
  v17.receiver = self;
  v17.super_class = (Class)PKApplyFooterContentLink;
  v5 = [(PKApplyFooterContentLink *)&v17 init];
  if (v5)
  {
    uint64_t v6 = [v4 PKStringForKey:@"linkText"];
    linkText = v5->_linkText;
    v5->_linkText = (NSString *)v6;

    uint64_t v8 = [v4 PKIntegerForKey:@"linkLocation"];
    uint64_t v9 = [v4 PKIntegerForKey:@"linkLength"];
    if (v9 >= 1)
    {
      v5->_linkRange.location = v8;
      v5->_linkRange.length = v9;
    }
    uint64_t v10 = [v4 PKURLForKey:@"linkURL"];
    linkURL = v5->_linkURL;
    v5->_linkURL = (NSURL *)v10;

    uint64_t v12 = [v4 PKStringForKey:@"termsIdentifier"];
    termsIdentifier = v5->_termsIdentifier;
    v5->_termsIdentifier = (NSString *)v12;

    uint64_t v14 = [v4 PKStringForKey:@"analyticsIdentifier"];
    analyticsIdentifier = v5->_analyticsIdentifier;
    v5->_analyticsIdentifier = (NSString *)v14;
  }
  return v5;
}

- (id)dictionaryRepresentation
{
  id v3 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  [v3 setObject:self->_linkText forKeyedSubscript:@"linkText"];
  id v4 = NSStringFromRange(self->_linkRange);
  [v3 setObject:v4 forKeyedSubscript:@"linkRange"];

  v5 = [(NSURL *)self->_linkURL absoluteString];
  [v3 setObject:v5 forKeyedSubscript:@"linkURL"];

  [v3 setObject:self->_termsIdentifier forKeyedSubscript:@"termsIdentifier"];
  [v3 setObject:self->_analyticsIdentifier forKeyedSubscript:@"analyticsIdentifier"];
  uint64_t v6 = (void *)[v3 copy];

  return v6;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (PKApplyFooterContentLink *)a3;
  v5 = v4;
  if (self == v4)
  {
    BOOL v12 = 1;
  }
  else
  {
    if (v4)
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        uint64_t v6 = v5;
        linkText = v6->_linkText;
        uint64_t v8 = self->_linkText;
        uint64_t v9 = linkText;
        if (v8 == v9)
        {
        }
        else
        {
          uint64_t v10 = v9;
          if (!v8 || !v9) {
            goto LABEL_28;
          }
          BOOL v11 = [(NSString *)v8 isEqualToString:v9];

          if (!v11) {
            goto LABEL_29;
          }
        }
        linkURL = self->_linkURL;
        uint64_t v14 = v6->_linkURL;
        if (linkURL && v14)
        {
          if ((-[NSURL isEqual:](linkURL, "isEqual:") & 1) == 0) {
            goto LABEL_29;
          }
        }
        else if (linkURL != v14)
        {
          goto LABEL_29;
        }
        termsIdentifier = v6->_termsIdentifier;
        uint64_t v8 = self->_termsIdentifier;
        v16 = termsIdentifier;
        if (v8 == v16)
        {
        }
        else
        {
          uint64_t v10 = v16;
          if (!v8 || !v16) {
            goto LABEL_28;
          }
          BOOL v17 = [(NSString *)v8 isEqualToString:v16];

          if (!v17) {
            goto LABEL_29;
          }
        }
        analyticsIdentifier = v6->_analyticsIdentifier;
        uint64_t v8 = self->_analyticsIdentifier;
        v19 = analyticsIdentifier;
        if (v8 == v19)
        {

LABEL_33:
          if (self->_linkRange.location == v6->_linkRange.location)
          {
            BOOL v12 = self->_linkRange.length == v6->_linkRange.length;
            goto LABEL_30;
          }
LABEL_29:
          BOOL v12 = 0;
LABEL_30:

          goto LABEL_31;
        }
        uint64_t v10 = v19;
        if (v8 && v19)
        {
          BOOL v20 = [(NSString *)v8 isEqualToString:v19];

          if (!v20) {
            goto LABEL_29;
          }
          goto LABEL_33;
        }
LABEL_28:

        goto LABEL_29;
      }
    }
    BOOL v12 = 0;
  }
LABEL_31:

  return v12;
}

- (unint64_t)hash
{
  id v3 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  [v3 safelyAddObject:self->_linkText];
  [v3 safelyAddObject:self->_linkURL];
  [v3 safelyAddObject:self->_termsIdentifier];
  [v3 safelyAddObject:self->_analyticsIdentifier];
  uint64_t v4 = PKCombinedHash(17, v3);
  NSUInteger v5 = self->_linkRange.location - v4 + 32 * v4;
  unint64_t v6 = self->_linkRange.length - v5 + 32 * v5;

  return v6;
}

- (id)description
{
  id v3 = [MEMORY[0x1E4F28E78] stringWithFormat:@"<%@: %p; ", objc_opt_class(), self];
  uint64_t v4 = v3;
  if (self->_linkText) {
    [v3 appendFormat:@"linkText: '%@'; ", self->_linkText];
  }
  if (self->_linkURL) {
    [v4 appendFormat:@"termsIdentifier: '%@'; ", self->_termsIdentifier];
  }
  if (self->_termsIdentifier) {
    [v4 appendFormat:@"termsIdentifier: '%@'; ", self->_termsIdentifier];
  }
  if (self->_analyticsIdentifier) {
    [v4 appendFormat:@"analyticsIdentifier: '%@'; ", self->_analyticsIdentifier];
  }
  v5.length = self->_linkRange.length;
  if (v5.length)
  {
    v5.location = self->_linkRange.location;
    unint64_t v6 = NSStringFromRange(v5);
    [v4 appendFormat:@"linkRange: '%@'; ", v6];
  }
  [v4 appendFormat:@">"];
  v7 = (void *)[v4 copy];

  return v7;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (PKApplyFooterContentLink)initWithCoder:(id)a3
{
  id v4 = a3;
  v17.receiver = self;
  v17.super_class = (Class)PKApplyFooterContentLink;
  NSRange v5 = [(PKApplyFooterContentLink *)&v17 init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"linkText"];
    linkText = v5->_linkText;
    v5->_linkText = (NSString *)v6;

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"linkURL"];
    linkURL = v5->_linkURL;
    v5->_linkURL = (NSURL *)v8;

    uint64_t v10 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"termsIdentifier"];
    termsIdentifier = v5->_termsIdentifier;
    v5->_termsIdentifier = (NSString *)v10;

    uint64_t v12 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"analyticsIdentifier"];
    analyticsIdentifier = v5->_analyticsIdentifier;
    v5->_analyticsIdentifier = (NSString *)v12;

    uint64_t v14 = [v4 decodeIntegerForKey:@"linkLocation"];
    uint64_t v15 = [v4 decodeIntegerForKey:@"linkLength"];
    if (v15 >= 1)
    {
      v5->_linkRange.location = v14;
      v5->_linkRange.length = v15;
    }
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  linkText = self->_linkText;
  id v5 = a3;
  [v5 encodeObject:linkText forKey:@"linkText"];
  [v5 encodeObject:self->_linkURL forKey:@"linkURL"];
  [v5 encodeObject:self->_termsIdentifier forKey:@"termsIdentifier"];
  [v5 encodeObject:self->_analyticsIdentifier forKey:@"analyticsIdentifier"];
  [v5 encodeInteger:self->_linkRange.location forKey:@"linkLocation"];
  [v5 encodeInteger:self->_linkRange.length forKey:@"linkLength"];
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v5 = [+[PKApplyFooterContentLink allocWithZone:](PKApplyFooterContentLink, "allocWithZone:") init];
  uint64_t v6 = [(NSString *)self->_linkText copyWithZone:a3];
  linkText = v5->_linkText;
  v5->_linkText = (NSString *)v6;

  uint64_t v8 = [(NSURL *)self->_linkURL copyWithZone:a3];
  linkURL = v5->_linkURL;
  v5->_linkURL = (NSURL *)v8;

  uint64_t v10 = [(NSString *)self->_termsIdentifier copyWithZone:a3];
  termsIdentifier = v5->_termsIdentifier;
  v5->_termsIdentifier = (NSString *)v10;

  uint64_t v12 = [(NSString *)self->_analyticsIdentifier copyWithZone:a3];
  analyticsIdentifier = v5->_analyticsIdentifier;
  v5->_analyticsIdentifier = (NSString *)v12;

  v5->_linkRange = self->_linkRange;
  return v5;
}

- (NSString)linkText
{
  return self->_linkText;
}

- (void)setLinkText:(id)a3
{
}

- (_NSRange)linkRange
{
  NSUInteger length = self->_linkRange.length;
  NSUInteger location = self->_linkRange.location;
  result.NSUInteger length = length;
  result.NSUInteger location = location;
  return result;
}

- (void)setLinkRange:(_NSRange)a3
{
  self->_linkRange = a3;
}

- (NSURL)linkURL
{
  return self->_linkURL;
}

- (void)setLinkURL:(id)a3
{
}

- (NSString)termsIdentifier
{
  return self->_termsIdentifier;
}

- (void)setTermsIdentifier:(id)a3
{
}

- (NSString)analyticsIdentifier
{
  return self->_analyticsIdentifier;
}

- (void)setAnalyticsIdentifier:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_analyticsIdentifier, 0);
  objc_storeStrong((id *)&self->_termsIdentifier, 0);
  objc_storeStrong((id *)&self->_linkURL, 0);
  objc_storeStrong((id *)&self->_linkText, 0);
}

@end