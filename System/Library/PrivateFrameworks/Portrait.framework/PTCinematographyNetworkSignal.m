@interface PTCinematographyNetworkSignal
+ (Class)subclassForName:(id)a3;
+ (id)networkSignalWithModelDictionary:(id)a3;
- (BOOL)checkSignalForStream:(id)a3;
- (NSString)name;
- (PTCinematographyNetworkSignal)initWithModelDictionary:(id)a3;
- (unint64_t)count;
@end

@implementation PTCinematographyNetworkSignal

+ (id)networkSignalWithModelDictionary:(id)a3
{
  id v4 = a3;
  v5 = (void *)[objc_alloc((Class)a1) initWithModelDictionary:v4];

  return v5;
}

+ (Class)subclassForName:(id)a3
{
  id v3 = a3;
  if (([v3 isEqualToString:@"__rect"] & 1) == 0
    && ([v3 isEqualToString:@"__uncertainty"] & 1) == 0)
  {
    [v3 isEqualToString:@"__label_onehot"];
  }
  id v4 = objc_opt_class();

  return (Class)v4;
}

- (PTCinematographyNetworkSignal)initWithModelDictionary:(id)a3
{
  id v4 = a3;
  v5 = [v4 objectForKeyedSubscript:@"name"];
  uint64_t v6 = objc_opt_class();
  if (v6 == objc_opt_class())
  {
    v10 = (PTCinematographyNetworkSignal *)objc_msgSend(objc_alloc((Class)objc_msgSend((id)objc_opt_class(), "subclassForName:", v5)), "initWithModelDictionary:", v4);
  }
  else
  {
    v13.receiver = self;
    v13.super_class = (Class)PTCinematographyNetworkSignal;
    v7 = [(PTCinematographyNetworkSignal *)&v13 init];
    v8 = v7;
    if (v7)
    {
      objc_storeStrong((id *)&v7->_name, v5);
      v9 = [v4 objectForKeyedSubscript:@"count"];
      v8->_count = [v9 unsignedIntegerValue];
    }
    v10 = v8;
    self = v10;
  }
  v11 = v10;

  return v11;
}

- (BOOL)checkSignalForStream:(id)a3
{
  id v4 = a3;
  unint64_t v5 = [(PTCinematographyNetworkSignal *)self count];
  uint64_t v6 = [v4 count];
  uint64_t v7 = [v4 index];

  return v5 <= v6 - v7;
}

- (NSString)name
{
  return (NSString *)objc_getProperty(self, a2, 8, 1);
}

- (unint64_t)count
{
  return self->_count;
}

- (void).cxx_destruct
{
}

@end