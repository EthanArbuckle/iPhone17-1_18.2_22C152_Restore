@interface WBSLPLinkMetadataInfo
- (BOOL)isMetadataCached;
- (BOOL)lastFetchDidSucceed;
- (BOOL)metadataHasImage;
- (NSDate)lastFetchDate;
- (NSString)urlString;
- (NSString)uuidString;
- (WBSLPLinkMetadataInfo)initWithSQLiteRow:(id)a3;
- (WBSLPLinkMetadataInfo)initWithURLString:(id)a3 uuidString:(id)a4 lastFetchDate:(id)a5 lastFetchDidSucceed:(BOOL)a6 metadataHasImage:(BOOL)a7;
- (id)copyWithoutUUID;
@end

@implementation WBSLPLinkMetadataInfo

- (WBSLPLinkMetadataInfo)initWithSQLiteRow:(id)a3
{
  id v4 = a3;
  v5 = [v4 stringAtIndex:0];
  v6 = [v4 stringAtIndex:1];
  v7 = (void *)MEMORY[0x1E4F1C9C8];
  [v4 doubleAtIndex:2];
  v8 = objc_msgSend(v7, "dateWithTimeIntervalSinceReferenceDate:");
  v9 = -[WBSLPLinkMetadataInfo initWithURLString:uuidString:lastFetchDate:lastFetchDidSucceed:metadataHasImage:](self, "initWithURLString:uuidString:lastFetchDate:lastFetchDidSucceed:metadataHasImage:", v5, v6, v8, [v4 BOOLAtIndex:3], objc_msgSend(v4, "BOOLAtIndex:", 4));

  return v9;
}

- (WBSLPLinkMetadataInfo)initWithURLString:(id)a3 uuidString:(id)a4 lastFetchDate:(id)a5 lastFetchDidSucceed:(BOOL)a6 metadataHasImage:(BOOL)a7
{
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  v24.receiver = self;
  v24.super_class = (Class)WBSLPLinkMetadataInfo;
  v15 = [(WBSLPLinkMetadataInfo *)&v24 init];
  if (v15)
  {
    uint64_t v16 = [v12 copy];
    urlString = v15->_urlString;
    v15->_urlString = (NSString *)v16;

    uint64_t v18 = [v13 copy];
    uuidString = v15->_uuidString;
    v15->_uuidString = (NSString *)v18;

    uint64_t v20 = [v14 copy];
    lastFetchDate = v15->_lastFetchDate;
    v15->_lastFetchDate = (NSDate *)v20;

    v15->_lastFetchDidSucceed = a6;
    v15->_metadataHasImage = a7;
    v22 = v15;
  }

  return v15;
}

- (BOOL)isMetadataCached
{
  return [(NSString *)self->_uuidString length] != 0;
}

- (id)copyWithoutUUID
{
  v3 = [WBSLPLinkMetadataInfo alloc];
  urlString = self->_urlString;
  lastFetchDate = self->_lastFetchDate;
  BOOL lastFetchDidSucceed = self->_lastFetchDidSucceed;
  BOOL metadataHasImage = self->_metadataHasImage;
  return [(WBSLPLinkMetadataInfo *)v3 initWithURLString:urlString uuidString:0 lastFetchDate:lastFetchDate lastFetchDidSucceed:lastFetchDidSucceed metadataHasImage:metadataHasImage];
}

- (NSString)urlString
{
  return self->_urlString;
}

- (NSString)uuidString
{
  return self->_uuidString;
}

- (NSDate)lastFetchDate
{
  return self->_lastFetchDate;
}

- (BOOL)lastFetchDidSucceed
{
  return self->_lastFetchDidSucceed;
}

- (BOOL)metadataHasImage
{
  return self->_metadataHasImage;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lastFetchDate, 0);
  objc_storeStrong((id *)&self->_uuidString, 0);
  objc_storeStrong((id *)&self->_urlString, 0);
}

@end