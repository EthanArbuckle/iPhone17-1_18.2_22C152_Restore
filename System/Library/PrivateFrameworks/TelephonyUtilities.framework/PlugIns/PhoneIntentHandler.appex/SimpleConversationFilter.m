@interface SimpleConversationFilter
+ (id)filterForCallGroup:(id)a3;
+ (id)filterForParticipantCount:(unint64_t)a3;
- (BOOL)matches:(id)a3;
- (SimpleConversationFilter)initWithPredicate:(id)a3;
- (id)predicate;
- (void)setPredicate:(id)a3;
@end

@implementation SimpleConversationFilter

- (SimpleConversationFilter)initWithPredicate:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)SimpleConversationFilter;
  v5 = [(SimpleConversationFilter *)&v9 init];
  if (v5)
  {
    id v6 = objc_retainBlock(v4);
    id predicate = v5->_predicate;
    v5->_id predicate = v6;
  }
  return v5;
}

- (BOOL)matches:(id)a3
{
  id v4 = a3;
  v5 = [(SimpleConversationFilter *)self predicate];
  char v6 = ((uint64_t (**)(void, id))v5)[2](v5, v4);

  return v6;
}

+ (id)filterForCallGroup:(id)a3
{
  id v3 = a3;
  id v4 = [SimpleConversationFilter alloc];
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_1000062D0;
  v8[3] = &unk_10004CCA0;
  id v9 = v3;
  id v5 = v3;
  char v6 = [(SimpleConversationFilter *)v4 initWithPredicate:v8];

  return v6;
}

+ (id)filterForParticipantCount:(unint64_t)a3
{
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_1000064C0;
  v5[3] = &unk_10004CCC0;
  v5[4] = a3;
  id v3 = [[SimpleConversationFilter alloc] initWithPredicate:v5];

  return v3;
}

- (id)predicate
{
  return self->_predicate;
}

- (void)setPredicate:(id)a3
{
}

- (void).cxx_destruct
{
}

@end