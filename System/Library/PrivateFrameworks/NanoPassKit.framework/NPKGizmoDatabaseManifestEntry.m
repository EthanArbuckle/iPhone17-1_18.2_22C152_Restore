@interface NPKGizmoDatabaseManifestEntry
- (NSArray)localManifestHashes;
- (NSArray)remoteManifestHashes;
- (NSString)uniqueID;
- (id)description;
- (void)setLocalManifestHashes:(id)a3;
- (void)setRemoteManifestHashes:(id)a3;
- (void)setUniqueID:(id)a3;
@end

@implementation NPKGizmoDatabaseManifestEntry

- (id)description
{
  v9.receiver = self;
  v9.super_class = (Class)NPKGizmoDatabaseManifestEntry;
  v3 = [(NPKGizmoDatabaseManifestEntry *)&v9 description];
  v4 = [(NPKGizmoDatabaseManifestEntry *)self uniqueID];
  v5 = [(NPKGizmoDatabaseManifestEntry *)self localManifestHashes];
  v6 = [(NPKGizmoDatabaseManifestEntry *)self remoteManifestHashes];
  v7 = [v3 stringByAppendingFormat:@"(uniqueID %@ localHashes %@ remoteHashes %@)", v4, v5, v6];

  return v7;
}

- (NSString)uniqueID
{
  return self->_uniqueID;
}

- (void)setUniqueID:(id)a3
{
}

- (NSArray)localManifestHashes
{
  return self->_localManifestHashes;
}

- (void)setLocalManifestHashes:(id)a3
{
}

- (NSArray)remoteManifestHashes
{
  return self->_remoteManifestHashes;
}

- (void)setRemoteManifestHashes:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_remoteManifestHashes, 0);
  objc_storeStrong((id *)&self->_localManifestHashes, 0);
  objc_storeStrong((id *)&self->_uniqueID, 0);
}

@end