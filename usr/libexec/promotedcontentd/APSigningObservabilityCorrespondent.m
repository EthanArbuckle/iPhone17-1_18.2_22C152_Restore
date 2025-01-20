@interface APSigningObservabilityCorrespondent
- (APSigningObservabilityCorrespondent)init;
- (_TtC7Metrics42APSigningObservabilityCorrespondentWrapper)wrapper;
- (void)submitReport;
@end

@implementation APSigningObservabilityCorrespondent

- (APSigningObservabilityCorrespondent)init
{
  v6.receiver = self;
  v6.super_class = (Class)APSigningObservabilityCorrespondent;
  v2 = [(APSigningObservabilityCorrespondent *)&v6 init];
  if (v2)
  {
    v3 = objc_alloc_init(_TtC7Metrics42APSigningObservabilityCorrespondentWrapper);
    wrapper = v2->_wrapper;
    v2->_wrapper = v3;
  }
  return v2;
}

- (void)submitReport
{
  id v2 = [(APSigningObservabilityCorrespondent *)self wrapper];
  [v2 submitReport];
}

- (_TtC7Metrics42APSigningObservabilityCorrespondentWrapper)wrapper
{
  return self->_wrapper;
}

- (void).cxx_destruct
{
}

@end