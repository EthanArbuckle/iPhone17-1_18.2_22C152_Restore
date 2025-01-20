@interface MBError
+ (BOOL)isCancelledError:(id)a3;
+ (BOOL)isCancelledXPCActivityDeferredError:(id)a3;
+ (BOOL)isError:(id)a3 withCode:(int64_t)a4;
+ (BOOL)isError:(id)a3 withCodes:(int64_t)a4;
+ (BOOL)isNSError:(id)a3 withCode:(int64_t)a4;
+ (BOOL)isRetryAfterError:(id)a3 retryAfterDate:(id *)a4;
+ (BOOL)isTransientError:(id)a3;
+ (BOOL)isUnexpectedErrorCode:(int64_t)a3;
+ (id)_errorWithCode:(int64_t)a3 URL:(id)a4 format:(id)a5;
+ (id)_errorWithErrno:(int)a3 code:(int64_t)a4 path:(id)a5 format:(id)a6 arguments:(char *)a7;
+ (id)_formatErrors:(id)a3 descriptionSelector:(SEL)a4;
+ (id)descriptionForError:(id)a3;
+ (id)descriptionForError:(id)a3 paths:(BOOL)a4;
+ (id)dictionaryRepresentationForError:(id)a3;
+ (id)dictionaryRepresentationForError:(id)a3 withMultiErrors:(BOOL)a4;
+ (id)errorForHTTPURLResponse:(id)a3 error:(id)a4;
+ (id)errorForNSError:(id)a3 path:(id)a4 description:(id)a5;
+ (id)errorForNSError:(id)a3 path:(id)a4 format:(id)a5;
+ (id)errorWithCode:(int64_t)a3 description:(id)a4;
+ (id)errorWithCode:(int64_t)a3 error:(id)a4 URL:(id)a5 format:(id)a6;
+ (id)errorWithCode:(int64_t)a3 error:(id)a4 format:(id)a5;
+ (id)errorWithCode:(int64_t)a3 error:(id)a4 path:(id)a5 format:(id)a6;
+ (id)errorWithCode:(int64_t)a3 format:(id)a4;
+ (id)errorWithCode:(int64_t)a3 path:(id)a4 description:(id)a5;
+ (id)errorWithCode:(int64_t)a3 path:(id)a4 format:(id)a5;
+ (id)errorWithDictionaryRepresentation:(id)a3;
+ (id)errorWithDictionaryRepresentation:(id)a3 withMultiErrors:(BOOL)a4;
+ (id)errorWithDomain:(id)a3 code:(int64_t)a4 format:(id)a5;
+ (id)errorWithDomain:(id)a3 code:(int64_t)a4 path:(id)a5 format:(id)a6;
+ (id)errorWithErrno:(int)a3 code:(int64_t)a4 path:(id)a5 format:(id)a6;
+ (id)errorWithErrno:(int)a3 format:(id)a4;
+ (id)errorWithErrno:(int)a3 path:(id)a4 format:(id)a5;
+ (id)errorWithErrors:(id)a3;
+ (id)loggableDescriptionForError:(id)a3;
+ (id)posixErrorWithCode:(int64_t)a3 format:(id)a4;
+ (id)posixErrorWithCode:(int64_t)a3 path:(id)a4 format:(id)a5;
+ (id)posixErrorWithFormat:(id)a3;
+ (id)posixErrorWithPath:(id)a3 format:(id)a4;
+ (id)signatureForError:(id)a3;
+ (int)codeForErrno:(int)a3;
+ (int)codeForNSError:(id)a3;
+ (int)errnoForError:(id)a3;
@end

@implementation MBError

+ (BOOL)isUnexpectedErrorCode:(int64_t)a3
{
  if (a3) {
    BOOL v3 = a3 == 207;
  }
  else {
    BOOL v3 = 1;
  }
  return !v3;
}

+ (BOOL)isTransientError:(id)a3
{
  unsigned int v4 = objc_msgSend(objc_msgSend(a3, "domain"), "isEqualToString:", @"MBErrorDomain");
  if (v4)
  {
    id v5 = [a3 code];
    LOBYTE(v4) = MBIsTransientErrorCode((uint64_t)v5);
  }
  return v4;
}

+ (BOOL)isCancelledError:(id)a3
{
  if (a3)
  {
    LODWORD(v4) = objc_msgSend(objc_msgSend(a3, "domain"), "isEqualToString:", @"MBErrorDomain");
    if (v4)
    {
      unsigned int v4 = (char *)[a3 code];
      if ((unint64_t)(v4 - 202) <= 0x16) {
        LOBYTE(v4) = (0x7F8001u >> ((_BYTE)v4 + 54)) & 1;
      }
      else {
        LOBYTE(v4) = 0;
      }
    }
  }
  else
  {
    LOBYTE(v4) = 0;
  }
  return (char)v4;
}

