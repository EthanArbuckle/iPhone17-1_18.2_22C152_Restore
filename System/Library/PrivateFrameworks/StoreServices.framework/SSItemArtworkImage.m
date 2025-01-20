@interface SSItemArtworkImage
- (BOOL)isEqual:(id)a3;
- (BOOL)isPrerendered;
- (CGSize)imageSize;
- (NSString)URLString;
- (NSString)description;
- (NSString)imageKind;
- (NSURL)URL;
- (SSItemArtworkImage)initWithArtworkDictionary:(id)a3;
- (SSItemArtworkImage)initWithXPCEncoding:(id)a3;
- (double)imageScale;
- (id)copyWithZone:(_NSZone *)a3;
- (id)copyXPCEncoding;
- (id)valueForProperty:(id)a3;
- (int64_t)height;
- (int64_t)imageOrientation;
- (int64_t)width;
- (unint64_t)hash;
- (void)_setValue:(id)a3 forKey:(id)a4;
- (void)dealloc;
- (void)setImageKind:(id)a3;
- (void)setImageKindWithTypeName:(id)a3 variantName:(id)a4;
- (void)setURL:(id)a3;
@end

@implementation SSItemArtworkImage

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)SSItemArtworkImage;
  [(SSItemArtworkImage *)&v3 dealloc];
}

- (id)copyWithZone:(_NSZone *)a3
{
  v5 = (void *)[(id)objc_opt_class() allocWithZone:a3];
  v5[1] = [(NSMutableDictionary *)self->_dictionary mutableCopyWithZone:a3];
  v5[2] = [(NSString *)self->_imageKind copyWithZone:a3];
  return v5;
}

- (int64_t)height
{
  objc_super v3 = (void *)[(NSMutableDictionary *)self->_dictionary objectForKey:@"box-height"];
  if (objc_opt_respondsToSelector()) {
    int64_t v4 = (int)[v3 intValue];
  }
  else {
    int64_t v4 = 0;
  }
  [(SSItemArtworkImage *)self imageScale];
  if (v5 > 0.00000011920929) {
    return (uint64_t)((double)v4 / v5);
  }
  return v4;
}

- (int64_t)imageOrientation
{
  objc_super v3 = (void *)[(NSMutableDictionary *)self->_dictionary objectForKey:@"image-orientation"];
  objc_opt_class();
  if (objc_opt_isKindOfClass() & 1) != 0 && ([v3 isEqualToString:@"landscape"]) {
    return 1;
  }
  int64_t v5 = [(SSItemArtworkImage *)self width];
  return v5 > [(SSItemArtworkImage *)self height];
}

- (double)imageScale
{
  v2 = (void *)[(NSMutableDictionary *)self->_dictionary objectForKey:@"scale"];
  char v3 = objc_opt_respondsToSelector();
  double result = 1.0;
  if (v3)
  {
    objc_msgSend(v2, "floatValue", 1.0);
    return v5;
  }
  return result;
}

- (BOOL)isPrerendered
{
  v2 = (void *)[(NSMutableDictionary *)self->_dictionary objectForKey:@"needs-shine"];
  if (objc_opt_respondsToSelector()) {
    return [v2 BOOLValue] ^ 1;
  }
  else {
    return 0;
  }
}

- (int64_t)width
{
  char v3 = (void *)[(NSMutableDictionary *)self->_dictionary objectForKey:@"box-width"];
  if (objc_opt_respondsToSelector()) {
    int64_t v4 = (int)[v3 intValue];
  }
  else {
    int64_t v4 = 0;
  }
  [(SSItemArtworkImage *)self imageScale];
  if (v5 > 0.00000011920929) {
    return (uint64_t)((double)v4 / v5);
  }
  return v4;
}

- (NSURL)URL
{
  uint64_t v2 = [(NSMutableDictionary *)self->_dictionary objectForKey:@"url"];
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0) {
    return 0;
  }
  char v3 = (void *)MEMORY[0x1E4F1CB10];
  return (NSURL *)[v3 URLWithString:v2];
}

- (id)valueForProperty:(id)a3
{
  id v3 = (id)[(NSMutableDictionary *)self->_dictionary objectForKey:a3];
  return v3;
}

