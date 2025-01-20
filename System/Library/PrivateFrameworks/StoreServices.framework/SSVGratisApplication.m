@interface SSVGratisApplication
- (NSDictionary)dictionaryRepresentation;
- (NSNumber)externalVersionIdentifier;
- (NSString)bundleIdentifier;
- (NSString)bundleVersion;
- (NSString)itemIdentifier;
- (id)copyWithZone:(_NSZone *)a3;
- (void)setBundleIdentifier:(id)a3;
- (void)setBundleVersion:(id)a3;
- (void)setExternalVersionIdentifier:(id)a3;
- (void)setItemIdentifier:(id)a3;
@end

@implementation SSVGratisApplication

- (NSDictionary)dictionaryRepresentation
{
  v3 = [MEMORY[0x1E4F1CA60] dictionary];
  v4 = v3;
  bundleIdentifier = self->_bundleIdentifier;
  if (bundleIdentifier) {
    [v3 setObject:bundleIdentifier forKey:@"bid"];
  }
  bundleVersion = self->_bundleVersion;
  if (bundleVersion) {
    [v4 setObject:bundleVersion forKey:@"bvrs"];
  }
  externalVersionIdentifier = self->_externalVersionIdentifier;
  if (externalVersionIdentifier) {
    [v4 setObject:externalVersionIdentifier forKey:@"vid"];
  }
  itemIdentifier = self->_itemIdentifier;
  if (itemIdentifier) {
    [v4 setObject:itemIdentifier forKey:@"id"];
  }
  return (NSDictionary *)v4;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v4 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  [v4 setBundleIdentifier:self->_bundleIdentifier];
  [v4 setBundleVersion:self->_bundleVersion];
  [v4 setExternalVersionIdentifier:self->_externalVersionIdentifier];
  [v4 setItemIdentifier:self->_itemIdentifier];
  return v4;
}

- (NSString)bundleIdentifier
{
  return self->_bundleIdentifier;
}

- (void)setBundleIdentifier:(id)a3
{
}

- (NSString)bundleVersion
{
  return self->_bundleVersion;
}

- (void)setBundleVersion:(id)a3
{
}

- (NSNumber)externalVersionIdentifier
{
  return self->_externalVersionIdentifier;
}

- (void)setExternalVersionIdentifier:(id)a3
{
}

- (NSString)itemIdentifier
{
  return self->_itemIdentifier;
}

- (void)setItemIdentifier:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_itemIdentifier, 0);
  objc_storeStrong((id *)&self->_externalVersionIdentifier, 0);
  objc_storeStrong((id *)&self->_bundleVersion, 0);
  objc_storeStrong((id *)&self->_bundleIdentifier, 0);
}

@end