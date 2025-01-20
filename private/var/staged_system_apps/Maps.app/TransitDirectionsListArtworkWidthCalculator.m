@interface TransitDirectionsListArtworkWidthCalculator
- (ArtworkWidthCalculatorSizeParameter)sizeParameter;
- (NSArray)artworks;
- (TransitDirectionsListArtworkWidthCalculator)initWithSizedArtworks:(id)a3 sizeParameter:(ArtworkWidthCalculatorSizeParameter *)a4;
- (id)calculateArtworkViewWidthAndArtworkSizes:(double *)a3;
@end

@implementation TransitDirectionsListArtworkWidthCalculator

- (TransitDirectionsListArtworkWidthCalculator)initWithSizedArtworks:(id)a3 sizeParameter:(ArtworkWidthCalculatorSizeParameter *)a4
{
  id v6 = a3;
  v17.receiver = self;
  v17.super_class = (Class)TransitDirectionsListArtworkWidthCalculator;
  v7 = [(TransitDirectionsListArtworkWidthCalculator *)&v17 init];
  if (v7)
  {
    v8 = (NSArray *)[v6 copy];
    artworks = v7->_artworks;
    v7->_artworks = v8;

    double defaultArtworkViewWidth = a4->defaultArtworkViewWidth;
    double maxArtworkViewWidth = a4->maxArtworkViewWidth;
    if (a4->defaultArtworkViewWidth <= 0.0 || maxArtworkViewWidth < defaultArtworkViewWidth)
    {
      if (defaultArtworkViewWidth < 0.0)
      {
        a4->double defaultArtworkViewWidth = 50.0;
        double defaultArtworkViewWidth = 50.0;
      }
      if (maxArtworkViewWidth < defaultArtworkViewWidth) {
        a4->double maxArtworkViewWidth = defaultArtworkViewWidth;
      }
    }
    long long v13 = *(_OWORD *)&a4->defaultArtworkViewWidth;
    long long v14 = *(_OWORD *)&a4->artworkInsets.bottom;
    *(_OWORD *)&v7->_sizeParameter.artworkInsets.top = *(_OWORD *)&a4->artworkInsets.top;
    *(_OWORD *)&v7->_sizeParameter.artworkInsets.bottom = v14;
    *(_OWORD *)&v7->_sizeParameter.double defaultArtworkViewWidth = v13;
    v15 = v7;
  }

  return v7;
}

- (id)calculateArtworkViewWidthAndArtworkSizes:(double *)a3
{
  v5 = +[NSMapTable strongToStrongObjectsMapTable];
  id v6 = +[UIScreen mainScreen];
  [v6 scale];
  double v8 = v7;

  v38[0] = _NSConcreteStackBlock;
  v38[1] = 3221225472;
  v38[2] = sub_100DB3614;
  v38[3] = &unk_101323FE8;
  id v9 = v5;
  id v39 = v9;
  double v40 = v8;
  v10 = objc_retainBlock(v38);
  v11 = [(TransitDirectionsListArtworkWidthCalculator *)self artworks];
  id v12 = [v11 mutableCopy];

  v36 = v10;
  [v12 sortUsingComparator:v10];
  double defaultArtworkViewWidth = self->_sizeParameter.defaultArtworkViewWidth;
  uint64_t v14 = (uint64_t)[v12 count];
  uint64_t v15 = v14 - 1;
  if (v14 >= 1)
  {
    v35 = a3;
    id v16 = 0;
    while (1)
    {
      objc_super v17 = v16;
      v18 = [v12 objectAtIndexedSubscript:v15];
      uint64_t v19 = [v9 objectForKey:v18];
      v20 = (void *)v19;
      v21 = v19 ? (void *)v19 : v18;
      id v16 = v21;

      v22 = [v16 imageToDisplayWithScreenScale:0 nightMode:v8];
      [v22 size];
      double v24 = v23 + self->_sizeParameter.artworkInsets.left + self->_sizeParameter.artworkInsets.right;

      if (v24 <= self->_sizeParameter.defaultArtworkViewWidth) {
        break;
      }
      if (v24 <= self->_sizeParameter.maxArtworkViewWidth) {
        goto LABEL_14;
      }
      if ((uint64_t)[v16 shieldSize] < 1)
      {
        [v12 removeObjectAtIndex:v15--];
      }
      else
      {
        v25 = (char *)[v16 shieldSize] - 1;
        id v26 = objc_alloc((Class)MKSizedTransitArtwork);
        [v16 artwork];
        v27 = uint64_t v37 = v15;
        [v16 artworkCache];
        v28 = self;
        id v29 = v12;
        v31 = id v30 = v9;
        id v32 = [v26 initWithArtwork:v27 shieldSize:v25 artworkCache:v31];

        id v9 = v30;
        id v12 = v29;
        self = v28;

        uint64_t v15 = v37;
        [v9 setObject:v32 forKey:v18];
        [v12 sortUsingComparator:v36];
      }
      if (v15 < 0) {
        goto LABEL_15;
      }
    }
    double v24 = defaultArtworkViewWidth;
LABEL_14:

    double defaultArtworkViewWidth = v24;
LABEL_15:
    a3 = v35;
  }
  if (a3) {
    *a3 = defaultArtworkViewWidth;
  }
  id v33 = v9;

  return v33;
}

- (NSArray)artworks
{
  return self->_artworks;
}

- (ArtworkWidthCalculatorSizeParameter)sizeParameter
{
  long long v3 = *(_OWORD *)&self->artworkInsets.bottom;
  *(_OWORD *)&retstr->double defaultArtworkViewWidth = *(_OWORD *)&self->artworkInsets.top;
  *(_OWORD *)&retstr->artworkInsets.top = v3;
  *(_OWORD *)&retstr->artworkInsets.bottom = *(_OWORD *)&self[1].defaultArtworkViewWidth;
  return self;
}

- (void).cxx_destruct
{
}

@end