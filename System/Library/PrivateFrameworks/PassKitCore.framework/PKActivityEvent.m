@interface PKActivityEvent
+ (id)eventsWithTransactions:(id)a3;
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqualToActivityEvent:(id)a3;
- (BOOL)isUnread;
- (NSDate)date;
- (NSString)eventType;
- (NSString)identifier;
- (PKActivityEvent)initWithIdentifier:(id)a3 date:(id)a4 unread:(BOOL)a5;
- (unint64_t)hash;
@end

@implementation PKActivityEvent

+ (id)eventsWithTransactions:(id)a3
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  id v4 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  id v5 = v3;
  uint64_t v6 = [v5 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v16;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v16 != v8) {
          objc_enumerationMutation(v5);
        }
        v10 = *(void **)(*((void *)&v15 + 1) + 8 * i);
        if (objc_msgSend(v10, "transactionType", (void)v15) == 3) {
          v11 = off_1E56D4830;
        }
        else {
          v11 = off_1E56D4838;
        }
        v12 = (void *)[objc_alloc(*v11) initWithTransaction:v10 unread:0];
        [v4 addObject:v12];
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v15 objects:v19 count:16];
    }
    while (v7);
  }

  v13 = (void *)[v4 copy];
  return v13;
}

- (PKActivityEvent)initWithIdentifier:(id)a3 date:(id)a4 unread:(BOOL)a5
{
  id v8 = a3;
  id v9 = a4;
  v16.receiver = self;
  v16.super_class = (Class)PKActivityEvent;
  v10 = [(PKActivityEvent *)&v16 init];
  if (v10)
  {
    uint64_t v11 = [v8 copy];
    identifier = v10->_identifier;
    v10->_identifier = (NSString *)v11;

    uint64_t v13 = [v9 copy];
    date = v10->_date;
    v10->_date = (NSDate *)v13;

    v10->_unread = a5;
  }

  return v10;
}

- (unint64_t)hash
{
  NSUInteger v3 = [(NSString *)self->_identifier hash];
  uint64_t v4 = [(NSDate *)self->_date hash] - v3 + 32 * v3;
  id v5 = [NSNumber numberWithBool:self->_unread];
  unint64_t v6 = [v5 hash] - v4 + 32 * v4 + 506447;

  return v6;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  BOOL v5 = (objc_opt_isKindOfClass() & 1) != 0
    && [(PKActivityEvent *)self isEqualToActivityEvent:v4];

  return v5;
}

- (BOOL)isEqualToActivityEvent:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0 || self->_unread == (v4[8] == 0)) {
    goto LABEL_10;
  }
  date = self->_date;
  unint64_t v6 = (NSDate *)*((void *)v4 + 4);
  if (!date || !v6)
  {
    if (date == v6) {
      goto LABEL_6;
    }
LABEL_10:
    char v9 = 0;
    goto LABEL_11;
  }
  if ((-[NSDate isEqual:](date, "isEqual:") & 1) == 0) {
    goto LABEL_10;
  }
LABEL_6:
  identifier = self->_identifier;
  id v8 = (NSString *)*((void *)v4 + 3);
  if (identifier && v8) {
    char v9 = -[NSString isEqual:](identifier, "isEqual:");
  }
  else {
    char v9 = identifier == v8;
  }
LABEL_11:

  return v9;
}

- (NSString)eventType
{
  return self->_eventType;
}

- (NSString)identifier
{
  return self->_identifier;
}

- (NSDate)date
{
  return self->_date;
}

- (BOOL)isUnread
{
  return self->_unread;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_date, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
}

@end