+ (BOOL)isCancelledXPCActivityDeferredError:(id)a3
{
  id v3 = a3;
  if ([a1 isError:a3 withCode:202]) {
    id v3 = objc_msgSend(objc_msgSend(v3, "userInfo"), "objectForKeyedSubscript:", NSUnderlyingErrorKey);
  }
  return [a1 isError:v3 withCode:223];
}

+ (int)codeForErrno:(int)a3
{
  uint64_t v3 = *(void *)&a3;
  if (a3 <= 15)
  {
    switch(a3)
    {
      case 1:
        return 24;
      case 2:
        return 4;
      case 9:
        return 1;
      default:
LABEL_11:
        id v5 = MBGetDefaultLog();
        if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 67109120;
          int v13 = v3;
          _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "No code for POSIX error: %{errno}d", buf, 8u);
          _MBLog(@"DEFAULT", (uint64_t)"No code for POSIX error: %{errno}d", v6, v7, v8, v9, v10, v11, v3);
        }
        return 100;
    }
  }
  else
  {
    switch(a3)
    {
      case 16:
        return 14;
      case 17:
        return 3;
      case 18:
        return 26;
      case 19:
      case 22:
      case 23:
      case 24:
      case 25:
      case 26:
      case 27:
        goto LABEL_11;
      case 20:
        return 5;
      case 21:
        return 6;
      case 28:
        return 105;
      default:
        if (a3 == 62)
        {
          int result = 7;
        }
        else
        {
          if (a3 != 93) {
            goto LABEL_11;
          }
          int result = 8;
        }
        break;
    }
  }
  return result;
}

+ (int)errnoForError:(id)a3
{
  if (!objc_msgSend(objc_msgSend(a3, "domain"), "isEqualToString:", @"MBErrorDomain"))
  {
LABEL_8:
    uint64_t v7 = MBGetDefaultLog();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v15 = a3;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "No POSIX code for error: %@", buf, 0xCu);
      _MBLog(@"DEFAULT", (uint64_t)"No POSIX code for error: %@", v8, v9, v10, v11, v12, v13, (uint64_t)a3);
    }
    return 5;
  }
  uint64_t v4 = (uint64_t)[a3 code];
  if (v4 > 25)
  {
    switch(v4)
    {
      case 26:
        return 18;
      case 105:
        return 28;
      case 100:
        return 5;
    }
    goto LABEL_8;
  }
  uint64_t v5 = v4 - 3;
  int result = 2;
  switch(v5)
  {
    case 0:
      int result = 17;
      break;
    case 1:
      return result;
    case 2:
      int result = 20;
      break;
    case 3:
      int result = 21;
      break;
    case 4:
      int result = 62;
      break;
    case 5:
      int result = 93;
      break;
    case 6:
      return 5;
    case 11:
      int result = 16;
      break;
    default:
      goto LABEL_8;
  }
  return result;
}

+ (int)codeForNSError:(id)a3
{
  if (objc_msgSend(objc_msgSend(a3, "domain"), "isEqualToString:", NSCocoaErrorDomain))
  {
    if (((unint64_t)[a3 code] | 0x100) == 0x104) {
      return 4;
    }
    id v6 = objc_msgSend(objc_msgSend(a3, "userInfo"), "objectForKeyedSubscript:", NSUnderlyingErrorKey);
    if (v6)
    {
      return +[MBError codeForNSError:v6];
    }
    return 100;
  }
  if (objc_msgSend(objc_msgSend(a3, "domain"), "isEqualToString:", NSURLErrorDomain))
  {
    if ([a3 code] == (id)-999) {
      return 202;
    }
    else {
      return 300;
    }
  }
  if (!objc_msgSend(objc_msgSend(a3, "domain"), "isEqualToString:", NSPOSIXErrorDomain))
  {
    if (objc_msgSend(objc_msgSend(a3, "domain"), "isEqualToString:", @"MBErrorDomain")) {
      return [a3 code];
    }
    return 100;
  }
  id v5 = [a3 code];
  return +[MBError codeForErrno:v5];
}

+ (BOOL)isError:(id)a3 withCode:(int64_t)a4
{
  if ([a3 code] != (id)a4) {
    return 0;
  }
  id v5 = [a3 domain];
  return [v5 isEqualToString:@"MBErrorDomain"];
}

+ (BOOL)isError:(id)a3 withCodes:(int64_t)a4
{
  unsigned int v6 = objc_msgSend(objc_msgSend(a3, "domain"), "isEqualToString:", @"MBErrorDomain");
  if (v6)
  {
    if ([a3 code] == (id)a4)
    {
LABEL_6:
      LOBYTE(v6) = 1;
    }
    else
    {
      uint64_t v10 = (void **)&v11;
      while (1)
      {
        uint64_t v7 = v10++;
        if (!*v7) {
          break;
        }
        id v8 = *v7;
        if ([a3 code] == v8) {
          goto LABEL_6;
        }
      }
      LOBYTE(v6) = 0;
    }
  }
  return v6;
}

