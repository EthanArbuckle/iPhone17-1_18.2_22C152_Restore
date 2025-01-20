@interface _APKeyedUnarchiver
- (BOOL)containsValueForKey:(id)a3;
- (NSArray)ignoreKeys;
- (void)setIgnoreKeys:(id)a3;
@end

@implementation _APKeyedUnarchiver

- (BOOL)containsValueForKey:(id)a3
{
  id v4 = a3;
  v5 = [(_APKeyedUnarchiver *)self ignoreKeys];
  unsigned __int8 v6 = [v5 containsObject:v4];

  if (v6)
  {
    BOOL v7 = 0;
  }
  else
  {
    v9.receiver = self;
    v9.super_class = (Class)_APKeyedUnarchiver;
    BOOL v7 = [(_APKeyedUnarchiver *)&v9 containsValueForKey:v4];
  }

  return v7;
}

- (NSArray)ignoreKeys
{
  return self->_ignoreKeys;
}

- (void)setIgnoreKeys:(id)a3
{
}

- (void).cxx_destruct
{
}

@end