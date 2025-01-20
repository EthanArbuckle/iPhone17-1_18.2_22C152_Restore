@interface FLTMutableSSUExample
+ (Class)data_mutableClassForType:(int64_t)a3;
+ (int64_t)data_typeForMutableObject:(id)a3;
+ (int64_t)data_typeForObject:(id)a3;
- (FLTMutableSSUExample)init;
- (FLTSSUExampleEncodedVector)dataAsFLTSSUExampleEncodedVector;
- (FLTSSUExampleUtterance)dataAsFLTSSUExampleUtterance;
- (id)copyWithZone:(_NSZone *)a3;
- (int64_t)data_type;
- (void)setData:(id)a3;
- (void)setDataAsFLTSSUExampleEncodedVector:(id)a3;
- (void)setDataAsFLTSSUExampleUtterance:(id)a3;
- (void)setData_type:(int64_t)a3;
@end

@implementation FLTMutableSSUExample

- (void)setData:(id)a3
{
  id v5 = a3;
  -[FLTMutableSSUExample setData_type:](self, "setData_type:", objc_msgSend((id)objc_opt_class(), "data_typeForObject:", v5));
  v4 = (void *)[v5 copy];
  [(NSMutableDictionary *)self->super._storage setObject:v4 forKeyedSubscript:@"data"];
}

- (void)setDataAsFLTSSUExampleEncodedVector:(id)a3
{
  id v5 = a3;
  [(FLTMutableSSUExample *)self setData_type:2];
  v4 = (void *)[v5 copy];
  [(NSMutableDictionary *)self->super._storage setObject:v4 forKeyedSubscript:@"data"];
}

- (FLTSSUExampleEncodedVector)dataAsFLTSSUExampleEncodedVector
{
  if ([(FLTMutableSSUExample *)self data_type] == 2)
  {
    v3 = [(NSMutableDictionary *)self->super._storage objectForKeyedSubscript:@"data"];
  }
  else
  {
    v3 = 0;
  }
  return (FLTSSUExampleEncodedVector *)v3;
}

- (void)setDataAsFLTSSUExampleUtterance:(id)a3
{
  id v5 = a3;
  [(FLTMutableSSUExample *)self setData_type:1];
  v4 = (void *)[v5 copy];
  [(NSMutableDictionary *)self->super._storage setObject:v4 forKeyedSubscript:@"data"];
}

- (FLTSSUExampleUtterance)dataAsFLTSSUExampleUtterance
{
  if ([(FLTMutableSSUExample *)self data_type] == 1)
  {
    v3 = [(NSMutableDictionary *)self->super._storage objectForKeyedSubscript:@"data"];
  }
  else
  {
    v3 = 0;
  }
  return (FLTSSUExampleUtterance *)v3;
}

- (void)setData_type:(int64_t)a3
{
  id v4 = (id)[objc_alloc(NSNumber) initWithInteger:a3];
  -[NSMutableDictionary setObject:forKeyedSubscript:](self->super._storage, "setObject:forKeyedSubscript:");
}

- (int64_t)data_type
{
  v2 = [(NSMutableDictionary *)self->super._storage objectForKeyedSubscript:@"data_type"];
  int64_t v3 = [v2 integerValue];

  return v3;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  uint64_t v5 = [(NSMutableDictionary *)self->super._storage copy];
  v6 = (void *)v4[1];
  v4[1] = v5;

  return v4;
}

- (FLTMutableSSUExample)init
{
  v6.receiver = self;
  v6.super_class = (Class)FLTMutableSSUExample;
  v2 = [(FLTMutableSSUExample *)&v6 init];
  if (v2)
  {
    uint64_t v3 = [MEMORY[0x1E4F1CA60] dictionary];
    storage = v2->super._storage;
    v2->super._storage = (NSMutableDictionary *)v3;
  }
  return v2;
}

+ (int64_t)data_typeForObject:(id)a3
{
  id v3 = a3;
  if (([v3 isMemberOfClass:objc_opt_class()] & 1) != 0
    || ([v3 isMemberOfClass:objc_opt_class()] & 1) != 0)
  {
    int64_t v4 = 1;
  }
  else if ([v3 isMemberOfClass:objc_opt_class()])
  {
    int64_t v4 = 2;
  }
  else if ([v3 isMemberOfClass:objc_opt_class()])
  {
    int64_t v4 = 2;
  }
  else
  {
    int64_t v4 = 0;
  }

  return v4;
}

+ (int64_t)data_typeForMutableObject:(id)a3
{
  id v3 = a3;
  if ([v3 isMemberOfClass:objc_opt_class()])
  {
    int64_t v4 = 1;
  }
  else if ([v3 isMemberOfClass:objc_opt_class()])
  {
    int64_t v4 = 2;
  }
  else
  {
    int64_t v4 = 0;
  }

  return v4;
}

+ (Class)data_mutableClassForType:(int64_t)a3
{
  if (a3 == 1 || a3 == 2)
  {
    int64_t v4 = objc_opt_class();
  }
  else
  {
    int64_t v4 = 0;
  }
  return (Class)v4;
}

@end