@interface APPBColor
+ (Class)colorsType;
+ (Class)darkModeColorsType;
+ (id)stringsToColorArray:(id)a3;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSMutableArray)colors;
- (NSMutableArray)darkModeColors;
- (id)colorsAtIndex:(unint64_t)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)darkModeColorsAtIndex:(unint64_t)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (int)direction;
- (unint64_t)colorsCount;
- (unint64_t)darkModeColorsCount;
- (unint64_t)hash;
- (void)addColors:(id)a3;
- (void)addDarkModeColors:(id)a3;
- (void)clearColors;
- (void)clearDarkModeColors;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setColors:(id)a3;
- (void)setDarkModeColors:(id)a3;
- (void)setDirection:(int)a3;
- (void)writeTo:(id)a3;
@end

@implementation APPBColor

- (void)clearColors
{
}

- (void)addColors:(id)a3
{
  id v4 = a3;
  colors = self->_colors;
  id v8 = v4;
  if (!colors)
  {
    v6 = (NSMutableArray *)objc_alloc_init((Class)NSMutableArray);
    v7 = self->_colors;
    self->_colors = v6;

    id v4 = v8;
    colors = self->_colors;
  }
  [(NSMutableArray *)colors addObject:v4];
}

- (unint64_t)colorsCount
{
  return (unint64_t)[(NSMutableArray *)self->_colors count];
}

- (id)colorsAtIndex:(unint64_t)a3
{
  return [(NSMutableArray *)self->_colors objectAtIndex:a3];
}

+ (Class)colorsType
{
  return (Class)objc_opt_class();
}

- (void)clearDarkModeColors
{
}

- (void)addDarkModeColors:(id)a3
{
  id v4 = a3;
  darkModeColors = self->_darkModeColors;
  id v8 = v4;
  if (!darkModeColors)
  {
    v6 = (NSMutableArray *)objc_alloc_init((Class)NSMutableArray);
    v7 = self->_darkModeColors;
    self->_darkModeColors = v6;

    id v4 = v8;
    darkModeColors = self->_darkModeColors;
  }
  [(NSMutableArray *)darkModeColors addObject:v4];
}

- (unint64_t)darkModeColorsCount
{
  return (unint64_t)[(NSMutableArray *)self->_darkModeColors count];
}

- (id)darkModeColorsAtIndex:(unint64_t)a3
{
  return [(NSMutableArray *)self->_darkModeColors objectAtIndex:a3];
}

+ (Class)darkModeColorsType
{
  return (Class)objc_opt_class();
}

- (id)description
{
  v7.receiver = self;
  v7.super_class = (Class)APPBColor;
  v3 = [(APPBColor *)&v7 description];
  id v4 = [(APPBColor *)self dictionaryRepresentation];
  v5 = +[NSString stringWithFormat:@"%@ %@", v3, v4];

  return v5;
}

- (id)dictionaryRepresentation
{
  v3 = +[NSMutableDictionary dictionary];
  id v4 = v3;
  colors = self->_colors;
  if (colors) {
    [v3 setObject:colors forKey:@"colors"];
  }
  darkModeColors = self->_darkModeColors;
  if (darkModeColors) {
    [v4 setObject:darkModeColors forKey:@"darkModeColors"];
  }
  objc_super v7 = +[NSNumber numberWithInt:self->_direction];
  [v4 setObject:v7 forKey:@"direction"];

  return v4;
}

