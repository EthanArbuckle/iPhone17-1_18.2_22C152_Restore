@interface NDDownloadRequest
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (NDDownloadRequest)initWithCoder:(id)a3;
- (NDDownloadRequest)initWithContentID:(id)a3 options:(int64_t)a4;
- (NSString)articleID;
- (NSString)contentID;
- (NSString)issueID;
- (NSString)puzzleID;
- (id)description;
- (int64_t)contentType;
- (int64_t)options;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
@end

@implementation NDDownloadRequest

- (NDDownloadRequest)initWithContentID:(id)a3 options:(int64_t)a4
{
  id v6 = a3;
  v13.receiver = self;
  v13.super_class = (Class)NDDownloadRequest;
  v7 = [(NDDownloadRequest *)&v13 init];
  if (v7)
  {
    uint64_t v8 = [v6 copy];
    contentID = v7->_contentID;
    v7->_contentID = (NSString *)v8;

    v7->_options = a4;
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = __47__NDDownloadRequest_initWithContentID_options___block_invoke;
    v11[3] = &unk_1E6D3EAC0;
    id v12 = v6;
    v7->_contentType = __47__NDDownloadRequest_initWithContentID_options___block_invoke((uint64_t)v11);
  }
  return v7;
}

uint64_t __47__NDDownloadRequest_initWithContentID_options___block_invoke(uint64_t a1)
{
  v1 = (id *)(a1 + 32);
  if ([*(id *)(a1 + 32) hasPrefix:*MEMORY[0x1E4F7DC98]]) {
    return 0;
  }
  if ([*v1 hasPrefix:@"N"]) {
    return 1;
  }
  if ([*v1 hasPrefix:*MEMORY[0x1E4F7DE60]]) {
    return 2;
  }
  if (([*v1 hasPrefix:*MEMORY[0x1E4F7E0B0]] & 1) == 0)
  {
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
      __47__NDDownloadRequest_initWithContentID_options___block_invoke_cold_1(v1);
    }
    return 0;
  }
  return 3;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  v5 = FCDynamicCast();

  if (v5)
  {
    id v6 = [(NDDownloadRequest *)self contentID];
    v7 = [v5 contentID];
    if ([v6 isEqualToString:v7])
    {
      int64_t v8 = [(NDDownloadRequest *)self options];
      BOOL v9 = v8 == [v5 options];
    }
    else
    {
      BOOL v9 = 0;
    }
  }
  else
  {
    BOOL v9 = 0;
  }

  return v9;
}

- (unint64_t)hash
{
  v3 = [(NDDownloadRequest *)self contentID];
  uint64_t v4 = [v3 hash];
  v5 = objc_msgSend(NSNumber, "numberWithInteger:", -[NDDownloadRequest options](self, "options"));
  unint64_t v6 = [v5 hash] ^ v4;

  return v6;
}

- (id)description
{
  v3 = (void *)[objc_alloc(MEMORY[0x1E4F7E390]) initWithObject:self];
  unint64_t v4 = [(NDDownloadRequest *)self contentType] - 1;
  if (v4 > 2) {
    v5 = @"Article";
  }
  else {
    v5 = off_1E6D3EB08[v4];
  }
  [v3 addField:@"type" object:v5];
  unint64_t v6 = [(NDDownloadRequest *)self contentID];
  [v3 addField:@"id" object:v6];

  v7 = objc_msgSend(NSNumber, "numberWithInteger:", -[NDDownloadRequest options](self, "options"));
  [v3 addField:@"options" object:v7];

  int64_t v8 = [v3 descriptionString];

  return v8;
}

__CFString *__32__NDDownloadRequest_description__block_invoke(uint64_t a1)
{
  uint64_t v1 = [*(id *)(a1 + 32) contentType];
  if ((unint64_t)(v1 - 1) > 2) {
    return @"Article";
  }
  else {
    return off_1E6D3EB08[v1 - 1];
  }
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (NDDownloadRequest)initWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"contentID"];
  uint64_t v6 = [v4 decodeIntegerForKey:@"options"];

  v7 = [(NDDownloadRequest *)self initWithContentID:v5 options:v6];
  return v7;
}

- (void)encodeWithCoder:(id)a3
{
  id v5 = a3;
  id v4 = [(NDDownloadRequest *)self contentID];
  [v5 encodeObject:v4 forKey:@"contentID"];

  objc_msgSend(v5, "encodeInteger:forKey:", -[NDDownloadRequest options](self, "options"), @"options");
}

- (NSString)articleID
{
  int64_t v3 = [(NDDownloadRequest *)self contentType];
  if (v3 == 1)
  {
    id v5 = [(NDDownloadRequest *)self contentID];
    id v4 = NDArticleIDFromAudioContentID(v5);
  }
  else if (v3)
  {
    id v4 = 0;
  }
  else
  {
    id v4 = [(NDDownloadRequest *)self contentID];
  }

  return (NSString *)v4;
}

- (NSString)issueID
{
  if ([(NDDownloadRequest *)self contentType] == 2)
  {
    int64_t v3 = [(NDDownloadRequest *)self contentID];
  }
  else
  {
    int64_t v3 = 0;
  }

  return (NSString *)v3;
}

- (NSString)puzzleID
{
  if ([(NDDownloadRequest *)self contentType] == 3)
  {
    int64_t v3 = [(NDDownloadRequest *)self contentID];
  }
  else
  {
    int64_t v3 = 0;
  }

  return (NSString *)v3;
}

- (NSString)contentID
{
  return self->_contentID;
}

- (int64_t)contentType
{
  return self->_contentType;
}

- (int64_t)options
{
  return self->_options;
}

- (void).cxx_destruct
{
}

void __47__NDDownloadRequest_initWithContentID_options___block_invoke_cold_1(void *a1)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  uint64_t v1 = (void *)[[NSString alloc] initWithFormat:@"unknown content type for identifier: %@", *a1];
  *(_DWORD *)buf = 136315906;
  int64_t v3 = "-[NDDownloadRequest initWithContentID:options:]_block_invoke";
  __int16 v4 = 2080;
  id v5 = "NDDownloadRequest.m";
  __int16 v6 = 1024;
  int v7 = 45;
  __int16 v8 = 2114;
  BOOL v9 = v1;
  _os_log_error_impl(&dword_1E00ED000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);
}

@end