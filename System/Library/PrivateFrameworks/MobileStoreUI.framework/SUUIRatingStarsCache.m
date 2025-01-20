@interface SUUIRatingStarsCache
+ (id)cacheWithProperties:(int64_t)a3;
- (SUUIRatingStarsCache)initWithProperties:(int64_t)a3;
- (id)ratingStarsImageForRating:(double)a3;
@end

@implementation SUUIRatingStarsCache

- (SUUIRatingStarsCache)initWithProperties:(int64_t)a3
{
  char v3 = a3;
  v27.receiver = self;
  v27.super_class = (Class)SUUIRatingStarsCache;
  v4 = [(SUUIRatingStarsCache *)&v27 init];
  if (v4)
  {
    v5 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
    v6 = @"Small";
    if ((v3 & 1) == 0) {
      v6 = &stru_2704F8130;
    }
    if ((v3 & 4) != 0) {
      v7 = @"Large";
    }
    else {
      v7 = v6;
    }
    if ((v3 & 0x10) != 0) {
      v8 = @"Selected";
    }
    else {
      v8 = &stru_2704F8130;
    }
    v9 = (void *)[[NSString alloc] initWithFormat:@"%@StarEmpty%@", v7, v8];
    v10 = [MEMORY[0x263F827E8] imageNamed:v9 inBundle:v5];
    v11 = [MEMORY[0x263F825C8] systemOrangeColor];
    uint64_t v12 = [v10 _flatImageWithColor:v11];
    emptyStarImage = v4->_emptyStarImage;
    v4->_emptyStarImage = (UIImage *)v12;

    v14 = (void *)[[NSString alloc] initWithFormat:@"%@StarFull%@", v7, v8];
    v15 = [MEMORY[0x263F827E8] imageNamed:v14 inBundle:v5];
    v16 = [MEMORY[0x263F825C8] systemOrangeColor];
    uint64_t v17 = [v15 _flatImageWithColor:v16];
    filledStarImage = v4->_filledStarImage;
    v4->_filledStarImage = (UIImage *)v17;

    v19 = (void *)[[NSString alloc] initWithFormat:@"%@StarHalf%@", v7, v8];
    v20 = [MEMORY[0x263F827E8] imageNamed:v19 inBundle:v5];
    v21 = [MEMORY[0x263F825C8] systemOrangeColor];
    uint64_t v22 = [v20 _flatImageWithColor:v21];
    halfStarImage = v4->_halfStarImage;
    v4->_halfStarImage = (UIImage *)v22;

    v24 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x263EFF9A0]);
    cachedImages = v4->_cachedImages;
    v4->_cachedImages = v24;
  }
  return v4;
}

+ (id)cacheWithProperties:(int64_t)a3
{
  if (!cacheWithProperties__sCaches)
  {
    id v5 = objc_alloc_init(MEMORY[0x263EFF9A0]);
    v6 = (void *)cacheWithProperties__sCaches;
    cacheWithProperties__sCaches = (uint64_t)v5;
  }
  v7 = (void *)[objc_alloc(NSNumber) initWithInteger:a3];
  v8 = [(id)cacheWithProperties__sCaches objectForKey:v7];
  if (!v8)
  {
    v8 = (void *)[objc_alloc((Class)a1) initWithProperties:a3];
    [(id)cacheWithProperties__sCaches setObject:v8 forKey:v7];
  }

  return v8;
}

- (id)ratingStarsImageForRating:(double)a3
{
  float v4 = a3 * 10.0;
  uint64_t v5 = (uint64_t)rintf(v4);
  v6 = (void *)[objc_alloc(NSNumber) initWithInteger:v5];
  v7 = [(NSMutableDictionary *)self->_cachedImages objectForKey:v6];
  if (!v7)
  {
    [(UIImage *)self->_emptyStarImage size];
    double v9 = v8;
    double v11 = v10;
    [(UIImage *)self->_filledStarImage size];
    double v13 = v12;
    double v15 = v14;
    v16 = [MEMORY[0x263F82B60] mainScreen];
    [v16 scale];
    CGFloat v18 = v17;
    v28.width = v9 * 5.0;
    v28.height = v11;
    UIGraphicsBeginImageContextWithOptions(v28, 0, v18);

    double v19 = 0.0;
    unint64_t v20 = -2;
    do
    {
      -[UIImage drawInRect:](self->_emptyStarImage, "drawInRect:", v19, 0.0, v9, v11);
      double v19 = v9 + v19;
      v20 += 2;
    }
    while (v20 < 8);
    double v21 = 0.0;
    if (v5 >= 2)
    {
      for (uint64_t i = 2; i <= v5; i += 2)
      {
        -[UIImage drawInRect:](self->_filledStarImage, "drawInRect:", v21, 0.0, v13, v15);
        double v21 = v13 + v21;
      }
    }
    if ((v5 & 0x8000000000000001) == 1)
    {
      [(UIImage *)self->_halfStarImage size];
      -[UIImage drawInRect:](self->_halfStarImage, "drawInRect:", v21, 0.0, v23, v24);
    }
    v7 = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    if (v7) {
      [(NSMutableDictionary *)self->_cachedImages setObject:v7 forKey:v6];
    }
  }
  v25 = [v7 imageFlippedForRightToLeftLayoutDirection];

  return v25;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_halfStarImage, 0);
  objc_storeStrong((id *)&self->_filledStarImage, 0);
  objc_storeStrong((id *)&self->_emptyStarImage, 0);
  objc_storeStrong((id *)&self->_cachedImages, 0);
}

@end