+ (BOOL)isNSError:(id)a3 withCode:(int64_t)a4
{
  return +[MBError codeForNSError:a3] == a4;
}

+ (BOOL)isRetryAfterError:(id)a3 retryAfterDate:(id *)a4
{
  id v5 = a3;
  if (!+[MBError isError:withCodes:](MBError, "isError:withCodes:", a3, 304, 17, 0)) {
    return 0;
  }
  while (1)
  {
    id v6 = objc_msgSend(objc_msgSend(v5, "userInfo"), "objectForKeyedSubscript:", @"RetryAfter");
    if (v6) {
      break;
    }
    id v5 = objc_msgSend(objc_msgSend(v5, "userInfo"), "objectForKeyedSubscript:", NSUnderlyingErrorKey);
    if (!v5) {
      return 0;
    }
  }
  id v8 = v6;
  uint64_t v9 = (NSDate *)[(id)MBHTTPDateFormatter() dateFromString:v6];
  if (v9)
  {
    if (!a4) {
      return v9 != 0;
    }
  }
  else
  {
    uint64_t v10 = (uint64_t)[v8 integerValue];
    if (v10 < 1) {
      return 0;
    }
    uint64_t v9 = +[NSDate dateWithTimeIntervalSinceNow:(double)v10];
    if (!a4) {
      return v9 != 0;
    }
  }
  if (!v9) {
    return v9 != 0;
  }
  *a4 = v9;
  return 1;
}

+ (id)errorWithCode:(int64_t)a3 description:(id)a4
{
  return +[MBError errorWithCode:a3, @"%@", a4 format];
}

+ (id)errorWithCode:(int64_t)a3 path:(id)a4 description:(id)a5
{
  return +[MBError errorWithCode:a3, a4, @"%@", a5 path format];
}

