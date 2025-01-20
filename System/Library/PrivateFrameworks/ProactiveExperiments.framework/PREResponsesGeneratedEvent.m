@interface PREResponsesGeneratedEvent
- (BOOL)hasQuestionMark;
- (BOOL)isCached;
- (NSArray)responses;
- (NSString)language;
- (NSString)locale;
- (int)generationStatus;
- (unint64_t)messageCharCount;
- (unint64_t)responseGenerationTime;
- (unint64_t)responseTimePerf;
- (void)setGenerationStatus:(int)a3;
- (void)setHasQuestionMark:(BOOL)a3;
- (void)setIsCached:(BOOL)a3;
- (void)setLanguage:(id)a3;
- (void)setLocale:(id)a3;
- (void)setMessageCharCount:(unint64_t)a3;
- (void)setResponseGenerationTime:(unint64_t)a3;
- (void)setResponseTimePerf:(unint64_t)a3;
- (void)setResponses:(id)a3;
@end

@implementation PREResponsesGeneratedEvent

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_locale, 0);
  objc_storeStrong((id *)&self->_language, 0);

  objc_storeStrong((id *)&self->_responses, 0);
}

- (void)setGenerationStatus:(int)a3
{
  self->_generationStatus = a3;
}

- (int)generationStatus
{
  return self->_generationStatus;
}

- (void)setResponseGenerationTime:(unint64_t)a3
{
  self->_responseGenerationTime = a3;
}

- (unint64_t)responseGenerationTime
{
  return self->_responseGenerationTime;
}

- (void)setHasQuestionMark:(BOOL)a3
{
  self->_hasQuestionMark = a3;
}

- (BOOL)hasQuestionMark
{
  return self->_hasQuestionMark;
}

- (void)setMessageCharCount:(unint64_t)a3
{
  self->_messageCharCount = a3;
}

- (unint64_t)messageCharCount
{
  return self->_messageCharCount;
}

- (void)setResponseTimePerf:(unint64_t)a3
{
  self->_responseTimePerf = a3;
}

- (unint64_t)responseTimePerf
{
  return self->_responseTimePerf;
}

- (void)setIsCached:(BOOL)a3
{
  self->_isCached = a3;
}

- (BOOL)isCached
{
  return self->_isCached;
}

- (void)setLocale:(id)a3
{
}

- (NSString)locale
{
  return self->_locale;
}

- (void)setLanguage:(id)a3
{
}

- (NSString)language
{
  return self->_language;
}

- (void)setResponses:(id)a3
{
}

- (NSArray)responses
{
  return self->_responses;
}

@end