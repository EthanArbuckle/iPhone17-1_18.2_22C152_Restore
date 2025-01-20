@interface VUIContentRatingBadgeManager
+ (id)_badgeDescriptorLookupKeyWithRatingLabel:(id)a3 inRatingSystem:(int64_t)a4;
+ (id)_cleanedRatingLabel:(id)a3;
+ (id)_imageForUnknownRatingLabel:(id)a3;
+ (id)_imageLookupKeyWithRatingLabel:(id)a3 inRatingSystem:(int64_t)a4;
+ (id)sharedInstance;
+ (void)_addImageDescriptorToDictionary:(id)a3 ratingSystem:(int64_t)a4 ratingLabel:(id)a5 resourceName:(id)a6 isTemplatedImage:(BOOL)a7;
- (BOOL)cachesImages;
- (BOOL)isTemplatedBadgeForContentRating:(id)a3;
- (NSCache)imageCache;
- (NSDictionary)badgeDescriptors;
- (id)_badgeDescriptorForContentRating:(id)a3;
- (id)_badgeDescriptorForRatingLabel:(id)a3 inRatingSystem:(int64_t)a4;
- (id)badgeForContentRating:(id)a3 drawUnknownRatingBadge:(BOOL)a4;
- (id)badgeForRatingLabel:(id)a3 inRatingSystem:(int64_t)a4 drawUnknownRatingBadge:(BOOL)a5;
- (void)setBadgeDescriptors:(id)a3;
- (void)setCachesImages:(BOOL)a3;
- (void)setImageCache:(id)a3;
@end

@implementation VUIContentRatingBadgeManager

+ (id)sharedInstance
{
  if (sharedInstance___once != -1) {
    dispatch_once(&sharedInstance___once, &__block_literal_global_13);
  }
  v2 = (void *)sharedInstance___sharedInstance_0;
  return v2;
}

uint64_t __46__VUIContentRatingBadgeManager_sharedInstance__block_invoke()
{
  v0 = objc_alloc_init(VUIContentRatingBadgeManager);
  uint64_t v1 = sharedInstance___sharedInstance_0;
  sharedInstance___sharedInstance_0 = (uint64_t)v0;
  return MEMORY[0x1F41817F8](v0, v1);
}

- (void)setCachesImages:(BOOL)a3
{
  if (self->_cachesImages != a3)
  {
    self->_cachesImages = a3;
    if (a3)
    {
      id v4 = objc_alloc_init(MEMORY[0x1E4F1C998]);
      [v4 setCountLimit:20];
      [v4 setName:@"VUIContentRatingBadgeManagerCache"];
    }
    else
    {
      id v4 = 0;
    }
    [(VUIContentRatingBadgeManager *)self setImageCache:v4];
  }
}

- (id)badgeForContentRating:(id)a3 drawUnknownRatingBadge:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  v7 = [v6 ratingLabel];
  uint64_t v8 = [v6 ratingSystem];

  v9 = [(VUIContentRatingBadgeManager *)self badgeForRatingLabel:v7 inRatingSystem:v8 drawUnknownRatingBadge:v4];

  return v9;
}

- (id)badgeForRatingLabel:(id)a3 inRatingSystem:(int64_t)a4 drawUnknownRatingBadge:(BOOL)a5
{
  BOOL v5 = a5;
  id v8 = a3;
  v9 = [(VUIContentRatingBadgeManager *)self imageCache];
  v10 = [(id)objc_opt_class() _imageLookupKeyWithRatingLabel:v8 inRatingSystem:a4];
  v11 = [v9 objectForKey:v10];
  if (v11) {
    goto LABEL_13;
  }
  v12 = [(VUIContentRatingBadgeManager *)self _badgeDescriptorForRatingLabel:v8 inRatingSystem:a4];
  v13 = v12;
  if (!v12)
  {
    v11 = 0;
    goto LABEL_8;
  }
  v14 = [v12 resourceName];
  if (v14)
  {
    v15 = (void *)MEMORY[0x1E4F42A80];
    v16 = +[VUICoreUtilities VideosUICoreBundle];
    v11 = [v15 vuiImageNamed:v14 inBundle:v16];
  }
  else
  {
    v11 = 0;
  }

  if (!v11)
  {
LABEL_8:
    if (v5)
    {
      v11 = [(id)objc_opt_class() _imageForUnknownRatingLabel:v8];
    }
  }
  if (v11) {
    [v9 setObject:v11 forKey:v10];
  }

LABEL_13:
  return v11;
}

