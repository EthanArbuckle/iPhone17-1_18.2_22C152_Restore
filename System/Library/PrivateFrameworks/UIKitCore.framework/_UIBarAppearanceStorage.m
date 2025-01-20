@interface _UIBarAppearanceStorage
+ (int64_t)typicalBarPosition;
- (BOOL)hasAnyCustomBackgroundImage;
- (id)allBackgroundImages;
- (id)backgroundImageForBarPosition:(int64_t)a3 barMetrics:(int64_t)a4;
- (void)setAllBackgroundImages:(id)a3;
- (void)setBackgroundImage:(id)a3 forBarPosition:(int64_t)a4 barMetrics:(int64_t)a5;
@end

@implementation _UIBarAppearanceStorage

- (BOOL)hasAnyCustomBackgroundImage
{
  return [(NSMutableDictionary *)self->_backgroundImages count] != 0;
}

- (void)setBackgroundImage:(id)a3 forBarPosition:(int64_t)a4 barMetrics:(int64_t)a5
{
  id v17 = a3;
  v8 = [NSNumber numberWithInteger:a5 + 1000 * a4];
  if ([(id)objc_opt_class() typicalBarPosition])
  {
    uint64_t v9 = [NSNumber numberWithInteger:a5];
    v10 = (void *)v9;
    if (!v17)
    {
      if (v9)
      {
        v11 = [(NSMutableDictionary *)self->_backgroundImages objectForKeyedSubscript:v9];
        v12 = [(NSMutableDictionary *)self->_backgroundImages objectForKeyedSubscript:v8];

        if (v11 == v12) {
          [(NSMutableDictionary *)self->_backgroundImages removeObjectForKey:v10];
        }
      }
      goto LABEL_12;
    }
  }
  else
  {
    v10 = 0;
    if (!v17)
    {
LABEL_12:
      [(NSMutableDictionary *)self->_backgroundImages removeObjectForKey:v8];
      goto LABEL_13;
    }
  }
  backgroundImages = self->_backgroundImages;
  if (!backgroundImages)
  {
    v14 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    v15 = self->_backgroundImages;
    self->_backgroundImages = v14;

    backgroundImages = self->_backgroundImages;
  }
  -[NSMutableDictionary setObject:forKeyedSubscript:](backgroundImages, "setObject:forKeyedSubscript:");
  if (v10)
  {
    v16 = [(NSMutableDictionary *)self->_backgroundImages objectForKeyedSubscript:v10];

    if (!v16) {
      [(NSMutableDictionary *)self->_backgroundImages setObject:v17 forKeyedSubscript:v10];
    }
  }
LABEL_13:
}

- (id)backgroundImageForBarPosition:(int64_t)a3 barMetrics:(int64_t)a4
{
  backgroundImages = self->_backgroundImages;
  v5 = [NSNumber numberWithInteger:a4 + 1000 * a3];
  v6 = [(NSMutableDictionary *)backgroundImages objectForKeyedSubscript:v5];

  return v6;
}

+ (int64_t)typicalBarPosition
{
  v4 = [MEMORY[0x1E4F28B00] currentHandler];
  [v4 handleFailureInMethod:a2 object:a1 file:@"UIBarCommon.m" lineNumber:72 description:@"Abstract method requires overriding in subclasses"];

  return 0;
}

- (void)setAllBackgroundImages:(id)a3
{
  v4 = (NSMutableDictionary *)[a3 mutableCopy];
  backgroundImages = self->_backgroundImages;
  self->_backgroundImages = v4;
}

- (id)allBackgroundImages
{
  v2 = (void *)[(NSMutableDictionary *)self->_backgroundImages copy];
  return v2;
}

- (void).cxx_destruct
{
}

@end