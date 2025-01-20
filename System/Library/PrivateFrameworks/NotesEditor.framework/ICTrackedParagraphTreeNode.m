@interface ICTrackedParagraphTreeNode
+ (id)nodeFromTrackedParagraph:(id)a3 textView:(id)a4;
+ (id)placeholderNodeWithIndentation:(unint64_t)a3;
- (BOOL)checked;
- (ICTrackedParagraph)trackedParagraph;
- (ICTrackedParagraphTreeNode)parent;
- (NSMutableArray)children;
- (NSString)recurisiveDescription;
- (NSString)string;
- (id)description;
- (id)linerizedRepresentation;
- (int64_t)indent;
- (void)addChild:(id)a3;
- (void)recursivlyAddDescriptionToString:(id)a3;
- (void)recursivlyAddTrackedParagraphsToArray:(id)a3;
- (void)recursivlySortCheckedItemsToBottom;
- (void)setChecked:(BOOL)a3;
- (void)setChildren:(id)a3;
- (void)setIndent:(int64_t)a3;
- (void)setParent:(id)a3;
- (void)setString:(id)a3;
- (void)setTrackedParagraph:(id)a3;
@end

@implementation ICTrackedParagraphTreeNode

+ (id)nodeFromTrackedParagraph:(id)a3 textView:(id)a4
{
  id v4 = a3;
  v5 = objc_alloc_init(ICTrackedParagraphTreeNode);
  [(ICTrackedParagraphTreeNode *)v5 setTrackedParagraph:v4];
  v6 = [v4 paragraph];
  -[ICTrackedParagraphTreeNode setIndent:](v5, "setIndent:", [v6 indent]);

  v7 = [v4 paragraph];

  v8 = [v7 todo];
  -[ICTrackedParagraphTreeNode setChecked:](v5, "setChecked:", [v8 done]);

  return v5;
}

+ (id)placeholderNodeWithIndentation:(unint64_t)a3
{
  id v4 = objc_alloc_init(ICTrackedParagraphTreeNode);
  [(ICTrackedParagraphTreeNode *)v4 setIndent:a3];

  return v4;
}

- (void)addChild:(id)a3
{
  id v4 = a3;
  v5 = [(ICTrackedParagraphTreeNode *)self children];

  if (!v5)
  {
    id v6 = objc_alloc_init(MEMORY[0x263EFF980]);
    [(ICTrackedParagraphTreeNode *)self setChildren:v6];
  }
  [v4 setParent:self];
  id v7 = [(ICTrackedParagraphTreeNode *)self children];
  [v7 addObject:v4];
}

- (void)recursivlySortCheckedItemsToBottom
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  v2 = [(ICTrackedParagraphTreeNode *)self children];
  if ((unint64_t)[v2 count] >= 2)
  {
    v3 = objc_msgSend(v2, "ic_objectsPassingTest:", &__block_literal_global_212);
    [v2 removeObjectsInArray:v3];
    [v2 addObjectsFromArray:v3];
  }
  long long v11 = 0u;
  long long v12 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  id v4 = v2;
  uint64_t v5 = [v4 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v10;
    do
    {
      uint64_t v8 = 0;
      do
      {
        if (*(void *)v10 != v7) {
          objc_enumerationMutation(v4);
        }
        objc_msgSend(*(id *)(*((void *)&v9 + 1) + 8 * v8++), "recursivlySortCheckedItemsToBottom", (void)v9);
      }
      while (v6 != v8);
      uint64_t v6 = [v4 countByEnumeratingWithState:&v9 objects:v13 count:16];
    }
    while (v6);
  }
}

uint64_t __64__ICTrackedParagraphTreeNode_recursivlySortCheckedItemsToBottom__block_invoke(uint64_t a1, void *a2)
{
  return [a2 checked];
}

- (id)linerizedRepresentation
{
  id v3 = objc_alloc_init(MEMORY[0x263EFF980]);
  [(ICTrackedParagraphTreeNode *)self recursivlyAddTrackedParagraphsToArray:v3];

  return v3;
}

- (void)recursivlyAddTrackedParagraphsToArray:(id)a3
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  id v4 = a3;
  uint64_t v5 = [(ICTrackedParagraphTreeNode *)self trackedParagraph];
  objc_msgSend(v4, "ic_addNonNilObject:", v5);

  long long v13 = 0u;
  long long v14 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  uint64_t v6 = [(ICTrackedParagraphTreeNode *)self children];
  uint64_t v7 = [v6 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v12;
    do
    {
      uint64_t v10 = 0;
      do
      {
        if (*(void *)v12 != v9) {
          objc_enumerationMutation(v6);
        }
        [*(id *)(*((void *)&v11 + 1) + 8 * v10++) recursivlyAddTrackedParagraphsToArray:v4];
      }
      while (v8 != v10);
      uint64_t v8 = [v6 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v8);
  }
}

- (NSString)recurisiveDescription
{
  id v3 = (void *)[&stru_26C10E100 mutableCopy];
  [(ICTrackedParagraphTreeNode *)self recursivlyAddDescriptionToString:v3];

  return (NSString *)v3;
}

- (void)recursivlyAddDescriptionToString:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(ICTrackedParagraphTreeNode *)self description];
  [v4 appendString:v5];

  uint64_t v6 = [(ICTrackedParagraphTreeNode *)self children];
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __63__ICTrackedParagraphTreeNode_recursivlyAddDescriptionToString___block_invoke;
  v8[3] = &unk_2640BB1C8;
  id v9 = v4;
  id v7 = v4;
  [v6 enumerateObjectsUsingBlock:v8];
}

uint64_t __63__ICTrackedParagraphTreeNode_recursivlyAddDescriptionToString___block_invoke(uint64_t a1, void *a2)
{
  return [a2 recursivlyAddDescriptionToString:*(void *)(a1 + 32)];
}

- (id)description
{
  id v3 = (void *)[&stru_26C10E100 mutableCopy];
  if ([(ICTrackedParagraphTreeNode *)self indent] >= 1)
  {
    int64_t v4 = 0;
    do
    {
      [v3 appendString:@"\t"];
      ++v4;
    }
    while ([(ICTrackedParagraphTreeNode *)self indent] > v4);
  }
  uint64_t v5 = [(ICTrackedParagraphTreeNode *)self trackedParagraph];

  if (v5)
  {
    uint64_t v6 = [(ICTrackedParagraphTreeNode *)self string];
    [v3 appendString:v6];
  }
  else
  {
    objc_msgSend(v3, "appendFormat:", @"[placeholder(%d)]\n", -[ICTrackedParagraphTreeNode indent](self, "indent"));
  }

  return v3;
}

- (ICTrackedParagraph)trackedParagraph
{
  return self->_trackedParagraph;
}

- (void)setTrackedParagraph:(id)a3
{
}

- (NSMutableArray)children
{
  return self->_children;
}

- (void)setChildren:(id)a3
{
}

- (ICTrackedParagraphTreeNode)parent
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_parent);

  return (ICTrackedParagraphTreeNode *)WeakRetained;
}

- (void)setParent:(id)a3
{
}

- (BOOL)checked
{
  return self->_checked;
}

- (void)setChecked:(BOOL)a3
{
  self->_checked = a3;
}

- (int64_t)indent
{
  return self->_indent;
}

- (void)setIndent:(int64_t)a3
{
  self->_indent = a3;
}

- (NSString)string
{
  return self->_string;
}

- (void)setString:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_string, 0);
  objc_destroyWeak((id *)&self->_parent);
  objc_storeStrong((id *)&self->_children, 0);

  objc_storeStrong((id *)&self->_trackedParagraph, 0);
}

@end