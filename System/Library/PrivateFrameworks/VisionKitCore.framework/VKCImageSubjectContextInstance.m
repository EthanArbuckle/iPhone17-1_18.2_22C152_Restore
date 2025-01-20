@interface VKCImageSubjectContextInstance
- (CGImage)maskImage;
- (CGImage)orientedMaskImage;
- (CGRect)cachedNormalizedPathContentsRect;
- (CGRect)cachedTopLevelNormalizedPathContentsRect;
- (CGSize)imageSize;
- (UIBezierPath)baseNormalizedSubjectPath;
- (UIBezierPath)baseTopLevelNormalizedSubjectPath;
- (UIBezierPath)cachedNormalizedPath;
- (UIBezierPath)cachedTopLevelNormalizedPath;
- (VKCImageSubjectContextInstance)init;
- (id)normalizedSubjectPathWithContentsRect:(CGRect)a3 topLevelOnly:(BOOL)a4;
- (unint64_t)madIndex;
- (void)dealloc;
- (void)setBaseNormalizedSubjectPath:(id)a3;
- (void)setBaseTopLevelNormalizedSubjectPath:(id)a3;
- (void)setCachedNormalizedPath:(id)a3;
- (void)setCachedNormalizedPathContentsRect:(CGRect)a3;
- (void)setCachedTopLevelNormalizedPath:(id)a3;
- (void)setCachedTopLevelNormalizedPathContentsRect:(CGRect)a3;
- (void)setImageSize:(CGSize)a3;
- (void)setMadIndex:(unint64_t)a3;
- (void)setMaskImage:(CGImage *)a3;
- (void)setOrientedMaskImage:(CGImage *)a3;
@end

@implementation VKCImageSubjectContextInstance

- (void)dealloc
{
  CGImageRelease(self->_orientedMaskImage);
  CGImageRelease(self->_maskImage);
  v3.receiver = self;
  v3.super_class = (Class)VKCImageSubjectContextInstance;
  [(VKCImageSubjectContextInstance *)&v3 dealloc];
}

- (VKCImageSubjectContextInstance)init
{
  v5.receiver = self;
  v5.super_class = (Class)VKCImageSubjectContextInstance;
  result = [(VKCImageSubjectContextInstance *)&v5 init];
  if (result)
  {
    CGPoint v3 = (CGPoint)*MEMORY[0x1E4F1DB20];
    CGSize v4 = *(CGSize *)(MEMORY[0x1E4F1DB20] + 16);
    result->_cachedNormalizedPathContentsRect.origin = (CGPoint)*MEMORY[0x1E4F1DB20];
    result->_cachedNormalizedPathContentsRect.size = v4;
    result->_cachedTopLevelNormalizedPathContentsRect.origin = v3;
    result->_cachedTopLevelNormalizedPathContentsRect.size = v4;
  }
  return result;
}

- (void)setOrientedMaskImage:(CGImage *)a3
{
  orientedMaskImage = self->_orientedMaskImage;
  if (orientedMaskImage != a3)
  {
    CGImageRelease(orientedMaskImage);
    self->_orientedMaskImage = a3;
    CGImageRetain(a3);
  }
}

- (void)setMaskImage:(CGImage *)a3
{
  maskImage = self->_maskImage;
  if (maskImage != a3)
  {
    CGImageRelease(maskImage);
    self->_maskImage = a3;
    CGImageRetain(a3);
  }
}

