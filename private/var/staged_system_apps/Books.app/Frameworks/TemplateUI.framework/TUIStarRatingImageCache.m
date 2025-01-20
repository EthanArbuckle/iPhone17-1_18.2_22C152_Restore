@interface TUIStarRatingImageCache
+ (id)sharedInstance;
- (NSCache)cache;
- (TUIStarRatingImageCache)init;
- (id)_cacheKeyFromRatingStarsImageName:(id)a3 starSize:(double)a4 starCount:(unint64_t)a5 starPadding:(double)a6 traitCollection:(id)a7;
- (id)_generateImageForRatingStarsImageName:(id)a3 starSize:(double)a4 starCount:(int64_t)a5 starPadding:(double)a6 traitCollection:(id)a7;
- (id)ratingStarsImageWithName:(id)a3 starSize:(double)a4 starCount:(unint64_t)a5 starPadding:(double)a6 traitCollection:(id)a7;
- (void)setCache:(id)a3;
@end

@implementation TUIStarRatingImageCache

+ (id)sharedInstance
{
  if (qword_2DF4A0 != -1) {
    dispatch_once(&qword_2DF4A0, &stru_253F30);
  }
  v2 = (void *)qword_2DF498;

  return v2;
}

- (TUIStarRatingImageCache)init
{
  v6.receiver = self;
  v6.super_class = (Class)TUIStarRatingImageCache;
  v2 = [(TUIStarRatingImageCache *)&v6 init];
  if (v2)
  {
    v3 = (NSCache *)objc_alloc_init((Class)NSCache);
    cache = v2->_cache;
    v2->_cache = v3;
  }
  return v2;
}

- (id)ratingStarsImageWithName:(id)a3 starSize:(double)a4 starCount:(unint64_t)a5 starPadding:(double)a6 traitCollection:(id)a7
{
  id v12 = a3;
  id v13 = a7;
  v14 = [(TUIStarRatingImageCache *)self _cacheKeyFromRatingStarsImageName:v12 starSize:a5 starCount:v13 starPadding:a4 traitCollection:a6];
  v15 = [(NSCache *)self->_cache objectForKey:v14];
  if (!v15)
  {
    v15 = [(TUIStarRatingImageCache *)self _generateImageForRatingStarsImageName:v12 starSize:a5 starCount:v13 starPadding:a4 traitCollection:a6];
    [(NSCache *)self->_cache setObject:v15 forKey:v14];
  }

  return v15;
}

- (id)_cacheKeyFromRatingStarsImageName:(id)a3 starSize:(double)a4 starCount:(unint64_t)a5 starPadding:(double)a6 traitCollection:(id)a7
{
  id v11 = a3;
  [a7 displayScale];
  id v13 = +[NSString stringWithFormat:@"img%@-starSize%f-starCount%lu-starPadding%f-contentsScale%f", v11, *(void *)&a4, a5, *(void *)&a6, v12];

  return v13;
}

- (id)_generateImageForRatingStarsImageName:(id)a3 starSize:(double)a4 starCount:(int64_t)a5 starPadding:(double)a6 traitCollection:(id)a7
{
  id v11 = a7;
  id v12 = a3;
  if (UIAccessibilityIsBoldTextEnabled()) {
    +[UIImageSymbolConfiguration configurationWithPointSize:7 weight:a4];
  }
  else {
  id v13 = +[UIImageSymbolConfiguration configurationWithPointSize:a4];
  }
  v14 = +[UIImage systemImageNamed:v12];

  v15 = [v14 imageWithConfiguration:v13];

  if (v15)
  {
    [v15 size];
    double v17 = v16;
    double v19 = v18;
    [v15 contentInsets];
    double v21 = v20;
    double v23 = v22;
    double v25 = v24;
    double v27 = v26;
    double v28 = v17 - v22 - v26;
    double v29 = v19 - v20 - v24;
    id v30 = objc_alloc((Class)UIGraphicsImageRenderer);
    v31 = +[UIGraphicsImageRendererFormat formatForTraitCollection:v11];
    id v32 = [v30 initWithSize:ceil((double)(a5 - 1) * a6 + v28 * (double)a5) format:v29];

    v36[0] = _NSConcreteStackBlock;
    v36[1] = 3221225472;
    v36[2] = sub_7E0AC;
    v36[3] = &unk_253F58;
    int64_t v38 = a5;
    id v37 = v15;
    double v39 = v21;
    double v40 = v23;
    double v41 = v25;
    double v42 = v27;
    double v43 = v28;
    double v44 = v29;
    double v45 = a6;
    v33 = [v32 imageWithActions:v36];
    v34 = [v33 imageWithRenderingMode:2];
  }
  else
  {
    v34 = 0;
  }

  return v34;
}

- (NSCache)cache
{
  return self->_cache;
}

- (void)setCache:(id)a3
{
}

- (void).cxx_destruct
{
}

@end