@interface ICMentionsParticipantNode
- (BOOL)isAll;
- (BOOL)isPossibleAll;
- (NSMutableDictionary)children;
- (NSMutableSet)participants;
- (NSMutableSet)possibleParticipants;
- (NSString)key;
- (void)addChild:(id)a3;
- (void)addParticipant:(id)a3;
- (void)addPossibleParticipant:(id)a3;
- (void)setIsAll:(BOOL)a3;
- (void)setIsPossibleAll:(BOOL)a3;
- (void)setKey:(id)a3;
@end

@implementation ICMentionsParticipantNode

- (NSMutableSet)participants
{
  participants = self->_participants;
  if (!participants)
  {
    v4 = (NSMutableSet *)[objc_alloc(MEMORY[0x1E4F1CA80]) initWithCapacity:1];
    v5 = self->_participants;
    self->_participants = v4;

    participants = self->_participants;
  }
  return participants;
}

- (NSMutableSet)possibleParticipants
{
  possibleParticipants = self->_possibleParticipants;
  if (!possibleParticipants)
  {
    v4 = (NSMutableSet *)[objc_alloc(MEMORY[0x1E4F1CA80]) initWithCapacity:1];
    v5 = self->_possibleParticipants;
    self->_possibleParticipants = v4;

    possibleParticipants = self->_possibleParticipants;
  }
  return possibleParticipants;
}

- (void)addParticipant:(id)a3
{
  id v5 = a3;
  v4 = [(ICMentionsParticipantNode *)self participants];
  [v4 addObject:v5];

  [(ICMentionsParticipantNode *)self addPossibleParticipant:v5];
}

- (void)addPossibleParticipant:(id)a3
{
  id v4 = a3;
  id v5 = [(ICMentionsParticipantNode *)self possibleParticipants];
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

- (BOOL)isAll
{
  return self->_isAll;
}

- (void)setIsAll:(BOOL)a3
{
  self->_isAll = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_children, 0);
  objc_storeStrong((id *)&self->_key, 0);
  objc_storeStrong((id *)&self->_possibleParticipants, 0);
  objc_storeStrong((id *)&self->_participants, 0);
}

@end