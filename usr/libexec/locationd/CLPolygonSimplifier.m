@interface CLPolygonSimplifier
+ (double)simplifiedLength:(id)a3 threshold:(double)a4;
+ (double)simplifiedLength:(id)a3 threshold:(double)a4 type:(int)a5;
@end

@implementation CLPolygonSimplifier

+ (double)simplifiedLength:(id)a3 threshold:(double)a4 type:(int)a5
{
  v19 = 0;
  v20 = 0;
  uint64_t v21 = 0;
  sub_100907300((uint64_t *)&v19, (unint64_t)[a3 count]);
  if (v20 != v19)
  {
    uint64_t v8 = 0;
    unint64_t v9 = 0;
    do
    {
      [objc_msgSend(a3, "objectAtIndex:", v9) coordinate];
      v10 = (char *)v19 + v8;
      *(void *)v10 = v11;
      *((void *)v10 + 1) = v12;
      sub_1009060D0((double *)v10);
      ++v9;
      v8 += 24;
    }
    while (0xAAAAAAAAAAAAAAABLL * ((v20 - (unsigned char *)v19) >> 3) > v9);
  }
  __p = 0;
  v17 = 0;
  uint64_t v18 = 0;
  double v15 = 0.0;
  sub_10090630C((uint64_t *)&__p, &v15, (uint64_t *)&v19, a5, a4);
  double v13 = v15;
  if (__p)
  {
    v17 = __p;
    operator delete(__p);
  }
  if (v19)
  {
    v20 = v19;
    operator delete(v19);
  }
  return v13;
}

+ (double)simplifiedLength:(id)a3 threshold:(double)a4
{
  _[a1 simplifiedLength:a3 threshold:0 type:a4];
  return result;
}

@end