@interface BSUISeriesStackImageBoxLayout
- (id)_newImageResourcesWithContext:(id)a3;
- (id)newRenderModelCompatibleWithKind:(unint64_t)a3 context:(id)a4;
- (void)computeLayout;
@end

@implementation BSUISeriesStackImageBoxLayout

- (void)computeLayout
{
  [(BSUISeriesStackImageBoxLayout *)self computeWidth];
  double v4 = v3;
  objc_opt_class();
  v5 = [(BSUISeriesStackImageBoxLayout *)self box];
  v6 = TUIDynamicCast();

  v7 = [v6 filter];
  v8 = v7;
  if (v7)
  {
    id v9 = v7;
  }
  else
  {
    v10 = [v6 resourceOptions];
    id v9 = [v10 objectForKeyedSubscript:@"filter"];
  }
  if ([v9 isEqualToString:BCUCoverEffectsIdentifierSeriesStackHorizontal])
  {
    if (v4 <= 50.0) {
      double v11 = 26.0;
    }
    else {
      double v11 = 52.0;
    }
    if (v4 <= 50.0) {
      double v12 = 50.0;
    }
    else {
      double v12 = 97.0;
    }
    v13 = [v6 coverURLStrings];
    v14 = (char *)[v13 count];

    if (v14 == (unsigned char *)&dword_0 + 1) {
      double v15 = v11;
    }
    else {
      double v15 = v12;
    }
    double width = fmax(v15, v4);
    double v17 = width;
    if (v14 != (unsigned char *)&dword_0 + 1) {
      double v17 = v11 / v12 * width;
    }
    float v18 = COERCE_FLOAT([v6 intrinsicHeight]);
    LODWORD(v19) = [v6 intrinsicWidth];
    if (v18 <= 0.0 || (*(float *)&double v20 = v19, v19 <= 0.0)) {
      [v6 maxAspectRatio:v20];
    }
    else {
      double v21 = v18 / v19;
    }
    double v30 = v17 * v21;
    double v31 = 40.0;
    if (v4 > 50.0) {
      double v31 = 81.0;
    }
    double height = fmin(v31, v30);
  }
  else
  {
    if ([v9 isEqualToString:BCUCoverEffectsIdentifierSeriesStackDiagonal])
    {
      double width = fmax(v4, 69.0);
      v22 = +[BCCacheManager defaultCacheManager];
      v23 = [v6 resourceInstance];
      v24 = [v22 metadataForIdentifier:v23];

      if (v24)
      {
        v25 = [v24 intrinsicAspectRatio];
        [v25 floatValue];
        if (v26 <= 0.0)
        {
          [v6 maxAspectRatio];
          double v29 = v34;
        }
        else
        {
          v27 = [v24 intrinsicAspectRatio];
          [v27 floatValue];
          double v29 = v28;
        }
      }
      else
      {
        [v6 maxAspectRatio];
        double v29 = v33;
      }
      double height = fmax(width * v29, 1.0);
    }
    else
    {
      v24 = BSUITemplateLog();
      if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR)) {
        sub_2DDA38((uint64_t)v9, v24);
      }
      double width = CGSizeZero.width;
      double height = CGSizeZero.height;
    }
  }
  -[BSUISeriesStackImageBoxLayout setComputedNaturalSize:](self, "setComputedNaturalSize:", width, height);
}

- (id)newRenderModelCompatibleWithKind:(unint64_t)a3 context:(id)a4
{
  id v5 = a4;
  id v31 = [(BSUISeriesStackImageBoxLayout *)self _newImageResourcesWithContext:v5];
  objc_opt_class();
  v6 = [(BSUISeriesStackImageBoxLayout *)self box];
  v7 = TUIDynamicCast();

  [v7 cornerRadius];
  double v9 = v8;
  v10 = [v7 fallbackColor];
  double v11 = [v7 contentsGravity];
  [v7 opacity];
  double v13 = v12;
  id v14 = [v7 crossfadesContents];
  double v15 = [BSUISeriesStackImageLayerConfig alloc];
  [v5 contentsScale];
  double v17 = v16;
  unsigned __int8 v18 = [v7 continuousCorners];
  unsigned __int8 v19 = [v7 shouldRasterize];
  double v20 = [v7 blendMode];
  BYTE1(v30) = v19;
  LOBYTE(v30) = v18;
  double v21 = -[BSUISeriesStackImageLayerConfig initWithContentsScale:resource:load:cornerRadius:fallbackColor:contentsGravity:hflip:crossfadesContents:opacity:continuousCorners:shouldRasterize:blendMode:](v15, "initWithContentsScale:resource:load:cornerRadius:fallbackColor:contentsGravity:hflip:crossfadesContents:opacity:continuousCorners:shouldRasterize:blendMode:", v31, 2, v10, v11, 0, v14, v17, v9, v13, v30, v20);

  id v22 = [objc_alloc((Class)TUIRenderModelLayer) initWithSubmodels:0 config:v21 erasableInsets:UIEdgeInsetsZero.top, UIEdgeInsetsZero.left, UIEdgeInsetsZero.bottom, UIEdgeInsetsZero.right];
  [(BSUISeriesStackImageBoxLayout *)self renderModelSizeWithContext:v5];
  double v24 = v23;
  double v26 = v25;

  [v22 setSize:v24, v26];
  v27 = [v7 identifier];
  [v22 setIdentifier:v27];

  id v28 = v22;
  return v28;
}

