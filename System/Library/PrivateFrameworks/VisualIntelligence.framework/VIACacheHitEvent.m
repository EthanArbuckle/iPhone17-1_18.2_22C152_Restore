@interface VIACacheHitEvent
- (BOOL)shouldReportDirectly;
- (NSString)engagementSuggestionType;
- (NSString)originatingApplication;
- (VIACacheHitContext)context;
- (VIACacheHitEvent)initWithContext:(id)a3;
- (id)feedback;
- (unint64_t)cachedResultQueryID;
- (unint64_t)queryID;
@end

@implementation VIACacheHitEvent

- (VIACacheHitEvent)initWithContext:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)VIACacheHitEvent;
  v6 = [(VIACacheHitEvent *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_context, a3);
  }

  return v7;
}

- (unint64_t)queryID
{
  return [(VIACacheHitContext *)self->_context queryID];
}

- (unint64_t)cachedResultQueryID
{
  return [(VIACacheHitContext *)self->_context cachedResultQueryID];
}

- (NSString)originatingApplication
{
  return [(VIACacheHitContext *)self->_context applicationIdentifier];
}

- (BOOL)shouldReportDirectly
{
  return 0;
}

- (NSString)engagementSuggestionType
{
  return [(VIACacheHitContext *)self->_context engagementSuggestionType];
}

- (id)feedback
{
  v2 = objc_alloc_init(VIACacheHitEventFeedback);
  return v2;
}

- (VIACacheHitContext)context
{
  return self->_context;
}

- (void).cxx_destruct
{
}

@end