@interface ML3ClientImportItem
+ (BOOL)supportsSecureCoding;
- (MIPMediaItem)mediaItem;
- (MIPMultiverseIdentifier)multiverseIdentifier;
- (ML3ClientImportItem)initWithCoder:(id)a3;
- (ML3ClientImportItem)initWithMultiverseIdentifier:(id)a3 mediaItem:(id)a4;
- (void)encodeWithCoder:(id)a3;
@end

@implementation ML3ClientImportItem

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_mediaItem, 0);

  objc_storeStrong((id *)&self->_multiverseIdentifier, 0);
}

- (MIPMultiverseIdentifier)multiverseIdentifier
{
  return self->_multiverseIdentifier;
}

- (MIPMediaItem)mediaItem
{
  return self->_mediaItem;
}

- (void)encodeWithCoder:(id)a3
{
  multiverseIdentifier = self->_multiverseIdentifier;
  id v5 = a3;
  [v5 encodeObject:multiverseIdentifier forKey:@"multiverseID"];
  [v5 encodeObject:self->_mediaItem forKey:@"mediaItem"];
}

- (ML3ClientImportItem)initWithCoder:(id)a3
{
  id v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)ML3ClientImportItem;
  id v5 = [(ML3ClientImportItem *)&v11 init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"multiverseID"];
    multiverseIdentifier = v5->_multiverseIdentifier;
    v5->_multiverseIdentifier = (MIPMultiverseIdentifier *)v6;

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"mediaItem"];
    mediaItem = v5->_mediaItem;
    v5->_mediaItem = (MIPMediaItem *)v8;
  }
  return v5;
}

- (ML3ClientImportItem)initWithMultiverseIdentifier:(id)a3 mediaItem:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)ML3ClientImportItem;
  v9 = [(ML3ClientImportItem *)&v12 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_multiverseIdentifier, a3);
    objc_storeStrong((id *)&v10->_mediaItem, a4);
  }

  return v10;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end