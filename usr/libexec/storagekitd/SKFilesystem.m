@interface SKFilesystem
+ (id)buildFilesystems;
- (BOOL)supportsJournaling;
@end

@implementation SKFilesystem

+ (id)buildFilesystems
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100006570;
  block[3] = &unk_100048BE8;
  block[4] = a1;
  if (qword_100055A68 != -1) {
    dispatch_once(&qword_100055A68, block);
  }
  p_vtable = SKVolume.vtable;
  id v4 = (id)qword_100055A78;
  objc_sync_enter(v4);
  if (byte_100055A80)
  {
    p_vtable = (void **)(id)qword_100055A70;
    int v5 = 1;
  }
  else
  {
    v6 = [a1 extensionFilesystemsMapping];
    id v7 = [v6 count];
    byte_100055A80 = v7 != 0;
    if (v7)
    {
      [(id)qword_100055A78 addEntriesFromDictionary:v6];
      uint64_t v8 = +[SKFilesystem collectFilesystemsWithPersonalityMapping:qword_100055A78];
      v9 = (void *)qword_100055A70;
      qword_100055A70 = v8;

      int v5 = 0;
    }
    else
    {
      p_vtable = (void **)(id)qword_100055A70;
      int v5 = 1;
    }
  }
  objc_sync_exit(v4);

  if (!v5) {
    p_vtable = (void **)(id)qword_100055A70;
  }

  return p_vtable;
}

- (BOOL)supportsJournaling
{
  v3 = [(SKFilesystem *)self dmPersonality];
  if ([v3 isEqualToString:@"HFS+"])
  {
    unsigned __int8 v4 = 1;
  }
  else
  {
    int v5 = [(SKFilesystem *)self dmPersonality];
    if ([v5 isEqualToString:@"Journaled HFS+"])
    {
      unsigned __int8 v4 = 1;
    }
    else
    {
      v6 = [(SKFilesystem *)self dmPersonality];
      if ([v6 isEqualToString:@"Case-sensitive HFS+"])
      {
        unsigned __int8 v4 = 1;
      }
      else
      {
        id v7 = [(SKFilesystem *)self dmPersonality];
        unsigned __int8 v4 = [v7 isEqualToString:@"Case-sensitive Journaled HFS+"];
      }
    }
  }
  return v4;
}

@end