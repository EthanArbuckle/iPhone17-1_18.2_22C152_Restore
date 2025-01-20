@interface ISReview
+ (BOOL)supportsSecureCoding;
- (BOOL)hasSavedDraft;
- (BOOL)nicknameIsConfirmed;
- (BOOL)removeDraft;
- (BOOL)restoreFromDraft;
- (BOOL)saveAsDraft;
- (ISReview)init;
- (ISReview)initWithCoder:(id)a3;
- (NSString)body;
- (NSString)nickname;
- (NSString)title;
- (NSURL)infoURL;
- (NSURL)submitURL;
- (float)rating;
- (id)_draftFileName;
- (id)_draftsDirectoryPath;
- (id)copyWithZone:(_NSZone *)a3;
- (int64_t)assetType;
- (unint64_t)bodyMaxLength;
- (unint64_t)itemIdentifier;
- (unint64_t)nicknameMaxLength;
- (unint64_t)titleMaxLength;
- (void)dealloc;
- (void)encodeWithCoder:(id)a3;
- (void)loadFromDictionary:(id)a3;
- (void)mergeWithReview:(id)a3 preferLocalValues:(BOOL)a4;
- (void)setAssetType:(int64_t)a3;
- (void)setBody:(id)a3;
- (void)setBodyMaxLength:(unint64_t)a3;
- (void)setInfoURL:(id)a3;
- (void)setItemIdentifier:(unint64_t)a3;
- (void)setNickname:(id)a3;
- (void)setNicknameIsConfirmed:(BOOL)a3;
- (void)setNicknameMaxLength:(unint64_t)a3;
- (void)setRating:(float)a3;
- (void)setSubmitURL:(id)a3;
- (void)setTitle:(id)a3;
- (void)setTitleMaxLength:(unint64_t)a3;
@end

@implementation ISReview

- (ISReview)init
{
  __ISRecordSPIClassUsage(self);
  v4.receiver = self;
  v4.super_class = (Class)ISReview;
  return [(ISReview *)&v4 init];
}

- (ISReview)initWithCoder:(id)a3
{
  objc_super v4 = [(ISReview *)self init];
  if (v4)
  {
    v4->_assetType = [a3 decodeIntegerForKey:@"assetType"];
    v4->_body = (NSString *)(id)[a3 decodeObjectOfClass:objc_opt_class() forKey:@"body"];
    v4->_bodyMaxLength = objc_msgSend((id)objc_msgSend(a3, "decodeObjectOfClass:forKey:", objc_opt_class(), @"body-max-length"), "unsignedIntegerValue");
    v4->_infoURL = (NSURL *)(id)[a3 decodeObjectOfClass:objc_opt_class() forKey:@"infoURL"];
    v4->_itemIdentifier = objc_msgSend((id)objc_msgSend(a3, "decodeObjectOfClass:forKey:", objc_opt_class(), @"itemID"), "itemIdentifierValue");
    v4->_nickname = (NSString *)(id)[a3 decodeObjectOfClass:objc_opt_class() forKey:@"nickname"];
    v4->_nicknameIsConfirmed = [a3 decodeBoolForKey:@"nicknameConfirmed"];
    v4->_nicknameMaxLength = objc_msgSend((id)objc_msgSend(a3, "decodeObjectOfClass:forKey:", objc_opt_class(), @"nickname-max-length"), "unsignedIntegerValue");
    [a3 decodeFloatForKey:@"rating"];
    v4->_rating = v5;
    v4->_submitURL = (NSURL *)(id)[a3 decodeObjectOfClass:objc_opt_class() forKey:@"save-user-review-url"];
    v4->_title = (NSString *)(id)[a3 decodeObjectOfClass:objc_opt_class() forKey:@"title"];
    v4->_titleMaxLength = objc_msgSend((id)objc_msgSend(a3, "decodeObjectOfClass:forKey:", objc_opt_class(), @"title-max-length"), "unsignedIntegerValue");
  }
  return v4;
}

