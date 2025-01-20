@interface CNVCardSocialProfileLineGenerator
- (BOOL)isStandardServiceName:(id)a3;
- (id)lineWithValue:(id)a3 label:(id)a4;
@end

@implementation CNVCardSocialProfileLineGenerator

- (id)lineWithValue:(id)a3 label:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [v6 valueForKey:@"service"];
  v28 = v7;
  if ([v8 length])
  {
    BOOL v9 = [(CNVCardSocialProfileLineGenerator *)self isStandardServiceName:v8];
    BOOL v10 = v9;
    if (v9)
    {
      uint64_t v11 = [v8 lowercaseString];

      id v8 = (id)v11;
    }
    id v8 = v8;
    v12 = v8;
  }
  else
  {
    BOOL v10 = 0;
    v12 = 0;
  }
  v13 = [v6 valueForKey:@"urlString"];
  v27 = v8;
  if ([v13 length])
  {
    if (v10)
    {
      v26 = 0;
    }
    else
    {
      v26 = [v6 valueForKey:@"username"];
    }
    id v18 = v13;
    v29 = v18;
  }
  else
  {
    v14 = [v6 valueForKey:@"username"];

    v29 = v14;
    if ([v14 length])
    {
      v15 = NSString;
      v16 = [MEMORY[0x1E4F28B88] URLPathAllowedCharacterSet];
      v17 = [v14 stringByAddingPercentEncodingWithAllowedCharacters:v16];
      id v18 = [v15 stringWithFormat:@"%@:%@", @"x-apple", v17];

      v26 = 0;
    }
    else
    {
      v26 = 0;
      id v18 = 0;
    }
  }
  v19 = [v6 valueForKey:@"userIdentifier"];
  v20 = [v6 valueForKey:@"displayname"];
  v21 = [v6 objectForKeyedSubscript:@"bundleIdentifiers"];
  if ([v21 count])
  {
    v22 = [v21 componentsJoinedByString:@","];
  }
  else
  {
    v22 = 0;
  }
  v23 = [v6 objectForKeyedSubscript:@"teamIdentifier"];
  v30.receiver = self;
  v30.super_class = (Class)CNVCardSocialProfileLineGenerator;
  v24 = [(CNVCardLineGenerator *)&v30 lineWithValue:v18 label:v28];

  [v24 addParameterWithName:@"type" value:v12];
  [v24 addParameterWithName:@"x-user" value:v26];
  [v24 addParameterWithName:@"x-userid" value:v19];
  [v24 addParameterWithName:@"x-displayname" value:v20];
  [v24 addParameterWithName:@"x-bundleidentifiers" value:v22];
  [v24 addParameterWithName:@"x-teamidentifier" value:v23];

  return v24;
}

- (BOOL)isStandardServiceName:(id)a3
{
  v7[6] = *MEMORY[0x1E4F143B8];
  v7[0] = @"Twitter";
  v7[1] = @"Facebook";
  v7[2] = @"LinkedIn";
  v7[3] = @"Flickr";
  v7[4] = @"MySpace";
  v7[5] = @"SinaWeibo";
  v3 = (void *)MEMORY[0x1E4F1C978];
  id v4 = a3;
  v5 = [v3 arrayWithObjects:v7 count:6];
  LOBYTE(v3) = [v5 containsObject:v4];

  return (char)v3;
}

@end