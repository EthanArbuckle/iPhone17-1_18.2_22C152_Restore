@interface REExportedUnknownObjectValue
- (REExportedUnknownObjectValue)initWithObject:(id)a3;
- (id)objectValue;
- (unint64_t)type;
@end

@implementation REExportedUnknownObjectValue

- (REExportedUnknownObjectValue)initWithObject:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)REExportedUnknownObjectValue;
  v6 = [(REExportedUnknownObjectValue *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong(&v6->_object, a3);
  }

  return v7;
}

- (id)objectValue
{
  return self->_object;
}

- (unint64_t)type
{
  return 7;
}

- (void).cxx_destruct
{
}

@end