@interface KTLoggableDataArray
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (KTLoggableDataArray)initWithCoder:(id)a3;
- (KTLoggableDataArray)initWithLoggableDatas:(id)a3;
- (NSArray)loggableDatas;
- (id)description;
- (void)encodeWithCoder:(id)a3;
- (void)setLoggableDatas:(id)a3;
@end

@implementation KTLoggableDataArray

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (KTLoggableDataArray)initWithLoggableDatas:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)KTLoggableDataArray;
  v5 = [(KTLoggableDataArray *)&v8 init];
  v6 = v5;
  if (v5) {
    [(KTLoggableDataArray *)v5 setLoggableDatas:v4];
  }

  return v6;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  id v5 = [(KTLoggableDataArray *)self loggableDatas];
  [v4 encodeObject:v5 forKey:@"loggableDatas"];
}

- (KTLoggableDataArray)initWithCoder:(id)a3
{
  id v4 = a3;
  uint64_t v5 = objc_opt_class();
  v6 = +[NSSet setWithObjects:](NSSet, "setWithObjects:", v5, objc_opt_class(), 0);
  v7 = [v4 decodeObjectOfClasses:v6 forKey:@"loggableDatas"];

  objc_super v8 = [[KTLoggableDataArray alloc] initWithLoggableDatas:v7];
  return v8;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (KTLoggableDataArray *)a3;
  if (self == v4)
  {
    unsigned __int8 v7 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      uint64_t v5 = [(KTLoggableDataArray *)v4 loggableDatas];
      v6 = [(KTLoggableDataArray *)self loggableDatas];
      unsigned __int8 v7 = [v5 isEqualToArray:v6];
    }
    else
    {
      unsigned __int8 v7 = 0;
    }
  }

  return v7;
}

- (id)description
{
  v2 = [(KTLoggableDataArray *)self loggableDatas];
  v3 = [v2 description];

  return v3;
}

- (NSArray)loggableDatas
{
  return (NSArray *)objc_getProperty(self, a2, 8, 1);
}

- (void)setLoggableDatas:(id)a3
{
}

- (void).cxx_destruct
{
}

@end