@interface SXComponentTextRules
+ (id)bodyTextRules;
+ (id)defaultTextRules;
+ (id)headingTextRules;
+ (id)smallTextRules;
+ (id)titleTextRules;
- (BOOL)allowsScrollPositionRestore;
- (BOOL)isSelectable;
- (BOOL)shouldHyphenate;
- (NSString)fontTextStyle;
- (SXComponentTextRules)init;
- (double)dropCapConstant;
- (double)fontResizingTresholdFactor;
- (double)fontSizeConstant;
- (double)lineHeightConstant;
- (id)copyWithZone:(_NSZone *)a3;
- (int64_t)textFlow;
- (void)setAllowsScrollPositionRestore:(BOOL)a3;
- (void)setDropCapConstant:(double)a3;
- (void)setFontResizingTresholdFactor:(double)a3;
- (void)setFontSizeConstant:(double)a3;
- (void)setFontTextStyle:(id)a3;
- (void)setIsSelectable:(BOOL)a3;
- (void)setLineHeightConstant:(double)a3;
- (void)setShouldHyphenate:(BOOL)a3;
- (void)setTextFlow:(int64_t)a3;
@end

@implementation SXComponentTextRules

+ (id)defaultTextRules
{
  if (defaultTextRules_onceToken != -1) {
    dispatch_once(&defaultTextRules_onceToken, &__block_literal_global_25);
  }
  v2 = (void *)defaultTextRules___defaultTextRules;
  return v2;
}

uint64_t __53__SXComponentTextRules_Definitions__defaultTextRules__block_invoke()
{
  v0 = objc_alloc_init(SXComponentTextRules);
  v1 = (void *)defaultTextRules___defaultTextRules;
  defaultTextRules___defaultTextRules = (uint64_t)v0;

  v2 = (void *)defaultTextRules___defaultTextRules;
  uint64_t v3 = *MEMORY[0x263F1D260];
  return [v2 setFontTextStyle:v3];
}

+ (id)bodyTextRules
{
  if (bodyTextRules_onceToken != -1) {
    dispatch_once(&bodyTextRules_onceToken, &__block_literal_global_2);
  }
  v2 = (void *)bodyTextRules___bodyTextRules;
  return v2;
}

uint64_t __50__SXComponentTextRules_Definitions__bodyTextRules__block_invoke()
{
  v0 = objc_alloc_init(SXComponentTextRules);
  v1 = (void *)bodyTextRules___bodyTextRules;
  bodyTextRules___bodyTextRules = (uint64_t)v0;

  [(id)bodyTextRules___bodyTextRules setShouldHyphenate:1];
  [(id)bodyTextRules___bodyTextRules setFontResizingTresholdFactor:1.0];
  [(id)bodyTextRules___bodyTextRules setFontSizeConstant:0.816];
  [(id)bodyTextRules___bodyTextRules setAllowsScrollPositionRestore:1];
  [(id)bodyTextRules___bodyTextRules setIsSelectable:1];
  [(id)bodyTextRules___bodyTextRules setTextFlow:1];
  v2 = (void *)bodyTextRules___bodyTextRules;
  uint64_t v3 = *MEMORY[0x263F1D260];
  return [v2 setFontTextStyle:v3];
}

+ (id)smallTextRules
{
  if (smallTextRules_onceToken != -1) {
    dispatch_once(&smallTextRules_onceToken, &__block_literal_global_4_0);
  }
  v2 = (void *)smallTextRules___smallTextRules;
  return v2;
}

uint64_t __51__SXComponentTextRules_Definitions__smallTextRules__block_invoke()
{
  v0 = objc_alloc_init(SXComponentTextRules);
  v1 = (void *)smallTextRules___smallTextRules;
  smallTextRules___smallTextRules = (uint64_t)v0;

  [(id)smallTextRules___smallTextRules setFontResizingTresholdFactor:1.0];
  [(id)smallTextRules___smallTextRules setFontSizeConstant:0.816];
  v2 = (void *)smallTextRules___smallTextRules;
  uint64_t v3 = *MEMORY[0x263F1D270];
  return [v2 setFontTextStyle:v3];
}

+ (id)titleTextRules
{
  if (titleTextRules_onceToken != -1) {
    dispatch_once(&titleTextRules_onceToken, &__block_literal_global_6_0);
  }
  v2 = (void *)titleTextRules___titleTextRules;
  return v2;
}

uint64_t __51__SXComponentTextRules_Definitions__titleTextRules__block_invoke()
{
  v0 = objc_alloc_init(SXComponentTextRules);
  v1 = (void *)titleTextRules___titleTextRules;
  titleTextRules___titleTextRules = (uint64_t)v0;

  [(id)titleTextRules___titleTextRules setTextFlow:1];
  v2 = (void *)titleTextRules___titleTextRules;
  uint64_t v3 = *MEMORY[0x263F1D2F8];
  return [v2 setFontTextStyle:v3];
}

