@interface PXSharedLibraryFaceTileImageProviderModel
- (BOOL)includeMeContact;
- (BOOL)isAscending;
- (BOOL)isRTL;
- (NSArray)faceTileCombinerItems;
- (PXSharedLibraryFaceTileImageProviderModel)init;
- (UIColor)backgroundColor;
- (UIColor)borderColor;
- (double)borderWidth;
- (double)displayScale;
- (double)imageDiameter;
- (double)imageOffset;
- (void)performChanges:(id)a3;
- (void)setBackgroundColor:(id)a3;
- (void)setBorderColor:(id)a3;
- (void)setBorderWidth:(double)a3;
- (void)setDisplayScale:(double)a3;
- (void)setFaceTileCombinerItems:(id)a3;
- (void)setImageDiameter:(double)a3;
- (void)setImageOffset:(double)a3;
- (void)setIncludeMeContact:(BOOL)a3;
- (void)setIsAscending:(BOOL)a3;
- (void)setIsRTL:(BOOL)a3;
@end

@implementation PXSharedLibraryFaceTileImageProviderModel

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_faceTileCombinerItems, 0);
  objc_storeStrong((id *)&self->_borderColor, 0);
  objc_storeStrong((id *)&self->_backgroundColor, 0);
}

- (NSArray)faceTileCombinerItems
{
  return self->_faceTileCombinerItems;
}

- (double)borderWidth
{
  return self->_borderWidth;
}

- (UIColor)borderColor
{
  return self->_borderColor;
}

- (UIColor)backgroundColor
{
  return self->_backgroundColor;
}

- (double)imageOffset
{
  return self->_imageOffset;
}

- (double)imageDiameter
{
  return self->_imageDiameter;
}

- (BOOL)isAscending
{
  return self->_isAscending;
}

- (BOOL)isRTL
{
  return self->_isRTL;
}

- (double)displayScale
{
  return self->_displayScale;
}

- (BOOL)includeMeContact
{
  return self->_includeMeContact;
}

- (void)setFaceTileCombinerItems:(id)a3
{
  v11 = (NSArray *)a3;
  if (!v11)
  {
    v10 = [MEMORY[0x1E4F28B00] currentHandler];
    [v10 handleFailureInMethod:a2, self, @"PXSharedLibraryFaceTileImageProviderModel.m", 123, @"Invalid parameter not satisfying: %@", @"faceTileCombinerItems" object file lineNumber description];
  }
  v5 = self->_faceTileCombinerItems;
  if (v5 == v11)
  {
  }
  else
  {
    v6 = v5;
    char v7 = [(NSArray *)v5 isEqual:v11];

    if ((v7 & 1) == 0)
    {
      v8 = (NSArray *)[(NSArray *)v11 copy];
      faceTileCombinerItems = self->_faceTileCombinerItems;
      self->_faceTileCombinerItems = v8;

      [(PXSharedLibraryFaceTileImageProviderModel *)self signalChange:512];
    }
  }
}

- (void)setBorderWidth:(double)a3
{
  if (a3 < 0.0)
  {
    v6 = [MEMORY[0x1E4F28B00] currentHandler];
    [v6 handleFailureInMethod:a2, self, @"PXSharedLibraryFaceTileImageProviderModel.m", 114, @"Invalid parameter not satisfying: %@", @"borderWidth >= 0" object file lineNumber description];
  }
  if (self->_borderWidth != a3)
  {
    self->_borderWidth = a3;
    [(PXSharedLibraryFaceTileImageProviderModel *)self signalChange:64];
  }
}

- (void)setBorderColor:(id)a3
{
  v11 = (UIColor *)a3;
  if (!v11)
  {
    v10 = [MEMORY[0x1E4F28B00] currentHandler];
    [v10 handleFailureInMethod:a2, self, @"PXSharedLibraryFaceTileImageProviderModel.m", 105, @"Invalid parameter not satisfying: %@", @"borderColor" object file lineNumber description];
  }
  v5 = self->_borderColor;
  if (v5 == v11)
  {
  }
  else
  {
    v6 = v5;
    char v7 = [(UIColor *)v5 isEqual:v11];

    if ((v7 & 1) == 0)
    {
      v8 = (UIColor *)[(UIColor *)v11 copy];
      borderColor = self->_borderColor;
      self->_borderColor = v8;

      [(PXSharedLibraryFaceTileImageProviderModel *)self signalChange:256];
    }
  }
}

