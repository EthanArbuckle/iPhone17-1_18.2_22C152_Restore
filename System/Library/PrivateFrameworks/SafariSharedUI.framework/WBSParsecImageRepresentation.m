@interface WBSParsecImageRepresentation
- (WBSParsecImageRepresentation)initWithSFImage:(id)a3;
- (id)imageWithScaleFactor:(double)a3;
- (id)imageWithSession:(id)a3;
@end

@implementation WBSParsecImageRepresentation

- (WBSParsecImageRepresentation)initWithSFImage:(id)a3
{
  id v5 = a3;
  v10.receiver = self;
  v10.super_class = (Class)WBSParsecImageRepresentation;
  v6 = [(WBSParsecImageRepresentation *)&v10 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_sfImage, a3);
    v8 = v7;
  }

  return v7;
}

- (id)imageWithSession:(id)a3
{
  id v4 = a3;
  [v4 uiScale];
  id v5 = -[WBSParsecImageRepresentation imageWithScaleFactor:](self, "imageWithScaleFactor:");

  return v5;
}

- (id)imageWithScaleFactor:(double)a3
{
  image = self->_image;
  if (image) {
    id v4 = image;
  }
  return image;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sfImage, 0);
  objc_storeStrong((id *)&self->_image, 0);
}

@end