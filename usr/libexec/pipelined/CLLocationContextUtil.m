@interface CLLocationContextUtil
+ (BOOL)isIndoor:(int64_t)a3;
+ (BOOL)isRegional:(int64_t)a3;
+ (int64_t)convertFromLocationContext:(int)a3;
+ (int64_t)convertFromProtoContext:(int)a3;
+ (int64_t)getContextFromVenueBounds:(const void *)a3;
@end

@implementation CLLocationContextUtil

+ (BOOL)isRegional:(int64_t)a3
{
  return a3 == 1;
}

+ (BOOL)isIndoor:(int64_t)a3
{
  return a3 == 0;
}

+ (int64_t)convertFromProtoContext:(int)a3
{
  return a3 != 1;
}

+ (int64_t)convertFromLocationContext:(int)a3
{
  return a3 != 0;
}

+ (int64_t)getContextFromVenueBounds:(const void *)a3
{
  if ((*((unsigned char *)a3 + 104) & 8) != 0)
  {
    uint64_t v12 = *((unsigned int *)a3 + 24);
    return (int64_t)[a1 convertFromProtoContext:v12];
  }
  uint64_t v4 = *((int *)a3 + 6);
  if (!v4) {
    return 0;
  }
  v5 = (uint64_t *)*((void *)a3 + 2);
  uint64_t v6 = 8 * v4;
  while (1)
  {
    v7 = (uint64_t *)*v5;
    int v8 = *(char *)(*v5 + 23);
    if (v8 < 0) {
      break;
    }
    if (*(unsigned char *)v7 != 71)
    {
      uint64_t v9 = *(unsigned __int8 *)(*v5 + 23);
      if ((_BYTE)v8)
      {
        size_t v10 = v9 - 1;
        if ((unint64_t)(v9 - 1) < 0x7FFFFFFFFFFFFFF8) {
          goto LABEL_10;
        }
LABEL_29:
        sub_1000A6968();
      }
LABEL_30:
      sub_10018E31C();
    }
LABEL_5:
    ++v5;
    v6 -= 8;
    if (!v6) {
      return 0;
    }
  }
  if (*(unsigned char *)*v7 == 71) {
    goto LABEL_5;
  }
  uint64_t v17 = v7[1];
  if (!v17) {
    goto LABEL_30;
  }
  v7 = (uint64_t *)*v7;
  size_t v10 = v17 - 1;
  if ((unint64_t)(v17 - 1) >= 0x7FFFFFFFFFFFFFF8) {
    goto LABEL_29;
  }
LABEL_10:
  if (v10 >= 0x17)
  {
    uint64_t v13 = (v10 & 0xFFFFFFFFFFFFFFF8) + 8;
    if ((v10 | 7) != 0x17) {
      uint64_t v13 = v10 | 7;
    }
    uint64_t v14 = v13 + 1;
    v11 = (void **)operator new(v13 + 1);
    __dst[1] = (void *)v10;
    unint64_t v20 = v14 | 0x8000000000000000;
    __dst[0] = v11;
  }
  else
  {
    HIBYTE(v20) = v10;
    v11 = __dst;
    if (!v10) {
      goto LABEL_21;
    }
  }
  memmove(v11, (char *)v7 + 1, v10);
LABEL_21:
  *((unsigned char *)v11 + v10) = 0;
  sub_100085B24(&v21, (uint64_t)__dst);
  BOOL v15 = sub_10028D144((uint64_t)&v21);
  v16 = v22;
  if (v22 && !atomic_fetch_add(&v22->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
  {
    ((void (*)(std::__shared_weak_count *))v16->__on_zero_shared)(v16);
    std::__shared_weak_count::__release_weak(v16);
  }
  if (SHIBYTE(v20) < 0) {
    operator delete(__dst[0]);
  }
  return (int64_t)[a1 convertFromLocationContext:v15];
}

@end