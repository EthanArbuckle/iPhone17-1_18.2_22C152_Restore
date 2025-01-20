@interface PKChangeHistoryEvent
- (BOOL)isEqual:(id)a3;
- (BOOL)representsCatalogUpdate;
- (BOOL)representsPassAddition;
- (BOOL)representsPassRemoval;
- (BOOL)representsPassUpdate;
- (NSDate)timestamp;
- (NSString)identifier;
- (NSString)recordUniqueID;
- (PKChangeHistoryEvent)init;
- (PKChangeHistoryEvent)initWithType:(int64_t)a3 recordType:(int64_t)a4 recordUniqueID:(id)a5 timestamp:(id)a6;
- (id)description;
- (int64_t)recordType;
- (int64_t)type;
- (unint64_t)hash;
- (void)setIdentifier:(id)a3;
- (void)setRecordType:(int64_t)a3;
- (void)setRecordUniqueID:(id)a3;
- (void)setTimestamp:(id)a3;
- (void)setType:(int64_t)a3;
@end

@implementation PKChangeHistoryEvent

- (PKChangeHistoryEvent)init
{
  v7.receiver = self;
  v7.super_class = (Class)PKChangeHistoryEvent;
  v2 = [(PKChangeHistoryEvent *)&v7 init];
  if (v2)
  {
    v3 = [MEMORY[0x1E4F29128] UUID];
    uint64_t v4 = [v3 UUIDString];
    identifier = v2->_identifier;
    v2->_identifier = (NSString *)v4;
  }
  return v2;
}

- (PKChangeHistoryEvent)initWithType:(int64_t)a3 recordType:(int64_t)a4 recordUniqueID:(id)a5 timestamp:(id)a6
{
  id v11 = a5;
  id v12 = a6;
  v18.receiver = self;
  v18.super_class = (Class)PKChangeHistoryEvent;
  v13 = [(PKChangeHistoryEvent *)&v18 init];
  if (v13)
  {
    v14 = [MEMORY[0x1E4F29128] UUID];
    uint64_t v15 = [v14 UUIDString];
    identifier = v13->_identifier;
    v13->_identifier = (NSString *)v15;

    v13->_type = a3;
    v13->_recordType = a4;
    objc_storeStrong((id *)&v13->_recordUniqueID, a5);
    objc_storeStrong((id *)&v13->_timestamp, a6);
  }

  return v13;
}

- (BOOL)isEqual:(id)a3
{
  uint64_t v4 = (PKChangeHistoryEvent *)a3;
  v5 = v4;
  if (self == v4)
  {
    char v12 = 1;
  }
  else
  {
    if (v4)
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        v6 = v5;
        identifier = v6->_identifier;
        v8 = self->_identifier;
        v9 = identifier;
        if (v8 == v9)
        {
        }
        else
        {
          v10 = v9;
          if (!v8 || !v9) {
            goto LABEL_19;
          }
          BOOL v11 = [(NSString *)v8 isEqualToString:v9];

          if (!v11) {
            goto LABEL_20;
          }
        }
        if (self->_type != v6->_type || self->_recordType != v6->_recordType) {
          goto LABEL_20;
        }
        recordUniqueID = v6->_recordUniqueID;
        v8 = self->_recordUniqueID;
        v14 = recordUniqueID;
        if (v8 == v14)
        {

LABEL_24:
          timestamp = self->_timestamp;
          objc_super v18 = v6->_timestamp;
          if (timestamp && v18) {
            char v12 = -[NSDate isEqual:](timestamp, "isEqual:");
          }
          else {
            char v12 = timestamp == v18;
          }
          goto LABEL_21;
        }
        v10 = v14;
        if (v8 && v14)
        {
          BOOL v15 = [(NSString *)v8 isEqualToString:v14];

          if (v15) {
            goto LABEL_24;
          }
LABEL_20:
          char v12 = 0;
LABEL_21:

          goto LABEL_22;
        }
LABEL_19:

        goto LABEL_20;
      }
    }
    char v12 = 0;
  }
LABEL_22:

  return v12;
}

- (unint64_t)hash
{
  v7[3] = *MEMORY[0x1E4F143B8];
  recordUniqueID = self->_recordUniqueID;
  uint64_t v3 = self->_recordType - self->_type + 32 * self->_type + 16337;
  v7[0] = self->_identifier;
  v7[1] = recordUniqueID;
  v7[2] = self->_timestamp;
  uint64_t v4 = [MEMORY[0x1E4F1C978] arrayWithObjects:v7 count:3];
  unint64_t v5 = PKCombinedHash(v3, v4);

  return v5;
}

- (id)description
{
  unint64_t type = self->_type;
  if (type > 2) {
    uint64_t v3 = @"unknown-event-type";
  }
  else {
    uint64_t v3 = off_1E56F2F50[type];
  }
  uint64_t v4 = @"unknown-record-type";
  int64_t recordType = self->_recordType;
  if (recordType == 1) {
    uint64_t v4 = @"PKChangedRecordTypeCatalog";
  }
  if (!recordType) {
    uint64_t v4 = @"PKChangedRecordTypePass";
  }
  return (id)[NSString stringWithFormat:@"identifier: %@, type: %@, recordType: %@, recordUniqueID: %@, timestamp: %@", self->_identifier, v3, v4, self->_recordUniqueID, self->_timestamp];
}

- (BOOL)representsPassAddition
{
  return !self->_recordType && self->_type == 0;
}

- (BOOL)representsPassUpdate
{
  return !self->_recordType && self->_type == 1;
}

- (BOOL)representsPassRemoval
{
  return !self->_recordType && self->_type == 2;
}

- (BOOL)representsCatalogUpdate
{
  return self->_recordType == 1 && self->_type == 1;
}

- (NSString)identifier
{
  return self->_identifier;
}

- (void)setIdentifier:(id)a3
{
}

- (int64_t)type
{
  return self->_type;
}

- (void)setType:(int64_t)a3
{
  self->_unint64_t type = a3;
}

- (int64_t)recordType
{
  return self->_recordType;
}

- (void)setRecordType:(int64_t)a3
{
  self->_int64_t recordType = a3;
}

- (NSString)recordUniqueID
{
  return self->_recordUniqueID;
}

- (void)setRecordUniqueID:(id)a3
{
}

- (NSDate)timestamp
{
  return self->_timestamp;
}

- (void)setTimestamp:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_timestamp, 0);
  objc_storeStrong((id *)&self->_recordUniqueID, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
}

@end