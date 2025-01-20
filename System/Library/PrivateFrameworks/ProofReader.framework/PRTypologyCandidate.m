@interface PRTypologyCandidate
+ (id)openTypologyCandidate:(id)a3 selectedRange:(_NSRange)a4 inString:(id)a5;
- (PRTypologyCandidate)initWithString:(id)a3 range:(_NSRange)a4;
- (id)description;
- (id)dictionaryRepresentation;
- (void)closeTypologyCandidateWithResult:(id)a3;
- (void)dealloc;
@end

@implementation PRTypologyCandidate

- (PRTypologyCandidate)initWithString:(id)a3 range:(_NSRange)a4
{
  NSUInteger length = a4.length;
  NSUInteger location = a4.location;
  v9.receiver = self;
  v9.super_class = (Class)PRTypologyCandidate;
  v7 = [(PRTypologyCandidate *)&v9 init];
  if (v7)
  {
    v7->_candidateString = (NSString *)[a3 copy];
    v7->_selectedRange.NSUInteger location = location;
    v7->_selectedRange.NSUInteger length = length;
    v7->_isOpen = 1;
    v7->_openTime = CFAbsoluteTimeGetCurrent();
  }
  return v7;
}

- (id)description
{
  v3 = NSString;
  if (self->_result)
  {
    v9.receiver = self;
    v9.super_class = (Class)PRTypologyCandidate;
    id v4 = [(PRTypologyCandidate *)&v9 description];
    return (id)[v3 stringWithFormat:@"%@: <%@> at %@->%@", v4, self->_candidateString, NSStringFromRange(self->_selectedRange), self->_result];
  }
  else
  {
    v8.receiver = self;
    v8.super_class = (Class)PRTypologyCandidate;
    id v6 = [(PRTypologyCandidate *)&v8 description];
    return (id)[v3 stringWithFormat:@"%@: <%@> at %@", v6, self->_candidateString, NSStringFromRange(self->_selectedRange), v7];
  }
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)PRTypologyCandidate;
  [(PRTypologyCandidate *)&v3 dealloc];
}

+ (id)openTypologyCandidate:(id)a3 selectedRange:(_NSRange)a4 inString:(id)a5
{
  v5 = 0;
  if ((_enabledLogTypes & 0x400) != 0 && _typologyRecords && _typologyRecordsSerialQueue != 0)
  {
    v5 = -[PRTypologyCandidate initWithString:range:]([PRTypologyCandidate alloc], "initWithString:range:", a3, a4.location, a4.length);
    objc_msgSend(+[PRTypologyRecord currentTypologyRecord](PRTypologyRecord, "currentTypologyRecord"), "addCandidate:", v5);
  }
  return v5;
}

- (id)dictionaryRepresentation
{
  objc_super v3 = (void *)[MEMORY[0x263EFF9A0] dictionary];
  id v4 = v3;
  candidateString = self->_candidateString;
  if (candidateString) {
    [v3 setObject:candidateString forKey:@"CandidateString"];
  }
  [v4 setObject:NSStringFromRange(self->_selectedRange) forKey:@"SelectedRange"];
  id v6 = self->_result;
  if (v6) {
    objc_msgSend(v4, "setObject:forKey:", -[NSTextCheckingResult description](v6, "description"), @"Result");
  }
  if (!self->_isOpen) {
    objc_msgSend(v4, "setObject:forKey:", objc_msgSend(NSNumber, "numberWithDouble:", self->_closeTime - self->_openTime), @"Time");
  }
  return v4;
}

- (void)closeTypologyCandidateWithResult:(id)a3
{
  if (self->_isOpen)
  {
    self->_closeTime = CFAbsoluteTimeGetCurrent();
    self->_result = (NSTextCheckingResult *)[a3 copy];
    self->_isOpen = 0;
  }
}

@end