@interface MNNavigationServiceCallback_DidUpdateResumeRouteHandle
+ (BOOL)supportsSecureCoding;
+ (id)didUpdateResumeRouteHandle:(id)a3;
- (GEOResumeRouteHandle)resumeRouteHandle;
- (MNNavigationServiceCallback_DidUpdateResumeRouteHandle)initWithCoder:(id)a3;
- (unint64_t)type;
- (void)encodeWithCoder:(id)a3;
- (void)setResumeRouteHandle:(id)a3;
@end

@implementation MNNavigationServiceCallback_DidUpdateResumeRouteHandle

+ (id)didUpdateResumeRouteHandle:(id)a3
{
  id v3 = a3;
  v4 = objc_opt_new();
  [v4 setResumeRouteHandle:v3];

  return v4;
}

- (unint64_t)type
{
  return 9;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
}

- (MNNavigationServiceCallback_DidUpdateResumeRouteHandle)initWithCoder:(id)a3
{
  id v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)MNNavigationServiceCallback_DidUpdateResumeRouteHandle;
  v5 = [(MNNavigationServiceCallbackParameters *)&v10 initWithCoder:v4];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_resumeRouteHandle"];
    resumeRouteHandle = v5->_resumeRouteHandle;
    v5->_resumeRouteHandle = (GEOResumeRouteHandle *)v6;

    v8 = v5;
  }

  return v5;
}

- (GEOResumeRouteHandle)resumeRouteHandle
{
  return self->_resumeRouteHandle;
}

- (void)setResumeRouteHandle:(id)a3
{
}

- (void).cxx_destruct
{
}

@end