- (void)dealloc
{
  self->_body = 0;
  self->_infoURL = 0;

  self->_nickname = 0;
  self->_submitURL = 0;

  self->_title = 0;
  v3.receiver = self;
  v3.super_class = (Class)ISReview;
  [(ISReview *)&v3 dealloc];
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  *(void *)(v5 + 8) = self->_assetType;
  *(void *)(v5 + 16) = [(NSString *)self->_body copyWithZone:a3];
  *(void *)(v5 + 24) = self->_bodyMaxLength;
  *(void *)(v5 + 32) = [(NSURL *)self->_infoURL copyWithZone:a3];
  *(void *)(v5 + 40) = self->_itemIdentifier;
  *(void *)(v5 + 48) = [(NSString *)self->_nickname copyWithZone:a3];
  *(unsigned char *)(v5 + 56) = self->_nicknameIsConfirmed;
  *(void *)(v5 + 64) = self->_nicknameMaxLength;
  *(float *)(v5 + 72) = self->_rating;
  *(void *)(v5 + 80) = [(NSURL *)self->_submitURL copyWithZone:a3];
  *(void *)(v5 + 88) = [(NSString *)self->_title copyWithZone:a3];
  *(void *)(v5 + 96) = self->_titleMaxLength;
  return (id)v5;
}

- (void)encodeWithCoder:(id)a3
{
  [a3 encodeInteger:self->_assetType forKey:@"assetType"];
  [a3 encodeObject:self->_body forKey:@"body"];
  objc_msgSend(a3, "encodeObject:forKey:", objc_msgSend(NSNumber, "numberWithUnsignedInteger:", self->_bodyMaxLength), @"body-max-length");
  [a3 encodeObject:self->_infoURL forKey:@"infoURL"];
  objc_msgSend(a3, "encodeObject:forKey:", objc_msgSend(NSNumber, "numberWithItemIdentifier:", self->_itemIdentifier), @"itemID");
  [a3 encodeObject:self->_nickname forKey:@"nickname"];
  [a3 encodeBool:self->_nicknameIsConfirmed forKey:@"nicknameConfirmed"];
  objc_msgSend(a3, "encodeObject:forKey:", objc_msgSend(NSNumber, "numberWithUnsignedInteger:", self->_nicknameMaxLength), @"nickname-max-length");
  *(float *)&double v5 = self->_rating;
  [a3 encodeFloat:@"rating" forKey:v5];
  [a3 encodeObject:self->_submitURL forKey:@"save-user-review-url"];
  [a3 encodeObject:self->_title forKey:@"title"];
  uint64_t v6 = [NSNumber numberWithUnsignedInteger:self->_titleMaxLength];

  [a3 encodeObject:v6 forKey:@"title-max-length"];
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (BOOL)hasSavedDraft
{
  uint64_t v2 = objc_msgSend(-[ISReview _draftsDirectoryPath](self, "_draftsDirectoryPath"), "stringByAppendingPathComponent:", -[ISReview _draftFileName](self, "_draftFileName"));
  if (v2)
  {
    uint64_t v3 = v2;
    objc_super v4 = (void *)[MEMORY[0x263F08850] defaultManager];
    LOBYTE(v2) = [v4 fileExistsAtPath:v3];
  }
  return v2;
}

- (void)loadFromDictionary:(id)a3
{
  double v5 = (void *)[a3 objectForKey:@"metadata"];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v6 = (void *)[v5 objectForKey:@"body-max-length"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      uint64_t v7 = [v6 unsignedIntegerValue];
      unint64_t v8 = 0x7FFFFFFFFFFFFFFFLL;
      if (v7) {
        unint64_t v8 = v7;
      }
      self->_bodyMaxLength = v8;
    }
    v9 = (void *)[v5 objectForKey:@"nickname-max-length"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      uint64_t v10 = [v9 unsignedIntegerValue];
      unint64_t v11 = 0x7FFFFFFFFFFFFFFFLL;
      if (v10) {
        unint64_t v11 = v10;
      }
      self->_nicknameMaxLength = v11;
    }
    uint64_t v12 = [v5 objectForKey:@"save-user-review-url"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {

      self->_submitURL = (NSURL *)[objc_alloc(NSURL) initWithString:v12];
    }
    v13 = (void *)[v5 objectForKey:@"title-max-length"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      uint64_t v14 = [v13 unsignedIntegerValue];
      unint64_t v15 = 0x7FFFFFFFFFFFFFFFLL;
      if (v14) {
        unint64_t v15 = v14;
      }
      self->_titleMaxLength = v15;
    }
  }
  v16 = (void *)[a3 objectForKey:@"review-info"];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v17 = (void *)[v16 objectForKey:@"body"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      if ([v17 length]) {
        v18 = v17;
      }
      else {
        v18 = 0;
      }
      [(ISReview *)self setBody:v18];
    }
    v19 = (void *)[v16 objectForKey:@"nickname"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      -[ISReview setNicknameIsConfirmed:](self, "setNicknameIsConfirmed:", [v19 length] != 0);
      if ([v19 length]) {
        v20 = v19;
      }
      else {
        v20 = 0;
      }
      [(ISReview *)self setNickname:v20];
    }
    v21 = (void *)[v16 objectForKey:@"rating"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      [v21 floatValue];
      -[ISReview setRating:](self, "setRating:");
    }
    v22 = (void *)[v16 objectForKey:@"title"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      if ([v22 length]) {
        v23 = v22;
      }
      else {
        v23 = 0;
      }
      [(ISReview *)self setTitle:v23];
    }
  }
}

