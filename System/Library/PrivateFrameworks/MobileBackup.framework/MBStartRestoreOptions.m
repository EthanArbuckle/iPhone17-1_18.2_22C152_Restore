@interface MBStartRestoreOptions
+ (BOOL)supportsSecureCoding;
- (MBCellularAccess)cellularAccess;
- (MBStartRestoreOptions)initWithCoder:(id)a3;
- (NSSet)excludedAppBundleIDs;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (void)encodeWithCoder:(id)a3;
- (void)setCellularAccess:(id)a3;
- (void)setExcludedAppBundleIDs:(id)a3;
@end

@implementation MBStartRestoreOptions

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [(MBStartRestoreOptions *)self cellularAccess];
  [v4 encodeObject:v5 forKey:@"cellularAccess"];

  id v6 = [(MBStartRestoreOptions *)self excludedAppBundleIDs];
  [v4 encodeObject:v6 forKey:@"excludedAppBundleIDs"];
}

- (MBStartRestoreOptions)initWithCoder:(id)a3
{
  id v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)MBStartRestoreOptions;
  v5 = [(MBStartRestoreOptions *)&v12 init];
  if (v5)
  {
    id v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"cellularAccess"];
    [(MBStartRestoreOptions *)v5 setCellularAccess:v6];

    v7 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v8 = objc_opt_class();
    v9 = objc_msgSend(v7, "setWithObjects:", v8, objc_opt_class(), 0);
    v10 = [v4 decodeObjectOfClasses:v9 forKey:@"excludedAppBundleIDs"];
    [(MBStartRestoreOptions *)v5 setExcludedAppBundleIDs:v10];
  }
  return v5;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = objc_opt_new();
  v5 = [(MBStartRestoreOptions *)self cellularAccess];
  [v4 setCellularAccess:v5];

  id v6 = [(MBStartRestoreOptions *)self excludedAppBundleIDs];
  v7 = (void *)[v6 copy];
  [v4 setExcludedAppBundleIDs:v7];

  return v4;
}

- (id)description
{
  v3 = NSString;
  id v4 = (objc_class *)objc_opt_class();
  Name = class_getName(v4);
  id v6 = [(MBStartRestoreOptions *)self cellularAccess];
  v7 = [(MBStartRestoreOptions *)self excludedAppBundleIDs];
  objc_msgSend(v3, "stringWithFormat:", @"<%s: %p; cellularAccess=%@; excludedAppBundleIDs=%@>",
    Name,
    self,
    v6,
  uint64_t v8 = v7);

  return v8;
}

- (NSSet)excludedAppBundleIDs
{
  return self->_excludedAppBundleIDs;
}

- (void)setExcludedAppBundleIDs:(id)a3
{
}

- (MBCellularAccess)cellularAccess
{
  return self->_cellularAccess;
}

- (void)setCellularAccess:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_cellularAccess, 0);
  objc_storeStrong((id *)&self->_excludedAppBundleIDs, 0);
}

@end