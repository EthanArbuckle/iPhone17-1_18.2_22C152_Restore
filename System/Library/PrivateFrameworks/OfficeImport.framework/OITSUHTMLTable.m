@interface OITSUHTMLTable
+ (id)_attributesStringFromAttributes:(id)a3;
+ (id)_keyForCell:(unint64_t)a3 :(unint64_t)a4;
+ (id)htmlTable;
- (OITSUHTMLTable)init;
- (id)markup;
- (unint64_t)count;
- (unint64_t)indexOfColumnWithTitle:(id)a3;
- (unint64_t)lastRowIndex;
- (unint64_t)rowClassStride;
- (void)addRowWithCellMarkup:(id)a3;
- (void)addRowWithCellText:(id)a3;
- (void)dealloc;
- (void)deleteColumnWithTitle:(id)a3;
- (void)enumerateRowsUsingBlock:(id)a3;
- (void)setCellAttributes:(id)a3 rowIndex:(unint64_t)a4 columnIndex:(unint64_t)a5;
- (void)setCellMarkup:(id)a3 atRowIndex:(unint64_t)a4 columnIndex:(unint64_t)a5;
- (void)setClass:(id)a3 ofColumnIndex:(unint64_t)a4;
- (void)setColumnClasses:(id)a3;
- (void)setColumnHeaders:(id)a3;
- (void)setRowClass:(id)a3 atRowIndex:(unint64_t)a4;
- (void)setRowClassStride:(unint64_t)a3;
@end

@implementation OITSUHTMLTable

+ (id)htmlTable
{
  id v2 = objc_alloc_init((Class)objc_opt_class());
  return v2;
}

- (OITSUHTMLTable)init
{
  v4.receiver = self;
  v4.super_class = (Class)OITSUHTMLTable;
  id v2 = [(OITSUHTMLTable *)&v4 init];
  if (v2)
  {
    v2->_columnAttributes = (NSMutableDictionary *)objc_opt_new();
    v2->_cellAttributes = (NSMutableDictionary *)objc_opt_new();
    v2->_rowClasses = (NSMutableDictionary *)objc_opt_new();
    v2->_columnHeaders = (NSMutableArray *)objc_opt_new();
    v2->_rows = (NSMutableArray *)objc_opt_new();
    v2->_rowClassStride = 1;
  }
  return v2;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)OITSUHTMLTable;
  [(OITSUHTMLTable *)&v3 dealloc];
}

- (unint64_t)count
{
  return [(NSMutableArray *)self->_rows count];
}

- (unint64_t)lastRowIndex
{
  return [(NSMutableArray *)self->_rows count] - 1;
}

+ (id)_keyForCell:(unint64_t)a3 :(unint64_t)a4
{
  return (id)objc_msgSend(NSString, "stringWithFormat:", @"%tu,%tu", a3, a4);
}

+ (id)_attributesStringFromAttributes:(id)a3
{
  objc_super v4 = (void *)[MEMORY[0x263F089D8] string];
  if ([a3 count])
  {
    v6[0] = MEMORY[0x263EF8330];
    v6[1] = 3221225472;
    v6[2] = __50__OITSUHTMLTable__attributesStringFromAttributes___block_invoke;
    v6[3] = &unk_264D60E28;
    v6[4] = v4;
    [a3 enumerateKeysAndObjectsUsingBlock:v6];
  }
  return v4;
}

uint64_t __50__OITSUHTMLTable__attributesStringFromAttributes___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return [*(id *)(a1 + 32) appendFormat:@" %@='%@'", a2, a3];
}

