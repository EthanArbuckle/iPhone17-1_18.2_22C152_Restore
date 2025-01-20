@interface VUIMediaEntityType
+ (id)episode;
+ (id)homeVideo;
+ (id)movie;
+ (id)movieRental;
+ (id)season;
+ (id)show;
- (BOOL)isEqual:(id)a3;
- (BOOL)isRental;
- (VUIMediaEntityType)init;
- (id)_initWithMediaCollectionType:(unint64_t)a3 mediaCategoryType:(unint64_t)a4;
- (id)_initWithMediaItemCategoryType:(unint64_t)a3 isRental:(BOOL)a4;
- (id)description;
- (id)stringDescription;
- (unint64_t)hash;
- (unint64_t)mediaCategoryType;
- (unint64_t)mediaCollectionType;
- (unint64_t)subtype;
- (void)setMediaCategoryType:(unint64_t)a3;
- (void)setMediaCollectionType:(unint64_t)a3;
- (void)setRental:(BOOL)a3;
- (void)setSubtype:(unint64_t)a3;
@end

@implementation VUIMediaEntityType

+ (id)episode
{
  if (episode___onceToken != -1) {
    dispatch_once(&episode___onceToken, &__block_literal_global_6_1);
  }
  v2 = (void *)episode___type;
  return v2;
}

- (unint64_t)mediaCategoryType
{
  return self->_mediaCategoryType;
}

+ (id)movie
{
  if (movie___onceToken != -1) {
    dispatch_once(&movie___onceToken, &__block_literal_global_127);
  }
  v2 = (void *)movie___type;
  return v2;
}

+ (id)movieRental
{
  if (movieRental___onceToken != -1) {
    dispatch_once(&movieRental___onceToken, &__block_literal_global_2_1);
  }
  v2 = (void *)movieRental___type;
  return v2;
}

void __33__VUIMediaEntityType_movieRental__block_invoke()
{
  id v0 = [[VUIMediaEntityType alloc] _initWithMediaItemCategoryType:0 isRental:1];
  v1 = (void *)movieRental___type;
  movieRental___type = (uint64_t)v0;
}

void __27__VUIMediaEntityType_movie__block_invoke()
{
  id v0 = [[VUIMediaEntityType alloc] _initWithMediaItemCategoryType:0 isRental:0];
  v1 = (void *)movie___type;
  movie___type = (uint64_t)v0;
}

void __29__VUIMediaEntityType_episode__block_invoke()
{
  id v0 = [[VUIMediaEntityType alloc] _initWithMediaItemCategoryType:1 isRental:0];
  v1 = (void *)episode___type;
  episode___type = (uint64_t)v0;
}

- (id)_initWithMediaItemCategoryType:(unint64_t)a3 isRental:(BOOL)a4
{
  v7.receiver = self;
  v7.super_class = (Class)VUIMediaEntityType;
  id result = [(VUIMediaEntityType *)&v7 init];
  if (result)
  {
    *((void *)result + 2) = 0;
    *((void *)result + 3) = a3;
    *((unsigned char *)result + 8) = a4;
  }
  return result;
}

+ (id)homeVideo
{
  if (homeVideo___onceToken != -1) {
    dispatch_once(&homeVideo___onceToken, &__block_literal_global_4_1);
  }
  v2 = (void *)homeVideo___type;
  return v2;
}

void __31__VUIMediaEntityType_homeVideo__block_invoke()
{
  id v0 = [[VUIMediaEntityType alloc] _initWithMediaItemCategoryType:2 isRental:0];
  v1 = (void *)homeVideo___type;
  homeVideo___type = (uint64_t)v0;
}

+ (id)show
{
  if (show___onceToken != -1) {
    dispatch_once(&show___onceToken, &__block_literal_global_8_2);
  }
  v2 = (void *)show___type;
  return v2;
}

void __26__VUIMediaEntityType_show__block_invoke()
{
  id v0 = [[VUIMediaEntityType alloc] _initWithMediaCollectionType:2 mediaCategoryType:1];
  v1 = (void *)show___type;
  show___type = (uint64_t)v0;
}

+ (id)season
{
  if (season___onceToken != -1) {
    dispatch_once(&season___onceToken, &__block_literal_global_10_0);
  }
  v2 = (void *)season___type;
  return v2;
}

void __28__VUIMediaEntityType_season__block_invoke()
{
  id v0 = [[VUIMediaEntityType alloc] _initWithMediaCollectionType:1 mediaCategoryType:1];
  v1 = (void *)season___type;
  season___type = (uint64_t)v0;
}

- (VUIMediaEntityType)init
{
  v3 = (void *)MEMORY[0x1E4F1CA00];
  uint64_t v4 = *MEMORY[0x1E4F1C3C8];
  v5 = NSStringFromSelector(a2);
  [v3 raise:v4, @"The %@ initializer is not available.", v5 format];

  return 0;
}

- (id)_initWithMediaCollectionType:(unint64_t)a3 mediaCategoryType:(unint64_t)a4
{
  if (!a3) {
    [MEMORY[0x1E4F1CA00] raise:*MEMORY[0x1E4F1C3C8] format:@"The mediaCollectionType argument cannot be VUIMediaCollectionTypeNone"];
  }
  v17.receiver = self;
  v17.super_class = (Class)VUIMediaEntityType;
  objc_super v7 = [(VUIMediaEntityType *)&v17 init];
  if (v7)
  {
    v8 = +[VUIMediaCategory mediaCatgeoryForType:a4];
    v9 = [v8 supportedMediaCollectionTypes];
    v10 = [MEMORY[0x1E4F28ED0] numberWithUnsignedInteger:a3];
    char v11 = [v9 containsObject:v10];

    if ((v11 & 1) == 0)
    {
      v12 = (void *)MEMORY[0x1E4F1CA00];
      uint64_t v13 = *MEMORY[0x1E4F1C3C8];
      v14 = VUIMediaCollectionTypeLogString(a3);
      v15 = VUIMediaCategoryTypeLogString(a4);
      [v12 raise:v13, @"The mediaCollectionType (%@) is not supported for the supplied mediaCategoryType (%@)", v14, v15 format];
    }
    v7->_subtype = 1;
    v7->_mediaCategoryType = a4;
    v7->_mediaCollectionType = a3;
  }
  return v7;
}

