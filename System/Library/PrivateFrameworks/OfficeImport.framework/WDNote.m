@interface WDNote
- (BOOL)automaticNumbering;
- (WDNote)initWithParagraph:(id)a3 footnote:(BOOL)a4;
- (id)description;
- (id)reference;
- (id)text;
- (int)runType;
- (void)setAutomaticNumbering:(BOOL)a3;
@end

@implementation WDNote

- (WDNote)initWithParagraph:(id)a3 footnote:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  v17.receiver = self;
  v17.super_class = (Class)WDNote;
  v7 = [(WDRun *)&v17 initWithParagraph:v6];
  v8 = v7;
  if (v7)
  {
    v7->mAutomaticNumbering = 1;
    v9 = [v6 document];
    v10 = [WDText alloc];
    if (v4) {
      uint64_t v11 = 1;
    }
    else {
      uint64_t v11 = 5;
    }
    uint64_t v12 = [(WDText *)v10 initWithDocument:v9 textType:v11];
    mText = v8->mText;
    v8->mText = (WDText *)v12;

    v14 = [[WDCharacterRun alloc] initWithParagraph:v6];
    mReference = v8->mReference;
    v8->mReference = v14;
  }
  return v8;
}

- (id)text
{
  return self->mText;
}

- (void)setAutomaticNumbering:(BOOL)a3
{
  self->mAutomaticNumbering = a3;
}

- (id)reference
{
  return self->mReference;
}

- (int)runType
{
  if ([(WDText *)self->mText textType] == 1) {
    return 1;
  }
  else {
    return 2;
  }
}

- (BOOL)automaticNumbering
{
  return self->mAutomaticNumbering;
}

- (id)description
{
  v4.receiver = self;
  v4.super_class = (Class)WDNote;
  v2 = [(WDRun *)&v4 description];
  return v2;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->mReference, 0);
  objc_storeStrong((id *)&self->mText, 0);
}

@end