@interface _UIActivitySortItem
+ (id)sortDescriptorForActivity:(id)a3 withGroup:(int64_t)a4 secondarySortValue:(id)a5;
+ (id)sortDescriptorForActivity:(id)a3 withGroup:(int64_t)a4 secondarySortValue:(id)a5 tertiarySortValue:(id)a6;
- (UIActivity)activity;
- (id)debugDescription;
- (id)secondarySortValue;
- (id)tertiarySortValue;
- (int64_t)compare:(id)a3;
- (int64_t)group;
@end

@implementation _UIActivitySortItem

+ (id)sortDescriptorForActivity:(id)a3 withGroup:(int64_t)a4 secondarySortValue:(id)a5
{
  id v7 = a3;
  id v8 = a5;
  v9 = objc_opt_new();
  v10 = (void *)v9[1];
  v9[1] = v7;
  id v11 = v7;

  v12 = (void *)v9[3];
  v9[2] = a4;
  v9[3] = v8;

  return v9;
}

+ (id)sortDescriptorForActivity:(id)a3 withGroup:(int64_t)a4 secondarySortValue:(id)a5 tertiarySortValue:(id)a6
{
  id v9 = a6;
  v10 = +[_UIActivitySortItem sortDescriptorForActivity:a3 withGroup:a4 secondarySortValue:a5];
  id v11 = (void *)v10[4];
  v10[4] = v9;

  return v10;
}

- (id)debugDescription
{
  v3 = NSString;
  uint64_t v4 = objc_opt_class();
  uint64_t v5 = objc_opt_class();
  activity = self->_activity;
  id v7 = [(UIActivity *)activity activityType];
  id v8 = [NSNumber numberWithInteger:self->_group];
  id v9 = [v3 stringWithFormat:@"<%@: %p> activity = <%@: %p> '%@', group = %@, secondarySortValue = %@, tertiarySortValue = %@", v4, self, v5, activity, v7, v8, self->_secondarySortValue, self->_tertiarySortValue];

  return v9;
}

- (int64_t)compare:(id)a3
{
  uint64_t v4 = a3;
  id v5 = v4;
  int64_t group = self->_group;
  int64_t v7 = v4[2];
  BOOL v8 = group <= v7;
  if (group >= v7) {
    uint64_t v9 = 0;
  }
  else {
    uint64_t v9 = -1;
  }
  if (v8) {
    int64_t v10 = v9;
  }
  else {
    int64_t v10 = 1;
  }
  if (!v10)
  {
    id v11 = (void *)v4[3];
    id v12 = self->_secondarySortValue;
    id v13 = v11;
    objc_opt_class();
    if (objc_opt_isKindOfClass() & 1) != 0 && (objc_opt_class(), (objc_opt_isKindOfClass())) {
      uint64_t v14 = [v12 localizedCaseInsensitiveCompare:v13];
    }
    else {
      uint64_t v14 = [v12 compare:v13];
    }
    int64_t v10 = v14;

    if (!v10)
    {
      id tertiarySortValue = self->_tertiarySortValue;
      if (!tertiarySortValue) {
        goto LABEL_20;
      }
      v16 = (void *)*((void *)v5 + 4);
      if (!v16) {
        goto LABEL_20;
      }
      id v17 = tertiarySortValue;
      id v18 = v16;
      objc_opt_class();
      if (objc_opt_isKindOfClass() & 1) != 0 && (objc_opt_class(), (objc_opt_isKindOfClass())) {
        uint64_t v19 = [v17 localizedCaseInsensitiveCompare:v18];
      }
      else {
        uint64_t v19 = [v17 compare:v18];
      }
      int64_t v10 = v19;

      if (!v10)
      {
LABEL_20:
        v20 = [(UIActivity *)self->_activity activityTitle];
        v21 = [*((id *)v5 + 1) activityTitle];
        id v22 = v20;
        id v23 = v21;
        objc_opt_class();
        if (objc_opt_isKindOfClass() & 1) != 0 && (objc_opt_class(), (objc_opt_isKindOfClass())) {
          uint64_t v24 = [v22 localizedCaseInsensitiveCompare:v23];
        }
        else {
          uint64_t v24 = [v22 compare:v23];
        }
        int64_t v10 = v24;

        if (!v10)
        {
          v25 = [(UIActivity *)self->_activity activityUUID];
          v26 = [v25 UUIDString];
          v27 = [*((id *)v5 + 1) activityUUID];
          v28 = [v27 UUIDString];
          int64_t v10 = [v26 compare:v28];
        }
      }
    }
  }

  return v10;
}

- (UIActivity)activity
{
  return self->_activity;
}

- (int64_t)group
{
  return self->_group;
}

- (id)secondarySortValue
{
  return self->_secondarySortValue;
}

- (id)tertiarySortValue
{
  return self->_tertiarySortValue;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_tertiarySortValue, 0);
  objc_storeStrong(&self->_secondarySortValue, 0);
  objc_storeStrong((id *)&self->_activity, 0);
}

@end