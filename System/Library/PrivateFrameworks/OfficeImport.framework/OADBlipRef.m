@interface OADBlipRef
+ (id)blipRefWithIndex:(int)a3 name:(id)a4 blip:(id)a5;
+ (id)blipRefWithIndex:(int)a3 name:(id)a4 blip:(id)a5 effects:(id)a6;
+ (id)inflatedExtensionForGzippedExtension:(id)a3;
+ (int)blipTypeForContentType:(id)a3;
+ (int)blipTypeForExtension:(id)a3;
+ (int)blipTypeForImageData:(id)a3;
- (BOOL)isEqual:(id)a3;
- (BOOL)isNull;
- (OADBlipRef)init;
- (OADBlipRef)initWithIndex:(int)a3 name:(id)a4 blip:(id)a5;
- (OADBlipRef)initWithIndex:(int)a3 name:(id)a4 blip:(id)a5 effects:(id)a6;
- (id)blip;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)effectAtIndex:(unint64_t)a3;
- (id)effects;
- (id)name;
- (int)index;
- (unint64_t)effectCount;
- (unint64_t)hash;
- (void)addEffect:(id)a3;
- (void)removeEffectAtIndex:(unint64_t)a3;
- (void)setBlip:(id)a3;
- (void)setEffects:(id)a3;
- (void)setIndex:(int)a3;
- (void)setName:(id)a3;
@end

@implementation OADBlipRef

- (OADBlipRef)initWithIndex:(int)a3 name:(id)a4 blip:(id)a5
{
  return [(OADBlipRef *)self initWithIndex:*(void *)&a3 name:a4 blip:a5 effects:0];
}

- (OADBlipRef)initWithIndex:(int)a3 name:(id)a4 blip:(id)a5 effects:(id)a6
{
  id v10 = a4;
  id v11 = a5;
  id v12 = a6;
  v20.receiver = self;
  v20.super_class = (Class)OADBlipRef;
  v13 = [(OADBlipRef *)&v20 init];
  v14 = v13;
  if (v13)
  {
    v13->mIndex = a3;
    uint64_t v15 = [v10 copy];
    mName = v14->mName;
    v14->mName = (NSString *)v15;

    objc_storeStrong((id *)&v14->mBlip, a5);
    if ([v12 count])
    {
      uint64_t v17 = [objc_alloc(MEMORY[0x263EFF980]) initWithArray:v12 copyItems:1];
      mEffects = v14->mEffects;
      v14->mEffects = (NSMutableArray *)v17;
    }
  }

  return v14;
}

- (id)blip
{
  return self->mBlip;
}

- (int)index
{
  return self->mIndex;
}

- (void)addEffect:(id)a3
{
  id v4 = a3;
  mEffects = self->mEffects;
  id v8 = v4;
  if (!mEffects)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x263EFF980]);
    v7 = self->mEffects;
    self->mEffects = v6;

    mEffects = self->mEffects;
    id v4 = v8;
  }
  [(NSMutableArray *)mEffects addObject:v4];
}

- (void)setBlip:(id)a3
{
}

- (unint64_t)effectCount
{
  return [(NSMutableArray *)self->mEffects count];
}

- (id)effectAtIndex:(unint64_t)a3
{
  return (id)[(NSMutableArray *)self->mEffects objectAtIndex:a3];
}

- (unint64_t)hash
{
  uint64_t mIndex = self->mIndex;
  NSUInteger v4 = [(NSString *)self->mName hash] ^ mIndex;
  unint64_t v5 = v4 ^ [(OADBlip *)self->mBlip hash];
  if ([(NSMutableArray *)self->mEffects count])
  {
    uint64_t v6 = 0;
    unsigned int v7 = 1;
    do
    {
      id v8 = [(NSMutableArray *)self->mEffects objectAtIndex:v6];
      v5 ^= [v8 hash];

      uint64_t v6 = v7;
    }
    while ([(NSMutableArray *)self->mEffects count] > (unint64_t)v7++);
  }
  return v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    uint64_t v6 = 0;
LABEL_8:
    char v8 = 0;
    goto LABEL_9;
  }
  unint64_t v5 = (objc_object **)v4;
  uint64_t v6 = v5;
  if (!v5) {
    goto LABEL_8;
  }
  int mIndex = self->mIndex;
  if (mIndex != [v5 index]
    || !TCObjectEqual((objc_object *)self->mName, v6[2])
    || !TCObjectEqual((objc_object *)self->mEffects, v6[3]))
  {
    goto LABEL_8;
  }
  char v8 = TCObjectEqual((objc_object *)self->mBlip, v6[4]);
