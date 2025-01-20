@interface TTKConversationTest
+ (id)fromJsonDict:(id)a3;
+ (id)testWithConversation:(id)a3 sendersToTest:(id)a4 warmupMessages:(unint64_t)a5 adaptToSentMessages:(BOOL)a6 adaptToReceivedMessages:(BOOL)a7;
- (BOOL)adaptToReceivedMessages;
- (BOOL)adaptToSentMessages;
- (NSArray)conversation;
- (NSSet)sendersToTest;
- (id)overridingJsonKeys:(id)a3;
- (id)toJsonDict;
- (unint64_t)warmupMessages;
@end

@implementation TTKConversationTest

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sendersToTest, 0);
  objc_storeStrong((id *)&self->_conversation, 0);
}

- (BOOL)adaptToReceivedMessages
{
  return self->_adaptToReceivedMessages;
}

- (BOOL)adaptToSentMessages
{
  return self->_adaptToSentMessages;
}

- (unint64_t)warmupMessages
{
  return self->_warmupMessages;
}

- (NSSet)sendersToTest
{
  return self->_sendersToTest;
}

- (NSArray)conversation
{
  return self->_conversation;
}

- (id)overridingJsonKeys:(id)a3
{
  id v4 = a3;
  v5 = [(TTKConversationTest *)self toJsonDict];
  v6 = (void *)[v5 mutableCopy];

  [v6 addEntriesFromDictionary:v4];
  v7 = +[TTKConversationTest fromJsonDict:v6];

  return v7;
}

- (id)toJsonDict
{
  v11[5] = *MEMORY[0x263EF8340];
  v10[0] = @"conversation";
  v3 = conversationToJsonArray(self->_conversation);
  v11[0] = v3;
  v10[1] = @"sendersToTest";
  id v4 = [(NSSet *)self->_sendersToTest allObjects];
  v11[1] = v4;
  v10[2] = @"warmupMessages";
  v5 = [NSNumber numberWithInt:LODWORD(self->_warmupMessages)];
  v11[2] = v5;
  v10[3] = @"adaptToSentMessages";
  v6 = [NSNumber numberWithBool:self->_adaptToSentMessages];
  v11[3] = v6;
  v10[4] = @"adaptToReceivedMessages";
  v7 = [NSNumber numberWithBool:self->_adaptToReceivedMessages];
  v11[4] = v7;
  v8 = [NSDictionary dictionaryWithObjects:v11 forKeys:v10 count:5];

  return v8;
}

+ (id)fromJsonDict:(id)a3
{
  id v3 = a3;
  id v4 = [v3 objectForKeyedSubscript:@"warmupMessages"];

  if (v4)
  {
    v5 = [v3 objectForKeyedSubscript:@"warmupMessages"];
    int v6 = [v5 intValue];

    uint64_t v7 = v6;
  }
  else
  {
    uint64_t v7 = 0;
  }
  v8 = [v3 objectForKeyedSubscript:@"conversation"];
  v9 = conversationFromJsonArray(v8);
  v10 = [v3 objectForKeyedSubscript:@"sendersToTest"];
  v11 = [v3 objectForKeyedSubscript:@"adaptToSentMessages"];
  uint64_t v12 = [v11 BOOLValue];
  v13 = [v3 objectForKeyedSubscript:@"adaptToReceivedMessages"];
  v14 = +[TTKConversationTest testWithConversation:sendersToTest:warmupMessages:adaptToSentMessages:adaptToReceivedMessages:](TTKConversationTest, "testWithConversation:sendersToTest:warmupMessages:adaptToSentMessages:adaptToReceivedMessages:", v9, v10, v7, v12, [v13 BOOLValue]);

  return v14;
}

+ (id)testWithConversation:(id)a3 sendersToTest:(id)a4 warmupMessages:(unint64_t)a5 adaptToSentMessages:(BOOL)a6 adaptToReceivedMessages:(BOOL)a7
{
  id v12 = a3;
  id v13 = a4;
  v14 = objc_alloc_init(TTKConversationTest);
  v15 = v14;
  if (v14)
  {
    objc_storeStrong((id *)&v14->_conversation, a3);
    uint64_t v16 = [MEMORY[0x263EFFA08] setWithArray:v13];
    sendersToTest = v15->_sendersToTest;
    v15->_sendersToTest = (NSSet *)v16;

    v15->_warmupMessages = a5;
    v15->_adaptToSentMessages = a6;
    v15->_adaptToReceivedMessages = a7;
  }

  return v15;
}

@end