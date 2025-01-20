@interface NTKVideoPlayerArrayDataSource
+ (id)dataSourceForDevice:(id)a3 withFilenames:(id)a4;
+ (id)dataSourceForDevice:(id)a3 withPosterImage:(id)a4 andFilenames:(id)a5;
+ (id)dataSourceForDevice:(id)a3 withPosterImage:(id)a4 andListings:(id)a5;
+ (id)dataSourceForDevice:(id)a3 withPosterImage:(id)a4 order:(unint64_t)a5 andFilenames:(id)a6;
+ (id)dataSourceForDevice:(id)a3 withPosterImage:(id)a4 order:(unint64_t)a5 andListings:(id)a6;
+ (id)dataSourceForDevice:(id)a3 withPosterImage:(id)a4 order:(unint64_t)a5 endBehavior:(unint64_t)a6 andFilenames:(id)a7;
- (id)currentListing;
- (id)initForDevice:(id)a3 withListings:(id)a4;
- (unint64_t)order;
- (void)advanceToNextListing:(unint64_t)a3;
- (void)setOrder:(unint64_t)a3;
@end

@implementation NTKVideoPlayerArrayDataSource

+ (id)dataSourceForDevice:(id)a3 withFilenames:(id)a4
{
  return +[NTKVideoPlayerArrayDataSource dataSourceForDevice:a3 withPosterImage:0 andFilenames:a4];
}

+ (id)dataSourceForDevice:(id)a3 withPosterImage:(id)a4 andFilenames:(id)a5
{
  return +[NTKVideoPlayerArrayDataSource dataSourceForDevice:a3 withPosterImage:a4 order:0 andFilenames:a5];
}

+ (id)dataSourceForDevice:(id)a3 withPosterImage:(id)a4 order:(unint64_t)a5 andFilenames:(id)a6
{
  return +[NTKVideoPlayerArrayDataSource dataSourceForDevice:a3 withPosterImage:a4 order:a5 endBehavior:0 andFilenames:a6];
}

+ (id)dataSourceForDevice:(id)a3 withPosterImage:(id)a4 order:(unint64_t)a5 endBehavior:(unint64_t)a6 andFilenames:(id)a7
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  id v11 = a4;
  id v12 = a7;
  v13 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", objc_msgSend(v12, "count"));
  long long v23 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  id v14 = v12;
  uint64_t v15 = [v14 countByEnumeratingWithState:&v23 objects:v27 count:16];
  if (v15)
  {
    uint64_t v16 = v15;
    uint64_t v17 = *(void *)v24;
    do
    {
      for (uint64_t i = 0; i != v16; ++i)
      {
        if (*(void *)v24 != v17) {
          objc_enumerationMutation(v14);
        }
        v19 = +[NTKVideoPlayerListing listingForDevice:v10 withFilename:*(void *)(*((void *)&v23 + 1) + 8 * i)];
        [v19 setEndBehavior:a6];
        [v13 addObject:v19];
      }
      uint64_t v16 = [v14 countByEnumeratingWithState:&v23 objects:v27 count:16];
    }
    while (v16);
  }

  v20 = +[NTKVideoPlayerArrayDataSource dataSourceForDevice:v10 withPosterImage:v11 order:a5 andListings:v13];

  return v20;
}

+ (id)dataSourceForDevice:(id)a3 withPosterImage:(id)a4 andListings:(id)a5
{
  return (id)[a1 dataSourceForDevice:a3 withPosterImage:a4 order:0 andListings:a5];
}

+ (id)dataSourceForDevice:(id)a3 withPosterImage:(id)a4 order:(unint64_t)a5 andListings:(id)a6
{
  id v9 = a6;
  id v10 = a4;
  id v11 = a3;
  id v12 = [[NTKVideoPlayerArrayDataSource alloc] initForDevice:v11 withListings:v9];

  [v12 setPosterImage:v10];
  [v12 setOrder:a5];
  return v12;
}

- (id)initForDevice:(id)a3 withListings:(id)a4
{
  id v6 = a4;
  v10.receiver = self;
  v10.super_class = (Class)NTKVideoPlayerArrayDataSource;
  v7 = [(NTKVideoPlayerDataSource *)&v10 init];
  v8 = v7;
  if (v7)
  {
    v7->_currentListingIndex = -1;
    objc_storeStrong((id *)&v7->_listings, a4);
    v8->_order = 0;
  }

  return v8;
}

- (void)advanceToNextListing:(unint64_t)a3
{
  unint64_t order = self->_order;
  if (order == 1)
  {
    self->_currentListingIndex = (int)NTKRandomInt32InScope(0, [(NSArray *)self->_listings count] - 1);
  }
  else if (!order)
  {
    unint64_t v4 = self->_currentListingIndex + 1;
    self->_currentListingIndex = v4 % [(NSArray *)self->_listings count];
  }
}

- (id)currentListing
{
  if (self->_currentListingIndex == -1)
  {
    v3 = 0;
  }
  else
  {
    v3 = [(NSArray *)self->_listings count];
    if (v3)
    {
      v3 = [(NSArray *)self->_listings objectAtIndexedSubscript:self->_currentListingIndex];
    }
  }
  return v3;
}

- (unint64_t)order
{
  return self->_order;
}

- (void)setOrder:(unint64_t)a3
{
  self->_unint64_t order = a3;
}

- (void).cxx_destruct
{
}

@end