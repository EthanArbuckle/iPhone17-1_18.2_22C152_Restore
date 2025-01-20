@interface SMUTimeFormatter
- (BOOL)getObjectValue:(id *)a3 forString:(id)a4 errorDescription:(id *)a5;
- (BOOL)isFullWidth;
- (BOOL)isPartialStringValid:(id *)a3 proposedSelectedRange:(_NSRange *)a4 originalString:(id)a5 originalSelectedRange:(_NSRange)a6 errorDescription:(id *)a7;
- (BOOL)isPartialStringValid:(id)a3 newEditingString:(id *)a4 errorDescription:(id *)a5;
- (SMUTimeFormatter)init;
- (double)formatTemplate;
- (id)attributedStringForObjectValue:(id)a3 withDefaultAttributes:(id)a4;
- (id)editingStringForObjectValue:(id)a3;
- (id)stringForObjectValue:(id)a3;
- (id)stringFromCMTime:(id *)a3;
- (id)stringFromSeconds:(double)a3;
- (int64_t)style;
- (void)setFormatTemplate:(double)a3;
- (void)setFullWidth:(BOOL)a3;
- (void)setStyle:(int64_t)a3;
@end

@implementation SMUTimeFormatter

- (SMUTimeFormatter)init
{
  v6.receiver = self;
  v6.super_class = (Class)SMUTimeFormatter;
  v2 = [(SMUTimeFormatter *)&v6 init];
  if (v2)
  {
    v3 = (AVTimeFormatter *)objc_alloc_init(MEMORY[0x263EFA8B8]);
    formatter = v2->_formatter;
    v2->_formatter = v3;
  }
  return v2;
}

- (void)setFormatTemplate:(double)a3
{
}

- (double)formatTemplate
{
  [(AVTimeFormatter *)self->_formatter formatTemplate];
  return result;
}

- (void)setFullWidth:(BOOL)a3
{
}

- (BOOL)isFullWidth
{
  return [(AVTimeFormatter *)self->_formatter isFullWidth];
}

- (void)setStyle:(int64_t)a3
{
}

- (int64_t)style
{
  return [(AVTimeFormatter *)self->_formatter style];
}

- (id)stringFromCMTime:(id *)a3
{
  formatter = self->_formatter;
  $3CC8671D27C23BF42ADDB32F2B5E48AE v6 = *a3;
  v4 = [(AVTimeFormatter *)formatter stringFromCMTime:&v6];

  return v4;
}

- (id)stringFromSeconds:(double)a3
{
  return (id)[(AVTimeFormatter *)self->_formatter stringFromSeconds:a3];
}

- (id)stringForObjectValue:(id)a3
{
  return (id)[(AVTimeFormatter *)self->_formatter stringForObjectValue:a3];
}

- (id)attributedStringForObjectValue:(id)a3 withDefaultAttributes:(id)a4
{
  return (id)[(AVTimeFormatter *)self->_formatter attributedStringForObjectValue:a3 withDefaultAttributes:a4];
}

- (id)editingStringForObjectValue:(id)a3
{
  return (id)[(AVTimeFormatter *)self->_formatter editingStringForObjectValue:a3];
}

- (BOOL)getObjectValue:(id *)a3 forString:(id)a4 errorDescription:(id *)a5
{
  return [(AVTimeFormatter *)self->_formatter getObjectValue:a3 forString:a4 errorDescription:a5];
}

- (BOOL)isPartialStringValid:(id)a3 newEditingString:(id *)a4 errorDescription:(id *)a5
{
  return [(AVTimeFormatter *)self->_formatter isPartialStringValid:a3 newEditingString:a4 errorDescription:a5];
}

- (BOOL)isPartialStringValid:(id *)a3 proposedSelectedRange:(_NSRange *)a4 originalString:(id)a5 originalSelectedRange:(_NSRange)a6 errorDescription:(id *)a7
{
  return -[AVTimeFormatter isPartialStringValid:proposedSelectedRange:originalString:originalSelectedRange:errorDescription:](self->_formatter, "isPartialStringValid:proposedSelectedRange:originalString:originalSelectedRange:errorDescription:", a3, a4, a5, a6.location, a6.length, a7);
}

- (void).cxx_destruct
{
}

@end