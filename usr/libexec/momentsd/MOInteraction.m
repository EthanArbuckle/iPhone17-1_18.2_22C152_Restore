@interface MOInteraction
+ (BOOL)supportsSecureCoding;
+ (int64_t)convertDirection:(int64_t)a3;
+ (int64_t)convertMechanism:(int64_t)a3;
- (MOContact)sender;
- (MOInteraction)initWithCDInteraction:(id)a3 meIdentifier:(id)a4;
- (MOInteraction)initWithCoder:(id)a3;
- (MOInteraction)initWithIdentifier:(id)a3 startDate:(id)a4 endDate:(id)a5 mechanism:(int64_t)a6 direction:(int64_t)a7 bundleId:(id)a8 groupName:(id)a9 sender:(id)a10 recipients:(id)a11;
- (NSArray)recipients;
- (NSDate)endDate;
- (NSDate)startDate;
- (NSString)bundleId;
- (NSString)groupName;
- (NSString)identifier;
- (id)description;
- (int64_t)direction;
- (int64_t)mechanism;
- (void)encodeWithCoder:(id)a3;
@end

@implementation MOInteraction

+ (int64_t)convertMechanism:(int64_t)a3
{
  if ((unint64_t)(a3 - 1) >= 0x15) {
    return 0;
  }
  else {
    return a3;
  }
}

+ (int64_t)convertDirection:(int64_t)a3
{
  if ((unint64_t)(a3 - 1) >= 4) {
    return 0;
  }
  else {
    return a3;
  }
}

- (MOInteraction)initWithCDInteraction:(id)a3 meIdentifier:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v9 = [v7 uuid];

  if (v9)
  {
    if ([v7 direction] != (id)1)
    {
      uint64_t v10 = [v7 sender];
      if (v10)
      {
        v11 = (void *)v10;
        v12 = [v7 sender];
        v13 = [v12 personId];
        if ([v8 containsObject:v13])
        {

          v14 = 0;
LABEL_12:

          goto LABEL_13;
        }
        v18 = [v7 sender];
        v19 = [v18 identifier];
        unsigned __int8 v20 = [v8 containsObject:v19];

        if ((v20 & 1) == 0)
        {
          v21 = [MOContact alloc];
          v11 = [v7 sender];
          v14 = [(MOContact *)v21 initWithCDContact:v11];
          goto LABEL_12;
        }
      }
    }
    v14 = 0;
LABEL_13:
    v39 = v14;
    v40 = self;
    v41 = objc_opt_new();
    long long v42 = 0u;
    long long v43 = 0u;
    long long v44 = 0u;
    long long v45 = 0u;
    v22 = [v7 recipients];
    id v23 = [v22 countByEnumeratingWithState:&v42 objects:v46 count:16];
    if (!v23) {
      goto LABEL_26;
    }
    id v24 = v23;
    uint64_t v25 = *(void *)v43;
    while (1)
    {
      for (i = 0; i != v24; i = (char *)i + 1)
      {
        if (*(void *)v43 != v25) {
          objc_enumerationMutation(v22);
        }
        v27 = *(void **)(*((void *)&v42 + 1) + 8 * i);
        if (v27)
        {
          v28 = [*(id *)(*((void *)&v42 + 1) + 8 * i) personId];
          if (([v8 containsObject:v28] & 1) == 0)
          {
            v29 = [v27 identifier];
            unsigned __int8 v30 = [v8 containsObject:v29];

            if (v30) {
              continue;
            }
            v28 = [[MOContact alloc] initWithCDContact:v27];
            if (v28) {
              [v41 addObject:v28];
            }
          }
        }
      }
      id v24 = [v22 countByEnumeratingWithState:&v42 objects:v46 count:16];
      if (!v24)
      {
LABEL_26:

        v31 = [v7 uuid];
        v32 = [v7 startDate];
        v38 = [v7 endDate];
        int64_t v37 = +[MOInteraction convertMechanism:](MOInteraction, "convertMechanism:", [v7 mechanism]);
        int64_t v33 = +[MOInteraction convertDirection:](MOInteraction, "convertDirection:", [v7 direction]);
        v34 = [v7 bundleId];
        v35 = [v7 groupName];
        self = [(MOInteraction *)v40 initWithIdentifier:v31 startDate:v32 endDate:v38 mechanism:v37 direction:v33 bundleId:v34 groupName:v35 sender:v39 recipients:v41];

        v16 = v39;
        v17 = self;
        goto LABEL_27;
      }
    }
  }
  v15 = _mo_log_facility_get_os_log(&MOLogFacilityGeneral);
  if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR)) {
    -[MOInteraction(_CDInteraction) initWithCDInteraction:meIdentifier:](v15);
  }

  v16 = +[NSAssertionHandler currentHandler];
  [v16 handleFailureInMethod:a2 object:self file:@"MOInteraction+_CDInteraction.m" lineNumber:84 description:@"Invalid parameter not satisfying: cdInteraction.uuid"];
  v17 = 0;
