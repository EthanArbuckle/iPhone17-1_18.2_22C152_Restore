@interface KTOptInStateHolder
- (KTOptInStateHolder)init;
- (NSMutableDictionary)currentStates;
- (NSMutableDictionary)targetOptInStates;
- (NSString)currentTarget;
- (void)completedCurrentTarget;
- (void)setCurrentStates:(id)a3;
- (void)setCurrentTarget:(id)a3;
- (void)setTargetOptInStates:(id)a3;
@end

@implementation KTOptInStateHolder

- (KTOptInStateHolder)init
{
  v7.receiver = self;
  v7.super_class = (Class)KTOptInStateHolder;
  v2 = [(KTOptInStateHolder *)&v7 init];
  if (v2)
  {
    v3 = +[NSMutableDictionary dictionary];
    [(KTOptInStateHolder *)v2 setTargetOptInStates:v3];

    v4 = +[NSMutableDictionary dictionary];
    [(KTOptInStateHolder *)v2 setCurrentStates:v4];

    v5 = v2;
  }

  return v2;
}

- (void)completedCurrentTarget
{
  v3 = [(KTOptInStateHolder *)self targetOptInStates];
  v4 = [(KTOptInStateHolder *)self currentTarget];
  v5 = [v3 objectForKeyedSubscript:v4];

  if (v5)
  {
    v6 = [v5 targetResolved];
    [v6 fulfill];

    objc_super v7 = [(KTOptInStateHolder *)self targetOptInStates];
    v8 = [(KTOptInStateHolder *)self currentTarget];
    [v7 setObject:0 forKeyedSubscript:v8];

    [(KTOptInStateHolder *)self setCurrentTarget:0];
  }
  else
  {
    if (qword_100326790 != -1) {
      dispatch_once(&qword_100326790, &stru_1002BB1D0);
    }
    v9 = qword_100326798;
    if (os_log_type_enabled((os_log_t)qword_100326798, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)v10 = 0;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_ERROR, "asked to complete target, but didn't have one", v10, 2u);
    }
  }
}

- (NSMutableDictionary)targetOptInStates
{
  return (NSMutableDictionary *)objc_getProperty(self, a2, 8, 1);
}

- (void)setTargetOptInStates:(id)a3
{
}

- (NSMutableDictionary)currentStates
{
  return (NSMutableDictionary *)objc_getProperty(self, a2, 16, 1);
}

- (void)setCurrentStates:(id)a3
{
}

- (NSString)currentTarget
{
  return (NSString *)objc_getProperty(self, a2, 24, 1);
}

- (void)setCurrentTarget:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_currentTarget, 0);
  objc_storeStrong((id *)&self->_currentStates, 0);

  objc_storeStrong((id *)&self->_targetOptInStates, 0);
}

@end