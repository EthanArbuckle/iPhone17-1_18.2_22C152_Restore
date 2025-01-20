@interface FPnfsMemNode
- (BOOL)nascent;
- (FPnfsMemFS)fs;
- (FPnfsMemNode)initWithFS:(id)a3 name:(id)a4 parent:(id)a5;
- (FPnfsMemNode)initWithFS:(id)a3 name:(id)a4 parent:(id)a5 locked:(BOOL)a6 mountID:(unsigned int)a7;
- (FPnfsMemNode)parent;
- (NSDate)atime;
- (NSDate)mtime;
- (NSString)fh;
- (NSString)name;
- (id)getattr;
- (id)lookup:(id)a3;
- (id)lookupNode:(id)a3;
- (id)readDirAtCookie:(unint64_t)a3 withVerifier:(unint64_t)a4 forBytes:(unint64_t)a5 andError:(int *)a6;
- (id)readDirAttrAtCookie:(unint64_t)a3 withVerifier:(unint64_t)a4 forBytes:(unint64_t)a5 andError:(int *)a6;
- (int)mkDir:(id)a3 fhBuffer:(id *)a4;
- (int)mkDir:(id)a3 fhBuffer:(id *)a4 locked:(BOOL)a5;
- (int)mkDirPlaceholder:(id)a3 fhBuffer:(id *)a4 wellKnownMount:(unsigned int)a5;
- (int)renameFrom:(id)a3 toName:(id)a4;
- (int)rmDir:(id)a3;
- (unint64_t)verf;
- (unsigned)fileno;
- (void)setNascent:(BOOL)a3;
@end

@implementation FPnfsMemNode

- (FPnfsMemNode)initWithFS:(id)a3 name:(id)a4 parent:(id)a5 locked:(BOOL)a6 mountID:(unsigned int)a7
{
  uint64_t v7 = *(void *)&a7;
  BOOL v8 = a6;
  id v13 = a3;
  id v14 = a4;
  id v15 = a5;
  v29.receiver = self;
  v29.super_class = (Class)FPnfsMemNode;
  v16 = [(FPnfsMemNode *)&v29 init];
  if (v16)
  {
    v17 = (NSMutableArray *)objc_alloc_init((Class)NSMutableArray);
    entries = v16->entries;
    v16->entries = v17;

    if (!v16->entries) {
      goto LABEL_11;
    }
    v19 = (NSDate *)objc_alloc_init((Class)NSDate);
    atime = v16->_atime;
    v16->_atime = v19;

    v21 = v16->_atime;
    if (!v21) {
      goto LABEL_11;
    }
    v22 = (NSDate *)[(NSDate *)v21 copy];
    mtime = v16->_mtime;
    v16->_mtime = v22;

    if (!v16->_mtime) {
      goto LABEL_11;
    }
    id v24 = [v13 nextFileHandle];
    v16->_fileno = v24;
    if (v7) {
      +[NSString stringWithFormat:@"/%8.8x", v7];
    }
    else {
    uint64_t v25 = +[NSString stringWithFormat:@"%10.10u", v24];
    }
    fh = v16->_fh;
    v16->_fh = (NSString *)v25;

    if (!v16->_fh)
    {
LABEL_11:
      v27 = 0;
      goto LABEL_12;
    }
    objc_storeStrong((id *)&v16->_fs, a3);
    objc_storeWeak((id *)&v16->_parent, v15);
    objc_storeStrong((id *)&v16->_name, a4);
    v16->_verf = 1;
    *(_OWORD *)&v16->size = xmmword_100048700;
    [v13 addNode:v16 withLock:v8];
  }
  v27 = v16;
LABEL_12:

  return v27;
}

- (FPnfsMemNode)initWithFS:(id)a3 name:(id)a4 parent:(id)a5
{
  return [(FPnfsMemNode *)self initWithFS:a3 name:a4 parent:a5 locked:0 mountID:0];
}

