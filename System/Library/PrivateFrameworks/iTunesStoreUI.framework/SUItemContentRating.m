@interface SUItemContentRating
+ (int64_t)ratingSystemFromString:(id)a3;
- (BOOL)_isRatingSystemForApps:(int64_t)a3;
- (BOOL)_isRatingSystemForMovies:(int64_t)a3;
- (BOOL)_isRatingSystemForMusic:(int64_t)a3;
- (BOOL)_isRatingSystemForTV:(int64_t)a3;
- (BOOL)isExplicitContent;
- (BOOL)isRestricted;
- (BOOL)shouldHideWhenRestricted;
- (NSString)ratingDescription;
- (NSString)ratingLabel;
- (SSItemArtworkImage)ratingSystemLogo;
- (SUItemContentRating)initWithDictionary:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)valueForProperty:(id)a3;
- (int64_t)rank;
- (int64_t)ratingSystem;
- (void)dealloc;
- (void)setRank:(int64_t)a3;
- (void)setRatingDescription:(id)a3;
- (void)setRatingLabel:(id)a3;
- (void)setRatingSystem:(int64_t)a3;
- (void)setRatingSystemLogo:(id)a3;
- (void)setShouldHideWhenRestricted:(BOOL)a3;
@end

@implementation SUItemContentRating

- (SUItemContentRating)initWithDictionary:(id)a3
{
  v14.receiver = self;
  v14.super_class = (Class)SUItemContentRating;
  v4 = [(SUItemContentRating *)&v14 init];
  if (v4)
  {
    v5 = (NSDictionary *)[a3 copy];
    v4->_dictionary = v5;
    id v6 = [(NSDictionary *)v5 objectForKey:@"rank"];
    if (objc_opt_respondsToSelector()) {
      v4->_rank = (int)[v6 intValue];
    }
    id v7 = [(NSDictionary *)v4->_dictionary objectForKey:@"description"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      v4->_ratingDescription = (NSString *)v7;
    }
    id v8 = [(NSDictionary *)v4->_dictionary objectForKey:@"label"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      v4->_ratingLabel = (NSString *)(id)[v8 uppercaseString];
    }
    uint64_t v9 = [(NSDictionary *)v4->_dictionary objectForKey:@"system"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      v4->_ratingSystem = [(id)objc_opt_class() ratingSystemFromString:v9];
    }
    uint64_t v10 = [(NSDictionary *)v4->_dictionary objectForKey:@"logo-artwork-url"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v11 = (SSItemArtworkImage *)[objc_alloc(MEMORY[0x263F7B1B0]) initWithArtworkDictionary:v10];
      v4->_ratingSystemLogo = v11;
      if (![(SSItemArtworkImage *)v11 URL])
      {

        v4->_ratingSystemLogo = 0;
      }
    }
    id v12 = [(NSDictionary *)v4->_dictionary objectForKey:@"hide-item-if-restricted"];
    if (objc_opt_respondsToSelector()) {
      v4->_shouldHideWhenRestricted = [v12 BOOLValue];
    }
  }
  return v4;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)SUItemContentRating;
  [(SUItemContentRating *)&v3 dealloc];
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5 = [(id)objc_opt_class() allocWithZone:a3];
  *(void *)(v5 + 8) = [(NSDictionary *)self->_dictionary copyWithZone:a3];
  *(void *)(v5 + 16) = self->_rank;
  *(void *)(v5 + 24) = [(NSString *)self->_ratingDescription copyWithZone:a3];
  *(void *)(v5 + 32) = [(NSString *)self->_ratingLabel copyWithZone:a3];
  *(void *)(v5 + 40) = self->_ratingSystem;
  *(void *)(v5 + 48) = [(SSItemArtworkImage *)self->_ratingSystemLogo copyWithZone:a3];
  *(unsigned char *)(v5 + 56) = self->_shouldHideWhenRestricted;
  return (id)v5;
}

+ (int64_t)ratingSystemFromString:(id)a3
{
  uint64_t v4 = 0;
  while ([*(__CFString **)((char *)&kRatingSystems + v4) caseInsensitiveCompare:a3])
  {
    v4 += 16;
    if (v4 == 576) {
      return 0;
    }
  }
  return *(int64_t *)((char *)&kRatingSystems + v4 + 8);
}

- (BOOL)isExplicitContent
{
  int64_t ratingSystem = self->_ratingSystem;
  return (ratingSystem == 14 || ratingSystem == 1) && self->_rank == 200;
}

- (BOOL)isRestricted
{
  if ([(SUItemContentRating *)self _isRatingSystemForApps:self->_ratingSystem]
    || [(SUItemContentRating *)self _isRatingSystemForMovies:self->_ratingSystem]
    || [(SUItemContentRating *)self _isRatingSystemForTV:self->_ratingSystem])
  {
    objc_super v3 = (void *)SSRestrictionsCopyRankForMediaType();
    if (v3)
    {
      uint64_t v4 = v3;
      int64_t rank = self->_rank;
      BOOL v6 = rank > [v3 integerValue];

      return v6;
    }
  }
  if (![(SUItemContentRating *)self isExplicitContent]) {
    return 0;
  }

  return SSRestrictionsShouldRestrictExplicitContent();
}

- (id)valueForProperty:(id)a3
{
  id v3 = [(NSDictionary *)self->_dictionary objectForKey:a3];

  return v3;
}

- (BOOL)_isRatingSystemForApps:(int64_t)a3
{
  return (a3 & 0xFFFFFFFFFFFFFFFELL) == 2;
}

- (BOOL)_isRatingSystemForMovies:(int64_t)a3
{
  return (unint64_t)(a3 - 4) < 0xA || (unint64_t)(a3 - 23) < 0xD;
}

- (BOOL)_isRatingSystemForMusic:(int64_t)a3
{
  return a3 == 14;
}

- (BOOL)_isRatingSystemForTV:(int64_t)a3
{
  return (unint64_t)(a3 - 15) < 8;
}

- (int64_t)rank
{
  return self->_rank;
}

- (void)setRank:(int64_t)a3
{
  self->_int64_t rank = a3;
}

- (NSString)ratingDescription
{
  return self->_ratingDescription;
}

- (void)setRatingDescription:(id)a3
{
}

- (NSString)ratingLabel
{
  return self->_ratingLabel;
}

- (void)setRatingLabel:(id)a3
{
}

- (int64_t)ratingSystem
{
  return self->_ratingSystem;
}

- (void)setRatingSystem:(int64_t)a3
{
  self->_int64_t ratingSystem = a3;
}

- (SSItemArtworkImage)ratingSystemLogo
{
  return self->_ratingSystemLogo;
}

- (void)setRatingSystemLogo:(id)a3
{
}

- (BOOL)shouldHideWhenRestricted
{
  return self->_shouldHideWhenRestricted;
}

- (void)setShouldHideWhenRestricted:(BOOL)a3
{
  self->_shouldHideWhenRestricted = a3;
}

@end