- (id)markup
{
  uint64_t v47 = *MEMORY[0x263EF8340];
  objc_super v3 = (void *)[MEMORY[0x263F089D8] string];
  context = (void *)MEMORY[0x23EC9A170]();
  [v3 appendFormat:@"<table>\n"];
  if ([(NSMutableArray *)self->_columnHeaders count])
  {
    [v3 appendFormat:@"<thead>\n"];
    [v3 appendFormat:@"<tr class='header'>\n"];
    long long v42 = 0u;
    long long v43 = 0u;
    long long v40 = 0u;
    long long v41 = 0u;
    columnHeaders = self->_columnHeaders;
    uint64_t v5 = [(NSMutableArray *)columnHeaders countByEnumeratingWithState:&v40 objects:v46 count:16];
    if (v5)
    {
      uint64_t v6 = v5;
      uint64_t v7 = *(void *)v41;
      do
      {
        for (uint64_t i = 0; i != v6; ++i)
        {
          if (*(void *)v41 != v7) {
            objc_enumerationMutation(columnHeaders);
          }
          [v3 appendFormat:@"<td>%@</td>", *(void *)(*((void *)&v40 + 1) + 8 * i)];
        }
        uint64_t v6 = [(NSMutableArray *)columnHeaders countByEnumeratingWithState:&v40 objects:v46 count:16];
      }
      while (v6);
    }
    [v3 appendFormat:@"</tr>\n"];
    [v3 appendFormat:@"</thead>\n"];
  }
  long long v38 = 0u;
  long long v39 = 0u;
  long long v36 = 0u;
  long long v37 = 0u;
  obuint64_t j = self->_rows;
  uint64_t v29 = [(NSMutableArray *)obj countByEnumeratingWithState:&v36 objects:v45 count:16];
  if (v29)
  {
    unint64_t v31 = 0;
    uint64_t v28 = *(void *)v37;
    v9 = v3;
    do
    {
      uint64_t v10 = 0;
      do
      {
        if (*(void *)v37 != v28) {
          objc_enumerationMutation(obj);
        }
        v11 = *(void **)(*((void *)&v36 + 1) + 8 * v10);
        v12 = (__CFString *)-[NSMutableDictionary objectForKey:](self->_rowClasses, "objectForKey:", [NSNumber numberWithUnsignedInteger:v31]);
        if (!v12)
        {
          unint64_t rowClassStride = self->_rowClassStride;
          if (rowClassStride)
          {
            if ((v31 / rowClassStride)) {
              v12 = @"b";
            }
            else {
              v12 = @"a";
            }
          }
          else
          {
            v12 = @"a";
          }
        }
        uint64_t v30 = v10;
        [v3 appendFormat:@"<tr class='%@'>", v12];
        long long v34 = 0u;
        long long v35 = 0u;
        long long v32 = 0u;
        long long v33 = 0u;
        uint64_t v14 = [v11 countByEnumeratingWithState:&v32 objects:v44 count:16];
        if (v14)
        {
          uint64_t v15 = v14;
          uint64_t v16 = 0;
          uint64_t v17 = *(void *)v33;
          do
          {
            for (uint64_t j = 0; j != v15; ++j)
            {
              if (*(void *)v33 != v17) {
                objc_enumerationMutation(v11);
              }
              uint64_t v19 = *(void *)(*((void *)&v32 + 1) + 8 * j);
              v20 = (void *)-[NSMutableDictionary objectForKey:](self->_columnAttributes, "objectForKey:", [NSNumber numberWithUnsignedInteger:v16 + j]);
              if (v20) {
                id v21 = (id)[v20 mutableCopy];
              }
              else {
                id v21 = (id)[MEMORY[0x263EFF9A0] dictionary];
              }
              v22 = v21;
              uint64_t v23 = -[NSMutableDictionary objectForKey:](self->_cellAttributes, "objectForKey:", [(id)objc_opt_class() _keyForCell:v31 :v16 + j]);
              if (v23) {
                [v22 addEntriesFromDictionary:v23];
              }
              uint64_t v24 = [(id)objc_opt_class() _attributesStringFromAttributes:v22];
              objc_super v3 = v9;
              [v9 appendFormat:@"<td%@>%@</td>", v24, v19];
            }
            uint64_t v15 = [v11 countByEnumeratingWithState:&v32 objects:v44 count:16];
            v16 += j;
          }
          while (v15);
        }
        [v3 appendFormat:@"</tr>\n"];
        ++v31;
        uint64_t v10 = v30 + 1;
      }
      while (v30 + 1 != v29);
      uint64_t v29 = [(NSMutableArray *)obj countByEnumeratingWithState:&v36 objects:v45 count:16];
    }
    while (v29);
  }
  [v3 appendFormat:@"</table>\n"];
  return v3;
}

- (void)addRowWithCellMarkup:(id)a3
{
  rows = self->_rows;
  id v4 = (id)[a3 copy];
  [(NSMutableArray *)rows addObject:v4];
}

- (void)addRowWithCellText:(id)a3
{
  uint64_t v4 = objc_msgSend(a3, "tsu_arrayByTransformingWithBlock:", &__block_literal_global_16);
  [(OITSUHTMLTable *)self addRowWithCellMarkup:v4];
}

uint64_t __37__OITSUHTMLTable_addRowWithCellText___block_invoke(uint64_t a1, void *a2)
{
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    objc_super v3 = objc_msgSend(a2, "tsu_arrayByFlattening");
    return [v3 componentsJoinedByString:&stru_26EBF24D8];
  }
  else
  {
    return objc_msgSend(a2, "tsu_escapeXML");
  }
}

