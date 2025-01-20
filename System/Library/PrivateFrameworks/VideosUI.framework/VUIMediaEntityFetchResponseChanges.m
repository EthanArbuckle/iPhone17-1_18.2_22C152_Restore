@interface VUIMediaEntityFetchResponseChanges
- (VUICollectionChangeSet)groupingChangeSet;
- (VUICollectionChangeSet)mediaEntitiesChangeSet;
- (VUIMediaEntityFetchResponseChanges)init;
- (VUIMediaEntityFetchResponseChanges)initWithMediaEntitiesChangeSet:(id)a3;
- (id)description;
- (void)setGroupingChangeSet:(id)a3;
- (void)setMediaEntitiesChangeSet:(id)a3;
@end

@implementation VUIMediaEntityFetchResponseChanges

- (VUIMediaEntityFetchResponseChanges)init
{
  v3 = (void *)MEMORY[0x1E4F1CA00];
  uint64_t v4 = *MEMORY[0x1E4F1C3C8];
  v5 = NSStringFromSelector(a2);
  [v3 raise:v4, @"The %@ initializer is not available.", v5 format];

  return 0;
}

- (VUIMediaEntityFetchResponseChanges)initWithMediaEntitiesChangeSet:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)VUIMediaEntityFetchResponseChanges;
  v6 = [(VUIMediaEntityFetchResponseChanges *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_mediaEntitiesChangeSet, a3);
  }

  return v7;
}

- (id)description
{
  id v3 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  v15.receiver = self;
  v15.super_class = (Class)VUIMediaEntityFetchResponseChanges;
  uint64_t v4 = [(VUIMediaEntityFetchResponseChanges *)&v15 description];
  [v3 addObject:v4];

  id v5 = NSString;
  v6 = [(VUIMediaEntityFetchResponseChanges *)self mediaEntitiesChangeSet];
  v7 = [v5 stringWithFormat:@"%@=%@", @"mediaEntitiesChangeSet", v6];
  [v3 addObject:v7];

  v8 = NSString;
  objc_super v9 = [(VUIMediaEntityFetchResponseChanges *)self groupingChangeSet];
  v10 = [v8 stringWithFormat:@"%@=%@", @"groupingChangeSet", v9];
  [v3 addObject:v10];

  v11 = NSString;
  v12 = [v3 componentsJoinedByString:@", "];
  v13 = [v11 stringWithFormat:@"<%@>", v12];

  return v13;
}

- (VUICollectionChangeSet)mediaEntitiesChangeSet
{
  return self->_mediaEntitiesChangeSet;
}

- (void)setMediaEntitiesChangeSet:(id)a3
{
}

- (VUICollectionChangeSet)groupingChangeSet
{
  return self->_groupingChangeSet;
}

- (void)setGroupingChangeSet:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_groupingChangeSet, 0);
  objc_storeStrong((id *)&self->_mediaEntitiesChangeSet, 0);
}

@end