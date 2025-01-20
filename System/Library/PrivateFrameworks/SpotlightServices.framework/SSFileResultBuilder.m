@interface SSFileResultBuilder
+ (BOOL)isCoreSpotlightResult;
+ (BOOL)supportsResult:(id)a3;
+ (CGSize)defaultThumbnailSizeIsCompact:(BOOL)a3;
+ (id)bundleId;
+ (id)stringWithModificationDate:(id)a3 creationDate:(id)a4;
+ (id)stringWithPageCount:(id)a3;
- (BOOL)buildButtonItemsAreTrailing;
- (BOOL)isFolder;
- (NSDate)creationDate;
- (NSDate)modificationDate;
- (NSNumber)pageCount;
- (NSNumber)sizeInBytes;
- (NSString)contentType;
- (NSString)fileProviderDomainId;
- (NSString)fileProviderId;
- (NSString)kind;
- (NSString)name;
- (NSString)thumbnailURL;
- (SSFileResultBuilder)initWithResult:(id)a3;
- (id)buildAppTopHitEntityCardSection;
- (id)buildBadgingImageWithThumbnail:(id)a3;
- (id)buildButtonItems;
- (id)buildCommand;
- (id)buildCompactCardSection;
- (id)buildDescriptions;
- (id)buildInlineCardSection;
- (id)buildPunchoutCommandForFile;
- (id)buildPunchouts;
- (id)buildThumbnail;
- (id)openFileProviderItemCommand;
- (void)buildThumbnail;
- (void)setContentType:(id)a3;
- (void)setCreationDate:(id)a3;
- (void)setFileProviderDomainId:(id)a3;
- (void)setFileProviderId:(id)a3;
- (void)setIsFolder:(BOOL)a3;
- (void)setKind:(id)a3;
- (void)setModificationDate:(id)a3;
- (void)setName:(id)a3;
- (void)setPageCount:(id)a3;
- (void)setSizeInBytes:(id)a3;
- (void)setThumbnailURL:(id)a3;
@end

@implementation SSFileResultBuilder

+ (id)bundleId
{
  return @"com.apple.DocumentsApp";
}

+ (BOOL)supportsResult:(id)a3
{
  id v4 = a3;
  v5 = [v4 resultBundleId];
  v8.receiver = a1;
  v8.super_class = (Class)&OBJC_METACLASS___SSFileResultBuilder;
  LOBYTE(a1) = objc_msgSendSuper2(&v8, sel_supportsResult_, v4);

  if (a1 & 1) != 0 || ([v5 hasPrefix:@"com.apple.CloudDocs"]) {
    char v6 = 1;
  }
  else {
    char v6 = [v5 isEqualToString:@"com.apple.FileProvider.LocalStorage"];
  }

  return v6;
}

+ (BOOL)isCoreSpotlightResult
{
  return 1;
}

+ (id)stringWithModificationDate:(id)a3 creationDate:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  v7 = v6;
  if (v5)
  {
    objc_super v8 = +[SSDateFormatManager dateModifiedStringFormat];
    v9 = v5;
  }
  else
  {
    if (!v6)
    {
      objc_super v8 = 0;
      id v10 = 0;
      goto LABEL_8;
    }
    objc_super v8 = +[SSDateFormatManager dateCreatedStringFormat];
    v9 = v7;
  }
  id v10 = v9;
  if (v8)
  {
    v11 = +[SSDateFormatManager shortDateTimeFormatter];
    v12 = [v11 stringFromDate:v10];

    v13 = objc_msgSend(NSString, "stringWithFormat:", v8, v12);

    goto LABEL_9;
  }
LABEL_8:
  v13 = 0;
LABEL_9:

  return v13;
}

+ (id)stringWithPageCount:(id)a3
{
  v3 = NSString;
  id v4 = (void *)MEMORY[0x1E4F28B50];
  id v5 = a3;
  id v6 = [v4 bundleForClass:objc_opt_class()];
  v7 = [v6 localizedStringForKey:@"PAGES_FORMAT" value:&stru_1F1824018 table:@"SpotlightServices"];
  objc_super v8 = objc_msgSend(v3, "localizedStringWithFormat:", v7, v5);

  return v8;
}

