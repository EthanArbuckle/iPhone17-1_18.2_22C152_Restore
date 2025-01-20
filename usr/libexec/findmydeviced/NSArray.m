@interface NSArray
+ (id)objectType;
+ (id)objectTypeKey;
- (BOOL)encodeWithFMDCoder:(id)a3 error:(id *)a4;
- (NSArray)initWithFMDCoder:(id)a3 error:(id *)a4;
@end

@implementation NSArray

- (BOOL)encodeWithFMDCoder:(id)a3 error:(id *)a4
{
  id v6 = a3;
  v7 = [(id)objc_opt_class() objectType];
  id v15 = 0;
  [v6 encodeObjects:self forKey:v7 error:&v15];
  id v8 = v15;

  v9 = [(id)objc_opt_class() objectType];
  v10 = [(id)objc_opt_class() objectTypeKey];
  id v14 = v8;
  [v6 encodeObject:v9 forKey:v10 error:&v14];

  id v11 = v14;
  if (v11)
  {
    v12 = sub_1000597E0();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
      sub_10023AE08((uint64_t)v11, v12);
    }

    if (a4) {
      *a4 = v11;
    }
  }

  return v11 == 0;
}

- (NSArray)initWithFMDCoder:(id)a3 error:(id *)a4
{
  id v4 = a3;
  v5 = objc_opt_new();
  for (uint64_t i = 0; ; ++i)
  {
    v7 = +[NSSet setWithObject:&OBJC_PROTOCOL___FMDCodable];
    id v8 = +[NSString stringWithFormat:@"FM.object.%ld", i];
    id v18 = 0;
    v9 = [v4 decodeObjectOfProtocols:v7 forKey:v8 error:&v18];
    id v10 = v18;

    if (v10 || v9 == 0) {
      break;
    }
    [v5 addObject:v9];
  }
  if (v10)
  {
    v12 = sub_1000597E0();
    v13 = self;
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
      sub_10023AE80((uint64_t)v10, v12);
    }

    id v14 = 0;
    if (a4) {
      *a4 = v10;
    }
  }
  else
  {
    v13 = [(NSArray *)self initWithArray:v5];
    id v14 = v13;
  }

  return v14;
}

+ (id)objectType
{
  return @"FM.array";
}

+ (id)objectTypeKey
{
  return @"arrayType";
}

@end