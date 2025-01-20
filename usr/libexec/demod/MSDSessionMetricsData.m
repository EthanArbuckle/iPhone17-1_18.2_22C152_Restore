@interface MSDSessionMetricsData
- (MSDSessionMetricsData)initWithData:(id)a3;
- (void)saveToFile:(id)a3;
- (void)writeFileHeaders:(id)a3;
@end

@implementation MSDSessionMetricsData

- (MSDSessionMetricsData)initWithData:(id)a3
{
  id v4 = a3;
  v5 = NSStringFromSelector(a2);
  uint64_t v6 = +[NSString stringWithFormat:@"Override %@ in a subclass", v5];

  id v7 = +[NSException exceptionWithName:NSInternalInconsistencyException reason:v6 userInfo:0];
  objc_exception_throw(v7);
}

- (void)saveToFile:(id)a3
{
  id v4 = a3;
  if (![v4 offsetInFile]) {
    [(MSDSessionMetricsData *)self writeFileHeaders:v4];
  }
}

- (void)writeFileHeaders:(id)a3
{
  id v3 = a3;
  id v4 = +[NSArray arrayWithObjects:@"DNSResolutionTime", @"ConectionEstablishmentTime", @"TCPConnectionTime", @"SecureConnectionTime", @"RequestTime", @"ResponseTime", @"RequestBytesSent", @"ResponseBytesReceived", 0];
  id v5 = objc_alloc_init((Class)NSMutableString);
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  id v6 = v4;
  id v7 = [v6 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v7)
  {
    id v8 = v7;
    uint64_t v9 = *(void *)v13;
    do
    {
      v10 = 0;
      do
      {
        if (*(void *)v13 != v9) {
          objc_enumerationMutation(v6);
        }
        [v5 appendFormat:@"%@,", *(void *)(*((void *)&v12 + 1) + 8 * (void)v10)];
        v10 = (char *)v10 + 1;
      }
      while (v8 != v10);
      id v8 = [v6 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v8);
  }

  [v5 appendString:@"\n"];
  v11 = [v5 dataUsingEncoding:4];
  [v3 writeData:v11];
}

@end