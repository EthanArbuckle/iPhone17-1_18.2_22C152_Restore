@interface _WBShareParticipantData
- (NSArray)participants;
- (NSSet)activeParticipantIDs;
- (void)setActiveParticipantIDs:(id)a3;
- (void)setParticipants:(id)a3;
@end

@implementation _WBShareParticipantData

- (NSArray)participants
{
  return self->_participants;
}

- (void)setParticipants:(id)a3
{
}

- (NSSet)activeParticipantIDs
{
  return self->_activeParticipantIDs;
}

- (void)setActiveParticipantIDs:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_activeParticipantIDs, 0);
  objc_storeStrong((id *)&self->_participants, 0);
}

@end