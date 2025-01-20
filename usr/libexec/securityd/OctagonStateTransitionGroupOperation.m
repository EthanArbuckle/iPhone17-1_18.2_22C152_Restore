@interface OctagonStateTransitionGroupOperation
+ (id)named:(id)a3 intending:(id)a4 errorState:(id)a5 withBlockTakingSelf:(id)a6;
- (OctagonStateString)intendedState;
- (OctagonStateString)nextState;
- (id)description;
- (id)initIntending:(id)a3 errorState:(id)a4;
- (void)setNextState:(id)a3;
@end

@implementation OctagonStateTransitionGroupOperation

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_intendedState, 0);

  objc_storeStrong((id *)&self->_nextState, 0);
}

- (OctagonStateString)intendedState
{
  return (OctagonStateString *)objc_getProperty(self, a2, 136, 1);
}

- (void)setNextState:(id)a3
{
}

- (OctagonStateString)nextState
{
  return (OctagonStateString *)objc_getProperty(self, a2, 128, 1);
}

- (id)description
{
  v3 = [(OctagonStateTransitionGroupOperation *)self name];
  v4 = [(OctagonStateTransitionGroupOperation *)self intendedState];
  v5 = [(OctagonStateTransitionGroupOperation *)self nextState];
  v6 = +[NSString stringWithFormat:@"<OctagonStateTransitionGroupOperation(%@): intended:%@ actual:%@>", v3, v4, v5];

  return v6;
}

- (id)initIntending:(id)a3 errorState:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)OctagonStateTransitionGroupOperation;
  v9 = [(CKKSGroupOperation *)&v12 init];
  p_isa = (id *)&v9->super.super.super.super.super.isa;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_nextState, a4);
    objc_storeStrong(p_isa + 17, a3);
  }

  return p_isa;
}

+ (id)named:(id)a3 intending:(id)a4 errorState:(id)a5 withBlockTakingSelf:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  id v14 = [objc_alloc((Class)a1) initIntending:v11 errorState:v12];
  id location = (id)0xAAAAAAAAAAAAAAAALL;
  objc_initWeak(&location, v14);
  v18[0] = _NSConcreteStackBlock;
  v18[1] = 3221225472;
  v18[2] = sub_1001AF6D0;
  v18[3] = &unk_100306A38;
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

@end