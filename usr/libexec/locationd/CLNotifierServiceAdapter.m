@interface CLNotifierServiceAdapter
- (CLNotifierBase)notifier;
- (CLNotifierServiceAdapter)init;
- (NSString)debugDescription;
- (id).cxx_construct;
- (int)notifierClientNumForCoparty:(id)a3;
- (void)forget:(id)a3;
- (void)invalidate;
- (void)register:(id)a3 forNotification:(int)a4 registrationInfo:(id)a5;
- (void)setAdaptedNotifier:(CLNotifierBase *)a3;
- (void)unregister:(id)a3 forNotification:(int)a4;
@end

@implementation CLNotifierServiceAdapter

- (void)forget:(id)a3
{
  [objc_msgSend(-[CLNotifierServiceAdapter universe](self, "universe"), "silo") assertInside];
  left = (char *)self->_clients.__tree_.__pair1_.__value_.__left_;
  if (left)
  {
    p_pair1 = &self->_clients.__tree_.__pair1_;
    do
    {
      unint64_t v7 = *((void *)left + 4);
      BOOL v8 = v7 >= (unint64_t)a3;
      if (v7 >= (unint64_t)a3) {
        v9 = (char **)left;
      }
      else {
        v9 = (char **)(left + 8);
      }
      if (v8) {
        p_pair1 = (__compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<unsigned long, int>, void *>>> *)left;
      }
      left = *v9;
    }
    while (*v9);
    if (p_pair1 != &self->_clients.__tree_.__pair1_ && p_pair1[4].__value_.__left_ <= a3)
    {
      (*((void (**)(CLNotifierBase *, void))self->_notifier->var0 + 4))(self->_notifier, LODWORD(p_pair1[5].__value_.__left_));
      sub_1000F0A30((uint64_t **)&self->_clients, (uint64_t *)p_pair1);
      operator delete(p_pair1);
    }
  }
}

- (CLNotifierBase)notifier
{
  return self->_notifier;
}

- (void)register:(id)a3 forNotification:(int)a4 registrationInfo:(id)a5
{
  uint64_t v6 = *(void *)&a4;
  [objc_msgSend(-[CLNotifierServiceAdapter universe](self, "universe"), "silo") assertInside];
  notifier = self->_notifier;
  uint64_t v10 = [(CLNotifierServiceAdapter *)self notifierClientNumForCoparty:a3];
  v11 = (void (*)(CLNotifierBase *, uint64_t, uint64_t, id))*((void *)notifier->var0 + 5);

  v11(notifier, v10, v6, a5);
}

- (void)unregister:(id)a3 forNotification:(int)a4
{
  uint64_t v4 = *(void *)&a4;
  [objc_msgSend(-[CLNotifierServiceAdapter universe](self, "universe"), "silo") assertInside];
  notifier = self->_notifier;
  uint64_t v8 = [(CLNotifierServiceAdapter *)self notifierClientNumForCoparty:a3];
  v9 = (void (*)(CLNotifierBase *, uint64_t, uint64_t))*((void *)notifier->var0 + 7);

  v9(notifier, v8, v4);
}

- (int)notifierClientNumForCoparty:(id)a3
{
  [objc_msgSend(-[CLNotifierServiceAdapter universe](self, "universe"), "silo") assertInside];
  notifier = self->_notifier;
  if (!notifier) {
    sub_101AB8C30();
  }
  p_clients = &self->_clients;
  left = (__compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<unsigned long, int>, void *>>> *)p_clients->__tree_.__pair1_.__value_.__left_;
  if (!left) {
    goto LABEL_13;
  }
  p_pair1 = &p_clients->__tree_.__pair1_;
  do
  {
    unint64_t v9 = (unint64_t)left[4].__value_.__left_;
    BOOL v10 = v9 >= (unint64_t)a3;
    if (v9 >= (unint64_t)a3) {
      v11 = (__compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<unsigned long, int>, void *>>> **)left;
    }
    else {
      v11 = (__compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<unsigned long, int>, void *>>> **)&left[1];
    }
    if (v10) {
      p_pair1 = left;
    }
    left = *v11;
  }
  while (*v11);
  if (p_pair1 != &p_clients->__tree_.__pair1_ && p_pair1[4].__value_.__left_ <= a3) {
    return (int)p_pair1[5].__value_.__left_;
  }
LABEL_13:
  int v12 = (*((uint64_t (**)(CLNotifierBase *, id))notifier->var0 + 3))(notifier, a3);
  id v14 = a3;
  v15 = &v14;
  *((_DWORD *)sub_1000F4F10((uint64_t **)p_clients, (unint64_t *)&v14, (uint64_t)&unk_101D0B290, &v15) + 10) = v12;
  return v12;
}

- (CLNotifierServiceAdapter)init
{
  v3.receiver = self;
  v3.super_class = (Class)CLNotifierServiceAdapter;
  return [(CLNotifierServiceAdapter *)&v3 initWithInboundProtocol:&OBJC_PROTOCOL___CLNotifierServiceProtocol outboundProtocol:&OBJC_PROTOCOL___CLNotifierServiceClientProtocol];
}

- (void)setAdaptedNotifier:(CLNotifierBase *)a3
{
  if (self->_notifier) {
    sub_101AB8AB8();
  }
  if (a3)
  {
    if (([(CLNotifierServiceAdapter *)self valid] & 1) == 0) {
      sub_101AB8940();
    }
    self->_notifier = a3;
  }
}

- (void)invalidate
{
  self->_notifier = 0;
}

- (NSString)debugDescription
{
  v10.receiver = self;
  v10.super_class = (Class)CLNotifierServiceAdapter;
  objc_super v3 = +[NSMutableString stringWithFormat:](NSMutableString, "stringWithFormat:", @"%@\nClientIntegerMap: (\n"), [(CLNotifierServiceAdapter *)&v10 debugDescription];
  begin_node = (__compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<unsigned long, int>, void *>>> *)self->_clients.__tree_.__begin_node_;
  if (begin_node != &self->_clients.__tree_.__pair1_)
  {
    char v5 = 0;
    do
    {
      if (v5) {
        [(NSMutableString *)v3 appendString:@",\n"];
      }
      [(NSMutableString *)v3 appendFormat:@"%p = %d", begin_node[4].__value_.__left_, LODWORD(begin_node[5].__value_.__left_)];
      left = (CLNotifierServiceAdapter *)begin_node[1].__value_.__left_;
      if (left)
      {
        do
        {
          unint64_t v7 = left;
          left = *(CLNotifierServiceAdapter **)left->CLIntersiloService_opaque;
        }
        while (left);
      }
      else
      {
        do
        {
          unint64_t v7 = (CLNotifierServiceAdapter *)begin_node[2].__value_.__left_;
          BOOL v8 = *(void *)v7->CLIntersiloService_opaque == (void)begin_node;
          begin_node = (__compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<unsigned long, int>, void *>>> *)v7;
        }
        while (!v8);
      }
      char v5 = 1;
      begin_node = (__compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<unsigned long, int>, void *>>> *)v7;
    }
    while (v7 != (CLNotifierServiceAdapter *)&self->_clients.__tree_.__pair1_);
  }
  [(NSMutableString *)v3 appendString:@"\n\n"]);
  return &v3->super;
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