- (NSString)description
{
  id v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)SSItemArtworkImage;
  int64_t v4 = [(SSItemArtworkImage *)&v8 description];
  double v5 = [(SSItemArtworkImage *)self imageKind];
  if ([(SSItemArtworkImage *)self isPrerendered]) {
    v6 = @" (prerendered)";
  }
  else {
    v6 = &stru_1EF96DA90;
  }
  return (NSString *)[v3 stringWithFormat:@"%@: [%@:%@ %ldx%ld] %@", v4, v5, v6, -[SSItemArtworkImage width](self, "width"), -[SSItemArtworkImage height](self, "height"), -[SSItemArtworkImage URL](self, "URL")];
}

- (unint64_t)hash
{
  uint64_t v2 = (void *)[(NSMutableDictionary *)self->_dictionary objectForKey:@"url"];
  return [v2 hash];
}

- (BOOL)isEqual:(id)a3
{
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0) {
    return 0;
  }
  double v5 = (void *)[(NSMutableDictionary *)self->_dictionary objectForKey:@"url"];
  uint64_t v6 = [a3 valueForProperty:@"url"];
  return [v5 isEqualToString:v6];
}

- (SSItemArtworkImage)initWithArtworkDictionary:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)SSItemArtworkImage;
  int64_t v4 = [(SSItemArtworkImage *)&v6 init];
  if (v4) {
    v4->_dictionary = (NSMutableDictionary *)[a3 mutableCopy];
  }
  return v4;
}

- (CGSize)imageSize
{
  double v3 = (double)[(SSItemArtworkImage *)self width];
  double v4 = (double)[(SSItemArtworkImage *)self height];
  double v5 = v3;
  result.height = v4;
  result.width = v5;
  return result;
}

- (void)setImageKindWithTypeName:(id)a3 variantName:(id)a4
{
  id v4 = a4;
  if ([a4 hasSuffix:@"@2x"])
  {
    LODWORD(v7) = 2.0;
    -[SSItemArtworkImage _setValue:forKey:](self, "_setValue:forKey:", [NSNumber numberWithFloat:v7], @"scale");
    id v4 = (id)objc_msgSend(v4, "substringToIndex:", objc_msgSend(v4, "length") - 3);
  }
  uint64_t v8 = [a3 stringByAppendingFormat:@".%@", v4];
  [(SSItemArtworkImage *)self setImageKind:v8];
}

- (void)setURL:(id)a3
{
  uint64_t v4 = [a3 absoluteString];
  [(SSItemArtworkImage *)self _setValue:v4 forKey:@"url"];
}

- (NSString)URLString
{
  return (NSString *)[(SSItemArtworkImage *)self valueForProperty:@"url"];
}

- (void)_setValue:(id)a3 forKey:(id)a4
{
  dictionary = self->_dictionary;
  if (a3)
  {
    if (!dictionary)
    {
      dictionary = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
      self->_dictionary = dictionary;
    }
    [(NSMutableDictionary *)dictionary setObject:a3 forKey:a4];
  }
  else
  {
    [(NSMutableDictionary *)dictionary removeObjectForKey:a4];
  }
}

- (SSItemArtworkImage)initWithXPCEncoding:(id)a3
{
  if (a3 && MEMORY[0x1A62689E0](a3, a2) == MEMORY[0x1E4F14590])
  {
    v7.receiver = self;
    v7.super_class = (Class)SSItemArtworkImage;
    double v5 = [(SSItemArtworkImage *)&v7 init];
    if (v5)
    {
      objc_opt_class();
      v5->_dictionary = (NSMutableDictionary *)SSXPCDictionaryCopyCFObjectWithClass(a3, "0");
      objc_opt_class();
      v5->_imageKind = (NSString *)SSXPCDictionaryCopyCFObjectWithClass(a3, "1");
    }
  }
  else
  {

    return 0;
  }
  return v5;
}

- (id)copyXPCEncoding
{
  xpc_object_t v3 = xpc_dictionary_create(0, 0, 0);
  SSXPCDictionarySetCFObject(v3, "0", (__CFString *)self->_dictionary);
  SSXPCDictionarySetCFObject(v3, "1", (__CFString *)self->_imageKind);
  return v3;
}

- (NSString)imageKind
{
  return self->_imageKind;
}

- (void)setImageKind:(id)a3
{
}

@end