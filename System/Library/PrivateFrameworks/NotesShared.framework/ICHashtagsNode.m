@interface ICHashtagsNode
- (BOOL)isPossibleAll;
- (NSMutableDictionary)children;
- (NSMutableSet)hashtagSuggestions;
- (NSMutableSet)possibleHashtagSuggestions;
- (NSString)key;
- (void)addChild:(id)a3;
- (void)addHashtagSuggestion:(id)a3;
- (void)addPossibleHashtagSuggestion:(id)a3;
- (void)setIsPossibleAll:(BOOL)a3;
- (void)setKey:(id)a3;
@end

@implementation ICHashtagsNode

- (NSMutableSet)hashtagSuggestions
{
  hashtagSuggestions = self->_hashtagSuggestions;
  if (!hashtagSuggestions)
  {
    v4 = (NSMutableSet *)[objc_alloc(MEMORY[0x1E4F1CA80]) initWithCapacity:1];
    v5 = self->_hashtagSuggestions;
    self->_hashtagSuggestions = v4;

    hashtagSuggestions = self->_hashtagSuggestions;
  }
  return hashtagSuggestions;
}

- (NSMutableSet)possibleHashtagSuggestions
{
  possibleHashtagSuggestions = self->_possibleHashtagSuggestions;
  if (!possibleHashtagSuggestions)
  {
    v4 = (NSMutableSet *)[objc_alloc(MEMORY[0x1E4F1CA80]) initWithCapacity:1];
    v5 = self->_possibleHashtagSuggestions;
    self->_possibleHashtagSuggestions = v4;

    possibleHashtagSuggestions = self->_possibleHashtagSuggestions;
  }
  return possibleHashtagSuggestions;
}

- (void)addHashtagSuggestion:(id)a3
{
  id v5 = a3;
  v4 = [(ICHashtagsNode *)self hashtagSuggestions];
  [v4 addObject:v5];

  [(ICHashtagsNode *)self addPossibleHashtagSuggestion:v5];
}

- (void)addPossibleHashtagSuggestion:(id)a3
{
  id v4 = a3;
  id v5 = [(ICHashtagsNode *)self possibleHashtagSuggestions];
  [v5 addObject:v4];
}

- (void)addChild:(id)a3
{
  id v4 = a3;
  children = self->_children;
  id v9 = v4;
  if (!children)
  {
    v6 = (NSMutableDictionary *)[objc_alloc(MEMORY[0x1E4F1CA60]) initWithCapacity:1];
    v7 = self->_children;
    self->_children = v6;

    id v4 = v9;
    children = self->_children;
  }
  v8 = [v4 key];
  [(NSMutableDictionary *)children setObject:v9 forKey:v8];
}

- (NSString)key
{
  return self->_key;
}

- (void)setKey:(id)a3
{
}

- (NSMutableDictionary)children
{
  return self->_children;
}

- (BOOL)isPossibleAll
{
  return self->_isPossibleAll;
}

- (void)setIsPossibleAll:(BOOL)a3
{
  self->_isPossibleAll = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_children, 0);
  objc_storeStrong((id *)&self->_key, 0);
  objc_storeStrong((id *)&self->_possibleHashtagSuggestions, 0);
  objc_storeStrong((id *)&self->_hashtagSuggestions, 0);
}

@end