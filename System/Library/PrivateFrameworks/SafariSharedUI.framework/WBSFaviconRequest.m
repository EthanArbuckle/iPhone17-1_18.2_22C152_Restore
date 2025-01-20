@interface WBSFaviconRequest
- (BOOL)isIconDownloadingEnabled;
- (BOOL)isURLTypedByUser;
- (CGSize)iconSize;
- (NSString)uniqueIdentifier;
- (WBSFaviconRequest)initWithDomain:(id)a3 iconSize:(CGSize)a4 fallbackType:(unint64_t)a5;
- (WBSFaviconRequest)initWithURL:(id)a3 extraInfo:(id)a4;
- (WBSFaviconRequest)initWithURL:(id)a3 iconSize:(CGSize)a4 fallbackType:(unint64_t)a5;
- (WBSFaviconRequest)initWithURL:(id)a3 iconSize:(CGSize)a4 fallbackType:(unint64_t)a5 iconDownloadingEnabled:(BOOL)a6;
- (WBSFaviconRequest)initWithURL:(id)a3 iconSize:(CGSize)a4 fallbackType:(unint64_t)a5 isURLTypedByUser:(BOOL)a6;
- (id)_initWithURL:(id)a3 type:(unint64_t)a4 iconSize:(CGSize)a5 fallbackType:(unint64_t)a6 isURLTypedByUser:(BOOL)a7 iconDownloadingEnabled:(BOOL)a8;
- (unint64_t)fallbackType;
- (unint64_t)type;
@end

@implementation WBSFaviconRequest

- (WBSFaviconRequest)initWithURL:(id)a3 extraInfo:(id)a4
{
  return 0;
}

- (WBSFaviconRequest)initWithDomain:(id)a3 iconSize:(CGSize)a4 fallbackType:(unint64_t)a5
{
  double height = a4.height;
  double width = a4.width;
  if (a3)
  {
    v9 = (void *)MEMORY[0x1E4F1CB10];
    v10 = objc_msgSend(@"http://", "stringByAppendingString:");
    v11 = [v9 URLWithString:v10];
    v12 = (WBSFaviconRequest *)-[WBSFaviconRequest _initWithURL:type:iconSize:fallbackType:isURLTypedByUser:iconDownloadingEnabled:](self, "_initWithURL:type:iconSize:fallbackType:isURLTypedByUser:iconDownloadingEnabled:", v11, 1, a5, 0, 0, width, height);
  }
  else
  {
    v12 = (WBSFaviconRequest *)-[WBSFaviconRequest _initWithURL:type:iconSize:fallbackType:isURLTypedByUser:iconDownloadingEnabled:](self, "_initWithURL:type:iconSize:fallbackType:isURLTypedByUser:iconDownloadingEnabled:", 0, 1, a5, 0, 0, a4.width, a4.height);
  }

  return v12;
}

- (WBSFaviconRequest)initWithURL:(id)a3 iconSize:(CGSize)a4 fallbackType:(unint64_t)a5
{
  return (WBSFaviconRequest *)-[WBSFaviconRequest _initWithURL:type:iconSize:fallbackType:isURLTypedByUser:iconDownloadingEnabled:](self, "_initWithURL:type:iconSize:fallbackType:isURLTypedByUser:iconDownloadingEnabled:", a3, 0, a5, 0, 0, a4.width, a4.height);
}

- (WBSFaviconRequest)initWithURL:(id)a3 iconSize:(CGSize)a4 fallbackType:(unint64_t)a5 isURLTypedByUser:(BOOL)a6
{
  return (WBSFaviconRequest *)-[WBSFaviconRequest _initWithURL:type:iconSize:fallbackType:isURLTypedByUser:iconDownloadingEnabled:](self, "_initWithURL:type:iconSize:fallbackType:isURLTypedByUser:iconDownloadingEnabled:", a3, 0, a5, a6, 0, a4.width, a4.height);
}

- (WBSFaviconRequest)initWithURL:(id)a3 iconSize:(CGSize)a4 fallbackType:(unint64_t)a5 iconDownloadingEnabled:(BOOL)a6
{
  return (WBSFaviconRequest *)-[WBSFaviconRequest _initWithURL:type:iconSize:fallbackType:isURLTypedByUser:iconDownloadingEnabled:](self, "_initWithURL:type:iconSize:fallbackType:isURLTypedByUser:iconDownloadingEnabled:", a3, 0, a5, 0, a6, a4.width, a4.height);
}

- (id)_initWithURL:(id)a3 type:(unint64_t)a4 iconSize:(CGSize)a5 fallbackType:(unint64_t)a6 isURLTypedByUser:(BOOL)a7 iconDownloadingEnabled:(BOOL)a8
{
  BOOL v8 = a8;
  BOOL v9 = a7;
  double height = a5.height;
  double width = a5.width;
  v28[5] = *MEMORY[0x1E4F143B8];
  v27[0] = @"iconSizeExtraInfoKey";
  v15 = (void *)MEMORY[0x1E4F29238];
  id v16 = a3;
  v17 = objc_msgSend(v15, "valueWithCGSize:", width, height);
  v28[0] = v17;
  v27[1] = @"fallbackTypeKey";
  v18 = [NSNumber numberWithUnsignedInteger:a6];
  v28[1] = v18;
  v27[2] = @"requestTypeKey";
  v19 = [NSNumber numberWithUnsignedInteger:a4];
  v28[2] = v19;
  v27[3] = @"isURLTypedByUserKey";
  v20 = [NSNumber numberWithBool:v9];
  v28[3] = v20;
  v27[4] = @"isIconDownloadingEnabled";
  v21 = [NSNumber numberWithBool:v8];
  v28[4] = v21;
  v22 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v28 forKeys:v27 count:5];

  v26.receiver = self;
  v26.super_class = (Class)WBSFaviconRequest;
  v23 = [(WBSSiteMetadataRequest *)&v26 initWithURL:v16 extraInfo:v22];

  if (v23) {
    v24 = v23;
  }

  return v23;
}

- (NSString)uniqueIdentifier
{
  return (NSString *)objc_msgSend(NSString, "stringWithFormat:", @"%p", self);
}

- (CGSize)iconSize
{
  v2 = [(WBSSiteMetadataRequest *)self extraInfo];
  v3 = [v2 objectForKeyedSubscript:@"iconSizeExtraInfoKey"];
  [v3 CGSizeValue];
  double v5 = v4;
  double v7 = v6;

  double v8 = v5;
  double v9 = v7;
  result.double height = v9;
  result.double width = v8;
  return result;
}

- (unint64_t)fallbackType
{
  v2 = [(WBSSiteMetadataRequest *)self extraInfo];
  v3 = objc_msgSend(v2, "safari_numberForKey:", @"fallbackTypeKey");
  unint64_t v4 = [v3 unsignedIntegerValue];

  return v4;
}

- (unint64_t)type
{
  v2 = [(WBSSiteMetadataRequest *)self extraInfo];
  v3 = objc_msgSend(v2, "safari_numberForKey:", @"requestTypeKey");
  unint64_t v4 = [v3 unsignedIntegerValue];

  return v4;
}

- (BOOL)isURLTypedByUser
{
  v2 = [(WBSSiteMetadataRequest *)self extraInfo];
  char v3 = objc_msgSend(v2, "safari_BOOLForKey:", @"isURLTypedByUserKey");

  return v3;
}

- (BOOL)isIconDownloadingEnabled
{
  v2 = [(WBSSiteMetadataRequest *)self extraInfo];
  char v3 = objc_msgSend(v2, "safari_BOOLForKey:", @"isIconDownloadingEnabled");

  return v3;
}

@end