@interface SCRO2DBraillePlane
- (BOOL)canPanLeft;
- (BOOL)canPanRight;
- (BOOL)wordWrapEnabled;
- (SCRO2DBraillePlane)initWithDriver:(id)a3;
- (void)panLeft;
- (void)panRight;
- (void)setBrailleData:(id)a3;
- (void)setWordWrapEnabled:(BOOL)a3;
@end

@implementation SCRO2DBraillePlane

- (SCRO2DBraillePlane)initWithDriver:(id)a3
{
  id v5 = a3;
  v13.receiver = self;
  v13.super_class = (Class)SCRO2DBraillePlane;
  v6 = [(SCRO2DBraillePlane *)&v13 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_brailleDriver, a3);
    char v8 = objc_opt_respondsToSelector();
    v7->_supportsCanvas = v8 & 1;
    v7->_wordWrapEnabled = 1;
    if (v8)
    {
      uint64_t v9 = [(SCROBrailleDriverProtocol *)v7->_brailleDriver canvas];
      canvas = v7->_canvas;
      v7->_canvas = (SCRO2DBrailleCanvas *)v9;
    }
    v11 = v7;
  }

  return v7;
}

- (void)setBrailleData:(id)a3
{
  id v4 = a3;
  if (self->_supportsCanvas)
  {
    id v12 = v4;
    id v5 = [v4 imageData];

    if (v5)
    {
      v6 = [[SCRO2DBrailleImageContent alloc] initWithBrailleData:v12 canvas:self->_canvas];
    }
    else
    {
      if ([v12 truncateStrings])
      {
        v7 = [SCRO2DBrailleListContent alloc];
        canvas = self->_canvas;
        id v9 = v12;
        BOOL wordWrapEnabled = 0;
      }
      else
      {
        v7 = [SCRO2DBrailleReadingContent alloc];
        canvas = self->_canvas;
        BOOL wordWrapEnabled = self->_wordWrapEnabled;
        id v9 = v12;
      }
      v6 = [(SCRO2DBrailleListContent *)v7 initWithBrailleData:v9 canvas:canvas wordWrap:wordWrapEnabled];
    }
    content = self->_content;
    self->_content = (SCRO2DBrailleContentProtocol *)v6;

    [(SCRO2DBrailleContentProtocol *)self->_content drawOnCanvas:self->_canvas];
    [(SCROBrailleDriverProtocol *)self->_brailleDriver displayCanvas];
    id v4 = v12;
  }
}

- (BOOL)canPanLeft
{
  if (self->_supportsCanvas) {
    return [(SCRO2DBrailleContentProtocol *)self->_content canPanLeft];
  }
  else {
    return 0;
  }
}

- (void)panLeft
{
  if (self->_supportsCanvas && [(SCRO2DBraillePlane *)self canPanLeft])
  {
    [(SCRO2DBrailleContentProtocol *)self->_content panLeft];
    canvas = self->_canvas;
    content = self->_content;
    [(SCRO2DBrailleContentProtocol *)content drawOnCanvas:canvas];
  }
}

- (BOOL)canPanRight
{
  if (self->_supportsCanvas) {
    return [(SCRO2DBrailleContentProtocol *)self->_content canPanRight];
  }
  else {
    return 0;
  }
}

- (void)panRight
{
  if (self->_supportsCanvas && [(SCRO2DBraillePlane *)self canPanRight])
  {
    [(SCRO2DBrailleContentProtocol *)self->_content panRight];
    canvas = self->_canvas;
    content = self->_content;
    [(SCRO2DBrailleContentProtocol *)content drawOnCanvas:canvas];
  }
}

- (BOOL)wordWrapEnabled
{
  return self->_wordWrapEnabled;
}

- (void)setWordWrapEnabled:(BOOL)a3
{
  self->_BOOL wordWrapEnabled = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_focusedElement, 0);
  objc_storeStrong((id *)&self->_elements, 0);
  objc_storeStrong((id *)&self->_brailleLines, 0);
  objc_storeStrong((id *)&self->_content, 0);
  objc_storeStrong((id *)&self->_canvas, 0);

  objc_storeStrong((id *)&self->_brailleDriver, 0);
}

@end