LABEL_27:

  return v17;
}

- (MOInteraction)initWithIdentifier:(id)a3 startDate:(id)a4 endDate:(id)a5 mechanism:(int64_t)a6 direction:(int64_t)a7 bundleId:(id)a8 groupName:(id)a9 sender:(id)a10 recipients:(id)a11
{
  id v16 = a3;
  id v48 = a4;
  id v17 = a4;
  id v49 = a5;
  id v18 = a5;
  id v52 = a8;
  id v19 = a8;
  id v54 = a9;
  id v20 = a10;
  id v21 = a11;
  v53 = v21;
  if (v16)
  {
    v22 = v21;
    id v46 = v16;
    id v23 = objc_alloc_init((Class)NSMutableArray);
    if (v20)
    {
      id v24 = [v20 personId];

      if (v24)
      {
        uint64_t v25 = [v20 personId];
LABEL_10:
        v29 = (void *)v25;
        [v23 addObject:v25];

        goto LABEL_11;
      }
      v28 = [v20 identifier];

      if (v28)
      {
        uint64_t v25 = [v20 identifier];
        goto LABEL_10;
      }
    }
LABEL_11:
    id v43 = v19;
    id v44 = v18;
    id v45 = v17;
    long long v58 = 0u;
    long long v59 = 0u;
    long long v56 = 0u;
    long long v57 = 0u;
    id v30 = v22;
    id v31 = [v30 countByEnumeratingWithState:&v56 objects:v60 count:16];
    if (!v31) {
      goto LABEL_23;
    }
    id v32 = v31;
    uint64_t v33 = *(void *)v57;
    while (1)
    {
      for (i = 0; i != v32; i = (char *)i + 1)
      {
        if (*(void *)v57 != v33) {
          objc_enumerationMutation(v30);
        }
        v35 = *(void **)(*((void *)&v56 + 1) + 8 * i);
        v36 = [v35 personId];

        if (v36)
        {
          uint64_t v37 = [v35 personId];
        }
        else
        {
          v38 = [v35 identifier];

          if (!v38) {
            continue;
          }
          uint64_t v37 = [v35 identifier];
        }
        v39 = (void *)v37;
        [v23 addObject:v37];
      }
      id v32 = [v30 countByEnumeratingWithState:&v56 objects:v60 count:16];
      if (!v32)
      {
LABEL_23:

        v55.receiver = self;
        v55.super_class = (Class)MOInteraction;
        v40 = [(MOGenericInteraction *)&v55 initWithParticipants:v23];
        v41 = v40;
        id v16 = v46;
        id v19 = v43;
        if (v40)
        {
          objc_storeStrong((id *)&v40->_identifier, a3);
          objc_storeStrong((id *)&v41->_startDate, v48);
          objc_storeStrong((id *)&v41->_endDate, v49);
          v41->_mechanism = a6;
          v41->_direction = a7;
          objc_storeStrong((id *)&v41->_bundleId, v52);
          objc_storeStrong((id *)&v41->_groupName, a9);
          objc_storeStrong((id *)&v41->_sender, a10);
          objc_storeStrong((id *)&v41->_recipients, a11);
        }
        self = v41;
        v27 = self;
        id v18 = v44;
        id v17 = v45;
        goto LABEL_26;
      }
    }
  }
  v26 = _mo_log_facility_get_os_log(&MOLogFacilityGeneral);
  if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR)) {
    -[MOInteraction initWithIdentifier:startDate:endDate:mechanism:direction:bundleId:groupName:sender:recipients:](v26);
  }

  id v23 = +[NSAssertionHandler currentHandler];
  [v23 handleFailureInMethod:a2 object:self file:@"MOInteraction.m" lineNumber:34 description:@"Invalid parameter not satisfying: identifier"];
  v27 = 0;
LABEL_26:

  return v27;
}

