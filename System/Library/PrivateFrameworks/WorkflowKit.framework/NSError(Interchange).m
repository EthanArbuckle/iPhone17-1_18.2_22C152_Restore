@interface NSError(Interchange)
+ (id)errorWithInterchangeErrorDictionary:()Interchange;
- (id)interchangeErrorDictionary;
@end

@implementation NSError(Interchange)

- (id)interchangeErrorDictionary
{
  v9[3] = *MEMORY[0x1E4F143B8];
  v8[0] = @"errorCode";
  v2 = objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(a1, "code"));
  v9[0] = v2;
  v8[1] = @"errorMessage";
  v3 = [a1 localizedDescription];
  v4 = v3;
  if (!v3)
  {
    v4 = [a1 localizedFailureReason];
  }
  v9[1] = v4;
  v8[2] = @"errorDomain";
  v5 = [a1 domain];
  v9[2] = v5;
  v6 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v9 forKeys:v8 count:3];

  if (!v3) {
  return v6;
  }
}

+ (id)errorWithInterchangeErrorDictionary:()Interchange
{
  id v4 = a3;
  v5 = [v4 objectForKey:@"errorCode"];
  uint64_t v6 = [v5 integerValue];

  v7 = [v4 objectForKey:@"errorMessage"];
  v8 = [v4 objectForKey:@"errorDomain"];

  v9 = @"InterchangeCallbackErrorDomain";
  if (v8) {
    v9 = v8;
  }
  v10 = v9;

  v11 = objc_msgSend(MEMORY[0x1E4F1C9E8], "dictionaryWithObjectsAndKeys:", v7, *MEMORY[0x1E4F28568], 0);
  v12 = [a1 errorWithDomain:v10 code:v6 userInfo:v11];

  return v12;
}

@end