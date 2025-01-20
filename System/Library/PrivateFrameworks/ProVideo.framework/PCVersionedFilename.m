@interface PCVersionedFilename
+ (id)appendVersion:(unint64_t)a3 toFilename:(id)a4;
+ (id)nextAvailableURLForWritingToURL:(id)a3;
+ (id)nextAvailableURLForWritingURL:(id)a3 toURL:(id)a4 checkContentsForEquality:(BOOL)a5 contentsAreEqual:(BOOL *)a6;
+ (id)removeVersion:(unint64_t)a3 fromFilename:(id)a4;
+ (unint64_t)filenameVersion:(id)a3 formatter:(id)a4;
- (NSString)baseFilename;
- (NSString)extension;
- (NSString)filename;
- (PCVersionedFilename)initWithFilename:(id)a3;
- (id)nextFilename;
- (unint64_t)version;
- (void)dealloc;
- (void)incrementVersion;
- (void)setBaseFilename:(id)a3;
- (void)setExtension:(id)a3;
- (void)setFilename:(id)a3;
- (void)setVersion:(unint64_t)a3;
@end

@implementation PCVersionedFilename

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)PCVersionedFilename;
  [(PCVersionedFilename *)&v3 dealloc];
}

- (PCVersionedFilename)initWithFilename:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)PCVersionedFilename;
  v4 = [(PCVersionedFilename *)&v7 init];
  if (v4)
  {
    v4->_filename = (NSString *)objc_msgSend((id)objc_msgSend(a3, "stringByDeletingPathExtension"), "copy");
    v4->_extension = (NSString *)objc_msgSend((id)objc_msgSend(a3, "pathExtension"), "copy");
    id v5 = objc_alloc_init(MEMORY[0x1E4F28EE0]);
    [v5 setNumberStyle:1];
    v4->_version = +[PCVersionedFilename filenameVersion:v4->_filename formatter:v5];

    v4->_baseFilename = (NSString *)objc_msgSend(+[PCVersionedFilename removeVersion:fromFilename:](PCVersionedFilename, "removeVersion:fromFilename:", v4->_version, v4->_filename), "copy");
  }
  return v4;
}

+ (id)nextAvailableURLForWritingToURL:(id)a3
{
  id v3 = a3;
  uint64_t v8 = 0;
  if ([a3 checkResourceIsReachableAndReturnError:&v8])
  {
    v4 = (void *)[v3 URLByDeletingLastPathComponent];
    id v5 = -[PCVersionedFilename initWithFilename:]([PCVersionedFilename alloc], "initWithFilename:", [v3 lastPathComponent]);
    do
    {
      id v3 = (id)objc_msgSend(v4, "URLByAppendingPathComponent:", -[PCVersionedFilename nextFilename](v5, "nextFilename"));
      uint64_t v8 = 0;
      char v6 = [v3 checkResourceIsReachableAndReturnError:&v8];
      [(PCVersionedFilename *)v5 incrementVersion];
    }
    while ((v6 & 1) != 0);
  }
  return v3;
}

+ (id)nextAvailableURLForWritingURL:(id)a3 toURL:(id)a4 checkContentsForEquality:(BOOL)a5 contentsAreEqual:(BOOL *)a6
{
  BOOL v7 = a5;
  id v8 = a4;
  uint64_t v16 = 0;
  int v10 = [a4 checkResourceIsReachableAndReturnError:&v16];
  if (a6) {
    *a6 = 0;
  }
  if (v10)
  {
    v11 = (void *)[v8 URLByDeletingLastPathComponent];
    v12 = (void *)[MEMORY[0x1E4F28CB8] defaultManager];
    v13 = -[PCVersionedFilename initWithFilename:]([PCVersionedFilename alloc], "initWithFilename:", [v8 lastPathComponent]);
    while (!v7
         || !objc_msgSend(v12, "contentsEqualAtPath:andPath:", objc_msgSend(a3, "path"), objc_msgSend(v8, "path")))
    {
      id v8 = (id)objc_msgSend(v11, "URLByAppendingPathComponent:", -[PCVersionedFilename nextFilename](v13, "nextFilename"));
      uint64_t v16 = 0;
      char v14 = [v8 checkResourceIsReachableAndReturnError:&v16];
      [(PCVersionedFilename *)v13 incrementVersion];
      if ((v14 & 1) == 0) {
        goto LABEL_11;
      }
    }
    if (a6) {
      *a6 = 1;
    }
LABEL_11:
  }
  return v8;
}

- (id)nextFilename
{
  id v3 = +[PCVersionedFilename appendVersion:[(PCVersionedFilename *)self version] + 1 toFilename:[(PCVersionedFilename *)self baseFilename]];
  v4 = [(PCVersionedFilename *)self extension];

  return (id)[v3 stringByAppendingPathExtension:v4];
}

- (void)incrementVersion
{
}

+ (unint64_t)filenameVersion:(id)a3 formatter:(id)a4
{
  id v5 = (void *)[a3 componentsSeparatedByString:@" "];
  if ((unint64_t)[v5 count] < 2) {
    return 1;
  }
  char v6 = objc_msgSend(a4, "numberFromString:", objc_msgSend(v5, "lastObject"));
  if (!v6) {
    return 1;
  }

  return [v6 unsignedIntegerValue];
}

+ (id)removeVersion:(unint64_t)a3 fromFilename:(id)a4
{
  uint64_t v5 = [a4 rangeOfString:objc_msgSend(NSString, "stringWithFormat:", @" %@", objc_msgSend(NSNumber, "numberWithUnsignedInteger:", a3)), 4 options];
  if (v5 == 0x7FFFFFFFFFFFFFFFLL) {
    return a4;
  }

  return (id)[a4 substringToIndex:v5];
}

+ (id)appendVersion:(unint64_t)a3 toFilename:(id)a4
{
  return (id)[a4 stringByAppendingFormat:@" %@", objc_msgSend(NSNumber, "numberWithUnsignedInteger:", a3)];
}

- (unint64_t)version
{
  return self->_version;
}

- (void)setVersion:(unint64_t)a3
{
  self->_version = a3;
}

- (NSString)filename
{
  return self->_filename;
}

- (void)setFilename:(id)a3
{
}

- (NSString)extension
{
  return self->_extension;
}

- (void)setExtension:(id)a3
{
}

- (NSString)baseFilename
{
  return self->_baseFilename;
}

- (void)setBaseFilename:(id)a3
{
}

@end