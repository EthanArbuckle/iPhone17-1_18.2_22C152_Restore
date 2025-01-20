@interface SearchUIButton
- (BOOL)isPlayButton;
- (BOOL)useCompactMode;
- (SearchUIButton)initWithType:(unint64_t)a3;
- (id)imageNameForToggleState:(BOOL)a3;
- (unint64_t)type;
- (void)setFixedSize:(CGSize)a3;
- (void)setType:(unint64_t)a3;
- (void)setUseCompactMode:(BOOL)a3;
- (void)updateWithType:(unint64_t)a3;
@end

@implementation SearchUIButton

- (SearchUIButton)initWithType:(unint64_t)a3
{
  v7.receiver = self;
  v7.super_class = (Class)SearchUIButton;
  v4 = [(TLKButton *)&v7 init];
  v5 = v4;
  if (v4) {
    [(SearchUIButton *)v4 setType:a3];
  }
  return v5;
}

- (void)setType:(unint64_t)a3
{
  self->_type = a3;
  -[SearchUIButton updateWithType:](self, "updateWithType:");
}

- (BOOL)isPlayButton
{
  return self->_type == 0;
}

- (id)imageNameForToggleState:(BOOL)a3
{
  v3 = @"plus";
  if (a3) {
    v3 = @"minus";
  }
  v4 = @"play.fill";
  if (a3) {
    v4 = @"pause.fill";
  }
  if (self->_type) {
    return v3;
  }
  else {
    return v4;
  }
}

- (void)updateWithType:(unint64_t)a3
{
  [(TLKButton *)self fixedSize];
  if (v5 == *MEMORY[0x1E4F1DB30] && v4 == *(double *)(MEMORY[0x1E4F1DB30] + 8))
  {
    objc_super v7 = (void *)MEMORY[0x1E4FAE090];
    BOOL v8 = [(SearchUIButton *)self useCompactMode];
    v9 = (void *)MEMORY[0x1E4FB28F0];
    if (!v8) {
      v9 = (void *)MEMORY[0x1E4FB28C8];
    }
    id v14 = [v7 preferredFontForTextStyle:*v9 maximumContentSizeCategory:*MEMORY[0x1E4FB27B0]];
  }
  else
  {
    id v14 = 0;
  }
  v10 = [(SearchUIButton *)self imageNameForToggleState:0];
  v11 = +[SearchUISymbolImage uiImageWithSymbolName:v10 font:v14 scale:0];
  [(TLKButton *)self setUntoggledImage:v11];

  v12 = [(SearchUIButton *)self imageNameForToggleState:1];
  v13 = +[SearchUISymbolImage uiImageWithSymbolName:v12 font:v14 scale:0];
  [(TLKButton *)self setToggledImage:v13];

  [(TLKButton *)self showPlayIndicator:[(TLKButton *)self isToggled] ^ 1];
  [(SearchUIButton *)self tlk_updateWithCurrentAppearance];
}

- (void)setUseCompactMode:(BOOL)a3
{
  if (self->_useCompactMode != a3)
  {
    self->_useCompactMode = a3;
    unint64_t v4 = [(SearchUIButton *)self type];
    [(SearchUIButton *)self updateWithType:v4];
  }
}

- (void)setFixedSize:(CGSize)a3
{
  v4.receiver = self;
  v4.super_class = (Class)SearchUIButton;
  -[TLKButton setFixedSize:](&v4, sel_setFixedSize_, a3.width, a3.height);
  [(SearchUIButton *)self updateWithType:[(SearchUIButton *)self type]];
}

- (unint64_t)type
{
  return self->_type;
}

- (BOOL)useCompactMode
{
  return self->_useCompactMode;
}

@end