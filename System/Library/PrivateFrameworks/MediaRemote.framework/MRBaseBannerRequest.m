@interface MRBaseBannerRequest
+ (BOOL)supportsSecureCoding;
+ (id)requestWithBundleIdentifierAffinity:(id)a3;
- (BOOL)isEqual:(id)a3;
- (MRBaseBannerRequest)initWithBundleIdentifierAffinity:(id)a3;
- (MRBaseBannerRequest)initWithCoder:(id)a3;
- (NSString)bundleIdentifierAffinity;
- (NSString)description;
- (NSString)requestIdentifier;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
- (void)setBundleIdentifierAffinity:(id)a3;
- (void)setRequestIdentifier:(id)a3;
@end

@implementation MRBaseBannerRequest

+ (id)requestWithBundleIdentifierAffinity:(id)a3
{
  id v3 = a3;
  v4 = [[MRBaseBannerRequest alloc] initWithBundleIdentifierAffinity:v3];

  return v4;
}

- (MRBaseBannerRequest)initWithBundleIdentifierAffinity:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)MRBaseBannerRequest;
  v5 = [(MRBaseBannerRequest *)&v9 init];
  if (v5)
  {
    v6 = [MEMORY[0x1E4F29128] UUID];
    v7 = [v6 UUIDString];
    [(MRBaseBannerRequest *)v5 setRequestIdentifier:v7];

    [(MRBaseBannerRequest *)v5 setBundleIdentifierAffinity:v4];
  }

  return v5;
}

- (NSString)description
{
  id v3 = objc_alloc(MEMORY[0x1E4F28E78]);
  id v4 = (objc_class *)objc_opt_class();
  v5 = NSStringFromClass(v4);
  v6 = (void *)[v3 initWithFormat:@"<%@ (%p): ", v5, self];

  v7 = [(MRBaseBannerRequest *)self requestIdentifier];
  [v6 appendFormat:@" requestIdentifier: %@", v7];

  v8 = [(MRBaseBannerRequest *)self bundleIdentifierAffinity];
  [v6 appendFormat:@" bundleIdentifierAffinity: %@", v8];

  [v6 appendString:@">"];

  return (NSString *)v6;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [(MRBaseBannerRequest *)self requestIdentifier];
  [v4 encodeObject:v5 forKey:@"rid"];

  id v6 = [(MRBaseBannerRequest *)self bundleIdentifierAffinity];
  [v4 encodeObject:v6 forKey:@"bida"];
}

- (MRBaseBannerRequest)initWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"rid"];
  [(MRBaseBannerRequest *)self setRequestIdentifier:v5];

  id v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"bida"];

  [(MRBaseBannerRequest *)self setBundleIdentifierAffinity:v6];
  return self;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (MRBaseBannerRequest *)a3;
  if (v4 == self)
  {
    char v8 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v5 = v4;
      id v6 = [(MRBaseBannerRequest *)self requestIdentifier];
      v7 = [(MRBaseBannerRequest *)v5 requestIdentifier];

      char v8 = [v6 isEqual:v7];
    }
    else
    {
      char v8 = 0;
    }
  }

  return v8;
}

- (unint64_t)hash
{
  v2 = [(MRBaseBannerRequest *)self requestIdentifier];
  unint64_t v3 = [v2 hash];

  return v3;
}

- (NSString)requestIdentifier
{
  return self->_requestIdentifier;
}

- (void)setRequestIdentifier:(id)a3
{
}

- (NSString)bundleIdentifierAffinity
{
  return self->_bundleIdentifierAffinity;
}

- (void)setBundleIdentifierAffinity:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_bundleIdentifierAffinity, 0);

  objc_storeStrong((id *)&self->_requestIdentifier, 0);
}

@end