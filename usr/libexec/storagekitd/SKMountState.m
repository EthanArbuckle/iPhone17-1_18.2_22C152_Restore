@interface SKMountState
- (NSMutableArray)mountFlags;
- (NSString)mountPoint;
- (SKMountState)initWithMountPoint:(id)a3;
@end

@implementation SKMountState

- (SKMountState)initWithMountPoint:(id)a3
{
  id v5 = a3;
  v15.receiver = self;
  v15.super_class = (Class)SKMountState;
  v6 = [(SKMountState *)&v15 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_mountPoint, a3);
    uint64_t v8 = objc_opt_new();
    mountFlags = v7->_mountFlags;
    v7->_mountFlags = (NSMutableArray *)v8;

    bzero(&v16, 0x878uLL);
    if (!statfs((const char *)[v5 UTF8String], &v16))
    {
      int v10 = 16;
      v11 = &dword_1000491F0;
      do
      {
        if ((v16.f_flags & v10) != 0) {
          [(NSMutableArray *)v7->_mountFlags addObject:*((void *)v11 - 1)];
        }
        int v12 = *v11;
        v11 += 4;
        int v10 = v12;
      }
      while (v12);
      if ((v16.f_flags & 0x200000) != 0) {
        CFStringRef v13 = @"noowners";
      }
      else {
        CFStringRef v13 = @"owners";
      }
      [(NSMutableArray *)v7->_mountFlags addObject:v13];
    }
  }

  return v7;
}

- (NSString)mountPoint
{
  return self->_mountPoint;
}

- (NSMutableArray)mountFlags
{
  return self->_mountFlags;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_mountFlags, 0);

  objc_storeStrong((id *)&self->_mountPoint, 0);
}

@end