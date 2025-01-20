@interface VIAEntryPointEvent
+ (id)endEventWithOriginatingApplication:(id)a3;
+ (id)startEventWithQueryID:(unint64_t)a3 viewAppearEvent:(unint64_t)a4 originatingApplication:(id)a5;
- (BOOL)shouldReportDirectly;
- (NSString)originatingApplication;
- (VIAEntryPointEvent)initWithQueryID:(unint64_t)a3 type:(int64_t)a4 viewAppearEvent:(unint64_t)a5 originatingApplication:(id)a6;
- (id)feedback;
- (int64_t)type;
- (unint64_t)queryID;
- (unint64_t)viewAppearEvent;
@end

@implementation VIAEntryPointEvent

+ (id)startEventWithQueryID:(unint64_t)a3 viewAppearEvent:(unint64_t)a4 originatingApplication:(id)a5
{
  id v8 = a5;
  v9 = (void *)[objc_alloc((Class)a1) initWithQueryID:a3 type:1 viewAppearEvent:a4 originatingApplication:v8];

  return v9;
}

+ (id)endEventWithOriginatingApplication:(id)a3
{
  id v4 = a3;
  v5 = (void *)[objc_alloc((Class)a1) initWithQueryID:0 type:2 viewAppearEvent:0 originatingApplication:v4];

  return v5;
}

- (VIAEntryPointEvent)initWithQueryID:(unint64_t)a3 type:(int64_t)a4 viewAppearEvent:(unint64_t)a5 originatingApplication:(id)a6
{
  id v10 = a6;
  v16.receiver = self;
  v16.super_class = (Class)VIAEntryPointEvent;
  v11 = [(VIAEntryPointEvent *)&v16 init];
  v12 = v11;
  if (v11)
  {
    v11->_queryID = a3;
    v11->_type = a4;
    v11->_viewAppearEvent = a5;
    uint64_t v13 = [v10 copy];
    originatingApplication = v12->_originatingApplication;
    v12->_originatingApplication = (NSString *)v13;

    v12->_shouldReportDirectly = 0;
  }

  return v12;
}

- (id)feedback
{
  int64_t type = self->_type;
  if (type == 2)
  {
    id v4 = (void *)[objc_alloc(MEMORY[0x1E4F9A3D8]) initWithEvent:16];
  }
  else if (type == 1)
  {
    id v4 = (void *)[objc_alloc(MEMORY[0x1E4F9A3D0]) initWithEvent:self->_viewAppearEvent];
    [v4 setOriginatingApp:self->_originatingApplication];
  }
  else
  {
    id v4 = 0;
  }
  return v4;
}

- (unint64_t)queryID
{
  return self->_queryID;
}

- (BOOL)shouldReportDirectly
{
  return self->_shouldReportDirectly;
}

- (int64_t)type
{
  return self->_type;
}

- (unint64_t)viewAppearEvent
{
  return self->_viewAppearEvent;
}

- (NSString)originatingApplication
{
  return self->_originatingApplication;
}

- (void).cxx_destruct
{
}

@end