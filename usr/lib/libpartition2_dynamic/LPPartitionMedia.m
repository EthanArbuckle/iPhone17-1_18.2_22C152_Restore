@interface LPPartitionMedia
+ (id)contentTypesForPartitionMedia;
+ (id)primaryMedia;
+ (id)supportedContentTypes;
- (id)children;
@end

@implementation LPPartitionMedia

+ (id)supportedContentTypes
{
  if ((id)objc_opt_class() == a1)
  {
    id v3 = (id)[a1 contentTypesForPartitionMedia];
  }
  else
  {
    v5.receiver = a1;
    v5.super_class = (Class)&OBJC_METACLASS___LPPartitionMedia;
    id v3 = [super supportedContentTypes];
  }

  return v3;
}

+ (id)contentTypesForPartitionMedia
{
  return &unk_26C28B150;
}

+ (id)primaryMedia
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  id v2 = +[LPMedia allMedia];
  id v3 = (id)[v2 countByEnumeratingWithState:&v8 objects:v12 count:16];
  if (v3)
  {
    uint64_t v4 = *(void *)v9;
    while (2)
    {
      for (i = 0; i != v3; i = (char *)i + 1)
      {
        if (*(void *)v9 != v4) {
          objc_enumerationMutation(v2);
        }
        v6 = *(void **)(*((void *)&v8 + 1) + 8 * i);
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0 && objc_msgSend(v6, "isPrimaryMedia", (void)v8))
        {
          id v3 = v6;
          goto LABEL_12;
        }
      }
      id v3 = (id)[v2 countByEnumeratingWithState:&v8 objects:v12 count:16];
      if (v3) {
        continue;
      }
      break;
    }
  }
LABEL_12:

  return v3;
}

- (id)children
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  id v3 = (id)[MEMORY[0x263EFF980] arrayWithCapacity:16];
  io_object_t v16 = 0;
  if (MEMORY[0x210570C50]([(LPMedia *)self ioMedia], "IOService", 1, &v16))
  {
    _os_log_pack_size();
    *(_WORD *)_os_log_pack_fill() = 0;
    _LPLogPack(1);
    id v4 = (id)MEMORY[0x263EFFA68];
  }
  else
  {
    uint64_t v5 = v16;
    v13[0] = MEMORY[0x263EF8330];
    v13[1] = 3254779904;
    v13[2] = __28__LPPartitionMedia_children__block_invoke;
    v13[3] = &__block_descriptor_44_e8_32s_e8_v12__0I8l;
    io_object_t v15 = v16;
    id v14 = v3;
    uint64_t v8 = MEMORY[0x263EF8330];
    uint64_t v9 = 3254779904;
    long long v10 = __28__LPPartitionMedia_children__block_invoke_12;
    long long v11 = &__block_descriptor_40_e8_32s_e5_v8__0l;
    id v6 = v14;
    id v12 = v6;
    iterateSafely(v5, 3, v13, &v8);
    IOObjectRelease(v16);
    id v4 = [(id)[MEMORY[0x263EFF8C0] arrayWithArray:v6, v8, v9, v10, v11];
  }

  return v4;
}

void __28__LPPartitionMedia_children__block_invoke(uint64_t a1, uint64_t object)
{
  if (IOObjectConformsTo(object, "IOMedia"))
  {
    MEMORY[0x210570C90](*(unsigned int *)(a1 + 40));
    id v4 = +[LPMedia mediaOfCorrectTypeGivenIOMedia:object];
    if (v4) {
      [*(id *)(a1 + 32) addObject:v4];
    }
  }
}

uint64_t __28__LPPartitionMedia_children__block_invoke_12(uint64_t a1)
{
  return [*(id *)(a1 + 32) removeAllObjects];
}

@end