@interface NSError(PhotoVisionAdditions)
+ (id)errorForPhotoVisionErrorCode:()PhotoVisionAdditions localizedDescription:;
+ (id)errorForPhotoVisionErrorCode:()PhotoVisionAdditions localizedDescription:underlyingError:;
+ (id)errorForPhotoVisionInvalidNilParameterNamed:()PhotoVisionAdditions;
+ (id)errorForPhotoVisionInvalidParameterNamed:()PhotoVisionAdditions integerValue:;
+ (id)errorForPhotoVisionInvalidParameterNamed:()PhotoVisionAdditions realValue:;
+ (id)errorForPhotoVisionInvalidParameterNamed:()PhotoVisionAdditions value:;
+ (id)errorForPhotoVisionInvalidParameterWithLocalizedDescription:()PhotoVisionAdditions;
+ (id)errorForPhotoVisionStorageErrorWithLocalizedDescription:()PhotoVisionAdditions underlyingError:;
+ (id)errorForPhotoVisionUnexpectedCondition:()PhotoVisionAdditions;
+ (id)errorForPhotoVisionVisionKitErrorWithLocalizedDescription:()PhotoVisionAdditions underlyingError:;
+ (uint64_t)errorForPhotoVisionCancelledOperation;
+ (uint64_t)errorForPhotoVisionErrorCode:()PhotoVisionAdditions userInfo:;
+ (uint64_t)errorForPhotoVisionStorageErrorWithLocalizedDescription:()PhotoVisionAdditions;
+ (uint64_t)errorForPhotoVisionStorageErrorWithUserInfo:()PhotoVisionAdditions;
+ (uint64_t)errorForPhotoVisionUnimplementedFunction;
+ (uint64_t)errorForPhotoVisionVisionKitErrorWithUserInfo:()PhotoVisionAdditions;
@end

@implementation NSError(PhotoVisionAdditions)

+ (uint64_t)errorForPhotoVisionVisionKitErrorWithUserInfo:()PhotoVisionAdditions
{
  return [a1 errorForPhotoVisionErrorCode:-1009 userInfo:a3];
}

+ (id)errorForPhotoVisionVisionKitErrorWithLocalizedDescription:()PhotoVisionAdditions underlyingError:
{
  v5 = objc_msgSend(MEMORY[0x1E4F1C9E8], "dictionaryWithObjectsAndKeys:", *MEMORY[0x1E4F28568], a4, *MEMORY[0x1E4F28A50], 0);
  v6 = [a1 errorForPhotoVisionStorageErrorWithUserInfo:v5];

  return v6;
}

+ (uint64_t)errorForPhotoVisionStorageErrorWithUserInfo:()PhotoVisionAdditions
{
  return [a1 errorForPhotoVisionErrorCode:-1007 userInfo:a3];
}

+ (id)errorForPhotoVisionStorageErrorWithLocalizedDescription:()PhotoVisionAdditions underlyingError:
{
  v5 = objc_msgSend(MEMORY[0x1E4F1C9E8], "dictionaryWithObjectsAndKeys:", *MEMORY[0x1E4F28568], a4, *MEMORY[0x1E4F28A50], 0);
  v6 = [a1 errorForPhotoVisionStorageErrorWithUserInfo:v5];

  return v6;
}

+ (uint64_t)errorForPhotoVisionStorageErrorWithLocalizedDescription:()PhotoVisionAdditions
{
  return [a1 errorForPhotoVisionStorageErrorWithLocalizedDescription:a3 underlyingError:0];
}

+ (id)errorForPhotoVisionInvalidParameterWithLocalizedDescription:()PhotoVisionAdditions
{
  v10[1] = *MEMORY[0x1E4F143B8];
  uint64_t v9 = *MEMORY[0x1E4F28568];
  v10[0] = a3;
  v4 = (void *)MEMORY[0x1E4F1C9E8];
  id v5 = a3;
  v6 = [v4 dictionaryWithObjects:v10 forKeys:&v9 count:1];

  v7 = [a1 errorForPhotoVisionErrorCode:-1002 userInfo:v6];

  return v7;
}

+ (id)errorForPhotoVisionInvalidParameterNamed:()PhotoVisionAdditions realValue:
{
  v6 = NSNumber;
  id v7 = a4;
  v8 = [v6 numberWithDouble:a2];
  uint64_t v9 = [a1 errorForPhotoVisionInvalidParameterNamed:v7 value:v8];

  return v9;
}

+ (id)errorForPhotoVisionInvalidParameterNamed:()PhotoVisionAdditions integerValue:
{
  v6 = NSNumber;
  id v7 = a3;
  v8 = [v6 numberWithInteger:a4];
  uint64_t v9 = [a1 errorForPhotoVisionInvalidParameterNamed:v7 value:v8];

  return v9;
}

+ (id)errorForPhotoVisionInvalidParameterNamed:()PhotoVisionAdditions value:
{
  id v5 = [NSString stringWithFormat:@"Invalid value of %@ for parameter %@", a4, a3];
  v6 = [a1 errorForPhotoVisionInvalidParameterWithLocalizedDescription:v5];

  return v6;
}

+ (id)errorForPhotoVisionInvalidNilParameterNamed:()PhotoVisionAdditions
{
  v4 = [NSString stringWithFormat:@"The parameter %@ cannot be nil", a3];
  id v5 = [a1 errorForPhotoVisionInvalidParameterWithLocalizedDescription:v4];

  return v5;
}

+ (id)errorForPhotoVisionUnexpectedCondition:()PhotoVisionAdditions
{
  v2 = objc_msgSend(MEMORY[0x1E4F1C9E8], "dictionaryWithObjectsAndKeys:", *MEMORY[0x1E4F28568], 0);
  v3 = [a1 errorForPhotoVisionErrorCode:-1001 userInfo:v2];

  return v3;
}

+ (uint64_t)errorForPhotoVisionCancelledOperation
{
  return [a1 errorForPhotoVisionErrorCode:-1013 userInfo:0];
}

+ (uint64_t)errorForPhotoVisionUnimplementedFunction
{
  return [a1 errorForPhotoVisionErrorCode:-1000 userInfo:0];
}

+ (id)errorForPhotoVisionErrorCode:()PhotoVisionAdditions localizedDescription:underlyingError:
{
  id v7 = objc_msgSend(MEMORY[0x1E4F1C9E8], "dictionaryWithObjectsAndKeys:", a4, *MEMORY[0x1E4F28568], a5, *MEMORY[0x1E4F28A50], 0);
  v8 = [a1 errorWithDomain:@"PVErrorDomainPhotoVision" code:a3 userInfo:v7];

  return v8;
}

+ (id)errorForPhotoVisionErrorCode:()PhotoVisionAdditions localizedDescription:
{
  v12[1] = *MEMORY[0x1E4F143B8];
  uint64_t v11 = *MEMORY[0x1E4F28568];
  v12[0] = a4;
  v6 = (void *)MEMORY[0x1E4F1C9E8];
  id v7 = a4;
  v8 = [v6 dictionaryWithObjects:v12 forKeys:&v11 count:1];

  uint64_t v9 = [a1 errorWithDomain:@"PVErrorDomainPhotoVision" code:a3 userInfo:v8];

  return v9;
}

+ (uint64_t)errorForPhotoVisionErrorCode:()PhotoVisionAdditions userInfo:
{
  return [a1 errorWithDomain:@"PVErrorDomainPhotoVision" code:a3 userInfo:a4];
}

@end