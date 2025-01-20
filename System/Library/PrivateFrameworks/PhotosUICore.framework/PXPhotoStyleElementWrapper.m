@interface PXPhotoStyleElementWrapper
+ (id)allDefaultStyles;
+ (id)wrapperWithPhotoStyleElement:(id)a3;
- (BOOL)hasNonDefaultValues;
- (PXPhotoStyleElementWrapper)initWithPhotoStyleElement:(id)a3;
- (double)color;
- (double)defaultColor;
- (double)defaultIntensity;
- (double)defaultTone;
- (double)intensity;
- (double)tone;
- (id)cast;
- (id)copyWithZone:(_NSZone *)a3;
- (id)defaultName;
- (id)identifier;
- (id)style;
- (void)resetToDefault;
- (void)updateWithTone:(double)a3 color:(double)a4 intensity:(double)a5;
@end

@implementation PXPhotoStyleElementWrapper

- (void).cxx_destruct
{
}

- (id)copyWithZone:(_NSZone *)a3
{
  v3 = (void *)[(PXPhotoStyleElement *)self->_underlyingStyleElement copy];
  v4 = (void *)[objc_alloc((Class)objc_opt_class()) initWithPhotoStyleElement:v3];

  return v4;
}

- (id)style
{
  return self->_underlyingStyleElement;
}

- (void)resetToDefault
{
}

- (void)updateWithTone:(double)a3 color:(double)a4 intensity:(double)a5
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  if (![(PXPhotoStyleElement *)self->_underlyingStyleElement updateWithTone:a3 color:a4 intensity:a5])
  {
    v6 = PLPhotoEditGetLog();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      int v7 = 138412290;
      v8 = self;
      _os_log_impl(&dword_1A9AE7000, v6, OS_LOG_TYPE_DEFAULT, "Unable to update style %@", (uint8_t *)&v7, 0xCu);
    }
  }
}

- (BOOL)hasNonDefaultValues
{
  return [(PXPhotoStyleElement *)self->_underlyingStyleElement hasNonDefaultValues];
}

- (double)defaultIntensity
{
  [(PXPhotoStyleElement *)self->_underlyingStyleElement defaultIntensity];
  return result;
}

- (double)defaultColor
{
  [(PXPhotoStyleElement *)self->_underlyingStyleElement defaultColor];
  return result;
}

- (double)defaultTone
{
  [(PXPhotoStyleElement *)self->_underlyingStyleElement defaultTone];
  return result;
}

- (id)cast
{
  return [(PXPhotoStyleElement *)self->_underlyingStyleElement cast];
}

- (double)intensity
{
  [(PXPhotoStyleElement *)self->_underlyingStyleElement intensity];
  return result;
}

- (double)color
{
  [(PXPhotoStyleElement *)self->_underlyingStyleElement color];
  return result;
}

- (double)tone
{
  [(PXPhotoStyleElement *)self->_underlyingStyleElement tone];
  return result;
}

- (id)defaultName
{
  return [(PXPhotoStyleElement *)self->_underlyingStyleElement defaultName];
}

- (id)identifier
{
  return [(PXPhotoStyleElement *)self->_underlyingStyleElement id];
}

- (PXPhotoStyleElementWrapper)initWithPhotoStyleElement:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)PXPhotoStyleElementWrapper;
  v6 = [(PXPhotoStyleElementWrapper *)&v9 init];
  int v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_underlyingStyleElement, a3);
  }

  return v7;
}

+ (id)wrapperWithPhotoStyleElement:(id)a3
{
  id v3 = a3;
  v4 = [[PXPhotoStyleElementWrapper alloc] initWithPhotoStyleElement:v3];

  return v4;
}

+ (id)allDefaultStyles
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  v2 = +[PXPhotoStyleCollection allDefaultStyles];
  id v3 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(v2, "count"));
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v4 = v2;
  uint64_t v5 = [v4 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v14;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v14 != v7) {
          objc_enumerationMutation(v4);
        }
        uint64_t v9 = *(void *)(*((void *)&v13 + 1) + 8 * i);
        v10 = [PXPhotoStyleElementWrapper alloc];
        v11 = -[PXPhotoStyleElementWrapper initWithPhotoStyleElement:](v10, "initWithPhotoStyleElement:", v9, (void)v13);
        [v3 addObject:v11];
      }
      uint64_t v6 = [v4 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v6);
  }

  return v3;
}

@end