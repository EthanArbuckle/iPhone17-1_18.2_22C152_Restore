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
    id v3 = [a1 contentTypesForPartitionMedia];
  }
  else
  {
    v5.receiver = a1;
    v5.super_class = (Class)&OBJC_METACLASS___LPPartitionMedia;
    id v3 = objc_msgSendSuper2(&v5, "supportedContentTypes");
  }
  return v3;
}

+ (id)contentTypesForPartitionMedia
{
  v4[0] = @"GUID_partition_scheme";
  v4[1] = @"FDisk_partition_scheme";
  v4[2] = @"Apple_partition_scheme";
  v2 = +[NSArray arrayWithObjects:v4 count:3];
  return v2;
}

+ (id)primaryMedia
{
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  id v2 = +[LPMedia allMedia];
  id v3 = [v2 countByEnumeratingWithState:&v8 objects:v12 count:16];
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
      id v3 = [v2 countByEnumeratingWithState:&v8 objects:v12 count:16];
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
  id v3 = +[NSMutableArray arrayWithCapacity:16];
  io_iterator_t iterator = 0;
  if (IORegistryEntryCreateIterator([(LPMedia *)self ioMedia], "IOService", 1u, &iterator))
  {
    _os_log_pack_size();
    *(_WORD *)_os_log_pack_fill() = 0;
    _LPLogPack(1);
    uint64_t v4 = (NSArray *)__NSArray0__;
  }
  else
  {
    io_iterator_t v5 = iterator;
    v13[0] = _NSConcreteStackBlock;
    v13[1] = 3254779904;
    v13[2] = __28__LPPartitionMedia_children__block_invoke;
    v13[3] = &__block_descriptor_44_e8_32s_e8_v12__0I8l;
    io_iterator_t v15 = iterator;
    v14 = v3;
    long long v8 = _NSConcreteStackBlock;
    uint64_t v9 = 3254779904;
    long long v10 = __28__LPPartitionMedia_children__block_invoke_13;
    long long v11 = &__block_descriptor_40_e8_32s_e5_v8__0l;
    v6 = v14;
    v12 = v6;
    iterateSafely(v5, 3, v13, &v8);
    IOObjectRelease(iterator);
    uint64_t v4 = +[NSArray arrayWithArray:](NSArray, "arrayWithArray:", v6, v8, v9, v10, v11);
  }
  return v4;
}

void __28__LPPartitionMedia_children__block_invoke(uint64_t a1, uint64_t object)
{
  if (IOObjectConformsTo(object, "IOMedia"))
  {
    IORegistryIteratorExitEntry(*(_DWORD *)(a1 + 40));
    id v4 = +[LPMedia mediaOfCorrectTypeGivenIOMedia:object];
    if (v4) {
      [*(id *)(a1 + 32) addObject:v4];
    }
  }
}

id __28__LPPartitionMedia_children__block_invoke_13(uint64_t a1)
{
  return [*(id *)(a1 + 32) removeAllObjects];
}

@end