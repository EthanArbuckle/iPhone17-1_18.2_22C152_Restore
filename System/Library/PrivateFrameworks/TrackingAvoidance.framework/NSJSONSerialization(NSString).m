@interface NSJSONSerialization(NSString)
+ (id)JSONStringFromNSDictionary:()NSString error:;
@end

@implementation NSJSONSerialization(NSString)

+ (id)JSONStringFromNSDictionary:()NSString error:
{
  v21[2] = *MEMORY[0x263EF8340];
  id v5 = a3;
  if ([MEMORY[0x263F08900] isValidJSONObject:v5])
  {
    id v17 = 0;
    v6 = [MEMORY[0x263F08900] dataWithJSONObject:v5 options:0 error:&v17];
    id v7 = v17;
    if (v7)
    {
      v18[0] = *MEMORY[0x263F08320];
      v8 = [MEMORY[0x263F086E0] mainBundle];
      v9 = [v8 localizedStringForKey:@"NSJSONSerialization failed" value:&stru_26D677430 table:0];
      v18[1] = *MEMORY[0x263F08608];
      v19[0] = v9;
      v19[1] = v7;
      v10 = [NSDictionary dictionaryWithObjects:v19 forKeys:v18 count:2];

      if (a4)
      {
        *a4 = [MEMORY[0x263F087E8] errorWithDomain:@"com.apple.tracking-avoidance.NSJSONSerializationNSString" code:0 userInfo:v10];
      }
      v11 = [NSString string];
    }
    else
    {
      v11 = (void *)[[NSString alloc] initWithData:v6 encoding:4];
    }
  }
  else
  {
    v20[0] = *MEMORY[0x263F08320];
    v12 = [MEMORY[0x263F086E0] mainBundle];
    v13 = [v12 localizedStringForKey:@"Invalid dictionary for JSON serialization" value:&stru_26D677430 table:0];
    v21[0] = v13;
    v20[1] = *MEMORY[0x263F08348];
    v14 = [MEMORY[0x263F086E0] mainBundle];
    v15 = [v14 localizedStringForKey:@"Refer to NSJSONSerialization spec for valid dictionaries" value:&stru_26D677430 table:0];
    v21[1] = v15;
    id v7 = [NSDictionary dictionaryWithObjects:v21 forKeys:v20 count:2];

    if (a4)
    {
      *a4 = [MEMORY[0x263F087E8] errorWithDomain:@"com.apple.tracking-avoidance.NSJSONSerializationNSString" code:0 userInfo:v7];
    }
    v11 = [NSString string];
  }

  return v11;
}

@end