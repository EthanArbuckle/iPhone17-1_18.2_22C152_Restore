@interface WDCharacterRun
- (BOOL)binaryWriterContentFlag;
- (BOOL)isEmpty;
- (WDCharacterRun)initWithParagraph:(id)a3;
- (WDCharacterRun)initWithParagraph:(id)a3 string:(id)a4;
- (id)description;
- (id)string;
- (int)runType;
- (void)appendString:(id)a3;
- (void)clearString;
- (void)copyPropertiesFrom:(id)a3;
- (void)removeLastCharacter:(unsigned __int16)a3;
- (void)setBinaryWriterContentFlag:(BOOL)a3;
- (void)setPropertiesForDocument;
- (void)setString:(id)a3;
@end

@implementation WDCharacterRun

- (WDCharacterRun)initWithParagraph:(id)a3
{
  id v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)WDCharacterRun;
  v5 = [(WDRunWithCharacterProperties *)&v12 initWithParagraph:v4];
  if (v5)
  {
    v6 = [WDCharacterProperties alloc];
    v7 = [v4 document];
    v8 = [(WDCharacterProperties *)v6 initWithDocument:v7];
    [(WDRunWithCharacterProperties *)v5 setProperties:v8];

    v9 = (NSMutableString *)objc_alloc_init(MEMORY[0x263F089D8]);
    mString = v5->mString;
    v5->mString = v9;

    v5->mBinaryWriterContentFlag = 0;
  }

  return v5;
}

- (void)setString:(id)a3
{
}

- (int)runType
{
  return 0;
}

- (void)removeLastCharacter:(unsigned __int16)a3
{
  int v3 = a3;
  uint64_t v5 = [(NSMutableString *)self->mString length];
  if (v5)
  {
    uint64_t v6 = v5 - 1;
    if ([(NSMutableString *)self->mString characterAtIndex:v5 - 1] == v3)
    {
      mString = self->mString;
      -[NSMutableString substringWithRange:](mString, "substringWithRange:", 0, v6);
      id v8 = (id)objc_claimAutoreleasedReturnValue();
      -[NSMutableString setString:](mString, "setString:");
    }
  }
}

- (id)string
{
  return self->mString;
}

- (void)appendString:(id)a3
{
}

- (void)copyPropertiesFrom:(id)a3
{
  v7 = (id *)a3;
  id v4 = (WDCharacterProperties *)[v7[2] copy];
  mProperties = self->super.mProperties;
  self->super.mProperties = v4;
  uint64_t v6 = v4;

  [v7[2] copyPropertiesInto:self->super.mProperties];
}

- (BOOL)binaryWriterContentFlag
{
  return self->mBinaryWriterContentFlag;
}

- (void)setBinaryWriterContentFlag:(BOOL)a3
{
  self->mBinaryWriterContentFlag = a3;
}

- (void)setPropertiesForDocument
{
  id v7 = [(WDCharacterProperties *)self->super.mProperties document];
  int v3 = [v7 styleSheet];
  id v4 = [v3 defaultCharacterProperties];
  uint64_t v5 = (WDCharacterProperties *)[v4 copy];
  mProperties = self->super.mProperties;
  self->super.mProperties = v5;
}

- (void)clearString
{
  mString = self->mString;
  self->mString = 0;
}

- (WDCharacterRun)initWithParagraph:(id)a3 string:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [(WDCharacterRun *)self initWithParagraph:v6];
  v9 = v8;
  if (v8) {
    [(NSMutableString *)v8->mString setString:v7];
  }

  return v9;
}

- (BOOL)isEmpty
{
  return [(NSMutableString *)self->mString length] == 0;
}

- (id)description
{
  v4.receiver = self;
  v4.super_class = (Class)WDCharacterRun;
  v2 = [(WDRun *)&v4 description];
  return v2;
}

- (void).cxx_destruct
{
}

@end