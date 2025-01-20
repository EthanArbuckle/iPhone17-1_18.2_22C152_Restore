@interface TCMessageException
+ (id)exceptionWithMessage:(TCTaggedMessageStructure *)a3;
+ (id)exceptionWithUntaggedMessage:(id)a3;
+ (id)nsError:(id)a3 domain:(id)a4;
+ (void)initialize;
+ (void)raise:(TCTaggedMessageStructure *)a3;
+ (void)raiseUntaggedMessage:(id)a3;
- (TCMessageException)initWithMessage:(TCTaggedMessageStructure *)a3;
- (TCMessageException)initWithUntaggedMessage:(id)a3;
- (id)description;
- (id)getEntry;
- (void)dealloc;
@end

@implementation TCMessageException

+ (void)initialize
{
  if ((id)objc_opt_class() == a1 && (byte_5733A4 & 1) == 0)
  {
    byte_5733A4 = 1;
    objc_opt_class();
  }
}

- (TCMessageException)initWithMessage:(TCTaggedMessageStructure *)a3
{
  v6.receiver = self;
  v6.super_class = (Class)TCMessageException;
  v4 = [(TCMessageException *)&v6 initWithName:@"TCMessageException" reason:0 userInfo:0];
  if (v4) {
    v4->m_entry = [[TCMessageEntry alloc] initWithTag:a3->var0 affectedObject:0 text:a3->var1 parameters:&v7];
  }
  return v4;
}

- (TCMessageException)initWithUntaggedMessage:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)TCMessageException;
  v4 = [(TCMessageException *)&v6 initWithName:@"TCMessageException" reason:0 userInfo:0];
  if (v4) {
    v4->m_entry = [[TCMessageEntry alloc] initWithTag:0xFFFFFFFFLL affectedObject:0 text:a3 parameters:&v7];
  }
  return v4;
}

+ (id)exceptionWithMessage:(TCTaggedMessageStructure *)a3
{
  v4 = [objc_alloc((Class)a1) initWithName:@"TCMessageException" reason:0 userInfo:0];
  if (v4) {
    v4[5] = [[TCMessageEntry alloc] initWithTag:a3->var0 affectedObject:0 text:a3->var1 parameters:&v6];
  }
  return v4;
}

+ (id)exceptionWithUntaggedMessage:(id)a3
{
  v4 = [objc_alloc((Class)a1) initWithName:@"TCMessageException" reason:0 userInfo:0];
  if (v4) {
    v4[5] = [[TCMessageEntry alloc] initWithTag:0xFFFFFFFFLL affectedObject:0 text:a3 parameters:&v6];
  }
  return v4;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)TCMessageException;
  [(TCMessageException *)&v3 dealloc];
}

- (id)getEntry
{
  return self->m_entry;
}

+ (void)raise:(TCTaggedMessageStructure *)a3
{
  v4 = +[TCMessageException exceptionWithName:@"TCMessageException" reason:0 userInfo:0];
  v4->m_entry = [[TCMessageEntry alloc] initWithTag:a3->var0 affectedObject:0 text:a3->var1 parameters:&v5];
  [(TCMessageException *)v4 raise];
}

+ (void)raiseUntaggedMessage:(id)a3
{
  v4 = +[TCMessageException exceptionWithName:@"TCMessageException" reason:0 userInfo:0];
  v4->m_entry = [[TCMessageEntry alloc] initWithTag:0xFFFFFFFFLL affectedObject:0 text:a3 parameters:&v5];
  [(TCMessageException *)v4 raise];
}

- (id)description
{
  return +[NSString stringWithFormat:@"TCMessageException: %@", [(TCMessageEntry *)self->m_entry description]];
}

+ (id)nsError:(id)a3 domain:(id)a4
{
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v6 = objc_msgSend(objc_msgSend(a3, "getEntry"), "getMessageText");
    signed int v7 = [[a3 getEntry] getMessageTag];
  }
  else
  {
    uint64_t v8 = TCUnknownProblemMessage;
    unsigned int v9 = objc_msgSend(objc_msgSend(a3, "name"), "isEqualToString:", NSMallocException);
    signed int v7 = 0;
    uint64_t v10 = TCOutOfMemoryMessage;
    if (!v9) {
      uint64_t v10 = v8;
    }
    id v6 = *(id *)(v10 + 8);
  }
  if ([v6 isEqualToString:@"TCUserCancelled"])
  {
    v11 = 0;
    a4 = NSCocoaErrorDomain;
    signed int v7 = 3072;
  }
  else
  {
    v11 = +[NSDictionary dictionaryWithObjectsAndKeys:](NSDictionary, "dictionaryWithObjectsAndKeys:", v6, NSLocalizedDescriptionKey, 0);
  }
  id v12 = [a3 userInfo];
  v13 = (objc_class *)objc_opt_class();
  id result = [v12 objectForKeyedSubscript:NSStringFromClass(v13)];
  if (!result)
  {
    return +[NSError errorWithDomain:a4 code:v7 userInfo:v11];
  }
  return result;
}

@end