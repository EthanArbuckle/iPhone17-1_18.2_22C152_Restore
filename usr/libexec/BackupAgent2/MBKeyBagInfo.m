@interface MBKeyBagInfo
+ (id)infoWithID:(unsigned int)a3 uuid:(const char *)a4;
- (BOOL)isEqual:(id)a3;
- (MBKeyBagInfo)initWithID:(unsigned int)a3 uuid:(const char *)a4;
- (const)uuid;
- (unint64_t)hash;
- (unsigned)bagID;
- (void)setBagID:(unsigned int)a3;
- (void)setUUID:(const char *)a3;
@end

@implementation MBKeyBagInfo

+ (id)infoWithID:(unsigned int)a3 uuid:(const char *)a4
{
  id v4 = [objc_alloc((Class)a1) initWithID:*(void *)&a3 uuid:a4];

  return v4;
}

- (MBKeyBagInfo)initWithID:(unsigned int)a3 uuid:(const char *)a4
{
  v9.receiver = self;
  v9.super_class = (Class)MBKeyBagInfo;
  v6 = [(MBKeyBagInfo *)&v9 init];
  v7 = v6;
  if (v6)
  {
    v6->_bagID = a3;
    [(MBKeyBagInfo *)v6 setUUID:a4];
  }
  return v7;
}

- (const)uuid
{
  return (const char *)self->_uuid;
}

- (void)setUUID:(const char *)a3
{
  uuid = self->_uuid;
  if (a3)
  {
    *(_OWORD *)uuid = *(_OWORD *)a3;
  }
  else
  {
    *(void *)uuid = 0;
    *(void *)&self->_uuid[8] = 0;
  }
}

- (BOOL)isEqual:(id)a3
{
  if ((objc_opt_isKindOfClass() & 1) == 0) {
    return 0;
  }
  return *(void *)self->_uuid == *((void *)a3 + 1) && *(void *)&self->_uuid[8] == *((void *)a3 + 2);
}

- (unint64_t)hash
{
  return *(void *)&self->_uuid[8] ^ *(void *)self->_uuid;
}

- (unsigned)bagID
{
  return self->_bagID;
}

- (void)setBagID:(unsigned int)a3
{
  self->_bagID = a3;
}

@end