- (void)mergeWithReview:(id)a3 preferLocalValues:(BOOL)a4
{
  BOOL v4 = a4;
  if (a4)
  {
    if (![(NSString *)self->_body length]) {
      -[ISReview setBody:](self, "setBody:", [a3 body]);
    }
    if (self->_bodyMaxLength)
    {
LABEL_8:
      if (!self->_infoURL) {
        -[ISReview setInfoURL:](self, "setInfoURL:", [a3 infoURL]);
      }
      if (self->_itemIdentifier) {
        goto LABEL_14;
      }
      goto LABEL_13;
    }
  }
  else
  {
    -[ISReview setBody:](self, "setBody:", [a3 body]);
  }
  -[ISReview setBodyMaxLength:](self, "setBodyMaxLength:", [a3 bodyMaxLength]);
  if (v4) {
    goto LABEL_8;
  }
  -[ISReview setInfoURL:](self, "setInfoURL:", [a3 infoURL]);
LABEL_13:
  -[ISReview setItemIdentifier:](self, "setItemIdentifier:", [a3 itemIdentifier]);
  if (!v4)
  {
    -[ISReview setNicknameIsConfirmed:](self, "setNicknameIsConfirmed:", [a3 nicknameIsConfirmed]);
    -[ISReview setNickname:](self, "setNickname:", [a3 nickname]);
    goto LABEL_19;
  }
LABEL_14:
  if (![(NSString *)self->_nickname length])
  {
    -[ISReview setNicknameIsConfirmed:](self, "setNicknameIsConfirmed:", [a3 nicknameIsConfirmed]);
    -[ISReview setNickname:](self, "setNickname:", [a3 nickname]);
  }
  if (self->_nicknameMaxLength)
  {
LABEL_20:
    if (self->_rating < 0.00000011921)
    {
      [a3 rating];
      -[ISReview setRating:](self, "setRating:");
    }
    if (self->_submitURL) {
      goto LABEL_26;
    }
    goto LABEL_25;
  }
LABEL_19:
  -[ISReview setNicknameMaxLength:](self, "setNicknameMaxLength:", [a3 nicknameMaxLength]);
  if (v4) {
    goto LABEL_20;
  }
  [a3 rating];
  -[ISReview setRating:](self, "setRating:");
LABEL_25:
  -[ISReview setSubmitURL:](self, "setSubmitURL:", [a3 submitURL]);
  if (!v4)
  {
    -[ISReview setTitle:](self, "setTitle:", [a3 title]);
LABEL_31:
    uint64_t v7 = [a3 titleMaxLength];
    [(ISReview *)self setTitleMaxLength:v7];
    return;
  }
LABEL_26:
  if (![(NSString *)self->_title length]) {
    -[ISReview setTitle:](self, "setTitle:", [a3 title]);
  }
  if (!self->_titleMaxLength) {
    goto LABEL_31;
  }
}

- (BOOL)removeDraft
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  uint64_t v3 = (void *)[MEMORY[0x263F08850] defaultManager];
  uint64_t v4 = objc_msgSend(-[ISReview _draftsDirectoryPath](self, "_draftsDirectoryPath"), "stringByAppendingPathComponent:", -[ISReview _draftFileName](self, "_draftFileName"));
  if (!v4) {
    return 1;
  }
  uint64_t v5 = v4;
  if (![v3 fileExistsAtPath:v4]) {
    return 1;
  }
  uint64_t v15 = 0;
  char v6 = [v3 removeItemAtPath:v5 error:&v15];
  if ((v6 & 1) == 0)
  {
    uint64_t v7 = (void *)[MEMORY[0x263F7B1F8] sharediTunesStoreConfig];
    if (!v7) {
      uint64_t v7 = (void *)[MEMORY[0x263F7B1F8] sharedConfig];
    }
    int v8 = [v7 shouldLog];
    if ([v7 shouldLogToDisk]) {
      int v9 = v8 | 2;
    }
    else {
      int v9 = v8;
    }
    if (!os_log_type_enabled((os_log_t)[v7 OSLogObject], OS_LOG_TYPE_ERROR)) {
      v9 &= 2u;
    }
    if (v9)
    {
      uint64_t v10 = objc_opt_class();
      int v16 = 138412546;
      uint64_t v17 = v10;
      __int16 v18 = 2112;
      uint64_t v19 = v15;
      LODWORD(v14) = 22;
      uint64_t v11 = _os_log_send_and_compose_impl();
      if (v11)
      {
        uint64_t v12 = (void *)v11;
        objc_msgSend(NSString, "stringWithCString:encoding:", v11, 4, &v16, v14);
        free(v12);
        SSFileLog();
      }
    }
  }
  return v6;
}

