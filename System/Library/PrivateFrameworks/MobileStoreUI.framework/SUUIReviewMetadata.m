@interface SUUIReviewMetadata
- (NSString)body;
- (NSString)nickname;
- (NSString)title;
- (NSURL)submitURL;
- (SUUIReviewMetadata)initWithReviewDictionary:(id)a3;
- (float)rating;
- (id)copyWithZone:(_NSZone *)a3;
- (unint64_t)bodyMaxLength;
- (unint64_t)nicknameMaxLength;
- (unint64_t)titleMaxLength;
- (void)setBody:(id)a3;
- (void)setNickname:(id)a3;
- (void)setRating:(float)a3;
- (void)setTitle:(id)a3;
@end

@implementation SUUIReviewMetadata

- (SUUIReviewMetadata)initWithReviewDictionary:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {

    v5 = 0;
    goto LABEL_32;
  }
  v31.receiver = self;
  v31.super_class = (Class)SUUIReviewMetadata;
  v5 = [(SUUIReviewMetadata *)&v31 init];
  if (v5)
  {
    v6 = [v4 objectForKey:@"metadata"];
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
LABEL_21:
      v18 = [v4 objectForKey:@"review-info"];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        v19 = [v18 objectForKey:@"body"];
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          uint64_t v20 = [v19 copy];
          body = v5->_body;
          v5->_body = (NSString *)v20;
        }
        v22 = [v18 objectForKey:@"nickname"];

        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          uint64_t v23 = [v22 copy];
          nickname = v5->_nickname;
          v5->_nickname = (NSString *)v23;
        }
        v25 = [v18 objectForKey:@"rating"];

        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          [v25 floatValue];
          v5->_rating = v26;
        }
        v27 = [v18 objectForKey:@"title"];

        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          uint64_t v28 = [v27 copy];
          title = v5->_title;
          v5->_title = (NSString *)v28;
        }
      }

      goto LABEL_32;
    }
    v7 = [v6 objectForKey:@"body-max-length"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      uint64_t v8 = [v7 unsignedIntegerValue];
      v5->_bodyMaxLength = v8;
      if (!v8) {
        goto LABEL_9;
      }
    }
    else if (!v5->_bodyMaxLength)
    {
LABEL_9:
      v5->_bodyMaxLength = 0x7FFFFFFFFFFFFFFFLL;
    }
    v9 = [v6 objectForKey:@"nickname-max-length"];

    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      uint64_t v10 = [v9 unsignedIntegerValue];
      uint64_t v11 = 0x7FFFFFFFFFFFFFFFLL;
      if (v10) {
        uint64_t v11 = v10;
      }
      v5->_nicknameMaxLength = v11;
    }
    v12 = [v6 objectForKey:@"save-user-review-url"];

    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      uint64_t v13 = [objc_alloc(NSURL) initWithString:v12];
      submitURL = v5->_submitURL;
      v5->_submitURL = (NSURL *)v13;
    }
    v15 = [v6 objectForKey:@"title-max-length"];

    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      uint64_t v16 = [v15 unsignedIntegerValue];
      uint64_t v17 = 0x7FFFFFFFFFFFFFFFLL;
      if (v16) {
        uint64_t v17 = v16;
      }
      v5->_titleMaxLength = v17;
    }

    goto LABEL_21;
  }
LABEL_32:

  return v5;
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  uint64_t v6 = [(NSString *)self->_body copyWithZone:a3];
  v7 = *(void **)(v5 + 8);
  *(void *)(v5 + 8) = v6;

  *(void *)(v5 + 16) = self->_bodyMaxLength;
  uint64_t v8 = [(NSString *)self->_nickname copyWithZone:a3];
  v9 = *(void **)(v5 + 24);
  *(void *)(v5 + 24) = v8;

  *(void *)(v5 + 32) = self->_nicknameMaxLength;
  *(float *)(v5 + 40) = self->_rating;
  uint64_t v10 = [(NSURL *)self->_submitURL copyWithZone:a3];
  uint64_t v11 = *(void **)(v5 + 48);
  *(void *)(v5 + 48) = v10;

  uint64_t v12 = [(NSString *)self->_title copyWithZone:a3];
  uint64_t v13 = *(void **)(v5 + 56);
  *(void *)(v5 + 56) = v12;

  *(void *)(v5 + 64) = self->_titleMaxLength;
  return (id)v5;
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

- (NSString)nickname
{
  return self->_nickname;
}

- (void)setNickname:(id)a3
{
}

- (unint64_t)nicknameMaxLength
{
  return self->_nicknameMaxLength;
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

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_title, 0);
  objc_storeStrong((id *)&self->_submitURL, 0);
  objc_storeStrong((id *)&self->_nickname, 0);
  objc_storeStrong((id *)&self->_body, 0);
}

@end