- (SSFileResultBuilder)initWithResult:(id)a3
{
  id v4 = a3;
  v26.receiver = self;
  v26.super_class = (Class)SSFileResultBuilder;
  id v5 = [(SSResultBuilder *)&v26 initWithResult:v4];
  if (v5)
  {
    id v6 = [v4 valueForAttribute:*MEMORY[0x1E4F22C38] withType:objc_opt_class()];
    [(SSFileResultBuilder *)v5 setCreationDate:v6];

    v7 = [v4 valueForAttribute:*MEMORY[0x1E4F22C48] withType:objc_opt_class()];
    [(SSFileResultBuilder *)v5 setModificationDate:v7];

    objc_super v8 = [v4 valueForAttribute:*MEMORY[0x1E4F22F38] withType:objc_opt_class()];
    if (v8)
    {
      [(SSResultBuilder *)v5 setCoreSpotlightId:v8];
    }
    else
    {
      v9 = [v4 identifier];
      [(SSResultBuilder *)v5 setCoreSpotlightId:v9];
    }
    id v10 = [v4 fileProviderIdentifier];
    if (v10)
    {
      [(SSFileResultBuilder *)v5 setFileProviderId:v10];
    }
    else
    {
      v11 = [v4 valueForAttribute:*MEMORY[0x1E4F22FB0] withType:objc_opt_class()];
      [(SSFileResultBuilder *)v5 setFileProviderId:v11];
    }
    v12 = [v4 fileProviderDomainIdentifier];
    if (v12)
    {
      [(SSFileResultBuilder *)v5 setFileProviderDomainId:v12];
    }
    else
    {
      v13 = [v4 valueForAttribute:*MEMORY[0x1E4F22D28] withType:objc_opt_class()];
      [(SSFileResultBuilder *)v5 setFileProviderDomainId:v13];
    }
    v14 = [v4 valueForAttribute:*MEMORY[0x1E4F230D0] withType:objc_opt_class()];
    [(SSFileResultBuilder *)v5 setKind:v14];

    v15 = [v4 valueForAttribute:*MEMORY[0x1E4F23648] withType:objc_opt_class()];
    [(SSFileResultBuilder *)v5 setThumbnailURL:v15];

    v16 = [v4 valueForAttribute:*MEMORY[0x1E4F22CE8] withType:objc_opt_class()];
    [(SSFileResultBuilder *)v5 setName:v16];

    int v17 = isMacOS();
    v18 = (void *)MEMORY[0x1E4F23128];
    if (!v17) {
      v18 = (void *)MEMORY[0x1E4F22FB8];
    }
    v19 = [v4 valueForAttribute:*v18 withType:objc_opt_class()];
    [(SSFileResultBuilder *)v5 setSizeInBytes:v19];

    v20 = [v4 valueForAttribute:*MEMORY[0x1E4F23188] withType:objc_opt_class()];
    [(SSFileResultBuilder *)v5 setPageCount:v20];

    v21 = [v4 contentType];
    [(SSFileResultBuilder *)v5 setContentType:v21];

    v22 = [(SSFileResultBuilder *)v5 contentType];
    v23 = [(id)*MEMORY[0x1E4F443C8] identifier];
    -[SSFileResultBuilder setIsFolder:](v5, "setIsFolder:", [v22 isEqualToString:v23]);

    v24 = [v4 valueForAttribute:*MEMORY[0x1E4F22C70] withType:objc_opt_class()];
    [(SSResultBuilder *)v5 setFilePath:v24];
  }
  return v5;
}

- (id)buildInlineCardSection
{
  v19.receiver = self;
  v19.super_class = (Class)SSFileResultBuilder;
  v3 = [(SSResultBuilder *)&v19 buildInlineCardSection];
  if ((SSSnippetModernizationEnabled() & 1) == 0)
  {
    id v4 = [(SSFileResultBuilder *)self pageCount];
    uint64_t v5 = [v4 unsignedIntegerValue];

    if (v5)
    {
      id v6 = (void *)MEMORY[0x1E4F9A378];
      v7 = objc_opt_class();
      objc_super v8 = [(SSFileResultBuilder *)self pageCount];
      v9 = [v7 stringWithPageCount:v8];
      id v10 = [v6 textWithString:v9];

      v11 = [v3 descriptions];
      v12 = [v11 arrayByAddingObject:v10];
      [v3 setDescriptions:v12];
    }
    v13 = objc_opt_class();
    v14 = [(SSFileResultBuilder *)self modificationDate];
    v15 = [(SSFileResultBuilder *)self creationDate];
    v16 = [v13 stringWithModificationDate:v14 creationDate:v15];

    if (v16)
    {
      int v17 = [MEMORY[0x1E4F9A378] textWithString:v16];
      [v3 setFootnote:v17];
    }
    else
    {
      [v3 setFootnote:0];
    }
  }
  return v3;
}

