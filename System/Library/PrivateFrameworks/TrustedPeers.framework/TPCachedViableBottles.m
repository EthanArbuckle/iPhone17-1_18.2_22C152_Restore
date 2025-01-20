@interface TPCachedViableBottles
- (NSArray)partialBottles;
- (NSArray)viableBottles;
- (TPCachedViableBottles)initWithViableBottles:(id)a3 partialBottles:(id)a4;
@end

@implementation TPCachedViableBottles

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_partialBottles, 0);
  objc_storeStrong((id *)&self->_viableBottles, 0);
}

- (NSArray)partialBottles
{
  return (NSArray *)objc_getProperty(self, a2, 16, 1);
}

- (NSArray)viableBottles
{
  return (NSArray *)objc_getProperty(self, a2, 8, 1);
}

- (TPCachedViableBottles)initWithViableBottles:(id)a3 partialBottles:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)TPCachedViableBottles;
  v9 = [(TPCachedViableBottles *)&v12 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_viableBottles, a3);
    objc_storeStrong((id *)&v10->_partialBottles, a4);
  }

  return v10;
}

@end