- (BOOL)restoreFromDraft
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  uint64_t v3 = (void *)[MEMORY[0x263F08850] defaultManager];
  uint64_t v4 = objc_msgSend(-[ISReview _draftsDirectoryPath](self, "_draftsDirectoryPath"), "stringByAppendingPathComponent:", -[ISReview _draftFileName](self, "_draftFileName"));
  if (!v4) {
    goto LABEL_6;
  }
  uint64_t v5 = v4;
  if (![v3 fileExistsAtPath:v4]) {
    goto LABEL_6;
  }
  uint64_t v17 = 0;
  uint64_t v6 = [MEMORY[0x263EFF8F8] dataWithContentsOfFile:v5];
  if (v6)
  {
    uint64_t v7 = (void *)[MEMORY[0x263F08928] unarchivedObjectOfClass:objc_opt_class() fromData:v6 error:&v17];
    if (v7)
    {
      int v8 = v7;
      [v7 setSubmitURL:0];
      [(ISReview *)self mergeWithReview:v8 preferLocalValues:0];
LABEL_6:
      LOBYTE(v9) = 1;
      return v9;
    }
  }
  uint64_t v10 = (void *)[MEMORY[0x263F7B1F8] sharediTunesStoreConfig];
  if (!v10) {
    uint64_t v10 = (void *)[MEMORY[0x263F7B1F8] sharedConfig];
  }
  int v11 = [v10 shouldLog];
  if ([v10 shouldLogToDisk]) {
    int v12 = v11 | 2;
  }
  else {
    int v12 = v11;
  }
  if (!os_log_type_enabled((os_log_t)[v10 OSLogObject], OS_LOG_TYPE_DEFAULT)) {
    v12 &= 2u;
  }
  if (v12)
  {
    uint64_t v13 = objc_opt_class();
    int v18 = 138412546;
    uint64_t v19 = v13;
    __int16 v20 = 2114;
    uint64_t v21 = v17;
    LODWORD(v16) = 22;
    uint64_t v9 = _os_log_send_and_compose_impl();
    if (!v9) {
      return v9;
    }
    uint64_t v14 = (void *)v9;
    objc_msgSend(NSString, "stringWithCString:encoding:", v9, 4, &v18, v16);
    free(v14);
    SSFileLog();
  }
  LOBYTE(v9) = 0;
  return v9;
}

