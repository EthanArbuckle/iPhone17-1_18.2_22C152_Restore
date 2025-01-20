@interface LPAPFSPhysicalStore
+ (id)supportedContentTypes;
- (id)container;
- (id)parent;
- (int)role;
@end

@implementation LPAPFSPhysicalStore

+ (id)supportedContentTypes
{
  if ((id)objc_opt_class() == a1)
  {
    v6[0] = LPAPFSPhysicalStoreMediaUUID[0];
    v6[1] = LPAPFSPhysicalStoreDiagsMediaUUID[0];
    v6[2] = LPAPFSPhysicalStoreRecoveryMediaUUID[0];
    v3 = +[NSArray arrayWithObjects:v6 count:3];
  }
  else
  {
    v5.receiver = a1;
    v5.super_class = (Class)&OBJC_METACLASS___LPAPFSPhysicalStore;
    v3 = (NSArray *)objc_msgSendSuper2(&v5, "supportedContentTypes");
  }
  return v3;
}

- (int)role
{
  id v2 = [(LPMedia *)self content];
  v3 = v2;
  if (!v2)
  {
    _os_log_pack_size();
    uint64_t v5 = _os_log_pack_fill();
    *(_DWORD *)uint64_t v5 = 136315138;
    *(void *)(v5 + 4) = "-[LPAPFSPhysicalStore role]";
    _LPLogPack(1);
    goto LABEL_7;
  }
  if (([v2 isEqualToString:LPAPFSPhysicalStoreDiagsMediaUUID[0]] & 1) == 0)
  {
    if ([v3 isEqualToString:LPAPFSPhysicalStoreRecoveryMediaUUID[0]])
    {
      int v4 = 2;
      goto LABEL_8;
    }
LABEL_7:
    int v4 = 0;
    goto LABEL_8;
  }
  int v4 = 1;
LABEL_8:

  return v4;
}

- (id)parent
{
  io_iterator_t iterator = 0;
  if (IORegistryEntryCreateIterator([(LPMedia *)self ioMedia], "IOService", 3u, &iterator))
  {
    _os_log_pack_size();
    uint64_t v2 = _os_log_pack_fill();
    *(_DWORD *)uint64_t v2 = 136315138;
    *(void *)(v2 + 4) = "-[LPAPFSPhysicalStore parent]";
    _LPLogPack(1);
LABEL_3:
    v3 = 0;
    goto LABEL_4;
  }
  uint64_t v5 = IOIteratorNext(iterator);
  if (!v5) {
    goto LABEL_3;
  }
  uint64_t v6 = v5;
  v3 = 0;
  do
  {
    if (IOObjectConformsTo(v6, "IOMedia")
      && (CFStringRef CFProperty = (const __CFString *)IORegistryEntryCreateCFProperty(v6, @"Content", 0, 0)) != 0)
    {
      CFStringRef v8 = CFProperty;
      CFTypeID v9 = CFGetTypeID(CFProperty);
      if (v9 == CFStringGetTypeID())
      {
        long long v21 = 0u;
        long long v20 = 0u;
        long long v19 = 0u;
        long long v18 = 0u;
        id v10 = +[LPPartitionMedia contentTypesForPartitionMedia];
        id v11 = [v10 countByEnumeratingWithState:&v18 objects:v23 count:16];
        if (v11)
        {
          id v12 = v11;
          char v13 = 0;
          uint64_t v14 = *(void *)v19;
          do
          {
            for (i = 0; i != v12; i = (char *)i + 1)
            {
              if (*(void *)v19 != v14) {
                objc_enumerationMutation(v10);
              }
              if (CFEqual(*(CFStringRef *)(*((void *)&v18 + 1) + 8 * i), v8))
              {
                v16 = [(LPMedia *)[LPPartitionMedia alloc] initWithIOMediaObject:v6];

                char v13 = 1;
                v3 = v16;
              }
            }
            id v12 = [v10 countByEnumeratingWithState:&v18 objects:v23 count:16];
          }
          while (v12);
        }
        else
        {
          char v13 = 0;
        }
      }
      else
      {
        char v13 = 0;
      }
      CFRelease(v8);
    }
    else
    {
      char v13 = 0;
    }
    uint64_t v17 = IOIteratorNext(iterator);
    if (!v17) {
      break;
    }
    uint64_t v6 = v17;
  }
  while ((v13 & 1) == 0);
LABEL_4:
  return v3;
}

- (id)container
{
  io_iterator_t iterator = 0;
  if (IORegistryEntryCreateIterator([(LPMedia *)self ioMedia], "IOService", 1u, &iterator))
  {
    _os_log_pack_size();
    uint64_t v2 = _os_log_pack_fill();
    *(_DWORD *)uint64_t v2 = 136315138;
    *(void *)(v2 + 4) = "-[LPAPFSPhysicalStore container]";
    _LPLogPack(1);
    v3 = 0;
  }
  else
  {
    uint64_t v4 = IOIteratorNext(iterator);
    if (v4)
    {
      uint64_t v5 = v4;
      v3 = 0;
      do
      {
        if (IOObjectConformsTo(v5, "IOMedia")
          && (CFTypeRef CFProperty = IORegistryEntryCreateCFProperty(v5, @"Content", 0, 0)) != 0)
        {
          v7 = (void *)CFProperty;
          CFTypeID v8 = CFGetTypeID(CFProperty);
          if (v8 == CFStringGetTypeID()
            && [v7 isEqualToString:LPAPFSContainerMediaTypeUUID[0]])
          {
            CFTypeID v9 = [(LPMedia *)[LPAPFSContainer alloc] initWithIOMediaObject:v5];

            int v10 = 1;
            v3 = v9;
          }
          else
          {
            int v10 = 0;
          }
          CFRelease(v7);
        }
        else
        {
          int v10 = 0;
        }
        IOObjectRelease(v5);
        uint64_t v5 = IOIteratorNext(iterator);
        if (v5) {
          BOOL v11 = v10 == 0;
        }
        else {
          BOOL v11 = 0;
        }
      }
      while (v11);
    }
    else
    {
      v3 = 0;
    }
    IOObjectRelease(iterator);
  }
  return v3;
}

@end