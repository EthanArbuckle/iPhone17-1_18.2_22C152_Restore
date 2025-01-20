@interface ConversationSearchTextRange
- (BOOL)isEmpty;
- (ConversationSearchTextRange)initWithWebkitRange:(id)a3 documentID:(id)a4;
- (id)description;
- (id)end;
- (id)start;
@end

@implementation ConversationSearchTextRange

- (id)description
{
  v3 = (objc_class *)objc_opt_class();
  return +[NSString stringWithFormat:@"<%s: %p, id: %@, webkitRange: %@", class_getName(v3), self, self->_documentID, self->_webkitRange];
}

- (ConversationSearchTextRange)initWithWebkitRange:(id)a3 documentID:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)ConversationSearchTextRange;
  v9 = [(ConversationSearchTextRange *)&v12 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_webkitRange, a3);
    objc_storeStrong((id *)&v10->_documentID, a4);
  }

  return v10;
}

- (BOOL)isEmpty
{
  if (self) {
    self = (ConversationSearchTextRange *)self->_webkitRange;
  }
  return [(ConversationSearchTextRange *)self isEmpty];
}

- (id)start
{
  if (self) {
    self = (ConversationSearchTextRange *)self->_webkitRange;
  }
  v2 = [(ConversationSearchTextRange *)self start];

  return v2;
}

- (id)end
{
  if (self) {
    self = (ConversationSearchTextRange *)self->_webkitRange;
  }
  v2 = [(ConversationSearchTextRange *)self end];

  return v2;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_documentID, 0);

  objc_storeStrong((id *)&self->_webkitRange, 0);
}

@end