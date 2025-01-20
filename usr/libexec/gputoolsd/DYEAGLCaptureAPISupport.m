@interface DYEAGLCaptureAPISupport
- (DYEAGLCaptureAPISupport)initWithAPI:(unsigned int)a3;
- (id)_createContextInfo:(unint64_t)a3;
- (id)diagnosticsDylibPath;
- (id)diagnosticsTransportEnvironmentVariable;
- (id)graphicsAPIInfo;
- (id)interposeDylibPath;
- (id)transportEnvironmentVariable;
@end

@implementation DYEAGLCaptureAPISupport

- (DYEAGLCaptureAPISupport)initWithAPI:(unsigned int)a3
{
  if (a3)
  {
    v3 = 0;
  }
  else
  {
    v5.receiver = self;
    v5.super_class = (Class)DYEAGLCaptureAPISupport;
    self = [(DYEAGLCaptureAPISupport *)&v5 init];
    v3 = self;
  }

  return v3;
}

- (id)interposeDylibPath
{
  uint64_t v2 = DYGetGLInterposeDylibPath();

  return +[NSString stringWithUTF8String:v2];
}

- (id)diagnosticsDylibPath
{
  uint64_t v2 = DYGetMTLDiagnosticsDylibPath();

  return +[NSString stringWithUTF8String:v2];
}

- (id)_createContextInfo:(unint64_t)a3
{
  id v4 = [objc_alloc((Class)EAGLContext) initWithAPI:a3];
  if (v4)
  {
    uint64_t v5 = GLIContextFromEAGLContext();
    if (!v5) {
      __assert_rtn("-[DYEAGLCaptureAPISupport _createContextInfo:]", ", 0, "gli_ctx"");
    }
    uint64_t v6 = GLCFrontDispatch();
    if (!v6) {
      __assert_rtn("-[DYEAGLCaptureAPISupport _createContextInfo:]", ", 0, "dispatch"");
    }
    if (a3 - 1 > 2) {
      uint64_t v7 = 0;
    }
    else {
      uint64_t v7 = dword_100009DC0[a3 - 1];
    }
    v9 = +[DYRendererInfo rendererInfoWithGLIContext:v5 dispatch:v6 api:v7];
    id v10 = [objc_alloc((Class)NSArray) initWithObjects:v9, 0];
    id v11 = objc_alloc((Class)DYContextInfo);
    v12 = [v4 sharegroup];
    id v8 = [v11 initWithIdentifier:v4 sharegroupIdentifier:v12 renderers:v10 currentRendererIndex:0 api:v7];
  }
  else
  {
    id v8 = 0;
  }

  return v8;
}

- (id)graphicsAPIInfo
{
  v3 = objc_opt_new();
  id v4 = [(DYEAGLCaptureAPISupport *)self _createContextInfo:1];
  if (v4) {
    [v3 addObject:v4];
  }
  uint64_t v5 = [(DYEAGLCaptureAPISupport *)self _createContextInfo:2];

  if (v5) {
    [v3 addObject:v5];
  }
  uint64_t v6 = [(DYEAGLCaptureAPISupport *)self _createContextInfo:3];

  if (v6) {
    [v3 addObject:v6];
  }

  return v3;
}

- (id)transportEnvironmentVariable
{
  return @"GT_HOST_URL_GL";
}

- (id)diagnosticsTransportEnvironmentVariable
{
  return @"GT_HOST_GL_DIAGNOSTICS";
}

@end