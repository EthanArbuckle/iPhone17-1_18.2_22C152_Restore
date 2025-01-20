@interface _BKEventUpdateGeneration
- (NSString)description;
- (_BKEventUpdateGeneration)init;
- (void)appendDescriptionToStream:(id)a3;
@end

@implementation _BKEventUpdateGeneration

- (void).cxx_destruct
{
}

- (void)appendDescriptionToStream:(id)a3
{
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_10003BF7C;
  v6[3] = &unk_1000F8E50;
  v6[4] = a3;
  v6[5] = self;
  [a3 appendProem:0 block:v6];
  id v5 = [a3 appendObject:self->_clients withName:@"clients"];
}

- (NSString)description
{
  return (NSString *)+[BSDescriptionStream descriptionForRootObject:self];
}

- (_BKEventUpdateGeneration)init
{
  v6.receiver = self;
  v6.super_class = (Class)_BKEventUpdateGeneration;
  v2 = [(_BKEventUpdateGeneration *)&v6 init];
  if (v2)
  {
    v3 = (NSMutableArray *)objc_alloc_init((Class)NSMutableArray);
    clients = v2->_clients;
    v2->_clients = v3;
  }
  return v2;
}

@end