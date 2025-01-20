@interface _UICollectionViewOutlineCellDisclosureConfiguration
- (UIColor)disclosureColor;
- (UIImage)image;
- (_UICollectionViewOutlineCellDisclosureConfiguration)init;
- (_UICollectionViewOutlineCellDisclosureConfiguration)initWithImage:(id)a3 alignment:(int64_t)a4;
- (_UICollectionViewOutlineCellDisclosureConfiguration)initWithImage:(id)a3 alignment:(int64_t)a4 animationRotationAngle:(double)a5 disclosureColor:(id)a6 disclosureWasTappedHandler:(id)a7;
- (double)animationRotationAngle;
- (id)copyWithZone:(_NSZone *)a3;
- (int64_t)alignment;
- (void)setAlignment:(int64_t)a3;
- (void)setAnimationRotationAngle:(double)a3;
- (void)setDisclosureColor:(id)a3;
- (void)setImage:(id)a3;
@end

@implementation _UICollectionViewOutlineCellDisclosureConfiguration

- (_UICollectionViewOutlineCellDisclosureConfiguration)init
{
  v3 = +[UIImage systemImageNamed:@"chevron.forward"];
  v4 = [(_UICollectionViewOutlineCellDisclosureConfiguration *)self initWithImage:v3 alignment:2];

  return v4;
}

- (_UICollectionViewOutlineCellDisclosureConfiguration)initWithImage:(id)a3 alignment:(int64_t)a4
{
  return [(_UICollectionViewOutlineCellDisclosureConfiguration *)self initWithImage:a3 alignment:a4 animationRotationAngle:0 disclosureColor:0 disclosureWasTappedHandler:1.57079633];
}

- (_UICollectionViewOutlineCellDisclosureConfiguration)initWithImage:(id)a3 alignment:(int64_t)a4 animationRotationAngle:(double)a5 disclosureColor:(id)a6 disclosureWasTappedHandler:(id)a7
{
  id v13 = a3;
  id v14 = a6;
  id v15 = a7;
  v21.receiver = self;
  v21.super_class = (Class)_UICollectionViewOutlineCellDisclosureConfiguration;
  v16 = [(_UICollectionViewOutlineCellDisclosureConfiguration *)&v21 init];
  v17 = v16;
  if (v16)
  {
    objc_storeStrong((id *)&v16->_image, a3);
    v17->_alignment = a4;
    v17->_animationRotationAngle = a5;
    objc_storeStrong((id *)&v17->_disclosureColor, a6);
    uint64_t v18 = [v15 copy];
    id disclosureWasTappedHandler = v17->_disclosureWasTappedHandler;
    v17->_id disclosureWasTappedHandler = (id)v18;
  }
  return v17;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v4 = (void *)[(id)objc_opt_class() allocWithZone:a3];
  image = self->_image;
  int64_t alignment = self->_alignment;
  double animationRotationAngle = self->_animationRotationAngle;
  disclosureColor = self->_disclosureColor;
  id disclosureWasTappedHandler = self->_disclosureWasTappedHandler;
  return (id)[v4 initWithImage:image alignment:alignment animationRotationAngle:disclosureColor disclosureColor:disclosureWasTappedHandler disclosureWasTappedHandler:animationRotationAngle];
}

- (UIImage)image
{
  return self->_image;
}

- (void)setImage:(id)a3
{
}

- (int64_t)alignment
{
  return self->_alignment;
}

- (void)setAlignment:(int64_t)a3
{
  self->_int64_t alignment = a3;
}

- (double)animationRotationAngle
{
  return self->_animationRotationAngle;
}

- (void)setAnimationRotationAngle:(double)a3
{
  self->_double animationRotationAngle = a3;
}

- (UIColor)disclosureColor
{
  return self->_disclosureColor;
}

- (void)setDisclosureColor:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_disclosureColor, 0);
  objc_storeStrong((id *)&self->_image, 0);
  objc_storeStrong(&self->_disclosureWasTappedHandler, 0);
}

@end