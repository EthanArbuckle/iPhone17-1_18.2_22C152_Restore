@interface NSArray
+ (id)ps_arrayWithSTLString:(const void *)a3;
@end

@implementation NSArray

+ (id)ps_arrayWithSTLString:(const void *)a3
{
  __p = 0;
  v16 = 0;
  unint64_t v17 = 0;
  sub_100097790((uint64_t)&__p, 0xAAAAAAAAAAAAAAABLL * ((uint64_t)(*((void *)a3 + 1) - *(void *)a3) >> 3));
  uint64_t v4 = *(void *)a3;
  for (uint64_t i = *((void *)a3 + 1); v4 != i; v4 += 24)
  {
    v7 = +[NSString ps_stringWithSTL:v4];
    id v18 = v7;
    v8 = v16;
    if ((unint64_t)v16 < v17)
    {
      id v18 = 0;
      void *v16 = v7;
      v6 = v8 + 1;
    }
    else
    {
      v6 = sub_1003395B8(&__p, (uint64_t *)&v18);
    }
    v16 = v6;
  }
  v9 = +[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:");
  v10 = __p;
  if (__p)
  {
    v11 = v16;
    v12 = __p;
    if (v16 != __p)
    {
      do
      {
        v13 = (void *)*--v11;
      }
      while (v11 != v10);
      v12 = __p;
    }
    v16 = v10;
    operator delete(v12);
  }

  return v9;
}

@end