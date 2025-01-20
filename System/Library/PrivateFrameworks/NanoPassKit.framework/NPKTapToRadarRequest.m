@interface NPKTapToRadarRequest
+ (BOOL)canPostRequest;
+ (void)postWithTitle:(id)a3 body:(id)a4;
- (NPKTapToRadarRequest)initWithDictionary:(id)a3;
- (NPKTapToRadarRequest)initWithTitle:(id)a3 body:(id)a4;
- (NPKTapToRadarRequest)initWithTitle:(id)a3 body:(id)a4 attachmentPaths:(id)a5;
- (NPKTapToRadarRequest)initWithURL:(id)a3;
- (NSSet)attachmentsPaths;
- (NSString)body;
- (NSString)title;
- (NSURL)tapToRadarURL;
- (id)_attachmentURLs;
- (id)description;
- (void)post;
@end

@implementation NPKTapToRadarRequest

- (NPKTapToRadarRequest)initWithTitle:(id)a3 body:(id)a4
{
  return [(NPKTapToRadarRequest *)self initWithTitle:a3 body:a4 attachmentPaths:0];
}

- (NPKTapToRadarRequest)initWithTitle:(id)a3 body:(id)a4 attachmentPaths:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v19.receiver = self;
  v19.super_class = (Class)NPKTapToRadarRequest;
  v11 = [(NPKTapToRadarRequest *)&v19 init];
  if (v11)
  {
    uint64_t v12 = [v8 copy];
    title = v11->_title;
    v11->_title = (NSString *)v12;

    uint64_t v14 = [v9 copy];
    body = v11->_body;
    v11->_body = (NSString *)v14;

    uint64_t v16 = [v10 copy];
    attachmentsPaths = v11->_attachmentsPaths;
    v11->_attachmentsPaths = (NSSet *)v16;
  }
  return v11;
}

- (NPKTapToRadarRequest)initWithDictionary:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [v4 objectForKeyedSubscript:@"NPKTapToRadarTitleUserNotificationKey"];
  v6 = (void *)v5;
  v7 = @"Wallet issue detected automatically";
  if (v5) {
    v7 = (__CFString *)v5;
  }
  id v8 = v7;

  uint64_t v9 = [v4 objectForKeyedSubscript:@"NPKTapToRadarBodyUserNotificationKey"];
  id v10 = (void *)v9;
  v11 = @"Requested to file a rdar.";
  if (v9) {
    v11 = (__CFString *)v9;
  }
  uint64_t v12 = v11;

  v13 = [v4 objectForKeyedSubscript:@"NPKTapToRadarAttachmentsPathsNotificationKey"];

  if (v13) {
    [MEMORY[0x263EFFA08] setWithArray:v13];
  }
  else {
  uint64_t v14 = [MEMORY[0x263EFFA08] set];
  }
  v15 = [[NPKTapToRadarRequest alloc] initWithTitle:v8 body:v12 attachmentPaths:v14];

  return v15;
}

- (NPKTapToRadarRequest)initWithURL:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [MEMORY[0x263F08BA0] componentsWithURL:v4 resolvingAgainstBaseURL:1];
  uint64_t v26 = 0;
  v27 = &v26;
  uint64_t v28 = 0x3032000000;
  v29 = __Block_byref_object_copy__20;
  v30 = __Block_byref_object_dispose__20;
  id v31 = 0;
  uint64_t v20 = 0;
  v21 = &v20;
  uint64_t v22 = 0x3032000000;
  v23 = __Block_byref_object_copy__20;
  v24 = __Block_byref_object_dispose__20;
  id v25 = 0;
  uint64_t v14 = 0;
  v15 = &v14;
  uint64_t v16 = 0x3032000000;
  v17 = __Block_byref_object_copy__20;
  v18 = __Block_byref_object_dispose__20;
  id v19 = 0;
  v6 = [v5 scheme];
  int v7 = [v6 isEqualToString:@"tap-to-radar"];

  if (v7)
  {
    id v8 = [v5 queryItems];
    v13[0] = MEMORY[0x263EF8330];
    v13[1] = 3221225472;
    v13[2] = __36__NPKTapToRadarRequest_initWithURL___block_invoke;
    v13[3] = &unk_2644D70C8;
    v13[4] = &v26;
    v13[5] = &v20;
    v13[6] = &v14;
    [v8 enumerateObjectsUsingBlock:v13];
  }
  if (!v15[5])
  {
    uint64_t v9 = [MEMORY[0x263EFFA08] set];
    id v10 = (void *)v15[5];
    v15[5] = v9;
  }
  if (v27[5] && v21[5])
  {
    v11 = -[NPKTapToRadarRequest initWithTitle:body:attachmentPaths:](self, "initWithTitle:body:attachmentPaths:");
  }
  else
  {

    v11 = 0;
  }
  _Block_object_dispose(&v14, 8);

  _Block_object_dispose(&v20, 8);
  _Block_object_dispose(&v26, 8);

  return v11;
}

