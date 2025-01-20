@interface SSItemContentRating
+ (id)stringForRatingSystem:(int64_t)a3;
+ (int64_t)ratingSystemFromString:(id)a3;
- (BOOL)_isRatingSystemForApps:(int64_t)a3;
- (BOOL)_isRatingSystemForMovies:(int64_t)a3;
- (BOOL)_isRatingSystemForMusic:(int64_t)a3;
- (BOOL)_isRatingSystemForTV:(int64_t)a3;
- (BOOL)isExplicitContent;
- (BOOL)isRestricted;
- (BOOL)shouldHideWhenRestricted;
- (NSDictionary)contentRatingDictionary;
- (NSString)ratingDescription;
- (NSString)ratingLabel;
- (SSItemArtworkImage)ratingSystemLogo;
- (SSItemContentRating)init;
- (SSItemContentRating)initWithDictionary:(id)a3;
- (SSItemContentRating)initWithXPCEncoding:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)copyXPCEncoding;
- (id)valueForProperty:(id)a3;
- (int64_t)rank;
- (int64_t)ratingSystem;
- (void)_setValue:(id)a3 forProperty:(id)a4;
- (void)_setValueCopy:(id)a3 forProperty:(id)a4;
- (void)dealloc;
- (void)setRank:(int64_t)a3;
- (void)setRatingDescription:(id)a3;
- (void)setRatingLabel:(id)a3;
- (void)setRatingSystem:(int64_t)a3;
- (void)setShouldHideWhenRestricted:(BOOL)a3;
@end

@implementation SSItemContentRating

- (SSItemContentRating)init
{
  v4.receiver = self;
  v4.super_class = (Class)SSItemContentRating;
  v2 = [(SSItemContentRating *)&v4 init];
  if (v2) {
    v2->_dictionary = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
  }
  return v2;
}

- (SSItemContentRating)initWithDictionary:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)SSItemContentRating;
  objc_super v4 = [(SSItemContentRating *)&v6 init];
  if (v4) {
    v4->_dictionary = (NSMutableDictionary *)[a3 mutableCopy];
  }
  return v4;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)SSItemContentRating;
  [(SSItemContentRating *)&v3 dealloc];
}

- (id)copyWithZone:(_NSZone *)a3
{
  v5 = (void *)[(id)objc_opt_class() allocWithZone:a3];
  v5[1] = [(NSMutableDictionary *)self->_dictionary mutableCopyWithZone:a3];
  return v5;
}

- (BOOL)isExplicitContent
{
  int64_t v3 = [(SSItemContentRating *)self ratingSystem];
  return (v3 == 14 || v3 == 1) && [(SSItemContentRating *)self rank] == 200;
}

- (BOOL)isRestricted
{
  int64_t v3 = [(SSItemContentRating *)self ratingSystem];
  if ([(SSItemContentRating *)self _isRatingSystemForApps:v3])
  {
    unint64_t v4 = 0;
  }
  else if ([(SSItemContentRating *)self _isRatingSystemForMovies:v3])
  {
    unint64_t v4 = 1;
  }
  else
  {
    if (![(SSItemContentRating *)self _isRatingSystemForTV:v3]) {
      goto LABEL_9;
    }
    unint64_t v4 = 2;
  }
  id v5 = SSRestrictionsCopyRankForMediaType(v4);
  if (v5)
  {
    objc_super v6 = v5;
    uint64_t v7 = [(SSItemContentRating *)self rank];
    BOOL v8 = v7 > [v6 integerValue];

    return v8;
  }
LABEL_9:
  if (![(SSItemContentRating *)self isExplicitContent]) {
    return 0;
  }
  return SSRestrictionsShouldRestrictExplicitContent();
}

- (int64_t)rank
{
  v2 = (void *)[(NSMutableDictionary *)self->_dictionary objectForKey:@"rank"];
  if (objc_opt_respondsToSelector()) {
    return (int)[v2 intValue];
  }
  else {
    return 0;
  }
}

- (NSString)ratingDescription
{
  v2 = (void *)[(NSMutableDictionary *)self->_dictionary objectForKey:@"description"];
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0) {
    return 0;
  }
  id v3 = v2;
  return (NSString *)v3;
}

- (NSString)ratingLabel
{
  v2 = (void *)[(NSMutableDictionary *)self->_dictionary objectForKey:@"label"];
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0) {
    return 0;
  }
  id v3 = v2;
  return (NSString *)v3;
}

- (int64_t)ratingSystem
{
  uint64_t v2 = [(NSMutableDictionary *)self->_dictionary objectForKey:@"system"];
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0) {
    return 0;
  }
  id v3 = objc_opt_class();
  return [v3 ratingSystemFromString:v2];
}

