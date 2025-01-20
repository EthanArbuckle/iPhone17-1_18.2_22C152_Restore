@interface MOAction
+ (BOOL)supportsSecureCoding;
+ (id)actionNameFromLifeEvent:(id)a3;
+ (unint64_t)actionTypeFromLifeEvent:(id)a3;
- (BOOL)isEqual:(id)a3;
- (MOAction)initWithActionName:(id)a3 actionType:(unint64_t)a4;
- (MOAction)initWithActionName:(id)a3 actionType:(unint64_t)a4 actionSubtype:(int64_t)a5;
- (MOAction)initWithActionName:(id)a3 actionType:(unint64_t)a4 actionSubtype:(int64_t)a5 actionMetaData:(id)a6;
- (MOAction)initWithActionName:(id)a3 actionType:(unint64_t)a4 actionSubtype:(int64_t)a5 actionNameConfidence:(double)a6;
- (MOAction)initWithCoder:(id)a3;
- (MOAction)initWithIdentifier:(id)a3;
- (MOAction)initWithIdentifier:(id)a3 actionName:(id)a4 actionType:(unint64_t)a5 actionSubtype:(int64_t)a6 actionNameConfidence:(double)a7 actionMetaData:(id)a8;
- (MOAction)initWithLifeEvent:(id)a3;
- (NSDictionary)actionMetaData;
- (NSString)actionName;
- (NSUUID)identifier;
- (NSUUID)sourceEventIdentifier;
- (double)actionNameConfidence;
- (id)bundleSourceType;
- (id)description;
- (int64_t)actionSubtype;
- (int64_t)sourceEventAccessType;
- (unint64_t)accessTypeFromActionType:(unint64_t)a3 actionSubtype:(int64_t)a4;
- (unint64_t)actionType;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
- (void)setActionMetaData:(id)a3;
- (void)setSourceEventAccessType:(int64_t)a3;
- (void)setSourceEventIdentifier:(id)a3;
@end

@implementation MOAction

+ (id)actionNameFromLifeEvent:(id)a3
{
  uint64_t v3 = [a3 lifeEventCategory];
  switch(v3)
  {
    case 1:
      v4 = kActionNameShopping;
      goto LABEL_7;
    case 4:
      v4 = kActionNameFlight;
      goto LABEL_7;
    case 2:
      v4 = kActionNameDining;
LABEL_7:
      v5 = *v4;
      goto LABEL_9;
  }
  v5 = 0;
LABEL_9:
  return v5;
}

+ (unint64_t)actionTypeFromLifeEvent:(id)a3
{
  uint64_t v3 = [a3 lifeEventCategory];
  if ((unint64_t)(v3 - 1) > 3) {
    return 0;
  }
  else {
    return qword_1D250EED0[v3 - 1];
  }
}

- (MOAction)initWithLifeEvent:(id)a3
{
  id v4 = a3;
  if ([v4 category] == 22)
  {
    v5 = +[MOAction actionNameFromLifeEvent:v4];
    unint64_t v6 = +[MOAction actionTypeFromLifeEvent:v4];
    if (v5) {
      BOOL v7 = v6 == 0;
    }
    else {
      BOOL v7 = 1;
    }
    if (v7)
    {
      v10 = 0;
    }
    else
    {
      unint64_t v8 = v6;
      v9 = [MEMORY[0x1E4F29128] UUID];
      [v4 confidenceScore];
      self = -[MOAction initWithIdentifier:actionName:actionType:actionSubtype:actionNameConfidence:actionMetaData:](self, "initWithIdentifier:actionName:actionType:actionSubtype:actionNameConfidence:actionMetaData:", v9, v5, v8, 0, 0);

      v10 = self;
    }
  }
  else
  {
    v10 = 0;
  }

  return v10;
}

- (id)bundleSourceType
{
  unint64_t v3 = [(MOAction *)self actionType];
  id v4 = 0;
  unint64_t v5 = v3 - 1;
  unint64_t v6 = &MOEventBundleSourceTypeVisitLocation;
  switch(v5)
  {
    case 0uLL:
      int64_t v8 = [(MOAction *)self actionSubtype];
      if ((unint64_t)(v8 - 4) >= 6) {
        unint64_t v6 = &MOEventBundleSourceTypeVisitLocation;
      }
      else {
        unint64_t v6 = off_1E691F100[v8 - 4];
      }
      goto LABEL_2;
    case 1uLL:
    case 2uLL:
    case 8uLL:
    case 9uLL:
    case 0xAuLL:
      goto LABEL_2;
    case 3uLL:
      unint64_t v6 = &MOEventBundleSourceTypeActivity;
      goto LABEL_2;
    case 4uLL:
      unint64_t v6 = &MOEventBundleSourceTypeContact;
      goto LABEL_2;
    case 5uLL:
      unint64_t v6 = &MOEventBundleSourceTypeMedia;
      goto LABEL_2;
    case 6uLL:
      unint64_t v6 = &MOEventBundleSourceTypePhoto;
      goto LABEL_2;
    case 0xBuLL:
      unint64_t v6 = &MOEventBundleSourceTypeStateOfMind;
LABEL_2:
      id v4 = *v6;
      break;
    default:
      break;
  }
  return v4;
}

