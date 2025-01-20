@interface NSError(TLExtensions)
+ (id)tl_errorWithDomain:()TLExtensions description:;
- (id)tl_nonRedundantDescription;
@end

@implementation NSError(TLExtensions)

+ (id)tl_errorWithDomain:()TLExtensions description:
{
  v20[1] = *MEMORY[0x1E4F143B8];
  id v11 = a3;
  if (a4)
  {
    v18 = &a9;
    v12 = (objc_class *)NSString;
    id v13 = a4;
    v14 = (void *)[[v12 alloc] initWithFormat:v13 arguments:&a9];

    if (v14)
    {
      uint64_t v19 = *MEMORY[0x1E4F28568];
      v20[0] = v14;
      v15 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v20 forKeys:&v19 count:1];
    }
    else
    {
      v15 = 0;
    }
  }
  else
  {
    v15 = 0;
  }
  v16 = objc_msgSend(a1, "errorWithDomain:code:userInfo:", v11, 0, v15, v18);

  return v16;
}

- (id)tl_nonRedundantDescription
{
  v2 = [a1 description];
  v3 = [a1 userInfo];
  uint64_t v4 = *MEMORY[0x1E4F28568];
  v5 = [v3 objectForKey:*MEMORY[0x1E4F28568]];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v6 = [NSString stringWithFormat:@"%@=%@, ", v4, v5];
    v7 = [v2 stringByReplacingOccurrencesOfString:v6 withString:&stru_1F35F7550];

    v8 = [NSString stringWithFormat:@"%@=%@", v4, v5];

    v2 = [v7 stringByReplacingOccurrencesOfString:v8 withString:&stru_1F35F7550];
  }

  return v2;
}

@end