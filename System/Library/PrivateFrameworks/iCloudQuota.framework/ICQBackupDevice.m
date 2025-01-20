@interface ICQBackupDevice
+ (BOOL)supportsSecureCoding;
- (BOOL)isActive;
- (BOOL)isLocalBackup;
- (ICQBackupDevice)initWithCoder:(id)a3;
- (ICQImageURL)imageURL;
- (ICQImageURL)largeImageURL;
- (NSDictionary)rawDictionary;
- (NSNumber)backupFailedByinBytes;
- (NSNumber)backupSize;
- (NSNumber)backupTimestamp;
- (NSNumber)bytesRequiredForBackup;
- (NSNumber)storageUsed;
- (NSString)deleteButtonLabel;
- (NSString)detailViewController;
- (NSString)deviceName;
- (NSString)deviceSubtitle;
- (NSString)deviceUDID;
- (NSString)storageUsedLabel;
- (NSURL)deleteURL;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (void)encodeWithCoder:(id)a3;
- (void)setBackupFailedByinBytes:(id)a3;
- (void)setBackupSize:(id)a3;
- (void)setBackupTimestamp:(id)a3;
- (void)setBytesRequiredForBackup:(id)a3;
- (void)setDeleteButtonLabel:(id)a3;
- (void)setDeleteURL:(id)a3;
- (void)setDetailViewController:(id)a3;
- (void)setDeviceName:(id)a3;
- (void)setDeviceSubtitle:(id)a3;
- (void)setDeviceUDID:(id)a3;
- (void)setImageURL:(id)a3;
- (void)setIsActive:(BOOL)a3;
- (void)setIsLocalBackup:(BOOL)a3;
- (void)setLargeImageURL:(id)a3;
- (void)setStorageUsed:(id)a3;
- (void)setStorageUsedLabel:(id)a3;
@end

@implementation ICQBackupDevice

- (id)description
{
  return (id)[NSString stringWithFormat:@"deviceName: %@, deviceUDID: %@, deviceSubtitle: %@, storageUsedLabel: %@, storageUsed: %@, backupSize: %@, imageURL: %@, largeImageURL: %@, detailViewController: %@, backupTimestamp: %@ deleteURL: %@ deleteButtonLabel: %@, backupFailedByinBytes: %@, bytesRequiredForBackup: %@, isActive: %d, isLocalBackup: %d", self->_deviceName, self->_deviceUDID, self->_deviceSubtitle, self->_storageUsedLabel, self->_storageUsed, self->_backupSize, self->_imageURL, self->_largeImageURL, self->_detailViewController, self->_backupTimestamp, self->_deleteURL, self->_deleteButtonLabel, self->_backupFailedByinBytes, self->_bytesRequiredForBackup, self->_isActive, self->_isLocalBackup];
}

- (id)copyWithZone:(_NSZone *)a3
{
  v4 = objc_alloc_init(ICQBackupDevice);
  [(ICQBackupDevice *)v4 setDeviceName:self->_deviceName];
  [(ICQBackupDevice *)v4 setDeviceUDID:self->_deviceUDID];
  [(ICQBackupDevice *)v4 setDeviceSubtitle:self->_deviceSubtitle];
  [(ICQBackupDevice *)v4 setStorageUsedLabel:self->_storageUsedLabel];
  [(ICQBackupDevice *)v4 setStorageUsed:self->_storageUsed];
  [(ICQBackupDevice *)v4 setBackupSize:self->_backupSize];
  [(ICQBackupDevice *)v4 setImageURL:self->_imageURL];
  [(ICQBackupDevice *)v4 setLargeImageURL:self->_largeImageURL];
  [(ICQBackupDevice *)v4 setDetailViewController:self->_detailViewController];
  [(ICQBackupDevice *)v4 setBackupTimestamp:self->_backupTimestamp];
  [(ICQBackupDevice *)v4 setDeleteURL:self->_deleteURL];
  [(ICQBackupDevice *)v4 setDeleteButtonLabel:self->_deleteButtonLabel];
  [(ICQBackupDevice *)v4 setBackupFailedByinBytes:self->_backupFailedByinBytes];
  [(ICQBackupDevice *)v4 setBytesRequiredForBackup:self->_bytesRequiredForBackup];
  [(ICQBackupDevice *)v4 setIsActive:self->_isActive];
  [(ICQBackupDevice *)v4 setIsLocalBackup:self->_isLocalBackup];
  return v4;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  deviceName = self->_deviceName;
  id v5 = a3;
  [v5 encodeObject:deviceName forKey:@"deviceName"];
  [v5 encodeObject:self->_deviceUDID forKey:@"deviceUDID"];
  [v5 encodeObject:self->_deviceSubtitle forKey:@"deviceSubtitle"];
  [v5 encodeObject:self->_storageUsedLabel forKey:@"storageUsedLabel"];
  [v5 encodeObject:self->_storageUsed forKey:@"storageUsed"];
  [v5 encodeObject:self->_backupSize forKey:@"backupSize"];
  [v5 encodeObject:self->_imageURL forKey:@"imageURL"];
  [v5 encodeObject:self->_largeImageURL forKey:@"largeImageURL"];
  [v5 encodeObject:self->_detailViewController forKey:@"detailViewController"];
  [v5 encodeObject:self->_backupTimestamp forKey:@"backupTimestamp"];
  [v5 encodeObject:self->_deleteURL forKey:@"deleteURL"];
  [v5 encodeObject:self->_deleteButtonLabel forKey:@"deleteButtonLabel"];
  [v5 encodeObject:self->_backupFailedByinBytes forKey:@"backupFailedByinBytes"];
  [v5 encodeObject:self->_bytesRequiredForBackup forKey:@"bytesRequiredForBackup"];
  [v5 encodeBool:self->_isActive forKey:@"isActive"];
  [v5 encodeBool:self->_isLocalBackup forKey:@"isLocalBackup"];
}

