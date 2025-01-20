@interface PGError
+ (id)errorForCode:(int64_t)a3;
+ (id)errorWithCode:(int64_t)a3 description:(id)a4;
+ (id)xpcSafeErrorWithError:(id)a3;
@end

@implementation PGError

+ (id)xpcSafeErrorWithError:(id)a3
{
  if (a3)
  {
    v3 = (void *)MEMORY[0x1E4F28C58];
    id v4 = a3;
    v5 = [v4 domain];
    uint64_t v6 = [v4 code];
    v7 = [v4 localizedDescription];

    v8 = [v3 errorWithDomain:v5 code:v6 localizedDescription:v7];
  }
  else
  {
    v8 = 0;
  }
  return v8;
}

+ (id)errorWithCode:(int64_t)a3 description:(id)a4
{
  return (id)[MEMORY[0x1E4F28C58] errorWithDomain:@"PGErrorDomain" code:a3 localizedDescription:a4];
}

+ (id)errorForCode:(int64_t)a3
{
  switch(a3)
  {
    case -10:
      id v4 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
      v5 = v4;
      uint64_t v6 = @"PGErrorFormatNotReady";
      break;
    case -9:
      id v4 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
      v5 = v4;
      uint64_t v6 = @"PGErrorFormatSyntaxError";
      break;
    case -8:
      id v4 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
      v5 = v4;
      uint64_t v6 = @"PGErrorFormatIncompleteData";
      break;
    case -7:
      id v4 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
      v5 = v4;
      uint64_t v6 = @"PGErrorFormatNotAuthorized";
      break;
    case -6:
      id v4 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
      v5 = v4;
      uint64_t v6 = @"PGErrorFormatFeatureNotSupported";
      break;
    case -5:
      id v4 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
      v5 = v4;
      uint64_t v6 = @"PGErrorFormatAlreadyInUse";
      break;
    case -4:
      id v4 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
      v5 = v4;
      uint64_t v6 = @"PGErrorFormatCanceled";
      break;
    case -3:
      id v4 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
      v5 = v4;
      uint64_t v6 = @"PGErrorFormatNotFound";
      break;
    case -2:
      id v4 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
      v5 = v4;
      uint64_t v6 = @"PGErrorFormatNotImplemented";
      break;
    case -1:
      id v4 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
      v5 = v4;
      uint64_t v6 = @"PGErrorFormatInternalError";
      break;
    default:
      id v4 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
      v5 = v4;
      uint64_t v6 = @"PGErrorFormatUnknownError";
      break;
  }
  v7 = [v4 localizedStringForKey:v6 value:v6 table:@"Localizable"];

  v8 = [MEMORY[0x1E4F28C58] errorWithDomain:@"PGErrorDomain" code:a3 localizedDescription:v7];

  return v8;
}

@end