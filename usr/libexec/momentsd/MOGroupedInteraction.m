@interface MOGroupedInteraction
- (BOOL)isScoredContactUsable;
- (MOGroupedInteraction)initWithScoredContact:(id)a3 interactionScore:(id)a4 interaction:(id)a5;
- (NSMutableArray)interactions;
- (NSNumber)interactionScore;
- (PPScoredContact)scoredContact;
- (id)description;
- (void)addInteraction:(id)a3;
- (void)setInteractions:(id)a3;
- (void)setIsScoredContactUsable:(BOOL)a3;
@end

@implementation MOGroupedInteraction

- (MOGroupedInteraction)initWithScoredContact:(id)a3 interactionScore:(id)a4 interaction:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  if (initWithScoredContact_interactionScore_interaction__onceToken != -1) {
    dispatch_once(&initWithScoredContact_interactionScore_interaction__onceToken, &__block_literal_global_15);
  }
  v18.receiver = self;
  v18.super_class = (Class)MOGroupedInteraction;
  v12 = [(MOGenericInteraction *)&v18 init];
  if (v12)
  {
    v13 = [v11 participants];
    [(MOGenericInteraction *)v12 setParticipants:v13];

    v14 = [v11 interactionKey];
    [(MOGenericInteraction *)v12 setInteractionKey:v14];

    objc_storeStrong((id *)&v12->_scoredContact, a3);
    objc_storeStrong((id *)&v12->_interactionScore, a4);
    v12->_isScoredContactUsable = 0;
    uint64_t v15 = objc_opt_new();
    interactions = v12->_interactions;
    v12->_interactions = (NSMutableArray *)v15;

    [(MOGroupedInteraction *)v12 addInteraction:v11];
  }

  return v12;
}

void __75__MOGroupedInteraction_initWithScoredContact_interactionScore_interaction___block_invoke(id a1)
{
  _callLikeMechanismsSet = (uint64_t)[objc_alloc((Class)NSSet) initWithObjects:&off_1002F5570, &off_1002F5588, &off_1002F55A0, &off_1002F55B8, &off_1002F55D0, &off_1002F55E8, &off_1002F5600, &off_1002F5618, 0];

  _objc_release_x1();
}

- (void)addInteraction:(id)a3
{
  id v12 = a3;
  v4 = [(MOGroupedInteraction *)self interactions];
  [v4 addObject:v12];

  if (![(MOGroupedInteraction *)self isScoredContactUsable])
  {
    v5 = [(MOGroupedInteraction *)self scoredContact];

    if (v5)
    {
      v6 = (void *)_callLikeMechanismsSet;
      v7 = +[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", [v12 mechanism]);
      LODWORD(v6) = [v6 containsObject:v7];

      if (!v6) {
        goto LABEL_5;
      }
      v8 = [v12 endDate];
      id v9 = [v12 startDate];
      [v8 timeIntervalSinceDate:v9];
      double v11 = v10;

      if (v11 >= 5.0) {
LABEL_5:
      }
        [(MOGroupedInteraction *)self setIsScoredContactUsable:1];
    }
  }
}

- (id)description
{
  id v3 = objc_alloc((Class)NSString);
  v4 = [(MOGenericInteraction *)self interactionKey];
  v5 = [(MOGroupedInteraction *)self scoredContact];
  v6 = [(MOGroupedInteraction *)self interactionScore];
  v7 = [(MOGroupedInteraction *)self interactions];
  id v8 = [v3 initWithFormat:@"<MOGroupedInteraction | groupKey:%@ scoredContact:%@ score:%@ interactions:%@>", v4, v5, v6, v7];

  return v8;
}

- (PPScoredContact)scoredContact
{
  return self->_scoredContact;
}

- (NSNumber)interactionScore
{
  return self->_interactionScore;
}

- (BOOL)isScoredContactUsable
{
  return self->_isScoredContactUsable;
}

- (void)setIsScoredContactUsable:(BOOL)a3
{
  self->_isScoredContactUsable = a3;
}

- (NSMutableArray)interactions
{
  return self->_interactions;
}

- (void)setInteractions:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_interactions, 0);
  objc_storeStrong((id *)&self->_interactionScore, 0);

  objc_storeStrong((id *)&self->_scoredContact, 0);
}

@end