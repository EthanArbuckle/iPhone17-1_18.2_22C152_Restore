@interface NARGlance
+ (BOOL)supportsSecureCoding;
- (NARGlance)initWithCoder:(id)a3;
- (NSDictionary)localizedDisplayNameMap;
- (NSString)appID;
- (NSString)displayName;
- (NSString)glanceID;
- (id)debugDescription;
- (id)description;
- (void)encodeWithCoder:(id)a3;
- (void)setAppID:(id)a3;
- (void)setDisplayName:(id)a3;
- (void)setGlanceID:(id)a3;
- (void)setLocalizedDisplayNameMap:(id)a3;
@end

@implementation NARGlance

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [(NARGlance *)self appID];
  [v4 encodeObject:v5 forKey:@"appID"];

  v6 = [(NARGlance *)self displayName];
  [v4 encodeObject:v6 forKey:@"displayName"];

  v7 = [(NARGlance *)self glanceID];
  [v4 encodeObject:v7 forKey:@"glanceID"];

  id v8 = [(NARGlance *)self localizedDisplayNameMap];
  [v4 encodeObject:v8 forKey:@"localizedDisplayNameMap"];
}

- (NARGlance)initWithCoder:(id)a3
{
  id v4 = a3;
  v18.receiver = self;
  v18.super_class = (Class)NARGlance;
  v5 = [(NARGlance *)&v18 init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"appID"];
    appID = v5->_appID;
    v5->_appID = (NSString *)v6;

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"displayName"];
    displayName = v5->_displayName;
    v5->_displayName = (NSString *)v8;

    uint64_t v10 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"glanceID"];
    glanceID = v5->_glanceID;
    v5->_glanceID = (NSString *)v10;

    v12 = (void *)MEMORY[0x263EFFA08];
    uint64_t v13 = objc_opt_class();
    v14 = objc_msgSend(v12, "setWithObjects:", v13, objc_opt_class(), 0);
    uint64_t v15 = [v4 decodeObjectOfClasses:v14 forKey:@"localizedDisplayNameMap"];
    localizedDisplayNameMap = v5->_localizedDisplayNameMap;
    v5->_localizedDisplayNameMap = (NSDictionary *)v15;
  }
  return v5;
}

- (id)description
{
  v3 = NSString;
  id v4 = (objc_class *)objc_opt_class();
  v5 = NSStringFromClass(v4);
  uint64_t v6 = [v3 stringWithFormat:@"<%@ %p glanceID=%@>", v5, self, self->_glanceID];;

  return v6;
}

- (id)debugDescription
{
  v3 = NSString;
  id v4 = (objc_class *)objc_opt_class();
  v5 = NSStringFromClass(v4);
  objc_msgSend(v3, "stringWithFormat:", @"<%@ %p; glanceID=%@; displayName=%@; appID=%@>\nlocalizedDisplayNameMap=%@",
    v5,
    self,
    self->_glanceID,
    self->_displayName,
    self->_appID,
  uint64_t v6 = self->_localizedDisplayNameMap);

  return v6;
}

- (NSString)appID
{
  return self->_appID;
}

- (void)setAppID:(id)a3
{
}

- (NSString)displayName
{
  return self->_displayName;
}

- (void)setDisplayName:(id)a3
{
}

- (NSString)glanceID
{
  return self->_glanceID;
}

- (void)setGlanceID:(id)a3
{
}

- (NSDictionary)localizedDisplayNameMap
{
  return self->_localizedDisplayNameMap;
}

- (void)setLocalizedDisplayNameMap:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_localizedDisplayNameMap, 0);
  objc_storeStrong((id *)&self->_glanceID, 0);
  objc_storeStrong((id *)&self->_displayName, 0);

  objc_storeStrong((id *)&self->_appID, 0);
}

@end