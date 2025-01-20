@interface MBDatabase
+ (id)databaseWithDrive:(id)a3 path:(id)a4 domainManager:(id)a5 error:(id *)a6;
+ (id)databaseWithFile:(id)a3 domainManager:(id)a4 error:(id *)a5;
- (MBDatabase)initWithData:(id)a3 domainManager:(id)a4 error:(id *)a5;
- (MBDatabase)initWithDrive:(id)a3 path:(id)a4 domainManager:(id)a5 error:(id *)a6;
- (MBDatabase)initWithFile:(id)a3 domainManager:(id)a4 error:(id *)a5;
- (MBDomainManager)domainManager;
- (NSString)description;
- (double)version;
- (id)enumerateFiles:(id)a3;
- (id)fileAtOffset:(unint64_t)a3;
- (id)fileEnumerator;
- (id)indexFromDatabaseIgnoringTruncation:(BOOL)a3;
- (void)close;
- (void)dealloc;
@end

@implementation MBDatabase

+ (id)databaseWithFile:(id)a3 domainManager:(id)a4 error:(id *)a5
{
  v5 = [[MBDatabase alloc] initWithFile:a3 domainManager:a4 error:a5];
  return v5;
}

+ (id)databaseWithDrive:(id)a3 path:(id)a4 domainManager:(id)a5 error:(id *)a6
{
  v6 = [[MBDatabase alloc] initWithDrive:a3 path:a4 domainManager:a5 error:a6];
  return v6;
}

- (MBDatabase)initWithData:(id)a3 domainManager:(id)a4 error:(id *)a5
{
  v12.receiver = self;
  v12.super_class = (Class)MBDatabase;
  v7 = [(MBDatabase *)&v12 init];
  if (v7)
  {
    v7->_decoder = [[MBDecoder alloc] initWithData:a3];
    v7->_domainManager = (MBDomainManager *)a4;
    if ([(MBDecoder *)v7->_decoder decodeInt32] != 1835164770)
    {
      id v11 = [objc_alloc((Class)MBException) initWithCode:11 format:@"Incorrect database magic number"];
LABEL_11:
      objc_exception_throw(v11);
    }
    [(MBDecoder *)v7->_decoder decodeVersion];
    v7->_version = v8;
    if (v8 < 5.0 || v8 >= 6.0)
    {
      id v11 = objc_msgSend(objc_alloc((Class)MBException), "initWithCode:format:", 203, @"Unsupported database version: %0.1f", *(void *)&v7->_version);
      goto LABEL_11;
    }
    v7->_offsetBase = [(MBDecoder *)v7->_decoder offset];
  }
  return v7;
}

- (MBDatabase)initWithFile:(id)a3 domainManager:(id)a4 error:(id *)a5
{
  double v8 = +[NSData dataWithContentsOfFile:options:error:](NSData, "dataWithContentsOfFile:options:error:", a3, 8);
  if (v8)
  {
    return [(MBDatabase *)self initWithData:v8 domainManager:a4 error:a5];
  }
  else
  {

    return 0;
  }
}

- (MBDatabase)initWithDrive:(id)a3 path:(id)a4 domainManager:(id)a5 error:(id *)a6
{
  id v9 = [a3 dataAtPath:a4 options:&off_10043B008 error:a6];
  if (v9)
  {
    return [(MBDatabase *)self initWithData:v9 domainManager:a5 error:a6];
  }
  else
  {

    return 0;
  }
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)MBDatabase;
  [(MBDatabase *)&v3 dealloc];
}

- (id)fileAtOffset:(unint64_t)a3
{
  [(MBDecoder *)self->_decoder setOffset:self->_offsetBase + a3];
  decoder = self->_decoder;
  return +[MBFile fileWithDecoder:decoder database:self];
}

- (id)fileEnumerator
{
  objc_super v3 = [[MBDecoder alloc] initWithData:[(MBDecoder *)self->_decoder data]];
  [(MBDecoder *)v3 setOffset:self->_offsetBase];
  v4 = [[MBDatabaseFileEnumerator alloc] initWithDecoder:v3 database:self];
  return v4;
}

- (id)enumerateFiles:(id)a3
{
  id v4 = [(MBDatabase *)self fileEnumerator];
  do
    id v5 = [v4 nextObject];
  while (v5 && ((*((uint64_t (**)(id, id))a3 + 2))(a3, v5) & 1) != 0);
  return 0;
}

- (id)indexFromDatabaseIgnoringTruncation:(BOOL)a3
{
  id v4 = +[MBDatabaseIndex databaseIndex];
  id v5 = [[MBDecoder alloc] initWithData:[(MBDecoder *)self->_decoder data]];
  [(MBDecoder *)v5 setOffset:self->_offsetBase];
  id v6 = [(MBDecoder *)v5 offset];
  if (v6 < (id)[(NSData *)[(MBDecoder *)v5 data] length])
  {
    do
    {
      id v7 = objc_alloc_init((Class)NSAutoreleasePool);
      double v8 = [(MBDecoder *)v5 offset];
      unint64_t offsetBase = self->_offsetBase;
      v10 = +[MBFile fileWithDecoder:v5 database:self];
      objc_msgSend(v4, "setOffset:flags:forFileID:", &v8[-offsetBase], +[MBDatabaseIndex flagsForMode:](MBDatabaseIndex, "flagsForMode:", -[MBFile mode](v10, "mode")), -[MBFile fileID](v10, "fileID"));
      id v11 = [(MBFile *)v10 domain];
      if (v11 != [(MBFile *)v10 nonRedirectedDomain]) {
        [v4 setDomainRedirects:1];
      }
      [v7 drain];
      id v12 = [(MBDecoder *)v5 offset];
    }
    while (v12 < (id)[(NSData *)[(MBDecoder *)v5 data] length]);
  }
  return v4;
}

- (void)close
{
}

- (NSString)description
{
  uint64_t v3 = objc_opt_class();
  [(MBDatabase *)self version];
  return +[NSString stringWithFormat:@"<%@: version=%0.1f>", v3, v4];
}

- (MBDomainManager)domainManager
{
  return self->_domainManager;
}

- (double)version
{
  return self->_version;
}

@end