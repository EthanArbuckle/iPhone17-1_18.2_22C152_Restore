@interface STReactorDirective
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqualToReactorDirective:(id)a3;
- (NSCopying)data;
- (STReactorDirective)initWithType:(int64_t)a3 data:(id)a4;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)matchingAny:(id)a3;
- (int64_t)type;
- (unint64_t)hash;
@end

@implementation STReactorDirective

- (STReactorDirective)initWithType:(int64_t)a3 data:(id)a4
{
  v10.receiver = self;
  v10.super_class = (Class)STReactorDirective;
  id v5 = a4;
  v6 = [(STReactorDirective *)&v10 init];
  v6->_type = a3;
  v7 = (NSCopying *)objc_msgSend(v5, "copy", v10.receiver, v10.super_class);

  data = v6->_data;
  v6->_data = v7;

  return v6;
}

- (id)matchingAny:(id)a3
{
  id v4 = a3;
  id v5 = +[NSNumber numberWithInteger:[(STReactorDirective *)self type]];
  unsigned int v6 = [v4 containsObject:v5];

  if (v6)
  {
    v7 = +[STResult success:self];
  }
  else
  {
    id v8 = objc_alloc((Class)NSError);
    uint64_t v9 = STErrorDomain;
    NSErrorUserInfoKey v13 = NSLocalizedDescriptionKey;
    v14 = self;
    objc_super v10 = +[NSDictionary dictionaryWithObjects:&v14 forKeys:&v13 count:1];
    id v11 = [v8 initWithDomain:v9 code:44 userInfo:v10];
    v7 = +[STResult failure:v11];
  }
  return v7;
}

- (id)description
{
  uint64_t v3 = objc_opt_class();
  unint64_t v4 = (unint64_t)[(STReactorDirective *)self type] - 1;
  if (v4 > 0x10) {
    CFStringRef v5 = @"DoNothing";
  }
  else {
    CFStringRef v5 = off_1002FDB60[v4];
  }
  unsigned int v6 = [(STReactorDirective *)self data];
  v7 = +[NSString stringWithFormat:@"<%@ { Type: %@, Data: %@ }>", v3, v5, v6];

  return v7;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = [(id)objc_opt_class() allocWithZone:a3];
  int64_t type = self->_type;
  data = self->_data;
  return [v4 initWithType:type data:data];
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (STReactorDirective *)a3;
  if (self == v4)
  {
    BOOL v5 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      BOOL v5 = [(STReactorDirective *)self isEqualToReactorDirective:v4];
    }
    else {
      BOOL v5 = 0;
    }
  }

  return v5;
}

- (BOOL)isEqualToReactorDirective:(id)a3
{
  BOOL v5 = (STReactorDirective *)a3;
  if (self == v5)
  {
    unsigned __int8 v10 = 1;
  }
  else
  {
    unsigned int v6 = [(STReactorDirective *)self type];
    if (v6 == (void *)[(STReactorDirective *)v5 type])
    {
      v7 = [(STReactorDirective *)self data];
      if (v7 || ([(STReactorDirective *)v5 data], (uint64_t v3 = objc_claimAutoreleasedReturnValue()) != 0))
      {
        id v8 = [(STReactorDirective *)self data];
        uint64_t v9 = [(STReactorDirective *)v5 data];
        unsigned __int8 v10 = [v8 isEqual:v9];

        if (v7)
        {
LABEL_11:

          goto LABEL_12;
        }
      }
      else
      {
        unsigned __int8 v10 = 1;
      }

      goto LABEL_11;
    }
    unsigned __int8 v10 = 0;
  }
LABEL_12:

  return v10;
}

- (unint64_t)hash
{
  uint64_t v3 = [(STReactorDirective *)self data];
  id v4 = (char *)[v3 hash];
  BOOL v5 = &v4[[(STReactorDirective *)self type]];

  return (unint64_t)v5;
}

- (int64_t)type
{
  return self->_type;
}

- (NSCopying)data
{
  return (NSCopying *)objc_getProperty(self, a2, 16, 1);
}

- (void).cxx_destruct
{
}

@end