@interface MRRouteBannerRequest
+ (BOOL)supportsSecureCoding;
+ (id)requestWithStaticRequest:(id)a3;
- (MRRouteBannerRequest)initWithCoder:(id)a3;
- (MRRouteBannerRequest)initWithRouteIdentifier:(id)a3 staticRequest:(id)a4;
- (MRStaticRouteBannerRequest)staticRequest;
- (NSString)routeIdentifier;
- (id)description;
- (unint64_t)bannerType;
- (void)encodeWithCoder:(id)a3;
- (void)setBannerType:(unint64_t)a3;
- (void)setRouteIdentifier:(id)a3;
- (void)setStaticRequest:(id)a3;
@end

@implementation MRRouteBannerRequest

+ (id)requestWithStaticRequest:(id)a3
{
  id v4 = a3;
  id v5 = objc_alloc((Class)a1);
  v6 = [v4 routeIdentifier];
  v7 = (void *)[v5 initWithRouteIdentifier:v6 staticRequest:v4];

  return v7;
}

- (MRRouteBannerRequest)initWithRouteIdentifier:(id)a3 staticRequest:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v11.receiver = self;
  v11.super_class = (Class)MRRouteBannerRequest;
  v8 = [(MRBaseBannerRequest *)&v11 initWithBundleIdentifierAffinity:0];
  v9 = v8;
  if (v8)
  {
    [(MRRouteBannerRequest *)v8 setRouteIdentifier:v6];
    [(MRRouteBannerRequest *)v9 setStaticRequest:v7];
  }

  return v9;
}

- (id)description
{
  id v3 = objc_alloc(MEMORY[0x1E4F28E78]);
  id v4 = (objc_class *)objc_opt_class();
  id v5 = NSStringFromClass(v4);
  id v6 = (void *)[v3 initWithFormat:@"<%@ (%p): ", v5, self];

  id v7 = [(MRBaseBannerRequest *)self requestIdentifier];
  [v6 appendFormat:@" requestIdentifier: %@", v7];

  v8 = [(MRRouteBannerRequest *)self routeIdentifier];
  [v6 appendFormat:@" routeIdentifier: %@", v8];

  v9 = [(MRBaseBannerRequest *)self bundleIdentifierAffinity];
  [v6 appendFormat:@" bundleIdentifierAffinity: %@", v9];

  objc_msgSend(v6, "appendFormat:", @" bannerType: %lu", -[MRRouteBannerRequest bannerType](self, "bannerType"));
  v10 = [(MRRouteBannerRequest *)self staticRequest];
  uint64_t v11 = [v10 description];
  v12 = (void *)v11;
  v13 = @"<none>";
  if (v11) {
    v13 = (__CFString *)v11;
  }
  [v6 appendFormat:@" staticRequest: %@", v13];

  [v6 appendString:@">"];

  return v6;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)MRRouteBannerRequest;
  id v4 = a3;
  [(MRBaseBannerRequest *)&v7 encodeWithCoder:v4];
  id v5 = [(MRRouteBannerRequest *)self routeIdentifier];
  [v4 encodeObject:v5 forKey:@"odid"];

  objc_msgSend(v4, "encodeInt64:forKey:", -[MRRouteBannerRequest bannerType](self, "bannerType"), @"rbt");
  id v6 = [(MRRouteBannerRequest *)self staticRequest];
  [v4 encodeObject:v6 forKey:@"sr"];
}

- (MRRouteBannerRequest)initWithCoder:(id)a3
{
  v8.receiver = self;
  v8.super_class = (Class)MRRouteBannerRequest;
  id v3 = a3;
  id v4 = [(MRBaseBannerRequest *)&v8 initWithCoder:v3];
  id v5 = objc_msgSend(v3, "decodeObjectOfClass:forKey:", objc_opt_class(), @"odid", v8.receiver, v8.super_class);
  [(MRRouteBannerRequest *)v4 setRouteIdentifier:v5];

  -[MRRouteBannerRequest setBannerType:](v4, "setBannerType:", [v3 decodeInt64ForKey:@"rbt"]);
  id v6 = [v3 decodeObjectOfClass:objc_opt_class() forKey:@"sr"];

  [(MRRouteBannerRequest *)v4 setStaticRequest:v6];
  return v4;
}

- (NSString)routeIdentifier
{
  return self->_routeIdentifier;
}

- (void)setRouteIdentifier:(id)a3
{
}

- (unint64_t)bannerType
{
  return self->_bannerType;
}

- (void)setBannerType:(unint64_t)a3
{
  self->_bannerType = a3;
}

- (MRStaticRouteBannerRequest)staticRequest
{
  return self->_staticRequest;
}

- (void)setStaticRequest:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_staticRequest, 0);

  objc_storeStrong((id *)&self->_routeIdentifier, 0);
}

@end