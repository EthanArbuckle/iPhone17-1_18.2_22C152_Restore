@interface WDFontTable
- (WDFontTable)init;
- (id)createFontWithName:(id)a3;
- (id)description;
- (id)fontAtIndex:(unint64_t)a3;
- (id)fontWithName:(id)a3;
- (id)fontWithName:(id)a3 create:(BOOL)a4;
- (id)fonts;
- (unint64_t)count;
- (unint64_t)indexOfFont:(id)a3;
- (void)clear;
@end

@implementation WDFontTable

- (WDFontTable)init
{
  v11.receiver = self;
  v11.super_class = (Class)WDFontTable;
  v2 = [(WDFontTable *)&v11 init];
  if (v2)
  {
    v3 = objc_alloc_init(OITSUNoCopyDictionary);
    mFontTable = v2->mFontTable;
    v2->mFontTable = v3;

    v5 = (NSMutableArray *)objc_alloc_init(MEMORY[0x263EFF980]);
    mFontsInOrderOfInsertion = v2->mFontsInOrderOfInsertion;
    v2->mFontsInOrderOfInsertion = v5;

    v7 = [(WDFontTable *)v2 fontWithName:@"Times New Roman" create:1];
    [v7 setPitch:2];
    [v7 setFontFamily:1];
    [v7 setCharacterSet:0];
    v8 = [(WDFontTable *)v2 fontWithName:@"Symbol" create:1];

    [v8 setPitch:2];
    [v8 setFontFamily:1];
    [v8 setCharacterSet:2];
    v9 = [(WDFontTable *)v2 fontWithName:@"Arial" create:1];

    [v9 setPitch:2];
    [v9 setFontFamily:2];
    [v9 setCharacterSet:0];
  }
  return v2;
}

- (id)fontWithName:(id)a3 create:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  if (v6)
  {
    v7 = [(OITSUNoCopyDictionary *)self->mFontTable objectForKey:v6];
    v8 = v7;
    if (!v4 || v7)
    {
      id v9 = v7;
    }
    else
    {
      id v9 = [(WDFontTable *)self createFontWithName:v6];
    }
    v10 = v9;
  }
  else
  {
    v10 = 0;
  }

  return v10;
}

- (id)createFontWithName:(id)a3
{
  id v4 = a3;
  v5 = v4;
  if (v4 && [v4 length])
  {
    id v6 = [(OITSUNoCopyDictionary *)self->mFontTable objectForKey:v5];
    if (!v6)
    {
      id v6 = [[WDFont alloc] initWithName:v5];
      [(OITSUNoCopyDictionary *)self->mFontTable setObject:v6 forKey:v5];
      [(NSMutableArray *)self->mFontsInOrderOfInsertion addObject:v6];
    }
  }
  else
  {
    id v6 = 0;
  }

  return v6;
}

- (id)fontWithName:(id)a3
{
  v3 = [(WDFontTable *)self fontWithName:a3 create:0];
  return v3;
}

- (void)clear
{
}

- (unint64_t)count
{
  return [(OITSUNoCopyDictionary *)self->mFontTable count];
}

- (id)fonts
{
  return (id)[(NSMutableArray *)self->mFontsInOrderOfInsertion objectEnumerator];
}

- (unint64_t)indexOfFont:(id)a3
{
  return [(NSMutableArray *)self->mFontsInOrderOfInsertion indexOfObjectIdenticalTo:a3];
}

- (id)fontAtIndex:(unint64_t)a3
{
  return (id)[(NSMutableArray *)self->mFontsInOrderOfInsertion objectAtIndexedSubscript:a3];
}

- (id)description
{
  v4.receiver = self;
  v4.super_class = (Class)WDFontTable;
  v2 = [(WDFontTable *)&v4 description];
  return v2;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->mFontsInOrderOfInsertion, 0);
  objc_storeStrong((id *)&self->mFontTable, 0);
}

@end