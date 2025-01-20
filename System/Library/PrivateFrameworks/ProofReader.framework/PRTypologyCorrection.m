@interface PRTypologyCorrection
+ (id)openTypologyCorrectionWithString:(id)a3 range:(_NSRange)a4 inString:(id)a5;
- (PRTypologyCorrection)initWithString:(id)a3 range:(_NSRange)a4;
- (id)description;
- (id)dictionaryRepresentation;
- (void)addTypologyCorrectionLog:(id)a3;
- (void)closeTypologyCorrectionWithResult:(id)a3;
- (void)dealloc;
@end

@implementation PRTypologyCorrection

- (PRTypologyCorrection)initWithString:(id)a3 range:(_NSRange)a4
{
  NSUInteger length = a4.length;
  NSUInteger location = a4.location;
  v9.receiver = self;
  v9.super_class = (Class)PRTypologyCorrection;
  v7 = [(PRTypologyCorrection *)&v9 init];
  if (v7)
  {
    v7->_misspelling = (NSString *)[a3 copy];
    v7->_misspelledRange.NSUInteger location = location;
    v7->_misspelledRange.NSUInteger length = length;
    v7->_logs = (NSMutableString *)objc_alloc_init(MEMORY[0x263F089D8]);
    v7->_isOpen = 1;
    v7->_openTime = CFAbsoluteTimeGetCurrent();
  }
  return v7;
}

- (id)description
{
  v3 = NSString;
  if (self->_correctionResult)
  {
    v9.receiver = self;
    v9.super_class = (Class)PRTypologyCorrection;
    id v4 = [(PRTypologyCorrection *)&v9 description];
    return (id)[v3 stringWithFormat:@"%@: <%@> at %@->%@", v4, self->_misspelling, NSStringFromRange(self->_misspelledRange), self->_correctionResult];
  }
  else
  {
    v8.receiver = self;
    v8.super_class = (Class)PRTypologyCorrection;
    id v6 = [(PRTypologyCorrection *)&v8 description];
    return (id)[v3 stringWithFormat:@"%@: <%@> at %@ no correction", v6, self->_misspelling, NSStringFromRange(self->_misspelledRange), v7];
  }
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)PRTypologyCorrection;
  [(PRTypologyCorrection *)&v3 dealloc];
}

+ (id)openTypologyCorrectionWithString:(id)a3 range:(_NSRange)a4 inString:(id)a5
{
  v5 = 0;
  if ((_enabledLogTypes & 0x400) != 0 && _typologyRecords && _typologyRecordsSerialQueue != 0)
  {
    v5 = -[PRTypologyCorrection initWithString:range:]([PRTypologyCorrection alloc], "initWithString:range:", a3, a4.location, a4.length);
    objc_msgSend(+[PRTypologyRecord currentTypologyRecord](PRTypologyRecord, "currentTypologyRecord"), "addCorrection:", v5);
  }
  return v5;
}

- (void)addTypologyCorrectionLog:(id)a3
{
  if (self->_isOpen)
  {
    id v3 = a3;
    if (a3) {
      id v3 = (id)[[NSString alloc] initWithFormat:a3 locale:0 arguments:&v5];
    }
    [(NSMutableString *)self->_logs appendString:v3];
    [(NSMutableString *)self->_logs appendString:@"\n"];
  }
}

- (id)dictionaryRepresentation
{
  id v3 = (void *)[MEMORY[0x263EFF9A0] dictionary];
  id v4 = v3;
  misspelling = self->_misspelling;
  if (misspelling) {
    [v3 setObject:misspelling forKey:@"Misspelling"];
  }
  [v4 setObject:NSStringFromRange(self->_misspelledRange) forKey:@"MisspelledRange"];
  logs = self->_logs;
  if (logs) {
    [v4 setObject:logs forKey:@"Logs"];
  }
  correctionResult = self->_correctionResult;
  if (correctionResult) {
    objc_msgSend(v4, "setObject:forKey:", -[NSTextCheckingResult description](correctionResult, "description"), @"CorrectionResult");
  }
  if (!self->_isOpen) {
    objc_msgSend(v4, "setObject:forKey:", objc_msgSend(NSNumber, "numberWithDouble:", self->_closeTime - self->_openTime), @"Time");
  }
  return v4;
}

- (void)closeTypologyCorrectionWithResult:(id)a3
{
  if (self->_isOpen)
  {
    self->_closeTime = CFAbsoluteTimeGetCurrent();
    self->_correctionResult = (NSTextCheckingResult *)[a3 copy];
    self->_isOpen = 0;
  }
}

@end