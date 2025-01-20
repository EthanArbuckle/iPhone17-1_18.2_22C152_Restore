@interface SHCoreError
+ (BOOL)annotateError:(id *)a3 code:(int64_t)a4 underlyingError:(id)a5 keyOverrides:(id)a6;
+ (BOOL)annotateError:(id *)a3 withError:(id)a4;
+ (id)errorWithCode:(int64_t)a3 underlyingError:(id)a4;
+ (id)errorWithCode:(int64_t)a3 underlyingError:(id)a4 keyOverrides:(id)a5;
+ (id)messageForCode:(int64_t)a3;
@end

@implementation SHCoreError

+ (BOOL)annotateError:(id *)a3 code:(int64_t)a4 underlyingError:(id)a5 keyOverrides:(id)a6
{
  v8 = +[SHCoreError errorWithCode:a4 underlyingError:a5 keyOverrides:a6];
  LOBYTE(a3) = [a1 annotateError:a3 withError:v8];

  return (char)a3;
}

+ (BOOL)annotateError:(id *)a3 withError:(id)a4
{
  if (a3) {
    *a3 = a4;
  }
  return a3 != 0;
}

+ (id)errorWithCode:(int64_t)a3 underlyingError:(id)a4
{
  return (id)[a1 errorWithCode:a3 underlyingError:a4 keyOverrides:MEMORY[0x263EFFA78]];
}

+ (id)errorWithCode:(int64_t)a3 underlyingError:(id)a4 keyOverrides:(id)a5
{
  v8 = (void *)MEMORY[0x263EFF9A0];
  id v9 = a5;
  id v10 = a4;
  v11 = [v8 dictionary];
  [v11 setValue:v10 forKey:*MEMORY[0x263F08608]];

  v12 = [a1 messageForCode:a3];
  [v11 setValue:v12 forKey:*MEMORY[0x263F07F80]];

  [v11 setValuesForKeysWithDictionary:v9];
  v13 = [MEMORY[0x263F087E8] errorWithDomain:@"com.apple.ShazamCore" code:a3 userInfo:v11];

  return v13;
}

+ (id)messageForCode:(int64_t)a3
{
  id result = @"A compression error occurred.";
  if (a3 > 299)
  {
    v4 = @"The media item is missing one or more required properties";
    v5 = @"The response is missing required properties";
    if (a3 != 401) {
      v5 = @"A compression error occurred.";
    }
    if (a3 != 400) {
      v4 = v5;
    }
    v6 = @"There was an error reading the supplied file.";
    v7 = @"A decompression error occurred.";
    if (a3 != 302) {
      v7 = @"A compression error occurred.";
    }
    if (a3 != 300) {
      v6 = v7;
    }
    if (a3 <= 399) {
      return v6;
    }
    else {
      return v4;
    }
  }
  else
  {
    switch(a3)
    {
      case 'd':
        id result = @"The Daemon exited";
        break;
      case 'e':
        id result = @"The match attempt was rejected";
        break;
      case 'f':
        id result = @"Missing entitlements";
        break;
      case 'h':
        id result = @"One or more audio recorders were unable to start";
        break;
      case 'i':
        id result = @"Told not to resume audio recording after an interruption";
        break;
      case 'j':
        id result = @"An attempt was made to register the same worker twice";
        break;
      default:
        return result;
    }
  }
  return result;
}

@end