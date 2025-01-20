@interface CLHealthAssessmentChoreaDetectionService
- (CLHealthAssessmentChoreaDetectionService)init;
- (CLHealthAssessmentResultDelegate)delegate;
- (void)dealloc;
- (void)feedAccelSample:(id)a3 time:(double)a4;
- (void)feedTremor:(id)a3;
- (void)onResultAvailable:(ChoreaScore *)a3;
- (void)setDelegate:(id)a3;
@end

@implementation CLHealthAssessmentChoreaDetectionService

- (CLHealthAssessmentChoreaDetectionService)init
{
  v5.receiver = self;
  v5.super_class = (Class)CLHealthAssessmentChoreaDetectionService;
  v2 = [(CLHealthAssessmentChoreaDetectionService *)&v5 init];
  if (v2)
  {
    v3 = +[NSNotificationCenter defaultCenter];
    [(NSNotificationCenter *)v3 addObserver:v2 selector:"feedTremor:" name:off_102476058 object:0];
    operator new();
  }
  return 0;
}

- (void)dealloc
{
  [+[NSNotificationCenter defaultCenter] removeObserver:self];
  uint64_t v3 = qword_10248A720;
  if (qword_10248A720)
  {
    sub_1000D816C((void *)(qword_10248A720 + 24648));
    sub_1000D816C((void *)(v3 + 24592));
    operator delete();
  }
  qword_10248A720 = 0;
  v4.receiver = self;
  v4.super_class = (Class)CLHealthAssessmentChoreaDetectionService;
  [(CLHealthAssessmentChoreaDetectionService *)&v4 dealloc];
}

- (void)feedAccelSample:(id)a3 time:(double)a4
{
  $E2C29196C7A5C696474C6955C5A9CE06 v4 = a3;
  sub_100A63C94((unsigned __int16 *)qword_10248A720, (uint64_t *)&v4, a4);
}

- (void)feedTremor:(id)a3
{
  id v4 = [a3 name];
  if ([v4 isEqual:off_102476058])
  {
    id v5 = [a3 userInfo];
    int v9 = 0;
    [objc_msgSend(v5, "objectForKeyedSubscript:", @"time") doubleValue];
    v8.n128_u64[0] = v6;
    v8.n128_u32[2] = [[v5 objectForKeyedSubscript:@"score"] intValue];
    [v5[@"displacement"] floatValue];
    v8.n128_u32[3] = v7;
    sub_100A64210((void *)qword_10248A720, &v8);
  }
}

- (void)onResultAvailable:(ChoreaScore *)a3
{
  v7[0] = @"time";
  v8[0] = +[NSNumber numberWithDouble:a3->var0];
  v7[1] = @"score";
  v8[1] = +[NSNumber numberWithInt:a3->var1];
  v7[2] = @"likelihood";
  *(float *)&double v5 = a3->var2;
  v8[2] = +[NSNumber numberWithFloat:v5];
  v7[3] = @"strength";
  *(float *)&double v6 = a3->var3;
  v8[3] = +[NSNumber numberWithFloat:v6];
  v7[4] = @"tremorScore";
  v8[4] = +[NSNumber numberWithInt:a3->var4];
  [(CLHealthAssessmentResultDelegate *)[(CLHealthAssessmentChoreaDetectionService *)self delegate] syncgetResultReady:+[NSDictionary dictionaryWithObjects:v8 forKeys:v7 count:5] ForAnalyzer:1];
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