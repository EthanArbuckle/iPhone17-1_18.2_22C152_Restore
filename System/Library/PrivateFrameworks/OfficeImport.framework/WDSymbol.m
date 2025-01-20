@interface WDSymbol
- (WDSymbol)initWithParagraph:(id)a3;
- (id)description;
- (id)font;
- (int)runType;
- (unsigned)character;
- (void)setCharacter:(unsigned __int16)a3;
- (void)setFont:(id)a3;
@end

@implementation WDSymbol

- (WDSymbol)initWithParagraph:(id)a3
{
  id v4 = a3;
  v14.receiver = self;
  v14.super_class = (Class)WDSymbol;
  v5 = [(WDRunWithCharacterProperties *)&v14 initWithParagraph:v4];
  if (v5)
  {
    v6 = [WDCharacterProperties alloc];
    v7 = [v4 document];
    v8 = [(WDCharacterProperties *)v6 initWithDocument:v7];
    [(WDRunWithCharacterProperties *)v5 setProperties:v8];

    v9 = [v4 document];
    v10 = [v9 fontTable];

    uint64_t v11 = [v10 fontWithName:@"Symbol"];
    mFont = v5->mFont;
    v5->mFont = (WDFont *)v11;
  }
  return v5;
}

- (void)setFont:(id)a3
{
}

- (void)setCharacter:(unsigned __int16)a3
{
  self->mCharacter = a3;
}

- (int)runType
{
  return 10;
}

- (unsigned)character
{
  return self->mCharacter;
}

- (id)font
{
  return self->mFont;
}

- (id)description
{
  v4.receiver = self;
  v4.super_class = (Class)WDSymbol;
  v2 = [(WDRun *)&v4 description];
  return v2;
}

- (void).cxx_destruct
{
}

@end