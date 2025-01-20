@interface PKMutableMediaCol
- (NSString)mediaSource;
- (NSString)mediaType;
- (PKMediaSize)mediaSize;
- (PKMutableMediaCol)init;
- (id)makeMediaCol;
- (void)setMarginsTop:(int)a3 left:(int)a4 bottom:(int)a5 right:(int)a6;
- (void)setMediaSize:(id)a3;
- (void)setMediaSource:(id)a3;
- (void)setMediaType:(id)a3;
- (void)setValue:(id)a3 forKey:(id)a4;
@end

@implementation PKMutableMediaCol

- (PKMutableMediaCol)init
{
  v6.receiver = self;
  v6.super_class = (Class)PKMutableMediaCol;
  v2 = [(PKMutableMediaCol *)&v6 init];
  if (v2)
  {
    uint64_t v3 = objc_opt_new();
    dict = v2->_dict;
    v2->_dict = (NSMutableDictionary *)v3;
  }
  return v2;
}

- (void)setMarginsTop:(int)a3 left:(int)a4 bottom:(int)a5 right:(int)a6
{
  uint64_t v7 = 0;
  uint64_t v18 = *MEMORY[0x263EF8340];
  v10 = @"media-bottom-margin";
  int v11 = a5;
  v12 = @"media-left-margin";
  int v13 = a4;
  v14 = @"media-top-margin";
  int v15 = a3;
  v16 = @"media-right-margin";
  int v17 = a6;
  do
  {
    v8 = [NSNumber numberWithInt:*(unsigned int *)((char *)&v10 + v7 + 8)];
    [(PKMutableMediaCol *)self setValue:v8 forKey:*(__CFString **)((char *)&v10 + v7)];

    v7 += 16;
  }
  while (v7 != 64);
  for (uint64_t i = 48; i != -16; i -= 16)
}

- (void)setValue:(id)a3 forKey:(id)a4
{
}

- (id)makeMediaCol
{
  uint64_t v3 = objc_opt_new();
  v4 = [(PKMutableMediaCol *)self mediaSize];

  if (v4)
  {
    v5 = [(PKMutableMediaCol *)self mediaSize];
    objc_super v6 = [v5 collection];
    [v3 _addCollection:0 name:@"media-size" value:v6];
  }
  uint64_t v7 = [MEMORY[0x263EFFA08] setWithArray:&unk_26E265030];
  v8 = [MEMORY[0x263EFFA08] setWithArray:&unk_26E265048];
  dict = self->_dict;
  v15[0] = MEMORY[0x263EF8330];
  v15[1] = 3221225472;
  v15[2] = __33__PKMutableMediaCol_makeMediaCol__block_invoke;
  v15[3] = &unk_2649EE640;
  id v10 = v7;
  id v16 = v10;
  id v11 = v3;
  id v17 = v11;
  id v12 = v8;
  id v18 = v12;
  [(NSMutableDictionary *)dict enumerateKeysAndObjectsUsingBlock:v15];
  int v13 = [(PKCollectionSpecialization *)[PKMediaCol alloc] initWithCollection:v11];

  return v13;
}

void __33__PKMutableMediaCol_makeMediaCol__block_invoke(id *a1, void *a2, void *a3)
{
  id v6 = a2;
  id v5 = a3;
  if ([a1[4] containsObject:v6])
  {
    objc_msgSend(a1[5], "_addInteger:valueTag:name:value:", 0, 33, v6, objc_msgSend(v5, "intValue"));
  }
  else if ([a1[6] containsObject:v6])
  {
    [a1[5] _addString:0 valueTag:68 name:v6 lang:0 value:v5];
  }
}

- (NSString)mediaSource
{
  return (NSString *)[(NSMutableDictionary *)self->_dict objectForKeyedSubscript:@"media-source"];
}

- (void)setMediaSource:(id)a3
{
}

- (NSString)mediaType
{
  return (NSString *)[(NSMutableDictionary *)self->_dict objectForKeyedSubscript:@"media-type"];
}

- (void)setMediaType:(id)a3
{
}

- (PKMediaSize)mediaSize
{
  return (PKMediaSize *)objc_getProperty(self, a2, 16, 1);
}

- (void)setMediaSize:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_mediaSize, 0);

  objc_storeStrong((id *)&self->_dict, 0);
}

@end