LABEL_9:

  return v8;
}

+ (int)blipTypeForContentType:(id)a3
{
  id v3 = a3;
  if (v3)
  {
    id v4 = (void *)+[OADBlipRef blipTypeForContentType:]::contentTypeToBlipTypeMap;
    if (!+[OADBlipRef blipTypeForContentType:]::contentTypeToBlipTypeMap)
    {
      id v5 = objc_alloc(NSDictionary);
      v25 = [NSNumber numberWithInt:1];
      uint64_t v6 = [NSNumber numberWithInt:1];
      uint64_t v7 = [NSNumber numberWithInt:2];
      v24 = [NSNumber numberWithInt:2];
      v28 = [NSNumber numberWithInt:3];
      v27 = [NSNumber numberWithInt:4];
      char v8 = [NSNumber numberWithInt:5];
      v23 = [NSNumber numberWithInt:6];
      v9 = [NSNumber numberWithInt:6];
      v22 = [NSNumber numberWithInt:7];
      v21 = [NSNumber numberWithInt:8];
      v26 = [NSNumber numberWithInt:8];
      objc_super v20 = [NSNumber numberWithInt:9];
      id v10 = (void *)v7;
      id v11 = [NSNumber numberWithInt:9];
      id v12 = [NSNumber numberWithInt:10];
      v13 = [NSNumber numberWithInt:10];
      uint64_t v14 = objc_msgSend(v5, "initWithObjectsAndKeys:", v25, @"image/bmp", v6, @"image/x-ms-bmp", v10, @"image/jpeg", v24, @"image/jpg", v28, @"image/png", v27, @"image/x-wmf", v8, @"image/x-emf", v23, @"image/x-pict", v9,
              @"image/pict",
              v22,
              @"image/gif",
              v21,
              @"image/tiff",
              v26,
              @"image/tif",
              v20,
              @"application/pdf",
              v11,
              @"application/x-pdf",
              v12,
              @"application/photoshop",
              v13,
              @"application/x-photoshop",
              0);
      uint64_t v15 = (void *)+[OADBlipRef blipTypeForContentType:]::contentTypeToBlipTypeMap;
      +[OADBlipRef blipTypeForContentType:]::contentTypeToBlipTypeMap = v14;

      id v4 = (void *)+[OADBlipRef blipTypeForContentType:]::contentTypeToBlipTypeMap;
    }
    v16 = [v4 objectForKey:v3];
    uint64_t v17 = v16;
    if (v16) {
      int v18 = [v16 intValue];
    }
    else {
      int v18 = 0;
    }
  }
  else
  {
    int v18 = 0;
  }

  return v18;
}

+ (id)blipRefWithIndex:(int)a3 name:(id)a4 blip:(id)a5
{
  id v5 = [a1 blipRefWithIndex:*(void *)&a3 name:a4 blip:a5 effects:0];
  return v5;
}

+ (id)blipRefWithIndex:(int)a3 name:(id)a4 blip:(id)a5 effects:(id)a6
{
  uint64_t v8 = *(void *)&a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = a6;
  id v12 = [[OADBlipRef alloc] initWithIndex:v8 name:v9 blip:v10 effects:v11];

  return v12;
}

- (id)name
{
  return self->mName;
}

- (id)effects
{
  return self->mEffects;
}

