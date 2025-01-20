@interface MAProgressHandler
- (MAProgressHandler)initWithCallBack:(id)a3;
- (NSMutableArray)callBackArray;
- (unint64_t)notificationInterval;
- (void)addCallBack:(id)a3;
- (void)setNotificationInterval:(unint64_t)a3;
@end

@implementation MAProgressHandler

- (MAProgressHandler)initWithCallBack:(id)a3
{
  id v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)MAProgressHandler;
  v5 = [(MAProgressHandler *)&v10 init];
  v6 = v5;
  if (v5)
  {
    v5->_notificationInterval = 1;
    uint64_t v7 = objc_opt_new();
    callBackArray = v6->_callBackArray;
    v6->_callBackArray = (NSMutableArray *)v7;

    [(MAProgressHandler *)v6 addCallBack:v4];
  }

  return v6;
}

- (void)addCallBack:(id)a3
{
  if (a3)
  {
    id v6 = (id)[a3 copy];
    callBackArray = self->_callBackArray;
    v5 = (void *)MEMORY[0x1B3EAAEB0]();
    [(NSMutableArray *)callBackArray addObject:v5];
  }
}

- (unint64_t)notificationInterval
{
  return self->_notificationInterval;
}

- (void)setNotificationInterval:(unint64_t)a3
{
  self->_notificationInterval = a3;
}

- (NSMutableArray)callBackArray
{
  return self->_callBackArray;
}

- (void).cxx_destruct
{
}

@end