- (BOOL)isTemplatedBadgeForContentRating:(id)a3
{
  v3 = [(VUIContentRatingBadgeManager *)self _badgeDescriptorForContentRating:a3];
  BOOL v4 = v3;
  if (v3) {
    char v5 = [v3 isTemplatedImage];
  }
  else {
    char v5 = 1;
  }

  return v5;
}

- (NSDictionary)badgeDescriptors
{
  badgeDescriptors = self->_badgeDescriptors;
  if (!badgeDescriptors)
  {
    id v4 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
    [(id)objc_opt_class() _addImageDescriptorToDictionary:v4 ratingSystem:135 ratingLabel:@"g" resourceName:@"mpaa-g" isTemplatedImage:1];
    [(id)objc_opt_class() _addImageDescriptorToDictionary:v4 ratingSystem:135 ratingLabel:@"pg" resourceName:@"mpaa-pg" isTemplatedImage:1];
    [(id)objc_opt_class() _addImageDescriptorToDictionary:v4 ratingSystem:135 ratingLabel:@"pg13" resourceName:@"mpaa-pg13" isTemplatedImage:1];
    [(id)objc_opt_class() _addImageDescriptorToDictionary:v4 ratingSystem:135 ratingLabel:@"r" resourceName:@"mpaa-r" isTemplatedImage:1];
    [(id)objc_opt_class() _addImageDescriptorToDictionary:v4 ratingSystem:135 ratingLabel:@"nc17" resourceName:@"mpaa-nc17" isTemplatedImage:1];
    [(id)objc_opt_class() _addImageDescriptorToDictionary:v4 ratingSystem:135 ratingLabel:@"nr" resourceName:@"nr" isTemplatedImage:1];
    [(id)objc_opt_class() _addImageDescriptorToDictionary:v4 ratingSystem:135 ratingLabel:@"unrated" resourceName:@"unrated" isTemplatedImage:1];
    [(id)objc_opt_class() _addImageDescriptorToDictionary:v4 ratingSystem:135 ratingLabel:@"ur" resourceName:@"unrated" isTemplatedImage:1];
    [(id)objc_opt_class() _addImageDescriptorToDictionary:v4 ratingSystem:153 ratingLabel:@"tvy" resourceName:@"tv-y" isTemplatedImage:1];
    [(id)objc_opt_class() _addImageDescriptorToDictionary:v4 ratingSystem:153 ratingLabel:@"tvy7" resourceName:@"tv-y7" isTemplatedImage:1];
    [(id)objc_opt_class() _addImageDescriptorToDictionary:v4 ratingSystem:153 ratingLabel:@"tvy7fv" resourceName:@"tv-y7fv" isTemplatedImage:1];
    [(id)objc_opt_class() _addImageDescriptorToDictionary:v4 ratingSystem:153 ratingLabel:@"tvg" resourceName:@"tv-g" isTemplatedImage:1];
    [(id)objc_opt_class() _addImageDescriptorToDictionary:v4 ratingSystem:153 ratingLabel:@"tvpg" resourceName:@"tv-pg" isTemplatedImage:1];
    [(id)objc_opt_class() _addImageDescriptorToDictionary:v4 ratingSystem:153 ratingLabel:@"tv14" resourceName:@"tv-14" isTemplatedImage:1];
    [(id)objc_opt_class() _addImageDescriptorToDictionary:v4 ratingSystem:153 ratingLabel:@"tvma" resourceName:@"tv-ma" isTemplatedImage:1];
    [(id)objc_opt_class() _addImageDescriptorToDictionary:v4 ratingSystem:153 ratingLabel:@"unrated" resourceName:@"unrated" isTemplatedImage:1];
    [(id)objc_opt_class() _addImageDescriptorToDictionary:v4 ratingSystem:153 ratingLabel:@"ur" resourceName:@"unrated" isTemplatedImage:1];
    [(id)objc_opt_class() _addImageDescriptorToDictionary:v4 ratingSystem:92 ratingLabel:@"g" resourceName:@"NZ-g" isTemplatedImage:0];
    [(id)objc_opt_class() _addImageDescriptorToDictionary:v4 ratingSystem:92 ratingLabel:@"pg" resourceName:@"NZ-pg" isTemplatedImage:0];
    [(id)objc_opt_class() _addImageDescriptorToDictionary:v4 ratingSystem:92 ratingLabel:@"m" resourceName:@"NZ-m" isTemplatedImage:0];
    [(id)objc_opt_class() _addImageDescriptorToDictionary:v4 ratingSystem:92 ratingLabel:@"r13" resourceName:@"NZ-r13" isTemplatedImage:0];
    [(id)objc_opt_class() _addImageDescriptorToDictionary:v4 ratingSystem:92 ratingLabel:@"r15" resourceName:@"NZ-r15" isTemplatedImage:0];
    [(id)objc_opt_class() _addImageDescriptorToDictionary:v4 ratingSystem:92 ratingLabel:@"r16" resourceName:@"NZ-r16" isTemplatedImage:0];
    [(id)objc_opt_class() _addImageDescriptorToDictionary:v4 ratingSystem:92 ratingLabel:@"r18" resourceName:@"NZ-r18" isTemplatedImage:0];
    [(id)objc_opt_class() _addImageDescriptorToDictionary:v4 ratingSystem:92 ratingLabel:@"rp13" resourceName:@"NZ-rp13" isTemplatedImage:0];
    [(id)objc_opt_class() _addImageDescriptorToDictionary:v4 ratingSystem:92 ratingLabel:@"rp16" resourceName:@"NZ-rp16" isTemplatedImage:0];
    [(id)objc_opt_class() _addImageDescriptorToDictionary:v4 ratingSystem:92 ratingLabel:@"r" resourceName:@"NZ-r" isTemplatedImage:0];
    [(id)objc_opt_class() _addImageDescriptorToDictionary:v4 ratingSystem:149 ratingLabel:@"g" resourceName:@"NZ-g" isTemplatedImage:0];
    [(id)objc_opt_class() _addImageDescriptorToDictionary:v4 ratingSystem:149 ratingLabel:@"pg" resourceName:@"NZ-pg" isTemplatedImage:0];
    [(id)objc_opt_class() _addImageDescriptorToDictionary:v4 ratingSystem:149 ratingLabel:@"m" resourceName:@"NZ-m" isTemplatedImage:0];
    [(id)objc_opt_class() _addImageDescriptorToDictionary:v4 ratingSystem:149 ratingLabel:@"r13" resourceName:@"NZ-r13" isTemplatedImage:0];
    [(id)objc_opt_class() _addImageDescriptorToDictionary:v4 ratingSystem:149 ratingLabel:@"r15" resourceName:@"NZ-r15" isTemplatedImage:0];
    [(id)objc_opt_class() _addImageDescriptorToDictionary:v4 ratingSystem:149 ratingLabel:@"r16" resourceName:@"NZ-r16" isTemplatedImage:0];
    [(id)objc_opt_class() _addImageDescriptorToDictionary:v4 ratingSystem:149 ratingLabel:@"r18" resourceName:@"NZ-r18" isTemplatedImage:0];
    [(id)objc_opt_class() _addImageDescriptorToDictionary:v4 ratingSystem:149 ratingLabel:@"rp13" resourceName:@"NZ-rp13" isTemplatedImage:0];
    [(id)objc_opt_class() _addImageDescriptorToDictionary:v4 ratingSystem:149 ratingLabel:@"rp16" resourceName:@"NZ-rp16" isTemplatedImage:0];
    [(id)objc_opt_class() _addImageDescriptorToDictionary:v4 ratingSystem:149 ratingLabel:@"r" resourceName:@"NZ-r" isTemplatedImage:0];
    [(id)objc_opt_class() _addImageDescriptorToDictionary:v4 ratingSystem:21 ratingLabel:@"l" resourceName:@"bars-l" isTemplatedImage:0];
    [(id)objc_opt_class() _addImageDescriptorToDictionary:v4 ratingSystem:21 ratingLabel:@"10" resourceName:@"bars-10" isTemplatedImage:0];
    [(id)objc_opt_class() _addImageDescriptorToDictionary:v4 ratingSystem:21 ratingLabel:@"12" resourceName:@"bars-12" isTemplatedImage:0];
    [(id)objc_opt_class() _addImageDescriptorToDictionary:v4 ratingSystem:21 ratingLabel:@"14" resourceName:@"bars-14" isTemplatedImage:0];
    [(id)objc_opt_class() _addImageDescriptorToDictionary:v4 ratingSystem:21 ratingLabel:@"16" resourceName:@"bars-16" isTemplatedImage:0];
    [(id)objc_opt_class() _addImageDescriptorToDictionary:v4 ratingSystem:21 ratingLabel:@"18" resourceName:@"bars-18" isTemplatedImage:0];
    [(id)objc_opt_class() _addImageDescriptorToDictionary:v4 ratingSystem:21 ratingLabel:@"al" resourceName:@"bars-al" isTemplatedImage:0];
    [(id)objc_opt_class() _addImageDescriptorToDictionary:v4 ratingSystem:21 ratingLabel:@"a10" resourceName:@"bars-a10" isTemplatedImage:0];
    [(id)objc_opt_class() _addImageDescriptorToDictionary:v4 ratingSystem:21 ratingLabel:@"a12" resourceName:@"bars-a12" isTemplatedImage:0];
    [(id)objc_opt_class() _addImageDescriptorToDictionary:v4 ratingSystem:21 ratingLabel:@"a14" resourceName:@"bars-a14" isTemplatedImage:0];
    [(id)objc_opt_class() _addImageDescriptorToDictionary:v4 ratingSystem:21 ratingLabel:@"a16" resourceName:@"bars-a16" isTemplatedImage:0];
    [(id)objc_opt_class() _addImageDescriptorToDictionary:v4 ratingSystem:21 ratingLabel:@"a18" resourceName:@"bars-a18" isTemplatedImage:0];
    [(id)objc_opt_class() _addImageDescriptorToDictionary:v4 ratingSystem:143 ratingLabel:@"l" resourceName:@"bars-l" isTemplatedImage:0];
    [(id)objc_opt_class() _addImageDescriptorToDictionary:v4 ratingSystem:143 ratingLabel:@"10" resourceName:@"bars-10" isTemplatedImage:0];
    [(id)objc_opt_class() _addImageDescriptorToDictionary:v4 ratingSystem:143 ratingLabel:@"12" resourceName:@"bars-12" isTemplatedImage:0];
    [(id)objc_opt_class() _addImageDescriptorToDictionary:v4 ratingSystem:143 ratingLabel:@"14" resourceName:@"bars-14" isTemplatedImage:0];
    [(id)objc_opt_class() _addImageDescriptorToDictionary:v4 ratingSystem:143 ratingLabel:@"16" resourceName:@"bars-16" isTemplatedImage:0];
    [(id)objc_opt_class() _addImageDescriptorToDictionary:v4 ratingSystem:143 ratingLabel:@"18" resourceName:@"bars-18" isTemplatedImage:0];
    [(id)objc_opt_class() _addImageDescriptorToDictionary:v4 ratingSystem:143 ratingLabel:@"al" resourceName:@"bars-al" isTemplatedImage:0];
    [(id)objc_opt_class() _addImageDescriptorToDictionary:v4 ratingSystem:143 ratingLabel:@"a10" resourceName:@"bars-a10" isTemplatedImage:0];
    [(id)objc_opt_class() _addImageDescriptorToDictionary:v4 ratingSystem:143 ratingLabel:@"a12" resourceName:@"bars-a12" isTemplatedImage:0];
    [(id)objc_opt_class() _addImageDescriptorToDictionary:v4 ratingSystem:143 ratingLabel:@"a14" resourceName:@"bars-a14" isTemplatedImage:0];
    [(id)objc_opt_class() _addImageDescriptorToDictionary:v4 ratingSystem:143 ratingLabel:@"a16" resourceName:@"bars-a16" isTemplatedImage:0];
    [(id)objc_opt_class() _addImageDescriptorToDictionary:v4 ratingSystem:143 ratingLabel:@"a18" resourceName:@"bars-a18" isTemplatedImage:0];
    [(id)objc_opt_class() _addImageDescriptorToDictionary:v4 ratingSystem:129 ratingLabel:@"genel i̇zleyici" resourceName:@"tr-ga" isTemplatedImage:1];
    [(id)objc_opt_class() _addImageDescriptorToDictionary:v4 ratingSystem:129 ratingLabel:@"6a" resourceName:@"tr-6a" isTemplatedImage:1];
    [(id)objc_opt_class() _addImageDescriptorToDictionary:v4 ratingSystem:129 ratingLabel:@"6+" resourceName:@"tr-6plus" isTemplatedImage:1];
    [(id)objc_opt_class() _addImageDescriptorToDictionary:v4 ratingSystem:129 ratingLabel:@"10a" resourceName:@"tr-10a" isTemplatedImage:1];
    [(id)objc_opt_class() _addImageDescriptorToDictionary:v4 ratingSystem:129 ratingLabel:@"10+" resourceName:@"tr-10plus" isTemplatedImage:1];
    [(id)objc_opt_class() _addImageDescriptorToDictionary:v4 ratingSystem:129 ratingLabel:@"13a" resourceName:@"tr-13a" isTemplatedImage:1];
    [(id)objc_opt_class() _addImageDescriptorToDictionary:v4 ratingSystem:129 ratingLabel:@"13+" resourceName:@"tr-13plus" isTemplatedImage:1];
    [(id)objc_opt_class() _addImageDescriptorToDictionary:v4 ratingSystem:129 ratingLabel:@"16+" resourceName:@"tr-16plus" isTemplatedImage:1];
    [(id)objc_opt_class() _addImageDescriptorToDictionary:v4 ratingSystem:129 ratingLabel:@"18+" resourceName:@"tr-18plus" isTemplatedImage:1];
    [(id)objc_opt_class() _addImageDescriptorToDictionary:v4 ratingSystem:134 ratingLabel:@"u" resourceName:@"bbfc-u" isTemplatedImage:0];
    [(id)objc_opt_class() _addImageDescriptorToDictionary:v4 ratingSystem:134 ratingLabel:@"pg" resourceName:@"bbfc-pg" isTemplatedImage:0];
    [(id)objc_opt_class() _addImageDescriptorToDictionary:v4 ratingSystem:134 ratingLabel:@"12" resourceName:@"bbfc-12" isTemplatedImage:0];
    [(id)objc_opt_class() _addImageDescriptorToDictionary:v4 ratingSystem:134 ratingLabel:@"12a" resourceName:@"bbfc-12a" isTemplatedImage:0];
    [(id)objc_opt_class() _addImageDescriptorToDictionary:v4 ratingSystem:134 ratingLabel:@"15" resourceName:@"bbfc-15" isTemplatedImage:0];
    [(id)objc_opt_class() _addImageDescriptorToDictionary:v4 ratingSystem:134 ratingLabel:@"18" resourceName:@"bbfc-18" isTemplatedImage:0];
    [(id)objc_opt_class() _addImageDescriptorToDictionary:v4 ratingSystem:134 ratingLabel:@"r18" resourceName:@"bbfc-r18" isTemplatedImage:0];
    [(id)objc_opt_class() _addImageDescriptorToDictionary:v4 ratingSystem:152 ratingLabel:@"u" resourceName:@"bbfc-u" isTemplatedImage:0];
    [(id)objc_opt_class() _addImageDescriptorToDictionary:v4 ratingSystem:152 ratingLabel:@"pg" resourceName:@"bbfc-pg" isTemplatedImage:0];
    [(id)objc_opt_class() _addImageDescriptorToDictionary:v4 ratingSystem:152 ratingLabel:@"12" resourceName:@"bbfc-12" isTemplatedImage:0];
    [(id)objc_opt_class() _addImageDescriptorToDictionary:v4 ratingSystem:152 ratingLabel:@"12a" resourceName:@"bbfc-12a" isTemplatedImage:0];
    [(id)objc_opt_class() _addImageDescriptorToDictionary:v4 ratingSystem:152 ratingLabel:@"15" resourceName:@"bbfc-15" isTemplatedImage:0];
    [(id)objc_opt_class() _addImageDescriptorToDictionary:v4 ratingSystem:152 ratingLabel:@"18" resourceName:@"bbfc-18" isTemplatedImage:0];
    [(id)objc_opt_class() _addImageDescriptorToDictionary:v4 ratingSystem:152 ratingLabel:@"r18" resourceName:@"bbfc-r18" isTemplatedImage:0];
    [(id)objc_opt_class() _addImageDescriptorToDictionary:v4 ratingSystem:116 ratingLabel:@"12세 이상 관람가" resourceName:@"kr_movies-12" isTemplatedImage:0];
    [(id)objc_opt_class() _addImageDescriptorToDictionary:v4 ratingSystem:116 ratingLabel:@"15세 이상 관람가" resourceName:@"kr_movies-15" isTemplatedImage:0];
    [(id)objc_opt_class() _addImageDescriptorToDictionary:v4 ratingSystem:116 ratingLabel:@"청소년 관람불가" resourceName:@"kr_movies-19" isTemplatedImage:0];
    [(id)objc_opt_class() _addImageDescriptorToDictionary:v4 ratingSystem:116 ratingLabel:@"전체관람가" resourceName:@"kr_movies-all" isTemplatedImage:0];
    [(id)objc_opt_class() _addImageDescriptorToDictionary:v4 ratingSystem:151 ratingLabel:@"7" resourceName:@"kr_tv-7" isTemplatedImage:0];
    [(id)objc_opt_class() _addImageDescriptorToDictionary:v4 ratingSystem:151 ratingLabel:@"12" resourceName:@"kr_tv-12" isTemplatedImage:0];
    [(id)objc_opt_class() _addImageDescriptorToDictionary:v4 ratingSystem:151 ratingLabel:@"15" resourceName:@"kr_tv-15" isTemplatedImage:0];
    [(id)objc_opt_class() _addImageDescriptorToDictionary:v4 ratingSystem:151 ratingLabel:@"19" resourceName:@"kr_tv-19" isTemplatedImage:0];
    [(id)objc_opt_class() _addImageDescriptorToDictionary:v4 ratingSystem:151 ratingLabel:@"all" resourceName:@"kr_tv-all" isTemplatedImage:0];
    [(id)objc_opt_class() _addImageDescriptorToDictionary:v4 ratingSystem:65 ratingLabel:@"t" resourceName:@"it-t" isTemplatedImage:0];
    [(id)objc_opt_class() _addImageDescriptorToDictionary:v4 ratingSystem:65 ratingLabel:@"6+" resourceName:@"it-6plus" isTemplatedImage:0];
    [(id)objc_opt_class() _addImageDescriptorToDictionary:v4 ratingSystem:65 ratingLabel:@"14+" resourceName:@"it-14plus" isTemplatedImage:0];
    [(id)objc_opt_class() _addImageDescriptorToDictionary:v4 ratingSystem:65 ratingLabel:@"18+" resourceName:@"it-18plus" isTemplatedImage:0];
    [(id)objc_opt_class() _addImageDescriptorToDictionary:v4 ratingSystem:147 ratingLabel:@"t" resourceName:@"it-t" isTemplatedImage:0];
    [(id)objc_opt_class() _addImageDescriptorToDictionary:v4 ratingSystem:147 ratingLabel:@"6+" resourceName:@"it-6plus" isTemplatedImage:0];
    [(id)objc_opt_class() _addImageDescriptorToDictionary:v4 ratingSystem:147 ratingLabel:@"14+" resourceName:@"it-14plus" isTemplatedImage:0];
    [(id)objc_opt_class() _addImageDescriptorToDictionary:v4 ratingSystem:147 ratingLabel:@"18+" resourceName:@"it-18plus" isTemplatedImage:0];
    char v5 = (NSDictionary *)[v4 copy];
    id v6 = self->_badgeDescriptors;
    self->_badgeDescriptors = v5;

    badgeDescriptors = self->_badgeDescriptors;
  }
  return badgeDescriptors;
}

