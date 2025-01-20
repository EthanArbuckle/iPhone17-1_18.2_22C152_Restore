@interface CSImportInfo
- (NSString)contentType;
- (NSString)externalID;
- (NSString)sandboxExtension;
- (NSURL)contentURL;
- (void)setContentType:(id)a3;
- (void)setContentURL:(id)a3;
- (void)setExternalID:(id)a3;
- (void)setSandboxExtension:(id)a3;
@end

@implementation CSImportInfo

- (NSURL)contentURL
{
  return self->_contentURL;
}

- (void)setContentURL:(id)a3
{
}

- (NSString)contentType
{
  return self->_contentType;
}

- (void)setContentType:(id)a3
{
}

- (NSString)sandboxExtension
{
  return self->_sandboxExtension;
}

- (void)setSandboxExtension:(id)a3
{
}

- (NSString)externalID
{
  return self->_externalID;
}

- (void)setExternalID:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_externalID, 0);
  objc_storeStrong((id *)&self->_sandboxExtension, 0);
  objc_storeStrong((id *)&self->_contentType, 0);
  objc_storeStrong((id *)&self->_contentURL, 0);
}

@end