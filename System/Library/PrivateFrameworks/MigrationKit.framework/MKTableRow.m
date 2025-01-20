@interface MKTableRow
+ (id)rowWithCells:(id)a3;
+ (id)rowWithTitle:(id)a3;
+ (id)separatorRow;
- (MKTableRow)init;
- (NSArray)cells;
- (NSString)divider;
- (id)asciiRepresentationUsingColumns:(id)a3;
- (id)csvRepresentation;
- (id)csvSafeValueForCell:(id)a3;
- (id)formattedValueForCell:(id)a3;
- (int)totalWidthOfColumns:(id)a3;
- (int64_t)totalColumns;
- (void)adjustColumnsToFit:(id)a3;
- (void)setCells:(id)a3;
- (void)setDivider:(id)a3;
- (void)setTotalColumns:(int64_t)a3;
@end

@implementation MKTableRow

- (MKTableRow)init
{
  v5.receiver = self;
  v5.super_class = (Class)MKTableRow;
  v2 = [(MKTableRow *)&v5 init];
  v3 = v2;
  if (v2) {
    [(MKTableRow *)v2 setDivider:@"|"];
  }
  return v3;
}

+ (id)rowWithTitle:(id)a3
{
  id v3 = a3;
  v4 = [[MKTableTitleRow alloc] initWithTitle:v3];

  return v4;
}

+ (id)rowWithCells:(id)a3
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  id v3 = a3;
  v4 = objc_alloc_init(MKTableRow);
  objc_super v5 = v4;
  if (v4)
  {
    [(MKTableRow *)v4 setCells:v3];
    long long v14 = 0u;
    long long v15 = 0u;
    long long v12 = 0u;
    long long v13 = 0u;
    v6 = [(MKTableRow *)v5 cells];
    uint64_t v7 = [v6 countByEnumeratingWithState:&v12 objects:v16 count:16];
    if (v7)
    {
      uint64_t v8 = v7;
      uint64_t v9 = *(void *)v13;
      do
      {
        for (uint64_t i = 0; i != v8; ++i)
        {
          if (*(void *)v13 != v9) {
            objc_enumerationMutation(v6);
          }
          -[MKTableRow setTotalColumns:](v5, "setTotalColumns:", -[MKTableRow totalColumns](v5, "totalColumns")+ (int)[*(id *)(*((void *)&v12 + 1) + 8 * i) columnSpan]);
        }
        uint64_t v8 = [v6 countByEnumeratingWithState:&v12 objects:v16 count:16];
      }
      while (v8);
    }
  }
  return v5;
}

+ (id)separatorRow
{
  v2 = objc_alloc_init(MKTableSeparatorRow);
  return v2;
}

- (void)adjustColumnsToFit:(id)a3
{
  uint64_t v30 = *MEMORY[0x263EF8340];
  id v4 = a3;
  long long v25 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  id obj = [(MKTableRow *)self cells];
  uint64_t v5 = [obj countByEnumeratingWithState:&v25 objects:v29 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    int v7 = 0;
    uint64_t v8 = *(void *)v26;
    uint64_t v21 = *(void *)v26;
    id v22 = v4;
    do
    {
      uint64_t v9 = 0;
      uint64_t v23 = v6;
      do
      {
        if (*(void *)v26 != v8) {
          objc_enumerationMutation(obj);
        }
        v10 = *(void **)(*((void *)&v25 + 1) + 8 * v9);
        v11 = -[MKTableRow formattedValueForCell:](self, "formattedValueForCell:", v10, v21, v22);
        uint64_t v12 = [v11 length];

        if ([v10 columnSpan] == 1)
        {
          long long v13 = [v4 objectAtIndexedSubscript:v7];
          [v13 adjustWidthToFit:v12];
        }
        else
        {
          long long v13 = objc_msgSend(v4, "subarrayWithRange:", v7, (int)objc_msgSend(v10, "columnSpan"));
          unint64_t v14 = [v13 count];
          if ((int)v12 >= 1)
          {
            uint64_t v15 = 0;
            int v16 = vcvtpd_s64_f64((double)(int)v12 / (double)v14);
            do
            {
              uint64_t v17 = [v13 objectAtIndexedSubscript:v15];
              v18 = v17;
              if ((int)v12 >= v16) {
                uint64_t v19 = v16;
              }
              else {
                uint64_t v19 = v12;
              }
              [v17 adjustWidthToFit:v19];
              v20 = [(MKTableRow *)self divider];
              LODWORD(v12) = v12 - v16 - [v20 length];

              ++v15;
            }
            while ((int)v12 > 0);
            uint64_t v8 = v21;
            id v4 = v22;
            uint64_t v6 = v23;
          }
        }

        v7 += [v10 columnSpan];
        ++v9;
      }
      while (v9 != v6);
      uint64_t v6 = [obj countByEnumeratingWithState:&v25 objects:v29 count:16];
    }
    while (v6);
  }
}

- (id)formattedValueForCell:(id)a3
{
  id v3 = NSString;
  id v4 = [a3 formattedValue];
  uint64_t v5 = [v3 stringWithFormat:@" %@ ", v4];

  return v5;
}