- (id)_badgeDescriptorForContentRating:(id)a3
{
  id v4 = a3;
  char v5 = [v4 ratingLabel];
  uint64_t v6 = [v4 ratingSystem];

  v7 = [(VUIContentRatingBadgeManager *)self _badgeDescriptorForRatingLabel:v5 inRatingSystem:v6];

  return v7;
}

- (id)_badgeDescriptorForRatingLabel:(id)a3 inRatingSystem:(int64_t)a4
{
  id v6 = a3;
  v7 = [(id)objc_opt_class() _badgeDescriptorLookupKeyWithRatingLabel:v6 inRatingSystem:a4];

  id v8 = [(VUIContentRatingBadgeManager *)self badgeDescriptors];
  v9 = [v8 objectForKey:v7];

  return v9;
}

+ (id)_badgeDescriptorLookupKeyWithRatingLabel:(id)a3 inRatingSystem:(int64_t)a4
{
  if (a4)
  {
    id v6 = a3;
    v7 = +[VUIContentRatingSystemUtilities stringForRatingSystem:a4];
    id v8 = [a1 _cleanedRatingLabel:v6];

    v9 = [NSString stringWithFormat:@"%@-%@", v7, v8];
  }
  else
  {
    v9 = 0;
  }
  return v9;
}

