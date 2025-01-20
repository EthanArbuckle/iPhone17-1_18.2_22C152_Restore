@interface NSNull
+ (id)objectType;
+ (id)objectTypeKey;
- (BOOL)encodeWithFMDCoder:(id)a3 error:(id *)a4;
- (NSNull)initWithFMDCoder:(id)a3 error:(id *)a4;
@end

@implementation NSNull

- (BOOL)encodeWithFMDCoder:(id)a3 error:(id *)a4
{
  id v5 = a3;
  v6 = +[NSNull null];
  v7 = +[NSNull objectType];
  id v11 = 0;
  [v5 encodeObject:v6 forKey:v7 error:&v11];

  id v8 = v11;
  if (v8)
  {
    v9 = sub_1000597E0();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      sub_10023CEA8((uint64_t)v8, v9);
    }

    if (a4) {
      *a4 = v8;
    }
  }

  return v8 == 0;
}

- (NSNull)initWithFMDCoder:(id)a3 error:(id *)a4
{
  id v6 = a3;
  uint64_t v7 = objc_opt_class();
  id v8 = +[NSNull objectType];
  id v16 = 0;
  v9 = [v6 decodeObjectOfClass:v7 forKey:v8 error:&v16];

  id v10 = v16;
  if (!v10)
  {
    if (v9)
    {
      self = [(NSNull *)self init];
      v13 = self;
      goto LABEL_9;
    }
LABEL_8:
    v13 = 0;
    goto LABEL_9;
  }
  id v11 = sub_1000597E0();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
    sub_10023CF20((uint64_t)v9, v11);
  }

  if (!a4) {
    goto LABEL_8;
  }
  id v12 = v10;
  v13 = 0;
  *a4 = v12;
LABEL_9:
  v14 = v13;

  return v14;
}

+ (id)objectType
{
  return @"FM.null";
}

+ (id)objectTypeKey
{
  return @"nullType";
}

@end