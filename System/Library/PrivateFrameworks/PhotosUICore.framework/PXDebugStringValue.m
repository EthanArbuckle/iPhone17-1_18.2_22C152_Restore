@interface PXDebugStringValue
- (NSString)string;
- (PXDebugStringValue)initWithLabel:(id)a3 BOOLValue:(BOOL)a4 positiveValue:(BOOL)a5 positiveHighlighted:(BOOL)a6 negativeHighlighted:(BOOL)a7;
- (PXDebugStringValue)initWithLabel:(id)a3 doubleValue:(double)a4;
- (PXDebugStringValue)initWithLabel:(id)a3 highlightedScore:(double)a4;
- (PXDebugStringValue)initWithLabel:(id)a3 integerValue:(int64_t)a4;
- (PXDebugStringValue)initWithLabel:(id)a3 string:(id)a4 highlightStyle:(unint64_t)a5;
- (unint64_t)highlightStyle;
@end

@implementation PXDebugStringValue

- (void).cxx_destruct
{
}

- (NSString)string
{
  return self->_string;
}

- (unint64_t)highlightStyle
{
  return self->_highlightStyle;
}

- (PXDebugStringValue)initWithLabel:(id)a3 highlightedScore:(double)a4
{
  v6 = NSString;
  double v7 = round(a4 * 100.0);
  id v8 = a3;
  v9 = objc_msgSend(v6, "stringWithFormat:", @"%2.1f%%", *(void *)&v7);
  uint64_t v10 = 3;
  if (a4 >= 0.0) {
    uint64_t v10 = 0;
  }
  if (a4 > 0.0) {
    uint64_t v11 = 1;
  }
  else {
    uint64_t v11 = v10;
  }
  v12 = [(PXDebugStringValue *)self initWithLabel:v8 string:v9 highlightStyle:v11];

  return v12;
}

- (PXDebugStringValue)initWithLabel:(id)a3 doubleValue:(double)a4
{
  v6 = NSString;
  id v7 = a3;
  id v8 = objc_msgSend(v6, "stringWithFormat:", @"%0.3f", *(void *)&a4);
  v9 = [(PXDebugStringValue *)self initWithLabel:v7 string:v8 highlightStyle:0];

  return v9;
}

- (PXDebugStringValue)initWithLabel:(id)a3 integerValue:(int64_t)a4
{
  v6 = NSString;
  id v7 = a3;
  id v8 = objc_msgSend(v6, "stringWithFormat:", @"%d", a4);
  v9 = [(PXDebugStringValue *)self initWithLabel:v7 string:v8 highlightStyle:0];

  return v9;
}

- (PXDebugStringValue)initWithLabel:(id)a3 BOOLValue:(BOOL)a4 positiveValue:(BOOL)a5 positiveHighlighted:(BOOL)a6 negativeHighlighted:(BOOL)a7
{
  id v7 = @"NO";
  if (a4) {
    id v7 = @"YES";
  }
  if (a4 != a5) {
    BOOL v8 = a7;
  }
  else {
    BOOL v8 = a6;
  }
  uint64_t v9 = 3;
  if (a4 == a5) {
    uint64_t v9 = 1;
  }
  if (v8) {
    uint64_t v10 = v9;
  }
  else {
    uint64_t v10 = 0;
  }
  return -[PXDebugStringValue initWithLabel:string:highlightStyle:](self, "initWithLabel:string:highlightStyle:", a3, v7, v10, a6);
}

- (PXDebugStringValue)initWithLabel:(id)a3 string:(id)a4 highlightStyle:(unint64_t)a5
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  uint64_t v10 = v9;
  if (!v8) {
    PXAssertGetLog();
  }
  if (!v9) {
    PXAssertGetLog();
  }
  v15.receiver = self;
  v15.super_class = (Class)PXDebugStringValue;
  uint64_t v11 = [(PXDebugValue *)&v15 initWithLabel:v8];
  if (v11)
  {
    uint64_t v12 = [v10 copy];
    string = v11->_string;
    v11->_string = (NSString *)v12;

    v11->_highlightStyle = a5;
  }

  return v11;
}

@end