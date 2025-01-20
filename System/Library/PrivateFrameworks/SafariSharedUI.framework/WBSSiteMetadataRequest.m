@interface WBSSiteMetadataRequest
- (BOOL)isEqual:(id)a3;
- (NSDictionary)extraInfo;
- (NSURL)url;
- (OS_os_activity)activity;
- (WBSSiteMetadataRequest)init;
- (WBSSiteMetadataRequest)initWithURL:(id)a3 extraInfo:(id)a4;
- (id)description;
- (unint64_t)hash;
@end

@implementation WBSSiteMetadataRequest

- (OS_os_activity)activity
{
  return self->_activity;
}

- (NSURL)url
{
  return self->_url;
}

void __48__WBSSiteMetadataRequest_initWithURL_extraInfo___block_invoke(uint64_t a1)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  v2 = WBS_LOG_CHANNEL_PREFIXSiteMetadata();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    v3 = *(void **)(*(void *)(a1 + 32) + 16);
    v4 = v2;
    v5 = [v3 absoluteString];
    int v6 = 141558275;
    uint64_t v7 = 1752392040;
    __int16 v8 = 2117;
    v9 = v5;
    _os_log_impl(&dword_1ABB70000, v4, OS_LOG_TYPE_DEFAULT, "Beginning site metadata request for %{sensitive, mask.hash}@", (uint8_t *)&v6, 0x16u);
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_extraInfo, 0);
  objc_storeStrong((id *)&self->_url, 0);
  objc_storeStrong((id *)&self->_activity, 0);
}

- (WBSSiteMetadataRequest)initWithURL:(id)a3 extraInfo:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v21.receiver = self;
  v21.super_class = (Class)WBSSiteMetadataRequest;
  v9 = [(WBSSiteMetadataRequest *)&v21 init];
  uint64_t v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_url, a3);
    uint64_t v11 = [v8 copy];
    extraInfo = v10->_extraInfo;
    v10->_extraInfo = (NSDictionary *)v11;

    os_activity_t v13 = _os_activity_create(&dword_1ABB70000, "Site Metadata Request", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_DETACHED);
    activity = v10->_activity;
    v10->_activity = (OS_os_activity *)v13;

    v15 = v10->_activity;
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __48__WBSSiteMetadataRequest_initWithURL_extraInfo___block_invoke;
    block[3] = &unk_1E5E40968;
    v16 = v10;
    v20 = v16;
    os_activity_apply(v15, block);
    v17 = v16;
  }
  return v10;
}

- (WBSSiteMetadataRequest)init
{
  return [(WBSSiteMetadataRequest *)self initWithURL:0 extraInfo:0];
}

- (unint64_t)hash
{
  return [(NSURL *)self->_url hash];
}

- (BOOL)isEqual:(id)a3
{
  v4 = (WBSSiteMetadataRequest *)a3;
  if (v4 == self)
  {
    BOOL v10 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v5 = v4;
      url = self->_url;
      id v7 = [(WBSSiteMetadataRequest *)v5 url];
      id v8 = v7;
      if (url)
      {
        char v9 = [(NSURL *)url isEqual:v7];

        if ((v9 & 1) == 0) {
          goto LABEL_13;
        }
      }
      else
      {

        if (v8) {
          goto LABEL_13;
        }
      }
      extraInfo = self->_extraInfo;
      v12 = [(WBSSiteMetadataRequest *)v5 extraInfo];
      os_activity_t v13 = v12;
      if (extraInfo)
      {
        char v14 = [(NSDictionary *)extraInfo isEqual:v12];

        if (v14)
        {
LABEL_11:
          uint64_t v15 = objc_opt_class();
          BOOL v10 = v15 == objc_opt_class();
LABEL_14:

          goto LABEL_15;
        }
      }
      else
      {

        if (!v13) {
          goto LABEL_11;
        }
      }
LABEL_13:
      BOOL v10 = 0;
      goto LABEL_14;
    }
    BOOL v10 = 0;
  }
LABEL_15:

  return v10;
}

- (id)description
{
  return (id)[NSString stringWithFormat:@"<%@: %p, url: %@>", objc_opt_class(), self, self->_url];
}

- (NSDictionary)extraInfo
{
  return self->_extraInfo;
}

@end