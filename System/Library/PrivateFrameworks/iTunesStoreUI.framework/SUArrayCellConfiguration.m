@interface SUArrayCellConfiguration
- (CGRect)frameForImageAtIndex:(unint64_t)a3;
- (CGRect)frameForLabelAtIndex:(unint64_t)a3;
- (SUArrayCellConfiguration)initWithStringCount:(unint64_t)a3 imageCount:(unint64_t)a4;
- (id)_accessibilityStringsArrayPointer;
- (id)imageAtIndex:(unint64_t)a3 withModifiers:(unint64_t)a4;
- (id)stringForLabelAtIndex:(unint64_t)a3;
- (unint64_t)numberOfImages;
- (unint64_t)numberOfLabels;
- (void)dealloc;
- (void)reloadData;
- (void)setLayoutSize:(CGSize)a3;
@end

@implementation SUArrayCellConfiguration

- (SUArrayCellConfiguration)initWithStringCount:(unint64_t)a3 imageCount:(unint64_t)a4
{
  v26.receiver = self;
  v26.super_class = (Class)SUArrayCellConfiguration;
  v6 = [(SUArrayCellConfiguration *)&v26 init];
  v7 = v6;
  if (!v6) {
    return v7;
  }
  if (a4)
  {
    v6->_imageFrames = (CGRect *)malloc_type_malloc(32 * a4, 0x1000040E0EAB150uLL);
    v7->_images = (id *)malloc_type_malloc(8 * a4, 0x80040B8603338uLL);
    v8 = (id *)malloc_type_malloc(8 * a4, 0x80040B8603338uLL);
    v7->_selectedImages = v8;
    if (!v7->_imageFrames) {
      goto LABEL_21;
    }
    if (v7->_images) {
      BOOL v9 = v8 == 0;
    }
    else {
      BOOL v9 = 1;
    }
    char v10 = !v9;
    if (!a3 || (v10 & 1) == 0)
    {
      if (v10)
      {
        p_numberOfImages = &v7->_numberOfImages;
        v7->_numberOfImages = a4;
        p_numberOfStrings = &v7->_numberOfStrings;
        v7->_numberOfStrings = a3;
        if (!a3) {
          goto LABEL_26;
        }
        goto LABEL_22;
      }
LABEL_21:

      return 0;
    }
  }
  else if (!a3)
  {
    p_numberOfImages = &v6->_numberOfImages;
    v6->_numberOfImages = 0;
    v6->_numberOfStrings = 0;
    goto LABEL_26;
  }
  v7->_stringFrames = (CGRect *)malloc_type_malloc(32 * a3, 0x1000040E0EAB150uLL);
  v13 = (id *)malloc_type_malloc(8 * a3, 0x80040B8603338uLL);
  v7->_strings = v13;
  if (v7->_stringFrames) {
    BOOL v14 = v13 == 0;
  }
  else {
    BOOL v14 = 1;
  }
  if (v14) {
    goto LABEL_21;
  }
  p_numberOfImages = &v7->_numberOfImages;
  v7->_numberOfImages = a4;
  p_numberOfStrings = &v7->_numberOfStrings;
  v7->_numberOfStrings = a3;
LABEL_22:
  uint64_t v15 = 0;
  unint64_t v16 = 0;
  long long v17 = *MEMORY[0x263F001A8];
  long long v18 = *(_OWORD *)(MEMORY[0x263F001A8] + 16);
  do
  {
    p_x = (_OWORD *)&v7->_stringFrames[v15].origin.x;
    _OWORD *p_x = v17;
    p_x[1] = v18;
    v7->_strings[v16++] = 0;
    ++v15;
  }
  while (v16 < *p_numberOfStrings);
LABEL_26:
  if (*p_numberOfImages)
  {
    uint64_t v20 = 0;
    unint64_t v21 = 0;
    long long v22 = *MEMORY[0x263F001A8];
    long long v23 = *(_OWORD *)(MEMORY[0x263F001A8] + 16);
    do
    {
      v24 = (_OWORD *)&v7->_imageFrames[v20].origin.x;
      _OWORD *v24 = v22;
      v24[1] = v23;
      v7->_images[v21] = 0;
      v7->_selectedImages[v21++] = 0;
      ++v20;
    }
    while (v21 < *p_numberOfImages);
  }
  return v7;
}

