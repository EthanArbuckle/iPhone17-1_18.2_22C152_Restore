@interface WFDiagnosticsEvent
- (NSDictionary)eventDictionary;
- (NSString)eventName;
- (WFDiagnosticsEvent)initWithDiagnosticsEventType:(int64_t)a3 didPassTest:(BOOL)a4 failedTests:(id)a5;
- (id)_testTypeToString:(int64_t)a3;
@end

@implementation WFDiagnosticsEvent

- (WFDiagnosticsEvent)initWithDiagnosticsEventType:(int64_t)a3 didPassTest:(BOOL)a4 failedTests:(id)a5
{
  BOOL v5 = a4;
  v19[3] = *MEMORY[0x263EF8340];
  id v8 = a5;
  v17.receiver = self;
  v17.super_class = (Class)WFDiagnosticsEvent;
  v9 = [(WFDiagnosticsEvent *)&v17 init];
  v10 = v9;
  if (v9)
  {
    v18[0] = @"testType";
    v11 = [(WFDiagnosticsEvent *)v9 _testTypeToString:a3];
    v19[0] = v11;
    v18[1] = @"testDidPass";
    v12 = [NSNumber numberWithBool:v5];
    v19[1] = v12;
    v18[2] = @"failedTests";
    v13 = [v8 numberArrayToJsonString];
    v19[2] = v13;
    uint64_t v14 = [NSDictionary dictionaryWithObjects:v19 forKeys:v18 count:3];
    eventDictionary = v10->_eventDictionary;
    v10->_eventDictionary = (NSDictionary *)v14;
  }
  return v10;
}

- (id)_testTypeToString:(int64_t)a3
{
  if ((unint64_t)a3 > 2) {
    return @"unknown";
  }
  else {
    return off_26478FBB8[a3];
  }
}

- (NSString)eventName
{
  return (NSString *)@"com.apple.wifi.ui.diagnosticsevent";
}

- (NSDictionary)eventDictionary
{
  return self->_eventDictionary;
}

- (void).cxx_destruct
{
}

@end