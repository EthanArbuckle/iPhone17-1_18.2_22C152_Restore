@interface TransitDirectionsListArtworkItem
- (BOOL)adaptiveShieldSize;
- (TransitDirectionsListArtworkItem)initWithArtwork:(id)a3 instructions:(id)a4;
- (TransitDirectionsListArtworkItem)initWithArtworks:(id)a3 alternateArtworks:(id)a4 instructions:(id)a5;
- (TransitDirectionsListArtworkItem)initWithArtworks:(id)a3 instructions:(id)a4;
- (id)alternateArtworkForStyle:(unint64_t)a3;
- (id)alternateImageSourceForStyle:(unint64_t)a3;
- (id)artworkForStyle:(unint64_t)a3;
- (id)sizedAlternateArtworkForStyle:(unint64_t)a3;
- (id)sizedArtworkForStyle:(unint64_t)a3;
- (int64_t)fallbackSize;
- (int64_t)initialAdaptiveSizeGroup;
- (int64_t)selectedSize;
- (void)setAdaptiveShieldSize:(BOOL)a3;
- (void)setFallbackSize:(int64_t)a3;
- (void)setInitialAdaptiveSizeGroup:(int64_t)a3;
- (void)setSelectedSize:(int64_t)a3;
@end

@implementation TransitDirectionsListArtworkItem

- (TransitDirectionsListArtworkItem)initWithArtwork:(id)a3 instructions:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = +[NSMutableDictionary dictionary];
  v9 = v8;
  if (v6) {
    [v8 setObject:v6 forKeyedSubscript:&off_1013AA8D0];
  }
  v10 = [(TransitDirectionsListArtworkItem *)self initWithArtworks:v9 instructions:v7];

  return v10;
}

- (TransitDirectionsListArtworkItem)initWithArtworks:(id)a3 instructions:(id)a4
{
  return [(TransitDirectionsListArtworkItem *)self initWithArtworks:a3 alternateArtworks:0 instructions:a4];
}

- (TransitDirectionsListArtworkItem)initWithArtworks:(id)a3 alternateArtworks:(id)a4 instructions:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  v17.receiver = self;
  v17.super_class = (Class)TransitDirectionsListArtworkItem;
  v10 = [(TransitDirectionsListItem *)&v17 initWithInstructions:a5];
  if (v10)
  {
    v11 = (NSDictionary *)[v8 copy];
    artworks = v10->_artworks;
    v10->_artworks = v11;

    v13 = (NSDictionary *)[v9 copy];
    alternateArtworks = v10->_alternateArtworks;
    v10->_alternateArtworks = v13;

    v10->_selectedSize = 7;
    v10->_fallbackSize = 8;
    v10->_adaptiveShieldSize = 1;
    v10->_initialAdaptiveSizeGroup = 7;
    v15 = v10;
  }

  return v10;
}

- (id)alternateImageSourceForStyle:(unint64_t)a3
{
  return [(TransitDirectionsListArtworkItem *)self sizedAlternateArtworkForStyle:a3];
}

- (id)sizedArtworkForStyle:(unint64_t)a3
{
  v4 = [(TransitDirectionsListArtworkItem *)self artworkForStyle:a3];
  id v5 = [objc_alloc((Class)MKSizedTransitArtwork) initWithArtwork:v4 selectedSize:[self selectedSize] fallbackSize:[self fallbackSize] artworkCache:0];

  return v5;
}

- (id)sizedAlternateArtworkForStyle:(unint64_t)a3
{
  v4 = [(TransitDirectionsListArtworkItem *)self alternateArtworkForStyle:a3];
  if (v4) {
    id v5 = [objc_alloc((Class)MKSizedTransitArtwork) initWithArtwork:v4 shieldSize:[self selectedSize] fallbackShieldSize:[self fallbackSize] artworkCache:0];
  }
  else {
    id v5 = 0;
  }

  return v5;
}

- (id)artworkForStyle:(unint64_t)a3
{
  artworks = self->_artworks;
  id v6 = +[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:");
  id v7 = [(NSDictionary *)artworks objectForKeyedSubscript:v6];

  if (a3 && !v7)
  {
    id v7 = [(NSDictionary *)self->_artworks objectForKeyedSubscript:&off_1013AA8D0];
  }

  return v7;
}

- (id)alternateArtworkForStyle:(unint64_t)a3
{
  alternateArtworks = self->_alternateArtworks;
  id v6 = +[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:");
  id v7 = [(NSDictionary *)alternateArtworks objectForKeyedSubscript:v6];

  if (a3 && !v7)
  {
    id v7 = [(NSDictionary *)self->_alternateArtworks objectForKeyedSubscript:&off_1013AA8D0];
  }

  return v7;
}

- (int64_t)selectedSize
{
  return self->_selectedSize;
}

- (void)setSelectedSize:(int64_t)a3
{
  self->_selectedSize = a3;
}

- (int64_t)fallbackSize
{
  return self->_fallbackSize;
}

- (void)setFallbackSize:(int64_t)a3
{
  self->_fallbackSize = a3;
}

- (BOOL)adaptiveShieldSize
{
  return self->_adaptiveShieldSize;
}

- (void)setAdaptiveShieldSize:(BOOL)a3
{
  self->_adaptiveShieldSize = a3;
}

- (int64_t)initialAdaptiveSizeGroup
{
  return self->_initialAdaptiveSizeGroup;
}

- (void)setInitialAdaptiveSizeGroup:(int64_t)a3
{
  self->_initialAdaptiveSizeGroup = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_alternateArtworks, 0);

  objc_storeStrong((id *)&self->_artworks, 0);
}

@end