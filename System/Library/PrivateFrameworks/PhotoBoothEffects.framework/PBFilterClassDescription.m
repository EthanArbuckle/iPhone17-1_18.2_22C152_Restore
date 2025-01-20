@interface PBFilterClassDescription
+ (id)classDescriptionForClass:(Class)a3;
- (PBFilterClassDescription)initWithClass:(Class)a3;
- (id)attributes;
- (id)inputKeys;
@end

@implementation PBFilterClassDescription

+ (id)classDescriptionForClass:(Class)a3
{
  value = 0;
  pthread_mutex_lock(&classDescriptionForClass__mutex);
  if (classDescriptionForClass__table)
  {
    if (CFDictionaryGetValueIfPresent((CFDictionaryRef)classDescriptionForClass__table, a3, (const void **)&value)) {
      goto LABEL_8;
    }
  }
  else
  {
    classDescriptionForClass__table = (uint64_t)CFDictionaryCreateMutable(0, 0, 0, MEMORY[0x263EFFF90]);
  }
  pthread_mutex_unlock(&classDescriptionForClass__mutex);
  value = [[PBFilterClassDescription alloc] initWithClass:a3];
  pthread_mutex_lock(&classDescriptionForClass__mutex);
  if (value && classDescriptionForClass__table) {
    CFDictionarySetValue((CFMutableDictionaryRef)classDescriptionForClass__table, a3, value);
  }
LABEL_8:
  pthread_mutex_unlock(&classDescriptionForClass__mutex);
  return value;
}

- (PBFilterClassDescription)initWithClass:(Class)a3
{
  v22.receiver = self;
  v22.super_class = (Class)PBFilterClassDescription;
  v4 = [(PBFilterClassDescription *)&v22 init];
  if (v4)
  {
    v5 = (void *)[MEMORY[0x263EFF980] array];
    unsigned int outCount = 0;
    v6 = class_copyIvarList(a3, &outCount);
    if (v6)
    {
      v7 = v6;
      if (outCount)
      {
        for (unint64_t i = 0; i < outCount; ++i)
        {
          Name = ivar_getName(v7[i]);
          int v10 = strlen(Name);
          uint64_t v11 = [NSString stringWithCString:Name encoding:1];
          if (v10 >= 6)
          {
            uint64_t v12 = v11;
            if (!strncmp("input", Name, 5uLL) && ([v5 containsObject:v12] & 1) == 0) {
              [v5 addObject:v12];
            }
          }
        }
      }
      free(v7);
    }
    v13 = class_copyPropertyList(a3, &outCount);
    if (v13)
    {
      v14 = v13;
      if (outCount)
      {
        for (unint64_t j = 0; j < outCount; ++j)
        {
          v16 = property_getName(v14[j]);
          int v17 = strlen(v16);
          uint64_t v18 = [NSString stringWithCString:v16 encoding:1];
          if (v17 >= 6)
          {
            uint64_t v19 = v18;
            if (!strncmp("input", v16, 5uLL) && ([v5 containsObject:v19] & 1) == 0) {
              [v5 addObject:v19];
            }
          }
        }
      }
      free(v14);
    }
    v4->_inputKeys = (NSArray *)[v5 copy];
  }
  return v4;
}

- (id)attributes
{
  return self->_attributes;
}

- (id)inputKeys
{
  return self->_inputKeys;
}

@end