@interface NTKWidgetComplicationMigrationKey
- (BOOL)isEqual:(id)a3;
- (NSNumber)family;
- (NTKWidgetComplicationMigrationKey)initWithComplicationType:(unint64_t)a3 family:(id)a4;
- (id)copyWithZone:(_NSZone *)a3;
- (unint64_t)complicationType;
- (unint64_t)hash;
- (void)setComplicationType:(unint64_t)a3;
- (void)setFamily:(id)a3;
@end

@implementation NTKWidgetComplicationMigrationKey

- (NTKWidgetComplicationMigrationKey)initWithComplicationType:(unint64_t)a3 family:(id)a4
{
  v7.receiver = self;
  v7.super_class = (Class)NTKWidgetComplicationMigrationKey;
  result = [(NTKWidgetComplicationMigrationKey *)&v7 init];
  if (result)
  {
    result->_complicationType = a3;
    result->_family = (NSNumber *)a4;
  }
  return result;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = objc_alloc((Class)objc_opt_class());
  unint64_t complicationType = self->_complicationType;
  family = self->_family;
  return (id)[v4 initWithComplicationType:complicationType family:family];
}

- (unint64_t)hash
{
  unint64_t v3 = [(NTKWidgetComplicationMigrationKey *)self complicationType];
  id v4 = [(NTKWidgetComplicationMigrationKey *)self family];
  unint64_t v5 = [v4 hash] ^ v3;

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (NTKWidgetComplicationMigrationKey *)a3;
  if (v4 == self)
  {
    char v5 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0 && self->_complicationType == v4->_complicationType) {
      char v5 = CLKEqualObjects();
    }
    else {
      char v5 = 0;
    }
  }

  return v5;
}

- (unint64_t)complicationType
{
  return self->_complicationType;
}

- (void)setComplicationType:(unint64_t)a3
{
  self->_unint64_t complicationType = a3;
}

- (NSNumber)family
{
  return self->_family;
}

- (void)setFamily:(id)a3
{
  self->_family = (NSNumber *)a3;
}

@end