@interface TSPDocumentRevision
+ (id)documentRevisionAtURL:(id)a3 passphrase:(id)a4 error:(id *)a5;
+ (id)revisionWithRevisionString:(id)a3;
+ (id)revisionWithSequence:(int)a3 identifier:(id)a4;
- (BOOL)isEqual:(id)a3;
- (NSString)revisionString;
- (NSUUID)identifier;
- (TSPDocumentRevision)init;
- (TSPDocumentRevision)initWithRevisionString:(id)a3;
- (TSPDocumentRevision)initWithSequence:(int)a3 identifier:(id)a4;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)nextRevisionWithIdentifier:(id)a3;
- (int)sequence;
- (int64_t)compareSequenceFromRevision:(id)a3;
- (unint64_t)hash;
@end

@implementation TSPDocumentRevision

- (TSPDocumentRevision)init
{
  unsigned int v2 = +[TSUAssertionHandler _atomicIncrementAssertCount];
  if (TSUAssertCat_init_token != -1) {
    dispatch_once(&TSUAssertCat_init_token, &stru_1001C62A0);
  }
  v3 = TSUAssertCat_log_t;
  if (os_log_type_enabled((os_log_t)TSUAssertCat_log_t, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 67109890;
    unsigned int v9 = v2;
    __int16 v10 = 2082;
    v11 = "-[TSPDocumentRevision init]";
    __int16 v12 = 2082;
    v13 = "/Library/Caches/com.apple.xbs/Sources/iWorkXPC/shared/persistence/src/TSPDocumentRevision.mm";
    __int16 v14 = 1024;
    int v15 = 23;
    _os_log_error_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_ERROR, "#Assert *** Assertion failure #%u: %{public}s %{public}s:%d Do not call method", buf, 0x22u);
  }
  v4 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[TSPDocumentRevision init]");
  v5 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/iWorkXPC/shared/persistence/src/TSPDocumentRevision.mm"];
  +[TSUAssertionHandler handleFailureInFunction:v4 file:v5 lineNumber:23 isFatal:0 description:"Do not call method"];

  +[TSUAssertionHandler logBacktraceThrottled];
  v6 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"%s: %s", "Do not call method", "-[TSPDocumentRevision init]");
  id v7 = +[NSException exceptionWithName:NSInternalInconsistencyException reason:v6 userInfo:0];

  objc_exception_throw(v7);
}

- (TSPDocumentRevision)initWithSequence:(int)a3 identifier:(id)a4
{
  id v6 = a4;
  if (v6)
  {
    v15.receiver = self;
    v15.super_class = (Class)TSPDocumentRevision;
    id v7 = [(TSPDocumentRevision *)&v15 init];
    v8 = v7;
    if (v7)
    {
      v7->_sequence = a3;
      unsigned int v9 = (NSUUID *)[v6 copy];
      identifier = v8->_identifier;
      v8->_identifier = v9;
    }
    self = v8;
    v11 = self;
  }
  else
  {
    +[TSUAssertionHandler _atomicIncrementAssertCount];
    if (TSUAssertCat_init_token != -1) {
      dispatch_once(&TSUAssertCat_init_token, &stru_1001C62C0);
    }
    if (os_log_type_enabled((os_log_t)TSUAssertCat_log_t, OS_LOG_TYPE_ERROR)) {
      sub_100161608();
    }
    __int16 v12 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[TSPDocumentRevision initWithSequence:identifier:]");
    v13 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/iWorkXPC/shared/persistence/src/TSPDocumentRevision.mm"];
    +[TSUAssertionHandler handleFailureInFunction:v12 file:v13 lineNumber:28 isFatal:0 description:"Document revision identifier should not be nil."];

    +[TSUAssertionHandler logBacktraceThrottled];
    v11 = 0;
  }

  return v11;
}

+ (id)revisionWithSequence:(int)a3 identifier:(id)a4
{
  uint64_t v4 = *(void *)&a3;
  id v6 = a4;
  id v7 = [objc_alloc((Class)a1) initWithSequence:v4 identifier:v6];

  return v7;
}