- (id)buildButtonItems
{
  v8[1] = *MEMORY[0x1E4F143B8];
  if (!SSSnippetModernizationEnabled()) {
    goto LABEL_5;
  }
  v3 = [(SSFileResultBuilder *)self openFileProviderItemCommand];
  if (!v3 || [(SSFileResultBuilder *)self isFolder])
  {

LABEL_5:
    v7.receiver = self;
    v7.super_class = (Class)SSFileResultBuilder;
    id v4 = [(SSResultBuilder *)&v7 buildButtonItems];
    goto LABEL_6;
  }
  [v3 setShouldRevealFile:1];
  id v6 = objc_opt_new();
  [v6 setCommand:v3];
  v8[0] = v6;
  id v4 = [MEMORY[0x1E4F1C978] arrayWithObjects:v8 count:1];

LABEL_6:
  return v4;
}

- (BOOL)buildButtonItemsAreTrailing
{
  return 1;
}

- (id)buildCompactCardSection
{
  v12.receiver = self;
  v12.super_class = (Class)SSFileResultBuilder;
  v3 = [(SSResultBuilder *)&v12 buildCompactCardSection];
  id v4 = objc_opt_class();
  uint64_t v5 = [(SSFileResultBuilder *)self modificationDate];
  id v6 = [(SSFileResultBuilder *)self creationDate];
  objc_super v7 = [v4 stringWithModificationDate:v5 creationDate:v6];

  if (v7)
  {
    objc_super v8 = [v3 descriptions];
    v9 = [MEMORY[0x1E4F9A378] textWithString:v7];
    id v10 = [v8 arrayByAddingObject:v9];
    [v3 setDescriptions:v10];
  }
  return v3;
}

- (id)buildThumbnail
{
  v3 = [(SSResultBuilder *)self filePath];
  if ([v3 length])
  {

    goto LABEL_3;
  }
  uint64_t v11 = [(SSResultBuilder *)self coreSpotlightId];
  if (v11)
  {
    objc_super v12 = (void *)v11;
    v13 = [(SSFileResultBuilder *)self fileProviderId];

    if (v13)
    {
LABEL_3:
      id v4 = objc_opt_new();
      uint64_t v5 = [(SSResultBuilder *)self coreSpotlightId];
      [v4 setCoreSpotlightIdentifier:v5];

      id v6 = [(SSFileResultBuilder *)self fileProviderId];
      [v4 setFileProviderIdentifier:v6];

      objc_super v7 = [(SSResultBuilder *)self filePath];

      if (v7)
      {
        objc_super v8 = (void *)MEMORY[0x1E4F1CB10];
        v9 = [(SSResultBuilder *)self filePath];
        id v10 = objc_msgSend(v8, "fileURLWithPath:isDirectory:", v9, -[SSFileResultBuilder isFolder](self, "isFolder"));
        [v4 setFilePath:v10];
      }
      goto LABEL_12;
    }
  }
  else
  {
  }
  v14 = SSGeneralLog();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
    [(SSFileResultBuilder *)self buildThumbnail];
  }

  v16.receiver = self;
  v16.super_class = (Class)SSFileResultBuilder;
  id v4 = [(SSResultBuilder *)&v16 buildThumbnail];
LABEL_12:
  return v4;
}

