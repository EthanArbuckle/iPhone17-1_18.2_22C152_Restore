@interface NSError(TSPersistence)
+ (id)tsp_errorWithCode:()TSPersistence underlyingError:;
+ (id)tsp_recoverableErrorWithCode:()TSPersistence;
+ (id)tsp_recoverableErrorWithError:()TSPersistence;
+ (uint64_t)tsp_errorWithCode:()TSPersistence;
- (uint64_t)tsp_isRecoverable;
@end

@implementation NSError(TSPersistence)

+ (uint64_t)tsp_errorWithCode:()TSPersistence
{
  return objc_msgSend(a1, "tsp_errorWithCode:underlyingError:", a3, 0);
}

+ (id)tsp_errorWithCode:()TSPersistence underlyingError:
{
  id v6 = a4;
  v7 = 0;
  v8 = @"The document was created with an unsupported application version";
  switch(a3)
  {
    case 0:
      v14 = UnsafePointer();
      uint64_t v15 = [v14 localizedStringForKey:@"This document is corrupt." value:&stru_26D688A48 table:@"TSPersistence"];
      goto LABEL_11;
    case 1:
      v14 = UnsafePointer();
      uint64_t v15 = [v14 localizedStringForKey:@"An error occurred while reading the document." value:&stru_26D688A48 table:@"TSPersistence"];
      goto LABEL_11;
    case 2:
    case 3:
      v9 = UnsafePointer();
      v8 = [v9 localizedStringForKey:@"Couldn\\U2019t auto-save document." value:&stru_26D688A48 table:@"TSPersistence"];

      v10 = UnsafePointer();
      if (a3 == 2) {
        [v10 localizedStringForKey:@"Your most recent changes might be lost." value:&stru_26D688A48 table:@"TSPersistence"];
      }
      else {
      v7 = [v10 localizedStringForKey:@"The disk is full. Free up some space, then return to your presentation. Your most recent changes might be lost.", &stru_26D688A48, @"TSPersistence" value table];
      }

      break;
    case 4:
    case 5:
    case 6:
      v14 = UnsafePointer();
      uint64_t v15 = [v14 localizedStringForKey:@"Encountered a critical error." value:&stru_26D688A48 table:@"TSPersistence"];
      goto LABEL_11;
    case 7:
      v14 = UnsafePointer();
      uint64_t v15 = [v14 localizedStringForKey:@"To open this document, download the latest version of the app from the App Store.", &stru_26D688A48, @"TSPersistence" value table];
      goto LABEL_11;
    case 8:
      v14 = UnsafePointer();
      uint64_t v15 = [v14 localizedStringForKey:@"The document was created with an unsupported old application version" value:&stru_26D688A48 table:@"TSPersistence"];
      goto LABEL_11;
    case 9:
      break;
    case 10:
      v14 = UnsafePointer();
      uint64_t v15 = [v14 localizedStringForKey:@"Can\\U2019t open document without password." value:&stru_26D688A48 table:@"TSPersistence"];
LABEL_11:
      v8 = (__CFString *)v15;

      v7 = 0;
      break;
    case 11:
      v7 = 0;
      v8 = @"View state version UUID does not match document's.";
      break;
    default:
      v11 = [MEMORY[0x263F7C7F0] currentHandler];
      v12 = [NSString stringWithUTF8String:"+[NSError(TSPersistence) tsp_errorWithCode:underlyingError:]"];
      v13 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/AlderShared/persistence/src/NSError_TSPersistence.mm"];
      [v11 handleFailureInFunction:v12 file:v13 lineNumber:83 description:@"Bad error code"];

      v7 = 0;
      v8 = 0;
      break;
  }
  v16 = objc_msgSend(a1, "tsu_errorWithDomain:code:alertTitle:alertMessage:underlyingError:", @"com.apple.iWork.TSPersistence", a3, v8, v7, v6);

  return v16;
}

+ (id)tsp_recoverableErrorWithCode:()TSPersistence
{
  v2 = objc_msgSend(a1, "tsp_errorWithCode:");
  v3 = objc_msgSend(a1, "tsp_recoverableErrorWithError:", v2);

  return v3;
}

+ (id)tsp_recoverableErrorWithError:()TSPersistence
{
  id v3 = a3;
  if (v3)
  {
    v4 = v3;
    v5 = [v3 userInfo];
    if (v5)
    {
      id v6 = [v4 userInfo];
      v7 = (void *)[v6 mutableCopy];
    }
    else
    {
      v7 = (void *)[objc_alloc(MEMORY[0x263EFF9A0]) initWithCapacity:1];
    }

    [v7 setObject:MEMORY[0x263EFFA88] forKeyedSubscript:@"TSPErrorIsRecoverable"];
    v9 = (void *)MEMORY[0x263F087E8];
    v10 = [v4 domain];
    v8 = objc_msgSend(v9, "errorWithDomain:code:userInfo:", v10, objc_msgSend(v4, "code"), v7);
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (uint64_t)tsp_isRecoverable
{
  uint64_t v3 = [a1 code];
  if (v3 == 11)
  {
    v1 = [a1 domain];
    if ([v1 isEqualToString:@"com.apple.iWork.TSPersistence"])
    {
      uint64_t v4 = 1;
LABEL_5:

      return v4;
    }
  }
  v5 = [a1 userInfo];
  id v6 = [v5 objectForKeyedSubscript:@"TSPErrorIsRecoverable"];
  uint64_t v4 = [v6 BOOLValue];

  if (v3 == 11) {
    goto LABEL_5;
  }
  return v4;
}

@end