@interface PKPassTileImage
+ (BOOL)supportsSecureCoding;
+ (id)_createDefaultDisclosureImage;
+ (id)_createForDictionary:(id)a3;
+ (id)createImageWithImage:(id)a3 tintColor:(int64_t)a4 hasColorContent:(BOOL)a5;
+ (id)createWithSymbolName:(id)a3 contextMenuSymbolName:(id)a4 tintColor:(int64_t)a5;
+ (id)createWithSymbolName:(id)a3 tintColor:(int64_t)a4;
- (BOOL)hasColorContent;
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqualToUnresolvedImage:(id)a3;
- (BOOL)isResolved;
- (NSData)imageHash;
- (NSString)contextMenuSymbolName;
- (NSString)imageName;
- (NSString)symbolName;
- (PKImage)image;
- (PKPassTileImage)init;
- (PKPassTileImage)initWithCoder:(id)a3;
- (id)_init;
- (id)createResolvedImageWithBundle:(id)a3 privateBundle:(id)a4;
- (int64_t)tintColor;
- (uint64_t)_isEqual:(uint64_t)a1;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
- (void)setContextMenuSymbolName:(id)a3;
- (void)setHasColorContent:(BOOL)a3;
- (void)setImageName:(id)a3;
- (void)setSymbolName:(id)a3;
- (void)setTintColor:(int64_t)a3;
@end

@implementation PKPassTileImage

+ (id)_createForDictionary:(id)a3
{
  if (!a3) {
    return 0;
  }
  id v3 = a3;
  v4 = [PKPassTileImage alloc];
  id v5 = v3;
  if (v4)
  {
    v4 = [(PKPassTileImage *)v4 _init];
    if (v4)
    {
      uint64_t v6 = [v5 PKStringForKey:@"symbolName"];
      symbolName = v4->_symbolName;
      v4->_symbolName = (NSString *)v6;

      uint64_t v8 = [v5 PKStringForKey:@"imageName"];
      imageName = v4->_imageName;
      v4->_imageName = (NSString *)v8;

      v10 = [v5 PKStringForKey:@"tintColor"];
      PKSemanticColorFromString(v10, &v4->_tintColor);
    }
  }

  return v4;
}

+ (id)_createDefaultDisclosureImage
{
  id v2 = [[PKPassTileImage alloc] _init];
  [v2 setSymbolName:@"chevron.forward"];
  [v2 setTintColor:3];
  return v2;
}

- (PKPassTileImage)init
{
  return 0;
}

- (id)_init
{
  v3.receiver = self;
  v3.super_class = (Class)PKPassTileImage;
  return [(PKPassTileImage *)&v3 init];
}

+ (id)createWithSymbolName:(id)a3 tintColor:(int64_t)a4
{
  return (id)[a1 createWithSymbolName:a3 contextMenuSymbolName:0 tintColor:a4];
}

+ (id)createWithSymbolName:(id)a3 contextMenuSymbolName:(id)a4 tintColor:(int64_t)a5
{
  id v5 = a3;
  if (a3)
  {
    id v7 = a4;
    id v8 = v5;
    id v5 = [[PKPassTileImage alloc] _init];
    [v5 setSymbolName:v8];

    [v5 setContextMenuSymbolName:v7];
    [v5 setTintColor:a5];
  }
  return v5;
}

+ (id)createImageWithImage:(id)a3 tintColor:(int64_t)a4 hasColorContent:(BOOL)a5
{
  id v8 = a3;
  if (v8)
  {
    v9 = [[PKPassTileImage alloc] _init];
    objc_storeStrong(v9 + 4, a3);
    v9[3] = (id)a4;
    uint64_t v10 = [v8 imageHash];
    id v11 = v9[5];
    v9[5] = (id)v10;

    *((unsigned char *)v9 + 9) = a5;
    *((unsigned char *)v9 + 8) = 1;
  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (id)createResolvedImageWithBundle:(id)a3 privateBundle:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (self->_resolved) {
    [MEMORY[0x1E4F1CA00] raise:*MEMORY[0x1E4F1C3B8] format:@"PKPassTileImage attempting double resolution."];
  }
  id v8 = [[PKPassTileImage alloc] _init];
  objc_storeStrong(v8 + 2, self->_symbolName);
  v8[3] = self->_tintColor;
  *((unsigned char *)v8 + 9) = self->_hasColorContent;
  if (!self->_symbolName)
  {
    imageName = self->_imageName;
    if (imageName)
    {
      uint64_t v10 = +[PKImage imageNamed:imageName inBundle:v6 screenScale:0 suffix:0.0];
      if (v10
        || (+[PKImage imageNamed:self->_imageName inBundle:v7 screenScale:0 suffix:0.0], (uint64_t v10 = objc_claimAutoreleasedReturnValue()) != 0))
      {
        id v11 = v8[4];
        v8[4] = v10;
        id v12 = v10;

        uint64_t v13 = [v12 imageHash];
        id v14 = v8[5];
        v8[5] = (id)v13;
      }
    }
  }
  *((unsigned char *)v8 + 8) = 1;

  return v8;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (PKPassTileImage)initWithCoder:(id)a3
{
  id v4 = a3;
  id v5 = [(PKPassTileImage *)self _init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"symbolName"];
    symbolName = v5->_symbolName;
    v5->_symbolName = (NSString *)v6;

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"image"];
    image = v5->_image;
    v5->_image = (PKImage *)v8;

    uint64_t v10 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"imageHash"];
    imageHash = v5->_imageHash;
    v5->_imageHash = (NSData *)v10;

    v5->_hasColorContent = [v4 decodeBoolForKey:@"hasColorContent"];
    id v12 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"tintColor"];
    PKSemanticColorFromString(v12, &v5->_tintColor);

    v5->_resolved = 1;
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  id v6 = v4;
  if (!self->_resolved)
  {
    [MEMORY[0x1E4F1CA00] raise:*MEMORY[0x1E4F1C3B8] format:@"PKPassTileImage attempting unresolved XPC transfer."];
    id v4 = v6;
  }
  [v4 encodeObject:self->_symbolName forKey:@"symbolName"];
  [v6 encodeObject:self->_image forKey:@"image"];
  [v6 encodeObject:self->_imageHash forKey:@"imageHash"];
  id v5 = PKSemanticColorToString(self->_tintColor);
  [v6 encodeObject:v5 forKey:@"tintColor"];

  [v6 encodeBool:self->_hasColorContent forKey:@"hasColorContent"];
}

