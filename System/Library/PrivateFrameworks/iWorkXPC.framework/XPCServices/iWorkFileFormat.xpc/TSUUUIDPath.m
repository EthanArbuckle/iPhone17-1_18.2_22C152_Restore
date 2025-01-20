@interface TSUUUIDPath
+ (id)lastUUIDFromUUIDPathString:(id)a3;
+ (id)tokenizeUUIDPathString:(id)a3;
- (BOOL)isEqual:(id)a3;
- (NSArray)uuids;
- (NSString)UUIDPathString;
- (NSUUID)lastUUID;
- (TSUUUIDPath)initWithArray:(id)a3;
- (TSUUUIDPath)initWithUUIDPathString:(id)a3;
- (id)UUIDPathByAppendingUUID:(id)a3;
- (id)description;
- (unint64_t)countByEnumeratingWithState:(id *)a3 objects:(id *)a4 count:(unint64_t)a5;
- (unint64_t)hash;
@end

@implementation TSUUUIDPath

- (TSUUUIDPath)initWithArray:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  id v5 = v4;
  id v6 = [v5 countByEnumeratingWithState:&v20 objects:v24 count:16];
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v21;
    while (2)
    {
      for (i = 0; i != v7; i = (char *)i + 1)
      {
        if (*(void *)v21 != v8) {
          objc_enumerationMutation(v5);
        }
        uint64_t v10 = *(void *)(*((void *)&v20 + 1) + 8 * i);
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {
          +[TSUAssertionHandler _atomicIncrementAssertCount];
          if (TSUAssertCat_init_token != -1) {
            dispatch_once(&TSUAssertCat_init_token, &stru_1001CC280);
          }
          if (os_log_type_enabled((os_log_t)TSUAssertCat_log_t, OS_LOG_TYPE_ERROR)) {
            sub_100164CC8();
          }
          v15 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[TSUUUIDPath initWithArray:]");
          v16 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/iWorkXPC/shared/utility/TSUUUIDPath.m"];
          +[TSUAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](TSUAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v15, v16, 26, 0, "Invalid entry for TSUUUIDPath array: %{public}@", v10);

          +[TSUAssertionHandler logBacktraceThrottled];
          v17 = 0;
          goto LABEL_20;
        }
      }
      id v7 = [v5 countByEnumeratingWithState:&v20 objects:v24 count:16];
      if (v7) {
        continue;
      }
      break;
    }
  }

  v19.receiver = self;
  v19.super_class = (Class)TSUUUIDPath;
  v11 = [(TSUUUIDPath *)&v19 init];
  v12 = v11;
  if (v11)
  {
    if (v5)
    {
      v13 = (NSArray *)[v5 copy];
      uuids = v12->_uuids;
      v12->_uuids = v13;
    }
    else
    {
      uuids = v11->_uuids;
      v11->_uuids = (NSArray *)&__NSArray0__struct;
    }
  }
  self = v12;
  v17 = self;
LABEL_20:

  return v17;
}

- (TSUUUIDPath)initWithUUIDPathString:(id)a3
{
  id v4 = a3;
  id v5 = +[TSUUUIDPath tokenizeUUIDPathString:v4];
  id v6 = [v5 count];
  if (v6)
  {
    id v6 = [objc_alloc((Class)NSMutableArray) initWithCapacity:v6];
    long long v18 = 0u;
    long long v19 = 0u;
    long long v20 = 0u;
    long long v21 = 0u;
    id v7 = v5;
    id v8 = [v7 countByEnumeratingWithState:&v18 objects:v22 count:16];
    if (v8)
    {
      id v9 = v8;
      uint64_t v10 = *(void *)v19;
      while (2)
      {
        for (i = 0; i != v9; i = (char *)i + 1)
        {
          if (*(void *)v19 != v10) {
            objc_enumerationMutation(v7);
          }
          id v12 = [objc_alloc((Class)NSUUID) initWithUUIDString:*(void *)(*((void *)&v18 + 1) + 8 * i)];
          if (!v12)
          {
            +[TSUAssertionHandler _atomicIncrementAssertCount];
            if (TSUAssertCat_init_token != -1) {
              dispatch_once(&TSUAssertCat_init_token, &stru_1001CC2A0);
            }
            if (os_log_type_enabled((os_log_t)TSUAssertCat_log_t, OS_LOG_TYPE_ERROR)) {
              sub_100164D54();
            }
            v15 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[TSUUUIDPath initWithUUIDPathString:]");
            v16 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/iWorkXPC/shared/utility/TSUUUIDPath.m"];
            +[TSUAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](TSUAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v15, v16, 50, 0, "Invalid UUID path string: %{public}@", v4);

            +[TSUAssertionHandler logBacktraceThrottled];
            v14 = 0;
            goto LABEL_17;
          }
          v13 = v12;
          [v6 addObject:v12];
        }
        id v9 = [v7 countByEnumeratingWithState:&v18 objects:v22 count:16];
        if (v9) {
          continue;
        }
        break;
      }
    }
  }
  self = [(TSUUUIDPath *)self initWithArray:v6];
  v14 = self;
LABEL_17:

  return v14;
}