- (void)setRank:(int64_t)a3
{
  uint64_t v4 = [NSNumber numberWithInteger:a3];
  [(SSItemContentRating *)self _setValue:v4 forProperty:@"rank"];
}

- (void)setRatingDescription:(id)a3
{
}

- (void)setRatingLabel:(id)a3
{
}

- (void)setRatingSystem:(int64_t)a3
{
  uint64_t v4 = [(id)objc_opt_class() stringForRatingSystem:a3];
  [(SSItemContentRating *)self _setValue:v4 forProperty:@"system"];
}

- (void)setShouldHideWhenRestricted:(BOOL)a3
{
  uint64_t v4 = [NSNumber numberWithBool:a3];
  [(SSItemContentRating *)self _setValue:v4 forProperty:@"hide-item-if-restricted"];
}

- (BOOL)shouldHideWhenRestricted
{
  uint64_t v2 = (void *)[(NSMutableDictionary *)self->_dictionary objectForKey:@"hide-item-if-restricted"];
  if ((objc_opt_respondsToSelector() & 1) == 0) {
    return 0;
  }
  return [v2 BOOLValue];
}

- (id)valueForProperty:(id)a3
{
  id v3 = (id)[(NSMutableDictionary *)self->_dictionary objectForKey:a3];
  return v3;
}

+ (int64_t)ratingSystemFromString:(id)a3
{
  uint64_t v4 = 0;
  while ([*(__CFString **)((char *)&kRatingSystems + v4) caseInsensitiveCompare:a3])
  {
    v4 += 16;
    if (v4 == 1536) {
      return 0;
    }
  }
  return *(int64_t *)((char *)&kRatingSystems + v4 + 8);
}

+ (id)stringForRatingSystem:(int64_t)a3
{
  uint64_t v3 = 0;
  while (*(__CFString **)((char *)&kRatingSystems + v3 + 8) != (__CFString *)a3)
  {
    v3 += 16;
    if (v3 == 1536) {
      return 0;
    }
  }
  return *(__CFString **)((char *)&kRatingSystems + v3);
}

- (NSDictionary)contentRatingDictionary
{
  uint64_t v2 = (void *)[(NSMutableDictionary *)self->_dictionary copy];
  return (NSDictionary *)v2;
}

- (SSItemArtworkImage)ratingSystemLogo
{
  uint64_t v2 = [(NSMutableDictionary *)self->_dictionary objectForKey:@"logo-artwork-url"];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v3 = [[SSItemArtworkImage alloc] initWithArtworkDictionary:v2];
    if ([(SSItemArtworkImage *)v3 URL]) {
      goto LABEL_5;
    }
  }
  uint64_t v3 = 0;
LABEL_5:
  return v3;
}

- (id)copyXPCEncoding
{
  xpc_object_t v3 = xpc_dictionary_create(0, 0, 0);
  SSXPCDictionarySetCFObject(v3, "0", (__CFString *)self->_dictionary);
  return v3;
}

- (SSItemContentRating)initWithXPCEncoding:(id)a3
{
  if (a3 && MEMORY[0x1A62689E0](a3, a2) == MEMORY[0x1E4F14590])
  {
    v7.receiver = self;
    v7.super_class = (Class)SSItemContentRating;
    id v5 = [(SSItemContentRating *)&v7 init];
    if (v5)
    {
      objc_opt_class();
      v5->_dictionary = (NSMutableDictionary *)SSXPCDictionaryCopyCFObjectWithClass(a3, "0");
    }
  }
  else
  {

    return 0;
  }
  return v5;
}

- (BOOL)_isRatingSystemForApps:(int64_t)a3
{
  return (a3 & 0xFFFFFFFFFFFFFFFELL) == 2;
}

- (BOOL)_isRatingSystemForMovies:(int64_t)a3
{
  return (unint64_t)(a3 - 4) < 0xA || (unint64_t)(a3 - 23) < 0x49;
}

- (BOOL)_isRatingSystemForMusic:(int64_t)a3
{
  return a3 == 14;
}

- (BOOL)_isRatingSystemForTV:(int64_t)a3
{
  return (unint64_t)(a3 - 15) < 8;
}

- (void)_setValueCopy:(id)a3 forProperty:(id)a4
{
  id v6 = (id)[a3 copy];
  [(SSItemContentRating *)self _setValue:v6 forProperty:a4];
}

- (void)_setValue:(id)a3 forProperty:(id)a4
{
  dictionary = self->_dictionary;
  if (a3) {
    [(NSMutableDictionary *)dictionary setObject:a3 forKey:a4];
  }
  else {
    [(NSMutableDictionary *)dictionary removeObjectForKey:a4];
  }
}

@end