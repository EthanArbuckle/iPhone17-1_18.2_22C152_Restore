@interface SVImageLayer
- (NSString)identifier;
- (UIImage)image;
- (void)setIdentifier:(id)a3;
- (void)setImage:(id)a3;
@end

@implementation SVImageLayer

- (void)setImage:(id)a3
{
  objc_storeStrong((id *)&self->_image, a3);
  id v6 = a3;
  -[SVImageLayer setContents:](self, "setContents:", [v6 CGImage]);
  if (v6) {
    identifier = self->_identifier;
  }
  else {
    identifier = 0;
  }
  objc_storeStrong((id *)&self->_identifier, identifier);
}

- (UIImage)image
{
  return self->_image;
}

- (NSString)identifier
{
  return self->_identifier;
}

- (void)setIdentifier:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_identifier, 0);

  objc_storeStrong((id *)&self->_image, 0);
}

@end