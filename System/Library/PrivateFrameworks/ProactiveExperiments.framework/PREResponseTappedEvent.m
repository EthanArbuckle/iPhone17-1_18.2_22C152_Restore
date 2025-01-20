@interface PREResponseTappedEvent
- (BOOL)hasQuestionMark;
- (NSNumber)selectedPosition;
- (NSString)selectedResponse;
- (PREResponsesGeneratedEvent)responsesGeneratedEvent;
- (int)inputMethod;
- (unint64_t)timeToTap;
- (void)setHasQuestionMark:(BOOL)a3;
- (void)setInputMethod:(int)a3;
- (void)setResponsesGeneratedEvent:(id)a3;
- (void)setSelectedPosition:(id)a3;
- (void)setSelectedResponse:(id)a3;
- (void)setTimeToTap:(unint64_t)a3;
@end

@implementation PREResponseTappedEvent

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_selectedPosition, 0);
  objc_storeStrong((id *)&self->_selectedResponse, 0);

  objc_storeStrong((id *)&self->_responsesGeneratedEvent, 0);
}

- (void)setHasQuestionMark:(BOOL)a3
{
  self->_hasQuestionMark = a3;
}

- (BOOL)hasQuestionMark
{
  return self->_hasQuestionMark;
}

- (void)setInputMethod:(int)a3
{
  self->_inputMethod = a3;
}

- (int)inputMethod
{
  return self->_inputMethod;
}

- (void)setTimeToTap:(unint64_t)a3
{
  self->_timeToTap = a3;
}

- (unint64_t)timeToTap
{
  return self->_timeToTap;
}

- (void)setSelectedPosition:(id)a3
{
}

- (NSNumber)selectedPosition
{
  return self->_selectedPosition;
}

- (void)setSelectedResponse:(id)a3
{
}

- (NSString)selectedResponse
{
  return self->_selectedResponse;
}

- (void)setResponsesGeneratedEvent:(id)a3
{
}

- (PREResponsesGeneratedEvent)responsesGeneratedEvent
{
  return self->_responsesGeneratedEvent;
}

@end