@interface SXVideoQuartileEvent
- (SXVideoQuartileEvent)initWithQuartile:(unint64_t)a3;
- (unint64_t)quartile;
@end

@implementation SXVideoQuartileEvent

- (SXVideoQuartileEvent)initWithQuartile:(unint64_t)a3
{
  v5.receiver = self;
  v5.super_class = (Class)SXVideoQuartileEvent;
  result = [(SXAnalyticsEvent *)&v5 init];
  if (result) {
    result->_quartile = a3;
  }
  return result;
}

- (unint64_t)quartile
{
  return self->_quartile;
}

@end