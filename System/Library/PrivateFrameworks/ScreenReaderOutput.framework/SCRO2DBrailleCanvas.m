@interface SCRO2DBrailleCanvas
- ($488472A07B2E1D1A523D39A95A553F6B)_fullyDownPinState;
- ($488472A07B2E1D1A523D39A95A553F6B)_fullyUpPinState;
- ($488472A07B2E1D1A523D39A95A553F6B)pinStateForX:(unint64_t)a3 y:(unint64_t)a4;
- (BOOL)_canBlitCellAtX:(unint64_t)a3 y:(unint64_t)a4;
- (BOOL)hasConsistentHorizontalPinSpacing;
- (BOOL)hasConsistentVerticalPinSpacing;
- (BOOL)skipPinBetweenCellsHorizontally;
- (BOOL)skipPinBetweenCellsVertically;
- (BOOL)supportsBrailleText;
- (NSData)imageData;
- (SCRO2DBrailleCanvas)init;
- (SCRO2DBrailleCanvas)initWithCanvasDescriptor:(id)a3;
- (SCRO2DBrailleCanvasDescriptor)descriptor;
- (double)horizontalPinSpacing;
- (double)interCellHorizontalSpacing;
- (double)interCellVerticalSpacing;
- (double)verticalPinSpacing;
- (id)_pinForX:(unint64_t)a3 y:(unint64_t)a4;
- (id)debugAsciiCanvas;
- (unint64_t)_numberOfTextLines;
- (unint64_t)_textDisplayHeight;
- (unint64_t)cellHeight;
- (unint64_t)cellWidth;
- (unint64_t)detentCount;
- (unint64_t)height;
- (unint64_t)numberOfTextLines;
- (unint64_t)pinHeightStyle;
- (unint64_t)width;
- (void)_blitBMP;
- (void)_blitCell:(unsigned __int8)a3 AtX:(unint64_t)a4 y:(unint64_t)a5;
- (void)_blitText;
- (void)_clearCells;
- (void)_updateCells;
- (void)setBrailleText:(const char *)a3 length:(unint64_t)a4;
- (void)setImageData:(id)a3;
- (void)setNumberOfTextLines:(unint64_t)a3;
- (void)setPinState:(id)a3 forX:(unint64_t)a4 y:(unint64_t)a5;
@end

@implementation SCRO2DBrailleCanvas

- (SCRO2DBrailleCanvas)init
{
  v3 = (void *)MEMORY[0x263EFF940];
  v4 = NSStringFromSelector(a2);
  [v3 raise:@"SCRO2DBrailleException", @"use of %@ is not allowed", v4 format];

  return 0;
}

- (SCRO2DBrailleCanvas)initWithCanvasDescriptor:(id)a3
{
  id v5 = a3;
  v15.receiver = self;
  v15.super_class = (Class)SCRO2DBrailleCanvas;
  v6 = [(SCRO2DBrailleCanvas *)&v15 init];
  v7 = v6;
  if (v6)
  {
    p_descriptor = (id *)&v6->_descriptor;
    objc_storeStrong((id *)&v6->_descriptor, a3);
    v9 = [MEMORY[0x263EFF980] array];
    if ([(SCRO2DBrailleCanvasDescriptor *)v7->_descriptor width])
    {
      unint64_t v10 = 0;
      do
      {
        if ([*p_descriptor height])
        {
          unint64_t v11 = 0;
          do
          {
            v12 = [[SCRO2DPin alloc] initWithX:v10 y:v11 style:[(SCRO2DBrailleCanvasDescriptor *)v7->_descriptor pinHeightStyle]];
            [(SCRO2DPin *)v12 setState:[(SCRO2DBrailleCanvas *)v7 _fullyDownPinState]];
            [v9 addObject:v12];

            ++v11;
          }
          while (v11 < [(SCRO2DBrailleCanvasDescriptor *)v7->_descriptor height]);
        }
        ++v10;
      }
      while (v10 < [*p_descriptor width]);
    }
    objc_storeStrong((id *)&v7->_pins, v9);
    if (!-[SCRO2DBrailleCanvasDescriptor hasConsistentVerticalPinSpacing](v7->_descriptor, "hasConsistentVerticalPinSpacing"))[MEMORY[0x263EFF940] raise:@"SCRO2DBrailleException" format:@"Displays with variable vertical pin spacing are not yet supported."]; {
    if (([*p_descriptor hasConsistentHorizontalPinSpacing] & 1) == 0)
    }
      [MEMORY[0x263EFF940] raise:@"SCRO2DBrailleException" format:@"Displays with variable horizontal pin spacing are not yet supported."];
    v7->_numberOfTextLines = [(SCRO2DBrailleCanvasDescriptor *)v7->_descriptor numberOfTextLinesAvailable];
    v13 = v7;
  }
  return v7;
}

