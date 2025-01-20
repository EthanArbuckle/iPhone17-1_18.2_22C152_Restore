@interface TransitDirectionsListImageItem
- (TransitDirectionsListImageItem)initWithImage:(id)a3 instructions:(id)a4;
- (TransitDirectionsListImageItem)initWithImages:(id)a3 alternateImages:(id)a4 instructions:(id)a5;
- (TransitDirectionsListImageItem)initWithImages:(id)a3 instructions:(id)a4;
- (id)alternateImageSourceForStyle:(unint64_t)a3;
- (id)imageSourceForStyle:(unint64_t)a3;
@end

@implementation TransitDirectionsListImageItem

- (TransitDirectionsListImageItem)initWithImage:(id)a3 instructions:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = +[NSMutableDictionary dictionary];
  v9 = v8;
  if (v6) {
    [v8 setObject:v6 forKeyedSubscript:&off_1013AA8B8];
  }
  v10 = [(TransitDirectionsListImageItem *)self initWithImages:v9 instructions:v7];

  return v10;
}

- (TransitDirectionsListImageItem)initWithImages:(id)a3 instructions:(id)a4
{
  return [(TransitDirectionsListImageItem *)self initWithImages:a3 alternateImages:0 instructions:a4];
}

- (TransitDirectionsListImageItem)initWithImages:(id)a3 alternateImages:(id)a4 instructions:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  v17.receiver = self;
  v17.super_class = (Class)TransitDirectionsListImageItem;
  v10 = [(TransitDirectionsListItem *)&v17 initWithInstructions:a5];
  if (v10)
  {
    v11 = (NSDictionary *)[v8 copy];
    images = v10->_images;
    v10->_images = v11;

    v13 = (NSDictionary *)[v9 copy];
    alternateImages = v10->_alternateImages;
    v10->_alternateImages = v13;

    v15 = v10;
  }

  return v10;
}

- (id)imageSourceForStyle:(unint64_t)a3
{
  images = self->_images;
  id v6 = +[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:");
  id v7 = [(NSDictionary *)images objectForKeyedSubscript:v6];

  if (a3 && !v7)
  {
    id v7 = [(NSDictionary *)self->_images objectForKeyedSubscript:&off_1013AA8D0];
  }

  return v7;
}

- (id)alternateImageSourceForStyle:(unint64_t)a3
{
  alternateImages = self->_alternateImages;
  id v6 = +[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:");
  id v7 = [(NSDictionary *)alternateImages objectForKeyedSubscript:v6];

  if (a3 && !v7)
  {
    id v7 = [(NSDictionary *)self->_alternateImages objectForKeyedSubscript:&off_1013AA8D0];
  }

  return v7;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_alternateImages, 0);

  objc_storeStrong((id *)&self->_images, 0);
}

@end