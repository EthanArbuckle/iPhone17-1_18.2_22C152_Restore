@interface SVXTapToRadarExtraContent
- (NSArray)attachmentURLs;
- (NSArray)deviceIDs;
- (NSArray)extensionIDs;
- (void)setAttachmentURLs:(id)a3;
- (void)setDeviceIDs:(id)a3;
- (void)setExtensionIDs:(id)a3;
@end

@implementation SVXTapToRadarExtraContent

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_deviceIDs, 0);
  objc_storeStrong((id *)&self->_extensionIDs, 0);

  objc_storeStrong((id *)&self->_attachmentURLs, 0);
}

- (void)setDeviceIDs:(id)a3
{
}

- (NSArray)deviceIDs
{
  return self->_deviceIDs;
}

- (void)setExtensionIDs:(id)a3
{
}

- (NSArray)extensionIDs
{
  return self->_extensionIDs;
}

- (void)setAttachmentURLs:(id)a3
{
}

- (NSArray)attachmentURLs
{
  return self->_attachmentURLs;
}

@end