@interface PRSWallpaperObserverSnapshotUpdate
+ (BOOL)supportsBSXPCSecureCoding;
- (NSString)description;
- (NSString)snapshotType;
- (PFServerPosterPath)path;
- (PRSWallpaperObserverSnapshotUpdate)initWithBSXPCCoder:(id)a3;
- (PRSWallpaperObserverSnapshotUpdate)initWithPath:(id)a3 snapshotType:(id)a4;
- (void)encodeWithBSXPCCoder:(id)a3;
@end

@implementation PRSWallpaperObserverSnapshotUpdate

- (PRSWallpaperObserverSnapshotUpdate)initWithPath:(id)a3 snapshotType:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v13.receiver = self;
  v13.super_class = (Class)PRSWallpaperObserverSnapshotUpdate;
  v9 = [(PRSWallpaperObserverSnapshotUpdate *)&v13 init];
  if (v9)
  {
    uint64_t v10 = [v8 copy];
    snapshotType = v9->_snapshotType;
    v9->_snapshotType = (NSString *)v10;

    objc_storeStrong((id *)&v9->_path, a3);
  }

  return v9;
}

+ (BOOL)supportsBSXPCSecureCoding
{
  return 1;
}

- (void)encodeWithBSXPCCoder:(id)a3
{
  path = self->_path;
  id v5 = a3;
  [v5 encodeObject:path forKey:@"p"];
  [v5 encodeObject:self->_snapshotType forKey:@"t"];
}

- (PRSWallpaperObserverSnapshotUpdate)initWithBSXPCCoder:(id)a3
{
  id v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)PRSWallpaperObserverSnapshotUpdate;
  id v5 = [(PRSWallpaperObserverSnapshotUpdate *)&v11 init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"p"];
    path = v5->_path;
    v5->_path = (PFServerPosterPath *)v6;

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"t"];
    snapshotType = v5->_snapshotType;
    v5->_snapshotType = (NSString *)v8;
  }
  return v5;
}

- (NSString)description
{
  snapshotType = self->_snapshotType;
  id v4 = NSString;
  id v5 = (objc_class *)objc_opt_class();
  uint64_t v6 = NSStringFromClass(v5);
  uint64_t v7 = [(PFServerPosterPath *)self->_path identity];
  uint64_t v8 = (void *)v7;
  if (snapshotType) {
    [v4 stringWithFormat:@"<%@: path=(%@) snapshotType=(%@)>", v6, v7, self->_snapshotType];
  }
  else {
  v9 = [v4 stringWithFormat:@"<%@: path=(%@)>", v6, v7, v11];
  }

  return (NSString *)v9;
}

- (PFServerPosterPath)path
{
  return self->_path;
}

- (NSString)snapshotType
{
  return self->_snapshotType;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_snapshotType, 0);
  objc_storeStrong((id *)&self->_path, 0);
}

@end