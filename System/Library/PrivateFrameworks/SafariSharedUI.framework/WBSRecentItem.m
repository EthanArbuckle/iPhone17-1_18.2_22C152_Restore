@interface WBSRecentItem
- (BOOL)isEqual:(id)a3;
- (LPLinkMetadata)metadata;
- (NSDate)date;
- (NSItemProvider)imageProvider;
- (NSObject)identifier;
- (NSString)deviceLocationDescription;
- (NSString)title;
- (NSURL)URL;
- (UIImage)icon;
- (WBSCloudTabItem)cloudTab;
- (WBSCloudTabProvider)device;
- (WBSRecentItem)initWithIdentifier:(id)a3 url:(id)a4 date:(id)a5;
- (int64_t)metadataState;
- (unint64_t)hash;
- (void)setCloudTab:(id)a3;
- (void)setDate:(id)a3;
- (void)setDevice:(id)a3;
- (void)setIcon:(id)a3;
- (void)setImageProvider:(id)a3;
- (void)setMetadata:(id)a3;
- (void)setMetadataState:(int64_t)a3;
- (void)setTitle:(id)a3;
@end

@implementation WBSRecentItem

- (WBSRecentItem)initWithIdentifier:(id)a3 url:(id)a4 date:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v16.receiver = self;
  v16.super_class = (Class)WBSRecentItem;
  v11 = [(WBSRecentItem *)&v16 init];
  if (v11)
  {
    uint64_t v12 = [v8 copyWithZone:0];
    identifier = v11->_identifier;
    v11->_identifier = v12;

    objc_storeStrong((id *)&v11->_URL, a4);
    objc_storeStrong((id *)&v11->_date, a5);
    v14 = v11;
  }

  return v11;
}

- (BOOL)isEqual:(id)a3
{
  v4 = (WBSRecentItem *)a3;
  if (v4 == self)
  {
    char v6 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v5 = v4;
      if ([v5[2] isEqual:self->_URL]) {
        char v6 = [v5[1] isEqual:self->_identifier];
      }
      else {
        char v6 = 0;
      }
    }
    else
    {
      char v6 = 0;
    }
  }

  return v6;
}

- (unint64_t)hash
{
  uint64_t v3 = [(NSURL *)self->_URL hash];
  return [self->_identifier hash] ^ v3;
}

- (NSString)deviceLocationDescription
{
  uint64_t v3 = [(WBSRecentItem *)self device];
  v4 = [v3 disambiguatedName];

  v5 = [(WBSRecentItem *)self icon];
  char v6 = NSString;
  v7 = _WBSLocalizedString();
  id v8 = objc_msgSend(v6, "stringWithFormat:", v7, v4);

  return (NSString *)v8;
}

- (NSObject)identifier
{
  return self->_identifier;
}

- (NSURL)URL
{
  return self->_URL;
}

- (NSDate)date
{
  return self->_date;
}

- (void)setDate:(id)a3
{
}

- (UIImage)icon
{
  return self->_icon;
}

- (void)setIcon:(id)a3
{
}

- (NSString)title
{
  return self->_title;
}

- (void)setTitle:(id)a3
{
}

- (LPLinkMetadata)metadata
{
  return self->_metadata;
}

- (void)setMetadata:(id)a3
{
}

- (NSItemProvider)imageProvider
{
  return self->_imageProvider;
}

- (void)setImageProvider:(id)a3
{
}

- (WBSCloudTabItem)cloudTab
{
  return self->_cloudTab;
}

- (void)setCloudTab:(id)a3
{
}

- (WBSCloudTabProvider)device
{
  return self->_device;
}

- (void)setDevice:(id)a3
{
}

- (int64_t)metadataState
{
  return self->_metadataState;
}

- (void)setMetadataState:(int64_t)a3
{
  self->_metadataState = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_device, 0);
  objc_storeStrong((id *)&self->_cloudTab, 0);
  objc_storeStrong((id *)&self->_imageProvider, 0);
  objc_storeStrong((id *)&self->_metadata, 0);
  objc_storeStrong((id *)&self->_title, 0);
  objc_storeStrong((id *)&self->_icon, 0);
  objc_storeStrong((id *)&self->_date, 0);
  objc_storeStrong((id *)&self->_URL, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
}

@end