- (unint64_t)width
{
  return [(SCRO2DBrailleCanvasDescriptor *)self->_descriptor width];
}

- (unint64_t)height
{
  return [(SCRO2DBrailleCanvasDescriptor *)self->_descriptor height];
}

- (BOOL)hasConsistentHorizontalPinSpacing
{
  v3 = (void *)MEMORY[0x263EFF940];
  v4 = (objc_class *)objc_opt_class();
  id v5 = NSStringFromClass(v4);
  v6 = NSStringFromSelector(a2);
  [v3 raise:@"SCRO2DBrailleException", @"Subclasses of %@ must implement %@", v5, v6 format];

  return 0;
}

- (BOOL)hasConsistentVerticalPinSpacing
{
  v3 = (void *)MEMORY[0x263EFF940];
  v4 = (objc_class *)objc_opt_class();
  id v5 = NSStringFromClass(v4);
  v6 = NSStringFromSelector(a2);
  [v3 raise:@"SCRO2DBrailleException", @"Subclasses of %@ must implement %@", v5, v6 format];

  return 0;
}

- (BOOL)supportsBrailleText
{
  v3 = (void *)MEMORY[0x263EFF940];
  v4 = (objc_class *)objc_opt_class();
  id v5 = NSStringFromClass(v4);
  v6 = NSStringFromSelector(a2);
  [v3 raise:@"SCRO2DBrailleException", @"Subclasses of %@ must implement %@", v5, v6 format];

  return 0;
}

- (BOOL)skipPinBetweenCellsVertically
{
  v3 = (void *)MEMORY[0x263EFF940];
  v4 = (objc_class *)objc_opt_class();
  id v5 = NSStringFromClass(v4);
  v6 = NSStringFromSelector(a2);
  [v3 raise:@"SCRO2DBrailleException", @"Subclasses of %@ must implement %@", v5, v6 format];

  return 0;
}

- (BOOL)skipPinBetweenCellsHorizontally
{
  v3 = (void *)MEMORY[0x263EFF940];
  v4 = (objc_class *)objc_opt_class();
  id v5 = NSStringFromClass(v4);
  v6 = NSStringFromSelector(a2);
  [v3 raise:@"SCRO2DBrailleException", @"Subclasses of %@ must implement %@", v5, v6 format];

  return 0;
}

- (double)horizontalPinSpacing
{
  v3 = (void *)MEMORY[0x263EFF940];
  v4 = (objc_class *)objc_opt_class();
  id v5 = NSStringFromClass(v4);
  v6 = NSStringFromSelector(a2);
  [v3 raise:@"SCRO2DBrailleException", @"Subclasses of %@ must implement %@", v5, v6 format];

  return 0.0;
}

- (double)verticalPinSpacing
{
  v3 = (void *)MEMORY[0x263EFF940];
  v4 = (objc_class *)objc_opt_class();
  id v5 = NSStringFromClass(v4);
  v6 = NSStringFromSelector(a2);
  [v3 raise:@"SCRO2DBrailleException", @"Subclasses of %@ must implement %@", v5, v6 format];

  return 0.0;
}

- (double)interCellHorizontalSpacing
{
  v3 = (void *)MEMORY[0x263EFF940];
  v4 = (objc_class *)objc_opt_class();
  id v5 = NSStringFromClass(v4);
  v6 = NSStringFromSelector(a2);
  [v3 raise:@"SCRO2DBrailleException", @"Subclasses of %@ must implement %@", v5, v6 format];

  return 0.0;
}

- (double)interCellVerticalSpacing
{
  v3 = (void *)MEMORY[0x263EFF940];
  v4 = (objc_class *)objc_opt_class();
  id v5 = NSStringFromClass(v4);
  v6 = NSStringFromSelector(a2);
  [v3 raise:@"SCRO2DBrailleException", @"Subclasses of %@ must implement %@", v5, v6 format];

  return 0.0;
}