- (unint64_t)hash
{
  [(NSString *)self->_symbolName hash];
  if (self->_resolved)
  {
    imageHash = self->_imageHash;
    if (imageHash)
    {
      [(NSData *)imageHash bytes];
      [(NSData *)self->_imageHash length];
      SipHash();
    }
  }
  else
  {
    [(NSString *)self->_imageName hash];
  }
  return SipHash();
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();
  char v6 = 0;
  if (v4 && (isKindOfClass & 1) != 0) {
    char v6 = -[PKPassTileImage _isEqual:]((uint64_t)self, v4);
  }

  return v6;
}

- (uint64_t)_isEqual:(uint64_t)a1
{
  objc_super v3 = a2;
  id v4 = v3;
  if (a1)
  {
    if (*((unsigned __int8 *)v3 + 8) != *(unsigned __int8 *)(a1 + 8)
      || v3[3] != *(id *)(a1 + 24)
      || *((unsigned __int8 *)v3 + 9) != *(unsigned __int8 *)(a1 + 9))
    {
      goto LABEL_27;
    }
    id v5 = *(void **)(a1 + 16);
    id v6 = v3[2];
    id v7 = v5;
    if (v6 == v7)
    {
    }
    else
    {
      uint64_t v8 = v7;
      if (!v6 || !v7)
      {

        goto LABEL_27;
      }
      int v9 = [v6 isEqualToString:v7];

      if (!v9) {
        goto LABEL_27;
      }
    }
    if (*(unsigned char *)(a1 + 8))
    {
      id v10 = v4[5];
      id v11 = *(id *)(a1 + 40);
      if (v10 && v11)
      {
        if ((objc_msgSend(v10, "isEqual:") & 1) == 0) {
          goto LABEL_27;
        }
        goto LABEL_25;
      }
      if (v10 == v11)
      {
LABEL_25:
        a1 = 1;
        goto LABEL_28;
      }
    }
    else
    {
      id v12 = *(void **)(a1 + 56);
      id v13 = v4[7];
      id v14 = v12;
      if (v13 == v14)
      {

        goto LABEL_25;
      }
      v15 = v14;
      if (v13 && v14)
      {
        int v16 = [v13 isEqualToString:v14];

        if (!v16) {
          goto LABEL_27;
        }
        goto LABEL_25;
      }
    }
LABEL_27:
    a1 = 0;
  }
LABEL_28:

  return a1;
}

- (BOOL)isEqualToUnresolvedImage:(id)a3
{
  if (self->_resolved) {
    return 0;
  }
  else {
    return -[PKPassTileImage _isEqual:]((uint64_t)self, a3);
  }
}

- (NSString)symbolName
{
  return self->_symbolName;
}

- (void)setSymbolName:(id)a3
{
}

- (int64_t)tintColor
{
  return self->_tintColor;
}

- (void)setTintColor:(int64_t)a3
{
  self->_tintColor = a3;
}

- (BOOL)isResolved
{
  return self->_resolved;
}

- (PKImage)image
{
  return self->_image;
}

- (NSData)imageHash
{
  return self->_imageHash;
}

- (BOOL)hasColorContent
{
  return self->_hasColorContent;
}

- (void)setHasColorContent:(BOOL)a3
{
  self->_hasColorContent = a3;
}

- (NSString)contextMenuSymbolName
{
  return self->_contextMenuSymbolName;
}

- (void)setContextMenuSymbolName:(id)a3
{
}

- (NSString)imageName
{
  return self->_imageName;
}

- (void)setImageName:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_imageName, 0);
  objc_storeStrong((id *)&self->_contextMenuSymbolName, 0);
  objc_storeStrong((id *)&self->_imageHash, 0);
  objc_storeStrong((id *)&self->_image, 0);
  objc_storeStrong((id *)&self->_symbolName, 0);
}

@end