- (id)UUIDPathByAppendingUUID:(id)a3
{
  v3 = [(NSArray *)self->_uuids arrayByAddingObject:a3];
  id v4 = [[TSUUUIDPath alloc] initWithArray:v3];

  return v4;
}

- (NSUUID)lastUUID
{
  return (NSUUID *)[(NSArray *)self->_uuids lastObject];
}

- (NSString)UUIDPathString
{
  NSUInteger v3 = [(NSArray *)self->_uuids count];
  if (v3)
  {
    NSUInteger v3 = (NSUInteger)[objc_alloc((Class)NSMutableString) initWithCapacity:36 * v3 + (void)objc_msgSend(@"/", "length") * (v3 - 1)];
    long long v15 = 0u;
    long long v16 = 0u;
    long long v17 = 0u;
    long long v18 = 0u;
    id v4 = self->_uuids;
    id v5 = [(NSArray *)v4 countByEnumeratingWithState:&v15 objects:v19 count:16];
    if (v5)
    {
      id v6 = v5;
      uint64_t v7 = *(void *)v16;
      char v8 = 1;
      do
      {
        id v9 = 0;
        do
        {
          if (*(void *)v16 != v7) {
            objc_enumerationMutation(v4);
          }
          uint64_t v10 = *(void **)(*((void *)&v15 + 1) + 8 * (void)v9);
          if ((v8 & 1) == 0) {
            objc_msgSend((id)v3, "appendString:", @"/", (void)v15);
          }
          v11 = objc_msgSend(v10, "UUIDString", (void)v15);
          [(id)v3 appendString:v11];

          char v8 = 0;
          id v9 = (char *)v9 + 1;
        }
        while (v6 != v9);
        id v6 = [(NSArray *)v4 countByEnumeratingWithState:&v15 objects:v19 count:16];
        char v8 = 0;
      }
      while (v6);
    }
  }
  if (v3) {
    id v12 = (__CFString *)v3;
  }
  else {
    id v12 = &stru_1001D3790;
  }
  v13 = v12;

  return v13;
}

+ (id)lastUUIDFromUUIDPathString:(id)a3
{
  id v3 = a3;
  id v4 = (char *)[v3 length];
  id v5 = [@"/" length];
  if ((unint64_t)v4 < 0x25)
  {
    if (v4 == (char *)36)
    {
      id v11 = [objc_alloc((Class)NSUUID) initWithUUIDString:v3];
      if (v11) {
        goto LABEL_12;
      }
    }
  }
  else
  {
    id v6 = v4 - 36;
    uint64_t v7 = objc_msgSend(v3, "substringWithRange:", v6 - v5, v5);
    unsigned int v8 = [@"/" isEqualToString:v7];

    if (v8)
    {
      id v9 = objc_alloc((Class)NSUUID);
      uint64_t v10 = [v3 substringFromIndex:v6];
      id v11 = [v9 initWithUUIDString:v10];

      if (v11) {
        goto LABEL_12;
      }
    }
  }
  +[TSUAssertionHandler _atomicIncrementAssertCount];
  if (TSUAssertCat_init_token != -1) {
    dispatch_once(&TSUAssertCat_init_token, &stru_1001CC2C0);
  }
  if (os_log_type_enabled((os_log_t)TSUAssertCat_log_t, OS_LOG_TYPE_ERROR)) {
    sub_100164DE0();
  }
  id v12 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "+[TSUUUIDPath lastUUIDFromUUIDPathString:]");
  v13 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/iWorkXPC/shared/utility/TSUUUIDPath.m"];
  +[TSUAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](TSUAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v12, v13, 101, 0, "Invalid UUID path string: %{public}@", v3);

  +[TSUAssertionHandler logBacktraceThrottled];
  id v11 = 0;
LABEL_12:

  return v11;
}

+ (id)tokenizeUUIDPathString:(id)a3
{
  return [a3 componentsSeparatedByString:@"/"];
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uuids = self->_uuids;
    uint64_t v6 = v4[1];

    return [(NSArray *)uuids isEqual:v6];
  }
  else
  {
    v9.receiver = self;
    v9.super_class = (Class)TSUUUIDPath;
    BOOL v8 = [(TSUUUIDPath *)&v9 isEqual:v4];

    return v8;
  }
}

- (unint64_t)hash
{
  v2 = [(NSArray *)self->_uuids lastObject];
  id v3 = v2;
  if (v2) {
    unint64_t v4 = (unint64_t)[v2 hash];
  }
  else {
    unint64_t v4 = 1529057258;
  }

  return v4;
}

- (id)description
{
  id v3 = (objc_class *)objc_opt_class();
  unint64_t v4 = NSStringFromClass(v3);
  id v5 = [(TSUUUIDPath *)self UUIDPathString];
  uint64_t v6 = +[NSString stringWithFormat:@"<%@:%p %@>", v4, self, v5];

  return v6;
}

- (unint64_t)countByEnumeratingWithState:(id *)a3 objects:(id *)a4 count:(unint64_t)a5
{
  return (unint64_t)[(NSArray *)self->_uuids countByEnumeratingWithState:a3 objects:a4 count:a5];
}

- (NSArray)uuids
{
  return self->_uuids;
}

- (void).cxx_destruct
{
}

@end