@interface ICQBackupDeviceGroup
+ (BOOL)supportsSecureCoding;
- (ICQBackupDeviceGroup)initWithCoder:(id)a3;
- (NSArray)backupDevices;
- (NSString)sectionFooter;
- (NSString)sectionHeader;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (void)encodeWithCoder:(id)a3;
- (void)setBackupDevices:(id)a3;
- (void)setSectionFooter:(id)a3;
- (void)setSectionHeader:(id)a3;
@end

@implementation ICQBackupDeviceGroup

- (id)description
{
  return (id)[NSString stringWithFormat:@"sectionHeader: %@, sectionFooter: %@, backupDevices: %@", self->_sectionHeader, self->_sectionFooter, self->_backupDevices];
}

- (id)copyWithZone:(_NSZone *)a3
{
  v4 = objc_alloc_init(ICQBackupDeviceGroup);
  [(ICQBackupDeviceGroup *)v4 setSectionHeader:self->_sectionHeader];
  [(ICQBackupDeviceGroup *)v4 setSectionFooter:self->_sectionFooter];
  [(ICQBackupDeviceGroup *)v4 setBackupDevices:self->_backupDevices];
  return v4;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  sectionHeader = self->_sectionHeader;
  id v5 = a3;
  [v5 encodeObject:sectionHeader forKey:@"sectionHeader"];
  [v5 encodeObject:self->_sectionFooter forKey:@"sectionFooter"];
  [v5 encodeObject:self->_backupDevices forKey:@"backupDevices"];
}

- (ICQBackupDeviceGroup)initWithCoder:(id)a3
{
  v17[2] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v16.receiver = self;
  v16.super_class = (Class)ICQBackupDeviceGroup;
  id v5 = [(ICQBackupDeviceGroup *)&v16 init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"sectionHeader"];
    sectionHeader = v5->_sectionHeader;
    v5->_sectionHeader = (NSString *)v6;

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"sectionFooter"];
    sectionFooter = v5->_sectionFooter;
    v5->_sectionFooter = (NSString *)v8;

    v10 = (void *)MEMORY[0x1E4F1CAD0];
    v17[0] = objc_opt_class();
    v17[1] = objc_opt_class();
    v11 = [MEMORY[0x1E4F1C978] arrayWithObjects:v17 count:2];
    v12 = [v10 setWithArray:v11];

    uint64_t v13 = [v4 decodeObjectOfClasses:v12 forKey:@"backupDevices"];
    backupDevices = v5->_backupDevices;
    v5->_backupDevices = (NSArray *)v13;
  }
  return v5;
}

- (NSString)sectionHeader
{
  return self->_sectionHeader;
}

- (void)setSectionHeader:(id)a3
{
}

- (NSString)sectionFooter
{
  return self->_sectionFooter;
}

- (void)setSectionFooter:(id)a3
{
}

- (NSArray)backupDevices
{
  return self->_backupDevices;
}

- (void)setBackupDevices:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_backupDevices, 0);
  objc_storeStrong((id *)&self->_sectionFooter, 0);
  objc_storeStrong((id *)&self->_sectionHeader, 0);
}

@end