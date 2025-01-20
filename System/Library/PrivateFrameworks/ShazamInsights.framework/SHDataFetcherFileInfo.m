@interface SHDataFetcherFileInfo
+ (id)dataFetcherForSourceURL:(id)a3;
- (NSData)data;
- (NSDate)creationDate;
- (NSString)mimeType;
- (NSString)storefront;
- (NSString)suggestedExtension;
- (NSString)suggestedFileName;
- (NSString)uniqueHash;
- (NSURL)dataFilePathURL;
- (SHDataFetcherFileInfo)initWithData:(id)a3 suggestedFileName:(id)a4;
- (SHDataFetcherFileInfo)initWithDataURL:(id)a3;
- (SHDataFetcherFileInfo)initWithDataURL:(id)a3 suggestedFileName:(id)a4;
- (int)compressionType;
- (void)setCreationDate:(id)a3;
- (void)setMimeType:(id)a3;
- (void)setStorefront:(id)a3;
- (void)setUniqueHash:(id)a3;
@end

@implementation SHDataFetcherFileInfo

+ (id)dataFetcherForSourceURL:(id)a3
{
  [a3 isFileURL];
  v3 = objc_opt_new();
  return v3;
}

- (SHDataFetcherFileInfo)initWithData:(id)a3 suggestedFileName:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)SHDataFetcherFileInfo;
  v9 = [(SHDataFetcherFileInfo *)&v12 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_data, a3);
    objc_storeStrong((id *)&v10->_suggestedFileName, a4);
  }

  return v10;
}

- (SHDataFetcherFileInfo)initWithDataURL:(id)a3 suggestedFileName:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)SHDataFetcherFileInfo;
  v9 = [(SHDataFetcherFileInfo *)&v12 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_dataFilePathURL, a3);
    objc_storeStrong((id *)&v10->_suggestedFileName, a4);
  }

  return v10;
}

- (SHDataFetcherFileInfo)initWithDataURL:(id)a3
{
  id v4 = a3;
  v5 = [v4 lastPathComponent];
  v6 = [(SHDataFetcherFileInfo *)self initWithDataURL:v4 suggestedFileName:v5];

  return v6;
}

- (int)compressionType
{
  v2 = (void *)MEMORY[0x263F6C490];
  v3 = NSURL;
  id v4 = [(SHDataFetcherFileInfo *)self suggestedFileName];
  v5 = [v3 fileURLWithPath:v4 isDirectory:0];
  v6 = [v5 pathExtension];
  LODWORD(v2) = [v2 supportedCompressionTypeFromFilePathExtension:v6];

  return (int)v2;
}

- (NSString)suggestedExtension
{
  v2 = NSURL;
  v3 = [(SHDataFetcherFileInfo *)self suggestedFileName];
  id v4 = [v2 URLWithString:v3];
  v5 = [v4 pathExtension];

  return (NSString *)v5;
}

- (NSData)data
{
  data = self->_data;
  if (data)
  {
    v3 = data;
  }
  else
  {
    id v4 = (void *)MEMORY[0x263EFF8F8];
    v5 = [(SHDataFetcherFileInfo *)self dataFilePathURL];
    v3 = [v4 dataWithContentsOfURL:v5];
  }
  return v3;
}

- (NSURL)dataFilePathURL
{
  return self->_dataFilePathURL;
}

- (NSString)suggestedFileName
{
  return self->_suggestedFileName;
}

- (NSDate)creationDate
{
  return self->_creationDate;
}

- (void)setCreationDate:(id)a3
{
}

- (NSString)storefront
{
  return self->_storefront;
}

- (void)setStorefront:(id)a3
{
}

- (NSString)uniqueHash
{
  return self->_uniqueHash;
}

- (void)setUniqueHash:(id)a3
{
}

- (NSString)mimeType
{
  return self->_mimeType;
}

- (void)setMimeType:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_mimeType, 0);
  objc_storeStrong((id *)&self->_uniqueHash, 0);
  objc_storeStrong((id *)&self->_storefront, 0);
  objc_storeStrong((id *)&self->_creationDate, 0);
  objc_storeStrong((id *)&self->_suggestedFileName, 0);
  objc_storeStrong((id *)&self->_dataFilePathURL, 0);
  objc_storeStrong((id *)&self->_data, 0);
}

@end