@interface MRGroupSessionBannerRequest
+ (BOOL)supportsSecureCoding;
+ (id)requestWithBundleIdentifierAffinity:(id)a3 hostDisplayName:(id)a4 routeType:(unsigned __int8)a5;
- (MRGroupSessionBannerRequest)initWithBundleIdentifierAffinity:(id)a3 hostDisplayName:(id)a4 routeType:(unsigned __int8)a5;
- (MRGroupSessionBannerRequest)initWithCoder:(id)a3;
- (NSString)hostDisplayName;
- (id)description;
- (unsigned)routeType;
- (void)encodeWithCoder:(id)a3;
- (void)setHostDisplayName:(id)a3;
- (void)setRouteType:(unsigned __int8)a3;
@end

@implementation MRGroupSessionBannerRequest

+ (id)requestWithBundleIdentifierAffinity:(id)a3 hostDisplayName:(id)a4 routeType:(unsigned __int8)a5
{
  uint64_t v5 = a5;
  id v7 = a4;
  id v8 = a3;
  v9 = [[MRGroupSessionBannerRequest alloc] initWithBundleIdentifierAffinity:v8 hostDisplayName:v7 routeType:v5];

  return v9;
}

- (MRGroupSessionBannerRequest)initWithBundleIdentifierAffinity:(id)a3 hostDisplayName:(id)a4 routeType:(unsigned __int8)a5
{
  uint64_t v5 = a5;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)MRGroupSessionBannerRequest;
  v9 = [(MRBaseBannerRequest *)&v12 initWithBundleIdentifierAffinity:a3];
  v10 = v9;
  if (v9)
  {
    [(MRGroupSessionBannerRequest *)v9 setHostDisplayName:v8];
    [(MRGroupSessionBannerRequest *)v10 setRouteType:v5];
  }

  return v10;
}

- (id)description
{
  id v3 = objc_alloc(MEMORY[0x1E4F28E78]);
  v4 = (objc_class *)objc_opt_class();
  uint64_t v5 = NSStringFromClass(v4);
  v6 = (void *)[v3 initWithFormat:@"<%@ (%p): ", v5, self];

  id v7 = [(MRBaseBannerRequest *)self requestIdentifier];
  [v6 appendFormat:@" requestIdentifier: %@", v7];

  id v8 = [(MRGroupSessionBannerRequest *)self hostDisplayName];
  [v6 appendFormat:@" hostDisplayName: %@", v8];

  v9 = MRGroupSessionRouteTypeDescription(self->_routeType);
  [v6 appendFormat:@" routeType: %@", v9];

  v10 = [(MRBaseBannerRequest *)self bundleIdentifierAffinity];
  [v6 appendFormat:@" bundleIdentifierAffinity: %@", v10];

  [v6 appendString:@">"];

  return v6;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)MRGroupSessionBannerRequest;
  id v4 = a3;
  [(MRBaseBannerRequest *)&v6 encodeWithCoder:v4];
  uint64_t v5 = [(MRGroupSessionBannerRequest *)self hostDisplayName];
  [v4 encodeObject:v5 forKey:@"hdn"];

  objc_msgSend(v4, "encodeInteger:forKey:", -[MRGroupSessionBannerRequest routeType](self, "routeType"), @"rt");
}

- (MRGroupSessionBannerRequest)initWithCoder:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)MRGroupSessionBannerRequest;
  id v3 = a3;
  id v4 = [(MRBaseBannerRequest *)&v7 initWithCoder:v3];
  uint64_t v5 = objc_msgSend(v3, "decodeObjectOfClass:forKey:", objc_opt_class(), @"hdn", v7.receiver, v7.super_class);
  [(MRGroupSessionBannerRequest *)v4 setHostDisplayName:v5];

  LOBYTE(v5) = [v3 decodeIntegerForKey:@"rt"];
  [(MRGroupSessionBannerRequest *)v4 setRouteType:v5];
  return v4;
}

- (NSString)hostDisplayName
{
  return self->_hostDisplayName;
}

- (void)setHostDisplayName:(id)a3
{
}

- (unsigned)routeType
{
  return self->_routeType;
}

- (void)setRouteType:(unsigned __int8)a3
{
  self->_routeType = a3;
}

- (void).cxx_destruct
{
}

@end