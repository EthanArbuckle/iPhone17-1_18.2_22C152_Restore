@interface ServerRPC
+ (id)fetchRequest;
- (BOOL)setUnsigned:(SEL)a3 value:(unint64_t)a4;
- (id)batchQuery;
- (id)singleQuery;
- (unint64_t)getUnsigned:(SEL)a3;
@end

@implementation ServerRPC

- (id)batchQuery
{
  if ([(ServerRPC *)self rpcType] == (id)1) {
    v3 = self;
  }
  else {
    v3 = 0;
  }

  return v3;
}

+ (id)fetchRequest
{
  return +[NSFetchRequest fetchRequestWithEntityName:@"ServerRPC"];
}

- (id)singleQuery
{
  if ([(ServerRPC *)self rpcType]) {
    v3 = 0;
  }
  else {
    v3 = self;
  }

  return v3;
}

- (BOOL)setUnsigned:(SEL)a3 value:(unint64_t)a4
{
  return 1;
}

- (unint64_t)getUnsigned:(SEL)a3
{
  return sub_1002131E4(self, a3);
}

@end