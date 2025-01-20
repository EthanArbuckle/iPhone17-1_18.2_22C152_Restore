@interface _UIContextMenuLinkedList
- (NSMutableArray)nodes;
- (_UIContextMenuNode)current;
- (_UIContextMenuNode)first;
- (id)description;
- (id)nodeForMenu:(id)a3;
- (id)popNode;
- (id)removeNode:(id)a3;
- (void)_enumerateNodes:(id)a3 inReverse:(BOOL)a4;
- (void)addNode:(id)a3;
- (void)enumerateNodes:(id)a3;
- (void)reverseEnumerateNodes:(id)a3;
@end

@implementation _UIContextMenuLinkedList

- (_UIContextMenuNode)first
{
  v2 = [(_UIContextMenuLinkedList *)self nodes];
  v3 = [v2 firstObject];

  return (_UIContextMenuNode *)v3;
}

- (_UIContextMenuNode)current
{
  v2 = [(_UIContextMenuLinkedList *)self nodes];
  v3 = [v2 lastObject];

  return (_UIContextMenuNode *)v3;
}

- (void)addNode:(id)a3
{
  id v9 = a3;
  v4 = [(_UIContextMenuLinkedList *)self current];
  [v4 setNext:v9];

  v5 = [(_UIContextMenuLinkedList *)self current];
  [v9 setPrevious:v5];

  if (!self->_nodes)
  {
    v6 = [MEMORY[0x1E4F1CA48] array];
    nodes = self->_nodes;
    self->_nodes = v6;
  }
  v8 = [(_UIContextMenuLinkedList *)self nodes];
  [v8 addObject:v9];
}

- (id)popNode
{
  v3 = [(_UIContextMenuLinkedList *)self current];
  if (v3)
  {
    v4 = [(_UIContextMenuLinkedList *)self nodes];
    v5 = [(_UIContextMenuLinkedList *)self current];
    [v4 removeObject:v5];

    v6 = [(_UIContextMenuLinkedList *)self current];
    [v6 setNext:0];
  }
  return v3;
}

- (id)removeNode:(id)a3
{
  id v4 = a3;
  v5 = [MEMORY[0x1E4F1CA48] array];
  uint64_t v16 = 0;
  v17 = &v16;
  uint64_t v18 = 0x3032000000;
  v19 = __Block_byref_object_copy__18;
  v20 = __Block_byref_object_dispose__18;
  id v21 = 0;
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __39___UIContextMenuLinkedList_removeNode___block_invoke;
  v12[3] = &unk_1E52DE7E8;
  id v6 = v5;
  id v13 = v6;
  id v7 = v4;
  id v14 = v7;
  v15 = &v16;
  [(_UIContextMenuLinkedList *)self reverseEnumerateNodes:v12];
  if (v17[5])
  {
    v8 = [(_UIContextMenuLinkedList *)self nodes];
    [v8 removeObjectsInArray:v6];

    id v9 = [(_UIContextMenuLinkedList *)self current];
    [v9 setNext:0];

    id v10 = v6;
  }
  else
  {
    id v10 = (id)MEMORY[0x1E4F1CBF0];
  }

  _Block_object_dispose(&v16, 8);
  return v10;
}

- (id)nodeForMenu:(id)a3
{
  id v4 = a3;
  uint64_t v11 = 0;
  v12 = &v11;
  uint64_t v13 = 0x3032000000;
  id v14 = __Block_byref_object_copy__18;
  v15 = __Block_byref_object_dispose__18;
  id v16 = 0;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __40___UIContextMenuLinkedList_nodeForMenu___block_invoke;
  v8[3] = &unk_1E52DAA70;
  id v5 = v4;
  id v9 = v5;
  id v10 = &v11;
  [(_UIContextMenuLinkedList *)self reverseEnumerateNodes:v8];
  id v6 = (id)v12[5];

  _Block_object_dispose(&v11, 8);
  return v6;
}

- (void)enumerateNodes:(id)a3
{
}

- (void)reverseEnumerateNodes:(id)a3
{
}

- (void)_enumerateNodes:(id)a3 inReverse:(BOOL)a4
{
  id v6 = (void (**)(id, void *, unsigned char *))a3;
  if (a4) {
    [(_UIContextMenuLinkedList *)self current];
  }
  else {
  id v7 = [(_UIContextMenuLinkedList *)self first];
  }
  char v9 = 0;
  if (v7)
  {
    do
    {
      v6[2](v6, v7, &v9);
      if (a4) {
        [v7 previous];
      }
      else {
      v8 = [v7 next];
      }

      if (!v8) {
        break;
      }
      id v7 = v8;
    }
    while (!v9);
  }
}

- (id)description
{
  uint64_t v12 = 0;
  uint64_t v13 = &v12;
  uint64_t v14 = 0x3032000000;
  v15 = __Block_byref_object_copy__18;
  id v16 = __Block_byref_object_dispose__18;
  v3 = (void *)MEMORY[0x1E4F28E78];
  if (self)
  {
    id v4 = NSString;
    id v5 = self;
    id v6 = (objc_class *)objc_opt_class();
    id v7 = NSStringFromClass(v6);
    v8 = [v4 stringWithFormat:@"<%@: %p>", v7, v5];
  }
  else
  {
    v8 = @"(nil)";
  }
  id v17 = [v3 stringWithString:v8];

  [(id)v13[5] appendString:@" [ "];
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __39___UIContextMenuLinkedList_description__block_invoke;
  v11[3] = &unk_1E52DAA70;
  v11[4] = self;
  v11[5] = &v12;
  [(_UIContextMenuLinkedList *)self enumerateNodes:v11];
  [(id)v13[5] appendString:@" ]"];
  id v9 = (id)v13[5];
  _Block_object_dispose(&v12, 8);

  return v9;
}

- (NSMutableArray)nodes
{
  return self->_nodes;
}

- (void).cxx_destruct
{
}

@end