- (void)setEffects:(id)a3
{
  id v6 = a3;
  id v4 = (NSMutableArray *)[v6 mutableCopy];
  mEffects = self->mEffects;
  self->mEffects = v4;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = (void *)[(id)objc_opt_class() allocWithZone:a3];
  uint64_t mIndex = self->mIndex;
  mEffects = self->mEffects;
  mBlip = self->mBlip;
  mName = self->mName;
  return (id)[v4 initWithIndex:mIndex name:mName blip:mBlip effects:mEffects];
}

- (OADBlipRef)init
{
  return 0;
}

- (void)setIndex:(int)a3
{
  self->uint64_t mIndex = a3;
}

- (void)setName:(id)a3
{
}

- (void)removeEffectAtIndex:(unint64_t)a3
{
}

+ (int)blipTypeForExtension:(id)a3
{
  id v3 = a3;
  id v4 = v3;
  if (+[OADBlipRef blipTypeForExtension:]::extToBlipTypeMap)
  {
    if (!v3) {
      goto LABEL_7;
    }
  }
  else
  {
    id v27 = v3;
    id v5 = objc_alloc(NSDictionary);
    v26 = [NSNumber numberWithInt:1];
    id v6 = [NSNumber numberWithInt:2];
    uint64_t v7 = [NSNumber numberWithInt:2];
    v25 = [NSNumber numberWithInt:2];
    uint64_t v8 = [NSNumber numberWithInt:3];
    id v9 = [NSNumber numberWithInt:4];
    v24 = [NSNumber numberWithInt:5];
    id v10 = [NSNumber numberWithInt:6];
    v23 = [NSNumber numberWithInt:6];
    v22 = [NSNumber numberWithInt:7];
    v21 = [NSNumber numberWithInt:8];
    objc_super v20 = [NSNumber numberWithInt:8];
    v19 = v5;
    id v11 = [NSNumber numberWithInt:9];
    id v12 = [NSNumber numberWithInt:10];
    uint64_t v13 = objc_msgSend(v19, "initWithObjectsAndKeys:", v26, @"bmp", v6, @"jpg", v7, @"jpeg", v25, @"jp2", v8, @"png", v9, @"wmf", v24, @"emf", v10, @"pct", v23,
            @"pict",
            v22,
            @"gif",
            v21,
            @"tif",
            v20,
            @"tiff",
            v11,
            @"pdf",
            v12,
            @"psd",
            0);
    uint64_t v14 = (void *)+[OADBlipRef blipTypeForExtension:]::extToBlipTypeMap;
    +[OADBlipRef blipTypeForExtension:]::extToBlipTypeMap = v13;

    id v4 = v27;
    if (!v27)
    {
LABEL_7:
      int v17 = 0;
      goto LABEL_8;
    }
  }
  uint64_t v15 = [(id)+[OADBlipRef blipTypeForExtension:]::extToBlipTypeMap objectForKey:v4];
  v16 = v15;
  if (!v15) {
    goto LABEL_7;
  }
  int v17 = [v15 intValue];

LABEL_8:
  return v17;
}

