@interface NSDictionary(Class)
- (id)mk_arrayForKey:()Class;
- (id)mk_dictionaryForKey:()Class;
- (id)mk_numberForKey:()Class;
- (id)mk_objectForKey:()Class class:;
- (id)mk_stringForKey:()Class;
@end

@implementation NSDictionary(Class)

- (id)mk_stringForKey:()Class
{
  id v4 = a3;
  v5 = objc_msgSend(a1, "mk_objectForKey:class:", v4, objc_opt_class());

  return v5;
}

- (id)mk_numberForKey:()Class
{
  id v4 = a3;
  v5 = objc_msgSend(a1, "mk_objectForKey:class:", v4, objc_opt_class());

  return v5;
}

- (id)mk_dictionaryForKey:()Class
{
  id v4 = a3;
  v5 = objc_msgSend(a1, "mk_objectForKey:class:", v4, objc_opt_class());

  return v5;
}

- (id)mk_arrayForKey:()Class
{
  id v4 = a3;
  v5 = objc_msgSend(a1, "mk_objectForKey:class:", v4, objc_opt_class());

  return v5;
}

- (id)mk_objectForKey:()Class class:
{
  v1 = objc_msgSend(a1, "objectForKey:");
  if (objc_opt_isKindOfClass()) {
    v2 = v1;
  }
  else {
    v2 = 0;
  }
  id v3 = v2;

  return v3;
}

@end