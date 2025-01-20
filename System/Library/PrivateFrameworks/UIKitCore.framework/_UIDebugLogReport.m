@interface _UIDebugLogReport
- (NSMutableArray)_prefixStack;
- (NSMutableArray)_statements;
- (_UIDebugLogReport)init;
- (id)_messagePrefixAtIndentLevel:(unint64_t)a3;
- (id)fallbackMessagePrefixHandler;
- (unint64_t)currentIndentLevel;
- (unint64_t)messageCount;
- (void)addLineBreak;
- (void)addMessage:(id)a3;
- (void)addMessageWithFormat:(id)a3;
- (void)clearAllMessagePrefixes;
- (void)decrementIndentLevel;
- (void)decrementIndentLevelAndPopMessagePrefix;
- (void)incrementIndentLevel;
- (void)incrementIndentLevelAndPushMessagePrefix:(id)a3;
- (void)popMessagePrefix;
- (void)pushMessagePrefix:(id)a3;
- (void)pushMessagePrefixHandler:(id)a3;
- (void)resetIndentLevel;
- (void)setCurrentIndentLevel:(unint64_t)a3;
- (void)setFallbackMessagePrefixHandler:(id)a3;
- (void)setPrefixStack:(id)a3;
- (void)setStatements:(id)a3;
@end

@implementation _UIDebugLogReport

- (_UIDebugLogReport)init
{
  v8.receiver = self;
  v8.super_class = (Class)_UIDebugLogReport;
  v2 = [(_UIDebugLogReport *)&v8 init];
  if (v2)
  {
    v3 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    statements = v2->_statements;
    v2->_statements = v3;

    v5 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    prefixStack = v2->_prefixStack;
    v2->_prefixStack = v5;
  }
  return v2;
}

- (unint64_t)messageCount
{
  v2 = [(_UIDebugLogReport *)self _statements];
  unint64_t v3 = [v2 count];

  return v3;
}

- (void)addMessageWithFormat:(id)a3
{
  id v5 = a3;
  if (!v5)
  {
    v7 = [MEMORY[0x1E4F28B00] currentHandler];
    [v7 handleFailureInMethod:a2, self, @"_UIDebugLogReport.m", 74, @"Invalid parameter not satisfying: %@", @"messageFormat" object file lineNumber description];
  }
  v6 = (void *)[[NSString alloc] initWithFormat:v5 arguments:&v8];
  [(_UIDebugLogReport *)self addMessage:v6];
}

- (void)addMessage:(id)a3
{
  id v10 = a3;
  if (!v10)
  {
    v9 = [MEMORY[0x1E4F28B00] currentHandler];
    [v9 handleFailureInMethod:a2, self, @"_UIDebugLogReport.m", 86, @"Invalid parameter not satisfying: %@", @"message" object file lineNumber description];
  }
  unint64_t v5 = [(_UIDebugLogReport *)self currentIndentLevel];
  v6 = objc_alloc_init(_UIDebugLogStatement);
  [(_UIDebugLogStatement *)v6 setType:0];
  [(_UIDebugLogStatement *)v6 setIndentLevel:v5];
  v7 = [(_UIDebugLogReport *)self _messagePrefixAtIndentLevel:v5];
  [(_UIDebugLogStatement *)v6 setPrefix:v7];

  [(_UIDebugLogStatement *)v6 setText:v10];
  uint64_t v8 = [(_UIDebugLogReport *)self _statements];
  [v8 addObject:v6];
}

- (void)addLineBreak
{
  v4 = objc_alloc_init(_UIDebugLogStatement);
  [(_UIDebugLogStatement *)v4 setType:1];
  unint64_t v3 = [(_UIDebugLogReport *)self _statements];
  [v3 addObject:v4];
}

- (void)incrementIndentLevel
{
  unint64_t v3 = [(_UIDebugLogReport *)self currentIndentLevel] + 1;
  [(_UIDebugLogReport *)self setCurrentIndentLevel:v3];
}

- (void)decrementIndentLevel
{
  unint64_t v3 = [(_UIDebugLogReport *)self currentIndentLevel] - 1;
  [(_UIDebugLogReport *)self setCurrentIndentLevel:v3];
}