- (id)description
{
  v3 = [(MOInteraction *)self sender];
  id v21 = [v3 description];

  v4 = objc_opt_new();
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  v5 = [(MOInteraction *)self recipients];
  id v6 = [v5 countByEnumeratingWithState:&v22 objects:v26 count:16];
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v23;
    do
    {
      for (i = 0; i != v7; i = (char *)i + 1)
      {
        if (*(void *)v23 != v8) {
          objc_enumerationMutation(v5);
        }
        uint64_t v10 = [*(id *)(*((void *)&v22 + 1) + 8 * i) description];
        if (v10) {
          [v4 addObject:v10];
        }
      }
      id v7 = [v5 countByEnumeratingWithState:&v22 objects:v26 count:16];
    }
    while (v7);
  }

  v11 = [v4 componentsJoinedByString:@";"];
  v12 = [(MOInteraction *)self identifier];
  v13 = [(MOInteraction *)self startDate];
  v14 = [(MOInteraction *)self endDate];
  int64_t v15 = [(MOInteraction *)self mechanism];
  int64_t v16 = [(MOInteraction *)self direction];
  id v17 = [(MOInteraction *)self bundleId];
  id v18 = [(MOInteraction *)self groupName];
  id v19 = +[NSString stringWithFormat:@"identifier, %@, startDate, %@, endDate, %@, mechanism, %lu, direction, %lu, bundleId, %@, group name, %@, sender, <%@>, receipts, <%@>", v12, v13, v14, v15, v16, v17, v18, v21, v11];

  return v19;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  identifier = self->_identifier;
  id v5 = a3;
  [v5 encodeObject:identifier forKey:@"identifier"];
  [v5 encodeObject:self->_startDate forKey:@"startDate"];
  [v5 encodeObject:self->_endDate forKey:@"endDate"];
  [v5 encodeInteger:self->_mechanism forKey:@"mechanism"];
  [v5 encodeInteger:self->_direction forKey:@"direction"];
  [v5 encodeObject:self->_bundleId forKey:@"bundleId"];
  [v5 encodeObject:self->_groupName forKey:@"groupName"];
  [v5 encodeObject:self->_sender forKey:@"sender"];
  [v5 encodeObject:self->_recipients forKey:@"recipients"];
}

- (MOInteraction)initWithCoder:(id)a3
{
  id v3 = a3;
  int64_t v16 = [v3 decodeObjectOfClass:objc_opt_class() forKey:@"identifier"];
  v4 = [v3 decodeObjectOfClass:objc_opt_class() forKey:@"startDate"];
  id v5 = [v3 decodeObjectOfClass:objc_opt_class() forKey:@"endDate"];
  id v15 = [v3 decodeIntegerForKey:@"mechanism"];
  id v6 = [v3 decodeIntegerForKey:@"direction"];
  id v7 = [v3 decodeObjectOfClass:objc_opt_class() forKey:@"bundleId"];
  uint64_t v8 = [v3 decodeObjectOfClass:objc_opt_class() forKey:@"groupName"];
  v9 = [v3 decodeObjectOfClass:objc_opt_class() forKey:@"sender"];
  uint64_t v10 = objc_opt_class();
  v11 = +[NSSet setWithObjects:](NSSet, "setWithObjects:", v10, objc_opt_class(), 0);
  v12 = [v3 decodeObjectOfClasses:v11 forKey:@"recipients"];

  v13 = [(MOInteraction *)self initWithIdentifier:v16 startDate:v4 endDate:v5 mechanism:v15 direction:v6 bundleId:v7 groupName:v8 sender:v9 recipients:v12];
  return v13;
}

- (NSString)identifier
{
  return self->_identifier;
}

- (NSDate)startDate
{
  return self->_startDate;
}

- (NSDate)endDate
{
  return self->_endDate;
}

- (int64_t)mechanism
{
  return self->_mechanism;
}

- (int64_t)direction
{
  return self->_direction;
}

- (NSString)bundleId
{
  return self->_bundleId;
}

- (NSString)groupName
{
  return self->_groupName;
}

- (MOContact)sender
{
  return self->_sender;
}

- (NSArray)recipients
{
  return self->_recipients;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_recipients, 0);
  objc_storeStrong((id *)&self->_sender, 0);
  objc_storeStrong((id *)&self->_groupName, 0);
  objc_storeStrong((id *)&self->_bundleId, 0);
  objc_storeStrong((id *)&self->_endDate, 0);
  objc_storeStrong((id *)&self->_startDate, 0);

  objc_storeStrong((id *)&self->_identifier, 0);
}

- (void)initWithIdentifier:(os_log_t)log startDate:endDate:mechanism:direction:bundleId:groupName:sender:recipients:.cold.1(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: identifier", v1, 2u);
}

@end