@interface PFSSlot
- (NSString)slotId;
- (PFSSlot)initWithId:(id)a3;
- (id).cxx_construct;
- (id)valueForProperty:(const char *)a3;
- (void)addPropertyValue:(id)a3 forProperty:(const char *)a4;
- (void)dealloc;
@end

@implementation PFSSlot

- (PFSSlot)initWithId:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)PFSSlot;
  v4 = [(PFSSlot *)&v6 init];
  if (v4) {
    v4->mSlotId = (NSString *)[a3 copy];
  }
  return v4;
}

- (void)dealloc
{
  begin_node = (__compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<const unsigned char *, NSArray *>, void *>>> *)self->mProperties.__tree_.__begin_node_;
  if (begin_node != &self->mProperties.__tree_.__pair1_)
  {
    do
    {
      xmlFree(begin_node[4].__value_.__left_);

      left = (PFSSlot *)begin_node[1].__value_.__left_;
      if (left)
      {
        do
        {
          v5 = left;
          left = (PFSSlot *)left->super.isa;
        }
        while (left);
      }
      else
      {
        do
        {
          v5 = (PFSSlot *)begin_node[2].__value_.__left_;
          BOOL v6 = v5->super.isa == (Class)begin_node;
          begin_node = (__compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<const unsigned char *, NSArray *>, void *>>> *)v5;
        }
        while (!v6);
      }
      begin_node = (__compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<const unsigned char *, NSArray *>, void *>>> *)v5;
    }
    while (v5 != (PFSSlot *)&self->mProperties.__tree_.__pair1_);
  }
  v7.receiver = self;
  v7.super_class = (Class)PFSSlot;
  [(PFSSlot *)&v7 dealloc];
}

- (id)valueForProperty:(const char *)a3
{
  BOOL v6 = (const xmlChar *)a3;
  v4 = (PFSSlot *)sub_1EE660((uint64_t)&self->mProperties, &v6);
  if (&self->mProperties.__tree_.__pair1_ == (__compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<const unsigned char *, NSArray *>, void *>>> *)v4) {
    return 0;
  }
  else {
    return v4[1].super.isa;
  }
}

- (void)addPropertyValue:(id)a3 forProperty:(const char *)a4
{
  cur = (xmlChar *)a4;
  p_mProperties = (uint64_t **)&self->mProperties;
  objc_super v7 = (PFSSlot *)sub_1EE660((uint64_t)&self->mProperties, (const xmlChar **)&cur);
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

- (NSString)slotId
{
  return self->mSlotId;
}

- (void).cxx_destruct
{
}

- (id).cxx_construct
{
  *((void *)self + 4) = 0;
  *((void *)self + 3) = 0;
  *((void *)self + 2) = (char *)self + 24;
  return self;
}

@end