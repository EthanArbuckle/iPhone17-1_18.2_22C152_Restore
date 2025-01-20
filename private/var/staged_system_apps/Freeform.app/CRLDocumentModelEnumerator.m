@interface CRLDocumentModelEnumerator
- (BOOL)isEnumeratingForUserSearch;
- (CRLDocumentModelEnumerator)initWithEnumerator:(id)a3 filter:(id)a4;
- (CRLDocumentModelEnumerator)initWithEnumerator:(id)a3 flags:(unint64_t)a4 filter:(id)a5;
- (CRLDocumentModelEnumerator)initWithRootModelObject:(id)a3 filter:(id)a4;
- (CRLDocumentModelEnumerator)initWithRootModelObject:(id)a3 flags:(unint64_t)a4 filter:(id)a5;
- (CRLModel)root;
- (NSMutableArray)enumeratorStack;
- (id)filter;
- (id)nextObject;
- (void)addFilter:(id)a3;
- (void)dealloc;
- (void)enumerateUsingBlock:(id)a3;
- (void)setEnumeratorStack:(id)a3;
- (void)setFilter:(id)a3;
- (void)setRoot:(id)a3;
@end

@implementation CRLDocumentModelEnumerator

- (CRLDocumentModelEnumerator)initWithRootModelObject:(id)a3 filter:(id)a4
{
  return [(CRLDocumentModelEnumerator *)self initWithRootModelObject:a3 flags:0 filter:a4];
}

- (CRLDocumentModelEnumerator)initWithRootModelObject:(id)a3 flags:(unint64_t)a4 filter:(id)a5
{
  id v9 = a3;
  id v10 = a5;
  v16.receiver = self;
  v16.super_class = (Class)CRLDocumentModelEnumerator;
  v11 = [(CRLDocumentModelEnumerator *)&v16 init];
  v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_root, a3);
    id v13 = objc_retainBlock(v10);
    id filter = v12->_filter;
    v12->_id filter = v13;

    v12->_flags = a4;
  }

  return v12;
}

- (CRLDocumentModelEnumerator)initWithEnumerator:(id)a3 filter:(id)a4
{
  return [(CRLDocumentModelEnumerator *)self initWithEnumerator:a3 flags:0 filter:a4];
}

- (CRLDocumentModelEnumerator)initWithEnumerator:(id)a3 flags:(unint64_t)a4 filter:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  if (!v8)
  {
    int v10 = +[CRLAssertionHandler _atomicIncrementAssertCount];
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014E3D58);
    }
    v11 = off_10166B4A0;
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_10108E4C4(v10, v11);
    }
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014E3D78);
    }
    v12 = off_10166B4A0;
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_101066770(v12, v10);
    }
    id v13 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLDocumentModelEnumerator initWithEnumerator:flags:filter:]");
    v14 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLKit/CRLDocumentModelEnumerator.m"];
    +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v13, v14, 67, 0, "invalid nil value for '%{public}s'", "enumerator");
  }
  v21.receiver = self;
  v21.super_class = (Class)CRLDocumentModelEnumerator;
  v15 = [(CRLDocumentModelEnumerator *)&v21 init];
  if (v15)
  {
    uint64_t v16 = +[NSMutableArray arrayWithObject:v8];
    enumeratorStack = v15->_enumeratorStack;
    v15->_enumeratorStack = (NSMutableArray *)v16;

    id v18 = objc_retainBlock(v9);
    id filter = v15->_filter;
    v15->_id filter = v18;

    v15->_flags = a4;
  }

  return v15;
}

- (void)dealloc
{
  v2.receiver = self;
  v2.super_class = (Class)CRLDocumentModelEnumerator;
  [(CRLDocumentModelEnumerator *)&v2 dealloc];
}

- (BOOL)isEnumeratingForUserSearch
{
  return self->_flags & 1;
}

