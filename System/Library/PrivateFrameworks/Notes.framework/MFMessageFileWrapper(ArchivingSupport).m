@interface MFMessageFileWrapper(ArchivingSupport)
+ (void)supportedArchivedClassNames;
- (char)initWithCoder:()ArchivingSupport;
- (void)encodeWithCoder:()ArchivingSupport;
@end

@implementation MFMessageFileWrapper(ArchivingSupport)

+ (void)supportedArchivedClassNames
{
  return &unk_1F26798C8;
}

- (void)encodeWithCoder:()ArchivingSupport
{
  uint64_t v4 = *(void *)(a1 + (int)*MEMORY[0x1E4F73600]);
  id v5 = a3;
  [v5 encodeObject:v4 forKey:@"path"];
  [v5 encodeObject:*(void *)(a1 + (int)*MEMORY[0x1E4F735F0]) forKey:@"filename"];
  [v5 encodeObject:*(void *)(a1 + (int)*MEMORY[0x1E4F73608]) forKey:@"preferredFilename"];
  [v5 encodeObject:*(void *)(a1 + (int)*MEMORY[0x1E4F735E8]) forKey:@"data"];
  [v5 encodeObject:*(void *)(a1 + (int)*MEMORY[0x1E4F735E0]) forKey:@"attributes"];
  [v5 encodeObject:*(void *)(a1 + (int)*MEMORY[0x1E4F735F8]) forKey:@"linkDestination"];
  [v5 encodeObject:*(void *)(a1 + (int)*MEMORY[0x1E4F73610]) forKey:@"url"];
}

- (char)initWithCoder:()ArchivingSupport
{
  id v4 = a3;
  v29.receiver = a1;
  v29.super_class = (Class)&off_1F2680F60;
  id v5 = (char *)objc_msgSendSuper2(&v29, sel_init);
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectForKey:@"path"];
    uint64_t v7 = (int)*MEMORY[0x1E4F73600];
    v8 = *(void **)&v5[v7];
    *(void *)&v5[v7] = v6;

    uint64_t v9 = [v4 decodeObjectForKey:@"filename"];
    uint64_t v10 = (int)*MEMORY[0x1E4F735F0];
    v11 = *(void **)&v5[v10];
    *(void *)&v5[v10] = v9;

    uint64_t v12 = [v4 decodeObjectForKey:@"preferredFilename"];
    uint64_t v13 = (int)*MEMORY[0x1E4F73608];
    v14 = *(void **)&v5[v13];
    *(void *)&v5[v13] = v12;

    v15 = [v4 decodeObjectForKey:@"data"];
    uint64_t v16 = [objc_alloc(MEMORY[0x1E4F734C0]) initWithImmutableData:v15];
    uint64_t v17 = (int)*MEMORY[0x1E4F735E8];
    v18 = *(void **)&v5[v17];
    *(void *)&v5[v17] = v16;

    uint64_t v19 = [v4 decodeObjectForKey:@"attributes"];
    uint64_t v20 = (int)*MEMORY[0x1E4F735E0];
    v21 = *(void **)&v5[v20];
    *(void *)&v5[v20] = v19;

    uint64_t v22 = [v4 decodeObjectForKey:@"linkDestination"];
    uint64_t v23 = (int)*MEMORY[0x1E4F735F8];
    v24 = *(void **)&v5[v23];
    *(void *)&v5[v23] = v22;

    uint64_t v25 = [v4 decodeObjectForKey:@"url"];
    uint64_t v26 = (int)*MEMORY[0x1E4F73610];
    v27 = *(void **)&v5[v26];
    *(void *)&v5[v26] = v25;
  }
  return v5;
}

@end