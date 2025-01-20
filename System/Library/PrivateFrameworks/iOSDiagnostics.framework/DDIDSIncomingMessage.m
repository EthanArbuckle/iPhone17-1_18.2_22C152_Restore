@interface DDIDSIncomingMessage
- (DAIDSDestination)destination;
- (DAIDSMessageObject)data;
- (DDIDSIncomingMessage)initWithIncomingDictionary:(id)a3 destination:(id)a4;
- (NSString)description;
- (NSString)message;
@end

@implementation DDIDSIncomingMessage

- (DDIDSIncomingMessage)initWithIncomingDictionary:(id)a3 destination:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v22.receiver = self;
  v22.super_class = (Class)DDIDSIncomingMessage;
  v8 = [(DDIDSIncomingMessage *)&v22 init];
  if (v8)
  {
    v9 = [v6 objectForKeyedSubscript:@"messageName"];

    if (!v9) {
      goto LABEL_9;
    }
    uint64_t v10 = [v6 objectForKeyedSubscript:@"messageName"];
    message = v8->_message;
    v8->_message = (NSString *)v10;

    objc_storeStrong((id *)&v8->_destination, a4);
    uint64_t v12 = [v6 objectForKeyedSubscript:@"data"];
    if (v12)
    {
      v13 = (void *)v12;
      v14 = +[DAIDSMessengerProxy allowedDataClasses];
      id v21 = 0;
      uint64_t v15 = +[NSKeyedUnarchiver _strictlyUnarchivedObjectOfClasses:v14 fromData:v13 error:&v21];
      id v16 = v21;
      data = v8->_data;
      v8->_data = (DAIDSMessageObject *)v15;

      if (v16)
      {
        v18 = DiagnosticLogHandleForCategory();
        if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR)) {
          sub_10000D390(v6, v16, v18);
        }
      }
      v19 = v8->_data;

      if (!v19)
      {
LABEL_9:

        v8 = 0;
      }
    }
  }

  return v8;
}

- (NSString)description
{
  v3 = [(DDIDSIncomingMessage *)self message];
  v4 = [(DDIDSIncomingMessage *)self data];
  v5 = +[NSString stringWithFormat:@"message: %@; data: %@", v3, v4];

  return (NSString *)v5;
}

- (NSString)message
{
  return self->_message;
}

- (DAIDSMessageObject)data
{
  return self->_data;
}

- (DAIDSDestination)destination
{
  return self->_destination;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_destination, 0);
  objc_storeStrong((id *)&self->_data, 0);

  objc_storeStrong((id *)&self->_message, 0);
}

@end