- (id)nextObject
{
  if (!self->_enumeratorStack)
  {
    char v29 = 1;
    v6 = [(CRLDocumentModelEnumerator *)self filter];
    if (!v6
      || ([(CRLDocumentModelEnumerator *)self filter],
          objc_super v2 = (unsigned int (**)(void, void, void, void))objc_claimAutoreleasedReturnValue(),
          [(CRLDocumentModelEnumerator *)self root],
          v3 = objc_claimAutoreleasedReturnValue(),
          ((unsigned int (**)(void, void *, BOOL *, char *))v2)[2](v2, v3, &self->_stop, &v29)))
    {
      v5 = [(CRLDocumentModelEnumerator *)self root];
      if (!v6) {
        goto LABEL_8;
      }
    }
    else
    {
      v5 = 0;
    }

LABEL_8:
    if (v29)
    {
      v7 = [(CRLDocumentModelEnumerator *)self root];
      char v8 = objc_opt_respondsToSelector();

      if (v8)
      {
        id v9 = [(CRLDocumentModelEnumerator *)self root];
        uint64_t v10 = [v9 childEnumeratorForUserFlags:self->_flags];
      }
      else if ([(CRLDocumentModelEnumerator *)self isEnumeratingForUserSearch] {
             && ([(CRLDocumentModelEnumerator *)self root],
      }
                 v11 = objc_claimAutoreleasedReturnValue(),
                 char v12 = objc_opt_respondsToSelector(),
                 v11,
                 (v12 & 1) != 0))
      {
        id v9 = [(CRLDocumentModelEnumerator *)self root];
        uint64_t v10 = [v9 childEnumeratorForUserSearch];
      }
      else
      {
        id v13 = [(CRLDocumentModelEnumerator *)self root];
        char v14 = objc_opt_respondsToSelector();

        if ((v14 & 1) == 0) {
          goto LABEL_17;
        }
        id v9 = [(CRLDocumentModelEnumerator *)self root];
        uint64_t v10 = [v9 childEnumerator];
      }
      v15 = (void *)v10;
      uint64_t v16 = +[NSMutableArray arrayWithObject:v10];

      if (v16)
      {
LABEL_18:
        [(CRLDocumentModelEnumerator *)self setEnumeratorStack:v16];

        goto LABEL_19;
      }
    }
LABEL_17:
    uint64_t v16 = +[NSMutableArray array];
    goto LABEL_18;
  }
  v5 = 0;
LABEL_19:
  v17 = [(CRLDocumentModelEnumerator *)self enumeratorStack];
  if (![v17 count] || v5)
  {
LABEL_42:

    goto LABEL_44;
  }
  while (1)
  {
    BOOL stop = self->_stop;

    if (stop) {
      break;
    }
    char v28 = 1;
    v19 = [(CRLDocumentModelEnumerator *)self enumeratorStack];
    v20 = [v19 lastObject];
    v5 = [v20 nextObject];

    if (!v5)
    {
      id v21 = [(CRLDocumentModelEnumerator *)self enumeratorStack];
      [v21 removeLastObject];
      goto LABEL_38;
    }
    id v21 = v5;
    v22 = [(CRLDocumentModelEnumerator *)self filter];
    v5 = v21;
    if (v22)
    {
      v23 = [(CRLDocumentModelEnumerator *)self filter];
      v5 = v21;
      if ((((uint64_t (**)(void, id, BOOL *, char *))v23)[2](v23, v21, &self->_stop, &v28) & 1) == 0)
      {

        v5 = 0;
      }
    }
    if (!v28) {
      goto LABEL_38;
    }
    if (objc_opt_respondsToSelector())
    {
      uint64_t v24 = [v21 childEnumeratorForUserFlags:self->_flags];
    }
    else if ([(CRLDocumentModelEnumerator *)self isEnumeratingForUserSearch] {
           && (objc_opt_respondsToSelector() & 1) != 0)
    }
    {
      uint64_t v24 = [v21 childEnumeratorForUserSearch];
    }
    else
    {
      if ((objc_opt_respondsToSelector() & 1) == 0)
      {
        v25 = 0;
        goto LABEL_37;
      }
      uint64_t v24 = [v21 childEnumerator];
    }
    v25 = (void *)v24;
LABEL_37:
    v26 = [(CRLDocumentModelEnumerator *)self enumeratorStack];
    [v26 crl_addNonNilObject:v25];

LABEL_38:
    v17 = [(CRLDocumentModelEnumerator *)self enumeratorStack];
    if (![v17 count] || v5) {
      goto LABEL_42;
    }
  }
  v5 = 0;
LABEL_44:

  return v5;
}

- (void)enumerateUsingBlock:(id)a3
{
  v4 = (void (**)(id, void *, unsigned char *))a3;
  char v8 = 0;
  uint64_t v5 = [(CRLDocumentModelEnumerator *)self nextObject];
  if (v5)
  {
    v6 = (void *)v5;
    do
    {
      v7 = v6;
      v4[2](v4, v6, &v8);
      v6 = [(CRLDocumentModelEnumerator *)self nextObject];
    }
    while (v6 && !v8);
  }
}

- (void)addFilter:(id)a3
{
  id v4 = a3;
  id filter = self->_filter;
  if (filter)
  {
    v11[0] = _NSConcreteStackBlock;
    v11[1] = 3221225472;
    v11[2] = sub_100233448;
    v11[3] = &unk_1014E3DA0;
    id v12 = objc_retainBlock(filter);
    id v13 = v4;
    id v6 = v12;
    v7 = objc_retainBlock(v11);
    id v8 = self->_filter;
    self->_id filter = v7;
  }
  else
  {
    id v9 = objc_retainBlock(v4);
    id v10 = self->_filter;
    self->_id filter = v9;
  }
}

- (CRLModel)root
{
  return self->_root;
}

- (void)setRoot:(id)a3
{
}

- (NSMutableArray)enumeratorStack
{
  return self->_enumeratorStack;
}

- (void)setEnumeratorStack:(id)a3
{
}

- (id)filter
{
  return self->_filter;
}

- (void)setFilter:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_filter, 0);
  objc_storeStrong((id *)&self->_enumeratorStack, 0);

  objc_storeStrong((id *)&self->_root, 0);
}

@end