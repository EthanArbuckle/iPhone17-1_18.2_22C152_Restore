@interface PRSWallpaperObserverPathUpdate
+ (BOOL)supportsBSXPCSecureCoding;
- (NSString)description;
- (PFServerPosterIdentity)identity;
- (PFServerPosterPath)path;
- (PRSWallpaperObserverPathUpdate)initWithBSXPCCoder:(id)a3;
- (unint64_t)changed;
- (unint64_t)locations;
- (void)encodeWithBSXPCCoder:(id)a3;
- (void)setChanged:(unint64_t)a3;
- (void)setIdentity:(id)a3;
- (void)setLocations:(unint64_t)a3;
- (void)setPath:(id)a3;
@end

@implementation PRSWallpaperObserverPathUpdate

+ (BOOL)supportsBSXPCSecureCoding
{
  return 1;
}

- (void)encodeWithBSXPCCoder:(id)a3
{
  path = self->_path;
  id v5 = a3;
  [v5 encodeObject:path forKey:@"p"];
  [v5 encodeObject:self->_identity forKey:@"i"];
  [v5 encodeUInt64:self->_locations forKey:@"l"];
  [v5 encodeUInt64:self->_changed forKey:@"c"];
}

- (PRSWallpaperObserverPathUpdate)initWithBSXPCCoder:(id)a3
{
  id v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)PRSWallpaperObserverPathUpdate;
  id v5 = [(PRSWallpaperObserverPathUpdate *)&v11 init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"p"];
    path = v5->_path;
    v5->_path = (PFServerPosterPath *)v6;

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"i"];
    identity = v5->_identity;
    v5->_identity = (PFServerPosterIdentity *)v8;

    v5->_locations = [v4 decodeUInt64ForKey:@"l"];
    v5->_changed = [v4 decodeUInt64ForKey:@"c"];
  }

  return v5;
}

- (NSString)description
{
  path = self->_path;
  id v4 = NSString;
  id v5 = (objc_class *)objc_opt_class();
  uint64_t v6 = NSStringFromClass(v5);
  v7 = PRSWallpaperObserverLocationsDescription(self->_locations);
  uint64_t v8 = PRSWallpaperObserverLocationsDescription(self->_changed);
  v9 = (void *)v8;
  if (path)
  {
    v10 = [(PFServerPosterPath *)self->_path identity];
    objc_super v11 = [v4 stringWithFormat:@"<%@: locs=(%@) changed=(%@) path=%@>", v6, v7, v9, v10];
  }
  else
  {
    objc_super v11 = [v4 stringWithFormat:@"<%@: locs=(%@) changed=(%@) identity=%@>", v6, v7, v8, self->_identity];
  }

  return (NSString *)v11;
}

- (PFServerPosterPath)path
{
  return self->_path;
}

- (void)setPath:(id)a3
{
}

- (PFServerPosterIdentity)identity
{
  return self->_identity;
}

- (void)setIdentity:(id)a3
{
}

- (unint64_t)locations
{
  return self->_locations;
}

- (void)setLocations:(unint64_t)a3
{
  self->_locations = a3;
}

- (unint64_t)changed
{
  return self->_changed;
}

- (void)setChanged:(unint64_t)a3
{
  self->_changed = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_identity, 0);
  objc_storeStrong((id *)&self->_path, 0);
}

@end