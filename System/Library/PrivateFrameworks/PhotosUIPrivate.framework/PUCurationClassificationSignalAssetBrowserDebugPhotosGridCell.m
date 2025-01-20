@interface PUCurationClassificationSignalAssetBrowserDebugPhotosGridCell
- (NSString)score;
- (UIColor)color;
- (void)layoutSubviews;
- (void)setColor:(id)a3;
- (void)setScore:(id)a3;
@end

@implementation PUCurationClassificationSignalAssetBrowserDebugPhotosGridCell

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_color, 0);
  objc_storeStrong((id *)&self->_score, 0);
  objc_storeStrong((id *)&self->_scoreLabel, 0);
}

- (UIColor)color
{
  return self->_color;
}

- (NSString)score
{
  return self->_score;
}

- (void)setColor:(id)a3
{
  objc_storeStrong((id *)&self->_color, a3);
  id v5 = a3;
  [(UILabel *)self->_scoreLabel setTextColor:v5];
}

- (void)setScore:(id)a3
{
  objc_storeStrong((id *)&self->_score, a3);
  id v5 = a3;
  [(UILabel *)self->_scoreLabel setText:v5];
}

- (void)layoutSubviews
{
  v11.receiver = self;
  v11.super_class = (Class)PUCurationClassificationSignalAssetBrowserDebugPhotosGridCell;
  [(PUPhotosGridCell *)&v11 layoutSubviews];
  if (!self->_scoreLabel)
  {
    id v3 = objc_alloc(MEMORY[0x1E4FB1930]);
    v4 = (UILabel *)objc_msgSend(v3, "initWithFrame:", *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
    scoreLabel = self->_scoreLabel;
    self->_scoreLabel = v4;

    v6 = [MEMORY[0x1E4FB1618] secondarySystemBackgroundColor];
    [(UILabel *)self->_scoreLabel setBackgroundColor:v6];

    [(UILabel *)self->_scoreLabel setAutoresizingMask:9];
    if (self->_score) {
      score = (__CFString *)self->_score;
    }
    else {
      score = @"0.00";
    }
    [(UILabel *)self->_scoreLabel setText:score];
    [(UILabel *)self->_scoreLabel setTextAlignment:1];
    v8 = [MEMORY[0x1E4FB08E0] systemFontOfSize:12.0];
    [(UILabel *)self->_scoreLabel setFont:v8];

    [(PUCurationClassificationSignalAssetBrowserDebugPhotosGridCell *)self addSubview:self->_scoreLabel];
  }
  [(PUCurationClassificationSignalAssetBrowserDebugPhotosGridCell *)self bounds];
  -[UILabel setFrame:](self->_scoreLabel, "setFrame:", v9 + -45.0, v10 + -20.0, 40.0, 15.0);
}

@end