- (id)buildBadgingImageWithThumbnail:(id)a3
{
  id v4 = a3;
  if ([(SSFileResultBuilder *)self isFolder]) {
    goto LABEL_3;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    goto LABEL_3;
  }
  objc_super v7 = [(SSResultBuilder *)self filePath];
  if (v7)
  {
  }
  else
  {
    uint64_t v5 = [(SSResultBuilder *)self coreSpotlightId];
    if (!v5) {
      goto LABEL_4;
    }
    objc_super v16 = [(SSFileResultBuilder *)self fileProviderId];

    if (!v16)
    {
LABEL_3:
      uint64_t v5 = 0;
      goto LABEL_4;
    }
  }
  uint64_t v5 = objc_opt_new();
  objc_super v8 = [(SSResultBuilder *)self coreSpotlightId];
  [v5 setCoreSpotlightIdentifier:v8];

  v9 = [(SSFileResultBuilder *)self fileProviderId];
  [v5 setFileProviderIdentifier:v9];

  id v10 = [(SSResultBuilder *)self filePath];

  if (v10)
  {
    uint64_t v11 = (void *)MEMORY[0x1E4F9A2F8];
    objc_super v12 = (void *)MEMORY[0x1E4F1CB10];
    v13 = [(SSResultBuilder *)self filePath];
    v14 = objc_msgSend(v12, "fileURLWithPath:isDirectory:", v13, -[SSFileResultBuilder isFolder](self, "isFolder"));
    v15 = [v11 punchoutWithURL:v14];
    [v5 setPunchout:v15];
  }
LABEL_4:

  return v5;
}

+ (CGSize)defaultThumbnailSizeIsCompact:(BOOL)a3
{
  double v3 = 0.0;
  double v4 = 0.0;
  result.height = v4;
  result.width = v3;
  return result;
}

- (id)buildDescriptions
{
  v25[1] = *MEMORY[0x1E4F143B8];
  double v3 = objc_opt_new();
  uint64_t v4 = [(SSFileResultBuilder *)self sizeInBytes];
  if (v4)
  {
    uint64_t v5 = (void *)v4;
    BOOL v6 = [(SSFileResultBuilder *)self isFolder];

    if (!v6)
    {
      objc_super v7 = [(SSFileResultBuilder *)self sizeInBytes];
      objc_super v8 = +[SSNumberFormatManager stringFromByteCount:](SSNumberFormatManager, "stringFromByteCount:", [v7 longLongValue]);
      [v3 addObject:v8];
    }
  }
  v9 = [(SSResultBuilder *)self uniformType];
  if (v9)
  {
  }
  else
  {
    id v10 = [(SSFileResultBuilder *)self kind];

    if (!v10) {
      goto LABEL_11;
    }
  }
  uint64_t v11 = [(SSResultBuilder *)self uniformType];
  uint64_t v12 = [v11 localizedDescription];
  if (v12)
  {
    v13 = (void *)v12;

LABEL_10:
    [v3 addObject:v13];

    goto LABEL_11;
  }
  v13 = [(SSFileResultBuilder *)self kind];

  if (v13) {
    goto LABEL_10;
  }
LABEL_11:
  uint64_t v14 = [(SSFileResultBuilder *)self modificationDate];
  if (v14)
  {
    v15 = (void *)v14;
    int v16 = SSSnippetModernizationEnabled();

    if (v16)
    {
      if (isMacOS())
      {
        int v17 = objc_opt_class();
        v18 = [(SSFileResultBuilder *)self modificationDate];
        objc_super v19 = [v17 stringWithModificationDate:v18 creationDate:0];
      }
      else
      {
        v18 = +[SSDateFormatManager shortDateTimeFormatter];
        v20 = [(SSFileResultBuilder *)self modificationDate];
        objc_super v19 = [v18 stringFromDate:v20];
      }
      [v3 addObject:v19];
    }
  }
  if (SSSnippetModernizationEnabled())
  {
    v21 = [v3 componentsJoinedByString:@" · "];
    v22 = [MEMORY[0x1E4F9A378] textWithString:v21];
    v25[0] = v22;
    v23 = [MEMORY[0x1E4F1C978] arrayWithObjects:v25 count:1];
  }
  else
  {
    v23 = [(id)objc_opt_class() richTextsFromStrings:v3];
  }

  return v23;
}

- (id)buildPunchouts
{
  return 0;
}

- (id)buildCommand
{
  double v3 = [(SSFileResultBuilder *)self openFileProviderItemCommand];
  if (!v3)
  {
    double v3 = [(SSFileResultBuilder *)self buildPunchoutCommandForFile];
  }
  return v3;
}