- (id)normalizedSubjectPathWithContentsRect:(CGRect)a3 topLevelOnly:(BOOL)a4
{
  BOOL v4 = a4;
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  if (a4)
  {
    [(VKCImageSubjectContextInstance *)self cachedTopLevelNormalizedPathContentsRect];
    CGFloat v11 = v10;
    CGFloat v13 = v12;
    CGFloat v15 = v14;
    CGFloat v17 = v16;
    [(VKCImageSubjectContextInstance *)self cachedTopLevelNormalizedPath];
  }
  else
  {
    [(VKCImageSubjectContextInstance *)self cachedNormalizedPathContentsRect];
    CGFloat v11 = v18;
    CGFloat v13 = v19;
    CGFloat v15 = v20;
    CGFloat v17 = v21;
    [(VKCImageSubjectContextInstance *)self cachedNormalizedPath];
  v22 = };
  v30.origin.double x = x;
  v30.origin.double y = y;
  v30.size.double width = width;
  v30.size.double height = height;
  if (CGRectIsNull(v30)) {
    goto LABEL_7;
  }
  v31.origin.double x = v11;
  v31.origin.double y = v13;
  v31.size.double width = v15;
  v31.size.double height = v17;
  v33.origin.double x = x;
  v33.origin.double y = y;
  v33.size.double width = width;
  v33.size.double height = height;
  if (!CGRectEqualToRect(v31, v33) || (id v23 = v22) == 0)
  {
LABEL_7:
    if (v4) {
      [(VKCImageSubjectContextInstance *)self baseTopLevelNormalizedSubjectPath];
    }
    else {
    v24 = [(VKCImageSubjectContextInstance *)self baseNormalizedSubjectPath];
    }
    id v23 = (id)[v24 copy];
    v32.origin.double x = x;
    v32.origin.double y = y;
    v32.size.double width = width;
    v32.size.double height = height;
    v34.origin.double x = 0.0;
    v34.origin.double y = 0.0;
    v34.size.double width = 1.0;
    v34.size.double height = 1.0;
    if (!CGRectEqualToRect(v32, v34))
    {
      v25 = (void *)[v23 copy];

      objc_msgSend(v25, "vk_applyTransform:", v28, VKMTransformConvertingRectToRect((uint64_t)v28, 0.0, 1.0, 1.0, x, y, width, height));
      id v23 = v25;
    }
    if (v4)
    {
      -[VKCImageSubjectContextInstance setCachedTopLevelNormalizedPathContentsRect:](self, "setCachedTopLevelNormalizedPathContentsRect:", x, y, width, height);
      [(VKCImageSubjectContextInstance *)self setCachedTopLevelNormalizedPath:v23];
    }
    else
    {
      -[VKCImageSubjectContextInstance setCachedNormalizedPathContentsRect:](self, "setCachedNormalizedPathContentsRect:", x, y, width, height);
      [(VKCImageSubjectContextInstance *)self setCachedNormalizedPath:v23];
    }
  }
  v26 = (void *)[v23 copy];

  return v26;
}

- (CGImage)orientedMaskImage
{
  return self->_orientedMaskImage;
}

- (CGImage)maskImage
{
  return self->_maskImage;
}

- (UIBezierPath)baseNormalizedSubjectPath
{
  return self->_baseNormalizedSubjectPath;
}

- (void)setBaseNormalizedSubjectPath:(id)a3
{
}

- (UIBezierPath)baseTopLevelNormalizedSubjectPath
{
  return self->_baseTopLevelNormalizedSubjectPath;
}

- (void)setBaseTopLevelNormalizedSubjectPath:(id)a3
{
}

- (UIBezierPath)cachedNormalizedPath
{
  return self->_cachedNormalizedPath;
}

- (void)setCachedNormalizedPath:(id)a3
{
}

- (CGRect)cachedNormalizedPathContentsRect
{
  double x = self->_cachedNormalizedPathContentsRect.origin.x;
  double y = self->_cachedNormalizedPathContentsRect.origin.y;
  double width = self->_cachedNormalizedPathContentsRect.size.width;
  double height = self->_cachedNormalizedPathContentsRect.size.height;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- (void)setCachedNormalizedPathContentsRect:(CGRect)a3
{
  self->_cachedNormalizedPathContentsRect = a3;
}

- (UIBezierPath)cachedTopLevelNormalizedPath
{
  return self->_cachedTopLevelNormalizedPath;
}

- (void)setCachedTopLevelNormalizedPath:(id)a3
{
}

- (CGRect)cachedTopLevelNormalizedPathContentsRect
{
  double x = self->_cachedTopLevelNormalizedPathContentsRect.origin.x;
  double y = self->_cachedTopLevelNormalizedPathContentsRect.origin.y;
  double width = self->_cachedTopLevelNormalizedPathContentsRect.size.width;
  double height = self->_cachedTopLevelNormalizedPathContentsRect.size.height;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- (void)setCachedTopLevelNormalizedPathContentsRect:(CGRect)a3
{
  self->_cachedTopLevelNormalizedPathContentsRect = a3;
}

- (CGSize)imageSize
{
  double width = self->_imageSize.width;
  double height = self->_imageSize.height;
  result.double height = height;
  result.double width = width;
  return result;
}

- (void)setImageSize:(CGSize)a3
{
  self->_imageSize = a3;
}

- (unint64_t)madIndex
{
  return self->_madIndex;
}

- (void)setMadIndex:(unint64_t)a3
{
  self->_madIndedouble x = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_cachedTopLevelNormalizedPath, 0);
  objc_storeStrong((id *)&self->_cachedNormalizedPath, 0);
  objc_storeStrong((id *)&self->_baseTopLevelNormalizedSubjectPath, 0);
  objc_storeStrong((id *)&self->_baseNormalizedSubjectPath, 0);
}

@end