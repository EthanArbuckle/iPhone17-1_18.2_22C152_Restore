@interface TSUUUIDPath
+ (id)lastUUIDFromUUIDPathString:(id)a3;
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
  uint64_t v25 = *MEMORY[0x263EF8340];
  id v4 = a3;
  objc_opt_class();
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  id v5 = v4;
  uint64_t v6 = [v5 countByEnumeratingWithState:&v20 objects:v24 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v21;
    while (2)
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v21 != v8) {
          objc_enumerationMutation(v5);
        }
        uint64_t v10 = *(void *)(*((void *)&v20 + 1) + 8 * v9);
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {
          v15 = [NSString stringWithUTF8String:"-[TSUUUIDPath initWithArray:]"];
          v16 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/OfficeImport/OfficeParser/shared/utility/TSUUUIDPath.m"];
          +[OITSUAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](OITSUAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v15, v16, 25, 0, "Invalid entry for TSUUUIDPath array: %{public}@", v10);

          +[OITSUAssertionHandler logBacktraceThrottled];
          v17 = 0;
          goto LABEL_16;
        }
        ++v9;
      }
      while (v7 != v9);
      uint64_t v7 = [v5 countByEnumeratingWithState:&v20 objects:v24 count:16];
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
      uint64_t v13 = [v5 copy];
      uuids = v12->_uuids;
      v12->_uuids = (NSArray *)v13;
    }
    else
    {
      uuids = v11->_uuids;
      v11->_uuids = (NSArray *)MEMORY[0x263EFFA68];
    }
  }
  self = v12;
  v17 = self;
LABEL_16:

  return v17;
}

- (TSUUUIDPath)initWithUUIDPathString:(id)a3
{
  uint64_t v23 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = [v4 componentsSeparatedByString:@"/"];
  uint64_t v6 = (void *)[v5 count];
  if (v6)
  {
    uint64_t v6 = (void *)[objc_alloc(MEMORY[0x263EFF980]) initWithCapacity:v6];
    long long v18 = 0u;
    long long v19 = 0u;
    long long v20 = 0u;
    long long v21 = 0u;
    id v7 = v5;
    uint64_t v8 = [v7 countByEnumeratingWithState:&v18 objects:v22 count:16];
    if (v8)
    {
      uint64_t v9 = v8;
      uint64_t v10 = *(void *)v19;
      while (2)
      {
        uint64_t v11 = 0;
        do
        {
          if (*(void *)v19 != v10) {
            objc_enumerationMutation(v7);
          }
          uint64_t v12 = [objc_alloc(MEMORY[0x263F08C38]) initWithUUIDString:*(void *)(*((void *)&v18 + 1) + 8 * v11)];
          if (!v12)
          {
            v15 = [NSString stringWithUTF8String:"-[TSUUUIDPath initWithUUIDPathString:]"];
            v16 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/OfficeImport/OfficeParser/shared/utility/TSUUUIDPath.m"];
            +[OITSUAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](OITSUAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v15, v16, 49, 0, "Invalid UUID path string: %{public}@", v4);

            +[OITSUAssertionHandler logBacktraceThrottled];
            v14 = 0;
            goto LABEL_13;
          }
          uint64_t v13 = (void *)v12;
          [v6 addObject:v12];

          ++v11;
        }
        while (v9 != v11);
        uint64_t v9 = [v7 countByEnumeratingWithState:&v18 objects:v22 count:16];
        if (v9) {
          continue;
        }
        break;
      }
    }
  }
  self = [(TSUUUIDPath *)self initWithArray:v6];
  v14 = self;
LABEL_13:

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
  uint64_t v20 = *MEMORY[0x263EF8340];
  uint64_t v3 = [(NSArray *)self->_uuids count];
  if (v3)
  {
    uint64_t v3 = [objc_alloc(MEMORY[0x263F089D8]) initWithCapacity:36 * v3 + objc_msgSend(@"/", "length") * (v3 - 1)];
    long long v15 = 0u;
    long long v16 = 0u;
    long long v17 = 0u;
    long long v18 = 0u;
    id v4 = self->_uuids;
    uint64_t v5 = [(NSArray *)v4 countByEnumeratingWithState:&v15 objects:v19 count:16];
    if (v5)
    {
      uint64_t v6 = v5;
      uint64_t v7 = *(void *)v16;
      char v8 = 1;
      do
      {
        uint64_t v9 = 0;
        do
        {
          if (*(void *)v16 != v7) {
            objc_enumerationMutation(v4);
          }
          uint64_t v10 = *(void **)(*((void *)&v15 + 1) + 8 * v9);
          if ((v8 & 1) == 0) {
            objc_msgSend((id)v3, "appendString:", @"/", (void)v15);
          }
          uint64_t v11 = objc_msgSend(v10, "UUIDString", (void)v15);
          [(id)v3 appendString:v11];

          char v8 = 0;
          ++v9;
        }
        while (v6 != v9);
        uint64_t v6 = [(NSArray *)v4 countByEnumeratingWithState:&v15 objects:v19 count:16];
        char v8 = 0;
      }
      while (v6);
    }
  }
  if (v3) {
    uint64_t v12 = (__CFString *)v3;
  }
  else {
    uint64_t v12 = &stru_26EBF24D8;
  }
  uint64_t v13 = v12;

  return v13;
}

