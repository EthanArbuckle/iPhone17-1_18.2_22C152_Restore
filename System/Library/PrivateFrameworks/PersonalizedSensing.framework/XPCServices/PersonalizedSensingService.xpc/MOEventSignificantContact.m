@interface MOEventSignificantContact
+ (BOOL)supportsSecureCoding;
- (MOEventSignificantContact)initWithCoder:(id)a3;
- (NSArray)interactionContacts;
- (NSArray)interactions;
- (NSDictionary)contactClassificationMap;
- (NSNumber)interactionContactScore;
- (NSSet)interactionMechanisms;
- (NSString)interactionGroupName;
- (PPScoredContact)interactionScoredContact;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (void)encodeWithCoder:(id)a3;
- (void)setContactClassificationMap:(id)a3;
- (void)setInteractionContactScore:(id)a3;
- (void)setInteractionContacts:(id)a3;
- (void)setInteractionGroupName:(id)a3;
- (void)setInteractionMechanisms:(id)a3;
- (void)setInteractionScoredContact:(id)a3;
- (void)setInteractions:(id)a3;
@end

@implementation MOEventSignificantContact

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  interactionContactScore = self->_interactionContactScore;
  id v5 = a3;
  [v5 encodeObject:interactionContactScore forKey:@"interactionContactScore"];
  [v5 encodeObject:self->_interactionScoredContact forKey:@"interactionScoredContact"];
  [v5 encodeObject:self->_interactionGroupName forKey:@"interactionGroupName"];
  [v5 encodeObject:self->_interactionContacts forKey:@"interactionContacts"];
  [v5 encodeObject:self->_interactionMechanisms forKey:@"interactionMechanisms"];
  [v5 encodeObject:self->_interactions forKey:@"interactions"];
}

- (MOEventSignificantContact)initWithCoder:(id)a3
{
  id v4 = a3;
  v32.receiver = self;
  v32.super_class = (Class)MOEventSignificantContact;
  id v5 = [(MOEventSignificantContact *)&v32 init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"interactionContactScore"];
    interactionContactScore = v5->_interactionContactScore;
    v5->_interactionContactScore = (NSNumber *)v6;

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"interactionScoredContact"];
    interactionScoredContact = v5->_interactionScoredContact;
    v5->_interactionScoredContact = (PPScoredContact *)v8;

    uint64_t v10 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"interactionGroupName"];
    interactionGroupName = v5->_interactionGroupName;
    v5->_interactionGroupName = (NSString *)v10;

    id v13 = objc_alloc((Class)NSSet);
    uint64_t v14 = objc_opt_class();
    uint64_t v15 = objc_opt_class();
    id v16 = objc_msgSend(v13, "initWithObjects:", v14, v15, objc_opt_class(), 0);
    uint64_t v17 = [v4 decodeObjectOfClasses:v16 forKey:@"interactionContacts"];
    interactionContacts = v5->_interactionContacts;
    v5->_interactionContacts = (NSArray *)v17;

    id v20 = objc_alloc((Class)NSSet);
    uint64_t v21 = objc_opt_class();
    id v22 = objc_msgSend(v20, "initWithObjects:", v21, objc_opt_class(), 0);
    uint64_t v23 = [v4 decodeObjectOfClasses:v22 forKey:@"interactionMechanisms"];
    interactionMechanisms = v5->_interactionMechanisms;
    v5->_interactionMechanisms = (NSSet *)v23;

    id v26 = objc_alloc((Class)NSSet);
    uint64_t v27 = objc_opt_class();
    id v28 = objc_msgSend(v26, "initWithObjects:", v27, objc_opt_class(), 0);
    uint64_t v29 = [v4 decodeObjectOfClasses:v28 forKey:@"interactions"];
    interactions = v5->_interactions;
    v5->_interactions = (NSArray *)v29;
  }
  return v5;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = objc_alloc_init(MOEventSignificantContact);
  objc_storeStrong((id *)&v4->_interactions, self->_interactions);
  objc_storeStrong((id *)&v4->_interactionContacts, self->_interactionContacts);
  objc_storeStrong((id *)&v4->_interactionMechanisms, self->_interactionMechanisms);
  objc_storeStrong((id *)&v4->_interactionGroupName, self->_interactionGroupName);
  objc_storeStrong((id *)&v4->_interactionContactScore, self->_interactionContactScore);
  objc_storeStrong((id *)&v4->_interactionScoredContact, self->_interactionScoredContact);
  return v4;
}

- (id)description
{
  id v3 = objc_alloc((Class)NSString);
  id v4 = [(PPScoredContact *)self->_interactionScoredContact contact];
  id v5 = [v4 identifier];
  uint64_t v6 = [(NSString *)self->_interactionGroupName mask];
  id v7 = [v3 initWithFormat:@"interactionScoredContact identifier, %@, interactionGroupName, %@, interactionContact count, %lu, interaction count, %lu, interactionMechanisms, %@", v5, v6, -[NSArray count](self->_interactionContacts, "count"), -[NSArray count](self->_interactions, "count"), self->_interactionMechanisms];

  return v7;
}

- (NSNumber)interactionContactScore
{
  return self->_interactionContactScore;
}

- (void)setInteractionContactScore:(id)a3
{
}

- (PPScoredContact)interactionScoredContact
{
  return self->_interactionScoredContact;
}

- (void)setInteractionScoredContact:(id)a3
{
}

- (NSString)interactionGroupName
{
  return self->_interactionGroupName;
}

- (void)setInteractionGroupName:(id)a3
{
}

- (NSArray)interactionContacts
{
  return self->_interactionContacts;
}

- (void)setInteractionContacts:(id)a3
{
}

- (NSDictionary)contactClassificationMap
{
  return self->_contactClassificationMap;
}

- (void)setContactClassificationMap:(id)a3
{
}

- (NSSet)interactionMechanisms
{
  return self->_interactionMechanisms;
}

- (void)setInteractionMechanisms:(id)a3
{
}

- (NSArray)interactions
{
  return self->_interactions;
}

- (void)setInteractions:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_interactions, 0);
  objc_storeStrong((id *)&self->_interactionMechanisms, 0);
  objc_storeStrong((id *)&self->_contactClassificationMap, 0);
  objc_storeStrong((id *)&self->_interactionContacts, 0);
  objc_storeStrong((id *)&self->_interactionGroupName, 0);
  objc_storeStrong((id *)&self->_interactionScoredContact, 0);
  objc_storeStrong((id *)&self->_interactionContactScore, 0);
}

@end