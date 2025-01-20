@interface CLHealthAssessmentTremorDetectionService
- (CLHealthAssessmentResultDelegate)delegate;
- (CLHealthAssessmentTremorDetectionService)init;
- (void)dealloc;
- (void)feedAccelSample:(id)a3 time:(double)a4;
- (void)feedGyroSample:(id)a3 time:(double)a4;
- (void)onResultAvailable:(TremorScore *)a3;
- (void)setDelegate:(id)a3;
@end

@implementation CLHealthAssessmentTremorDetectionService

- (CLHealthAssessmentTremorDetectionService)init
{
  v3.receiver = self;
  v3.super_class = (Class)CLHealthAssessmentTremorDetectionService;
  if ([(CLHealthAssessmentTremorDetectionService *)&v3 init]) {
    operator new();
  }
  return 0;
}

- (void)dealloc
{
  [+[NSNotificationCenter defaultCenter] removeObserver:self];
  uint64_t v3 = qword_10248D790;
  if (qword_10248D790)
  {
    v4 = *(void **)(qword_10248D790 + 12360);
    if (v4)
    {
      *(void *)(qword_10248D790 + 12368) = v4;
      operator delete(v4);
    }
    v5 = *(void **)(v3 + 12312);
    if (v5)
    {
      *(void *)(v3 + 12320) = v5;
      operator delete(v5);
    }
    operator delete();
  }
  qword_10248D790 = 0;
  v6.receiver = self;
  v6.super_class = (Class)CLHealthAssessmentTremorDetectionService;
  [(CLHealthAssessmentTremorDetectionService *)&v6 dealloc];
}

- (void)feedAccelSample:(id)a3 time:(double)a4
{
  $E2C29196C7A5C696474C6955C5A9CE06 v4 = a3;
  sub_1005135BC((unsigned __int16 *)qword_10248D790, (uint64_t *)&v4, a4);
}

- (void)feedGyroSample:(id)a3 time:(double)a4
{
  $E2C29196C7A5C696474C6955C5A9CE06 v4 = a3;
  sub_100513B30((unsigned __int16 *)qword_10248D790, (uint64_t *)&v4, a4);
}

- (void)onResultAvailable:(TremorScore *)a3
{
  v7[0] = @"time";
  v8[0] = +[NSNumber numberWithDouble:a3->var0];
  v7[1] = @"score";
  v8[1] = +[NSNumber numberWithInt:a3->var1];
  v7[2] = @"displacement";
  *(float *)&double v5 = a3->var2;
  v8[2] = +[NSNumber numberWithFloat:v5];
  v7[3] = @"freq";
  *(float *)&double v6 = a3->var3;
  v8[3] = +[NSNumber numberWithFloat:v6];
  [(CLHealthAssessmentResultDelegate *)[(CLHealthAssessmentTremorDetectionService *)self delegate] syncgetResultReady:+[NSDictionary dictionaryWithObjects:v8 forKeys:v7 count:4] ForAnalyzer:0];
}

- (CLHealthAssessmentResultDelegate)delegate
{
  return self->_delegate;
}

- (void)setDelegate:(id)a3
{
  self->_delegate = (CLHealthAssessmentResultDelegate *)a3;
}

@end