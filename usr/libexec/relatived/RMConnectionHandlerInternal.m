@interface RMConnectionHandlerInternal
- (BOOL)isEqual:(id)a3;
@end

@implementation RMConnectionHandlerInternal

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    msgHandler = self->_msgHandler;
    if (v4)
    {
      v6 = (RMConnectionEndpoint *)*((id *)v4 + 1);
      if (msgHandler != (RMConnectionDataDelegate *)v6)
      {
LABEL_4:
        BOOL v7 = 0;
LABEL_8:

        goto LABEL_9;
      }
      v6 = (RMConnectionEndpoint *)*((void *)v4 + 2);
    }
    else
    {
      v6 = 0;
      if (msgHandler) {
        goto LABEL_4;
      }
      msgHandler = 0;
    }
    BOOL v7 = self->_endpoint == v6;
    v6 = (RMConnectionEndpoint *)msgHandler;
    goto LABEL_8;
  }
  BOOL v7 = 0;
LABEL_9:

  return v7;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_endpoint, 0);

  objc_storeStrong((id *)&self->_msgHandler, 0);
}

@end