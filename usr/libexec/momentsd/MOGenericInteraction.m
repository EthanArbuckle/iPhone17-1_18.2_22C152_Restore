@interface MOGenericInteraction
- (BOOL)isEqual:(id)a3;
- (MOGenericInteraction)init;
- (MOGenericInteraction)initWithParticipants:(id)a3;
- (NSArray)participants;
- (NSString)interactionKey;
- (unint64_t)hash;
- (void)setInteractionKey:(id)a3;
- (void)setParticipants:(id)a3;
@end

@implementation MOGenericInteraction

- (MOGenericInteraction)init
{
  v3.receiver = self;
  v3.super_class = (Class)MOGenericInteraction;
  return [(MOGenericInteraction *)&v3 init];
}

- (MOGenericInteraction)initWithParticipants:(id)a3
{
  id v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)MOGenericInteraction;
  v5 = [(MOGenericInteraction *)&v11 init];
  if (v5)
  {
    uint64_t v6 = [v4 sortedArrayUsingSelector:"compare:"];
    participants = v5->_participants;
    v5->_participants = (NSArray *)v6;

    uint64_t v8 = [(NSArray *)v5->_participants componentsJoinedByString:@"_"];
    interactionKey = v5->_interactionKey;
    v5->_interactionKey = (NSString *)v8;
  }
  return v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (MOGenericInteraction *)a3;
  if (v4 == self)
  {
    unsigned __int8 v18 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v5 = v4;
      uint64_t v6 = [(MOGenericInteraction *)self participants];
      if (v6)
      {
        v7 = (void *)v6;
        uint64_t v8 = [(MOGenericInteraction *)v5 participants];
        if (!v8)
        {
          unsigned __int8 v18 = 0;
          goto LABEL_13;
        }
        v9 = (void *)v8;
        v10 = [(MOGenericInteraction *)self participants];
        id v11 = [v10 count];
        v12 = [(MOGenericInteraction *)v5 participants];
        id v13 = [v12 count];

        if (v11 == v13)
        {
          uint64_t v14 = [(MOGenericInteraction *)self interactionKey];
          if (v14)
          {
            v15 = (void *)v14;
            v16 = [(MOGenericInteraction *)v5 interactionKey];

            if (v16)
            {
              v7 = [(MOGenericInteraction *)self interactionKey];
              v17 = [(MOGenericInteraction *)v5 interactionKey];
              unsigned __int8 v18 = [v7 isEqualToString:v17];

LABEL_13:
              goto LABEL_14;
            }
          }
        }
      }
      unsigned __int8 v18 = 0;
LABEL_14:

      goto LABEL_15;
    }
    unsigned __int8 v18 = 0;
  }
LABEL_15:

  return v18;
}

- (unint64_t)hash
{
  return [(NSString *)self->_interactionKey hash];
}

- (NSArray)participants
{
  return self->_participants;
}

- (void)setParticipants:(id)a3
{
}

- (NSString)interactionKey
{
  return self->_interactionKey;
}

- (void)setInteractionKey:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_interactionKey, 0);

  objc_storeStrong((id *)&self->_participants, 0);
}

@end