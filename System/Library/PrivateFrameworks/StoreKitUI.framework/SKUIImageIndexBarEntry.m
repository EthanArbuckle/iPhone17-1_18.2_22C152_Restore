@interface SKUIImageIndexBarEntry
- (BOOL)isEqual:(id)a3;
- (CGSize)_calculatedContentSize;
- (SKUIImageIndexBarEntry)initWithImage:(id)a3;
- (UIImage)image;
- (id)description;
- (id)entryImage;
- (unint64_t)hash;
- (void)_drawContentInRect:(CGRect)a3;
@end

@implementation SKUIImageIndexBarEntry

- (SKUIImageIndexBarEntry)initWithImage:(id)a3
{
  id v5 = a3;
  if (os_variant_has_internal_content())
  {
    if (_os_feature_enabled_impl())
    {
      BOOL v6 = os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT);
      if (v6) {
        -[SKUIImageIndexBarEntry initWithImage:](v6, v7, v8, v9, v10, v11, v12, v13);
      }
    }
  }
  v17.receiver = self;
  v17.super_class = (Class)SKUIImageIndexBarEntry;
  v14 = [(SKUIImageIndexBarEntry *)&v17 init];
  v15 = v14;
  if (v14)
  {
    objc_storeStrong((id *)&v14->_image, a3);
    [(SKUIIndexBarEntry *)v15 setEntryType:2];
  }

  return v15;
}

- (id)description
{
  v3 = NSString;
  v4 = (objc_class *)objc_opt_class();
  id v5 = NSStringFromClass(v4);
  BOOL v6 = [v3 stringWithFormat:@"<%@ %p image:%@>", v5, self, self->_image];

  return v6;
}

- (unint64_t)hash
{
  v5.receiver = self;
  v5.super_class = (Class)SKUIImageIndexBarEntry;
  unint64_t v3 = [(SKUIIndexBarEntry *)&v5 hash];
  return [(UIImage *)self->_image hash] ^ v3;
}

- (BOOL)isEqual:(id)a3
{
  v4 = (SKUIImageIndexBarEntry *)a3;
  if (v4 == self) {
    goto LABEL_7;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0
    || (v8.receiver = self,
        v8.super_class = (Class)SKUIImageIndexBarEntry,
        ![(SKUIIndexBarEntry *)&v8 isEqual:v4]))
  {
    char v6 = 0;
    goto LABEL_8;
  }
  image = v4->_image;
  if (image == self->_image)
  {
LABEL_7:
    char v6 = 1;
    goto LABEL_8;
  }
  char v6 = -[UIImage isEqual:](image, "isEqual:");
LABEL_8:

  return v6;
}

- (CGSize)_calculatedContentSize
{
  [(UIImage *)self->_image size];
  result.height = v3;
  result.width = v2;
  return result;
}

- (void)_drawContentInRect:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  CurrentContext = UIGraphicsGetCurrentContext();
  CGContextSaveGState(CurrentContext);
  if (([(UIImage *)self->_image renderingMode] & 0xFFFFFFFFFFFFFFFDLL) != 0)
  {
    CGContextSetFillColorWithColor(CurrentContext, 0);
    -[UIImage drawInRect:](self->_image, "drawInRect:", x, y, width, height);
  }
  else
  {
    CGContextBeginTransparencyLayer(CurrentContext, 0);
    CGContextSetFillColorWithColor(CurrentContext, 0);
    -[UIImage drawInRect:](self->_image, "drawInRect:", x, y, width, height);
    uint64_t v9 = [(SKUIIndexBarEntry *)self tintColor];
    [v9 setFill];
    v11.origin.double x = x;
    v11.origin.double y = y;
    v11.size.double width = width;
    v11.size.double height = height;
    UIRectFillUsingBlendMode(v11, kCGBlendModeSourceIn);
    CGContextEndTransparencyLayer(CurrentContext);
  }

  CGContextRestoreGState(CurrentContext);
}

- (id)entryImage
{
  return self->_image;
}

- (UIImage)image
{
  return self->_image;
}

- (void).cxx_destruct
{
}

- (void)initWithImage:(uint64_t)a3 .cold.1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

@end