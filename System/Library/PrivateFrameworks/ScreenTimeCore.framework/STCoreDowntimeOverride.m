@interface STCoreDowntimeOverride
- (BOOL)_validateAssociatedDowntime:(id)a3;
- (BOOL)_validateState:(id)a3;
- (BOOL)_validateType:(id)a3;
- (BOOL)updateWithDictionaryRepresentation:(id)a3;
- (BOOL)validateForDelete:(id *)a3;
- (BOOL)validateForInsert:(id *)a3;
- (BOOL)validateForUpdate:(id *)a3;
- (id)dictionaryRepresentation;
- (int64_t)state;
- (int64_t)type;
- (void)setState:(int64_t)a3;
- (void)setType:(int64_t)a3;
@end

@implementation STCoreDowntimeOverride

- (int64_t)type
{
  [(STCoreDowntimeOverride *)self willAccessValueForKey:@"type"];
  v3 = [(STCoreDowntimeOverride *)self primitiveType];
  int64_t v4 = [v3 integerValue];

  [(STCoreDowntimeOverride *)self didAccessValueForKey:@"type"];
  return v4;
}

- (void)setType:(int64_t)a3
{
  [(STCoreDowntimeOverride *)self willChangeValueForKey:@"type"];
  v5 = [NSNumber numberWithInteger:a3];
  [(STCoreDowntimeOverride *)self setPrimitiveType:v5];

  [(STCoreDowntimeOverride *)self didChangeValueForKey:@"type"];
}

- (int64_t)state
{
  [(STCoreDowntimeOverride *)self willAccessValueForKey:@"state"];
  v3 = [(STCoreDowntimeOverride *)self primitiveState];
  int64_t v4 = [v3 integerValue];

  [(STCoreDowntimeOverride *)self didAccessValueForKey:@"state"];
  return v4;
}

- (void)setState:(int64_t)a3
{
  [(STCoreDowntimeOverride *)self willChangeValueForKey:@"state"];
  v5 = [NSNumber numberWithInteger:a3];
  [(STCoreDowntimeOverride *)self setPrimitiveState:v5];

  [(STCoreDowntimeOverride *)self didChangeValueForKey:@"state"];
}

- (BOOL)updateWithDictionaryRepresentation:(id)a3
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = [v4 objectForKeyedSubscript:@"isTombstoned"];
  -[STCoreDowntimeOverride setIsTombstoned:](self, "setIsTombstoned:", [v5 BOOLValue]);

  if ([(STCoreDowntimeOverride *)self isTombstoned])
  {
    v6 = +[STLog blueprint];
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      int v13 = 138412290;
      v14 = self;
      _os_log_impl(&dword_1DA519000, v6, OS_LOG_TYPE_DEFAULT, "Deleting tombstoned downtime override: %@", (uint8_t *)&v13, 0xCu);
    }

    v7 = [(STCoreDowntimeOverride *)self managedObjectContext];
    [v7 deleteObject:self];
  }
  else
  {
    v8 = [v4 objectForKeyedSubscript:@"type"];
    -[STCoreDowntimeOverride setType:](self, "setType:", [v8 integerValue]);

    v9 = [v4 objectForKeyedSubscript:@"state"];
    -[STCoreDowntimeOverride setState:](self, "setState:", [v9 integerValue]);

    v10 = [v4 objectForKeyedSubscript:@"creationDate"];
    [(STCoreDowntimeOverride *)self setCreationDate:v10];

    v11 = [v4 objectForKeyedSubscript:@"calendarIdentifier"];
    [(STCoreDowntimeOverride *)self setCalendarIdentifier:v11];

    v7 = [v4 objectForKeyedSubscript:@"endDate"];
    [(STCoreDowntimeOverride *)self setEndDate:v7];
  }

  return 1;
}

