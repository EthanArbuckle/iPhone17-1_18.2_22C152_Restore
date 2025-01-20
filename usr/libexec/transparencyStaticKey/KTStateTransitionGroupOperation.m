@interface KTStateTransitionGroupOperation
+ (id)named:(id)a3 intending:(id)a4 errorState:(id)a5 withBlockTakingSelf:(id)a6;
- (KTStateString)intendedState;
- (KTStateString)nextState;
- (id)description;
- (id)initIntending:(id)a3 errorState:(id)a4;
- (void)setNextState:(id)a3;
@end

@implementation KTStateTransitionGroupOperation

- (id)initIntending:(id)a3 errorState:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)KTStateTransitionGroupOperation;
  v9 = [(KTGroupOperation *)&v12 init];
  p_isa = (id *)&v9->super.super.super.super.super.isa;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_nextState, a4);
    objc_storeStrong(p_isa + 16, a3);
  }

  return p_isa;
}

- (id)description
{
  v3 = [(KTStateTransitionGroupOperation *)self name];
  v4 = [(KTStateTransitionGroupOperation *)self intendedState];
  v5 = [(KTStateTransitionGroupOperation *)self nextState];
  v6 = +[NSString stringWithFormat:@"<KTStateTransitionGroupOperation(%@): intended:%@ actual:%@>", v3, v4, v5];

  return v6;
}

+ (id)named:(id)a3 intending:(id)a4 errorState:(id)a5 withBlockTakingSelf:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  id v14 = [objc_alloc((Class)a1) initIntending:v11 errorState:v12];
  id location = 0;
  objc_initWeak(&location, v14);
  v18[0] = _NSConcreteStackBlock;
  v18[1] = 3221225472;
  v18[2] = sub_100004380;
  v18[3] = &unk_10008CAB0;
  objc_copyWeak(&v20, &location);
  id v15 = v13;
  id v19 = v15;
  v16 = +[NSBlockOperation blockOperationWithBlock:v18];
  [v14 runBeforeGroupFinished:v16];

  [v14 setName:v10];
  objc_destroyWeak(&v20);
  objc_destroyWeak(&location);

  return v14;
}

- (KTStateString)nextState
{
  return (KTStateString *)objc_getProperty(self, a2, 120, 1);
}

- (void)setNextState:(id)a3
{
}

- (KTStateString)intendedState
{
  return (KTStateString *)objc_getProperty(self, a2, 128, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_intendedState, 0);

  objc_storeStrong((id *)&self->_nextState, 0);
}

@end