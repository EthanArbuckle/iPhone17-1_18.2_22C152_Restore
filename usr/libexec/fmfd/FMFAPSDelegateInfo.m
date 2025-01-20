@interface FMFAPSDelegateInfo
- (FMFAPSDelegate)delegate;
- (NSString)topic;
- (void)setDelegate:(id)a3;
- (void)setTopic:(id)a3;
@end

@implementation FMFAPSDelegateInfo

- (NSString)topic
{
  return self->_topic;
}

- (void)setTopic:(id)a3
{
}

- (FMFAPSDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (FMFAPSDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);

  objc_storeStrong((id *)&self->_topic, 0);
}

@end