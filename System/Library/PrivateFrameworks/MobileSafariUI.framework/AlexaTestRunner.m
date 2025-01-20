@interface AlexaTestRunner
- (AlexaTestRunner)init;
- (void)collectPPTResults;
@end

@implementation AlexaTestRunner

- (AlexaTestRunner)init
{
  v5.receiver = self;
  v5.super_class = (Class)AlexaTestRunner;
  v2 = [(AlexaTestRunner *)&v5 init];
  v3 = v2;
  if (v2) {
    [(PageLoadTestRunner *)v2 setFailFast:0];
  }
  return v3;
}

- (void)collectPPTResults
{
  [(PurplePageLoadTestRunner *)self pptResultFor:@"Summary" measure:@"pages attempted" value:@"pages" units:(double)self->super._attemptCount];
  double successCount = (double)self->super._successCount;
  [(PurplePageLoadTestRunner *)self pptResultFor:@"Summary" measure:@"pages loaded" value:@"pages" units:successCount];
}

@end