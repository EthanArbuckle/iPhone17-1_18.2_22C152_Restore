@interface EDFontsCollection
- (unint64_t)indexOfObjectWithFontName:(id)a3 color:(id)a4;
@end

@implementation EDFontsCollection

- (unint64_t)indexOfObjectWithFontName:(id)a3 color:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  unint64_t v9 = [(EDCollection *)self count];
  if (v9)
  {
    for (unint64_t i = 0; v9 != i; ++i)
    {
      v11 = [(EDCollection *)self objectAtIndex:i];
      v12 = [v11 name];
      v13 = v12;
      if (v12 && ([v12 isEqual:v7] & 1) != 0)
      {
        v14 = [v11 color];
        v15 = v14;
        if (v14)
        {
          int v16 = [v14 isEqual:v8];
          if (v16) {
            int v17 = 1;
          }
          else {
            int v17 = 4;
          }
          if (v16) {
            unint64_t v4 = i;
          }
        }
        else
        {
          int v17 = 4;
        }

        if (v17 != 4) {
          goto LABEL_17;
        }
      }
      else
      {
      }
    }
  }
  unint64_t v4 = -1;
LABEL_17:

  return v4;
}

@end