- (id)dictionaryRepresentation
{
  v3 = objc_opt_new();
  id v4 = objc_msgSend(NSNumber, "numberWithInteger:", -[STCoreDowntimeOverride type](self, "type"));
  [v3 setObject:v4 forKeyedSubscript:@"type"];

  v5 = objc_msgSend(NSNumber, "numberWithInteger:", -[STCoreDowntimeOverride state](self, "state"));
  [v3 setObject:v5 forKeyedSubscript:@"state"];

  v6 = [(STCoreDowntimeOverride *)self creationDate];
  [v3 setObject:v6 forKeyedSubscript:@"creationDate"];

  v7 = [(STCoreDowntimeOverride *)self calendarIdentifier];
  [v3 setObject:v7 forKeyedSubscript:@"calendarIdentifier"];

  v8 = [(STCoreDowntimeOverride *)self endDate];
  [v3 setObject:v8 forKeyedSubscript:@"endDate"];

  v9 = objc_msgSend(NSNumber, "numberWithBool:", -[STCoreDowntimeOverride isTombstoned](self, "isTombstoned"));
  [v3 setObject:v9 forKeyedSubscript:@"isTombstoned"];

  v10 = (void *)[v3 copy];
  return v10;
}

- (BOOL)validateForUpdate:(id *)a3
{
  v10.receiver = self;
  v10.super_class = (Class)STCoreDowntimeOverride;
  if (-[STCoreDowntimeOverride validateForUpdate:](&v10, sel_validateForUpdate_))
  {
    if (!_os_feature_enabled_impl()) {
      return 1;
    }
    v5 = objc_opt_new();
    [(STCoreDowntimeOverride *)self _validateState:v5];
    [(STCoreDowntimeOverride *)self _validateType:v5];
    [(STCoreDowntimeOverride *)self _validateAssociatedDowntime:v5];
    if ([v5 count])
    {
      v6 = +[STLog coreDataValidation];
      if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
        -[STCoreDowntimeOverride validateForUpdate:]();
      }
    }
    v9.receiver = self;
    v9.super_class = (Class)STCoreDowntimeOverride;
    BOOL v7 = [(NSManagedObject *)&v9 parseValidationErrors:a3 otherErrors:v5];
  }
  else
  {
    v5 = +[STLog coreDataValidation];
    if (os_log_type_enabled(v5, OS_LOG_TYPE_FAULT)) {
      -[STCoreDowntimeOverride validateForUpdate:]();
    }
    BOOL v7 = 0;
  }

  return v7;
}

- (BOOL)validateForInsert:(id *)a3
{
  v10.receiver = self;
  v10.super_class = (Class)STCoreDowntimeOverride;
  if (-[STCoreDowntimeOverride validateForInsert:](&v10, sel_validateForInsert_))
  {
    if (!_os_feature_enabled_impl()) {
      return 1;
    }
    v5 = objc_opt_new();
    [(STCoreDowntimeOverride *)self _validateState:v5];
    [(STCoreDowntimeOverride *)self _validateType:v5];
    [(STCoreDowntimeOverride *)self _validateAssociatedDowntime:v5];
    if ([v5 count])
    {
      v6 = +[STLog coreDataValidation];
      if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
        -[STCoreDowntimeOverride validateForInsert:]();
      }
    }
    v9.receiver = self;
    v9.super_class = (Class)STCoreDowntimeOverride;
    BOOL v7 = [(NSManagedObject *)&v9 parseValidationErrors:a3 otherErrors:v5];
  }
  else
  {
    v5 = +[STLog coreDataValidation];
    if (os_log_type_enabled(v5, OS_LOG_TYPE_FAULT)) {
      -[STCoreDowntimeOverride validateForInsert:]();
    }
    BOOL v7 = 0;
  }

  return v7;
}

- (BOOL)validateForDelete:(id *)a3
{
  v6.receiver = self;
  v6.super_class = (Class)STCoreDowntimeOverride;
  BOOL v3 = -[STCoreDowntimeOverride validateForDelete:](&v6, sel_validateForDelete_);
  if (v3)
  {
    _os_feature_enabled_impl();
  }
  else
  {
    id v4 = +[STLog coreDataValidation];
    if (os_log_type_enabled(v4, OS_LOG_TYPE_FAULT)) {
      -[STCoreDowntimeOverride validateForDelete:]();
    }
  }
  return v3;
}

