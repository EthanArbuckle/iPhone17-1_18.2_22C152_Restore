@interface ICQMediaCloudStorage
+ (BOOL)supportsSecureCoding;
- (ICQMediaCloudStorage)initWithCoder:(id)a3;
- (NSNumber)storageUsed;
- (NSString)displayColor;
- (NSString)displayColorDark;
- (NSString)displayLabel;
- (NSString)mediaType;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (void)encodeWithCoder:(id)a3;
- (void)setDisplayColor:(id)a3;
- (void)setDisplayColorDark:(id)a3;
- (void)setDisplayLabel:(id)a3;
- (void)setMediaType:(id)a3;
- (void)setStorageUsed:(id)a3;
@end

@implementation ICQMediaCloudStorage

- (id)description
{
  return (id)[NSString stringWithFormat:@"mediaType: %@, displayLabel: %@, displayColor: %@, displayColorDark: %@, storageUsed: %@", self->_mediaType, self->_displayLabel, self->_displayColor, self->_displayColorDark, self->_storageUsed];
}

- (id)copyWithZone:(_NSZone *)a3
{
  v4 = objc_alloc_init(ICQMediaCloudStorage);
  [(ICQMediaCloudStorage *)v4 setMediaType:self->_mediaType];
  [(ICQMediaCloudStorage *)v4 setDisplayLabel:self->_displayLabel];
  [(ICQMediaCloudStorage *)v4 setDisplayColor:self->_displayColor];
  [(ICQMediaCloudStorage *)v4 setDisplayColorDark:self->_displayColorDark];
  [(ICQMediaCloudStorage *)v4 setStorageUsed:self->_storageUsed];
  return v4;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  mediaType = self->_mediaType;
  id v5 = a3;
  [v5 encodeObject:mediaType forKey:@"mediaType"];
  [v5 encodeObject:self->_displayLabel forKey:@"displayLabel"];
  [v5 encodeObject:self->_displayColor forKey:@"displayColor"];
  [v5 encodeObject:self->_displayColorDark forKey:@"displayColorDark"];
  [v5 encodeObject:self->_storageUsed forKey:@"storageUsed"];
}

- (ICQMediaCloudStorage)initWithCoder:(id)a3
{
  id v4 = a3;
  v17.receiver = self;
  v17.super_class = (Class)ICQMediaCloudStorage;
  id v5 = [(ICQMediaCloudStorage *)&v17 init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"mediaType"];
    mediaType = v5->_mediaType;
    v5->_mediaType = (NSString *)v6;

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"displayLabel"];
    displayLabel = v5->_displayLabel;
    v5->_displayLabel = (NSString *)v8;

    uint64_t v10 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"displayColor"];
    displayColor = v5->_displayColor;
    v5->_displayColor = (NSString *)v10;

    uint64_t v12 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"displayColorDark"];
    displayColorDark = v5->_displayColorDark;
    v5->_displayColorDark = (NSString *)v12;

    uint64_t v14 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"storageUsed"];
    storageUsed = v5->_storageUsed;
    v5->_storageUsed = (NSNumber *)v14;
  }
  return v5;
}

- (NSString)mediaType
{
  return self->_mediaType;
}

- (void)setMediaType:(id)a3
{
}

- (NSString)displayLabel
{
  return self->_displayLabel;
}

- (void)setDisplayLabel:(id)a3
{
}

- (NSString)displayColor
{
  return self->_displayColor;
}

- (void)setDisplayColor:(id)a3
{
}

- (NSString)displayColorDark
{
  return self->_displayColorDark;
}

- (void)setDisplayColorDark:(id)a3
{
}

- (NSNumber)storageUsed
{
  return self->_storageUsed;
}

- (void)setStorageUsed:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_storageUsed, 0);
  objc_storeStrong((id *)&self->_displayColorDark, 0);
  objc_storeStrong((id *)&self->_displayColor, 0);
  objc_storeStrong((id *)&self->_displayLabel, 0);
  objc_storeStrong((id *)&self->_mediaType, 0);
}

@end