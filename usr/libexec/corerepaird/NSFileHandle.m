@interface NSFileHandle
- (BOOL)uarpCloseAndReturnError:(id *)a3;
- (BOOL)uarpSeekToEndReturningOffset:(unint64_t *)a3 error:(id *)a4;
- (BOOL)uarpSeekToOffset:(unint64_t)a3 error:(id *)a4;
- (BOOL)uarpWriteData:(id)a3 error:(id *)a4;
- (BOOL)writeBytes:(const void *)a3 length:(unint64_t)a4;
- (id)uarpReadDataToEndOfFileAndReturnError:(id *)a3;
- (id)uarpReadDataUpToLength:(unint64_t)a3 error:(id *)a4;
@end

@implementation NSFileHandle

- (BOOL)writeBytes:(const void *)a3 length:(unint64_t)a4
{
  v5 = +[NSData dataWithBytes:a3 length:a4];
  LOBYTE(self) = [(NSFileHandle *)self uarpWriteData:v5 error:0];

  return (char)self;
}

- (BOOL)uarpWriteData:(id)a3 error:(id *)a4
{
  return [(NSFileHandle *)self writeData:a3 error:a4];
}

- (id)uarpReadDataUpToLength:(unint64_t)a3 error:(id *)a4
{
  return [(NSFileHandle *)self readDataUpToLength:a3 error:a4];
}

- (BOOL)uarpSeekToOffset:(unint64_t)a3 error:(id *)a4
{
  return [(NSFileHandle *)self seekToOffset:a3 error:a4];
}

- (BOOL)uarpCloseAndReturnError:(id *)a3
{
  return [(NSFileHandle *)self closeAndReturnError:a3];
}

- (id)uarpReadDataToEndOfFileAndReturnError:(id *)a3
{
  return [(NSFileHandle *)self readDataToEndOfFileAndReturnError:a3];
}

- (BOOL)uarpSeekToEndReturningOffset:(unint64_t *)a3 error:(id *)a4
{
  return [(NSFileHandle *)self seekToEndReturningOffset:a3 error:a4];
}

@end