- (TSPDocumentRevision)initWithRevisionString:(id)a3
{
  id v4 = a3;
  v5 = [v4 componentsSeparatedByString:@"::"];
  if ([v5 count] == (id)2)
  {
    id v6 = [v5 objectAtIndexedSubscript:0];
    id v7 = [v6 longLongValue];

    if (v7 != (id)(int)v7)
    {
      +[TSUAssertionHandler _atomicIncrementAssertCount];
      if (TSUAssertCat_init_token != -1) {
        dispatch_once(&TSUAssertCat_init_token, &stru_1001C62E0);
      }
      if (os_log_type_enabled((os_log_t)TSUAssertCat_log_t, OS_LOG_TYPE_ERROR)) {
        sub_1001617A4();
      }
      v8 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[TSPDocumentRevision initWithRevisionString:]");
      unsigned int v9 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/iWorkXPC/shared/persistence/src/TSPDocumentRevision.mm"];
      +[TSUAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](TSUAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v8, v9, 50, 0, "Revision string has invalid sequence: %{public}@", v4);

      +[TSUAssertionHandler logBacktraceThrottled];
    }
    __int16 v10 = [v5 objectAtIndexedSubscript:1];
    if ([v10 length])
    {
      id v11 = [objc_alloc((Class)NSUUID) initWithUUIDString:v10];
      if (!v11)
      {
        +[TSUAssertionHandler _atomicIncrementAssertCount];
        if (TSUAssertCat_init_token != -1) {
          dispatch_once(&TSUAssertCat_init_token, &stru_1001C6300);
        }
        if (os_log_type_enabled((os_log_t)TSUAssertCat_log_t, OS_LOG_TYPE_ERROR)) {
          sub_100161718();
        }
        __int16 v12 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[TSPDocumentRevision initWithRevisionString:]");
        v13 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/iWorkXPC/shared/persistence/src/TSPDocumentRevision.mm"];
        +[TSUAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](TSUAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v12, v13, 63, 0, "Revision string has invalid identifier: %{public}@", v4);

        +[TSUAssertionHandler logBacktraceThrottled];
        id v14 = [objc_alloc((Class)NSUUID) initWithUUIDString:@"0d4664c7-0c82-4301-8c01-e2d4a551216e"];
        if (!v14)
        {
          +[TSUAssertionHandler _atomicIncrementAssertCount];
          if (TSUAssertCat_init_token != -1) {
            dispatch_once(&TSUAssertCat_init_token, &stru_1001C6320);
          }
          if (os_log_type_enabled((os_log_t)TSUAssertCat_log_t, OS_LOG_TYPE_ERROR)) {
            sub_100161690();
          }
          TSUSetCrashReporterInfo((uint64_t)"Fatal Assertion failure: %{public}s %{public}s:%d Should be able to create UUID from base UUID string.", v20, v21, v22, v23, v24, v25, v26, (char)"-[TSPDocumentRevision initWithRevisionString:]");
          v27 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[TSPDocumentRevision initWithRevisionString:]");
          v28 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/iWorkXPC/shared/persistence/src/TSPDocumentRevision.mm"];
          +[TSUAssertionHandler handleFailureInFunction:v27 file:v28 lineNumber:66 isFatal:1 description:"Should be able to create UUID from base UUID string."];

          TSUCrashBreakpoint();
          abort();
        }
        uint64_t v15 = +[NSUUID tsu_UUIDWithNamespaceUUID:v14 name:v10];

        id v11 = (id)v15;
      }
    }
    else
    {
      v29[0] = 0;
      v29[1] = 0;
      id v11 = [objc_alloc((Class)NSUUID) initWithUUIDBytes:v29];
    }
    self = [(TSPDocumentRevision *)self initWithSequence:v7 identifier:v11];

    v18 = self;
  }
  else
  {
    if ([v4 length])
    {
      +[TSUAssertionHandler _atomicIncrementAssertCount];
      if (TSUAssertCat_init_token != -1) {
        dispatch_once(&TSUAssertCat_init_token, &stru_1001C6340);
      }
      if (os_log_type_enabled((os_log_t)TSUAssertCat_log_t, OS_LOG_TYPE_ERROR)) {
        sub_100161830();
      }
      v16 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[TSPDocumentRevision initWithRevisionString:]");
      v17 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/iWorkXPC/shared/persistence/src/TSPDocumentRevision.mm"];
      +[TSUAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](TSUAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v16, v17, 74, 0, "Revision string is in invalid format: %{public}@", v4);

      +[TSUAssertionHandler logBacktraceThrottled];
    }
    v18 = 0;
  }

  return v18;
}

+ (id)revisionWithRevisionString:(id)a3
{
  id v4 = a3;
  id v5 = [objc_alloc((Class)a1) initWithRevisionString:v4];

  return v5;
}