- (MOAction)initWithIdentifier:(id)a3
{
  id v5 = a3;
  if (!v5)
  {
    unint64_t v6 = _mo_log_facility_get_os_log(MOLogFacilityGeneral);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      -[MOAction initWithIdentifier:](v6);
    }

    BOOL v7 = [MEMORY[0x1E4F28B00] currentHandler];
    objc_msgSend(v7, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"MOAction.m", 30, @"Invalid parameter not satisfying: identifier (in %s:%d)", "-[MOAction initWithIdentifier:]", 30);
  }
  int64_t v8 = [(MOAction *)self initWithIdentifier:v5 actionName:@"action" actionType:0 actionSubtype:0 actionNameConfidence:0 actionMetaData:-1.0];

  return v8;
}

- (MOAction)initWithActionName:(id)a3 actionType:(unint64_t)a4
{
  unint64_t v6 = (void *)MEMORY[0x1E4F29128];
  id v7 = a3;
  int64_t v8 = [v6 UUID];
  v9 = [(MOAction *)self initWithIdentifier:v8 actionName:v7 actionType:a4 actionSubtype:0 actionNameConfidence:0 actionMetaData:-1.0];

  return v9;
}

- (MOAction)initWithActionName:(id)a3 actionType:(unint64_t)a4 actionSubtype:(int64_t)a5
{
  int64_t v8 = (void *)MEMORY[0x1E4F29128];
  id v9 = a3;
  v10 = [v8 UUID];
  v11 = [(MOAction *)self initWithIdentifier:v10 actionName:v9 actionType:a4 actionSubtype:a5 actionNameConfidence:0 actionMetaData:-1.0];

  return v11;
}

- (MOAction)initWithActionName:(id)a3 actionType:(unint64_t)a4 actionSubtype:(int64_t)a5 actionNameConfidence:(double)a6
{
  v10 = (void *)MEMORY[0x1E4F29128];
  id v11 = a3;
  v12 = [v10 UUID];
  v13 = [(MOAction *)self initWithIdentifier:v12 actionName:v11 actionType:a4 actionSubtype:a5 actionNameConfidence:0 actionMetaData:a6];

  return v13;
}

- (MOAction)initWithActionName:(id)a3 actionType:(unint64_t)a4 actionSubtype:(int64_t)a5 actionMetaData:(id)a6
{
  v10 = (void *)MEMORY[0x1E4F29128];
  id v11 = a6;
  id v12 = a3;
  v13 = [v10 UUID];
  v14 = [(MOAction *)self initWithIdentifier:v13 actionName:v12 actionType:a4 actionSubtype:a5 actionNameConfidence:v11 actionMetaData:-1.0];

  return v14;
}

- (MOAction)initWithIdentifier:(id)a3 actionName:(id)a4 actionType:(unint64_t)a5 actionSubtype:(int64_t)a6 actionNameConfidence:(double)a7 actionMetaData:(id)a8
{
  id v14 = a4;
  id v15 = a8;
  v20.receiver = self;
  v20.super_class = (Class)MOAction;
  v16 = [(MOAction *)&v20 init];
  if (v16)
  {
    uint64_t v17 = [MEMORY[0x1E4F29128] UUID];
    identifier = v16->_identifier;
    v16->_identifier = (NSUUID *)v17;

    objc_storeStrong((id *)&v16->_actionName, a4);
    v16->_actionType = a5;
    v16->_actionSubtype = a6;
    v16->_actionNameConfidence = a7;
    objc_storeStrong((id *)&v16->_actionMetaData, a8);
    v16->_sourceEventAccessType = [(MOAction *)v16 accessTypeFromActionType:a5 actionSubtype:a6];
  }

  return v16;
}

- (id)description
{
  unint64_t v3 = NSString;
  id v4 = [(MOAction *)self identifier];
  id v5 = [(MOAction *)self actionName];
  unint64_t v6 = [v5 mask];
  unint64_t v7 = [(MOAction *)self actionType];
  int64_t v8 = [(MOAction *)self actionSubtype];
  [(MOAction *)self actionNameConfidence];
  v10 = [v3 stringWithFormat:@"<MOAction identifier, %@, action, %@, type, %lu, subtype, %lu, confidence, %f>", v4, v6, v7, v8, v9];

  return v10;
}

