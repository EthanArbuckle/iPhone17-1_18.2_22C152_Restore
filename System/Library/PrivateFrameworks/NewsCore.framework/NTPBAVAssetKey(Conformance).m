@interface NTPBAVAssetKey(Conformance)
- (BOOL)isExpired;
- (FCContentArchive)contentArchive;
- (FCContentManifest)contentManifest;
- (id)creationDate;
- (id)expirationDate;
@end

@implementation NTPBAVAssetKey(Conformance)

- (id)creationDate
{
  v1 = (void *)MEMORY[0x1E4F1C9C8];
  v2 = [a1 createdAt];
  v3 = [v1 dateWithPBDate:v2];

  return v3;
}

- (id)expirationDate
{
  v1 = (void *)MEMORY[0x1E4F1C9C8];
  v2 = [a1 expiresAt];
  v3 = [v1 dateWithPBDate:v2];

  return v3;
}

- (BOOL)isExpired
{
  v2 = [MEMORY[0x1E4F1C9C8] date];
  [v2 timeIntervalSince1970];
  double v4 = v3;
  v5 = [a1 expiresAt];
  [v5 timeIntervalSince1970];
  BOOL v7 = v4 >= v6;

  return v7;
}

- (FCContentArchive)contentArchive
{
  return +[FCContentArchive archiveWithAVAssetKey:a1];
}

- (FCContentManifest)contentManifest
{
  v7[1] = *MEMORY[0x1E4F143B8];
  v2 = [FCContentManifest alloc];
  double v3 = [a1 identifier];
  v7[0] = v3;
  double v4 = [MEMORY[0x1E4F1C978] arrayWithObjects:v7 count:1];
  v5 = [(FCContentManifest *)v2 initWithAVAssetKeyIDs:v4];

  return v5;
}

@end