@interface SSHarvestedApplicationMetadata
+ (BOOL)supportsBSXPCSecureCoding;
- (BOOL)canGenerateDocument;
- (NSArray)contentRects;
- (NSString)loggableDescription;
- (NSString)userActivityTitle;
- (NSURL)userActivityURL;
- (SSHarvestedApplicationMetadata)initWithBSXPCCoder:(id)a3;
- (void)encodeWithBSXPCCoder:(id)a3;
- (void)setCanGenerateDocument:(BOOL)a3;
- (void)setContentRects:(id)a3;
- (void)setUserActivityTitle:(id)a3;
- (void)setUserActivityURL:(id)a3;
@end

@implementation SSHarvestedApplicationMetadata

+ (BOOL)supportsBSXPCSecureCoding
{
  return 1;
}

- (SSHarvestedApplicationMetadata)initWithBSXPCCoder:(id)a3
{
  id v4 = a3;
  v5 = [(SSHarvestedApplicationMetadata *)self init];
  uint64_t v6 = objc_opt_class();
  uint64_t v7 = [v4 decodeCollectionOfClass:v6 containingClass:objc_opt_class() forKey:@"kSSHarvestedApplicationMetadataContentRectsKey"];
  contentRects = v5->_contentRects;
  v5->_contentRects = (NSArray *)v7;

  v5->_canGenerateDocument = [v4 decodeBoolForKey:@"kSSHarvestedApplicationMetadataCanGenerateDocument"];
  uint64_t v9 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"kSSHarvestedApplicationMetadataUserActivityTitleKey"];
  userActivityTitle = v5->_userActivityTitle;
  v5->_userActivityTitle = (NSString *)v9;

  v11 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"kSSHarvestedApplicationMetadataUserActivityURLKey"];

  uint64_t v12 = [NSURL URLWithString:v11];
  userActivityURL = v5->_userActivityURL;
  v5->_userActivityURL = (NSURL *)v12;

  return v5;
}

- (void)encodeWithBSXPCCoder:(id)a3
{
  id v4 = a3;
  v5 = [(SSHarvestedApplicationMetadata *)self contentRects];
  [v4 encodeCollection:v5 forKey:@"kSSHarvestedApplicationMetadataContentRectsKey"];

  [v4 encodeBool:self->_canGenerateDocument forKey:@"kSSHarvestedApplicationMetadataCanGenerateDocument"];
  uint64_t v6 = [(SSHarvestedApplicationMetadata *)self userActivityTitle];
  [v4 encodeObject:v6 forKey:@"kSSHarvestedApplicationMetadataUserActivityTitleKey"];

  id v8 = [(SSHarvestedApplicationMetadata *)self userActivityURL];
  uint64_t v7 = [v8 absoluteString];
  [v4 encodeObject:v7 forKey:@"kSSHarvestedApplicationMetadataUserActivityURLKey"];
}

- (NSString)loggableDescription
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  v3 = [MEMORY[0x263F089D8] string];
  [v3 appendString:@" contentRects: <"];
  long long v18 = 0u;
  long long v19 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  id v4 = [(SSHarvestedApplicationMetadata *)self contentRects];
  uint64_t v5 = [v4 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v17;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v17 != v7) {
          objc_enumerationMutation(v4);
        }
        [*(id *)(*((void *)&v16 + 1) + 8 * i) CGRectValue];
        uint64_t v9 = NSStringFromCGRect(v23);
        [v3 appendString:v9];

        [v3 appendString:@" "];
      }
      uint64_t v6 = [v4 countByEnumeratingWithState:&v16 objects:v20 count:16];
    }
    while (v6);
  }

  [v3 appendString:@">"];
  v10 = NSString;
  v11 = [(SSHarvestedApplicationMetadata *)self userActivityTitle];
  uint64_t v12 = objc_msgSend(v10, "stringWithFormat:", @" has userActivityTitle: %d", v11 != 0);
  [v3 appendString:v12];

  if (self->_canGenerateDocument) {
    v13 = @"YES";
  }
  else {
    v13 = @"NO";
  }
  v14 = [NSString stringWithFormat:@" can provide PDF: %@", v13];
  [v3 appendString:v14];

  return (NSString *)v3;
}

- (NSString)userActivityTitle
{
  return self->_userActivityTitle;
}

- (void)setUserActivityTitle:(id)a3
{
}

- (NSURL)userActivityURL
{
  return self->_userActivityURL;
}

- (void)setUserActivityURL:(id)a3
{
}

- (NSArray)contentRects
{
  return self->_contentRects;
}

- (void)setContentRects:(id)a3
{
}

- (BOOL)canGenerateDocument
{
  return self->_canGenerateDocument;
}

- (void)setCanGenerateDocument:(BOOL)a3
{
  self->_canGenerateDocument = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_contentRects, 0);
  objc_storeStrong((id *)&self->_userActivityURL, 0);
  objc_storeStrong((id *)&self->_userActivityTitle, 0);
}

@end