- (void)setBackgroundColor:(id)a3
{
  v11 = (UIColor *)a3;
  if (!v11)
  {
    v10 = [MEMORY[0x1E4F28B00] currentHandler];
    [v10 handleFailureInMethod:a2, self, @"PXSharedLibraryFaceTileImageProviderModel.m", 96, @"Invalid parameter not satisfying: %@", @"backgroundColor" object file lineNumber description];
  }
  v5 = self->_backgroundColor;
  if (v5 == v11)
  {
  }
  else
  {
    v6 = v5;
    char v7 = [(UIColor *)v5 isEqual:v11];

    if ((v7 & 1) == 0)
    {
      v8 = (UIColor *)[(UIColor *)v11 copy];
      backgroundColor = self->_backgroundColor;
      self->_backgroundColor = v8;

      [(PXSharedLibraryFaceTileImageProviderModel *)self signalChange:128];
    }
  }
}

- (void)setImageOffset:(double)a3
{
  if (self->_imageOffset != a3)
  {
    self->_imageOffset = a3;
    [(PXSharedLibraryFaceTileImageProviderModel *)self signalChange:32];
  }
}

- (void)setImageDiameter:(double)a3
{
  if (a3 <= 0.0)
  {
    v6 = [MEMORY[0x1E4F28B00] currentHandler];
    [v6 handleFailureInMethod:a2, self, @"PXSharedLibraryFaceTileImageProviderModel.m", 79, @"Invalid parameter not satisfying: %@", @"imageDiameter > 0" object file lineNumber description];
  }
  if (self->_imageDiameter != a3)
  {
    self->_imageDiameter = a3;
    [(PXSharedLibraryFaceTileImageProviderModel *)self signalChange:16];
  }
}

- (void)setIsAscending:(BOOL)a3
{
  if (self->_isAscending != a3)
  {
    self->_isAscending = a3;
    [(PXSharedLibraryFaceTileImageProviderModel *)self signalChange:8];
  }
}

- (void)setIsRTL:(BOOL)a3
{
  if (self->_isRTL != a3)
  {
    self->_isRTL = a3;
    [(PXSharedLibraryFaceTileImageProviderModel *)self signalChange:4];
  }
}

- (void)setDisplayScale:(double)a3
{
  if (a3 <= 0.0)
  {
    v6 = [MEMORY[0x1E4F28B00] currentHandler];
    [v6 handleFailureInMethod:a2, self, @"PXSharedLibraryFaceTileImageProviderModel.m", 54, @"Invalid parameter not satisfying: %@", @"displayScale > 0" object file lineNumber description];
  }
  if (self->_displayScale != a3)
  {
    self->_displayScale = a3;
    [(PXSharedLibraryFaceTileImageProviderModel *)self signalChange:2];
  }
}

- (void)setIncludeMeContact:(BOOL)a3
{
  if (self->_includeMeContact != a3)
  {
    self->_includeMeContact = a3;
    [(PXSharedLibraryFaceTileImageProviderModel *)self signalChange:1];
  }
}

- (void)performChanges:(id)a3
{
  v3.receiver = self;
  v3.super_class = (Class)PXSharedLibraryFaceTileImageProviderModel;
  [(PXSharedLibraryFaceTileImageProviderModel *)&v3 performChanges:a3];
}

- (PXSharedLibraryFaceTileImageProviderModel)init
{
  v6.receiver = self;
  v6.super_class = (Class)PXSharedLibraryFaceTileImageProviderModel;
  v2 = [(PXSharedLibraryFaceTileImageProviderModel *)&v6 init];
  objc_super v3 = v2;
  if (v2)
  {
    faceTileCombinerItems = v2->_faceTileCombinerItems;
    v2->_faceTileCombinerItems = (NSArray *)MEMORY[0x1E4F1CBF0];

    v3->_isAscending = 1;
    v3->_imageDiameter = 60.0;
    v3->_imageOffset = 0.5;
    v3->_borderWidth = 3.0;
  }
  return v3;
}

@end