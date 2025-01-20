@interface PGGraphSocialGroupsInsertion
- (NSSet)socialGroupUUIDs;
- (NSSet)socialGroups;
- (PGGraphSocialGroupsInsertion)initWithSocialGroupUUIDs:(id)a3;
- (PGGraphSocialGroupsInsertion)initWithSocialGroups:(id)a3;
- (id)description;
- (unint64_t)changeCount;
- (unint64_t)type;
@end

@implementation PGGraphSocialGroupsInsertion

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_socialGroups, 0);
  objc_storeStrong((id *)&self->_socialGroupUUIDs, 0);
}

- (NSSet)socialGroups
{
  return self->_socialGroups;
}

- (NSSet)socialGroupUUIDs
{
  return self->_socialGroupUUIDs;
}

- (id)description
{
  v3 = NSString;
  v7.receiver = self;
  v7.super_class = (Class)PGGraphSocialGroupsInsertion;
  v4 = [(PGGraphChange *)&v7 description];
  v5 = [v3 stringWithFormat:@"%@, socialGroupUUIDs (%ld): %@", v4, -[NSSet count](self->_socialGroupUUIDs, "count"), self->_socialGroupUUIDs];

  return v5;
}

- (unint64_t)changeCount
{
  return [(NSSet *)self->_socialGroupUUIDs count];
}

- (unint64_t)type
{
  return 10;
}

- (PGGraphSocialGroupsInsertion)initWithSocialGroups:(id)a3
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  v6 = objc_msgSend(MEMORY[0x1E4F1CA80], "setWithCapacity:", objc_msgSend(v5, "count"));
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  id v7 = v5;
  uint64_t v8 = [v7 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v17;
    do
    {
      uint64_t v11 = 0;
      do
      {
        if (*(void *)v17 != v10) {
          objc_enumerationMutation(v7);
        }
        v12 = objc_msgSend(*(id *)(*((void *)&v16 + 1) + 8 * v11), "uuid", (void)v16);
        [v6 addObject:v12];

        ++v11;
      }
      while (v9 != v11);
      uint64_t v9 = [v7 countByEnumeratingWithState:&v16 objects:v20 count:16];
    }
    while (v9);
  }

  v13 = [(PGGraphSocialGroupsInsertion *)self initWithSocialGroupUUIDs:v6];
  v14 = v13;
  if (v13) {
    objc_storeStrong((id *)&v13->_socialGroups, a3);
  }

  return v14;
}

- (PGGraphSocialGroupsInsertion)initWithSocialGroupUUIDs:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)PGGraphSocialGroupsInsertion;
  v6 = [(PGGraphSocialGroupsInsertion *)&v9 init];
  id v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_socialGroupUUIDs, a3);
  }

  return v7;
}

@end