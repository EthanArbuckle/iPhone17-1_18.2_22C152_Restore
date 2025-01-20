@interface SmartRoutingWxInfo
- (NSString)lastConnectResult;
- (NSString)lastEvalResult;
- (unint64_t)lastConnectTicks;
- (unint64_t)lastConnectTime;
- (unint64_t)lastEvalTicks;
- (void)setLastConnectResult:(id)a3;
- (void)setLastConnectTicks:(unint64_t)a3;
- (void)setLastConnectTime:(unint64_t)a3;
- (void)setLastEvalResult:(id)a3;
- (void)setLastEvalTicks:(unint64_t)a3;
@end

@implementation SmartRoutingWxInfo

- (unint64_t)lastConnectTime
{
  return self->_lastConnectTime;
}

- (void)setLastConnectTime:(unint64_t)a3
{
  self->_lastConnectTime = a3;
}

- (unint64_t)lastConnectTicks
{
  return self->_lastConnectTicks;
}

- (void)setLastConnectTicks:(unint64_t)a3
{
  self->_lastConnectTicks = a3;
}

- (NSString)lastConnectResult
{
  return self->_lastConnectResult;
}

- (void)setLastConnectResult:(id)a3
{
}

- (NSString)lastEvalResult
{
  return self->_lastEvalResult;
}

- (void)setLastEvalResult:(id)a3
{
}

- (unint64_t)lastEvalTicks
{
  return self->_lastEvalTicks;
}

- (void)setLastEvalTicks:(unint64_t)a3
{
  self->_lastEvalTicks = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lastEvalResult, 0);

  objc_storeStrong((id *)&self->_lastConnectResult, 0);
}

@end