+ (id)documentRevisionAtURL:(id)a3 passphrase:(id)a4 error:(id *)a5
{
  id v5 = +[TSPDocumentProperties documentRevisionAtURL:](TSPDocumentProperties, "documentRevisionAtURL:", a3, a4, a5);
  if (!v5)
  {
    +[TSUAssertionHandler _atomicIncrementAssertCount];
    if (TSUAssertCat_init_token != -1) {
      dispatch_once(&TSUAssertCat_init_token, &stru_1001C6360);
    }
    if (os_log_type_enabled((os_log_t)TSUAssertCat_log_t, OS_LOG_TYPE_ERROR)) {
      sub_1001618BC();
    }
    id v6 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "+[TSPDocumentRevision documentRevisionAtURL:passphrase:error:]");
    id v7 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/iWorkXPC/shared/persistence/src/TSPDocumentRevision.mm"];
    +[TSUAssertionHandler handleFailureInFunction:v6 file:v7 lineNumber:92 isFatal:0 description:"Assumed that we'd never need to ask TSPOC for a document revision in iWorkXPC"];

    +[TSUAssertionHandler logBacktraceThrottled];
  }
  return v5;
}

- (NSString)revisionString
{
  uint64_t sequence = self->_sequence;
  v3 = [(NSUUID *)self->_identifier UUIDString];
  id v4 = +[NSString stringWithFormat:@"%d%@%@", sequence, @"::", v3];

  return (NSString *)v4;
}

- (id)nextRevisionWithIdentifier:(id)a3
{
  id v4 = a3;
  if (self->_sequence == 0x7FFFFFFF)
  {
    int v5 = +[TSUAssertionHandler _atomicIncrementAssertCount];
    if (TSUAssertCat_init_token != -1) {
      dispatch_once(&TSUAssertCat_init_token, &stru_1001C6380);
    }
    id v6 = TSUAssertCat_log_t;
    if (os_log_type_enabled((os_log_t)v6, OS_LOG_TYPE_ERROR))
    {
      id v7 = [(TSPDocumentRevision *)self revisionString];
      sub_100161944(v7, buf, v5, (os_log_t)v6);
    }

    v8 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[TSPDocumentRevision nextRevisionWithIdentifier:]");
    unsigned int v9 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/iWorkXPC/shared/persistence/src/TSPDocumentRevision.mm"];
    __int16 v10 = [(TSPDocumentRevision *)self revisionString];
    +[TSUAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](TSUAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v8, v9, 106, 0, "Revision will overflow: %{public}@", v10);

    +[TSUAssertionHandler logBacktraceThrottled];
    id v11 = objc_opt_class();
    uint64_t v12 = 0x80000000;
  }
  else
  {
    id v11 = objc_opt_class();
    uint64_t v12 = (self->_sequence + 1);
  }
  v13 = [v11 revisionWithSequence:v12 identifier:v4];

  return v13;
}

- (int64_t)compareSequenceFromRevision:(id)a3
{
  id v4 = a3;
  int sequence = self->_sequence;
  if (sequence <= (int)[v4 sequence])
  {
    int v7 = self->_sequence;
    if (v7 >= (int)[v4 sequence]) {
      int64_t v6 = 0;
    }
    else {
      int64_t v6 = -1;
    }
  }
  else
  {
    int64_t v6 = 1;
  }

  return v6;
}

- (id)description
{
  v3 = (objc_class *)objc_opt_class();
  id v4 = NSStringFromClass(v3);
  int v5 = [(TSPDocumentRevision *)self revisionString];
  int64_t v6 = +[NSString stringWithFormat:@"<%@: %p %@>", v4, self, v5];

  return v6;
}

- (unint64_t)hash
{
  uint64_t sequence = self->_sequence;
  return (unint64_t)[(NSUUID *)self->_identifier hash] ^ sequence;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v5 = v4;
    int sequence = self->_sequence;
    if (sequence == [v5 sequence])
    {
      identifier = self->_identifier;
      v8 = [v5 identifier];
      unsigned __int8 v9 = [(NSUUID *)identifier isEqual:v8];
    }
    else
    {
      unsigned __int8 v9 = 0;
    }
  }
  else
  {
    unsigned __int8 v9 = 0;
  }

  return v9;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = [(id)objc_opt_class() allocWithZone:a3];
  uint64_t sequence = self->_sequence;
  identifier = self->_identifier;
  return [v4 initWithSequence:sequence identifier:identifier];
}

- (int)sequence
{
  return self->_sequence;
}

- (NSUUID)identifier
{
  return self->_identifier;
}

- (void).cxx_destruct
{
}

@end