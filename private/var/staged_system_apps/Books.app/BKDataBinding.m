@interface BKDataBinding
- (BKDataBinding)initWithBinding:(id)a3 key:(id)a4 to:(id)a5 key:(id)a6 transmitInitialValue:(BOOL)a7;
- (NSObject)dstObj;
- (NSObject)srcObj;
- (NSString)dstKey;
- (NSString)srcKey;
- (id)description;
- (void)dealloc;
- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6;
- (void)setDstKey:(id)a3;
- (void)setDstObj:(id)a3;
- (void)setSrcKey:(id)a3;
- (void)setSrcObj:(id)a3;
- (void)unbind;
@end

@implementation BKDataBinding

- (BKDataBinding)initWithBinding:(id)a3 key:(id)a4 to:(id)a5 key:(id)a6 transmitInitialValue:(BOOL)a7
{
  BOOL v7 = a7;
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  v22.receiver = self;
  v22.super_class = (Class)BKDataBinding;
  v16 = [(BKDataBinding *)&v22 init];
  v17 = v16;
  if (v16)
  {
    [(BKDataBinding *)v16 setSrcKey:v13];
    [(BKDataBinding *)v17 setDstKey:v15];
    [(BKDataBinding *)v17 setSrcObj:v12];
    [(BKDataBinding *)v17 setDstObj:v14];
    v18 = [(BKDataBinding *)v17 srcObj];
    v19 = [(BKDataBinding *)v17 srcKey];
    if (v7) {
      uint64_t v20 = 5;
    }
    else {
      uint64_t v20 = 1;
    }
    [v18 addObserver:v17 forKeyPath:v19 options:v20 context:off_100B1FD38];
  }
  return v17;
}

- (void)dealloc
{
  [(BKDataBinding *)self unbind];
  v3.receiver = self;
  v3.super_class = (Class)BKDataBinding;
  [(BKDataBinding *)&v3 dealloc];
}

- (void)unbind
{
  objc_super v3 = [(BKDataBinding *)self srcObj];
  v4 = [(BKDataBinding *)self srcKey];
  [v3 removeObserver:self forKeyPath:v4 context:off_100B1FD38];

  objc_storeWeak((id *)&self->_srcObj, 0);

  objc_storeWeak((id *)&self->_dstObj, 0);
}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  if (off_100B1FD38 == a6)
  {
    BOOL v7 = [(BKDataBinding *)self srcObj];
    v8 = [(BKDataBinding *)self srcKey];
    id v17 = [v7 valueForKey:v8];

    v9 = [(BKDataBinding *)self dstObj];
    v10 = [(BKDataBinding *)self dstKey];
    id v11 = [v9 valueForKey:v10];

    if (v17 != v11 && ([v17 isEqual:v11] & 1) == 0)
    {
      id v12 = [(BKDataBinding *)self dstObj];
      id v13 = [(BKDataBinding *)self srcObj];
      id v14 = [(BKDataBinding *)self srcKey];
      id v15 = [v13 valueForKey:v14];
      v16 = [(BKDataBinding *)self dstKey];
      [v12 setValue:v15 forKey:v16];
    }
  }
  else
  {
    v18.receiver = self;
    v18.super_class = (Class)BKDataBinding;
    -[BKDataBinding observeValueForKeyPath:ofObject:change:context:](&v18, "observeValueForKeyPath:ofObject:change:context:", a3, a4, a5);
  }
}

- (id)description
{
  objc_super v3 = [(BKDataBinding *)self srcKey];
  v4 = [(BKDataBinding *)self dstKey];
  v5 = [(BKDataBinding *)self srcObj];
  v6 = [(BKDataBinding *)self dstObj];
  BOOL v7 = +[NSString stringWithFormat:@"Binding: %@ to %@ for %@ and %@", v3, v4, v5, v6];

  return v7;
}

- (NSString)srcKey
{
  return self->_srcKey;
}

- (void)setSrcKey:(id)a3
{
}

- (NSString)dstKey
{
  return self->_dstKey;
}

- (void)setDstKey:(id)a3
{
}

- (NSObject)srcObj
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_srcObj);

  return WeakRetained;
}

- (void)setSrcObj:(id)a3
{
}

- (NSObject)dstObj
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_dstObj);

  return WeakRetained;
}

- (void)setDstObj:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_dstObj);
  objc_destroyWeak((id *)&self->_srcObj);
  objc_storeStrong((id *)&self->_dstKey, 0);

  objc_storeStrong((id *)&self->_srcKey, 0);
}

@end