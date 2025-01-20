@interface RTAddress
- (id)getPreferredName;
@end

@implementation RTAddress

- (id)getPreferredName
{
  uint64_t v3 = [(RTAddress *)self areasOfInterest];
  if (v3
    && (v4 = (void *)v3,
        [(RTAddress *)self areasOfInterest],
        v5 = objc_claimAutoreleasedReturnValue(),
        id v6 = [v5 count],
        v5,
        v4,
        v6))
  {
    v7 = [(RTAddress *)self areasOfInterest];
    v8 = [v7 firstObject];
  }
  else
  {
    v9 = [(RTAddress *)self thoroughfare];

    v10 = [(RTAddress *)self locality];
    v8 = v10;
    if (v9)
    {

      [(RTAddress *)self thoroughfare];
      if (v8) {
        v11 = {;
      }
        v12 = [(RTAddress *)self locality];
        v8 = +[NSString stringWithFormat:@"%@, %@", v11, v12];
      }
      else {
        v8 = {;
      }
      }
    }
  }

  return v8;
}

@end