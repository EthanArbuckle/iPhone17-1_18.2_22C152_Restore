@interface RXs9KixbxmL4RM2Z
+ (id)sharedInstance;
- (RXs9KixbxmL4RM2Z)init;
- (id)KvXBZ2Y159GbeEgH:(id)a3;
- (id)OtYQBavMHoCfV2sk:(int64_t)a3;
- (id)xkNh5bfoCwq3gGYr:(id)a3;
- (void)f5FVXJrOBjzaLi8u:(id)a3;
- (void)qY1DoQqvimc9pbAA:(id)a3;
@end

@implementation RXs9KixbxmL4RM2Z

+ (id)sharedInstance
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10002C6C4;
  block[3] = &unk_10065ED90;
  block[4] = a1;
  if (qword_1006A5E00[0] != -1) {
    dispatch_once(qword_1006A5E00, block);
  }
  v2 = (void *)qword_1006A5DF8;

  return v2;
}

- (RXs9KixbxmL4RM2Z)init
{
  v10.receiver = self;
  v10.super_class = (Class)RXs9KixbxmL4RM2Z;
  v2 = [(RXs9KixbxmL4RM2Z *)&v10 init];
  uint64_t v3 = objc_opt_new();
  R0CYcVVd8XXm0zfW = v2->R0CYcVVd8XXm0zfW;
  v2->R0CYcVVd8XXm0zfW = (NSMutableDictionary *)v3;

  v5 = (NSLock *)objc_alloc_init((Class)NSLock);
  uBOR9lc7Krr6TYui = v2->_uBOR9lc7Krr6TYui;
  v2->_uBOR9lc7Krr6TYui = v5;

  dispatch_queue_t v7 = dispatch_queue_create("com.apple.asd.ctimer", 0);
  mH3NQ8DXxcL1G9QZ = v2->_mH3NQ8DXxcL1G9QZ;
  v2->_mH3NQ8DXxcL1G9QZ = (OS_dispatch_queue *)v7;

  return v2;
}

- (id)KvXBZ2Y159GbeEgH:(id)a3
{
  id v4 = a3;
  [(NSLock *)self->_uBOR9lc7Krr6TYui lock];
  v5 = 0;
  do
  {
    v6 = v5;
    v5 = [(RXs9KixbxmL4RM2Z *)self OtYQBavMHoCfV2sk:8];

    dispatch_queue_t v7 = [(NSMutableDictionary *)self->R0CYcVVd8XXm0zfW objectForKey:v5];
  }
  while (v7);
  [(NSMutableDictionary *)self->R0CYcVVd8XXm0zfW setObject:v4 forKey:v5];
  [(NSLock *)self->_uBOR9lc7Krr6TYui unlock];
  [(RXs9KixbxmL4RM2Z *)self qY1DoQqvimc9pbAA:v5];

  return v5;
}

- (id)xkNh5bfoCwq3gGYr:(id)a3
{
  return [(NSMutableDictionary *)self->R0CYcVVd8XXm0zfW objectForKey:a3];
}

- (void)f5FVXJrOBjzaLi8u:(id)a3
{
  id v4 = a3;
  [(NSLock *)self->_uBOR9lc7Krr6TYui lock];
  if (v4)
  {
    uint64_t v9 = 0;
    uint64_t v10 = 0;
    uint64_t v11 = 0;
    v5 = [(RXs9KixbxmL4RM2Z *)self xkNh5bfoCwq3gGYr:v4];
    v6 = v5;
    if (v5)
    {
      [v5 Xj38ZYkbLwtCgBTH];
    }
    else
    {
      uint64_t v9 = 0;
      uint64_t v10 = 0;
      uint64_t v11 = 0;
    }

    [(NSMutableDictionary *)self->R0CYcVVd8XXm0zfW removeObjectForKey:v4];
    if (v9)
    {
      int v8 = 0;
      dispatch_queue_t v7 = &v8;
      sub_1003581FC();
    }
  }
  [(NSLock *)self->_uBOR9lc7Krr6TYui unlock];
}

- (void)qY1DoQqvimc9pbAA:(id)a3
{
  id v4 = a3;
  dispatch_time_t v5 = dispatch_time(0, 1800000000000);
  mH3NQ8DXxcL1G9QZ = self->_mH3NQ8DXxcL1G9QZ;
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_10002C9D8;
  v8[3] = &unk_10065F750;
  v8[4] = self;
  id v9 = v4;
  id v7 = v4;
  dispatch_after(v5, mH3NQ8DXxcL1G9QZ, v8);
}

- (id)OtYQBavMHoCfV2sk:(int64_t)a3
{
  id v4 = +[NSMutableString stringWithCapacity:](NSMutableString, "stringWithCapacity:");
  if (a3 >= 1)
  {
    do
    {
      [v4 appendFormat:@"%C", [@"abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789" characterAtIndex:arc4random_uniform((uint32_t)[@"abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789" length])]];
      --a3;
    }
    while (a3);
  }

  return v4;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_mH3NQ8DXxcL1G9QZ, 0);
  objc_storeStrong((id *)&self->_uBOR9lc7Krr6TYui, 0);

  objc_storeStrong((id *)&self->R0CYcVVd8XXm0zfW, 0);
}

@end