@interface NPTOTransaction
- (NPTOTransaction)initWithDescription:(id)a3;
- (NPTOTransaction)initWithDescription:(id)a3 userInfo:(id)a4 context:(id)a5;
- (id)description;
- (void)dealloc;
@end

@implementation NPTOTransaction

- (NPTOTransaction)initWithDescription:(id)a3
{
  return [(NPTOTransaction *)self initWithDescription:a3 userInfo:0 context:0];
}

- (NPTOTransaction)initWithDescription:(id)a3 userInfo:(id)a4 context:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v17.receiver = self;
  v17.super_class = (Class)NPTOTransaction;
  v11 = [(NPTOTransaction *)&v17 init];
  if (v11)
  {
    id v12 = v8;
    [v12 UTF8String];
    uint64_t v13 = os_transaction_create();
    transaction = v11->_transaction;
    v11->_transaction = (OS_os_transaction *)v13;

    objc_storeStrong((id *)&v11->_transactionDescription, v12);
    objc_storeStrong((id *)&v11->_userInfo, a4);
    objc_storeStrong(&v11->_context, a5);
  }
  v15 = sub_10005CDAC();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 138412290;
    v19 = v11;
    _os_log_debug_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEBUG, "Created transaction: %@", buf, 0xCu);
  }

  return v11;
}

- (void)dealloc
{
  v3 = sub_10005CDAC();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 138412290;
    v6 = self;
    _os_log_debug_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEBUG, "Destroyed transaction: %@", buf, 0xCu);
  }

  v4.receiver = self;
  v4.super_class = (Class)NPTOTransaction;
  [(NPTOTransaction *)&v4 dealloc];
}

- (id)description
{
  v6.receiver = self;
  v6.super_class = (Class)NPTOTransaction;
  v3 = [(NPTOTransaction *)&v6 description];
  objc_super v4 = [v3 stringByAppendingFormat:@" (%@) (%@)", self->_transactionDescription, self->_userInfo];

  return v4;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_context, 0);
  objc_storeStrong((id *)&self->_userInfo, 0);
  objc_storeStrong((id *)&self->_transactionDescription, 0);

  objc_storeStrong((id *)&self->_transaction, 0);
}

@end