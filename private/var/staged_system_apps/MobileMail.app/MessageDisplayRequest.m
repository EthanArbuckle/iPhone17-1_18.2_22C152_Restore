@interface MessageDisplayRequest
- (BOOL)hasFinished;
- (BOOL)hasStarted;
- (EFFuture)finishFuture;
- (EFFuture)startFuture;
- (EFPromise)finishPromise;
- (EFPromise)startPromise;
- (EMMessage)message;
- (MessageDisplayRequest)initWithMessage:(id)a3;
- (MessageDisplayRequest)initWithMessage:(id)a3 completion:(id)a4 firstPaintCompletion:(id)a5;
- (void)_messageViewDidFinishFirstPaint:(id)a3;
- (void)didBeginProcessingRequest;
- (void)requestAbortedWithError:(id)a3;
- (void)setFinishPromise:(id)a3;
- (void)setHasFinished:(BOOL)a3;
- (void)setHasStarted:(BOOL)a3;
- (void)setMessage:(id)a3;
- (void)setStartPromise:(id)a3;
@end

@implementation MessageDisplayRequest

- (MessageDisplayRequest)initWithMessage:(id)a3
{
  return [(MessageDisplayRequest *)self initWithMessage:a3 completion:0 firstPaintCompletion:0];
}

- (MessageDisplayRequest)initWithMessage:(id)a3 completion:(id)a4 firstPaintCompletion:(id)a5
{
  id v7 = a3;
  v15.receiver = self;
  v15.super_class = (Class)MessageDisplayRequest;
  v8 = [(MessageDisplayRequest *)&v15 init];
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_message, a3);
    v10 = (EFPromise *)objc_alloc_init((Class)EFPromise);
    startPromise = v9->_startPromise;
    v9->_startPromise = v10;

    v12 = (EFPromise *)objc_alloc_init((Class)EFPromise);
    finishPromise = v9->_finishPromise;
    v9->_finishPromise = v12;

    v9->_lock._os_unfair_lock_opaque = 0;
  }

  return v9;
}

- (void)didBeginProcessingRequest
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  if (self->_hasStarted)
  {
    os_unfair_lock_unlock(p_lock);
  }
  else
  {
    self->_hasStarted = 1;
    os_unfair_lock_unlock(p_lock);
    id v5 = +[NSNotificationCenter defaultCenter];
    [v5 addObserver:self selector:"_messageViewDidFinishFirstPaint:" name:MFMessageContentViewDidFinishFirstPaint object:0];

    startPromise = self->_startPromise;
    id v6 = +[NSNull null];
    -[EFPromise finishWithResult:](startPromise, "finishWithResult:");
  }
}

- (void)requestAbortedWithError:(id)a3
{
  id v6 = a3;
  os_unfair_lock_lock(&self->_lock);
  BOOL hasStarted = self->_hasStarted;
  if (!self->_hasStarted) {
    self->_BOOL hasStarted = 1;
  }
  BOOL hasFinished = self->_hasFinished;
  if (!self->_hasFinished) {
    self->_BOOL hasFinished = 1;
  }
  os_unfair_lock_unlock(&self->_lock);
  if (!hasStarted) {
    [(EFPromise *)self->_startPromise finishWithError:v6];
  }
  if (!hasFinished) {
    [(EFPromise *)self->_finishPromise finishWithError:v6];
  }
}

- (EFFuture)startFuture
{
  return (EFFuture *)[(EFPromise *)self->_startPromise future];
}

- (EFFuture)finishFuture
{
  return (EFFuture *)[(EFPromise *)self->_finishPromise future];
}

- (void)_messageViewDidFinishFirstPaint:(id)a3
{
  id v16 = a3;
  os_unfair_lock_lock(&self->_lock);
  BOOL hasFinished = self->_hasFinished;
  os_unfair_lock_unlock(&self->_lock);
  id v5 = v16;
  if (!hasFinished)
  {
    id v6 = [v16 userInfo];
    id v7 = [v6 objectForKeyedSubscript:MFMessageContentViewDidFinishFirstPaintMessageKey];
    v8 = [v7 itemID];
    v9 = [(MessageDisplayRequest *)self message];
    v10 = [v9 itemID];
    unsigned int v11 = [v8 isEqual:v10];

    if (v11)
    {
      os_unfair_lock_lock(&self->_lock);
      if (self->_hasFinished)
      {
        os_unfair_lock_unlock(&self->_lock);
      }
      else
      {
        self->_BOOL hasFinished = 1;
        os_unfair_lock_unlock(&self->_lock);
        v12 = +[NSNotificationCenter defaultCenter];
        [v12 removeObserver:self name:MFMessageContentViewDidFinishFirstPaint object:0];

        v13 = [v6 objectForKeyedSubscript:MFMessageContentViewDidFinishFirstPaintErrorKey];
        finishPromise = self->_finishPromise;
        if (v13)
        {
          [(EFPromise *)finishPromise finishWithError:v13];
        }
        else
        {
          objc_super v15 = +[NSNull null];
          [(EFPromise *)finishPromise finishWithResult:v15];
        }
      }
    }

    id v5 = v16;
  }
}

- (EMMessage)message
{
  return self->_message;
}

- (void)setMessage:(id)a3
{
}

- (EFPromise)startPromise
{
  return self->_startPromise;
}

- (void)setStartPromise:(id)a3
{
}

- (EFPromise)finishPromise
{
  return self->_finishPromise;
}

- (void)setFinishPromise:(id)a3
{
}

- (BOOL)hasStarted
{
  return self->_hasStarted;
}

- (void)setHasStarted:(BOOL)a3
{
  self->_BOOL hasStarted = a3;
}

- (BOOL)hasFinished
{
  return self->_hasFinished;
}

- (void)setHasFinished:(BOOL)a3
{
  self->_BOOL hasFinished = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_finishPromise, 0);
  objc_storeStrong((id *)&self->_startPromise, 0);

  objc_storeStrong((id *)&self->_message, 0);
}

@end