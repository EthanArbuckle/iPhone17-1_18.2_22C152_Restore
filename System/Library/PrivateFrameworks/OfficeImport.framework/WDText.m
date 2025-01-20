@interface WDText
- (BOOL)isEmpty;
- (WDDocument)document;
- (WDTableCell)tableCell;
- (WDText)initWithDocument:(id)a3 textType:(int)a4;
- (WDText)initWithDocument:(id)a3 textType:(int)a4 tableCell:(id)a5;
- (id)addParagraph;
- (id)addParagraphAtIndex:(int)a3;
- (id)addTable;
- (id)addTableAtIndex:(int)a3;
- (id)blockAt:(unint64_t)a3;
- (id)blockIterator;
- (id)blocks;
- (id)content;
- (id)description;
- (id)firstParagraph;
- (id)lastBlock;
- (id)newBlockIterator;
- (id)newRunIterator;
- (id)paragraphs;
- (id)runIterator;
- (int)tableNestingLevel;
- (int)textType;
- (unint64_t)blockCount;
- (unint64_t)indexOfBlock:(id)a3;
- (void)addBlock:(id)a3;
- (void)removeLastBlock;
- (void)removeLastCharacter:(unsigned __int16)a3;
@end

@implementation WDText

- (WDText)initWithDocument:(id)a3 textType:(int)a4
{
  return [(WDText *)self initWithDocument:a3 textType:*(void *)&a4 tableCell:0];
}

- (WDText)initWithDocument:(id)a3 textType:(int)a4 tableCell:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  v15.receiver = self;
  v15.super_class = (Class)WDText;
  v10 = [(WDText *)&v15 init];
  v11 = v10;
  if (v10)
  {
    objc_storeWeak((id *)&v10->mDocument, v8);
    v11->mTextType = a4;
    objc_storeWeak((id *)&v11->mTableCell, v9);
    v12 = (NSMutableArray *)objc_alloc_init(MEMORY[0x263EFF980]);
    mBlocks = v11->mBlocks;
    v11->mBlocks = v12;
  }
  return v11;
}

- (int)tableNestingLevel
{
  p_mTableCell = &self->mTableCell;
  id WeakRetained = objc_loadWeakRetained((id *)&self->mTableCell);

  if (!WeakRetained) {
    return 1;
  }
  if ([(WDText *)self textType] == 4)
  {
    id v5 = objc_loadWeakRetained((id *)p_mTableCell);
    v6 = [v5 text];
    int v7 = [v6 textType];

    if (v7 != 4) {
      return 1;
    }
  }
  id v8 = objc_loadWeakRetained((id *)p_mTableCell);
  id v9 = [v8 row];
  v10 = [v9 table];
  int v11 = [v10 nestingLevel] + 1;

  return v11;
}

- (int)textType
{
  return self->mTextType;
}

- (id)addParagraph
{
  v3 = [[WDParagraph alloc] initWithText:self];
  [(NSMutableArray *)self->mBlocks addObject:v3];
  return v3;
}

- (WDDocument)document
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->mDocument);
  return (WDDocument *)WeakRetained;
}

- (id)addTable
{
  v3 = [[WDTable alloc] initWithText:self];
  [(NSMutableArray *)self->mBlocks addObject:v3];
  return v3;
}

- (WDTableCell)tableCell
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->mTableCell);
  return (WDTableCell *)WeakRetained;
}

- (void)removeLastCharacter:(unsigned __int16)a3
{
  uint64_t v3 = a3;
  uint64_t v5 = [(NSMutableArray *)self->mBlocks count];
  if (v5)
  {
    id v7 = [(NSMutableArray *)self->mBlocks objectAtIndex:v5 - 1];
    if (![v7 blockType])
    {
      id v6 = v7;
      [v6 removeLastCharacter:v3];
      if (![v6 runCount]) {
        [(NSMutableArray *)self->mBlocks removeLastObject];
      }
    }
  }
}

- (unint64_t)blockCount
{
  return [(NSMutableArray *)self->mBlocks count];
}

- (id)blockAt:(unint64_t)a3
{
  return (id)[(NSMutableArray *)self->mBlocks objectAtIndex:a3];
}

- (void)removeLastBlock
{
}

- (id)lastBlock
{
  return (id)[(NSMutableArray *)self->mBlocks lastObject];
}

- (id)blocks
{
  return self->mBlocks;
}

- (unint64_t)indexOfBlock:(id)a3
{
  return [(NSMutableArray *)self->mBlocks indexOfObjectIdenticalTo:a3];
}

- (void)addBlock:(id)a3
{
}

