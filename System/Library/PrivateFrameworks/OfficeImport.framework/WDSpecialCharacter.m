@interface WDSpecialCharacter
- (WDSpecialCharacter)initWithParagraph:(id)a3;
- (id)description;
- (int)characterType;
- (int)runType;
- (void)setCharacterType:(int)a3;
@end

@implementation WDSpecialCharacter

- (WDSpecialCharacter)initWithParagraph:(id)a3
{
  id v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)WDSpecialCharacter;
  v5 = [(WDRunWithCharacterProperties *)&v11 initWithParagraph:v4];
  if (v5)
  {
    v6 = [WDCharacterProperties alloc];
    v7 = [v4 document];
    uint64_t v8 = [(WDCharacterProperties *)v6 initWithDocument:v7];
    mProperties = v5->super.mProperties;
    v5->super.mProperties = (WDCharacterProperties *)v8;

    v5->mType = 0xFFFF;
  }

  return v5;
}

- (void)setCharacterType:(int)a3
{
  self->mType = a3;
}

- (int)runType
{
  return 11;
}

- (int)characterType
{
  return self->mType;
}

- (id)description
{
  v4.receiver = self;
  v4.super_class = (Class)WDSpecialCharacter;
  v2 = [(WDRun *)&v4 description];
  return v2;
}

@end