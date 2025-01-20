@interface TPPasscodeView
- (CGSize)intrinsicContentSize;
- (NSMutableString)passcodeMutableString;
- (NSString)passcodeString;
- (TPPasscodeView)initWithFrame:(CGRect)a3;
- (void)appendCharacter:(id)a3;
- (void)clear;
- (void)deleteLastCharacter;
- (void)drawRect:(CGRect)a3;
- (void)setPasscodeMutableString:(id)a3;
@end

@implementation TPPasscodeView

- (TPPasscodeView)initWithFrame:(CGRect)a3
{
  v7.receiver = self;
  v7.super_class = (Class)TPPasscodeView;
  v3 = -[TPPasscodeView initWithFrame:](&v7, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    v4 = [MEMORY[0x1E4FB1618] clearColor];
    [(TPPasscodeView *)v3 setBackgroundColor:v4];

    v5 = [MEMORY[0x1E4F28E78] string];
    [(TPPasscodeView *)v3 setPasscodeMutableString:v5];
  }
  return v3;
}

- (void)drawRect:(CGRect)a3
{
  [(TPPasscodeView *)self bounds];
  double v5 = v4;
  double v7 = v6;
  double v9 = v8;
  double v11 = v10;
  v12 = [MEMORY[0x1E4FB1618] dynamicBackgroundColor];
  [v12 setFill];

  v35.origin.x = v5;
  v35.origin.y = v7;
  v35.size.width = v9;
  v35.size.height = v11;
  UIRectFill(v35);
  objc_msgSend(MEMORY[0x1E4FB14C0], "bezierPathWithRoundedRect:cornerRadius:", v5 + 0.5, v7 + 0.5, v9 + -1.0, v11 + -1.0, 4.0);
  id v33 = (id)objc_claimAutoreleasedReturnValue();
  [v33 setLineWidth:1.0];
  v13 = [MEMORY[0x1E4FB1618] dynamicLabelColor];
  [v13 setStroke];

  [v33 stroke];
  v14 = [MEMORY[0x1E4FB1618] dynamicLabelColor];
  [v14 setFill];

  v15 = [(TPPasscodeView *)self passcodeMutableString];
  unint64_t v16 = [v15 length];

  v17 = [(TPPasscodeView *)self passcodeMutableString];
  unint64_t v18 = [v17 length];
  if (v16 > 8)
  {

    v24 = [(TPPasscodeView *)self passcodeMutableString];
    uint64_t v25 = [v24 length];

    if (v25)
    {
      unint64_t v26 = 0;
      double v27 = 112.0 / (double)v18 * 0.5;
      double v28 = (v11 + -2.0 - v27) * 0.5;
      double v29 = 22.0;
      do
      {
        v30 = objc_msgSend(MEMORY[0x1E4FB14C0], "bezierPathWithOvalInRect:", v29, v28, v27, v27);
        [v30 fill];
        double v29 = v27 + v27 + v29;

        ++v26;
        v31 = [(TPPasscodeView *)self passcodeMutableString];
        unint64_t v32 = [v31 length];
      }
      while (v26 < v32);
    }
  }
  else
  {

    if (v18)
    {
      unint64_t v19 = 0;
      double v20 = 22.0;
      do
      {
        v21 = objc_msgSend(MEMORY[0x1E4FB14C0], "bezierPathWithOvalInRect:", v20, 15.0, 7.0, 7.0);
        [v21 fill];
        double v20 = v20 + 14.0;

        ++v19;
        v22 = [(TPPasscodeView *)self passcodeMutableString];
        unint64_t v23 = [v22 length];
      }
      while (v19 < v23);
    }
  }
}

- (CGSize)intrinsicContentSize
{
  double v2 = 150.0;
  double v3 = 38.0;
  result.height = v3;
  result.width = v2;
  return result;
}

- (NSString)passcodeString
{
  double v2 = NSString;
  double v3 = [(TPPasscodeView *)self passcodeMutableString];
  double v4 = [v2 stringWithString:v3];

  return (NSString *)v4;
}

- (void)appendCharacter:(id)a3
{
  id v4 = a3;
  double v5 = [(TPPasscodeView *)self passcodeMutableString];
  [v5 appendString:v4];

  [(TPPasscodeView *)self setNeedsDisplay];
}

- (void)deleteLastCharacter
{
  double v3 = [(TPPasscodeView *)self passcodeMutableString];
  uint64_t v4 = [v3 length];

  if (v4)
  {
    double v5 = [(TPPasscodeView *)self passcodeMutableString];
    double v6 = [(TPPasscodeView *)self passcodeMutableString];
    objc_msgSend(v5, "deleteCharactersInRange:", objc_msgSend(v6, "length") - 1, 1);

    [(TPPasscodeView *)self setNeedsDisplay];
  }
}

- (void)clear
{
  double v3 = [(TPPasscodeView *)self passcodeMutableString];
  uint64_t v4 = [v3 length];

  if (v4)
  {
    double v5 = [(TPPasscodeView *)self passcodeMutableString];
    double v6 = [(TPPasscodeView *)self passcodeMutableString];
    objc_msgSend(v5, "deleteCharactersInRange:", 0, objc_msgSend(v6, "length"));

    [(TPPasscodeView *)self setNeedsDisplay];
  }
}

- (NSMutableString)passcodeMutableString
{
  return (NSMutableString *)objc_getProperty(self, a2, 408, 1);
}

- (void)setPasscodeMutableString:(id)a3
{
}

- (void).cxx_destruct
{
}

@end