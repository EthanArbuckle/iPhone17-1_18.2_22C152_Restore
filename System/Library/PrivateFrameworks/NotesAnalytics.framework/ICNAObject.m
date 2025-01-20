@interface ICNAObject
- (ICNAEventReporter)eventReporter;
- (void)setEventReporter:(id)a3;
@end

@implementation ICNAObject

- (ICNAEventReporter)eventReporter
{
  if (!self->_eventReporter
    && +[ICNAOptedInObject isOptedInForAnalytics])
  {
    v3 = [ICNAEventReporter alloc];
    v4 = (objc_class *)objc_opt_class();
    v5 = NSStringFromClass(v4);
    v6 = [(ICNAEventReporter *)v3 initWithSubTrackerName:v5];
    eventReporter = self->_eventReporter;
    self->_eventReporter = v6;
  }
  v8 = self->_eventReporter;
  return v8;
}

- (void)setEventReporter:(id)a3
{
}

- (void).cxx_destruct
{
}

@end