- (unint64_t)accessTypeFromActionType:(unint64_t)a3 actionSubtype:(int64_t)a4
{
  unint64_t result = 5;
  switch(a3)
  {
    case 1uLL:
      if (a4 == 6) {
        goto LABEL_3;
      }
      if ((unint64_t)(a4 - 3) < 2) {
        goto LABEL_6;
      }
      if ((unint64_t)a4 > 9 || ((1 << a4) & 0x302) == 0) {
        goto LABEL_10;
      }
      unint64_t result = 5;
      break;
    case 2uLL:
    case 3uLL:
    case 9uLL:
    case 0xAuLL:
    case 0xBuLL:
      return result;
    case 4uLL:
      unint64_t result = 1;
      break;
    case 5uLL:
LABEL_6:
      unint64_t result = 3;
      break;
    case 6uLL:
LABEL_3:
      unint64_t result = 2;
      break;
    default:
LABEL_10:
      unint64_t result = 0;
      break;
  }
  return result;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (MOAction)initWithCoder:(id)a3
{
  id v4 = a3;
  id v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"identifier"];
  unint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"actionName"];
  uint64_t v7 = [v4 decodeInt64ForKey:@"actionType"];
  uint64_t v8 = [v4 decodeInt64ForKey:@"actionSubtype"];
  [v4 decodeDoubleForKey:@"actionNameConfidence"];
  double v10 = v9;
  id v11 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"actionMetaData"];
  id v12 = +[MODictionaryEncoder decodeToDictionary:v11];
  v13 = [(MOAction *)self initWithIdentifier:v5 actionName:v6 actionType:v7 actionSubtype:v8 actionNameConfidence:v12 actionMetaData:v10];

  if (v13)
  {
    id v14 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"sourceEventIdentifier"];
    [(MOAction *)v13 setSourceEventIdentifier:v14];

    -[MOAction setSourceEventAccessType:](v13, "setSourceEventAccessType:", [v4 decodeInt64ForKey:@"sourceEventAccessType"]);
  }

  return v13;
}

- (void)encodeWithCoder:(id)a3
{
  identifier = self->_identifier;
  id v6 = a3;
  [v6 encodeObject:identifier forKey:@"identifier"];
  [v6 encodeInt64:self->_actionType forKey:@"actionType"];
  [v6 encodeInt64:self->_actionSubtype forKey:@"actionSubtype"];
  [v6 encodeObject:self->_actionName forKey:@"actionName"];
  [v6 encodeDouble:@"actionNameConfidence" forKey:self->_actionNameConfidence];
  id v5 = +[MODictionaryEncoder encodeDictionary:self->_actionMetaData];
  [v6 encodeObject:v5 forKey:@"actionMetaData"];

  [v6 encodeInt64:self->_sourceEventAccessType forKey:@"sourceEventAccessType"];
  [v6 encodeObject:self->_sourceEventIdentifier forKey:@"sourceEventIdentifier"];
}

- (unint64_t)hash
{
  v2 = [(MOAction *)self identifier];
  unint64_t v3 = [v2 hash];

  return v3;
}

- (BOOL)isEqual:(id)a3
{
  id v5 = (MOAction *)a3;
  id v6 = v5;
  if (self == v5)
  {
    char v11 = 1;
  }
  else
  {
    if (v5)
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        uint64_t v7 = v6;
        uint64_t v8 = [(MOAction *)self identifier];
        if (v8 || ([(MOAction *)v7 identifier], (unint64_t v3 = objc_claimAutoreleasedReturnValue()) != 0))
        {
          double v9 = [(MOAction *)self identifier];
          double v10 = [(MOAction *)v7 identifier];
          char v11 = [v9 isEqual:v10];

          if (v8)
          {
LABEL_12:

            goto LABEL_13;
          }
        }
        else
        {
          char v11 = 1;
        }

        goto LABEL_12;
      }
    }
    char v11 = 0;
  }
LABEL_13:

  return v11;
}

- (NSUUID)identifier
{
  return self->_identifier;
}

- (unint64_t)actionType
{
  return self->_actionType;
}

- (int64_t)actionSubtype
{
  return self->_actionSubtype;
}

- (NSString)actionName
{
  return self->_actionName;
}

- (double)actionNameConfidence
{
  return self->_actionNameConfidence;
}

- (NSDictionary)actionMetaData
{
  return self->_actionMetaData;
}

- (void)setActionMetaData:(id)a3
{
}

- (int64_t)sourceEventAccessType
{
  return self->_sourceEventAccessType;
}

- (void)setSourceEventAccessType:(int64_t)a3
{
  self->_sourceEventAccessType = a3;
}

- (NSUUID)sourceEventIdentifier
{
  return self->_sourceEventIdentifier;
}

- (void)setSourceEventIdentifier:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sourceEventIdentifier, 0);
  objc_storeStrong((id *)&self->_actionMetaData, 0);
  objc_storeStrong((id *)&self->_actionName, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
}

- (void)initWithIdentifier:(os_log_t)log .cold.1(os_log_t log)
{
  uint64_t v5 = *MEMORY[0x1E4F143B8];
  int v1 = 136315394;
  v2 = "-[MOAction initWithIdentifier:]";
  __int16 v3 = 1024;
  int v4 = 30;
  _os_log_error_impl(&dword_1D24AE000, log, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: identifier (in %s:%d)", (uint8_t *)&v1, 0x12u);
}

@end