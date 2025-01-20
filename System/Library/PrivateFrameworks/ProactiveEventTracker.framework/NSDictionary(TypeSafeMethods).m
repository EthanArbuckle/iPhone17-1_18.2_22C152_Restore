@interface NSDictionary(TypeSafeMethods)
- (id)pet_arrayForKey:()TypeSafeMethods;
- (id)pet_dictForKey:()TypeSafeMethods;
- (id)pet_numForKey:()TypeSafeMethods;
- (id)pet_objectForKey:()TypeSafeMethods class:;
- (id)pet_strForKey:()TypeSafeMethods;
@end

@implementation NSDictionary(TypeSafeMethods)

- (id)pet_dictForKey:()TypeSafeMethods
{
  id v4 = a3;
  v5 = objc_msgSend(a1, "pet_objectForKey:class:", v4, objc_opt_class());

  return v5;
}

- (id)pet_objectForKey:()TypeSafeMethods class:
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

- (id)pet_arrayForKey:()TypeSafeMethods
{
  id v4 = a3;
  v5 = objc_msgSend(a1, "pet_objectForKey:class:", v4, objc_opt_class());

  return v5;
}

- (id)pet_numForKey:()TypeSafeMethods
{
  id v4 = a3;
  v5 = objc_msgSend(a1, "pet_objectForKey:class:", v4, objc_opt_class());

  return v5;
}

- (id)pet_strForKey:()TypeSafeMethods
{
  id v4 = a3;
  v5 = objc_msgSend(a1, "pet_objectForKey:class:", v4, objc_opt_class());

  return v5;
}

@end