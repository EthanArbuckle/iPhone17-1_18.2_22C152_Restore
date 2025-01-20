@interface CACProfanityNode
- (CACProfanityNode)init;
- (id)childForKey:(id)a3;
- (id)description;
- (id)originalWordForKey:(id)a3;
- (id)terminalForKey:(id)a3;
- (void)createChildForKey:(id)a3;
- (void)setTerminal:(id)a3 originalWord:(id)a4 forKey:(id)a5;
@end

@implementation CACProfanityNode

- (CACProfanityNode)init
{
  v10.receiver = self;
  v10.super_class = (Class)CACProfanityNode;
  v2 = [(CACProfanityNode *)&v10 init];
  if (v2)
  {
    v3 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x263EFF9A0]);
    childMap = v2->_childMap;
    v2->_childMap = v3;

    v5 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x263EFF9A0]);
    terminalMap = v2->_terminalMap;
    v2->_terminalMap = v5;

    v7 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x263EFF9A0]);
    originalWordMap = v2->_originalWordMap;
    v2->_originalWordMap = v7;
  }
  return v2;
}

- (void)createChildForKey:(id)a3
{
  id v6 = a3;
  v4 = -[NSMutableDictionary objectForKey:](self->_childMap, "objectForKey:");

  if (!v4)
  {
    v5 = objc_alloc_init(CACProfanityNode);
    [(NSMutableDictionary *)self->_childMap setObject:v5 forKey:v6];
  }
}

- (void)setTerminal:(id)a3 originalWord:(id)a4 forKey:(id)a5
{
  terminalMap = self->_terminalMap;
  id v9 = a5;
  id v10 = a4;
  [(NSMutableDictionary *)terminalMap setObject:a3 forKey:v9];
  [(NSMutableDictionary *)self->_originalWordMap setObject:v10 forKey:v9];
}

- (id)childForKey:(id)a3
{
  return (id)[(NSMutableDictionary *)self->_childMap objectForKey:a3];
}

- (id)terminalForKey:(id)a3
{
  return (id)[(NSMutableDictionary *)self->_terminalMap objectForKey:a3];
}

- (id)originalWordForKey:(id)a3
{
  return (id)[(NSMutableDictionary *)self->_originalWordMap objectForKey:a3];
}

- (id)description
{
  v3 = NSString;
  v4 = [(NSMutableDictionary *)self->_childMap allKeys];
  uint64_t v5 = [v4 count];
  if (v5)
  {
    id v6 = [NSString stringWithFormat:@"child:%@", self->_childMap];
  }
  else
  {
    id v6 = &stru_26EB332F0;
  }
  v7 = [(NSMutableDictionary *)self->_terminalMap allKeys];
  if ([v7 count])
  {
    v8 = [NSString stringWithFormat:@"terminal:%@", self->_terminalMap];
    id v9 = [v3 stringWithFormat:@"%@%@", v6, v8];
  }
  else
  {
    id v9 = [v3 stringWithFormat:@"%@%@", v6, &stru_26EB332F0];
  }

  if (v5) {
  return v9;
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_originalWordMap, 0);
  objc_storeStrong((id *)&self->_terminalMap, 0);
  objc_storeStrong((id *)&self->_childMap, 0);
}

@end