- (unint64_t)pinHeightStyle
{
  return 2;
}

- (unint64_t)detentCount
{
  return 2;
}

- (id)_pinForX:(unint64_t)a3 y:(unint64_t)a4
{
  pins = self->_pins;
  unint64_t v5 = a3 + [(SCRO2DBrailleCanvasDescriptor *)self->_descriptor width] * a4;

  return [(NSArray *)pins objectAtIndex:v5];
}

- (void)setPinState:(id)a3 forX:(unint64_t)a4 y:(unint64_t)a5
{
  id v6 = [(SCRO2DBrailleCanvas *)self _pinForX:a4 y:a5];
  [v6 setState:a3.var0];
}

- ($488472A07B2E1D1A523D39A95A553F6B)pinStateForX:(unint64_t)a3 y:(unint64_t)a4
{
  v4 = [(SCRO2DBrailleCanvas *)self _pinForX:a3 y:a4];
  v5.var0 = [v4 state];

  return ($488472A07B2E1D1A523D39A95A553F6B)v5.var0;
}

- (void)_clearCells
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  v3 = self->_pins;
  uint64_t v4 = [(NSArray *)v3 countByEnumeratingWithState:&v8 objects:v12 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v9;
    do
    {
      uint64_t v7 = 0;
      do
      {
        if (*(void *)v9 != v6) {
          objc_enumerationMutation(v3);
        }
        objc_msgSend(*(id *)(*((void *)&v8 + 1) + 8 * v7++), "setState:", -[SCRO2DBrailleCanvas _fullyDownPinState](self, "_fullyDownPinState", (void)v8));
      }
      while (v5 != v7);
      uint64_t v5 = [(NSArray *)v3 countByEnumeratingWithState:&v8 objects:v12 count:16];
    }
    while (v5);
  }
}

- (void)_updateCells
{
  [(SCRO2DBrailleCanvas *)self _clearCells];

  [(SCRO2DBrailleCanvas *)self _blitBMP];
}

- (void)setNumberOfTextLines:(unint64_t)a3
{
  if ([(SCRO2DBrailleCanvasDescriptor *)self->_descriptor numberOfTextLinesAvailable] < a3) {
    [(SCRO2DBrailleCanvasDescriptor *)self->_descriptor numberOfTextLinesAvailable];
  }
  self->_numberOfTextLines = a3;
}

- (unint64_t)_numberOfTextLines
{
  return self->_numberOfTextLines;
}

- (unint64_t)_textDisplayHeight
{
  unint64_t v3 = [(SCRO2DBrailleCanvas *)self cellHeight];
  unint64_t v4 = v3
     + [(SCRO2DBrailleCanvasDescriptor *)self->_descriptor skipPinBetweenCellsVertically];
  return v4 * [(SCRO2DBrailleCanvas *)self _numberOfTextLines];
}

- (void)setBrailleText:(const char *)a3 length:(unint64_t)a4
{
  uint64_t v5 = [MEMORY[0x263EFF8F8] dataWithBytes:a3 length:a4];
  brailleTextData = self->_brailleTextData;
  self->_brailleTextData = v5;

  [(SCRO2DBrailleCanvas *)self _updateTextCells];
}

- (void)_blitBMP
{
  unint64_t v3 = [(NSData *)self->_imageData bytes];
  NSUInteger v4 = [(NSData *)self->_imageData length];
  if ([(SCRO2DBrailleCanvasDescriptor *)self->_descriptor height])
  {
    unint64_t v5 = 0;
    do
    {
      if ([(SCRO2DBrailleCanvasDescriptor *)self->_descriptor width])
      {
        unint64_t v6 = 0;
        do
        {
          unint64_t v7 = [(SCRO2DBrailleCanvasDescriptor *)self->_descriptor width];
          if (v6 + v5 * v7 >= v4) {
            unsigned int v8 = 0;
          }
          else {
            unsigned int v8 = v3[v5 * v7 + v6];
          }
          if ([(SCRO2DBrailleCanvasDescriptor *)self->_descriptor pinHeightStyle] == 2) {
            float v9 = *(float *)&v8;
          }
          else {
            float v9 = (double)v8 / 255.0;
          }
          [(SCRO2DBrailleCanvas *)self setPinState:LODWORD(v9) forX:v6++ y:v5];
        }
        while (v6 < [(SCRO2DBrailleCanvasDescriptor *)self->_descriptor width]);
      }
      ++v5;
    }
    while (v5 < [(SCRO2DBrailleCanvasDescriptor *)self->_descriptor height]);
  }
}

