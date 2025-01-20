@interface TMLBlockSignalHandler
- (TMLBlockSignalHandler)initWithBlock:(id)a3;
- (id)callWithArguments:(id)a3;
@end

@implementation TMLBlockSignalHandler

- (TMLBlockSignalHandler)initWithBlock:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)TMLBlockSignalHandler;
  v5 = [(TMLBlockSignalHandler *)&v9 init];
  if (v5)
  {
    uint64_t v6 = MEMORY[0x23ECA7DD0](v4);
    id block = v5->_block;
    v5->_id block = (id)v6;
  }
  return v5;
}

- (id)callWithArguments:(id)a3
{
  id v4 = a3;
  if ((atomic_fetch_or((atomic_uchar *volatile)&self->_flags, 0x40u) & 0x40) != 0)
  {
    objc_super v9 = (void *)MEMORY[0x263EFF940];
    v10 = objc_msgSend_stringWithFormat_(NSString, v5, v6, @"Nested signal triggered '%@'", @"<block>");
    objc_msgSend_exceptionWithName_reason_userInfo_(v9, v11, v12, @"TMLRuntimeException", v10, 0);
    id v13 = (id)objc_claimAutoreleasedReturnValue();

    objc_exception_throw(v13);
  }
  v7 = v4;
  (*((void (**)(void))self->_block + 2))();
  atomic_fetch_and_explicit((atomic_uchar *volatile)&self->_flags, 0xBFu, memory_order_relaxed);

  return 0;
}

- (void).cxx_destruct
{
}

@end