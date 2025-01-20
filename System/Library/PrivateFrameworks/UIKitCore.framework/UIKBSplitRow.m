@interface UIKBSplitRow
- (CGSize)defaultKeySize;
- (NSDictionary)hints;
- (NSMutableArray)keys;
- (UIKBSplitRow)init;
- (double)rowOffset;
- (double)rowWidth;
- (id)description;
- (id)keyAtIndex:(int)a3;
- (id)listOfType:(int)a3 left:(BOOL)a4;
- (unsigned)rowIndex;
- (void)addKey:(id)a3;
- (void)dealloc;
- (void)setDefaultKeySize:(CGSize)a3;
- (void)setHints:(id)a3;
- (void)setRowIndex:(unsigned __int8)a3;
- (void)setRowOffset:(double)a3;
- (void)setRowWidth:(double)a3;
@end

@implementation UIKBSplitRow

- (UIKBSplitRow)init
{
  v19.receiver = self;
  v19.super_class = (Class)UIKBSplitRow;
  v2 = [(UIKBSplitRow *)&v19 init];
  if (v2)
  {
    uint64_t v3 = [objc_alloc(MEMORY[0x1E4F1CA48]) initWithCapacity:0];
    keys = v2->_keys;
    v2->_keys = (NSMutableArray *)v3;

    uint64_t v5 = +[UIKBTree treeOfType:7];
    keylistLeft = v2->_keylistLeft;
    v2->_keylistLeft = (UIKBTree *)v5;

    uint64_t v7 = +[UIKBTree treeOfType:7];
    geolistLeft = v2->_geolistLeft;
    v2->_geolistLeft = (UIKBTree *)v7;

    uint64_t v9 = +[UIKBTree treeOfType:7];
    attrlistLeft = v2->_attrlistLeft;
    v2->_attrlistLeft = (UIKBTree *)v9;

    uint64_t v11 = +[UIKBTree treeOfType:7];
    keylistRight = v2->_keylistRight;
    v2->_keylistRight = (UIKBTree *)v11;

    uint64_t v13 = +[UIKBTree treeOfType:7];
    geolistRight = v2->_geolistRight;
    v2->_geolistRight = (UIKBTree *)v13;

    uint64_t v15 = +[UIKBTree treeOfType:7];
    attrlistRight = v2->_attrlistRight;
    v2->_attrlistRight = (UIKBTree *)v15;

    v17 = v2;
  }

  return v2;
}

- (void)dealloc
{
  [(UIKBSplitRow *)self setHints:0];
  v3.receiver = self;
  v3.super_class = (Class)UIKBSplitRow;
  [(UIKBSplitRow *)&v3 dealloc];
}

- (void)addKey:(id)a3
{
  id v4 = a3;
  id v5 = [(UIKBSplitRow *)self keys];
  [v5 addObject:v4];
}

- (void)setRowIndex:(unsigned __int8)a3
{
  self->_rowIndex = a3;
  uint64_t v4 = (a3 + 1);
  [(UIKBTree *)self->_keylistLeft setDisplayRowHint:v4];
  [(UIKBTree *)self->_keylistRight setDisplayRowHint:v4];
  [(UIKBTree *)self->_geolistLeft setDisplayRowHint:v4];
  geolistRight = self->_geolistRight;
  [(UIKBTree *)geolistRight setDisplayRowHint:v4];
}

- (id)keyAtIndex:(int)a3
{
  id v5 = [(UIKBSplitRow *)self keys];
  unint64_t v6 = [v5 count];

  if (v6 <= a3)
  {
    v8 = 0;
  }
  else
  {
    uint64_t v7 = [(UIKBSplitRow *)self keys];
    v8 = [v7 objectAtIndex:a3];
  }
  return v8;
}

- (id)listOfType:(int)a3 left:(BOOL)a4
{
  switch(a3)
  {
    case 2:
      BOOL v5 = !a4;
      uint64_t v6 = 112;
      uint64_t v7 = 88;
      goto LABEL_7;
    case 1:
      BOOL v5 = !a4;
      uint64_t v6 = 104;
      uint64_t v7 = 80;
      goto LABEL_7;
    case 0:
      BOOL v5 = !a4;
      uint64_t v6 = 96;
      uint64_t v7 = 72;
LABEL_7:
      if (!v5) {
        uint64_t v6 = v7;
      }
      id v8 = *(id *)((char *)&self->super.isa + v6);
      return v8;
  }
  id v8 = 0;
  return v8;
}

- (id)description
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  objc_super v3 = objc_msgSend(MEMORY[0x1E4F28E78], "stringWithFormat:", @"row : %d\n", -[UIKBSplitRow rowIndex](self, "rowIndex"));
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  uint64_t v4 = [(UIKBSplitRow *)self keys];
  uint64_t v5 = [v4 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v11;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v11 != v7) {
          objc_enumerationMutation(v4);
        }
        [v3 appendFormat:@"%@\n", *(void *)(*((void *)&v10 + 1) + 8 * i)];
      }
      uint64_t v6 = [v4 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v6);
  }

  return v3;
}

- (unsigned)rowIndex
{
  return self->_rowIndex;
}

- (double)rowOffset
{
  return self->_rowOffset;
}

- (void)setRowOffset:(double)a3
{
  self->_rowOffset = a3;
}

- (NSMutableArray)keys
{
  return (NSMutableArray *)objc_getProperty(self, a2, 48, 1);
}

- (double)rowWidth
{
  return self->_rowWidth;
}

- (void)setRowWidth:(double)a3
{
  self->_rowWidth = a3;
}

- (CGSize)defaultKeySize
{
  objc_copyStruct(v4, &self->_defaultKeySize, 16, 1, 0);
  double v2 = *(double *)v4;
  double v3 = *(double *)&v4[1];
  result.height = v3;
  result.width = v2;
  return result;
}

- (void)setDefaultKeySize:(CGSize)a3
{
  CGSize v3 = a3;
  objc_copyStruct(&self->_defaultKeySize, &v3, 16, 1, 0);
}

- (NSDictionary)hints
{
  return (NSDictionary *)objc_getProperty(self, a2, 64, 1);
}

- (void)setHints:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_attrlistRight, 0);
  objc_storeStrong((id *)&self->_geolistRight, 0);
  objc_storeStrong((id *)&self->_keylistRight, 0);
  objc_storeStrong((id *)&self->_attrlistLeft, 0);
  objc_storeStrong((id *)&self->_geolistLeft, 0);
  objc_storeStrong((id *)&self->_keylistLeft, 0);
  objc_storeStrong((id *)&self->_hints, 0);
  objc_storeStrong((id *)&self->_vacancies, 0);
  objc_storeStrong((id *)&self->_keys, 0);
}

@end