+ (id)headingTextRules
{
  if (headingTextRules_onceToken != -1) {
    dispatch_once(&headingTextRules_onceToken, &__block_literal_global_8_0);
  }
  v2 = (void *)headingTextRules___headingTextRules;
  return v2;
}

uint64_t __53__SXComponentTextRules_Definitions__headingTextRules__block_invoke()
{
  v0 = objc_alloc_init(SXComponentTextRules);
  v1 = (void *)headingTextRules___headingTextRules;
  headingTextRules___headingTextRules = (uint64_t)v0;

  [(id)headingTextRules___headingTextRules setTextFlow:1];
  v2 = (void *)headingTextRules___headingTextRules;
  uint64_t v3 = *MEMORY[0x263F1D298];
  return [v2 setFontTextStyle:v3];
}

- (SXComponentTextRules)init
{
  v5.receiver = self;
  v5.super_class = (Class)SXComponentTextRules;
  v2 = [(SXComponentTextRules *)&v5 init];
  uint64_t v3 = v2;
  if (v2)
  {
    *(_OWORD *)&v2->_fontResizingTresholdFactor = xmmword_222BEF5A0;
    *(_OWORD *)&v2->_lineHeightConstant = xmmword_222BEF5B0;
    *(_WORD *)&v2->_shouldHyphenate = 256;
    v2->_allowsScrollPositionRestore = 0;
    v2->_textFlow = 0;
    objc_storeStrong((id *)&v2->_fontTextStyle, (id)*MEMORY[0x263F1D260]);
  }
  return v3;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v4 = (void *)[(id)objc_opt_class() allocWithZone:a3];
  [(SXComponentTextRules *)self fontResizingTresholdFactor];
  objc_msgSend(v4, "setFontResizingTresholdFactor:");
  [(SXComponentTextRules *)self fontSizeConstant];
  objc_msgSend(v4, "setFontSizeConstant:");
  [(SXComponentTextRules *)self lineHeightConstant];
  objc_msgSend(v4, "setLineHeightConstant:");
  [(SXComponentTextRules *)self dropCapConstant];
  objc_msgSend(v4, "setDropCapConstant:");
  objc_msgSend(v4, "setShouldHyphenate:", -[SXComponentTextRules shouldHyphenate](self, "shouldHyphenate"));
  objc_msgSend(v4, "setAllowsScrollPositionRestore:", -[SXComponentTextRules allowsScrollPositionRestore](self, "allowsScrollPositionRestore"));
  objc_msgSend(v4, "setIsSelectable:", -[SXComponentTextRules isSelectable](self, "isSelectable"));
  objc_msgSend(v4, "setTextFlow:", -[SXComponentTextRules textFlow](self, "textFlow"));
  objc_super v5 = [(SXComponentTextRules *)self fontTextStyle];
  [v4 setFontTextStyle:v5];

  return v4;
}

- (double)fontResizingTresholdFactor
{
  return self->_fontResizingTresholdFactor;
}

- (void)setFontResizingTresholdFactor:(double)a3
{
  self->_fontResizingTresholdFactor = a3;
}

- (double)fontSizeConstant
{
  return self->_fontSizeConstant;
}

- (void)setFontSizeConstant:(double)a3
{
  self->_fontSizeConstant = a3;
}

- (double)lineHeightConstant
{
  return self->_lineHeightConstant;
}

- (void)setLineHeightConstant:(double)a3
{
  self->_lineHeightConstant = a3;
}

- (double)dropCapConstant
{
  return self->_dropCapConstant;
}

- (void)setDropCapConstant:(double)a3
{
  self->_dropCapConstant = a3;
}

- (BOOL)shouldHyphenate
{
  return self->_shouldHyphenate;
}

- (void)setShouldHyphenate:(BOOL)a3
{
  self->_shouldHyphenate = a3;
}

- (BOOL)isSelectable
{
  return self->_isSelectable;
}

- (void)setIsSelectable:(BOOL)a3
{
  self->_isSelectable = a3;
}

- (BOOL)allowsScrollPositionRestore
{
  return self->_allowsScrollPositionRestore;
}

- (void)setAllowsScrollPositionRestore:(BOOL)a3
{
  self->_allowsScrollPositionRestore = a3;
}

- (int64_t)textFlow
{
  return self->_textFlow;
}

- (void)setTextFlow:(int64_t)a3
{
  self->_textFlow = a3;
}

- (NSString)fontTextStyle
{
  return self->_fontTextStyle;
}

- (void)setFontTextStyle:(id)a3
{
}

- (void).cxx_destruct
{
}

@end