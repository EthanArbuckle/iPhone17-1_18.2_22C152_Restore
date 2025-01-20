@interface CHDLegendEntry
- (CHDLegendEntry)initWithResources:(id)a3;
- (id)description;
- (id)font;
- (unint64_t)fontIndex;
- (unsigned)entryIndex;
- (void)setEntryIndex:(unsigned int)a3;
- (void)setFont:(id)a3;
- (void)setFontIndex:(unint64_t)a3;
@end

@implementation CHDLegendEntry

- (CHDLegendEntry)initWithResources:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)CHDLegendEntry;
  v5 = [(CHDLegendEntry *)&v8 init];
  v6 = v5;
  if (v5)
  {
    objc_storeWeak((id *)&v5->mResources, v4);
    v6->mFontIndex = -1;
    v6->mEntryIndex = -1;
  }

  return v6;
}

- (void)setFontIndex:(unint64_t)a3
{
  self->mFontIndex = a3;
}

- (void)setEntryIndex:(unsigned int)a3
{
  self->mEntryIndex = a3;
}

- (void)setFont:(id)a3
{
  id v6 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)&self->mResources);
  v5 = [WeakRetained fonts];
  self->mFontIndex = [v5 addOrEquivalentObject:v6];
}

- (id)font
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->mResources);
  id v4 = [WeakRetained fonts];
  v5 = [v4 objectAtIndex:self->mFontIndex];

  return v5;
}

- (unsigned)entryIndex
{
  return self->mEntryIndex;
}

- (id)description
{
  v4.receiver = self;
  v4.super_class = (Class)CHDLegendEntry;
  v2 = [(CHDLegendEntry *)&v4 description];
  return v2;
}

- (void).cxx_destruct
{
}

- (unint64_t)fontIndex
{
  return self->mFontIndex;
}

@end