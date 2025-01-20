@interface TUIRenderModelIdentifierInterest
- (TUIRenderModelIdentifierInterest)initWithQueue:(id)a3 interests:(id)a4;
- (void)dealloc;
- (void)invalidate;
@end

@implementation TUIRenderModelIdentifierInterest

- (TUIRenderModelIdentifierInterest)initWithQueue:(id)a3 interests:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v14.receiver = self;
  v14.super_class = (Class)TUIRenderModelIdentifierInterest;
  v9 = [(TUIRenderModelIdentifierInterest *)&v14 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_queue, a3);
    v11 = (NSArray *)[v8 copy];
    interests = v10->_interests;
    v10->_interests = v11;
  }
  return v10;
}

- (void)dealloc
{
  [(TUIRenderModelIdentifierInterest *)self invalidate];
  v3.receiver = self;
  v3.super_class = (Class)TUIRenderModelIdentifierInterest;
  [(TUIRenderModelIdentifierInterest *)&v3 dealloc];
}

- (void)invalidate
{
  queue = self->_queue;
  interests = self->_interests;
  if (queue)
  {
    v5 = interests;
    v6 = self->_queue;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_16CA50;
    block[3] = &unk_255D60;
    v10 = v5;
    id v7 = v5;
    dispatch_async(v6, block);
  }
  else
  {
    sub_16CA58(interests);
  }
  id v8 = self->_interests;
  self->_interests = 0;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_interests, 0);

  objc_storeStrong((id *)&self->_queue, 0);
}

@end