@interface ECPointerNilKeyDictionary
- (id)objectForKey:(id)a3;
- (void)setObject:(id)a3 forKey:(id)a4;
- (void)setObject:(id)a3 forUncopiedKey:(id)a4;
@end

@implementation ECPointerNilKeyDictionary

- (id)objectForKey:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    v8.receiver = self;
    v8.super_class = (Class)ECPointerNilKeyDictionary;
    id v5 = [(OITSUNoCopyDictionary *)&v8 objectForKey:v4];
  }
  else
  {
    id v5 = self->mNilKeyObject;
  }
  v6 = v5;

  return v6;
}

- (void)setObject:(id)a3 forKey:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  if (v8)
  {
    v9.receiver = self;
    v9.super_class = (Class)ECPointerNilKeyDictionary;
    [(OITSUNoCopyDictionary *)&v9 setObject:v7 forKey:v8];
  }
  else
  {
    objc_storeStrong(&self->mNilKeyObject, a3);
  }
}

- (void)setObject:(id)a3 forUncopiedKey:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  if (v8)
  {
    v9.receiver = self;
    v9.super_class = (Class)ECPointerNilKeyDictionary;
    [(OITSUNoCopyDictionary *)&v9 setObject:v7 forUncopiedKey:v8];
  }
  else
  {
    objc_storeStrong(&self->mNilKeyObject, a3);
  }
}

- (void).cxx_destruct
{
}

@end