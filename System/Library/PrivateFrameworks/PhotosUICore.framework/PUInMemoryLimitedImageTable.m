@interface PUInMemoryLimitedImageTable
- (id)imageForItemAtIndex:(unint64_t)a3;
- (void)removeItemAtIndex:(unint64_t)a3;
- (void)setImage:(id)a3 forItemAtIndex:(unint64_t)a4;
@end

@implementation PUInMemoryLimitedImageTable

- (void).cxx_destruct
{
}

- (void)removeItemAtIndex:(unint64_t)a3
{
  v3 = *(void **)&self->super._indexCounter;
  id v4 = [NSNumber numberWithUnsignedInteger:a3];
  [v3 removeObjectForKey:v4];
}

- (id)imageForItemAtIndex:(unint64_t)a3
{
  v3 = *(void **)&self->super._indexCounter;
  id v4 = [NSNumber numberWithUnsignedInteger:a3];
  v5 = [v3 objectForKey:v4];

  return v5;
}

- (void)setImage:(id)a3 forItemAtIndex:(unint64_t)a4
{
  id v10 = a3;
  v6 = *(void **)&self->super._indexCounter;
  if (!v6)
  {
    id v7 = objc_alloc_init(MEMORY[0x1E4F1C998]);
    v8 = *(void **)&self->super._indexCounter;
    *(void *)&self->super._indexCounter = v7;

    [*(id *)&self->super._indexCounter setCountLimit:20];
    v6 = *(void **)&self->super._indexCounter;
  }
  v9 = [NSNumber numberWithUnsignedInteger:a4];
  [v6 setObject:v10 forKey:v9];
}

@end