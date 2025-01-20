@interface PFSPropertySet
- (PFSPropertySet)initWithPropertySet:(id)a3;
- (const)peekAtProperties;
- (id).cxx_construct;
- (id)copyWithZone:(_NSZone *)a3;
- (id)firstValueFromCandidatePropertyNames:(void *)a3 selectedIndex:(unint64_t *)a4;
- (id)valueForProperty:(const char *)a3;
- (void)addPropertyValue:(id)a3 forProperty:(const char *)a4;
- (void)dealloc;
- (void)removeUninheritedProperties;
- (void)removeValueForProperty:(const char *)a3;
- (void)setPropertiesFromPropertySet:(id)a3;
@end

@implementation PFSPropertySet

- (void)removeUninheritedProperties
{
  p_mProperties = (uint64_t **)&self->mProperties;
  p_pair1 = &self->mProperties.__tree_.__pair1_;
  begin_node = (PFSPropertySet *)self->mProperties.__tree_.__begin_node_;
  if (begin_node != (PFSPropertySet *)&self->mProperties.__tree_.__pair1_)
  {
    do
    {
      if (!+[PFXHtmlStylePropertyInfo propertyIsInherited:begin_node[1].super.isa])
      {

        sub_43898(p_mProperties, (uint64_t *)begin_node);
        operator delete(begin_node);
        begin_node = (PFSPropertySet *)*p_mProperties;
      }
      isa = (PFSPropertySet *)begin_node->mProperties.__tree_.__begin_node_;
      if (isa)
      {
        do
        {
          left = isa;
          isa = (PFSPropertySet *)isa->super.isa;
        }
        while (isa);
      }
      else
      {
        do
        {
          left = (PFSPropertySet *)begin_node->mProperties.__tree_.__pair1_.__value_.__left_;
          BOOL v7 = left->super.isa == (Class)begin_node;
          begin_node = left;
        }
        while (!v7);
      }
      begin_node = left;
    }
    while (left != (PFSPropertySet *)p_pair1);
  }
}

- (PFSPropertySet)initWithPropertySet:(id)a3
{
  v14.receiver = self;
  v14.super_class = (Class)PFSPropertySet;
  id v4 = [(PFSPropertySet *)&v14 init];
  if (v4)
  {
    v5 = [a3 peekAtProperties];
    v6 = v5 + 1;
    BOOL v7 = (void *)*v5;
    if ((void *)*v5 != v5 + 1)
    {
      do
      {
        id v8 = (id)v7[5];
        v13 = xmlStrdup((const xmlChar *)v7[4]);
        v15 = &v13;
        sub_1EB8AC((uint64_t **)v4 + 1, (const xmlChar **)&v13, (uint64_t)&std::piecewise_construct, (uint64_t **)&v15)[5] = (uint64_t)v8;
        v9 = (void *)v7[1];
        if (v9)
        {
          do
          {
            v10 = v9;
            v9 = (void *)*v9;
          }
          while (v9);
        }
        else
        {
          do
          {
            v10 = (void *)v7[2];
            BOOL v11 = *v10 == (void)v7;
            BOOL v7 = v10;
          }
          while (!v11);
        }
        BOOL v7 = v10;
      }
      while (v10 != v6);
    }
  }
  return (PFSPropertySet *)v4;
}

- (void)dealloc
{
  begin_node = (PFSPropertySet *)self->mProperties.__tree_.__begin_node_;
  p_pair1 = &self->mProperties.__tree_.__pair1_;
  if (begin_node != (PFSPropertySet *)&self->mProperties.__tree_.__pair1_)
  {
    do
    {
      xmlFree(begin_node[1].super.isa);

      isa = (PFSPropertySet *)begin_node->mProperties.__tree_.__begin_node_;
      if (isa)
      {
        do
        {
          left = isa;
          isa = (PFSPropertySet *)isa->super.isa;
        }
        while (isa);
      }
      else
      {
        do
        {
          left = (PFSPropertySet *)begin_node->mProperties.__tree_.__pair1_.__value_.__left_;
          BOOL v7 = left->super.isa == (Class)begin_node;
          begin_node = left;
        }
        while (!v7);
      }
      begin_node = left;
    }
    while (left != (PFSPropertySet *)p_pair1);
  }
  v8.receiver = self;
  v8.super_class = (Class)PFSPropertySet;
  [(PFSPropertySet *)&v8 dealloc];
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = [(id)objc_opt_class() allocWithZone:a3];

  return [v4 initWithPropertySet:self];
}

