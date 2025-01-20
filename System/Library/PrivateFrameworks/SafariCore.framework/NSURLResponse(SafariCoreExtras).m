@interface NSURLResponse(SafariCoreExtras)
- (id)safari_decodeJSONData:()SafariCoreExtras expectingRootClass:error:;
- (uint64_t)safari_hasAttachment;
- (uint64_t)safari_statusCodeGroup;
@end

@implementation NSURLResponse(SafariCoreExtras)

- (uint64_t)safari_hasAttachment
{
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0) {
    return 0;
  }
  v2 = [a1 allHeaderFields];
  v3 = objc_msgSend(v2, "safari_stringForKey:", @"Content-Disposition");

  if (v3)
  {
    v4 = [v3 componentsSeparatedByString:@";"];
    if ([v4 count])
    {
      v5 = [v4 objectAtIndex:0];
      v6 = objc_msgSend(v5, "safari_stringByTrimmingWhitespace");

      uint64_t v7 = objc_msgSend(v6, "safari_isCaseInsensitiveEqualToString:", @"attachment");
    }
    else
    {
      uint64_t v7 = 0;
    }
  }
  else
  {
    uint64_t v7 = 0;
  }

  return v7;
}

- (uint64_t)safari_statusCodeGroup
{
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0) {
    return 0;
  }
  uint64_t v2 = [a1 statusCode];
  uint64_t v3 = 5;
  if ((unint64_t)(v2 - 500) >= 0x64) {
    uint64_t v3 = 0;
  }
  if ((unint64_t)(v2 - 400) >= 0x64) {
    uint64_t v4 = v3;
  }
  else {
    uint64_t v4 = 4;
  }
  if ((unint64_t)(v2 - 300) >= 0x64) {
    uint64_t v5 = v4;
  }
  else {
    uint64_t v5 = 3;
  }
  if ((unint64_t)(v2 - 200) >= 0x64) {
    uint64_t v6 = v5;
  }
  else {
    uint64_t v6 = 2;
  }
  if ((unint64_t)(v2 - 100) >= 0x64) {
    return v6;
  }
  else {
    return 1;
  }
}

- (id)safari_decodeJSONData:()SafariCoreExtras expectingRootClass:error:
{
  id v8 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    if (a5)
    {
      v11 = (void *)MEMORY[0x1E4F28C58];
      uint64_t v12 = *MEMORY[0x1E4F28798];
      v13 = @"Response is not an HTTP response.";
LABEL_11:
      objc_msgSend(v11, "safari_errorWithDomain:code:privacyPreservingDescription:", v12, 14, v13);
      id v10 = 0;
      *a5 = (id)objc_claimAutoreleasedReturnValue();
      goto LABEL_17;
    }
LABEL_12:
    id v10 = 0;
    goto LABEL_17;
  }
  if (objc_msgSend(a1, "safari_statusCodeGroup") != 2)
  {
    if (a5)
    {
      v11 = (void *)MEMORY[0x1E4F28C58];
      uint64_t v12 = *MEMORY[0x1E4F28798];
      v13 = @"Received non-successful HTTP status code.";
      goto LABEL_11;
    }
    goto LABEL_12;
  }
  v9 = [MEMORY[0x1E4F28D90] JSONObjectWithData:v8 options:0 error:a5];
  if (!v9) {
    goto LABEL_15;
  }
  if (a4 && (objc_opt_isKindOfClass() & 1) == 0)
  {
    if (a5)
    {
      objc_msgSend(MEMORY[0x1E4F28C58], "safari_errorWithDomain:code:privacyPreservingDescription:", *MEMORY[0x1E4F28798], 14, @"Root object is not the expected type.");
      id v10 = 0;
      *a5 = (id)objc_claimAutoreleasedReturnValue();
      goto LABEL_16;
    }
LABEL_15:
    id v10 = 0;
    goto LABEL_16;
  }
  id v10 = v9;
LABEL_16:

LABEL_17:
  return v10;
}

@end