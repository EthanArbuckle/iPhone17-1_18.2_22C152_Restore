@interface MRGroupSessionHostInfo
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (BOOL)isInAppBannerAllowed;
- (BOOL)isLockScreenAffordanceAllowed;
- (MRGroupSessionHostInfo)initWithCoder:(id)a3;
- (MRGroupSessionHostInfo)initWithRouteType:(unsigned __int8)a3 displayName:(id)a4;
- (MRGroupSessionHostInfo)initWithRouteType:(unsigned __int8)a3 displayName:(id)a4 modelIdentifier:(id)a5 color:(id)a6;
- (NSString)color;
- (NSString)displayName;
- (NSString)localizedSessionName;
- (NSString)modelIdentifier;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (unint64_t)hash;
- (unsigned)routeType;
- (void)encodeWithCoder:(id)a3;
@end

@implementation MRGroupSessionHostInfo

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (MRGroupSessionHostInfo)initWithRouteType:(unsigned __int8)a3 displayName:(id)a4 modelIdentifier:(id)a5 color:(id)a6
{
  id v10 = a4;
  id v11 = a5;
  id v12 = a6;
  v22.receiver = self;
  v22.super_class = (Class)MRGroupSessionHostInfo;
  v13 = [(MRGroupSessionHostInfo *)&v22 init];
  v14 = v13;
  if (v13)
  {
    v13->_routeType = a3;
    uint64_t v15 = [v10 copy];
    displayName = v14->_displayName;
    v14->_displayName = (NSString *)v15;

    uint64_t v17 = [v11 copy];
    modelIdentifier = v14->_modelIdentifier;
    v14->_modelIdentifier = (NSString *)v17;

    uint64_t v19 = [v12 copy];
    color = v14->_color;
    v14->_color = (NSString *)v19;
  }
  return v14;
}

- (MRGroupSessionHostInfo)initWithRouteType:(unsigned __int8)a3 displayName:(id)a4
{
  return [(MRGroupSessionHostInfo *)self initWithRouteType:a3 displayName:a4 modelIdentifier:0 color:0];
}

- (MRGroupSessionHostInfo)initWithCoder:(id)a3
{
  id v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)MRGroupSessionHostInfo;
  v5 = [(MRGroupSessionHostInfo *)&v13 init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"dn"];
    displayName = v5->_displayName;
    v5->_displayName = (NSString *)v6;

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"dm"];
    modelIdentifier = v5->_modelIdentifier;
    v5->_modelIdentifier = (NSString *)v8;

    uint64_t v10 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"dc"];
    color = v5->_color;
    v5->_color = (NSString *)v10;

    v5->_routeType = [v4 decodeIntForKey:@"rt"];
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  uint64_t routeType = self->_routeType;
  id v5 = a3;
  [v5 encodeInt:routeType forKey:@"rt"];
  [v5 encodeObject:self->_displayName forKey:@"dn"];
  [v5 encodeObject:self->_modelIdentifier forKey:@"dm"];
  [v5 encodeObject:self->_color forKey:@"dc"];
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = [MRGroupSessionHostInfo alloc];
  uint64_t routeType = self->_routeType;
  displayName = self->_displayName;
  modelIdentifier = self->_modelIdentifier;
  color = self->_color;

  return [(MRGroupSessionHostInfo *)v4 initWithRouteType:routeType displayName:displayName modelIdentifier:modelIdentifier color:color];
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (MRGroupSessionHostInfo *)a3;
  if (v4 == self)
  {
    BOOL v9 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v5 = v4;
      displayName = self->_displayName;
      v7 = [(MRGroupSessionHostInfo *)v5 displayName];
      if ([(NSString *)displayName isEqual:v7])
      {
        int routeType = self->_routeType;
        BOOL v9 = routeType == [(MRGroupSessionHostInfo *)v5 routeType];
      }
      else
      {
        BOOL v9 = 0;
      }
    }
    else
    {
      BOOL v9 = 0;
    }
  }

  return v9;
}

- (id)description
{
  v3 = NSString;
  uint64_t v4 = objc_opt_class();
  displayName = self->_displayName;
  uint64_t v6 = MRGroupSessionRouteTypeDescription(self->_routeType);
  v7 = [v3 stringWithFormat:@"<%@: %p displayName=%@ routeType=%@ modelID=%@>", v4, self, displayName, v6, self->_modelIdentifier];

  return v7;
}

- (unint64_t)hash
{
  NSUInteger v3 = [(NSString *)self->_displayName hash];
  uint64_t v4 = [NSNumber numberWithUnsignedChar:self->_routeType];
  unint64_t v5 = [v4 hash] ^ v3;

  return v5;
}

- (NSString)localizedSessionName
{
  return (NSString *)MRGroupSessionRouteMakeName(self->_displayName, self->_routeType);
}

- (BOOL)isLockScreenAffordanceAllowed
{
  return [(MRGroupSessionHostInfo *)self routeType] - 1 < 2;
}

- (BOOL)isInAppBannerAllowed
{
  v2 = [(MRGroupSessionHostInfo *)self modelIdentifier];
  char v3 = [v2 containsString:@"AudioAccessory"] ^ 1;

  return v3;
}

- (NSString)displayName
{
  return self->_displayName;
}

- (unsigned)routeType
{
  return self->_routeType;
}

- (NSString)modelIdentifier
{
  return self->_modelIdentifier;
}

- (NSString)color
{
  return self->_color;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_color, 0);
  objc_storeStrong((id *)&self->_modelIdentifier, 0);

  objc_storeStrong((id *)&self->_displayName, 0);
}

@end