- (id)valueForProperty:(const char *)a3
{
  v6 = (const xmlChar *)a3;
  id v4 = (PFSPropertySet *)sub_1EE660((uint64_t)&self->mProperties, &v6);
  if (&self->mProperties.__tree_.__pair1_ == (__compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<const unsigned char *, NSArray *>, void *>>> *)v4) {
    return 0;
  }
  else {
    return v4[1].mProperties.__tree_.__begin_node_;
  }
}

- (id)firstValueFromCandidatePropertyNames:(void *)a3 selectedIndex:(unint64_t *)a4
{
  unint64_t v5 = *((void *)a3 + 5);
  if (!v5)
  {
    id result = 0;
    unint64_t v8 = 0;
    if (!a4) {
      return result;
    }
    goto LABEL_7;
  }
  unint64_t v8 = 0;
  while (1)
  {
    id result = [(PFSPropertySet *)self valueForProperty:*(void *)(*(void *)(*((void *)a3 + 1) + (((v8 + *((void *)a3 + 4)) >> 6) & 0x3FFFFFFFFFFFFF8))+ 8 * ((v8 + *((void *)a3 + 4)) & 0x1FF))];
    if (result) {
      break;
    }
    if (v5 == ++v8)
    {
      id result = 0;
      unint64_t v8 = v5;
      break;
    }
  }
  if (a4) {
LABEL_7:
  }
    *a4 = v8;
  return result;
}

- (void)addPropertyValue:(id)a3 forProperty:(const char *)a4
{
  cur = (xmlChar *)a4;
  p_mProperties = (uint64_t **)&self->mProperties;
  BOOL v7 = (PFSPropertySet *)sub_1EE660((uint64_t)&self->mProperties, (const xmlChar **)&cur);
  if (&self->mProperties.__tree_.__pair1_ == (__compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<const unsigned char *, NSArray *>, void *>>> *)v7)
  {
    id v8 = a3;
    v10 = xmlStrdup(cur);
    p_cur = &v10;
    v9 = sub_1EB8AC(p_mProperties, (const xmlChar **)&v10, (uint64_t)&std::piecewise_construct, (uint64_t **)&p_cur);
  }
  else
  {

    id v8 = a3;
    p_cur = &cur;
    v9 = sub_1EB8AC(p_mProperties, (const xmlChar **)&cur, (uint64_t)&std::piecewise_construct, (uint64_t **)&p_cur);
  }
  v9[5] = (uint64_t)v8;
}

- (void)removeValueForProperty:(const char *)a3
{
  BOOL v7 = (const xmlChar *)a3;
  p_mProperties = (uint64_t **)&self->mProperties;
  unint64_t v5 = (PFSPropertySet *)sub_1EE660((uint64_t)&self->mProperties, &v7);
  if (&self->mProperties.__tree_.__pair1_ != (__compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<const unsigned char *, NSArray *>, void *>>> *)v5)
  {
    v6 = v5;
    xmlFree(v5[1].super.isa);

    sub_43898(p_mProperties, (uint64_t *)v6);
    operator delete(v6);
  }
}

- (void)setPropertiesFromPropertySet:(id)a3
{
  id v4 = [a3 peekAtProperties];
  unint64_t v5 = v4 + 1;
  v6 = (void *)*v4;
  if ((void *)*v4 != v4 + 1)
  {
    do
    {
      [(PFSPropertySet *)self addPropertyValue:v6[5] forProperty:v6[4]];
      BOOL v7 = (void *)v6[1];
      if (v7)
      {
        do
        {
          id v8 = v7;
          BOOL v7 = (void *)*v7;
        }
        while (v7);
      }
      else
      {
        do
        {
          id v8 = (void *)v6[2];
          BOOL v9 = *v8 == (void)v6;
          v6 = v8;
        }
        while (!v9);
      }
      v6 = v8;
    }
    while (v8 != v5);
  }
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

- (const)peekAtProperties
{
  return &self->mProperties;
}

@end