- (BOOL)_validateState:(id)a3
{
  v11[1] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  unint64_t v5 = [(STCoreDowntimeOverride *)self state];
  if (v5 >= 2)
  {
    objc_super v6 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v10 = *MEMORY[0x1E4F28568];
    v11[0] = @"CoreDowntimeOverride has an unexpected state.";
    BOOL v7 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v11 forKeys:&v10 count:1];
    v8 = [v6 errorWithDomain:@"STErrorDomain" code:544 userInfo:v7];
    [v4 addObject:v8];
  }
  return v5 < 2;
}

- (BOOL)_validateType:(id)a3
{
  v11[1] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  unint64_t v5 = [(STCoreDowntimeOverride *)self type];
  if (v5 >= 2)
  {
    objc_super v6 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v10 = *MEMORY[0x1E4F28568];
    v11[0] = @"CoreDowntimeOverride has an unexpected type.";
    BOOL v7 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v11 forKeys:&v10 count:1];
    v8 = [v6 errorWithDomain:@"STErrorDomain" code:544 userInfo:v7];
    [v4 addObject:v8];
  }
  return v5 < 2;
}

- (BOOL)_validateAssociatedDowntime:(id)a3
{
  v11[1] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  unint64_t v5 = [(STCoreDowntimeOverride *)self downtime];

  if (!v5)
  {
    objc_super v6 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v10 = *MEMORY[0x1E4F28568];
    v11[0] = @"CoreDowntimeOverride does not have an associated Downtime blueprint.";
    BOOL v7 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v11 forKeys:&v10 count:1];
    v8 = [v6 errorWithDomain:@"STErrorDomain" code:546 userInfo:v7];
    [v4 addObject:v8];
  }
  return v5 != 0;
}

- (void)validateForUpdate:.cold.1()
{
  uint64_t v2 = *MEMORY[0x1E4F143B8];
  v1[0] = 136446466;
  OUTLINED_FUNCTION_3_3();
  _os_log_error_impl(&dword_1DA519000, v0, OS_LOG_TYPE_ERROR, "%{public}s Validate for update on CoreDowntimeOverride failed with error: %{public}@", (uint8_t *)v1, 0x16u);
}

- (void)validateForUpdate:.cold.2()
{
  OUTLINED_FUNCTION_0_2();
  OUTLINED_FUNCTION_1_1(&dword_1DA519000, v0, v1, "%{public}s Built-in CoreData Validation for update on CoreDowntimeOverride failed with: %{public}@", v2, v3, v4, v5, 2u);
}

- (void)validateForInsert:.cold.1()
{
  uint64_t v2 = *MEMORY[0x1E4F143B8];
  v1[0] = 136446466;
  OUTLINED_FUNCTION_3_3();
  _os_log_error_impl(&dword_1DA519000, v0, OS_LOG_TYPE_ERROR, "%{public}s Validate for Insert on CoreDowntimeOverride failed with error: %{public}@", (uint8_t *)v1, 0x16u);
}

- (void)validateForInsert:.cold.2()
{
  OUTLINED_FUNCTION_0_2();
  OUTLINED_FUNCTION_1_1(&dword_1DA519000, v0, v1, "%{public}s Built-in CoreData Validation for Insert on CoreDowntimeOverride failed with: %{public}@", v2, v3, v4, v5, 2u);
}

- (void)validateForDelete:.cold.1()
{
  OUTLINED_FUNCTION_0_2();
  OUTLINED_FUNCTION_1_1(&dword_1DA519000, v0, v1, "%{public}s Built-in CoreData Validation for Delete on CoreDowntimeOverride failed with: %{public}@", v2, v3, v4, v5, 2u);
}

@end