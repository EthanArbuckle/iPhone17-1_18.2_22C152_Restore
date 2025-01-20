@interface SFClientSubCredentialParams
+ (BOOL)supportsSecureCoding;
- (NSArray)adamIDs;
- (NSString)adamID;
- (NSString)issuerID;
- (NSString)subtitle;
- (NSString)title;
- (SFClientSubCredentialParams)initWithCoder:(id)a3;
- (void)encodeWithCoder:(id)a3;
- (void)setAdamID:(id)a3;
- (void)setAdamIDs:(id)a3;
- (void)setIssuerID:(id)a3;
- (void)setSubtitle:(id)a3;
- (void)setTitle:(id)a3;
@end

@implementation SFClientSubCredentialParams

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (SFClientSubCredentialParams)initWithCoder:(id)a3
{
  id v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)SFClientSubCredentialParams;
  v5 = [(SFClientSubCredentialParams *)&v12 init];
  if (v5)
  {
    id v6 = v4;
    objc_opt_class();
    NSDecodeObjectIfPresent();

    objc_opt_class();
    NSDecodeNSArrayOfClassIfPresent();
    id v7 = v6;
    objc_opt_class();
    NSDecodeObjectIfPresent();

    id v8 = v7;
    objc_opt_class();
    NSDecodeObjectIfPresent();

    id v9 = v8;
    objc_opt_class();
    NSDecodeObjectIfPresent();

    v10 = v5;
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  adamID = self->_adamID;
  id v10 = v4;
  if (adamID)
  {
    [v4 encodeObject:adamID forKey:@"aID"];
    id v4 = v10;
  }
  adamIDs = self->_adamIDs;
  if (adamIDs)
  {
    [v10 encodeObject:adamIDs forKey:@"aIDs"];
    id v4 = v10;
  }
  title = self->_title;
  if (title)
  {
    [v10 encodeObject:title forKey:@"tle"];
    id v4 = v10;
  }
  subtitle = self->_subtitle;
  if (subtitle)
  {
    [v10 encodeObject:subtitle forKey:@"subt"];
    id v4 = v10;
  }
  issuerID = self->_issuerID;
  if (issuerID)
  {
    [v10 encodeObject:issuerID forKey:@"issID"];
    id v4 = v10;
  }
}

- (NSString)adamID
{
  return self->_adamID;
}

- (void)setAdamID:(id)a3
{
}

- (NSArray)adamIDs
{
  return self->_adamIDs;
}

- (void)setAdamIDs:(id)a3
{
}

- (NSString)title
{
  return self->_title;
}

- (void)setTitle:(id)a3
{
}

- (NSString)subtitle
{
  return self->_subtitle;
}

- (void)setSubtitle:(id)a3
{
}

- (NSString)issuerID
{
  return self->_issuerID;
}

- (void)setIssuerID:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_issuerID, 0);
  objc_storeStrong((id *)&self->_subtitle, 0);
  objc_storeStrong((id *)&self->_title, 0);
  objc_storeStrong((id *)&self->_adamIDs, 0);

  objc_storeStrong((id *)&self->_adamID, 0);
}

@end