- (void)_blitText
{
  unint64_t v3 = [(NSData *)self->_brailleTextData bytes];
  NSUInteger v4 = [(NSData *)self->_brailleTextData length];
  if (v3) {
    BOOL v5 = v4 == 0;
  }
  else {
    BOOL v5 = 1;
  }
  if (!v5)
  {
    NSUInteger v6 = v4;
    uint64_t v7 = 0;
    uint64_t v8 = 0;
    do
    {
      if (![(SCRO2DBrailleCanvas *)self _canBlitCellAtX:v8 y:v7]) {
        break;
      }
      [(SCRO2DBrailleCanvas *)self _blitCell:*v3 AtX:v8 y:v7];
      unint64_t v9 = [(SCRO2DBrailleCanvas *)self cellWidth] + v8;
      uint64_t v8 = v9
         + [(SCRO2DBrailleCanvasDescriptor *)self->_descriptor skipPinBetweenCellsHorizontally];
      if (![(SCRO2DBrailleCanvas *)self _canBlitCellAtX:v8 y:v7])
      {
        unint64_t v10 = [(SCRO2DBrailleCanvas *)self cellHeight] + v7;
        uint64_t v8 = 0;
        uint64_t v7 = v10
           + [(SCRO2DBrailleCanvasDescriptor *)self->_descriptor skipPinBetweenCellsVertically];
      }
      ++v3;
      --v6;
    }
    while (v6);
  }
}

- (unint64_t)cellHeight
{
  return [(SCRO2DBrailleCanvasDescriptor *)self->_descriptor cellHeight];
}

- (unint64_t)cellWidth
{
  return [(SCRO2DBrailleCanvasDescriptor *)self->_descriptor cellWidth];
}

- (BOOL)_canBlitCellAtX:(unint64_t)a3 y:(unint64_t)a4
{
  unint64_t v7 = [(SCRO2DBrailleCanvas *)self cellHeight];
  unint64_t v8 = a3 + [(SCRO2DBrailleCanvas *)self cellWidth] - 1;
  return v8 < [(SCRO2DBrailleCanvasDescriptor *)self->_descriptor width]
      && a4 + v7 - 1 < [(SCRO2DBrailleCanvasDescriptor *)self->_descriptor height];
}

- (void)_blitCell:(unsigned __int8)a3 AtX:(unint64_t)a4 y:(unint64_t)a5
{
  int v7 = a3;
  if ([(SCRO2DBrailleCanvas *)self cellWidth] + a4 > a4)
  {
    unint64_t v9 = a4;
    do
    {
      if ([(SCRO2DBrailleCanvas *)self cellHeight] + a5 > a5)
      {
        uint64_t v10 = 0;
        unint64_t v11 = v9 - a4;
        do
        {
          if (v9 != a4 || v10)
          {
            if (v9 == a4 && v10 == 1)
            {
              int v12 = 2;
            }
            else if (v9 == a4 && v10 == 2)
            {
              int v12 = 4;
            }
            else if (v9 == a4 && v10 == 3)
            {
              int v12 = 64;
            }
            else if (v11 != 1 || v10)
            {
              if (v11 == 1 && v10 == 1)
              {
                int v12 = 16;
              }
              else if (v11 == 1 && v10 == 2)
              {
                int v12 = 32;
              }
              else if (v10 == 3 && v11 == 1)
              {
                int v12 = 128;
              }
              else
              {
                int v12 = 0;
              }
            }
            else
            {
              int v12 = 8;
            }
          }
          else
          {
            int v12 = 1;
          }
          if ((v12 & v7) != 0) {
            v14.var0 = (unint64_t)[(SCRO2DBrailleCanvas *)self _fullyUpPinState];
          }
          else {
            v14.var0 = (unint64_t)[(SCRO2DBrailleCanvas *)self _fullyDownPinState];
          }
          [(SCRO2DBrailleCanvas *)self setPinState:v14.var0 forX:v9 y:a5 + v10++];
        }
        while (a5 + v10 < [(SCRO2DBrailleCanvas *)self cellHeight] + a5);
      }
      ++v9;
    }
    while (v9 < [(SCRO2DBrailleCanvas *)self cellWidth] + a4);
  }
}