- (void)dealloc
{
  if (self->_numberOfStrings)
  {
    unint64_t v3 = 0;
    do
    {

      self->_strings[v3++] = 0;
    }
    while (v3 < self->_numberOfStrings);
    free(self->_strings);
    self->_strings = 0;
    free(self->_stringFrames);
    self->_stringFrames = 0;
  }
  if (self->_numberOfImages)
  {
    unint64_t v4 = 0;
    do
    {

      self->_images[v4] = 0;
      self->_selectedImages[v4++] = 0;
    }
    while (v4 < self->_numberOfImages);
    free(self->_images);
    self->_images = 0;
    free(self->_selectedImages);
    self->_selectedImages = 0;
    free(self->_imageFrames);
    self->_imageFrames = 0;
  }
  v5.receiver = self;
  v5.super_class = (Class)SUArrayCellConfiguration;
  [(SUCellConfiguration *)&v5 dealloc];
}

- (CGRect)frameForImageAtIndex:(unint64_t)a3
{
  if (self->_numberOfImages <= a3) {
    unint64_t v3 = (CGRect *)MEMORY[0x263F001A8];
  }
  else {
    unint64_t v3 = &self->_imageFrames[a3];
  }
  double width = v3->size.width;
  double height = v3->size.height;
  double x = v3->origin.x;
  double y = v3->origin.y;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- (CGRect)frameForLabelAtIndex:(unint64_t)a3
{
  if (self->_numberOfStrings <= a3) {
    unint64_t v3 = (CGRect *)MEMORY[0x263F001A8];
  }
  else {
    unint64_t v3 = &self->_stringFrames[a3];
  }
  double width = v3->size.width;
  double height = v3->size.height;
  double x = v3->origin.x;
  double y = v3->origin.y;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- (id)imageAtIndex:(unint64_t)a3 withModifiers:(unint64_t)a4
{
  if (self->_numberOfImages <= a3) {
    return 0;
  }
  id v4 = self->_images[a3];
  if ((a4 & 1) != 0 && self->_selectedImages[a3]) {
    return self->_selectedImages[a3];
  }
  return v4;
}

- (unint64_t)numberOfImages
{
  return self->_numberOfImages;
}

- (unint64_t)numberOfLabels
{
  return self->_numberOfStrings;
}

- (void)reloadData
{
  [(SUArrayCellConfiguration *)self reloadImages];
  [(SUArrayCellConfiguration *)self reloadStrings];
  if (self->super._layoutSize.width > 0.00000011920929)
  {
    [(SUArrayCellConfiguration *)self reloadLayoutInformation];
  }
}

- (void)setLayoutSize:(CGSize)a3
{
  double width = a3.width;
  double height = self->super._layoutSize.height;
  if (self->super._layoutSize.width != a3.width || height != a3.height)
  {
    v7.receiver = self;
    v7.super_class = (Class)SUArrayCellConfiguration;
    -[SUCellConfiguration setLayoutSize:](&v7, sel_setLayoutSize_, a3.width, a3.height, height);
    if (width > 0.00000011920929) {
      [(SUArrayCellConfiguration *)self reloadLayoutInformation];
    }
  }
}

- (id)stringForLabelAtIndex:(unint64_t)a3
{
  if (self->_numberOfStrings <= a3) {
    return 0;
  }
  else {
    return self->_strings[a3];
  }
}

- (id)_accessibilityStringsArrayPointer
{
  return (id)[MEMORY[0x263EFF8F8] dataWithBytes:self->_strings length:8 * self->_numberOfStrings];
}

@end