+ (id)errorWithCode:(int64_t)a3 format:(id)a4
{
  NSErrorUserInfoKey v6 = NSLocalizedDescriptionKey;
  id v7 = [objc_alloc((Class)NSString) initWithFormat:a4 arguments:&v8];
  return +[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", @"MBErrorDomain", a3, +[NSDictionary dictionaryWithObjects:&v7 forKeys:&v6 count:1]);
}

+ (id)errorWithCode:(int64_t)a3 error:(id)a4 format:(id)a5
{
  return +[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", @"MBErrorDomain", a3, +[NSDictionary dictionaryWithObjectsAndKeys:](NSDictionary, "dictionaryWithObjectsAndKeys:", [objc_alloc((Class)NSString) initWithFormat:a5 arguments:&v6], NSLocalizedDescriptionKey, a4, NSUnderlyingErrorKey, 0));
}

+ (id)errorWithCode:(int64_t)a3 path:(id)a4 format:(id)a5
{
  return +[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", @"MBErrorDomain", a3, +[NSDictionary dictionaryWithObjectsAndKeys:](NSDictionary, "dictionaryWithObjectsAndKeys:", [objc_alloc((Class)NSString) initWithFormat:a5 arguments:&v6], NSLocalizedDescriptionKey, a4, NSFilePathErrorKey, 0));
}

+ (id)_errorWithCode:(int64_t)a3 URL:(id)a4 format:(id)a5
{
  return +[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", @"MBErrorDomain", a3, +[NSDictionary dictionaryWithObjectsAndKeys:](NSDictionary, "dictionaryWithObjectsAndKeys:", [objc_alloc((Class)NSString) initWithFormat:a5 arguments:&v6], NSLocalizedDescriptionKey, a4, NSURLErrorKey, 0));
}

+ (id)errorWithCode:(int64_t)a3 error:(id)a4 path:(id)a5 format:(id)a6
{
  return +[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", @"MBErrorDomain", a3, +[NSDictionary dictionaryWithObjectsAndKeys:](NSDictionary, "dictionaryWithObjectsAndKeys:", [objc_alloc((Class)NSString) initWithFormat:a6 arguments:&v7], NSLocalizedDescriptionKey, a4, NSUnderlyingErrorKey, a5, NSFilePathErrorKey, 0));
}

+ (id)errorWithCode:(int64_t)a3 error:(id)a4 URL:(id)a5 format:(id)a6
{
  return +[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", @"MBErrorDomain", a3, +[NSDictionary dictionaryWithObjectsAndKeys:](NSDictionary, "dictionaryWithObjectsAndKeys:", [objc_alloc((Class)NSString) initWithFormat:a6 arguments:&v7], NSLocalizedDescriptionKey, a4, NSUnderlyingErrorKey, a5, NSURLErrorKey, 0));
}

+ (id)errorWithDomain:(id)a3 code:(int64_t)a4 format:(id)a5
{
  NSErrorUserInfoKey v8 = NSLocalizedDescriptionKey;
  id v9 = [objc_alloc((Class)NSString) initWithFormat:a5 arguments:&v10];
  return +[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", a3, a4, +[NSDictionary dictionaryWithObjects:&v9 forKeys:&v8 count:1]);
}

+ (id)errorWithDomain:(id)a3 code:(int64_t)a4 path:(id)a5 format:(id)a6
{
  return +[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", a3, a4, +[NSDictionary dictionaryWithObjectsAndKeys:](NSDictionary, "dictionaryWithObjectsAndKeys:", [objc_alloc((Class)NSString) initWithFormat:a6 arguments:&v7], NSLocalizedDescriptionKey, a5, NSFilePathErrorKey, 0));
}

+ (id)errorWithErrors:(id)a3
{
  if ([a3 count] == (id)1)
  {
    return [a3 objectAtIndexedSubscript:0];
  }
  else
  {
    id v5 = +[NSMutableArray array];
    long long v12 = 0u;
    long long v13 = 0u;
    long long v14 = 0u;
    long long v15 = 0u;
    id v6 = [a3 countByEnumeratingWithState:&v12 objects:v18 count:16];
    if (v6)
    {
      id v7 = v6;
      uint64_t v8 = *(void *)v13;
      do
      {
        for (i = 0; i != v7; i = (char *)i + 1)
        {
          if (*(void *)v13 != v8) {
            objc_enumerationMutation(a3);
          }
          uint64_t v10 = *(void **)(*((void *)&v12 + 1) + 8 * i);
          if (+[MBError isError:v10 withCode:2]
            && (id v11 = objc_msgSend(objc_msgSend(v10, "userInfo"), "objectForKeyedSubscript:", @"kMBUnderlyingErrorsKey")) != 0)
          {
            [v5 addObjectsFromArray:v11];
          }
          else
          {
            [v5 addObject:v10];
          }
        }
        id v7 = [a3 countByEnumeratingWithState:&v12 objects:v18 count:16];
      }
      while (v7);
    }
    CFStringRef v16 = @"kMBUnderlyingErrorsKey";
    id v17 = [v5 copy];
    return +[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", @"MBErrorDomain", 2, +[NSDictionary dictionaryWithObjects:&v17 forKeys:&v16 count:1]);
  }
}

+ (id)_errorWithErrno:(int)a3 code:(int64_t)a4 path:(id)a5 format:(id)a6 arguments:(char *)a7
{
  id v9 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"%@: %s (%d)", [objc_alloc((Class)NSString) initWithFormat:a6 arguments:a7], strerror(a3), *(void *)&a3);
  if (a5)
  {
    v16[0] = NSLocalizedDescriptionKey;
    v16[1] = NSFilePathErrorKey;
    v17[0] = v9;
    v17[1] = a5;
    uint64_t v10 = (NSString **)v17;
    id v11 = (NSErrorUserInfoKey *)v16;
    uint64_t v12 = 2;
  }
  else
  {
    NSErrorUserInfoKey v14 = NSLocalizedDescriptionKey;
    long long v15 = v9;
    uint64_t v10 = &v15;
    id v11 = &v14;
    uint64_t v12 = 1;
  }
  return +[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", @"MBErrorDomain", a4, +[NSDictionary dictionaryWithObjects:v10 forKeys:v11 count:v12]);
}

+ (id)errorWithErrno:(int)a3 format:(id)a4
{
  return objc_msgSend(a1, "_errorWithErrno:code:path:format:arguments:", *(void *)&a3, +[MBError codeForErrno:](MBError, "codeForErrno:"), 0, a4, &v5);
}

+ (id)errorWithErrno:(int)a3 path:(id)a4 format:(id)a5
{
  return objc_msgSend(a1, "_errorWithErrno:code:path:format:arguments:", *(void *)&a3, +[MBError codeForErrno:](MBError, "codeForErrno:"), a4, a5, &v6);
}

+ (id)errorWithErrno:(int)a3 code:(int64_t)a4 path:(id)a5 format:(id)a6
{
  return [a1 _errorWithErrno:*(void *)&a3 code:a4 path:a5 format:a6 arguments:&v7];
}

+ (id)posixErrorWithFormat:(id)a3
{
  uint64_t v5 = *__error();
  return objc_msgSend(a1, "_errorWithErrno:code:path:format:arguments:", v5, +[MBError codeForErrno:](MBError, "codeForErrno:", v5), 0, a3, &v7);
}

+ (id)posixErrorWithPath:(id)a3 format:(id)a4
{
  uint64_t v7 = *__error();
  return objc_msgSend(a1, "_errorWithErrno:code:path:format:arguments:", v7, +[MBError codeForErrno:](MBError, "codeForErrno:", v7), a3, a4, &v9);
}

+ (id)posixErrorWithCode:(int64_t)a3 format:(id)a4
{
  return [a1 _errorWithErrno:*__error() code:a3 path:0 format:a4 arguments:&v5];
}

+ (id)posixErrorWithCode:(int64_t)a3 path:(id)a4 format:(id)a5
{
  return [a1 _errorWithErrno:*__error() code:a3 path:a4 format:a5 arguments:&v6];
}

+ (id)errorForNSError:(id)a3 path:(id)a4 format:(id)a5
{
  return +[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", @"MBErrorDomain", +[MBError codeForNSError:](MBError, "codeForNSError:", a3), +[NSDictionary dictionaryWithObjectsAndKeys:](NSDictionary, "dictionaryWithObjectsAndKeys:", [objc_alloc((Class)NSString) initWithFormat:a5 arguments:&v6], NSLocalizedDescriptionKey, a3, NSUnderlyingErrorKey, a4, NSFilePathErrorKey, 0));
}

+ (id)errorForNSError:(id)a3 path:(id)a4 description:(id)a5
{
  uint64_t v6 = +[NSDictionary dictionaryWithObjectsAndKeys:](NSDictionary, "dictionaryWithObjectsAndKeys:", a5, NSLocalizedDescriptionKey, a3, NSUnderlyingErrorKey, a4, NSFilePathErrorKey, 0);
  uint64_t v7 = +[MBError codeForNSError:a3];
  return +[NSError errorWithDomain:@"MBErrorDomain" code:v7 userInfo:v6];
}

+ (id)errorForHTTPURLResponse:(id)a3 error:(id)a4
{
  if (a3)
  {
    if ((uint64_t)[a3 statusCode] >= 200 && (uint64_t)objc_msgSend(a3, "statusCode") < 300) {
      return 0;
    }
    if ((uint64_t)[a3 statusCode] >= 300 && (uint64_t)objc_msgSend(a3, "statusCode") <= 399)
    {
      id v6 = [a3 statusCode];
      id v7 = [a3 URL];
      if (v6 == (id)330)
      {
        CFStringRef v8 = @"Account Moved";
        uint64_t v9 = 307;
        id v10 = v7;
LABEL_37:
        return +[MBError _errorWithCode:v9 URL:v10 format:v8];
      }
      goto LABEL_27;
    }
    if ((uint64_t)[a3 statusCode] >= 400 && (uint64_t)objc_msgSend(a3, "statusCode") <= 499)
    {
      uint64_t v13 = (uint64_t)[a3 statusCode];
      if (v13 <= 408)
      {
        if (v13 == 401)
        {
          id v10 = [a3 URL];
          CFStringRef v8 = @"Unauthorized";
          uint64_t v9 = 305;
          goto LABEL_37;
        }
        if (v13 == 404)
        {
          id v10 = [a3 URL];
          CFStringRef v8 = @"Not Found";
          uint64_t v9 = 4;
          goto LABEL_37;
        }
      }
      else
      {
        switch(v13)
        {
          case 409:
            id v10 = [a3 URL];
            CFStringRef v8 = @"Conflict";
            uint64_t v9 = 3;
            goto LABEL_37;
          case 423:
            id v10 = [a3 URL];
            CFStringRef v8 = @"Locked";
            uint64_t v9 = 13;
            goto LABEL_37;
          case 424:
            id v10 = [a3 URL];
            CFStringRef v8 = @"Failed Dependency";
            uint64_t v9 = 306;
            goto LABEL_37;
        }
      }
      return +[MBError _errorWithCode:URL:format:](MBError, "_errorWithCode:URL:format:", 301, [a3 URL], @"Client error: %ld %@", objc_msgSend(a3, "statusCode"), +[NSHTTPURLResponse localizedStringForStatusCode:](NSHTTPURLResponse, "localizedStringForStatusCode:", objc_msgSend(a3, "statusCode")));
    }
    if ((uint64_t)[a3 statusCode] < 500 || (uint64_t)objc_msgSend(a3, "statusCode") > 599)
    {
      id v7 = [a3 URL];
LABEL_27:
      id v17 = [a3 statusCode];
      CFStringRef v16 = @"Unexpected HTTP status code: %ld";
      return +[MBError _errorWithCode:URL:format:](MBError, "_errorWithCode:URL:format:", 302, v7, v16, v17, v18);
    }
    id v14 = [a3 statusCode];
    if (v14 == (id)507)
    {
      id v10 = [a3 URL];
      CFStringRef v8 = @"Insufficient Storage";
      uint64_t v9 = 303;
      goto LABEL_37;
    }
    if (v14 != (id)503)
    {
      id v7 = [a3 URL];
      id v17 = [a3 statusCode];
      v18 = +[NSHTTPURLResponse localizedStringForStatusCode:](NSHTTPURLResponse, "localizedStringForStatusCode:", [a3 statusCode]);
      CFStringRef v16 = @"Server error: %ld %@";
      return +[MBError _errorWithCode:URL:format:](MBError, "_errorWithCode:URL:format:", 302, v7, v16, v17, v18);
    }
    long long v15 = +[NSDictionary dictionaryWithObjectsAndKeys:](NSDictionary, "dictionaryWithObjectsAndKeys:", @"Service Unavailable", NSLocalizedDescriptionKey, [a3 URL], NSURLErrorKey, objc_msgSend(objc_msgSend(a3, "allHeaderFields"), "objectForKey:", @"Retry-After"), @"RetryAfter", 0);
    return +[NSError errorWithDomain:@"MBErrorDomain" code:304 userInfo:v15];
  }
  else
  {
    uint64_t v12 = +[MBError codeForNSError:a4];
    return +[MBError errorWithCode:v12 error:a4 format:@"HTTP connection error"];
  }
}

+ (id)signatureForError:(id)a3
{
  id v4 = +[NSMutableString string];
  if (a3)
  {
    do
    {
      [v4 appendString:+[NSString stringWithFormat:](NSString, "stringWithFormat:", @"/%@:%ld", objc_msgSend(a3, "domain"), objc_msgSend(a3, "code"))];
      id v5 = objc_msgSend(objc_msgSend(a3, "userInfo"), "objectForKeyedSubscript:", NSUnderlyingErrorKey);
      id v6 = [a3 userInfo];
      if (v5)
      {
        id v7 = [v6 objectForKeyedSubscript:NSUnderlyingErrorKey];
      }
      else
      {
        if (![v6 objectForKeyedSubscript:@"kMBUnderlyingErrorsKey"]) {
          break;
        }
        id v7 = objc_msgSend(objc_msgSend(objc_msgSend(a3, "userInfo"), "objectForKeyedSubscript:", @"kMBUnderlyingErrorsKey"), "firstObject");
      }
      a3 = v7;
    }
    while (v7);
  }
  id v8 = [v4 copy];
  return v8;
}

+ (id)_formatErrors:(id)a3 descriptionSelector:(SEL)a4
{
  if (!a3) {
    return 0;
  }
  id v7 = [a3 count];
  id v8 = +[NSMutableArray array];
  if ((unint64_t)v7 >= 3) {
    uint64_t v9 = 3;
  }
  else {
    uint64_t v9 = (uint64_t)v7;
  }
  if (v9)
  {
    for (uint64_t i = 0; i != v9; ++i)
      objc_msgSend(v8, "addObject:", objc_msgSend(a1, "performSelector:withObject:", a4, objc_msgSend(a3, "objectAtIndexedSubscript:", i)));
  }
  if ((unint64_t)v7 > 3) {
    [v8 addObject:@"..."];
  }
  return MBStringWithArray(v8);
}

+ (id)loggableDescriptionForError:(id)a3
{
  if (!a3) {
    return @"(null)";
  }
  id v5 = +[NSMutableString string];
  [v5 appendFormat:@"%@(%ld)", objc_msgSend(a3, "domain"), objc_msgSend(a3, "code")];
  id v6 = objc_msgSend(objc_msgSend(a3, "userInfo"), "objectForKeyedSubscript:", NSUnderlyingErrorKey);
  if (v6) {
    [v5 appendFormat:@" Underlying error: %@", +[MBError loggableDescriptionForError:](MBError, "loggableDescriptionForError:", v6)];
  }
  id v7 = objc_msgSend(a1, "_formatErrors:descriptionSelector:", objc_msgSend(objc_msgSend(a3, "userInfo"), "objectForKeyedSubscript:", @"kMMCSErrorUnderlyingErrorArrayKey"), "loggableDescriptionForError:");
  if (v7) {
    [v5 appendFormat:@" Underlying MMCS errors: %@", v7];
  }
  id v8 = objc_msgSend(a1, "_formatErrors:descriptionSelector:", objc_msgSend(objc_msgSend(objc_msgSend(a3, "userInfo"), "objectForKeyedSubscript:", @"CKPartialErrors"), "allValues"), "loggableDescriptionForError:");
  if (v8) {
    [v5 appendFormat:@" Underlying CloudKit errors: %@", v8];
  }
  id v9 = objc_msgSend(a1, "_formatErrors:descriptionSelector:", objc_msgSend(objc_msgSend(a3, "userInfo"), "objectForKeyedSubscript:", @"kMBUnderlyingErrorsKey"), "loggableDescriptionForError:");
  if (v9) {
    [v5 appendFormat:@" Underlying Backup errors: %@", v9];
  }
  return v5;
}

+ (id)descriptionForError:(id)a3
{
  return +[MBError descriptionForError:a3 paths:1];
}

+ (id)descriptionForError:(id)a3 paths:(BOOL)a4
{
  if (!a3) {
    return @"(null)";
  }
  BOOL v4 = a4;
  id v6 = +[NSMutableString string];
  CFStringRef v7 = (const __CFString *)[a3 localizedDescription];
  if (v7) {
    CFStringRef v8 = v7;
  }
  else {
    CFStringRef v8 = @"Unknown error";
  }
  [v6 appendString:v8];
  if (v4)
  {
    id v9 = objc_msgSend(objc_msgSend(a3, "userInfo"), "objectForKeyedSubscript:", NSFilePathErrorKey);
    if (v9) {
      [v6 appendFormat:@" at path \"%@\"", v9];
    }
    id v10 = objc_msgSend(objc_msgSend(a3, "userInfo"), "objectForKeyedSubscript:", NSURLErrorKey);
    if (v10) {
      [v6 appendFormat:@" for URL \"%@\"", v10];
    }
  }
  [v6 appendFormat:@" (%@/%d)", objc_msgSend(a3, "domain"), objc_msgSend(a3, "code")];
  id v11 = objc_msgSend(objc_msgSend(a3, "userInfo"), "objectForKeyedSubscript:", NSUnderlyingErrorKey);
  if (v11) {
    [v6 appendFormat:@". Underlying error: %@.", +[MBError descriptionForError:](MBError, "descriptionForError:", v11)];
  }
  id v12 = objc_msgSend(objc_msgSend(a3, "userInfo"), "objectForKeyedSubscript:", @"kMMCSErrorUnderlyingErrorArrayKey");
  if (v12)
  {
    uint64_t v13 = v12;
    id v14 = [v12 count];
    id v15 = +[NSMutableArray array];
    if ((unint64_t)v14 >= 3) {
      uint64_t v16 = 3;
    }
    else {
      uint64_t v16 = (uint64_t)v14;
    }
    if (v16)
    {
      for (uint64_t i = 0; i != v16; ++i)
        objc_msgSend(v15, "addObject:", +[MBError descriptionForError:](MBError, "descriptionForError:", objc_msgSend(v13, "objectAtIndexedSubscript:", i)));
    }
    if ((unint64_t)v14 > 3) {
      [v15 addObject:@"..."];
    }
    [v6 appendFormat:@". Underlying MMCS errors: %@.", MBStringWithArray(v15)];
  }
  return v6;
}

+ (id)dictionaryRepresentationForError:(id)a3
{
  return [a1 dictionaryRepresentationForError:a3 withMultiErrors:0];
}

+ (id)dictionaryRepresentationForError:(id)a3 withMultiErrors:(BOOL)a4
{
  BOOL v4 = a4;
  id v7 = +[NSMutableDictionary dictionary];
  objc_msgSend(v7, "setValue:forKey:", objc_msgSend(a3, "domain"), @"domain");
  objc_msgSend(v7, "setValue:forKey:", +[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", objc_msgSend(a3, "code")), @"code");
  id v8 = [a3 localizedDescription];
  if (v8) {
    [v7 setValue:v8 forKey:@"localizedDescription"];
  }
  id v9 = [a3 userInfo];
  id v10 = [v9 objectForKeyedSubscript:NSFilePathErrorKey];
  if (v10) {
    [v7 setValue:v10 forKey:@"filePath"];
  }
  id v11 = [v9 objectForKeyedSubscript:NSURLErrorKey];
  if (v11) {
    objc_msgSend(v7, "setValue:forKey:", objc_msgSend(v11, "absoluteString"), @"URL");
  }
  id v12 = [v9 objectForKeyedSubscript:NSUnderlyingErrorKey];
  if (v12) {
    objc_msgSend(v7, "setValue:forKey:", objc_msgSend(a1, "dictionaryRepresentationForError:withMultiErrors:", v12, v4), @"underlyingError");
  }
  if (v4)
  {
    id v13 = [v9 objectForKeyedSubscript:@"kMBUnderlyingErrorsKey"];
    if (v13)
    {
      id v14 = v13;
      id v15 = +[NSMutableArray arrayWithCapacity:](NSMutableArray, "arrayWithCapacity:", [v13 count]);
      long long v22 = 0u;
      long long v23 = 0u;
      long long v24 = 0u;
      long long v25 = 0u;
      id v16 = [v14 countByEnumeratingWithState:&v22 objects:v26 count:16];
      if (v16)
      {
        id v17 = v16;
        uint64_t v18 = *(void *)v23;
        do
        {
          v19 = 0;
          do
          {
            if (*(void *)v23 != v18) {
              objc_enumerationMutation(v14);
            }
            -[NSMutableArray addObject:](v15, "addObject:", [a1 dictionaryRepresentationForError:*(void *)(*((void *)&v22 + 1) + 8 * (void)v19) withMultiErrors:1]);
            v19 = (char *)v19 + 1;
          }
          while (v17 != v19);
          id v17 = [v14 countByEnumeratingWithState:&v22 objects:v26 count:16];
        }
        while (v17);
      }
      [v7 setObject:v15 forKey:@"underlyingErrors"];
    }
  }
  id v20 = [v9 valueForKey:@"kMBErrorDateKey"];
  if (v20) {
    [v7 setObject:v20 forKeyedSubscript:@"date"];
  }
  return v7;
}

+ (id)errorWithDictionaryRepresentation:(id)a3
{
  return [a1 errorWithDictionaryRepresentation:a3 withMultiErrors:0];
}

+ (id)errorWithDictionaryRepresentation:(id)a3 withMultiErrors:(BOOL)a4
{
  if (!a3) {
    return 0;
  }
  BOOL v4 = a4;
  id result = [a3 objectForKeyedSubscript:@"domain"];
  if (!result) {
    return result;
  }
  id v8 = result;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0) {
    return 0;
  }
  id result = [a3 objectForKeyedSubscript:@"code"];
  if (!result) {
    return result;
  }
  id v9 = result;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0) {
      return 0;
    }
  }
  id v10 = [v9 integerValue];
  id v11 = [a3 objectForKeyedSubscript:@"localizedDescription"];
  if (v11)
  {
    id v12 = v11;
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      id v13 = v12;
    }
    else {
      id v13 = 0;
    }
  }
  else
  {
    id v13 = 0;
  }
  id v14 = [a3 objectForKeyedSubscript:@"filePath"];
  if (v14)
  {
    id v15 = v14;
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      id v16 = v15;
    }
    else {
      id v16 = 0;
    }
  }
  else
  {
    id v16 = 0;
  }
  id v17 = [a3 objectForKeyedSubscript:@"URL"];
  if (v17)
  {
    id v18 = v17;
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      id v19 = v18;
    }
    else {
      id v19 = 0;
    }
  }
  else
  {
    id v19 = 0;
  }
  id v20 = +[NSMutableDictionary dictionary];
  [v20 setValue:v13 forKey:NSLocalizedDescriptionKey];
  [v20 setValue:v16 forKey:NSFilePathErrorKey];
  if (v19) {
    objc_msgSend(v20, "setValue:forKey:", +[NSURL URLWithString:](NSURL, "URLWithString:", v19), NSURLErrorKey);
  }
  id v21 = [a3 objectForKeyedSubscript:@"underlyingError"];
  if (v21)
  {
    id v22 = v21;
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      id v23 = v22;
    }
    else {
      id v23 = 0;
    }
  }
  else
  {
    id v23 = 0;
  }
  objc_msgSend(v20, "setObject:forKeyedSubscript:", +[MBError errorWithDictionaryRepresentation:withMultiErrors:](MBError, "errorWithDictionaryRepresentation:withMultiErrors:", v23, v4), NSUnderlyingErrorKey);
  id v24 = [a3 objectForKeyedSubscript:@"underlyingErrors"];
  if (!v24 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    id v35 = v10;
    long long v25 = +[NSMutableArray arrayWithCapacity:](NSMutableArray, "arrayWithCapacity:", objc_msgSend(v24, "count", v20));
    long long v36 = 0u;
    long long v37 = 0u;
    long long v38 = 0u;
    long long v39 = 0u;
    id v26 = [v24 countByEnumeratingWithState:&v36 objects:v40 count:16];
    if (v26)
    {
      id v27 = v26;
      uint64_t v28 = *(void *)v37;
LABEL_35:
      uint64_t v29 = 0;
      while (1)
      {
        if (*(void *)v37 != v28) {
          objc_enumerationMutation(v24);
        }
        uint64_t v30 = *(void *)(*((void *)&v36 + 1) + 8 * v29);
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0) {
          break;
        }
        -[NSMutableArray addObject:](v25, "addObject:", [a1 errorWithDictionaryRepresentation:v30 withMultiErrors:1]);
        if (v27 == (id)++v29)
        {
          id v27 = [v24 countByEnumeratingWithState:&v36 objects:v40 count:16];
          if (v27) {
            goto LABEL_35;
          }
          break;
        }
      }
    }
    id v20 = v34;
    [v34 setObject:v25 forKeyedSubscript:@"kMBUnderlyingErrorsKey"];
    id v10 = v35;
  }
  id v31 = [a3 objectForKeyedSubscript:@"date"];
  if (v31)
  {
    id v32 = v31;
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      id v33 = v32;
    }
    else {
      id v33 = 0;
    }
  }
  else
  {
    id v33 = 0;
  }
  [v20 setObject:v33 forKeyedSubscript:@"kMBErrorDateKey"];
  return +[NSError errorWithDomain:v8 code:v10 userInfo:v20];
}

@end