- (id)addParagraphAtIndex:(int)a3
{
  uint64_t v5 = [[WDParagraph alloc] initWithText:self];
  [(NSMutableArray *)self->mBlocks insertObject:v5 atIndex:a3];
  return v5;
}

- (id)firstParagraph
{
  uint64_t v6 = 0;
  id v7 = &v6;
  uint64_t v8 = 0x3032000000;
  id v9 = __Block_byref_object_copy__23;
  v10 = __Block_byref_object_dispose__23;
  id v11 = 0;
  mBlocks = self->mBlocks;
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __24__WDText_firstParagraph__block_invoke;
  v5[3] = &unk_264D61338;
  v5[4] = &v6;
  [(NSMutableArray *)mBlocks enumerateObjectsUsingBlock:v5];
  id v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return v3;
}

void __24__WDText_firstParagraph__block_invoke(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  id v13 = a2;
  uint64_t v6 = objc_opt_class();
  id v7 = TSUDynamicCast(v6, (uint64_t)v13);
  uint64_t v8 = v7;
  if (v7 && ![v7 blockType])
  {
    uint64_t v9 = objc_opt_class();
    uint64_t v10 = TSUDynamicCast(v9, (uint64_t)v8);
    uint64_t v11 = *(void *)(*(void *)(a1 + 32) + 8);
    v12 = *(void **)(v11 + 40);
    *(void *)(v11 + 40) = v10;

    *a4 = 1;
  }
}

- (id)paragraphs
{
  id v3 = [MEMORY[0x263EFF980] array];
  mBlocks = self->mBlocks;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __20__WDText_paragraphs__block_invoke;
  v7[3] = &unk_264D683B8;
  id v5 = v3;
  id v8 = v5;
  [(NSMutableArray *)mBlocks enumerateObjectsUsingBlock:v7];

  return v5;
}

void __20__WDText_paragraphs__block_invoke(uint64_t a1, void *a2)
{
  id v8 = a2;
  uint64_t v3 = objc_opt_class();
  v4 = TSUDynamicCast(v3, (uint64_t)v8);
  id v5 = v4;
  if (v4 && ![v4 blockType])
  {
    uint64_t v6 = objc_opt_class();
    id v7 = TSUDynamicCast(v6, (uint64_t)v5);
    if (v7) {
      [*(id *)(a1 + 32) addObject:v7];
    }
  }
}

- (id)addTableAtIndex:(int)a3
{
  id v5 = [[WDTable alloc] initWithText:self];
  [(NSMutableArray *)self->mBlocks insertObject:v5 atIndex:a3];
  return v5;
}

- (id)blockIterator
{
  v2 = [[WDArrayIterator alloc] initWithArray:self->mBlocks];
  return v2;
}

- (id)newBlockIterator
{
  uint64_t v3 = [WDArrayIterator alloc];
  mBlocks = self->mBlocks;
  return [(WDArrayIterator *)v3 initWithArray:mBlocks];
}

- (id)runIterator
{
  uint64_t v3 = [WDBlockRunIterator alloc];
  v4 = [(WDText *)self blockIterator];
  id v5 = [(WDCombinedIterator *)v3 initWithParentIterator:v4];

  return v5;
}

- (id)newRunIterator
{
  id v2 = [(WDText *)self newBlockIterator];
  uint64_t v3 = [(WDCombinedIterator *)[WDBlockRunIterator alloc] initWithParentIterator:v2];

  return v3;
}

- (BOOL)isEmpty
{
  if (![(NSMutableArray *)self->mBlocks count]) {
    return 1;
  }
  uint64_t v3 = 0;
  unsigned int v4 = 1;
  do
  {
    id v5 = [(NSMutableArray *)self->mBlocks objectAtIndex:v3];
    char v6 = [v5 isEmpty];

    if ((v6 & 1) == 0) {
      break;
    }
    uint64_t v3 = v4;
  }
  while ([(NSMutableArray *)self->mBlocks count] > (unint64_t)v4++);
  return v6;
}

- (id)content
{
  uint64_t v3 = [MEMORY[0x263F089D8] string];
  id v4 = [(WDText *)self newRunIterator];
  while ([v4 hasNext])
  {
    id v5 = [v4 next];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      char v6 = [v5 string];
      [v3 appendString:v6];
    }
  }

  return v3;
}

- (id)description
{
  v4.receiver = self;
  v4.super_class = (Class)WDText;
  id v2 = [(WDText *)&v4 description];
  return v2;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->mTableCell);
  objc_destroyWeak((id *)&self->mDocument);
  objc_storeStrong((id *)&self->mBlocks, 0);
}

@end