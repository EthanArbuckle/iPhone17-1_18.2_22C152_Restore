@interface WBSHistoryServiceURLCompletionMatchEntry
+ (BOOL)supportsSecureCoding;
- (NSString)title;
- (NSString)url;
- (WBSHistoryServiceURLCompletionMatchEntry)init;
- (WBSHistoryServiceURLCompletionMatchEntry)initWithCoder:(id)a3;
- (WBSHistoryServiceURLCompletionMatchEntry)initWithStreamData:(void *)a3;
- (WBSHistoryServiceURLCompletionMatchEntry)initWithURLString:(id)a3 title:(id)a4 topSitesScore:(float)a5 visitCountScore:(int64_t)a6;
- (_HistoryStreamedMatchEntry)streamData;
- (float)topSitesScore;
- (id).cxx_construct;
- (int64_t)visitCountScore;
- (void)encodeWithCoder:(id)a3;
@end

@implementation WBSHistoryServiceURLCompletionMatchEntry

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (WBSHistoryServiceURLCompletionMatchEntry)init
{
  return 0;
}

- (WBSHistoryServiceURLCompletionMatchEntry)initWithURLString:(id)a3 title:(id)a4 topSitesScore:(float)a5 visitCountScore:(int64_t)a6
{
  v11 = (__CFString *)a3;
  v12 = (__CFString *)a4;
  v22.receiver = self;
  v22.super_class = (Class)WBSHistoryServiceURLCompletionMatchEntry;
  v13 = [(WBSHistoryServiceURLCompletionMatchEntry *)&v22 init];
  if (v13)
  {
    uint64_t v14 = [(__CFString *)v11 lengthOfBytesUsingEncoding:4];
    uint64_t v15 = [(__CFString *)v12 lengthOfBytesUsingEncoding:4];
    size_t v16 = v14 + v15 + 42;
    v17 = (char *)operator new(v16);
    bzero(v17, v16);
    value = v13->_streamData.__ptr_.__value_;
    v13->_streamData.__ptr_.__value_ = (_HistoryStreamedMatchEntry *)v17;
    p_var0 = (float *)v17;
    if (value)
    {
      MEMORY[0x1AD0C4750](value, 0x1050C40224969E2);
      p_var0 = (float *)&v13->_streamData.__ptr_.__value_->var0;
    }
    *(_DWORD *)p_var0 = 5;
    *((_DWORD *)p_var0 + 1) = v16;
    p_var0[6] = a5;
    *((void *)p_var0 + 4) = a6;
    if (v11)
    {
      CFStringGetCString(v11, v17 + 40, v14 + 1, 0x8000100u);
      v13->_streamData.__ptr_.__value_->var1 = v17 + 40;
    }
    if (v12)
    {
      CFStringGetCString(v12, &v17[v14 + 41], v15 + 1, 0x8000100u);
      v13->_streamData.__ptr_.__value_->var2 = &v17[v14 + 41];
    }
    objc_storeStrong((id *)&v13->_url, a3);
    objc_storeStrong((id *)&v13->_title, a4);
    v20 = v13;
  }

  return v13;
}

- (WBSHistoryServiceURLCompletionMatchEntry)initWithStreamData:(void *)a3
{
  v10.receiver = self;
  v10.super_class = (Class)WBSHistoryServiceURLCompletionMatchEntry;
  v4 = [(WBSHistoryServiceURLCompletionMatchEntry *)&v10 init];
  v5 = v4;
  if (v4)
  {
    v6 = *(_HistoryStreamedMatchEntry **)a3;
    *(void *)a3 = 0;
    value = v4->_streamData.__ptr_.__value_;
    v5->_streamData.__ptr_.__value_ = v6;
    if (value) {
      MEMORY[0x1AD0C4750](value, 0x1050C40224969E2);
    }
    v8 = v5;
  }

  return v5;
}

- (WBSHistoryServiceURLCompletionMatchEntry)initWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"url"];
  v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"title"];
  [v4 decodeDoubleForKey:@"topSitesScore"];
  double v8 = v7;
  uint64_t v9 = [v4 decodeIntegerForKey:@"visitCountScore"];
  *(float *)&double v10 = v8;
  v11 = [(WBSHistoryServiceURLCompletionMatchEntry *)self initWithURLString:v5 title:v6 topSitesScore:v9 visitCountScore:v10];

  return v11;
}

- (void)encodeWithCoder:(id)a3
{
  id v7 = a3;
  objc_msgSend(v7, "encodeInteger:forKey:", -[WBSHistoryServiceURLCompletionMatchEntry visitCountScore](self, "visitCountScore"), @"visitCountScore");
  [(WBSHistoryServiceURLCompletionMatchEntry *)self topSitesScore];
  [v7 encodeDouble:@"topSitesScore" forKey:v4];
  v5 = [(WBSHistoryServiceURLCompletionMatchEntry *)self url];
  [v7 encodeObject:v5 forKey:@"url"];

  v6 = [(WBSHistoryServiceURLCompletionMatchEntry *)self title];
  if (v6) {
    [v7 encodeObject:v6 forKey:@"title"];
  }
}

- (_HistoryStreamedMatchEntry)streamData
{
  return self->_streamData.__ptr_.__value_;
}

- (float)topSitesScore
{
  return self->_streamData.__ptr_.__value_->var3;
}

- (int64_t)visitCountScore
{
  return self->_streamData.__ptr_.__value_->var4;
}

- (NSString)url
{
  url = self->_url;
  if (!url)
  {
    float v4 = [NSString stringWithUTF8String:self->_streamData.__ptr_.__value_->var1];
    v5 = self->_url;
    self->_url = v4;

    url = self->_url;
  }
  return url;
}

- (NSString)title
{
  title = self->_title;
  if (!title)
  {
    if (self->_streamData.__ptr_.__value_->var2)
    {
      objc_msgSend(NSString, "stringWithUTF8String:");
      float v4 = (NSString *)objc_claimAutoreleasedReturnValue();
      v5 = self->_title;
      self->_title = v4;

      title = self->_title;
    }
    else
    {
      title = 0;
    }
  }
  return title;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_title, 0);
  objc_storeStrong((id *)&self->_url, 0);
  value = self->_streamData.__ptr_.__value_;
  self->_streamData.__ptr_.__value_ = 0;
  if (value)
  {
    JUMPOUT(0x1AD0C4750);
  }
}

- (id).cxx_construct
{
  *((void *)self + 1) = 0;
  return self;
}

@end