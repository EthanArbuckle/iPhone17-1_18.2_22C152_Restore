@interface MOInteraction
+ (BOOL)supportsSecureCoding;
- (MOContact)sender;
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

- (MOInteraction)initWithIdentifier:(id)a3 startDate:(id)a4 endDate:(id)a5 mechanism:(int64_t)a6 direction:(int64_t)a7 bundleId:(id)a8 groupName:(id)a9 sender:(id)a10 recipients:(id)a11
{
  uint64_t v61 = *MEMORY[0x1E4F143B8];
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
    id v23 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    if (v20)
    {
      v24 = [v20 personId];

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
    uint64_t v31 = [v30 countByEnumeratingWithState:&v56 objects:v60 count:16];
    if (!v31) {
      goto LABEL_23;
    }
    uint64_t v32 = v31;
    uint64_t v33 = *(void *)v57;
    while (1)
    {
      for (uint64_t i = 0; i != v32; ++i)
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
      uint64_t v32 = [v30 countByEnumeratingWithState:&v56 objects:v60 count:16];
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
  v26 = _mo_log_facility_get_os_log(MOLogFacilityGeneral);
  if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR)) {
    -[MOInteraction initWithIdentifier:startDate:endDate:mechanism:direction:bundleId:groupName:sender:recipients:](v26);
  }

  id v23 = [MEMORY[0x1E4F28B00] currentHandler];
  [v23 handleFailureInMethod:a2 object:self file:@"MOInteraction.m" lineNumber:34 description:@"Invalid parameter not satisfying: identifier"];
  v27 = 0;
LABEL_26:

  return v27;
}

- (id)description
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  v3 = [(MOInteraction *)self sender];
  v22 = [v3 description];

  v4 = objc_opt_new();
  long long v23 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  v5 = [(MOInteraction *)self recipients];
  uint64_t v6 = [v5 countByEnumeratingWithState:&v23 objects:v27 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v24;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v24 != v8) {
          objc_enumerationMutation(v5);
        }
        v10 = [*(id *)(*((void *)&v23 + 1) + 8 * i) description];
        if (v10) {
          [v4 addObject:v10];
        }
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v23 objects:v27 count:16];
    }
    while (v7);
  }

  v11 = [v4 componentsJoinedByString:@";"];
  id v21 = NSString;
  v12 = [(MOInteraction *)self identifier];
  v13 = [(MOInteraction *)self startDate];
  v14 = [(MOInteraction *)self endDate];
  int64_t v15 = [(MOInteraction *)self mechanism];
  int64_t v16 = [(MOInteraction *)self direction];
  id v17 = [(MOInteraction *)self bundleId];
  id v18 = [(MOInteraction *)self groupName];
  id v19 = [v21 stringWithFormat:@"identifier, %@, startDate, %@, endDate, %@, mechanism, %lu, direction, %lu, bundleId, %@, group name, %@, sender, <%@>, receipts, <%@>", v12, v13, v14, v15, v16, v17, v18, v22, v11];

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
  id v17 = [v3 decodeObjectOfClass:objc_opt_class() forKey:@"identifier"];
  v4 = [v3 decodeObjectOfClass:objc_opt_class() forKey:@"startDate"];
  id v5 = [v3 decodeObjectOfClass:objc_opt_class() forKey:@"endDate"];
  uint64_t v16 = [v3 decodeIntegerForKey:@"mechanism"];
  uint64_t v6 = [v3 decodeIntegerForKey:@"direction"];
  uint64_t v7 = [v3 decodeObjectOfClass:objc_opt_class() forKey:@"bundleId"];
  uint64_t v8 = [v3 decodeObjectOfClass:objc_opt_class() forKey:@"groupName"];
  v9 = [v3 decodeObjectOfClass:objc_opt_class() forKey:@"sender"];
  v10 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v11 = objc_opt_class();
  v12 = objc_msgSend(v10, "setWithObjects:", v11, objc_opt_class(), 0);
  v13 = [v3 decodeObjectOfClasses:v12 forKey:@"recipients"];

  v14 = [(MOInteraction *)self initWithIdentifier:v17 startDate:v4 endDate:v5 mechanism:v16 direction:v6 bundleId:v7 groupName:v8 sender:v9 recipients:v13];
  return v14;
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
  _os_log_error_impl(&dword_1D24AE000, log, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: identifier", v1, 2u);
}

@end