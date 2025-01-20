@interface MFPalette
+ (MFPalette)paletteWithColours:(id)a3;
- (BOOL)resize:(int)a3;
- (BOOL)setEntries:(int)a3 in_colours:(id)a4;
- (MFPalette)init;
- (MFPalette)initWithColours:(id)a3;
- (id)getColour:(int)a3;
- (int)selectInto:(id)a3;
@end

@implementation MFPalette

- (MFPalette)init
{
  v9.receiver = self;
  v9.super_class = (Class)MFPalette;
  v2 = [(MFPalette *)&v9 init];
  if (v2)
  {
    uint64_t v3 = [objc_alloc(MEMORY[0x263EFF980]) initWithCapacity:256];
    m_colours = v2->m_colours;
    v2->m_colours = (NSMutableArray *)v3;

    for (uint64_t i = 0; i != 768; i += 3)
    {
      v6 = v2->m_colours;
      v7 = +[OITSUColor colorWithRGBBytes:g_defaultPalette[i] green:g_defaultPalette[i + 1] blue:g_defaultPalette[i + 2]];
      [(NSMutableArray *)v6 addObject:v7];
    }
  }
  return v2;
}

- (int)selectInto:(id)a3
{
  return 0;
}

+ (MFPalette)paletteWithColours:(id)a3
{
  id v4 = a3;
  v5 = (void *)[objc_alloc((Class)a1) initWithColours:v4];

  return (MFPalette *)v5;
}

- (MFPalette)initWithColours:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)MFPalette;
  v5 = [(MFPalette *)&v9 init];
  if (v5)
  {
    uint64_t v6 = objc_msgSend(objc_alloc(MEMORY[0x263EFF980]), "initWithCapacity:", objc_msgSend(v4, "count"));
    m_colours = v5->m_colours;
    v5->m_colours = (NSMutableArray *)v6;

    [(NSMutableArray *)v5->m_colours setArray:v4];
  }

  return v5;
}

- (BOOL)setEntries:(int)a3 in_colours:(id)a4
{
  id v6 = a4;
  if (a3 < 0 || (int)[(NSMutableArray *)self->m_colours count] < a3)
  {
    BOOL v7 = 0;
  }
  else
  {
    -[NSMutableArray replaceObjectsInRange:withObjectsFromArray:](self->m_colours, "replaceObjectsInRange:withObjectsFromArray:", a3, [v6 count], v6);
    BOOL v7 = 1;
  }

  return v7;
}

- (BOOL)resize:(int)a3
{
  int v5 = [(NSMutableArray *)self->m_colours count];
  int v6 = [(NSMutableArray *)self->m_colours count];
  if (v5 >= a3)
  {
    if (a3 < v6) {
      -[NSMutableArray removeObjectsInRange:](self->m_colours, "removeObjectsInRange:", a3, [(NSMutableArray *)self->m_colours count] - a3);
    }
  }
  else
  {
    int v7 = a3 - v6;
    if (a3 > v6)
    {
      do
      {
        m_colours = self->m_colours;
        objc_super v9 = +[OITSUColor colorWithRGBBytes:0 green:0 blue:0];
        [(NSMutableArray *)m_colours addObject:v9];

        --v7;
      }
      while (v7);
    }
  }
  return 1;
}

- (id)getColour:(int)a3
{
  if (a3 < 0 || (int)[(NSMutableArray *)self->m_colours count] <= a3)
  {
    int v5 = +[OITSUColor colorWithRGBBytes:0 green:0 blue:0];
  }
  else
  {
    int v5 = [(NSMutableArray *)self->m_colours objectAtIndex:a3];
  }
  return v5;
}

- (void).cxx_destruct
{
}

@end