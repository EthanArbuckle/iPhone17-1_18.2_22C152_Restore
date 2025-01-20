@interface ICQBackupInfo
+ (BOOL)supportsSecureCoding;
- (ICQBackupInfo)initWithCoder:(id)a3;
- (NSArray)deviceGroups;
- (NSNumber)noOfBackupDevices;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (void)encodeWithCoder:(id)a3;
- (void)setDeviceGroups:(id)a3;
- (void)setNoOfBackupDevices:(id)a3;
@end

@implementation ICQBackupInfo

- (id)description
{
  return (id)[NSString stringWithFormat:@"noOfBackupDevices: %@, deviceGroups: %@", self->_noOfBackupDevices, self->_deviceGroups];
}

- (id)copyWithZone:(_NSZone *)a3
{
  v4 = objc_alloc_init(ICQBackupInfo);
  [(ICQBackupInfo *)v4 setNoOfBackupDevices:self->_noOfBackupDevices];
  [(ICQBackupInfo *)v4 setDeviceGroups:self->_deviceGroups];
  return v4;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  noOfBackupDevices = self->_noOfBackupDevices;
  id v5 = a3;
  [v5 encodeObject:noOfBackupDevices forKey:@"noOfBackupDevices"];
  [v5 encodeObject:self->_deviceGroups forKey:@"deviceGroups"];
}

- (ICQBackupInfo)initWithCoder:(id)a3
{
  v15[2] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v14.receiver = self;
  v14.super_class = (Class)ICQBackupInfo;
  id v5 = [(ICQBackupInfo *)&v14 init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"noOfBackupDevices"];
    noOfBackupDevices = v5->_noOfBackupDevices;
    v5->_noOfBackupDevices = (NSNumber *)v6;

    v8 = (void *)MEMORY[0x1E4F1CAD0];
    v15[0] = objc_opt_class();
    v15[1] = objc_opt_class();
    v9 = [MEMORY[0x1E4F1C978] arrayWithObjects:v15 count:2];
    v10 = [v8 setWithArray:v9];

    uint64_t v11 = [v4 decodeObjectOfClasses:v10 forKey:@"deviceGroups"];
    deviceGroups = v5->_deviceGroups;
    v5->_deviceGroups = (NSArray *)v11;
  }
  return v5;
}

- (NSNumber)noOfBackupDevices
{
  return self->_noOfBackupDevices;
}

- (void)setNoOfBackupDevices:(id)a3
{
}

- (NSArray)deviceGroups
{
  return self->_deviceGroups;
}

- (void)setDeviceGroups:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_deviceGroups, 0);
  objc_storeStrong((id *)&self->_noOfBackupDevices, 0);
}

@end