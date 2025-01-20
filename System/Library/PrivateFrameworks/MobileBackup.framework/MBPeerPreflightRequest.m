@interface MBPeerPreflightRequest
- (MBPeerPreflightRequest)initWithDictionary:(id)a3 error:(id *)a4;
- (MBPeerPreflightRequest)initWithFreeDiskSpace:(unint64_t)a3 purgeSize:(unint64_t)a4;
- (NSString)description;
- (id)dictionaryRepresentation;
- (unint64_t)freeDiskSpace;
- (unint64_t)purgeSize;
@end

@implementation MBPeerPreflightRequest

- (MBPeerPreflightRequest)initWithFreeDiskSpace:(unint64_t)a3 purgeSize:(unint64_t)a4
{
  v7.receiver = self;
  v7.super_class = (Class)MBPeerPreflightRequest;
  result = [(MBPeerPreflightRequest *)&v7 init];
  if (result)
  {
    result->_freeDiskSpace = a3;
    result->_purgeSize = a4;
  }
  return result;
}

- (MBPeerPreflightRequest)initWithDictionary:(id)a3 error:(id *)a4
{
  id v6 = a3;
  v13.receiver = self;
  v13.super_class = (Class)MBPeerPreflightRequest;
  objc_super v7 = [(MBPeerPreflightRequest *)&v13 init];
  if (!v7) {
    goto LABEL_5;
  }
  v8 = [v6 objectForKeyedSubscript:@"MBFreeDiskSpace"];
  uint64_t v9 = [v6 objectForKeyedSubscript:@"MBPurgeSize"];
  v10 = (void *)v9;
  if (v8 && v9)
  {
    v7->_freeDiskSpace = (unint64_t)[v8 unsignedLongLongValue];
    v7->_purgeSize = (unint64_t)[v10 unsignedLongLongValue];

LABEL_5:
    v11 = v7;
    goto LABEL_9;
  }
  if (a4)
  {
    *a4 = +[MBError errorWithCode:11, @"Failed to decode request. Missing property in dictionary %@", v6 format];
  }

  v11 = 0;
LABEL_9:

  return v11;
}

- (id)dictionaryRepresentation
{
  v7[0] = @"MBFreeDiskSpace";
  v3 = +[NSNumber numberWithUnsignedLongLong:[(MBPeerPreflightRequest *)self freeDiskSpace]];
  v7[1] = @"MBPurgeSize";
  v8[0] = v3;
  v4 = +[NSNumber numberWithUnsignedLongLong:[(MBPeerPreflightRequest *)self purgeSize]];
  v8[1] = v4;
  v5 = +[NSDictionary dictionaryWithObjects:v8 forKeys:v7 count:2];

  return v5;
}

- (NSString)description
{
  v3 = (objc_class *)objc_opt_class();
  return +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"<%s: %p; freeDiskSpace=%llu>",
           class_getName(v3),
           self,
           [(MBPeerPreflightRequest *)self freeDiskSpace]);
}

- (unint64_t)freeDiskSpace
{
  return self->_freeDiskSpace;
}

- (unint64_t)purgeSize
{
  return self->_purgeSize;
}

@end