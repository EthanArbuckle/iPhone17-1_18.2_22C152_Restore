@interface OCXRelationships
- (BOOL)isEmpty;
- (OCXRelationships)initWithPath:(id)a3;
- (id)addRelationshipForKey:(id)a3 type:(id)a4 target:(id)a5;
- (id)addRelationshipForKey:(id)a3 type:(id)a4 target:(id)a5 external:(BOOL)a6;
- (id)idForKey:(id)a3;
- (id)path;
- (id)targetForKey:(id)a3;
- (void)writeRelationshipsToFilename:(id)a3 stream:(id)a4;
@end

@implementation OCXRelationships

- (OCXRelationships)initWithPath:(id)a3
{
  id v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)OCXRelationships;
  v5 = [(OCXRelationships *)&v13 init];
  if (v5)
  {
    uint64_t v6 = [v4 copy];
    mPath = v5->mPath;
    v5->mPath = (NSString *)v6;

    v8 = (NSMutableArray *)objc_alloc_init(MEMORY[0x263EFF980]);
    mRelationships = v5->mRelationships;
    v5->mRelationships = v8;

    v10 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x263EFF9A0]);
    mRelationshipMap = v5->mRelationshipMap;
    v5->mRelationshipMap = v10;
  }
  return v5;
}

- (id)path
{
  return self->mPath;
}

- (BOOL)isEmpty
{
  return [(NSMutableArray *)self->mRelationships count] == 0;
}

- (id)addRelationshipForKey:(id)a3 type:(id)a4 target:(id)a5
{
  v5 = [(OCXRelationships *)self addRelationshipForKey:a3 type:a4 target:a5 external:0];
  return v5;
}

- (id)addRelationshipForKey:(id)a3 type:(id)a4 target:(id)a5 external:(BOOL)a6
{
  BOOL v25 = a6;
  uint64_t v33 = *MEMORY[0x263EF8340];
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v26 = self;
  v27 = v9;
  if (v9)
  {
    v12 = [(NSMutableDictionary *)self->mRelationshipMap objectForKey:v9];
    objc_super v13 = v12;
    if (v12)
    {
      v14 = [v12 idString];

      goto LABEL_19;
    }
  }
  else
  {
    long long v30 = 0u;
    long long v31 = 0u;
    long long v28 = 0u;
    long long v29 = 0u;
    v15 = self->mRelationships;
    uint64_t v16 = [(NSMutableArray *)v15 countByEnumeratingWithState:&v28 objects:v32 count:16];
    if (v16)
    {
      uint64_t v17 = *(void *)v29;
      do
      {
        for (uint64_t i = 0; i != v16; ++i)
        {
          if (*(void *)v29 != v17) {
            objc_enumerationMutation(v15);
          }
          v19 = *(void **)(*((void *)&v28 + 1) + 8 * i);
          v20 = [v19 type];
          if ([v20 isEqualToString:v10])
          {
            v21 = [v19 target];
            int v22 = [v21 isEqualToString:v11];

            if (v22)
            {
              v14 = [v19 idString];

              goto LABEL_19;
            }
          }
          else
          {
          }
        }
        uint64_t v16 = [(NSMutableArray *)v15 countByEnumeratingWithState:&v28 objects:v32 count:16];
      }
      while (v16);
    }
  }
  ++v26->mNextId;
  v23 = [[OCXRelationship alloc] initWithId:v26->mNextId type:v10 target:v11 external:v25];
  [(NSMutableArray *)v26->mRelationships addObject:v23];
  if (v27) {
    [(NSMutableDictionary *)v26->mRelationshipMap setObject:v23 forKey:v27];
  }
  v14 = [(OCXRelationship *)v23 idString];

LABEL_19:
  return v14;
}

- (id)idForKey:(id)a3
{
  v3 = [(NSMutableDictionary *)self->mRelationshipMap objectForKey:a3];
  id v4 = [v3 idString];

  return v4;
}

- (id)targetForKey:(id)a3
{
  v3 = [(NSMutableDictionary *)self->mRelationshipMap objectForKey:a3];
  id v4 = [v3 target];

  return v4;
}

- (void)writeRelationshipsToFilename:(id)a3 stream:(id)a4
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  if ([(NSMutableArray *)self->mRelationships count])
  {
    id v8 = +[TCXmlStreamWriter newXmlStreamWriterWithZipEntryName:v6 outputStream:v7 isCompressed:1];
    [v8 setUp];
    [v8 startElement:@"Relationships" prefix:0 ns:"http://schemas.openxmlformats.org/package/2006/relationships"];
    long long v15 = 0u;
    long long v16 = 0u;
    long long v13 = 0u;
    long long v14 = 0u;
    id v9 = self->mRelationships;
    uint64_t v10 = [(NSMutableArray *)v9 countByEnumeratingWithState:&v13 objects:v17 count:16];
    if (v10)
    {
      uint64_t v11 = *(void *)v14;
      do
      {
        uint64_t v12 = 0;
        do
        {
          if (*(void *)v14 != v11) {
            objc_enumerationMutation(v9);
          }
          objc_msgSend(*(id *)(*((void *)&v13 + 1) + 8 * v12++), "writeToStreamWriter:", v8, (void)v13);
        }
        while (v10 != v12);
        uint64_t v10 = [(NSMutableArray *)v9 countByEnumeratingWithState:&v13 objects:v17 count:16];
      }
      while (v10);
    }

    [v8 endElement];
    [v8 tearDown];
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->mRelationshipMap, 0);
  objc_storeStrong((id *)&self->mRelationships, 0);
  objc_storeStrong((id *)&self->mPath, 0);
}

@end