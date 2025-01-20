@interface MBStartBackupOptions
+ (BOOL)supportsSecureCoding;
- (MBCellularAccess)cellularAccess;
- (MBStartBackupOptions)initWithCoder:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (int64_t)backupPolicy;
- (void)encodeWithCoder:(id)a3;
- (void)setBackupPolicy:(int64_t)a3;
- (void)setCellularAccess:(id)a3;
@end

@implementation MBStartBackupOptions

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (MBStartBackupOptions)initWithCoder:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)MBStartBackupOptions;
  v5 = [(MBStartBackupOptions *)&v8 init];
  if (v5)
  {
    v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"cellularAccess"];
    [(MBStartBackupOptions *)v5 setCellularAccess:v6];

    -[MBStartBackupOptions setBackupPolicy:](v5, "setBackupPolicy:", [v4 decodeIntegerForKey:@"backupPolicy"]);
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v5 = a3;
  id v4 = [(MBStartBackupOptions *)self cellularAccess];
  [v5 encodeObject:v4 forKey:@"cellularAccess"];

  objc_msgSend(v5, "encodeInteger:forKey:", -[MBStartBackupOptions backupPolicy](self, "backupPolicy"), @"backupPolicy");
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = objc_opt_new();
  id v5 = [(MBStartBackupOptions *)self cellularAccess];
  [v4 setCellularAccess:v5];

  objc_msgSend(v4, "setBackupPolicy:", -[MBStartBackupOptions backupPolicy](self, "backupPolicy"));
  return v4;
}

- (id)description
{
  v3 = NSString;
  id v4 = (objc_class *)objc_opt_class();
  Name = class_getName(v4);
  v6 = [(MBStartBackupOptions *)self cellularAccess];
  objc_msgSend(v3, "stringWithFormat:", @"<%s: %p; cellularAccess=%@; backupPolicy=%ld>",
    Name,
    self,
    v6,
  v7 = [(MBStartBackupOptions *)self backupPolicy]);

  return v7;
}

- (MBCellularAccess)cellularAccess
{
  return self->_cellularAccess;
}

- (void)setCellularAccess:(id)a3
{
}

- (int64_t)backupPolicy
{
  return self->_backupPolicy;
}

- (void)setBackupPolicy:(int64_t)a3
{
  self->_backupPolicy = a3;
}

- (void).cxx_destruct
{
}

@end