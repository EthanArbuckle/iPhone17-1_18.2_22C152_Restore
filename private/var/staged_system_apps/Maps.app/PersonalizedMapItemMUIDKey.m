@interface PersonalizedMapItemMUIDKey
- (BOOL)isEqual:(id)a3;
- (PersonalizedMapItemMUIDKey)init;
- (PersonalizedMapItemMUIDKey)initWithMUID:(unint64_t)a3;
- (unint64_t)hash;
- (unint64_t)muid;
@end

@implementation PersonalizedMapItemMUIDKey

- (PersonalizedMapItemMUIDKey)initWithMUID:(unint64_t)a3
{
  v8.receiver = self;
  v8.super_class = (Class)PersonalizedMapItemMUIDKey;
  v4 = [(PersonalizedMapItemMUIDKey *)&v8 init];
  v5 = v4;
  if (v4)
  {
    v4->_muid = a3;
    v6 = +[NSNumber numberWithUnsignedLongLong:a3];
    v5->_hash = (unint64_t)[v6 hash];
  }
  return v5;
}

- (BOOL)isEqual:(id)a3
{
  v4 = (PersonalizedMapItemMUIDKey *)a3;
  v5 = v4;
  if (!v4) {
    goto LABEL_5;
  }
  if (v4 == self)
  {
    BOOL v9 = 1;
    goto LABEL_7;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v6 = v5;
    unint64_t v7 = [(PersonalizedMapItemMUIDKey *)self muid];
    unint64_t v8 = [(PersonalizedMapItemMUIDKey *)v6 muid];

    BOOL v9 = v7 == v8;
  }
  else
  {
LABEL_5:
    BOOL v9 = 0;
  }
LABEL_7:

  return v9;
}

- (unint64_t)muid
{
  return self->_muid;
}

- (unint64_t)hash
{
  return self->_hash;
}

- (PersonalizedMapItemMUIDKey)init
{
  return 0;
}

@end