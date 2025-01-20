@interface WDListLevelOverride
- (BOOL)isListLevelOverridden;
- (BOOL)isStartNumberOverridden;
- (WDListLevelOverride)initWithDocument:(id)a3 level:(unsigned __int8)a4;
- (id)description;
- (id)listLevel;
- (id)mutableListLevel;
- (int64_t)startNumber;
- (unsigned)level;
- (void)setStartNumber:(int64_t)a3;
@end

@implementation WDListLevelOverride

- (void)setStartNumber:(int64_t)a3
{
  self->mStartNumber = a3;
  self->mStartNumberOverridden = 1;
}

- (id)mutableListLevel
{
  mListLevel = self->mListLevel;
  if (!mListLevel)
  {
    v4 = [WDListLevel alloc];
    id WeakRetained = objc_loadWeakRetained((id *)&self->mDocument);
    v6 = [(WDListLevel *)v4 initWithDocument:WeakRetained];
    v7 = self->mListLevel;
    self->mListLevel = v6;

    mListLevel = self->mListLevel;
  }
  return mListLevel;
}

- (WDListLevelOverride)initWithDocument:(id)a3 level:(unsigned __int8)a4
{
  id v6 = a3;
  v10.receiver = self;
  v10.super_class = (Class)WDListLevelOverride;
  v7 = [(WDListLevelOverride *)&v10 init];
  v8 = v7;
  if (v7)
  {
    objc_storeWeak((id *)&v7->mDocument, v6);
    v8->mLevel = a4;
  }

  return v8;
}

- (unsigned)level
{
  return self->mLevel;
}

- (int64_t)startNumber
{
  return self->mStartNumber;
}

- (BOOL)isStartNumberOverridden
{
  return self->mStartNumberOverridden;
}

- (id)listLevel
{
  return self->mListLevel;
}

- (BOOL)isListLevelOverridden
{
  return self->mListLevel != 0;
}

- (id)description
{
  v4.receiver = self;
  v4.super_class = (Class)WDListLevelOverride;
  v2 = [(WDListLevelOverride *)&v4 description];
  return v2;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->mListLevel, 0);
  objc_destroyWeak((id *)&self->mDocument);
}

@end