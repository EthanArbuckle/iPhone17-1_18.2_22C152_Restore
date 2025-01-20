@interface NSMutableDictionary
- (void)safelyMapKey:(id)a3 toObject:(id)a4;
- (void)safelySetObject:(id)a3 forKey:(id)a4;
@end

@implementation NSMutableDictionary

- (void)safelySetObject:(id)a3 forKey:(id)a4
{
  id v7 = a3;
  id v6 = a4;
  if (v6)
  {
    if (v7) {
      [(NSMutableDictionary *)self setObject:v7 forKey:v6];
    }
    else {
      [(NSMutableDictionary *)self removeObjectForKey:v6];
    }
  }
}

- (void)safelyMapKey:(id)a3 toObject:(id)a4
{
  id v7 = a3;
  id v6 = a4;
  if (v7)
  {
    if (v6) {
      [(NSMutableDictionary *)self setObject:v6 forKey:v7];
    }
    else {
      [(NSMutableDictionary *)self removeObjectForKey:v7];
    }
  }
}

@end