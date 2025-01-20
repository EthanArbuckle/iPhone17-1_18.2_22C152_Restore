@interface OITSUObjectSnapshot
- (OITSUObjectSnapshot)init;
- (void)calibrate:(id)a3;
- (void)compare;
- (void)dealloc;
- (void)p_clear;
@end

@implementation OITSUObjectSnapshot

- (OITSUObjectSnapshot)init
{
  v3.receiver = self;
  v3.super_class = (Class)OITSUObjectSnapshot;
  result = [(OITSUObjectSnapshot *)&v3 init];
  if (result)
  {
    result->mEntryCount = 0;
    result->mSnapshot = 0;
    result->mCompared = 0;
  }
  return result;
}

- (void)calibrate:(id)a3
{
  [(OITSUObjectSnapshot *)self p_clear];
  self->mCompared = (NSArray *)a3;
  unint64_t v5 = [a3 count];
  self->mEntryCount = v5;
  if (a3)
  {
    if (v5)
    {
      self->mSnapshot = (void **)malloc_type_malloc(8 * v5, 0x80040B8603338uLL);
      if (self->mEntryCount)
      {
        unint64_t v6 = 0;
        do
        {
          [a3 objectAtIndex:v6];
          v7 = (objc_class *)objc_opt_class();
          size_t InstanceSize = class_getInstanceSize(v7);
          self->mSnapshot[v6] = malloc_type_malloc(InstanceSize, 0x3484A610uLL);
          memcpy(self->mSnapshot[v6], (const void *)[a3 objectAtIndex:v6], InstanceSize);
          ++v6;
        }
        while (v6 < self->mEntryCount);
      }
    }
  }
}

- (void)compare
{
  if (self->mEntryCount)
  {
    unint64_t v3 = 0;
    do
    {
      id v4 = [(NSArray *)self->mCompared objectAtIndex:v3];
      Superclass = (objc_class *)objc_opt_class();
      unint64_t v6 = self->mSnapshot[v3];
      do
      {
        unsigned int outCount = 0;
        v7 = class_copyIvarList(Superclass, &outCount);
        if (outCount)
        {
          for (unint64_t i = 0; i < outCount; ++i)
          {
            v9 = v7[i];
            object_getIvar(v6, v9);
            object_getIvar(v4, v9);
          }
        }
        free(v7);
        Superclass = class_getSuperclass(Superclass);
      }
      while (Superclass != (objc_class *)objc_opt_class());
      ++v3;
    }
    while (v3 < self->mEntryCount);
  }
}

- (void)p_clear
{
  if (self->mEntryCount)
  {
    unint64_t v3 = 0;
    do
      free(self->mSnapshot[v3++]);
    while (v3 < self->mEntryCount);
  }

  self->mCompared = 0;
  free(self->mSnapshot);
  self->mSnapshot = 0;
}

- (void)dealloc
{
  [(OITSUObjectSnapshot *)self p_clear];
  v3.receiver = self;
  v3.super_class = (Class)OITSUObjectSnapshot;
  [(OITSUObjectSnapshot *)&v3 dealloc];
}

@end