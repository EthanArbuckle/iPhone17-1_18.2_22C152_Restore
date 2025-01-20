@interface RBArchiveDelegateImpl
- (BOOL)shouldEncodeFontSubset:(CGFont *)a3;
- (CGFont)decodedCGFontWithData:(id)a3 error:(id *)a4;
- (RBArchiveDelegateImpl)initWithFlags:(unsigned int)a3;
- (id).cxx_construct;
- (id)decodedShaderLibraryWithData:(id)a3 error:(id *)a4;
- (id)encodedCGFontData:(CGFont *)a3 error:(id *)a4;
- (id)encodedFontSubsetData:(id)a3 cgFont:(CGFont *)a4 error:(id *)a5;
- (id)encodedImageData:(id)a3 error:(id *)a4;
- (id)encodedMetadata;
- (id)encodedShaderLibraryData:(id)a3 error:(id *)a4;
- (void)decodedImageContentsWithData:(id)a3 type:(int *)a4 error:(id *)a5;
- (void)decodedMetadata:(id)a3;
@end

@implementation RBArchiveDelegateImpl

- (RBArchiveDelegateImpl)initWithFlags:(unsigned int)a3
{
  v5.receiver = self;
  v5.super_class = (Class)RBArchiveDelegateImpl;
  result = [(RBArchiveDelegateImpl *)&v5 init];
  if (result) {
    result->_flags = a3;
  }
  return result;
}

- (id)encodedMetadata
{
  return self->_metadata._p;
}

- (void)decodedMetadata:(id)a3
{
  p = self->_metadata._p;
  if (p != a3)
  {

    self->_metadata._p = (NSData *)a3;
  }
}

- (id)encodedImageData:(id)a3 error:(id *)a4
{
  if (!a3.var1) {
    return 0;
  }
  var1 = (CGImage *)a3.var1;
  uint64_t v6 = *(void *)&a3.var0;
  if (self->_flags) {
    goto LABEL_19;
  }
  if (a3.var0 == 1)
  {
    Class v12 = NSClassFromString(&cfstr_Caiosurfacecod.isa);
    if (v12)
    {
      v13 = v12;
      if ([(objc_class *)v12 instancesRespondToSelector:sel_initWithObject_])
      {
        uint64_t v14 = [[v13 alloc] initWithObject:var1];
        if (v14)
        {
          v15 = (void *)v14;
          v7 = (void *)[MEMORY[0x263F08910] archivedDataWithRootObject:v14 requiringSecureCoding:1 error:0];

LABEL_16:
          if (v7) {
            return v7;
          }
          goto LABEL_19;
        }
      }
    }
  }
  else if (!a3.var0)
  {
    v7 = (void *)[MEMORY[0x263EFF990] data];
    v8 = CGImageDestinationCreateWithData((CFMutableDataRef)v7, @"public.png", 1uLL, 0);
    if (v8)
    {
      v9 = v8;
      CGImageDestinationAddImage(v8, var1, 0);
      BOOL v10 = CGImageDestinationFinalize(v9);
      CFRelease(v9);
      if (v7) {
        BOOL v11 = v10;
      }
      else {
        BOOL v11 = 0;
      }
      if (v11) {
        return v7;
      }
      goto LABEL_19;
    }
    goto LABEL_16;
  }
LABEL_19:
  RB::ImageDescription::ImageDescription((RB::ImageDescription *)v18, v6, var1);
  v16 = (void *)[MEMORY[0x263EFF9A0] dictionary];
  objc_msgSend(v16, "setObject:forKeyedSubscript:", objc_msgSend(NSNumber, "numberWithInt:", v6), @"type");
  objc_msgSend(v16, "setObject:forKeyedSubscript:", objc_msgSend(NSNumber, "numberWithUnsignedLong:", v18[0]), @"ident");
  objc_msgSend(v16, "setObject:forKeyedSubscript:", objc_msgSend(NSNumber, "numberWithUnsignedLong:", v18[1]), @"width");
  objc_msgSend(v16, "setObject:forKeyedSubscript:", objc_msgSend(NSNumber, "numberWithUnsignedLong:", v18[2]), @"height");
  if (v19) {
    [v16 setObject:MEMORY[0x263EFFA88] forKeyedSubscript:@"alpha"];
  }
  return (id)[MEMORY[0x263F08900] dataWithJSONObject:v16 options:0 error:a4];
}

