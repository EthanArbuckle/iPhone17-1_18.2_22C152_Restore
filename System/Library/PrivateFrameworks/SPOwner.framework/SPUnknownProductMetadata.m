@interface SPUnknownProductMetadata
+ (BOOL)supportsSecureCoding;
- (NSArray)moreDescription;
- (NSString)title;
- (NSURL)image;
- (NSURL)image2x;
- (NSURL)image3x;
- (SPUnknownProductMetadata)initWithCoder:(id)a3;
- (SPUnknownProductMetadata)initWithTitle:(id)a3 description:(id)a4 percentageX:(double)a5 percentageY:(double)a6 image:(id)a7 image2x:(id)a8 image3x:(id)a9;
- (double)percentageX;
- (double)percentageY;
- (id)copyWithZone:(_NSZone *)a3;
- (id)debugDescription;
- (void)encodeWithCoder:(id)a3;
- (void)setImage2x:(id)a3;
- (void)setImage3x:(id)a3;
- (void)setImage:(id)a3;
- (void)setMoreDescription:(id)a3;
- (void)setPercentageX:(double)a3;
- (void)setPercentageY:(double)a3;
- (void)setTitle:(id)a3;
@end

@implementation SPUnknownProductMetadata

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v4 = [SPUnknownProductMetadata alloc];
  v5 = [(SPUnknownProductMetadata *)self title];
  v6 = [(SPUnknownProductMetadata *)self moreDescription];
  [(SPUnknownProductMetadata *)self percentageX];
  double v8 = v7;
  [(SPUnknownProductMetadata *)self percentageY];
  double v10 = v9;
  v11 = [(SPUnknownProductMetadata *)self image];
  v12 = [(SPUnknownProductMetadata *)self image2x];
  v13 = [(SPUnknownProductMetadata *)self image3x];
  v14 = [(SPUnknownProductMetadata *)v4 initWithTitle:v5 description:v6 percentageX:v11 percentageY:v12 image:v13 image2x:v8 image3x:v10];

  return v14;
}

- (SPUnknownProductMetadata)initWithTitle:(id)a3 description:(id)a4 percentageX:(double)a5 percentageY:(double)a6 image:(id)a7 image2x:(id)a8 image3x:(id)a9
{
  id v24 = a3;
  id v17 = a4;
  id v18 = a7;
  id v19 = a8;
  id v20 = a9;
  v25.receiver = self;
  v25.super_class = (Class)SPUnknownProductMetadata;
  v21 = [(SPUnknownProductMetadata *)&v25 init];
  v22 = v21;
  if (v21)
  {
    objc_storeStrong((id *)&v21->_title, a3);
    objc_storeStrong((id *)&v22->_moreDescription, a4);
    v22->_percentageX = a5;
    v22->_percentageY = a6;
    objc_storeStrong((id *)&v22->_image, a7);
    objc_storeStrong((id *)&v22->_image2x, a8);
    objc_storeStrong((id *)&v22->_image3x, a9);
  }

  return v22;
}

- (void)encodeWithCoder:(id)a3
{
  title = self->_title;
  id v5 = a3;
  [v5 encodeObject:title forKey:@"title"];
  [v5 encodeObject:self->_moreDescription forKey:@"moreDescription"];
  [v5 encodeDouble:@"percentageX" forKey:self->_percentageX];
  [v5 encodeDouble:@"percentageY" forKey:self->_percentageY];
  [v5 encodeObject:self->_image forKey:@"image"];
  [v5 encodeObject:self->_image2x forKey:@"image2x"];
  [v5 encodeObject:self->_image3x forKey:@"image3x"];
}

- (SPUnknownProductMetadata)initWithCoder:(id)a3
{
  v21[2] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"title"];
  title = self->_title;
  self->_title = v5;

  double v7 = (void *)MEMORY[0x1E4F1CAD0];
  v21[0] = objc_opt_class();
  v21[1] = objc_opt_class();
  double v8 = [MEMORY[0x1E4F1C978] arrayWithObjects:v21 count:2];
  double v9 = [v7 setWithArray:v8];
  double v10 = [v4 decodeObjectOfClasses:v9 forKey:@"moreDescription"];
  moreDescription = self->_moreDescription;
  self->_moreDescription = v10;

  [v4 decodeDoubleForKey:@"percentageX"];
  self->_percentageX = v12;
  [v4 decodeDoubleForKey:@"percentageY"];
  self->_percentageY = v13;
  v14 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"image"];
  image = self->_image;
  self->_image = v14;

  v16 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"image2x"];
  image2x = self->_image2x;
  self->_image2x = v16;

  id v18 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"image3x"];

  image3x = self->_image3x;
  self->_image3x = v18;

  return self;
}

- (id)debugDescription
{
  v3 = NSString;
  uint64_t v4 = objc_opt_class();
  [(SPUnknownProductMetadata *)self percentageX];
  uint64_t v6 = v5;
  [(SPUnknownProductMetadata *)self percentageY];
  return (id)[v3 stringWithFormat:@"<%@ %p: %.06f/%.06f>", v4, self, v6, v7];
}

- (NSString)title
{
  return self->_title;
}

- (void)setTitle:(id)a3
{
}

- (NSArray)moreDescription
{
  return self->_moreDescription;
}

- (void)setMoreDescription:(id)a3
{
}

- (double)percentageX
{
  return self->_percentageX;
}

- (void)setPercentageX:(double)a3
{
  self->_percentageX = a3;
}

- (double)percentageY
{
  return self->_percentageY;
}

- (void)setPercentageY:(double)a3
{
  self->_percentageY = a3;
}

- (NSURL)image
{
  return self->_image;
}

- (void)setImage:(id)a3
{
}

- (NSURL)image2x
{
  return self->_image2x;
}

- (void)setImage2x:(id)a3
{
}

- (NSURL)image3x
{
  return self->_image3x;
}

- (void)setImage3x:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_image3x, 0);
  objc_storeStrong((id *)&self->_image2x, 0);
  objc_storeStrong((id *)&self->_image, 0);
  objc_storeStrong((id *)&self->_moreDescription, 0);

  objc_storeStrong((id *)&self->_title, 0);
}

@end