- (void)resetIndentLevel
{
}

- (id)fallbackMessagePrefixHandler
{
  id fallbackMessagePrefixHandler = self->_fallbackMessagePrefixHandler;
  if (!fallbackMessagePrefixHandler)
  {
    self->_id fallbackMessagePrefixHandler = &__block_literal_global_203;
    id fallbackMessagePrefixHandler = &__block_literal_global_203;
  }
  v4 = _Block_copy(fallbackMessagePrefixHandler);
  return v4;
}

- (void)pushMessagePrefix:(id)a3
{
  id v7 = a3;
  if (!v7)
  {
    v6 = [MEMORY[0x1E4F28B00] currentHandler];
    [v6 handleFailureInMethod:a2, self, @"_UIDebugLogReport.m", 140, @"Invalid parameter not satisfying: %@", @"prefix" object file lineNumber description];
  }
  unint64_t v5 = [(_UIDebugLogReport *)self _prefixStack];
  [v5 addObject:v7];
}

- (void)pushMessagePrefixHandler:(id)a3
{
  id aBlock = a3;
  if (!aBlock)
  {
    id v7 = [MEMORY[0x1E4F28B00] currentHandler];
    [v7 handleFailureInMethod:a2, self, @"_UIDebugLogReport.m", 146, @"Invalid parameter not satisfying: %@", @"prefixHandler" object file lineNumber description];
  }
  unint64_t v5 = [(_UIDebugLogReport *)self _prefixStack];
  v6 = _Block_copy(aBlock);
  [v5 addObject:v6];
}

- (void)popMessagePrefix
{
  id v2 = [(_UIDebugLogReport *)self _prefixStack];
  [v2 removeLastObject];
}

- (void)clearAllMessagePrefixes
{
  id v2 = [(_UIDebugLogReport *)self _prefixStack];
  [v2 removeAllObjects];
}

- (id)_messagePrefixAtIndentLevel:(unint64_t)a3
{
  v6 = [(_UIDebugLogReport *)self _prefixStack];
  id v7 = [v6 lastObject];

  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v8 = v7;
    if (v8) {
      goto LABEL_8;
    }
  }
  else if (v7)
  {
    v9 = (void (**)(void *, unint64_t))_Block_copy(v7);
    v9[2](v9, a3);
    id v8 = (id)objc_claimAutoreleasedReturnValue();

    if (v8) {
      goto LABEL_8;
    }
  }
  id v10 = [(_UIDebugLogReport *)self fallbackMessagePrefixHandler];
  v10[2](v10, a3);
  id v8 = (id)objc_claimAutoreleasedReturnValue();

  if (!v8)
  {
    v12 = [MEMORY[0x1E4F28B00] currentHandler];
    [v12 handleFailureInMethod:a2 object:self file:@"_UIDebugLogReport.m" lineNumber:177 description:@"nil message prefixes are not allowed."];
  }
LABEL_8:

  return v8;
}

- (void)incrementIndentLevelAndPushMessagePrefix:(id)a3
{
  id v4 = a3;
  [(_UIDebugLogReport *)self incrementIndentLevel];
  [(_UIDebugLogReport *)self pushMessagePrefix:v4];
}

- (void)decrementIndentLevelAndPopMessagePrefix
{
  [(_UIDebugLogReport *)self popMessagePrefix];
  [(_UIDebugLogReport *)self decrementIndentLevel];
}

- (unint64_t)currentIndentLevel
{
  return self->_currentIndentLevel;
}

- (void)setCurrentIndentLevel:(unint64_t)a3
{
  self->_currentIndentLevel = a3;
}

- (void)setFallbackMessagePrefixHandler:(id)a3
{
}

- (NSMutableArray)_statements
{
  return self->_statements;
}

- (void)setStatements:(id)a3
{
}

- (NSMutableArray)_prefixStack
{
  return self->_prefixStack;
}

- (void)setPrefixStack:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_prefixStack, 0);
  objc_storeStrong((id *)&self->_statements, 0);
  objc_storeStrong(&self->_fallbackMessagePrefixHandler, 0);
}

@end