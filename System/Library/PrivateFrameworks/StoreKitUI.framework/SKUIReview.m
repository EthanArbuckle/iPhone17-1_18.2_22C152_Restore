@interface SKUIReview
- (NSMutableDictionary)cacheRepresentation;
- (NSString)body;
- (NSString)dateString;
- (NSString)reviewer;
- (NSString)title;
- (SKUIReview)initWithCacheRepresentation:(id)a3;
- (SKUIReview)initWithReviewDictionary:(id)a3;
- (float)rating;
- (id)formattedBylineWithClientContext:(id)a3;
@end

@implementation SKUIReview

- (SKUIReview)initWithReviewDictionary:(id)a3
{
  id v4 = a3;
  if (os_variant_has_internal_content()
    && _os_feature_enabled_impl()
    && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT))
  {
    -[SKUIReview initWithReviewDictionary:]();
  }
  v21.receiver = self;
  v21.super_class = (Class)SKUIReview;
  v5 = [(SKUIReview *)&v21 init];
  if (v5)
  {
    v6 = [v4 objectForKey:@"review_body"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      uint64_t v7 = [v6 stringByReplacingOccurrencesOfString:@"<br/>" withString:@"\n"];
      body = v5->_body;
      v5->_body = (NSString *)v7;
    }
    v9 = [v4 objectForKey:@"review_date"];

    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      uint64_t v10 = [v9 copy];
      dateString = v5->_dateString;
      v5->_dateString = (NSString *)v10;
    }
    v12 = [v4 objectForKey:@"review_star_count"];

    if (objc_opt_respondsToSelector())
    {
      [v12 floatValue];
      v5->_rating = v13;
    }
    v14 = [v4 objectForKey:@"review_name"];

    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      uint64_t v15 = [v14 copy];
      reviewer = v5->_reviewer;
      v5->_reviewer = (NSString *)v15;
    }
    v17 = [v4 objectForKey:@"review_title"];

    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      uint64_t v18 = [v17 copy];
      title = v5->_title;
      v5->_title = (NSString *)v18;
    }
  }

  return v5;
}

- (id)formattedBylineWithClientContext:(id)a3
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (!self->_dateString) {
    goto LABEL_28;
  }
  id v5 = objc_alloc_init(MEMORY[0x1E4F28C10]);
  char v6 = 1;
  [v5 setLenient:1];
  uint64_t v7 = [MEMORY[0x1E4F1CAF0] timeZoneForSecondsFromGMT:0];
  [v5 setTimeZone:v7];

  uint64_t v8 = 0;
  long long v19 = xmmword_1E6427CB0;
  do
  {
    char v9 = v6;
    [v5 setDateFormat:*((void *)&v19 + v8)];
    uint64_t v10 = [v5 dateFromString:self->_dateString];
    v11 = (void *)v10;
    if (v10) {
      break;
    }
    char v6 = 0;
    uint64_t v8 = 1;
  }
  while ((v9 & 1) != 0);
  if (v10)
  {
    id v12 = objc_alloc_init(MEMORY[0x1E4F28C10]);
    [v12 setDateStyle:2];
    [v12 setTimeStyle:0];
    id v13 = [v12 stringFromDate:v11];
  }
  else
  {
    id v13 = 0;
  }

  for (uint64_t i = 8; i != -8; i -= 8)
  if (v13)
  {
    if (self->_reviewer)
    {
      if (v4) {
        [v4 localizedStringForKey:@"REVIEW_BYLINE_WITH_DATE" inTable:@"ProductPage"];
      }
      else {
      v17 = +[SKUIClientContext localizedStringForKey:@"REVIEW_BYLINE_WITH_DATE" inBundles:0 inTable:@"ProductPage"];
      }
      uint64_t v15 = [NSString stringWithValidatedFormat:v17, @"%@%@", 0, self->_reviewer, v13, v19 validFormatSpecifiers error];
    }
    else
    {
      id v13 = v13;
      uint64_t v15 = v13;
    }
  }
  else
  {
LABEL_28:
    if (self->_reviewer)
    {
      if (v4) {
        [v4 localizedStringForKey:@"REVIEW_BYLINE_NO_DATE" inTable:@"ProductPage"];
      }
      else {
      v16 = +[SKUIClientContext localizedStringForKey:@"REVIEW_BYLINE_NO_DATE" inBundles:0 inTable:@"ProductPage"];
      }
      uint64_t v15 = [NSString stringWithValidatedFormat:v16, @"%@", 0, self->_reviewer validFormatSpecifiers error];

      id v13 = 0;
    }
    else
    {
      id v13 = 0;
      uint64_t v15 = 0;
    }
  }

  return v15;
}

- (SKUIReview)initWithCacheRepresentation:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v21.receiver = self;
    v21.super_class = (Class)SKUIReview;
    id v5 = [(SKUIReview *)&v21 init];
    if (v5)
    {
      char v6 = [v4 objectForKey:@"review_body"];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        uint64_t v7 = [v6 copy];
        body = v5->_body;
        v5->_body = (NSString *)v7;
      }
      char v9 = [v4 objectForKey:@"review_date"];

      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        uint64_t v10 = [v9 copy];
        dateString = v5->_dateString;
        v5->_dateString = (NSString *)v10;
      }
      id v12 = [v4 objectForKey:@"review_star_count"];

      if (objc_opt_respondsToSelector())
      {
        [v12 floatValue];
        v5->_rating = v13;
      }
      v14 = [v4 objectForKey:@"review_name"];

      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        uint64_t v15 = [v14 copy];
        reviewer = v5->_reviewer;
        v5->_reviewer = (NSString *)v15;
      }
      v17 = [v4 objectForKey:@"review_title"];

      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        uint64_t v18 = [v17 copy];
        title = v5->_title;
        v5->_title = (NSString *)v18;
      }
    }
  }
  else
  {

    id v5 = 0;
  }

  return v5;
}

- (NSMutableDictionary)cacheRepresentation
{
  v3 = [MEMORY[0x1E4F1CA60] dictionary];
  *(float *)&double v4 = self->_rating;
  id v5 = [NSNumber numberWithFloat:v4];
  [v3 setObject:v5 forKey:@"review_star_count"];

  body = self->_body;
  if (body) {
    [v3 setObject:body forKey:@"review_body"];
  }
  dateString = self->_dateString;
  if (dateString) {
    [v3 setObject:dateString forKey:@"review_date"];
  }
  reviewer = self->_reviewer;
  if (reviewer) {
    [v3 setObject:reviewer forKey:@"review_name"];
  }
  title = self->_title;
  if (title) {
    [v3 setObject:title forKey:@"review_title"];
  }

  return (NSMutableDictionary *)v3;
}

- (NSString)body
{
  return self->_body;
}

- (NSString)dateString
{
  return self->_dateString;
}

- (float)rating
{
  return self->_rating;
}

- (NSString)reviewer
{
  return self->_reviewer;
}

- (NSString)title
{
  return self->_title;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_title, 0);
  objc_storeStrong((id *)&self->_reviewer, 0);
  objc_storeStrong((id *)&self->_dateString, 0);

  objc_storeStrong((id *)&self->_body, 0);
}

- (void)initWithReviewDictionary:.cold.1()
{
  uint64_t v2 = *MEMORY[0x1E4F143B8];
  int v0 = 136446210;
  v1 = "-[SKUIReview initWithReviewDictionary:]";
}

@end