- (BOOL)readFrom:(id)a3
{
  return APPBColorReadFrom(self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  v5 = self->_colors;
  v6 = (char *)[(NSMutableArray *)v5 countByEnumeratingWithState:&v19 objects:v24 count:16];
  if (v6)
  {
    objc_super v7 = v6;
    uint64_t v8 = *(void *)v20;
    do
    {
      v9 = 0;
      do
      {
        if (*(void *)v20 != v8) {
          objc_enumerationMutation(v5);
        }
        PBDataWriterWriteStringField();
        ++v9;
      }
      while (v7 != v9);
      objc_super v7 = (char *)[(NSMutableArray *)v5 countByEnumeratingWithState:&v19 objects:v24 count:16];
    }
    while (v7);
  }

  long long v17 = 0u;
  long long v18 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  v10 = self->_darkModeColors;
  v11 = (char *)[(NSMutableArray *)v10 countByEnumeratingWithState:&v15 objects:v23 count:16];
  if (v11)
  {
    v12 = v11;
    uint64_t v13 = *(void *)v16;
    do
    {
      v14 = 0;
      do
      {
        if (*(void *)v16 != v13) {
          objc_enumerationMutation(v10);
        }
        PBDataWriterWriteStringField();
        ++v14;
      }
      while (v12 != v14);
      v12 = (char *)[(NSMutableArray *)v10 countByEnumeratingWithState:&v15 objects:v23 count:16];
    }
    while (v12);
  }

  PBDataWriterWriteInt32Field();
}

- (void)copyTo:(id)a3
{
  v12 = a3;
  if ([(APPBColor *)self colorsCount])
  {
    [v12 clearColors];
    unint64_t v4 = [(APPBColor *)self colorsCount];
    if (v4)
    {
      unint64_t v5 = v4;
      for (uint64_t i = 0; i != v5; ++i)
      {
        objc_super v7 = [(APPBColor *)self colorsAtIndex:i];
        [v12 addColors:v7];
      }
    }
  }
  if ([(APPBColor *)self darkModeColorsCount])
  {
    [v12 clearDarkModeColors];
    unint64_t v8 = [(APPBColor *)self darkModeColorsCount];
    if (v8)
    {
      unint64_t v9 = v8;
      for (uint64_t j = 0; j != v9; ++j)
      {
        v11 = [(APPBColor *)self darkModeColorsAtIndex:j];
        [v12 addDarkModeColors:v11];
      }
    }
  }
  v12[6] = self->_direction;
}

- (id)copyWithZone:(_NSZone *)a3
{
  unint64_t v5 = [[objc_opt_class() allocWithZone:a3] init];
  long long v23 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  v6 = self->_colors;
  id v7 = [(NSMutableArray *)v6 countByEnumeratingWithState:&v23 objects:v28 count:16];
  if (v7)
  {
    id v8 = v7;
    uint64_t v9 = *(void *)v24;
    do
    {
      v10 = 0;
      do
      {
        if (*(void *)v24 != v9) {
          objc_enumerationMutation(v6);
        }
        id v11 = [*(id *)(*((void *)&v23 + 1) + 8 * (void)v10) copyWithZone:a3];
        [v5 addColors:v11];

        v10 = (char *)v10 + 1;
      }
      while (v8 != v10);
      id v8 = [(NSMutableArray *)v6 countByEnumeratingWithState:&v23 objects:v28 count:16];
    }
    while (v8);
  }

  long long v21 = 0u;
  long long v22 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  v12 = self->_darkModeColors;
  id v13 = [(NSMutableArray *)v12 countByEnumeratingWithState:&v19 objects:v27 count:16];
  if (v13)
  {
    id v14 = v13;
    uint64_t v15 = *(void *)v20;
    do
    {
      long long v16 = 0;
      do
      {
        if (*(void *)v20 != v15) {
          objc_enumerationMutation(v12);
        }
        id v17 = [*(id *)(*((void *)&v19 + 1) + 8 * (void)v16) copyWithZone:a3];
        [v5 addDarkModeColors:v17];

        long long v16 = (char *)v16 + 1;
      }
      while (v14 != v16);
      id v14 = [(NSMutableArray *)v12 countByEnumeratingWithState:&v19 objects:v27 count:16];
    }
    while (v14);
  }

  v5[6] = self->_direction;
  return v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  BOOL v7 = [v4 isMemberOfClass:objc_opt_class()]
    && ((colors = self->_colors, !((unint64_t)colors | *((void *)v4 + 1)))
     || -[NSMutableArray isEqual:](colors, "isEqual:"))
    && ((darkModeColors = self->_darkModeColors, !((unint64_t)darkModeColors | *((void *)v4 + 2)))
     || -[NSMutableArray isEqual:](darkModeColors, "isEqual:"))
    && self->_direction == *((_DWORD *)v4 + 6);

  return v7;
}

- (unint64_t)hash
{
  unint64_t v3 = (unint64_t)[(NSMutableArray *)self->_colors hash];
  return (unint64_t)[(NSMutableArray *)self->_darkModeColors hash] ^ v3 ^ (2654435761 * self->_direction);
}

- (void)mergeFrom:(id)a3
{
  id v4 = a3;
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  id v5 = *((id *)v4 + 1);
  id v6 = [v5 countByEnumeratingWithState:&v19 objects:v24 count:16];
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v20;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v20 != v8) {
          objc_enumerationMutation(v5);
        }
        [(APPBColor *)self addColors:*(void *)(*((void *)&v19 + 1) + 8 * (void)v9)];
        uint64_t v9 = (char *)v9 + 1;
      }
      while (v7 != v9);
      id v7 = [v5 countByEnumeratingWithState:&v19 objects:v24 count:16];
    }
    while (v7);
  }

  long long v17 = 0u;
  long long v18 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v10 = *((id *)v4 + 2);
  id v11 = [v10 countByEnumeratingWithState:&v15 objects:v23 count:16];
  if (v11)
  {
    id v12 = v11;
    uint64_t v13 = *(void *)v16;
    do
    {
      id v14 = 0;
      do
      {
        if (*(void *)v16 != v13) {
          objc_enumerationMutation(v10);
        }
        -[APPBColor addDarkModeColors:](self, "addDarkModeColors:", *(void *)(*((void *)&v15 + 1) + 8 * (void)v14), (void)v15);
        id v14 = (char *)v14 + 1;
      }
      while (v12 != v14);
      id v12 = [v10 countByEnumeratingWithState:&v15 objects:v23 count:16];
    }
    while (v12);
  }

  self->_direction = *((_DWORD *)v4 + 6);
}

- (NSMutableArray)colors
{
  return self->_colors;
}

- (void)setColors:(id)a3
{
}

- (NSMutableArray)darkModeColors
{
  return self->_darkModeColors;
}

- (void)setDarkModeColors:(id)a3
{
}

- (int)direction
{
  return self->_direction;
}

- (void)setDirection:(int)a3
{
  self->_direction = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_darkModeColors, 0);

  objc_storeStrong((id *)&self->_colors, 0);
}

+ (id)stringsToColorArray:(id)a3
{
  id v3 = a3;
  id v4 = +[NSMutableArray array];
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  id v5 = v3;
  id v6 = [v5 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v17;
    do
    {
      for (uint64_t i = 0; i != v7; uint64_t i = (char *)i + 1)
      {
        if (*(void *)v17 != v8) {
          objc_enumerationMutation(v5);
        }
        uint64_t v10 = *(void *)(*((void *)&v16 + 1) + 8 * i);
        id v11 = objc_alloc((Class)PCNativePrimitiveColor);
        id v12 = [v11 initWithString:v10, (void)v16];
        if (v12)
        {
          [v4 addObject:v12];
        }
        else
        {
          uint64_t v13 = +[NSNull null];
          [v4 addObject:v13];
        }
      }
      id v7 = [v5 countByEnumeratingWithState:&v16 objects:v20 count:16];
    }
    while (v7);
  }

  id v14 = [v4 copy];

  return v14;
}

@end