- (void)decodedImageContentsWithData:(id)a3 type:(int *)a4 error:(id *)a5
{
  uint64_t v7 = [a3 length];
  char v25 = 0;
  if (!v7) {
    goto LABEL_18;
  }
  unint64_t v8 = v7;
  [a3 getBytes:&v25 length:1];
  if (v25 == 123)
  {
    v9 = (void *)[MEMORY[0x263F08900] JSONObjectWithData:a3 options:0 error:0];
    objc_opt_class();
    ImageAtIndex = 0;
    if ((objc_opt_isKindOfClass() & 1) == 0) {
      goto LABEL_10;
    }
    BOOL v11 = (void *)[v9 objectForKeyedSubscript:@"width"];
    Class v12 = (void *)[v9 objectForKeyedSubscript:@"height"];
    v13 = (void *)[v9 objectForKeyedSubscript:@"ident"];
    uint64_t v14 = (void *)[v9 objectForKeyedSubscript:@"has_alpha"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          v15 = (RB *)[v13 unsignedLongLongValue];
          [v11 unsignedLongLongValue];
          [v12 unsignedLongLongValue];
          objc_opt_class();
          if (objc_opt_isKindOfClass()) {
            [v14 BOOLValue];
          }
          RB::cg_image_create_placeholder(v15);
        }
      }
    }
  }
  ImageAtIndex = 0;
LABEL_10:
  if (v8 >= 7 && v25 == 98)
  {
    [a3 getBytes:&v23 length:6];
    if (v23 != 1768714338 || v24 != 29811) {
      goto LABEL_16;
    }
    Class v20 = NSClassFromString(&cfstr_Caiosurfacecod.isa);
    ImageAtIndex = v20;
    if (v20)
    {
      if (![(objc_class *)v20 instancesRespondToSelector:sel_decodedObject])
      {
LABEL_16:
        ImageAtIndex = 0;
        goto LABEL_17;
      }
      v21 = (void *)MEMORY[0x21669B110]();
      v22 = (const void *)objc_msgSend((id)objc_msgSend(MEMORY[0x263F08928], "unarchivedObjectOfClass:fromData:error:", ImageAtIndex, a3, 0), "decodedObject");
      if (v22) {
        ImageAtIndex = CFRetain(v22);
      }
      else {
        ImageAtIndex = 0;
      }
      if (ImageAtIndex) {
        *a4 = 1;
      }
    }
  }
LABEL_17:
  if (ImageAtIndex)
  {
LABEL_20:
    CFAutorelease(ImageAtIndex);
    return (void *)ImageAtIndex;
  }
LABEL_18:
  v17 = CGImageSourceCreateWithData((CFDataRef)a3, 0);
  if (!v17) {
    return 0;
  }
  v18 = v17;
  ImageAtIndex = CGImageSourceCreateImageAtIndex(v17, 0, 0);
  *a4 = 0;
  CFRelease(v18);
  if (ImageAtIndex) {
    goto LABEL_20;
  }
  return (void *)ImageAtIndex;
}

- (id)encodedCGFontData:(CGFont *)a3 error:(id *)a4
{
  uint64_t v6 = (void *)[MEMORY[0x263EFF9A0] dictionary];
  CFStringRef v7 = CGFontCopyPostScriptName(a3);
  if (v7)
  {
    unint64_t v8 = v7;
    [v6 setObject:v7 forKeyedSubscript:@"postscriptName"];
  }
  else
  {
    uint64_t v9 = CGFontCopyURL();
    if (!v9) {
      goto LABEL_6;
    }
    unint64_t v8 = (const void *)v9;
    [v6 setObject:v9 forKeyedSubscript:@"URL"];
  }
  CFRelease(v8);
LABEL_6:
  BOOL v10 = (void *)MEMORY[0x263F08900];
  return (id)[v10 dataWithJSONObject:v6 options:0 error:a4];
}

