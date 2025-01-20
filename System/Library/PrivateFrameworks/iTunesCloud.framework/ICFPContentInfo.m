@interface ICFPContentInfo
+ (id)whaContentInfoWithAccountID:(unint64_t)a3;
- (FPContentInfo_)fpContentInfo;
- (id)_init;
- (int64_t)vodkaType;
- (unint64_t)accountID;
@end

@implementation ICFPContentInfo

- (unint64_t)accountID
{
  return self->_accountID;
}

- (int64_t)vodkaType
{
  return self->_vodkaType;
}

- (FPContentInfo_)fpContentInfo
{
  *(_OWORD *)&retstr->var0 = 0uLL;
  *((void *)&retstr->var3 + 2) = 0;
  if (self->var2.var2 == 3)
  {
    retstr->var0 = 3;
    retstr->var2.var2 = *((void *)&self->var3 + 2);
  }
  return self;
}

- (id)_init
{
  v3.receiver = self;
  v3.super_class = (Class)ICFPContentInfo;
  return [(ICFPContentInfo *)&v3 init];
}

+ (id)whaContentInfoWithAccountID:(unint64_t)a3
{
  v4 = (void *)[objc_alloc((Class)a1) _init];
  if (v4)
  {
    v4[1] = 3;
    v4[2] = a3;
  }

  return v4;
}

@end