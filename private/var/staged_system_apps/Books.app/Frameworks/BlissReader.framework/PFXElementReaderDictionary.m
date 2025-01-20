@interface PFXElementReaderDictionary
- (PFXElementReaderDictionary)init;
- (PFXElementReaderDictionary)initWithFallThroughAllowed:(BOOL)a3;
- (id).cxx_construct;
- (id)elementInfoForElementName:(const char *)a3 elementNamespace:(const char *)a4;
- (id)p_elementInfoForElementName:(const char *)a3 elementNamespace:(const char *)a4;
- (void)addEntryWithElementName:(const char *)a3 elementNamespace:(const char *)a4 mappingClass:(Class)a5;
- (void)addEntryWithElementName:(const char *)a3 mappingClass:(Class)a4;
- (void)dealloc;
@end

@implementation PFXElementReaderDictionary

- (PFXElementReaderDictionary)init
{
  return 0;
}

- (PFXElementReaderDictionary)initWithFallThroughAllowed:(BOOL)a3
{
  v5.receiver = self;
  v5.super_class = (Class)PFXElementReaderDictionary;
  result = [(PFXElementReaderDictionary *)&v5 init];
  if (result) {
    result->mAllowFallThrough = a3;
  }
  return result;
}

- (void)dealloc
{
  begin_node = (PFXElementReaderDictionary *)self->mMap.__tree_.__begin_node_;
  p_pair1 = &self->mMap.__tree_.__pair1_;
  if (begin_node != (PFXElementReaderDictionary *)&self->mMap.__tree_.__pair1_)
  {
    do
    {
      uint64_t isa = (uint64_t)begin_node[1].super.isa;
      if (isa)
      {
        sub_1EE57C(isa);
        operator delete();
      }
      v6 = (PFXElementReaderDictionary *)begin_node->mMap.__tree_.__begin_node_;
      if (v6)
      {
        do
        {
          left = v6;
          v6 = (PFXElementReaderDictionary *)v6->super.isa;
        }
        while (v6);
      }
      else
      {
        do
        {
          left = (PFXElementReaderDictionary *)begin_node->mMap.__tree_.__pair1_.__value_.__left_;
          BOOL v8 = left->super.isa == (Class)begin_node;
          begin_node = left;
        }
        while (!v8);
      }
      begin_node = left;
    }
    while (left != (PFXElementReaderDictionary *)p_pair1);
  }
  v9.receiver = self;
  v9.super_class = (Class)PFXElementReaderDictionary;
  [(PFXElementReaderDictionary *)&v9 dealloc];
}

- (void)addEntryWithElementName:(const char *)a3 mappingClass:(Class)a4
{
}

- (void)addEntryWithElementName:(const char *)a3 elementNamespace:(const char *)a4 mappingClass:(Class)a5
{
  v13 = (const xmlChar *)a3;
  if (a5)
  {
    v7 = [[PFXElementReaderInfo alloc] initWithElementName:a3 elementNamespace:a4 mappingClass:a5];
    BOOL v8 = (PFXElementReaderDictionary *)sub_1EE660((uint64_t)&self->mMap, &v13);
    if (&self->mMap.__tree_.__pair1_ == (__compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<const unsigned char *, PFXElementReaderInfoGroup *>, void *>>> *)v8) {
      operator new();
    }
    objc_super v9 = v8;
    Class isa = v8[1].super.isa;
    uint64_t v11 = *((void *)isa + 1);
    if (v11)
    {
      uint64_t v12 = *((void *)isa + 1);
      while (1)
      {
        uint64_t v12 = *(void *)(v12 + 8);
        if (v12 == v11) {
          break;
        }
        if (xmlStrEqual((const xmlChar *)a4, (const xmlChar *)[*(id *)(v12 + 16) elementNamespace])) {
          goto LABEL_10;
        }
      }
    }
    sub_1EE24C((void *)v9[1].super.isa, v7);
LABEL_10:
  }
}

- (id)p_elementInfoForElementName:(const char *)a3 elementNamespace:(const char *)a4
{
  uint64_t v12 = (const xmlChar *)a3;
  v6 = (PFXElementReaderDictionary *)sub_1EE660((uint64_t)&self->mMap, &v12);
  if (&self->mMap.__tree_.__pair1_ == (__compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<const unsigned char *, PFXElementReaderInfoGroup *>, void *>>> *)v6) {
    return 0;
  }
  Class isa = v6[1].super.isa;
  id v8 = *(id *)isa;
  if (!*(void *)isa
    || !xmlStrEqual((const xmlChar *)a4, (const xmlChar *)[*(id *)isa elementNamespace]))
  {
    uint64_t v9 = *((void *)isa + 1);
    if (v9)
    {
      uint64_t v10 = v9;
      while (1)
      {
        uint64_t v10 = *(void *)(v10 + 8);
        if (v10 == v9) {
          break;
        }
        id v8 = *(id *)(v10 + 16);
        if (xmlStrEqual((const xmlChar *)a4, (const xmlChar *)[v8 elementNamespace])) {
          return v8;
        }
      }
    }
    return 0;
  }
  return v8;
}

- (id)elementInfoForElementName:(const char *)a3 elementNamespace:(const char *)a4
{
  objc_sync_enter(self);
  id v7 = [(PFXElementReaderDictionary *)self p_elementInfoForElementName:a3 elementNamespace:a4];
  if (!v7)
  {
    if (self->mAllowFallThrough)
    {
      [(PFXElementReaderDictionary *)self addEntryWithElementName:a3 elementNamespace:a4 mappingClass:objc_opt_class()];
      id v7 = [(PFXElementReaderDictionary *)self p_elementInfoForElementName:a3 elementNamespace:a4];
    }
    else
    {
      id v7 = 0;
    }
  }
  objc_sync_exit(self);
  return v7;
}

- (void).cxx_destruct
{
}

- (id).cxx_construct
{
  *((void *)self + 3) = 0;
  *((void *)self + 2) = 0;
  *((void *)self + 1) = (char *)self + 16;
  return self;
}

@end