+ (id)_cleanedRatingLabel:(id)a3
{
  v3 = [a3 stringByReplacingOccurrencesOfString:@" " withString:&stru_1F3DEFD80];
  id v4 = [v3 stringByReplacingOccurrencesOfString:@"-" withString:&stru_1F3DEFD80];

  char v5 = [v4 stringByReplacingOccurrencesOfString:@"_" withString:&stru_1F3DEFD80];

  id v6 = [v5 lowercaseString];

  return v6;
}

+ (void)_addImageDescriptorToDictionary:(id)a3 ratingSystem:(int64_t)a4 ratingLabel:(id)a5 resourceName:(id)a6 isTemplatedImage:(BOOL)a7
{
  BOOL v7 = a7;
  id v15 = a3;
  id v11 = a6;
  id v12 = a5;
  v13 = [[VUIContentRatingBadgeDescriptor alloc] initWithResourceName:v11 isTemplatedImage:v7];

  v14 = [(id)objc_opt_class() _badgeDescriptorLookupKeyWithRatingLabel:v12 inRatingSystem:a4];

  if (v14) {
    [v15 setObject:v13 forKey:v14];
  }
}

+ (id)_imageLookupKeyWithRatingLabel:(id)a3 inRatingSystem:(int64_t)a4
{
  id v6 = a3;
  BOOL v7 = v6;
  if (a4)
  {
    id v8 = [a1 _badgeDescriptorLookupKeyWithRatingLabel:v6 inRatingSystem:a4];
  }
  else
  {
    id v8 = v6;
  }
  v9 = v8;

  return v9;
}

+ (id)_imageForUnknownRatingLabel:(id)a3
{
  return +[VUIContentRatingTextBadgeView _badgeImageWithAttributedRatingText:a3 andColor:0];
}

- (BOOL)cachesImages
{
  return self->_cachesImages;
}

- (NSCache)imageCache
{
  return self->_imageCache;
}

- (void)setImageCache:(id)a3
{
}

- (void)setBadgeDescriptors:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_badgeDescriptors, 0);
  objc_storeStrong((id *)&self->_imageCache, 0);
}

@end