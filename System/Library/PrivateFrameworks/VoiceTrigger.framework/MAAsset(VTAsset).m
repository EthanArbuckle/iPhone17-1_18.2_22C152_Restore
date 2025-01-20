@interface MAAsset(VTAsset)
- (BOOL)canBePurged;
- (BOOL)isAvailableLocally;
- (BOOL)isDownloading;
- (BOOL)isPremium;
- (BOOL)isVTAssetInstalled;
- (id)compatibilityVersion;
- (id)description;
- (id)footprint;
- (id)languages;
- (id)path;
- (id)version;
- (uint64_t)isLatestCompareTo:()VTAsset;
@end

@implementation MAAsset(VTAsset)

- (uint64_t)isLatestCompareTo:()VTAsset
{
  id v4 = a3;
  if (!v4) {
    goto LABEL_6;
  }
  v5 = [a1 attributes];
  uint64_t v6 = *MEMORY[0x263F55878];
  v7 = [v5 objectForKey:*MEMORY[0x263F55878]];
  uint64_t v8 = [v7 integerValue];

  v9 = [v4 attributes];
  v10 = [v9 objectForKey:v6];
  uint64_t v11 = [v10 integerValue];

  if (v8 >= v11)
  {
    if (v8 == v11)
    {
      uint64_t v12 = [a1 isPremium];
      goto LABEL_7;
    }
LABEL_6:
    uint64_t v12 = 1;
    goto LABEL_7;
  }
  uint64_t v12 = 0;
LABEL_7:

  return v12;
}

- (BOOL)isDownloading
{
  return [a1 state] == 4;
}

- (BOOL)isAvailableLocally
{
  return [a1 state] == 2
      || [a1 state] == 3
      || [a1 state] == 5
      || [a1 state] == 6;
}

- (BOOL)canBePurged
{
  return [a1 state] == 2 || objc_msgSend(a1, "state") == 3 || objc_msgSend(a1, "state") == 6;
}

- (BOOL)isVTAssetInstalled
{
  return [a1 state] == 2
      || [a1 state] == 3
      || [a1 state] == 5
      || [a1 state] == 6;
}

- (BOOL)isPremium
{
  v1 = [a1 attributes];
  v2 = [v1 objectForKey:@"Footprint"];

  BOOL v3 = v2 && ([v2 isEqualToString:@"Premium"] & 1) != 0;
  return v3;
}

- (id)path
{
  v1 = [a1 getLocalUrl];
  v2 = [v1 path];

  return v2;
}

- (id)compatibilityVersion
{
  v1 = [a1 attributes];
  v2 = [v1 objectForKey:*MEMORY[0x263F55870]];

  return v2;
}

- (id)version
{
  v1 = [a1 attributes];
  v2 = [v1 objectForKey:*MEMORY[0x263F55878]];

  return v2;
}

- (id)footprint
{
  v1 = [a1 attributes];
  v2 = [v1 objectForKey:@"Footprint"];

  return v2;
}

- (id)languages
{
  v1 = [a1 attributes];
  v2 = [v1 objectForKey:@"Languages"];

  return v2;
}

- (id)description
{
  v2 = NSString;
  BOOL v3 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(a1, "hash"));
  id v4 = [a1 version];
  if ([a1 isVTAssetInstalled]) {
    v5 = @"YES";
  }
  else {
    v5 = @"NO";
  }
  if ([a1 canBePurged]) {
    uint64_t v6 = @"YES";
  }
  else {
    uint64_t v6 = @"NO";
  }
  v7 = [a1 languages];
  uint64_t v8 = [v7 componentsJoinedByString:@", "];
  if ([a1 isPremium]) {
    v9 = @"YES";
  }
  else {
    v9 = @"NO";
  }
  objc_msgSend(v2, "stringWithFormat:", @"MAAsset<%@> version: %@; installed: %@; canBePurged: %@; languages: %@; premium: %@ ",
    v3,
    v4,
    v5,
    v6,
    v8,
  v10 = v9);

  return v10;
}

@end