void __36__NPKTapToRadarRequest_initWithURL___block_invoke(void *a1, void *a2, uint64_t a3, unsigned char *a4)
{
  id v22 = a2;
  v6 = [v22 name];
  int v7 = [v6 isEqualToString:@"Title"];

  if (v7)
  {
    uint64_t v8 = [v22 value];
    uint64_t v9 = a1[4];
LABEL_5:
    uint64_t v12 = *(void *)(v9 + 8);
    v13 = *(void **)(v12 + 40);
    *(void *)(v12 + 40) = v8;
    goto LABEL_6;
  }
  id v10 = [v22 name];
  int v11 = [v10 isEqualToString:@"Description"];

  if (v11)
  {
    uint64_t v8 = [v22 value];
    uint64_t v9 = a1[5];
    goto LABEL_5;
  }
  v15 = [v22 name];
  int v16 = [v15 isEqualToString:@"Attachments"];

  if (!v16) {
    goto LABEL_7;
  }
  v17 = (void *)MEMORY[0x263EFFA08];
  v13 = [v22 value];
  v18 = [v13 componentsSeparatedByString:@","];
  uint64_t v19 = [v17 setWithArray:v18];
  uint64_t v20 = *(void *)(a1[6] + 8);
  v21 = *(void **)(v20 + 40);
  *(void *)(v20 + 40) = v19;

LABEL_6:
LABEL_7:
  uint64_t v14 = *(void *)(*(void *)(a1[4] + 8) + 40);
  if (v14)
  {
    uint64_t v14 = *(void *)(*(void *)(a1[5] + 8) + 40);
    if (v14) {
      LOBYTE(v14) = *(void *)(*(void *)(a1[6] + 8) + 40) != 0;
    }
  }
  *a4 = v14;
}

+ (BOOL)canPostRequest
{
  return PKIsInternalInstall() != 0;
}

- (NSURL)tapToRadarURL
{
  tapToRadarURL = self->_tapToRadarURL;
  if (!tapToRadarURL)
  {
    id v4 = [MEMORY[0x263F08BA0] componentsWithString:@"tap-to-radar://new"];
    uint64_t v5 = [MEMORY[0x263EFF980] array];
    v6 = [MEMORY[0x263F08BD0] queryItemWithName:@"ComponentName" value:@"Wallet"];
    [v5 addObject:v6];

    int v7 = [MEMORY[0x263F08BD0] queryItemWithName:@"ComponentVersion" value:@"watchOS"];
    [v5 addObject:v7];

    uint64_t v8 = [MEMORY[0x263F08BD0] queryItemWithName:@"ComponentID" value:@"547743"];
    [v5 addObject:v8];

    uint64_t v9 = [MEMORY[0x263F08BD0] queryItemWithName:@"Title" value:self->_title];
    [v5 addObject:v9];

    if ([(NSString *)self->_body containsString:@"IMPORTANT:\nThe attached logging may contain the time and location of recent transactions you've made with Apple Pay. These logs greatly assist diagnosing and resolving issues."])
    {
      id v10 = self->_body;
    }
    else
    {
      id v10 = [NSString stringWithFormat:@"%@\n\n%@", self->_body, @"IMPORTANT:\nThe attached logging may contain the time and location of recent transactions you've made with Apple Pay. These logs greatly assist diagnosing and resolving issues."];
    }
    int v11 = v10;
    uint64_t v12 = [MEMORY[0x263F08BD0] queryItemWithName:@"Description" value:v10];
    [v5 addObject:v12];

    v13 = [MEMORY[0x263F08BD0] queryItemWithName:@"AutoDiagnostics" value:@"phone,watch"];
    [v5 addObject:v13];

    uint64_t v14 = [MEMORY[0x263F08BD0] queryItemWithName:@"Classification" value:@"Serious Bug"];
    [v5 addObject:v14];

    v15 = [MEMORY[0x263F08BD0] queryItemWithName:@"Reproducibility" value:@"I Didn't Try"];
    [v5 addObject:v15];

    int v16 = [(NSSet *)self->_attachmentsPaths allObjects];
    v17 = [v16 componentsJoinedByString:@","];

    v18 = [MEMORY[0x263F08BD0] queryItemWithName:@"Attachments" value:v17];
    [v5 addObject:v18];

    [v4 setQueryItems:v5];
    uint64_t v19 = [v4 URL];
    uint64_t v20 = self->_tapToRadarURL;
    self->_tapToRadarURL = v19;

    tapToRadarURL = self->_tapToRadarURL;
  }
  return tapToRadarURL;
}

- (void)post
{
  v9[2] = *MEMORY[0x263EF8340];
  if (PKIsInternalInstall())
  {
    v8[0] = @"NPKTapToRadarTitleUserNotificationKey";
    v8[1] = @"NPKTapToRadarBodyUserNotificationKey";
    body = self->_body;
    v9[0] = self->_title;
    v9[1] = body;
    id v4 = [NSDictionary dictionaryWithObjects:v9 forKeys:v8 count:2];
    if ([(NSSet *)self->_attachmentsPaths count])
    {
      uint64_t v5 = (void *)[v4 mutableCopy];
      v6 = [(NSSet *)self->_attachmentsPaths allObjects];
      [v5 setObject:v6 forKeyedSubscript:@"NPKTapToRadarAttachmentsPathsNotificationKey"];

      id v4 = v5;
    }
    int v7 = [MEMORY[0x263F087C8] defaultCenter];
    [v7 postNotificationName:@"com.apple.nanoPassKit.presentTapToRadarDistributedNotification" object:0 userInfo:v4];
  }
}

+ (void)postWithTitle:(id)a3 body:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  int v7 = [[NPKTapToRadarRequest alloc] initWithTitle:v6 body:v5];

  [(NPKTapToRadarRequest *)v7 post];
}

- (id)_attachmentURLs
{
  return (id)MEMORY[0x270F51D30](self, a2);
}

- (id)description
{
  return (id)[NSString stringWithFormat:@"<%@:%p> title:%@ body:%@", objc_opt_class(), self, self->_title, self->_body];
}

- (NSString)title
{
  return self->_title;
}

- (NSString)body
{
  return self->_body;
}

- (NSSet)attachmentsPaths
{
  return self->_attachmentsPaths;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_attachmentsPaths, 0);
  objc_storeStrong((id *)&self->_body, 0);
  objc_storeStrong((id *)&self->_title, 0);
  objc_storeStrong((id *)&self->_tapToRadarURL, 0);
}

@end