@interface PVFaceCropSourceDescriptor
+ (id)descriptorForFace:(id)a3 image:(id)a4;
- (PVFaceCropSourceDescriptor)initWithFace:(id)a3 image:(id)a4;
- (id)description;
- (id)face;
- (id)image;
@end

@implementation PVFaceCropSourceDescriptor

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_image, 0);

  objc_storeStrong((id *)&self->_face, 0);
}

- (id)description
{
  v3 = NSString;
  v7.receiver = self;
  v7.super_class = (Class)PVFaceCropSourceDescriptor;
  v4 = [(PVFaceCropSourceDescriptor *)&v7 description];
  v5 = [v3 stringWithFormat:@"%@ (face=%@ image=%@)", v4, self->_face, self->_image];

  return v5;
}

- (id)image
{
  return self->_image;
}

- (id)face
{
  return self->_face;
}

- (PVFaceCropSourceDescriptor)initWithFace:(id)a3 image:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v13.receiver = self;
  v13.super_class = (Class)PVFaceCropSourceDescriptor;
  v9 = [(PVFaceCropSourceDescriptor *)&v13 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_face, a3);
    objc_storeStrong((id *)&v10->_image, a4);
    v11 = v10;
  }

  return v10;
}

+ (id)descriptorForFace:(id)a3 image:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = (void *)[objc_alloc((Class)a1) initWithFace:v7 image:v6];

  return v8;
}

@end