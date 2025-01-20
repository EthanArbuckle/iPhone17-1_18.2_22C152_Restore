@interface _SWCPatternMatchingEngine
+ (id)new;
- (_SWCPatternMatchingEngine)init;
- (_SWCPatternMatchingEngine)initWithPatternDictionaries:(id)a3;
- (_SWCPatternMatchingEngine)initWithPatternDictionaries:(id)a3 substitutionVariables:(id)a4;
- (id)_evaluateURLComponents:(id)a3 auditToken:(id *)a4;
- (id)evaluateURLComponents:(id)a3;
- (id)evaluateURLComponents:(id)a3 auditToken:(id *)a4;
@end

@implementation _SWCPatternMatchingEngine

+ (id)new
{
}

- (_SWCPatternMatchingEngine)init
{
}

- (_SWCPatternMatchingEngine)initWithPatternDictionaries:(id)a3
{
  return [(_SWCPatternMatchingEngine *)self initWithPatternDictionaries:a3 substitutionVariables:0];
}

- (_SWCPatternMatchingEngine)initWithPatternDictionaries:(id)a3 substitutionVariables:(id)a4
{
  v20[1] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  v16.receiver = self;
  v16.super_class = (Class)_SWCPatternMatchingEngine;
  v8 = [(_SWCPatternMatchingEngine *)&v16 init];
  if (v8)
  {
    v19 = @"components";
    v20[0] = v6;
    v9 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v20 forKeys:&v19 count:1];
    uint64_t v10 = +[_SWCPatternList patternListWithDetailsDictionary:v9];
    patternList = v8->_patternList;
    v8->_patternList = (_SWCPatternList *)v10;

    if (v7)
    {
      v17 = @"substitutionVariables";
      id v18 = v7;
      v12 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v18 forKeys:&v17 count:1];
      uint64_t v13 = +[_SWCSubstitutionVariableList substitutionVariableListWithDictionary:v12];
      subVarList = v8->_subVarList;
      v8->_subVarList = (_SWCSubstitutionVariableList *)v13;
    }
  }

  return v8;
}

- (id)_evaluateURLComponents:(id)a3 auditToken:(id *)a4
{
  id v6 = a3;
  uint64_t v10 = 0x7FFFFFFFFFFFFFFFLL;
  id v7 = [(_SWCPatternList *)self->_patternList evaluateWithURLComponents:v6 substitutionVariables:self->_subVarList auditToken:a4 matchingPattern:0 index:&v10];
  if (v7)
  {
    v8 = [_SWCPatternMatchingResult alloc];
    id v7 = [(_SWCPatternMatchingResult *)v8 _initWithIndex:v10 excluded:v7 == (id)100];
  }

  return v7;
}

- (id)evaluateURLComponents:(id)a3
{
  v3 = [(_SWCPatternMatchingEngine *)self _evaluateURLComponents:a3 auditToken:0];
  return v3;
}

- (id)evaluateURLComponents:(id)a3 auditToken:(id *)a4
{
  v4 = [(_SWCPatternMatchingEngine *)self _evaluateURLComponents:a3 auditToken:a4];
  return v4;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_subVarList, 0);
  objc_storeStrong((id *)&self->_patternList, 0);
}

@end