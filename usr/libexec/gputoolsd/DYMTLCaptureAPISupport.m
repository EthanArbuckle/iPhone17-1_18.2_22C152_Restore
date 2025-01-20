@interface DYMTLCaptureAPISupport
- (DYMTLCaptureAPISupport)initWithAPI:(unsigned int)a3;
- (id)diagnosticsDylibPath;
- (id)diagnosticsTransportEnvironmentVariable;
- (id)graphicsAPIInfo;
- (id)interposeDylibPath;
- (id)transportEnvironmentVariable;
@end

@implementation DYMTLCaptureAPISupport

- (DYMTLCaptureAPISupport)initWithAPI:(unsigned int)a3
{
  if (a3 == 1)
  {
    v5.receiver = self;
    v5.super_class = (Class)DYMTLCaptureAPISupport;
    self = [(DYMTLCaptureAPISupport *)&v5 init];
    v3 = self;
  }
  else
  {
    v3 = 0;
  }

  return v3;
}

- (id)interposeDylibPath
{
  uint64_t v2 = DYGetMTLInterposeDylibPath();

  return +[NSString stringWithUTF8String:v2];
}

- (id)diagnosticsDylibPath
{
  uint64_t v2 = DYGetMTLDiagnosticsDylibPath();

  return +[NSString stringWithUTF8String:v2];
}

- (id)graphicsAPIInfo
{
  id v2 = MTLCreateSystemDefaultDevice();
  if (v2)
  {
    id v3 = [objc_alloc((Class)DYMTLDeviceProfile) initWithDevice:v2];
    id v6 = v3;
    v4 = +[NSArray arrayWithObjects:&v6 count:1];
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (id)transportEnvironmentVariable
{
  return @"GT_HOST_URL_MTL";
}

- (id)diagnosticsTransportEnvironmentVariable
{
  return @"GT_HOST_URL_MTL_DIAGNOSTICS";
}

@end