- (ICQBackupDevice)initWithCoder:(id)a3
{
  id v4 = a3;
  v35.receiver = self;
  v35.super_class = (Class)ICQBackupDevice;
  id v5 = [(ICQBackupDevice *)&v35 init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"deviceName"];
    deviceName = v5->_deviceName;
    v5->_deviceName = (NSString *)v6;

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"deviceUDID"];
    deviceUDID = v5->_deviceUDID;
    v5->_deviceUDID = (NSString *)v8;

    uint64_t v10 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"deviceSubtitle"];
    deviceSubtitle = v5->_deviceSubtitle;
    v5->_deviceSubtitle = (NSString *)v10;

    uint64_t v12 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"storageUsedLabel"];
    storageUsedLabel = v5->_storageUsedLabel;
    v5->_storageUsedLabel = (NSString *)v12;

    uint64_t v14 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"storageUsed"];
    storageUsed = v5->_storageUsed;
    v5->_storageUsed = (NSNumber *)v14;

    uint64_t v16 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"backupSize"];
    backupSize = v5->_backupSize;
    v5->_backupSize = (NSNumber *)v16;

    uint64_t v18 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"imageURL"];
    imageURL = v5->_imageURL;
    v5->_imageURL = (ICQImageURL *)v18;

    uint64_t v20 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"largeImageURL"];
    largeImageURL = v5->_largeImageURL;
    v5->_largeImageURL = (ICQImageURL *)v20;

    uint64_t v22 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"detailViewController"];
    detailViewController = v5->_detailViewController;
    v5->_detailViewController = (NSString *)v22;

    uint64_t v24 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"backupTimestamp"];
    backupTimestamp = v5->_backupTimestamp;
    v5->_backupTimestamp = (NSNumber *)v24;

    uint64_t v26 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"deleteURL"];
    deleteURL = v5->_deleteURL;
    v5->_deleteURL = (NSURL *)v26;

    uint64_t v28 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"deleteButtonLabel"];
    deleteButtonLabel = v5->_deleteButtonLabel;
    v5->_deleteButtonLabel = (NSString *)v28;

    uint64_t v30 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"backupFailedByinBytes"];
    backupFailedByinBytes = v5->_backupFailedByinBytes;
    v5->_backupFailedByinBytes = (NSNumber *)v30;

    uint64_t v32 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"bytesRequiredForBackup"];
    bytesRequiredForBackup = v5->_bytesRequiredForBackup;
    v5->_bytesRequiredForBackup = (NSNumber *)v32;

    v5->_isActive = [v4 decodeBoolForKey:@"isActive"];
    v5->_isLocalBackup = [v4 decodeBoolForKey:@"isLocalBackup"];
  }

  return v5;
}