+ (int)blipTypeForImageData:(id)a3
{
  id v3 = a3;
  uint64_t v4 = [v3 bytes];
  unint64_t v5 = [v3 length];
  unint64_t v6 = v5;
  if (v5 < 4) {
    goto LABEL_2;
  }
  if (v5 >= 6)
  {
    if (*(unsigned char *)v4 == 66 && *(unsigned char *)(v4 + 1) == 77 && v5 == *(_DWORD *)(v4 + 2))
    {
      int v7 = 1;
      goto LABEL_26;
    }
    if (v5 >= 8)
    {
      if (*(_DWORD *)v4 == 1196314761 && *(_DWORD *)(v4 + 4) == 169478669)
      {
        int v7 = 3;
        goto LABEL_26;
      }
      if (v5 >= 0xB
        && (*(_DWORD *)v4 == -520103681 && !strcmp("JFIF", (const char *)(v4 + 6))
         || *(_DWORD *)v4 == -503326465 && !strcmp("Exif", (const char *)(v4 + 6))
         || v6 >= 0xC && *(_DWORD *)v4 == -385885953 && !strcmp("SPIFF", (const char *)(v4 + 6))))
      {
        int v7 = 2;
        goto LABEL_26;
      }
    }
    if (!strncmp((const char *)v4, "GIF87a", 6uLL)) {
      goto LABEL_25;
    }
  }
  if (!strncmp((const char *)v4, "GIF89a", 6uLL))
  {
LABEL_25:
    int v7 = 7;
    goto LABEL_26;
  }
  if (*(_DWORD *)v4 == 2771273 || (int v8 = *(_DWORD *)v4, *(_DWORD *)v4 == 704662861))
  {
    int v7 = 8;
    goto LABEL_26;
  }
  if (v6 >= 0x16 && *(_DWORD *)v4 == -1698247209 && !*(_WORD *)(v4 + 2))
  {
    uint64_t v10 = 22;
    if (*(_DWORD *)(v4 + 16)) {
      uint64_t v10 = 0;
    }
  }
  else
  {
    uint64_t v10 = 0;
  }
  if (v6 >= v10 + 18)
  {
    uint64_t v11 = v4 + v10;
    if ((*(_WORD *)v11 == 1 || *(_WORD *)v11 == 2)
      && *(_WORD *)(v11 + 2) == 9
      && v6 == *(_DWORD *)(v11 + 6)
      && !*(_WORD *)(v11 + 16))
    {
      int v7 = 4;
      goto LABEL_26;
    }
  }
  if (v6 >= 0x34)
  {
    if (*(_DWORD *)(v4 + 40) == 1179469088 && v6 == *(_DWORD *)(v4 + 48))
    {
      int v7 = 5;
      goto LABEL_26;
    }
    if (v8 != 1178882085) {
      goto LABEL_2;
    }
LABEL_45:
    int v12 = *(unsigned __int8 *)(v6 + v4 - 1);
    if (v12 == 10)
    {
      if (*(unsigned char *)(v6 + v4 - 2) == 13 && *(unsigned char *)(v6 + v4 - 8) == 10 && *(unsigned char *)(v6 + v4 - 9) == 13)
      {
        uint64_t v13 = -7;
        goto LABEL_56;
      }
      if (*(unsigned char *)(v6 + v4 - 7) == 10)
      {
LABEL_55:
        uint64_t v13 = -6;
LABEL_56:
        if (!strncmp("%%EOF", (const char *)(v4 + v13 + v6), 5uLL))
        {
          int v7 = 9;
          goto LABEL_26;
        }
      }
    }
    else if (v12 == 13 && *(unsigned char *)(v6 + v4 - 7) == 13)
    {
      goto LABEL_55;
    }
LABEL_2:
    int v7 = 0;
    goto LABEL_26;
  }
  int v7 = 0;
  if (v6 >= 0xD && v8 == 1178882085) {
    goto LABEL_45;
  }
LABEL_26:

  return v7;
}

+ (id)inflatedExtensionForGzippedExtension:(id)a3
{
  id v3 = a3;
  uint64_t v4 = (void *)+[OADBlipRef inflatedExtensionForGzippedExtension:]::extMap;
  if (!+[OADBlipRef inflatedExtensionForGzippedExtension:]::extMap)
  {
    uint64_t v5 = objc_msgSend(objc_alloc(NSDictionary), "initWithObjectsAndKeys:", @"wmf", @"wmz", @"emf", @"emz", 0);
    unint64_t v6 = (void *)+[OADBlipRef inflatedExtensionForGzippedExtension:]::extMap;
    +[OADBlipRef inflatedExtensionForGzippedExtension:]::extMap = v5;

    uint64_t v4 = (void *)+[OADBlipRef inflatedExtensionForGzippedExtension:]::extMap;
  }
  int v7 = [v4 objectForKey:v3];

  return v7;
}

- (BOOL)isNull
{
  return self->mIndex == -1 && self->mBlip == 0;
}

- (id)description
{
  v4.receiver = self;
  v4.super_class = (Class)OADBlipRef;
  v2 = [(OADBlipRef *)&v4 description];
  return v2;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->mBlip, 0);
  objc_storeStrong((id *)&self->mEffects, 0);
  objc_storeStrong((id *)&self->mName, 0);
}

@end