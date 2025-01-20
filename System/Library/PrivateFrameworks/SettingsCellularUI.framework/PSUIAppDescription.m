@interface PSUIAppDescription
- (BOOL)installed;
- (NSString)bundleID;
- (NSString)installedLabel;
- (NSString)name;
- (NSString)publisher;
- (NSString)subtitle;
- (NSURL)iconURL;
- (NSURL)installURL;
- (PSUIAppDescription)initWithAMSMediaResponseDictionary:(id)a3;
- (UIImage)icon;
- (id)description;
- (void)setBundleID:(id)a3;
- (void)setIcon:(id)a3;
- (void)setIconURL:(id)a3;
- (void)setInstallURL:(id)a3;
- (void)setInstalled:(BOOL)a3;
- (void)setInstalledLabel:(id)a3;
- (void)setName:(id)a3;
- (void)setPublisher:(id)a3;
- (void)setSubtitle:(id)a3;
@end

@implementation PSUIAppDescription

- (PSUIAppDescription)initWithAMSMediaResponseDictionary:(id)a3
{
  id v4 = a3;
  v30.receiver = self;
  v30.super_class = (Class)PSUIAppDescription;
  v5 = [(PSUIAppDescription *)&v30 init];
  if (v5)
  {
    v6 = [v4 objectForKeyedSubscript:@"attributes"];
    v7 = [v6 objectForKeyedSubscript:@"name"];
    [(PSUIAppDescription *)v5 setName:v7];

    v8 = [v4 objectForKeyedSubscript:@"attributes"];
    v9 = [v8 objectForKeyedSubscript:@"artistName"];
    [(PSUIAppDescription *)v5 setPublisher:v9];

    v10 = [v4 objectForKeyedSubscript:@"attributes"];
    v11 = [v10 objectForKeyedSubscript:@"platformAttributes"];
    v12 = [v11 objectForKeyedSubscript:@"ios"];

    v13 = [v12 objectForKeyedSubscript:@"bundleId"];
    [(PSUIAppDescription *)v5 setBundleID:v13];

    id v14 = objc_alloc(MEMORY[0x263F27CF0]);
    v15 = [v12 objectForKeyedSubscript:@"artwork"];
    v16 = (void *)[v14 initWithDictionary:v15];

    v17 = [MEMORY[0x263F82B60] mainScreen];
    [v17 scale];
    double v19 = v18 * 60.0;
    v20 = [MEMORY[0x263F82B60] mainScreen];
    [v20 scale];
    v22 = objc_msgSend(v16, "URLWithSize:", v19, v21 * 60.0);
    [(PSUIAppDescription *)v5 setIconURL:v22];

    v23 = NSURL;
    v24 = [v4 objectForKeyedSubscript:@"attributes"];
    v25 = [v24 objectForKeyedSubscript:@"url"];
    v26 = [v23 URLWithString:v25];
    [(PSUIAppDescription *)v5 setInstallURL:v26];

    v27 = [v12 objectForKey:@"subtitle"];

    if (v27)
    {
      v28 = [v12 objectForKeyedSubscript:@"subtitle"];
      [(PSUIAppDescription *)v5 setSubtitle:v28];
    }
  }

  return v5;
}

- (id)description
{
  v3 = NSString;
  id v4 = (objc_class *)objc_opt_class();
  v5 = NSStringFromClass(v4);
  v6 = [v3 stringWithFormat:@"%@: {name: \"%@\", publisher: \"%@\", bundleID: \"%@\", subtitle: \"%@\", icon URL: %@, install URL: %@, icon: %@}", v5, self->_name, self->_publisher, self->_bundleID, self->_subtitle, self->_iconURL, self->_installURL, self->_icon];

  return v6;
}

- (NSString)name
{
  return self->_name;
}

- (void)setName:(id)a3
{
}

- (NSString)publisher
{
  return self->_publisher;
}

- (void)setPublisher:(id)a3
{
}

- (NSString)bundleID
{
  return self->_bundleID;
}

- (void)setBundleID:(id)a3
{
}

- (NSURL)iconURL
{
  return self->_iconURL;
}

- (void)setIconURL:(id)a3
{
}

- (NSURL)installURL
{
  return self->_installURL;
}

- (void)setInstallURL:(id)a3
{
}

- (UIImage)icon
{
  return self->_icon;
}

- (void)setIcon:(id)a3
{
}

- (BOOL)installed
{
  return self->_installed;
}

- (void)setInstalled:(BOOL)a3
{
  self->_installed = a3;
}

- (NSString)subtitle
{
  return self->_subtitle;
}

- (void)setSubtitle:(id)a3
{
}

- (NSString)installedLabel
{
  return self->_installedLabel;
}

- (void)setInstalledLabel:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_installedLabel, 0);
  objc_storeStrong((id *)&self->_subtitle, 0);
  objc_storeStrong((id *)&self->_icon, 0);
  objc_storeStrong((id *)&self->_installURL, 0);
  objc_storeStrong((id *)&self->_iconURL, 0);
  objc_storeStrong((id *)&self->_bundleID, 0);
  objc_storeStrong((id *)&self->_publisher, 0);
  objc_storeStrong((id *)&self->_name, 0);
}

@end