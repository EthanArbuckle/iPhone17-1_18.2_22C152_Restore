@interface TRICKRecordProgress
+ (id)progressWithSize:(unint64_t)a3 transferred:(unint64_t)a4;
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqualToProgress:(id)a3;
- (TRICKRecordProgress)initWithSize:(unint64_t)a3 transferred:(unint64_t)a4;
- (id)copyWithReplacementSize:(unint64_t)a3;
- (id)copyWithReplacementTransferred:(unint64_t)a3;
- (id)description;
- (unint64_t)hash;
- (unint64_t)size;
- (unint64_t)transferred;
@end

@implementation TRICKRecordProgress

- (TRICKRecordProgress)initWithSize:(unint64_t)a3 transferred:(unint64_t)a4
{
  v7.receiver = self;
  v7.super_class = (Class)TRICKRecordProgress;
  result = [(TRICKRecordProgress *)&v7 init];
  if (result)
  {
    result->_size = a3;
    result->_transferred = a4;
  }
  return result;
}

+ (id)progressWithSize:(unint64_t)a3 transferred:(unint64_t)a4
{
  v4 = (void *)[objc_alloc((Class)a1) initWithSize:a3 transferred:a4];
  return v4;
}

- (id)copyWithReplacementSize:(unint64_t)a3
{
  id v5 = objc_alloc((Class)objc_opt_class());
  unint64_t transferred = self->_transferred;
  return (id)[v5 initWithSize:a3 transferred:transferred];
}

- (id)copyWithReplacementTransferred:(unint64_t)a3
{
  id v5 = objc_alloc((Class)objc_opt_class());
  unint64_t size = self->_size;
  return (id)[v5 initWithSize:size transferred:a3];
}

- (BOOL)isEqualToProgress:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (v4 && (unint64_t size = self->_size, size == [v4 size]))
  {
    unint64_t transferred = self->_transferred;
    BOOL v8 = transferred == [v5 transferred];
  }
  else
  {
    BOOL v8 = 0;
  }

  return v8;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (TRICKRecordProgress *)a3;
  id v5 = v4;
  if (v4 == self) {
    BOOL v6 = 1;
  }
  else {
    BOOL v6 = v4
  }
      && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
      && [(TRICKRecordProgress *)self isEqualToProgress:v5];

  return v6;
}

- (unint64_t)hash
{
  return self->_transferred - self->_size + 32 * self->_size;
}

- (id)description
{
  id v3 = [NSString alloc];
  id v4 = [NSNumber numberWithUnsignedLongLong:self->_size];
  id v5 = [NSNumber numberWithUnsignedLongLong:self->_transferred];
  BOOL v6 = (void *)[v3 initWithFormat:@"<TRICKRecordProgress | size:%@ transferred:%@>", v4, v5];

  return v6;
}

- (unint64_t)size
{
  return self->_size;
}

- (unint64_t)transferred
{
  return self->_transferred;
}

@end