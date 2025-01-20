@interface NavJunctionViewInfo
- (BOOL)isEqual:(id)a3;
- (NSArray)imagesData;
- (NSUUID)junctionViewId;
- (NavJunctionViewInfo)initWithGuidanceJunctionViewInfo:(id)a3;
- (UIImage)junctionViewDarkenedImage;
- (UIImage)junctionViewImage;
- (id)compositeImages:(id)a3;
- (id)description;
- (id)images;
@end

@implementation NavJunctionViewInfo

- (NavJunctionViewInfo)initWithGuidanceJunctionViewInfo:(id)a3
{
  id v4 = a3;
  v23.receiver = self;
  v23.super_class = (Class)NavJunctionViewInfo;
  v5 = [(NavJunctionViewInfo *)&v23 init];
  if (v5)
  {
    v6 = [v4 uniqueID];
    v7 = (NSUUID *)[v6 copy];
    junctionViewId = v5->_junctionViewId;
    v5->_junctionViewId = v7;

    v9 = objc_opt_new();
    long long v19 = 0u;
    long long v20 = 0u;
    long long v21 = 0u;
    long long v22 = 0u;
    v10 = [v4 images];
    id v11 = [v10 countByEnumeratingWithState:&v19 objects:v24 count:16];
    if (v11)
    {
      id v12 = v11;
      uint64_t v13 = *(void *)v20;
      do
      {
        v14 = 0;
        do
        {
          if (*(void *)v20 != v13) {
            objc_enumerationMutation(v10);
          }
          v15 = [*(id *)(*((void *)&v19 + 1) + 8 * (void)v14) imageData];
          if (v15) {
            [v9 addObject:v15];
          }

          v14 = (char *)v14 + 1;
        }
        while (v12 != v14);
        id v12 = [v10 countByEnumeratingWithState:&v19 objects:v24 count:16];
      }
      while (v12);
    }

    v16 = (NSArray *)[v9 copy];
    imagesData = v5->_imagesData;
    v5->_imagesData = v16;
  }
  return v5;
}

- (UIImage)junctionViewImage
{
  junctionViewImage = self->_junctionViewImage;
  if (!junctionViewImage)
  {
    id v4 = [(NavJunctionViewInfo *)self images];
    v5 = [(NavJunctionViewInfo *)self compositeImages:v4];
    v6 = self->_junctionViewImage;
    self->_junctionViewImage = v5;

    junctionViewImage = self->_junctionViewImage;
  }

  return junctionViewImage;
}

- (UIImage)junctionViewDarkenedImage
{
  junctionViewDarkenedImage = self->_junctionViewDarkenedImage;
  if (!junctionViewDarkenedImage)
  {
    id v4 = [(NavJunctionViewInfo *)self images];
    v5 = [v4 firstObject];
    v6 = +[UIColor blackColor];
    v7 = [v6 colorWithAlphaComponent:0.300000012];
    v8 = [v5 _maps_colorizedImageWithColor:v7];

    if (v8) {
      [v4 setObject:v8 atIndexedSubscript:0];
    }
    v9 = [(NavJunctionViewInfo *)self compositeImages:v4];
    v10 = self->_junctionViewDarkenedImage;
    self->_junctionViewDarkenedImage = v9;

    junctionViewDarkenedImage = self->_junctionViewDarkenedImage;
  }

  return junctionViewDarkenedImage;
}

- (id)images
{
  v3 = objc_opt_new();
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  id v4 = [(NavJunctionViewInfo *)self imagesData];
  id v5 = [v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v5)
  {
    id v6 = v5;
    uint64_t v7 = *(void *)v12;
    do
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(void *)v12 != v7) {
          objc_enumerationMutation(v4);
        }
        v9 = +[UIImage imageWithData:*(void *)(*((void *)&v11 + 1) + 8 * i)];
        [v3 addObject:v9];
      }
      id v6 = [v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v6);
  }

  return v3;
}

- (id)compositeImages:(id)a3
{
  id v3 = a3;
  if ([v3 count])
  {
    id v4 = [v3 firstObject];
    [v4 size];
    double v6 = v5;
    double v8 = v7;

    v23.width = v6;
    v23.height = v8;
    UIGraphicsBeginImageContextWithOptions(v23, 0, 1.0);
    long long v19 = 0u;
    long long v20 = 0u;
    long long v17 = 0u;
    long long v18 = 0u;
    id v9 = v3;
    id v10 = [v9 countByEnumeratingWithState:&v17 objects:v21 count:16];
    if (v10)
    {
      id v11 = v10;
      double y = CGPointZero.y;
      uint64_t v13 = *(void *)v18;
      do
      {
        for (i = 0; i != v11; i = (char *)i + 1)
        {
          if (*(void *)v18 != v13) {
            objc_enumerationMutation(v9);
          }
          [*(id *)(*((void *)&v17 + 1) + 8 * i) drawInRect:CGPointZero.x, y, v6, v8, (void)v17];
        }
        id v11 = [v9 countByEnumeratingWithState:&v17 objects:v21 count:16];
      }
      while (v11);
    }

    v15 = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
  }
  else
  {
    v15 = 0;
  }

  return v15;
}

- (id)description
{
  v9.receiver = self;
  v9.super_class = (Class)NavJunctionViewInfo;
  id v3 = [(NavJunctionViewInfo *)&v9 description];
  id v4 = +[NSMutableString stringWithFormat:@"%@\n", v3];

  double v5 = [(NavJunctionViewInfo *)self junctionViewId];
  [v4 appendFormat:@"ID: [%@]\n", v5];

  double v6 = [(NavJunctionViewInfo *)self junctionViewImage];
  [v4 appendFormat:@"image: %@", v6];

  id v7 = [v4 copy];

  return v7;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if ([v4 isMemberOfClass:objc_opt_class()])
  {
    double v5 = [(NavJunctionViewInfo *)self junctionViewId];
    double v6 = [v4 junctionViewId];
    unsigned __int8 v7 = [v5 isEqual:v6];
  }
  else
  {
    unsigned __int8 v7 = 0;
  }

  return v7;
}

- (NSUUID)junctionViewId
{
  return self->_junctionViewId;
}

- (NSArray)imagesData
{
  return self->_imagesData;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_imagesData, 0);
  objc_storeStrong((id *)&self->_junctionViewId, 0);
  objc_storeStrong((id *)&self->_junctionViewDarkenedImage, 0);

  objc_storeStrong((id *)&self->_junctionViewImage, 0);
}

@end