@interface NSError(TSUIO)
+ (id)tsu_IOErrorWithCode:()TSUIO;
+ (id)tsu_IOReadErrorWithErrno:()TSUIO;
+ (id)tsu_IOWriteErrorWithErrno:()TSUIO;
@end

@implementation NSError(TSUIO)

+ (id)tsu_IOErrorWithCode:()TSUIO
{
  if (a3 == 1)
  {
    v5 = SFUBundle();
    v6 = v5;
    v7 = @"An error occurred while writing";
    goto LABEL_5;
  }
  if (!a3)
  {
    v5 = SFUBundle();
    v6 = v5;
    v7 = @"An error occurred while reading";
LABEL_5:
    v8 = [v5 localizedStringForKey:v7 value:&stru_26D4F03D0 table:@"TSUtility"];

    goto LABEL_7;
  }
  v8 = 0;
LABEL_7:
  v9 = objc_msgSend(a1, "tsu_errorWithDomain:code:alertTitle:alertMessage:", @"com.apple.iwork.TSUIO", a3, v8, 0);

  return v9;
}

+ (id)tsu_IOReadErrorWithErrno:()TSUIO
{
  v5 = NSString;
  v6 = SFUBundle();
  v7 = [v6 localizedStringForKey:@"An error occurred while reading: %s" value:&stru_26D4F03D0 table:@"TSUtility"];
  v8 = objc_msgSend(v5, "stringWithFormat:", v7, strerror(a3));

  v9 = objc_msgSend(a1, "tsu_errorWithDomain:code:alertTitle:alertMessage:", @"com.apple.iwork.TSUIO", 0, v8, 0);

  return v9;
}

+ (id)tsu_IOWriteErrorWithErrno:()TSUIO
{
  v5 = NSString;
  v6 = SFUBundle();
  v7 = [v6 localizedStringForKey:@"An error occurred while writing: %s" value:&stru_26D4F03D0 table:@"TSUtility"];
  v8 = objc_msgSend(v5, "stringWithFormat:", v7, strerror(a3));

  v9 = objc_msgSend(a1, "tsu_errorWithDomain:code:alertTitle:alertMessage:", @"com.apple.iwork.TSUIO", 1, v8, 0);

  return v9;
}

@end