@interface ICQQuotaApp
- (NSString)bundleID;
- (NSString)localizedName;
- (NSString)name;
- (NSURL)iconURL;
- (NSURL)thumbnailURL;
- (id)description;
- (void)setBundleID:(id)a3;
- (void)setIconURL:(id)a3;
- (void)setLocalizedName:(id)a3;
- (void)setName:(id)a3;
- (void)setThumbnailURL:(id)a3;
@end

@implementation ICQQuotaApp

- (id)description
{
  v3 = NSString;
  uint64_t v4 = objc_opt_class();
  v5 = [(ICQQuotaApp *)self bundleID];
  v6 = [v3 stringWithFormat:@"<%@: %p for bundle ID: %@>", v4, self, v5];

  return v6;
}

- (NSString)bundleID
{
  return self->_bundleID;
}

- (void)setBundleID:(id)a3
{
}

- (NSString)name
{
  return self->_name;
}

- (void)setName:(id)a3
{
}

- (NSString)localizedName
{
  return self->_localizedName;
}

- (void)setLocalizedName:(id)a3
{
}

- (NSURL)iconURL
{
  return self->_iconURL;
}

- (void)setIconURL:(id)a3
{
}

- (NSURL)thumbnailURL
{
  return self->_thumbnailURL;
}

- (void)setThumbnailURL:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_thumbnailURL, 0);
  objc_storeStrong((id *)&self->_iconURL, 0);
  objc_storeStrong((id *)&self->_localizedName, 0);
  objc_storeStrong((id *)&self->_name, 0);
  objc_storeStrong((id *)&self->_bundleID, 0);
}

@end