- (id)openFileProviderItemCommand
{
  double v3 = [(SSFileResultBuilder *)self fileProviderId];
  if (v3)
  {
    uint64_t v4 = [(SSResultBuilder *)self coreSpotlightId];

    if (v4)
    {
      double v3 = objc_opt_new();
      uint64_t v5 = [(SSResultBuilder *)self coreSpotlightId];
      [v3 setCoreSpotlightIdentifier:v5];

      BOOL v6 = [(SSFileResultBuilder *)self fileProviderId];
      [v3 setFileProviderIdentifier:v6];
    }
    else
    {
      double v3 = 0;
    }
  }
  return v3;
}

- (id)buildPunchoutCommandForFile
{
  v2 = [(SSResultBuilder *)self result];
  double v3 = [v2 url];

  uint64_t v4 = objc_opt_new();
  uint64_t v5 = [MEMORY[0x1E4F9A2F8] punchoutWithURL:v3];
  [v4 setPunchout:v5];

  return v4;
}

- (id)buildAppTopHitEntityCardSection
{
  v5.receiver = self;
  v5.super_class = (Class)SSFileResultBuilder;
  v2 = [(SSResultBuilder *)&v5 buildAppTopHitEntityCardSection];
  double v3 = [v2 thumbnail];
  [v3 setCornerRoundingStyle:1];

  return v2;
}

- (BOOL)isFolder
{
  return self->_isFolder;
}

- (void)setIsFolder:(BOOL)a3
{
  self->_isFolder = a3;
}

- (NSDate)creationDate
{
  return self->_creationDate;
}

- (void)setCreationDate:(id)a3
{
}

- (NSDate)modificationDate
{
  return self->_modificationDate;
}

- (void)setModificationDate:(id)a3
{
}

- (NSNumber)sizeInBytes
{
  return self->_sizeInBytes;
}

- (void)setSizeInBytes:(id)a3
{
}

- (NSNumber)pageCount
{
  return self->_pageCount;
}

- (void)setPageCount:(id)a3
{
}

- (NSString)contentType
{
  return self->_contentType;
}

- (void)setContentType:(id)a3
{
}

- (NSString)fileProviderId
{
  return self->_fileProviderId;
}

- (void)setFileProviderId:(id)a3
{
}

- (NSString)fileProviderDomainId
{
  return self->_fileProviderDomainId;
}

- (void)setFileProviderDomainId:(id)a3
{
}

- (NSString)name
{
  return self->_name;
}

- (void)setName:(id)a3
{
}

- (NSString)kind
{
  return self->_kind;
}

- (void)setKind:(id)a3
{
}

- (NSString)thumbnailURL
{
  return self->_thumbnailURL;
}

- (void)setThumbnailURL:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_thumbnailURL, 0);
  objc_storeStrong((id *)&self->_kind, 0);
  objc_storeStrong((id *)&self->_name, 0);
  objc_storeStrong((id *)&self->_fileProviderDomainId, 0);
  objc_storeStrong((id *)&self->_fileProviderId, 0);
  objc_storeStrong((id *)&self->_contentType, 0);
  objc_storeStrong((id *)&self->_pageCount, 0);
  objc_storeStrong((id *)&self->_sizeInBytes, 0);
  objc_storeStrong((id *)&self->_modificationDate, 0);
  objc_storeStrong((id *)&self->_creationDate, 0);
}

- (void)buildThumbnail
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  uint64_t v4 = [a1 result];
  objc_super v5 = [a1 result];
  BOOL v6 = [v5 fileProviderDomainIdentifier];
  objc_super v7 = [a1 result];
  objc_super v8 = [v7 fileProviderIdentifier];
  v9 = [a1 filePath];
  int v10 = 138413058;
  uint64_t v11 = v4;
  __int16 v12 = 2112;
  v13 = v6;
  __int16 v14 = 2112;
  v15 = v8;
  __int16 v16 = 2112;
  int v17 = v9;
  _os_log_error_impl(&dword_1BDB2A000, a2, OS_LOG_TYPE_ERROR, "SSFileResultBuilder: missing info for SFQuickLookThumbnailImage: %@\nresult.fileProviderDomainIdentifier: %@\nresult.fileProviderIdentifier: %@\nfilePath: %@", (uint8_t *)&v10, 0x2Au);
}

@end