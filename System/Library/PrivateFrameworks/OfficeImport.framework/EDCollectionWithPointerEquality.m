@interface EDCollectionWithPointerEquality
- (BOOL)isEqualToCollection:(id)a3;
@end

@implementation EDCollectionWithPointerEquality

- (BOOL)isEqualToCollection:(id)a3
{
  id v4 = a3;
  unint64_t v5 = [(EDCollection *)self count];
  if (v5 == [v4 count])
  {
    if (v5)
    {
      BOOL v6 = 0;
      for (i = 0; i != v5; BOOL v6 = i >= v5)
      {
        v8 = [(EDCollection *)self objectAtIndex:i];
        v9 = [v4 objectAtIndex:i];

        if (v8 != v9) {
          break;
        }
        ++i;
      }
    }
    else
    {
      BOOL v6 = 1;
    }
  }
  else
  {
    BOOL v6 = 0;
  }

  return v6;
}

@end