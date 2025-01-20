@interface VUIMediaCollection
- (NSDate)addedToDate;
- (NSNumber)mediaItemCount;
- (NSNumber)seasonCount;
- (id)description;
@end

@implementation VUIMediaCollection

- (NSDate)addedToDate
{
  return (NSDate *)[(VUIMediaEntity *)self _propertyValueForKey:@"addedToDate"];
}

- (NSNumber)mediaItemCount
{
  return (NSNumber *)[(VUIMediaEntity *)self _propertyValueForKey:@"mediaItemCount"];
}

- (NSNumber)seasonCount
{
  return (NSNumber *)[(VUIMediaEntity *)self _propertyValueForKey:@"seasonCount"];
}

- (id)description
{
  id v3 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  v15.receiver = self;
  v15.super_class = (Class)VUIMediaCollection;
  v4 = [(VUIMediaEntity *)&v15 description];
  [v3 addObject:v4];

  v5 = NSString;
  v6 = [(VUIMediaCollection *)self addedToDate];
  v7 = [v5 stringWithFormat:@"%@=%@", @"addedToDate", v6];
  [v3 addObject:v7];

  v8 = NSString;
  v9 = [(VUIMediaCollection *)self mediaItemCount];
  v10 = [v8 stringWithFormat:@"%@=%@", @"mediaItemCount", v9];
  [v3 addObject:v10];

  v11 = NSString;
  v12 = [v3 componentsJoinedByString:@", "];
  v13 = [v11 stringWithFormat:@"<%@>", v12];

  return v13;
}

@end