- (NSDictionary)rawDictionary
{
  id v3 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  [v3 setValue:@"button" forKey:@"class"];
  [v3 setValue:self->_deviceName forKey:@"deviceName"];
  [v3 setValue:self->_deviceUDID forKey:@"deviceUdid"];
  [v3 setValue:self->_deviceSubtitle forKey:@"subLabel"];
  [v3 setValue:self->_storageUsedLabel forKey:@"detailLabel"];
  [v3 setValue:self->_storageUsed forKey:@"backupSize"];
  id v4 = [(ICQImageURL *)self->_imageURL URL1x];
  id v5 = [v4 absoluteString];
  [v3 setValue:v5 forKey:@"image"];

  uint64_t v6 = [(ICQImageURL *)self->_imageURL URL2x];
  v7 = [v6 absoluteString];
  [v3 setValue:v7 forKey:@"image2x"];

  uint64_t v8 = [(ICQImageURL *)self->_imageURL URL3x];
  v9 = [v8 absoluteString];
  [v3 setValue:v9 forKey:@"image3x"];

  uint64_t v10 = [(ICQImageURL *)self->_largeImageURL URL1x];
  v11 = [v10 absoluteString];
  [v3 setValue:v11 forKey:@"largeImage"];

  uint64_t v12 = [(ICQImageURL *)self->_largeImageURL URL2x];
  v13 = [v12 absoluteString];
  [v3 setValue:v13 forKey:@"largeImage2x"];

  uint64_t v14 = [(ICQImageURL *)self->_largeImageURL URL3x];
  v15 = [v14 absoluteString];
  [v3 setValue:v15 forKey:@"largeImage3x"];

  [v3 setValue:self->_backupTimestamp forKey:@"backupTimestamp"];
  uint64_t v16 = [(NSURL *)self->_deleteURL absoluteString];
  [v3 setValue:v16 forKey:@"deleteURL"];

  [v3 setValue:MEMORY[0x1E4F1CC38] forKey:@"forceFullSizeDetailLabel"];
  [v3 setValue:@"disclosure" forKey:@"accessory"];
  [v3 setValue:self->_deviceName forKey:@"label"];
  [v3 setValue:self->_deviceSubtitle forKey:@"sublabel"];
  [v3 setValue:@"localBackup" forKey:@"name"];
  [v3 setValue:@"currentDeviceBackUp" forKey:@"id"];
  [v3 setValue:&unk_1F2DE0398 forKey:@"height"];
  v17 = [NSNumber numberWithBool:self->_isActive];
  [v3 setValue:v17 forKey:@"isActive"];

  uint64_t v18 = (void *)[v3 copy];
  return (NSDictionary *)v18;
}

- (NSString)deviceName
{
  return self->_deviceName;
}

- (void)setDeviceName:(id)a3
{
}

- (NSString)deviceUDID
{
  return self->_deviceUDID;
}

- (void)setDeviceUDID:(id)a3
{
}

- (NSString)deviceSubtitle
{
  return self->_deviceSubtitle;
}

- (void)setDeviceSubtitle:(id)a3
{
}

- (NSString)storageUsedLabel
{
  return self->_storageUsedLabel;
}

- (void)setStorageUsedLabel:(id)a3
{
}

- (NSNumber)storageUsed
{
  return self->_storageUsed;
}

- (void)setStorageUsed:(id)a3
{
}

- (NSNumber)backupSize
{
  return self->_backupSize;
}

- (void)setBackupSize:(id)a3
{
}

- (ICQImageURL)imageURL
{
  return self->_imageURL;
}

- (void)setImageURL:(id)a3
{
}

- (ICQImageURL)largeImageURL
{
  return self->_largeImageURL;
}

- (void)setLargeImageURL:(id)a3
{
}

- (NSString)detailViewController
{
  return self->_detailViewController;
}

- (void)setDetailViewController:(id)a3
{
}

- (NSNumber)backupTimestamp
{
  return self->_backupTimestamp;
}

- (void)setBackupTimestamp:(id)a3
{
}

- (NSURL)deleteURL
{
  return self->_deleteURL;
}

- (void)setDeleteURL:(id)a3
{
}

- (NSString)deleteButtonLabel
{
  return self->_deleteButtonLabel;
}

- (void)setDeleteButtonLabel:(id)a3
{
}

- (NSNumber)backupFailedByinBytes
{
  return self->_backupFailedByinBytes;
}

- (void)setBackupFailedByinBytes:(id)a3
{
}

- (NSNumber)bytesRequiredForBackup
{
  return self->_bytesRequiredForBackup;
}

- (void)setBytesRequiredForBackup:(id)a3
{
}

- (BOOL)isActive
{
  return self->_isActive;
}

- (void)setIsActive:(BOOL)a3
{
  self->_isActive = a3;
}

- (BOOL)isLocalBackup
{
  return self->_isLocalBackup;
}

- (void)setIsLocalBackup:(BOOL)a3
{
  self->_isLocalBackup = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_bytesRequiredForBackup, 0);
  objc_storeStrong((id *)&self->_backupFailedByinBytes, 0);
  objc_storeStrong((id *)&self->_deleteButtonLabel, 0);
  objc_storeStrong((id *)&self->_deleteURL, 0);
  objc_storeStrong((id *)&self->_backupTimestamp, 0);
  objc_storeStrong((id *)&self->_detailViewController, 0);
  objc_storeStrong((id *)&self->_largeImageURL, 0);
  objc_storeStrong((id *)&self->_imageURL, 0);
  objc_storeStrong((id *)&self->_backupSize, 0);
  objc_storeStrong((id *)&self->_storageUsed, 0);
  objc_storeStrong((id *)&self->_storageUsedLabel, 0);
  objc_storeStrong((id *)&self->_deviceSubtitle, 0);
  objc_storeStrong((id *)&self->_deviceUDID, 0);
  objc_storeStrong((id *)&self->_deviceName, 0);
}

@end