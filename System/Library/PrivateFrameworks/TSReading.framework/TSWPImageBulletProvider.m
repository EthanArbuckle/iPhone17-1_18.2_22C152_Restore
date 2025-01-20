@interface TSWPImageBulletProvider
+ (id)sharedInstance;
- (NSArray)predefinedImages;
- (id)dataForDefaultImageBulletWithContext:(id)a3;
- (id)dataForImageBullet:(id)a3 withContext:(id)a4;
- (id)p_pathToPredefinedImages;
- (id)p_predefinedImageNames;
@end

@implementation TSWPImageBulletProvider

+ (id)sharedInstance
{
  if (+[TSWPImageBulletProvider sharedInstance]::predicate != -1) {
    dispatch_once(&+[TSWPImageBulletProvider sharedInstance]::predicate, &__block_literal_global_68);
  }
  return (id)+[TSWPImageBulletProvider sharedInstance]::sharedInstance;
}

TSWPImageBulletProvider *__41__TSWPImageBulletProvider_sharedInstance__block_invoke()
{
  result = objc_alloc_init(TSWPImageBulletProvider);
  +[TSWPImageBulletProvider sharedInstance]::sharedInstance = (uint64_t)result;
  return result;
}

- (NSArray)predefinedImages
{
  uint64_t v23 = *MEMORY[0x263EF8340];
  result = &self->_images->super;
  if (!result)
  {
    id v4 = [(TSWPImageBulletProvider *)self p_predefinedImageNames];
    uint64_t v5 = [v4 count];
    if (v5)
    {
      uint64_t v6 = v5;
      self->_images = (NSMutableArray *)[objc_alloc(MEMORY[0x263EFF980]) initWithCapacity:v5];
      self->_filenames = (NSMutableArray *)[objc_alloc(MEMORY[0x263EFF980]) initWithCapacity:v6];
      id v7 = [(TSWPImageBulletProvider *)self p_pathToPredefinedImages];
      long long v18 = 0u;
      long long v19 = 0u;
      long long v20 = 0u;
      long long v21 = 0u;
      uint64_t v8 = [v4 countByEnumeratingWithState:&v18 objects:v22 count:16];
      if (v8)
      {
        uint64_t v9 = v8;
        uint64_t v10 = *(void *)v19;
        do
        {
          uint64_t v11 = 0;
          do
          {
            if (*(void *)v19 != v10) {
              objc_enumerationMutation(v4);
            }
            v12 = *(void **)(*((void *)&v18 + 1) + 8 * v11);
            uint64_t v13 = objc_msgSend(objc_alloc(MEMORY[0x263F1C6B0]), "initWithContentsOfFile:", objc_msgSend(v7, "stringByAppendingPathComponent:", v12));
            if (v13)
            {
              v14 = (void *)v13;
              v15 = (void *)[v12 copy];
              [(NSMutableArray *)self->_images addObject:v14];
              [(NSMutableArray *)self->_filenames addObject:v15];
            }
            ++v11;
          }
          while (v9 != v11);
          uint64_t v9 = [v4 countByEnumeratingWithState:&v18 objects:v22 count:16];
        }
        while (v9);
      }
    }
    result = &self->_images->super;
    if (!result)
    {
      v16 = (void *)[MEMORY[0x263F7C7F0] currentHandler];
      uint64_t v17 = [NSString stringWithUTF8String:"-[TSWPImageBulletProvider predefinedImages]"];
      objc_msgSend(v16, "handleFailureInFunction:file:lineNumber:description:", v17, objc_msgSend(NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/text/TSWPImageBulletProvider.mm"), 66, @"Empty predefined bullet image array.");
      result = (NSArray *)objc_alloc_init(MEMORY[0x263EFF980]);
      self->_images = (NSMutableArray *)result;
    }
  }
  return result;
}

- (id)dataForDefaultImageBulletWithContext:(id)a3
{
  return [(TSWPImageBulletProvider *)self dataForImageBullet:0 withContext:a3];
}

- (id)dataForImageBullet:(id)a3 withContext:(id)a4
{
  objc_opt_class();
  uint64_t v7 = TSUDynamicCast();
  if (v7)
  {
LABEL_10:
    id result = +[TSPData dataFromURL:v7 context:a4];
    if (result) {
      return result;
    }
    goto LABEL_11;
  }
  objc_opt_class();
  uint64_t v8 = TSUDynamicCast();
  if (v8) {
    goto LABEL_9;
  }
  if (![(NSArray *)[(TSWPImageBulletProvider *)self predefinedImages] count]) {
    goto LABEL_11;
  }
  if (!a3) {
    goto LABEL_7;
  }
  uint64_t v9 = [(NSMutableArray *)self->_images indexOfObject:a3];
  if (v9 == 0x7FFFFFFFFFFFFFFFLL)
  {
    uint64_t v10 = (void *)[MEMORY[0x263F7C7F0] currentHandler];
    uint64_t v11 = [NSString stringWithUTF8String:"-[TSWPImageBulletProvider dataForImageBullet:withContext:]"];
    objc_msgSend(v10, "handleFailureInFunction:file:lineNumber:description:", v11, objc_msgSend(NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/text/TSWPImageBulletProvider.mm"), 104, @"Unknown image - TSPData requires path to image file");
LABEL_7:
    uint64_t v9 = 0;
  }
  uint64_t v8 = objc_msgSend(-[TSWPImageBulletProvider p_pathToPredefinedImages](self, "p_pathToPredefinedImages"), "stringByAppendingPathComponent:", -[NSMutableArray objectAtIndexedSubscript:](self->_filenames, "objectAtIndexedSubscript:", v9));
LABEL_9:
  uint64_t v7 = [NSURL fileURLWithPath:v8 isDirectory:0];
  if (v7) {
    goto LABEL_10;
  }
LABEL_11:

  return +[TSWPListStyle defaultMissingBulletImage];
}

- (id)p_pathToPredefinedImages
{
  v2 = objc_msgSend((id)objc_msgSend(MEMORY[0x263F086E0], "mainBundle"), "resourcePath");

  return (id)[v2 stringByAppendingPathComponent:@"ImageBullets"];
}

- (id)p_predefinedImageNames
{
  uint64_t v2 = objc_msgSend(-[TSWPImageBulletProvider p_pathToPredefinedImages](self, "p_pathToPredefinedImages"), "stringByAppendingPathComponent:", @"ImageBullets.plist");
  v3 = (void *)MEMORY[0x263EFF8C0];
  uint64_t v4 = [NSURL fileURLWithPath:v2 isDirectory:0];

  return (id)[v3 arrayWithContentsOfURL:v4];
}

@end