- (id)_newImageResourcesWithContext:(id)a3
{
  id v4 = a3;
  [(BSUISeriesStackImageBoxLayout *)self renderModelSizeWithContext:v4];
  double v6 = v5;
  double v8 = v7;
  [v4 contentsScale];
  double v10 = v9;
  double v11 = (char *)[(BSUISeriesStackImageBoxLayout *)self computedLayoutDirection];
  double v12 = [(BSUISeriesStackImageBoxLayout *)self controller];
  double v13 = [v12 manager];
  id v14 = [v13 imageResourceCache];

  objc_opt_class();
  double v15 = [(BSUISeriesStackImageBoxLayout *)self box];
  double v16 = TUIDynamicCast();

  double v17 = [v16 coverURLStrings];

  if (v17)
  {
    v51 = v11;
    id v52 = v4;
    unsigned __int8 v18 = [v16 coverURLStrings];
    unsigned __int8 v19 = +[NSMutableArray arrayWithCapacity:](NSMutableArray, "arrayWithCapacity:", [v18 count]);

    long long v55 = 0u;
    long long v56 = 0u;
    long long v53 = 0u;
    long long v54 = 0u;
    double v20 = [v16 coverURLStrings];
    id v21 = [v20 countByEnumeratingWithState:&v53 objects:v57 count:16];
    if (v21)
    {
      id v4 = v21;
      uint64_t v22 = *(void *)v54;
      do
      {
        for (i = 0; i != v4; i = (char *)i + 1)
        {
          if (*(void *)v54 != v22) {
            objc_enumerationMutation(v20);
          }
          uint64_t v24 = *(void *)(*((void *)&v53 + 1) + 8 * i);
          double v25 = [v16 baseURL];
          double v26 = [v14 imageResourceForTemplatedURL:v24 baseURL:v25 naturalSize:v8 contentsScale:v8];
          [v19 addObject:v26];
        }
        id v4 = [v20 countByEnumeratingWithState:&v53 objects:v57 count:16];
      }
      while (v4);
    }

    v27 = [v16 coverURLStrings];
    if ([v27 count] == (char *)&dword_0 + 1)
    {
      id v4 = [v16 coverFilters];
      id v28 = (char *)[v4 count];

      if (v28 == (unsigned char *)&dword_0 + 1)
      {
        double v29 = [v16 coverURLStrings];
        uint64_t v30 = [v29 objectAtIndexedSubscript:0];
        id v31 = [v16 baseURL];
        v32 = [v14 imageResourceForTemplatedURL:v30 baseURL:v31 naturalSize:v8 contentsScale:v8];

        id v33 = [v16 coverFilters];
        double v34 = [v33 objectAtIndexedSubscript:0];
        v35 = [v14 imageResource:v32 naturalSize:v34 contentsScale:&__NSDictionary0__struct withFilter:v8 filterOptions:v8];
LABEL_17:

LABEL_25:
        id v4 = v52;
        goto LABEL_26;
      }
    }
    else
    {
    }
    if (v51 == (unsigned char *)&dword_0 + 2
      && ([v16 filter],
          id v4 = (id)objc_claimAutoreleasedReturnValue(),
          [v4 isEqualToString:BCUCoverEffectsIdentifierSeriesStackHorizontal]))
    {
      id v33 = BCUCoverEffectsIdentifierSeriesStackHorizontalRTL;
    }
    else
    {
      id v33 = [v16 filter];
      if (v51 != (unsigned char *)&dword_0 + 2)
      {
LABEL_24:
        double v34 = [v16 coverFilters];
        v35 = [v14 imageResourceForImageResources:v19 filters:v34 imageSetFilter:v33 naturalSize:v6 contentsScale:v8];
        goto LABEL_25;
      }
    }

    goto LABEL_24;
  }
  v36 = [(BSUISeriesStackImageBoxLayout *)self box];
  v37 = [v36 resourceKind];

  if (v37)
  {
    id v52 = v4;
    objc_opt_class();
    v38 = [(BSUISeriesStackImageBoxLayout *)self box];
    v39 = [v38 resourceOptions];
    unsigned __int8 v19 = BUDynamicCast();

    if (v11 == (unsigned char *)&dword_0 + 2)
    {
      v40 = [v19 objectForKeyedSubscript:@"filter"];
      unsigned int v41 = [v40 isEqualToString:BCUCoverEffectsIdentifierSeriesStackHorizontal];

      if (v41)
      {
        id v42 = [v19 mutableCopy];
        [v42 setObject:BCUCoverEffectsIdentifierSeriesStackHorizontalRTL forKeyedSubscript:@"filter"];
        id v43 = [v42 copy];

        unsigned __int8 v19 = v43;
      }
    }
    id v33 = [(BSUISeriesStackImageBoxLayout *)self controller];
    double v34 = [(BSUISeriesStackImageBoxLayout *)self box];
    v32 = [v34 resourceKind];
    v44 = [(BSUISeriesStackImageBoxLayout *)self box];
    v45 = [v44 resourceInstance];
    v35 = [v33 imageResourceForKind:v32 naturalSize:v45 contentsScale:v19 instance:v6 options:v8 v10];

    goto LABEL_17;
  }
  v35 = 0;
LABEL_26:
  v46 = [(BSUISeriesStackImageBoxLayout *)self box];
  v47 = [v46 maskColor];

  if (v47)
  {
    v48 = [v16 maskColor];
    uint64_t v49 = [v14 imageResource:v35 tintedWithColor:v48];

    v35 = (void *)v49;
  }

  return v35;
}

@end