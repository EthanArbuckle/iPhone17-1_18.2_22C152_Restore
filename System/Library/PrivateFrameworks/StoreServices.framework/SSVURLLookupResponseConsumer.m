@interface SSVURLLookupResponseConsumer
- (id)objectForData:(id)a3 response:(id)a4 error:(id *)a5;
@end

@implementation SSVURLLookupResponseConsumer

- (id)objectForData:(id)a3 response:(id)a4 error:(id *)a5
{
  id v7 = a4;
  id v15 = 0;
  v8 = [MEMORY[0x1E4F28D90] JSONObjectWithData:a3 options:0 error:&v15];
  id v9 = v15;
  objc_opt_class();
  v10 = 0;
  if (objc_opt_isKindOfClass())
  {
    v11 = [v8 objectForKey:@"pageType"];
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0 && [v11 isEqualToString:@"nearbyApps"]) {
      v12 = [[SSLookupResponse alloc] initWithLocationResponseDictionary:v8];
    }
    else {
      v12 = [[SSLookupResponse alloc] initWithResponseDictionary:v8];
    }
    v10 = v12;
    if (SSURLResponseExpirationInterval(v7) >= 0.0)
    {
      v13 = objc_msgSend(MEMORY[0x1E4F1C9C8], "dateWithTimeIntervalSinceNow:");
      [(SSLookupResponse *)v10 setExpirationDate:v13];
    }
  }
  if (!v7 && a5) {
    *a5 = v9;
  }

  return v10;
}

@end