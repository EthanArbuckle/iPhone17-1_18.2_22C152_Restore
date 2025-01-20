@interface SKUIRatingStarsCache
+ (id)cacheWithProperties:(int64_t)a3;
- (SKUIRatingStarsCache)initWithProperties:(int64_t)a3;
- (id)ratingStarsImageForRating:(double)a3;
@end

@implementation SKUIRatingStarsCache

- (SKUIRatingStarsCache)initWithProperties:(int64_t)a3
{
  char v3 = a3;
  if (os_variant_has_internal_content()
    && _os_feature_enabled_impl()
    && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEBUG))
  {
    -[SKUIRatingStarsCache initWithProperties:]();
  }
  v28.receiver = self;
  v28.super_class = (Class)SKUIRatingStarsCache;
  v5 = [(SKUIRatingStarsCache *)&v28 init];
  if (v5)
  {
    v6 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
    v7 = @"Small";
    if ((v3 & 1) == 0) {
      v7 = &stru_1F1C879E8;
    }
    if ((v3 & 4) != 0) {
      v8 = @"Large";
    }
    else {
      v8 = v7;
    }
    if ((v3 & 0x10) != 0) {
      v9 = @"Selected";
    }
    else {
      v9 = &stru_1F1C879E8;
    }
    v10 = (void *)[[NSString alloc] initWithFormat:@"%@StarEmpty%@", v8, v9];
    v11 = [MEMORY[0x1E4FB1818] imageNamed:v10 inBundle:v6];
    v12 = [MEMORY[0x1E4FB1618] systemOrangeColor];
    uint64_t v13 = [v11 _flatImageWithColor:v12];
    emptyStarImage = v5->_emptyStarImage;
    v5->_emptyStarImage = (UIImage *)v13;

    v15 = (void *)[[NSString alloc] initWithFormat:@"%@StarFull%@", v8, v9];
    v16 = [MEMORY[0x1E4FB1818] imageNamed:v15 inBundle:v6];
    v17 = [MEMORY[0x1E4FB1618] systemOrangeColor];
    uint64_t v18 = [v16 _flatImageWithColor:v17];
    filledStarImage = v5->_filledStarImage;
    v5->_filledStarImage = (UIImage *)v18;

    v20 = (void *)[[NSString alloc] initWithFormat:@"%@StarHalf%@", v8, v9];
    v21 = [MEMORY[0x1E4FB1818] imageNamed:v20 inBundle:v6];
    v22 = [MEMORY[0x1E4FB1618] systemOrangeColor];
    uint64_t v23 = [v21 _flatImageWithColor:v22];
    halfStarImage = v5->_halfStarImage;
    v5->_halfStarImage = (UIImage *)v23;

    v25 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    cachedImages = v5->_cachedImages;
    v5->_cachedImages = v25;
  }
  return v5;
}

+ (id)cacheWithProperties:(int64_t)a3
{
  if (os_variant_has_internal_content()
    && _os_feature_enabled_impl()
    && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEBUG))
  {
    +[SKUIRatingStarsCache cacheWithProperties:]();
  }
  if (!cacheWithProperties__sCaches)
  {
    id v5 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
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
    v16 = [MEMORY[0x1E4FB1BA8] mainScreen];
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

- (void)initWithProperties:.cold.1()
{
  uint64_t v2 = *MEMORY[0x1E4F143B8];
  int v0 = 136446210;
  v1 = "-[SKUIRatingStarsCache initWithProperties:]";
}

+ (void)cacheWithProperties:.cold.1()
{
  uint64_t v2 = *MEMORY[0x1E4F143B8];
  int v0 = 136446210;
  v1 = "+[SKUIRatingStarsCache cacheWithProperties:]";
}

@end