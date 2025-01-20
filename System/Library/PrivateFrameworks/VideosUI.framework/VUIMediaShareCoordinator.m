@interface VUIMediaShareCoordinator
+ (BOOL)shouldShowShareForMediaItem:(id)a3;
+ (void)shareMediaItem:(id)a3 metadata:(id)a4;
@end

@implementation VUIMediaShareCoordinator

+ (BOOL)shouldShowShareForMediaItem:(id)a3
{
  v3 = [a3 mediaItemMetadataForProperty:@"mediaShareMetadata"];
  v4 = [v3 objectForKey:@"url"];
  v5 = [v3 objectForKey:@"title"];
  if ([v4 length]) {
    BOOL v6 = [v5 length] != 0;
  }
  else {
    BOOL v6 = 0;
  }

  return v6;
}

+ (void)shareMediaItem:(id)a3 metadata:(id)a4
{
  id v15 = a3;
  id v5 = a4;
  objc_msgSend(v5, "vui_stringForKey:", @"imageUrl");
  BOOL v6 = (__CFString *)objc_claimAutoreleasedReturnValue();
  if (![(__CFString *)v6 length])
  {
    uint64_t v7 = [v15 mediaItemMetadataForProperty:*MEMORY[0x1E4FA9E08]];

    BOOL v6 = (__CFString *)v7;
  }
  v8 = [v5 objectForKey:@"url"];
  v9 = [v5 objectForKey:@"previewUrl"];
  v10 = [v5 objectForKey:@"title"];
  v11 = [v5 objectForKey:@"subtitle"];
  v12 = [v5 objectForKey:@"groupActivityMetadata"];
  if (!v6) {
    BOOL v6 = &stru_1F3E921E0;
  }
  v13 = [v5 objectForKey:@"metrics"];

  v14 = +[VUIMetricsController sharedInstance];
  [v14 recordClick:v13];

  +[VUIShareActivityViewController_iOS shareMediaItem:v8 previewURLString:v9 title:v10 subtitle:v11 imageURLStr:v6 groupActivityMetadata:v12 sourceView:0 completionHandler:&__block_literal_global_71];
}

@end