- (id)lookupNode:(id)a3
{
  id v4 = a3;
  v5 = self;
  objc_sync_enter(v5);
  entries = v5->entries;
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_100018EE0;
  v11[3] = &unk_1000594F0;
  id v7 = v4;
  id v12 = v7;
  id v8 = [(NSMutableArray *)entries indexOfObjectPassingTest:v11];
  if (v8 == (id)0x7FFFFFFFFFFFFFFFLL)
  {
    v9 = 0;
  }
  else
  {
    v9 = [(NSMutableArray *)v5->entries objectAtIndexedSubscript:v8];
  }

  objc_sync_exit(v5);

  return v9;
}

- (id)lookup:(id)a3
{
  v3 = [(FPnfsMemNode *)self lookupNode:a3];
  id v4 = v3;
  if (v3)
  {
    v5 = [v3 fh];
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (int)mkDir:(id)a3 fhBuffer:(id *)a4 locked:(BOOL)a5
{
  id v7 = a3;
  id v8 = self;
  objc_sync_enter(v8);
  entries = v8->entries;
  v17[0] = _NSConcreteStackBlock;
  v17[1] = 3221225472;
  v17[2] = sub_10001911C;
  v17[3] = &unk_1000594F0;
  id v10 = v7;
  id v18 = v10;
  id v11 = [(NSMutableArray *)entries indexOfObjectPassingTest:v17];
  if (v11 == (id)0x7FFFFFFFFFFFFFFFLL)
  {
    id v12 = 0;
    id v13 = 0;
    int v14 = 1;
  }
  else
  {
    id v12 = [(NSMutableArray *)v8->entries objectAtIndexedSubscript:v11];
    id v13 = [v12 fh];
    if ([v12 nascent])
    {
      [v12 setNascent:0];
      int v14 = 0;
    }
    else
    {
      int v14 = 17;
    }
  }

  objc_sync_exit(v8);
  id v15 = v13;
  *a4 = v15;

  return v14;
}

- (int)mkDirPlaceholder:(id)a3 fhBuffer:(id *)a4 wellKnownMount:(unsigned int)a5
{
  uint64_t v5 = *(void *)&a5;
  id v8 = a3;
  v9 = self;
  objc_sync_enter(v9);
  entries = v9->entries;
  v24[0] = _NSConcreteStackBlock;
  v24[1] = 3221225472;
  v24[2] = sub_1000193AC;
  v24[3] = &unk_1000594F0;
  id v11 = v8;
  id v25 = v11;
  id v12 = [(NSMutableArray *)entries indexOfObjectPassingTest:v24];
  if (v12 == (id)0x7FFFFFFFFFFFFFFFLL)
  {
    id v13 = [FPnfsMemNode alloc];
    int v14 = [(FPnfsMemNode *)v9 fs];
    id v15 = [(FPnfsMemNode *)v13 initWithFS:v14 name:v11 parent:v9 locked:0 mountID:v5];

    if (v15)
    {
      [(NSMutableArray *)v9->entries addObject:v15];
      v16 = (NSDate *)objc_alloc_init((Class)NSDate);
      mtime = v9->_mtime;
      v9->_mtime = v16;

      id v18 = [(FPnfsMemNode *)v15 name];
      v9->size += ((unint64_t)[v18 length] + 29) & 0xFFFFFFFFFFFFFFF8;

      v19 = [(FPnfsMemNode *)v15 name];
      v9->dirattrSize += ([v19 length] + 208) & 0xFFFFFFF8;

      ++v9->_verf;
      [(FPnfsMemNode *)v15 setNascent:1];
      v20 = [(FPnfsMemNode *)v15 fh];
      int v21 = 0;
    }
    else
    {
      v20 = 0;
      int v21 = 28;
    }
  }
  else
  {
    id v15 = [(NSMutableArray *)v9->entries objectAtIndexedSubscript:v12];
    v20 = [(FPnfsMemNode *)v15 fh];
    int v21 = 17;
  }

  objc_sync_exit(v9);
  id v22 = v20;
  *a4 = v22;

  return v21;
}

- (int)mkDir:(id)a3 fhBuffer:(id *)a4
{
  return [(FPnfsMemNode *)self mkDir:a3 fhBuffer:a4 locked:0];
}

- (int)renameFrom:(id)a3 toName:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = self;
  objc_sync_enter(v8);
  if ([(NSString *)v8->_name isEqualToString:v6])
  {
    objc_storeStrong((id *)&v8->_name, a4);
    int v9 = 0;
  }
  else
  {
    int v9 = 2;
  }
  objc_sync_exit(v8);

  return v9;
}

- (int)rmDir:(id)a3
{
  id v4 = a3;
  uint64_t v5 = self;
  objc_sync_enter(v5);
  entries = v5->entries;
  v23[0] = _NSConcreteStackBlock;
  v23[1] = 3221225472;
  v23[2] = sub_100019744;
  v23[3] = &unk_1000594F0;
  id v7 = v4;
  id v24 = v7;
  id v8 = [(NSMutableArray *)entries indexOfObjectPassingTest:v23];
  if (v8 == (id)0x7FFFFFFFFFFFFFFFLL)
  {
    int v9 = 2;
  }
  else
  {
    id v10 = [(NSMutableArray *)v5->entries objectAtIndexedSubscript:v8];
    if ([v10[1] count])
    {
      int v9 = 66;
    }
    else
    {
      [(NSMutableArray *)v5->entries removeObjectAtIndex:v8];
      id v11 = [(FPnfsMemNode *)v5 fs];
      [v11 rmNode:v10];

      id v12 = (NSDate *)objc_alloc_init((Class)NSDate);
      mtime = v5->_mtime;
      v5->_mtime = v12;

      int v14 = [v10 name];
      v5->size -= ((unint64_t)[v14 length] + 29) & 0xFFFFFFFFFFFFFFF8;

      id v15 = [v10 name];
      v5->dirattrSize -= ([v15 length] + 208) & 0xFFFFFFF8;

      int v9 = 0;
      ++v5->_verf;
    }
  }
  id v16 = [(NSMutableArray *)v5->entries count];
  objc_sync_exit(v5);

  if (!v16)
  {
    uint64_t v18 = [(FPnfsMemNode *)v5 parent];
    if (v18)
    {
      v19 = (void *)v18;
      v20 = [(FPnfsMemNode *)v5 parent];

      if (v20 != v5)
      {
        int v21 = dispatch_get_global_queue(2, 0);
        v22[0] = _NSConcreteStackBlock;
        v22[1] = 3221225472;
        v22[2] = sub_1000197AC;
        v22[3] = &unk_100058D88;
        v22[4] = v5;
        dispatch_async(v21, v22);
      }
    }
  }

  return v9;
}

- (id)readDirAtCookie:(unint64_t)a3 withVerifier:(unint64_t)a4 forBytes:(unint64_t)a5 andError:(int *)a6
{
  id v10 = self;
  objc_sync_enter(v10);
  if (a4 && v10->_verf != a4)
  {
    id v12 = 0;
    int v17 = -1000;
    goto LABEL_38;
  }
  if (v10->size >= a5) {
    unint64_t size = a5;
  }
  else {
    unint64_t size = v10->size;
  }
  id v12 = [objc_alloc((Class)NSMutableData) initWithLength:size];
  id v13 = [v12 mutableBytes];
  if (!v13)
  {
    int v17 = 28;
    goto LABEL_38;
  }
  v35 = a6;
  int v14 = (char *)[(NSMutableArray *)v10->entries count];
  unint64_t v15 = a3 + 1;
  id v34 = v12;
  if (!a3 && size >= 0x18)
  {
    id v13 = (id)sub_100019B3C([(FPnfsMemNode *)v10 fileno], ".", 1, (uint64_t)v13);
    unint64_t v16 = 24;
    goto LABEL_13;
  }
  unint64_t v16 = 0;
  if (a3 <= 1)
  {
LABEL_13:
    if (size >= v16 + 24)
    {
      v19 = [(FPnfsMemNode *)v10 parent];
      if (v19)
      {
        v20 = [(FPnfsMemNode *)v10 parent];
      }
      else
      {
        v20 = v10;
      }
      uint64_t v18 = v20;

      uint64_t v21 = [(FPnfsMemNode *)v18 fileno];
      if (v14) {
        uint64_t v22 = 2;
      }
      else {
        uint64_t v22 = -1;
      }
      id v13 = (id)sub_100019B3C(v21, "..", v22, (uint64_t)v13);
      unint64_t v15 = a3 + 2;
      v16 += 24;
    }
    else
    {
      uint64_t v18 = 0;
    }
    goto LABEL_23;
  }
  uint64_t v18 = 0;
LABEL_23:
  if (a3 >= 2) {
    unint64_t v23 = a3 - 2;
  }
  else {
    unint64_t v23 = 0;
  }
  if (v16 >= size || v23 >= (unint64_t)v14)
  {
    id v24 = v18;
  }
  else
  {
    do
    {
      id v24 = [(NSMutableArray *)v10->entries objectAtIndexedSubscript:v23];

      id v25 = [(FPnfsMemNode *)v24 name];
      unint64_t v26 = ((unint64_t)[v25 length] + 29) & 0xFFFFFFFFFFFFFFF8;

      if (v26 + v16 > size) {
        break;
      }
      if (!v24->_nascent)
      {
        id v27 = [(FPnfsMemNode *)v24 name];
        v28 = (char *)[v27 UTF8String];

        uint64_t v29 = [(FPnfsMemNode *)v24 fileno];
        if (v14 - 1 == (char *)v23) {
          uint64_t v30 = -1;
        }
        else {
          uint64_t v30 = v15;
        }
        id v13 = (id)sub_100019B3C(v29, v28, v30, (uint64_t)v13);
      }
      ++v15;
      ++v23;
      uint64_t v18 = v24;
    }
    while (v23 < (unint64_t)v14);
  }
  v31 = (NSDate *)objc_alloc_init((Class)NSDate);
  atime = v10->_atime;
  v10->_atime = v31;

  int v17 = 0;
  id v12 = v34;
  a6 = v35;
LABEL_38:
  objc_sync_exit(v10);

  *a6 = v17;

  return v12;
}

- (id)readDirAttrAtCookie:(unint64_t)a3 withVerifier:(unint64_t)a4 forBytes:(unint64_t)a5 andError:(int *)a6
{
  id v10 = self;
  objc_sync_enter(v10);
  if (a4 && v10->_verf != a4)
  {
    id v12 = 0;
    int v33 = -1000;
  }
  else
  {
    if (v10->dirattrSize >= a5) {
      unint64_t dirattrSize = a5;
    }
    else {
      unint64_t dirattrSize = v10->dirattrSize;
    }
    id v12 = [objc_alloc((Class)NSMutableData) initWithLength:dirattrSize];
    id v13 = (unsigned __int16 *)[v12 mutableBytes];
    if (v13)
    {
      v38 = v10;
      id v14 = [(NSMutableArray *)v10->entries count];
      id v35 = v12;
      v36 = a6;
      unint64_t v15 = 0;
      unint64_t v16 = a3 - 2;
      if (a3 < 2) {
        unint64_t v16 = 0;
      }
      if (v16 < (unint64_t)v14 && dirattrSize)
      {
        unint64_t v17 = (unint64_t)v14;
        unint64_t v18 = 0;
        v19 = 0;
        unint64_t v20 = 2;
        if (a3 < 2) {
          unint64_t v20 = a3;
        }
        uint64_t v37 = (uint64_t)v14 + v20 - 1;
        uint64_t v21 = -(uint64_t)v20;
        do
        {
          -[NSMutableArray objectAtIndexedSubscript:](v38->entries, "objectAtIndexedSubscript:", v21 + a3, v35, v36);
          unint64_t v15 = (unsigned char *)objc_claimAutoreleasedReturnValue();

          uint64_t v22 = [v15 name];
          uint64_t v23 = ([v22 length] + 208) & 0xFFFFFFF8;

          unint64_t v24 = v23 + v18;
          if (v24 > dirattrSize) {
            break;
          }
          if (!v15[32])
          {
            id v25 = [v15 name];
            unint64_t v26 = (const char *)[v25 UTF8String];

            uint64_t v27 = [v15 fileno];
            if (v37 == a3) {
              unint64_t v28 = -1;
            }
            else {
              unint64_t v28 = a3 + 2;
            }
            size_t v29 = strlen(v26);
            *((void *)v13 + 10) = v27;
            *((void *)v13 + 5) = 0x1C000000002;
            *((void *)v13 + 8) = 0;
            *((void *)v13 + 3) = 323;
            v13[6] = v29;
            v13[5] = 200;
            *(void *)id v13 = v28;
            v13[4] = (v29 & 0xFFF8) + 208;
            strlcpy((char *)v13 + 200, v26, v29 + 1);
            if (v28 == -1)
            {
              uint64_t v30 = 0;
              v13[4] = 0;
            }
            else
            {
              uint64_t v30 = v13[4];
            }
            id v13 = (unsigned __int16 *)((char *)v13 + v30);
            unint64_t v18 = v24;
          }
          if (++a3 + v21 >= v17) {
            break;
          }
          v19 = v15;
        }
        while (v18 < dirattrSize);
      }
      v31 = (NSDate *)objc_alloc_init((Class)NSDate);
      id v10 = v38;
      atime = v38->_atime;
      v38->_atime = v31;

      int v33 = 0;
      id v12 = v35;
      a6 = v36;
    }
    else
    {
      int v33 = 28;
    }
  }
  objc_sync_exit(v10);

  *a6 = v33;

  return v12;
}

- (id)getattr
{
  v2 = self;
  objc_sync_enter(v2);
  unsigned int v12 = -[NSMutableArray count](v2->entries, "count", 0, 7647, 0, 0x1FF00000002, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
                        0,
                        0,
                        0,
                        0,
                        0,
                        0)
      + 2;
  uid_t v13 = getuid();
  gid_t v14 = getgid();
  unint64_t size = v2->size;
  uint64_t v16 = 1;
  *(void *)&long long v17 = [(FPnfsMemNode *)v2 fileno];
  v3 = [(FPnfsMemNode *)v2 atime];
  [v3 timeIntervalSince1970];
  unint64_t v18 = vcvtmd_s64_f64(v4);
  unint64_t v19 = llround((v4 - floor(v4)) * 1000000000.0);

  uint64_t v5 = [(FPnfsMemNode *)v2 mtime];
  [v5 timeIntervalSince1970];
  unint64_t v20 = vcvtmd_s64_f64(v6);
  unint64_t v21 = llround((v6 - floor(v6)) * 1000000000.0);

  id v7 = [(FPnfsMemNode *)v2 mtime];
  [v7 timeIntervalSince1970];
  unint64_t v22 = vcvtmd_s64_f64(v8);
  unint64_t v23 = llround((v8 - floor(v8)) * 1000000000.0);

  int v9 = +[NSData dataWithBytes:&v11 length:184];
  objc_sync_exit(v2);

  return v9;
}

- (FPnfsMemFS)fs
{
  return (FPnfsMemFS *)objc_getProperty(self, a2, 40, 1);
}

- (NSString)fh
{
  return (NSString *)objc_getProperty(self, a2, 48, 1);
}

- (unint64_t)verf
{
  return self->_verf;
}

- (NSString)name
{
  return (NSString *)objc_getProperty(self, a2, 64, 1);
}

- (FPnfsMemNode)parent
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_parent);

  return (FPnfsMemNode *)WeakRetained;
}

- (NSDate)atime
{
  return (NSDate *)objc_getProperty(self, a2, 80, 1);
}

- (NSDate)mtime
{
  return (NSDate *)objc_getProperty(self, a2, 88, 1);
}

- (BOOL)nascent
{
  return self->_nascent;
}

- (void)setNascent:(BOOL)a3
{
  self->_nascent = a3;
}

- (unsigned)fileno
{
  return self->_fileno;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_mtime, 0);
  objc_storeStrong((id *)&self->_atime, 0);
  objc_destroyWeak((id *)&self->_parent);
  objc_storeStrong((id *)&self->_name, 0);
  objc_storeStrong((id *)&self->_fh, 0);
  objc_storeStrong((id *)&self->_fs, 0);

  objc_storeStrong((id *)&self->entries, 0);
}

@end