- (id)asciiRepresentationUsingColumns:(id)a3
{
  uint64_t v36 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = objc_alloc(MEMORY[0x263EFF980]);
  uint64_t v6 = [(MKTableRow *)self cells];
  uint64_t v30 = objc_msgSend(v5, "initWithCapacity:", objc_msgSend(v6, "count"));

  long long v33 = 0u;
  long long v34 = 0u;
  long long v31 = 0u;
  long long v32 = 0u;
  id obj = [(MKTableRow *)self cells];
  uint64_t v7 = [obj countByEnumeratingWithState:&v31 objects:v35 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    int v9 = 0;
    uint64_t v29 = *(void *)v32;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v32 != v29) {
          objc_enumerationMutation(obj);
        }
        v11 = *(void **)(*((void *)&v31 + 1) + 8 * i);
        if ((int)[v11 columnSpan] < 1)
        {
          int v13 = 0;
        }
        else
        {
          uint64_t v12 = 0;
          int v13 = 0;
          do
          {
            unint64_t v14 = [v4 objectAtIndexedSubscript:v9 + v12];
            v13 += [v14 width];

            ++v12;
          }
          while (v12 < (int)[v11 columnSpan]);
        }
        int v15 = [v11 columnSpan] - 1;
        int v16 = [(MKTableRow *)self divider];
        uint64_t v17 = v13 + v15 * [v16 length];

        v18 = [(MKTableRow *)self formattedValueForCell:v11];
        uint64_t v19 = [v11 alignment];
        if (v19)
        {
          if (v19 == 1)
          {
            uint64_t v20 = [v18 padToLength:v17 withString:@" "];
          }
          else
          {
            if (v19 != 2) {
              goto LABEL_18;
            }
            uint64_t v20 = [v18 padLeftToLength:v17 withString:@" "];
          }
        }
        else
        {
          uint64_t v20 = [v18 padRightToLength:v17 withString:@" "];
        }
        uint64_t v21 = (void *)v20;

        v18 = v21;
LABEL_18:
        [v30 addObject:v18];
        v9 += [v11 columnSpan];
      }
      uint64_t v8 = [obj countByEnumeratingWithState:&v31 objects:v35 count:16];
    }
    while (v8);
  }

  id v22 = objc_alloc_init(MEMORY[0x263F089D8]);
  uint64_t v23 = [(MKTableRow *)self divider];
  [v22 appendString:v23];

  v24 = [(MKTableRow *)self divider];
  long long v25 = [v30 componentsJoinedByString:v24];
  [v22 appendString:v25];

  long long v26 = [(MKTableRow *)self divider];
  [v22 appendString:v26];

  return v22;
}

- (id)csvRepresentation
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  id v3 = objc_alloc(MEMORY[0x263EFF980]);
  id v4 = [(MKTableRow *)self cells];
  id v5 = objc_msgSend(v3, "initWithCapacity:", objc_msgSend(v4, "count"));

  long long v19 = 0u;
  long long v20 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  uint64_t v6 = [(MKTableRow *)self cells];
  uint64_t v7 = [v6 countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v18;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v18 != v9) {
          objc_enumerationMutation(v6);
        }
        v11 = *(void **)(*((void *)&v17 + 1) + 8 * i);
        uint64_t v12 = [(MKTableRow *)self csvSafeValueForCell:v11];
        [v5 addObject:v12];

        if ((int)[v11 columnSpan] >= 2)
        {
          int v13 = 1;
          do
          {
            unint64_t v14 = [NSString string];
            [v5 addObject:v14];

            ++v13;
          }
          while (v13 < (int)[v11 columnSpan]);
        }
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v17 objects:v21 count:16];
    }
    while (v8);
  }

  int v15 = [v5 componentsJoinedByString:@","];

  return v15;
}

- (id)csvSafeValueForCell:(id)a3
{
  id v3 = [a3 value];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v4 = [v3 stringByReplacingOccurrencesOfString:@"\" withString:@"\"\"];
    id v5 = [v4 stringByReplacingOccurrencesOfString:@"\n" withString:@" "];

    if ([v5 containsString:@","])
    {
      uint64_t v6 = [NSString stringWithFormat:@"\"%@\"", v5];

      id v5 = (void *)v6;
    }
  }
  else
  {
    id v5 = [NSString stringWithFormat:@"%@", v3];
  }

  return v5;
}

- (int)totalWidthOfColumns:(id)a3
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  id v4 = a3;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  uint64_t v5 = [v4 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    int v7 = 0;
    uint64_t v8 = *(void *)v15;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v15 != v8) {
          objc_enumerationMutation(v4);
        }
        v7 += [*(id *)(*((void *)&v14 + 1) + 8 * i) width];
      }
      uint64_t v6 = [v4 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v6);
  }
  else
  {
    int v7 = 0;
  }
  int v10 = [v4 count];
  v11 = [(MKTableRow *)self divider];
  int v12 = [v11 length];

  return v7 + v12 + v12 * v10;
}

- (int64_t)totalColumns
{
  return self->_totalColumns;
}

- (void)setTotalColumns:(int64_t)a3
{
  self->_totalColumns = a3;
}

- (NSArray)cells
{
  return self->_cells;
}

- (void)setCells:(id)a3
{
}

- (NSString)divider
{
  return self->_divider;
}

- (void)setDivider:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_divider, 0);
  objc_storeStrong((id *)&self->_cells, 0);
}

@end