+ (id)lastUUIDFromUUIDPathString:(id)a3
{
  id v3 = a3;
  unint64_t v4 = [v3 length];
  uint64_t v5 = [@"/" length];
  if (v4 < 0x25)
  {
    if (v4 != 36) {
      goto LABEL_7;
    }
    uint64_t v11 = (void *)[objc_alloc(MEMORY[0x263F08C38]) initWithUUIDString:v3];
    if (!v11) {
      goto LABEL_7;
    }
  }
  else
  {
    unint64_t v6 = v4 - 36;
    uint64_t v7 = objc_msgSend(v3, "substringWithRange:", v6 - v5, v5);
    int v8 = [@"/" isEqualToString:v7];

    if (!v8
      || (id v9 = objc_alloc(MEMORY[0x263F08C38]),
          [v3 substringFromIndex:v6],
          uint64_t v10 = objc_claimAutoreleasedReturnValue(),
          uint64_t v11 = (void *)[v9 initWithUUIDString:v10],
          v10,
          !v11))
    {
LABEL_7:
      uint64_t v12 = [NSString stringWithUTF8String:"+[TSUUUIDPath lastUUIDFromUUIDPathString:]"];
      uint64_t v13 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/OfficeImport/OfficeParser/shared/utility/TSUUUIDPath.m"];
      +[OITSUAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](OITSUAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v12, v13, 100, 0, "Invalid UUID path string: %{public}@", v3);

      +[OITSUAssertionHandler logBacktraceThrottled];
      uint64_t v11 = 0;
    }
  }

  return v11;
}

- (BOOL)isEqual:(id)a3
{
  unint64_t v4 = a3;
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
  return [(NSArray *)self->_uuids hash];
}

- (id)description
{
  id v3 = NSString;
  unint64_t v4 = (objc_class *)objc_opt_class();
  uint64_t v5 = NSStringFromClass(v4);
  uint64_t v6 = [(TSUUUIDPath *)self UUIDPathString];
  uint64_t v7 = [v3 stringWithFormat:@"<%@:%p %@>", v5, self, v6];

  return v7;
}

- (unint64_t)countByEnumeratingWithState:(id *)a3 objects:(id *)a4 count:(unint64_t)a5
{
  return [(NSArray *)self->_uuids countByEnumeratingWithState:a3 objects:a4 count:a5];
}

- (NSArray)uuids
{
  return self->_uuids;
}

- (void).cxx_destruct
{
}

@end