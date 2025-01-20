@interface CSConnectionMessage
- (BOOL)isReply;
- (CSConnectionMessage)initWithConnectionMessage:(shared_ptr<CLConnectionMessage>)a3;
- (NSSecureCoding)payloadObject;
- (NSString)name;
- (id).cxx_construct;
- (shared_ptr<CLConnectionMessage>)message;
- (void)sendReply:(id)a3;
@end

@implementation CSConnectionMessage

- (CSConnectionMessage)initWithConnectionMessage:(shared_ptr<CLConnectionMessage>)a3
{
  ptr = a3.__ptr_;
  v10.receiver = self;
  v10.super_class = (Class)CSConnectionMessage;
  v4 = [(CSConnectionMessage *)&v10 init];
  v5 = v4;
  if (v4)
  {
    v7 = *(CLConnectionMessage **)ptr;
    uint64_t v6 = *((void *)ptr + 1);
    if (v6) {
      atomic_fetch_add_explicit((atomic_ullong *volatile)(v6 + 8), 1uLL, memory_order_relaxed);
    }
    cntrl = (std::__shared_weak_count *)v4->_message.__cntrl_;
    v5->_message.__ptr_ = v7;
    v5->_message.__cntrl_ = (__shared_weak_count *)v6;
    if (cntrl) {
      sub_10000BB9C(cntrl);
    }
  }
  return v5;
}

- (NSString)name
{
  [(CSConnectionMessage *)self message];
  v3 = v7;
  if (v8) {
    sub_10000BB9C(v8);
  }
  if (v7)
  {
    [(CSConnectionMessage *)self message];
    uint64_t v4 = CLConnectionMessage::name(v7);
    uint64_t v5 = *(char *)(v4 + 23) >= 0 ? v4 : *(void *)v4;
    v3 = +[NSString stringWithUTF8String:v5];
    if (v8) {
      sub_10000BB9C(v8);
    }
  }

  return (NSString *)v3;
}

- (BOOL)isReply
{
  [(CSConnectionMessage *)self message];
  if (v6) {
    sub_10000BB9C(v6);
  }
  if (!v5) {
    return 0;
  }
  [(CSConnectionMessage *)self message];
  char isReply = CLConnectionMessage::isReply(v5);
  if (v6) {
    sub_10000BB9C(v6);
  }
  return isReply;
}

- (NSSecureCoding)payloadObject
{
  [(CSConnectionMessage *)self message];
  if (v6) {
    sub_10000BB9C(v6);
  }
  if (v5)
  {
    [(CSConnectionMessage *)self message];
    v3 = CLConnectionMessage::getDictionary(v5);
    if (v6) {
      sub_10000BB9C(v6);
    }
  }
  else
  {
    v3 = 0;
  }

  return (NSSecureCoding *)v3;
}

- (void)sendReply:(id)a3
{
  id v4 = a3;
  [(CSConnectionMessage *)self message];
  if (v6) {
    sub_10000BB9C(v6);
  }
  if (v5)
  {
    [(CSConnectionMessage *)self message];
    CLConnectionMessage::sendReply();
    if (v6) {
      sub_10000BB9C(v6);
    }
  }
}

- (shared_ptr<CLConnectionMessage>)message
{
  cntrl = self->_message.__cntrl_;
  *v2 = self->_message.__ptr_;
  v2[1] = (CLConnectionMessage *)cntrl;
  if (cntrl) {
    atomic_fetch_add_explicit((atomic_ullong *volatile)cntrl + 1, 1uLL, memory_order_relaxed);
  }
  result.__cntrl_ = (__shared_weak_count *)a2;
  result.__ptr_ = (CLConnectionMessage *)self;
  return result;
}

- (void).cxx_destruct
{
  cntrl = self->_message.__cntrl_;
  if (cntrl) {
    sub_10000BB9C((std::__shared_weak_count *)cntrl);
  }
}

- (id).cxx_construct
{
  *((void *)self + 1) = 0;
  *((void *)self + 2) = 0;
  return self;
}

@end