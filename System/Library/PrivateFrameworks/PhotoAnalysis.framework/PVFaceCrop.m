@interface PVFaceCrop
- (CGSize)imageDimensions;
- (PVFaceCrop)initWithFaceCropData:(id)a3 originatingFace:(id)a4;
- (PVFaceCrop)initWithLocalIdentifier:(id)a3 faceCropData:(id)a4;
- (id)description;
- (id)faceCropData;
- (id)originatingFace;
- (signed)state;
- (void)setState:(signed __int16)a3;
@end

@implementation PVFaceCrop

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_originatingFace, 0);

  objc_storeStrong((id *)&self->_faceCropData, 0);
}

- (void)setState:(signed __int16)a3
{
  self->_state = a3;
}

- (signed)state
{
  return self->_state;
}

- (id)description
{
  v3 = (void *)MEMORY[0x1E4F28E78];
  v9.receiver = self;
  v9.super_class = (Class)PVFaceCrop;
  v4 = [(PVObject *)&v9 description];
  v5 = [v3 stringWithString:v4];

  objc_msgSend(v5, "appendFormat:", @"  state                  : %ld\n", -[PVFaceCrop state](self, "state"));
  originatingFace = self->_originatingFace;
  if (originatingFace)
  {
    v7 = [(PVObject *)originatingFace localIdentifier];
    [v5 appendFormat:@"  originating face       : %@\n", v7];
  }

  return v5;
}

- (CGSize)imageDimensions
{
  p_cachedImageDimensions = &self->_cachedImageDimensions;
  double width = self->_cachedImageDimensions.width;
  double height = self->_cachedImageDimensions.height;
  if (width == *MEMORY[0x1E4F1DB30] && height == *(double *)(MEMORY[0x1E4F1DB30] + 8))
  {
    v6 = [(PVFaceCrop *)self faceCropData];
    +[PVFaceCropUtils faceCropDimensionsFromFaceCrop:v6 error:0];
    p_cachedImageDimensions->double width = v7;
    p_cachedImageDimensions->double height = v8;

    double width = p_cachedImageDimensions->width;
    double height = p_cachedImageDimensions->height;
  }
  result.double height = height;
  result.double width = width;
  return result;
}

- (id)originatingFace
{
  return self->_originatingFace;
}

- (id)faceCropData
{
  return self->_faceCropData;
}

- (PVFaceCrop)initWithFaceCropData:(id)a3 originatingFace:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v13.receiver = self;
  v13.super_class = (Class)PVFaceCrop;
  CGFloat v8 = [(PVObject *)&v13 initWithLocalIdentifier:0];
  if (v8)
  {
    uint64_t v9 = [v6 copy];
    faceCropData = v8->_faceCropData;
    v8->_faceCropData = (NSData *)v9;

    objc_storeStrong((id *)&v8->_originatingFace, a4);
    v11 = v8;
  }

  return v8;
}

- (PVFaceCrop)initWithLocalIdentifier:(id)a3 faceCropData:(id)a4
{
  id v6 = a4;
  v12.receiver = self;
  v12.super_class = (Class)PVFaceCrop;
  id v7 = [(PVObject *)&v12 initWithLocalIdentifier:a3];
  if (v7)
  {
    uint64_t v8 = [v6 copy];
    faceCropData = v7->_faceCropData;
    v7->_faceCropData = (NSData *)v8;

    v10 = v7;
  }

  return v7;
}

@end