- (BOOL)shouldEncodeFontSubset:(CGFont *)a3
{
  return (LOBYTE(self->_flags) >> 1) & 1;
}

- (id)encodedFontSubsetData:(id)a3 cgFont:(CGFont *)a4 error:(id *)a5
{
  return a3;
}

- (CGFont)decodedCGFontWithData:(id)a3 error:(id *)a4
{
  char v14 = 0;
  if ([a3 length] && (objc_msgSend(a3, "getBytes:length:", &v14, 1), v14 == 123))
  {
    uint64_t v6 = (void *)[MEMORY[0x263F08900] JSONObjectWithData:a3 options:0 error:a4];
    objc_opt_class();
    CFStringRef v7 = 0;
    if ((objc_opt_isKindOfClass() & 1) == 0) {
      return v7;
    }
    CFStringRef v8 = (const __CFString *)[v6 objectForKeyedSubscript:@"postscriptName"];
    if (v8)
    {
      RB::cg_font_create_with_name(v8, (CGFontRef *)&arg);
      CFStringRef v7 = (CGFont *)arg;
      if (!arg) {
        return v7;
      }
      goto LABEL_9;
    }
    CFURLRef v11 = (const __CFURL *)[v6 objectForKeyedSubscript:@"URL"];
    if (!v11) {
      return 0;
    }
    uint64_t v9 = CGDataProviderCreateWithURL(v11);
    if (!v9) {
      return 0;
    }
  }
  else
  {
    uint64_t v9 = CGDataProviderCreateWithCFData((CFDataRef)a3);
    if (!v9) {
      return 0;
    }
  }
  BOOL v10 = v9;
  CFStringRef v7 = CGFontCreateWithDataProvider(v9);
  CFRelease(v10);
  if (v7) {
LABEL_9:
  }
    CFAutorelease(v7);
  return v7;
}

- (id)encodedShaderLibraryData:(id)a3 error:(id *)a4
{
  id result = (id)-[RBDecodedFontMetadata fontUID]((uint64_t)a3);
  if (result)
  {
    objc_super v5 = (id *)result;
    id result = 0;
    switch(*((_DWORD *)v5 + 6))
    {
      case 0:
        uint64_t v6 = [v5[2] URLForResource:@"default" withExtension:@"metallib"];
        goto LABEL_5;
      case 1:
        uint64_t v6 = (uint64_t)v5[2];
LABEL_5:
        CFStringRef v7 = (void *)MEMORY[0x263EFF8F8];
        id result = (id)[v7 dataWithContentsOfURL:v6];
        break;
      case 2:
        id result = v5[2];
        break;
      case 4:
        id v8 = v5[2];
        id result = (id)[v8 dataUsingEncoding:4];
        break;
      default:
        return result;
    }
  }
  return result;
}

- (id)decodedShaderLibraryWithData:(id)a3 error:(id *)a4
{
  if ((unint64_t)[a3 length] >= 5
    && (objc_super v5 = (unsigned char *)[a3 bytes], *v5 == 77)
    && v5[1] == 84
    && v5[2] == 76
    && v5[3] == 66)
  {
    return +[RBShaderLibrary libraryWithData:a3];
  }
  else
  {
    CFStringRef v7 = (void *)[[NSString alloc] initWithData:a3 encoding:4];
    if (v7) {
      id v8 = +[RBShaderLibrary libraryWithSource:v7];
    }
    else {
      id v8 = 0;
    }

    return v8;
  }
}

- (void).cxx_destruct
{
}

- (id).cxx_construct
{
  *((void *)self + 2) = 0;
  return self;
}

@end