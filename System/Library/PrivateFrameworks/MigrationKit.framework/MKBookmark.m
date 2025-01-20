@interface MKBookmark
- (MKBookmark)initWithData:(id)a3;
- (NSDictionary)data;
- (NSString)ID;
- (NSString)title;
- (NSString)url;
- (void)setData:(id)a3;
- (void)setID:(id)a3;
- (void)setTitle:(id)a3;
- (void)setUrl:(id)a3;
@end

@implementation MKBookmark

- (MKBookmark)initWithData:(id)a3
{
  v26[4] = *MEMORY[0x263EF8340];
  id v4 = a3;
  v22.receiver = self;
  v22.super_class = (Class)MKBookmark;
  v5 = [(MKBookmark *)&v22 init];
  if (v5)
  {
    id v21 = 0;
    v6 = [MEMORY[0x263F08900] JSONObjectWithData:v4 options:0 error:&v21];
    id v7 = v21;
    if (v7)
    {
      v8 = +[MKLog log];
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
        -[MKBookmark initWithData:]((uint64_t)v7, v8);
      }
LABEL_14:

      v19 = 0;
      goto LABEL_15;
    }
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      v8 = +[MKLog log];
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
        -[MKBookmark initWithData:](v8);
      }
      goto LABEL_14;
    }
    id v9 = v6;
    v10 = [v9 objectForKey:@"id"];
    [(MKBookmark *)v5 setID:v10];

    v11 = [v9 objectForKey:@"title"];
    [(MKBookmark *)v5 setTitle:v11];

    v12 = [v9 objectForKey:@"url"];
    [(MKBookmark *)v5 setUrl:v12];

    if (!v5->_title) {
      [(MKBookmark *)v5 setTitle:v5->_url];
    }
    if (v5->_url)
    {
      v26[0] = @"WebBookmarkTypeLeaf";
      v25[0] = @"WebBookmarkType";
      v25[1] = @"WebBookmarkUUID";
      v13 = [MEMORY[0x263F08C38] UUID];
      v14 = [v13 UUIDString];
      v26[1] = v14;
      v25[2] = @"URIDictionary";
      title = v5->_title;
      v23 = @"title";
      v24 = title;
      v16 = [NSDictionary dictionaryWithObjects:&v24 forKeys:&v23 count:1];
      v25[3] = @"URLString";
      url = v5->_url;
      v26[2] = v16;
      v26[3] = url;
      v18 = [NSDictionary dictionaryWithObjects:v26 forKeys:v25 count:4];
      [(MKBookmark *)v5 setData:v18];
    }
  }
  v19 = v5;
LABEL_15:

  return v19;
}

- (NSString)ID
{
  return self->_ID;
}

- (void)setID:(id)a3
{
}

- (NSString)title
{
  return self->_title;
}

- (void)setTitle:(id)a3
{
}

- (NSString)url
{
  return self->_url;
}

- (void)setUrl:(id)a3
{
}

- (NSDictionary)data
{
  return self->_data;
}

- (void)setData:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_data, 0);
  objc_storeStrong((id *)&self->_url, 0);
  objc_storeStrong((id *)&self->_title, 0);
  objc_storeStrong((id *)&self->_ID, 0);
}

- (void)initWithData:(os_log_t)log .cold.1(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_22BFAC000, log, OS_LOG_TYPE_ERROR, "MKBookmark could not initialize because an invalid json format was received.", v1, 2u);
}

- (void)initWithData:(uint64_t)a1 .cold.2(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_22BFAC000, a2, OS_LOG_TYPE_ERROR, "MKBookmark could not initialize because an underlying error occurred unexpectedly. error=%@", (uint8_t *)&v2, 0xCu);
}

@end