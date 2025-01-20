@interface VMUDominatesGraphEnumerator
- (VMUDominatesGraphEnumerator)initWithGraph:(id)a3 dominatorGraph:(id)a4;
- (id)statusDisplayDescription;
- (void)enumerateEdgesOfNode:(unsigned int)a3 withBlock:(id)a4;
@end

@implementation VMUDominatesGraphEnumerator

- (VMUDominatesGraphEnumerator)initWithGraph:(id)a3 dominatorGraph:(id)a4
{
  v6 = (VMUDominatorGraph *)a4;
  v10.receiver = self;
  v10.super_class = (Class)VMUDominatesGraphEnumerator;
  v7 = [(VMUGraphEnumerator *)&v10 initWithGraph:a3];
  dominatorGraph = v7->_dominatorGraph;
  v7->_dominatorGraph = v6;

  return v7;
}

- (void)enumerateEdgesOfNode:(unsigned int)a3 withBlock:(id)a4
{
  uint64_t v4 = *(void *)&a3;
  id v6 = a4;
  dominatorGraph = self->_dominatorGraph;
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __62__VMUDominatesGraphEnumerator_enumerateEdgesOfNode_withBlock___block_invoke;
  v9[3] = &unk_1E5D23D08;
  id v10 = v6;
  int v11 = v4;
  id v8 = v6;
  [(VMUDominatorGraph *)dominatorGraph enumerateDirectDomineesForNodeName:v4 withBlock:v9];
}

uint64_t __62__VMUDominatesGraphEnumerator_enumerateEdgesOfNode_withBlock___block_invoke(uint64_t a1, uint64_t a2)
{
  char v3 = 0;
  return (*(uint64_t (**)(void, uint64_t, void, uint64_t, char *))(*(void *)(a1 + 32) + 16))(*(void *)(a1 + 32), 0xFFFFFFFFLL, *(unsigned int *)(a1 + 40), a2, &v3);
}

- (id)statusDisplayDescription
{
  return @"owns";
}

- (void).cxx_destruct
{
}

@end