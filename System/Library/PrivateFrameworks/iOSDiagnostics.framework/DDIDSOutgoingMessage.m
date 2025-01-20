@interface DDIDSOutgoingMessage
- (BOOL)expectsResponse;
- (BOOL)forceLocalDelivery;
- (DAIDSDestination)destination;
- (DDIDSOutgoingMessage)initWithDestination:(id)a3 message:(id)a4 data:(id)a5;
- (DDIDSOutgoingMessage)initWithDestination:(id)a3 message:(id)a4 data:(id)a5 forceLocalDelivery:(BOOL)a6 expectsResponse:(BOOL)a7 response:(id)a8;
- (NSDictionary)dictionary;
- (NSString)description;
- (NSString)identifier;
- (NSString)peerResponseIdentifier;
- (id)response;
- (int64_t)retryCount;
- (void)setIdentifier:(id)a3;
- (void)setPeerResponseIdentifier:(id)a3;
- (void)setRetryCount:(int64_t)a3;
@end

@implementation DDIDSOutgoingMessage

- (DDIDSOutgoingMessage)initWithDestination:(id)a3 message:(id)a4 data:(id)a5
{
  return [(DDIDSOutgoingMessage *)self initWithDestination:a3 message:a4 data:a5 forceLocalDelivery:1 expectsResponse:0 response:0];
}

- (DDIDSOutgoingMessage)initWithDestination:(id)a3 message:(id)a4 data:(id)a5 forceLocalDelivery:(BOOL)a6 expectsResponse:(BOOL)a7 response:(id)a8
{
  id v15 = a3;
  id v16 = a4;
  id v17 = a5;
  id v18 = a8;
  v32.receiver = self;
  v32.super_class = (Class)DDIDSOutgoingMessage;
  v19 = [(DDIDSOutgoingMessage *)&v32 init];
  if (v19)
  {
    BOOL v30 = a7;
    v20 = +[NSMutableDictionary dictionary];
    if (v17)
    {
      id v31 = 0;
      v21 = +[NSKeyedArchiver archivedDataWithRootObject:v17 requiringSecureCoding:1 error:&v31];
      id v22 = v31;
      [(NSDictionary *)v20 setObject:v21 forKeyedSubscript:@"data"];

      if (v22)
      {
        v23 = DiagnosticLogHandleForCategory();
        if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR)) {
          sub_10000D2F8(v22, v23);
        }
      }
      else
      {
        v24 = (objc_class *)objc_opt_class();
        v23 = NSStringFromClass(v24);
        [(NSDictionary *)v20 setObject:v23 forKeyedSubscript:@"class"];
      }
    }
    [(NSDictionary *)v20 setObject:v16 forKeyedSubscript:@"messageName"];
    dictionary = v19->_dictionary;
    v19->_dictionary = v20;
    v26 = v20;

    objc_storeStrong((id *)&v19->_destination, a3);
    v19->_forceLocalDelivery = a6;
    v19->_retryCount = 0;
    id v27 = objc_retainBlock(v18);
    id response = v19->_response;
    v19->_id response = v27;

    v19->_expectsResponse = v30;
  }

  return v19;
}

- (NSString)description
{
  v3 = [(DDIDSOutgoingMessage *)self dictionary];
  v4 = +[NSNumber numberWithInteger:[(DDIDSOutgoingMessage *)self retryCount]];
  +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"dictionary: %@; retry count: %@",
    v3,
  v5 = v4);

  return (NSString *)v5;
}

- (NSDictionary)dictionary
{
  return self->_dictionary;
}

- (DAIDSDestination)destination
{
  return self->_destination;
}

- (BOOL)forceLocalDelivery
{
  return self->_forceLocalDelivery;
}

- (BOOL)expectsResponse
{
  return self->_expectsResponse;
}

- (id)response
{
  return self->_response;
}

- (int64_t)retryCount
{
  return self->_retryCount;
}

- (void)setRetryCount:(int64_t)a3
{
  self->_retryCount = a3;
}

- (NSString)identifier
{
  return self->_identifier;
}

- (void)setIdentifier:(id)a3
{
}

- (NSString)peerResponseIdentifier
{
  return self->_peerResponseIdentifier;
}

- (void)setPeerResponseIdentifier:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_peerResponseIdentifier, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_storeStrong(&self->_response, 0);
  objc_storeStrong((id *)&self->_destination, 0);

  objc_storeStrong((id *)&self->_dictionary, 0);
}

@end