- ($488472A07B2E1D1A523D39A95A553F6B)_fullyDownPinState
{
  if ([(SCRO2DBrailleCanvasDescriptor *)self->_descriptor pinHeightStyle] != 1
    && [(SCRO2DBrailleCanvasDescriptor *)self->_descriptor pinHeightStyle] != 2)
  {
    objc_msgSend(MEMORY[0x263EFF940], "raise:format:", @"SCRO2DBrailleException", @"Unexpected pinHeightStyle: %ld", -[SCRO2DBrailleCanvasDescriptor pinHeightStyle](self->_descriptor, "pinHeightStyle"));
  }
  return ($488472A07B2E1D1A523D39A95A553F6B)0;
}

- ($488472A07B2E1D1A523D39A95A553F6B)_fullyUpPinState
{
  if ([(SCRO2DBrailleCanvasDescriptor *)self->_descriptor pinHeightStyle] == 1)
  {
    unint64_t v3 = 0;
    uint64_t v4 = 1065353216;
  }
  else if ([(SCRO2DBrailleCanvasDescriptor *)self->_descriptor pinHeightStyle] == 2)
  {
    unint64_t v5 = [(SCRO2DBrailleCanvasDescriptor *)self->_descriptor detentCount];
    unint64_t v3 = (v5 - 1) & 0xFFFFFFFF00000000;
    uint64_t v4 = (v5 - 1);
  }
  else
  {
    objc_msgSend(MEMORY[0x263EFF940], "raise:format:", @"SCRO2DBrailleException", @"Unexpected pinHeightStyle: %ld", -[SCRO2DBrailleCanvasDescriptor pinHeightStyle](self->_descriptor, "pinHeightStyle"));
    unint64_t v3 = 0;
    uint64_t v4 = 0;
  }
  return ($488472A07B2E1D1A523D39A95A553F6B)(v4 | v3);
}

- (void)setImageData:(id)a3
{
  objc_storeStrong((id *)&self->_imageData, a3);

  [(SCRO2DBrailleCanvas *)self _updateCells];
}

- (NSData)imageData
{
  return self->_imageData;
}

- (SCRO2DBrailleCanvasDescriptor)descriptor
{
  return (SCRO2DBrailleCanvasDescriptor *)objc_getProperty(self, a2, 32, 1);
}

- (unint64_t)numberOfTextLines
{
  return self->_numberOfTextLines;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_descriptor, 0);
  objc_storeStrong((id *)&self->_brailleTextData, 0);
  objc_storeStrong((id *)&self->_imageData, 0);

  objc_storeStrong((id *)&self->_pins, 0);
}

- (id)debugAsciiCanvas
{
  unint64_t v3 = [(SCRO2DBrailleCanvas *)self descriptor];
  uint64_t v4 = [v3 height];

  if (v4)
  {
    unint64_t v5 = 0;
    NSUInteger v6 = &stru_26CCE0B50;
    do
    {
      int v7 = [(SCRO2DBrailleCanvas *)self descriptor];
      uint64_t v8 = [v7 width];

      if (v8)
      {
        unint64_t v9 = 0;
        uint64_t v10 = &stru_26CCE0B50;
        do
        {
          if ([(SCRO2DBrailleCanvas *)self pinStateForX:v9 y:v5]) {
            unint64_t v11 = @"#";
          }
          else {
            unint64_t v11 = @".";
          }
          int v12 = [(__CFString *)v10 stringByAppendingString:v11];

          ++v9;
          uint64_t v13 = [(SCRO2DBrailleCanvas *)self descriptor];
          unint64_t v14 = [v13 width];

          uint64_t v10 = v12;
        }
        while (v9 < v14);
      }
      else
      {
        int v12 = &stru_26CCE0B50;
      }
      objc_super v15 = [(__CFString *)v6 stringByAppendingString:v12];

      NSUInteger v6 = [v15 stringByAppendingString:@"\n"];

      ++v5;
      v16 = [(SCRO2DBrailleCanvas *)self descriptor];
      unint64_t v17 = [v16 height];
    }
    while (v5 < v17);
  }
  else
  {
    NSUInteger v6 = &stru_26CCE0B50;
  }

  return v6;
}

@end