- (BOOL)saveAsDraft
{
  uint64_t v27 = *MEMORY[0x263EF8340];
  id v3 = [(ISReview *)self _draftsDirectoryPath];
  if (!v3 || ([MEMORY[0x263F08850] ensureDirectoryExists:v3] & 1) == 0)
  {
    uint64_t v15 = (void *)[MEMORY[0x263F7B1F8] sharediTunesStoreConfig];
    if (!v15) {
      uint64_t v15 = (void *)[MEMORY[0x263F7B1F8] sharedConfig];
    }
    int v16 = [v15 shouldLog];
    if ([v15 shouldLogToDisk]) {
      int v17 = v16 | 2;
    }
    else {
      int v17 = v16;
    }
    if (!os_log_type_enabled((os_log_t)[v15 OSLogObject], OS_LOG_TYPE_ERROR)) {
      v17 &= 2u;
    }
    if (!v17) {
      return 0;
    }
    int v23 = 138412546;
    uint64_t v24 = objc_opt_class();
    __int16 v25 = 2112;
    id v26 = v3;
    LODWORD(v21) = 22;
    uint64_t v18 = _os_log_send_and_compose_impl();
    if (!v18) {
      return 0;
    }
    uint64_t v19 = (void *)v18;
    objc_msgSend(NSString, "stringWithCString:encoding:", v18, 4, &v23, v21);
    free(v19);
    goto LABEL_29;
  }
  uint64_t v22 = 0;
  uint64_t v4 = [MEMORY[0x263F08910] archivedDataWithRootObject:self requiringSecureCoding:1 error:&v22];
  if (v4) {
    BOOL v5 = v22 == 0;
  }
  else {
    BOOL v5 = 0;
  }
  if (!v5
    || (uint64_t v6 = (void *)v4,
        uint64_t v7 = objc_msgSend(v3, "stringByAppendingPathComponent:", -[ISReview _draftFileName](self, "_draftFileName")),
        BOOL v8 = 1,
        ([v6 writeToFile:v7 options:1 error:&v22] & 1) == 0))
  {
    uint64_t v9 = (void *)[MEMORY[0x263F7B1F8] sharediTunesStoreConfig];
    if (!v9) {
      uint64_t v9 = (void *)[MEMORY[0x263F7B1F8] sharedConfig];
    }
    int v10 = [v9 shouldLog];
    if ([v9 shouldLogToDisk]) {
      int v11 = v10 | 2;
    }
    else {
      int v11 = v10;
    }
    if (!os_log_type_enabled((os_log_t)[v9 OSLogObject], OS_LOG_TYPE_ERROR)) {
      v11 &= 2u;
    }
    if (!v11) {
      return 0;
    }
    uint64_t v12 = objc_opt_class();
    int v23 = 138543618;
    uint64_t v24 = v12;
    __int16 v25 = 2114;
    id v26 = v22;
    LODWORD(v21) = 22;
    uint64_t v13 = _os_log_send_and_compose_impl();
    if (!v13) {
      return 0;
    }
    uint64_t v14 = (void *)v13;
    objc_msgSend(NSString, "stringWithCString:encoding:", v13, 4, &v23, v21);
    free(v14);
LABEL_29:
    SSFileLog();
    return 0;
  }
  return v8;
}

- (id)_draftFileName
{
  return (id)objc_msgSend(NSString, "stringWithFormat:", @"%llu.review", self->_itemIdentifier);
}

- (id)_draftsDirectoryPath
{
  uint64_t v2 = objc_msgSend(-[NSArray lastObject](NSSearchPathForDirectoriesInDomains(NSLibraryDirectory, 1uLL, 1), "lastObject"), "stringByAppendingPathComponent:", @"com.apple.iTunesStore");

  return (id)[v2 stringByAppendingPathComponent:@"Reviews"];
}

- (int64_t)assetType
{
  return self->_assetType;
}

- (void)setAssetType:(int64_t)a3
{
  self->_assetType = a3;
}

- (NSString)body
{
  return self->_body;
}

- (void)setBody:(id)a3
{
}

- (unint64_t)bodyMaxLength
{
  return self->_bodyMaxLength;
}

- (void)setBodyMaxLength:(unint64_t)a3
{
  self->_bodyMaxLength = a3;
}

- (NSURL)infoURL
{
  return self->_infoURL;
}

- (void)setInfoURL:(id)a3
{
}

- (unint64_t)itemIdentifier
{
  return self->_itemIdentifier;
}

- (void)setItemIdentifier:(unint64_t)a3
{
  self->_itemIdentifier = a3;
}

- (NSString)nickname
{
  return self->_nickname;
}

- (void)setNickname:(id)a3
{
}

- (BOOL)nicknameIsConfirmed
{
  return self->_nicknameIsConfirmed;
}

- (void)setNicknameIsConfirmed:(BOOL)a3
{
  self->_nicknameIsConfirmed = a3;
}

- (unint64_t)nicknameMaxLength
{
  return self->_nicknameMaxLength;
}

- (void)setNicknameMaxLength:(unint64_t)a3
{
  self->_nicknameMaxLength = a3;
}

- (float)rating
{
  return self->_rating;
}

- (void)setRating:(float)a3
{
  self->_rating = a3;
}

- (NSURL)submitURL
{
  return self->_submitURL;
}

- (void)setSubmitURL:(id)a3
{
}

- (NSString)title
{
  return self->_title;
}

- (void)setTitle:(id)a3
{
}

- (unint64_t)titleMaxLength
{
  return self->_titleMaxLength;
}

- (void)setTitleMaxLength:(unint64_t)a3
{
  self->_titleMaxLength = a3;
}

@end