- (unint64_t)hash
{
  unint64_t v3 = [(VUIMediaEntityType *)self subtype];
  unint64_t v4 = v3 ^ (2 * [(VUIMediaEntityType *)self mediaCategoryType]);
  unint64_t v5 = v4 ^ (4 * [(VUIMediaEntityType *)self mediaCollectionType]);
  BOOL v6 = [(VUIMediaEntityType *)self isRental];
  uint64_t v7 = 8;
  if (!v6) {
    uint64_t v7 = 0;
  }
  return v5 ^ v7;
}

- (BOOL)isEqual:(id)a3
{
  unint64_t v4 = (VUIMediaEntityType *)a3;
  unint64_t v5 = v4;
  if (v4 == self)
  {
    LOBYTE(v11) = 1;
  }
  else if (v4 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    BOOL v6 = v5;
    unint64_t v7 = [(VUIMediaEntityType *)self subtype];
    if (v7 == [(VUIMediaEntityType *)v6 subtype]
      && (unint64_t v8 = [(VUIMediaEntityType *)self mediaCategoryType],
          v8 == [(VUIMediaEntityType *)v6 mediaCategoryType])
      && (unint64_t v9 = [(VUIMediaEntityType *)self mediaCollectionType],
          v9 == [(VUIMediaEntityType *)v6 mediaCollectionType]))
    {
      BOOL v10 = [(VUIMediaEntityType *)self isRental];
      BOOL v11 = v10 ^ [(VUIMediaEntityType *)v6 isRental] ^ 1;
    }
    else
    {
      LOBYTE(v11) = 0;
    }
  }
  else
  {
    LOBYTE(v11) = 0;
  }

  return v11;
}

- (id)stringDescription
{
  unint64_t v3 = +[VUIMediaEntityType movie];

  if (v3 == self)
  {
    unint64_t v9 = @"Movie";
  }
  else
  {
    unint64_t v4 = +[VUIMediaEntityType movieRental];

    if (v4 == self)
    {
      unint64_t v9 = @"MovieRental";
    }
    else
    {
      unint64_t v5 = +[VUIMediaEntityType show];

      if (v5 == self)
      {
        unint64_t v9 = @"TVShow";
      }
      else
      {
        BOOL v6 = +[VUIMediaEntityType season];

        if (v6 == self)
        {
          unint64_t v9 = @"Season";
        }
        else
        {
          unint64_t v7 = +[VUIMediaEntityType homeVideo];

          if (v7 == self)
          {
            unint64_t v9 = @"HomeVideo";
          }
          else
          {
            unint64_t v8 = +[VUIMediaEntityType episode];

            if (v8 == self)
            {
              unint64_t v9 = @"Episode";
            }
            else
            {
              unint64_t v9 = [(VUIMediaEntityType *)self description];
            }
          }
        }
      }
    }
  }
  return v9;
}

- (id)description
{
  id v3 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  v21.receiver = self;
  v21.super_class = (Class)VUIMediaEntityType;
  unint64_t v4 = [(VUIMediaEntityType *)&v21 description];
  [v3 addObject:v4];

  unint64_t v5 = NSString;
  BOOL v6 = VUIMediaEntitySubtypeLogString([(VUIMediaEntityType *)self subtype]);
  unint64_t v7 = [v5 stringWithFormat:@"%@=%@", @"subtype", v6];
  [v3 addObject:v7];

  unint64_t v8 = NSString;
  unint64_t v9 = VUIMediaCategoryTypeLogString([(VUIMediaEntityType *)self mediaCategoryType]);
  BOOL v10 = [v8 stringWithFormat:@"%@=%@", @"mediaCategoryType", v9];
  [v3 addObject:v10];

  BOOL v11 = NSString;
  v12 = VUIMediaCollectionTypeLogString([(VUIMediaEntityType *)self mediaCollectionType]);
  uint64_t v13 = [v11 stringWithFormat:@"%@=%@", @"mediaCollectionType", v12];
  [v3 addObject:v13];

  v14 = NSString;
  [(VUIMediaEntityType *)self isRental];
  v15 = VUIBoolLogString();
  v16 = [v14 stringWithFormat:@"%@=%@", @"isRental", v15];
  [v3 addObject:v16];

  objc_super v17 = NSString;
  v18 = [v3 componentsJoinedByString:@", "];
  v19 = [v17 stringWithFormat:@"<%@>", v18];

  return v19;
}

- (unint64_t)subtype
{
  return self->_subtype;
}

- (void)setSubtype:(unint64_t)a3
{
  self->_subtype = a3;
}

- (void)setMediaCategoryType:(unint64_t)a3
{
  self->_mediaCategoryType = a3;
}

- (unint64_t)mediaCollectionType
{
  return self->_mediaCollectionType;
}

- (void)setMediaCollectionType:(unint64_t)a3
{
  self->_mediaCollectionType = a3;
}

- (BOOL)isRental
{
  return self->_rental;
}

- (void)setRental:(BOOL)a3
{
  self->_rental = a3;
}

@end