- (void)setColumnClasses:(id)a3
{
  if ([a3 count])
  {
    unint64_t v5 = 0;
    do
    {
      -[OITSUHTMLTable setClass:ofColumnIndex:](self, "setClass:ofColumnIndex:", [a3 objectAtIndexedSubscript:v5], v5);
      ++v5;
    }
    while (v5 < [a3 count]);
  }
}

- (void)setRowClass:(id)a3 atRowIndex:(unint64_t)a4
{
  rowClasses = self->_rowClasses;
  uint64_t v6 = [NSNumber numberWithUnsignedInteger:a4];
  [(NSMutableDictionary *)rowClasses setObject:a3 forKey:v6];
}

- (void)setColumnHeaders:(id)a3
{
  if ([a3 count])
  {
    unint64_t v5 = 0;
    do
    {
      -[NSMutableArray setObject:atIndexedSubscript:](self->_columnHeaders, "setObject:atIndexedSubscript:", [a3 objectAtIndexedSubscript:v5], v5);
      ++v5;
    }
    while (v5 < [a3 count]);
  }
}

- (void)setClass:(id)a3 ofColumnIndex:(unint64_t)a4
{
  v7[1] = *MEMORY[0x263EF8340];
  id v5 = -[NSMutableDictionary tsu_objectForKey:withDefaultOfClass:](self->_columnAttributes, "tsu_objectForKey:withDefaultOfClass:", [NSNumber numberWithUnsignedInteger:a4], objc_opt_class());
  uint64_t v6 = @"class";
  v7[0] = a3;
  objc_msgSend(v5, "addEntriesFromDictionary:", objc_msgSend(NSDictionary, "dictionaryWithObjects:forKeys:count:", v7, &v6, 1));
}

- (void)setCellMarkup:(id)a3 atRowIndex:(unint64_t)a4 columnIndex:(unint64_t)a5
{
  id v9 = (id)objc_msgSend((id)-[NSMutableArray objectAtIndexedSubscript:](self->_rows, "objectAtIndexedSubscript:", a4), "mutableCopy");
  [v9 setObject:a3 atIndexedSubscript:a5];
  rows = self->_rows;
  [(NSMutableArray *)rows setObject:v9 atIndexedSubscript:a4];
}

- (void)setCellAttributes:(id)a3 rowIndex:(unint64_t)a4 columnIndex:(unint64_t)a5
{
  cellAttributes = self->_cellAttributes;
  uint64_t v7 = [(id)objc_opt_class() _keyForCell:a4 :a5];
  [(NSMutableDictionary *)cellAttributes setObject:a3 forKey:v7];
}

- (void)enumerateRowsUsingBlock:(id)a3
{
  rows = self->_rows;
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __42__OITSUHTMLTable_enumerateRowsUsingBlock___block_invoke;
  v4[3] = &unk_264D611D8;
  v4[4] = a3;
  [(NSMutableArray *)rows enumerateObjectsUsingBlock:v4];
}

uint64_t __42__OITSUHTMLTable_enumerateRowsUsingBlock___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (unint64_t)indexOfColumnWithTitle:(id)a3
{
  if (![(NSMutableArray *)self->_columnHeaders count]) {
    return 0x7FFFFFFFFFFFFFFFLL;
  }
  unint64_t v5 = 0;
  while ((objc_msgSend((id)-[NSMutableArray objectAtIndexedSubscript:](self->_columnHeaders, "objectAtIndexedSubscript:", v5), "isEqualToString:", a3) & 1) == 0)
  {
    if (++v5 >= [(NSMutableArray *)self->_columnHeaders count]) {
      return 0x7FFFFFFFFFFFFFFFLL;
    }
  }
  return v5;
}

- (void)deleteColumnWithTitle:(id)a3
{
  unint64_t v4 = [(OITSUHTMLTable *)self indexOfColumnWithTitle:a3];
  if (v4 != 0x7FFFFFFFFFFFFFFFLL)
  {
    unint64_t v5 = v4;
    [(NSMutableArray *)self->_columnHeaders removeObjectAtIndex:v4];
    uint64_t v6 = [(NSMutableArray *)self->_rows count];
    if (v6)
    {
      uint64_t v7 = v6;
      for (uint64_t i = 0; i != v7; ++i)
      {
        id v9 = (id)objc_msgSend((id)-[NSMutableArray objectAtIndexedSubscript:](self->_rows, "objectAtIndexedSubscript:", i), "mutableCopy");
        [v9 removeObjectAtIndex:v5];
        [(NSMutableArray *)self->_rows setObject:v9 atIndexedSubscript:i];
      }
    }
  }
}

- (unint64_t)rowClassStride
{
  return self->_rowClassStride;
}

- (void)setRowClassStride:(unint64_t)a3
{
  self->_unint64_t rowClassStride = a3;
}

@end