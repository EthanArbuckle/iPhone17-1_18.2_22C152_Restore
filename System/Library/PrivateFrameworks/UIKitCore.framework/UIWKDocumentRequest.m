@interface UIWKDocumentRequest
- (CGRect)documentRect;
- (NSCopying)inputElementIdentifier;
- (int64_t)flags;
- (int64_t)granularityCount;
- (int64_t)surroundingGranularity;
- (void)dealloc;
- (void)setDocumentRect:(CGRect)a3;
- (void)setFlags:(int64_t)a3;
- (void)setGranularityCount:(int64_t)a3;
- (void)setInputElementIdentifier:(id)a3;
- (void)setSurroundingGranularity:(int64_t)a3;
@end

@implementation UIWKDocumentRequest

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)UIWKDocumentRequest;
  [(UIWKDocumentRequest *)&v3 dealloc];
}

- (NSCopying)inputElementIdentifier
{
  return self->_inputElementIdentifier;
}

- (void)setInputElementIdentifier:(id)a3
{
}

- (int64_t)flags
{
  return self->_flags;
}

- (void)setFlags:(int64_t)a3
{
  self->_flags = a3;
}

- (int64_t)surroundingGranularity
{
  return self->_surroundingGranularity;
}

- (void)setSurroundingGranularity:(int64_t)a3
{
  self->_surroundingGranularity = a3;
}

- (int64_t)granularityCount
{
  return self->_granularityCount;
}

- (void)setGranularityCount:(int64_t)a3
{
  self->_granularityCount = a3;
}

- (CGRect)documentRect
{
  double x = self->_documentRect.origin.x;
  double y = self->_documentRect.origin.y;
  double width = self->_documentRect.size.width;
  double height = self->_documentRect.size.height;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- (void)setDocumentRect:(CGRect)a3
{
  self->_documentRect = a3;
}

@end