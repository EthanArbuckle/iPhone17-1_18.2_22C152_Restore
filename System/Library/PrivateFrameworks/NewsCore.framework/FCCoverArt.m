@interface FCCoverArt
- (FCCoverArt)initWithJSONData:(id)a3;
- (FCCoverArt)initWithJSONString:(id)a3;
- (NSArray)images;
@end

@implementation FCCoverArt

- (void).cxx_destruct
{
}

- (FCCoverArt)initWithJSONString:(id)a3
{
  v4 = [a3 dataUsingEncoding:4];
  v5 = [(FCCoverArt *)self initWithJSONData:v4];

  return v5;
}

- (FCCoverArt)initWithJSONData:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    id v14 = 0;
    v5 = [MEMORY[0x1E4F28D90] JSONObjectWithData:v4 options:0 error:&v14];
    id v6 = v14;
    if (v6 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
    {

      v11 = 0;
      v5 = v6;
    }
    else
    {
      v13.receiver = self;
      v13.super_class = (Class)FCCoverArt;
      v7 = [(FCCoverArt *)&v13 init];
      if (v7)
      {
        v8 = [v5 objectForKeyedSubscript:@"coverArt"];
        uint64_t v9 = FCCoverArtImagesFromUnprocessedImages(v8);
        images = v7->_images;
        v7->_images = (NSArray *)v9;
      }
      self = v7;
      v11 = self;
    }
  }
  else
  {
    v11 = 0;
  }

  return v11;
}

- (NSArray)images
{
  return self->_images;
}

@end