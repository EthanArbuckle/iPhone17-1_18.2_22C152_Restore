@interface STUpdateBlueprintsResult
+ (id)outOfDateWithReturnDestination:(id)a3;
+ (id)success;
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqualToResult:(id)a3;
- (STUnifiedTransportPayloadDestination)returnDestination;
- (id)_initWithType:(int64_t)a3 returnDestination:(id)a4;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (int64_t)type;
- (unint64_t)hash;
@end

@implementation STUpdateBlueprintsResult

- (id)_initWithType:(int64_t)a3 returnDestination:(id)a4
{
  STUnifiedTransportPayloadDestination *returnDestination;
  objc_super v10;

  v6 = (STUnifiedTransportPayloadDestination *)a4;
  v10.receiver = self;
  v10.super_class = (Class)STUpdateBlueprintsResult;
  v7 = [(STUpdateBlueprintsResult *)&v10 init];
  returnDestination = v7->_returnDestination;
  v7->_type = a3;
  v7->_returnDestination = v6;

  return v7;
}

+ (id)success
{
  id v2 = [[STUpdateBlueprintsResult alloc] _initWithType:0 returnDestination:0];
  return v2;
}

+ (id)outOfDateWithReturnDestination:(id)a3
{
  id v3 = a3;
  id v4 = [[STUpdateBlueprintsResult alloc] _initWithType:1 returnDestination:v3];

  return v4;
}

- (id)description
{
  int64_t v4 = [(STUpdateBlueprintsResult *)self type];
  if (v4 == 1)
  {
    v7 = (objc_class *)objc_opt_class();
    v6 = NSStringFromClass(v7);
    v8 = [(STUpdateBlueprintsResult *)self returnDestination];
    id v2 = +[NSString stringWithFormat:@"<%@:%p { OutOfDate: %@ }>", v6, self, v8];
  }
  else
  {
    if (v4) {
      goto LABEL_6;
    }
    v5 = (objc_class *)objc_opt_class();
    v6 = NSStringFromClass(v5);
    id v2 = +[NSString stringWithFormat:@"<%@:%p { Success }>", v6, self];
  }

LABEL_6:
  return v2;
}

- (id)copyWithZone:(_NSZone *)a3
{
  STUnifiedTransportPayloadDestination *returnDestination;
  uint64_t vars8;

  id v4 = [(id)objc_opt_class() allocWithZone:a3];
  int64_t type = self->_type;
  returnDestination = self->_returnDestination;
  return [v4 _initWithType:type returnDestination:returnDestination];
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (STUpdateBlueprintsResult *)a3;
  if (v4 == self)
  {
    BOOL v5 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      BOOL v5 = [(STUpdateBlueprintsResult *)self isEqualToResult:v4];
    }
    else {
      BOOL v5 = 0;
    }
  }

  return v5;
}

- (BOOL)isEqualToResult:(id)a3
{
  id v4 = (STUpdateBlueprintsResult *)a3;
  if (v4 == self)
  {
    unsigned __int8 v10 = 1;
  }
  else
  {
    BOOL v5 = [(STUpdateBlueprintsResult *)self type];
    if (v5 == (void *)[(STUpdateBlueprintsResult *)v4 type])
    {
      v6 = [(STUpdateBlueprintsResult *)self returnDestination];
      v7 = [(STUpdateBlueprintsResult *)v4 returnDestination];
      if (v6 == v7)
      {
        unsigned __int8 v10 = 1;
      }
      else
      {
        v8 = [(STUpdateBlueprintsResult *)self returnDestination];
        v9 = [(STUpdateBlueprintsResult *)v4 returnDestination];
        unsigned __int8 v10 = [v8 isEqual:v9];
      }
    }
    else
    {
      unsigned __int8 v10 = 0;
    }
  }

  return v10;
}

- (unint64_t)hash
{
  int64_t v3 = [(STUpdateBlueprintsResult *)self type];
  id v4 = [(STUpdateBlueprintsResult *)self returnDestination];
  unint64_t v5 = (unint64_t)[v4 hash] ^ v3;

  return v5;
}

- (int64_t)type
{
  return self->_type;
}

- (STUnifiedTransportPayloadDestination)returnDestination
{
  return (STUnifiedTransportPayloadDestination *)objc_getProperty(self, a2, 16, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_returnDestination, 0);
}

@end