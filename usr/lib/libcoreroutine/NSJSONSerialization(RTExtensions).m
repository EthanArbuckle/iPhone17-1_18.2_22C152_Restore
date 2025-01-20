@interface NSJSONSerialization(RTExtensions)
+ (id)JSONStringFromNSDictionary:()RTExtensions error:;
@end

@implementation NSJSONSerialization(RTExtensions)

+ (id)JSONStringFromNSDictionary:()RTExtensions error:
{
  v21[2] = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  if ([MEMORY[0x1E4F28D90] isValidJSONObject:v5])
  {
    id v17 = 0;
    v6 = [MEMORY[0x1E4F28D90] dataWithJSONObject:v5 options:8 error:&v17];
    id v7 = v17;
    if (v7)
    {
      v18[0] = *MEMORY[0x1E4F28568];
      v8 = [MEMORY[0x1E4F28B50] mainBundle];
      v9 = [v8 localizedStringForKey:@"NSJSONSerialization failed" value:&stru_1F33EAD88 table:0];
      v18[1] = *MEMORY[0x1E4F28A50];
      v19[0] = v9;
      v19[1] = v7;
      v10 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v19 forKeys:v18 count:2];

      if (a4)
      {
        *a4 = [MEMORY[0x1E4F28C58] errorWithDomain:@"com.apple.routined.NSJSONSerializationRTExtensions" code:0 userInfo:v10];
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
    v20[0] = *MEMORY[0x1E4F28568];
    v12 = [MEMORY[0x1E4F28B50] mainBundle];
    v13 = [v12 localizedStringForKey:@"Invalid dictionary for JSON serialization" value:&stru_1F33EAD88 table:0];
    v21[0] = v13;
    v20[1] = *MEMORY[0x1E4F285A0];
    v14 = [MEMORY[0x1E4F28B50] mainBundle];
    v15 = [v14 localizedStringForKey:@"Refer to NSJSONSerialization spec for valid dictionaries" value:&stru_1F33EAD88 table:0];
    v21[1] = v15;
    id v7 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v21 forKeys:v20 count:2];

    if (a4)
    {
      *a4 = [MEMORY[0x1E4F28C58] errorWithDomain:@"com.apple.routined.NSJSONSerializationRTExtensions" code:0 userInfo:v7];
    }
    v11 = [NSString string];
  }

  return v11;
}

@end