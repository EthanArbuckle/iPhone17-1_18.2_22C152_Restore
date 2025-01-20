@interface SREQueryIntent
+ (id)queryIntentWithGenres:(id)a3;
- (NSSet)genres;
- (SREQueryIntent)init;
- (void)setGenres:(id)a3;
@end

@implementation SREQueryIntent

+ (id)queryIntentWithGenres:(id)a3
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  id v3 = a3;
  v4 = objc_alloc_init(SREQueryIntent);
  v5 = objc_msgSend(MEMORY[0x263EFF9C0], "setWithCapacity:", objc_msgSend(v3, "count"));
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  id v6 = v3;
  uint64_t v7 = [v6 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v13;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v13 != v9) {
          objc_enumerationMutation(v6);
        }
        objc_msgSend(v5, "addObject:", *(void *)(*((void *)&v12 + 1) + 8 * i), (void)v12);
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v8);
  }

  [(SREQueryIntent *)v4 setGenres:v5];
  return v4;
}

- (SREQueryIntent)init
{
  v3.receiver = self;
  v3.super_class = (Class)SREQueryIntent;
  return [(SREQueryIntent *)&v3 init];
}

- (NSSet)genres
{
  return self->_genres;
}

- (void)setGenres:(id)a3
{
}

- (void).cxx_destruct
{
}

@end