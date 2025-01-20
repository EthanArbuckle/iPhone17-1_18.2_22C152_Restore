@interface STFamily
- (NSArray)members;
- (NSString)dataSource;
- (STFamily)initWithFamilyCircle:(id)a3;
- (STFamily)initWithMembers:(id)a3;
- (STFamilyMember)me;
- (id)copyWithZone:(_NSZone *)a3;
- (id)dictionaryRepresentation;
- (void)setDataSource:(id)a3;
- (void)setMe:(id)a3;
- (void)setMembers:(id)a3;
@end

@implementation STFamily

- (STFamily)initWithFamilyCircle:(id)a3
{
  uint64_t v36 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v34.receiver = self;
  v34.super_class = (Class)STFamily;
  v5 = [(STFamily *)&v34 init];
  v6 = v5;
  if (v5)
  {
    v24 = v5;
    v27 = objc_opt_new();
    long long v30 = 0u;
    long long v31 = 0u;
    long long v32 = 0u;
    long long v33 = 0u;
    id v23 = v4;
    id obj = [v4 members];
    uint64_t v28 = [obj countByEnumeratingWithState:&v30 objects:v35 count:16];
    if (v28)
    {
      uint64_t v26 = *(void *)v31;
      do
      {
        for (uint64_t i = 0; i != v28; ++i)
        {
          if (*(void *)v31 != v26) {
            objc_enumerationMutation(obj);
          }
          v8 = *(void **)(*((void *)&v30 + 1) + 8 * i);
          v9 = @"Child";
          if ([v8 memberType] != 2)
          {
            v9 = @"Teen";
            if ([v8 memberType] != 1)
            {
              if ([v8 memberType]) {
                v9 = @"Unknown";
              }
              else {
                v9 = @"Adult";
              }
            }
          }
          v29 = [STFamilyMember alloc];
          v10 = [v8 dsid];
          v11 = [v8 altDSID];
          v12 = [v8 appleID];
          v13 = [v8 firstName];
          v14 = [v8 lastName];
          char v15 = [v8 isMe];
          char v16 = [v8 isParent];
          BYTE2(v22) = [v8 isOrganizer];
          BYTE1(v22) = v16;
          LOBYTE(v22) = v15;
          v17 = -[STFamilyMember initWithDSID:altDSID:appleID:memberType:firstName:lastName:isMe:isParent:isOrganizer:](v29, "initWithDSID:altDSID:appleID:memberType:firstName:lastName:isMe:isParent:isOrganizer:", v10, v11, v12, v9, v13, v14, v22);

          if ([v8 isMe]) {
            objc_storeStrong((id *)&v24->_me, v17);
          }
          [v27 addObject:v17];
        }
        uint64_t v28 = [obj countByEnumeratingWithState:&v30 objects:v35 count:16];
      }
      while (v28);
    }

    v6 = v24;
    dataSource = v24->_dataSource;
    v24->_dataSource = (NSString *)@"familyCircle";

    uint64_t v19 = [v27 copy];
    members = v24->_members;
    v24->_members = (NSArray *)v19;

    id v4 = v23;
  }

  return v6;
}

- (STFamily)initWithMembers:(id)a3
{
  id v5 = a3;
  v13.receiver = self;
  v13.super_class = (Class)STFamily;
  v6 = [(STFamily *)&v13 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_members, a3);
    v8 = objc_msgSend(MEMORY[0x1E4F28F60], "predicateWithFormat:", @"%K == YES", @"isMe");
    v9 = [v5 filteredArrayUsingPredicate:v8];
    uint64_t v10 = [v9 firstObject];
    me = v7->_me;
    v7->_me = (STFamilyMember *)v10;
  }
  return v7;
}

- (id)dictionaryRepresentation
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  v3 = objc_opt_new();
  long long v24 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  id obj = [(STFamily *)self members];
  uint64_t v4 = [obj countByEnumeratingWithState:&v24 objects:v30 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v25;
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v25 != v6) {
          objc_enumerationMutation(obj);
        }
        v8 = *(void **)(*((void *)&v24 + 1) + 8 * i);
        v9 = [MEMORY[0x1E4F1CA60] dictionaryWithCapacity:8];
        uint64_t v10 = [v8 DSID];
        [v9 setObject:v10 forKeyedSubscript:@"dsid"];

        v11 = [v8 appleID];
        [v9 setObject:v11 forKeyedSubscript:@"appleID"];

        v12 = [v8 memberType];
        [v9 setObject:v12 forKeyedSubscript:@"memberType"];

        objc_super v13 = [v8 firstName];
        [v9 setObject:v13 forKeyedSubscript:@"firstName"];

        v14 = [v8 lastName];
        [v9 setObject:v14 forKeyedSubscript:@"lastName"];

        char v15 = objc_msgSend(NSNumber, "numberWithBool:", objc_msgSend(v8, "isMe"));
        [v9 setObject:v15 forKeyedSubscript:@"isMe"];

        char v16 = objc_msgSend(NSNumber, "numberWithBool:", objc_msgSend(v8, "isParent"));
        [v9 setObject:v16 forKeyedSubscript:@"isParent"];

        v17 = objc_msgSend(NSNumber, "numberWithBool:", objc_msgSend(v8, "isOrganizer"));
        [v9 setObject:v17 forKeyedSubscript:@"isOrganizer"];

        v18 = (void *)[v9 copy];
        [v3 addObject:v18];
      }
      uint64_t v5 = [obj countByEnumeratingWithState:&v24 objects:v30 count:16];
    }
    while (v5);
  }

  v28[0] = @"dataSource";
  uint64_t v19 = [(STFamily *)self dataSource];
  v28[1] = @"members";
  v29[0] = v19;
  v20 = (void *)[v3 copy];
  v29[1] = v20;
  v21 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v29 forKeys:v28 count:2];

  return v21;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = objc_alloc((Class)objc_opt_class());
  uint64_t v5 = (void *)[(NSArray *)self->_members copy];
  uint64_t v6 = (void *)[v4 initWithMembers:v5];

  return v6;
}

- (NSArray)members
{
  return self->_members;
}

- (void)setMembers:(id)a3
{
}

- (STFamilyMember)me
{
  return self->_me;
}

- (void)setMe:(id)a3
{
}

- (NSString)dataSource
{
  return self->_dataSource;
}

- (void)setDataSource:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dataSource, 0);
  objc_storeStrong((id *)&self->_me, 0);
  objc_storeStrong((id *)&self->_members, 0);
}

@end